extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene)
	var game:R.Value=R.root.fields.m_Game
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	game.fields.m_ActiveMode=game.fields.m_GameModeStory
	R.call_member(game,"StartCinematic",["GameIntro",false]);scene.process_frame_scripts()
	expect(R.root.fields.get("@presentation_motion",false),"cinematic marks the root for newly placed animation")
	var start:int=R.root.frame;var samples:Array=[];var duration:float=0.2 if DisplayServer.get_name()=="headless" else 35.0
	var began:int=Time.get_ticks_msec();var next_sample:int=0
	while Time.get_ticks_msec()-began<duration*1000:
		await process_frame
		if Time.get_ticks_msec()-began<next_sample:continue
		next_sample+=5000
		var row:Dictionary={"elapsed_ms":Time.get_ticks_msec()-began,"frame":R.root.frame,"stream_playing":scene.cinematic_audio.playing,"stream_position":scene.cinematic_audio.get_playback_position(),"mouth_present":game.fields.m_CinematicMouth!=null,"voice_present":game.fields.m_CinematicVoice!=null}
		if scene.cinematic_audio.playing:
			row.sync_error_seconds=absf(row.stream_position-float(239+R.root.frame-411)/30.0)
			expect(row.sync_error_seconds<0.2,"cinematic stream stays synchronized at sample "+str(samples.size()))
		samples.append(row)
		if DisplayServer.get_name()!="headless":
			await RenderingServer.frame_post_draw
			root.get_texture().get_image().save_png(ProjectSettings.globalize_path("res://../presentation059-live-"+str(samples.size())+".png"))
	expect(R.root.frame>start,"normal Godot physics advances the original cinematic clock")
	R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	R.call_member(game,"Tick",[1.0/30]);scene.process_frame_scripts()
	var selection:R.Value=game.fields.m_GameModeDriverSelection
	expect(game.fields.m_CurrentGameMode==selection,"cinematic exits through original driver-selection state")
	expect(not R.root.fields.get("@presentation_motion",false),"cinematic interpolation scope is cleared before gameplay")
	expect(selection.fields.m_MC.fields.get("@presentation_motion",false),"driver selection retains its own interpolation scope")
	var button:R.Value=selection.fields.m_MC.fields.DianeButton
	var point:Vector2=button.display.to_global(R.bounds(button).get_center());var target:R.Value=scene.hit_target(R.stage,point)
	expect(target==button,"original Diane selection hit target remains aligned")
	R.dispatch(target,"mouseDown",{"stageX":point.x,"stageY":point.y},true);scene.process_frame_scripts();R.tick_tweens(2)
	expect(selection.fields.m_bSelectionDone,"Diane selection dispatches its original callback")
	for sound in ["m_CochetaDrivingVoice","m_DianeDrivingVoice"]:R.call_member(selection.fields[sound],"Stop",[])
	R.call_member(selection,"Update",[1.0]);scene.process_frame_scripts()
	expect(game.fields.m_CurrentGameMode==game.fields.m_GameModeStory,"driver selection enters original Story mode")
	expect(not R.root.fields.get("@presentation_motion",false),"Story world remains outside the presentation scope")
	var remaining:int=0
	for key:String in R.textures.keys():
		if key.begins_with("@presentation:") or key.begins_with("res://presentation_assets/"):remaining+=1
	expect(remaining==0,"presentation-only texture cache is released before driving")
	print("TEST_PRESENTATION_LIFECYCLE_COMPLETE "+JSON.stringify({"failures":failures,"samples":samples,"warnings":R.warnings}))
	scene.set_physics_process(false);scene.queue_free();await process_frame;quit(0 if failures.is_empty() and R.warnings.is_empty() else 1)
