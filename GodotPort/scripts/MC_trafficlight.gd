extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_trafficlight(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_trafficlight"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_trafficlight"), [219, R.get_value(c, "frame220"), 235, R.get_value(c, "frame236"), 291, R.get_value(c, "frame292")])
	return null

static func f_frame220(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_trafficlight"), ["Idle"])
	return null

static func f_frame236(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame292(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_trafficlight"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
