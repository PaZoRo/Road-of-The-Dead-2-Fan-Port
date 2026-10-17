extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_BuildingResidentialSide8(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_BuildingResidentialSide8"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["TopSpot"] = R.coerce(null, "MovieClip")
	return null
