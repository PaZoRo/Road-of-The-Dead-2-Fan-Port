extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_trafficcone(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_trafficcone"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_trafficcone"), [0, R.get_value(c, "frame1"), 9, R.get_value(c, "frame10")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_trafficcone"), [])
	return null

static func f_frame10(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
