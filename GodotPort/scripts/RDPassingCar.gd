extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPassingCar(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPassingCar"), [])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_MovingCars"), "int")
	c.fields["m_bCanBeHitByExplosion"] = true
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDPassingCar", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDPassingCar", "MovingSpeedMax")) - float(R.static_value("RDPassingCar", "MovingSpeedMin"))))))))
	c.fields["m_bAllowBumpReduction"] = false
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_EngineSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_CarMaxSpeed1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_HonkSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Horn1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.binary("as", R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "GetRandomValue", []), R.resolve(c, "Class", "RDPassingCar")), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_PassingVoices", "RDPassingCar", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar01")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar02")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar03")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar04")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar05")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar06")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar07")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCar08")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale01")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale02")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale03")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale04")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale05")])
	R.call_member(R.static_value("RDPassingCar", "m_PassingVoices"), "AddValue", [R.klass("SND_PassingCarFemale06")])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDPassingCar"), "SetInitialState"), [])
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDPassingCar", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDPassingCar", "MovingSpeedMax")) - float(R.static_value("RDPassingCar", "MovingSpeedMin"))))))))
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_fHonkTimer"] = float(0)
	(c).fields["m_fStartHonkTime"] = float(0)
	return null

static func f_InitPassingCar(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_bGoingRight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.call_member(c, "Init", [v_mcClass])
	(c).fields["m_bGoingRight"] = v_bGoingRight
	c.fields["m_bFlippedX"] = v_bGoingRight
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistanceRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistanceRatio = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDPassingCar"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth(((c).fields.get("m_bStartPassBy") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDPassingCar", "MoveDistance"))))))):
		pass
		(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(((c).fields.get("m_fSpeed") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", (c).fields.get("m_fSpeed"))), "Number")
		(c.fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fStartPosX"))
		(c).fields["m_bStartPassBy"] = false
		(c).fields["m_bPassingBy"] = true
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_EngineSound"), true])
	if R.truth(((c).fields.get("m_bPlayVoice") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.binary("/", R.static_value("RDPassingCar", "MoveDistance"), 2))))))):
		pass
		if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDPassingCar"), [])) - float(R.static_value("RDPassingCar", "m_iVoiceTime")))) > float(5000))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_VoiceSound")])
			R.assign(c, "m_iVoiceTime", "RDPassingCar", R.invoke(R.resolve(c, "getTimer", "RDPassingCar"), []), "=")
		(c).fields["m_bPlayVoice"] = false
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		(c).fields["m_fHonkTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fHonkTimer"), v_fDeltaTime), "Number")
		if R.truth((((float((c).fields.get("m_fHonkTimer")) > float(0)) and (float((c).fields.get("m_fHonkTimer")) <= float((c).fields.get("m_fStartHonkTime")))) and R.unary("!", R.call_member((c).fields.get("m_HonkSound"), "IsPlaying", [])))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HonkSound"), true])
		if R.truth((float((c).fields.get("m_fHonkTimer")) <= float(0))):
			pass
			if R.truth(R.call_member((c).fields.get("m_HonkSound"), "IsPlaying", [])):
				pass
				R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_HonkSound")])
			(c).fields["m_fStartHonkTime"] = float((float(R.static_value("RDPassingCar", "HonkDurationMin")) + float((float(randf()) * float(R.static_value("RDPassingCar", "HonkDurationRandom"))))))
			(c).fields["m_fHonkTimer"] = float((float((c).fields.get("m_fStartHonkTime")) + float((float(R.static_value("RDPassingCar", "HonkDelayMin")) + float((float(randf()) * float(R.static_value("RDPassingCar", "HonkDelayRandom"))))))))
		v_fDistanceRatio = float((float(1) - R.num(R.call_static("Maths", "Clamp", [R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 100), 0, 1]))))
		R.call_member((c).fields.get("m_EngineSound"), "SetMaxVolume", [v_fDistanceRatio])
		R.call_member((c).fields.get("m_HonkSound"), "SetMaxVolume", [v_fDistanceRatio])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)), 0, 0])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	R.invoke(R.get_value(R.super_ref(c, "RDPassingCar"), "OnAddedToWorld"), [])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_fStartPosX"] = R.coerce(((float(v_fPerlinX) + float(20)) if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) > float(v_fPerlinX))) else (float(v_fPerlinX) - float(20))), "Number")
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(((float(v_fPerlinX) - float(1000)) if R.truth((c).fields.get("m_bGoingRight")) else (float(v_fPerlinX) + float(1000))), "Number")
	return null

static func f_CanSpawnZombie(c: Variant, a: Array) -> Variant:
	var v_bUnlimited: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	return false
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_zombie = R.coerce(R.binary("as", v_entity, R.klass("RDZombie")), "RDZombie")
	if R.truth(v_zombie):
		pass
		R.call_member(v_zombie, "HandleCarCollision", [c])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDPassingCar"), "TouchedBy"), [v_entity])
	return null

static func f_GetEditorAdjustedPosX(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return (8 if R.truth((float(v_fX) > float(0))) else R.unary("-", 8))
	return null

static func f_CanBePlacedInEditorAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member((R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeEditor"))).fields.get("m_Road"), "GetRoadSliceTypeAt", [v_fZ]), "int")
	return ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet"))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad"))))
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	(c).fields["m_bGoingRight"] = c.fields.get("m_bFlippedX")
	return null

static func f_InitProperties(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_PassingVoices", null, "=")
	R.set_value(c, "MovingSpeedMin", 10, "=")
	R.set_value(c, "MovingSpeedMax", 20, "=")
	R.set_value(c, "MoveDistance", 30, "=")
	R.set_value(c, "HonkDurationMin", 0.1, "=")
	R.set_value(c, "HonkDurationRandom", 0.2, "=")
	R.set_value(c, "HonkDelayMin", 0.1, "=")
	R.set_value(c, "HonkDelayRandom", 0.3, "=")
	R.set_value(c, "m_iVoiceTime", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bGoingRight"] = false
	(c).fields["m_bStartPassBy"] = false
	(c).fields["m_bPassingBy"] = false
	(c).fields["m_fStartPosX"] = float(NAN)
	(c).fields["m_fSpeed"] = float(NAN)
	(c).fields["m_bPlayVoice"] = false
	(c).fields["m_fHonkTimer"] = float(0)
	(c).fields["m_fStartHonkTime"] = float(0)
	(c).fields["m_EngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HonkSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	return null
