extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk6_3132(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [21, R.get_value(c, "frame22"), 42, R.get_value(c, "frame43"), 84, R.get_value(c, "frame85"), 126, R.get_value(c, "frame127"), 166, R.get_value(c, "frame167")])
	return null

static func f_frame22(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	return null

static func f_frame43(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	return null

static func f_frame85(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	return null

static func f_frame127(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	return null

static func f_frame167(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk6_3132"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
