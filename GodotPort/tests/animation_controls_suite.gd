extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var phase_steps:int=0
var checks:int=0
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	checks+=1
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func key(scene:Node,code:int,pressed:bool=true) -> void:
	var event:InputEventKey=InputEventKey.new();event.keycode=code;event.pressed=pressed;scene._input(event)
func mouse(scene:Node,pressed:bool) -> void:
	var event:InputEventMouseButton=InputEventMouseButton.new();event.button_index=MOUSE_BUTTON_LEFT;event.pressed=pressed;scene._input(event)
func step(scene:Node) -> void:
	if scene.prepare_animation_between_steps(0.5):phase_steps+=1
	scene._physics_process(1.0/30)
func run() -> void:
	seed(20261009)
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game:R.Value=R.root.fields.m_Game
	R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2)
	expect(not scene.prepare_animation_between_steps(0.5),"main menu uses inline timing")
	var button:R.Value=game.fields.m_Menu.fields.StoryMode
	var point:Vector2=button.display.to_global(R.bounds(button).get_center())
	expect(scene.hit_target(R.stage,point)==button,"story menu pointer still resolves")
	R.dispatch(button,"mouseDown",{"stageX":point.x,"stageY":point.y},true);scene.process_frame_scripts()
	expect(game.fields.m_szCurrentCinematic=="GameIntro","story menu starts original intro")
	expect(not scene.prepare_animation_between_steps(0.5),"cinematic uses inline timing")
	R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2)
	expect(game.fields.m_CurrentGameMode==game.fields.m_GameModeDriverSelection,"intro skip opens driver selection")
	expect(not scene.prepare_animation_between_steps(0.5),"driver selection uses inline timing")
	var mode:R.Value=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode
	R.call_member(mode,"StartGameMode",[]);game.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
	R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
	for i in 150:
		if i in [3,30]:key(scene,KEY_W)
		step(scene)
	var player:R.Value=mode.fields.m_Player
	expect(player.fields.m_vLocation.fields.Z>0,"real keyboard acceleration drives player")
	expect(phase_steps>100,"real Story ticks use prepared animation")
	scene.prepare_animation_between_steps(0.5);key(scene,KEY_A);scene._physics_process(1.0/30)
	expect(player.fields.m_bSteeringLeft,"late left input reaches matching tick");key(scene,KEY_A,false)
	expect(not player.fields.m_bSteeringLeft,"left release clears steering")
	scene.prepare_animation_between_steps(0.5);key(scene,KEY_D);scene._physics_process(1.0/30)
	expect(player.fields.m_bSteeringRight,"late right input reaches matching tick");key(scene,KEY_D,false)
	expect(not player.fields.m_bSteeringRight,"right release clears steering")
	var weapon:R.Value=player.fields.m_Weapon;var data:R.Value=weapon.fields.m_Data
	data.fields.m_iAmmoInMag=6;data.fields.m_iAmmoInBag=40
	scene.prepare_animation_between_steps(0.5);mouse(scene,true);scene._physics_process(1.0/30)
	for i in 24:step(scene)
	mouse(scene,false)
	expect(data.fields.m_iAmmoInMag<6,"mouse fire consumes ammunition through animation callbacks")
	expect(not weapon.fields.m_bFiring and not player.fields.m_bWantsToFire,"mouse release stops firing")
	for i in 30:step(scene)
	data.fields.m_iAmmoInMag=1
	scene.prepare_animation_between_steps(0.5);key(scene,KEY_R);scene._physics_process(1.0/30);key(scene,KEY_R,false)
	expect(R.truth(R.call_member(weapon,"IsReloading",[])),"late reload input starts original reload")
	for i in 180:step(scene)
	expect(data.fields.m_iAmmoInMag>1 and data.fields.m_iAmmoInBag<40,"reload animation transfers bag ammunition to magazine")
	expect(not R.truth(R.call_member(weapon,"IsReloading",[])),"reload animation completes")
	key(scene,KEY_W,false)
	scene.prepare_animation_between_steps(0.5);key(scene,KEY_P);scene._physics_process(1.0/30);key(scene,KEY_P,false)
	expect(game.fields.m_bPaused,"pause key works after preparation")
	var stopped:float=player.fields.m_vLocation.fields.Z
	for i in 30:step(scene)
	expect(player.fields.m_vLocation.fields.Z==stopped,"paused game does not advance driving")
	expect(not scene.prepare_animation_between_steps(0.5),"paused animation remains inline")
	key(scene,KEY_P);key(scene,KEY_P,false);key(scene,KEY_W)
	for i in 45:step(scene)
	expect(not game.fields.m_bPaused and player.fields.m_vLocation.fields.Z>stopped,"pause key resumes driving")
	expect(not player.fields.m_bFailed,"control sequence remains playable")
	expect(R.warnings.is_empty(),"no adapter warnings")
	print("TEST_ANIMATION_CONTROLS_COMPLETE checks="+str(checks)+" phased_steps="+str(phase_steps)+" position="+str(player.fields.m_vLocation.fields.Z)+" failures="+str(failures))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
