extends SceneTree
const R=preload("res://runtime/as_runtime.gd")

func _initialize() -> void:
	call_deferred("run")

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate()
	root.add_child(scene)
	scene.set_process(false);scene.set_physics_process(false)
	var game=R.get_value(R.root,"m_Game")
	R.invoke(R.get_value(game,"SetGameState"),[0])
	scene.process_frame_scripts()
	print("TEST_MENU state="+str(R.get_value(game,"m_iGameState"))+" root_frame="+str(R.root.frame))
	R.set_value(game,"m_ActiveMode",R.get_value(game,"m_GameModeStory"))
	R.invoke(R.get_value(game,"StartGameMode"),[R.get_value(game,"m_GameModeDriverSelection")])
	scene.process_frame_scripts()
	print("TEST_DRIVER_SELECTION state="+str(R.get_value(game,"m_iGameState")))
	var mode=R.get_value(game,"m_GameModeStory")
	R.invoke(R.get_value(mode,"StartGameMode"),[])
	R.set_value(game,"m_bDoStartGameMode",true)
	R.invoke(R.get_value(game,"StartGameMode"),[mode])
	scene.process_frame_scripts()
	print("TEST_STORY_STARTED")
	R.invoke(R.get_value(mode,"HideUpgradeScreen"),[])
	var started:int=Time.get_ticks_msec()
	var warm_started:int=0
	for i in range(240):
		if i==120:warm_started=Time.get_ticks_msec()
		if i==3 or i==30:
			var event=R.construct(R.klass("KeyboardEvent"),["keyDown"]);event.fields.keyCode=87
			R.invoke(R.get_value(mode,"OnKeyDown"),[event])
		if i==20:R.invoke(R.get_value(mode,"OnMouseDown"),[R.construct(R.klass("MouseEvent"),["mouseDown"])])
		R.elapsed+=1.0/30
		scene.advance_timelines();scene.process_frame_scripts()
		R.invoke(R.get_value(game,"Tick"),[1.0/30])
		R.invoke(R.get_value(game,"Render"),[])
		R.tick_tweens(1.0/30)
		if i%30==0:print("TEST_STORY_TICK "+str(i)+" elapsed_ms="+str(Time.get_ticks_msec()-started))
	var player=R.get_value(mode,"m_Player")
	print("TEST_DRIVING position="+str(R.get_value(R.get_value(player,"m_vLocation"),"Z"))+" forward="+str(R.get_value(player,"m_bGoForward")))
	print("TEST_PERFORMANCE elapsed_ms="+str(Time.get_ticks_msec()-started))
	print("TEST_SUSTAINED ticks=120 elapsed_ms="+str(Time.get_ticks_msec()-warm_started))
	var passed:bool=R.num(R.get_value(R.get_value(player,"m_vLocation"),"Z"))>0 and R.warnings.is_empty()
	print("TEST_GAMEPLAY_COMPLETE passed="+str(passed)+" warnings="+str(R.warnings))
	if R.profiling:
		var keys:Array=R.profile.keys();keys.sort_custom(func(x,y):return R.profile[x][2]>R.profile[y][2])
		for key in keys.slice(0,25):print("PROFILE "+key+" "+str(R.profile[key]))
	scene.queue_free()
	await process_frame
	quit(0 if passed else 1)
