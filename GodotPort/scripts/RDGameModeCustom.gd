extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeCustom(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeCustom"), [v_theGame])
	c.fields["m_bDoDefaultHighwaySpawning"] = false
	c.fields["m_DistanceScreen"] = R.coerce(R.construct(R.klass("MC_DistanceStatsScreen"), []), "MC_DistanceStatsScreen")
	(c).fields["m_TimeOutSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	c.fields["m_iStationarySoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iAlignSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iSpikeSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iHiddenSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iBombSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iVeryHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iFeedersLevel"] = R.coerce(0, "int")
	c.fields["m_iSpikesLevel"] = R.coerce(0, "int")
	c.fields["m_iNewMaleZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iNewFemaleZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iSoldierZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iExplodingCarLevel"] = R.coerce(0, "int")
	c.fields["m_iMineLevel"] = R.coerce(0, "int")
	c.fields["m_iFuelTruckLevel"] = R.coerce(0, "int")
	c.fields["m_iGrubLevel"] = R.coerce(0, "int")
	c.fields["m_iHelicopterLevel"] = R.coerce(0, "int")
	c.fields["m_iJetLevel"] = R.coerce(0, "int")
	(c).fields["m_ChopperSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingChopper"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNuke"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNukeWave"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	c.fields["m_bAddAutomaticHighwayPerlinNoise"] = false
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopEndingSounds", [])
	(c).fields["m_bSpawnHighwayRamp"] = true
	(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce(R.unary("-", 1), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "Reset"), [])
	c.fields["m_fLevelStartPosition"] = float(0)
	c.fields["m_fNextPatternSpawnPosition"] = float(0)
	(c).fields["m_fNextChallengeSpawnPosition"] = float(0)
	(c).fields["m_iCurrentChallengeSpawnIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengeIndex"] = R.coerce(0, "int")
	(c).fields["m_fForcedStopTimer"] = float(0)
	(c).fields["m_bDoFirstInit"] = true
	c.fields["m_fJetDelay"] = float(0)
	c.fields["m_fHelicopterDelay"] = float(0)
	c.fields["m_fLevelDifficulty"] = float(1)
	(c).fields["m_fAreaSpeedFactor"] = float(1)
	c.fields["m_fZombieSpeedFactor"] = float(1)
	c.fields["m_fZombieHPFactor"] = float(1)
	c.fields["m_fOilSlipperinessFactor"] = float(1)
	c.fields["m_fImpactSpeedLossFactor"] = float(1)
	c.fields["m_fVehicleHPFactor"] = float(1)
	c.fields["m_bExplodingZombies"] = false
	c.fields["m_bAlwaysCling"] = false
	(c).fields["m_fSpawnRate"] = float(0)
	(c).fields["m_bFUBARMode"] = false
	(c).fields["m_bNoSoldierZombie"] = false
	(c).fields["m_bAllSoldierZombie"] = false
	(c).fields["m_fEndCampaignTimer"] = float(0)
	(c).fields["m_bLavaModeInstantDeath"] = false
	R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengeAreaCounts"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengePatternCounts"), "splice"), [0])
	(c).fields["m_iChallengePlayerIndex"] = R.coerce(0, "int")
	R.call_member(c, "UpdateNextLevel", [])
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "StartGameMode"), [])
	c.fields["m_iCustomMedShields"] = R.coerce((0 if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedShields")), "int")
	c.fields["m_iCustomMedHeals"] = R.coerce((0 if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedHeals")), "int")
	(c).fields["m_iCampaignAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_bPlayAreaDialog"] = true
	(c).fields["m_fPlayAreaDialogPos"] = float(0)
	(c).fields["m_fDialogPosPatternPos"] = float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))
	(c).fields["m_fDialogTimer"] = float(0)
	(c).fields["m_iLevelCounter"] = R.coerce(0, "int")
	(c).fields["m_fTime"] = float(0)
	(c).fields["m_bFirstLoad"] = true
	(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
	(c).fields["m_iTotalZombiesKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansSaved"] = R.coerce(0, "int")
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_iChallengeIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_areaPattern: Variant = null
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_music: Variant = null
	v_iChallengeIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_areaPattern = R.coerce(null, "RDPatternInfo")
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "BeginGameMode"), [])
	if R.truth((c).fields.get("m_bFirstLoad")):
		pass
		(c).fields["m_bValidData"] = true
		(c).fields["m_UniquePattern"] = R.coerce((R.construct(R.klass("RDLevelPatternCustomData"), [(c.fields.get("m_Game")).fields.get("m_CustomPatternData")]) if R.truth((c.fields.get("m_Game")).fields.get("m_CustomPatternData")) else null), "RDLevelPatternCustomData")
		if R.truth((c).fields.get("m_UniquePattern")):
			pass
			((c).fields.get("m_UniquePattern")).fields["m_bAllowFlip"] = false
		(c).fields["m_AreaPatterns"] = R.coerce(null, "RandomHat")
		(c).fields["m_CampaignInfo"] = R.coerce(null, "RDCampaignInfo")
		if R.truth((c.fields.get("m_Game")).fields.get("m_CustomAreaData")):
			pass
			R.call_member(c, "LoadCustomAreaPatterns", [(c.fields.get("m_Game")).fields.get("m_CustomAreaData")])
		else:
			pass
			if R.truth((c.fields.get("m_Game")).fields.get("m_CustomCampaignData")):
				pass
				R.call_member(c, "LoadCustomCampaignPatterns", [(c.fields.get("m_Game")).fields.get("m_CustomCampaignData")])
		if R.truth(c.fields.get("m_HillBG")):
			pass
			(c.fields.get("m_HillBG")).fields["m_bUseFog"] = true
		(c.fields.get("m_BG")).fields["m_bUseFog"] = true
		(c).fields["m_bFirstLoad"] = false
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			R.call_member(c, "UpdateChallengePreSpawn", [])
			v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengePlayerIndex"), 20), "int")
			v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
			v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
		else:
			pass
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iCampaignAreaIndex")), "RDAreaInfo")
			R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", (v_areaInfo).fields.get("m_szAreaName")])
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
			R.call_member(c, "UpdateNextLevel", [])
		R.call_member(c.fields.get("m_BG"), "SetHidden", [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
	v_music = R.coerce(R.call_member(c, "GetMusic", []), "DTSound")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [v_music, 0])
	R.set_value(R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "InvalidFileVersionMessage"), "visible", R.unary("!", R.call_member((c.fields.get("m_Game")).fields.get("m_CurrentGameMode"), "UsesValidFileVersion", [])), "=")
	return null

static func f_LoadCustomAreaPatterns(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternData: Variant = null
	var v_iDataBytes: Variant = 0
	var v_newPattern: Variant = null
	var v_iIconBytes: Variant = 0
	var v_iconData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternData = R.coerce(null, "ByteArray")
	v_iDataBytes = R.coerce(0, "int")
	v_newPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_iIconBytes = R.coerce(0, "int")
	v_iconData = R.coerce(null, "ByteArray")
	(c).fields["m_AreaPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.set_value(v_savedData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			R.invoke(R.get_value(v_savedData, "readInt"), [])
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			v_patternData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			R.invoke(R.get_value(v_savedData, "readBytes"), [v_patternData, 0, v_iDataBytes])
			v_newPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [v_patternData]), "RDLevelPatternCustomData")
			(v_newPattern).fields["m_bAllowFlip"] = false
			R.call_member((c).fields.get("m_AreaPatterns"), "AddValue", [v_newPattern])
			v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_iconData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value(v_savedData, "readBytes"), [v_iconData, 0, v_iIconBytes])
			v_i = R.signed32(v_i + 1)
	return null

