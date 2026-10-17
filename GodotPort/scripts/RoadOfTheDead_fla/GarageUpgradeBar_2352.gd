extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_GarageUpgradeBar_2352(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.GarageUpgradeBar_2352"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.GarageUpgradeBar_2352"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.GarageUpgradeBar_2352"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
