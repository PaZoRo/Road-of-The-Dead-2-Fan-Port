extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")

func run() -> void:
	seed(20261009)
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene)
	scene.set_process(false);scene.set_physics_process(false)
	var game:R.Value=R.root.fields.m_Game
	R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
	var mode:R.Value=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode
	R.call_member(game,"StartGameMode",[game.fields.m_GameModeDriverSelection]);scene.process_frame_scripts()
	R.call_member(mode,"StartGameMode",[]);game.fields.m_bDoStartGameMode=true
	R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
	R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
	for i in range(100):
		R.elapsed+=1.0/30;scene.advance_timelines();scene.process_frame_scripts()
		R.call_member(game,"Tick",[1.0/30]);R.tick_audio()
	var world:R.Value=game.fields.m_World;var camera:R.Value=mode.fields.m_Camera
	var phases:Dictionary={}
	for method in ["Render","Update"]:
		var args:Array=[camera] if method=="Render" else [0.0,camera]
		for i in 20:R.call_member(world,method,args)
		var samples:Array=[]
		for batch in 7:
			var began:int=Time.get_ticks_usec()
			for i in 100:R.call_member(world,method,args)
			samples.append((Time.get_ticks_usec()-began)/100000.0)
		samples.sort();phases[method]={"median_ms":samples[3],"samples_ms":samples}
	print("WORLD_COST_RESULT "+JSON.stringify({"entities":world.fields.m_Entities.size(),"cost":phases,"warnings":R.warnings}))
	var failed:bool=not R.warnings.is_empty()
	scene.queue_free();await process_frame;quit(1 if failed else 0)
