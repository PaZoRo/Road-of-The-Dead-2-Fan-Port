extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDArcadeAmmoPickup(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDArcadeAmmoPickup"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Volume"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = float((float((((c).fields.get("m_Car")).fields.get("m_CollisionBounds")).fields.get("X")) - float(4)))
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float((((c).fields.get("m_Car")).fields.get("m_CollisionBounds")).fields.get("W")) + float(8)))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_car: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacleCarMilitary")
	(c).fields["m_Car"] = R.coerce(v_car, "RDObstacleCarMilitary")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "Update"), [v_fDeltaTime])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "TouchedBy"), [v_entity])
	if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
		pass
		R.call_member((c).fields.get("m_Player"), "DoAmmoPointTask", [(c).fields.get("m_Car"), true])
		c.fields["m_bDestroyMe"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Car"] = R.coerce(null, "RDObstacleCarMilitary")
	return null
