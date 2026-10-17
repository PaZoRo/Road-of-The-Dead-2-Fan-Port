extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BulletImpactLightBrick(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BulletImpactLightBrick"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_BulletImpactLightBrick"), [12, R.get_value(c, "frame13")])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_BulletImpactLightBrick"), [])
	if R.truth(R.logical_and(R.truth(R.resolve(c, "parent", "MC_BulletImpactLightBrick")), func(): return R.invoke(R.get_value(R.resolve(c, "parent", "MC_BulletImpactLightBrick"), "contains"), [c]))):
		pass
		if R.truth(R.get_value(c, "m_owner")):
			pass
			R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnEffectEnded"), [c])
		R.invoke(R.get_value(R.resolve(c, "parent", "MC_BulletImpactLightBrick"), "removeChild"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
