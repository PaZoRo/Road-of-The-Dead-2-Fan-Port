extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDMissileAlly(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMissileAlly"), [R.klass("MC_rocketflyingback"), R.static_value("RDMissileAlly", "Scale")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Missile"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = R.coerce(R.unary("-", 0.1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(0.2)
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_iPropertyValue"] = R.coerce(500, "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMissileAlly"), "SetInitialState"), [])
	(c).fields["m_bExploded"] = false
	R.call_member((c).fields.get("m_vSimulatedPos"), "SetZero", [])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bExploded")) and ((((((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Obstacle")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Ramp")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Building")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Volume")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Helicopter")))))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMissileAlly"), "OnAddedToWorld"), [])
	R.call_member((c).fields.get("m_vSimulatedPos"), "Set", [c.fields.get("m_vTrajectoryStart")])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_fWallPos: Variant = NAN
	var v_iSlideIndex: Variant = 0
	var v_iSlice: Variant = 0
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_fNewZ: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_fWallPos = float(NAN)
	v_iSlideIndex = R.coerce(0, "int")
	v_iSlice = R.coerce(0, "int")
	if R.truth((c).fields.get("m_bExploded")):
		pass
		return null
	((c).fields.get("m_vSimulatedPos")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_vSimulatedPos")).fields.get("X"), (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime))), "Number")
	((c).fields.get("m_vSimulatedPos")).fields["Y"] = R.coerce(R.binary("+", ((c).fields.get("m_vSimulatedPos")).fields.get("Y"), (float((c.fields.get("m_vVelocity")).fields.get("Y")) * float(v_fDeltaTime))), "Number")
	((c).fields.get("m_vSimulatedPos")).fields["Z"] = R.coerce(R.binary("+", ((c).fields.get("m_vSimulatedPos")).fields.get("Z"), (float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))), "Number")
	v_fNewX = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), ((c).fields.get("m_vSimulatedPos")).fields.get("X"), v_fDeltaTime, 15]), "Number")
	v_fNewY = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("Y"), ((c).fields.get("m_vSimulatedPos")).fields.get("Y"), v_fDeltaTime, 15]), "Number")
	v_fNewZ = float(((c).fields.get("m_vSimulatedPos")).fields.get("Z"))
	v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fDeltaY = float((float(v_fNewY) - float((c.fields.get("m_vLocation")).fields.get("Y"))))
	v_fDeltaZ = float((float(v_fNewZ) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Y")) <= float(v_fPerlinY))):
		pass
		(c.fields.get("m_vLocation")).fields["Y"] = float(v_fPerlinY)
		R.call_member(c, "Explode", [])
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Y")) < float((float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight")))))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", ((c.fields.get("m_World")).fields.get("m_Game")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		if R.truth(R.binary("==", R.get_value(((v_gameplayMode).fields.get("m_Road")).fields.get("m_RoadSlices"), "length"), 0)):
			pass
			v_fWallPos = float((float(v_fPerlinX) + float(R.static_value("RDRoad", "SideRoadPosX"))))
		else:
			pass
			v_iSlideIndex = R.coerce(floorf(float(R.binary("/", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((((c.fields.get("m_World")).fields.get("m_Game")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))), R.static_value("RDRoad", "RenderStepSize")))), "int")
			v_iSlice = R.coerce(R.coerce(R.get_value(((v_gameplayMode).fields.get("m_Road")).fields.get("m_RoadSlices"), v_iSlideIndex), "int"), "int")
			if R.truth((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
				pass
				v_fWallPos = float((float(v_fPerlinX) + float(R.static_value("RDRoad", "AlleywayPosX"))))
			else:
				pass
				v_fWallPos = float((float(v_fPerlinX) + float(R.static_value("RDRoad", "FarWallPosX"))))
		if R.truth(R.binary("<=", (c.fields.get("m_vLocation")).fields.get("X"), R.unary("-", v_fWallPos))):
			pass
			(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.unary("-", v_fWallPos), "Number")
			R.call_member(c, "Explode", [])
		else:
			pass
			if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) >= float(v_fWallPos))):
				pass
				(c.fields.get("m_vLocation")).fields["X"] = float(v_fWallPos)
				R.call_member(c, "Explode", [])
	return null

static func f_Touched(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "HandleTouchSomething", [v_entity])
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "HandleTouchSomething", [v_entity])
	return null

static func f_HandleTouchSomething(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.set_value((v_entity).fields.get("m_vLocation"), "Z", 1, "-=")
	R.call_member(c, "UpdateDepthPosition", [])
	R.call_member(c, "Explode", [])
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Explode"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
	R.call_member(c, "DealRadialDamage", [c.fields.get("m_Instigator"), R.static_value("RDMissileAlly", "ExplosionRangeX"), R.static_value("RDMissileAlly", "ExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Missile")])
	(c).fields["m_bExploded"] = true
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iPropertyValue"), R.binary("+", R.unary("-", 20), R.call_static("Maths", "RandomInt", [41])))), "int")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return ((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(200)))) or R.binary(">", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 30))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3, "=")
	R.set_value(c, "ExplosionRangeX", 5, "=")
	R.set_value(c, "ExplosionRangeZ", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fExplosionDamage"] = float(2000)
	(c).fields["m_bExploded"] = false
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_vSimulatedPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	return null
