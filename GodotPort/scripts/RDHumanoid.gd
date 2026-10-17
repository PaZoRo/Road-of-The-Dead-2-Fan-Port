extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHumanoid(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iSpawnType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fScale: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	R.invoke(R.super_ref(c, "RDHumanoid"), [v_mcClass, v_fScale])
	c.fields["m_fMinRenderScale"] = float(0.02)
	(c).fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_Generic"), "int")
	(c).fields["m_iSpawnType"] = R.coerce(v_iSpawnType, "int")
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Humanoid"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	(c.fields.get("m_CollisionBounds")).fields["Z"] = R.coerce(R.unary("-", 0.5), "Number")
	c.fields["m_fBackSoundDistanceMultiplier"] = float(4)
	(c).fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
	c.fields["m_fHitDamage"] = float(2)
	c.fields["m_fMinHitHP"] = float(R.static_value("RDPlayer", "BumperSmokeMinHP"))
	c.fields["m_fHitSpeedLoss"] = float(0.15)
	(c).fields["m_RollOverSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_RollOverSound"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeHitByExplosion"] = true
	c.fields["m_fFadeDistance"] = float(130)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood")])
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood2")])
	c.fields["m_bCanBeHitByBullet"] = true
	(c).fields["m_GameplayMode"] = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	(c).fields["m_StepNormalSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepPavement1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepPavement2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepPavement3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepPavement4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_StepGrassSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_StepGrassSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepDirt1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepGrassSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepDirt2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepGrassSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepDirt3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_StepGrassSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FootStepDirt4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHumanoid"), "SetInitialState"), [])
	(c).fields["m_bHit"] = false
	(c).fields["m_bSideCling"] = false
	(c).fields["m_bClingLeft"] = false
	(c).fields["m_ClingMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingMCInside"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingMCUnder"] = R.coerce(null, "MovieClip")
	(c).fields["m_bClingRightArmLost"] = false
	(c).fields["m_bClingLeftArmLost"] = false
	(c).fields["m_fGroundBlood"] = float(0)
	(c).fields["m_iPointsPerZombieKilled"] = float(3)
	(c).fields["m_iPointsPerZombieShot"] = float(4)
	(c).fields["m_iPointsPerHoodKillFromCollision"] = float(3)
	(c).fields["m_iPointsPerHoodHeadShot"] = float(4)
	(c).fields["m_iPointsPerHoodGib"] = float(5)
	(c).fields["m_iPointsPerZombieKilledWithGib"] = float(4)
	(c).fields["m_iPointsPerZombieArmShotOff"] = float(2)
	(c).fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
	(c).fields["m_GameplayMode"] = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	return null

static func f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "Die")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDHumanoid"), "OnEndAnim"), [])
	return null

static func f_OnClingAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "ClingAnimEnd")):
		pass
		R.call_member(c, "OnClingAnimationEnded", [])
	return null

