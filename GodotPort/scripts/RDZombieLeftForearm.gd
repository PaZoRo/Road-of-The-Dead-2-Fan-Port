extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieLeftForearm(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieLeftForearm"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieLeftForearm"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieLeftForearm"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "OnAddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnAddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = null
	v_clinger = R.coerce(null, "RDHumanoid")
	if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
		pass
		v_clinger = R.coerce(R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieLeftForearm"), R.klass("MovieClip"))]), "RDHumanoid")
		if R.truth(v_clinger):
			pass
			R.assign(c, "visible", "RDZombieLeftForearm", R.unary("!", (v_clinger).fields.get("m_bClingLeftArmLost")), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
