extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_largeexplosion_1058(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.largeexplosion_1058"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.largeexplosion_1058"), [19, R.get_value(c, "frame20")])
	return null

static func f_frame20(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.largeexplosion_1058"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
