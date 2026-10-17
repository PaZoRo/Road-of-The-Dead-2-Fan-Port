extends SceneTree
const R=preload("res://runtime/as_runtime.gd")

func _initialize() -> void:call_deferred("run")

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene)
	scene.set_process(false);scene.set_physics_process(false)
	var game=R.get_value(R.root,"m_Game")
	R.invoke(R.get_value(game,"SetGameState"),[0]);scene.process_frame_scripts()
	for state in [2,3,4,5,6,8]:
		R.invoke(R.get_value(game,"SetMenuState"),[state,true]);R.tick_tweens(1.0);scene.process_frame_scripts();print("TEST_MENU_PAGE "+str(state))
	R.invoke(R.get_value(game,"SetMenuState"),[1,true])
	for name in ["m_GameModeTime","m_GameModeDistance","m_GameModeMilitary","m_GameModeMutant","m_GameModeSandbox","m_GameModeChopperRescue","m_GameModeChopperRescueSandbox","m_GameModeEditor"]:
		var mode=R.get_value(game,name)
		R.set_value(mode,"m_bDoStartGameMode",true)
		R.invoke(R.get_value(game,"StartGameMode"),[mode]);scene.process_frame_scripts()
		for i in range(3):R.invoke(R.get_value(game,"Tick"),[1.0/30]);R.invoke(R.get_value(game,"Render"),[])
		print("TEST_MODE_STARTED "+name)
	R.invoke(R.get_value(game,"StartGameMode"),[null])
	print("TEST_MODES_COMPLETE warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit()
