extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_jasonmaskfront(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_jasonmaskfront"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_jasonmaskfront"), [0, R.get_value(c, "frame1"), 15, R.get_value(c, "frame16"), 27, R.get_value(c, "frame28"), 40, R.get_value(c, "frame41"), 54, R.get_value(c, "frame55"), 67, R.get_value(c, "frame68"), 82, R.get_value(c, "frame83"), 95, R.get_value(c, "frame96")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame16(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame28(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame41(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame55(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame68(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame83(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_frame96(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_jasonmaskfront"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
