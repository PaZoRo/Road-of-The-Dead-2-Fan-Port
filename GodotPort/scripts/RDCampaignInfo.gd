extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCampaignInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCampaignInfo"), [])
	R.invoke(R.get_value((c).fields.get("m_Groups"), "push"), [R.construct(R.klass("RDAreaGroup"), [])])
	return null

static func f_GetTypeName(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return ("Story" if R.truth((float(v_iType) == float(R.static_value("RDCampaignInfo", "Type_Story")))) else "Challenge")
	return null

static func f_GetGoalName(c: Variant, a: Array) -> Variant:
	var v_iGoal: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iGoal) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
		pass
		return "Distance Reached"
	if R.truth((float(v_iGoal) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
		pass
		return "Zombies Killed"
	if R.truth((float(v_iGoal) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
		pass
		return "Civilians Killed"
	if R.truth((float(v_iGoal) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
		pass
		return "Civilians Saved"
	return ""
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Unset", R.unary("-", 1), "=")
	R.set_value(c, "Type_Story", 0, "=")
	R.set_value(c, "Type_Challenge", 1, "=")
	R.set_value(c, "Goal_DistanceReached", 0, "=")
	R.set_value(c, "Goal_ZombiesKilled", 1, "=")
	R.set_value(c, "Goal_CiviliansKilled", 2, "=")
	R.set_value(c, "Goal_CiviliansSaved", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iType"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_Groups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iGoal"] = R.coerce(0, "int")
	(c).fields["m_iGoalTarget"] = R.coerce(1000, "int")
	(c).fields["m_bTiresBlown"] = false
	(c).fields["m_bAirStrikes"] = false
	(c).fields["m_bNoWeapons"] = false
	(c).fields["m_bNoAmmoPoints"] = false
	(c).fields["m_bNoReplenish"] = false
	(c).fields["m_bInfiniteAmmo"] = false
	(c).fields["m_bInvincibleHellfire"] = false
	(c).fields["m_fBounceFactor"] = float(1)
	(c).fields["m_fPlayerSpeedFactor"] = float(1)
	(c).fields["m_bMountedMG"] = false
	(c).fields["m_bMountedRocketLauncher"] = false
	(c).fields["m_bInfiniteMountedWeapon"] = false
	(c).fields["m_bNoDriverSwitch"] = false
	(c).fields["m_bArcadeAmmoPickup"] = false
	(c).fields["m_bNoSteering"] = false
	(c).fields["m_bNoBraking"] = false
	(c).fields["m_bNoSwerving"] = false
	(c).fields["m_fPlayerVehicleHPFactor"] = float(1)
	(c).fields["m_fPlayerBodyHPFactor"] = float(1)
	(c).fields["m_fZombieSpeedFactor"] = float(1)
	(c).fields["m_fZombieHPFactor"] = float(1)
	(c).fields["m_fOilSlipperinessFactor"] = float(1)
	(c).fields["m_fImpactSpeedLossFactor"] = float(1)
	(c).fields["m_fVehicleHPFactor"] = float(1)
	(c).fields["m_bExplodingZombies"] = false
	(c).fields["m_bAlwaysCling"] = false
	(c).fields["m_bFog"] = false
	(c).fields["m_bNoBackgroundCity"] = false
	(c).fields["m_bNoChopperSupport"] = false
	(c).fields["m_fStartingTime"] = float(0)
	(c).fields["m_fZombieShotDownTime"] = float(0)
	(c).fields["m_fZombieHitTime"] = float(0)
	(c).fields["m_fMutantKilledTime"] = float(0)
	(c).fields["m_fClingerOffTime"] = float(0)
	(c).fields["m_fFeedersHitTime"] = float(0)
	(c).fields["m_fCivilianShotDownTime"] = float(0)
	(c).fields["m_fCivilianHitTime"] = float(0)
	(c).fields["m_fSoldierShotDownTime"] = float(0)
	(c).fields["m_fSoldierHitTime"] = float(0)
	(c).fields["m_fSoldierClingerOffTime"] = float(0)
	(c).fields["m_fHellfireDefeatedTime"] = float(0)
	(c).fields["m_iDifficultyLevelLength"] = R.coerce(0, "int")
	(c).fields["m_fBasePatternRatio"] = float(1)
	(c).fields["m_fAdditivePatternRatio"] = float(0)
	(c).fields["m_fBaseSpawnRate"] = float(0)
	(c).fields["m_fAdditiveSpawnRate"] = float(0)
	(c).fields["m_iSpikeSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iBombSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iOilLevel"] = R.coerce(0, "int")
	(c).fields["m_iSpikeLevel"] = R.coerce(0, "int")
	(c).fields["m_iMineLevel"] = R.coerce(0, "int")
	(c).fields["m_iExplodingCarLevel"] = R.coerce(0, "int")
	(c).fields["m_iGrubLevel"] = R.coerce(0, "int")
	(c).fields["m_iZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iBaseSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_fBaseHellfireDelay"] = float(0)
	(c).fields["m_fAdditiveHellfireDelay"] = float(0)
	(c).fields["m_fBaseHellfireLevel"] = float(1)
	(c).fields["m_fAdditiveHellfireLevel"] = float(1)
	(c).fields["m_fBaseJetDelay"] = float(0)
	(c).fields["m_fAdditiveJetDelay"] = float(0)
	(c).fields["m_fBaseJetDrops"] = float(1)
	(c).fields["m_fAdditiveJetDrops"] = float(1)
	(c).fields["m_fBaseMutantDelay"] = float(0)
	(c).fields["m_fAdditiveMutantDelay"] = float(0)
	(c).fields["m_fBaseMutantCount"] = float(1)
	(c).fields["m_fAdditiveMutantCount"] = float(1)
	(c).fields["m_bRandomizeSpawningValues"] = false
	(c).fields["m_bNoSoldierZombie"] = false
	(c).fields["m_bAllSoldierZombie"] = false
	(c).fields["m_bFUBARMode"] = false
	(c).fields["m_fDialogOffset"] = float(1)
	(c).fields["m_DialogTexts"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_DialogCues"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null
