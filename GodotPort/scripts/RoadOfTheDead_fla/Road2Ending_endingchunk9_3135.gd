extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk9_3135(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [92, R.get_value(c, "frame93"), 153, R.get_value(c, "frame154"), 177, R.get_value(c, "frame178"), 222, R.get_value(c, "frame223"), 267, R.get_value(c, "frame268"), 337, R.get_value(c, "frame338")])
	return null

static func f_frame93(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_frame154(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_frame178(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_frame223(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_frame268(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_frame338(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk9_3135"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
