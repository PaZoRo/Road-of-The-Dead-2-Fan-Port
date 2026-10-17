extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_tomb2(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_tomb2"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_tomb2"), [26, R.get_value(c, "frame27"), 52, R.get_value(c, "frame53")])
	return null

static func f_frame27(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame53(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_tomb2"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	return null
