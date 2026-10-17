extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDLevelPatternCustomNew(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_mcOverride: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	R.invoke(R.super_ref(c, "RDLevelPatternCustomNew"), [])
	(c).fields["m_MCClass"] = R.coerce(v_mcClass, "Class")
	(c).fields["m_MCOverride"] = R.coerce(v_mcOverride, "MovieClip")
	return null

static func f_Load(c: Variant, a: Array) -> Variant:
	var v_iNbChild: Variant = 0
	var v_i: Variant = 0
	var v_childMC: Variant = null
	var v_spawnInfo: Variant = null
	var v_iGroundIndex: Variant = 0
	var v_gameplayMode: Variant = null
	var v_rescueMode: Variant = null
	var v_fPatternSpace: Variant = NAN
	var v_bFlip: Variant = false
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	var v_iLevel: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSpawnRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	v_iNbChild = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_childMC = R.coerce(null, "MovieClip")
	v_spawnInfo = R.coerce(null, "RDPatternSpawnInfo")
	v_iGroundIndex = R.coerce(0, "int")
	v_gameplayMode = R.coerce(R.binary("as", v_gameMode, R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_rescueMode = R.coerce(R.binary("as", v_gameMode, R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
	(c).fields["m_fStartPosition"] = float(v_fStartPosition)
	v_fPatternSpace = float(0)
	v_bFlip = (float(randf()) < float(0.5))
	if R.truth((c).fields.get("m_MCOverride")):
		pass
		(c).fields["m_MC"] = R.coerce((c).fields.get("m_MCOverride"), "MovieClip")
	else:
		pass
		(c).fields["m_MC"] = R.coerce(R.construct((c).fields.get("m_MCClass"), []), "MovieClip")
	R.invoke(R.get_value((c).fields.get("m_Grounds"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Generics"), "splice"), [0])
	R.call_member((c).fields.get("m_Hazards"), "Clear", [])
	R.call_member((c).fields.get("m_CriticalHazards"), "Clear", [])
	R.call_member((c).fields.get("m_SideHazards"), "Clear", [])
	R.call_member((c).fields.get("m_Zombies"), "Clear", [])
	R.call_member((c).fields.get("m_Soldiers"), "Clear", [])
	v_iNbChild = R.coerce(R.get_value((c).fields.get("m_MC"), "numChildren"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.invoke(R.get_value((c).fields.get("m_MC"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.call_member(c, "CanSpawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty])):
			pass
			if R.truth(R.call_member(c, "IsGround", [v_childMC])):
				pass
				v_iGroundIndex = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.binary("/", maxf(R.num(R.unary("-", R.get_value(v_childMC, "y"))), float(0)), 50), R.static_value("RDRoad", "RenderStepSize"))]), "int")
				while R.truth((float(v_iGroundIndex) > float((R.num(R.get_value((c).fields.get("m_Grounds"), "length")) - float(1))))):
					pass
					R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [null])
				R.set_value((c).fields.get("m_Grounds"), v_iGroundIndex, v_childMC, "=")
			else:
				pass
				if R.truth(R.call_member(c, "IsGeneric", [v_childMC])):
					pass
					R.invoke(R.get_value((c).fields.get("m_Generics"), "push"), [v_childMC])
				else:
					pass
					if R.truth(R.call_member(c, "IsHazard", [v_childMC, v_gameplayMode])):
						pass
						if R.truth(R.binary("<=", R.call_static("Maths", "AbsNumber", [R.get_value(v_childMC, "x")]), 500)):
							pass
							R.call_member((c).fields.get("m_Hazards"), "AddValue", [v_childMC])
						else:
							pass
							R.call_member((c).fields.get("m_SideHazards"), "AddValue", [v_childMC])
					else:
						pass
						if R.truth(R.call_member(c, "IsCriticalHazard", [v_childMC, v_gameplayMode])):
							pass
							R.call_member((c).fields.get("m_CriticalHazards"), "AddValue", [v_childMC])
						else:
							pass
							if R.truth(R.call_member(c, "IsZombie", [v_childMC, v_gameplayMode])):
								pass
								R.call_member((c).fields.get("m_Zombies"), "AddValue", [v_childMC])
							else:
								pass
								if R.truth(R.call_member(c, "IsSoldier", [v_childMC])):
									pass
									R.call_member((c).fields.get("m_Soldiers"), "AddValue", [v_childMC])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Grounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Grounds"), v_i), R.klass("MovieClip")), "MovieClip")
		v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
		v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Generics"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Generics"), v_i), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 750)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Hazards")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Hazards"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 1500)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((float((R.num(R.get_value(((c).fields.get("m_CriticalHazards")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio))) * float(0.7)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CriticalHazards"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 1500)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_SideHazards")).fields.get("m_Values"), "length")) * float(minf(float((float(v_fSpawnRatio) * float(1.5))), float(1)))))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_SideHazards"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 1500)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Zombies")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Zombies"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 1500)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Soldiers")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_childMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Soldiers"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), R.unary("-", 1500)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	(c).fields["m_MC"] = R.coerce(null, "MovieClip")
	return v_fPatternSpace
	return null

static func f_CanSpawn(c: Variant, a: Array) -> Variant:
	var v_colorTransform: Variant = null
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	var v_rescueMode: Variant = R.coerce((a[2] if a.size() > 2 else null), "RDGameModeChopperRescue")
	var v_iLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_colorTransform = R.coerce(R.get_value(R.get_value(v_childMC, "transform"), "colorTransform"), "ColorTransform")
	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Civilian"))):
		pass
		if R.truth(R.unary("!", R.call_member(v_gameplayMode, "CanSpawnCivilian", []))):
			pass
			return false
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierStationary"))):
			pass
			if R.truth((R.unary("!", R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and (R.unary("!", R.call_member(v_gameplayMode, "CanSpawnMilitary", [])) or R.unary("!", ((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iStationarySoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iStationarySoldierLevel"))) and R.unary("!", R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))):
				pass
				return false
			if R.truth(R.logical_and(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []), func(): return ((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))))):
				pass
				return false
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierAlign"))):
				pass
				if R.truth((R.unary("!", R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and (R.unary("!", R.call_member(v_gameplayMode, "CanSpawnMilitary", [])) or R.unary("!", ((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iAlignSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iAlignSoldierLevel"))) and R.unary("!", R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))):
					pass
					return false
				if R.truth(R.logical_and(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []), func(): return ((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))))):
					pass
					return false
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierSpikes"))):
					pass
					if R.truth((R.unary("!", R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and (R.unary("!", R.call_member(v_gameplayMode, "CanSpawnMilitary", [])) or R.unary("!", ((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel"))) and R.unary("!", R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))):
						pass
						return false
					if R.truth(R.logical_and(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []), func(): return ((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))))):
						pass
						return false
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierBomb"))):
						pass
						if R.truth((R.unary("!", R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and (R.unary("!", R.call_member(v_gameplayMode, "CanSpawnMilitary", [])) or R.unary("!", ((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iBombSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iBombSoldierLevel"))) and R.unary("!", R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))):
							pass
							return false
						if R.truth(R.logical_and(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []), func(): return ((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))))):
							pass
							return false
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierPatrol")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierStraight")))):
							pass
							if R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", [])))):
								pass
								return false
						else:
							pass
							if R.truth(((((((((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardPatrol")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardFeed"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Feeders"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalPatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalFeed")))):
								pass
								if R.truth(R.logical_and(R.call_member(v_gameplayMode, "SkipZombiesForTutorial", []), func(): return (float((float((c).fields.get("m_fStartPosition")) + float(R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)))) < float(R.static_value("RDGameModeGameplay", "NoZombieMargin"))))):
									pass
									return false
								if R.truth(R.unary("!", R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))):
									pass
									return false
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FuelTruck"))):
									pass
									if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iFuelTruckLevel")))):
										pass
										return false
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Mine"))):
										pass
										if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iMineLevel")))):
											pass
											return false
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Oil"))):
											pass
											if R.truth((float(randf()) >= float((float(0.1) + float((float(v_fDifficulty) * float(0.3))))))):
												pass
												return false
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Spikes"))):
												pass
												if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikesLevel")))):
													pass
													return false
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ChopperSpot"))):
													pass
													if R.truth(R.binary("==", R.binary("as", v_gameplayMode, R.klass("RDGameModeChopperRescue")), null)):
														pass
														return false
	return true
	return null

static func f_IsGround(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	if R.truth((((((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Pavement")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Park"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Parking"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_GrassAndPavement"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_PavementAndGrass"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_CrossingStreet"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Alleyway"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_ForestPath")))):
		pass
		return true
	return false
	return null

static func f_IsGeneric(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	if R.truth((((((((((((((((((((((((((((((((((((((((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialRight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialRight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchRight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationRight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageRight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageLeft"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Civilian"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_RoadBlood"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush1"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush2"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush3"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_WeaponCrate"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireHydrant"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireHydrantFlowing"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_WaterJug"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayRamp"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayRampExit"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayExitSign"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_EndChopper"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ShoppingMall"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_GrassTop"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallHillTop"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ChopperSpot"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ShoppingCart"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ElectronicSign"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Box"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficCone"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficBarrel"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ConstructionSign"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Table"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LawnFlamingo"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_GardenGnome"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficLight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrashCan"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MailBox"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_RoadKill")))):
		pass
		return true
	return false
	return null

static func f_IsHazard(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	if R.truth(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Ambulance")), func(): return R.logical_and(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ArmyTruck")), func(): return R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", []))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FuelTruck"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BurningCar"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bus"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireTruck"))), func(): return R.logical_and(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerNarrow")), func(): return R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", []))), func(): return R.logical_and(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerWide")), func(): return R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", []))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerNarrowDamaged"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerWideDamaged"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarNarrow"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarNarrowCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarWide"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarWideCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarNarrow"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarNarrowCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarWide"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarWideCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PoliceCarNarrow"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PoliceCarWide"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Semi"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarNarrow"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarNarrowCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarWide"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarWideCrashed"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MovingCar"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Oil"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SandBags"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SandBagsBloody"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MapleTree"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_DeadTree"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PineTree"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Barracade"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Tomb"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Dumpster"))), func(): return R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Fence")))):
		pass
		return true
	return false
	return null

static func f_IsCriticalHazard(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Mine")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Spikes")))):
		pass
		return true
	return false
	return null

static func f_IsZombie(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	if R.truth(R.logical_or(((((((((((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardPatrol")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardFeed"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Feeders"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierPatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalPatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalFeed"))), func(): return R.logical_and(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []), func(): return (((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierStationary")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierAlign"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierSpikes"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierBomb")))))):
		pass
		return true
	return false
	return null

static func f_IsSoldier(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	if R.truth((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierStationary")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierAlign"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierSpikes"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierBomb")))):
		pass
		return true
	return false
	return null

static func f_SpawnYellowDots(c: Variant, a: Array) -> Variant:
	var v_yellowDot: Variant = null
	var v_iNbDots: Variant = 0
	var v_i: Variant = 0
	var v_fStartPosition: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_iSlicePos: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_iSliceType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: Variant = R.coerce((a[3] if a.size() > 3 else null), "RDGameModeGameplay")
	v_yellowDot = R.coerce(null, "RDObject")
	v_iNbDots = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	if R.truth((((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Town"))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))))):
		pass
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
	else:
		pass
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
			pass
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
		else:
			pass
			if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(14))):
					pass
					v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDWhiteLine")]), R.klass("RDObject")), "RDObject")
					R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.binary("+", R.unary("-", 20), R.binary("/", (float(v_i) * float((float(20) * float(2)))), 14)), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
					v_i = R.signed32(v_i + 1)
	return null

static func f_Spawn(c: Variant, a: Array) -> Variant:
	var v_carSpawnInfo: Variant = null
	var v_car: Variant = null
	var v_buildingBG: Variant = null
	var v_building: Variant = null
	var v_soldier: Variant = null
	var v_zombie: Variant = null
	var v_zombieClass: Variant = null
	var v_p: Variant = 0
	var v_fPerlinSpeedX: Variant = NAN
	var v_fPerlinSpeedY: Variant = NAN
	var v_iSlideIndex: Variant = 0
	var v_iSliceType: Variant = 0
	var v_fRandomTree: Variant = NAN
	var v_bCleanClinger: Variant = false
	var v_fMCPosY: Variant = NAN
	var v_fObjectPosX: Variant = NAN
	var v_fObjectPosZ: Variant = NAN
	var v_hiddenSoldier: Variant = null
	var v_entity: Variant = null
	var v_entity2: Variant = null
	var v_colorTransform: Variant = null
	var v_childMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	var v_rescueMode: Variant = R.coerce((a[2] if a.size() > 2 else null), "RDGameModeChopperRescue")
	var v_iLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[6] if a.size() > 6 else NAN), "Number")
	var v_bFlip: Variant = R.coerce((a[7] if a.size() > 7 else false), "Boolean")
	v_carSpawnInfo = R.coerce(null, "RDCarSpawnInfo")
	v_car = R.coerce(null, "RDObstacleCar")
	v_buildingBG = R.coerce(null, "RDBuildingNewBG")
	v_building = R.coerce(null, "RDBuildingNew")
	v_soldier = R.coerce(null, "RDSoldier")
	v_zombie = R.coerce(null, "RDZombie")
	v_zombieClass = R.coerce(null, "Class")
	v_p = R.coerce(0, "int")
	v_fPerlinSpeedX = float(NAN)
	v_fPerlinSpeedY = float(NAN)
	v_iSlideIndex = R.coerce(0, "int")
	v_iSliceType = R.coerce(0, "int")
	v_fRandomTree = float(NAN)
	v_bCleanClinger = false
	v_fMCPosY = float(NAN)
	v_fObjectPosX = float(NAN)
	v_fObjectPosZ = float(NAN)
	v_hiddenSoldier = R.coerce(null, "RDSoldier")
	v_entity = R.coerce(null, "RDEntity")
	v_entity2 = R.coerce(null, "RDEntity")
	((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(0)
	v_colorTransform = R.coerce(R.get_value(R.get_value(v_childMC, "transform"), "colorTransform"), "ColorTransform")
	if R.truth(R.call_member(c, "IsGround", [v_childMC])):
		pass
		v_iSlideIndex = R.coerce(floorf(float(R.binary("/", (float((float(v_fStartPosition) + float(R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)))) - float((((v_gameplayMode).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))), R.static_value("RDRoad", "RenderStepSize")))), "int")
		if R.truth((float((((v_gameplayMode).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float(0))):
			pass
			v_iSlideIndex = R.signed32(v_iSlideIndex + 1)
		v_fPerlinSpeedX = float(0.001)
		v_fPerlinSpeedY = float(0.0008)
		if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
			pass
			v_fPerlinSpeedX = float(0.0005)
			v_fPerlinSpeedY = float(0.0001)
		else:
			pass
			if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
				pass
				v_fPerlinSpeedX = float(0)
				v_fPerlinSpeedY = float(0.0012)
			else:
				pass
				if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
					pass
					v_fPerlinSpeedX = float(0)
					v_fPerlinSpeedY = float(0.0008)
				else:
					pass
					if R.truth(((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking"))) or (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_ChopperShooting"))))):
						pass
						v_fPerlinSpeedX = float(0)
						v_fPerlinSpeedY = float(0)
		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Pavement"))):
			pass
			v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Town"), "int")
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Park"))):
				pass
				v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Park"), "int")
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Parking"))):
					pass
					v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Parking"), "int")
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_GrassAndPavement"))):
						pass
						v_iSliceType = R.coerce((R.static_value("RDRoad", "SliceType_PavementAndGrass") if R.truth(v_bFlip) else R.static_value("RDRoad", "SliceType_GrassAndPavement")), "int")
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_PavementAndGrass"))):
							pass
							v_iSliceType = R.coerce((R.static_value("RDRoad", "SliceType_GrassAndPavement") if R.truth(v_bFlip) else R.static_value("RDRoad", "SliceType_PavementAndGrass")), "int")
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_CrossingStreet"))):
								pass
								v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_CrossingStreet"), "int")
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_Alleyway"))):
									pass
									v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Alleyway"), "int")
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelGround_ForestPath"))):
										pass
										v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_ForestPath"), "int")
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, v_iSlideIndex])
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(R.static_value("RDRoad", "RenderStepSize"))
		v_p = R.coerce(0, "int")
		while R.truth((float(v_p) < float(R.static_value("RDRoad", "RenderStepSize")))):
			pass
			R.call_static("RDWorld", "AddPerlinTrackPoint", [v_fPerlinSpeedX, v_fPerlinSpeedY])
			v_p = R.signed32(v_p + 1)
		R.call_member(c, "SpawnYellowDots", [v_fStartPosition, R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)]), v_iSliceType, v_gameplayMode])
	else:
		pass
		if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownLeft")))):
			pass
			if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
				pass
				v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
				R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Town"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
				v_entity = R.coerce(v_buildingBG, "RDEntity")
			else:
				pass
				v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
				R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Town"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingTownRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
				v_entity = R.coerce(v_building, "RDEntity")
		else:
			pass
			if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialLeft")))):
				pass
				if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
					pass
					v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
					R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Industrial"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
					v_entity = R.coerce(v_buildingBG, "RDEntity")
					v_entity = R.coerce(v_buildingBG, "RDEntity")
				else:
					pass
					v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
					R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Industrial"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingIndustrialRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
					v_entity = R.coerce(v_building, "RDEntity")
			else:
				pass
				if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialLeft")))):
					pass
					if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
						pass
						v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
						R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Residential"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
						v_entity = R.coerce(v_buildingBG, "RDEntity")
					else:
						pass
						v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
						R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Residential"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingResidentialRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
						v_entity = R.coerce(v_building, "RDEntity")
				else:
					pass
					if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchLeft")))):
						pass
						if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
							pass
							v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
							R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Church"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
							v_entity = R.coerce(v_buildingBG, "RDEntity")
						else:
							pass
							v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
							R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Church"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingChurchRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
							v_entity = R.coerce(v_building, "RDEntity")
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationLeft")))):
							pass
							if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
								pass
								v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
								R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_PoliceStation"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
								v_entity = R.coerce(v_buildingBG, "RDEntity")
							else:
								pass
								v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
								R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_PoliceStation"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingPoliceStationRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
								v_entity = R.coerce(v_building, "RDEntity")
						else:
							pass
							if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageRight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageLeft")))):
								pass
								if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
									pass
									v_buildingBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
									R.call_member(v_buildingBG, "Init", [R.static_value("RDBuildingNewBG", "Type_Garage"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
									v_entity = R.coerce(v_buildingBG, "RDEntity")
								else:
									pass
									v_building = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew")), "RDBuildingNew")
									R.call_member(v_building, "Init", [R.static_value("RDBuildingNew", "Type_Garage"), R.static_value("RDBuildingNew", "Variation_Random"), R.binary("==", R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BuildingGarageRight")), R.unary("!", v_bFlip)), (float(randf()) < float(v_fDifficulty))])
									v_entity = R.coerce(v_building, "RDEntity")
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Ambulance"))):
									pass
									v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_AmbulanceClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
									v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
									R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
									v_entity = R.coerce(v_car, "RDEntity")
									R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "LargeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ArmyTruck"))):
										pass
										v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_ArmyTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
										v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarArmyTruck")]), R.klass("RDObstacleCarArmyTruck")), "RDObstacleCar")
										R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
										v_entity = R.coerce(v_car, "RDEntity")
										R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FuelTruck"))):
											pass
											v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_FuelTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
											v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFuelTruck")]), R.klass("RDObstacleFuelTruck")), "RDObstacleCar")
											R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
											v_entity = R.coerce(v_car, "RDEntity")
											R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "FuelTruckHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_BurningCar"))):
												pass
												v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_BurningCarClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
												v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarBurning")]), R.klass("RDObstacleCarBurning")), "RDObstacleCar")
												R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
												v_entity = R.coerce(v_car, "RDEntity")
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bus"))):
													pass
													v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_BusClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
													v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarBus")]), R.klass("RDObstacleCarBus")), "RDObstacleCar")
													R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
													v_entity = R.coerce(v_car, "RDEntity")
													R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
												else:
													pass
													if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireTruck"))):
														pass
														v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_FireTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
														v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarFireTruck")]), R.klass("RDObstacleCarFireTruck")), "RDObstacleCar")
														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
														v_entity = R.coerce(v_car, "RDEntity")
														R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
													else:
														pass
														if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerNarrow"))):
															pass
															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
															v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary")), "RDObstacleCar")
															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
															v_entity = R.coerce(v_car, "RDEntity")
															R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
														else:
															pass
															if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerWide"))):
																pass
																v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary")), "RDObstacleCar")
																R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																v_entity = R.coerce(v_car, "RDEntity")
																R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
															else:
																pass
																if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerNarrowDamaged"))):
																	pass
																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerNarrowDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																	v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitaryDamaged")]), R.klass("RDObstacleCarMilitaryDamaged")), "RDObstacleCar")
																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																	v_entity = R.coerce(v_car, "RDEntity")
																	R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), 1])
																else:
																	pass
																	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HummerWideDamaged"))):
																		pass
																		v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_HummerWideDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																		v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitaryDamaged")]), R.klass("RDObstacleCarMilitaryDamaged")), "RDObstacleCar")
																		R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																		v_entity = R.coerce(v_car, "RDEntity")
																		R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), 1])
																	else:
																		pass
																		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarNarrow"))):
																			pass
																			if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																				pass
																				v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																			else:
																				pass
																				v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																			v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																			R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																			v_entity = R.coerce(v_car, "RDEntity")
																			R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "LargeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																		else:
																			pass
																			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarNarrowCrashed"))):
																				pass
																				v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																				v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																				R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																				v_entity = R.coerce(v_car, "RDEntity")
																				R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "LargeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																			else:
																				pass
																				if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarWide"))):
																					pass
																					if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																						pass
																						v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																					else:
																						pass
																						v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																					v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																					R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																					v_entity = R.coerce(v_car, "RDEntity")
																					R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "LargeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																				else:
																					pass
																					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LargeCarWideCrashed"))):
																						pass
																						v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_LargeCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																						v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge")), "RDObstacleCar")
																						R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																						v_entity = R.coerce(v_car, "RDEntity")
																						R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "LargeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																					else:
																						pass
																						if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarNarrow"))):
																							pass
																							if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																								pass
																								v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																							else:
																								pass
																								v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																							v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																							R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																							v_entity = R.coerce(v_car, "RDEntity")
																							R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																						else:
																							pass
																							if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarNarrowCrashed"))):
																								pass
																								v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																								v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																								R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																								v_entity = R.coerce(v_car, "RDEntity")
																								R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																							else:
																								pass
																								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarWide"))):
																									pass
																									if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																										pass
																										v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																									else:
																										pass
																										v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																									v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																									R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																									v_entity = R.coerce(v_car, "RDEntity")
																									R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																								else:
																									pass
																									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MediumCarWideCrashed"))):
																										pass
																										v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_MediumCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																										v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																										R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																										v_entity = R.coerce(v_car, "RDEntity")
																										R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																									else:
																										pass
																										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PoliceCarNarrow"))):
																											pass
																											if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																												pass
																												v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_PoliceCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																											else:
																												pass
																												v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_PoliceCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																											v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																											R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																											v_entity = R.coerce(v_car, "RDEntity")
																											R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																										else:
																											pass
																											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PoliceCarWide"))):
																												pass
																												if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																													pass
																													v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_PoliceCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																												else:
																													pass
																													v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_PoliceCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																												v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium")), "RDObstacleCar")
																												R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																												v_entity = R.coerce(v_car, "RDEntity")
																												R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "MediumCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																											else:
																												pass
																												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Semi"))):
																													pass
																													v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SemiClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																													v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarSemi")]), R.klass("RDObstacleCarSemi")), "RDObstacleCar")
																													R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																													v_entity = R.coerce(v_car, "RDEntity")
																													R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "HugeCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																												else:
																													pass
																													if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarNarrow"))):
																														pass
																														if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																															pass
																															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																														else:
																															pass
																															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																														v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																														v_entity = R.coerce(v_car, "RDEntity")
																														R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "SmallCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																													else:
																														pass
																														if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarNarrowCrashed"))):
																															pass
																															v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																															v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																															v_entity = R.coerce(v_car, "RDEntity")
																															R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "SmallCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																														else:
																															pass
																															if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarWide"))):
																																pass
																																if R.truth((float(randf()) < float((float(0.1) + float((float(v_fDifficulty) * float(0.7))))))):
																																	pass
																																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																else:
																																	pass
																																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																																R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																v_entity = R.coerce(v_car, "RDEntity")
																																R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "SmallCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																															else:
																																pass
																																if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallCarWideCrashed"))):
																																	pass
																																	v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_SmallCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																	v_car = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
																																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																	v_entity = R.coerce(v_car, "RDEntity")
																																	R.call_member(v_car, "SetHP", [R.static_value("RDObstacleCar", "SmallCarHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																																else:
																																	pass
																																	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MovingCar"))):
																																		pass
																																		if R.truth(((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_AprilsFool"))) and (float(randf()) < float(0.25)))):
																																			pass
																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDDudeBro")]), "RDEntity")
																																			R.call_member(R.binary("as", v_entity, R.klass("RDDudeBro")), "InitDudeBro", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), R.unary("!", v_bFlip))])
																																		else:
																																			pass
																																			v_carSpawnInfo = R.coerce(R.binary("as", R.call_member(R.static_value("RDCarSpawnInfos", "m_CarMovingClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo")), "RDCarSpawnInfo")
																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDPassingCar")]), "RDEntity")
																																			R.call_member(R.binary("as", v_entity, R.klass("RDPassingCar")), "InitPassingCar", [(v_carSpawnInfo).fields.get("m_MCClass"), R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), R.unary("!", v_bFlip))])
																																	else:
																																		pass
																																		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Civilian"))):
																																			pass
																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDCivilian")]), "RDEntity")
																																			R.call_member(R.binary("as", v_entity, R.klass("RDCivilian")), "Init", [(float(randf()) > float(0.5))])
																																		else:
																																			pass
																																			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierStationary"))):
																																				pass
																																				if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																					pass
																																					v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																					R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																					v_entity = R.coerce(v_zombie, "RDEntity")
																																				else:
																																					pass
																																					v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																					R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_ShootPlayer")])
																																					v_entity = R.coerce(v_soldier, "RDEntity")
																																			else:
																																				pass
																																				if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierAlign"))):
																																					pass
																																					if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																						pass
																																						v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																						R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																						v_entity = R.coerce(v_zombie, "RDEntity")
																																					else:
																																						pass
																																						v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																						R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")])
																																						v_entity = R.coerce(v_soldier, "RDEntity")
																																				else:
																																					pass
																																					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierSpikes"))):
																																						pass
																																						if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																							pass
																																							v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																							R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																							v_entity = R.coerce(v_zombie, "RDEntity")
																																						else:
																																							pass
																																							v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																							R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_PullSpikeStrip")])
																																							v_entity = R.coerce(v_soldier, "RDEntity")
																																					else:
																																						pass
																																						if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SoldierBomb"))):
																																							pass
																																							if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																								pass
																																								v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																								R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																								v_entity = R.coerce(v_zombie, "RDEntity")
																																							else:
																																								pass
																																								v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																								R.call_member(v_soldier, "Init", [R.static_value("RDSoldier", "Behavior_TriggerExplosion")])
																																								v_entity = R.coerce(v_soldier, "RDEntity")
																																						else:
																																							pass
																																							if R.truth((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardPatrol")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemalePatrol"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalPatrol")))):
																																								pass
																																								if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []), func(): return R.call_member(v_gameplayMode, "CanSpawnMilitary", [])), func(): return (float(randf()) < float(0.5)))):
																																									pass
																																									v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																									R.call_member(v_soldier, "Init", [(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDSoldier", "Behavior_ShootPlayer"))])
																																									v_entity = R.coerce(v_soldier, "RDEntity")
																																								else:
																																									pass
																																									v_zombieClass = R.coerce(R.call_member(v_gameplayMode, "GetRandomZombieClass", []), "Class")
																																									v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie")), "RDZombie")
																																									R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																									v_entity = R.coerce(v_zombie, "RDEntity")
																																							else:
																																								pass
																																								if R.truth((((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardStraight")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewMaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNewFemaleStraight"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalStraight")))):
																																									pass
																																									if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []), func(): return R.call_member(v_gameplayMode, "CanSpawnMilitary", [])), func(): return (float(randf()) < float(0.5)))):
																																										pass
																																										v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																										R.call_member(v_soldier, "Init", [(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDSoldier", "Behavior_ShootPlayer"))])
																																										v_entity = R.coerce(v_soldier, "RDEntity")
																																									else:
																																										pass
																																										v_zombieClass = R.coerce(R.call_member(v_gameplayMode, "GetRandomZombieClass", []), "Class")
																																										v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie")), "RDZombie")
																																										R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																										v_entity = R.coerce(v_zombie, "RDEntity")
																																								else:
																																									pass
																																									if R.truth(((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieHardFeed")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieNormalFeed"))) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Feeders")))):
																																										pass
																																										if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []), func(): return R.call_member(v_gameplayMode, "CanSpawnMilitary", [])), func(): return (float(randf()) < float(0.5)))):
																																											pass
																																											v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																											R.call_member(v_soldier, "Init", [(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDSoldier", "Behavior_ShootPlayer"))])
																																											v_entity = R.coerce(v_soldier, "RDEntity")
																																										else:
																																											pass
																																											v_zombieClass = R.coerce(R.call_member(v_gameplayMode, "GetRandomFeedZombieClass", []), "Class")
																																											v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie")), "RDZombie")
																																											R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Feed")])
																																											v_entity = R.coerce(v_zombie, "RDEntity")
																																									else:
																																										pass
																																										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierPatrol"))):
																																											pass
																																											if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []), func(): return R.call_member(v_gameplayMode, "CanSpawnMilitary", [])), func(): return (float(randf()) < float(0.5)))):
																																												pass
																																												v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																												R.call_member(v_soldier, "Init", [(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDSoldier", "Behavior_ShootPlayer"))])
																																												v_entity = R.coerce(v_soldier, "RDEntity")
																																											else:
																																												pass
																																												v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																												R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Straight")])
																																												v_entity = R.coerce(v_zombie, "RDEntity")
																																										else:
																																											pass
																																											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ZombieSoldierStraight"))):
																																												pass
																																												if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []), func(): return R.call_member(v_gameplayMode, "CanSpawnMilitary", [])), func(): return (float(randf()) < float(0.5)))):
																																													pass
																																													v_soldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
																																													R.call_member(v_soldier, "Init", [(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDSoldier", "Behavior_ShootPlayer"))])
																																													v_entity = R.coerce(v_soldier, "RDEntity")
																																												else:
																																													pass
																																													v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier")), "RDZombie")
																																													R.call_member(v_zombie, "Init", [(R.static_value("RDZombie", "MovementType_RescueMode") if R.truth(v_rescueMode) else R.static_value("RDZombie", "MovementType_Straight"))])
																																													v_entity = R.coerce(v_zombie, "RDEntity")
																																											else:
																																												pass
																																												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Oil"))):
																																													pass
																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDOilSlick")]), "RDEntity")
																																												else:
																																													pass
																																													if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_RoadKill"))):
																																														pass
																																														if R.truth(R.logical_and(R.logical_and((R.unary("!", R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iGrubLevel")))), func(): return R.call_member(v_gameplayMode, "CanSpawnGrub", [])), func(): return (float(randf()) < float((float(0.2) + float((float(v_fDifficulty) * float(0.6)))))))):
																																															pass
																																															v_zombie = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieGrub")]), R.klass("RDZombieGrub")), "RDZombie")
																																															R.call_member(v_zombie, "Init", [R.static_value("RDZombie", "MovementType_Down")])
																																															v_entity = R.coerce(v_zombie, "RDEntity")
																																														else:
																																															pass
																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBody")]), "RDEntity")
																																													else:
																																														pass
																																														if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_RoadBlood"))):
																																															pass
																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDBloodSpill")]), "RDEntity")
																																														else:
																																															pass
																																															if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SandBags"))):
																																																pass
																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBags")]), "RDEntity")
																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleSandBags")), "Init", [v_fDifficulty])
																																															else:
																																																pass
																																																if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SandBagsBloody"))):
																																																	pass
																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBagsBloody")]), "RDEntity")
																																																else:
																																																	pass
																																																	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush1"))):
																																																		pass
																																																		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																			pass
																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																		else:
																																																			pass
																																																			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																				pass
																																																				if R.truth((float(randf()) < float(0.25))):
																																																					pass
																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																				else:
																																																					pass
																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush1")]), "RDEntity")
																																																			else:
																																																				pass
																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush1")]), "RDEntity")
																																																	else:
																																																		pass
																																																		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush2"))):
																																																			pass
																																																			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																				pass
																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																			else:
																																																				pass
																																																				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																					pass
																																																					if R.truth((float(randf()) < float(0.25))):
																																																						pass
																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																					else:
																																																						pass
																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush2")]), "RDEntity")
																																																				else:
																																																					pass
																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush2")]), "RDEntity")
																																																		else:
																																																			pass
																																																			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Bush3"))):
																																																				pass
																																																				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																					pass
																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																				else:
																																																					pass
																																																					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																						pass
																																																						if R.truth((float(randf()) < float(0.25))):
																																																							pass
																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																						else:
																																																							pass
																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush3")]), "RDEntity")
																																																					else:
																																																						pass
																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush3")]), "RDEntity")
																																																			else:
																																																				pass
																																																				if R.truth((R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MapleTree")) or R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_PineTree")))):
																																																					pass
																																																					v_fRandomTree = float(randf())
																																																					if R.truth((float(v_fRandomTree) < float(0.56))):
																																																						pass
																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMapleTree")]), "RDEntity")
																																																						R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMapleTree")), "Init", [(float(randf()) < float(0.5))])
																																																					else:
																																																						pass
																																																						if R.truth((float(v_fRandomTree) < float(0.85))):
																																																							pass
																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePineTree")]), "RDEntity")
																																																						else:
																																																							pass
																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")]), "RDEntity")
																																																				else:
																																																					pass
																																																					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_DeadTree"))):
																																																						pass
																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")]), "RDEntity")
																																																					else:
																																																						pass
																																																						if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_WeaponCrate"))):
																																																							pass
																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWeaponCrate")]), "RDEntity")
																																																						else:
																																																							pass
																																																							if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Table"))):
																																																								pass
																																																								v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTable")]), "RDEntity")
																																																							else:
																																																								pass
																																																								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Barracade"))):
																																																									pass
																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBarricade")]), "RDEntity")
																																																								else:
																																																									pass
																																																									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Tomb"))):
																																																										pass
																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")]), "RDEntity")
																																																										R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [])
																																																									else:
																																																										pass
																																																										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_LawnFlamingo"))):
																																																											pass
																																																											if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																												pass
																																																												v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																											else:
																																																												pass
																																																												v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFlamingo")]), "RDEntity")
																																																										else:
																																																											pass
																																																											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_GardenGnome"))):
																																																												pass
																																																												if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ValentinesDay")))):
																																																													pass
																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnomeValentine")]), "RDEntity")
																																																												else:
																																																													pass
																																																													if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																														pass
																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																													else:
																																																														pass
																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnome")]), "RDEntity")
																																																											else:
																																																												pass
																																																												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficLight"))):
																																																													pass
																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficLight")]), "RDEntity")
																																																													R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTrafficLight")), "Init", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), R.unary("!", v_bFlip))])
																																																												else:
																																																													pass
																																																													if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrashCan"))):
																																																														pass
																																																														if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ValentinesDay")))):
																																																															pass
																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleValentineTable")]), "RDEntity")
																																																														else:
																																																															pass
																																																															if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
																																																																pass
																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")]), "RDEntity")
																																																															else:
																																																																pass
																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrashCan")]), "RDEntity")
																																																													else:
																																																														pass
																																																														if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_MailBox"))):
																																																															pass
																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMailBox")]), "RDEntity")
																																																															R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMailBox")), "Init", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), R.unary("!", v_bFlip))])
																																																														else:
																																																															pass
																																																															if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireHydrant"))):
																																																																pass
																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")]), "RDEntity")
																																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [false])
																																																															else:
																																																																pass
																																																																if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_FireHydrantFlowing"))):
																																																																	pass
																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")]), "RDEntity")
																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [true])
																																																																else:
																																																																	pass
																																																																	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Dumpster"))):
																																																																		pass
																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDumpster")]), "RDEntity")
																																																																		R.call_member(R.binary("as", v_entity, R.klass("RDObstacleDumpster")), "Init", [R.binary("==", R.binary(">", R.get_value(v_childMC, "x"), 0), R.unary("!", v_bFlip))])
																																																																	else:
																																																																		pass
																																																																		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Mine"))):
																																																																			pass
																																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDMine")]), "RDEntity")
																																																																		else:
																																																																			pass
																																																																			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Fence"))):
																																																																				pass
																																																																				v_bCleanClinger = (((R.binary("==", (c).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", (c).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", (c).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", (c).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking")))
																																																																				v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFence")]), "RDEntity")
																																																																				R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFence")), "Init", [v_bCleanClinger])
																																																																			else:
																																																																				pass
																																																																				if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Spikes"))):
																																																																					pass
																																																																					v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDSpikeStrip")]), "RDEntity")
																																																																				else:
																																																																					pass
																																																																					if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ShoppingCart"))):
																																																																						pass
																																																																						v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleShoppingCart")]), "RDEntity")
																																																																					else:
																																																																						pass
																																																																						if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ElectronicSign"))):
																																																																							pass
																																																																							v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleElectronicSign")]), "RDEntity")
																																																																						else:
																																																																							pass
																																																																							if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_Box"))):
																																																																								pass
																																																																								if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																																									pass
																																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																																								else:
																																																																									pass
																																																																									v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBox")]), "RDEntity")
																																																																							else:
																																																																								pass
																																																																								if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficCone"))):
																																																																									pass
																																																																									if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																																										pass
																																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																																									else:
																																																																										pass
																																																																										v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficCone")]), "RDEntity")
																																																																								else:
																																																																									pass
																																																																									if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_TrafficBarrel"))):
																																																																										pass
																																																																										if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
																																																																											pass
																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")]), "RDEntity")
																																																																										else:
																																																																											pass
																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficBarrel")]), "RDEntity")
																																																																									else:
																																																																										pass
																																																																										if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ConstructionSign"))):
																																																																											pass
																																																																											v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleConstructionSign")]), "RDEntity")
																																																																										else:
																																																																											pass
																																																																											if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_WaterJug"))):
																																																																												pass
																																																																												if R.truth(((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_SaintPatricksDay"))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_CincoDeMayo"))))):
																																																																													pass
																																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBeerKeg")]), "RDEntity")
																																																																												else:
																																																																													pass
																																																																													if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Christmas")))):
																																																																														pass
																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSnowman")]), "RDEntity")
																																																																													else:
																																																																														pass
																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), "RDEntity")
																																																																											else:
																																																																												pass
																																																																												if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayRamp"))):
																																																																													pass
																																																																													v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), "RDEntity")
																																																																													R.call_member(R.binary("as", v_entity, R.klass("RDHighwayRamp")), "Init", [R.klass("MC_HighwayRamp")])
																																																																												else:
																																																																													pass
																																																																													if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayRampExit"))):
																																																																														pass
																																																																														v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), "RDEntity")
																																																																														R.call_member(R.binary("as", v_entity, R.klass("RDHighwayRamp")), "Init", [R.klass("MovieClip")])
																																																																													else:
																																																																														pass
																																																																														if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_HighwayExitSign"))):
																																																																															pass
																																																																															v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), "RDEntity")
																																																																															R.call_member(R.binary("as", v_entity, R.klass("RDRoadSign")), "Init", [(R.klass("MC_highwaysignrampexitflipped") if R.truth(v_bFlip) else R.klass("MC_highwaysignrampexit"))])
																																																																															v_entity2 = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), "RDEntity")
																																																																															R.call_member(R.binary("as", v_entity2, R.klass("RDRoadSignOffRoad")), "Init", [R.klass("MC_highwaysignoffroad")])
																																																																															(R.binary("as", v_entity, R.klass("RDRoadSign"))).fields["m_OffRoadPart"] = R.coerce(R.binary("as", v_entity2, R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
																																																																														else:
																																																																															pass
																																																																															if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_EndChopper"))):
																																																																																pass
																																																																																v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopper")]), "RDEntity")
																																																																															else:
																																																																																pass
																																																																																if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ShoppingMall"))):
																																																																																	pass
																																																																																	v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObjectShoppingMall")]), "RDEntity")
																																																																																else:
																																																																																	pass
																																																																																	if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_SmallHillTop"))):
																																																																																		pass
																																																																																		v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSmallHillTop")]), "RDEntity")
																																																																																	else:
																																																																																		pass
																																																																																		if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_GrassTop"))):
																																																																																			pass
																																																																																			v_entity = R.coerce(R.call_static("RDGame", "GetEntity", [R.klass("RDGrassTop")]), "RDEntity")
																																																																																		else:
																																																																																			pass
																																																																																			if R.truth(R.binary("==", R.get_value(v_childMC, "constructor"), R.klass("MC_LevelObject_ChopperSpot"))):
																																																																																				pass
																																																																																				if R.truth(v_rescueMode):
																																																																																					pass
																																																																																					((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float((float(R.binary("/", R.get_value(v_childMC, "x"), 50)) * R.num((R.unary("-", 1) if R.truth(v_bFlip) else 1))))
																																																																																					((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float((float(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)])) * float(v_fStretch)))
																																																																																					R.call_member(v_rescueMode, "SetChopperSpot", [R.binary("+", ((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [(float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ")))])), R.call_static("RDWorld", "GetPerlinY", [(float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ")))]), (float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ")))])
	if R.truth(v_entity):
		pass
		v_fMCPosY = float(minf(R.num(R.get_value(v_childMC, "y")), R.num(R.unary("-", 0.1))))
		v_fObjectPosX = float((float(R.binary("/", R.get_value(v_childMC, "x"), 50)) * R.num((R.unary("-", 1) if R.truth(v_bFlip) else 1))))
		v_fObjectPosZ = float((float(R.binary("/", R.unary("-", v_fMCPosY), 50)) * float(v_fStretch)))
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(v_fObjectPosX)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float(v_fObjectPosZ)
		((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ"))))
		((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation")).fields.get("Z")])), "Number")
		((v_entity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
		if R.truth(v_entity2):
			pass
			((v_entity2).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ"))))
			((v_entity2).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity2).fields.get("m_vLocation")).fields.get("Z")])), "Number")
			((v_entity2).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity2).fields.get("m_vLocation")).fields.get("Z")]), "Number")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity2, ((v_entity2).fields.get("m_vLocation")).fields.get("X"), ((v_entity2).fields.get("m_vLocation")).fields.get("Y"), ((v_entity2).fields.get("m_vLocation")).fields.get("Z")])
	else:
		pass
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(0)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float((float(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)])) * float(v_fStretch)))
	if R.truth(R.logical_and(R.logical_and(R.call_member(v_gameplayMode, "CanSpawnMilitary", []), func(): return (R.binary("!=", R.get_value(v_colorTransform, "redOffset"), 0) or R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0))), func(): return ((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iHiddenSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iHiddenSoldierLevel"))) and R.unary("!", R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))):
		pass
		v_hiddenSoldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
		R.call_member(v_hiddenSoldier, "Init", [R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")])
		(v_hiddenSoldier).fields["m_bFlippedX"] = R.coerce((R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0) if R.truth(v_bFlip) else R.binary("!=", R.get_value(v_colorTransform, "redOffset"), 0)), "Boolean")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_hiddenSoldier, R.binary("+", R.binary("+", (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("X"))), (R.unary("-", R.static_value("RDSoldier", "SlideOutHideOffset")) if R.truth((v_hiddenSoldier).fields.get("m_bFlippedX")) else (float(((v_entity).fields.get("m_CollisionBounds")).fields.get("W")) + float(R.static_value("RDSoldier", "SlideOutHideOffset"))))), R.call_static("RDWorld", "GetPerlinX", [(float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])), R.call_static("RDWorld", "GetPerlinY", [(float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(0.1))]), (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])
	return (c).fields.get("m_SpawnInfo")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_MCClass"] = R.coerce(null, "Class")
	(c).fields["m_MC"] = R.coerce(null, "MovieClip")
	(c).fields["m_MCOverride"] = R.coerce(null, "MovieClip")
	(c).fields["m_SpawnInfo"] = R.coerce(R.construct(R.klass("RDPatternSpawnInfo"), []), "RDPatternSpawnInfo")
	(c).fields["m_Grounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Generics"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Hazards"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_CriticalHazards"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_SideHazards"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_Zombies"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_Soldiers"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_fStartPosition"] = float(NAN)
	return null
