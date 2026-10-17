extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarLarge(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarLarge"), [])
	c.fields["m_iSpawnCapacity"] = R.coerce(2, "int")
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "LargeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarLarge"), "SetInitialState"), [])
	c.fields["m_iSpawnCapacity"] = R.coerce(2, "int")
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarLarge"), "OnAddedToWorld"), [])
	R.call_member(c.fields.get("m_World"), "AddZombieSpawner", [c, R.static_value("RDSpawnerInfo", "Type_All")])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_World"), "RemoveZombieSpawner", [c])
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarLarge"), "Destroy"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
