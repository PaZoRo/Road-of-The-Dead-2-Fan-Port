extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_HelicopterDust(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_HelicopterDust"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_HelicopterDust"), [0, R.get_value(c, "frame1"), 37, R.get_value(c, "frame38"), 77, R.get_value(c, "frame78"), 113, R.get_value(c, "frame114"), 143, R.get_value(c, "frame144")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterDust"), [])
	return null

static func f_frame38(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterDust"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame78(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterDust"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame114(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterDust"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame144(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterDust"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
