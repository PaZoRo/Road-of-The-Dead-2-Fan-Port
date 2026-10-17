extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDUpgradeScreen(c: Variant, a: Array) -> Variant:
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameModeGameplay")
	R.invoke(R.super_ref(c, "RDUpgradeScreen"), [])
	(c).fields["m_GameMode"] = R.coerce(v_gameMode, "RDGameModeGameplay")
	(c).fields["m_Game"] = R.coerce(((c).fields.get("m_GameMode")).fields.get("m_Game"), "RDGame")
	(c).fields["m_MC"] = R.coerce(R.construct(R.klass("MC_UpgradeScreen"), []), "MovieClip")
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponDamage1")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity1")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponDamage2")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity2")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponDamage3")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity3")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponDamage4")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity4")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "ReplenishSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MountedMGSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "TireSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "EngineSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "BumperSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairTireSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairEngineSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairBumperSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MedShieldSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MedHealSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "LowerCostSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "LevelUpSlot")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "SPAS12")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "M60")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "M16")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MAC11")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "Replenish")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MountedMG")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RocketLauncher")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "Tire")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "Engine")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "Bumper")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairTire")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairEngine")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "RepairBumper")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MedShield")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "MedHeal")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "ChopperSupport")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "AmmoPickup")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "LowerCost")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "DriverSwitch")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "TaskSpeed")])
	R.call_member(c, "InitButtonMC", [R.get_value((c).fields.get("m_MC"), "LevelUp")])
	return null

static func f_InitButtonMC(c: Variant, a: Array) -> Variant:
	var v_buttonMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.set_value(v_buttonMC, "mouseChildren", false, "=")
	R.set_value(v_buttonMC, "buttonMode", true, "=")
	return null

static func f_IsShown(c: Variant, a: Array) -> Variant:
	return R.binary("!=", R.get_value((c).fields.get("m_MC"), "parent"), null)
	return null

