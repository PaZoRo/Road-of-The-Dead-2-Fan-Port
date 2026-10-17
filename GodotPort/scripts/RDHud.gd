extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHud(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDHud"), [])
	(c).fields["m_Game"] = R.coerce(v_theGame, "RDGame")
	(c).fields["m_HudMC"] = R.coerce(R.construct(R.klass("MC_Hud"), []), "MovieClip")
	R.set_value((c).fields.get("m_HudMC"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_HudMC"), "mouseChildren", true, "=")
	R.set_value((c).fields.get("m_HudMC"), "m_owner", c, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "BloodFlash"), "stop"), [])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BloodFlash"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "stop"), [])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "mouseChildren", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "stop"), [])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "ComboDisplay"), "text", "", "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BlackHudScreen"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible", false, "=")
	(c).fields["m_LevelUpNotches"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch1"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch2"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch3"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch4"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch5"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch6"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch7"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch8"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch9"), R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Notch10")]), "Array")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPLabel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskCanceled"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "FPS"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "FPS"), "visible", false, "=")
	R.call_member(c, "InitEyeBloods", [])
	R.call_member(c, "HideEyeBloods", [])
	(c).fields["m_fHealthEffectTimer"] = float(0)
	(c).fields["m_fHealthEffectDelay"] = float(R.static_value("RDHud", "HealthEffectDelay"))
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "y", 450, "=")
	(c).fields["m_LevelUpSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_LevelUp"), (R.static_value("RDGame", "Instance")).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")
	(c).fields["m_LevelUpNotchSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_LevelUpNotch"), (R.static_value("RDGame", "Instance")).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")
	(c).fields["m_TutorialSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Tutorial"), (R.static_value("RDGame", "Instance")).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")
	(c).fields["m_PauseBitmapData"] = R.coerce(R.construct(R.klass("BitmapData"), [600, 400, false, 4294967295]), "BitmapData")
	(c).fields["m_PauseBitmap"] = R.coerce(R.construct(R.klass("Bitmap"), [(c).fields.get("m_PauseBitmapData")]), "Bitmap")
	return null

static func f_Show(c: Variant, a: Array) -> Variant:
	var v_newTextFormat: Variant = null
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_HudMC"), "parent"), ((c).fields.get("m_Game")).fields.get("m_HudLayer"))):
		pass
		return null
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [(c).fields.get("m_HudMC")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_MessageBox")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_ConfirmationDialog")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_ToolTip")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_Flash")])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "DeathScreens"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BloodFlash"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "ComboDisplay"), "text", "", "=")
	(c).fields["m_fComboDisplayTimer"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible", false, "=")
	(c).fields["m_fLevelUpDisplayTimer"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TiresDisplay"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LostFocusMessage"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "SurvivalGuideNotice"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Endings"), "visible", false, "=")
	v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
	R.set_value(v_newTextFormat, "color", "0xFFFFFF", "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "RPDisplay"), "setTextFormat"), [v_newTextFormat])
	(c).fields["m_bPositiveRP"] = true
	(c).fields["m_bDoingRPPop"] = false
	R.call_member(c, "ShowDialogBox", [""])
	R.call_member(c, "UpdateAmmoDisplay", [])
	R.call_member(c, "UpdateCivCount", [])
	R.call_member(c, "UpdateLocation", [])
	R.call_member(c, "UpdateTaskPrompt", [])
	R.call_member(c, "UpdateAiming", [])
	R.call_member(c, "UpdateOverheat", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "gotoAndStop"), [1])
	(c).fields["m_iEnding"] = R.coerce(R.unary("-", 1), "int")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "InvalidFileVersionMessage"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "InvalidFileVersionMessage"), "visible", R.unary("!", R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "UsesValidFileVersion", [])), "=")
	return null

