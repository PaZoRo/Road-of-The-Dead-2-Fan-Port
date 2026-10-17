extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDJetAlly(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDJetAlly"), [R.klass("MC_JetAlly"), R.static_value("RDJetAlly", "Scale")])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [2])
	c.fields["m_bUpdateOutOfView"] = true
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_JetPassBy"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(R.static_value("RDJetAlly", "PassBySpeed"))
	(c).fields["m_bPlayPassBySound"] = true
	(c).fields["m_bWarnPlayer"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJetAlly"), "SetInitialState"), [])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [2])
	(c.fields.get("m_vVelocity")).fields["Z"] = float(R.static_value("RDJetAlly", "PassBySpeed"))
	(c).fields["m_bPlayPassBySound"] = true
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = true
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDJetAlly"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bPlayPassBySound") and R.binary(">", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", R.static_value("RDJetAlly", "SoundDistance"))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["JetPassBy", 0.02, 2, 0, 1])
		(c).fields["m_bPlayPassBySound"] = false
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c.fields.get("m_vVelocity")).fields["Z"] = float((float(R.static_value("RDJetAlly", "PassBySpeed")) + float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, 0, 0, (float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))])
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", R.static_value("RDJetAlly", "FlyHeight"), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(200))))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 4, "=")
	R.set_value(c, "FlyHeight", 9, "=")
	R.set_value(c, "PassBySpeed", R.binary("/", R.binary("/", (float(300) * float(1000)), 60), 60), "=")
	R.set_value(c, "SoundDistance", 150, "=")
	R.set_value(c, "SpawnDistance", 50, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_FlySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlayPassBySound"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = false
	return null
