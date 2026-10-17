extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func c1085_f_Hide(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_HudMC")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_MessageBox")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_ConfirmationDialog")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_ToolTip")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_Flash")])
	R.set_value(((c).fields.get("m_Game")).fields.get("m_ToolTip"), "visible", false, "=")
	if R.truth((R.truth((c).fields.get("m_Ad")) and R.truth(R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "contains"), [(c).fields.get("m_Ad")])))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "removeChild"), [(c).fields.get("m_Ad")])
		(c).fields["m_Ad"] = R.coerce(null, "FlashAd")
	return null


static func c1085_f_OnUpdateRPPopDone(c: Variant, a: Array) -> Variant:
	var v_newTextFormat: Variant = null
	v_newTextFormat = R.coerce(null, "TextFormat")
	(c).fields["m_bDoingRPPop"] = false
	if R.truth(R.unary("!", (c).fields.get("m_bPositiveRP"))):
		pass
		v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
		R.set_value(v_newTextFormat, "color", "0xFFFFFF", "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "RPDisplay"), "setTextFormat"), [v_newTextFormat])
		(c).fields["m_bPositiveRP"] = true
	R.call_member(c, "UpdateRPDisplay", [])
	return null


static func c1085_f_DoHealEffect(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", 1, "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "Heal"), "gotoAndPlay"), [2])
	return null


static func c1085_f_DoExplosionEffect(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", 1, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "gotoAndPlay"), ["Hurt"])
	return null


static func c1085_f_OnPlayerReceiveEyeBlood(c: Variant, a: Array) -> Variant:
	var v_bloodMC: Variant = null
	var v_iNbBloods: Variant = 0
	var v_i: Variant = 0
	var v_bloodEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEventBlood")
	v_bloodMC = R.coerce(null, "MovieClip")
	if R.truth((v_bloodEvent).fields.get("m_bDoFlash")):
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "BloodFlash"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "BloodFlash"), "gotoAndPlay"), [1])
	v_iNbBloods = R.coerce((v_bloodEvent).fields.get("m_iNbBloods"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbBloods))):
		pass
		v_bloodMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_EyeBloods"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		R.set_value(v_bloodMC, "visible", true, "=")
		R.set_value(v_bloodMC, "alpha", 1, "=")
		R.invoke(R.get_value(v_bloodMC, "gotoAndPlay"), [1])
		v_i = R.signed32(v_i + 1)
	return null


