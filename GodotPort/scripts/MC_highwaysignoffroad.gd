extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_highwaysignoffroad(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_highwaysignoffroad"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_highwaysignoffroad"), [0, R.get_value(c, "frame1"), 42, R.get_value(c, "frame43")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_highwaysignoffroad"), [])
	return null

static func f_frame43(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_highwaysignoffroad"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
