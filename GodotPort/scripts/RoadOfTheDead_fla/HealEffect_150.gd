extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_HealEffect_150(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.HealEffect_150"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.HealEffect_150"), [0, R.get_value(c, "frame1"), 29, R.get_value(c, "frame30")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.HealEffect_150"), [])
	return null

static func f_frame30(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.HealEffect_150"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
