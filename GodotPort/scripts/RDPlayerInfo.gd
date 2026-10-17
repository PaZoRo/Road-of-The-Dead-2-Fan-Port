extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPlayerInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPlayerInfo"), [])
	R.assign(c, "Instance", "RDPlayerInfo", c, "=")
	(c).fields["m_gameSaveData"] = R.coerce(R.invoke(R.get_value(R.resolve(c, "SharedObject", "RDPlayerInfo"), "getLocal"), [R.static_value("RDPlayerInfo", "kSaveDataName"), "/"]), "SharedObject")
	R.invoke(R.get_value((c).fields.get("m_gameSaveData"), "addEventListener"), [R.get_value(R.resolve(c, "NetStatusEvent", "RDPlayerInfo"), "NET_STATUS"), R.get_value(c, "OnNetStatusEvent"), false, 0, true])
	R.call_member(c, "Reset", [])
	if R.truth(R.binary("==", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSavedOnce"), null)):
		pass
		R.call_member(c, "SavePlayerInfo", [])
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	(c).fields["m_iRP"] = float(250)
	(c).fields["m_bIsAwareOfStoryMode"] = false
	(c).fields["m_bStoryModeFinished"] = false
	(c).fields["m_bMutantLevelFinished"] = false
	(c).fields["m_bJohnEndingSeen"] = false
	(c).fields["m_bSeenJohnCarNotice"] = false
	(c).fields["m_bSeenMutantModeNotice"] = false
	(c).fields["m_bSeenChallengeModeNotice"] = false
	(c).fields["m_iStoryLevel"] = R.coerce(0, "int")
	(c).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	(c).fields["m_fStoryProgress"] = float(0)
	(c).fields["m_fBestDeadOnTimeDistance"] = float(0)
	(c).fields["m_fBestSurvivalDistance"] = float(0)
	(c).fields["m_fBestMilitaryDistance"] = float(0)
	(c).fields["m_fBestMutantDistance"] = float(0)
	(c).fields["m_iBestChopperRescueRescues"] = R.coerce(0, "int")
	(c).fields["m_iBestHitCombo"] = R.coerce(0, "int")
	(c).fields["m_CochetaPistol"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CochetaPistol"]), "RDWeaponSaveData")
	(c).fields["m_CochetaMP5"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CochetaMP5"]), "RDWeaponSaveData")
	(c).fields["m_CochetaSPAS12"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CochetaSPAS12"]), "RDWeaponSaveData")
	(c).fields["m_CochetaM60"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CochetaM60"]), "RDWeaponSaveData")
	(c).fields["m_DianePistol"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["DianePistol"]), "RDWeaponSaveData")
	(c).fields["m_DianeShotgun"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["DianeShotgun"]), "RDWeaponSaveData")
	(c).fields["m_DianeMAC11"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["DianeMAC11"]), "RDWeaponSaveData")
	(c).fields["m_DianeM16"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["DianeM16"]), "RDWeaponSaveData")
	(c).fields["m_RocketLauncher"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["RocketLauncher"]), "RDWeaponSaveData")
	(c).fields["m_MountedMG"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["MountedMG"]), "RDWeaponSaveData")
	(c).fields["m_CustomRocketLauncher"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CustomRocketLauncher"]), "RDWeaponSaveData")
	(c).fields["m_CustomMountedMG"] = R.coerce(R.construct(R.klass("RDWeaponSaveData"), ["CustomMountedMG"]), "RDWeaponSaveData")
	((c).fields.get("m_CochetaPistol")).fields["m_bUnlocked"] = true
	((c).fields.get("m_CochetaMP5")).fields["m_bUnlocked"] = true
	((c).fields.get("m_DianePistol")).fields["m_bUnlocked"] = true
	((c).fields.get("m_DianeShotgun")).fields["m_bUnlocked"] = true
	(c).fields["m_completedAchievements"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDAchievement", "Max")]), "Array")
	R.call_member(c, "InitArray", [(c).fields.get("m_completedAchievements")])
	(c).fields["m_bSavedAmmo"] = false
	(c).fields["m_iDianeDrivingLevel"] = R.coerce(0, "int")
	(c).fields["m_iCochetaDrivingLevel"] = R.coerce(0, "int")
	(c).fields["m_iDianeDrivingPoints"] = float(0)
	(c).fields["m_iCochetaDrivingPoints"] = float(0)
	(c).fields["m_iDianeToughnessLevel"] = R.coerce(0, "int")
	(c).fields["m_iCochetaToughnessLevel"] = R.coerce(0, "int")
	(c).fields["m_iDianeToughnessPoints"] = float(0)
	(c).fields["m_iCochetaToughnessPoints"] = float(0)
	(c).fields["m_iTiresLevel"] = R.coerce(0, "int")
	(c).fields["m_fNbBlownTires"] = float(0)
	(c).fields["m_fBodyHP"] = float(0)
	(c).fields["m_iBumperLevel"] = R.coerce(0, "int")
	(c).fields["m_fBumperHP"] = float(100)
	(c).fields["m_fBumperAddonHP"] = float(0)
	(c).fields["m_iEngineLevel"] = R.coerce(0, "int")
	(c).fields["m_iMedShields"] = R.coerce(0, "int")
	(c).fields["m_iMedHeals"] = R.coerce(0, "int")
	(c).fields["m_iChopperSupportLevel"] = R.coerce(0, "int")
	(c).fields["m_iAmmoPickupLevel"] = R.coerce(0, "int")
	(c).fields["m_iLowerCostLevel"] = R.coerce(0, "int")
	(c).fields["m_iDriverSwitchLevel"] = R.coerce(0, "int")
	(c).fields["m_iTaskSpeedLevel"] = R.coerce(0, "int")
	(c).fields["m_iLevelUpLevel"] = R.coerce(0, "int")
	(c).fields["m_iLeftKey"] = R.coerce(R.static_value("Input", "Key_A"), "int")
	(c).fields["m_iRightKey"] = R.coerce(R.static_value("Input", "Key_D"), "int")
	(c).fields["m_iAccelKey"] = R.coerce(R.static_value("Input", "Key_W"), "int")
	(c).fields["m_iBrakeKey"] = R.coerce(R.static_value("Input", "Key_S"), "int")
	(c).fields["m_iHandbrakeKey"] = R.coerce(R.static_value("Input", "Key_Space"), "int")
	(c).fields["m_iHornKey"] = R.coerce(R.static_value("Input", "Key_F"), "int")
	(c).fields["m_iSwitchDriverKey"] = R.coerce(R.static_value("Input", "Key_Shift"), "int")
	(c).fields["m_iReloadKey"] = R.coerce(R.static_value("Input", "Key_R"), "int")
	(c).fields["m_iPrevWeaponKey"] = R.coerce(R.static_value("Input", "Key_Q"), "int")
	(c).fields["m_iNextWeaponKey"] = R.coerce(R.static_value("Input", "Key_E"), "int")
	(c).fields["m_iPauseKey"] = R.coerce(R.static_value("Input", "Key_P"), "int")
	(c).fields["m_bMusic"] = true
	(c).fields["m_bSound"] = true
	(c).fields["m_iQuality"] = R.coerce(1, "int")
	(c).fields["m_bZombieTints"] = true
	(c).fields["m_bBeenInGarage"] = false
	(c).fields["m_iStoryTutorialIndex"] = R.coerce(0, "int")
	(c).fields["m_bShowWeaponStatsButton"] = false
	(c).fields["m_bUsingHummer"] = true
	(c).fields["m_bSeenUpgradeTabs"] = false
	(c).fields["m_bSeenStorageNotice"] = false
	(c).fields["m_bDidFirstHeadShot"] = false
	(c).fields["m_bSeenEditorTutorial"] = false
	(c).fields["m_bSeenApplyTutorial"] = false
	(c).fields["m_bSeenLoadCampaignHint"] = false
	(c).fields["m_bSeenStoryCampaignHint"] = false
	(c).fields["m_bSeenChallengeCampaignHint"] = false
	(c).fields["m_bSeenExtraSwerveTutorial"] = false
	(c).fields["m_bSeenExtraLocationTutorial"] = false
	(c).fields["m_bSeenExtraExtraLocationTutorial"] = false
	(c).fields["m_bStoppedAtLocation"] = false
	(c).fields["m_iPressSwerveCount"] = R.coerce(0, "int")
	(c).fields["m_bSeenAccelTutorial"] = false
	(c).fields["m_bPressedAccel"] = false
	(c).fields["m_bPressedBrake"] = false
	(c).fields["m_bSeenTurnTutorial"] = false
	(c).fields["m_bPressedLeft"] = false
	(c).fields["m_bPressedRight"] = false
	(c).fields["m_bSeenMouseTutorial"] = false
	(c).fields["m_bPressedShoot"] = false
	(c).fields["m_bSeenReloadTutorial"] = false
	(c).fields["m_bPressedReload"] = false
	(c).fields["m_bSeenWeaponSelectionTutorial"] = false
	(c).fields["m_bPressedWeaponSelection"] = false
	(c).fields["m_bSeenWeaponCycleTutorial"] = false
	(c).fields["m_bPressedWeaponCycle"] = false
	(c).fields["m_bSeenSwerveTutorial"] = false
	(c).fields["m_bPressedSwerve"] = false
	(c).fields["m_bSeenHornTutorial"] = false
	(c).fields["m_bPressedHorn"] = false
	(c).fields["m_bSeenMountedWeaponTutorial"] = false
	(c).fields["m_bPressedMountedWeapon"] = false
	(c).fields["m_bSeenThirdWeaponTutorial"] = false
	(c).fields["m_bPressedThirdWeapon"] = false
	(c).fields["m_bSeenFourthWeaponTutorial"] = false
	(c).fields["m_bPressedFourthWeapon"] = false
	(c).fields["m_bSeenInteractTutorial"] = false
	(c).fields["m_bPressedInteract"] = false
	(c).fields["m_bSeenDropCivTutorial"] = false
	(c).fields["m_iSeenSideGrappleDriverTutorial"] = R.coerce(0, "int")
	(c).fields["m_iSeenSideGrappleGunnerTutorial"] = R.coerce(0, "int")
	(c).fields["m_bSeenLocationTutorial"] = false
	(c).fields["m_bSeenMedTutorial"] = false
	(c).fields["m_bSeenChopperTutorial"] = false
	(c).fields["m_bSeenSwitchDriverTutorial"] = false
	(c).fields["m_bSeenUpgradeSystemTutorial"] = false
	(c).fields["m_bPressedSwitchDriver"] = false
	(c).fields["m_SurvivalItems"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SurvivalItemsSeen"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SurvivalItemsHash"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_Vehicles")])
	R.call_member(c, "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_LargeVehicles")])
	R.call_member(c, "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_CommonUndead")])
	R.call_member(c, "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_DrivingSkills")])
	(c).fields["m_iNbZombieSplatterHits"] = R.coerce(0, "int")
	(c).fields["m_iNbKilledCivilians"] = R.coerce(0, "int")
	(c).fields["m_iNbDodgedBombing"] = R.coerce(0, "int")
	(c).fields["m_bKilledZombieMale"] = false
	(c).fields["m_bKilledZombieFemale"] = false
	(c).fields["m_bKilledZombieMaleNew"] = false
	(c).fields["m_bKilledZombieFemaleNew"] = false
	(c).fields["m_bKilledZombieHard"] = false
	(c).fields["m_bKilledZombieSoldier"] = false
	(c).fields["m_bKilledZombieMutant"] = false
	(c).fields["m_bKilledZombieAlpha"] = false
	(c).fields["m_bKilledZombieGrub"] = false
	(c).fields["m_bKilledSoldier"] = false
	(c).fields["m_bSeenAreaResidential"] = false
	(c).fields["m_bSeenAreaTown"] = false
	(c).fields["m_bSeenAreaIndustrial"] = false
	(c).fields["m_bSeenAreaPark"] = false
	(c).fields["m_bSeenAreaAlleyway"] = false
	(c).fields["m_bSeenAreaHighway"] = false
	(c).fields["m_bSeenAreaCemetery"] = false
	(c).fields["m_iCivsInCar"] = R.coerce(0, "int")
	(c).fields["m_bCivIsMale1"] = false
	(c).fields["m_bCivIsMale2"] = false
	(c).fields["m_bCivIsMale3"] = false
	(c).fields["m_bCivIsMale4"] = false
	(c).fields["m_bCivIsMale5"] = false
	(c).fields["m_fTotalDistance"] = float(0)
	(c).fields["m_iZombiesShot"] = R.coerce(0, "int")
	(c).fields["m_iZombiesHit"] = R.coerce(0, "int")
	(c).fields["m_iMutantsKilled"] = R.coerce(0, "int")
	(c).fields["m_iBulletsShot"] = R.coerce(0, "int")
	(c).fields["m_iRocketsShot"] = R.coerce(0, "int")
	(c).fields["m_iCarsExploded"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansSaved"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansTaken"] = R.coerce(0, "int")
	(c).fields["m_iRPEarned"] = R.coerce(0, "int")
	(c).fields["m_iSuccessfulStops"] = R.coerce(0, "int")
	(c).fields["m_iHeadshots"] = R.coerce(0, "int")
	(c).fields["m_iMinesShot"] = R.coerce(0, "int")
	(c).fields["m_iFuelTruckShot"] = R.coerce(0, "int")
	(c).fields["m_iPropertyDamage"] = R.coerce(0, "int")
	(c).fields["m_iTotalDeaths"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByZombie"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByExplosion"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByGunShot"] = R.coerce(0, "int")
	(c).fields["m_iCollateralKills"] = R.coerce(0, "int")
	(c).fields["m_iFiresPutOut"] = R.coerce(0, "int")
	(c).fields["m_iTiresBlown"] = R.coerce(0, "int")
	(c).fields["m_iTotalClingers"] = R.coerce(0, "int")
	(c).fields["m_iClingersShot"] = R.coerce(0, "int")
	(c).fields["m_iClingersShakenOff"] = R.coerce(0, "int")
	(c).fields["m_fDianeDistance"] = float(0)
	(c).fields["m_fCochetaDistance"] = float(0)
	(c).fields["m_iSoldiersHit"] = R.coerce(0, "int")
	(c).fields["m_iSoldiersShot"] = R.coerce(0, "int")
	(c).fields["m_iCarsBlownUpByMountedWeapon"] = R.coerce(0, "int")
	(c).fields["m_iNbSlowZombieKills"] = R.coerce(0, "int")
	return null

static func f_InitArray(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_theArray: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_bIsACountArray: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bIsAMinusOneArray: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_theArray, "length"))):
		pass
		R.set_value(v_theArray, v_i, (R.unary("-", 1) if R.truth(v_bIsAMinusOneArray) else (0 if R.truth(v_bIsACountArray) else false)), "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_CopyArray(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_sourceArray: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_targetArray: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_sourceArray, "length"))):
		pass
		R.set_value(v_targetArray, v_i, R.get_value(v_sourceArray, v_i), "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_FillSurvivalItemsHash(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SurvivalItems"), "length"))):
		pass
		R.set_value((c).fields.get("m_SurvivalItemsHash"), R.get_value((c).fields.get("m_SurvivalItems"), v_i), (2 if R.truth(R.get_value((c).fields.get("m_SurvivalItemsSeen"), v_i)) else 1), "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_FillArray(c: Variant, a: Array) -> Variant:
	var v_szValue: Variant = null
	var v_i: Variant = 0
	var v_newValues: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_values: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	var v_valuesHash: Variant = R.coerce((a[2] if a.size() > 2 else null), "Array")
	v_szValue = R.coerce(null, "String")
	R.invoke(R.get_value(v_values, "splice"), [0])
	R.invoke(R.get_value(v_valuesHash, "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_newValues, "length"))):
		pass
		v_szValue = R.coerce(R.get_value(v_newValues, v_i), "String")
		R.invoke(R.get_value(v_values, "push"), [v_szValue])
		R.set_value(v_valuesHash, v_szValue, true, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_GetNbCompletedAchievements(c: Variant, a: Array) -> Variant:
	var v_iCount: Variant = 0
	var v_i: Variant = 0
	v_iCount = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_completedAchievements"), "length"))):
		pass
		if R.truth(R.get_value((c).fields.get("m_completedAchievements"), v_i)):
			pass
			v_iCount = R.signed32(v_iCount + 1)
		v_i = R.signed32(v_i + 1)
	return v_iCount
	return null

static func f_GetNbCompletedAchievementsTotal(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_completedAchievements"), "length")
	return null

static func f_SavePlayerInfo(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "Error"}
	l["error"] = null
	if R.truth(R.binary("==", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_Weapons"), null)):
		pass
		R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_Weapons", R.construct(R.resolve(c, "Object", "RDPlayerInfo"), []), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSavedOnce", true, "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRP", (c).fields.get("m_iRP"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bIsAwareOfStoryMode", (c).fields.get("m_bIsAwareOfStoryMode"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bStoryModeFinished", (c).fields.get("m_bStoryModeFinished"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bMutantLevelFinished", (c).fields.get("m_bMutantLevelFinished"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bJohnEndingSeen", (c).fields.get("m_bJohnEndingSeen"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenJohnCarNotice", (c).fields.get("m_bSeenJohnCarNotice"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMutantModeNotice", (c).fields.get("m_bSeenMutantModeNotice"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChallengeModeNotice", (c).fields.get("m_bSeenChallengeModeNotice"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iStoryLevel", (c).fields.get("m_iStoryLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHardcoreStoryLevel", (c).fields.get("m_iHardcoreStoryLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fStoryProgress", (c).fields.get("m_fStoryProgress"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestDeadOnTimeDistance", (c).fields.get("m_fBestDeadOnTimeDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestSurvivalDistance", (c).fields.get("m_fBestSurvivalDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestMilitaryDistance", (c).fields.get("m_fBestMilitaryDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestMutantDistance", (c).fields.get("m_fBestMutantDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBestChopperRescueRescues", (c).fields.get("m_iBestChopperRescueRescues"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBestHitCombo", (c).fields.get("m_iBestHitCombo"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_completedAchievements", R.construct(R.klass("Array"), []), "=")
	R.call_member(c, "CopyArray", [(c).fields.get("m_completedAchievements"), R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_completedAchievements")])
	R.call_member((c).fields.get("m_CochetaPistol"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaMP5"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaSPAS12"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaM60"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianePistol"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeShotgun"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeMAC11"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeM16"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_RocketLauncher"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_MountedMG"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CustomRocketLauncher"), "Save", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CustomMountedMG"), "Save", [(c).fields.get("m_gameSaveData")])
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSavedAmmo", (c).fields.get("m_bSavedAmmo"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeDrivingLevel", (c).fields.get("m_iDianeDrivingLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaDrivingLevel", (c).fields.get("m_iCochetaDrivingLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeDrivingPoints", (c).fields.get("m_iDianeDrivingPoints"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaDrivingPoints", (c).fields.get("m_iCochetaDrivingPoints"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeToughnessLevel", (c).fields.get("m_iDianeToughnessLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaToughnessLevel", (c).fields.get("m_iCochetaToughnessLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeToughnessPoints", (c).fields.get("m_iDianeToughnessPoints"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaToughnessPoints", (c).fields.get("m_iCochetaToughnessPoints"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTiresLevel", (c).fields.get("m_iTiresLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fNbBlownTires", (c).fields.get("m_fNbBlownTires"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBodyHP", (c).fields.get("m_fBodyHP"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBumperLevel", (c).fields.get("m_iBumperLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBumperHP", (c).fields.get("m_fBumperHP"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBumperAddonHP", (c).fields.get("m_fBumperAddonHP"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iEngineLevel", (c).fields.get("m_iEngineLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMedShields", (c).fields.get("m_iMedShields"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMedHeals", (c).fields.get("m_iMedHeals"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iChopperSupportLevel", (c).fields.get("m_iChopperSupportLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iAmmoPickupLevel", (c).fields.get("m_iAmmoPickupLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLowerCostLevel", (c).fields.get("m_iLowerCostLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDriverSwitchLevel", (c).fields.get("m_iDriverSwitchLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTaskSpeedLevel", (c).fields.get("m_iTaskSpeedLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLevelUpLevel", (c).fields.get("m_iLevelUpLevel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLeftKey", (c).fields.get("m_iLeftKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRightKey", (c).fields.get("m_iRightKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iAccelKey", (c).fields.get("m_iAccelKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBrakeKey", (c).fields.get("m_iBrakeKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHandbrakeKey", (c).fields.get("m_iHandbrakeKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHornKey", (c).fields.get("m_iHornKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSwitchDriverKey", (c).fields.get("m_iSwitchDriverKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iReloadKey", (c).fields.get("m_iReloadKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPrevWeaponKey", (c).fields.get("m_iPrevWeaponKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNextWeaponKey", (c).fields.get("m_iNextWeaponKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPauseKey", (c).fields.get("m_iPauseKey"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bMusic", (c).fields.get("m_bMusic"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSound", (c).fields.get("m_bSound"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iQuality", (c).fields.get("m_iQuality"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bZombieTints", (c).fields.get("m_bZombieTints"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bBeenInGarage", (c).fields.get("m_bBeenInGarage"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iStoryTutorialIndex", (c).fields.get("m_iStoryTutorialIndex"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bShowWeaponStatsButton", (c).fields.get("m_bShowWeaponStatsButton"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bUsingHummer", (c).fields.get("m_bUsingHummer"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenUpgradeTabs", (c).fields.get("m_bSeenUpgradeTabs"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenStorageNotice", (c).fields.get("m_bSeenStorageNotice"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bDidFirstHeadShot", (c).fields.get("m_bDidFirstHeadShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenEditorTutorial", (c).fields.get("m_bSeenEditorTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenApplyTutorial", (c).fields.get("m_bSeenApplyTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenLoadCampaignHint", (c).fields.get("m_bSeenLoadCampaignHint"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenStoryCampaignHint", (c).fields.get("m_bSeenStoryCampaignHint"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChallengeCampaignHint", (c).fields.get("m_bSeenStoryCampaignHint"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraSwerveTutorial", (c).fields.get("m_bSeenExtraSwerveTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraLocationTutorial", (c).fields.get("m_bSeenExtraLocationTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraExtraLocationTutorial", (c).fields.get("m_bSeenExtraExtraLocationTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bStoppedAtLocation", (c).fields.get("m_bStoppedAtLocation"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPressSwerveCount", (c).fields.get("m_iPressSwerveCount"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAccelTutorial", (c).fields.get("m_bSeenAccelTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedAccel", (c).fields.get("m_bPressedAccel"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedBrake", (c).fields.get("m_bPressedBrake"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenTurnTutorial", (c).fields.get("m_bSeenTurnTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedLeft", (c).fields.get("m_bPressedLeft"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedRight", (c).fields.get("m_bPressedRight"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMouseTutorial", (c).fields.get("m_bSeenMouseTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedShoot", (c).fields.get("m_bPressedShoot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenReloadTutorial", (c).fields.get("m_bSeenReloadTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedReload", (c).fields.get("m_bPressedReload"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenWeaponSelectionTutorial", (c).fields.get("m_bSeenWeaponSelectionTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedWeaponSelection", (c).fields.get("m_bPressedWeaponSelection"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenWeaponCycleTutorial", (c).fields.get("m_bSeenWeaponCycleTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedWeaponCycle", (c).fields.get("m_bPressedWeaponCycle"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenSwerveTutorial", (c).fields.get("m_bSeenSwerveTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedSwerve", (c).fields.get("m_bPressedSwerve"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenHornTutorial", (c).fields.get("m_bSeenHornTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedHorn", (c).fields.get("m_bPressedHorn"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMountedWeaponTutorial", (c).fields.get("m_bSeenMountedWeaponTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedMountedWeapon", (c).fields.get("m_bPressedMountedWeapon"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenThirdWeaponTutorial", (c).fields.get("m_bSeenThirdWeaponTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedThirdWeapon", (c).fields.get("m_bPressedThirdWeapon"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenFourthWeaponTutorial", (c).fields.get("m_bSeenFourthWeaponTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedFourthWeapon", (c).fields.get("m_bPressedFourthWeapon"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenInteractTutorial", (c).fields.get("m_bSeenInteractTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedInteract", (c).fields.get("m_bPressedInteract"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenDropCivTutorial", (c).fields.get("m_bSeenDropCivTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSeenSideGrappleDriverTutorial", (c).fields.get("m_iSeenSideGrappleDriverTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSeenSideGrappleGunnerTutorial", (c).fields.get("m_iSeenSideGrappleGunnerTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenLocationTutorial", (c).fields.get("m_bSeenLocationTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMedTutorial", (c).fields.get("m_bSeenMedTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChopperTutorial", (c).fields.get("m_bSeenChopperTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenSwitchDriverTutorial", (c).fields.get("m_bSeenSwitchDriverTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenUpgradeSystemTutorial", (c).fields.get("m_bSeenUpgradeSystemTutorial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedSwitchDriver", (c).fields.get("m_bPressedSwitchDriver"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItems", R.construct(R.klass("Array"), [R.get_value((c).fields.get("m_SurvivalItems"), "length")]), "=")
	R.call_member(c, "CopyArray", [(c).fields.get("m_SurvivalItems"), R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItems")])
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItemsSeen", R.construct(R.klass("Array"), [R.get_value((c).fields.get("m_SurvivalItemsSeen"), "length")]), "=")
	R.call_member(c, "CopyArray", [(c).fields.get("m_SurvivalItemsSeen"), R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItemsSeen")])
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbZombieSplatterHits", (c).fields.get("m_iNbZombieSplatterHits"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbKilledCivilians", (c).fields.get("m_iNbKilledCivilians"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbDodgedBombing", (c).fields.get("m_iNbDodgedBombing"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMale", (c).fields.get("m_bKilledZombieMale"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieFemale", (c).fields.get("m_bKilledZombieFemale"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMaleNew", (c).fields.get("m_bKilledZombieMaleNew"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieFemaleNew", (c).fields.get("m_bKilledZombieFemaleNew"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieHard", (c).fields.get("m_bKilledZombieHard"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieSoldier", (c).fields.get("m_bKilledZombieSoldier"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMutant", (c).fields.get("m_bKilledZombieMutant"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieAlpha", (c).fields.get("m_bKilledZombieAlpha"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieGrub", (c).fields.get("m_bKilledZombieGrub"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledSoldier", (c).fields.get("m_bKilledSoldier"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaResidential", (c).fields.get("m_bSeenAreaResidential"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaTown", (c).fields.get("m_bSeenAreaTown"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaIndustrial", (c).fields.get("m_bSeenAreaIndustrial"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaPark", (c).fields.get("m_bSeenAreaPark"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaAlleyway", (c).fields.get("m_bSeenAreaAlleyway"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaHighway", (c).fields.get("m_bSeenAreaHighway"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaCemetery", (c).fields.get("m_bSeenAreaCemetery"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCivsInCar", (c).fields.get("m_iCivsInCar"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale1", (c).fields.get("m_bCivIsMale1"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale2", (c).fields.get("m_bCivIsMale2"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale3", (c).fields.get("m_bCivIsMale3"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale4", (c).fields.get("m_bCivIsMale4"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale5", (c).fields.get("m_bCivIsMale5"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fTotalDistance", (c).fields.get("m_fTotalDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iZombiesShot", (c).fields.get("m_iZombiesShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iZombiesHit", (c).fields.get("m_iZombiesHit"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMutantsKilled", (c).fields.get("m_iMutantsKilled"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBulletsShot", (c).fields.get("m_iBulletsShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRocketsShot", (c).fields.get("m_iRocketsShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCarsExploded", (c).fields.get("m_iCarsExploded"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCiviliansSaved", (c).fields.get("m_iCiviliansSaved"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCiviliansTaken", (c).fields.get("m_iCiviliansTaken"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRPEarned", (c).fields.get("m_iRPEarned"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSuccessfulStops", (c).fields.get("m_iSuccessfulStops"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHeadshots", (c).fields.get("m_iHeadshots"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMinesShot", (c).fields.get("m_iMinesShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iFuelTruckShot", (c).fields.get("m_iFuelTruckShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPropertyDamage", (c).fields.get("m_iPropertyDamage"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTotalDeaths", (c).fields.get("m_iTotalDeaths"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByZombie", (c).fields.get("m_iDeathsByZombie"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByExplosion", (c).fields.get("m_iDeathsByExplosion"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByGunShot", (c).fields.get("m_iDeathsByGunShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCollateralKills", (c).fields.get("m_iCollateralKills"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iFiresPutOut", (c).fields.get("m_iFiresPutOut"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTiresBlown", (c).fields.get("m_iTiresBlown"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTotalClingers", (c).fields.get("m_iTotalClingers"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iClingersShot", (c).fields.get("m_iClingersShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iClingersShakenOff", (c).fields.get("m_iClingersShakenOff"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fDianeDistance", (c).fields.get("m_fDianeDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fCochetaDistance", (c).fields.get("m_fCochetaDistance"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSoldiersHit", (c).fields.get("m_iSoldiersHit"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSoldiersShot", (c).fields.get("m_iSoldiersShot"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCarsBlownUpByMountedWeapon", (c).fields.get("m_iCarsBlownUpByMountedWeapon"), "=")
	R.set_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbSlowZombieKills", (c).fields.get("m_iNbSlowZombieKills"), "=")
	R.last_error = null
	R.invoke(R.get_value((c).fields.get("m_gameSaveData"), "flush"), [])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		return false
	return true
	return null

static func f_OnNetStatusEvent(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "NetStatusEvent")
	pass
	return null

static func f_LoadPlayerInfo(c: Variant, a: Array) -> Variant:
	(c).fields["m_iRP"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRP"), "Number")
	(c).fields["m_bIsAwareOfStoryMode"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bIsAwareOfStoryMode"), "Boolean")
	(c).fields["m_bStoryModeFinished"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bStoryModeFinished"), "Boolean")
	(c).fields["m_bMutantLevelFinished"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bMutantLevelFinished"), "Boolean")
	(c).fields["m_bJohnEndingSeen"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bJohnEndingSeen"), "Boolean")
	(c).fields["m_bSeenJohnCarNotice"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenJohnCarNotice"), "Boolean")
	(c).fields["m_bSeenMutantModeNotice"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMutantModeNotice"), "Boolean")
	(c).fields["m_bSeenChallengeModeNotice"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChallengeModeNotice"), "Boolean")
	(c).fields["m_iStoryLevel"] = R.coerce((R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iStoryLevel"), "int") if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iStoryLevel"), null)) else 0), "int")
	(c).fields["m_iHardcoreStoryLevel"] = R.coerce((R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHardcoreStoryLevel"), "int") if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHardcoreStoryLevel"), null)) else 0), "int")
	(c).fields["m_fStoryProgress"] = R.coerce((R.num(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fStoryProgress")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fStoryProgress"), null)) else 0), "Number")
	(c).fields["m_fBestDeadOnTimeDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestDeadOnTimeDistance"), "Number")
	(c).fields["m_fBestSurvivalDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestSurvivalDistance"), "Number")
	(c).fields["m_fBestMilitaryDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestMilitaryDistance"), "Number")
	(c).fields["m_fBestMutantDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBestMutantDistance"), "Number")
	(c).fields["m_iBestChopperRescueRescues"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBestChopperRescueRescues"), "int")
	(c).fields["m_iBestHitCombo"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBestHitCombo"), "int")
	(c).fields["m_completedAchievements"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "CopyArray", [R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_completedAchievements"), (c).fields.get("m_completedAchievements")])
	R.call_member((c).fields.get("m_CochetaPistol"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaMP5"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaSPAS12"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CochetaM60"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianePistol"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeShotgun"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeMAC11"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_DianeM16"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_RocketLauncher"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_MountedMG"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CustomRocketLauncher"), "Load", [(c).fields.get("m_gameSaveData")])
	R.call_member((c).fields.get("m_CustomMountedMG"), "Load", [(c).fields.get("m_gameSaveData")])
	(c).fields["m_bSavedAmmo"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSavedAmmo"), "Boolean")
	(c).fields["m_iDianeDrivingLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeDrivingLevel"), "int")
	(c).fields["m_iCochetaDrivingLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaDrivingLevel"), "int")
	(c).fields["m_iDianeDrivingPoints"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeDrivingPoints"), "Number")
	(c).fields["m_iCochetaDrivingPoints"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaDrivingPoints"), "Number")
	(c).fields["m_iDianeToughnessLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeToughnessLevel"), "int")
	(c).fields["m_iCochetaToughnessLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaToughnessLevel"), "int")
	(c).fields["m_iDianeToughnessPoints"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDianeToughnessPoints"), "Number")
	(c).fields["m_iCochetaToughnessPoints"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCochetaToughnessPoints"), "Number")
	(c).fields["m_iTiresLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTiresLevel"), "int")
	(c).fields["m_fNbBlownTires"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fNbBlownTires"), "Number")
	(c).fields["m_fBodyHP"] = R.coerce((R.num(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBodyHP")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBodyHP"), null)) else 100), "Number")
	(c).fields["m_iBumperLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBumperLevel"), "int")
	(c).fields["m_fBumperHP"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBumperHP"), "Number")
	(c).fields["m_fBumperAddonHP"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fBumperAddonHP"), "Number")
	(c).fields["m_iEngineLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iEngineLevel"), "int")
	(c).fields["m_iMedShields"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMedShields"), "int")
	(c).fields["m_iMedHeals"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMedHeals"), "int")
	(c).fields["m_iChopperSupportLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iChopperSupportLevel"), "int")
	(c).fields["m_iAmmoPickupLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iAmmoPickupLevel"), "int")
	(c).fields["m_iLowerCostLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLowerCostLevel"), "int")
	(c).fields["m_iDriverSwitchLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDriverSwitchLevel"), "int")
	(c).fields["m_iTaskSpeedLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTaskSpeedLevel"), "int")
	(c).fields["m_iLevelUpLevel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLevelUpLevel"), "int")
	(c).fields["m_iLeftKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iLeftKey"), "int")
	(c).fields["m_iRightKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRightKey"), "int")
	(c).fields["m_iAccelKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iAccelKey"), "int")
	(c).fields["m_iBrakeKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBrakeKey"), "int")
	(c).fields["m_iHandbrakeKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHandbrakeKey"), "int")
	(c).fields["m_iHornKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHornKey"), "int")
	(c).fields["m_iSwitchDriverKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSwitchDriverKey"), "int")
	(c).fields["m_iReloadKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iReloadKey"), "int")
	(c).fields["m_iPrevWeaponKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPrevWeaponKey"), "int")
	(c).fields["m_iNextWeaponKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNextWeaponKey"), "int")
	(c).fields["m_iPauseKey"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPauseKey"), "int")
	(c).fields["m_bMusic"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bMusic"), "Boolean")
	(c).fields["m_bSound"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSound"), "Boolean")
	(c).fields["m_iQuality"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iQuality"), "int")
	(c).fields["m_bZombieTints"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bZombieTints"), "Boolean")
	(c).fields["m_bBeenInGarage"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bBeenInGarage"), "Boolean")
	(c).fields["m_iStoryTutorialIndex"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iStoryTutorialIndex"), "int")
	(c).fields["m_bShowWeaponStatsButton"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bShowWeaponStatsButton"), "Boolean")
	(c).fields["m_bUsingHummer"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bUsingHummer"), "Boolean")
	(c).fields["m_bSeenUpgradeTabs"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenUpgradeTabs"), "Boolean")
	(c).fields["m_bSeenStorageNotice"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenStorageNotice"), "Boolean")
	(c).fields["m_bDidFirstHeadShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bDidFirstHeadShot"), "Boolean")
	(c).fields["m_bSeenEditorTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenEditorTutorial"), "Boolean")
	(c).fields["m_bSeenApplyTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenApplyTutorial"), "Boolean")
	(c).fields["m_bSeenLoadCampaignHint"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenLoadCampaignHint"), "Boolean")
	(c).fields["m_bSeenStoryCampaignHint"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenStoryCampaignHint"), "Boolean")
	(c).fields["m_bSeenChallengeCampaignHint"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChallengeCampaignHint"), "Boolean")
	(c).fields["m_bSeenExtraSwerveTutorial"] = R.coerce((R.truth(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraSwerveTutorial")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraSwerveTutorial"), null)) else false), "Boolean")
	(c).fields["m_bSeenExtraLocationTutorial"] = R.coerce((R.truth(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraLocationTutorial")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraLocationTutorial"), null)) else false), "Boolean")
	(c).fields["m_bSeenExtraExtraLocationTutorial"] = R.coerce((R.truth(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraExtraLocationTutorial")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenExtraExtraLocationTutorial"), null)) else false), "Boolean")
	(c).fields["m_bStoppedAtLocation"] = R.coerce((R.truth(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bStoppedAtLocation")) if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bStoppedAtLocation"), null)) else false), "Boolean")
	(c).fields["m_iPressSwerveCount"] = R.coerce((R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPressSwerveCount"), "int") if R.truth(R.binary("!=", R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPressSwerveCount"), null)) else 0), "int")
	(c).fields["m_bSeenAccelTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAccelTutorial"), "Boolean")
	(c).fields["m_bPressedAccel"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedAccel"), "Boolean")
	(c).fields["m_bPressedBrake"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedBrake"), "Boolean")
	(c).fields["m_bSeenTurnTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenTurnTutorial"), "Boolean")
	(c).fields["m_bPressedLeft"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedLeft"), "Boolean")
	(c).fields["m_bPressedRight"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedRight"), "Boolean")
	(c).fields["m_bSeenMouseTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMouseTutorial"), "Boolean")
	(c).fields["m_bPressedShoot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedShoot"), "Boolean")
	(c).fields["m_bSeenReloadTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenReloadTutorial"), "Boolean")
	(c).fields["m_bPressedReload"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedReload"), "Boolean")
	(c).fields["m_bSeenWeaponSelectionTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenWeaponSelectionTutorial"), "Boolean")
	(c).fields["m_bPressedWeaponSelection"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedWeaponSelection"), "Boolean")
	(c).fields["m_bSeenWeaponCycleTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenWeaponCycleTutorial"), "Boolean")
	(c).fields["m_bPressedWeaponCycle"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedWeaponCycle"), "Boolean")
	(c).fields["m_bSeenSwerveTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenSwerveTutorial"), "Boolean")
	(c).fields["m_bPressedSwerve"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedSwerve"), "Boolean")
	(c).fields["m_bSeenHornTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenHornTutorial"), "Boolean")
	(c).fields["m_bPressedHorn"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedHorn"), "Boolean")
	(c).fields["m_bSeenMountedWeaponTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMountedWeaponTutorial"), "Boolean")
	(c).fields["m_bPressedMountedWeapon"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedMountedWeapon"), "Boolean")
	(c).fields["m_bSeenThirdWeaponTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenThirdWeaponTutorial"), "Boolean")
	(c).fields["m_bPressedThirdWeapon"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedThirdWeapon"), "Boolean")
	(c).fields["m_bSeenFourthWeaponTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenFourthWeaponTutorial"), "Boolean")
	(c).fields["m_bPressedFourthWeapon"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedFourthWeapon"), "Boolean")
	(c).fields["m_bSeenInteractTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenInteractTutorial"), "Boolean")
	(c).fields["m_bPressedInteract"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedInteract"), "Boolean")
	(c).fields["m_bSeenDropCivTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenDropCivTutorial"), "Boolean")
	(c).fields["m_iSeenSideGrappleDriverTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSeenSideGrappleDriverTutorial"), "int")
	(c).fields["m_iSeenSideGrappleGunnerTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSeenSideGrappleGunnerTutorial"), "int")
	(c).fields["m_bSeenLocationTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenLocationTutorial"), "Boolean")
	(c).fields["m_bSeenMedTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenMedTutorial"), "Boolean")
	(c).fields["m_bSeenChopperTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenChopperTutorial"), "Boolean")
	(c).fields["m_bSeenSwitchDriverTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenSwitchDriverTutorial"), "Boolean")
	(c).fields["m_bSeenUpgradeSystemTutorial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenUpgradeSystemTutorial"), "Boolean")
	(c).fields["m_bPressedSwitchDriver"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bPressedSwitchDriver"), "Boolean")
	(c).fields["m_SurvivalItems"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "CopyArray", [R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItems"), (c).fields.get("m_SurvivalItems")])
	(c).fields["m_SurvivalItemsSeen"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "CopyArray", [R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_SurvivalItemsSeen"), (c).fields.get("m_SurvivalItemsSeen")])
	(c).fields["m_SurvivalItemsHash"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "FillSurvivalItemsHash", [])
	(c).fields["m_iNbZombieSplatterHits"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbZombieSplatterHits"), "int")
	(c).fields["m_iNbKilledCivilians"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbKilledCivilians"), "int")
	(c).fields["m_iNbDodgedBombing"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbDodgedBombing"), "int")
	(c).fields["m_bKilledZombieMale"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMale"), "Boolean")
	(c).fields["m_bKilledZombieFemale"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieFemale"), "Boolean")
	(c).fields["m_bKilledZombieMaleNew"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMaleNew"), "Boolean")
	(c).fields["m_bKilledZombieFemaleNew"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieFemaleNew"), "Boolean")
	(c).fields["m_bKilledZombieHard"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieHard"), "Boolean")
	(c).fields["m_bKilledZombieSoldier"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieSoldier"), "Boolean")
	(c).fields["m_bKilledZombieMutant"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieMutant"), "Boolean")
	(c).fields["m_bKilledZombieAlpha"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieAlpha"), "Boolean")
	(c).fields["m_bKilledZombieGrub"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledZombieGrub"), "Boolean")
	(c).fields["m_bKilledSoldier"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bKilledSoldier"), "Boolean")
	(c).fields["m_bSeenAreaResidential"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaResidential"), "Boolean")
	(c).fields["m_bSeenAreaTown"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaTown"), "Boolean")
	(c).fields["m_bSeenAreaIndustrial"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaIndustrial"), "Boolean")
	(c).fields["m_bSeenAreaPark"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaPark"), "Boolean")
	(c).fields["m_bSeenAreaAlleyway"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaAlleyway"), "Boolean")
	(c).fields["m_bSeenAreaHighway"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaHighway"), "Boolean")
	(c).fields["m_bSeenAreaCemetery"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bSeenAreaCemetery"), "Boolean")
	(c).fields["m_iCivsInCar"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCivsInCar"), "int")
	(c).fields["m_bCivIsMale1"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale1"), "Boolean")
	(c).fields["m_bCivIsMale2"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale2"), "Boolean")
	(c).fields["m_bCivIsMale3"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale3"), "Boolean")
	(c).fields["m_bCivIsMale4"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale4"), "Boolean")
	(c).fields["m_bCivIsMale5"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_bCivIsMale5"), "Boolean")
	(c).fields["m_fTotalDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fTotalDistance"), "Number")
	(c).fields["m_iZombiesShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iZombiesShot"), "int")
	(c).fields["m_iZombiesHit"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iZombiesHit"), "int")
	(c).fields["m_iMutantsKilled"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMutantsKilled"), "int")
	(c).fields["m_iBulletsShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iBulletsShot"), "int")
	(c).fields["m_iRocketsShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRocketsShot"), "int")
	(c).fields["m_iCarsExploded"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCarsExploded"), "int")
	(c).fields["m_iCiviliansSaved"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCiviliansSaved"), "int")
	(c).fields["m_iCiviliansTaken"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCiviliansTaken"), "int")
	(c).fields["m_iRPEarned"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iRPEarned"), "int")
	(c).fields["m_iSuccessfulStops"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSuccessfulStops"), "int")
	(c).fields["m_iHeadshots"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iHeadshots"), "int")
	(c).fields["m_iMinesShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iMinesShot"), "int")
	(c).fields["m_iFuelTruckShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iFuelTruckShot"), "int")
	(c).fields["m_iPropertyDamage"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iPropertyDamage"), "int")
	(c).fields["m_iTotalDeaths"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTotalDeaths"), "int")
	(c).fields["m_iDeathsByZombie"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByZombie"), "int")
	(c).fields["m_iDeathsByExplosion"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByExplosion"), "int")
	(c).fields["m_iDeathsByGunShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iDeathsByGunShot"), "int")
	(c).fields["m_iCollateralKills"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCollateralKills"), "int")
	(c).fields["m_iFiresPutOut"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iFiresPutOut"), "int")
	(c).fields["m_iTiresBlown"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTiresBlown"), "int")
	(c).fields["m_iTotalClingers"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iTotalClingers"), "int")
	(c).fields["m_iClingersShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iClingersShot"), "int")
	(c).fields["m_iClingersShakenOff"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iClingersShakenOff"), "int")
	(c).fields["m_fDianeDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fDianeDistance"), "Number")
	(c).fields["m_fCochetaDistance"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_fCochetaDistance"), "Number")
	(c).fields["m_iSoldiersHit"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSoldiersHit"), "int")
	(c).fields["m_iSoldiersShot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iSoldiersShot"), "int")
	(c).fields["m_iCarsBlownUpByMountedWeapon"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iCarsBlownUpByMountedWeapon"), "int")
	(c).fields["m_iNbSlowZombieKills"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_gameSaveData"), "data"), "m_iNbSlowZombieKills"), "int")
	return null

static func f_UnlockSurvivalItem(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_SurvivalItemsHash"), v_iItem), null)):
		pass
		R.set_value((c).fields.get("m_SurvivalItemsHash"), v_iItem, 1, "=")
		R.invoke(R.get_value((c).fields.get("m_SurvivalItems"), "push"), [v_iItem])
		R.invoke(R.get_value((c).fields.get("m_SurvivalItemsSeen"), "push"), [false])
	return null

static func f_SeeSurvivalItem(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SurvivalItems"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_SurvivalItems"), v_i), v_iItem)):
			pass
			R.set_value((c).fields.get("m_SurvivalItemsSeen"), v_i, true, "=")
			break
		v_i = R.signed32(v_i + 1)
	R.set_value((c).fields.get("m_SurvivalItemsHash"), v_iItem, 2, "=")
	return null

static func f_IsSurvivalItemUnlocked(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return R.binary("!=", R.get_value((c).fields.get("m_SurvivalItemsHash"), v_iItem), null)
	return null

static func f_IsSurvivalItemSeen(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return R.binary("==", R.get_value((c).fields.get("m_SurvivalItemsHash"), v_iItem), 2)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Instance", null, "=")
	R.set_value(c, "kSaveDataName", "RoadOfTheDead2_Beta1", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_gameSaveData"] = R.coerce(null, "SharedObject")
	(c).fields["m_iRP"] = float(NAN)
	(c).fields["m_bIsAwareOfStoryMode"] = false
	(c).fields["m_bStoryModeFinished"] = false
	(c).fields["m_bMutantLevelFinished"] = false
	(c).fields["m_bJohnEndingSeen"] = false
	(c).fields["m_bSeenJohnCarNotice"] = false
	(c).fields["m_bSeenMutantModeNotice"] = false
	(c).fields["m_bSeenChallengeModeNotice"] = false
	(c).fields["m_iStoryLevel"] = R.coerce(0, "int")
	(c).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	(c).fields["m_fStoryProgress"] = float(NAN)
	(c).fields["m_fBestDeadOnTimeDistance"] = float(NAN)
	(c).fields["m_fBestSurvivalDistance"] = float(NAN)
	(c).fields["m_fBestMilitaryDistance"] = float(NAN)
	(c).fields["m_fBestMutantDistance"] = float(NAN)
	(c).fields["m_iBestChopperRescueRescues"] = R.coerce(0, "int")
	(c).fields["m_iBestHitCombo"] = R.coerce(0, "int")
	(c).fields["m_CochetaPistol"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_CochetaMP5"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_CochetaSPAS12"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_CochetaM60"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_DianePistol"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_DianeShotgun"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_DianeMAC11"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_DianeM16"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_RocketLauncher"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_MountedMG"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_CustomRocketLauncher"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_CustomMountedMG"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_bSavedAmmo"] = false
	(c).fields["m_iDianeDrivingLevel"] = R.coerce(0, "int")
	(c).fields["m_iCochetaDrivingLevel"] = R.coerce(0, "int")
	(c).fields["m_iDianeDrivingPoints"] = float(NAN)
	(c).fields["m_iCochetaDrivingPoints"] = float(NAN)
	(c).fields["m_iDianeToughnessLevel"] = R.coerce(0, "int")
	(c).fields["m_iCochetaToughnessLevel"] = R.coerce(0, "int")
	(c).fields["m_iDianeToughnessPoints"] = float(NAN)
	(c).fields["m_iCochetaToughnessPoints"] = float(NAN)
	(c).fields["m_iTiresLevel"] = R.coerce(0, "int")
	(c).fields["m_fNbBlownTires"] = float(NAN)
	(c).fields["m_fBodyHP"] = float(NAN)
	(c).fields["m_iBumperLevel"] = R.coerce(0, "int")
	(c).fields["m_fBumperHP"] = float(NAN)
	(c).fields["m_fBumperAddonHP"] = float(NAN)
	(c).fields["m_iEngineLevel"] = R.coerce(0, "int")
	(c).fields["m_iMedShields"] = R.coerce(0, "int")
	(c).fields["m_iMedHeals"] = R.coerce(0, "int")
	(c).fields["m_iChopperSupportLevel"] = R.coerce(0, "int")
	(c).fields["m_iAmmoPickupLevel"] = R.coerce(0, "int")
	(c).fields["m_iLowerCostLevel"] = R.coerce(0, "int")
	(c).fields["m_iDriverSwitchLevel"] = R.coerce(0, "int")
	(c).fields["m_iTaskSpeedLevel"] = R.coerce(0, "int")
	(c).fields["m_iLevelUpLevel"] = R.coerce(0, "int")
	(c).fields["m_completedAchievements"] = R.coerce(null, "Array")
	(c).fields["m_iLeftKey"] = R.coerce(0, "int")
	(c).fields["m_iRightKey"] = R.coerce(0, "int")
	(c).fields["m_iAccelKey"] = R.coerce(0, "int")
	(c).fields["m_iBrakeKey"] = R.coerce(0, "int")
	(c).fields["m_iHandbrakeKey"] = R.coerce(0, "int")
	(c).fields["m_iHornKey"] = R.coerce(0, "int")
	(c).fields["m_iSwitchDriverKey"] = R.coerce(0, "int")
	(c).fields["m_iReloadKey"] = R.coerce(0, "int")
	(c).fields["m_iPrevWeaponKey"] = R.coerce(0, "int")
	(c).fields["m_iNextWeaponKey"] = R.coerce(0, "int")
	(c).fields["m_iPauseKey"] = R.coerce(0, "int")
	(c).fields["m_bMusic"] = false
	(c).fields["m_bSound"] = false
	(c).fields["m_iQuality"] = R.coerce(0, "int")
	(c).fields["m_bZombieTints"] = false
	(c).fields["m_bBeenInGarage"] = false
	(c).fields["m_iStoryTutorialIndex"] = R.coerce(0, "int")
	(c).fields["m_bShowWeaponStatsButton"] = false
	(c).fields["m_bUsingHummer"] = false
	(c).fields["m_bSeenUpgradeTabs"] = false
	(c).fields["m_bSeenStorageNotice"] = false
	(c).fields["m_bDidFirstHeadShot"] = false
	(c).fields["m_bSeenEditorTutorial"] = false
	(c).fields["m_bSeenApplyTutorial"] = false
	(c).fields["m_bSeenLoadCampaignHint"] = false
	(c).fields["m_bSeenStoryCampaignHint"] = false
	(c).fields["m_bSeenChallengeCampaignHint"] = false
	(c).fields["m_bSeenExtraSwerveTutorial"] = false
	(c).fields["m_bSeenExtraLocationTutorial"] = false
	(c).fields["m_bSeenExtraExtraLocationTutorial"] = false
	(c).fields["m_bStoppedAtLocation"] = false
	(c).fields["m_iPressSwerveCount"] = R.coerce(0, "int")
	(c).fields["m_bSeenAccelTutorial"] = false
	(c).fields["m_bPressedAccel"] = false
	(c).fields["m_bPressedBrake"] = false
	(c).fields["m_bSeenTurnTutorial"] = false
	(c).fields["m_bPressedLeft"] = false
	(c).fields["m_bPressedRight"] = false
	(c).fields["m_bSeenMouseTutorial"] = false
	(c).fields["m_bPressedShoot"] = false
	(c).fields["m_bSeenReloadTutorial"] = false
	(c).fields["m_bPressedReload"] = false
	(c).fields["m_bSeenWeaponSelectionTutorial"] = false
	(c).fields["m_bPressedWeaponSelection"] = false
	(c).fields["m_bSeenWeaponCycleTutorial"] = false
	(c).fields["m_bPressedWeaponCycle"] = false
	(c).fields["m_bSeenSwerveTutorial"] = false
	(c).fields["m_bPressedSwerve"] = false
	(c).fields["m_bSeenHornTutorial"] = false
	(c).fields["m_bPressedHorn"] = false
	(c).fields["m_bSeenMountedWeaponTutorial"] = false
	(c).fields["m_bPressedMountedWeapon"] = false
	(c).fields["m_bSeenThirdWeaponTutorial"] = false
	(c).fields["m_bPressedThirdWeapon"] = false
	(c).fields["m_bSeenFourthWeaponTutorial"] = false
	(c).fields["m_bPressedFourthWeapon"] = false
	(c).fields["m_bSeenInteractTutorial"] = false
	(c).fields["m_bPressedInteract"] = false
	(c).fields["m_bSeenDropCivTutorial"] = false
	(c).fields["m_iSeenSideGrappleDriverTutorial"] = R.coerce(0, "int")
	(c).fields["m_iSeenSideGrappleGunnerTutorial"] = R.coerce(0, "int")
	(c).fields["m_bSeenLocationTutorial"] = false
	(c).fields["m_bSeenMedTutorial"] = false
	(c).fields["m_bSeenChopperTutorial"] = false
	(c).fields["m_bSeenSwitchDriverTutorial"] = false
	(c).fields["m_bSeenUpgradeSystemTutorial"] = false
	(c).fields["m_bPressedSwitchDriver"] = false
	(c).fields["m_SurvivalItems"] = R.coerce(null, "Array")
	(c).fields["m_SurvivalItemsSeen"] = R.coerce(null, "Array")
	(c).fields["m_SurvivalItemsHash"] = R.coerce(null, "Array")
	(c).fields["m_iNbZombieSplatterHits"] = R.coerce(0, "int")
	(c).fields["m_iNbKilledCivilians"] = R.coerce(0, "int")
	(c).fields["m_iNbDodgedBombing"] = R.coerce(0, "int")
	(c).fields["m_bKilledZombieMale"] = false
	(c).fields["m_bKilledZombieFemale"] = false
	(c).fields["m_bKilledZombieMaleNew"] = false
	(c).fields["m_bKilledZombieFemaleNew"] = false
	(c).fields["m_bKilledZombieHard"] = false
	(c).fields["m_bKilledZombieSoldier"] = false
	(c).fields["m_bKilledZombieMutant"] = false
	(c).fields["m_bKilledZombieAlpha"] = false
	(c).fields["m_bKilledZombieGrub"] = false
	(c).fields["m_bKilledSoldier"] = false
	(c).fields["m_bSeenAreaResidential"] = false
	(c).fields["m_bSeenAreaTown"] = false
	(c).fields["m_bSeenAreaIndustrial"] = false
	(c).fields["m_bSeenAreaPark"] = false
	(c).fields["m_bSeenAreaAlleyway"] = false
	(c).fields["m_bSeenAreaHighway"] = false
	(c).fields["m_bSeenAreaCemetery"] = false
	(c).fields["m_iCivsInCar"] = R.coerce(0, "int")
	(c).fields["m_bCivIsMale1"] = false
	(c).fields["m_bCivIsMale2"] = false
	(c).fields["m_bCivIsMale3"] = false
	(c).fields["m_bCivIsMale4"] = false
	(c).fields["m_bCivIsMale5"] = false
	(c).fields["m_fTotalDistance"] = float(NAN)
	(c).fields["m_iZombiesShot"] = R.coerce(0, "int")
	(c).fields["m_iZombiesHit"] = R.coerce(0, "int")
	(c).fields["m_iMutantsKilled"] = R.coerce(0, "int")
	(c).fields["m_iBulletsShot"] = R.coerce(0, "int")
	(c).fields["m_iRocketsShot"] = R.coerce(0, "int")
	(c).fields["m_iCarsExploded"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansSaved"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansTaken"] = R.coerce(0, "int")
	(c).fields["m_iRPEarned"] = R.coerce(0, "int")
	(c).fields["m_iSuccessfulStops"] = R.coerce(0, "int")
	(c).fields["m_iHeadshots"] = R.coerce(0, "int")
	(c).fields["m_iMinesShot"] = R.coerce(0, "int")
	(c).fields["m_iFuelTruckShot"] = R.coerce(0, "int")
	(c).fields["m_iPropertyDamage"] = R.coerce(0, "int")
	(c).fields["m_iTotalDeaths"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByZombie"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByExplosion"] = R.coerce(0, "int")
	(c).fields["m_iDeathsByGunShot"] = R.coerce(0, "int")
	(c).fields["m_iCollateralKills"] = R.coerce(0, "int")
	(c).fields["m_iFiresPutOut"] = R.coerce(0, "int")
	(c).fields["m_iTiresBlown"] = R.coerce(0, "int")
	(c).fields["m_iTotalClingers"] = R.coerce(0, "int")
	(c).fields["m_iClingersShot"] = R.coerce(0, "int")
	(c).fields["m_iClingersShakenOff"] = R.coerce(0, "int")
	(c).fields["m_fDianeDistance"] = float(NAN)
	(c).fields["m_fCochetaDistance"] = float(NAN)
	(c).fields["m_iSoldiersHit"] = R.coerce(0, "int")
	(c).fields["m_iSoldiersShot"] = R.coerce(0, "int")
	(c).fields["m_iCarsBlownUpByMountedWeapon"] = R.coerce(0, "int")
	(c).fields["m_iNbSlowZombieKills"] = R.coerce(0, "int")
	return null