static func f_LoadCustomCampaignPatterns(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_iNbDialogs: Variant = 0
	var v_t: Variant = 0
	var v_iNbGroups: Variant = 0
	var v_g: Variant = 0
	var v_groupsThatCanBeFirst: Variant = null
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_iNbAreas: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_i = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_iNbDialogs = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_iNbGroups = R.coerce(0, "int")
	v_g = R.coerce(0, "int")
	v_groupsThatCanBeFirst = R.coerce(null, "Array")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_iNbAreas = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	R.set_value(v_savedData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(c).fields["m_CampaignInfo"] = R.coerce(R.construct(R.klass("RDCampaignInfo"), []), "RDCampaignInfo")
		((c).fields.get("m_CampaignInfo")).fields["m_iType"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iGoalTarget"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_bTiresBlown"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bAirStrikes"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoWeapons"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoAmmoPoints"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoReplenish"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteAmmo"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bInvincibleHellfire"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_fBounceFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_bMountedMG"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bMountedRocketLauncher"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteMountedWeapon"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoDriverSwitch"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bArcadeAmmoPickup"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoSteering"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoBraking"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoSwerving"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_fPlayerVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fPlayerBodyHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fZombieSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fZombieHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fOilSlipperinessFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fImpactSpeedLossFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_bExplodingZombies"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bAlwaysCling"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoBackgroundCity"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoChopperSupport"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_fStartingTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fZombieShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fZombieHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fMutantKilledTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fFeedersHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fCivilianShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fCivilianHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fSoldierShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fSoldierHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fSoldierClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fHellfireDefeatedTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_iDifficultyLevelLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_fBasePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditivePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_iSpikeSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iBombSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iOilLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iSpikeLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iMineLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iExplodingCarLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iGrubLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iZombieLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_iBaseSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
		((c).fields.get("m_CampaignInfo")).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		((c).fields.get("m_CampaignInfo")).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
		v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_t = R.coerce(0, "int")
		while R.truth((float(v_t) < float(v_iNbDialogs))):
			pass
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
			v_t = R.signed32(v_t + 1)
		((c).fields.get("m_CampaignInfo")).fields["m_Groups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
		v_iNbGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_g = R.coerce(0, "int")
		while R.truth((float(v_g) < float(v_iNbGroups))):
			pass
			v_group = R.coerce(R.construct(R.klass("RDAreaGroup"), []), "RDAreaGroup")
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "push"), [v_group])
			(v_group).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
			(v_group).fields["m_iMinLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			(v_group).fields["m_iMaxLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			(v_group).fields["m_bCanBeFirst"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			(v_group).fields["m_bRandomized"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			v_iNbLinkedGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
				pass
				R.invoke(R.get_value((v_group).fields.get("m_LinkedGroups"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				v_i = R.signed32(v_i + 1)
			v_iNbAreas = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbAreas))):
				pass
				v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
				(v_areaInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_szAreaName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iAreaLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_bAllowFlip"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_t = R.coerce(0, "int")
				while R.truth((float(v_t) < float(v_iNbDialogs))):
					pass
					R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
					R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
					v_t = R.signed32(v_t + 1)
				(v_areaInfo).fields["m_bOverrideSpawning"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_fJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_fMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bFullSpeedMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bLavaMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bLavaInstantKill"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fForcedStopDuration"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bOverrideDifficulty"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fPatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_fSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bSpikeSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bBombSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bOil"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bSpike"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bMine"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bExplodingCar"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bGrub"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bBaseSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iDataSize = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
				v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_j = R.coerce(0, "int")
				while R.truth((float(v_j) < float(v_iNbPatterns))):
					pass
					v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
					(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
					v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
					R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
					R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
					(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
					R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
					R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
					v_j = R.signed32(v_j + 1)
				R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
				R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
				v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Icon"), 0, v_iIconBytes])
				v_i = R.signed32(v_i + 1)
			if R.truth((v_group).fields.get("m_bRandomized")):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float((R.num(R.get_value(((v_group).fields.get("m_AreaIndices")).fields.get("m_Values"), "length")) * float(20))))):
					pass
					R.invoke(R.get_value((v_group).fields.get("m_RandomAreaIndices"), "push"), [R.binary("as", R.call_member((v_group).fields.get("m_AreaIndices"), "GetRandomValue", []), R.klass("int"))])
					v_i = R.signed32(v_i + 1)
			v_g = R.signed32(v_g + 1)
		v_groupsThatCanBeFirst = R.coerce(R.construct(R.klass("Array"), []), "Array")
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
			pass
			v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_i), "RDAreaGroup")
			if R.truth((v_group).fields.get("m_bCanBeFirst")):
				pass
				R.invoke(R.get_value(v_groupsThatCanBeFirst, "push"), [v_i])
			v_i = R.signed32(v_i + 1)
		if R.truth(R.binary(">", R.get_value(v_groupsThatCanBeFirst, "length"), 0)):
			pass
			(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value(v_groupsThatCanBeFirst, R.call_static("Maths", "RandomInt", [R.get_value(v_groupsThatCanBeFirst, "length")])), "int")
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
		(v_group).fields["m_iLength"] = R.coerce(R.binary("+", (v_group).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((float((v_group).fields.get("m_iMaxLength")) - float((v_group).fields.get("m_iMinLength")))) + float(1))])), "int")
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = R.coerce((4 if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown")) else 0), "Number")
		(c.fields.get("m_Player")).fields["m_iNbBlownTires"] = R.coerce((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires"), "int")
		R.call_member(c.fields.get("m_Player"), "UpdateTireValues", [])
		R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "visible", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreWeaponsEnabled", []), "=")
		if R.truth(R.call_member(c, "IsMountedMGEnabled", [])):
			pass
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = true
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
			R.call_member((c.fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"), "ReplenishAmmo", [false, 1])
		if R.truth(R.call_member(c, "IsMountedRocketLauncherEnabled", [])):
			pass
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = true
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
			R.call_member((c.fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
		R.call_member(c.fields.get("m_Player"), "InitWeaponsArray", [])
		c.fields["m_fZombieSpeedFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor"))
		c.fields["m_fZombieHPFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor"))
		c.fields["m_fOilSlipperinessFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor"))
		c.fields["m_fImpactSpeedLossFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor"))
		c.fields["m_fVehicleHPFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor"))
		c.fields["m_bExplodingZombies"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies")
		c.fields["m_bAlwaysCling"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling")
		(c).fields["m_fTime"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime"))
		(c.fields.get("m_Camera")).fields["m_fFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) else R.static_value("RDCamera", "NoFogDistance")), "Number")
		(c.fields.get("m_Camera")).fields["m_fFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) else R.static_value("RDCamera", "NoFogRange")), "Number")
		c.fields["m_fVehicleDamageMultiplier"] = float(R.binary("/", 1, ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor")))
		c.fields["m_fBodyDamageMultiplier"] = float(R.binary("/", 1, ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor")))
		c.fields["m_bCanHaveChopperSupport"] = R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"))
	(c).fields["m_bValidData"] = (float(v_iFileVersion) <= float(R.static_value("RDGame", "CurrentFileVersion")))
	return null

static func f_UsesValidFileVersion(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bValidData")
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	R.call_member(c, "StopEndingSounds", [])
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "visible", true, "=")
	if R.truth((R.unary("!", (c).fields.get("m_bHighwayTransition")) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")))):
		pass
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iMedShields"] = R.coerce(c.fields.get("m_iCustomMedShields"), "int")
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iMedHeals"] = R.coerce(c.fields.get("m_iCustomMedHeals"), "int")
	(c).fields["m_bHighwayTransition"] = false
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowDistance")):
		pass
		R.call_member(c, "UpdateDistanceScreen", [v_fDeltaTime])
		return null
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	if R.truth((c).fields.get("m_bValidData")):
		pass
		R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
		R.call_member(c, "UpdateHighwaySpawning", [])
		R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
		if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
			pass
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(v_fDeltaTime))), float(0)))
			if R.truth((float((c).fields.get("m_fTime")) == float(0))):
				pass
				R.call_member(c.fields.get("m_Player"), "Explode", [])
			else:
				pass
				if R.truth((float((c).fields.get("m_fTime")) < float(R.static_value("RDGameModeCustom", "AlertTime")))):
					pass
					if R.truth(R.unary("!", R.call_member((c).fields.get("m_TimeOutSound"), "IsPlaying", []))):
						pass
						R.call_member((c).fields.get("m_TimeOutSound"), "Play", [true])
				else:
					pass
					if R.truth(R.call_member((c).fields.get("m_TimeOutSound"), "IsPlaying", [])):
						pass
						R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTime", [(c).fields.get("m_fTime")])
	return null

static func f_UpdateChallengePreSpawn(c: Variant, a: Array) -> Variant:
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_areaInfo: Variant = null
	var v_group: Variant = null
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iRandomLinkedGroup: Variant = 0
	var v_newGroup: Variant = null
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iAreaIndex = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iRandomLinkedGroup = R.coerce(0, "int")
	v_newGroup = R.coerce(null, "RDAreaGroup")
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float((float(R.static_value("RDGameModeGameplay", "PatternViewDistance")) * float(3))))) >= float((c).fields.get("m_fNextChallengeSpawnPosition")))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), R.klass("RDAreaGroup")), "RDAreaGroup")
		v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", (c).fields.get("m_iCurrentAreaIndex"), R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", (c).fields.get("m_iCurrentAreaIndex"), R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
		v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
		v_iPatternIndex = R.coerce(R.binary("as", R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int")), "int")
		R.set_value((c).fields.get("m_ChallengeGroups"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iCurrentGroupIndex"), "=")
		R.set_value((c).fields.get("m_ChallengeAreas"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iCurrentAreaIndex"), "=")
		R.set_value((c).fields.get("m_ChallengePatterns"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), v_iPatternIndex, "=")
		R.set_value((c).fields.get("m_ChallengePatternCounts"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iChallengePatternCount"), "=")
		R.set_value((c).fields.get("m_ChallengeAreaCounts"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iChallengeAreaCount"), "=")
		(c).fields["m_iCurrentChallengeSpawnIndex"] = R.coerce(R.binary("%", (float((c).fields.get("m_iCurrentChallengeSpawnIndex")) + float(1)), 20), "int")
		(c).fields["m_fNextChallengeSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextChallengeSpawnPosition"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
		R.set_value(c, "m_iChallengePatternCount", 1, "+=")
		R.set_value(c, "m_iChallengeAreaCount", 1, "+=")
		if R.truth((float((c).fields.get("m_iChallengeAreaCount")) == float((v_group).fields.get("m_iLength")))):
			pass
			v_iRandomLinkedGroup = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((v_group).fields.get("m_LinkedGroups"), "length")]), "int")
			(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), v_iRandomLinkedGroup), "int")
			v_newGroup = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
			(v_newGroup).fields["m_iLength"] = R.coerce(R.binary("+", (v_newGroup).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((v_newGroup).fields.get("m_iMaxLength")) - float((v_newGroup).fields.get("m_iMinLength")))])), "int")
			(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
			(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
			(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iChallengePatternCount")) == float((v_areaInfo).fields.get("m_iAreaLength")))):
				pass
				R.set_value(c, "m_iCurrentAreaIndex", 1, "+=")
				(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	return null

static func f_UpdateRandomCity(c: Variant, a: Array) -> Variant:
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_fPatternSpace: Variant = NAN
	var v_waterJug: Variant = null
	var v_areaInfo: Variant = null
	var v_fSpawnRatio: Variant = NAN
	var v_fCurrentPatternSpawnPosition: Variant = NAN
	var v_group: Variant = null
	var v_iPattern: Variant = 0
	var v_patternInfo: Variant = null
	var v_newLevelPattern: Variant = null
	var v_iNextCampaignAreaIndex: Variant = 0
	var v_bHasEndingEntity: Variant = false
	var v_bOnHighway: Variant = false
	var v_bNextOnHighway: Variant = false
	var v_bIsHighwayTransition: Variant = false
	var v_nextAreaInfo: Variant = null
	var v_nextAreaPattern: Variant = null
	var v_transitionEntity: Variant = null
	var v_ramp: Variant = null
	var v_fPosZ: Variant = NAN
	var v_entity: Variant = null
	var v_entity2: Variant = null
	var v_fPosX: Variant = NAN
	var v_iChallengeIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_iActualAreaIndex: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iNextChallengeIndex: Variant = 0
	var v_nextPatternInfo: Variant = null
	var v_areaPattern: Variant = null
	var v_fLevelLength: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = R.coerce(null, "RDObstacleWaterJug")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_fSpawnRatio = float(NAN)
	v_fCurrentPatternSpawnPosition = float(NAN)
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPattern = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_newLevelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_iNextCampaignAreaIndex = R.coerce(0, "int")
	v_bHasEndingEntity = false
	v_bOnHighway = false
	v_bNextOnHighway = false
	v_bIsHighwayTransition = false
	v_nextAreaInfo = R.coerce(null, "RDAreaInfo")
	v_nextAreaPattern = R.coerce(null, "RDPatternInfo")
	v_transitionEntity = R.coerce(null, "RDEntity")
	v_ramp = R.coerce(null, "RDHighwayRamp")
	v_fPosZ = float(NAN)
	v_entity = R.coerce(null, "RDRoadSign")
	v_entity2 = R.coerce(null, "RDRoadSignOffRoad")
	v_fPosX = float(NAN)
	v_iChallengeIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_iActualAreaIndex = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iNextChallengeIndex = R.coerce(0, "int")
	v_nextPatternInfo = R.coerce(null, "RDPatternInfo")
	v_areaPattern = R.coerce(null, "RDPatternInfo")
	v_fLevelLength = float(NAN)
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))))):
		pass
		R.call_member(c, "UpdateChallengePreSpawn", [])
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextPatternSpawnPosition")))):
		pass
		if R.truth((c).fields.get("m_UniquePattern")):
			pass
			v_fSpawnRatio = float(1)
			v_levelPattern = R.coerce((c).fields.get("m_UniquePattern"), "RDLevelPatternCustomData")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, 0, c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
			R.call_member(c, "UpdateBGBuildingDepthPos", [])
			c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
		else:
			pass
			if R.truth((c).fields.get("m_AreaPatterns")):
				pass
				v_levelPatterns = R.coerce((c).fields.get("m_AreaPatterns"), "RandomHat")
				v_fSpawnRatio = float(1)
				v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomData")), "RDLevelPatternCustomData")
				v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, 0, c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
				R.call_member(c, "UpdateBGBuildingDepthPos", [])
				c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
			else:
				pass
				if R.truth((c).fields.get("m_CampaignInfo")):
					pass
					v_fCurrentPatternSpawnPosition = float(c.fields.get("m_fNextPatternSpawnPosition"))
					R.set_value(c, "m_iLevelCounter", 1, "+=")
					if R.truth((float((c).fields.get("m_iLevelCounter")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength")))):
						pass
						(c).fields["m_iLevelCounter"] = R.coerce(0, "int")
						R.assign(c, "m_iLevel", "RDGameModeCustom", 1, "+=")
					if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
						pass
						v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
						if R.truth(R.binary("<", (c).fields.get("m_iCampaignAreaIndex"), R.get_value((v_group).fields.get("m_Areas"), "length"))):
							pass
							(c).fields["m_SpawnAreaInfo"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iCampaignAreaIndex")), "RDAreaInfo")
							v_iPattern = R.coerce(R.binary("as", R.call_member(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int")), "int")
							v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_Patterns"), v_iPattern), "RDPatternInfo")
							v_newLevelPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [(v_patternInfo).fields.get("m_Data")]), "RDLevelPatternCustomData")
							(v_newLevelPattern).fields["m_bAllowFlip"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllowFlip")
							v_levelPattern = R.coerce(v_newLevelPattern, "RDLevelPatternCustomData")
							R.call_member(c, "UpdateCampaignParameters", [])
							(v_levelPattern).fields["m_bLavaMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bLavaMode")
							v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), (c).fields.get("m_fPatternSpawnRatio"), 1]), "Number")
							R.call_member(c, "UpdateBGBuildingDepthPos", [])
							if R.truth((c).fields.get("m_bSpawnHighwayRamp")):
								pass
								v_iNextCampaignAreaIndex = R.coerce((R.coerce((float((c).fields.get("m_iCampaignAreaIndex")) + float(1)), "int") if R.truth((float((float((c).fields.get("m_iCampaignPatternIndex")) + float(1))) >= float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iAreaLength")))) else (c).fields.get("m_iCampaignAreaIndex")), "int")
								if R.truth((float(v_iNextCampaignAreaIndex) != float((c).fields.get("m_iCampaignAreaIndex")))):
									pass
									v_bHasEndingEntity = false
									v_bOnHighway = (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									v_bNextOnHighway = v_bOnHighway
									if R.truth(R.binary("<", v_iNextCampaignAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length"))):
										pass
										v_nextAreaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iNextCampaignAreaIndex), "RDAreaInfo")
										v_nextAreaPattern = R.coerce(R.get_value((v_nextAreaInfo).fields.get("m_Patterns"), 0), "RDPatternInfo")
										v_bNextOnHighway = (float((v_nextAreaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									else:
										pass
										v_bHasEndingEntity = true
									v_bIsHighwayTransition = R.binary("!=", v_bOnHighway, v_bNextOnHighway)
									if R.truth((v_bIsHighwayTransition or v_bHasEndingEntity)):
										pass
										v_fPosZ = float(maxf(float(c.fields.get("m_fNextPatternSpawnPosition")), float((float(2) * float(R.static_value("RDRoad", "RenderStepSize"))))))
										if R.truth(v_bHasEndingEntity):
											pass
											if R.truth((float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
												pass
												v_transitionEntity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopper")]), R.klass("RDEndChopper")), "RDEntity")
										else:
											pass
											if R.truth(R.unary("!", v_bOnHighway)):
												pass
												v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
												R.call_member(v_ramp, "Init", [R.klass("MC_HighwayRamp"), R.unary("!", v_bHasEndingEntity)])
												v_transitionEntity = R.coerce(v_ramp, "RDEntity")
											else:
												pass
												v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
												R.call_member(v_ramp, "Init", [R.klass("MovieClip"), R.unary("!", v_bHasEndingEntity)])
												v_transitionEntity = R.coerce(v_ramp, "RDEntity")
												v_entity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), R.klass("RDRoadSign")), "RDRoadSign")
												R.call_member(v_entity, "Init", [R.klass("MC_highwaysignrampexit")])
												v_entity2 = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
												R.call_member(v_entity2, "Init", [R.klass("MC_highwaysignoffroad")])
												(v_entity).fields["m_OffRoadPart"] = R.coerce(v_entity2, "RDRoadSignOffRoad")
												v_fPosX = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(1)))
												R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
												R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity2, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										if R.truth(v_transitionEntity):
											pass
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_transitionEntity, R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce((c).fields.get("m_iCampaignAreaIndex"), "int")
										(c).fields["m_fHighwayRampPos"] = float(v_fPosZ)
										(c).fields["m_bSpawnHighwayRamp"] = false
							if R.truth((R.binary("==", (c).fields.get("m_iHighwayRampCampaignAreaIndex"), R.unary("-", 1)) or (float((c).fields.get("m_iCampaignAreaIndex")) < float((c).fields.get("m_iHighwayRampCampaignAreaIndex"))))):
								pass
								R.set_value(c, "m_iCampaignPatternIndex", 1, "+=")
								if R.truth((float((c).fields.get("m_iCampaignPatternIndex")) == float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iAreaLength")))):
									pass
									R.set_value(c, "m_iCampaignAreaIndex", 1, "+=")
									(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
							c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
						else:
							pass
							c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), 9999999), "Number")
					else:
						pass
						if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
							pass
							if R.truth((R.binary("==", (c).fields.get("m_iHighwayRampCampaignAreaIndex"), R.unary("-", 1)) or (float((c).fields.get("m_iChallengeIndex")) < float((c).fields.get("m_iHighwayRampCampaignAreaIndex"))))):
								pass
								v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengeIndex"), 20), "int")
								v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
								v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
								v_iActualAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
								v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
								(c).fields["m_SpawnAreaInfo"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
								v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iChallengeIndex), "int"), "int")
								v_patternInfo = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_Patterns"), v_iPatternIndex), R.klass("RDPatternInfo")), "RDPatternInfo")
								v_newLevelPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [(v_patternInfo).fields.get("m_Data")]), "RDLevelPatternCustomData")
								(v_newLevelPattern).fields["m_bAllowFlip"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllowFlip")
								v_levelPattern = R.coerce(v_newLevelPattern, "RDLevelPatternCustomData")
								R.call_member(c, "UpdateCampaignParameters", [])
								(v_levelPattern).fields["m_bLavaMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bLavaMode")
								v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), (c).fields.get("m_fPatternSpawnRatio"), 1]), "Number")
								R.call_member(c, "UpdateBGBuildingDepthPos", [])
								if R.truth((c).fields.get("m_bSpawnHighwayRamp")):
									pass
									v_iNextChallengeIndex = R.coerce(R.binary("%", (float((c).fields.get("m_iChallengeIndex")) + float(1)), 20), "int")
									v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iNextChallengeIndex), "int"), "int")
									v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
									v_iActualAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iNextChallengeIndex), "int"), "int")
									v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
									v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
									v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iNextChallengeIndex), "int"), "int")
									v_nextPatternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), R.klass("RDPatternInfo")), "RDPatternInfo")
									v_bOnHighway = (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									v_bNextOnHighway = (float((v_nextPatternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									if R.truth(R.binary("!=", v_bOnHighway, v_bNextOnHighway)):
										pass
										v_fPosZ = float(maxf(float(c.fields.get("m_fNextPatternSpawnPosition")), float((float(2) * float(R.static_value("RDRoad", "RenderStepSize"))))))
										if R.truth(v_bNextOnHighway):
											pass
											v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
											R.call_member(v_ramp, "Init", [R.klass("MC_HighwayRamp")])
										else:
											pass
											v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
											R.call_member(v_ramp, "Init", [R.klass("MovieClip")])
											v_entity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), R.klass("RDRoadSign")), "RDRoadSign")
											R.call_member(v_entity, "Init", [R.klass("MC_highwaysignrampexit")])
											v_entity2 = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
											R.call_member(v_entity2, "Init", [R.klass("MC_highwaysignoffroad")])
											(v_entity).fields["m_OffRoadPart"] = R.coerce(v_entity2, "RDRoadSignOffRoad")
											v_fPosX = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(1)))
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity2, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										R.call_member(c.fields.get("m_Game"), "AddEntity", [v_ramp, R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce((c).fields.get("m_iChallengeIndex"), "int")
										(c).fields["m_iHighwayRampGroupIndex"] = R.coerce(v_iGroupIndex, "int")
										(c).fields["m_iHighwayRampAreaIndex"] = R.coerce(v_iActualAreaIndex, "int")
										(c).fields["m_iHighwayRampChallengePatternCount"] = R.coerce(R.get_value((c).fields.get("m_ChallengePatternCounts"), v_iNextChallengeIndex), "int")
										(c).fields["m_iHighwayRampChallengeAreaCount"] = R.coerce(R.get_value((c).fields.get("m_ChallengeAreaCounts"), v_iNextChallengeIndex), "int")
										(c).fields["m_bSpawnHighwayRamp"] = false
								c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
								R.set_value(c, "m_iChallengeIndex", 1, "+=")
							else:
								pass
								c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), 9999999), "Number")
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
			pass
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
			if R.truth((((c).fields.get("m_bPlayAreaDialog") and (float((c).fields.get("m_iDialogPosAreaIndex")) < float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))) and (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c).fields.get("m_fPlayAreaDialogPos")) + float(((c).fields.get("m_ActiveArea")).fields.get("m_fDialogOffset"))))))):
				pass
				R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), ((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0])
				(c).fields["m_bPlayAreaDialog"] = false
			if R.truth(((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding")) and (float((c).fields.get("m_iDialogPosAreaIndex")) == float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))) and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c).fields.get("m_fHighwayRampPos")) - float(R.static_value("RDRoad", "RenderStepSize"))))))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowEnding", [((c).fields.get("m_ActiveArea")).fields.get("m_iType")])
				R.call_member(c.fields.get("m_Player"), "StartEnding", [((c).fields.get("m_ActiveArea")).fields.get("m_iType")])
				R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), ((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0])
				if R.truth((float(((c).fields.get("m_ActiveArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
					pass
					R.call_member(c.fields.get("m_Game"), "DoFlash", [1, 0.25])
					((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
				if R.truth((R.binary("==", R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), 0), R.unary("-", 1)) and R.binary("==", R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0), ""))):
					pass
					(c).fields["m_fEndCampaignTimer"] = float(3)
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [""])
					R.call_member(c, "OnAreaDialogEnded", [])
			if R.truth((float((c).fields.get("m_fEndCampaignTimer")) > float(0))):
				pass
				(c).fields["m_fEndCampaignTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fEndCampaignTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fEndCampaignTimer")) <= float(0))):
					pass
					R.call_member(c, "EndCampaign", [])
			if R.truth((float((c).fields.get("m_fForcedStopTimer")) > float(0))):
				pass
				(c).fields["m_fForcedStopTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fForcedStopTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fForcedStopTimer")) <= float(0))):
					pass
					(c.fields.get("m_Player")).fields["m_bForceBrake"] = false
			while R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((c).fields.get("m_fDialogPosPatternPos")))):
				pass
				R.set_value(c, "m_iDialogPosPatternIndex", 1, "+=")
				if R.truth((float((c).fields.get("m_iDialogPosPatternIndex")) >= float(((c).fields.get("m_ActiveArea")).fields.get("m_iAreaLength")))):
					pass
					(c).fields["m_bPlayAreaDialog"] = true
					(c).fields["m_fPlayAreaDialogPos"] = float((c).fields.get("m_fDialogPosPatternPos"))
					(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
					v_fLevelLength = float((float((float((v_areaInfo).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))))
					c.fields["m_fLevelStartPosition"] = R.coerce(R.binary("+", c.fields.get("m_fLevelStartPosition"), v_fLevelLength), "Number")
					R.set_value(c, "m_iDialogPosAreaIndex", 1, "+=")
					R.call_member(c, "UpdateNextLevel", [])
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
					if R.truth((float((c).fields.get("m_iDialogPosAreaIndex")) < float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))):
						pass
						R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", (v_areaInfo).fields.get("m_szAreaName")])
					if R.truth((float((v_areaInfo).fields.get("m_fForcedStopDuration")) > float(0))):
						pass
						(c).fields["m_fForcedStopTimer"] = float((v_areaInfo).fields.get("m_fForcedStopDuration"))
						(c.fields.get("m_Player")).fields["m_bForceBrake"] = true
					R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [(v_areaInfo).fields.get("m_bFullSpeedMode")])
					(c).fields["m_fAreaSpeedFactor"] = float((v_areaInfo).fields.get("m_fPlayerSpeedFactor"))
					c.fields["m_fTargetFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and (v_areaInfo).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogDistance")), "Number")
					c.fields["m_fTargetFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and (v_areaInfo).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogRange")), "Number")
					(c).fields["m_bLavaModeInstantDeath"] = (v_areaInfo).fields.get("m_bLavaInstantKill")
				(c).fields["m_fDialogPosPatternPos"] = R.coerce(R.binary("+", (c).fields.get("m_fDialogPosPatternPos"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
				pass
				v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengePlayerIndex"), 20), "int")
				v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
				v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
				v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
				v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
				(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
				v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
				c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
				R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [((c).fields.get("m_ActiveArea")).fields.get("m_bFullSpeedMode")])
				(c).fields["m_fAreaSpeedFactor"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fPlayerSpeedFactor"))
				(c).fields["m_bLavaModeInstantDeath"] = ((c).fields.get("m_ActiveArea")).fields.get("m_bLavaInstantKill")
				while R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((c).fields.get("m_fDialogPosPatternPos")))):
					pass
					R.set_value(c, "m_iChallengePlayerIndex", 1, "+=")
					(c).fields["m_fDialogPosPatternPos"] = R.coerce(R.binary("+", (c).fields.get("m_fDialogPosPatternPos"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
				if R.truth(((c).fields.get("m_bPlayAreaDialog") and (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_fDialogOffset"))))):
					pass
					R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), ((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), 0])
					(c).fields["m_bPlayAreaDialog"] = false
				if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
					pass
					(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [""])
						R.call_member(c, "OnAreaDialogEnded", [])
		if R.truth((c).fields.get("m_bDoFirstInit")):
			pass
			c.fields["m_fHelicopterDelay"] = R.coerce(R.call_member(c, "GetHelicopterDelay", []), "Number")
			c.fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
			c.fields["m_fMutantDelay"] = R.coerce(R.call_member(c, "GetMutantDelay", []), "Number")
			(c).fields["m_bDoFirstInit"] = false
			if R.truth((float(((c).fields.get("m_ActiveArea")).fields.get("m_fForcedStopDuration")) > float(0))):
				pass
				(c).fields["m_fForcedStopTimer"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fForcedStopDuration"))
				(c.fields.get("m_Player")).fields["m_bForceBrake"] = true
			R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [((c).fields.get("m_ActiveArea")).fields.get("m_bFullSpeedMode")])
			(c).fields["m_fAreaSpeedFactor"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fPlayerSpeedFactor"))
			(c.fields.get("m_Camera")).fields["m_fFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and ((c).fields.get("m_ActiveArea")).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogDistance")), "Number")
			(c.fields.get("m_Camera")).fields["m_fFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and ((c).fields.get("m_ActiveArea")).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogRange")), "Number")
			c.fields["m_fTargetFogDistance"] = float((c.fields.get("m_Camera")).fields.get("m_fFogDistance"))
			c.fields["m_fTargetFogRange"] = float((c.fields.get("m_Camera")).fields.get("m_fFogRange"))
			(c).fields["m_bLavaModeInstantDeath"] = ((c).fields.get("m_ActiveArea")).fields.get("m_bLavaInstantKill")
	return null

static func f_PlayAreaDialog(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = null
	var v_dialogClass: Variant = null
	var v_szDialog: Variant = null
	var v_cues: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_texts: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	var v_iIndex: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_voice = R.coerce(null, "DTSpacialSound")
	(c).fields["m_AreaDialogCues"] = R.coerce(v_cues, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(v_texts, "Array")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(v_iIndex, "int")
	v_dialogClass = R.coerce(R.call_static("RDCampaignDialogs", "GetSound", [R.get_value((c).fields.get("m_AreaDialogCues"), (c).fields.get("m_iAreaDialogIndex"))]), "Class")
	if R.truth(v_dialogClass):
		pass
		v_voice = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [v_dialogClass, (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), (c.fields.get("m_Game")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Center"), v_voice, R.static_value("RDPlayer", "VoicePriority_Crucial")])
	v_szDialog = R.coerce(R.get_value((c).fields.get("m_AreaDialogTexts"), (c).fields.get("m_iAreaDialogIndex")), "String")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [v_szDialog])
	(c).fields["m_fDialogTimer"] = R.coerce((3 if R.truth(R.binary("==", v_szDialog, "")) else maxf(float((R.num(R.get_value(v_szDialog, "length")) * float(R.static_value("RDCampaignDialogs", "DialogTimePerCharacter")))), float(R.static_value("RDCampaignDialogs", "MinDialogTime")))), "Number")
	return null

static func f_OnAreaDialogEnded(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
		if R.truth((float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1))))):
			pass
			R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
		else:
			pass
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			if R.truth((float((v_areaInfo).fields.get("m_iType")) != float(R.static_value("RDAreaInfo", "Type_Normal")))):
				pass
				R.call_member(c, "EndCampaign", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1))))):
			pass
			R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
	return null