static func f_Show(c: Variant, a: Array) -> Variant:
	var v_iDefaultPanel: Variant = 0
	var v_iHudLayerIndex: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iArea: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_iDefaultPanel = R.coerce(0, "int")
	v_iHudLayerIndex = R.coerce(R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "getChildIndex"), [(((c).fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC")]), "int")
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChildAt"), [(c).fields.get("m_MC"), (float(v_iHudLayerIndex) + float(1))])
	(c).fields["m_iUpgradeType"] = R.coerce(v_iType, "int")
	if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Garage")))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "BG"), "gotoAndStop"), [3])
	else:
		pass
		if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation")))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "BG"), "gotoAndStop"), [4])
		else:
			pass
			if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Church")))):
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "BG"), "gotoAndStop"), [5])
			else:
				pass
				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "BG"), "gotoAndStop"), [6])
				else:
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "BG"), "gotoAndStop"), [(2 if R.truth((float(v_iArea) == float(R.static_value("RDGameModeGameplay", "Area_Park")))) else 1)])
	if R.truth(((float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate"))) or (float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation"))))):
		pass
		v_iDefaultPanel = R.coerce((R.static_value("RDUpgradeScreen", "Panel_Cocheta") if R.truth(((c).fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDUpgradeScreen", "Panel_Diane")), "int")
	else:
		pass
		if R.truth((float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Garage")))):
			pass
			v_iDefaultPanel = R.coerce(R.static_value("RDUpgradeScreen", "Panel_GarageRepair"), "int")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Church")))):
				pass
				v_iDefaultPanel = R.coerce(R.static_value("RDUpgradeScreen", "Panel_Meds"), "int")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					v_iDefaultPanel = R.coerce(R.static_value("RDUpgradeScreen", "Panel_GarageUpgrade"), "int")
	R.call_member(c, "SetUpgradePanel", [v_iDefaultPanel])
	R.call_member(c, "UpdateRP", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "RP"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "NotEnoughRP"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EditorMode"), "visible", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EditorMode"), "mouseChildren", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EditorMode"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LeaveButton"), "visible", (float(v_iType) != float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ContinueButton"), "visible", (float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "visible", (float(v_iType) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "UpgradeTutorial"), "visible", R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenUpgradeTabs")), "=")
	return null

static func f_SetUpgradePanel(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bStartUp: Variant = false
	var v_bDiane: Variant = false
	var v_bCocheta: Variant = false
	var v_bHummer: Variant = false
	var v_bGarageRepair: Variant = false
	var v_bGarageUpgrade: Variant = false
	var v_bMeds: Variant = false
	var v_bPerks: Variant = false
	var v_bCanHaveBumper: Variant = false
	var v_bHasWeapon3: Variant = false
	var v_bHasWeapon4: Variant = false
	var v_bCanHaveMountedMG: Variant = false
	var v_bCanHaveRocketLauncher: Variant = false
	var v_iPanel: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bResetHighlight: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	(c).fields["m_iPanel"] = R.coerce(v_iPanel, "int")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bStartUp = (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))
	v_bDiane = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Diane")))
	v_bCocheta = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Cocheta")))
	v_bHummer = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Hummer")))
	v_bGarageRepair = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_GarageRepair")))
	v_bGarageUpgrade = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_GarageUpgrade")))
	v_bMeds = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Meds")))
	v_bPerks = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Perks")))
	v_bCanHaveBumper = (float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken2MinHP")))
	R.set_value(R.get_value((c).fields.get("m_MC"), "Cocheta"), "visible", ((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate"))) or (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation")))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Diane"), "visible", ((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate"))) or (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation")))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Hummer"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Perks"), "visible", (((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Church"))) or (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation")))) or (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Garage")))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Meds"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Church"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GarageRepair"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Garage"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GarageUpgrade"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_Garage"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Underline1"), "visible", (R.unary("!", v_bStartUp) and (v_bCocheta or v_bGarageRepair)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Underline2"), "visible", (R.unary("!", v_bStartUp) and ((v_bDiane or v_bMeds) or v_bGarageUpgrade)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Underline3"), "visible", (R.unary("!", v_bStartUp) and (v_bHummer or v_bPerks)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Vehicle"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StartUpMeds"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StartUpPerks"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeapons"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeapons"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "HummerWeapons"), "visible", (float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "VehicleUnderline"), "visible", (v_bStartUp and v_bGarageUpgrade), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StartUpMedsUnderline"), "visible", (v_bStartUp and v_bMeds), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StartUpPerksUnderline"), "visible", (v_bStartUp and v_bPerks), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponsUnderline"), "visible", (v_bStartUp and v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponsUnderline"), "visible", (v_bStartUp and v_bDiane), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "HummerWeaponsUnderline"), "visible", (v_bStartUp and v_bHummer), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel1"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel2"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel3"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel4"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel1"), "text", "Pistol", "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel2"), "text", ("Shotgun" if R.truth(v_bDiane) else "Assault SMG"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel3"), "text", ("Compact SMG" if R.truth(v_bDiane) else "Auto Shotgun"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponLabel4"), "text", ("Assault Rifle" if R.truth(v_bDiane) else "LMG"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Pistol"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Shotgun"), "visible", v_bDiane, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MAC11"), "visible", v_bDiane, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "M16"), "visible", v_bDiane, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MP5"), "visible", v_bCocheta, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "SPAS12"), "visible", v_bCocheta, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "M60"), "visible", v_bCocheta, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage1"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage1"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage1"), "Damage", "", (((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"), "Accuracy", "", (((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"), "Capacity", "", (((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage2"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage2"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage2"), "Damage", "", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"), "Accuracy", "", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"), "Capacity", "", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")), v_bResetHighlight])
	v_bHasWeapon3 = R.coerce((((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage3"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"), "visible", ((v_bDiane or v_bCocheta) and v_bHasWeapon3), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"), "visible", ((v_bDiane or v_bCocheta) and v_bHasWeapon3), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage3"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MAC11"), "mouseEnabled", (R.unary("!", v_bHasWeapon3) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "SPAS12"), "mouseEnabled", (R.unary("!", v_bHasWeapon3) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage3"), ("Damage" if R.truth(v_bHasWeapon3) else ""), ("" if R.truth(v_bHasWeapon3) else "Acquire Weapon"), (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"), "Accuracy", "", (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"), "Capacity", "", (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")), v_bResetHighlight])
	v_bHasWeapon4 = R.coerce((((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage4"), "visible", (v_bDiane or v_bCocheta), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"), "visible", ((v_bDiane or v_bCocheta) and v_bHasWeapon4), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"), "visible", ((v_bDiane or v_bCocheta) and v_bHasWeapon4), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponDamage4"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "M16"), "mouseEnabled", (R.unary("!", v_bHasWeapon4) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "M60"), "mouseEnabled", (R.unary("!", v_bHasWeapon4) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage4"), ("Damage" if R.truth(v_bHasWeapon4) else ""), ("" if R.truth(v_bHasWeapon4) else "Acquire Weapon"), (((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"), "Accuracy", "", (((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"), "Capacity", "", (((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "Replenish"), "visible", R.logical_and(R.logical_and((v_bDiane or v_bCocheta), func(): return R.call_member((c).fields.get("m_GameMode"), "ReplenishEnabled", [])), func(): return R.unary("!", v_bStartUp)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ReplenishSlot"), "visible", R.logical_and(R.logical_and((v_bDiane or v_bCocheta), func(): return R.call_member((c).fields.get("m_GameMode"), "ReplenishEnabled", [])), func(): return R.unary("!", v_bStartUp)), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "ReplenishSlot"), "", "Replenish Ammo", 0, v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ReplenishCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ReplenishCostLabel"), "mouseEnabled", false, "=")
	v_bCanHaveMountedMG = (R.unary("!", ((v_info).fields.get("m_MountedMG")).fields.get("m_bUnlocked")) or (float(((v_info).fields.get("m_MountedMG")).fields.get("m_iAmmoInMag")) < float(((((c).fields.get("m_GameMode")).fields.get("m_Player")).fields.get("m_WeaponMountedMG")).fields.get("m_iMagSize"))))
	v_bCanHaveRocketLauncher = (R.unary("!", ((v_info).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked")) or (float(((v_info).fields.get("m_RocketLauncher")).fields.get("m_iAmmoInMag")) < float(((((c).fields.get("m_GameMode")).fields.get("m_Player")).fields.get("m_WeaponRocketLauncher")).fields.get("m_iMagSize"))))
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGLabel"), "visible", v_bHummer, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherLabel"), "visible", v_bHummer, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGInstalled"), "visible", (v_bHummer and R.unary("!", v_bCanHaveMountedMG)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMG"), "mouseEnabled", v_bCanHaveMountedMG, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGSlot"), "mouseEnabled", v_bCanHaveMountedMG, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherInstalled"), "visible", (v_bHummer and R.unary("!", v_bCanHaveRocketLauncher)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncher"), "mouseEnabled", v_bCanHaveRocketLauncher, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot"), "mouseEnabled", v_bCanHaveRocketLauncher, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMG"), "visible", v_bHummer, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncher"), "visible", v_bHummer, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGSlot"), "visible", v_bHummer, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot"), "visible", v_bHummer, "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MountedMGSlot"), "", "Install Weapon", 0, v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot"), "", "Install Weapon", 0, v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Bumper"), "alpha", (1 if R.truth(v_bCanHaveBumper) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperSlot"), "alpha", (1 if R.truth(v_bCanHaveBumper) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Bumper"), "mouseEnabled", v_bCanHaveBumper, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperSlot"), "mouseEnabled", v_bCanHaveBumper, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TireLabel"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EngineLabel"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperLabel"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Tire"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Engine"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Bumper"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TireSlot"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EngineSlot"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperSlot"), "visible", v_bGarageUpgrade, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Tire"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Engine"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Bumper"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TireSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EngineSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "TireSlot"), "Upgrade Tires", "", (v_info).fields.get("m_iTiresLevel"), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "EngineSlot"), "Upgrade Engine", "", (v_info).fields.get("m_iEngineLevel"), v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "BumperSlot"), "Upgrade Bumper", "", (v_info).fields.get("m_iBumperLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "TireCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EngineCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TireCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "EngineCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BumperCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumper"), "alpha", (1 if R.truth((v_bCanHaveBumper and (float((v_info).fields.get("m_iBumperLevel")) > float(0)))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "alpha", (1 if R.truth((v_bCanHaveBumper and (float((v_info).fields.get("m_iBumperLevel")) > float(0)))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumper"), "mouseEnabled", (v_bCanHaveBumper and (float((v_info).fields.get("m_iBumperLevel")) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "mouseEnabled", (v_bCanHaveBumper and (float((v_info).fields.get("m_iBumperLevel")) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireLabel"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineLabel"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperLabel"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTire"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngine"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumper"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireSlot"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineSlot"), "visible", v_bGarageRepair, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "visible", v_bGarageRepair, "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairTireSlot"), "", "Repair Tires", 0, v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairEngineSlot"), "", "Repair Engine", 0, v_bResetHighlight])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "", "Repair Bumper", 0, v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTire"), "alpha", (1 if R.truth((float((v_info).fields.get("m_fNbBlownTires")) > float(0))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngine"), "alpha", (1 if R.truth((float((v_info).fields.get("m_fBumperHP")) < float(100))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumper"), "alpha", (1 if R.truth((((float((v_info).fields.get("m_fBumperAddonHP")) < float(100)) and v_bCanHaveBumper) and (float((v_info).fields.get("m_iBumperLevel")) > float(0)))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireSlot"), "alpha", (1 if R.truth((float((v_info).fields.get("m_fNbBlownTires")) > float(0))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineSlot"), "alpha", (1 if R.truth((float((v_info).fields.get("m_fBumperHP")) < float(100))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "alpha", (1 if R.truth((((float((v_info).fields.get("m_fBumperAddonHP")) < float(100)) and v_bCanHaveBumper) and (float((v_info).fields.get("m_iBumperLevel")) > float(0)))) else 0.25), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTire"), "mouseEnabled", (float((v_info).fields.get("m_fNbBlownTires")) > float(0)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngine"), "mouseEnabled", (float((v_info).fields.get("m_fBumperHP")) < float(100)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumper"), "mouseEnabled", (((float((v_info).fields.get("m_fBumperAddonHP")) < float(100)) and v_bCanHaveBumper) and (float((v_info).fields.get("m_iBumperLevel")) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireSlot"), "mouseEnabled", (float((v_info).fields.get("m_fNbBlownTires")) > float(0)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineSlot"), "mouseEnabled", (float((v_info).fields.get("m_fBumperHP")) < float(100)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), "mouseEnabled", (((float((v_info).fields.get("m_fBumperAddonHP")) < float(100)) and v_bCanHaveBumper) and (float((v_info).fields.get("m_iBumperLevel")) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineNotice"), "visible", ((v_bGarageUpgrade or v_bGarageRepair) and R.unary("!", v_bCanHaveBumper)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldLabel"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShield"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldSlot"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShield"), "mouseEnabled", (float((v_info).fields.get("m_iMedShields")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldSlot"), "mouseEnabled", (float((v_info).fields.get("m_iMedShields")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel"))), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MedShieldSlot"), "Acquire", "", (v_info).fields.get("m_iMedShields"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealLabel"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHeal"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealSlot"), "visible", v_bMeds, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHeal"), "mouseEnabled", (float((v_info).fields.get("m_iMedHeals")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealSlot"), "mouseEnabled", (float((v_info).fields.get("m_iMedHeals")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel"))), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MedHealSlot"), "Acquire", "", (v_info).fields.get("m_iMedHeals"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupport"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupport"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot"), "visible", v_bPerks, "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot"), "Upgrade", "", (v_info).fields.get("m_iChopperSupportLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickup"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickup"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot"), "Upgrade", "", (v_info).fields.get("m_iAmmoPickupLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCost"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostSlot"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCost"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "LowerCostSlot"), "Upgrade", "", (v_info).fields.get("m_iLowerCostLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitch"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitch"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot"), "Upgrade", "", (v_info).fields.get("m_iDriverSwitchLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeed"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeed"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot"), "Upgrade", "", (v_info).fields.get("m_iTaskSpeedLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedCostLabel"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpLabel"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUp"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpSlot"), "visible", v_bPerks, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUp"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpSlot"), "mouseEnabled", R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "LevelUpSlot"), "Upgrade", "", (v_info).fields.get("m_iLevelUpLevel"), v_bResetHighlight])
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpCostLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpCostLabel"), "mouseEnabled", false, "=")
	return null

