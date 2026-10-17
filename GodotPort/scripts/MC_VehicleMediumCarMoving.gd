extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_VehicleMediumCarMoving(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_VehicleMediumCarMoving"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Fire"] = R.coerce(null, "MovieClip")
	(c).fields["Smoke"] = R.coerce(null, "MC_Smoke")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
