extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")

func capture(name:String) -> void:
	if DisplayServer.get_name()=="headless":return
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--capture-dir="):
			var directory:String=arg.trim_prefix("--capture-dir=");DirAccess.make_dir_recursive_absolute(directory)
			await RenderingServer.frame_post_draw;root.get_texture().get_image().save_png(directory+"/"+name+".png")

func run() -> void:
	seed(20261009)
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_physics_process(false)
	await process_frame;await process_frame
	var game=R.root.fields.m_Game;R.call_member(game,"ClearCinematic",[])
	R.call_member(game,"StartCinematic",["GameIntro",true]);scene.process_frame_scripts()
	for frame in [1485,1800,2600]:
		R.goto_frame(R.root,frame,false);scene.process_frame_scripts();await capture("cinematic-"+str(frame))
	R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
	var mode=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode
	R.call_member(game,"StartGameMode",[game.fields.m_GameModeDriverSelection]);scene.process_frame_scripts()
	R.call_member(mode,"StartGameMode",[]);game.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
	R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
	scene.set_physics_process(true)
	var start:int=Time.get_ticks_usec();var last:int=start;var samples:Array=[];var ticks:int=0;var measure_start:int=0;var initial_tick:int=0;var accelerated:bool=false
	while Time.get_ticks_usec()-start<15000000:
		await process_frame
		var now:int=Time.get_ticks_usec()
		if now-start>500000 and not accelerated:
			var event=R.construct(R.klass("KeyboardEvent"),["keyDown"]);event.fields.keyCode=87;R.call_member(mode,"OnKeyDown",[event]);accelerated=true
		if now-start>3000000:
			if measure_start==0:measure_start=now;initial_tick=game.fields.m_iGameTick
			else:samples.append(now-last)
		last=now
	scene.set_physics_process(false);ticks=game.fields.m_iGameTick-initial_tick
	var seconds:float=(Time.get_ticks_usec()-measure_start)/1000000.0;samples.sort()
	var invalid:Array=[]
	for ref in R.values:
		var obj=ref.get_ref()
		if obj!=null and obj.display!=null and not obj.display.transform.is_finite():invalid.append(obj.class_id+":"+obj.symbol)
	var result:Dictionary={"seconds":seconds,"rendered_frames":samples.size(),"wall_fps":samples.size()/seconds,"simulation_hz":ticks/seconds,"p95_frame_ms":samples[int(samples.size()*0.95)]/1000.0,"position":mode.fields.m_Player.fields.m_vLocation.fields.Z,"invalid_transforms":invalid,"warnings":R.warnings}
	print("LIVE_PLAYBACK_RESULT "+JSON.stringify(result));await capture("live-gameplay")
	print("MASK_CPU us="+str(R.display_script.mask_cpu_us)+" regenerations="+str(R.display_script.mask_regenerations))
	print("LIVE_RENDER_MONITORS "+JSON.stringify({"draw_calls":Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME),"objects":Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME),"video_memory":Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED),"texture_memory":Performance.get_monitor(Performance.RENDER_TEXTURE_MEM_USED),"process_ms":Performance.get_monitor(Performance.TIME_PROCESS)*1000,"physics_ms":Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS)*1000,"nodes":Performance.get_monitor(Performance.OBJECT_NODE_COUNT),"memory":Performance.get_monitor(Performance.MEMORY_STATIC),"batched_instances":R.batched_visual_instances}))
	var failed:bool=not invalid.is_empty() or not R.warnings.is_empty() or result.position<=0
	scene.queue_free();await process_frame;quit(1 if failed else 0)
