extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]

func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func _initialize() -> void:call_deferred("run")

func press(scene:Node,button:Variant) -> void:
	var point:Vector2=button.display.to_global(R.bounds(button).get_center())
	var target=scene.hit_target(R.stage,point)
	expect(target==button,"button receives pointer "+R.string(R.get_value(button,"name")))
	R.dispatch(target,"mouseDown",{"stageX":point.x,"stageY":point.y},true)
	scene.process_frame_scripts();R.tick_tweens(2)

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.get_value(R.root,"m_Game")
	R.set_value(R.get_value(game,"m_PlayerInfo"),"m_iStoryLevel",0)
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	press(scene,R.get_value(R.get_value(game,"m_Menu"),"StoryMode"))
	expect(R.get_value(game,"m_szCurrentCinematic")=="GameIntro","story button opens intro")
	R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	var selection=R.get_value(game,"m_GameModeDriverSelection")
	expect(R.get_value(game,"m_CurrentGameMode")==selection,"intro skip opens driver selection")
	press(scene,R.get_value(R.get_value(selection,"m_MC"),"CochetaButton"))
	expect(R.get_value(selection,"m_bSelectionDone"),"driver selection accepts pointer")
	for sound in ["m_CochetaDrivingVoice","m_DianeDrivingVoice"]:R.call_member(R.get_value(selection,sound),"Stop",[])
	R.call_member(selection,"Update",[1.0]);scene.process_frame_scripts()
	expect(R.get_value(game,"m_CurrentGameMode")==R.get_value(game,"m_GameModeStory"),"driver selection starts story")
	expect(R.get_value(R.get_value(R.get_value(game,"m_GameModeStory"),"m_Player"),"m_GameModeGameplay")==R.get_value(game,"m_GameModeStory"),"player binds active mode")
	print("TEST_INTERFACE_COMPLETE failures="+str(failures)+" warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
