extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDDamageType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDamageType"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Generic", 0, "=")
	R.set_value(c, "HelicopterBullet", 1, "=")
	R.set_value(c, "SoldierMachineGunBullet", 2, "=")
	R.set_value(c, "SoldierPistolBullet", 3, "=")
	R.set_value(c, "Explosive", 4, "=")
	R.set_value(c, "Missile", 5, "=")
	R.set_value(c, "GenericBullet", 6, "=")
	R.set_value(c, "BlastingBullet", 7, "=")
	R.set_value(c, "ShreddingBullet", 8, "=")
	R.set_value(c, "DevastatingBullet", 9, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
