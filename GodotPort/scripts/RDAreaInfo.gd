extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDAreaInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDAreaInfo"), [])
	return null

static func f_GetTypeName(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_Normal")))):
		pass
		return "No Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
		pass
		return "Drive Away Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingBlackScreen")))):
		pass
		return "Black Screen Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingRedScreen")))):
		pass
		return "Red Screen Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingWhiteScreen")))):
		pass
		return "White Screen Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingNukeBlast")))):
		pass
		return "Nuke Blast Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
		pass
		return "Chopper Escape Ending"
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingHighwayTransition")))):
		pass
		return "Highway Transition Ending"
	return ""
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Normal", 0, "=")
	R.set_value(c, "Type_EndingDriveAway", 1, "=")
	R.set_value(c, "Type_EndingBlackScreen", 2, "=")
	R.set_value(c, "Type_EndingRedScreen", 3, "=")
	R.set_value(c, "Type_EndingWhiteScreen", 4, "=")
	R.set_value(c, "Type_EndingNukeBlast", 5, "=")
	R.set_value(c, "Type_EndingChopperEscape", 6, "=")
	R.set_value(c, "Type_EndingHighwayTransition", 7, "=")
	R.set_value(c, "Type_MissingEnding", 1000, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce("", "String")
	(c).fields["m_szDescription"] = R.coerce("", "String")
	(c).fields["m_iID"] = R.coerce(0, "int")
	(c).fields["m_szAuthorName"] = R.coerce("", "String")
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_Icon"] = R.coerce(null, "ByteArray")
	(c).fields["m_Data"] = R.coerce(null, "ByteArray")
	(c).fields["m_Patterns"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_szAreaName"] = R.coerce("", "String")
	(c).fields["m_iAreaLength"] = R.coerce(20, "int")
	(c).fields["m_bAllowFlip"] = true
	(c).fields["m_fDialogOffset"] = float(1)
	(c).fields["m_DialogTexts"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_DialogCues"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_bOverrideSpawning"] = false
	(c).fields["m_fHellfireDelay"] = float(0)
	(c).fields["m_iHellfireLevel"] = R.coerce(1, "int")
	(c).fields["m_fJetDelay"] = float(0)
	(c).fields["m_iJetDrops"] = R.coerce(1, "int")
	(c).fields["m_fMutantDelay"] = float(0)
	(c).fields["m_iMutantCount"] = R.coerce(1, "int")
	(c).fields["m_bRandomizeSpawningValues"] = false
	(c).fields["m_bNoSoldierZombie"] = false
	(c).fields["m_bAllSoldierZombie"] = false
	(c).fields["m_bFUBARMode"] = false
	(c).fields["m_fPlayerSpeedFactor"] = float(1)
	(c).fields["m_bFullSpeedMode"] = false
	(c).fields["m_bLavaMode"] = false
	(c).fields["m_bLavaInstantKill"] = false
	(c).fields["m_bFog"] = false
	(c).fields["m_fForcedStopDuration"] = float(0)
	(c).fields["m_bOverrideDifficulty"] = false
	(c).fields["m_fPatternRatio"] = float(1)
	(c).fields["m_fSpawnRate"] = float(0)
	(c).fields["m_bSpikeSoldier"] = false
	(c).fields["m_bBombSoldier"] = false
	(c).fields["m_bOil"] = false
	(c).fields["m_bSpike"] = false
	(c).fields["m_bMine"] = false
	(c).fields["m_bExplodingCar"] = false
	(c).fields["m_bGrub"] = false
	(c).fields["m_bZombie"] = false
	(c).fields["m_bBaseSoldier"] = false
	(c).fields["m_PatternsIndices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_RandomPatternsIndices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null
