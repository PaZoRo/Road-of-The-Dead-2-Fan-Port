extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Jet(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Jet"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Jet"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Jet"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
