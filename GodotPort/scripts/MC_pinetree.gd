extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_pinetree(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_pinetree"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_pinetree"), [28, R.get_value(c, "frame29"), 55, R.get_value(c, "frame56"), 80, R.get_value(c, "frame81")])
	return null

static func f_frame29(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame56(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame81(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_pinetree"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
