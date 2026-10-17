extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ZombieGrub(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ZombieGrub"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_ZombieGrub"), [0, R.get_value(c, "frame1"), 5, R.get_value(c, "frame6"), 25, R.get_value(c, "frame26"), 54, R.get_value(c, "frame55")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_ZombieGrub"), [])
	return null

static func f_frame6(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame55(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Explosion"] = R.coerce(null, "MovieClip")
	return null
