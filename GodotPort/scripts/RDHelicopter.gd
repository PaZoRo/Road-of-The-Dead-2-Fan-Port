extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHelicopter(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHelicopter"), [R.klass("MC_Helicopter"), R.static_value("RDHelicopter", "Scale")])
	c.fields["m_bUpdateOutOfView"] = true
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_AttackChoppers"), "int")
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterFireLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_CollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_CollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_CollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_AlertSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	R.call_member((c).fields.get("m_AlertSound"), "SetMaxVolume", [0.75])
	(c).fields["m_RocketSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_RocketLaunch"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ExplosionSound1"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ExplosionSound2"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_fWarningTimer"] = float(R.binary("/", R.static_value("RDHelicopter", "WarningDelay"), 2))
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Helicopter"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	(c).fields["m_fHP"] = float(R.static_value("RDHelicopter", "MaxHP"))
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "stop"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_bCanBeHitByExplosion"] = true
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_WarningSounds", "RDHelicopter", R.construct(R.klass("SequentialArray"), []), "=")
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterWarning09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.assign(c, "m_AlertMessageSounds", "RDHelicopter", R.construct(R.klass("SequentialArray"), []), "=")
	R.call_member(R.static_value("RDHelicopter", "m_AlertMessageSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterDefeated01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_AlertMessageSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterDefeated02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.assign(c, "m_DispatchSounds", "RDHelicopter", R.construct(R.klass("SequentialArray"), []), "=")
	R.call_member(R.static_value("RDHelicopter", "m_DispatchSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterDispatch01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_DispatchSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterDispatch02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.assign(c, "m_MissileRequestSounds", "RDHelicopter", R.construct(R.klass("SequentialArray"), []), "=")
	R.call_member(R.static_value("RDHelicopter", "m_MissileRequestSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterMissileRequest01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	R.call_member(R.static_value("RDHelicopter", "m_MissileRequestSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HelicopterMissileRequest02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "SetInitialState"), [])
	(c).fields["m_bBroken"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFiring"] = false
	(c).fields["m_bUsingMissiles"] = false
	(c).fields["m_bRetreating"] = false
	(c).fields["m_fBrokenHeight"] = float(0)
	(c).fields["m_fHP"] = float(R.static_value("RDHelicopter", "MaxHP"))
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "stop"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fWarningTimer"] = float(R.binary("/", R.static_value("RDHelicopter", "WarningDelay"), 2))
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_fDifficultyRatio: Variant = NAN
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 1), "int")
	(c).fields["m_iDifficultyLevel"] = R.coerce(v_iLevel, "int")
	v_fDifficultyRatio = float(R.binary("/", (float((c).fields.get("m_iDifficultyLevel")) - float(1)), 9))
	(c).fields["m_fFiringDurationMin"] = float((float(R.static_value("RDHelicopter", "FiringDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "FiringDurationMinMax")) - float(R.static_value("RDHelicopter", "FiringDurationMinMin"))))))))
	(c).fields["m_fFiringDurationRandom"] = float((float(R.static_value("RDHelicopter", "FiringDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "FiringDurationRandomMax")) - float(R.static_value("RDHelicopter", "FiringDurationRandomMin"))))))))
	(c).fields["m_fNotFiringDurationMin"] = float((float(R.static_value("RDHelicopter", "NotFiringDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NotFiringDurationMinMax")) - float(R.static_value("RDHelicopter", "NotFiringDurationMinMin"))))))))
	(c).fields["m_fNotFiringDurationRandom"] = float((float(R.static_value("RDHelicopter", "NotFiringDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NotFiringDurationRandomMax")) - float(R.static_value("RDHelicopter", "NotFiringDurationRandomMin"))))))))
	(c).fields["m_fMissileDelayMin"] = float((float(R.static_value("RDHelicopter", "MissileDelayMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDelayMinMax")) - float(R.static_value("RDHelicopter", "MissileDelayMinMin"))))))))
	(c).fields["m_fMissileDelayRandom"] = float((float(R.static_value("RDHelicopter", "MissileDelayRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDelayRandomMax")) - float(R.static_value("RDHelicopter", "MissileDelayRandomMin"))))))))
	(c).fields["m_fMissileDurationMin"] = float((float(R.static_value("RDHelicopter", "MissileDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDurationMinMax")) - float(R.static_value("RDHelicopter", "MissileDurationMinMin"))))))))
	(c).fields["m_fMissileDurationRandom"] = float((float(R.static_value("RDHelicopter", "MissileDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDurationRandomMax")) - float(R.static_value("RDHelicopter", "MissileDurationRandomMin"))))))))
	(c).fields["m_fNoMissileDurationMin"] = float((float(R.static_value("RDHelicopter", "NoMissileDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NoMissileDurationMinMax")) - float(R.static_value("RDHelicopter", "NoMissileDurationMinMin"))))))))
	(c).fields["m_fNoMissileDurationRandom"] = float((float(R.static_value("RDHelicopter", "NoMissileDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NoMissileDurationRandomMax")) - float(R.static_value("RDHelicopter", "NoMissileDurationRandomMin"))))))))
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
	(c).fields["m_fMissileTimer"] = float(0)
	(c).fields["m_fMissileDuration"] = R.coerce(((float((c).fields.get("m_fMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDurationRandom"))))) if R.truth((c).fields.get("m_bUsingMissiles")) else (float((c).fields.get("m_fNoMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNoMissileDurationRandom")))))), "Number")
	(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
	(c).fields["m_bFiringMissileRight"] = (float(randf()) > float(0.5))
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_MachineGun"), "int")
	(c).fields["m_bCanUseMissiles"] = (float(v_iLevel) >= float(5))
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_dust: Variant = null
	var v_fPosZ: Variant = NAN
	var v_missile: Variant = null
	var v_bHitPlayer: Variant = false
	var v_fDamage: Variant = NAN
	var v_bulletMissSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_dust = R.coerce(null, "RDObject")
	v_fPosZ = float(NAN)
	v_missile = R.coerce(null, "RDMissile")
	v_bHitPlayer = false
	v_fDamage = float(NAN)
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "Update"), [v_fDeltaTime])
	if R.truth((R.unary("!", R.call_member((c).fields.get("m_FlySound"), "IsPlaying", [])) and (float((c).fields.get("m_fHP")) > float(0)))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound"), true])
		(c).fields["m_DispatchSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_DispatchSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_DispatchSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnHelicopterArrived", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth((((((R.unary("!", (c).fields.get("m_bBroken")) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and (R.unary("!", (c).fields.get("m_AlertMessageSound")) or R.unary("!", R.call_member((c).fields.get("m_AlertMessageSound"), "IsPlaying", [])))) and (R.unary("!", (c).fields.get("m_DispatchSound")) or R.unary("!", R.call_member((c).fields.get("m_DispatchSound"), "IsPlaying", [])))) and (R.unary("!", (c).fields.get("m_MissileRequestSound")) or R.unary("!", R.call_member((c).fields.get("m_MissileRequestSound"), "IsPlaying", [])))) and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopter", "WarningMinDistance"))))))):
		pass
		(c).fields["m_fWarningTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fWarningTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fWarningTimer")) >= float(R.static_value("RDHelicopter", "WarningDelay")))):
			pass
			R.call_member(c, "StopAllVoices", [])
			(c).fields["m_WarningSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_WarningSound")])
			(c).fields["m_fWarningTimer"] = float(0)
	(c).fields["m_fDustTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDustTimer"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fDustTimer")) >= float((c).fields.get("m_fDustDelay")))):
		pass
		(c).fields["m_fDustTimer"] = float(0)
		(c).fields["m_fDustDelay"] = float((float(R.static_value("RDHelicopter", "DustDelayMin")) + float((float(randf()) * float(R.static_value("RDHelicopter", "DustDelayRandom"))))))
		v_dust = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectDust")]), R.klass("RDObject")), "RDObject")
		R.invoke(R.get_value((v_dust).fields.get("m_MC"), "gotoAndPlay"), [R.binary("+", "Variation", R.binary("+", R.call_static("Maths", "RandomInt", [4]), 1))])
		v_fPosZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(4)))
		R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_dust, (float((float((c.fields.get("m_vLocation")).fields.get("X")) - float(1))) + float((float(randf()) * float(2)))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
	if R.truth(((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopter", "MinFiringOffset"))))) and R.unary("!", (c).fields.get("m_bBroken")))):
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_SwitchToMissile")))):
			pass
			if R.truth((R.unary("!", (c).fields.get("m_MissileRequestSound")) or R.unary("!", R.call_member((c).fields.get("m_MissileRequestSound"), "IsPlaying", [])))):
				pass
				(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Missile"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_Missile")))):
				pass
				if R.truth(((c).fields.get("m_Player")).fields.get("m_bFailed")):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Idle"), "int")
				else:
					pass
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float((c).fields.get("m_fMissileDelay")))):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RocketSound")])
						v_missile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDMissile")]), R.klass("RDMissile")), "RDMissile")
						R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_missile, R.binary("+", (c.fields.get("m_vLocation")).fields.get("X"), (R.static_value("RDHelicopter", "FireMissileOffsetX") if R.truth((c).fields.get("m_bFiringMissileRight")) else R.unary("-", R.static_value("RDHelicopter", "FireMissileOffsetX")))), (float((c.fields.get("m_vLocation")).fields.get("Y")) + float(R.static_value("RDHelicopter", "FireMissileOffsetY"))), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(0.1))])
						R.call_member(v_missile, "StartSeek", [(c).fields.get("m_Player"), (c).fields.get("m_bFiringMissileRight")])
						(c).fields["m_fFireBulletTimer"] = float(0)
						(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
						(c).fields["m_bFiringMissileRight"] = R.unary("!", (c).fields.get("m_bFiringMissileRight"))
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun")))):
					pass
					if R.truth(((c).fields.get("m_Player")).fields.get("m_bFailed")):
						pass
						if R.truth((c).fields.get("m_bFiring")):
							pass
							R.call_member(c, "StopFiring", [])
						(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Idle"), "int")
					else:
						pass
						(c).fields["m_fFiringTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFiringTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fFiringTimer")) >= float((c).fields.get("m_fFiringDuration")))):
							pass
							(c).fields["m_bFiring"] = R.unary("!", (c).fields.get("m_bFiring"))
							if R.truth((c).fields.get("m_bFiring")):
								pass
								R.call_member(c, "StartFiring", [])
							else:
								pass
								R.call_member(c, "StopFiring", [])
							(c).fields["m_fFiringTimer"] = float(0)
							(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
						if R.truth((c).fields.get("m_bFiring")):
							pass
							(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
							if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float(R.static_value("RDHelicopter", "FireBulletDelay")))):
								pass
								(c).fields["m_fFireBulletTimer"] = float(0)
								v_bHitPlayer = R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))]), R.static_value("RDHelicopter", "FireWidth"))
								if R.truth(v_bHitPlayer):
									pass
									v_fDamage = float(R.static_value("RDHelicopter", "BodyFireDamage"))
									R.call_member((c).fields.get("m_Player"), "TakeDamage", [v_fDamage, c, R.static_value("RDDamageType", "HelicopterBullet")])
								else:
									pass
									v_bulletMissSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
									R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
		if R.truth(((c).fields.get("m_bCanUseMissiles") and ((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_Missile")))))):
			pass
			(c).fields["m_fMissileTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fMissileTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fMissileTimer")) >= float((c).fields.get("m_fMissileDuration")))):
				pass
				(c).fields["m_bUsingMissiles"] = R.unary("!", (c).fields.get("m_bUsingMissiles"))
				(c).fields["m_fMissileTimer"] = float(0)
				(c).fields["m_fMissileDuration"] = R.coerce(((float((c).fields.get("m_fMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDurationRandom"))))) if R.truth((c).fields.get("m_bUsingMissiles")) else (float((c).fields.get("m_fNoMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNoMissileDurationRandom")))))), "Number")
				(c).fields["m_bFiring"] = false
				R.call_member(c, "StopFiring", [])
				(c).fields["m_fFiringTimer"] = float(0)
				(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
				(c).fields["m_fFireBulletTimer"] = float(0)
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_SwitchToMissile"), "int")
					R.call_member(c, "StopAllVoices", [])
					(c).fields["m_MissileRequestSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_MissileRequestSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_MissileRequestSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_MachineGun"), "int")
	return null

