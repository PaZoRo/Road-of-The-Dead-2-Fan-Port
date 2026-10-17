extends SceneTree
const R=preload("res://runtime/as_runtime.gd")

func _initialize() -> void:call_deferred("run")

func capture(name:String) -> void:
	await RenderingServer.frame_post_draw
	var directory:String="user://validation"
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--capture-dir="):directory=arg.trim_prefix("--capture-dir=")
	DirAccess.make_dir_recursive_absolute(directory)
	root.get_texture().get_image().save_png(directory+"/"+name+".png")

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	root.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
	await process_frame;await process_frame
	var game=R.get_value(R.root,"m_Game")
	R.call_member(game,"ClearCinematic",[])
	print("VISUAL_VIEWPORT "+str(R.get_value(game,"m_Viewport").fields))
	R.invoke(R.get_value(game,"SetGameState"),[0]);scene.process_frame_scripts();R.tick_tweens(2)
	R.invoke(R.get_value(game,"HideFlash"),[])
	await capture("menu")
	R.set_value(R.get_value(game,"m_PlayerInfo"),"m_iStoryLevel",0)
	R.dispatch(R.get_value(R.get_value(game,"m_Menu"),"StoryMode"),"mouseDown",{},true)
	scene.process_frame_scripts();R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	var selection=R.get_value(game,"m_GameModeDriverSelection")
	for i in range(30):
		R.elapsed+=1.0/30;R.tick_tweens(1.0/30);scene.advance_timelines();scene.process_frame_scripts();R.call_member(game,"Tick",[1.0/30])
	for name in ["BackButton","MenuButton","SwitchVehicle","JohnCarUnlocked","DianeWeaponStats","CochetaWeaponStats"]:
		var clip=R.get_value(R.get_value(selection,"m_MC"),name);print("VISUAL_SELECTION "+name+" visible="+str(R.get_value(clip,"visible")))
	var button=R.get_value(R.get_value(selection,"m_MC"),"CochetaButton")
	R.dispatch(button,"mouseOver",{},true)
	await capture("driver_selection")
	var mode=R.get_value(game,"m_GameModeStory")
	R.set_value(mode,"m_bDoStartGameMode",true)
	R.invoke(R.get_value(mode,"StartGameMode"),[]);R.invoke(R.get_value(game,"StartGameMode"),[mode]);scene.process_frame_scripts();R.tick_tweens(2)
	R.invoke(R.get_value(game,"HideFlash"),[])
	await capture("upgrades")
	R.invoke(R.get_value(mode,"HideUpgradeScreen"),[])
	R.invoke(R.get_value(game,"HideFlash"),[])
	print("VISUAL_LAYERS world="+str(R.get_value(game,"m_WorldLayer").display.transform)+" hud="+str(R.get_value(game,"m_HudLayer").display.transform))
	for i in range(45):
		if i==3:
			var event=R.construct(R.klass("KeyboardEvent"),["keyDown"]);event.fields.keyCode=87
			R.invoke(R.get_value(mode,"OnKeyDown"),[event])
		R.elapsed+=1.0/30;R.tick_tweens(1.0/30);R.tick_audio()
		scene.advance_timelines();scene.process_frame_scripts()
		R.invoke(R.get_value(game,"Tick"),[1.0/30]);R.invoke(R.get_value(game,"Render"),[]);scene.process_frame_scripts()
		await process_frame
	await capture("gameplay")
	var player=R.get_value(mode,"m_Player");var camera=R.get_value(mode,"m_Camera")
	print("VISUAL_CAMERA "+str(R.get_value(camera,"m_vLocation").fields)+" render="+str(R.get_value(camera,"m_fRenderDistX"))+","+str(R.get_value(camera,"m_fRenderDistY")))
	print("VISUAL_PLAYER main="+str(R.get_value(player,"m_MainMC").display.transform)+" visible="+str(R.get_value(player,"m_MainMC").display.visible))
	var road=R.get_value(mode,"m_Road")
	for group in ["m_RoadSliceEntities","m_RoadSliceGroundEntities"]:
		var slices=R.get_value(road,group)
		for slice in slices.slice(0,2):
			var mc=R.get_value(slice,"m_MC")
			var cursor=mc
			while cursor!=null:
				print("VISUAL_ROAD_PARENT "+cursor.class_id+" "+str(cursor.display.global_transform)+" visible="+str(cursor.display.visible)+" alpha="+str(cursor.display.modulate)+" child="+str(cursor.display.get_index())+" total="+str(cursor.display.get_parent().get_child_count() if cursor.display.get_parent()!=null else 0));cursor=cursor.parent_value()
			print("VISUAL_ROAD_POLYGONS "+str(mc.fields.get("@drawing",[]).size()))
	print("TEST_VISUAL_COMPLETE warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit()
