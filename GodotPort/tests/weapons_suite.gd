extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.get_value(R.root,"m_Game");var mode=R.get_value(game,"m_GameModeStory")
	R.set_value(mode,"m_bDoStartGameMode",true);R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	var player=R.get_value(mode,"m_Player")
	for field in ["m_WeaponPistolCocheta","m_WeaponPistolDiane","m_WeaponMAC11","m_WeaponSPAS12","m_WeaponMP5","m_WeaponShotgun","m_WeaponM16","m_WeaponM60","m_WeaponRocketLauncher","m_WeaponMountedMG","m_CustomWeaponRocketLauncher","m_CustomWeaponMountedMG"]:
		var weapon=R.get_value(player,field);var data=R.get_value(weapon,"m_Data")
		expect(data!=null,"weapon data "+field)
		if data==null:continue
		R.set_value(data,"m_iAmmoInMag",10);R.set_value(data,"m_iAmmoInBag",100);R.set_value(data,"m_bUnlocked",true)
		R.set_value(player,"m_Weapon",weapon);R.call_member(weapon,"OnEquip",[]);R.call_member(weapon,"FireAmmo",[])
		for i in range(3):
			scene.advance_timelines();scene.process_frame_scripts();R.call_member(game,"Tick",[1.0/30]);R.call_member(game,"Render",[])
		expect(R.get_value(data,"m_iAmmoInMag")<=9 or R.get_value(weapon,"m_bMountedWeapon"),"shot consumes ammunition "+field)
		R.call_member(weapon,"OnUnequip",[])
		print("TEST_WEAPON_FIRED "+field)
	print("TEST_WEAPONS_COMPLETE failures="+str(failures)+" warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