static func f_EndCampaign(c: Variant, a: Array) -> Variant:
	c.fields["m_bShowDistance"] = false
	c.fields["m_bShowStats"] = true
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnPlayerFailed"), [v_evt])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTimeBonus", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTime", [])
	if R.truth((R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))))):
		pass
		c.fields["m_bShowDistance"] = true
		c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	return null

static func f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) < float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
		pass
		c.fields["m_fDistanceScreenTimer"] = R.coerce(R.binary("+", c.fields.get("m_fDistanceScreenTimer"), v_fDeltaTime), "Number")
		if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) >= float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
			pass
			R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [c.fields.get("m_DistanceScreen")])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", (((R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) and R.binary("!=", (c.fields.get("m_Game")).fields.get("m_LoadedFile"), null)) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bLoadedFileOwned"))) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bLoadedFileRated"))), "=")
			if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0, R.static_value("RDGameModeGameplay", "SoundFadeDuration")])
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
				pass
				R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Distance Reached", "=")
				R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100), " KM"), "=")
			else:
				pass
				if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
					pass
					R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Zombies Killed", "=")
					R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalZombiesKilled"), "=")
				else:
					pass
					if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
						pass
						R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Civilians Killed", "=")
						R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalCiviliansKilled"), "=")
					else:
						pass
						if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
							pass
							R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Civilians Saved", "=")
							R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalCiviliansSaved"), "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), "Value"), "text", "Challenge Target", "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget"), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
			R.call_member(c.fields.get("m_DistanceScreen"), "addChild", [(c.fields.get("m_Game")).fields.get("m_Menu")])
			R.call_member(c.fields.get("m_Game"), "SlideInterface", [R.static_value("RDGame", "MenuState_All"), false, true])
			R.call_member(c.fields.get("m_Game"), "GoToMenuState", [R.static_value("RDGame", "MenuState_ContentPanel")])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "x", 900, "=")
			R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), 0.5, {"x": 600, "delay": 0, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "x", 900, "=")
			R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("Points"), 0.5, {"x": 600, "delay": 0.5, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), "x", 900, "=")
			R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), 0.5, {"x": 600, "delay": 1, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "x", 900, "=")
			R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), 0.5, {"x": 600, "delay": 1.5, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("Message"), "x", 200, "=")
			R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("Message"), 0.5, {"x": 0, "delay": 2.5, "onComplete": R.get_value(c, "OnDistanceScreenReady"), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.call_member(c.fields.get("m_Game"), "PlayInterfaceSound", [])
	return null

static func f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null

static func f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	return R.binary("==", (c).fields.get("m_UniquePattern"), null)
	return null

static func f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "PlayNukeSound")):
		pass
		R.call_member((c).fields.get("m_NukeSound"), "Play", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "PlayNukeWaveSound")):
			pass
			R.call_member((c).fields.get("m_NukeWaveSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "PlayChopperSound")):
				pass
				R.call_member((c).fields.get("m_ChopperSound"), "Play", [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "PlayEngineSound")):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Play", [])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "StopEngineSound")):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PlayPassBySound")):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Play", [])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "PlayTireSound")):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Play", [])
	return null

