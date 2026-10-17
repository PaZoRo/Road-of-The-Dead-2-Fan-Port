extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_NGI_MASK_CUBE_2768(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.NGI_MASK_CUBE_2768"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.NGI_MASK_CUBE_2768"), [19, R.get_value(c, "frame20")])
	return null

static func f_frame20(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.NGI_MASK_CUBE_2768"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
