extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDUnlockData(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDUnlockData"), [])
	return null

static func f_GetSurvivalItemName(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Vehicles")))):
		pass
		return "Abandoned Vehicles"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_LargeVehicles")))):
		pass
		return "Large Vehicles"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_WaterBarrels")))):
		pass
		return "Water Barrels"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_ArmyVehicles")))):
		pass
		return "Army Vehicles"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_FireHydrants")))):
		pass
		return "Fire Hydrants"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_SupportChoppers")))):
		pass
		return "Support Choppers"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_AttackChoppers")))):
		pass
		return "Attack Choppers"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Garages")))):
		pass
		return "Garages"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_PoliceStations")))):
		pass
		return "Police Stations"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_MovingCars")))):
		pass
		return "Moving Cars"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Churches")))):
		pass
		return "Churches"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_WeaponCaches")))):
		pass
		return "Weapon Caches"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_FuelTrucks")))):
		pass
		return "Fuel Trucks"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Mines")))):
		pass
		return "Mines"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_OilSpills")))):
		pass
		return "Oil Spills"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Corpses")))):
		pass
		return "Corpses"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_SpikeStrips")))):
		pass
		return "Spike Strips"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_BomberJets")))):
		pass
		return "Bomber Jets"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_SecurityFences")))):
		pass
		return "Security Fences"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_CommonUndead")))):
		pass
		return "Common Undead"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Feeders")))):
		pass
		return "Feeders"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Ravager")))):
		pass
		return "Ravagers"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Brute")))):
		pass
		return "Brutes"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_UndeadSoldier")))):
		pass
		return "Undead Soldier"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Grub")))):
		pass
		return "Grub"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Mutants")))):
		pass
		return "Mutants"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Civilians")))):
		pass
		return "Civilians"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_EnemySoldiers")))):
		pass
		return "Enemy Soldiers"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_SpikeSoldiers")))):
		pass
		return "Spike Soldiers"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_BombSquad")))):
		pass
		return "Bomb Squad"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_TurretAttachments")))):
		pass
		return "Mounted Weapons"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_CochetasWeapons")))):
		pass
		return "Cocheta's Weapons"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_DianesWeapons")))):
		pass
		return "Diane's Weapons"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_DrivingSkills")))):
		pass
		return "Driving Skills"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_Perks")))):
		pass
		return "Perks"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_MedicalShots")))):
		pass
		return "Medical Shots"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_AlphaMutants")))):
		pass
		return "Alpha Mutants"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_MutantTactics")))):
		pass
		return "Mutant Tactics"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_AlphaMutantTactics")))):
		pass
		return "Alpha Mutant Tactics"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_UndeadTactics")))):
		pass
		return "Undead Tactics"
	if R.truth((float(v_iItem) == float(R.static_value("RDUnlockData", "Survival_MotionDetectorMines")))):
		pass
		return "Proximity Mines"
	return ""
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "DianeMAC11Cost", 500, "=")
	R.set_value(c, "DianeM16Cost", 1000, "=")
	R.set_value(c, "DianePistolUpgradeCosts", R.construct(R.klass("Array"), [50, 125, 275, 550, 1000]), "=")
	R.set_value(c, "DianeShotgunUpgradeCosts", R.construct(R.klass("Array"), [75, 175, 400, 725, 1200]), "=")
	R.set_value(c, "DianeMAC11UpgradeCosts", R.construct(R.klass("Array"), [100, 225, 525, 850, 1400]), "=")
	R.set_value(c, "DianeM16UpgradeCosts", R.construct(R.klass("Array"), [125, 300, 800, 1200, 1800]), "=")
	R.set_value(c, "CochetaSPAS12Cost", 500, "=")
	R.set_value(c, "CochetaM60Cost", 1000, "=")
	R.set_value(c, "CochetaPistolUpgradeCosts", R.construct(R.klass("Array"), [50, 125, 275, 550, 1000]), "=")
	R.set_value(c, "CochetaMP5UpgradeCosts", R.construct(R.klass("Array"), [75, 175, 400, 725, 1200]), "=")
	R.set_value(c, "CochetaSPAS12UpgradeCosts", R.construct(R.klass("Array"), [100, 225, 525, 850, 1400]), "=")
	R.set_value(c, "CochetaM60UpgradeCosts", R.construct(R.klass("Array"), [125, 300, 800, 1200, 1800]), "=")
	R.set_value(c, "ReplenishCost", 100, "=")
	R.set_value(c, "MountedMGCost", 2500, "=")
	R.set_value(c, "RocketLauncherCost", 2500, "=")
	R.set_value(c, "TireCosts", R.construct(R.klass("Array"), [250, 500, 1000, 1500, 2000]), "=")
	R.set_value(c, "EngineCosts", R.construct(R.klass("Array"), [250, 500, 1000, 1500, 2000]), "=")
	R.set_value(c, "BumperCosts", R.construct(R.klass("Array"), [250, 500, 1000, 1500, 2000]), "=")
	R.set_value(c, "RepairTireCosts", R.construct(R.klass("Array"), [0, 0, 0, 0, 0]), "=")
	R.set_value(c, "RepairEngineCosts", R.construct(R.klass("Array"), [0, 0, 0, 0, 0]), "=")
	R.set_value(c, "RepairBumperCosts", R.construct(R.klass("Array"), [0, 0, 0, 0, 0]), "=")
	R.set_value(c, "MedShieldCost", 200, "=")
	R.set_value(c, "MedHealCost", 100, "=")
	R.set_value(c, "ChopperSupportCost", R.construct(R.klass("Array"), [500, 1000, 2250, 3750, 5000]), "=")
	R.set_value(c, "AmmoPickupCost", R.construct(R.klass("Array"), [150, 265, 450, 900, 1500]), "=")
	R.set_value(c, "LowerCostCost", R.construct(R.klass("Array"), [250, 400, 700, 1200, 1600]), "=")
	R.set_value(c, "DriverSwitchCost", R.construct(R.klass("Array"), [200, 400, 600, 800, 1000]), "=")
	R.set_value(c, "TaskSpeedCost", R.construct(R.klass("Array"), [250, 400, 800, 1200, 2000]), "=")
	R.set_value(c, "LevelUpCost", R.construct(R.klass("Array"), [150, 300, 600, 900, 1200]), "=")
	R.set_value(c, "WeaponDamageToolTip", "Damage, as the name implies, affects how much damage each bullet does on your target.", "=")
	R.set_value(c, "WeaponAccuracyToolTip", "Accuracy affects the bullet spread from firing and the kick back for shotguns. It also affects how fast the bullet spread and kick back recover.", "=")
	R.set_value(c, "WeaponCapacityToolTip", "Capacity affects how many rounds/shells your weapon can hold and how many total rounds/shells you can carry for that weapon.", "=")
	R.set_value(c, "WeaponAimingToolTip", "The aiming levels up as you play and affects how responsive your aiming is with the weapon.", "=")
	R.set_value(c, "WeaponHandlingToolTip", "The handling levels up as you play and affects your equip/unequip speed, how much kick back you get from hard collisions and how fast you recover from those.", "=")
	R.set_value(c, "WeaponReloadingToolTip", "The reloading levels up as you play and affects how fast you reload this weapon. This is crucial when dealing with a crowd of zombies.", "=")
	R.set_value(c, "Survival_Vehicles", 1, "=")
	R.set_value(c, "Survival_LargeVehicles", 2, "=")
	R.set_value(c, "Survival_WaterBarrels", 3, "=")
	R.set_value(c, "Survival_ArmyVehicles", 4, "=")
	R.set_value(c, "Survival_FireHydrants", 5, "=")
	R.set_value(c, "Survival_SupportChoppers", 6, "=")
	R.set_value(c, "Survival_AttackChoppers", 7, "=")
	R.set_value(c, "Survival_Garages", 8, "=")
	R.set_value(c, "Survival_PoliceStations", 9, "=")
	R.set_value(c, "Survival_MovingCars", 10, "=")
	R.set_value(c, "Survival_Churches", 11, "=")
	R.set_value(c, "Survival_WeaponCaches", 12, "=")
	R.set_value(c, "Survival_FuelTrucks", 13, "=")
	R.set_value(c, "Survival_Mines", 14, "=")
	R.set_value(c, "Survival_OilSpills", 15, "=")
	R.set_value(c, "Survival_Corpses", 16, "=")
	R.set_value(c, "Survival_SpikeStrips", 17, "=")
	R.set_value(c, "Survival_BomberJets", 18, "=")
	R.set_value(c, "Survival_SecurityFences", 19, "=")
	R.set_value(c, "Survival_CommonUndead", 20, "=")
	R.set_value(c, "Survival_Feeders", 21, "=")
	R.set_value(c, "Survival_Ravager", 22, "=")
	R.set_value(c, "Survival_Brute", 23, "=")
	R.set_value(c, "Survival_UndeadSoldier", 24, "=")
	R.set_value(c, "Survival_Grub", 25, "=")
	R.set_value(c, "Survival_Mutants", 26, "=")
	R.set_value(c, "Survival_Civilians", 27, "=")
	R.set_value(c, "Survival_EnemySoldiers", 28, "=")
	R.set_value(c, "Survival_SpikeSoldiers", 29, "=")
	R.set_value(c, "Survival_BombSquad", 30, "=")
	R.set_value(c, "Survival_TurretAttachments", 31, "=")
	R.set_value(c, "Survival_DianesWeapons", 32, "=")
	R.set_value(c, "Survival_CochetasWeapons", 33, "=")
	R.set_value(c, "Survival_DrivingSkills", 34, "=")
	R.set_value(c, "Survival_Perks", 35, "=")
	R.set_value(c, "Survival_MedicalShots", 36, "=")
	R.set_value(c, "Survival_AlphaMutants", 37, "=")
	R.set_value(c, "Survival_MutantTactics", 38, "=")
	R.set_value(c, "Survival_AlphaMutantTactics", 39, "=")
	R.set_value(c, "Survival_UndeadTactics", 40, "=")
	R.set_value(c, "Survival_MotionDetectorMines", 41, "=")
	R.set_value(c, "Survival_Max", 42, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
