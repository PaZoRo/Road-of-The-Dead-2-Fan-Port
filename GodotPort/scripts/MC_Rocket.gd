extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Rocket(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Rocket"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Rocket"), [23, R.get_value(c, "frame24"), 43, R.get_value(c, "frame44")])
	return null

static func f_frame24(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Rocket"), [])
	return null

static func f_frame44(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Rocket"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
