extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarArmyTruck(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarArmyTruck"), [])
	c.fields["m_EnginePartClass"] = R.coerce(R.klass("MC_VehicleLargeCar21_Engine"), "Class")
	c.fields["m_BackPartClass"] = R.coerce(R.klass("MC_VehicleLargeCar21_Back"), "Class")
	c.fields["m_fEnginePartPos"] = R.coerce(R.unary("-", 2.5), "Number")
	c.fields["m_fBackPartPos"] = float(2.5)
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "HugeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarArmyTruck"), "SetInitialState"), [])
	return null

static func f_SplitCar(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDEntity", "Event_Exploded")])
	c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
	R.call_member(c.fields.get("m_World"), "RemoveAmmoPoint", [c])
	if R.truth(c.fields.get("m_ArcadeAmmoPickup")):
		pass
		(c.fields.get("m_ArcadeAmmoPickup")).fields["m_bDestroyMe"] = true
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarArmyTruck"), "SplitCar"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
