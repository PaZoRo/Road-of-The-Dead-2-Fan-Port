extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHelicopterAlly(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHelicopterAlly"), [R.klass("MC_HelicopterAlly"), R.static_value("RDHelicopterAlly", "Scale")])
	c.fields["m_bUpdateOutOfView"] = true
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterFireLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_RocketSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_RocketLaunch"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_HitByMutantSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_PunchHood"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Helicopter"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_bFiring"] = false
	(c).fields["m_bFiringMissiles"] = true
	(c).fields["m_fFiringMissilesTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopterAlly"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFiringGun"] = false
	(c).fields["m_bRetreating"] = false
	(c).fields["m_fRetreatPosX"] = float(0)
	(c).fields["m_fFlyHeight"] = float(6)
	(c).fields["m_fSoundVolume"] = float(0)
	(c).fields["m_bShootingMode"] = false
	(c).fields["m_ShootTarget"] = R.coerce(null, "RDEntity")
	(c).fields["m_bShootTargetIsCar"] = false
	(c).fields["m_fChangeShootingPosTimer"] = float(0)
	(c).fields["m_fRoadLimit"] = float(9999)
	(c).fields["m_fShootingPosX"] = float(0)
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_bFiring"] = false
	(c).fields["m_bFiringMissiles"] = true
	(c).fields["m_fFiringMissilesTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_fPosX: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fLimit: Variant = NAN
	var v_bOnRoad: Variant = false
	var v_dust: Variant = null
	var v_projectile: Variant = null
	var v_bulletMissSound: Variant = null
	var v_gameplayMode: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	v_fPosX = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinX = float(NAN)
	v_fLimit = float(NAN)
	v_bOnRoad = false
	v_dust = R.coerce(null, "RDObject")
	v_projectile = R.coerce(null, "RDMissileAlly")
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
		(c).fields["m_fShootingPosX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopterAlly"), "Update"), [v_fDeltaTime])
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth(R.unary("!", R.call_member((c).fields.get("m_FlySound"), "IsPlaying", []))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound"), true])
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		(c).fields["m_fSoundVolume"] = float((float(1) - float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), R.static_value("RDHelicopterAlly", "SpawnDistance")))))
	else:
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bRetreating"))):
			pass
			(c).fields["m_fSoundVolume"] = float(1)
		else:
			pass
			(c).fields["m_fSoundVolume"] = float(maxf(float((float((c).fields.get("m_fSoundVolume")) - float((float(R.static_value("RDHelicopterAlly", "FlySoundVolumeFadeSpeed")) * float(v_fDeltaTime))))), float(0)))
	R.call_member((c).fields.get("m_FlySound"), "SetMaxVolume", [(c).fields.get("m_fSoundVolume")])
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		if R.truth(v_storyMode):
			pass
			R.call_member(v_storyMode, "OnHelicopterArrived", [])
		(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_fDustTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDustTimer"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fDustTimer")) >= float((c).fields.get("m_fDustDelay")))):
		pass
		(c).fields["m_fDustTimer"] = float(0)
		(c).fields["m_fDustDelay"] = float((float(R.static_value("RDHelicopterAlly", "DustDelayMin")) + float((float(randf()) * float(R.static_value("RDHelicopterAlly", "DustDelayRandom"))))))
		v_fPosX = float((float((float((c.fields.get("m_vLocation")).fields.get("X")) - float(1))) + float((float(randf()) * float(2)))))
		v_fPosZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(4)))
		v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
		v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadLimitAt", [v_fPosZ]), "Number")
		v_bOnRoad = ((float(v_fPosX) > float((float(v_fPerlinX) - float(v_fLimit)))) and (float(v_fPosX) < float((float(v_fPerlinX) + float(v_fLimit)))))
		v_dust = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectDust")]), R.klass("RDObject")), "RDObject")
		R.invoke(R.get_value((v_dust).fields.get("m_MC"), "gotoAndPlay"), [R.binary("+", "Variation", R.binary("+", R.call_static("Maths", "RandomInt", [4]), 1))])
		R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_dust, v_fPosX, R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
	if R.truth(((c).fields.get("m_bShootingMode") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(5)))))):
		pass
		if R.truth((c).fields.get("m_bFiring")):
			pass
			R.call_member(c, "GetShootingTargets", [])
			if R.truth((c).fields.get("m_ShootTarget")):
				pass
				if R.truth(((c).fields.get("m_bShootTargetIsCar") and (c).fields.get("m_bFiringMissiles"))):
					pass
					if R.truth((c).fields.get("m_bFiringGun")):
						pass
						R.call_member(c, "StopFiring", [])
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) <= float(0))):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RocketSound")])
						v_projectile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDMissileAlly")]), R.klass("RDMissileAlly")), "RDMissileAlly")
						(v_projectile).fields["m_Instigator"] = R.coerce(c, "RDEntity")
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["Y"] = float((float((c.fields.get("m_vLocation")).fields.get("Y")) - float(2)))
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
						((c).fields.get("m_vMissileDir")).fields["X"] = float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("X"))
						((c).fields.get("m_vMissileDir")).fields["Y"] = float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("Y"))
						((c).fields.get("m_vMissileDir")).fields["Z"] = float((float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("Z")) - float(1)))
						R.call_member((c).fields.get("m_vMissileDir"), "Subtract", [(v_projectile).fields.get("m_vTrajectoryStart")])
						R.call_member((c).fields.get("m_vMissileDir"), "Normalize", [])
						((v_projectile).fields.get("m_vVelocity")).fields["X"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("X")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						((v_projectile).fields.get("m_vVelocity")).fields["Y"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("Y")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						((v_projectile).fields.get("m_vVelocity")).fields["Z"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("Z")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_projectile, (c.fields.get("m_vLocation")).fields.get("X"), (float((c.fields.get("m_vLocation")).fields.get("Y")) - float(0.5)), (c.fields.get("m_vLocation")).fields.get("Z")])
						(c).fields["m_fFireBulletTimer"] = float(R.static_value("RDHelicopterAlly", "FireMissileDelay"))
				else:
					pass
					if R.truth(R.unary("!", (c).fields.get("m_bFiringGun"))):
						pass
						R.call_member(c, "StartFiring", [])
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) <= float(0))):
						pass
						if R.truth((c).fields.get("m_ShootTarget")):
							pass
							R.call_member((c).fields.get("m_ShootTarget"), "TakeDamage", [R.static_value("RDHelicopterAlly", "FireDamage"), c, R.static_value("RDDamageType", "DevastatingBullet")])
							R.call_member(c, "SpawnBulletImpact", [((c).fields.get("m_ShootTarget")).fields.get("m_vLocation"), false])
						else:
							pass
							v_bulletMissSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
							R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
							((c).fields.get("m_vBulletImpactLocation")).fields["X"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c.fields.get("m_vVelocity")).fields.get("X")) * float(0.1)))))
							((c).fields.get("m_vBulletImpactLocation")).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceZ"))))
							R.call_member(c, "SpawnBulletImpact", [(c).fields.get("m_vBulletImpactLocation"), false])
						(c).fields["m_fFireBulletTimer"] = float(R.static_value("RDHelicopterAlly", "FireBulletDelay"))
		(c).fields["m_fFiringMissilesTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFiringMissilesTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fFiringMissilesTimer")) <= float(0))):
			pass
			(c).fields["m_bFiringMissiles"] = R.unary("!", (c).fields.get("m_bFiringMissiles"))
			if R.truth((c).fields.get("m_bFiringMissiles")):
				pass
				(c).fields["m_fFiringMissilesTimer"] = float((float((c).fields.get("m_fFiringMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringMissileDurationRandom"))))))
			else:
				pass
				(c).fields["m_fFiringMissilesTimer"] = float((float((c).fields.get("m_fNotFiringMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringMissileDurationRandom"))))))
		(c).fields["m_fFiringTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFiringTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fFiringTimer")) <= float(0))):
			pass
			(c).fields["m_bFiring"] = R.unary("!", (c).fields.get("m_bFiring"))
			if R.truth((c).fields.get("m_bFiring")):
				pass
				(c).fields["m_fFiringTimer"] = float((float((c).fields.get("m_fFiringGunDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringGunDurationRandom"))))))
			else:
				pass
				if R.truth((c).fields.get("m_bFiringGun")):
					pass
					R.call_member(c, "StopFiring", [])
				(c).fields["m_fFiringTimer"] = float((float((c).fields.get("m_fNotFiringGunDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringGunDurationRandom"))))))
	return null

