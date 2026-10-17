extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_WaterFlow_1678(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.WaterFlow_1678"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.WaterFlow_1678"), [34, R.get_value(c, "frame35")])
	return null

static func f_frame35(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.WaterFlow_1678"), ["loop"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
