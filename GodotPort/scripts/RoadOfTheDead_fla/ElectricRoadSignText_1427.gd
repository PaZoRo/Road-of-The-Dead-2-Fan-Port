extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ElectricRoadSignText_1427(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ElectricRoadSignText_1427"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ElectricRoadSignText_1427"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.ElectricRoadSignText_1427"), [(float(2) + float(floorf(float((float(randf()) * float(3))))))])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
