extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk5_talkhead_3126(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), [0, R.get_value(c, "frame1"), 7, R.get_value(c, "frame8"), 12, R.get_value(c, "frame13"), 23, R.get_value(c, "frame24"), 111, R.get_value(c, "frame112")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), [])
	return null

static func f_frame8(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), [R.resolve(c, "currentLabel", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126")])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), ["idle"])
	return null

static func f_frame24(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), [R.resolve(c, "currentLabel", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126")])
	return null

static func f_frame112(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Road2Ending_endingchunk5_talkhead_3126"), ["idle"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Mouth"] = R.coerce(null, "MovieClip")
	return null
