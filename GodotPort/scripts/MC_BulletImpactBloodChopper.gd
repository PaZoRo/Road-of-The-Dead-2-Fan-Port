extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BulletImpactBloodChopper(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BulletImpactBloodChopper"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_BulletImpactBloodChopper"), [10, R.get_value(c, "frame11")])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_BulletImpactBloodChopper"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