static func f_StopEndingSounds(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_NukeSound"), "Stop", [])
	R.call_member((c).fields.get("m_NukeWaveSound"), "Stop", [])
	R.call_member((c).fields.get("m_ChopperSound"), "Stop", [])
	return null

static func f_IsOnHighway(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
	return (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
	return null

static func f_OnRampReached(c: Variant, a: Array) -> Variant:
	c.fields["m_fPlayerStartPosition"] = R.coerce(R.binary("+", c.fields.get("m_fPlayerStartPosition"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")), "Number")
	c.fields["m_bIsHighwayLevel"] = R.unary("!", c.fields.get("m_bIsHighwayLevel"))
	c.fields["m_bStartAtHighSpeed"] = true
	(c).fields["m_iCampaignAreaIndex"] = R.coerce((float((c).fields.get("m_iHighwayRampCampaignAreaIndex")) + float(1)), "int")
	(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosAreaIndex"] = R.coerce((c).fields.get("m_iCampaignAreaIndex"), "int")
	(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentGroupIndex"] = R.coerce((c).fields.get("m_iHighwayRampGroupIndex"), "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce((c).fields.get("m_iHighwayRampAreaIndex"), "int")
	(c).fields["m_iChallengePatternCount"] = R.coerce((c).fields.get("m_iHighwayRampChallengePatternCount"), "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce((c).fields.get("m_iHighwayRampChallengeAreaCount"), "int")
	(c).fields["m_bHighwayTransition"] = true
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(c.fields.get("m_Game"), "StartCinematic", [("EnterHighway" if R.truth(c.fields.get("m_bIsHighwayLevel")) else "ExitHighway"), false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth(c.fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 0])
	return null

static func f_AddRP(c: Variant, a: Array) -> Variant:
	var v_iRP: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bPop: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bCheckPause: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "AddRP"), [v_iRP, v_bPop, v_bCheckPause])
	return null

static func f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieKilled"), [v_zombie, v_iHitType])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float((v_zombie).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))):
				pass
				if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")) != float(0))):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")])
					(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")))), float(0)))
	return null

static func f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotDown"), [v_zombie, v_iHitType])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null

static func f_OnZombieShotByHelicopter(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotByHelicopter"), [v_zombie, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null

static func f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotOffHood"), [v_zombie, v_iClingerState])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")))), float(0)))
	return null

static func f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieGotOff"), [v_zombie, v_bFromSideCollision])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")))), float(0)))
	return null

