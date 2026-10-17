extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSpawnType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpawnType"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "None", 0, "=")
	R.set_value(c, "Zombie", 1, "=")
	R.set_value(c, "Soldier", 2, "=")
	R.set_value(c, "Civilian", 3, "=")
	R.set_value(c, "RoadObject", 4, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