static func f_StartFiring(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "gotoAndPlay"), [1])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null

static func f_StopFiring(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "stop"), [])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	(c).fields["m_fFireBulletTimer"] = float(0)
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fDistanceX: Variant = NAN
	var v_fInterpSpeed: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_fTargetZ: Variant = NAN
	var v_fDistanceRatio: Variant = NAN
	var v_fMaxSpeed: Variant = NAN
	var v_fNewZ: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(20))]), "Number")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fTargetX = R.coerce((v_fPerlinX if R.truth((c).fields.get("m_bBroken")) else (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")), "Number")
	v_fTargetX = R.coerce(R.call_static("Maths", "Clamp", [v_fTargetX, (float(v_fPerlinX) - float(v_fRoadLimit)), (float(v_fPerlinX) + float(v_fRoadLimit))]), "Number")
	v_fDistanceX = float((float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fInterpSpeed = R.coerce((0.1 if R.truth((c).fields.get("m_bBroken")) else 0.6), "Number")
	v_fNewX = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), v_fTargetX, v_fDeltaTime, v_fInterpSpeed]), "Number")
	if R.truth((c).fields.get("m_bBroken")):
		pass
		(c).fields["m_fBrokenHeight"] = R.coerce(R.binary("+", (c).fields.get("m_fBrokenHeight"), (float(R.static_value("RDHelicopter", "BrokenSpeedUp")) * float(v_fDeltaTime))), "Number")
	v_fNewY = R.coerce(R.binary("+", R.binary("+", R.static_value("RDHelicopter", "FlyHeight"), ((c).fields.get("m_fBrokenHeight") if R.truth((c).fields.get("m_bBroken")) else 0)), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	v_fTargetZ = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(20)))
	v_fDistanceRatio = float(minf(float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(v_fTargetZ))]), 60)), float(1)))
	v_fMaxSpeed = float(maxf(float((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) * float(2))), float(R.binary("/", R.binary("/", (float(50) * float(1000)), 60), 60))))
	if R.truth((c).fields.get("m_bBroken")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(R.binary("-", (c.fields.get("m_vVelocity")).fields.get("Z"), (R.num((R.static_value("RDHelicopter", "RetreatDeccel") if R.truth((c).fields.get("m_bRetreating")) else R.static_value("RDHelicopter", "BrokenDeccel"))) * float(v_fDeltaTime))), "Number")
	else:
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float((float((float((float(1) - float(v_fDistanceRatio))) * float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")))) + float((float(v_fDistanceRatio) * float(v_fMaxSpeed)))))
	v_fNewZ = float(minf(float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float(v_fTargetZ)))
	v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fDeltaY = float((float(v_fNewY) - float((c.fields.get("m_vLocation")).fields.get("Y"))))
	v_fDeltaZ = float((float(v_fNewZ) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	R.set_value(c.fields.get("m_MC"), "rotation", (float(v_fDistanceX) * float(R.static_value("RDHelicopter", "DistanceRotationRatio"))), "=")
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_RoadSign"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile"))))
	return null

static func f_Touched(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
	R.call_member(c, "ResetFiring", [])
	if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "InvincibleHellfireEnabled", []))):
		pass
		R.call_member(c, "DoDamage", [R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 4), true])
	return null

