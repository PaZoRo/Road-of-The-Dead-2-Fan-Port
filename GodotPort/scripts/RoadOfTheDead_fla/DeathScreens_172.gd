extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DeathScreens_172(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.DeathScreens_172"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.DeathScreens_172"), [187, R.get_value(c, "frame188"), 446, R.get_value(c, "frame447"), 462, R.get_value(c, "frame463"), 602, R.get_value(c, "frame603")])
	return null

static func f_frame188(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.DeathScreens_172"), [])
	return null

static func f_frame447(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.DeathScreens_172"), [])
	return null

static func f_frame463(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.DeathScreens_172"), [])
	return null

static func f_frame603(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.DeathScreens_172"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