static func f_SetupUpgradeSlot(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_szLeftName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_szCenterName: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_iLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_bResetHighlight: Variant = R.coerce((a[4] if a.size() > 4 else true), "Boolean")
	R.set_value(R.get_value(v_slotMC, "LeftName"), "text", v_szLeftName, "=")
	R.set_value(R.get_value(v_slotMC, "CenterName"), "text", v_szCenterName, "=")
	R.set_value(R.get_value(v_slotMC, "Bars"), "visible", (R.binary("!=", v_szLeftName, "") and R.binary(">", R.get_value(v_szLeftName, "length"), 0)), "=")
	if R.truth(v_bResetHighlight):
		pass
		R.call_member(c, "HighlightUpgradeSlot", [v_slotMC, false, v_iLevel])
	return null

static func f_HighlightUpgradeSlot(c: Variant, a: Array) -> Variant:
	var v_newTextFormat: Variant = null
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_newTextFormat = R.coerce(null, "TextFormat")
	if R.truth(R.get_value(R.get_value(v_slotMC, "Bars"), "visible")):
		pass
		if R.truth(v_bHighlight):
			pass
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar1"), "gotoAndStop"), [(2 if R.truth((float((float(v_iLevel) + float(1))) == float(1))) else (3 if R.truth((float(v_iLevel) >= float(1))) else 1))])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar2"), "gotoAndStop"), [(2 if R.truth((float((float(v_iLevel) + float(1))) == float(2))) else (3 if R.truth((float(v_iLevel) >= float(2))) else 1))])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar3"), "gotoAndStop"), [(2 if R.truth((float((float(v_iLevel) + float(1))) == float(3))) else (3 if R.truth((float(v_iLevel) >= float(3))) else 1))])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar4"), "gotoAndStop"), [(2 if R.truth((float((float(v_iLevel) + float(1))) == float(4))) else (3 if R.truth((float(v_iLevel) >= float(4))) else 1))])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar5"), "gotoAndStop"), [(2 if R.truth((float((float(v_iLevel) + float(1))) == float(5))) else (3 if R.truth((float(v_iLevel) >= float(5))) else 1))])
		else:
			pass
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar1"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(1))) else 1)])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar2"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(2))) else 1)])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar3"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(3))) else 1)])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar4"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(4))) else 1)])
			R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar5"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(5))) else 1)])
	if R.truth((float(v_iLevel) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
		pass
		v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
		R.set_value(v_newTextFormat, "color", ("0xFFFFFF" if R.truth(v_bHighlight) else "0xCCCCCC"), "=")
		R.invoke(R.get_value(R.get_value(v_slotMC, "LeftName"), "setTextFormat"), [v_newTextFormat])
		R.invoke(R.get_value(R.get_value(v_slotMC, "CenterName"), "setTextFormat"), [v_newTextFormat])
		R.set_value(R.get_value(v_slotMC, "BG"), "alpha", (0.8 if R.truth(v_bHighlight) else 0.6), "=")
	return null

static func f_Hide(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetToolTip", ["", null])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_MC")])
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LeaveButton"))):
		pass
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
		R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ContinueButton"))):
			pass
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
			R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
			R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "CheckPostUpgradeAchievements", [])
			R.call_member((c).fields.get("m_GameMode"), "OnPostStartUpUpgradeScreen", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BackButton"))):
				pass
				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
				R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
				R.call_member((c).fields.get("m_Game"), "StartGameMode", [((c).fields.get("m_Game")).fields.get("m_GameModeDriverSelection")])
				R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "CheckPostUpgradeAchievements", [])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Cocheta"))):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Cocheta")])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Diane"))):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Diane")])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Hummer"))):
							pass
							R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
							if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate")))):
								pass
								R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Hummer")])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "GarageRepair"))):
								pass
								R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
								R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_GarageRepair")])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "GarageUpgrade"))):
									pass
									R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
									R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_GarageUpgrade")])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Meds"))):
										pass
										R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
										R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Meds")])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Perks"))):
											pass
											R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
											R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Perks")])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "UpgradeTutorial"), "OKButton"))):
												pass
												R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
												(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenUpgradeTabs"] = true
												R.set_value(R.get_value((c).fields.get("m_MC"), "UpgradeTutorial"), "visible", false, "=")
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Vehicle"))):
													pass
													R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
													R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_GarageUpgrade")])
												else:
													pass
													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "StartUpMeds"))):
														pass
														R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
														R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Meds")])
													else:
														pass
														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "StartUpPerks"))):
															pass
															R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
															R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Perks")])
														else:
															pass
															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaWeapons"))):
																pass
																R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Cocheta")])
															else:
																pass
																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeWeapons"))):
																	pass
																	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																	R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Diane")])
																else:
																	pass
																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "HummerWeapons"))):
																		pass
																		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																		R.call_member(c, "SetUpgradePanel", [R.static_value("RDUpgradeScreen", "Panel_Hummer")])
																	else:
																		pass
																		R.call_member(c, "TryUpgradeSlots", [v_event])
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "HighlightSlots", [v_event, true])
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "HighlightSlots", [v_event, false])
	return null

