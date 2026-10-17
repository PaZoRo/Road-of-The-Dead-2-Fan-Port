extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDJohnCar(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDJohnCar"), [R.klass("MC_johnscarbackview"), R.static_value("RDJohnCar", "Scale")])
	c.fields["m_fMinRenderScale"] = float(0.003)
	(c).fields["m_EngineSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_CarMaxSpeed4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_HornSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Horn2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_JohnCameo"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_bCallToPlayer"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "SetInitialState"), [])
	(c).fields["m_bCallToPlayer"] = true
	(c).fields["m_bCalledPlayer"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "Update"), [v_fDeltaTime])
	if R.truth(R.unary("!", R.call_member((c).fields.get("m_EngineSound"), "IsPlaying", []))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_EngineSound"), true])
	if R.truth(((c).fields.get("m_bCallToPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_VoiceSound")])
		(c).fields["m_bCallToPlayer"] = false
		(c).fields["m_bCalledPlayer"] = true
	if R.truth(((c).fields.get("m_bCalledPlayer") and R.unary("!", R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", [])))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		R.call_member(v_storyMode, "OnJohnCalled", [])
		(c).fields["m_bCalledPlayer"] = false
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fSpeedX: Variant = NAN
	var v_fDistanceRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedX = float(R.static_value("RDJohnCar", "SpeedX"))
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce((R.unary("-", 5) if R.truth(R.binary(">", (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]))) else 5), "Number")
		v_fSpeedX = R.coerce(R.binary("*", v_fSpeedX, 10), "Number")
	else:
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = float(0)
	v_fDistanceRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), 100), 0, 1]), "Number")
	(c.fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("Z"), (R.num(R.call_static("Maths", "Lerp", [(float(((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")) * float(1.25)), (float(((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")) * float(5)), (float((float(v_fDistanceRatio) * float(v_fDistanceRatio))) * float(v_fDistanceRatio))])) * float(v_fDeltaTime))), "Number")
	if R.truth((float(((c).fields.get("m_vMoveTarget")).fields.get("X")) > float((c).fields.get("m_fRelativeLocationX")))):
		pass
		(c).fields["m_fRelativeLocationX"] = float(minf(float((float((c).fields.get("m_fRelativeLocationX")) + float((float(v_fSpeedX) * float(v_fDeltaTime))))), float(((c).fields.get("m_vMoveTarget")).fields.get("X"))))
	else:
		pass
		(c).fields["m_fRelativeLocationX"] = float(maxf(float((float((c).fields.get("m_fRelativeLocationX")) - float((float(v_fSpeedX) * float(v_fDeltaTime))))), float(((c).fields.get("m_vMoveTarget")).fields.get("X"))))
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	R.call_member(c, "UpdateDepthPosition", [])
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(150))))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "OnAddedToWorld"), [])
	((c).fields.get("m_vMoveTarget")).fields["X"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c).fields["m_fRelativeLocationX"] = float(((c).fields.get("m_vMoveTarget")).fields.get("X"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	R.set_value(c, "SpeedX", 3, "=")
	R.set_value(c, "SpawnDistance", 20, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_EngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HornSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bCallToPlayer"] = false
	(c).fields["m_bCalledPlayer"] = false
	(c).fields["m_vMoveTarget"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	return null
