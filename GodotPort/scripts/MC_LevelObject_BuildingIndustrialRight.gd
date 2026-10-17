extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_LevelObject_BuildingIndustrialRight(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_LevelObject_BuildingIndustrialRight"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Front"] = R.coerce(null, "MovieClip")
	return null