static func f_Hide(c: Variant, a: Array) -> Variant:
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

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	var v_iNbMedShields: Variant = 0
	var v_iNbMedHeals: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "UpdateEyeBloods", [v_fDeltaTime])
	R.call_member(c, "UpdateHealthEffect", [v_fDeltaTime])
	R.call_member(c, "UpdateAiming", [])
	R.call_member(c, "UpdateOverheat", [])
	R.call_member(c, "UpdateLocation", [])
	R.call_member(c, "UpdateTask", [v_fDeltaTime])
	R.call_member(c, "UpdateRP", [true, false])
	R.call_member(c, "UpdateOptionsMenu", [])
	R.call_member(c, "UpdateTaskPrompt", [])
	R.call_member(c, "UpdateTiresDisplay", [])
	R.call_member(c, "UpdateLevelUps", [v_fDeltaTime])
	v_rescueMode = R.coerce(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
	v_iNbMedShields = R.coerce((R.call_member((c).fields.get("m_Player"), "GetNbMedShields", []) if R.truth((c).fields.get("m_Player")) else 0), "int")
	v_iNbMedHeals = R.coerce((R.call_member((c).fields.get("m_Player"), "GetNbMedHeals", []) if R.truth((c).fields.get("m_Player")) else 0), "int")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "CallChopperSupport"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanCallChopperSupport", [])), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedShield"), "visible", R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return R.unary("!", v_rescueMode)), func(): return (float(v_iNbMedShields) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedShieldCount"), "visible", R.get_value(R.get_value((c).fields.get("m_HudMC"), "MedShield"), "visible"), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedShieldCount"), "text", v_iNbMedShields, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedHeal"), "visible", R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return R.unary("!", v_rescueMode)), func(): return (float(v_iNbMedHeals) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedHealCount"), "visible", R.get_value(R.get_value((c).fields.get("m_HudMC"), "MedHeal"), "visible"), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "MedHealCount"), "text", v_iNbMedHeals, "=")
	if R.truth((float((c).fields.get("m_fComboDisplayTimer")) > float(0))):
		pass
		(c).fields["m_fComboDisplayTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fComboDisplayTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fComboDisplayTimer")) <= float(0))):
			pass
			R.set_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "visible", false, "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ComboDisplay"), "ComboDisplay"), "text", "", "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "y", (float(60) * float(v_fDeltaTime)), "-=")
		if R.truth(R.binary("<", R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "y"), (R.num(R.unary("-", R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "height"))) - float(20)))):
			pass
			R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "y", (((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), "=")
	return null

static func f_UpdateOptionsMenu(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and((R.truth(R.binary(">", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), R.static_value("RDHud", "OptionsMenuPosY"))) and R.truth(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"))), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", []))):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bOptionsMenuUp"))):
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), 0.4, {"y": 400, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			(c).fields["m_bOptionsMenuUp"] = true
			R.call_member(c, "UpdateOptionsPanel", [])
	else:
		pass
		if R.truth((c).fields.get("m_bOptionsMenuUp")):
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), 0.4, {"y": 450, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			(c).fields["m_bOptionsMenuUp"] = false
	return null

static func f_UpdateRP(c: Variant, a: Array) -> Variant:
	var v_fScale: Variant = NAN
	var v_newTextFormat: Variant = null
	var v_bPositive: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bPop: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fScale = float(NAN)
	v_newTextFormat = R.coerce(null, "TextFormat")
	if R.truth((c).fields.get("m_bDoingRPPop")):
		pass
		return null
	R.call_member(c, "UpdateRPDisplay", [])
	if R.truth(v_bPop):
		pass
		(c).fields["m_bDoingRPPop"] = true
		v_fScale = float(2)
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "scaleX", v_fScale, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "scaleY", v_fScale, "=")
		R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), 0.5, {"scaleX": 1, "scaleY": 1, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut"), "onComplete": R.get_value(c, "OnUpdateRPPopDone")}])
	if R.truth((R.unary("!", v_bPositive) and (c).fields.get("m_bPositiveRP"))):
		pass
		v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
		R.set_value(v_newTextFormat, "color", "0xEE0000", "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "RPDisplay"), "setTextFormat"), [v_newTextFormat])
		(c).fields["m_bPositiveRP"] = false
	return null

static func f_OnUpdateRPPopDone(c: Variant, a: Array) -> Variant:
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

static func f_UpdateRPDisplay(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "RPDisplay"), "text", floorf(float((((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iRP"))), "=")
	return null

static func f_UpdateAiming(c: Variant, a: Array) -> Variant:
	var v_fScale: Variant = NAN
	var v_fFullscreenScale: Variant = NAN
	v_fScale = float(NAN)
	v_fFullscreenScale = float(NAN)
	if R.truth(((R.truth(R.logical_and(R.logical_and((c).fields.get("m_Player"), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))) and R.truth(((c).fields.get("m_Player")).fields.get("m_Weapon"))) and R.binary("<=", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), R.static_value("RDHud", "OptionsMenuPosY")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "visible", R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bGunDown")), "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "visible", R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bGunDown")), "=")
		v_fScale = float(1)
		if R.truth(R.binary("!=", R.get_value(R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "displayState"), R.get_value(R.resolve(c, "StageDisplayState", "RDHud"), "NORMAL"))):
			pass
			v_fFullscreenScale = float(R.binary("/", 400, R.get_value(R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "fullScreenHeight")))
			v_fScale = float(R.binary("/", (float((float(v_fScale) + float(v_fFullscreenScale))) + float(v_fFullscreenScale)), 3))
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "scaleX", v_fScale, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "scaleY", v_fScale, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "scaleX", v_fScale, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "scaleY", v_fScale, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "x", ((c).fields.get("m_Player")).fields.get("m_fTargetAimingX"), "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "y", ((c).fields.get("m_Player")).fields.get("m_fTargetAimingY"), "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "x", ((c).fields.get("m_Player")).fields.get("m_fAimingX"), "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "y", ((c).fields.get("m_Player")).fields.get("m_fAimingY"), "=")
		if R.truth((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_bMountedWeapon")):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [(float(1002) + float(R.binary("/", (float(1000) * R.num(R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetBulletSpread", []))), R.static_value("RDWeapon", "MaxBulletSpread"))))])])
		else:
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [(float(1) + float(R.binary("/", (float(1000) * R.num(R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetBulletSpread", []))), R.static_value("RDWeapon", "MaxBulletSpread"))))])])
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "ActualCrosshair"), "visible", false, "=")
	return null

static func f_UpdateOverheat(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Overheat"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return (float((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_fOverheatSpeed")) > float(0))), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Overheat"), "visible")):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Overheat"), "ProgressBar"), "gotoAndStop"), [(float(1) + float(ceilf(float((float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_fOverheat"), 1)) * float(1000))))))])
	return null

static func f_DoHealEffect(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", 1, "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "Heal"), "gotoAndPlay"), [2])
	return null

static func f_DoExplosionEffect(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", 1, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "gotoAndPlay"), ["Hurt"])
	return null

static func f_UpdateHealthEffect(c: Variant, a: Array) -> Variant:
	var v_fHealthEffectRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fHealthEffectRatio = float(NAN)
	if R.truth(R.logical_and(R.truth(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode")), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", []))):
		pass
		if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fMedShieldTimer")) > float(0))):
			pass
			(c).fields["m_fHealthEffectTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fHealthEffectTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fHealthEffectTimer")) >= float((c).fields.get("m_fHealthEffectDelay")))):
				pass
				(c).fields["m_fHealthEffectTimer"] = float(0)
				R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
				R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", 1, "=")
				R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "gotoAndPlay"), ["Shield"])
		else:
			pass
			if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fBodyHP")) < float(R.static_value("RDHud", "EffectHealth")))):
				pass
				v_fHealthEffectRatio = float((float(1) - float(R.binary("/", ((c).fields.get("m_Player")).fields.get("m_fBodyHP"), R.static_value("RDHud", "EffectHealth")))))
				(c).fields["m_fHealthEffectTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fHealthEffectTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fHealthEffectTimer")) >= float((c).fields.get("m_fHealthEffectDelay")))):
					pass
					(c).fields["m_fHealthEffectTimer"] = float(0)
					R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "visible", true, "=")
					R.set_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "alpha", v_fHealthEffectRatio, "=")
					R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "HealthFlash"), "gotoAndPlay"), ["Hurt"])
	return null

