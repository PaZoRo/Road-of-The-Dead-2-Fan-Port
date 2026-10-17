extends "res://tests/road_renderer_suite.gd"

func capture(mc:R.Value,host:Node) -> Image:
	var image:Image=Image.create(1200,800,false,Image.FORMAT_RGBA8);image.fill(Color.BLACK)
	expect(R.snapshot_script.capture(host,image,mc.display),"road GPU capture")
	return image

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	R.snapshot_script=load("res://runtime/native_snapshot.gd")
	var game:R.Value=R.construct(R.klass("BasicGame"),[R.construct(R.klass("MovieClip"),[])]);R.call_member(game,"Init",[]);game.fields.m_GameSFXSoundGroup=null;R.statics.RDGame={"Instance":game}
	game.fields.m_Viewport.fields={"m_iWidth":1200,"m_iHeight":800,"m_iHalfWidth":600,"m_iHalfHeight":400}
	var road:R.Value=R.construct(R.klass("RDRoad"),[]);var camera:R.Value=R.construct(R.klass("RDCamera"),[]);var settings:Dictionary=R.statics.RDRoad
	R.ensure_statics("RDWorld");var world:Dictionary=R.statics.RDWorld;world.m_bCurvyRoads=true;world.m_iPerlinTrackPosition=0;world.m_PerlinXTrack=[];world.m_PerlinYTrack=[]
	for i in 1000:world.m_PerlinXTrack.append(sin(i*0.02)*2);world.m_PerlinYTrack.append(cos(i*0.013)*0.3)
	road.fields.m_MC=R.construct(R.klass("MovieClip"),[])
	var scene:R.Value=R.construct(R.klass("MovieClip"),[]);host.add_child(scene.display)
	R.add_child(scene,road.fields.m_MC)
	for i in range(int(settings.NbRenderSteps)+1):
		for group in ["m_RoadSliceGroundEntities","m_RoadSliceEntities"]:
			var slice:R.Value=R.Value.new();slice.class_id="RDRoadSlice";slice.fields={"m_MC":R.construct(R.klass("MovieClip"),[]),"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,i*settings.RenderStepSize]),"m_EntityNode":null};road.fields[group].append(slice)
			R.add_child(scene,slice.fields.m_MC)
	var total:int=0;var pixel_cases:int=0;var polygons:int=0
	for sample in 18:
		if sample==6:R.set_value(scene,"colorTransform",R.construct(R.klass("ColorTransform"),[0.8,0.9,0.5,0.7,10,0,0,0]))
		if sample==12:R.set_value(scene,"colorTransform",null)
		road.fields.m_iMode=settings.Mode_Pattern if sample>=12 else settings.Mode_Normal
		var z:float=[0.0,37.1,200.5][sample%3];camera.fields.m_vLocation.fields={"X":0.4,"Y":1.3,"Z":z}
		camera.fields.m_RotationMatrix.native=Transform3D(Basis.from_euler(Vector3(0.07,0.05,0.02)),Vector3.ZERO)
		camera.fields.m_fFogDistance=[-5.0,50.0,300.0][sample%3];camera.fields.m_fMaxViewDistance=200.0
		road.fields.m_iCurrentRoadSlice=int(floor(z/settings.RenderStepSize));road.fields.m_RoadSlices=[];road.fields.m_LavaRoadSlices=[]
		for i in range(int(settings.NbRenderSteps)+1):
			road.fields.m_RoadSlices.append([settings.SliceType_Town,settings.SliceType_Alleyway,settings.SliceType_Highway,settings.SliceType_Park,settings.SliceType_CrossingStreet,settings.SliceType_Snow][(i+sample)%6]);road.fields.m_LavaRoadSlices.append(sample%2==0)
		R.fast_road_render(road,[camera]);var expected:Dictionary=state(road)
		var batched:Image=capture(scene,host)
		var restores:Array=[]
		for child:R.Value in scene.children:
			var display=child.display;restores.append(display.road_batch);display.road_batch=false
			for command in child.fields.get("@drawing",[]):
				if command[0]=="polygon":polygons+=1
		var reference:Image=capture(scene,host)
		var same:bool=batched.get_data()==reference.get_data()
		if not same:
			var a:PackedByteArray=batched.get_data();var b:PackedByteArray=reference.get_data();var worst:int=0
			for i in a.size():worst=maxi(worst,absi(a[i]-b[i]))
			expect(worst<=1,"indexed road GPU parity sample="+str(sample)+" max_delta="+str(worst))
		else:pixel_cases+=1
		for i in scene.children.size():scene.children[i].display.road_batch=restores[i]
		expect(state(road)==expected,"GPU submission leaves all source road state intact sample="+str(sample));total+=1
		if sample==8:
			for arg in OS.get_cmdline_user_args():
				if arg.begins_with("--capture="):batched.save_png(arg.trim_prefix("--capture="))
		await process_frame
	var probe:R.Value=scene.children[1]
	R.graphics_call(probe,"clear",[]);expect(not probe.display.road_batch and probe.display.road_indices.is_empty(),"generic graphics clear invalidates mesh")
	R.graphics_call(probe,"beginFill",[0xffffff]);R.graphics_call(probe,"drawRect",[10,10,20,20]);R.graphics_call(probe,"endFill",[])
	expect(probe.fields["@drawing"].size()==1 and not probe.display.road_batch,"generic drawing after native road keeps its own graphics")
	expect(polygons>100 and pixel_cases>0,"actual road geometry rendered and compared")
	expect(R.warnings.is_empty(),"no adapter warnings")
	print("TEST_ROAD_BATCH_COMPLETE cases="+str(total)+" exact_pixel_cases="+str(pixel_cases)+" polygons="+str(polygons)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
