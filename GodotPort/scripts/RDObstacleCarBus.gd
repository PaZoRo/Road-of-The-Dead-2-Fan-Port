extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarBus(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarBus"), [])
	c.fields["m_EnginePartClass"] = R.coerce(R.klass("MC_VehicleLargeCar22_Engine"), "Class")
	c.fields["m_BackPartClass"] = R.coerce(R.klass("MC_VehicleLargeCar22_Back"), "Class")
	c.fields["m_fEnginePartPos"] = R.coerce(R.unary("-", 2.5), "Number")
	c.fields["m_fBackPartPos"] = float(2.5)
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "HugeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarBus"), "SetInitialState"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
