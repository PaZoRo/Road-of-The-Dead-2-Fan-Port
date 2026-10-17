extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarSemi(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarSemi"), [])
	c.fields["m_EnginePartClass"] = R.coerce(R.klass("MC_VehicleLargeCar24_Engine"), "Class")
	c.fields["m_CenterPartClass"] = R.coerce(R.klass("MC_VehicleLargeCar24_Center"), "Class")
	c.fields["m_BackPartClass"] = R.coerce(R.klass("MC_VehicleLargeCar24_Back"), "Class")
	c.fields["m_fEnginePartPos"] = float(3)
	c.fields["m_fCenterPartPos"] = float(0)
	c.fields["m_fBackPartPos"] = R.coerce(R.unary("-", 3), "Number")
	c.fields["m_bBlockSoldierBullets"] = true
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "HugeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarSemi"), "SetInitialState"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
