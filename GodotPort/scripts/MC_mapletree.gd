extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_mapletree(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_mapletree"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_mapletree"), [33, R.get_value(c, "frame34"), 65, R.get_value(c, "frame66"), 102, R.get_value(c, "frame103")])
	return null

static func f_frame34(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame66(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame103(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_mapletree"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
