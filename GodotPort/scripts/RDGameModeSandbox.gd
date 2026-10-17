extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeSandbox(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeSandbox"), [v_theGame])
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
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "BeginGameMode"), [])
	R.call_member(c, "LoadExternalPattern", [])
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	R.call_member(c, "UpdatePatterns", [])
	return null

static func f_UpdatePatterns(c: Variant, a: Array) -> Variant:
	var v_pattern: Variant = null
	var v_fSpawnRatio: Variant = NAN
	var v_fPatternSpace: Variant = NAN
	v_pattern = R.coerce(null, "RDLevelPattern")
	v_fSpawnRatio = float(NAN)
	v_fPatternSpace = float(NAN)
	if R.truth(R.binary("==", R.call_member((c).fields.get("m_Patterns"), "GetTotalNbValues", []), 0)):
		pass
		return null
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextPatternSpawnPosition")))):
		pass
		v_pattern = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Patterns"), "GetRandomValue", []), R.klass("RDLevelPattern")), "RDLevelPattern")
		v_fSpawnRatio = float(1)
		v_fPatternSpace = R.coerce(R.call_member(v_pattern, "Load", [c, 999, 1, c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
		c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
	return null

static func f_LoadExternalPattern(c: Variant, a: Array) -> Variant:
	var v_mLoader: Variant = null
	var v_mRequest: Variant = null
	v_mLoader = R.coerce(R.construct(R.resolve(c, "Loader", "RDGameModeSandbox"), []), "Loader")
	v_mRequest = R.coerce(R.construct(R.resolve(c, "URLRequest", "RDGameModeSandbox"), ["LevelPatternEditor.swf"]), "URLRequest")
	R.invoke(R.get_value(R.get_value(v_mLoader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onCompleteHandler"), false, 0, true])
	R.invoke(R.get_value(v_mLoader, "load"), [v_mRequest])
	return null

static func f_onCompleteHandler(c: Variant, a: Array) -> Variant:
	var v_pattern: Variant = null
	var v_i: Variant = 0
	var v_loadEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_pattern = R.coerce(null, "RDLevelPattern")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "numChildren"))):
		pass
		v_pattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomNew"), [null, R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "getChildAt"), [v_i]), R.klass("MovieClip"))]), "RDLevelPattern")
		R.call_member((c).fields.get("m_Patterns"), "AddValue", [v_pattern])
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowStats"] = true
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Patterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	return null
