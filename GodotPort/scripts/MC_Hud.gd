extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Hud(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Hud"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["TireCount"] = R.coerce(null, "TextField")
	(c).fields["AmmoInBagDisplay"] = R.coerce(null, "TextField")
	(c).fields["Tutorial"] = R.coerce(null, "MovieClip")
	(c).fields["MedShieldCount"] = R.coerce(null, "TextField")
	(c).fields["CivIcon"] = R.coerce(null, "MovieClip")
	(c).fields["LostFocusMessage"] = R.coerce(null, "SimpleButton")
	(c).fields["MedShield"] = R.coerce(null, "SimpleButton")
	(c).fields["BonusTime"] = R.coerce(null, "MovieClip")
	(c).fields["PointsScreen"] = R.coerce(null, "MovieClip")
	(c).fields["RPDisplay"] = R.coerce(null, "MovieClip")
	(c).fields["InvalidFileVersionMessage"] = R.coerce(null, "TextField")
	(c).fields["OptionsMenu"] = R.coerce(null, "MovieClip")
	(c).fields["MedHealCount"] = R.coerce(null, "TextField")
	(c).fields["TiresDisplay"] = R.coerce(null, "MovieClip")
	(c).fields["LocationBG"] = R.coerce(null, "MovieClip")
	(c).fields["PauseScreen"] = R.coerce(null, "MovieClip")
	(c).fields["HudTimer"] = R.coerce(null, "MovieClip")
	(c).fields["BlackHudScreen"] = R.coerce(null, "MovieClip")
	(c).fields["Endings"] = R.coerce(null, "MovieClip")
	(c).fields["TargetCrosshair"] = R.coerce(null, "MovieClip")
	(c).fields["DeathScreens"] = R.coerce(null, "MovieClip")
	(c).fields["DialogBox"] = R.coerce(null, "MovieClip")
	(c).fields["LevelUp"] = R.coerce(null, "MovieClip")
	(c).fields["ActualCrosshair"] = R.coerce(null, "MovieClip")
	(c).fields["ComboDisplay"] = R.coerce(null, "MovieClip")
	(c).fields["TaskPrompt"] = R.coerce(null, "TextField")
	(c).fields["PauseScreenGrab"] = R.coerce(null, "MovieClip")
	(c).fields["CallChopperSupport"] = R.coerce(null, "SimpleButton")
	(c).fields["TaskPromptBG"] = R.coerce(null, "MovieClip")
	(c).fields["Bloods"] = R.coerce(null, "MovieClip")
	(c).fields["SurvivalGuideNotice"] = R.coerce(null, "MovieClip")
	(c).fields["TaskDisplay"] = R.coerce(null, "MovieClip")
	(c).fields["Overheat"] = R.coerce(null, "MovieClip")
	(c).fields["TaskPromptKey"] = R.coerce(null, "MovieClip")
	(c).fields["AmmoInMagDisplay"] = R.coerce(null, "MC_BulletCounter")
	(c).fields["HealthFlash"] = R.coerce(null, "MovieClip")
	(c).fields["BloodFlash"] = R.coerce(null, "MovieClip")
	(c).fields["LocationPointer"] = R.coerce(null, "MC_LocationDisplay")
	(c).fields["FPS"] = R.coerce(null, "TextField")
	(c).fields["RPLabel"] = R.coerce(null, "TextField")
	(c).fields["TaskCanceled"] = R.coerce(null, "MovieClip")
	(c).fields["Location"] = R.coerce(null, "TextField")
	(c).fields["MedHeal"] = R.coerce(null, "SimpleButton")
	(c).fields["CivCount"] = R.coerce(null, "TextField")
	return null
