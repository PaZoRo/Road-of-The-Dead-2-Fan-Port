extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DogTekIntroMC(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DogTekIntroMC"), [])
	R.invoke(R.resolve(c, "addFrameScript", "DogTekIntroMC"), [48, R.get_value(c, "frame49"), 78, R.get_value(c, "frame79"), 83, R.get_value(c, "frame84")])
	return null

static func f_frame49(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StartEffect", [])
	return null

static func f_frame79(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopEffect", [])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "DogTekIntroMC"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