static func f_ResetFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiring"] = false
	R.call_member(c, "StopFiring", [])
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
	return null

static func f_DoDamage(c: Variant, a: Array) -> Variant:
	var v_fOldHP: Variant = NAN
	var v_fDamage: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bFromCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fOldHP = float(NAN)
	if R.truth(((float((c).fields.get("m_fHP")) > float(0)) and R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "InvincibleHellfireEnabled", [])))):
		pass
		v_fOldHP = float((c).fields.get("m_fHP"))
		(c).fields["m_fHP"] = R.coerce(R.binary("-", (c).fields.get("m_fHP"), v_fDamage), "Number")
		if R.truth((float((c).fields.get("m_fHP")) <= float(0))):
			pass
			R.call_member(c, "ResetFiring", [])
			R.call_member(c, "StopAllVoices", [])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_AlertSound")])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FlySound")])
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Explode"])
		else:
			pass
			if R.truth((float((c).fields.get("m_fHP")) <= float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 4)))):
				pass
				if R.truth(R.unary("!", (c).fields.get("m_bBroken"))):
					pass
					(c).fields["m_bBroken"] = true
					R.call_member(c, "StopAllVoices", [])
					(c).fields["m_AlertMessageSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_AlertMessageSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_AlertMessageSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_AlertSound"), true])
					R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "play"), [])
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Crash"])
					R.call_member(c, "ResetFiring", [])
					R.call_member((c).fields.get("m_Player"), "OnHelicopterDefeated", [])
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnHelicopterDefeated", [])
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.6])
			else:
				pass
				if R.truth(v_bFromCollision):
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.6])
				if R.truth(((float(v_fOldHP) > float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 2))) and (float((c).fields.get("m_fHP")) <= float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 2))))):
					pass
					R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "play"), [])
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	R.call_member(c, "DoDamage", [v_iDamage, false])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth(R.binary("==", R.binary("as", v_instigator, R.klass("RDMissile")), null)):
		pass
		R.call_member(c, "DoDamage", [v_iDamage, false])
		if R.truth((float((c).fields.get("m_fHP")) > float(0))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
	return null

static func f_StopAllVoices(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_WarningSound")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_WarningSound")])
		(c).fields["m_WarningSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_AlertMessageSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_AlertMessageSound")])
		(c).fields["m_AlertMessageSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_DispatchSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_DispatchSound")])
		(c).fields["m_DispatchSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_MissileRequestSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_MissileRequestSound")])
		(c).fields["m_MissileRequestSound"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return ((c).fields.get("m_bBroken") and R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100)))
	return null

