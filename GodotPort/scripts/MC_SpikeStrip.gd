extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_SpikeStrip(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_SpikeStrip"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_SpikeStrip"), [0, R.get_value(c, "frame1"), 22, R.get_value(c, "frame23")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_SpikeStrip"), [])
	return null

static func f_frame23(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
