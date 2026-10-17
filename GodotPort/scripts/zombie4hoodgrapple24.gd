extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_zombie4hoodgrapple24(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "zombie4hoodgrapple24"), [])
	R.invoke(R.resolve(c, "addFrameScript", "zombie4hoodgrapple24"), [18, R.get_value(c, "frame19"), 54, R.get_value(c, "frame55")])
	return null

static func f_frame19(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "zombie4hoodgrapple24"), ["Normal"])
	return null

static func f_frame55(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "zombie4hoodgrapple24"), ["Alpha"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
