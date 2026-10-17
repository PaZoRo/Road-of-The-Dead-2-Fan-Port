extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ShermanMouth_3128(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ShermanMouth_3128"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ShermanMouth_3128"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ShermanMouth_3128"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
