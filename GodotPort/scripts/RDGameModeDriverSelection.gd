extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeDriverSelection(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeDriverSelection"), [v_theGame])
	(c).fields["m_MC"] = R.coerce(R.construct(R.klass("MC_DriverSelectionScreen"), []), "MovieClip")
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "BG")])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "mouseChildren", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "mouseChildren", false, "=")
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4")])
	R.call_member(c, "SetupMCAsButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4")])
	(c).fields["m_fBaseMenuButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "x"), "Number")
	(c).fields["m_fBaseBackButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "x"), "Number")
	(c).fields["m_fBaseDianeWeaponStatsButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), "y"), "Number")
	(c).fields["m_fBaseCochetaWeaponStatsButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), "y"), "Number")
	(c).fields["m_fBaseDianeButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "y"), "Number")
	(c).fields["m_fBaseCochetaButtonPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "y"), "Number")
	(c).fields["m_fBaseDianeStatsPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "x"), "Number")
	(c).fields["m_fBaseCochetaStatsPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "x"), "Number")
	(c).fields["m_fBaseDrivingLabelPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "DrivingLabel"), "y"), "Number")
	(c).fields["m_fBaseGunnerLabelPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "GunnerLabel"), "y"), "Number")
	(c).fields["m_fBaseStoryProgressPos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "x"), "Number")
	(c).fields["m_fBaseSwitchVehiclePos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), "x"), "Number")
	(c).fields["m_FlySound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_FlySound"), "SetMaxVolume", [0.5])
	return null

static func f_SetupMCAsButton(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.set_value(v_mc, "mouseChildren", false, "=")
	R.set_value(v_mc, "buttonMode", true, "=")
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	var v_bChopperMode: Variant = false
	var v_newFilters: Variant = null
	v_iRandom = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "BeginGameMode"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "OnStartDriverSelection", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [(c).fields.get("m_MC")])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [1])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", true, "=")
	v_bChopperMode = R.coerce(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", []), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DrivingLabel"), "visible", R.unary("!", v_bChopperMode), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GunnerLabel"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "visible", R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "HasStoryProgress", []), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "Progress"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fStoryProgress")) * float(100))]), "%"), "=")
	(c).fields["m_bSelectionDone"] = false
	(c).fields["m_fDoneTalkingTimer"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "x", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "y", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "scaleX", 1, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "scaleY", 1, "=")
	R.call_member(c, "UpdateVehicle", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), "visible", true, "=")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bShowWeaponStatsButton"] = true
	R.set_value(R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), "visible", (((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bJohnEndingSeen") and R.unary("!", v_bChopperMode)), "=")
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	(c).fields["m_bDianeWeaponStats"] = false
	(c).fields["m_bCochetaWeaponStats"] = false
	(c).fields["m_fContentBrightness"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "x", (c).fields.get("m_fBaseMenuButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "x", (c).fields.get("m_fBaseBackButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), "x", (c).fields.get("m_fBaseSwitchVehiclePos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), "y", (c).fields.get("m_fBaseDianeWeaponStatsButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), "y", (c).fields.get("m_fBaseCochetaWeaponStatsButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "y", (c).fields.get("m_fBaseDianeButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "y", (c).fields.get("m_fBaseCochetaButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "x", (c).fields.get("m_fBaseDianeStatsPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "x", (c).fields.get("m_fBaseCochetaStatsPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DrivingLabel"), "y", (c).fields.get("m_fBaseDrivingLabelPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GunnerLabel"), "y", (c).fields.get("m_fBaseGunnerLabelPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "x", (c).fields.get("m_fBaseStoryProgressPos"), "=")
	v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "visible", false, "=")
	R.call_member(c, "InitStats", [])
	if R.truth((v_bChopperMode and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic")))):
		pass
		R.call_member((c).fields.get("m_FlySound"), "Play", [true])
	if R.truth((float((c.fields.get("m_Game")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MothersDay")))):
		pass
		(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaMothersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
		(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeMothersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
	else:
		pass
		if R.truth((float((c.fields.get("m_Game")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_FathersDay")))):
			pass
			(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaFathersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
			(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeFathersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
		else:
			pass
			if R.truth(v_bChopperMode):
				pass
				(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaChopperSwitch"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
				(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeChopperShooting"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
			else:
				pass
				v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [3]), "int")
				if R.truth((float(v_iRandom) == float(0))):
					pass
					(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
					(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
				else:
					pass
					if R.truth((float(v_iRandom) == float(1))):
						pass
						(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
						(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
					else:
						pass
						if R.truth((float(v_iRandom) == float(2))):
							pass
							(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
							(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
	R.set_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "visible", false, "=")
	if R.truth((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bJohnEndingSeen") and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenJohnCarNotice")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "gotoAndPlay"), [1])
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenJohnCarNotice"] = true
		R.call_member(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_TutorialSound"), "Play", [])
	return null

static func f_UpdateVehicle(c: Variant, a: Array) -> Variant:
	var v_bChopperMode: Variant = false
	v_bChopperMode = R.coerce(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", []), "Boolean")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Hummer"), "visible", (R.unary("!", v_bChopperMode) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Chopper"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "ChopperBladeShadow"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Car"), "visible", (R.unary("!", v_bChopperMode) and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	return null

static func f_UpdateDianeMouth(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	var v_fDataVolume: Variant = NAN
	var v_fVolumeRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iFrame = R.coerce(0, "int")
	v_fDataVolume = float(NAN)
	v_fVolumeRatio = float(NAN)
	v_iFrame = R.coerce(1, "int")
	if R.truth(R.call_member((c).fields.get("m_DianeDrivingVoice"), "IsPlaying", [])):
		pass
		v_fDataVolume = R.coerce(R.call_member((c).fields.get("m_DianeDrivingVoice"), "GetDataVolume", []), "Number")
		v_fVolumeRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float(v_fDataVolume) - float(0.1)), 0.1), 0, 1]), "Number")
		v_iFrame = R.coerce((float(1) + float(ceilf(float((float(v_fVolumeRatio) * float(20)))))), "int")
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [v_iFrame])
	else:
		pass
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [1])
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "EndGameMode"), [])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_MC")])
	R.call_member((c).fields.get("m_FlySound"), "Stop", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_color: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "Update"), [v_fDeltaTime])
	if R.truth((((c).fields.get("m_bSelectionDone") and R.unary("!", R.call_member((c).fields.get("m_CochetaDrivingVoice"), "IsPlaying", []))) and R.unary("!", R.call_member((c).fields.get("m_DianeDrivingVoice"), "IsPlaying", [])))):
		pass
		(c).fields["m_fDoneTalkingTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDoneTalkingTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fDoneTalkingTimer")) >= float(0.5))):
			pass
			((c.fields.get("m_Game")).fields.get("m_ActiveMode")).fields["m_bDoStartGameMode"] = true
			R.call_member(c.fields.get("m_Game"), "StartGameMode", [(c.fields.get("m_Game")).fields.get("m_ActiveMode")])
	if R.truth(((c).fields.get("m_bDianeWeaponStats") or (c).fields.get("m_bCochetaWeaponStats"))):
		pass
		(c).fields["m_fContentBrightness"] = float(maxf(float((float((c).fields.get("m_fContentBrightness")) - float((float(0.4) * float(v_fDeltaTime))))), R.num(R.unary("-", 0.2))))
	else:
		pass
		(c).fields["m_fContentBrightness"] = float(minf(float((float((c).fields.get("m_fContentBrightness")) + float((float(0.4) * float(v_fDeltaTime))))), float(0)))
	v_color = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
	R.set_value(v_color, "brightness", (c).fields.get("m_fContentBrightness"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "transform"), "colorTransform", v_color, "=")
	R.call_member(c, "UpdateDianeMouth", [v_fDeltaTime])
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_newFilters: Variant = null
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_newFilters = R.coerce(null, "Array")
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeDriverSelection"), [12255232, 0.7])])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
			pass
			v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
			R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeDriverSelection"), [12255232, 0.7])])
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
		else:
			pass
			if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving")))):
				pass
				R.call_member(c.fields.get("m_Game"), "SetToolTip", ["The Driving skill levels up as you play and affects how well you can steer in combination with your tires.", v_target])
			else:
				pass
				if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness")))):
					pass
					R.call_member(c.fields.get("m_Game"), "SetToolTip", ["Toughness levels up as you play and affects your control upon collisions and explosions, the explosion body damage and your strength against side grapplers.", v_target])
				else:
					pass
					if R.truth((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon1")))):
						pass
						R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponPistol", "Description"), v_target])
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon2")))):
							pass
							R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponShotgun", "Description"), v_target])
						else:
							pass
							if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon3")))):
								pass
								R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponMAC11", "Description"), v_target])
							else:
								pass
								if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon4")))):
									pass
									R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponM16", "Description"), v_target])
								else:
									pass
									if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon2")))):
										pass
										R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponMP5", "Description"), v_target])
									else:
										pass
										if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon3")))):
											pass
											R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponSPAS12", "Description"), v_target])
										else:
											pass
											if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon4")))):
												pass
												R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponM60", "Description"), v_target])
											else:
												pass
												if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4")))):
													pass
													R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
												else:
													pass
													if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4")))):
														pass
														R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
													else:
														pass
														if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4")))):
															pass
															R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
														else:
															pass
															if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4")))):
																pass
																R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAimingToolTip"), v_target])
															else:
																pass
																if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4")))):
																	pass
																	R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponHandlingToolTip"), v_target])
																else:
																	pass
																	if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4")))):
																		pass
																		R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponReloadingToolTip"), v_target])
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_newFilters: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_newFilters = R.coerce(null, "Array")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
			pass
			v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
		else:
			pass
			if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4")))):
				pass
				R.call_member(c.fields.get("m_Game"), "SetToolTip", ["", null])
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth((c).fields.get("m_bSelectionDone")):
		pass
		return null
	if R.truth(((c).fields.get("m_bDianeWeaponStats") or (c).fields.get("m_bCochetaWeaponStats"))):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BackButton"))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
			R.call_member(c, "ZoomTo", [0, 0, 1])
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), 0.5, {"x": 600, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), 0.5, {"x": 600, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.call_member(c, "SlideInterface", [true, false, true, true])
			(c).fields["m_bDianeWeaponStats"] = false
			(c).fields["m_bCochetaWeaponStats"] = false
			R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", true, "=")
			R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", true, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MenuButton"))):
			pass
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
			if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
				pass
				R.call_member(c.fields.get("m_Game"), "StartGameMode", [(c.fields.get("m_Game")).fields.get("m_GameModeEditor")])
			else:
				pass
				R.call_member(c.fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
			R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "SwitchVehicle"))):
				pass
				((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bUsingHummer"] = R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))
				R.call_member((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "SavePlayerInfo", [])
				R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "UpdateVehicle", [])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
					pass
					R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
					(c.fields.get("m_Game")).fields["m_bIsFemale"] = R.coerce((false if R.truth(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", [])) else true), "Boolean")
					(c.fields.get("m_Game")).fields["m_bLastIsFemale"] = (c.fields.get("m_Game")).fields.get("m_bIsFemale")
					R.call_member((c).fields.get("m_DianeDrivingVoice"), "Play", [])
					R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndPlay"), [2])
					(c).fields["m_bSelectionDone"] = true
					R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
					R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
					R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
					R.call_member(c, "ZoomTo", [R.unary("-", 5), R.unary("-", 43), 1.32])
					R.call_member(c, "SlideInterface", [false, false, false, false])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
						pass
						R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
						(c.fields.get("m_Game")).fields["m_bIsFemale"] = R.coerce((true if R.truth(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", [])) else false), "Boolean")
						(c.fields.get("m_Game")).fields["m_bLastIsFemale"] = (c.fields.get("m_Game")).fields.get("m_bIsFemale")
						R.call_member((c).fields.get("m_CochetaDrivingVoice"), "Play", [])
						(c).fields["m_bSelectionDone"] = true
						R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
						R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
						R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
						R.call_member(c, "ZoomTo", [R.unary("-", 184), R.unary("-", 3), 1.19])
						R.call_member(c, "SlideInterface", [false, false, false, false])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"))):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
							R.call_member(c, "ZoomTo", [R.unary("-", 237), R.unary("-", 60), 1.44])
							R.call_member(c, "SlideInterface", [false, true, false, false])
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "visible", true, "=")
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "x", 600, "=")
							R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), 0.5, {"x": 165, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
							R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
							(c).fields["m_bDianeWeaponStats"] = true
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"))):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
								R.call_member(c, "ZoomTo", [R.unary("-", 554), 4, 1.71])
								R.call_member(c, "SlideInterface", [false, true, false, false])
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "visible", true, "=")
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "x", 600, "=")
								R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), 0.5, {"x": 165, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
								R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
								(c).fields["m_bCochetaWeaponStats"] = true
	return null

static func f_SlideInterface(c: Variant, a: Array) -> Variant:
	var v_bMain: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bBack: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bMenu: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_bStats: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "visible", v_bMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "visible", v_bBack, "=")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "MenuButton"), 0.25, {"x": ((c).fields.get("m_fBaseMenuButtonPos") if R.truth(v_bMenu) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "BackButton"), 0.25, {"x": ((c).fields.get("m_fBaseBackButtonPos") if R.truth(v_bBack) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), 0.25, {"x": ((c).fields.get("m_fBaseSwitchVehiclePos") if R.truth(v_bMain) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DrivingLabel"), 0.25, {"y": ((c).fields.get("m_fBaseDrivingLabelPos") if R.truth(v_bMain) else R.unary("-", 70)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "GunnerLabel"), 0.25, {"y": ((c).fields.get("m_fBaseGunnerLabelPos") if R.truth(v_bMain) else R.unary("-", 70)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), 0.25, {"y": ((c).fields.get("m_fBaseDianeWeaponStatsButtonPos") if R.truth(v_bMain) else 415), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), 0.25, {"y": ((c).fields.get("m_fBaseCochetaWeaponStatsButtonPos") if R.truth(v_bMain) else 415), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeButton"), 0.25, {"y": ((c).fields.get("m_fBaseDianeButtonPos") if R.truth(v_bMain) else 430), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaButton"), 0.25, {"y": ((c).fields.get("m_fBaseCochetaButtonPos") if R.truth(v_bMain) else 430), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeStats"), 0.25, {"x": ((c).fields.get("m_fBaseDianeStatsPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseDianeStatsPos")) - float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaStats"), 0.25, {"x": ((c).fields.get("m_fBaseCochetaStatsPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseCochetaStatsPos")) + float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "StoryProgress"), 0.25, {"x": ((c).fields.get("m_fBaseStoryProgressPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseStoryProgressPos")) + float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	return null

static func f_ZoomTo(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fScale: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "Content"), 0.5, {"x": v_fX, "y": v_fY, "scaleX": v_fScale, "scaleY": v_fScale, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	return null

static func f_InitStats(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving"), "Driving", true, (v_info).fields.get("m_iDianeDrivingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness"), "Toughness", true, (v_info).fields.get("m_iDianeToughnessLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving"), "Driving", true, (v_info).fields.get("m_iCochetaDrivingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness"), "Toughness", true, (v_info).fields.get("m_iCochetaToughnessLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1"), "Damage", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1"), "Accuracy", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1"), "Capacity", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1"), "Aiming", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1"), "Handling", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1"), "Reloading", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"), "Damage", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"), "Accuracy", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"), "Capacity", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"), "Aiming", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"), "Handling", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"), "Reloading", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"), ("Damage" if R.truth(((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"), "Accuracy", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"), "Capacity", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"), "Aiming", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"), "Handling", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"), "Reloading", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"), ("Damage" if R.truth(((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"), "Accuracy", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"), "Capacity", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"), "Aiming", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"), "Handling", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"), "Reloading", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"), "Damage", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"), "Accuracy", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"), "Capacity", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"), "Aiming", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"), "Handling", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"), "Reloading", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"), "Damage", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"), "Accuracy", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"), "Capacity", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"), "Aiming", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"), "Handling", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"), "Reloading", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"), ("Damage" if R.truth(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"), "Accuracy", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"), "Capacity", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"), "Aiming", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"), "Handling", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"), "Reloading", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4"), ("Damage" if R.truth(((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"), "Accuracy", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"), "Capacity", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"), "Aiming", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"), "Handling", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4"), "Reloading", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iReloadingLevel"), true])
	return null

