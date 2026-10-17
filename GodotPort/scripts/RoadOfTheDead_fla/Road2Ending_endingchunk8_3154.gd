extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk8_3154(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [44, R.get_value(c, "frame45"), 69, R.get_value(c, "frame70"), 116, R.get_value(c, "frame117"), 152, R.get_value(c, "frame153")])
	return null

static func f_frame45(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [])
	return null

static func f_frame70(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [])
	return null

static func f_frame117(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [])
	return null

static func f_frame153(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk8_3154"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
