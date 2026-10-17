extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieVeryHard(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieVeryHard"), [R.klass("MC_ZombieVeryHard"), R.static_value("RDZombieVeryHard", "Scale")])
	c.fields["m_bSpecialZombie"] = false
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieVeryHard"), "int")
	c.fields["m_iMaxNavMeshLookup"] = R.coerce(12, "int")
	c.fields["m_fFenceDamage"] = float(5)
	c.fields["m_bHasShakyIdle"] = true
	c.fields["m_bRunning"] = true
	c.fields["m_JumpSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieJump"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_LandSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieLand"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_StepNormalSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep7"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep8"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(c.fields.get("m_StepNormalSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ZombieStep9"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	c.fields["m_StepGrassSounds"] = R.coerce(c.fields.get("m_StepNormalSounds"), "RandomHat")
	c.fields["m_iCivilianEatCount"] = R.coerce(4, "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieVeryHard"), "SetInitialState"), [])
	(c).fields["m_bInitEntry"] = true
	return null

static func f_InitMutant(c: Variant, a: Array) -> Variant:
	var v_iEntry: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bMoveToBuilding: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bAlphaMutant: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	c.fields["m_bIsAlphaMutant"] = v_bAlphaMutant
	R.call_member(c, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_bMoveToBuilding) else R.static_value("RDZombie", "MovementType_Stationary"))])
	(c).fields["m_iEntryType"] = R.coerce(v_iEntry, "int")
	c.fields["m_bSpecialZombie"] = false
	if R.truth(c.fields.get("m_bIsAlphaMutant")):
		pass
		c.fields["m_fClingHP"] = float(200)
		c.fields["m_fBodyHP"] = float(R.binary("/", 1200, (4 if R.truth(R.logical_and(R.truth(c.fields.get("m_GameplayMode")), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) else 1)))
		c.fields["m_fHeadHP"] = float(R.binary("/", 600, (4 if R.truth(R.logical_and(R.truth(c.fields.get("m_GameplayMode")), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) else 1)))
		c.fields["m_fRightArmHP"] = float(400)
		c.fields["m_fLeftArmHP"] = float(400)
		c.fields["m_fClingPunchDelay"] = float(3)
		c.fields["m_fClingPunchDamage"] = float(30)
		c.fields["m_fSpeedFactorX"] = float(2)
		c.fields["m_fSpeedFactorZ"] = float(5)
		c.fields["m_fJumpHeight"] = float(6)
		c.fields["m_fJumpTimeSpeed"] = float(1.5)
		c.fields["m_iJumpForwardDistance"] = R.coerce(5, "int")
		c.fields["m_fCummulativeDamageToJumpOff"] = float(400)
		c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanAlphaSounds"), "RandomHat")
		c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntAlphaSounds"), "RandomHat")
		c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodAlphaSounds"), "RandomHat")
		c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionAlphaSounds"), "RandomHat")
		c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatAlphaSounds"), "RandomHat")
		c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackAlphaSounds"), "RandomHat")
		c.fields["m_CueSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_AlphaZombieCue"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		c.fields["m_bCanSpaz"] = true
		c.fields["m_fSurvivalGuideDistance"] = float(40)
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_AlphaMutants"), "int")
		c.fields["m_iClingSurvivalItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_AlphaMutantTactics"), "int")
		c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 2.5), "Number")
		c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 2.5), "Number")
		c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 2.5), "Number")
		c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 2.5), "Number")
		c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 2.5), "Number")
		c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 2.5), "Number")
		c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 2.5), "Number")
	else:
		pass
		c.fields["m_fClingHP"] = float(150)
		c.fields["m_fBodyHP"] = float(R.binary("/", 800, (4 if R.truth(R.logical_and(R.truth(c.fields.get("m_GameplayMode")), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) else 1)))
		c.fields["m_fHeadHP"] = float(R.binary("/", 300, (5 if R.truth(R.logical_and(R.truth(c.fields.get("m_GameplayMode")), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) else 1)))
		c.fields["m_fRightArmHP"] = float(300)
		c.fields["m_fLeftArmHP"] = float(300)
		c.fields["m_fJumpHeight"] = float(6)
		c.fields["m_fJumpTimeSpeed"] = float(1.2)
		c.fields["m_fClingPunchDelay"] = float(3)
		c.fields["m_fClingPunchDamage"] = float(30)
		c.fields["m_fSpeedFactorX"] = float(1.5)
		c.fields["m_fSpeedFactorZ"] = float(4)
		c.fields["m_fCummulativeDamageToJumpOff"] = float(250)
		c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanVeryHardSounds"), "RandomHat")
		c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntVeryHardSounds"), "RandomHat")
		c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodVeryHardSounds"), "RandomHat")
		c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionVeryHardSounds"), "RandomHat")
		c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatVeryHardSounds"), "RandomHat")
		c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "RandomHat")
		c.fields["m_CueSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SuperZombieCue"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		c.fields["m_fSurvivalGuideDistance"] = float(40)
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Mutants"), "int")
		c.fields["m_iClingSurvivalItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_MutantTactics"), "int")
		c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 2), "Number")
		c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 2), "Number")
		c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 2), "Number")
		c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 2), "Number")
		c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 2), "Number")
		c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 2), "Number")
		c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 2), "Number")
		c.fields["m_bCanSpaz"] = false
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_bRunAhead: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_bRunAhead = false
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDZombieVeryHard"), "Update"), [v_fDeltaTime])
		return null
	if R.truth((c).fields.get("m_bInitEntry")):
		pass
		if R.truth(R.unary("!", c.fields.get("m_Player"))):
			pass
			c.fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
		if R.truth((float((c).fields.get("m_iEntryType")) == float(R.static_value("RDZombieVeryHard", "Entry_Side")))):
			pass
			if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
				pass
				R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
				R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
			c.fields["m_bGiveCue"] = false
			R.call_member(c, "StartSpawning", [c.fields.get("m_SpawnBuilding")])
		else:
			pass
			if R.truth((float((c).fields.get("m_iEntryType")) == float(R.static_value("RDZombieVeryHard", "Entry_Building")))):
				pass
				if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
					pass
					R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
					R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
				c.fields["m_bGiveCue"] = false
				R.call_member(c, "StartBuildingSpawn", [])
			else:
				pass
				if R.truth((float((c).fields.get("m_iEntryType")) == float(R.static_value("RDZombieVeryHard", "Entry_Highway")))):
					pass
					if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
						pass
						R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
						R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
					c.fields["m_bGiveCue"] = false
					R.call_member(c, "StartJumpOnHighway", [])
				else:
					pass
					if R.truth((float((c).fields.get("m_iEntryType")) == float(R.static_value("RDZombieVeryHard", "Entry_Front")))):
						pass
						if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
							pass
							R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
							R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
						c.fields["m_bGiveCue"] = false
						R.call_member(c, "StartMoveToPlayer", [])
						c.fields["m_bCanJumpOnPlayer"] = R.unary("!", R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))
					else:
						pass
						if R.truth((float((c).fields.get("m_iEntryType")) == float(R.static_value("RDZombieVeryHard", "Entry_Back")))):
							pass
							if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
								pass
								R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
								R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
							c.fields["m_bGiveCue"] = false
							R.call_member(c, "StartGetBackToPlayer", [])
							if R.truth((float(randf()) < float(0.33))):
								pass
								v_bRunAhead = (float(randf()) < float(0.5))
								R.call_member(c, "StartJumpOnGroundAheadOfPlayer", [v_bRunAhead])
						else:
							pass
							if R.truth((R.truth(c.fields.get("m_CueSound")) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(5)))):
								pass
								R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_CueSound")])
								R.assign(c, "m_iCueTick", "RDZombieVeryHard", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
							c.fields["m_bGiveCue"] = false
							R.call_member(c, "StartMoveToPlayer", [])
							c.fields["m_bCanJumpOnPlayer"] = R.unary("!", R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))
		(c).fields["m_bInitEntry"] = false
	if R.truth(R.unary("!", c.fields.get("m_bHit"))):
		pass
		if R.truth((float((c).fields.get("m_fWarnPlayerTimer")) < float(1))):
			pass
			(c).fields["m_fWarnPlayerTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fWarnPlayerTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fWarnPlayerTimer")) >= float(1))):
				pass
				R.call_member(c.fields.get("m_Player"), "OnMutantArrived", [])
	R.invoke(R.get_value(R.super_ref(c, "RDZombieVeryHard"), "Update"), [v_fDeltaTime])
	return null

