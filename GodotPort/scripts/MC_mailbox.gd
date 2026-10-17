extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_mailbox(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_mailbox"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_mailbox"), [25, R.get_value(c, "frame26"), 83, R.get_value(c, "frame84")])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_mailbox"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
