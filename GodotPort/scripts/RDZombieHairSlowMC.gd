extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieHairSlowMC(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieHairSlowMC"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieHairSlowMC"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
		pass
		R.assign(c, "visible", "RDZombieHairSlowMC", (float(((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) < float(5)), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