static func f_SetPlayer(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	if R.truth(R.binary("!=", v_player, (c).fields.get("m_Player"))):
		pass
		if R.truth((c).fields.get("m_Player")):
			pass
			R.call_member((c).fields.get("m_Player"), "removeEventListener", ["RDEventBlood", R.get_value(c, "OnPlayerReceiveEyeBlood")])
			R.call_member((c).fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_Failed"), R.get_value(c, "OnPlayerFailed")])
			R.call_member((c).fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_WeaponChanged"), R.get_value(c, "OnPlayerWeaponChanged")])
			R.call_member((c).fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_PreWeaponChanged"), R.get_value(c, "OnPlayerPreWeaponChanged")])
			R.call_member((c).fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_CivCountUpdated"), R.get_value(c, "OnPlayerCivCountUpdated")])
		(c).fields["m_Player"] = R.coerce(v_player, "RDPlayer")
		if R.truth((c).fields.get("m_Player")):
			pass
			R.call_member((c).fields.get("m_Player"), "addEventListener", ["RDEventBlood", R.get_value(c, "OnPlayerReceiveEyeBlood"), false, 0, true])
			R.call_member((c).fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_Failed"), R.get_value(c, "OnPlayerFailed"), false, 0, true])
			R.call_member((c).fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_WeaponChanged"), R.get_value(c, "OnPlayerWeaponChanged"), false, 0, true])
			R.call_member((c).fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_PreWeaponChanged"), R.get_value(c, "OnPlayerPreWeaponChanged"), false, 0, true])
			R.call_member((c).fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_CivCountUpdated"), R.get_value(c, "OnPlayerCivCountUpdated"), false, 0, true])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "visible", R.binary("!=", (c).fields.get("m_Player"), null), "=")
	(c).fields["m_bOptionsMenuUp"] = false
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPDisplay"), "visible", (R.binary("!=", (c).fields.get("m_Player"), null) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "RPLabel"), "visible", (R.binary("!=", (c).fields.get("m_Player"), null) and R.unary("!", ((c).fields.get("m_Game")).fields.get("m_bPlayFromEditor"))), "=")
	R.call_member(c, "UpdateWeaponDisplay", [])
	R.call_member(c, "UpdateAmmoDisplay", [])
	R.call_member(c, "UpdateCivCount", [])
	R.call_member(c, "UpdateLocation", [])
	return null

static func f_InitEyeBloods(c: Variant, a: Array) -> Variant:
	var v_bloodMC: Variant = null
	var v_iNbBloods: Variant = 0
	var v_i: Variant = 0
	v_bloodMC = R.coerce(null, "MovieClip")
	(c).fields["m_EyeBloods"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	v_iNbBloods = R.coerce(R.coerce(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "numChildren"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbBloods))):
		pass
		v_bloodMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		R.call_member((c).fields.get("m_EyeBloods"), "AddValue", [v_bloodMC])
		v_i = R.signed32(v_i + 1)
	return null

static func f_HideEyeBloods(c: Variant, a: Array) -> Variant:
	var v_bloodMC: Variant = null
	var v_iNbBloods: Variant = 0
	var v_i: Variant = 0
	v_bloodMC = R.coerce(null, "MovieClip")
	v_iNbBloods = R.coerce(R.coerce(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "numChildren"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbBloods))):
		pass
		v_bloodMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		R.invoke(R.get_value(v_bloodMC, "stop"), [])
		R.set_value(v_bloodMC, "visible", false, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateEyeBloods(c: Variant, a: Array) -> Variant:
	var v_bloodMC: Variant = null
	var v_iNbBloods: Variant = 0
	var v_i: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_bloodMC = R.coerce(null, "MovieClip")
	v_iNbBloods = R.coerce(R.coerce(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "numChildren"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbBloods))):
		pass
		v_bloodMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Bloods"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.binary(">", R.get_value(v_bloodMC, "alpha"), 0)):
			pass
			R.set_value(v_bloodMC, "alpha", maxf(float((R.num(R.get_value(v_bloodMC, "alpha")) - float((float(R.static_value("RDHud", "BloodFadeRate")) * float(v_fDeltaTime))))), float(0)), "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnPlayerReceiveEyeBlood(c: Variant, a: Array) -> Variant:
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

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
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

static func f_OnPlayerAmmoUpdated(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateAmmoDisplay", [])
	return null

static func f_OnPlayerPreWeaponChanged(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "removeEventListener", [R.static_value("RDWeapon", "Event_AmmoUpdated"), R.get_value(c, "OnPlayerAmmoUpdated")])
	return null

static func f_OnPlayerWeaponChanged(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "addEventListener", [R.static_value("RDWeapon", "Event_AmmoUpdated"), R.get_value(c, "OnPlayerAmmoUpdated"), false, 0, true])
	R.call_member(c, "UpdateWeaponDisplay", [])
	R.call_member(c, "UpdateAmmoDisplay", [])
	R.call_member(c, "UpdateAiming", [])
	return null

static func f_UpdateAmmoDisplay(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_bulletMC: Variant = null
	v_i = R.coerce(0, "int")
	v_bulletMC = R.coerce(null, "MovieClip")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "visible", R.logical_and(R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return (c).fields.get("m_Player")), func(): return ((c).fields.get("m_Player")).fields.get("m_Weapon")), func(): return R.unary("!", R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "HasInfiniteAmmo", []))), "=")
	if R.truth((R.truth((c).fields.get("m_Player")) and R.truth(((c).fields.get("m_Player")).fields.get("m_Weapon")))):
		pass
		if R.truth(R.logical_and((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_bMountedWeapon"), func(): return R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "HasInfiniteAmmo", []))):
			pass
			R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "text", "", "=")
		else:
			pass
			if R.truth((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_bDisplayMagAsBag")):
				pass
				R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "text", R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetAmmoInMag", []), "=")
			else:
				pass
				R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInBagDisplay"), "text", ("" if R.truth(R.binary("==", R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetAmmoInBag", []), R.unary("-", 1))) else R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetAmmoInBag", [])), "=")
		if R.truth((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_bDisplayAmmoInMag")):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "numChildren"))):
				pass
				v_bulletMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
				R.set_value(v_bulletMC, "visible", R.binary("<", v_i, R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "GetAmmoInMag", [])), "=")
				v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateWeaponDisplay(c: Variant, a: Array) -> Variant:
	var v_child: Variant = null
	var v_i: Variant = 0
	var v_bulletMC: Variant = null
	v_child = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	v_bulletMC = R.coerce(null, "MovieClip")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return ((c).fields.get("m_Player")).fields.get("m_Weapon")), "=")
	while R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "numChildren"), 0)):
		pass
		v_child = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "getChildAt"), [0]), R.klass("MovieClip")), "MovieClip")
		R.call_static("RDGame", "ReturnMC", [v_child])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "removeChildAt"), [0])
	if R.truth(((R.truth(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", []))) and R.truth(((c).fields.get("m_Player")).fields.get("m_Weapon"))) and (((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_bDisplayAmmoInMag"))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iMagSize")))):
			pass
			v_bulletMC = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MC_Bullet")]), "MovieClip")
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "AmmoInMagDisplay"), "addChild"), [v_bulletMC])
			R.set_value(v_bulletMC, "x", (float(v_i) * R.num(R.unary("-", minf(float((((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_fAmmoDisplaySpacing")), float(R.binary("/", 150, (((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iMagSize"))))))), "=")
			R.invoke(R.get_value(v_bulletMC, "gotoAndStop"), [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAmmoDisplayFrame")])
			v_i = R.signed32(v_i + 1)
	return null

static func f_OnPlayerCivCountUpdated(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateCivCount", [])
	return null

static func f_UpdateCivCount(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	v_rescueMode = R.coerce(null, "RDGameModeChopperRescue")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivIcon"), "visible", R.logical_and(R.logical_and((c).fields.get("m_Player"), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivCount"), "visible", R.logical_and(R.logical_and((c).fields.get("m_Player"), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))), func(): return R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "CivIcon"), "visible")):
		pass
		v_rescueMode = R.coerce(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
		if R.truth(v_rescueMode):
			pass
			R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivCount"), "text", (v_rescueMode).fields.get("m_iTotalCiviliansSaved"), "=")
		else:
			pass
			R.set_value(R.get_value((c).fields.get("m_HudMC"), "CivCount"), "text", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar"), "=")
	return null

static func f_UpdateLocationCivCount(c: Variant, a: Array) -> Variant:
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

static func f_UpdateLocation(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Location"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "HasNextLevel", [])), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Location"), "text", R.binary("+", R.binary("+", R.binary("+", R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "GetNextLevelName", []), ": "), R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "GetNextLevelDistance", [])), R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "GetNextLevelSuffix", [])), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LocationBG"), "visible", R.get_value(R.get_value((c).fields.get("m_HudMC"), "Location"), "visible"), "=")
	v_rescueMode = R.coerce(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationDistance")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationDistance"), "visible", R.logical_and(R.logical_and((c).fields.get("m_Player"), func(): return ((c).fields.get("m_Player")).fields.get("m_ClosestLocation")), func(): return R.binary("==", v_rescueMode, null)), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "CivCount"), "visible", R.binary("!=", v_rescueMode, null), "=")
		if R.truth(v_rescueMode):
			pass
			R.call_member(c, "UpdateLocationCivCount", [])
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return ((c).fields.get("m_Player")).fields.get("m_ClosestLocation")), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationName"), "text", R.call_member(((c).fields.get("m_Player")).fields.get("m_ClosestLocation"), "GetLocationName", []), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationDistance"), "text", R.binary("+", ceilf(float(maxf(float((float(((c).fields.get("m_Player")).fields.get("m_fClosestLocationDistance")) - float(R.static_value("RDPlayer", "PickupPointDistance")))), float(0)))), "m"), "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationIcon"), "gotoAndStop"), [(((c).fields.get("m_Player")).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")])
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "x", R.call_static("Maths", "Clamp", [R.get_value((((c).fields.get("m_Player")).fields.get("m_ClosestLocation")).fields.get("m_MainMC"), "x"), 0, (((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")]), "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "y", R.call_static("Maths", "Clamp", [R.get_value((((c).fields.get("m_Player")).fields.get("m_ClosestLocation")).fields.get("m_MainMC"), "y"), 0, (((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), "=")
		if R.truth(((c).fields.get("m_bLocationPointerLeft") and R.binary(">", R.get_value((((c).fields.get("m_Player")).fields.get("m_ClosestLocation")).fields.get("m_MainMC"), "x"), (float(3) * float((((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iQuarterWidth")))))):
			pass
			(c).fields["m_bLocationPointerLeft"] = false
		else:
			pass
			if R.truth((R.unary("!", (c).fields.get("m_bLocationPointerLeft")) and R.binary("<", R.get_value((((c).fields.get("m_Player")).fields.get("m_ClosestLocation")).fields.get("m_MainMC"), "x"), (((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iQuarterWidth")))):
				pass
				(c).fields["m_bLocationPointerLeft"] = true
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "gotoAndStop"), [(2 if R.truth((c).fields.get("m_bLocationPointerLeft")) else 1)])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LocationPointer"), "LocationName"), "x", (28 if R.truth((c).fields.get("m_bLocationPointerLeft")) else R.unary("-", 115)), "=")
	return null

static func f_UpdateTaskPrompt(c: Variant, a: Array) -> Variant:
	var v_szKeyName: Variant = null
	var v_szTaskPrompt: Variant = null
	v_szKeyName = R.coerce(null, "String")
	v_szTaskPrompt = R.coerce("", "String")
	if R.truth(R.logical_and((R.truth(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode")) and R.truth(R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", []))), func(): return R.call_member((c).fields.get("m_Player"), "CanStartLocationInteraction", []))):
		pass
		v_szTaskPrompt = R.coerce(R.binary("+", v_szTaskPrompt, R.call_member((c).fields.get("m_Player"), "GetStartLocationInteractionName", [])), "String")
		v_szKeyName = R.coerce(R.call_static("Input", "GetKeyName", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey")]), "String")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptKey"), "KeyName"), "text", v_szKeyName, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPrompt"), "text", v_szTaskPrompt, "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptBG"), "visible", R.binary("!=", v_szTaskPrompt, ""), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskPromptKey"), "visible", R.binary("!=", v_szTaskPrompt, ""), "=")
	return null

static func f_UpdateTask(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((R.truth((c).fields.get("m_Player")) and (float(((c).fields.get("m_Player")).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_None"))))):
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskDisplay"), "visible", true, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskCanceled"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TaskDisplay"), "TaskName"), "text", R.call_member((c).fields.get("m_Player"), "GetActiveTaskName", [((c).fields.get("m_Player")).fields.get("m_iCurrentTask")]), "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TaskDisplay"), "ProgressBar"), "gotoAndStop"), [(float(1) + float(ceilf(float((float(R.binary("/", ((c).fields.get("m_Player")).fields.get("m_fTaskTime"), ((c).fields.get("m_Player")).fields.get("m_fTaskDuration"))) * float(1000))))))])
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskDisplay"), "visible", false, "=")
	if R.truth((float((c).fields.get("m_fTaskCanceledTimer")) > float(0))):
		pass
		(c).fields["m_fTaskCanceledTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fTaskCanceledTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fTaskCanceledTimer")) <= float(0))):
			pass
			R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskCanceled"), "visible", false, "=")
	return null

static func f_OnTaskCanceled(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TaskCanceled"), "visible", true, "=")
	(c).fields["m_fTaskCanceledTimer"] = float(3)
	R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
	return null

static func f_ShowCombo(c: Variant, a: Array) -> Variant:
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

static func f_UpdateOptionsPanel(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "MusicValue"), "text", ("On" if R.truth((((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "SoundsValue"), "text", ("On" if R.truth((((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "FullscreenValue"), "text", ("On" if R.truth(((c).fields.get("m_Game")).fields.get("m_bFullscreen")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "OptionsMenu"), "QualityValue"), "text", ("Low" if R.truth((float((((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(0))) else ("Medium" if R.truth((float((((c).fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(1))) else "High")), "=")
	return null

static func f_UpdateLevelUps(c: Variant, a: Array) -> Variant:
	var v_levelUpInfo: Variant = null
	var v_iDisplayLevel: Variant = 0
	var v_i: Variant = 0
	var v_notch: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_levelUpInfo = R.coerce(null, "RDLevelUpInfo")
	v_iDisplayLevel = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_notch = R.coerce(null, "MovieClip")
	if R.truth((R.unary("!", R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible")) and R.binary(">", R.get_value((c).fields.get("m_LevelUps"), "length"), 0))):
		pass
		v_levelUpInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LevelUps"), 0), R.klass("RDLevelUpInfo")), "RDLevelUpInfo")
		R.invoke(R.get_value((c).fields.get("m_LevelUps"), "splice"), [0, 1])
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible", true, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "x", R.unary("-", 250), "=")
		R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "LevelUp"), 0.25, {"x": 0, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
		(c).fields["m_bLevelUpIsOrganic"] = (float((v_levelUpInfo).fields.get("m_iMaxLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))
		v_iDisplayLevel = R.coerce((R.coerce((float((v_levelUpInfo).fields.get("m_iMaxLevel")) + float(1)), "int") if R.truth((c).fields.get("m_bLevelUpIsOrganic")) else (v_levelUpInfo).fields.get("m_iMaxLevel")), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(10))):
			pass
			v_notch = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LevelUpNotches"), v_i), R.klass("MovieClip")), "MovieClip")
			R.set_value(v_notch, "visible", ((float((v_levelUpInfo).fields.get("m_iMaxLevel")) > float(0)) and (float(v_i) < float(v_iDisplayLevel))), "=")
			R.set_value(v_notch, "alpha", (1 if R.truth(R.binary("<", v_i, ((v_levelUpInfo).fields.get("m_iLevel") if R.truth((c).fields.get("m_bLevelUpIsOrganic")) else (float((v_levelUpInfo).fields.get("m_iLevel")) - float(1))))) else 0.5), "=")
			R.invoke(R.get_value(v_notch, "gotoAndStop"), [1])
			v_i = R.signed32(v_i + 1)
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Name"), "text", (v_levelUpInfo).fields.get("m_szName"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "Category"), "text", (v_levelUpInfo).fields.get("m_szCategory"), "=")
		(c).fields["m_fLevelUpDisplayTimer"] = float((v_levelUpInfo).fields.get("m_fDuration"))
		(c).fields["m_fLevelUpDisplayDuration"] = float((v_levelUpInfo).fields.get("m_fDuration"))
		(c).fields["m_iLevelUpLevel"] = R.coerce(((v_levelUpInfo).fields.get("m_iLevel") if R.truth((c).fields.get("m_bLevelUpIsOrganic")) else R.coerce((float((v_levelUpInfo).fields.get("m_iLevel")) - float(1)), "int")), "int")
		(c).fields["m_bLevelUpNotchShown"] = (float((v_levelUpInfo).fields.get("m_iMaxLevel")) == float(0))
		(c).fields["m_bLevelUpNotchFlashing"] = false
		R.call_member((c).fields.get("m_LevelUpSound"), "Play", [])
	if R.truth((float((c).fields.get("m_fLevelUpDisplayTimer")) > float(0))):
		pass
		(c).fields["m_fLevelUpDisplayTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fLevelUpDisplayTimer"), v_fDeltaTime), "Number")
		if R.truth((R.unary("!", (c).fields.get("m_bLevelUpNotchShown")) and (float((c).fields.get("m_fLevelUpDisplayTimer")) <= float((float((c).fields.get("m_fLevelUpDisplayDuration")) - float(R.binary("/", (c).fields.get("m_fLevelUpDisplayDuration"), 4))))))):
			pass
			(c).fields["m_LevelUpNotch"] = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LevelUpNotches"), (c).fields.get("m_iLevelUpLevel")), R.klass("MovieClip")), "MovieClip")
			R.set_value((c).fields.get("m_LevelUpNotch"), "alpha", 1, "=")
			R.invoke(R.get_value((c).fields.get("m_LevelUpNotch"), "gotoAndStop"), [2])
			R.call_member((c).fields.get("m_Game"), "PlayInterfaceSound", [])
			(c).fields["m_bLevelUpNotchShown"] = true
			(c).fields["m_bLevelUpNotchFlashing"] = true
			R.call_member((c).fields.get("m_LevelUpNotchSound"), "Play", [])
			R.call_static("gs.TweenLite", "from", [R.get_value((c).fields.get("m_HudMC"), "LevelUp"), 0.4, {"scaleX": 1.25, "scaleY": 1.25, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
		if R.truth(((c).fields.get("m_bLevelUpNotchFlashing") and (float((c).fields.get("m_fLevelUpDisplayTimer")) <= float((float((c).fields.get("m_fLevelUpDisplayDuration")) - float(R.binary("/", (c).fields.get("m_fLevelUpDisplayDuration"), 2))))))):
			pass
			R.invoke(R.get_value((c).fields.get("m_LevelUpNotch"), "gotoAndStop"), [1])
			(c).fields["m_bLevelUpNotchFlashing"] = false
		if R.truth((float((c).fields.get("m_fLevelUpDisplayTimer")) <= float(0))):
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_HudMC"), "LevelUp"), 0.25, {"x": R.unary("-", 250), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut"), "onComplete": R.get_value(c, "OnLevelUpComplete")}])
	return null

static func f_OnLevelUpComplete(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "LevelUp"), "visible", false, "=")
	return null

static func f_ShowLevelUp(c: Variant, a: Array) -> Variant:
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

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
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

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "CallChopperSupport")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedShield"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedHeal")))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "gotoAndStop"), [2])
		return true
	return false
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "CallChopperSupport")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedShield"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_HudMC"), "MedHeal")))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TargetCrosshair"), "gotoAndStop"), [1])
		return true
	return false
	return null

static func f_ShowPointsScreen(c: Variant, a: Array) -> Variant:
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

static func f_AddStatsSlot(c: Variant, a: Array) -> Variant:
	var v_newSlot: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szCount: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_newSlot = R.coerce(R.construct(R.klass("MC_StatsSlot"), []), "MovieClip")
	R.set_value(R.get_value(v_newSlot, "StatsName"), "text", v_szName, "=")
	R.set_value(R.get_value(v_newSlot, "StatsCount"), "text", v_szCount, "=")
	R.set_value(v_newSlot, "y", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "numChildren")) * float(35)), "=")
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PointsScreen"), "Container"), "addChild"), [v_newSlot])
	return null

static func f_ShowTime(c: Variant, a: Array) -> Variant:
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

static func f_HideTime(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "HudTimer"), "visible", false, "=")
	return null

static func f_ShowTimeBonus(c: Variant, a: Array) -> Variant:
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

static func f_HideTimeBonus(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "BonusTime"), "visible", false, "=")
	return null

static func f_UpdateTiresDisplay(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TiresDisplay"), "visible", R.logical_and(R.logical_and(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return (float(((c).fields.get("m_Player")).fields.get("m_iNbBlownTires")) > float(0))), "=")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "TireCount"), "visible", R.get_value(R.get_value((c).fields.get("m_HudMC"), "TiresDisplay"), "visible"), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_HudMC"), "TiresDisplay"), "visible")):
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "TireCount"), "text", ((c).fields.get("m_Player")).fields.get("m_iNbBlownTires"), "=")
	return null

static func f_SetPause(c: Variant, a: Array) -> Variant:
	var v_matrix: Variant = null
	var v_cmFilter: Variant = null
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPauseType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bSurvivalGuide: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	v_matrix = R.coerce(null, "Array")
	v_cmFilter = R.coerce(null, "ColorMatrixFilter")
	if R.truth(v_bPause):
		pass
		R.invoke(R.get_value((c).fields.get("m_PauseBitmapData"), "draw"), [((c).fields.get("m_Game")).fields.get("m_WorldLayer")])
		v_matrix = R.coerce(R.construct(R.klass("Array"), [0.309, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0.309, 0.609, 0.082, 0, 0, 0, 0, 0, 1, 0]), "Array")
		v_cmFilter = R.coerce(R.construct(R.resolve(c, "ColorMatrixFilter", "RDHud"), [v_matrix]), "ColorMatrixFilter")
		R.set_value((c).fields.get("m_PauseBitmap"), "filters", [v_cmFilter], "=")
		if R.truth(R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "contains"), [(c).fields.get("m_PauseBitmap")])):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "removeChild"), [(c).fields.get("m_PauseBitmap")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "addChild"), [(c).fields.get("m_PauseBitmap")])
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "visible", true, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "visible", true, "=")
		R.call_member((c).fields.get("m_Game"), "DoFlash", [1, 0.5])
		R.call_member((c).fields.get("m_Game"), "UpdateOptionsPanel", [])
		if R.truth((float(v_iPauseType) != float(R.static_value("RDGame", "PauseType_LostFocus")))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_Menu")])
			R.set_value(R.get_value(((c).fields.get("m_Game")).fields.get("m_Menu"), "PauseLabel"), "visible", true, "=")
			R.call_member((c).fields.get("m_Game"), "SlideInterface", [R.static_value("RDGame", "MenuState_All"), false, true])
			R.call_member((c).fields.get("m_Game"), "GoToMenuState", [R.static_value("RDGame", "MenuState_InGame")])
			if R.truth(v_bSurvivalGuide):
				pass
				R.call_member((c).fields.get("m_Game"), "ShowSurvivalGuide", [(c).fields.get("m_iSurvivalGuideNoticeItem")])
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LostFocusMessage"), "visible", (float(v_iPauseType) == float(R.static_value("RDGame", "PauseType_LostFocus"))), "=")
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreenGrab"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "visible", false, "=")
		R.call_member((c).fields.get("m_Game"), "DoFlash", [1, 0.5])
		if R.truth(R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "contains"), [((c).fields.get("m_Game")).fields.get("m_Menu")])):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "PauseScreen"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_Menu")])
		R.set_value(R.get_value((c).fields.get("m_HudMC"), "LostFocusMessage"), "visible", false, "=")
	return null

static func f_GetTutorialPanel(c: Variant, a: Array) -> Variant:
	var v_szPlacement: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szPlacement, "VerticalKeys")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "VerticalKeys")
	if R.truth(R.binary("==", v_szPlacement, "HorizontalKeys")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "HorizontalKeys")
	if R.truth(R.binary("==", v_szPlacement, "SingleKey")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "SingleKey")
	if R.truth(R.binary("==", v_szPlacement, "Mouse")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "Mouse")
	if R.truth(R.binary("==", v_szPlacement, "SideGrappleDriver")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "SideGrappleDriver")
	if R.truth(R.binary("==", v_szPlacement, "SideGrappleGunner")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "SideGrappleGunner")
	if R.truth(R.binary("==", v_szPlacement, "Interact")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "Interact")
	if R.truth(R.binary("==", v_szPlacement, "Med")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "Med")
	if R.truth(R.binary("==", v_szPlacement, "Chopper")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "Chopper")
	if R.truth(R.binary("==", v_szPlacement, "SimpleMessage")):
		pass
		return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "SimpleMessage")
	return null
	return null

static func f_ShowTutorial(c: Variant, a: Array) -> Variant:
	var v_child: Variant = null
	var v_tutorialPanel: Variant = null
	var v_i: Variant = 0
	var v_szKeyName1: Variant = null
	var v_szKeyName2: Variant = null
	var v_szKeyName3: Variant = null
	var v_szKeyName4: Variant = null
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szPlacement: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_bFast: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_iKey1: Variant = R.coerce((a[3] if a.size() > 3 else R.unary("-", 1)), "int")
	var v_iKey2: Variant = R.coerce((a[4] if a.size() > 4 else R.unary("-", 1)), "int")
	var v_iKey3: Variant = R.coerce((a[5] if a.size() > 5 else R.unary("-", 1)), "int")
	var v_iKey4: Variant = R.coerce((a[6] if a.size() > 6 else R.unary("-", 1)), "int")
	v_child = R.coerce(null, "DisplayObject")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "visible", true, "=")
	R.call_member((c).fields.get("m_TutorialSound"), "Play", [])
	v_tutorialPanel = R.coerce(R.call_member(c, "GetTutorialPanel", [v_szPlacement]), "MovieClip")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "numChildren"))):
		pass
		v_child = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "getChildAt"), [v_i]), "DisplayObject")
		R.set_value(v_child, "visible", R.binary("==", v_child, v_tutorialPanel), "=")
		v_i = R.signed32(v_i + 1)
	v_szKeyName1 = R.coerce(R.call_static("Input", "GetKeyName", [v_iKey1]), "String")
	if R.truth((R.truth(R.get_value(v_tutorialPanel, "Key1")) and R.truth(v_szKeyName1))):
		pass
		R.set_value(R.get_value(R.get_value(v_tutorialPanel, "Key1"), "KeyName"), "text", v_szKeyName1, "=")
		R.invoke(R.get_value(R.get_value(v_tutorialPanel, "Key1"), "gotoAndPlay"), [R.binary("+", ("LargeKey" if R.truth(R.binary(">", R.get_value(v_szKeyName1, "length"), 1)) else "SmallKey"), ("Fast" if R.truth(v_bFast) else "Slow"))])
	v_szKeyName2 = R.coerce(R.call_static("Input", "GetKeyName", [v_iKey2]), "String")
	if R.truth((R.truth(R.get_value(v_tutorialPanel, "Key2")) and R.truth(v_szKeyName2))):
		pass
		R.set_value(R.get_value(R.get_value(v_tutorialPanel, "Key2"), "KeyName"), "text", v_szKeyName2, "=")
		R.invoke(R.get_value(R.get_value(v_tutorialPanel, "Key2"), "gotoAndPlay"), [R.binary("+", ("LargeKey" if R.truth(R.binary(">", R.get_value(v_szKeyName2, "length"), 1)) else "SmallKey"), ("Fast" if R.truth(v_bFast) else "Slow"))])
	v_szKeyName3 = R.coerce(R.call_static("Input", "GetKeyName", [v_iKey3]), "String")
	if R.truth((R.truth(R.get_value(v_tutorialPanel, "Key3")) and R.truth(v_szKeyName3))):
		pass
		R.set_value(R.get_value(R.get_value(v_tutorialPanel, "Key3"), "KeyName"), "text", v_szKeyName3, "=")
		R.invoke(R.get_value(R.get_value(v_tutorialPanel, "Key3"), "gotoAndPlay"), [R.binary("+", ("LargeKey" if R.truth(R.binary(">", R.get_value(v_szKeyName3, "length"), 1)) else "SmallKey"), ("Fast" if R.truth(v_bFast) else "Slow"))])
	v_szKeyName4 = R.coerce(R.call_static("Input", "GetKeyName", [v_iKey4]), "String")
	if R.truth((R.truth(R.get_value(v_tutorialPanel, "Key4")) and R.truth(v_szKeyName4))):
		pass
		R.set_value(R.get_value(R.get_value(v_tutorialPanel, "Key4"), "KeyName"), "text", v_szKeyName4, "=")
		R.invoke(R.get_value(R.get_value(v_tutorialPanel, "Key4"), "gotoAndPlay"), [R.binary("+", ("LargeKey" if R.truth(R.binary(">", R.get_value(v_szKeyName4, "length"), 1)) else "SmallKey"), ("Fast" if R.truth(v_bFast) else "Slow"))])
	if R.truth(R.get_value(v_tutorialPanel, "MouseDisplay")):
		pass
		R.invoke(R.get_value(R.get_value(v_tutorialPanel, "MouseDisplay"), "gotoAndPlay"), [("Fast" if R.truth(v_bFast) else "Slow")])
	if R.truth(R.get_value(v_tutorialPanel, "Text")):
		pass
		R.set_value(R.get_value(v_tutorialPanel, "Text"), "text", v_szText, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "gotoAndPlay"), [v_szPlacement])
	return null

