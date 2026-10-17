extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MineMiotionLight_2148(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.MineMiotionLight_2148"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.MineMiotionLight_2148"), [15, R.get_value(c, "frame16")])
	return null

static func f_frame16(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MineMiotionLight_2148"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