static func f_OnClingAnimationEnded(c: Variant, a: Array) -> Variant:
	R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_UpdateClingAnimation(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnSideCollision(c: Variant, a: Array) -> Variant:
	var v_bRightSide: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_OnDirectCollision(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bRightSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	pass
	return null

static func f_OnForceGetOff(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnForceEndStruggle(c: Variant, a: Array) -> Variant:
	var v_bFemale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_ForceRemove(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return false
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100))
	return null

static func f_DoRollOverEffect(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RollOverSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["RollOver", 0.02, 0.5, 0, 0.2])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((float((c).fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDHumanoid"), "CanCollideWith"), [v_entity])
	return null

static func f_DamageHead(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return false
	return null

static func f_DamageTorso(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return false
	return null

static func f_DamageLeftArm(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_DamageRightArm(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_DamageBody(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnSideScraping(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnStruggleDamage(c: Variant, a: Array) -> Variant:
	var v_bIsFemale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fDamage: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fKillDelay: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	pass
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_fDistance = float(NAN)
	if R.truth(R.binary("==", v_szEvent, "PlayStepSound")):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((((c).fields.get("m_GameplayMode")).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		if R.truth(((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDHumanoid", "m_iStepTick")))) > float(5)) or (float(v_fDistance) < float(R.static_value("RDHumanoid", "m_fStepDistance"))))):
			pass
			R.call_member(c, "PlayStepSound", [])
			R.assign(c, "m_iStepTick", "RDHumanoid", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
			R.assign(c, "m_fStepDistance", "RDHumanoid", v_fDistance, "=")
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDHumanoid"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_PlayStepSound(c: Variant, a: Array) -> Variant:
	var v_stepSound: Variant = null
	v_stepSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.logical_and(R.truth((c).fields.get("m_StepGrassSounds")), func(): return R.call_member(((c).fields.get("m_GameplayMode")).fields.get("m_Road"), "IsOnGrass", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))), (c.fields.get("m_vLocation")).fields.get("Z")]))):
		pass
		v_stepSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_StepGrassSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	else:
		pass
		if R.truth((c).fields.get("m_StepNormalSounds")):
			pass
			v_stepSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_StepNormalSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_stepSound])
	return null

static func f_AddGroundBlood(c: Variant, a: Array) -> Variant:
	var v_fPosZ: Variant = NAN
	var v_groundBlood: Variant = null
	var v_fBlood: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bBlast: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fPosZ = float(NAN)
	v_groundBlood = R.coerce(null, "RDGroundBlood")
	(c).fields["m_fGroundBlood"] = R.coerce(R.binary("+", (c).fields.get("m_fGroundBlood"), v_fBlood), "Number")
	while R.truth((float((c).fields.get("m_fGroundBlood")) >= float(1))):
		pass
		v_groundBlood = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDGroundBlood")]), R.klass("RDGroundBlood")), "RDGroundBlood")
		if R.truth(R.unary("!", v_bBlast)):
			pass
			v_fPosZ = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("Z"), R.binary("+", R.unary("-", 0.25), (float(randf()) * float(3)))), "Number")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_groundBlood, R.binary("+", (c.fields.get("m_vLocation")).fields.get("X"), R.binary("+", R.unary("-", 0.5), (float(randf()) * float(1)))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
		else:
			pass
			v_fPosZ = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("Z"), R.binary("+", R.unary("-", 0.5), (float(randf()) * float(1)))), "Number")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_groundBlood, R.binary("+", (c.fields.get("m_vLocation")).fields.get("X"), R.binary("+", R.unary("-", 1), (float(randf()) * float(2)))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
		R.set_value(c, "m_fGroundBlood", 1, "-=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Generic", 0, "=")
	R.set_value(c, "Type_ZombieNormalMale", 1, "=")
	R.set_value(c, "Type_ZombieNormalFemale", 2, "=")
	R.set_value(c, "Type_ZombieHard", 3, "=")
	R.set_value(c, "Type_ZombieVeryHard", 4, "=")
	R.set_value(c, "Type_Soldier", 5, "=")
	R.set_value(c, "Type_Civilian", 6, "=")
	R.set_value(c, "Type_ZombieSoldier", 7, "=")
	R.set_value(c, "Type_ZombieNormalMaleNew", 8, "=")
	R.set_value(c, "Type_ZombieNormalFemaleNew", 9, "=")
	R.set_value(c, "Type_ZombieGrub", 10, "=")
	R.set_value(c, "ClingState_None", 0, "=")
	R.set_value(c, "ClingState_Start", 1, "=")
	R.set_value(c, "ClingState_Idle", 2, "=")
	R.set_value(c, "ClingState_CollideLeft", 3, "=")
	R.set_value(c, "ClingState_CollideRight", 4, "=")
	R.set_value(c, "ClingState_Attack", 5, "=")
	R.set_value(c, "ClingState_GetOff", 6, "=")
	R.set_value(c, "ClingState_Shot", 7, "=")
	R.set_value(c, "ClingState_Kill", 8, "=")
	R.set_value(c, "ClingState_LoseRightArm", 9, "=")
	R.set_value(c, "ClingState_LoseLeftArm", 10, "=")
	R.set_value(c, "ClingState_Gib", 11, "=")
	R.set_value(c, "ClingState_FrontGib", 12, "=")
	R.set_value(c, "HitType_Gib", 0, "=")
	R.set_value(c, "HitType_Front", 1, "=")
	R.set_value(c, "HitType_RollOver", 2, "=")
	R.set_value(c, "HitType_Side", 3, "=")
	R.set_value(c, "HitType_SlowRollOver", 4, "=")
	R.set_value(c, "HitType_Shot", 5, "=")
	R.set_value(c, "HitType_Headless", 6, "=")
	R.set_value(c, "MinMultiHitSpeed", R.binary("/", R.binary("/", (float(40) * float(1000)), 60), 60), "=")
	R.set_value(c, "MinGibSpeed", R.binary("/", R.binary("/", (float(74) * float(1000)), 60), 60), "=")
	R.set_value(c, "m_iStepTick", 0, "=")
	R.set_value(c, "m_fStepDistance", 999999, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iSpawnType"] = R.coerce(0, "int")
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_bHit"] = false
	(c).fields["m_iClingState"] = R.coerce(0, "int")
	(c).fields["m_bSideCling"] = false
	(c).fields["m_bClingLeft"] = false
	(c).fields["m_ClingMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingMCInside"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingMCUnder"] = R.coerce(null, "MovieClip")
	(c).fields["m_fClingHP"] = float(NAN)
	(c).fields["m_fInitialClingHP"] = float(NAN)
	(c).fields["m_fBodyHP"] = float(NAN)
	(c).fields["m_fHeadHP"] = float(NAN)
	(c).fields["m_fRightArmHP"] = float(NAN)
	(c).fields["m_fLeftArmHP"] = float(NAN)
	(c).fields["m_bClingRightArmLost"] = false
	(c).fields["m_bClingLeftArmLost"] = false
	(c).fields["m_RollOverSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_GameplayMode"] = R.coerce(null, "RDGameModeGameplay")
	(c).fields["m_StepNormalSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_StepGrassSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_fGroundBlood"] = float(0)
	(c).fields["m_iPointsPerZombieKilled"] = float(4)
	(c).fields["m_iPointsPerZombieShot"] = float(5)
	(c).fields["m_iPointsPerHoodKillFromCollision"] = float(4)
	(c).fields["m_iPointsPerHoodHeadShot"] = float(5)
	(c).fields["m_iPointsPerHoodGib"] = float(6)
	(c).fields["m_iPointsPerZombieKilledWithGib"] = float(5)
	(c).fields["m_iPointsPerZombieArmShotOff"] = float(3)
	(c).fields["m_fClingChanceMultiplier"] = float(1)
	return null
