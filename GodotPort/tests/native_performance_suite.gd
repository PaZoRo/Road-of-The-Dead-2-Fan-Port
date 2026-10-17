extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]

func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func _initialize() -> void:call_deferred("run")

func points(road:Variant) -> PackedFloat64Array:
	var result:PackedFloat64Array=[]
	for name in ["m_Rendered3DVectors","m_Rendered2DVectors"]:
		for layer in road.fields[name]:
			for row in layer:
				for point in row:
					result.append(point.fields.X);result.append(point.fields.Y)
					if name=="m_Rendered3DVectors":result.append(point.fields.Z)
	return result

func road_drawing(road:Variant) -> Array:
	var drawing:Array=[]
	for group in ["m_RoadSliceEntities","m_RoadSliceGroundEntities"]:
		for slice in road.fields[group]:drawing.append(slice.fields.m_MC.fields.get("@drawing",[]).duplicate(true))
	return drawing

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
	var atlas_cases:int=0
	var sound_cases:int=0
	var master=R.construct(R.klass("DTSoundGroup"),[]);var child_group=R.construct(R.klass("DTSoundGroup"),[master]);var sound=R.construct(R.klass("DTSound"),[null,child_group])
	for gain in [0.0,0.3,1.0]:
		for pan in [-2.0,-0.5,0.0,0.5,2.0]:
			master.fields.m_fVolume=gain;master.fields.m_fMaxVolume=0.85;master.fields.m_fMixVolume=0.6;master.fields.m_fPan=pan;child_group.fields.m_fPan=-0.6
			for pair in [["DTSoundGroup",master],["DTSoundGroup",child_group],["DTSound",sound]]:
				for method in ["GetVolume","GetPan"]:expect(is_equal_approx(R.num(R.call_member(pair[1],method,[])),R.num(R.source_method(pair[1],pair[0],method,[]))),"native audio hierarchy "+method)
			sound_cases+=1
	for path in R.texture_atlas.keys().slice(0,16):
		var texture:Texture2D=R.get_texture(path);var image:Image=R.texture_image(texture);var original:Image=Image.load_from_file(path);original.convert(Image.FORMAT_RGBA8)
		expect(texture is AtlasTexture,"small original artwork uses shared atlas")
		var packed:Image=R.texture_image(texture.atlas).get_region(Rect2i(texture.region));packed.convert(Image.FORMAT_RGBA8)
		expect(packed.get_size()==original.get_size() and packed.get_data()==original.get_data(),"source atlas pixels preserve "+path)
		expect(image.get_size()==original.get_size() and image.get_data()==original.get_data(),"CPU pixel operations preserve "+path)
		var standalone:Texture2D=R.standalone_texture(texture)
		expect(not standalone is AtlasTexture and standalone.get_image().get_data()==original.get_data(),"glow sampler receives original image coordinates")
		atlas_cases+=1
	var clip=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,clip)
	var game=R.construct(R.klass("BasicGame"),[clip]);R.call_member(game,"Init",[])
	game.fields.m_GameSFXSoundGroup=null;R.statics.RDGame={"Instance":game}
	var road=R.construct(R.klass("RDRoad"),[]);var camera=R.construct(R.klass("RDCamera"),[])
	R.ensure_statics("RDWorld")
	var world:Dictionary=R.statics.RDWorld;world.m_bCurvyRoads=true;world.m_iPerlinTrackPosition=0
	world.m_PerlinXTrack=[];world.m_PerlinYTrack=[]
	for i in range(1000):world.m_PerlinXTrack.append(sin(i*0.02)*2);world.m_PerlinYTrack.append(cos(i*0.013)*0.3)
	var settings:Dictionary=R.statics.RDRoad
	var types:Array=[]
	for key in settings:
		if key.begins_with("SliceType_"):types.append(settings[key])
	var cases:int=0
	for mode in [settings.Mode_Normal,settings.Mode_Pattern]:
		road.fields.m_iMode=mode
		for z in [-2.0,0.0,37.1,200.5]:
			camera.fields.m_vLocation.fields.Z=z;camera.fields.m_vLocation.fields.X=0.4;camera.fields.m_vLocation.fields.Y=1.3
			camera.fields.m_RotationMatrix.native=Transform3D(Basis.from_euler(Vector3(0.07,0.05,0.02)),Vector3.ZERO)
			for offset in range(types.size()):
				road.fields.m_RoadSlices=[]
				for i in range(int(settings.NbRenderSteps)+1):road.fields.m_RoadSlices.append(types[(i+offset)%types.size()])
				R.call_member(road,"PrecomputePositions",[camera]);var native:PackedFloat64Array=points(road)
				R.script_for("RDRoad").call("f_PrecomputePositions",road,[camera]);var reference:PackedFloat64Array=points(road)
				var same:bool=native.size()==reference.size()
				for i in range(native.size()):
					if not is_equal_approx(native[i],reference[i]) and not (is_nan(native[i]) and is_nan(reference[i])):same=false;break
				expect(same,"road projection mode="+str(mode)+" z="+str(z)+" offset="+str(offset));cases+=1
	road.fields.m_MC=R.construct(R.klass("MovieClip"),[])
	road.fields.m_RoadSliceEntities=[];road.fields.m_RoadSliceGroundEntities=[]
	for i in range(int(settings.NbRenderSteps)+1):
		for group in ["m_RoadSliceEntities","m_RoadSliceGroundEntities"]:
			var slice=R.Value.new();slice.fields.m_MC=R.construct(R.klass("MovieClip"),[]);road.fields[group].append(slice)
	road.fields.m_iMode=settings.Mode_Pattern;camera.fields.m_vLocation.fields.Z=0
	var render_cases:int=0
	for lava in [false,true]:
		for type in types:
			road.fields.m_RoadSlices=[type,type,settings.SliceType_Highway,settings.SliceType_Town,type]
			road.fields.m_LavaRoadSlices=[lava,lava,lava,lava,lava]
			R.script_for("RDRoad").call("f_Render",road,[camera]);var expected:Array=road_drawing(road)
			R.call_member(road,"Render",[camera])
			expect(road_drawing(road)==expected,"native road surfaces type="+str(type)+" lava="+str(lava));render_cases+=1
	R.ensure_statics("RDPlayer");R.ensure_statics("RDEntity")
	game.fields.m_bPlayFromEditor=false;game.fields.m_bIsFemale=false
	var info=R.Value.new();info.fields={"m_fTotalDistance":0.0,"m_fDianeDistance":0.0,"m_fCochetaDistance":0.0};R.statics.RDPlayerInfo={"Instance":info}
	var level=R.Value.new();level.class_id="RDGameModeGameplay";level.fields.m_Road=road;road.fields.m_RoadSlices=[]
	var space=R.Value.new();space.class_id="RDWorld";space.fields.m_FirstEntity=null
	var physics_cases:int=0
	for fail_type in [-1,0,1,2,3]:
		for chopper in [false,true]:
			for delta in [1.0/30,1.0/60,1.0/120]:
				var player=R.Value.new();player.class_id="RDPlayer"
				player.fields={"m_iFailType":fail_type,"m_bChopperMode":chopper,"m_GameModeGameplay":level,"m_fRelativeLocationX":0.25,"m_vLocation":R.construct(R.klass("DTVector3D"),[0.25,0.0,50.0]),"m_vVelocity":R.construct(R.klass("DTVector3D"),[0.5,0.1,12.0]),"m_World":space,"m_iCollisionGroup":R.statics.RDEntity.CollisionGroup_None,"m_EntityNode":null,"m_AttachedEntities":[]}
				var initial_info:Dictionary=info.fields.duplicate();var initial_point:Dictionary=player.fields.m_vLocation.fields.duplicate()
				R.script_for("RDPlayer").call("f_UpdateMovement",player,[delta])
				var expected_point:Dictionary=player.fields.m_vLocation.fields.duplicate();var expected_info:Dictionary=info.fields.duplicate();var expected_x:float=player.fields.m_fRelativeLocationX
				player.fields.m_vLocation.fields=initial_point;player.fields.m_fRelativeLocationX=0.25;info.fields=initial_info
				R.call_member(player,"UpdateMovement",[delta])
				for axis in ["X","Y","Z"]:expect(is_equal_approx(player.fields.m_vLocation.fields[axis],expected_point[axis]),"vehicle "+axis+" fail="+str(fail_type)+" chopper="+str(chopper)+" delta="+str(delta))
				expect(is_equal_approx(player.fields.m_fRelativeLocationX,expected_x),"relative steering position")
				for name in expected_info:expect(is_equal_approx(info.fields[name],expected_info[name]),"distance statistic "+name)
				physics_cases+=1
	var parent=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,parent)
	var render_world=R.Value.new();render_world.class_id="RDWorld";render_world.fields.m_Entities=[]
	var entity_cases:int=0
	for z in [-5.0,1.0,1.1,25.0,90.0,180.0,400.0]:
		for curved in [false,true]:
			for flipped in [false,true]:
				var entity=R.construct(R.klass("RDEntity"),[R.klass("MovieClip")]);R.add_child(parent,entity.fields.m_MainMC)
				entity.fields.m_vLocation.fields={"X":2.5,"Y":0.3,"Z":z};entity.fields.m_fHeight=2.3;entity.fields.m_bUseCurvyCamera=curved;entity.fields.m_bFlippedX=flipped
				camera.fields.m_vLocation.fields={"X":0.2,"Y":1.1,"Z":0.0}
				R.script_for("RDEntity").call("f_Render",entity,[camera]);var expected_transform:Transform2D=entity.fields.m_MainMC.display.transform;var expected_visible:bool=entity.fields.m_MainMC.display.visible;var expected_alpha:float=entity.fields.m_MainMC.display.modulate.a
				var entry=R.Value.new();entry.fields.m_Entity=entity;render_world.fields.m_Entities=[entry]
				R.call_member(render_world,"Render",[camera])
				expect(entity.fields.m_MainMC.display.visible==expected_visible,"bulk projection visibility")
				if expected_visible:expect(entity.fields.m_MainMC.display.transform.is_equal_approx(expected_transform) and is_equal_approx(entity.fields.m_MainMC.display.modulate.a,expected_alpha),"bulk projection transform z="+str(z)+" curve="+str(curved)+" flip="+str(flipped))
				entity_cases+=1
	var boundary_cases:int=0
	var near_entity=R.construct(R.klass("RDEntity"),[R.klass("MovieClip")]);R.add_child(parent,near_entity.fields.m_MainMC)
	var near_entry=R.Value.new();near_entry.fields.m_Entity=near_entity;render_world.fields.m_Entities=[near_entry]
	for camera_z in [0.1,37.1,194.818659896476,10000.123456789]:
		for player in [false,true]:
			for separation in [0.999999,1.0,1.000001,90.0,180.0,400.0]:
				camera.fields.m_vLocation.fields={"X":0.2,"Y":1.1,"Z":camera_z}
				near_entity.fields.m_vLocation.fields={"X":2.5,"Y":0.3,"Z":camera_z+separation};near_entity.fields.m_bIsPlayer=player;near_entity.fields.m_fHeight=2.3
				R.source_method(near_entity,"RDEntity","Render",[camera])
				var expected_visible:bool=near_entity.fields.m_MainMC.display.visible
				var expected_transform:Transform2D=near_entity.fields.m_MainMC.display.transform;var expected_alpha:float=near_entity.fields.m_MainMC.display.modulate.a
				R.call_member(render_world,"Render",[camera])
				expect(near_entity.fields.m_MainMC.display.visible==expected_visible,"double-precision view boundary camera="+str(camera_z)+" separation="+str(separation)+" player="+str(player))
				if expected_visible:expect(near_entity.fields.m_MainMC.display.transform.is_equal_approx(expected_transform) and is_equal_approx(near_entity.fields.m_MainMC.display.modulate.a,expected_alpha),"view boundary projection")
				boundary_cases+=1
	var shape_ids:Array=[]
	for id in R.assets.definitions:
		if R.assets.definitions[id].get("type")=="shape" and not R.symbol_classes.has(id):shape_ids.append(id)
		if shape_ids.size()==2:break
	var animation=R.construct(R.klass("MovieClip"),[]);animation.symbol="native-recycle-test"
	animation.timeline={"count":2,"frames":[[{"d":1,"id":int(shape_ids[0])}],[{"d":1,"id":int(shape_ids[1])}]]}
	R.apply_frame(animation,1);var first_id:int=animation.depths[1].get_instance_id()
	R.apply_frame(animation,2)
	expect(animation.depths[1].get_instance_id()==first_id,"unreferenced timeline geometry reused")
	var retained=animation.depths[1];R.apply_frame(animation,1)
	expect(animation.depths[1]!=retained and retained.symbol==shape_ids[1],"script-retained geometry keeps its original identity")
	var button=R.construct(R.klass("MovieClip"),[]);R.add_child(parent,button)
	expect(parent.mouse_target_count==0,"scenery excluded from pointer tree")
	R.set_value(button,"buttonMode",true);expect(parent.mouse_target_count==1,"button registration propagates")
	R.remove_child(parent,button);expect(parent.mouse_target_count==0,"button removal propagates")
	R.add_child(parent,button);expect(parent.mouse_target_count==1,"button reparent propagates")
	R.set_value(button,"buttonMode",false);expect(parent.mouse_target_count==0,"button deregistration propagates")
	var self_clip=R.construct(R.klass("MovieClip"),[]);R.add_child(parent,self_clip)
	var callback:Variant={"@method":"stop","owner":"","receiver":self_clip}
	R.display_call(self_clip,"addFrameScript",[0,callback]);R.invoke(self_clip.frame_scripts[1],[])
	expect(not self_clip.playing,"self-bound frame handler invocation")
	R.event_call(self_clip,"addEventListener",["click",callback]);R.event_call(self_clip,"addEventListener",["click",callback])
	expect(self_clip.listeners.click.size()==1,"self-bound listener identity")
	R.event_call(self_clip,"removeEventListener",["click",callback]);expect(self_clip.listeners.click.is_empty(),"self-bound listener removal")
	var self_node:WeakRef=weakref(self_clip.display);R.remove_child(parent,self_clip);self_clip=null;callback=null
	await process_frame;await process_frame
	expect(self_node.get_ref()==null,"self-bound frame handler does not leak its clip")
	var bitmap=R.construct(R.klass("Bitmap"),[])
	var pixels:Image=Image.create(16,12,false,Image.FORMAT_RGBA8)
	for y in range(12):
		for x in range(16):pixels.set_pixel(x,y,Color(float(x)/16,float(y)/12,0.7,float((x+y)%4)/3))
	bitmap.display.texture=ImageTexture.create_from_image(pixels)
	for transform in [Transform2D.IDENTITY,Transform2D(Vector2(2,0),Vector2(0,2),Vector2(3,4)),Transform2D(Vector2(-1,0),Vector2(0,1),Vector2(20,2)),Transform2D(Vector2(0.5,0),Vector2(0,0.5),Vector2(3,2)),Transform2D(Vector2(1,0),Vector2(0,1),Vector2(-3,-4))]:
		var native:Image=Image.create(40,40,false,Image.FORMAT_RGBA8);native.fill(Color(0.2,0.3,0.4,0.2));var reference:Image=native.duplicate()
		R.bitmap_fast_path=true;R.bitmap_draw_tree(native,bitmap,transform)
		R.bitmap_fast_path=false;R.bitmap_draw_tree(reference,bitmap,transform);R.bitmap_fast_path=true
		var bytes:PackedByteArray=native.get_data();var expected:PackedByteArray=reference.get_data();var delta:int=0
		for i in range(bytes.size()):delta=maxi(delta,absi(int(bytes[i])-int(expected[i])))
		expect(delta<=1,"native bitmap blend matches raster reference delta="+str(delta)+" transform="+str(transform))
	var transient=R.construct(R.klass("Shape"),[]);var node_ref:WeakRef=weakref(transient.display)
	R.add_child(parent,transient);R.remove_child(parent,transient);transient=null
	await process_frame;await process_frame
	expect(node_ref.get_ref()==null,"discarded display node freed automatically")
	print("TEST_NATIVE_PERFORMANCE_COMPLETE sound_cases="+str(sound_cases)+" road_cases="+str(cases)+" render_cases="+str(render_cases)+" boundary_cases="+str(boundary_cases)+" entity_cases="+str(entity_cases)+" physics_cases="+str(physics_cases)+" atlas_cases="+str(atlas_cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();quit(0 if failures.is_empty() else 1)