static func f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieExploded"), [v_zombie])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null

static func f_OnSoldierKilled(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierKilled"), [v_soldier, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")))), float(0)))
	return null

static func f_OnSoldierShotDown(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierShotDown"), [v_soldier, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")))), float(0)))
	return null

static func f_OnSoldierShotOffHood(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierShotOffHood"), [v_soldier, v_iClingerState])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null

static func f_OnSoldierGotOff(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierGotOff"), [v_soldier, v_bFromSideCollision])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null

static func f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianHit"), [])
	R.set_value(c, "m_iTotalCiviliansKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")))), float(0)))
	return null

static func f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianShot"), [])
	R.set_value(c, "m_iTotalCiviliansKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null

static func f_OnHelicopterDefeated(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnHelicopterDefeated"), [])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")))), float(0)))
	return null

static func f_OnFeedersHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnFeedersHit"), [])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")))), float(0)))
	return null

static func f_OnCivilianDropped(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianDropped"), [v_evt])
	R.set_value(c, "m_iTotalCiviliansSaved", 1, "+=")
	return null

static func f_AreWeaponsEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons")))
	return null

static func f_AreAmmoPointsEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints")))
	return null

static func f_ReplenishEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish")))
	return null

static func f_InfiniteAmmoEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"))
	return null

static func f_GetBounceFactor(c: Variant, a: Array) -> Variant:
	return (R.call_static("Maths", "Clamp", [((c).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor"), 1, 10]) if R.truth((c).fields.get("m_CampaignInfo")) else 1)
	return null

static func f_GetHelicopterDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fHellfireDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null

static func f_GetHelicopterLevel(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_iHellfireLevel")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(1))
		return maxf(float(R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))])), float(1))
	return 1
	return null

static func f_GetJetDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fJetDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null

static func f_GetJetDrops(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return R.call_static("Maths", "Clamp", [(float(((c).fields.get("m_ActiveArea")).fields.get("m_iJetDrops")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1))), 1, 3])
		return R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))]), 1, 3])
	return 1
	return null

