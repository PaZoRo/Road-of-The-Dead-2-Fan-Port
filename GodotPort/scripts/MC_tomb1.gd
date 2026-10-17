extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_tomb1(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_tomb1"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_tomb1"), [29, R.get_value(c, "frame30"), 58, R.get_value(c, "frame59")])
	return null

static func f_frame30(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame59(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_tomb1"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	return null
