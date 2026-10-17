extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_tutorialmouseicon_201(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.tutorialmouseicon_201"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.tutorialmouseicon_201"), [17, R.get_value(c, "frame18"), 25, R.get_value(c, "frame26")])
	return null

static func f_frame18(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.tutorialmouseicon_201"), ["Slow"])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.tutorialmouseicon_201"), ["Fast"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
