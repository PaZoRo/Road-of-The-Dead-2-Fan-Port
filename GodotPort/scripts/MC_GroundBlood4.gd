extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_GroundBlood4(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_GroundBlood4"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_GroundBlood4"), [90, R.get_value(c, "frame91")])
	return null

static func f_frame91(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
