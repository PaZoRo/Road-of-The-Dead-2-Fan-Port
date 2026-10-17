extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_CivCountItem_141(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.CivCountItem_141"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.CivCountItem_141"), [0, R.get_value(c, "frame1"), 12, R.get_value(c, "frame13")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.CivCountItem_141"), [])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.CivCountItem_141"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
