extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SND_CochetaGunnerHoodZombie1(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SND_CochetaGunnerHoodZombie1"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