static func f_SpawnBulletImpact(c: Variant, a: Array) -> Variant:
	var v_fZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_bOnGrass: Variant = false
	var v_newImpact: Variant = null
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_bHit: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fZ = float((float((v_vLocation).fields.get("Z")) - float((float(randf()) * float(1)))))
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fZ]), "Number")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_bOnGrass = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "IsOnGrass", [(float((v_vLocation).fields.get("X")) - float(v_fPerlinX)), v_fZ]), "Boolean")
	v_newImpact = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectBulletImpact")]), R.klass("RDObjectBulletImpact")), "RDObjectBulletImpact")
	R.call_member(v_newImpact, "Init", [(R.klass("MC_BulletImpactBloodChopper") if R.truth(v_bHit) else (R.klass("MC_BulletImpactGrassChopper") if R.truth(v_bOnGrass) else R.klass("MC_BulletImpactPavementChopper"))), (float(1) + float((float(randf()) * float(1))))])
	R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_newImpact, R.binary("+", (v_vLocation).fields.get("X"), R.binary("+", R.unary("-", 1), (float(randf()) * float(2)))), R.call_static("RDWorld", "GetPerlinY", [v_fZ]), (v_vLocation).fields.get("Z")])
	return null

static func f_GetShootingTargets(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	(c).fields["m_ShootTarget"] = R.coerce(null, "RDEntity")
	v_entityNode = R.coerce((((c).fields.get("m_Player")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth((((((v_entity).fields.get("m_bCanBeShotByHelicopter") and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceZ")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMaxDistanceZ")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((float((c.fields.get("m_vLocation")).fields.get("X")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceX")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) < float((float((c.fields.get("m_vLocation")).fields.get("X")) + float(R.static_value("RDHelicopterAlly", "ShootingMaxDistanceX"))))))):
			pass
			(c).fields["m_ShootTarget"] = R.coerce(v_entity, "RDEntity")
			(c).fields["m_bShootTargetIsCar"] = R.coerce(R.binary("as", (c).fields.get("m_ShootTarget"), R.klass("RDObstacleCar")), "Boolean")
			break
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null

static func f_StartFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringGun"] = true
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "gotoAndPlay"), [1])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null

static func f_StopFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringGun"] = false
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "stop"), [])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	(c).fields["m_fFireBulletTimer"] = float(0)
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fRoadLimit: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fInterpSpeed: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_fDistanceX: Variant = NAN
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
	v_fRoadLimit = float(NAN)
	v_fTargetX = float(NAN)
	v_fInterpSpeed = float(NAN)
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fRetreatPosX"] = R.coerce(R.binary("+", (c).fields.get("m_fRetreatPosX"), (float(30) * float(v_fDeltaTime))), "Number")
		v_fTargetX = R.coerce(R.binary("+", (c).fields.get("m_fRetreatPosX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
		v_fInterpSpeed = float(0.3)
	else:
		pass
		v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(20))]), "Number")
		(c).fields["m_fChangeShootingPosTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fChangeShootingPosTimer"), v_fDeltaTime), "Number")
		if R.truth(((float((c).fields.get("m_fChangeShootingPosTimer")) <= float(0)) or (float(v_fRoadLimit) < float((c).fields.get("m_fRoadLimit"))))):
			pass
			(c).fields["m_fChangeShootingPosTimer"] = float((float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMin")) + float((float(randf()) * float((float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMax")) - float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMin"))))))))
			(c).fields["m_fTargetShootingPosX"] = R.coerce(R.binary("+", R.unary("-", v_fRoadLimit), (float((float(randf()) * float(2))) * float(v_fRoadLimit))), "Number")
		(c).fields["m_fRoadLimit"] = float(v_fRoadLimit)
		if R.truth((float((c).fields.get("m_fTargetShootingPosX")) < float((c).fields.get("m_fShootingPosX")))):
			pass
			(c).fields["m_fShootingPosX"] = float(maxf(float((float((c).fields.get("m_fShootingPosX")) - float((float(R.static_value("RDHelicopterAlly", "ShootingSpeedX")) * float(v_fDeltaTime))))), float((c).fields.get("m_fTargetShootingPosX"))))
		else:
			pass
			(c).fields["m_fShootingPosX"] = float(minf(float((float((c).fields.get("m_fShootingPosX")) + float((float(R.static_value("RDHelicopterAlly", "ShootingSpeedX")) * float(v_fDeltaTime))))), float((c).fields.get("m_fTargetShootingPosX"))))
		(c).fields["m_fRetreatPosX"] = float((c).fields.get("m_fShootingPosX"))
		v_fTargetX = R.coerce(R.binary("+", (c).fields.get("m_fShootingPosX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
		v_fInterpSpeed = float(1)
	v_fDistanceX = float((float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fNewX = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), v_fTargetX, v_fDeltaTime, v_fInterpSpeed]), "Number")
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fFlyHeight"] = R.coerce(R.binary("+", (c).fields.get("m_fFlyHeight"), (float(2) * float(v_fDeltaTime))), "Number")
	v_fNewY = R.coerce(R.binary("+", (c).fields.get("m_fFlyHeight"), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	v_fTargetZ = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(20)))
	v_fDistanceRatio = float(minf(float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(v_fTargetZ))]), 60)), float(1)))
	v_fMaxSpeed = float(maxf(float((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) * float(2))), float(R.binary("/", R.binary("/", (float(50) * float(1000)), 60), 60))))
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fRetreatSpeedZ"] = R.coerce(R.binary("+", (c).fields.get("m_fRetreatSpeedZ"), (float(R.binary("/", R.binary("/", (float(20) * float(1000)), 60), 60)) * float(v_fDeltaTime))), "Number")
	else:
		pass
		(c).fields["m_fRetreatSpeedZ"] = float(v_fMaxSpeed)
	(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(((c).fields.get("m_fRetreatSpeedZ") if R.truth((c).fields.get("m_bRetreating")) else (float((float((float(1) - float(v_fDistanceRatio))) * float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")))) + float((float(v_fDistanceRatio) * float(v_fMaxSpeed))))), "Number")
	v_fNewZ = float(minf(float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float(v_fTargetZ)))
	v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fDeltaY = float((float(v_fNewY) - float((c.fields.get("m_vLocation")).fields.get("Y"))))
	v_fDeltaZ = float((float(v_fNewZ) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	R.set_value(c.fields.get("m_MC"), "rotation", R.call_static("Maths", "Clamp", [(float(v_fDistanceX) * float(R.static_value("RDHelicopterAlly", "DistanceRotationRatio"))), R.unary("-", 45), 45]), "=")
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary(">", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 25)
	return null

static func f_StartRetreat(c: Variant, a: Array) -> Variant:
	(c).fields["m_bShootingMode"] = false
	(c).fields["m_bRetreating"] = true
	R.call_member(c, "StopFiring", [])
	return null

static func f_IsRetreating(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bRetreating")
	return null

static func f_OnHitByJumpingMutant(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HitByMutantSound")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 4, "=")
	R.set_value(c, "SpawnDistance", 10, "=")
	R.set_value(c, "FlySoundVolumeFadeSpeed", 0.15, "=")
	R.set_value(c, "DustDelayMin", 0.05, "=")
	R.set_value(c, "DustDelayRandom", 0.15, "=")
	R.set_value(c, "MinFiringOffset", 10, "=")
	R.set_value(c, "ShootingMinDistanceZ", 5, "=")
	R.set_value(c, "ShootingMaxDistanceZ", 40, "=")
	R.set_value(c, "ShootingMinDistanceX", R.unary("-", 8), "=")
	R.set_value(c, "ShootingMaxDistanceX", 8, "=")
	R.set_value(c, "ShootingSpeedX", 5, "=")
	R.set_value(c, "ChangeShootingPosDelayMin", 3, "=")
	R.set_value(c, "ChangeShootingPosDelayMax", 2, "=")
	R.set_value(c, "FireDamage", 150, "=")
	R.set_value(c, "FireWidth", 3, "=")
	R.set_value(c, "FireBulletDelay", 0.1, "=")
	R.set_value(c, "FireMissileDelay", 1, "=")
	R.set_value(c, "DistanceRotationRatio", 2, "=")
	R.set_value(c, "RetreatDeccel", R.binary("/", R.binary("/", (float(6) * float(1000)), 60), 60), "=")
	R.set_value(c, "MissileSpeed", R.binary("/", R.binary("/", (float(200) * float(1000)), 60), 60), "=")
	R.set_value(c, "FireMissileOffsetX", 1, "=")
	R.set_value(c, "FireMissileOffsetY", R.unary("-", 0.1), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_FlySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_RocketSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_HitByMutantSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fDustTimer"] = float(NAN)
	(c).fields["m_fDustDelay"] = float(NAN)
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_fFiringGunDurationMin"] = float(3)
	(c).fields["m_fFiringGunDurationRandom"] = float(3)
	(c).fields["m_fFiringMissileDurationMin"] = float(1)
	(c).fields["m_fFiringMissileDurationRandom"] = float(2)
	(c).fields["m_fNotFiringGunDurationMin"] = float(0.5)
	(c).fields["m_fNotFiringGunDurationRandom"] = float(1)
	(c).fields["m_fNotFiringMissileDurationMin"] = float(2)
	(c).fields["m_fNotFiringMissileDurationRandom"] = float(2)
	(c).fields["m_fFiringTimer"] = float(NAN)
	(c).fields["m_fFireBulletTimer"] = float(NAN)
	(c).fields["m_bFiring"] = false
	(c).fields["m_bFiringMissiles"] = false
	(c).fields["m_fFiringMissilesTimer"] = float(NAN)
	(c).fields["m_bFiringGun"] = false
	(c).fields["m_bRetreating"] = false
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_fRetreatPosX"] = float(0)
	(c).fields["m_fRetreatSpeedZ"] = float(NAN)
	(c).fields["m_fFlyHeight"] = float(6)
	(c).fields["m_fSoundVolume"] = float(0)
	(c).fields["m_bShootingMode"] = false
	(c).fields["m_ShootTarget"] = R.coerce(null, "RDEntity")
	(c).fields["m_bShootTargetIsCar"] = false
	(c).fields["m_vBulletImpactLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vMissileDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fChangeShootingPosTimer"] = float(0)
	(c).fields["m_fRoadLimit"] = float(9999)
	(c).fields["m_fTargetShootingPosX"] = float(NAN)
	(c).fields["m_fShootingPosX"] = float(0)
	return null