static func f_StartRetreat(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRetreating"] = true
	(c).fields["m_bBroken"] = true
	R.call_member(c, "StopFiring", [])
	return null

static func f_IsRetreating(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bBroken")
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "ExplosionSound1")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplosionSound1")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.1])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "ExplosionSound2")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplosionSound2")])
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.1])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "FinalExplosion")):
				pass
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 1])
			else:
				pass
				R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_WarningSounds", null, "=")
	R.set_value(c, "m_AlertMessageSounds", null, "=")
	R.set_value(c, "m_DispatchSounds", null, "=")
	R.set_value(c, "m_MissileRequestSounds", null, "=")
	R.set_value(c, "Scale", 4, "=")
	R.set_value(c, "State_Idle", R.unary("-", 1), "=")
	R.set_value(c, "State_MachineGun", 0, "=")
	R.set_value(c, "State_SwitchToMissile", 1, "=")
	R.set_value(c, "State_Missile", 2, "=")
	R.set_value(c, "SpawnDistance", 50, "=")
	R.set_value(c, "FlyHeight", 5, "=")
	R.set_value(c, "WarningDelay", 15, "=")
	R.set_value(c, "WarningMinDistance", 10, "=")
	R.set_value(c, "DustDelayMin", 0.05, "=")
	R.set_value(c, "DustDelayRandom", 0.15, "=")
	R.set_value(c, "MinFiringOffset", 10, "=")
	R.set_value(c, "FiringDurationMinMin", 1, "=")
	R.set_value(c, "FiringDurationMinMax", 3.5, "=")
	R.set_value(c, "FiringDurationRandomMin", 0.5, "=")
	R.set_value(c, "FiringDurationRandomMax", 0.5, "=")
	R.set_value(c, "NotFiringDurationMinMin", 5, "=")
	R.set_value(c, "NotFiringDurationMinMax", 2.5, "=")
	R.set_value(c, "NotFiringDurationRandomMin", 0.5, "=")
	R.set_value(c, "NotFiringDurationRandomMax", 0.5, "=")
	R.set_value(c, "MissileDelayMinMin", 3, "=")
	R.set_value(c, "MissileDelayMinMax", 2, "=")
	R.set_value(c, "MissileDelayRandomMin", 0.5, "=")
	R.set_value(c, "MissileDelayRandomMax", 0.5, "=")
	R.set_value(c, "MissileDurationMinMin", 10, "=")
	R.set_value(c, "MissileDurationMinMax", 15, "=")
	R.set_value(c, "MissileDurationRandomMin", 0, "=")
	R.set_value(c, "MissileDurationRandomMax", 0, "=")
	R.set_value(c, "NoMissileDurationMinMin", 20, "=")
	R.set_value(c, "NoMissileDurationMinMax", 10, "=")
	R.set_value(c, "NoMissileDurationRandomMin", 0, "=")
	R.set_value(c, "NoMissileDurationRandomMax", 0, "=")
	R.set_value(c, "BodyFireDamage", 2, "=")
	R.set_value(c, "FireWidth", 3, "=")
	R.set_value(c, "FireBulletDelay", 0.1, "=")
	R.set_value(c, "DistanceRotationRatio", 2, "=")
	R.set_value(c, "BrokenDeccel", R.binary("/", R.binary("/", (float(3) * float(1000)), 60), 60), "=")
	R.set_value(c, "RetreatDeccel", R.binary("/", R.binary("/", (float(6) * float(1000)), 60), 60), "=")
	R.set_value(c, "BrokenSpeedUp", 0.5, "=")
	R.set_value(c, "FireMissileOffsetX", 1, "=")
	R.set_value(c, "FireMissileOffsetY", R.unary("-", 0.1), "=")
	R.set_value(c, "MaxHP", 2000, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_FlySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_CollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_AlertSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_RocketSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ExplosionSound1"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ExplosionSound2"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fWarningTimer"] = float(NAN)
	(c).fields["m_fDustTimer"] = float(NAN)
	(c).fields["m_fDustDelay"] = float(NAN)
	(c).fields["m_fHP"] = float(NAN)
	(c).fields["m_bBroken"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_iDifficultyLevel"] = R.coerce(0, "int")
	(c).fields["m_fFiringDurationMin"] = float(NAN)
	(c).fields["m_fFiringDurationRandom"] = float(NAN)
	(c).fields["m_fNotFiringDurationMin"] = float(NAN)
	(c).fields["m_fNotFiringDurationRandom"] = float(NAN)
	(c).fields["m_fFiringTimer"] = float(NAN)
	(c).fields["m_fFiringDuration"] = float(NAN)
	(c).fields["m_bFiring"] = false
	(c).fields["m_fMissileDurationMin"] = float(NAN)
	(c).fields["m_fMissileDurationRandom"] = float(NAN)
	(c).fields["m_fNoMissileDurationMin"] = float(NAN)
	(c).fields["m_fNoMissileDurationRandom"] = float(NAN)
	(c).fields["m_fMissileDelayMin"] = float(NAN)
	(c).fields["m_fMissileDelayRandom"] = float(NAN)
	(c).fields["m_fMissileTimer"] = float(NAN)
	(c).fields["m_fMissileDuration"] = float(NAN)
	(c).fields["m_bUsingMissiles"] = false
	(c).fields["m_fMissileDelay"] = float(NAN)
	(c).fields["m_bFiringMissileRight"] = false
	(c).fields["m_fFireBulletTimer"] = float(NAN)
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_WarningSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_AlertMessageSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DispatchSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_MissileRequestSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bCanUseMissiles"] = false
	(c).fields["m_iState"] = R.coerce(0, "int")
	(c).fields["m_bRetreating"] = false
	(c).fields["m_fBrokenHeight"] = float(0)
	return null
