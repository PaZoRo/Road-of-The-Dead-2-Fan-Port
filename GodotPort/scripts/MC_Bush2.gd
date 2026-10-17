extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Bush2(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Bush2"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Bush2"), [14, R.get_value(c, "frame15")])
	return null

static func f_frame15(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
