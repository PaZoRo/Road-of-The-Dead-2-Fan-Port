extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_electronicsign(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_electronicsign"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_electronicsign"), [0, R.get_value(c, "frame1"), 17, R.get_value(c, "frame18")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_electronicsign"), [])
	return null

static func f_frame18(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Message"] = R.coerce(null, "MovieClip")
	return null
