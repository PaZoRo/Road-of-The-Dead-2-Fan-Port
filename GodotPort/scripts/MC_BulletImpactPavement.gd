extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BulletImpactPavement(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BulletImpactPavement"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_BulletImpactPavement"), [10, R.get_value(c, "frame11")])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_BulletImpactPavement"), [])
	if R.truth(R.logical_and(R.truth(R.resolve(c, "parent", "MC_BulletImpactPavement")), func(): return R.invoke(R.get_value(R.resolve(c, "parent", "MC_BulletImpactPavement"), "contains"), [c]))):
		pass
		R.invoke(R.get_value(R.resolve(c, "parent", "MC_BulletImpactPavement"), "removeChild"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
