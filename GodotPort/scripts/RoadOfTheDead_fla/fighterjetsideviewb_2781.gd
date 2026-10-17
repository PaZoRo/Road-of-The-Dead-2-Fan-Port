extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_fighterjetsideviewb_2781(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.fighterjetsideviewb_2781"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.fighterjetsideviewb_2781"), [53, R.get_value(c, "frame54")])
	return null

static func f_frame54(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.fighterjetsideviewb_2781"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