static func f_CanHaveTint(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_GetClingShotAnimation(c: Variant, a: Array) -> Variant:
	return (("ShotLeftAlpha" if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))) else "ShotAlpha") if R.truth(c.fields.get("m_bIsAlphaMutant")) else ("ShotLeft" if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))) else "Shot"))
	return null

static func f_GetClingGibAnimation(c: Variant, a: Array) -> Variant:
	return ("GibAlpha" if R.truth(c.fields.get("m_bIsAlphaMutant")) else "Gib")
	return null

static func f_HandleImTheAlphaAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(c.fields.get("m_bIsAlphaMutant")):
		pass
		if R.truth(((R.binary("==", (c.fields.get("m_Player")).fields.get("m_Weapon"), (c.fields.get("m_Player")).fields.get("m_WeaponPistolCocheta")) or R.binary("==", (c.fields.get("m_Player")).fields.get("m_Weapon"), (c.fields.get("m_Player")).fields.get("m_WeaponPistolDiane"))) and R.unary("!", R.get_value(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ImTheAlpha"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "ImTheAlpha")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieVeryHard"), "OnAddedToWorld"), [])
	R.set_value(c.fields.get("m_World"), "m_iMutants", 1, "+=")
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.set_value(c.fields.get("m_World"), "m_iMutants", 1, "-=")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieVeryHard"), "Destroy"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	R.set_value(c, "Entry_Back", 0, "=")
	R.set_value(c, "Entry_Front", 1, "=")
	R.set_value(c, "Entry_Side", 2, "=")
	R.set_value(c, "Entry_Building", 3, "=")
	R.set_value(c, "Entry_Highway", 4, "=")
	R.set_value(c, "Entry_None", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iEntryType"] = R.coerce(0, "int")
	(c).fields["m_bInitEntry"] = true
	(c).fields["m_fWarnPlayerTimer"] = float(0)
	return null
