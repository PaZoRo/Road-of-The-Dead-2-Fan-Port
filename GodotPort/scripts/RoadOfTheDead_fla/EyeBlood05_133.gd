extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_EyeBlood05_133(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.EyeBlood05_133"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.EyeBlood05_133"), [1, R.get_value(c, "frame2")])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.EyeBlood05_133"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
