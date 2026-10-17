extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Explosion2(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Explosion2"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Explosion2"), [21, R.get_value(c, "frame22")])
	return null

static func f_frame22(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Explosion2"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
