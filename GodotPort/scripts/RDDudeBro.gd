extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDDudeBro(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDudeBro"), [])
	c.fields["m_bCanBeHitByExplosion"] = false
	c.fields["m_bCanBeHitByBullet"] = false
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDDudeBro", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDDudeBro", "MovingSpeedMax")) - float(R.static_value("RDDudeBro", "MovingSpeedMin"))))))))
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_SegwaySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroSegway"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroVoice"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ScreamSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroScream"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "SetInitialState"), [])
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDDudeBro", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDDudeBro", "MovingSpeedMax")) - float(R.static_value("RDDudeBro", "MovingSpeedMin"))))))))
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_szFaceAnim"] = R.coerce("", "String")
	return null

static func f_InitDudeBro(c: Variant, a: Array) -> Variant:
	var v_bGoingRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.call_member(c, "Init", [R.klass("MC_DudeBro")])
	(c).fields["m_bGoingRight"] = v_bGoingRight
	c.fields["m_bFlippedX"] = R.unary("!", v_bGoingRight)
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistanceRatio: Variant = NAN
	var v_szAnim: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistanceRatio = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bStartPassBy") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDDudeBro", "MoveDistance"))))))):
		pass
		(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(((c).fields.get("m_fSpeed") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", (c).fields.get("m_fSpeed"))), "Number")
		(c.fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fStartPosX"))
		(c).fields["m_bStartPassBy"] = false
		(c).fields["m_bPassingBy"] = true
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SegwaySound"), true])
	if R.truth(((c).fields.get("m_bPlayVoice") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.binary("/", R.static_value("RDDudeBro", "MoveDistance"), 2))))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [((c).fields.get("m_VoiceSound") if R.truth((float(randf()) > float(0.5))) else (c).fields.get("m_ScreamSound"))])
		(c).fields["m_bPlayVoice"] = false
	v_szAnim = R.coerce("Idle", "String")
	if R.truth(R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", [])):
		pass
		v_szAnim = R.coerce("Talk", "String")
	else:
		pass
		if R.truth(R.call_member((c).fields.get("m_ScreamSound"), "IsPlaying", [])):
			pass
			v_szAnim = R.coerce("Scream", "String")
	if R.truth(R.binary("!=", v_szAnim, (c).fields.get("m_szFaceAnim"))):
		pass
		(c).fields["m_szFaceAnim"] = R.coerce(v_szAnim, "String")
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Body"), "gotoAndPlay"), [(c).fields.get("m_szFaceAnim")])
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		v_fDistanceRatio = float((float(1) - R.num(R.call_static("Maths", "Clamp", [R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 100), 0, 1]))))
		R.call_member((c).fields.get("m_SegwaySound"), "SetMaxVolume", [v_fDistanceRatio])
		R.call_member((c).fields.get("m_VoiceSound"), "SetMaxVolume", [v_fDistanceRatio])
		R.call_member((c).fields.get("m_ScreamSound"), "SetMaxVolume", [v_fDistanceRatio])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)), 0, 0])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "OnAddedToWorld"), [])
	(c).fields["m_fStartPosX"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce((R.unary("-", 1000) if R.truth((c).fields.get("m_bGoingRight")) else 1000), "Number")
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
		R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "TouchedBy"), [v_entity])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "MovingSpeedMin", 10, "=")
	R.set_value(c, "MovingSpeedMax", 20, "=")
	R.set_value(c, "MoveDistance", 40, "=")
	R.set_value(c, "HonkDelayRandom", 0.3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bGoingRight"] = false
	(c).fields["m_bStartPassBy"] = false
	(c).fields["m_bPassingBy"] = false
	(c).fields["m_fStartPosX"] = float(NAN)
	(c).fields["m_fSpeed"] = float(NAN)
	(c).fields["m_bPlayVoice"] = false
	(c).fields["m_szFaceAnim"] = R.coerce(null, "String")
	(c).fields["m_SegwaySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ScreamSound"] = R.coerce(null, "DTSpacialSound")
	return null
