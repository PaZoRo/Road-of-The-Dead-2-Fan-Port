extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarHuge(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarHuge"), [])
	c.fields["m_iSpawnCapacity"] = R.coerce(5, "int")
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "HugeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarHuge"), "SetInitialState"), [])
	c.fields["m_iSpawnCapacity"] = R.coerce(5, "int")
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarHuge"), "OnAddedToWorld"), [])
	R.call_member(c.fields.get("m_World"), "AddZombieSpawner", [c, R.static_value("RDSpawnerInfo", "Type_All")])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_World"), "RemoveZombieSpawner", [c])
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarHuge"), "Destroy"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
