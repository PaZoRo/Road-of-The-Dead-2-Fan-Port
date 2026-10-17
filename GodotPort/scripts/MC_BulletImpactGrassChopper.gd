extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BulletImpactGrassChopper(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BulletImpactGrassChopper"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_BulletImpactGrassChopper"), [16, R.get_value(c, "frame17")])
	return null

static func f_frame17(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_BulletImpactGrassChopper"), [])
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
