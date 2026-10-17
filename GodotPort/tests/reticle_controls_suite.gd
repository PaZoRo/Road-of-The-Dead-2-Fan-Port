extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
const Hot=preload("res://runtime/native_hotpaths.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func make_hud(game:R.Value,player:R.Value) -> R.Value:
	var result:R.Value=R.Value.new();result.class_id="RDHud"
	var mc:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,mc)
	for key:String in ["TargetCrosshair","ActualCrosshair"]:
		var clip:R.Value=R.construct(R.klass("MovieClip"),[])
		R.add_child(mc,clip);mc.fields[key]=clip
	result.fields={"m_Game":game,"m_Player":player,"m_HudMC":mc}
	return result
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game:R.Value=R.root.fields.m_Game;var mode:R.Value=game.fields.m_GameModeStory
	mode.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	var player:R.Value=mode.fields.m_Player;var weapon:R.Value=player.fields.m_Weapon
	var original:R.Value=make_hud(game,player);var native:R.Value=make_hud(game,player)
	player.fields.m_fAimingX=287.25;player.fields.m_fAimingY=132.5
	player.fields.m_fTargetAimingX=300.75;player.fields.m_fTargetAimingY=146.25
	var boundary:float=R.statics.RDHud.OptionsMenuPosY;var cases:int=0
	for state:int in range(7):
		original.fields.m_Player=player if state!=0 else null;native.fields.m_Player=original.fields.m_Player
		player.fields.m_bFailed=state==1;player.fields.m_bInEnding=state==2
		player.fields.m_bGunDown=state==3;player.fields.m_Weapon=null if state==4 else weapon
		for mounted:bool in [false,true]:
			weapon.fields.m_bMountedWeapon=mounted
			for spread:float in [0.0,40.0,200.0,400.0]:
				weapon.fields.m_fBulletSpread=spread
				for mouse_y:float in [boundary-0.01,boundary,boundary+0.01]:
					R.mouse_position=game.fields.m_RootMC.display.to_global(Vector2(300,mouse_y))
					Hot.source_RDHud_UpdateAiming(original,[])
					Hot.RDHud_UpdateAiming(native,[])
					var expected:R.Value=original.fields.m_HudMC.fields.ActualCrosshair
					var actual:R.Value=native.fields.m_HudMC.fields.ActualCrosshair
					expect(actual.display.visible==expected.display.visible,"visibility guards case="+str(cases))
					expect(not native.fields.m_HudMC.fields.TargetCrosshair.display.visible,"target art stays hidden")
					if expected.display.visible:
						expect(actual.display.position==expected.display.position,"actual aim coordinates")
						expect(actual.display.scale==Vector2.ONE,"constant sharp reticle size")
						expect(is_equal_approx(actual.fields["@fan_crosshair_gap"],3.0+clampf(R.num(R.call_member(weapon,"GetBulletSpread",[]))/400,0,1)*12.0),"actual weapon spread")
					cases+=1
	# Inspect the authored timeline before disabling it: it contains only art.
	var real_hud:R.Value=game.fields.m_Hud
	if real_hud!=null:
		var authored:R.Value=R.get_value(real_hud.fields.m_HudMC,"ActualCrosshair")
		expect(authored.frame_scripts.is_empty() and authored.listeners.is_empty(),"original reticle has no gameplay callbacks")
	print("TEST_RETICLE_CONTROLS_COMPLETE cases="+str(cases)+" failures="+str(failures)+" warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() and R.warnings.is_empty() else 1)
