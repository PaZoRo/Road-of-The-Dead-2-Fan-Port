extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
static func f_constructor(c:Variant,_a:Array) -> Variant:return c.fields.alternate

func _initialize() -> void:call_deferred("run")

func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func scalar(value:Variant) -> Variant:
	if value is float and not is_finite(value):return str(value)
	if value is R.Value:return {"class":value.class_id}
	if value is Array:
		var result:Array=[]
		for item in value:result.append(scalar(item))
		return result
	if value is Dictionary:
		var result:Dictionary={}
		for key in value:
			if str(key) not in ["@method","receiver"]:result[str(key)]=scalar(value[key])
		return result
	return value

func fields(value:R.Value) -> Dictionary:
	var result:Dictionary={"class":value.class_id}
	for key in value.fields:
		var item:Variant=value.fields[key]
		if item==null or item is bool or item is int or item is float or item is String:result[key]=scalar(item)
	for key in ["m_vLocation","m_vVelocity","m_CollisionBounds"]:
		if value.fields.get(key) is R.Value:result[key]=scalar(value.fields[key].fields)
	return result

func snapshot(mode:R.Value,pattern:R.Value,space:Variant) -> Dictionary:
	var game:R.Value=mode.fields.m_Game
	var world:R.Value=game.fields.m_World
	var entities:Array=[]
	for entry in world.fields.m_Entities:entities.append(fields(entry.fields.m_Entity))
	var road:R.Value=mode.fields.m_Road
	return {"space":scalar(space),"mode":fields(mode),"world":fields(world),"entities":entities,"slices":scalar(road.fields.m_RoadSlices),"lava":scalar(road.fields.m_LavaRoadSlices),"perlin_x":scalar(R.statics.RDWorld.m_PerlinXTrack),"perlin_y":scalar(R.statics.RDWorld.m_PerlinYTrack),"spawn":scalar(pattern.fields.m_SpawnInfo.fields),"next_random":randf()}

func run() -> void:
	seed(943012)
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene)
	scene.set_process(false);scene.set_physics_process(false)
	var reference:bool=OS.get_cmdline_user_args().has("--reference-patterns")
	if reference:R.hotpath_keys.erase("RDLevelPatternCustomNew");R.resolved_methods.erase("RDLevelPatternCustomNew")
	var game:R.Value=R.root.fields.m_Game
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
	var predicate_cases:int=0
	var markers:Array=[]
	for name in R.classes:
		if name.begins_with("MC_LevelObject_") or name.begins_with("MC_LevelGround_"):markers.append(name)
	markers.sort()
	var output:Array=[]
	var constructor_child:R.Value=R.construct(R.klass(markers[0]),[])
	for alternate in [null,R.klass(markers[1]),R.klass(markers[0]),17,"constructor"]:
		constructor_child.fields.constructor=alternate
		for target in [markers[0],markers[1]]:expect(R.constructor_is(constructor_child,target)==R.equal(R.get_value(constructor_child,"constructor"),R.klass(target)),"mutable constructor field "+target)
	constructor_child.fields.erase("constructor");constructor_child.class_id=markers[1]
	expect(R.constructor_is(constructor_child,markers[1]),"constructor cache follows class changes")
	R.classes.PatternConstructorGetter={"path":"res://tests/pattern_suite.gd","base":"MovieClip","methods":{"get_constructor":["f_constructor",false]},"fields":{},"field_types":{},"imports":[]}
	var getter:R.Value=R.Value.new();getter.class_id="PatternConstructorGetter";getter.has_getters=true;getter.fields.alternate=R.klass(markers[0])
	expect(R.constructor_is(getter,markers[0]) and not R.constructor_is(getter,markers[1]),"constructor getter overrides default identity")
	for mode_name in ["m_GameModeStory","m_GameModeSandbox","m_GameModeMilitary","m_GameModeChopperRescue"]:
		seed(943012)
		var mode:R.Value=game.fields[mode_name]
		game.fields.m_ActiveMode=mode;mode.fields.m_bDoStartGameMode=true;game.fields.m_bDoStartGameMode=true
		R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
		R.call_member(mode,"HideUpgradeScreen",[])
		# Audio playback advances on wall-clock time between independent runs.
		# Give both seeded loading fixtures the same initial saved pause state.
		(mode.fields.m_Player as R.Value).fields.m_fVoicePausePosition=0.0
		var pattern:R.Value=R.construct(R.klass("RDLevelPatternCustomNew"),[R.klass("MC_LevelPattern_LG_Residential1")])
		for name in markers:
			var child:R.Value=R.construct(R.klass(name),[])
			for method in ["IsGround","IsGeneric","IsHazard","IsCriticalHazard","IsZombie","IsSoldier"]:
				var args:Array=[child,mode]
				expect(R.call_member(pattern,method,args)==R.source_method(pattern,"RDLevelPatternCustomNew",method,args),mode_name+" "+method+" "+name);predicate_cases+=1
			for level in [-1,0,1,4,20]:
				for difficulty in [0.0,0.7,1.0]:
					var args:Array=[child,mode,mode if R.instance_of(mode,R.klass("RDGameModeChopperRescue")) else null,level,difficulty]
					seed(101+level);var expected:Variant=R.source_method(pattern,"RDLevelPatternCustomNew","CanSpawn",args);var next:float=randf()
					seed(101+level);expect(R.call_member(pattern,"CanSpawn",args)==expected,mode_name+" CanSpawn "+name);expect(randf()==next,"CanSpawn random consumption "+name);predicate_cases+=1
		for definition in ["MC_LevelPattern_LG_Residential1","MC_LevelPattern_LG_Residential34checkpoint","MC_LevelPattern_LG_ResidentialChurch3"]:
			for flip_seed in [21,331]:
				seed(flip_seed)
				pattern=R.construct(R.klass("RDLevelPatternCustomNew"),[R.klass(definition)])
				var timing_start:int=Time.get_ticks_usec()
				var space:Variant=R.call_member(pattern,"Load",[mode,4,0.7,200.0,0.8,1.3])
				print("PATTERN_LOAD_TIMING "+JSON.stringify({"mode":mode_name,"definition":definition,"seed":flip_seed,"ms":(Time.get_ticks_usec()-timing_start)/1000.0}))
				output.append({"mode":mode_name,"definition":definition,"seed":flip_seed,"state":snapshot(mode,pattern,space)})
				print("TEST_PATTERN_CASE mode="+mode_name+" definition="+definition+" seed="+str(flip_seed))
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--pattern-output="):
			var file:FileAccess=FileAccess.open(arg.trim_prefix("--pattern-output="),FileAccess.WRITE);file.store_string(JSON.stringify(output))
	expect(R.warnings.is_empty(),"pattern dispatch warnings")
	print("TEST_PATTERN_COMPLETE predicates="+str(predicate_cases)+" loads="+str(output.size())+" failures="+str(failures))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)