static func f_GetSlotCost(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bDiane: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bDiane = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Diane")))
	if R.truth(((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return 0
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage1"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage2"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage3"))):
		pass
		if R.truth((((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"))):
			pass
			return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")), "int"))
		return (R.coerce(R.static_value("RDUnlockData", "DianeMAC11Cost"), "int") if R.truth(v_bDiane) else R.coerce(R.static_value("RDUnlockData", "CochetaSPAS12Cost"), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage4"))):
		pass
		if R.truth((((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"))):
			pass
			return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")), "int"))
		return (R.coerce(R.static_value("RDUnlockData", "DianeM16Cost"), "int") if R.truth(v_bDiane) else R.coerce(R.static_value("RDUnlockData", "CochetaM60Cost"), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")), "int"))
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"))):
		pass
		return (R.coerce(R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel")), "int") if R.truth(v_bDiane) else R.coerce(R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")), "int"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ReplenishSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Replenish")))):
		pass
		return R.static_value("RDUnlockData", "ReplenishCost")
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMGSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMG")))):
		pass
		return R.static_value("RDUnlockData", "MountedMGCost")
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncher")))):
		pass
		return R.static_value("RDUnlockData", "RocketLauncherCost")
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Tire")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "TireCosts"), (v_info).fields.get("m_iTiresLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "EngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Engine")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "EngineCosts"), (v_info).fields.get("m_iEngineLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Bumper")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "BumperCosts"), (v_info).fields.get("m_iBumperLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTire")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "RepairTireCosts"), (v_info).fields.get("m_iTiresLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngine")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "RepairEngineCosts"), (v_info).fields.get("m_iEngineLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumper")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "RepairBumperCosts"), (v_info).fields.get("m_iBumperLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShieldSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShield")))):
		pass
		return R.static_value("RDUnlockData", "MedShieldCost")
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHealSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHeal")))):
		pass
		return R.static_value("RDUnlockData", "MedHealCost")
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupport")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "ChopperSupportCost"), (v_info).fields.get("m_iChopperSupportLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickup")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "AmmoPickupCost"), (v_info).fields.get("m_iAmmoPickupLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCostSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCost")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "LowerCostCost"), (v_info).fields.get("m_iLowerCostLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitch")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "DriverSwitchCost"), (v_info).fields.get("m_iDriverSwitchLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeed")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "TaskSpeedCost"), (v_info).fields.get("m_iTaskSpeedLevel"))
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUpSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUp")))):
		pass
		return R.get_value(R.static_value("RDUnlockData", "LevelUpCost"), (v_info).fields.get("m_iLevelUpLevel"))
	return 0
	return null

static func f_FixNaNText(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth(R.binary("!=", R.invoke(R.get_value(v_szText, "indexOf"), ["NaN"]), R.unary("-", 1))):
		pass
		v_szText = R.coerce("", "*")
	return v_szText
	return null

static func f_HighlightSlots(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bDiane: Variant = false
	var v_fCostMultiplier: Variant = NAN
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bDiane = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Diane")))
	v_fCostMultiplier = float(R.num(R.get_value(R.static_value("RDPlayer", "CostMultipliers"), (v_info).fields.get("m_iLowerCostLevel"))))
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.unary("!", v_bHighlight)):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["", null])
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage1"))):
		pass
		R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage1"), v_bHighlight, (((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel"))])
		R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "visible", v_bHighlight, "=")
		R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
		if R.truth(v_bHighlight):
			pass
			R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"))):
			pass
			R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"), v_bHighlight, (((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel"))])
			R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "visible", v_bHighlight, "=")
			R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
			if R.truth(v_bHighlight):
				pass
				R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"))):
				pass
				R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"), v_bHighlight, (((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel"))])
				R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "visible", v_bHighlight, "=")
				R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel1"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianePistolUpgradeCosts"), ((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaPistolUpgradeCosts"), ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
				if R.truth(v_bHighlight):
					pass
					R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage2"))):
					pass
					R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage2"), v_bHighlight, (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel"))])
					R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "visible", v_bHighlight, "=")
					R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
					if R.truth(v_bHighlight):
						pass
						R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"))):
						pass
						R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"), v_bHighlight, (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel"))])
						R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "visible", v_bHighlight, "=")
						R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
						if R.truth(v_bHighlight):
							pass
							R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"))):
							pass
							R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"), v_bHighlight, (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel"))])
							R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "visible", v_bHighlight, "=")
							R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel2"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeShotgunUpgradeCosts"), ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaMP5UpgradeCosts"), ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
							if R.truth(v_bHighlight):
								pass
								R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage3"))):
								pass
								R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage3"), v_bHighlight, (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel"))])
								R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "visible", v_bHighlight, "=")
								if R.truth((((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"))):
									pass
									R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
									if R.truth(v_bHighlight):
										pass
										R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
								else:
									pass
									R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.static_value("RDUnlockData", "DianeMAC11Cost") if R.truth(v_bDiane) else R.static_value("RDUnlockData", "CochetaSPAS12Cost"))) * float(v_fCostMultiplier))]), " RP")]), "=")
									if R.truth(v_bHighlight):
										pass
										R.call_member((c).fields.get("m_Game"), "SetToolTip", [(R.static_value("RDWeaponMAC11", "Description") if R.truth(v_bDiane) else R.static_value("RDWeaponSPAS12", "Description")), v_target])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"))):
									pass
									R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"), v_bHighlight, (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel"))])
									R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "visible", v_bHighlight, "=")
									R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
									if R.truth(v_bHighlight):
										pass
										R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"))):
										pass
										R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"), v_bHighlight, (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel"))])
										R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "visible", v_bHighlight, "=")
										R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel3"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeMAC11UpgradeCosts"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaSPAS12UpgradeCosts"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
										if R.truth(v_bHighlight):
											pass
											R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage4"))):
											pass
											R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponDamage4"), v_bHighlight, (((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel"))])
											R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "visible", v_bHighlight, "=")
											if R.truth((((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"))):
												pass
												R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
												if R.truth(v_bHighlight):
													pass
													R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
											else:
												pass
												R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.static_value("RDUnlockData", "DianeM16Cost") if R.truth(v_bDiane) else R.static_value("RDUnlockData", "CochetaM60Cost"))) * float(v_fCostMultiplier))]), " RP")]), "=")
												if R.truth(v_bHighlight):
													pass
													R.call_member((c).fields.get("m_Game"), "SetToolTip", [(R.static_value("RDWeaponM16", "Description") if R.truth(v_bDiane) else R.static_value("RDWeaponM60", "Description")), v_target])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"))):
												pass
												R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"), v_bHighlight, (((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel"))])
												R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "visible", v_bHighlight, "=")
												R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
												if R.truth(v_bHighlight):
													pass
													R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"))):
													pass
													R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"), v_bHighlight, (((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel"))])
													R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "visible", v_bHighlight, "=")
													R.set_value(R.get_value((c).fields.get("m_MC"), "WeaponCostLabel4"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num((R.get_value(R.static_value("RDUnlockData", "DianeM16UpgradeCosts"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel")) if R.truth(v_bDiane) else R.get_value(R.static_value("RDUnlockData", "CochetaM60UpgradeCosts"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")))) * float(v_fCostMultiplier))]), " RP")]), "=")
													if R.truth(v_bHighlight):
														pass
														R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
												else:
													pass
													if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ReplenishSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Replenish")))):
														pass
														R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "ReplenishSlot"), v_bHighlight, 0])
														R.set_value(R.get_value((c).fields.get("m_MC"), "ReplenishCostLabel"), "visible", v_bHighlight, "=")
														R.set_value(R.get_value((c).fields.get("m_MC"), "ReplenishCostLabel"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.static_value("RDUnlockData", "ReplenishCost")) * float(v_fCostMultiplier))]), " RP"), "=")
														if R.truth(v_bHighlight):
															pass
															R.call_member((c).fields.get("m_Game"), "SetToolTip", ["This will fully replenish your ammunition for all weapons except the mounted weapon installed on your vehicle.", v_target])
													else:
														pass
														if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMGSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMG")))):
															pass
															R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MountedMGSlot"), v_bHighlight, 0])
															R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGCostLabel"), "visible", v_bHighlight, "=")
															R.set_value(R.get_value((c).fields.get("m_MC"), "MountedMGCostLabel"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.static_value("RDUnlockData", "MountedMGCost")) * float(v_fCostMultiplier))]), " RP"), "=")
															if R.truth(v_bHighlight):
																pass
																R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Fires powerful rounds that will do massive damage. Watch the heat meter or it will overheat and stop functioning until it cools off. Cannot be reloaded.", v_target])
														else:
															pass
															if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncher")))):
																pass
																R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot"), v_bHighlight, 0])
																R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherCostLabel"), "visible", v_bHighlight, "=")
																R.set_value(R.get_value((c).fields.get("m_MC"), "RocketLauncherCostLabel"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.static_value("RDUnlockData", "RocketLauncherCost")) * float(v_fCostMultiplier))]), " RP"), "=")
																if R.truth(v_bHighlight):
																	pass
																	R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Fires rockets that will blow up everything it touches.  It's the most destructive weapon in your arsenal. Cannot be reloaded.", v_target])
															else:
																pass
																if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Tire")))):
																	pass
																	R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "TireSlot"), v_bHighlight, (v_info).fields.get("m_iTiresLevel")])
																	R.set_value(R.get_value((c).fields.get("m_MC"), "TireCostLabel"), "visible", v_bHighlight, "=")
																	R.set_value(R.get_value((c).fields.get("m_MC"), "TireCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "TireCosts"), (v_info).fields.get("m_iTiresLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																	if R.truth(v_bHighlight):
																		pass
																		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Tire upgrades affect how fast you can steer in combination with the driver's driving skill, how fast you brake and how well you can handle spike strips and oil spills.", v_target])
																else:
																	pass
																	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "EngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Engine")))):
																		pass
																		R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "EngineSlot"), v_bHighlight, (v_info).fields.get("m_iEngineLevel")])
																		R.set_value(R.get_value((c).fields.get("m_MC"), "EngineCostLabel"), "visible", v_bHighlight, "=")
																		R.set_value(R.get_value((c).fields.get("m_MC"), "EngineCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "EngineCosts"), (v_info).fields.get("m_iEngineLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																		if R.truth(v_bHighlight):
																			pass
																			R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Engine upgrades affect how fast you accelerate and how much punishement the engine can take.", v_target])
																	else:
																		pass
																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Bumper")))):
																			pass
																			R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "BumperSlot"), v_bHighlight, (v_info).fields.get("m_iBumperLevel")])
																			R.set_value(R.get_value((c).fields.get("m_MC"), "BumperCostLabel"), "visible", v_bHighlight, "=")
																			R.set_value(R.get_value((c).fields.get("m_MC"), "BumperCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "BumperCosts"), (v_info).fields.get("m_iBumperLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																			if R.truth(v_bHighlight):
																				pass
																				R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Armor upgrades will add metal plating over your engine so you can handle a lot of collisions.  Better upgrades mean better protection.", v_target])
																		else:
																			pass
																			if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTire")))):
																				pass
																				R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairTireSlot"), v_bHighlight, 0])
																				R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireCostLabel"), "visible", v_bHighlight, "=")
																				R.set_value(R.get_value((c).fields.get("m_MC"), "RepairTireCostLabel"), "text", "", "=")
																				if R.truth(v_bHighlight):
																					pass
																					R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Repair your tires and handle your vehicle as if they were brand new.", v_target])
																			else:
																				pass
																				if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngine")))):
																					pass
																					R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairEngineSlot"), v_bHighlight, 0])
																					R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineCostLabel"), "visible", v_bHighlight, "=")
																					R.set_value(R.get_value((c).fields.get("m_MC"), "RepairEngineCostLabel"), "text", "", "=")
																					if R.truth(v_bHighlight):
																						pass
																						R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Repair your engine now and avoid the eminent engine explosion.  This is crucial when you want to install armor.", v_target])
																				else:
																					pass
																					if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumper")))):
																						pass
																						R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "RepairBumperSlot"), v_bHighlight, 0])
																						R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperCostLabel"), "visible", v_bHighlight, "=")
																						R.set_value(R.get_value((c).fields.get("m_MC"), "RepairBumperCostLabel"), "text", "", "=")
																						if R.truth(v_bHighlight):
																							pass
																							R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Repair your armor to maintain your protection from hard collisions.", v_target])
																					else:
																						pass
																						if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShieldSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShield")))):
																							pass
																							R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MedShieldSlot"), v_bHighlight, (v_info).fields.get("m_iMedShields")])
																							R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldCostLabel"), "visible", v_bHighlight, "=")
																							R.set_value(R.get_value((c).fields.get("m_MC"), "MedShieldCostLabel"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.static_value("RDUnlockData", "MedShieldCost")) * float(v_fCostMultiplier))]), " RP"), "=")
																							if R.truth(v_bHighlight):
																								pass
																								R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A steroid shot will make you immune to bodily damage (bullets, explosions) for a moment.  Using it wisely can be the difference between life and death.", v_target])
																						else:
																							pass
																							if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHealSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHeal")))):
																								pass
																								R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "MedHealSlot"), v_bHighlight, (v_info).fields.get("m_iMedHeals")])
																								R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealCostLabel"), "visible", v_bHighlight, "=")
																								R.set_value(R.get_value((c).fields.get("m_MC"), "MedHealCostLabel"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.static_value("RDUnlockData", "MedHealCost")) * float(v_fCostMultiplier))]), " RP"), "=")
																								if R.truth(v_bHighlight):
																									pass
																									R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A med patch will heal your wounds and let you live until the next life threatening event.  Using them at the right moment is crucial.", v_target])
																							else:
																								pass
																								if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupport")))):
																									pass
																									R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot"), v_bHighlight, (v_info).fields.get("m_iChopperSupportLevel")])
																									R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportCostLabel"), "visible", v_bHighlight, "=")
																									R.set_value(R.get_value((c).fields.get("m_MC"), "ChopperSupportCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "ChopperSupportCost"), (v_info).fields.get("m_iChopperSupportLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																									if R.truth(v_bHighlight):
																										pass
																										R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Chopper Support lets you call in a chopper to assist you for a short moment.  Not available in Story Mode, Rescue Op and F.U.B.A.R.", v_target])
																								else:
																									pass
																									if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickup")))):
																										pass
																										R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot"), v_bHighlight, (v_info).fields.get("m_iAmmoPickupLevel")])
																										R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupCostLabel"), "visible", v_bHighlight, "=")
																										R.set_value(R.get_value((c).fields.get("m_MC"), "AmmoPickupCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "AmmoPickupCost"), (v_info).fields.get("m_iAmmoPickupLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																										if R.truth(v_bHighlight):
																											pass
																											R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The Ammo Pickup perk affects how much ammo you get from ammo points like abandonned hummers and army trucks.", v_target])
																									else:
																										pass
																										if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCostSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCost")))):
																											pass
																											R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "LowerCostSlot"), v_bHighlight, (v_info).fields.get("m_iLowerCostLevel")])
																											R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostCostLabel"), "visible", v_bHighlight, "=")
																											R.set_value(R.get_value((c).fields.get("m_MC"), "LowerCostCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "LowerCostCost"), (v_info).fields.get("m_iLowerCostLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																											if R.truth(v_bHighlight):
																												pass
																												R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The Lower Cost perk does what it says, it lowers the RP costs of all the things you can purchase and upgrade.", v_target])
																										else:
																											pass
																											if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitch")))):
																												pass
																												R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot"), v_bHighlight, (v_info).fields.get("m_iDriverSwitchLevel")])
																												R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchCostLabel"), "visible", v_bHighlight, "=")
																												R.set_value(R.get_value((c).fields.get("m_MC"), "DriverSwitchCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "DriverSwitchCost"), (v_info).fields.get("m_iDriverSwitchLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																												if R.truth(v_bHighlight):
																													pass
																													R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The Driver Switch perk will affect how fast you can switch seats when you want to switch your driver and your gunner.  It's crucial to survive zombie heavy areas.", v_target])
																											else:
																												pass
																												if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeed")))):
																													pass
																													R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot"), v_bHighlight, (v_info).fields.get("m_iTaskSpeedLevel")])
																													R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedCostLabel"), "visible", v_bHighlight, "=")
																													R.set_value(R.get_value((c).fields.get("m_MC"), "TaskSpeedCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "TaskSpeedCost"), (v_info).fields.get("m_iTaskSpeedLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																													if R.truth(v_bHighlight):
																														pass
																														R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The Task Speed perk will affect how fast you perform tasks when you stop at special locations like the garages, weapon crates, police stations, etc.", v_target])
																												else:
																													pass
																													if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUpSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUp")))):
																														pass
																														R.call_member(c, "HighlightUpgradeSlot", [R.get_value((c).fields.get("m_MC"), "LevelUpSlot"), v_bHighlight, (v_info).fields.get("m_iLevelUpLevel")])
																														R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpCostLabel"), "visible", v_bHighlight, "=")
																														R.set_value(R.get_value((c).fields.get("m_MC"), "LevelUpCostLabel"), "text", R.call_member(c, "FixNaNText", [R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(R.static_value("RDUnlockData", "LevelUpCost"), (v_info).fields.get("m_iLevelUpLevel"))) * float(v_fCostMultiplier))]), " RP")]), "=")
																														if R.truth(v_bHighlight):
																															pass
																															R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The Level Up perk will make your characters level up their personal stats faster, driving skill, weapon handling, weapon reloading, etc.", v_target])
																													else:
																														pass
																														if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponLabel1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Pistol")))):
																															pass
																															if R.truth(v_bHighlight):
																																pass
																																R.call_member((c).fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponPistol", "Description"), v_target])
																														else:
																															pass
																															if R.truth(((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponLabel2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Shotgun"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MP5")))):
																																pass
																																if R.truth(v_bHighlight):
																																	pass
																																	R.call_member((c).fields.get("m_Game"), "SetToolTip", [(R.static_value("RDWeaponShotgun", "Description") if R.truth(v_bDiane) else R.static_value("RDWeaponMP5", "Description")), v_target])
																															else:
																																pass
																																if R.truth(((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponLabel3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MAC11"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "SPAS12")))):
																																	pass
																																	if R.truth(v_bHighlight):
																																		pass
																																		R.call_member((c).fields.get("m_Game"), "SetToolTip", [(R.static_value("RDWeaponMAC11", "Description") if R.truth(v_bDiane) else R.static_value("RDWeaponSPAS12", "Description")), v_target])
																																else:
																																	pass
																																	if R.truth(((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponLabel4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "M16"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "M60")))):
																																		pass
																																		if R.truth(v_bHighlight):
																																			pass
																																			R.call_member((c).fields.get("m_Game"), "SetToolTip", [(R.static_value("RDWeaponM16", "Description") if R.truth(v_bDiane) else R.static_value("RDWeaponM60", "Description")), v_target])
	return null

static func f_TryUpgradeSlots(c: Variant, a: Array) -> Variant:
	var v_bHasWeapon3: Variant = false
	var v_bHasWeapon4: Variant = false
	var v_player: Variant = null
	var v_bDiane: Variant = false
	var v_info: Variant = null
	var v_iCost: Variant = 0
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_bHasWeapon3 = false
	v_bHasWeapon4 = false
	v_player = R.coerce(((c).fields.get("m_GameMode")).fields.get("m_Player"), "RDPlayer")
	v_bDiane = (float((c).fields.get("m_iPanel")) == float(R.static_value("RDUpgradeScreen", "Panel_Diane")))
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_iCost = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.call_member(c, "GetSlotCost", [v_event])) * R.num(R.get_value(R.static_value("RDPlayer", "CostMultipliers"), (v_info).fields.get("m_iLowerCostLevel"))))]), "int")
	if R.truth((float(v_iCost) > float((v_info).fields.get("m_iRP")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "NotEnoughRP"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "NotEnoughRP"), "gotoAndPlay"), [1])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage1"))):
			pass
			if R.truth(R.binary("<", (((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")), 5)):
				pass
				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
					R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
					R.call_member(c, "HighlightSlots", [v_event, true])
				else:
					pass
					R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy1"))):
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity1"))):
					pass
					if R.truth(R.binary("<", (((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")), 5)):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
							pass
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
							R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
							R.call_member(c, "HighlightSlots", [v_event, true])
						else:
							pass
							R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponPistolDiane") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponPistolCocheta")), v_iCost])
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage2"))):
			pass
			if R.truth(R.binary("<", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")), 5)):
				pass
				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
					R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
					R.call_member(c, "HighlightSlots", [v_event, true])
				else:
					pass
					R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy2"))):
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity2"))):
					pass
					if R.truth(R.binary("<", (((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")), 5)):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
							pass
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
							R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
							R.call_member(c, "HighlightSlots", [v_event, true])
						else:
							pass
							R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponShotgun") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponMP5")), v_iCost])
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage3"))):
			pass
			v_bHasWeapon3 = R.coerce((((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")), "Boolean")
			if R.truth(R.unary("!", v_bHasWeapon3)):
				pass
				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UnlockWeapon"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
					R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
					R.call_member(c, "HighlightSlots", [v_event, true])
				else:
					pass
					R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UnlockWeapon"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
			else:
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy3"))):
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity3"))):
					pass
					if R.truth(R.binary("<", (((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")), 5)):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
							pass
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
							R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
							R.call_member(c, "HighlightSlots", [v_event, true])
						else:
							pass
							R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponMAC11") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponSPAS12")), v_iCost])
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponDamage4"))):
			pass
			v_bHasWeapon4 = R.coerce((((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")), "Boolean")
			if R.truth(R.unary("!", v_bHasWeapon4)):
				pass
				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
					pass
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UnlockWeapon"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
					R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
					R.call_member(c, "HighlightSlots", [v_event, true])
				else:
					pass
					R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UnlockWeapon"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
			else:
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponAccuracy4"))):
				pass
				if R.truth(R.binary("<", (((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")), 5)):
					pass
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
						pass
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
						R.call_member(c, "HighlightSlots", [v_event, true])
					else:
						pass
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "WeaponCapacity4"))):
					pass
					if R.truth(R.binary("<", (((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel") if R.truth(v_bDiane) else ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")), 5)):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
							pass
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
							R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
							R.call_member(c, "HighlightSlots", [v_event, true])
						else:
							pass
							R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartWeaponUpgradeTask", [R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"), ((v_player).fields.get("m_WeaponM16") if R.truth(v_bDiane) else (v_player).fields.get("m_WeaponM60")), v_iCost])
				else:
					pass
					if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ReplenishSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Replenish")))):
						pass
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_ReplenishAmmo"), true, v_iCost])
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMGSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MountedMG")))):
							pass
							R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
							if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
								pass
								R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_MountedMG"), v_iCost])
								R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
								R.call_member(c, "HighlightSlots", [v_event, true])
							else:
								pass
								R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
								R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_MountedMG"), true, v_iCost])
						else:
							pass
							if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncherSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RocketLauncher")))):
								pass
								R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
								if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
									pass
									R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_RocketLauncher"), v_iCost])
									R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
									R.call_member(c, "HighlightSlots", [v_event, true])
								else:
									pass
									R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
									R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_RocketLauncher"), true, v_iCost])
							else:
								pass
								if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Tire")))):
									pass
									if R.truth((float((v_info).fields.get("m_iTiresLevel")) < float(5))):
										pass
										R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
										if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
											pass
											R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_Tire"), v_iCost])
											R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
											R.call_member(c, "HighlightSlots", [v_event, true])
										else:
											pass
											R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
											R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_Tire"), true, v_iCost])
								else:
									pass
									if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "EngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Engine")))):
										pass
										if R.truth((float((v_info).fields.get("m_iEngineLevel")) < float(5))):
											pass
											R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
											if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
												pass
												R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_Engine"), v_iCost])
												R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
												R.call_member(c, "HighlightSlots", [v_event, true])
											else:
												pass
												R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
												R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_Engine"), true, v_iCost])
									else:
										pass
										if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Bumper")))):
											pass
											if R.truth((float((v_info).fields.get("m_iBumperLevel")) < float(5))):
												pass
												R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
												if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
													pass
													R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_Bumper"), v_iCost])
													R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
													R.call_member(c, "HighlightSlots", [v_event, true])
												else:
													pass
													R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
													R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_Bumper"), true, v_iCost])
										else:
											pass
											if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTireSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairTire")))):
												pass
												R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
												R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
												R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_RepairTire"), true, v_iCost])
											else:
												pass
												if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngineSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairEngine")))):
													pass
													R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
													R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
													R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_RepairEngine"), true, v_iCost])
												else:
													pass
													if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumperSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "RepairBumper")))):
														pass
														R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
														R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
														R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_RepairBumper"), true, v_iCost])
													else:
														pass
														if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShieldSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedShield")))):
															pass
															if R.truth(R.binary("<", R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "GetNbMedShields", []), R.static_value("RDPlayer", "MaxUpgradeLevel"))):
																pass
																R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																	pass
																	R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_MedShield"), v_iCost])
																	R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																	R.call_member(c, "HighlightSlots", [v_event, true])
																else:
																	pass
																	R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																	R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_MedShield"), true, v_iCost])
														else:
															pass
															if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHealSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MedHeal")))):
																pass
																if R.truth(R.binary("<", R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "GetNbMedHeals", []), R.static_value("RDPlayer", "MaxUpgradeLevel"))):
																	pass
																	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																	if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																		pass
																		R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_MedHeal"), v_iCost])
																		R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																		R.call_member(c, "HighlightSlots", [v_event, true])
																	else:
																		pass
																		R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																		R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_MedHeal"), true, v_iCost])
															else:
																pass
																if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupportSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ChopperSupport")))):
																	pass
																	if R.truth((float((v_info).fields.get("m_iChopperSupportLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																		pass
																		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																		if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																			pass
																			R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_ChopperSupport"), v_iCost])
																			R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																			R.call_member(c, "HighlightSlots", [v_event, true])
																		else:
																			pass
																			R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																			R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_ChopperSupport"), true, v_iCost])
																else:
																	pass
																	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickupSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "AmmoPickup")))):
																		pass
																		if R.truth((float((v_info).fields.get("m_iAmmoPickupLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																			pass
																			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																			if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																				pass
																				R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_AmmoPickup"), v_iCost])
																				R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																				R.call_member(c, "HighlightSlots", [v_event, true])
																			else:
																				pass
																				R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																				R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_AmmoPickup"), true, v_iCost])
																	else:
																		pass
																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCostSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LowerCost")))):
																			pass
																			if R.truth((float((v_info).fields.get("m_iLowerCostLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																				pass
																				R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																				if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																					pass
																					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_LowerCost"), v_iCost])
																					R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																					R.call_member(c, "HighlightSlots", [v_event, true])
																				else:
																					pass
																					R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_LowerCost"), true, v_iCost])
																		else:
																			pass
																			if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitchSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DriverSwitch")))):
																				pass
																				if R.truth((float((v_info).fields.get("m_iDriverSwitchLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																					pass
																					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																					if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																						pass
																						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_DriverSwitch"), v_iCost])
																						R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																						R.call_member(c, "HighlightSlots", [v_event, true])
																					else:
																						pass
																						R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_DriverSwitch"), true, v_iCost])
																			else:
																				pass
																				if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeedSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "TaskSpeed")))):
																					pass
																					if R.truth((float((v_info).fields.get("m_iTaskSpeedLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																						pass
																						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																						if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																							pass
																							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_TaskSpeed"), v_iCost])
																							R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																							R.call_member(c, "HighlightSlots", [v_event, true])
																						else:
																							pass
																							R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																							R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_TaskSpeed"), true, v_iCost])
																				else:
																					pass
																					if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUpSlot")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "LevelUp")))):
																						pass
																						if R.truth((float((v_info).fields.get("m_iLevelUpLevel")) < float(R.static_value("RDPlayer", "MaxUpgradeLevel")))):
																							pass
																							R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_ButtonSound"), "Play", [])
																							if R.truth((float((c).fields.get("m_iUpgradeType")) == float(R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")))):
																								pass
																								R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "DoTask", [R.static_value("RDPlayer", "Task_LevelUp"), v_iCost])
																								R.call_member(c, "SetUpgradePanel", [(c).fields.get("m_iPanel"), false])
																								R.call_member(c, "HighlightSlots", [v_event, true])
																							else:
																								pass
																								R.call_member((c).fields.get("m_GameMode"), "HideUpgradeScreen", [])
																								R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_LevelUp"), true, v_iCost])
	R.call_member(c, "UpdateRP", [])
	return null

static func f_UpdateRP(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "RP"), "text", ("" if R.truth(((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")) else R.binary("+", floorf(float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRP"))), " RP")), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "UpgradeType_WeaponCrate", 0, "=")
	R.set_value(c, "UpgradeType_Garage", 1, "=")
	R.set_value(c, "UpgradeType_Church", 2, "=")
	R.set_value(c, "UpgradeType_PoliceStation", 3, "=")
	R.set_value(c, "UpgradeType_StartUp", 4, "=")
	R.set_value(c, "Panel_Cocheta", 0, "=")
	R.set_value(c, "Panel_Diane", 1, "=")
	R.set_value(c, "Panel_Hummer", 2, "=")
	R.set_value(c, "Panel_GarageUpgrade", 3, "=")
	R.set_value(c, "Panel_Meds", 4, "=")
	R.set_value(c, "Panel_Perks", 5, "=")
	R.set_value(c, "Panel_GarageRepair", 6, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_GameMode"] = R.coerce(null, "RDGameModeGameplay")
	(c).fields["m_Game"] = R.coerce(null, "RDGame")
	(c).fields["m_MC"] = R.coerce(null, "MovieClip")
	(c).fields["m_iUpgradeType"] = R.coerce(0, "int")
	(c).fields["m_iPanel"] = R.coerce(0, "int")
	return null
