extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_menublast_2785(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.menublast_2785"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.menublast_2785"), [35, R.get_value(c, "frame36")])
	return null

static func f_frame36(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.menublast_2785"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
