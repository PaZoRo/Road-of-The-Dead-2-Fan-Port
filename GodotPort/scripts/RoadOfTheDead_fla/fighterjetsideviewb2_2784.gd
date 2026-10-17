extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_fighterjetsideviewb2_2784(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.fighterjetsideviewb2_2784"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.fighterjetsideviewb2_2784"), [60, R.get_value(c, "frame61")])
	return null

static func f_frame61(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.fighterjetsideviewb2_2784"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
