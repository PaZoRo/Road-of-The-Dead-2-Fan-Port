extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_altmapletree(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_altmapletree"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_altmapletree"), [32, R.get_value(c, "frame33"), 64, R.get_value(c, "frame65"), 101, R.get_value(c, "frame102")])
	return null

static func f_frame33(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame65(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame102(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_altmapletree"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
