extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_NGI_MASK_IN_2767(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.NGI_MASK_IN_2767"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.NGI_MASK_IN_2767"), [24, R.get_value(c, "frame25")])
	return null

static func f_frame25(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.NGI_MASK_IN_2767"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
