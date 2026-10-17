extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_jasonmaskside(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_jasonmaskside"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_jasonmaskside"), [0, R.get_value(c, "frame1"), 13, R.get_value(c, "frame14"), 25, R.get_value(c, "frame26"), 38, R.get_value(c, "frame39"), 52, R.get_value(c, "frame53"), 65, R.get_value(c, "frame66"), 80, R.get_value(c, "frame81"), 91, R.get_value(c, "frame92")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame14(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame39(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame53(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame66(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame81(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_frame92(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskside"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
