extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_VehicleLargeCar23_Engine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_VehicleLargeCar23_Engine"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_VehicleLargeCar23_Engine"), [7, R.get_value(c, "frame8")])
	return null

static func f_frame8(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleLargeCar23_Engine"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Fire"] = R.coerce(null, "MovieClip")
	(c).fields["Smoke"] = R.coerce(null, "MC_Smoke")
	return null