static func f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fMutantDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null

static func f_GetMutantCount(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return R.call_static("Maths", "Clamp", [(float(((c).fields.get("m_ActiveArea")).fields.get("m_iMutantCount")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1))), 1, 4])
		return R.call_static("Maths", "Clamp", [R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))]), 1, 4]), 1, 4])
	return 0
	return null

static func f_InvincibleHellfireEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"))
	return null

static func f_IsMountedMGEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"))
	return null

static func f_IsMountedRocketLauncherEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"))
	return null

static func f_InfiniteMountedWeaponEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"))
	return null

static func f_SwitchDriverEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch")))
	return null

static func f_ArcadeAmmoPickupEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"))
	return null

static func f_GetPlayerSpeedFactor(c: Variant, a: Array) -> Variant:
	return ((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor")) * float((c).fields.get("m_fAreaSpeedFactor"))) if R.truth((c).fields.get("m_CampaignInfo")) else 1)
	return null

static func f_GetJetPlayDialogs(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_SteeringEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering")))
	return null

static func f_BrakingEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking")))
	return null

static func f_SwervingEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving")))
	return null

static func f_UpdateCampaignParameters(c: Variant, a: Array) -> Variant:
	var v_iNeverLevel: Variant = 0
	v_iNeverLevel = R.coerce(0, "int")
	if R.truth((R.truth((c).fields.get("m_SpawnAreaInfo")) and ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bOverrideDifficulty"))):
		pass
		(c).fields["m_fPatternSpawnRatio"] = float(minf(float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_fPatternRatio")), float(1)))
		(c).fields["m_fSpawnRate"] = float(minf(float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_fSpawnRate")), float(2)))
		v_iNeverLevel = R.coerce(9999999999999, "int")
		c.fields["m_iStationarySoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iAlignSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iSpikeSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bSpikeSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iHiddenSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iBombSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBombSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iHardZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iFeedersLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iSpikesLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bSpike")) else v_iNeverLevel), "int")
		c.fields["m_iNewMaleZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iNewFemaleZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iSoldierZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iExplodingCarLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bExplodingCar")) else v_iNeverLevel), "int")
		c.fields["m_iMineLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bMine")) else v_iNeverLevel), "int")
		c.fields["m_iGrubLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bGrub")) else v_iNeverLevel), "int")
	else:
		pass
		(c).fields["m_fPatternSpawnRatio"] = float(minf(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio")))))), float(1)))
		(c).fields["m_fSpawnRate"] = float(minf(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate")))))), float(2)))
		c.fields["m_iStationarySoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iAlignSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iSpikeSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel"), "int")
		c.fields["m_iHiddenSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iBombSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel"), "int")
		c.fields["m_iHardZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iFeedersLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iSpikesLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel"), "int")
		c.fields["m_iNewMaleZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iNewFemaleZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iSoldierZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iExplodingCarLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel"), "int")
		c.fields["m_iMineLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel"), "int")
		c.fields["m_iGrubLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel"), "int")
	if R.truth((R.truth((c).fields.get("m_SpawnAreaInfo")) and ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bOverrideSpawning"))):
		pass
		(c).fields["m_bFUBARMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bFUBARMode")
		(c).fields["m_bNoSoldierZombie"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bNoSoldierZombie")
		(c).fields["m_bAllSoldierZombie"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllSoldierZombie")
	else:
		pass
		(c).fields["m_bFUBARMode"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode")
		(c).fields["m_bNoSoldierZombie"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie")
		(c).fields["m_bAllSoldierZombie"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie")
	c.fields["m_fLevelDifficulty"] = float((c).fields.get("m_fPatternSpawnRatio"))
	return null

static func f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	return (float(10) + float((R.num(R.call_static("Maths", "Clamp", [(c).fields.get("m_fSpawnRate"), 0, 2])) * float(10))))
	return null

static func f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(c).fields.get("m_fSpawnRate"), 0, 2])
	return null

static func f_IsFUBARMode(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bFUBARMode")
	return null

static func f_NoSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bNoSoldierZombie")
	return null

static func f_AllSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bAllSoldierZombie")
	return null

static func f_IsLavaInstantDeathEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bLavaModeInstantDeath")
	return null

static func f_CanSpawnHelicopter(c: Variant, a: Array) -> Variant:
	return ((((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed")) and R.unary("!", c.fields.get("m_Helicopter"))) and R.unary("!", c.fields.get("m_HelicopterAlly"))) and (float(c.fields.get("m_iLevel")) >= float(c.fields.get("m_iHelicopterLevel")))) and (float(c.fields.get("m_fHelicopterDelay")) > float(0)))
	return null

static func f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_HasNextLevel(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return true
		return R.binary("!=", (c).fields.get("m_szNextLevelName"), "")
	return false
	return null

static func f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return (c).fields.get("m_szNextLevelName")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return "Distance"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
			pass
			return "Zombies Killed"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
			pass
			return "Civilians Killed"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
			pass
			return "Civilians Saved"
	return ""
	return null

static func f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return R.invoke(R.get_value(R.klass("Math"), "round"), [(float((c).fields.get("m_fNextLevelPosition")) - float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))])
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100)
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
			pass
			return (c).fields.get("m_iTotalZombiesKilled")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
			pass
			return (c).fields.get("m_iTotalCiviliansKilled")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
			pass
			return (c).fields.get("m_iTotalCiviliansSaved")
	return 0
	return null

static func f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return "m"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return "km"
	return ""
	return null

static func f_UpdateNextLevel(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
		(c).fields["m_szNextLevelName"] = R.coerce("", "String")
		(c).fields["m_iNextLevel"] = R.coerce((c).fields.get("m_iDialogPosAreaIndex"), "int")
		(c).fields["m_fNextLevelPosition"] = float(c.fields.get("m_fLevelStartPosition"))
		while R.truth((R.binary("<", (c).fields.get("m_iNextLevel"), R.get_value((v_group).fields.get("m_Areas"), "length")) and R.binary("==", (c).fields.get("m_szNextLevelName"), ""))):
			pass
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iNextLevel")), "RDAreaInfo")
			(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextLevelPosition"), (float((float((v_areaInfo).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.set_value(c, "m_iNextLevel", 1, "+=")
			if R.truth(R.binary("<", (c).fields.get("m_iNextLevel"), R.get_value((v_group).fields.get("m_Areas"), "length"))):
				pass
				v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iNextLevel")), "RDAreaInfo")
				(c).fields["m_szNextLevelName"] = R.coerce((v_areaInfo).fields.get("m_szAreaName"), "String")
			else:
				pass
				(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("-", (c).fields.get("m_fNextLevelPosition"), (float(1) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
				(c).fields["m_szNextLevelName"] = R.coerce("Ending", "String")
	return null

static func f_UsingCustomMeds(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_UsingCustomMountedWeapons(c: Variant, a: Array) -> Variant:
	return ((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked") or (((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "AlertTime", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_UniquePattern"] = R.coerce(null, "RDLevelPatternCustomData")
	(c).fields["m_AreaPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_CampaignInfo"] = R.coerce(null, "RDCampaignInfo")
	(c).fields["m_iCampaignAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_fDialogPosPatternPos"] = float(NAN)
	(c).fields["m_iDialogPosAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengePlayerIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_bPlayAreaDialog"] = false
	(c).fields["m_fPlayAreaDialogPos"] = float(NAN)
	(c).fields["m_AreaDialogCues"] = R.coerce(null, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(null, "Array")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_iEnding"] = R.coerce(0, "int")
	(c).fields["m_fEndCampaignTimer"] = float(NAN)
	(c).fields["m_fDialogTimer"] = float(0)
	(c).fields["m_ChopperSound"] = R.coerce(null, "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(null, "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(null, "DTSound")
	(c).fields["m_bSpawnHighwayRamp"] = false
	(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iHighwayRampGroupIndex"] = R.coerce(0, "int")
	(c).fields["m_iHighwayRampAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iHighwayRampChallengePatternCount"] = R.coerce(0, "int")
	(c).fields["m_iHighwayRampChallengeAreaCount"] = R.coerce(0, "int")
	(c).fields["m_fHighwayRampPos"] = float(NAN)
	(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
	(c).fields["m_iTotalZombiesKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansSaved"] = R.coerce(0, "int")
	(c).fields["m_bValidData"] = false
	(c).fields["m_fNextChallengeSpawnPosition"] = float(NAN)
	(c).fields["m_ChallengeGroups"] = R.coerce(R.construct(R.klass("Array"), [20]), "Array")
	(c).fields["m_ChallengeAreas"] = R.coerce(R.construct(R.klass("Array"), [20]), "Array")
	(c).fields["m_ChallengePatterns"] = R.coerce(R.construct(R.klass("Array"), [20]), "Array")
	(c).fields["m_ChallengeAreaCounts"] = R.coerce(R.construct(R.klass("Array"), [20]), "Array")
	(c).fields["m_ChallengePatternCounts"] = R.coerce(R.construct(R.klass("Array"), [20]), "Array")
	(c).fields["m_iCurrentChallengeSpawnIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengeIndex"] = R.coerce(0, "int")
	(c).fields["m_fForcedStopTimer"] = float(NAN)
	(c).fields["m_bDoFirstInit"] = false
	(c).fields["m_fAreaSpeedFactor"] = float(NAN)
	(c).fields["m_ActiveArea"] = R.coerce(null, "RDAreaInfo")
	(c).fields["m_SpawnAreaInfo"] = R.coerce(null, "RDAreaInfo")
	(c).fields["m_fPatternSpawnRatio"] = float(NAN)
	(c).fields["m_fTime"] = float(NAN)
	(c).fields["m_TimeOutSound"] = R.coerce(null, "DTSound")
	(c).fields["m_iLevelCounter"] = R.coerce(0, "int")
	(c).fields["m_fSpawnRate"] = float(NAN)
	(c).fields["m_bFUBARMode"] = false
	(c).fields["m_bNoSoldierZombie"] = false
	(c).fields["m_bAllSoldierZombie"] = false
	(c).fields["m_bLavaModeInstantDeath"] = false
	(c).fields["m_bFirstLoad"] = false
	(c).fields["m_bHighwayTransition"] = false
	(c).fields["m_szNextLevelName"] = R.coerce(null, "String")
	(c).fields["m_fNextLevelPosition"] = float(NAN)
	(c).fields["m_iNextLevel"] = R.coerce(0, "int")
	return null
