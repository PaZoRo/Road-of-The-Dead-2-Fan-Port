extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_rocketflyingback(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_rocketflyingback"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_rocketflyingback"), [23, R.get_value(c, "frame24"), 56, R.get_value(c, "frame57")])
	return null

static func f_frame24(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_rocketflyingback"), [1])
	return null

static func f_frame57(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
