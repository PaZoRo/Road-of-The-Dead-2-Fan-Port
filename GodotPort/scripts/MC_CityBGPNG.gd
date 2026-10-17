extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_CityBGPNG(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_CityBGPNG"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Left"] = R.coerce(null, "MovieClip")
	(c).fields["Right"] = R.coerce(null, "MovieClip")
	(c).fields["Center"] = R.coerce(null, "MovieClip")
	return null
