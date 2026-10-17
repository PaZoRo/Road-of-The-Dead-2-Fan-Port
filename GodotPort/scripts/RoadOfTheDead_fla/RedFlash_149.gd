extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RedFlash_149(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.RedFlash_149"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.RedFlash_149"), [0, R.get_value(c, "frame1"), 10, R.get_value(c, "frame11"), 20, R.get_value(c, "frame21")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.RedFlash_149"), [])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.RedFlash_149"), [])
	return null

static func f_frame21(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.RedFlash_149"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Heal"] = R.coerce(null, "MovieClip")
	return null
