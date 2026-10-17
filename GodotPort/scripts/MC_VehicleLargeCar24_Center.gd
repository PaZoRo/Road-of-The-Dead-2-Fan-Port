extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_VehicleLargeCar24_Center(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_VehicleLargeCar24_Center"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_VehicleLargeCar24_Center"), [10, R.get_value(c, "frame11")])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleLargeCar24_Center"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
