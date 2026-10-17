extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_snowman(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_snowman"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_snowman"), [46, R.get_value(c, "frame47")])
	return null

static func f_frame47(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
