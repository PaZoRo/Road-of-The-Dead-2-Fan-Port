extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk5_3119(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [49, R.get_value(c, "frame50"), 83, R.get_value(c, "frame84"), 116, R.get_value(c, "frame117"), 157, R.get_value(c, "frame158")])
	return null

static func f_frame50(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [])
	return null

static func f_frame117(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [])
	return null

static func f_frame158(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk5_3119"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
