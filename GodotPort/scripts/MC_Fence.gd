extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Fence(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Fence"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Fence"), [0, R.get_value(c, "frame1"), 14, R.get_value(c, "frame15"), 30, R.get_value(c, "frame31")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Fence"), [])
	return null

static func f_frame15(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Fence"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame31(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Fence"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
