extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPlayerArmMC(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPlayerArmMC"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDPlayerArmMC"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.call_member(c, "Update", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "Update", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	v_iFrame = R.coerce((2 if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else 1), "int")
	if R.truth((float(v_iFrame) != float((c).fields.get("m_iFrame")))):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "RDPlayerArmMC"), [v_iFrame])
		(c).fields["m_iFrame"] = R.coerce(v_iFrame, "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null
