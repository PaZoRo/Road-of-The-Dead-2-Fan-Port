extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Road2Ending_endingchunk11_3176(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Road2Ending_endingchunk11_3176"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Road2Ending_endingchunk11_3176"), [139, R.get_value(c, "frame140")])
	return null

static func f_frame140(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Road2Ending_endingchunk11_3176"), ["idle"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
