extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]

func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)
static func f_true(_c:Variant,_a:Array) -> Variant:return true
static func f_false(_c:Variant,_a:Array) -> Variant:return false
static func f_name(_c:Variant,_a:Array) -> Variant:return "Test road"
static func f_distance(_c:Variant,_a:Array) -> Variant:return -63
static func f_suffix(_c:Variant,_a:Array) -> Variant:return "m"
static func f_speed(_c:Variant,_a:Array) -> Variant:return 0.5

func simple(type:String="Object") -> Variant:
	var value=R.Value.new();value.class_id=type;return value

func base_fields(mc:Variant,player:Variant) -> Dictionary:
	return {"m_MC":mc,"m_Player":player,"m_iSurvivalGuideItem":-1,"m_AttachedSounds":[],"m_bCanBeDestroyed":false,"m_fExplosionDelay":0.0,"m_bDestroyMe":false,"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,5])}

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
	var empty_clip=simple("RDRoadSlice")
	R.call_member(empty_clip,"Render",[null])
	expect(not R.scripts.has("RDRoadSlice"),"empty method keeps its unused source class unloaded")
	R.classes.RegressionMode={"path":"res://tests/runtime_regression_suite.gd","base":"RDGameMode","methods":{"CanShowHud":["f_true",false],"HasNextLevel":["f_true",false],"GetNextLevelName":["f_name",false],"GetNextLevelDistance":["f_distance",false],"GetNextLevelSuffix":["f_suffix",false],"IsChopperMode":["f_false",false]},"fields":{},"field_types":{},"imports":[]}
	R.classes.RegressionPlayer={"path":"res://tests/runtime_regression_suite.gd","base":"RDPlayer","methods":{"GetSpeedRatio":["f_speed",false]},"fields":{},"field_types":{},"imports":[]}
	R.classes.RegressionModeFalse={"path":"res://tests/runtime_regression_suite.gd","base":"RegressionMode","methods":{"CanShowHud":["f_false",false]},"fields":{},"field_types":{},"imports":[]}
	var changing=simple("RegressionMode")
	expect(R.call_member(changing,"CanShowHud",[])==true,"cached inherited dispatch returns original behavior")
	changing.class_id="RegressionModeFalse"
	expect(R.call_member(changing,"CanShowHud",[])==false,"class change invalidates cached method dispatch")
	var game=simple();var mode=simple("RegressionMode");var camera=simple("RDCamera")
	camera.fields={"m_fRelativeLocationX":0.0};mode.fields.m_Camera=camera;game.fields.m_CurrentGameMode=mode
	R.statics.RDGame={"Instance":game};R.statics.RDObstacleCar={"AmbientSoundDistance":30,"ExplodePlayerDistance":20}
	var player=simple("RegressionPlayer");player.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[0,0,0])
	var car_cases:int=0
	for editor in [false,true]:
		for engine in [false,true]:
			for hp in [0.0,10.0,30.0,80.0]:
				var mc=R.construct(R.klass("MovieClip"),[])
				for name in ["Fire","Smoke"]:mc.fields[name]=R.construct(R.klass("MovieClip"),[])
				if engine:mc.fields.Engine=R.construct(R.klass("MovieClip"),[])
				var car=simple("RDObstacleCar");car.fields=base_fields(mc,player)
				car.fields.merge({"m_fEngineHP":hp,"m_fHP":hp,"m_fMaxHP":120.0,"m_bEditorMode":editor,"m_bShowEditorRandomIcon":false,"m_bPlayAmbientSound":false,"m_AmbientSound":null,"m_bWaitForPlayerToExplode":true,"m_bCanExplode":true,"m_iLastDamageTime":0,"m_fHPDegen":1.0})
				var initial:Dictionary=car.fields.duplicate();R.elapsed=2
				R.script_for("RDObstacleCar").call("f_Update",car,[1.0/30])
				var expected:Dictionary=car.fields.duplicate();var fire:bool=mc.fields.Fire.display.visible;var smoke:bool=mc.fields.Smoke.display.visible
				car.fields=initial;mc.fields.Fire.display.visible=true;mc.fields.Smoke.display.visible=true
				R.call_member(car,"Update",[1.0/30])
				for field in ["m_fHP","m_fEngineHP","m_bCanExplode","m_bWaitForPlayerToExplode"]:expect(car.fields[field]==expected[field],"car reference "+field+" case="+str(car_cases))
				expect(mc.fields.Fire.display.visible==fire and mc.fields.Smoke.display.visible==smoke,"car fire/smoke reference case="+str(car_cases));car_cases+=1
	var building=simple("RDBuildingNew");var visual=R.construct(R.klass("MovieClip"),[]);visual.timeline={"count":100}
	building.fields=base_fields(visual,player);building.fields.m_iFrame=0
	var building_cases:int=0
	for side in [false,true]:
		for x in [-50.0,-10.0,-0.01,0.0,0.01,5.0,10.0,20.0,50.0]:
			building.fields.m_bRight=side;building.fields.m_fRelativeLocationX=x;building.fields.m_iFrame=0
			R.script_for("RDBuildingNew").call("f_Update",building,[1.0/30]);var expected:int=building.fields.m_iFrame
			building.fields.m_iFrame=0;R.call_member(building,"Update",[1.0/30])
			expect(building.fields.m_iFrame==expected and visual.frame==expected,"building perspective case="+str(building_cases));building_cases+=1
	var hud=simple("RDHud");var panel=R.construct(R.klass("MovieClip"),[])
	for name in ["Location","LocationBG","LocationPointer","RPDisplay"]:panel.fields[name]=R.construct(R.klass("MovieClip" if name in ["LocationPointer","RPDisplay"] else "TextField"),[])
	panel.fields.RPDisplay.fields.RPDisplay=R.construct(R.klass("TextField"),[])
	var info=simple();info.fields.m_iRP=-63;game.fields.m_PlayerInfo=info
	hud.fields={"m_HudMC":panel,"m_Game":game,"m_Player":null,"m_bLocationPointerLeft":false}
	R.call_member(hud,"UpdateLocation",[])
	expect(panel.fields.Location.fields.text=="Test road: 0m","negative remaining distance displays zero")
	R.call_member(hud,"UpdateRPDisplay",[])
	expect(info.fields.m_iRP==0 and panel.fields.RPDisplay.fields.RPDisplay.fields.text==0,"negative RP is repaired")
	var container=R.construct(R.klass("MovieClip"),[]);container.display.modulate.a=0;container.display.visible=false
	var nested=R.construct(R.klass("MovieClip"),[]);nested.display.modulate.a=0.5;R.add_child(container,nested)
	var bitmap=R.construct(R.klass("Bitmap"),[]);bitmap.display.modulate.a=0.5
	var pixels:Image=Image.create(2,2,false,Image.FORMAT_RGBA8);pixels.fill(Color.RED);bitmap.display.texture=ImageTexture.create_from_image(pixels);R.add_child(nested,bitmap)
	var data=R.construct(R.klass("BitmapData"),[2,2,true,0]);R.bitmap_call(data,"draw",[container])
	expect(absf(data.native.get_pixel(0,0).a-0.25)<0.01,"bitmap cache ignores root fade and multiplies child opacity once")
	var shape_ids:Array=[]
	for id in R.assets.definitions:
		if R.assets.definitions[id].get("type")=="shape" and not R.symbol_classes.has(id):shape_ids.append(id)
		if shape_ids.size()==2:break
	var animation=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,animation)
	animation.timeline={"count":2,"frames":[[{"d":1,"id":int(shape_ids[0])}],[{"d":1,"id":int(shape_ids[1])}]]};animation.display.visible=false;R.apply_frame(animation,1)
	R.advance_clip(animation);expect(animation.visual_deferred and animation.frame==2,"hidden pure animation advances without rebuilding artwork")
	animation.display.visible=true;R.sync_visible_clips()
	expect(not animation.visual_deferred and animation.depths[1].symbol==shape_ids[1],"hidden animation resumes at the right artwork frame")
	var retained=animation.depths[1];animation.display.visible=false;R.advance_clip(animation)
	expect(not animation.visual_deferred and retained.parent_value()==null,"retained shape identity prevents hidden animation deferral")
	print("TEST_RUNTIME_REGRESSION_COMPLETE car_cases="+str(car_cases)+" building_cases="+str(building_cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();quit(0 if failures.is_empty() else 1)
