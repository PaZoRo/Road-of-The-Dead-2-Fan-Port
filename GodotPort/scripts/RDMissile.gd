extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDMissile(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMissile"), [R.klass("MC_Rocket"), R.static_value("RDMissile", "Scale")])
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMissile"), "SetInitialState"), [])
	(c).fields["m_bExploded"] = false
	(c).fields["m_Target"] = R.coerce(null, "RDPlayer")
	return null

static func f_StartSeek(c: Variant, a: Array) -> Variant:
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	var v_bRightSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	(c).fields["m_Target"] = R.coerce(v_target, "RDPlayer")
	(c).fields["m_bRightSide"] = v_bRightSide
	(c.fields.get("m_vVelocity")).fields["X"] = R.coerce((R.static_value("RDMissile", "InitialSpeedX") if R.truth((c).fields.get("m_bRightSide")) else R.unary("-", R.static_value("RDMissile", "InitialSpeedX"))), "Number")
	(c.fields.get("m_vVelocity")).fields["Y"] = float(R.static_value("RDMissile", "InitialSpeedY"))
	(c.fields.get("m_vVelocity")).fields["Z"] = float(((v_target).fields.get("m_vVelocity")).fields.get("Z"))
	(c).fields["m_fInitialPosY"] = float((float((c.fields.get("m_vLocation")).fields.get("Y")) - R.num(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c).fields["m_fInitialPosX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c).fields["m_fPosXOffset"] = float((float((v_target).fields.get("m_fRelativeLocationX")) - float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))))
	(c).fields["m_fInitialDistanceZ"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((float(((v_target).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDMissile", "TargetOffsetZ"))))))
	(c).fields["m_fRelativePositionX"] = float((c).fields.get("m_fInitialPosX"))
	(c).fields["m_fRelativePositionY"] = float((c).fields.get("m_fInitialPosY"))
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fOldPosY: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fDistanceZ: Variant = NAN
	var v_fOldPosX: Variant = NAN
	var v_fNewPosX: Variant = NAN
	var v_fNewPosY: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldPosY = float(NAN)
	v_fPerlinY = float(NAN)
	if R.truth((c).fields.get("m_bExploded")):
		pass
		return null
	v_fDistanceZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((float((((c).fields.get("m_Target")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDMissile", "TargetOffsetZ"))))))
	v_fOldPosX = float((c).fields.get("m_fRelativePositionX"))
	v_fNewPosX = float((float((c).fields.get("m_fInitialPosX")) + float((float((float(1) - float(R.binary("/", v_fDistanceZ, (c).fields.get("m_fInitialDistanceZ"))))) * float((c).fields.get("m_fPosXOffset"))))))
	v_fOldPosY = float((c).fields.get("m_fRelativePositionY"))
	v_fNewPosY = float((float(R.binary("/", v_fDistanceZ, (c).fields.get("m_fInitialDistanceZ"))) * float((c).fields.get("m_fInitialPosY"))))
	(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(R.binary("-", (c.fields.get("m_vVelocity")).fields.get("Z"), (float(R.static_value("RDMissile", "AccelZ")) * float(v_fDeltaTime))), "Number")
	v_fDeltaX = float((float(v_fNewPosX) - float(v_fOldPosX)))
	v_fDeltaY = float((float(v_fNewPosY) - float(v_fOldPosY)))
	v_fDeltaZ = float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime)))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	(c).fields["m_fRelativePositionX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativePositionX"), v_fDeltaX), "Number")
	(c).fields["m_fRelativePositionY"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativePositionY"), v_fDeltaY), "Number")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c.fields.get("m_vLocation")).fields["X"] = float((float((c).fields.get("m_fRelativePositionX")) + float(v_fPerlinX)))
	(c.fields.get("m_vLocation")).fields["Y"] = float((float((c).fields.get("m_fRelativePositionY")) + float(v_fPerlinY)))
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Y")) <= float(v_fPerlinY))):
		pass
		(c.fields.get("m_vLocation")).fields["Y"] = float(v_fPerlinY)
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Explode"])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
		R.call_member(c, "DealRadialDamage", [c, R.static_value("RDMissile", "ExplosionRangeX"), R.static_value("RDMissile", "ExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Missile")])
		(c).fields["m_bExploded"] = true
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3, "=")
	R.set_value(c, "ExplosionRangeX", 5, "=")
	R.set_value(c, "ExplosionRangeZ", 15, "=")
	R.set_value(c, "InitialSpeedX", 10, "=")
	R.set_value(c, "InitialSpeedY", 5, "=")
	R.set_value(c, "AccelX", 20, "=")
	R.set_value(c, "DeccelY", 10, "=")
	R.set_value(c, "AccelZ", 15, "=")
	R.set_value(c, "DropAccel", 12, "=")
	R.set_value(c, "TargetOffsetZ", 10, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRightSide"] = false
	(c).fields["m_Target"] = R.coerce(null, "RDPlayer")
	(c).fields["m_fInitialPosY"] = float(NAN)
	(c).fields["m_fInitialPosX"] = float(NAN)
	(c).fields["m_fPosXOffset"] = float(NAN)
	(c).fields["m_fInitialDistanceZ"] = float(NAN)
	(c).fields["m_fExplosionDamage"] = float(2000)
	(c).fields["m_bExploded"] = false
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fRelativePositionX"] = float(NAN)
	(c).fields["m_fRelativePositionY"] = float(NAN)
	return null
