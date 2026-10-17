extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var phases:Dictionary={}
var samples:Array=[]

func _initialize() -> void:call_deferred("run")

func record(name:String,started:int) -> void:
	phases[name]=int(phases.get(name,0))+Time.get_ticks_usec()-started

func compare_pause_capture(game:R.Value) -> Dictionary:
	var bitmap:R.Value=game.fields.m_Hud.fields.m_PauseBitmapData
	var original:Image=bitmap.native.duplicate();var result:Dictionary={}
	var enabled:bool=R.gpu_pause_snapshot_enabled
	for mode in [true,false]:
		bitmap.native.copy_from(original);R.gpu_pause_snapshot_enabled=mode
		var count:int=R.gpu_pause_snapshot_count;var values:int=R.values.size()
		var began:int=Time.get_ticks_usec()
		R.bitmap_call(bitmap,"draw",[game.fields.m_WorldLayer])
		result["gpu" if mode else "cpu"]={"ms":(Time.get_ticks_usec()-began)/1000.0,"snapshots":R.gpu_pause_snapshot_count-count,"new_model_values":R.values.size()-values}
	R.gpu_pause_snapshot_enabled=enabled
	return result

func run() -> void:
	root.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
	seed(20261009)
	var scene:Node=load("res://scenes/main.tscn").instantiate();scene.set_script(load("res://tests/effects_profile_main.gd"));root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	await process_frame;await process_frame
	print("BOOT_EFFECT_PROFILE "+JSON.stringify(R.display_script.report()))
	var game=R.root.fields.m_Game
	R.call_member(game,"ClearCinematic",[])
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
	var mode=game.fields.m_GameModeStory
	game.fields.m_ActiveMode=mode
	R.call_member(game,"StartGameMode",[game.fields.m_GameModeDriverSelection]);scene.process_frame_scripts()
	R.call_member(mode,"StartGameMode",[]);game.fields.m_bDoStartGameMode=true
	R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
	R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
	print("PERFORMANCE_START state="+str(game.fields.m_iGameState)+" entities="+str(game.fields.m_World.fields.m_Entities.size())+" frame="+str(R.root.frame))
	var graphical:bool=DisplayServer.get_name()!="headless"
	var wall_started:int=0;var before:Dictionary={}
	for i in range(480):
		if i==120:
			R.display_script.reset_profile()
			phases.clear();wall_started=Time.get_ticks_usec()
			if R.profiling:R.profile.clear()
			if R.profiling:scene.animation_profile.clear()
			before={"nodes":Performance.get_monitor(Performance.OBJECT_NODE_COUNT),"orphans":Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT),"memory":Performance.get_monitor(Performance.MEMORY_STATIC)}
		if i in [3,30]:
			var event=R.construct(R.klass("KeyboardEvent"),["keyDown"]);event.fields.keyCode=87;R.call_member(mode,"OnKeyDown",[event])
		if i==40:R.call_member(mode,"OnMouseDown",[R.construct(R.klass("MouseEvent"),["mouseDown"])])
		if i==90:R.call_member(mode,"OnMouseUp",[R.construct(R.klass("MouseEvent"),["mouseUp"])])
		if i==169 and OS.get_cmdline_user_args().has("--compare-pause-capture"):
			var comparison:Dictionary=compare_pause_capture(game)
			print("PAUSE_CAPTURE_COMPARISON "+JSON.stringify(comparison))
			if comparison.gpu.snapshots!=1 or comparison.gpu.new_model_values!=0:push_error("Snapshot comparison failed");quit(1);return
		if i==170:
			var pause_began:int=Time.get_ticks_usec()
			R.call_member(game,"SetPause",[true])
			print("PERFORMANCE_PAUSE "+JSON.stringify({"ms":(Time.get_ticks_usec()-pause_began)/1000.0,"gpu_snapshots":R.gpu_pause_snapshot_count,"gpu_ms":R.gpu_pause_snapshot_us/1000.0,"world_transform":str(game.fields.m_WorldLayer.display.global_transform)}))
			for argument in OS.get_cmdline_user_args():
				if argument.begins_with("--pause-capture="):game.fields.m_Hud.fields.m_PauseBitmapData.native.save_png(argument.trim_prefix("--pause-capture="))
		if i==175:R.call_member(game,"SetPause",[false])
		var start:int=Time.get_ticks_usec();R.elapsed+=1.0/30
		var timer:int=Time.get_ticks_usec();scene.advance_timelines();scene.process_frame_scripts();record("animation_us",timer)
		timer=Time.get_ticks_usec();R.call_member(game,"Tick",[1.0/30]);record("gameplay_us",timer)
		timer=Time.get_ticks_usec();R.call_member(game,"Render",[]);record("render_us",timer)
		timer=Time.get_ticks_usec();R.tick_tweens(1.0/30);R.tick_audio();scene.process_frame_scripts();R.sync_visible_clips();record("effects_us",timer)
		timer=Time.get_ticks_usec();scene.update_hover();record("pointer_us",timer)
		if i>=120:samples.append(Time.get_ticks_usec()-start)
		await process_frame
		if i<5:print("PERFORMANCE_INIT tick="+str(i)+" state="+str(game.fields.m_iGameState)+" entities="+str(game.fields.m_World.fields.m_Entities.size())+" frame="+str(R.root.frame)+" paused="+str(game.fields.m_bPaused))
		if i%120==0:print("PERFORMANCE_PROGRESS tick="+str(i)+" position="+str(mode.fields.m_Player.fields.m_vLocation.fields.Z))
	var wall_usec:int=Time.get_ticks_usec()-wall_started
	samples.sort()
	var total:float=0
	for sample in samples:total+=sample
	var result:Dictionary={"graphical":graphical,"ticks":samples.size(),"mean_update_ms":total/samples.size()/1000.0,"p95_update_ms":samples[int(samples.size()*0.95)]/1000.0,"wall_fps":samples.size()*1000000.0/wall_usec,"position":mode.fields.m_Player.fields.m_vLocation.fields.Z,"warnings":R.warnings,"before":before,"after":{"nodes":Performance.get_monitor(Performance.OBJECT_NODE_COUNT),"orphans":Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT),"memory":Performance.get_monitor(Performance.MEMORY_STATIC)},"phase_mean_ms":{}}
	for name in phases:result.phase_mean_ms[name]=phases[name]/float(samples.size())/1000.0
	result["recycled_shapes"]=R.recycled_shapes
	result["gpu_pause_snapshots"]=R.gpu_pause_snapshot_count
	result["gpu_pause_snapshot_ms"]=R.gpu_pause_snapshot_us/1000.0
	result["deferred_visual_frames"]=R.deferred_visual_frames
	print("PERFORMANCE_RESULT "+JSON.stringify(result))
	print("EFFECT_PROFILE "+JSON.stringify(R.display_script.report()))
	if R.profiling:
		var keys:Array=R.profile.keys();keys.sort_custom(func(a,b):return R.profile[a][2]>R.profile[b][2])
		for key in keys.slice(0,150):print("PROFILE "+key+" "+str(R.profile[key]))
		keys=scene.animation_profile.keys();keys.sort_custom(func(a,b):return scene.animation_profile[a][1]>scene.animation_profile[b][1])
		for key in keys.slice(0,20):print("ANIMATION_PROFILE "+key+" "+str(scene.animation_profile[key]))
	if graphical:
		for arg in OS.get_cmdline_user_args():
			if arg.begins_with("--capture="):
				await RenderingServer.frame_post_draw
				root.get_texture().get_image().save_png(arg.trim_prefix("--capture="))
	var failed:bool=not R.warnings.is_empty() or result.position<=0
	scene.queue_free();await process_frame;quit(1 if failed else 0)
