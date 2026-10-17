extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func sample(scene:Node,weapon:R.Value,modern:bool) -> int:
	R.call_member(weapon,"OnUnequip",[]);R.call_member(weapon,"OnEquip",[])
	var data:R.Value=weapon.fields.m_Data;data.fields.m_iAmmoInMag=300;data.fields.m_iAmmoInBag=0
	weapon.fields.m_GunMC.fields["@fan_fire_timing"]=modern
	weapon.fields.m_GunMC.fields.erase("@fan_fire_phase")
	R.call_member(weapon,"StartFiring",[])
	for tick in 120:
		R.elapsed+=1.0/30;R.root.fields.m_Game.fields.m_iGameTick+=1
		scene.advance_timelines();scene.process_frame_scripts();R.call_member(weapon,"Update",[1.0/30])
	R.call_member(weapon,"StopFiring",[])
	var used:int=300-int(data.fields.m_iAmmoInMag)
	for tick in 30:scene.advance_timelines();scene.process_frame_scripts();R.call_member(weapon,"Update",[1.0/30])
	expect(data.fields.m_iAmmoInMag==300-used,"release prevents further rounds")
	return used
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.root.fields.m_Game;var mode=game.fields.m_GameModeStory
	mode.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	var player:R.Value=mode.fields.m_Player
	for key:String in ["m_WeaponMAC11","m_WeaponMP5","m_WeaponM16","m_WeaponM60"]:
		var weapon:R.Value=player.fields[key];player.fields.m_Weapon=weapon
		var data:R.Value=weapon.fields.m_Data;data.fields.m_bUnlocked=true
		var before:int=data.fields.m_iAmmoInMag
		R.call_member(weapon,"OnEquip",[]);var delay:float=weapon.fields.m_fFireDelayMin
		R.call_member(weapon,"OnEquip",[])
		expect(data.fields.m_iAmmoInMag==before,"equip never grants free ammunition "+key)
		expect(is_nan(delay) and is_nan(weapon.fields.m_fFireDelayMin) or is_equal_approx(delay,weapon.fields.m_fFireDelayMin),"equip never compounds timing "+key)
		var original:int=sample(scene,weapon,false);var modern:int=sample(scene,weapon,true)
		expect(original>0 and modern>0 and modern<original,"sustained fire uses fewer rounds per second "+key)
		print("FIRING_PACING "+JSON.stringify({"weapon":key,"original_rounds_4s":original,"modern_rounds_4s":modern}))
		R.call_member(weapon,"OnUnequip",[])
	expect(R.warnings.is_empty(),"no weapon dispatch warnings")
	print("TEST_FIRING_PACING_COMPLETE failures="+str(failures))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