static func f_SetupUpgradeSlot(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_szLeftName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_bShowBars: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_iLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_bOrganicSlot: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_bEnabled: Variant = R.coerce((a[5] if a.size() > 5 else true), "Boolean")
	R.set_value(R.get_value(v_slotMC, "LeftName"), "text", v_szLeftName, "=")
	R.set_value(R.get_value(v_slotMC, "Bars"), "visible", v_bShowBars, "=")
	if R.truth(v_bOrganicSlot):
		pass
		v_iLevel = R.signed32(v_iLevel + 1)
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar1"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(1))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar2"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(2))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar3"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(3))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar4"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(4))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar5"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(5))) else 1)])
	if R.truth(v_bOrganicSlot):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar6"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(6))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar7"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(7))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar8"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(8))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar9"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(9))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar10"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(10))) else 1)])
	R.set_value(v_slotMC, "mouseEnabled", v_bEnabled, "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_MC"] = R.coerce(null, "MovieClip")
	(c).fields["m_DianeDrivingVoice"] = R.coerce(null, "DTSound")
	(c).fields["m_CochetaDrivingVoice"] = R.coerce(null, "DTSound")
	(c).fields["m_bSelectionDone"] = false
	(c).fields["m_fDoneTalkingTimer"] = float(NAN)
	(c).fields["m_bDianeWeaponStats"] = false
	(c).fields["m_bCochetaWeaponStats"] = false
	(c).fields["m_fBaseMenuButtonPos"] = float(NAN)
	(c).fields["m_fBaseBackButtonPos"] = float(NAN)
	(c).fields["m_fBaseDianeWeaponStatsButtonPos"] = float(NAN)
	(c).fields["m_fBaseCochetaWeaponStatsButtonPos"] = float(NAN)
	(c).fields["m_fBaseDianeButtonPos"] = float(NAN)
	(c).fields["m_fBaseCochetaButtonPos"] = float(NAN)
	(c).fields["m_fBaseDianeStatsPos"] = float(NAN)
	(c).fields["m_fBaseCochetaStatsPos"] = float(NAN)
	(c).fields["m_fBaseStoryProgressPos"] = float(NAN)
	(c).fields["m_fBaseSwitchVehiclePos"] = float(NAN)
	(c).fields["m_fBaseDrivingLabelPos"] = float(NAN)
	(c).fields["m_fBaseGunnerLabelPos"] = float(NAN)
	(c).fields["m_fContentBrightness"] = float(NAN)
	(c).fields["m_FlySound"] = R.coerce(null, "DTSound")
	return null
