extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ChallengeModeNotice_2584(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ChallengeModeNotice_2584"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ChallengeModeNotice_2584"), [63, R.get_value(c, "frame64")])
	return null

static func f_frame64(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ChallengeModeNotice_2584"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