static func c1085_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "visible", true, "=")
	if R.truth((float(((c).fields.get("m_Player")).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_Explosion")))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "gotoAndPlay"), ["FadeToRed"])
	else:
		pass
		if R.truth((float(((c).fields.get("m_Player")).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_ZombieKill")))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "gotoAndPlay"), ["FlashToRed"])
		else:
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "gotoAndPlay"), ["FadeToBlack"])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivIcon"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivCount"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPrompt"), "text", "", "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptBG"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptKey"), "visible", false, "=")
	return null


static func c1085_f_OnPlayerAmmoUpdated(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateAmmoDisplay", [])
	return null


static func c1085_f_OnPlayerCivCountUpdated(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateCivCount", [])
	return null


static func c1085_f_UpdateLocationCivCount(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	var v_iCivs: Variant = 0
	v_rescueMode = R.coerce(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
	v_iCivs = R.coerce((v_rescueMode).fields.get("m_iCiviliansInBuilding"), "int")
	if R.truth((float(v_iCivs) != float((c).fields.get("m_iDisplayedLocationCivs")))):
		pass
		if R.truth((float(v_iCivs) > float((c).fields.get("m_iDisplayedLocationCivs")))):
			pass
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ1"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(1))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ2"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(2))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ3"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(3))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ4"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(4))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ5"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(5))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ6"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(6))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ7"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(7))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ8"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(8))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ9"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(9))) else 13)])
			R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ10"), "gotoAndStop"), [(1 if R.truth((float(v_iCivs) >= float(10))) else 13)])
		else:
			pass
			if R.truth(((float(1) > float(v_iCivs)) and (float(1) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ1"), "gotoAndPlay"), [2])
			if R.truth(((float(2) > float(v_iCivs)) and (float(2) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ2"), "gotoAndPlay"), [2])
			if R.truth(((float(3) > float(v_iCivs)) and (float(3) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ3"), "gotoAndPlay"), [2])
			if R.truth(((float(4) > float(v_iCivs)) and (float(4) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ4"), "gotoAndPlay"), [2])
			if R.truth(((float(5) > float(v_iCivs)) and (float(5) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ5"), "gotoAndPlay"), [2])
			if R.truth(((float(6) > float(v_iCivs)) and (float(6) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ6"), "gotoAndPlay"), [2])
			if R.truth(((float(7) > float(v_iCivs)) and (float(7) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ7"), "gotoAndPlay"), [2])
			if R.truth(((float(8) > float(v_iCivs)) and (float(8) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ8"), "gotoAndPlay"), [2])
			if R.truth(((float(9) > float(v_iCivs)) and (float(9) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ9"), "gotoAndPlay"), [2])
			if R.truth(((float(10) > float(v_iCivs)) and (float(10) <= float((c).fields.get("m_iDisplayedLocationCivs"))))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "Civ10"), "gotoAndPlay"), [2])
		(c).fields["m_iDisplayedLocationCivs"] = R.coerce(v_iCivs, "int")
	return null


static func c1085_f_OnTaskCanceled(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskCanceled"), "visible", true, "=")
	(c).fields["m_fTaskCanceledTimer"] = float(3)
	R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
	return null


static func c1085_f_ShowCombo(c: Variant, a: Array) -> Variant:
	var v_fScale: Variant = NAN
	var v_iCombo: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "ComboDisplay"), "text", v_iCombo, "=")
	v_fScale = float(1.25)
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "scaleX", v_fScale, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "scaleY", v_fScale, "=")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), 0.5, {"scaleX": 1, "scaleY": 1, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	(c).fields["m_fComboDisplayTimer"] = float(R.static_value("RDHud", "ComboDisplayDuration"))
	return null


static func c1085_f_OnLevelUpComplete(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible", false, "=")
	return null


static func c1085_f_ShowLevelUp(c: Variant, a: Array) -> Variant:
	var v_levelUpInfo: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szCategory: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_iLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iMaxLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDuration: Variant = R.coerce((a[4] if a.size() > 4 else 4), "Number")
	v_levelUpInfo = R.coerce(R.construct(R.klass("RDLevelUpInfo"), []), "RDLevelUpInfo")
	(v_levelUpInfo).fields["m_szName"] = R.coerce(v_szName, "String")
	(v_levelUpInfo).fields["m_szCategory"] = R.coerce(v_szCategory, "String")
	(v_levelUpInfo).fields["m_iLevel"] = R.coerce(v_iLevel, "int")
	(v_levelUpInfo).fields["m_iMaxLevel"] = R.coerce(v_iMaxLevel, "int")
	(v_levelUpInfo).fields["m_fDuration"] = float(v_fDuration)
	R.invoke(R.get_value((c).fields.get("m_LevelUps"), "push"), [v_levelUpInfo])
	R.call_member(c, "UpdateLevelUps", [0])
	return null


static func c1085_f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "AbortButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.call_member((c).fields.get("m_Game"), "CanPause", [])):
			pass
			R.call_member((c).fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Abort")])
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_Abort")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "PauseButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.call_member((c).fields.get("m_Game"), "CanPause", [])):
			pass
			R.call_member((c).fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Generic")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "SurvivalGuideNotice"), "SurvivalGuide"), "SurvivalGuideButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.call_member((c).fields.get("m_Game"), "CanPause", [])):
			pass
			R.call_member((c).fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Generic"), true])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_Game")).fields.get("m_Menu"), "Abort"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.call_member((c).fields.get("m_Game"), "CanPause", [])):
			pass
			R.call_member((c).fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Abort")])
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_Abort")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_Game")).fields.get("m_Menu"), "Resume"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_Game"), "SetPause", [false, R.static_value("RDGame", "PauseType_Generic")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "QualityButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "ToggleQuality", [])
		R.call_member(c, "UpdateOptionsPanel", [])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "FullscreenButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetFullscreen", [R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bFullscreen"))])
		R.call_member(c, "UpdateOptionsPanel", [])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "SoundsButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetSoundsOn", [R.unary("!", (((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound"))])
		R.call_member(c, "UpdateOptionsPanel", [])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "MusicButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetMusicOn", [R.unary("!", (((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic"))])
		R.call_member(c, "UpdateOptionsPanel", [])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsTryAgainButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		((c).fields.get("m_Game")).fields["m_bIsFemale"] = ((c).fields.get("m_Game")).fields.get("m_bLastIsFemale")
		(((c).fields.get("m_Game")).fields.get("m_ActiveMode")).fields["m_bDoStartGameMode"] = true
		R.call_member((c).fields.get("m_Game"), "StartGameMode", [((c).fields.get("m_Game")).fields.get("m_ActiveMode")])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsSelectDriverButton")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsSelectGunnerButton")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_Game"), "StartGameMode", [((c).fields.get("m_Game")).fields.get("m_GameModeDriverSelection")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsMenuButton"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
			pass
			R.call_member((c).fields.get("m_Game"), "StartGameMode", [((c).fields.get("m_Game")).fields.get("m_GameModeEditor")])
		else:
			pass
			R.call_member((c).fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "CallChopperSupport"))):
		pass
		R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CallChopperSupport", [true])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedShield"))):
		pass
		R.call_member((((c).fields.get("m_Game")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "ActivateMedShield", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedHeal"))):
		pass
		R.call_member((((c).fields.get("m_Game")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "ActivateMedHeal", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate0"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [0])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate1"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [1])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate2"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [2])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate3"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [3])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate4"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [4])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "Rate5"))):
		pass
		R.call_member((c).fields.get("m_Game"), "RateFile", [5])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "LostFocusMessage"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetPause", [false])
		return true
	return false
	return null


static func c1085_f_ShowPointsScreen(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_prefWeapon: Variant = null
	var v_weapon: Variant = null
	var v_info: Variant = null
	var v_iMostKills: Variant = 0
	var v_bChopperMode: Variant = false
	v_i = R.coerce(0, "int")
	v_prefWeapon = R.coerce(null, "RDWeapon")
	v_weapon = R.coerce(null, "RDWeapon")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "visible", true, "=")
	while R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "removeChildAt"), [0])
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "y", (float((((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")) + float(10)), "=")
	R.call_member(c, "AddStatsSlot", ["Total Driven Distance", R.binary("+", floorf(float((v_info).fields.get("m_fTotalDistance"))), "m")])
	R.call_member(c, "AddStatsSlot", ["Zombies Shot", R.binary("+", (v_info).fields.get("m_iZombiesShot"), "")])
	R.call_member(c, "AddStatsSlot", ["Zombies Hit", R.binary("+", (v_info).fields.get("m_iZombiesHit"), "")])
	R.call_member(c, "AddStatsSlot", ["Slow Zombie Kills", R.binary("+", (v_info).fields.get("m_iNbSlowZombieKills"), "")])
	R.call_member(c, "AddStatsSlot", ["Mutants Killed", R.binary("+", (v_info).fields.get("m_iMutantsKilled"), "")])
	R.call_member(c, "AddStatsSlot", ["Gib Kills", R.binary("+", (v_info).fields.get("m_iNbZombieSplatterHits"), "")])
	R.call_member(c, "AddStatsSlot", ["Headshots", R.binary("+", (v_info).fields.get("m_iHeadshots"), "")])
	R.call_member(c, "AddStatsSlot", ["Total Clingers", R.binary("+", (v_info).fields.get("m_iTotalClingers"), "")])
	R.call_member(c, "AddStatsSlot", ["Clingers Shot", R.binary("+", (v_info).fields.get("m_iClingersShot"), "")])
	R.call_member(c, "AddStatsSlot", ["Clingers Shaken Off", R.binary("+", (v_info).fields.get("m_iClingersShakenOff"), "")])
	R.call_member(c, "AddStatsSlot", ["Cars Exploded", R.binary("+", (v_info).fields.get("m_iCarsExploded"), "")])
	R.call_member(c, "AddStatsSlot", ["Cars Blown By Mounted Gun", R.binary("+", (v_info).fields.get("m_iCarsBlownUpByMountedWeapon"), "")])
	R.call_member(c, "AddStatsSlot", ["Fuel Trucks Shot", R.binary("+", (v_info).fields.get("m_iFuelTruckShot"), "")])
	R.call_member(c, "AddStatsSlot", ["Civilians Taken", R.binary("+", (v_info).fields.get("m_iCiviliansTaken"), "")])
	R.call_member(c, "AddStatsSlot", ["Civilians Saved", R.binary("+", (v_info).fields.get("m_iCiviliansSaved"), "")])
	R.call_member(c, "AddStatsSlot", ["Civilians Killed", R.binary("+", (v_info).fields.get("m_iNbKilledCivilians"), "")])
	R.call_member(c, "AddStatsSlot", ["Mines Shot", R.binary("+", (v_info).fields.get("m_iMinesShot"), "")])
	R.call_member(c, "AddStatsSlot", ["Total Deaths", R.binary("+", (v_info).fields.get("m_iTotalDeaths"), "")])
	R.call_member(c, "AddStatsSlot", ["Fires Put Out", R.binary("+", (v_info).fields.get("m_iFiresPutOut"), "")])
	R.call_member(c, "AddStatsSlot", ["Tires Blown", R.binary("+", (v_info).fields.get("m_iTiresBlown"), "")])
	R.call_member(c, "AddStatsSlot", ["Jet Bombings Dodged", R.binary("+", (v_info).fields.get("m_iNbDodgedBombing"), "")])
	R.call_member(c, "AddStatsSlot", ["Deaths By Zombie", R.binary("+", (v_info).fields.get("m_iDeathsByZombie"), "")])
	R.call_member(c, "AddStatsSlot", ["Deaths By Explosion", R.binary("+", (v_info).fields.get("m_iDeathsByExplosion"), "")])
	R.call_member(c, "AddStatsSlot", ["Bullets Shot", R.binary("+", (v_info).fields.get("m_iBulletsShot"), "")])
	R.call_member(c, "AddStatsSlot", ["Rockets Shot", R.binary("+", (v_info).fields.get("m_iRocketsShot"), "")])
	R.call_member(c, "AddStatsSlot", ["RP Earned", R.binary("+", (v_info).fields.get("m_iRPEarned"), "")])
	R.call_member(c, "AddStatsSlot", ["Successful Stops", R.binary("+", (v_info).fields.get("m_iSuccessfulStops"), "")])
	R.call_member(c, "AddStatsSlot", ["Best Combo", R.binary("+", (v_info).fields.get("m_iBestHitCombo"), "")])
	R.call_member(c, "AddStatsSlot", ["Collateral Kills", R.binary("+", (v_info).fields.get("m_iCollateralKills"), "")])
	R.call_member(c, "AddStatsSlot", ["Property Damage", R.binary("+", "$", (v_info).fields.get("m_iPropertyDamage"))])
	R.call_member(c, "AddStatsSlot", ["Prefered Driver", ("Diane" if R.truth((float((v_info).fields.get("m_fDianeDistance")) > float((v_info).fields.get("m_fCochetaDistance")))) else "Cocheta")])
	v_iMostKills = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_Player")).fields.get("m_WeaponsCocheta"), "length"))):
		pass
		v_weapon = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_Player")).fields.get("m_WeaponsCocheta"), v_i), R.klass("RDWeapon")), "RDWeapon")
		if R.truth((R.truth(v_weapon) and (float(((v_weapon).fields.get("m_Data")).fields.get("m_iKills")) > float(v_iMostKills)))):
			pass
			v_iMostKills = R.coerce(((v_weapon).fields.get("m_Data")).fields.get("m_iKills"), "int")
			v_prefWeapon = R.coerce(v_weapon, "RDWeapon")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_Player")).fields.get("m_WeaponsDiane"), "length"))):
		pass
		v_weapon = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_Player")).fields.get("m_WeaponsDiane"), v_i), R.klass("RDWeapon")), "RDWeapon")
		if R.truth((R.truth(v_weapon) and (float(((v_weapon).fields.get("m_Data")).fields.get("m_iKills")) > float(v_iMostKills)))):
			pass
			v_iMostKills = R.coerce(((v_weapon).fields.get("m_Data")).fields.get("m_iKills"), "int")
			v_prefWeapon = R.coerce(v_weapon, "RDWeapon")
		v_i = R.signed32(v_i + 1)
	if R.truth(v_prefWeapon):
		pass
		R.call_member(c, "AddStatsSlot", ["Prefered Weapon", (v_prefWeapon).fields.get("m_szWeaponName")])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible", (((R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor")) and R.binary("!=", ((c).fields.get("m_Game")).fields.get("m_LoadedFile"), null)) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bLoadedFileOwned"))) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bLoadedFileRated"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Hints"), "visible", R.unary("!", R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "RatePanel"), "visible")), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Hints"), "HintText"), "text", R.get_value(R.static_value("RDHelp", "SurvivalHints"), R.call_static("Maths", "RandomInt", [R.get_value(R.static_value("RDHelp", "SurvivalHints"), "length")])), "=")
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		(c).fields["m_Ad"] = R.coerce(R.construct(R.klass("com.newgrounds.components.FlashAd"), []), "FlashAd")
		((c).fields.get("m_Ad")).fields["adType"] = R.coerce("Simple", "String")
		R.set_value((c).fields.get("m_Ad"), "x", 290, "=")
		R.set_value((c).fields.get("m_Ad"), "y", 71, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "addChild"), [(c).fields.get("m_Ad")])
	v_bChopperMode = R.binary("!=", R.binary("as", ((c).fields.get("m_Game")).fields.get("m_ActiveMode"), R.klass("RDGameModeChopperRescue")), null)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsSelectDriverButton"), "visible", R.unary("!", v_bChopperMode), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "StatsSelectGunnerButton"), "visible", v_bChopperMode, "=")
	R.call_member((c).fields.get("m_Game"), "PlayInterfaceSound", [])
	return null


static func c1085_f_AddStatsSlot(c: Variant, a: Array) -> Variant:
	var v_newSlot: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szCount: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_newSlot = R.coerce(R.construct(R.klass("MC_StatsSlot"), []), "MovieClip")
	R.set_value(R.get_value(v_newSlot, "StatsName"), "text", v_szName, "=")
	R.set_value(R.get_value(v_newSlot, "StatsCount"), "text", v_szCount, "=")
	R.set_value(v_newSlot, "y", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "numChildren")) * float(35)), "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "addChild"), [v_newSlot])
	return null


static func c1085_f_ShowTime(c: Variant, a: Array) -> Variant:
	var v_iMinutes: Variant = 0
	var v_iMinutes1: Variant = 0
	var v_iMinutes2: Variant = 0
	var v_iSeconds: Variant = 0
	var v_iSeconds1: Variant = 0
	var v_iSeconds2: Variant = 0
	var v_iMilliseconds: Variant = 0
	var v_iMilliseconds1: Variant = 0
	var v_iMilliseconds2: Variant = 0
	var v_fTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iMinutes = R.coerce(floorf(float(R.binary("/", v_fTime, 60))), "int")
	v_iMinutes1 = R.coerce((R.coerce(floorf(float(R.binary("/", v_iMinutes, 10))), "int") if R.truth((float(v_iMinutes) >= float(10))) else 0), "int")
	v_iMinutes2 = R.coerce((float(v_iMinutes) - float((float(v_iMinutes1) * float(10)))), "int")
	v_fTime = R.coerce(R.binary("-", v_fTime, (float(v_iMinutes) * float(60))), "Number")
	v_iSeconds = R.coerce(floorf(float(v_fTime)), "int")
	v_iSeconds1 = R.coerce((R.coerce(floorf(float(R.binary("/", v_iSeconds, 10))), "int") if R.truth((float(v_iSeconds) >= float(10))) else 0), "int")
	v_iSeconds2 = R.coerce((float(v_iSeconds) - float((float(v_iSeconds1) * float(10)))), "int")
	v_iMilliseconds = R.coerce(floorf(float((float((float(v_fTime) - float(v_iSeconds))) * float(100)))), "int")
	v_iMilliseconds1 = R.coerce((R.coerce(floorf(float(R.binary("/", v_iMilliseconds, 10))), "int") if R.truth((float(v_iMilliseconds) >= float(10))) else 0), "int")
	v_iMilliseconds2 = R.coerce((float(v_iMilliseconds) - float((float(v_iMilliseconds1) * float(10)))), "int")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit1"), "text", v_iMilliseconds2, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit2"), "text", v_iMilliseconds1, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit3"), "text", v_iSeconds2, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit4"), "text", v_iSeconds1, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit5"), "text", v_iMinutes2, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "Digit6"), "text", v_iMinutes1, "=")
	return null


static func c1085_f_HideTime(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "visible", false, "=")
	return null


static func c1085_f_ShowTimeBonus(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "BonusTime"), "text", R.binary("+", ("+" if R.truth((float(v_fTime) >= float(0))) else ""), R.call_static("Maths", "Round", [v_fTime, 0.1])), "=")
	R.set_value((c).fields.get("m_TimeBonusTextFormat"), "color", ("0xFFFFFF" if R.truth((float(v_fTime) >= float(0))) else "0xFF7777"), "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "BonusTime"), "setTextFormat"), [(c).fields.get("m_TimeBonusTextFormat")])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "scaleX", 1.5, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "scaleY", 1.5, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "alpha", 1, "=")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "BonusTime"), 1, {"scaleX": 1, "scaleY": 1, "alpha": 0, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeIn")}])
	return null


static func c1085_f_HideTimeBonus(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "visible", false, "=")
	return null


static func c1085_f_HideTutorial(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "visible", false, "=")
	return null


static func c1085_f_OnSimpleMessageTutorialDone(c: Variant, a: Array) -> Variant:
	R.call_member(c, "HideTutorial", [])
	return null


static func c1085_f_ShowEnding(c: Variant, a: Array) -> Variant:
	var v_customMode: Variant = null
	var v_iEnding: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_customMode = R.coerce(null, "RDGameModeCustom")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "visible", (float(v_iEnding) != float(R.static_value("RDAreaInfo", "Type_Normal"))), "=")
	if R.truth((float(v_iEnding) != float((c).fields.get("m_iEnding")))):
		pass
		v_customMode = R.coerce(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeCustom")), "RDGameModeCustom")
		if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["DriveAway"])
		else:
			pass
			if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingBlackScreen")))):
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["BlackScreen"])
			else:
				pass
				if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingRedScreen")))):
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["RedScreen"])
				else:
					pass
					if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingWhiteScreen")))):
						pass
						R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["WhiteScreen"])
					else:
						pass
						if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingNukeBlast")))):
							pass
							R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["NukeBlast"])
						else:
							pass
							if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
								pass
								R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["ChopperEscape"])
							else:
								pass
								if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingHighwayTransition")))):
									pass
									R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), [("ExitHighway" if R.truth(R.call_member(v_customMode, "IsOnHighway", [])) else "EnterHighway")])
								else:
									pass
									if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_MissingEnding")))):
										pass
										R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "gotoAndPlay"), ["MissingEnding"])
									else:
										pass
										R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "stop"), [])
		(c).fields["m_iEnding"] = R.coerce(v_iEnding, "int")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivIcon"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivCount"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPLabel"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPrompt"), "text", "", "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptBG"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptKey"), "visible", false, "=")
	return null


static func c1085_f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeCustom")), "OnEndingEvent", [v_szEvent])
	return null


static func c1180_f_OnMouseDown(c: Variant, a: Array) -> Variant:
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


static func c1180_f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "HighlightSlots", [v_event, true])
	return null


static func c1180_f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "HighlightSlots", [v_event, false])
	return null


static func c1180_f_GetSlotCost(c: Variant, a: Array) -> Variant:
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


static func c1180_f_FixNaNText(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth(R.binary("!=", R.invoke(R.get_value(v_szText, "indexOf"), ["NaN"]), R.unary("-", 1))):
		pass
		v_szText = R.coerce("", "*")
	return v_szText
	return null


static func c1180_f_HighlightSlots(c: Variant, a: Array) -> Variant:
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


static func c1180_f_TryUpgradeSlots(c: Variant, a: Array) -> Variant:
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
