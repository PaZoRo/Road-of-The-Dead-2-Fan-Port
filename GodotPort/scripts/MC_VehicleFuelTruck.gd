extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_VehicleFuelTruck(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_VehicleFuelTruck"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_VehicleFuelTruck"), [0, R.get_value(c, "frame1"), 20, R.get_value(c, "frame21"), 56, R.get_value(c, "frame57")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleFuelTruck"), [])
	return null

static func f_frame21(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame57(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_VehicleFuelTruck"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
