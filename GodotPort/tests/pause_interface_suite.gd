extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
 if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func step(scene:Node,game:R.Value) -> void:
 R.elapsed+=1.0/30;scene.advance_timelines();scene.process_frame_scripts();R.call_member(game,"Tick",[1.0/30]);R.call_member(game,"Render",[]);R.tick_tweens(1.0/30);R.tick_audio();scene.process_frame_scripts();R.sync_visible_clips()
 if scene.section_clock!=null:scene.section_clock.pump(false,0)
func run() -> void:
 seed(20261009)
 var scene:Node2D=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false);scene.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
 await process_frame;await process_frame
 var game:R.Value=R.root.fields.m_Game
 R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
 var mode:R.Value=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode
 R.call_member(game,"StartGameMode",[game.fields.m_GameModeDriverSelection]);scene.process_frame_scripts()
 R.call_member(mode,"StartGameMode",[]);game.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
 R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
 var event:R.Value=R.construct(R.klass("KeyboardEvent"),["keyDown"]);event.fields.keyCode=87;R.call_member(mode,"OnKeyDown",[event])
 for i in 150:
  if i in [3,30]:R.call_member(mode,"OnKeyDown",[event])
  step(scene,game);await process_frame
 expect(mode.fields.m_Player.fields.m_vLocation.fields.Z>0,"driving begins before pause")
 var position:float=mode.fields.m_Player.fields.m_vLocation.fields.Z
 R.call_member(game,"SetPause",[true])
 for i in 60:step(scene,game);await process_frame
 expect(game.fields.m_bPaused,"pause flag set")
 expect(mode.fields.m_Player.fields.m_vLocation.fields.Z==position,"player remains stopped while paused")
 var hud:R.Value=game.fields.m_Hud;var grab:R.Value=R.get_value(hud.fields.m_HudMC,"PauseScreenGrab")
 expect(grab.display.is_visible_in_tree(),"pause capture visible in UI")
 expect(hud.fields.m_PauseBitmap.display.material!=null,"pause grayscale filter active")
 var image:Image=hud.fields.m_PauseBitmapData.native
 expect(image.get_size()==Vector2i(600,400) and image.detect_alpha()==Image.ALPHA_NONE,"opaque pause image dimensions preserved")
 if DisplayServer.get_name()!="headless":
  expect(R.gpu_pause_snapshot_count>=1,"pause used renderer capture")
  await RenderingServer.frame_post_draw
  for arg in OS.get_cmdline_user_args():
   if arg.begins_with("--capture="):root.get_texture().get_image().save_png(arg.trim_prefix("--capture="))
 R.call_member(game,"SetPause",[false]);R.call_member(mode,"OnKeyDown",[event])
 for i in 60:step(scene,game);await process_frame
 expect(not game.fields.m_bPaused and mode.fields.m_Player.fields.m_vLocation.fields.Z>position,"driving resumes after pause")
 expect(not grab.display.visible,"pause capture hidden on resume")
 expect(R.warnings.is_empty(),"no compatibility warnings")
 print("TEST_PAUSE_INTERFACE_COMPLETE gpu_snapshots="+str(R.gpu_pause_snapshot_count)+" paused_position="+str(position)+" resumed_position="+str(mode.fields.m_Player.fields.m_vLocation.fields.Z)+" failures="+str(failures))
 R.cleanup();scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
