extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_dudebroprofile_2329(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.dudebroprofile_2329"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.dudebroprofile_2329"), [2, R.get_value(c, "frame3"), 22, R.get_value(c, "frame23"), 30, R.get_value(c, "frame31")])
	return null

static func f_frame3(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.dudebroprofile_2329"), ["Idle"])
	return null

static func f_frame23(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.dudebroprofile_2329"), ["Talk"])
	return null

static func f_frame31(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.dudebroprofile_2329"), ["Scream"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Bandana"] = R.coerce(null, "MovieClip")
	return null
