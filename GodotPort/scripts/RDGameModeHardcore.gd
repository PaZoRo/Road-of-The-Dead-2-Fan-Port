extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeHardcore(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeHardcore"), [v_theGame])
	c.fields["m_bIsHardcore"] = true
	return null

static func f_OnStartDriverSelection(c: Variant, a: Array) -> Variant:
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	c.fields["m_bIsChopperShootingLevel"] = false
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeHardcore"), "StartGameMode"), [])
	return null

static func f_SetSavedLevel(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(v_iLevel, "int")
	return null

static func f_GetSavedLevel(c: Variant, a: Array) -> Variant:
	return (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHardcoreStoryLevel")
	return null

static func f_CompleteStoryMode(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "HardcoreSurvival")))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "HardcoreSurvival")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
