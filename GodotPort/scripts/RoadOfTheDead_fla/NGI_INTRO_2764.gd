extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_NGI_INTRO_2764(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.NGI_INTRO_2764"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.NGI_INTRO_2764"), [279, R.get_value(c, "frame280")])
	return null

static func f_frame280(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.NGI_INTRO_2764"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
