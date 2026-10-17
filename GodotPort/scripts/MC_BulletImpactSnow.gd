extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BulletImpactSnow(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BulletImpactSnow"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_BulletImpactSnow"), [7, R.get_value(c, "frame8")])
	return null

static func f_frame8(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
