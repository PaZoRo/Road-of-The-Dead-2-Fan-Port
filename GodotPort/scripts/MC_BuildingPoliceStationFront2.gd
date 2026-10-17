extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BuildingPoliceStationFront2(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BuildingPoliceStationFront2"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Door"] = R.coerce(null, "MovieClip")
	return null
