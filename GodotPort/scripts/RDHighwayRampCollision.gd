extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHighwayRampCollision(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHighwayRampCollision"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Ramp"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDRoad", "FarWallPosX")), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float(R.static_value("RDRoad", "FarWallPosX")) * float(2)))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_ramp: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHighwayRamp")
	(c).fields["m_Ramp"] = R.coerce(v_ramp, "RDHighwayRamp")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "Update"), [v_fDeltaTime])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "TouchedBy"), [v_entity])
	if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		if R.truth(R.binary("!=", ((c).fields.get("m_Ramp")).fields.get("m_szFactoryName"), "HighwayRamp")):
			pass
			R.call_member(v_gameplayMode, "OnRampReached", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Ramp"] = R.coerce(null, "RDHighwayRamp")
	return null
