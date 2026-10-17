extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_steeringarmRight_847(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.steeringarmRight_847"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.steeringarmRight_847"), [20, R.get_value(c, "frame21"), 35, R.get_value(c, "frame36"), 64, R.get_value(c, "frame65"), 81, R.get_value(c, "frame82")])
	return null

static func f_frame21(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(c, "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["HandsDown"])
	return null

static func f_frame36(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(c, "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["HandsUp"])
	return null

static func f_frame65(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(c, "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["HandsDown"])
	return null

static func f_frame82(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.get_value(c, "parent"), R.klass("MovieClip")), "m_owner"), "OnAnimEvent"), ["HandsUp"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["FemaleClosed"] = R.coerce(null, "MC_diane_steeringarm")
	(c).fields["FemaleOpen"] = R.coerce(null, "MC_diane_steeringarm_open")
	(c).fields["MaleOpen"] = R.coerce(null, "MC_chicota_steeringarm_open")
	(c).fields["MaleClosed"] = R.coerce(null, "MC_chicota_steeringarm")
	return null
