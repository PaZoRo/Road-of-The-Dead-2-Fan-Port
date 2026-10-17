extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_smallexplosion_789(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.smallexplosion_789"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.smallexplosion_789"), [17, R.get_value(c, "frame18")])
	return null

static func f_frame18(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.smallexplosion_789"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
