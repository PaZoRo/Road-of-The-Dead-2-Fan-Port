extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_VehicleSmallCar10(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_VehicleSmallCar10"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_VehicleSmallCar10"), [0, R.get_value(c, "frame1"), 12, R.get_value(c, "frame13")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleSmallCar10"), [])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleSmallCar10"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Fire"] = R.coerce(null, "MovieClip")
	(c).fields["Smoke"] = R.coerce(null, "MC_Smoke")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	return null
