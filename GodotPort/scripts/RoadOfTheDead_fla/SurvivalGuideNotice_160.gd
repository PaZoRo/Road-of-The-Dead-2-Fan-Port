extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SurvivalGuideNotice_160(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.SurvivalGuideNotice_160"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.SurvivalGuideNotice_160"), [0, R.get_value(c, "frame1"), 82, R.get_value(c, "frame83")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.SurvivalGuideNotice_160"), [])
	return null

static func f_frame83(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.SurvivalGuideNotice_160"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["SurvivalGuide"] = R.coerce(null, "MovieClip")
	return null