static func f_HideTutorial(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "visible", false, "=")
	return null

static func f_IsTutorialShown(c: Variant, a: Array) -> Variant:
	return R.get_value(R.get_value((c).fields.get("m_HudMC"), "Tutorial"), "visible")
	return null

static func f_OnSimpleMessageTutorialDone(c: Variant, a: Array) -> Variant:
	R.call_member(c, "HideTutorial", [])
	return null

static func f_ShowSurvivalGuideNotice(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iSurvivalGuideNoticeItem"] = R.coerce(v_iItem, "int")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "SurvivalGuideNotice"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_HudMC"), "SurvivalGuideNotice"), "gotoAndPlay"), [2])
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "SurvivalGuideNotice"), "SurvivalGuide"), "ItemName"), "text", R.binary("+", R.binary("+", "\"", R.call_static("RDUnlockData", "GetSurvivalItemName", [v_iItem])), "\"\nadded!"), "=")
	return null

static func f_IsMenuOptionUp(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bOptionsMenuUp")
	return null

static func f_ShowDialogBox(c: Variant, a: Array) -> Variant:
	var v_szDialog: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.set_value(R.get_value((c).fields.get("m_HudMC"), "DialogBox"), "visible", v_szDialog, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_HudMC"), "DialogBox"), "DialogText"), "text", v_szDialog, "=")
	return null

static func f_ShowEnding(c: Variant, a: Array) -> Variant:
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

static func f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(R.binary("as", ((c).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeCustom")), "OnEndingEvent", [v_szEvent])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "BloodFadeRate", 0.1, "=")
	R.set_value(c, "EffectHealth", 75, "=")
	R.set_value(c, "HealthEffectDelay", 0.5, "=")
	R.set_value(c, "ComboDisplayDuration", 2, "=")
	R.set_value(c, "OptionsMenuPosY", 350, "=")
	R.set_value(c, "BaseCrosshairPos", 25, "=")
	R.set_value(c, "MaxCrosshairPos", 75, "=")
	R.set_value(c, "TutorialType_Mouse", 0, "=")
	R.set_value(c, "TutorialType_Arrow", 1, "=")
	R.set_value(c, "TutorialType_Key", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Game"] = R.coerce(null, "RDGame")
	(c).fields["m_HudMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_EyeBloods"] = R.coerce(null, "RandomHat")
	(c).fields["m_fHealthEffectTimer"] = float(NAN)
	(c).fields["m_fHealthEffectDelay"] = float(NAN)
	(c).fields["m_fComboDisplayTimer"] = float(NAN)
	(c).fields["m_LevelUps"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_fLevelUpDisplayTimer"] = float(NAN)
	(c).fields["m_fLevelUpDisplayDuration"] = float(NAN)
	(c).fields["m_iLevelUpLevel"] = R.coerce(0, "int")
	(c).fields["m_bLevelUpNotchShown"] = false
	(c).fields["m_bLevelUpIsOrganic"] = false
	(c).fields["m_bOptionsMenuUp"] = false
	(c).fields["m_LevelUpNotches"] = R.coerce(null, "Array")
	(c).fields["m_LevelUpNotch"] = R.coerce(null, "MovieClip")
	(c).fields["m_bLevelUpNotchFlashing"] = false
	(c).fields["m_bDoingRPPop"] = false
	(c).fields["m_bPositiveRP"] = false
	(c).fields["m_LevelUpSound"] = R.coerce(null, "DTSound")
	(c).fields["m_LevelUpNotchSound"] = R.coerce(null, "DTSound")
	(c).fields["m_TutorialSound"] = R.coerce(null, "DTSound")
	(c).fields["m_bLocationPointerLeft"] = false
	(c).fields["m_iDisplayedLocationCivs"] = R.coerce(0, "int")
	(c).fields["m_iSurvivalGuideNoticeItem"] = R.coerce(0, "int")
	(c).fields["m_FPSs"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iEnding"] = R.coerce(0, "int")
	(c).fields["m_TimeBonusTextFormat"] = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
	(c).fields["m_PauseBitmapData"] = R.coerce(null, "BitmapData")
	(c).fields["m_PauseBitmap"] = R.coerce(null, "Bitmap")
	(c).fields["m_Ad"] = R.coerce(null, "FlashAd")
	(c).fields["m_fTaskCanceledTimer"] = float(0)
	return null
