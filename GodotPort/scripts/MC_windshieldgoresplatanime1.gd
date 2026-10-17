extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_windshieldgoresplatanime1(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_windshieldgoresplatanime1"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_windshieldgoresplatanime1"), [4, R.get_value(c, "frame5")])
	return null

static func f_frame5(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_windshieldgoresplatanime1"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
