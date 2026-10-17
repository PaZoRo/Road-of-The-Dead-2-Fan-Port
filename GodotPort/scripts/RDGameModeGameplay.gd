extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeGameplay(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeGameplay"), [v_theGame])
	(c).fields["m_DistanceScreen"] = R.coerce(R.construct(R.klass("MC_DistanceStatsScreen"), []), "MC_DistanceStatsScreen")
	c.fields["m_Camera"] = R.coerce(R.construct(R.klass("RDCamera"), []), "RDCamera")
	(c).fields["m_StartEngineSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EngineStart"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_UpgradeScreen"] = R.coerce(R.construct(R.klass("RDUpgradeScreen"), [c]), "RDUpgradeScreen")
	(c).fields["m_SpawnManager"] = R.coerce(R.construct(R.klass("RDSpawnManager"), [c]), "RDSpawnManager")
	(c).fields["m_MutantEntries"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MutantEntries"), "AddValue", [R.static_value("RDGameModeGameplay", "MutantAttack_Front")])
	R.call_member((c).fields.get("m_MutantEntries"), "AddValue", [R.static_value("RDGameModeGameplay", "MutantAttack_Back")])
	R.call_member((c).fields.get("m_MutantEntries"), "AddValue", [R.static_value("RDGameModeGameplay", "MutantAttack_Side")])
	(c).fields["m_JetDelayMins"] = R.coerce(R.construct(R.klass("Array"), [65, 60, 55, 55, 50, 50, 45, 45, 40, 40]), "Array")
	(c).fields["m_JetDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [40, 40, 40, 40, 40, 40, 40, 40, 40, 40]), "Array")
	(c).fields["m_HelicopterDelayMins"] = R.coerce(R.construct(R.klass("Array"), [80, 75, 75, 70, 70, 70, 65, 65, 60, 60]), "Array")
	(c).fields["m_HelicopterDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [20, 20, 20, 20, 20, 20, 20, 20, 20, 20]), "Array")
	(c).fields["m_MutantDelayMins"] = R.coerce(R.construct(R.klass("Array"), [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 45, 45, 45, 40, 40, 40, 40, 35, 35, 35, 35, 30, 30, 30, 30]), "Array")
	(c).fields["m_MutantDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25]), "Array")
	(c).fields["m_MutantCounts"] = R.coerce(R.construct(R.klass("Array"), [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4]), "Array")
	(c).fields["m_iStationarySoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iAlignSoldierLevel"] = R.coerce(1, "int")
	(c).fields["m_iSpikeSoldierLevel"] = R.coerce(2, "int")
	(c).fields["m_iHiddenSoldierLevel"] = R.coerce(3, "int")
	(c).fields["m_iBombSoldierLevel"] = R.coerce(4, "int")
	(c).fields["m_iHardZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iVeryHardZombieLevel"] = R.coerce(4, "int")
	(c).fields["m_iFeedersLevel"] = R.coerce(1, "int")
	(c).fields["m_iSpikesLevel"] = R.coerce(4, "int")
	(c).fields["m_iNewMaleZombieLevel"] = R.coerce(2, "int")
	(c).fields["m_iNewFemaleZombieLevel"] = R.coerce(2, "int")
	(c).fields["m_iSoldierZombieLevel"] = R.coerce(3, "int")
	(c).fields["m_iJetLevel"] = R.coerce(6, "int")
	(c).fields["m_iHelicopterLevel"] = R.coerce(3, "int")
	(c).fields["m_iHelicopterMissileLevel"] = R.coerce(7, "int")
	(c).fields["m_iExplodingCarLevel"] = R.coerce(4, "int")
	(c).fields["m_iMineLevel"] = R.coerce(4, "int")
	(c).fields["m_iMotionMineLevel"] = R.coerce(5, "int")
	(c).fields["m_iFuelTruckLevel"] = R.coerce(0, "int")
	(c).fields["m_iGrubLevel"] = R.coerce(1, "int")
	(c).fields["m_fSpawnRatioBaseNormal"] = float(0.5)
	(c).fields["m_fSpawnRatioIncrementNormal"] = float(0.02)
	(c).fields["m_fSpawnRatioBaseHard"] = float(0.6)
	(c).fields["m_fSpawnRatioIncrementHard"] = float(0.04)
	return null

static func f_SetPlayer(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	c.fields["m_Player"] = R.coerce(v_player, "RDPlayer")
	(c.fields.get("m_Camera")).fields["m_Player"] = R.coerce(v_player, "RDPlayer")
	return null

static func f_InitPatterns(c: Variant, a: Array) -> Variant:
	(c).fields["m_LevelResidentialPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential1")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential2")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential3")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential4")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential5")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential6")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential7")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential8")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential9")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential10")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential11")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential12")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential13")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential14")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential15")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential16")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential19")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential20")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential21")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential22")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential23")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential24")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential25")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential26")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential27")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential28")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential29")])])
	R.call_member((c).fields.get("m_LevelResidentialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential30")])])
	(c).fields["m_LevelResidentialBlockedPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential1")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential2")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential3")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential4")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential5")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential6")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential7")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential8")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential9")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential10")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential11")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential12")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential13")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential14")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential15")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential16")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential17b")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential18b")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential19")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential20")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential21")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential22")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential23")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential24")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential25")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential26")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential27")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential28")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential29")])])
	R.call_member((c).fields.get("m_LevelResidentialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential30")])])
	(c).fields["m_LevelResidentialCheckpointPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential31checkpoint")])])
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential32checkpoint")])])
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential33checkpoint")])])
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential34checkpoint")])])
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential35checkpoint")])])
	R.call_member((c).fields.get("m_LevelResidentialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Residential36checkpoint")])])
	(c).fields["m_LevelTownPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town1")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town2")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town3")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town4")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town5")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town6")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town7")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town8")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town10")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town11")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town15")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town16")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town17")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town18")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town19")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town20")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town21")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town22")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town23")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town26")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town27")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town28")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town29")])])
	R.call_member((c).fields.get("m_LevelTownPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town30")])])
	(c).fields["m_LevelTownBlockedPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town1")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town2")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town3")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town4")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town5")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town6")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town7")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town8")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town9b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town10")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town11")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town12b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town13b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town14b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town15")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town16")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town17")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town18")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town19")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town20")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town21")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town22")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town23")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town24b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town25b")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town26")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town27")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town28")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town29")])])
	R.call_member((c).fields.get("m_LevelTownBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town30")])])
	(c).fields["m_LevelTownCheckpointPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town31checkpoint")])])
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town32checkpoint")])])
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town33checkpoint")])])
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town34checkpoint")])])
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town35checkpoint")])])
	R.call_member((c).fields.get("m_LevelTownCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Town36checkpoint")])])
	(c).fields["m_LevelIndustrialPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial1")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial2")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial3")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial4")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial5")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial6")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial7")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial8")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial9")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial10")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial11")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial12")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial14")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial15")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial16")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial17")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial18")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial19")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial20")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial21")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial22")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial23")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial24")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial25")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial26")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial27")])])
	R.call_member((c).fields.get("m_LevelIndustrialPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial28")])])
	(c).fields["m_LevelIndustrialBlockedPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial1")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial2")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial3")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial4")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial5")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial6")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial7")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial8")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial9")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial10")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial11")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial12")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial13b")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial14")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial15")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial16")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial17")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial18")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial19")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial20")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial21")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial22")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial23")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial24")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial25")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial26")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial27")])])
	R.call_member((c).fields.get("m_LevelIndustrialBlockedPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial28")])])
	(c).fields["m_LevelIndustrialCheckpointPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial29checkpoint")])])
	R.call_member((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial30checkpoint")])])
	R.call_member((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial31checkpoint")])])
	R.call_member((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial32checkpoint")])])
	R.call_member((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Industrial33checkpoint")])])
	(c).fields["m_LevelParkPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park1")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park2")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park3")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park4")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park5")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park6")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park7")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park8")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park9")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park10")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park12")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park13")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park14")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park15")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park16")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park17")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park18")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park19")])])
	R.call_member((c).fields.get("m_LevelParkPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Park20")])])
	(c).fields["m_LevelCemeteryPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary1")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary2")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary3")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary4")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary5")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary6")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary7")])])
	R.call_member((c).fields.get("m_LevelCemeteryPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Cemetary8")])])
	(c).fields["m_LevelParkingPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelParkingPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Parking")])])
	(c).fields["m_LevelChopperShootingPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelChopperShootingPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ChopperShooting")])])
	(c).fields["m_LevelAlleywayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway1")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway2")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway3")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway4")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway5")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway6")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway7")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway8")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway9")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway10")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway11")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway12")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway13")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway14")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway15")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway16")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway17")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway18")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway19")])])
	R.call_member((c).fields.get("m_LevelAlleywayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Alleyway20")])])
	(c).fields["m_LevelResidentialChurchPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialChurch1")])])
	R.call_member((c).fields.get("m_LevelResidentialChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialChurch2")])])
	R.call_member((c).fields.get("m_LevelResidentialChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialChurch3")])])
	R.call_member((c).fields.get("m_LevelResidentialChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialChurch4")])])
	(c).fields["m_LevelResidentialPoliceStationPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialPoliceStation1")])])
	R.call_member((c).fields.get("m_LevelResidentialPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialPoliceStation2")])])
	R.call_member((c).fields.get("m_LevelResidentialPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialPoliceStation3")])])
	R.call_member((c).fields.get("m_LevelResidentialPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialPoliceStation4")])])
	(c).fields["m_LevelTownChurchPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownChurch1")])])
	R.call_member((c).fields.get("m_LevelTownChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownChurch2")])])
	R.call_member((c).fields.get("m_LevelTownChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownChurch3")])])
	R.call_member((c).fields.get("m_LevelTownChurchPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownChurch4")])])
	(c).fields["m_LevelTownPoliceStationPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownPoliceStation1")])])
	R.call_member((c).fields.get("m_LevelTownPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownPoliceStation2")])])
	R.call_member((c).fields.get("m_LevelTownPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownPoliceStation3")])])
	R.call_member((c).fields.get("m_LevelTownPoliceStationPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownPoliceStation4")])])
	(c).fields["m_LevelResidentialWeaponsPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialWeapons1")])])
	R.call_member((c).fields.get("m_LevelResidentialWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialWeapons2")])])
	R.call_member((c).fields.get("m_LevelResidentialWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialWeapons3")])])
	(c).fields["m_LevelTownWeaponsPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownWeapons1")])])
	R.call_member((c).fields.get("m_LevelTownWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownWeapons2")])])
	R.call_member((c).fields.get("m_LevelTownWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownWeapons3")])])
	R.call_member((c).fields.get("m_LevelTownWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownWeapons4")])])
	(c).fields["m_LevelIndustrialWeaponsPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelIndustrialWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_IndustrialWeapons1")])])
	(c).fields["m_LevelParkWeaponsPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelParkWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ParkWeapons1")])])
	(c).fields["m_LevelCemeteryWeaponsPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelCemeteryWeaponsPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_CemeteryWeapons1")])])
	(c).fields["m_LevelResidentialGaragePatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelResidentialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialGarage1")])])
	R.call_member((c).fields.get("m_LevelResidentialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialGarage2")])])
	R.call_member((c).fields.get("m_LevelResidentialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialGarage3")])])
	R.call_member((c).fields.get("m_LevelResidentialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_ResidentialGarage4")])])
	(c).fields["m_LevelTownGaragePatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelTownGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownGarage1")])])
	R.call_member((c).fields.get("m_LevelTownGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownGarage2")])])
	R.call_member((c).fields.get("m_LevelTownGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownGarage3")])])
	R.call_member((c).fields.get("m_LevelTownGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_TownGarage4")])])
	(c).fields["m_LevelIndustrialGaragePatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelIndustrialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_IndustrialGarage1")])])
	R.call_member((c).fields.get("m_LevelIndustrialGaragePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_IndustrialGarage2")])])
	(c).fields["m_LevelRampPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelRampPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Ramp")])])
	R.call_member((c).fields.get("m_LevelRampPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Ramp2")])])
	(c).fields["m_LevelRampExitPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelRampExitPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_RampExit")])])
	(c).fields["m_LevelNormalHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general01")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general02")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general03")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general04")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general05")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general06")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general07")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general08")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general09")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general10")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general11")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general12")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general13")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general14")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general15")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general16")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general17")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general18")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general19")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general20")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general21")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general22")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general23")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general24")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general25")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general26")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general27")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general28")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general29")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general30")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general31")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general32")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general33")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general34")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general35")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general36")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general37")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general38")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general39")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general40")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general41")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general42")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general43")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general44")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general45")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general46")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general47")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general48")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general49")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general50")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general51")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general52")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general53")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general54")])])
	R.call_member((c).fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_general55")])])
	(c).fields["m_LevelHardHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_02medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_11medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_19medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_25medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_27hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_38hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_46medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_47medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_12hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_13hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_26hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_29medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_30medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_37medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_53medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_05hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_14hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_28hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_39hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_67medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_75hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_76medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_77hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_04hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_41hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_48hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_61medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_81hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_82medium")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_83hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_45hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_57hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_58hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_59hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_60hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_65hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_66hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_62hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_63hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_64hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_78hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_79hard")])])
	R.call_member((c).fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_80medium")])])
	(c).fields["m_LevelWeaponsHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelWeaponsHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_weapons01")])])
	(c).fields["m_LevelCheckpointHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_03hardcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_21easycheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_22mediumcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_23hardcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_35mediumcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_40hardcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_49easycheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_51mediumcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_54mediumcheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_55easycheckpoint")])])
	R.call_member((c).fields.get("m_LevelCheckpointHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_56hardcheckpoint")])])
	(c).fields["m_LevelJohnHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LevelJohnHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_john01")])])
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "Reset"), [])
	(c).fields["m_bShowStats"] = false
	(c).fields["m_bDoneShowingStats"] = false
	(c).fields["m_bShowDistance"] = false
	(c).fields["m_bDistanceScreenReady"] = false
	(c).fields["m_fDistanceScreenTimer"] = float(0)
	(c).fields["m_iComboPoints"] = R.coerce(0, "int")
	(c).fields["m_iBestHitCombo"] = R.coerce(0, "int")
	(c).fields["m_fStatsTimer"] = float(0)
	(c).fields["m_fComboTime"] = R.coerce(R.unary("-", 9999), "Number")
	(c).fields["m_iComboCount"] = R.coerce(0, "int")
	(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fHeadshotComboTime"] = R.coerce(R.unary("-", 9999), "Number")
	(c).fields["m_iHeadshotComboCount"] = R.coerce(0, "int")
	((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_iSpawnLevel"] = R.coerce(0, "int")
	(c).fields["m_fSpawnLevelStartPosition"] = float(0)
	(c).fields["m_fHighwayPerlinPos"] = float(0)
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		(c).fields["m_fNextPatternSpawnPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternInitialSpawnDistance"))))
		(c).fields["m_fNextHardPatternSpawnPosition"] = float((float((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingRandom"))))))
	else:
		pass
		(c).fields["m_fNextPatternSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
		(c).fields["m_fNextHardPatternSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_fNextYellowLineSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_fNextBuildingSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_fNextRoadSignSpawnPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "RoadSignInitialSpawnDistance"))))
	(c).fields["m_fSpecialPatternPosition"] = float((float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
	(c).fields["m_fCheckpointPatternPosition"] = float((float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
	(c).fields["m_fNextMotionMinesSpawnPosition"] = float((float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMax")) - float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMin"))))))))
	(c).fields["m_fLevelStartPosition"] = float(0)
	(c).fields["m_bSpawnChurch"] = false
	(c).fields["m_bSpawnPoliceStation"] = false
	(c).fields["m_bSpawnWeapons"] = false
	(c).fields["m_bSpawnGarage"] = false
	(c).fields["m_bSpawnRamp"] = false
	(c).fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	(c).fields["m_Helicopter"] = R.coerce(null, "RDHelicopter")
	(c).fields["m_fHelicopterTimer"] = float(0)
	(c).fields["m_fHelicopterDelay"] = R.coerce(R.call_member(c, "GetHelicopterDelay", []), "Number")
	(c).fields["m_Jet"] = R.coerce(null, "RDJet")
	(c).fields["m_fJetTimer"] = float(0)
	(c).fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
	((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["X"] = float(0)
	((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Z"] = float(0)
	R.call_member(c.fields.get("m_Camera"), "SetHighwayMode", [(c).fields.get("m_bIsHighwayLevel")])
	(c).fields["m_fMutantTimer"] = float(0)
	(c).fields["m_fMutantDelay"] = R.coerce(R.call_member(c, "GetMutantDelay", []), "Number")
	(c).fields["m_fSpawnRampPosition"] = R.coerce(R.get_value(R.klass("Number"), "MAX_VALUE"), "Number")
	R.call_member((c).fields.get("m_SpawnManager"), "Reset", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "ResetNavMesh", [])
	R.call_static("RDWorld", "ResetPerlinTrack", [])
	(c).fields["m_fTutorialTime"] = float(0)
	(c).fields["m_iTutorial"] = R.coerce(R.static_value("RDGameModeGameplay", "Tutorial_None"), "int")
	(c).fields["m_fTargetFogDistance"] = float(R.static_value("RDCamera", "NoFogDistance"))
	(c).fields["m_fTargetFogRange"] = float(R.static_value("RDCamera", "NoFogRange"))
	(c.fields.get("m_Camera")).fields["m_fFogDistance"] = float((c).fields.get("m_fTargetFogDistance"))
	(c.fields.get("m_Camera")).fields["m_fFogRange"] = float((c).fields.get("m_fTargetFogRange"))
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	(c.fields.get("m_Player")).fields["m_GameModeGameplay"] = R.coerce(c, "RDGameModeGameplay")
	(c).fields["m_bDoUpgradeScreen"] = true
	((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
	((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
	(c).fields["m_iSpecialLocation"] = R.coerce(R.call_static("Maths", "RandomInt", [4]), "int")
	(c).fields["m_iNbSlowZombieKills"] = R.coerce(0, "int")
	(c).fields["m_iChopperSupportCount"] = R.coerce(0, "int")
	(c).fields["m_bPlayIntroDialog"] = true
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fNbBlownTires"] = float(0)
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBumperHP"] = float(100)
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBodyHP"] = float(100)
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBumperAddonHP"] = R.coerce((100 if R.truth((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBumperLevel")) > float(0))) else 0), "Number")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iCivsInCar"] = R.coerce(0, "int")
	(c).fields["m_fPlayerStartPosition"] = float(0)
	(c).fields["m_iLevel"] = R.coerce(0, "int")
	(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
	(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
	(c).fields["m_iLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
	(c).fields["m_fLevelAreaStartPosition"] = float((c).fields.get("m_fSpawnLevelLength"))
	R.call_member(c, "UpdateSpawnableZombies", [])
	R.invoke(R.get_value((c).fields.get("m_SpawnedAreas"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_SpawnedAreaLengths"), "splice"), [0])
	R.set_value((c).fields.get("m_SpawnedAreas"), 0, (c).fields.get("m_iLevelArea"), "=")
	R.set_value((c).fields.get("m_SpawnedAreaLengths"), 0, (c).fields.get("m_fSpawnLevelLength"), "=")
	(c).fields["m_bIsHighwayLevel"] = false
	(c).fields["m_fJetTimer"] = float(0)
	(c).fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
	(c).fields["m_fChopperSupportDistanceCum"] = float(0)
	(c).fields["m_bChopperSupportAvailable"] = false
	(c).fields["m_fChopperSupportTimer"] = float(0)
	R.call_member(c.fields.get("m_Player"), "ReplenishForGameMode", [])
	(c).fields["m_iSpawnPursuingMutant"] = R.coerce(0, "int")
	(c).fields["m_bStartAtHighSpeed"] = false
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "ResetNavMesh", [])
	R.call_static("RDWorld", "ResetPerlinTrack", [])
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponCocheta")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponCocheta"] = R.coerce(0, "int")
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponDiane")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponDiane"] = R.coerce(0, "int")
	return null

static func f_GetMusic(c: Variant, a: Array) -> Variant:
	return ((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth((c).fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic"))
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_music: Variant = null
	var v_skyBG: Variant = null
	v_music = R.coerce(null, "DTSound")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "BeginGameMode"), [])
	(c).fields["m_bDidFirstUpdate"] = false
	R.set_value(R.klass("RDWorld"), "m_bDestroyOutOfWorldEntities", true, "=")
	R.set_value(R.klass("RDWorld"), "m_bCurvyRoads", true, "=")
	R.set_value(R.klass("RDZombie"), "m_iCueTick", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
	R.set_value(R.klass("RDZombie"), "m_iMoanTick", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
	R.set_value(R.klass("RDHumanoid"), "m_iStepTick", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
	R.call_member(c.fields.get("m_Player"), "Reset", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_fPlayerPos"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_fChopperSupportPlayerPos"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Show", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [c.fields.get("m_Player"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])
	R.call_member(c.fields.get("m_Game"), "DoFlash", [1, 2])
	if R.truth(R.unary("!", (c).fields.get("m_bDoUpgradeScreen"))):
		pass
		v_music = R.coerce(R.call_member(c, "GetMusic", []), "DTSound")
		R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [v_music, 0])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_Failed"), R.get_value(c, "OnPlayerFailed"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_CivilianDropped"), R.get_value(c, "OnCivilianDropped"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_CivilianTaken"), R.get_value(c, "OnCivilianTaken"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_AimingLevelUp"), R.get_value(c, "OnAimingLevelUp"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_HandlingLevelUp"), R.get_value(c, "OnHandlingLevelUp"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_ReloadingLevelUp"), R.get_value(c, "OnReloadingLevelUp"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DrivingLevelUp"), R.get_value(c, "OnDrivingLevelUp"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_ToughnessLevelUp"), R.get_value(c, "OnToughnessLevelUp"), false, 0, true])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_TaskStarted"), R.get_value(c, "OnTaskStarted"), false, 0, true])
	R.call_static("RDLevelPattern", "InitSuperZombieDelay", [])
	((c.fields.get("m_Game")).fields.get("m_VoiceOverSFXMix")).fields["m_fVolume"] = float(R.static_value("RDGame", "MinVoiceOverSFXMix"))
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [(c).fields.get("m_fLevelStartPosition")])
	v_skyBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member(v_skyBG, "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [v_skyBG, 0, 0, 0])
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		(c).fields["m_HillBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
		R.call_member((c).fields.get("m_HillBG"), "Init", [R.klass("MC_HillBG"), 1500, 0])
		R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_HillBG"), 0, 0, 0])
		(c).fields["m_BG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
		R.call_member((c).fields.get("m_BG"), "Init", [R.klass("MC_CityBG2PNG"), 1000, 0])
		R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_BG"), 0, 0, 0])
	else:
		pass
		(c).fields["m_BG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
		R.call_member((c).fields.get("m_BG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
		R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_BG"), 0, 0, 0])
	if R.truth((c).fields.get("m_bStartAtHighSpeed")):
		pass
		R.call_member(c.fields.get("m_Player"), "SetMaxSpeed", [])
	else:
		pass
		if R.truth(((c).fields.get("m_bPlayStartEngineSound") and R.unary("!", R.call_member(c, "IsChopperMode", [])))):
			pass
			R.call_member((c).fields.get("m_StartEngineSound"), "Play", [])
	R.call_member(c.fields.get("m_Camera"), "SetHighwayMode", [(c).fields.get("m_bIsHighwayLevel")])
	(c).fields["m_bHideMouse"] = false
	if R.truth(((c).fields.get("m_bPlayIntroDialog") and R.truth((c).fields.get("m_IntroDialog")))):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_IntroDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	(c).fields["m_bPlayIntroDialog"] = false
	if R.truth((c).fields.get("m_bDoUpgradeScreen")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "Show", [])
		R.call_member(c, "ShowUpgradeScreen", [R.static_value("RDUpgradeScreen", "UpgradeType_StartUp")])
		(c).fields["m_bDoUpgradeScreen"] = false
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	(c).fields["m_iSpawnPursuingMutant"] = R.coerce(R.get_value((c).fields.get("m_Mutants"), "length"), "int")
	R.call_member(c.fields.get("m_Player"), "CancelTask", [false])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_Failed"), R.get_value(c, "OnPlayerFailed")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_CivilianDropped"), R.get_value(c, "OnCivilianDropped")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_CivilianTaken"), R.get_value(c, "OnCivilianTaken")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_AimingLevelUp"), R.get_value(c, "OnAimingLevelUp")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_HandlingLevelUp"), R.get_value(c, "OnHandlingLevelUp")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_ReloadingLevelUp"), R.get_value(c, "OnReloadingLevelUp")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_DrivingLevelUp"), R.get_value(c, "OnDrivingLevelUp")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_ToughnessLevelUp"), R.get_value(c, "OnToughnessLevelUp")])
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_TaskStarted"), R.get_value(c, "OnTaskStarted")])
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "EndGameMode"), [])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Hide", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideEyeBloods", [])
	if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [1])
	R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "SetVolume", [1])
	(c).fields["m_HillBG"] = R.coerce(null, "RDParallaxBackground")
	(c).fields["m_BG"] = R.coerce(null, "RDParallaxBackground")
	R.invoke(R.get_value((c).fields.get("m_SpawnBuildings"), "splice"), [0])
	R.call_member(c, "HideTutorial", [])
	R.invoke(R.get_value(R.resolve(c, "Mouse", "RDGameModeGameplay"), "show"), [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_bHideMouse: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "Update"), [v_fDeltaTime])
	R.call_member(c, "UpdateGameplay", [v_fDeltaTime])
	R.call_member(c, "UpdateFog", [v_fDeltaTime])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Update", [v_fDeltaTime, c.fields.get("m_Camera")])
	R.call_member(c.fields.get("m_Camera"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateBGBuildingDepthPos", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Render", [c.fields.get("m_Camera")])
	R.call_member(c, "UpdateTutorials", [v_fDeltaTime])
	v_bHideMouse = R.coerce(R.call_member(c, "ShouldHideMouse", []), "Boolean")
	if R.truth(R.binary("!=", v_bHideMouse, (c).fields.get("m_bHideMouse"))):
		pass
		(c).fields["m_bHideMouse"] = v_bHideMouse
		if R.truth((c).fields.get("m_bHideMouse")):
			pass
			R.invoke(R.get_value(R.resolve(c, "Mouse", "RDGameModeGameplay"), "hide"), [])
		else:
			pass
			R.invoke(R.get_value(R.resolve(c, "Mouse", "RDGameModeGameplay"), "show"), [])
	(c).fields["m_bDidFirstUpdate"] = true
	return null

static func f_UpdateFog(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fTargetFogDistance")) != float((c.fields.get("m_Camera")).fields.get("m_fFogDistance")))):
		pass
		(c.fields.get("m_Camera")).fields["m_fFogDistance"] = R.coerce(R.call_static("Maths", "InterpolateNumber", [(c.fields.get("m_Camera")).fields.get("m_fFogDistance"), (c).fields.get("m_fTargetFogDistance"), R.static_value("RDGameModeGameplay", "FogInterpSpeed"), v_fDeltaTime]), "Number")
	if R.truth((float((c).fields.get("m_fTargetFogRange")) != float((c.fields.get("m_Camera")).fields.get("m_fFogRange")))):
		pass
		(c.fields.get("m_Camera")).fields["m_fFogRange"] = R.coerce(R.call_static("Maths", "InterpolateNumber", [(c.fields.get("m_Camera")).fields.get("m_fFogRange"), (c).fields.get("m_fTargetFogRange"), R.static_value("RDGameModeGameplay", "FogInterpSpeed"), v_fDeltaTime]), "Number")
	return null

static func f_ShouldHideMouse(c: Variant, a: Array) -> Variant:
	return ((((R.unary("!", R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "IsMenuOptionUp", [])) and R.unary("!", (c).fields.get("m_bShowStats"))) and R.unary("!", (c).fields.get("m_bShowDistance"))) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPaused"))) and R.unary("!", R.get_value((c.fields.get("m_Game")).fields.get("m_ConfirmationDialog"), "visible")))
	return null

static func f_UpdateBGBuildingDepthPos(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_fFarthestAlleywayPos: Variant = NAN
	var v_fFarthestAlleywayPos2: Variant = NAN
	var v_fFarthestAlleywayPos3: Variant = NAN
	var v_fFarthestAlleywayPos4: Variant = NAN
	var v_fFarthestAlleywayPos5: Variant = NAN
	var v_fTransitionPos: Variant = NAN
	var v_fTransitionPos2: Variant = NAN
	var v_fTransitionPos3: Variant = NAN
	var v_fTransitionPos4: Variant = NAN
	var v_iSlice: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_fLoopedCamPos: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_building: Variant = null
	var v_world: Variant = null
	var v_iNbBuildings: Variant = 0
	var v_iNbSlices: Variant = 0
	var v_bFoundAlleyway: Variant = false
	var v_bCheckForAlleyway2: Variant = false
	var v_bCheckForAlleyway3: Variant = false
	var v_bCheckForAlleyway4: Variant = false
	var v_bCheckForAlleyway5: Variant = false
	var v_bFoundAlleyway2: Variant = false
	var v_bFoundAlleyway3: Variant = false
	var v_bFoundAlleyway4: Variant = false
	var v_bFoundAlleyway5: Variant = false
	var v_sliceEntity: Variant = null
	v_i = R.coerce(0, "int")
	v_fFarthestAlleywayPos = float(NAN)
	v_fFarthestAlleywayPos2 = float(NAN)
	v_fFarthestAlleywayPos3 = float(NAN)
	v_fFarthestAlleywayPos4 = float(NAN)
	v_fFarthestAlleywayPos5 = float(NAN)
	v_fTransitionPos = float(NAN)
	v_fTransitionPos2 = float(NAN)
	v_fTransitionPos3 = float(NAN)
	v_fTransitionPos4 = float(NAN)
	v_iSlice = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_fLoopedCamPos = float(NAN)
	v_fPosZ = float(NAN)
	v_building = R.coerce(null, "RDBuildingNewBG")
	v_world = R.coerce((c.fields.get("m_Game")).fields.get("m_World"), "RDWorld")
	v_iNbBuildings = R.coerce(R.coerce(R.get_value((v_world).fields.get("m_BGBuildings"), "length"), "int"), "int")
	v_iNbSlices = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), "length"), "int"), "int")
	v_bFoundAlleyway = false
	v_bCheckForAlleyway2 = false
	v_bCheckForAlleyway3 = false
	v_bCheckForAlleyway4 = false
	v_bCheckForAlleyway5 = false
	v_bFoundAlleyway2 = false
	v_bFoundAlleyway3 = false
	v_bFoundAlleyway4 = false
	v_bFoundAlleyway5 = false
	v_sliceEntity = R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSliceEntities"), 0), "RDRoadSlice")
	if R.truth((((float(v_iNbBuildings) > float(0)) and (float(v_iNbSlices) > float(0))) and R.truth(v_sliceEntity))):
		pass
		v_fFarthestAlleywayPos = float(0)
		v_fFarthestAlleywayPos2 = float(0)
		v_fFarthestAlleywayPos3 = float(0)
		v_fFarthestAlleywayPos4 = float(0)
		v_fFarthestAlleywayPos5 = float(0)
		v_fTransitionPos = float(0)
		v_fTransitionPos2 = float(0)
		v_fTransitionPos3 = float(0)
		v_fTransitionPos4 = float(0)
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbSlices))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_fCamPos = float(maxf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), float(0)))
			v_fLoopedCamPos = float(R.binary("%", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))
			v_fPosZ = float(maxf(float((float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "NearPos"))))
			if R.truth((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
				pass
				if R.truth(v_bCheckForAlleyway5):
					pass
					v_bFoundAlleyway5 = true
				else:
					pass
					if R.truth(v_bCheckForAlleyway4):
						pass
						v_bFoundAlleyway4 = true
					else:
						pass
						if R.truth(v_bCheckForAlleyway3):
							pass
							v_bFoundAlleyway3 = true
						else:
							pass
							if R.truth(v_bCheckForAlleyway2):
								pass
								v_bFoundAlleyway2 = true
							else:
								pass
								v_bFoundAlleyway = true
				if R.truth((v_bCheckForAlleyway5 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos5)))):
					pass
					v_fFarthestAlleywayPos5 = float(v_fPosZ)
				else:
					pass
					if R.truth((v_bCheckForAlleyway4 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos4)))):
						pass
						v_fFarthestAlleywayPos4 = float(v_fPosZ)
					else:
						pass
						if R.truth((v_bCheckForAlleyway3 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos3)))):
							pass
							v_fFarthestAlleywayPos3 = float(v_fPosZ)
						else:
							pass
							if R.truth((v_bCheckForAlleyway2 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos2)))):
								pass
								v_fFarthestAlleywayPos2 = float(v_fPosZ)
							else:
								pass
								if R.truth((float(v_fPosZ) > float(v_fFarthestAlleywayPos))):
									pass
									v_fFarthestAlleywayPos = float(v_fPosZ)
			else:
				pass
				if R.truth(v_bFoundAlleyway5):
					pass
					break
				if R.truth(v_bFoundAlleyway4):
					pass
					v_bCheckForAlleyway5 = true
					v_fTransitionPos4 = float(v_fFarthestAlleywayPos4)
				else:
					pass
					if R.truth(v_bFoundAlleyway3):
						pass
						v_bCheckForAlleyway4 = true
						v_fTransitionPos3 = float(v_fFarthestAlleywayPos3)
					else:
						pass
						if R.truth(v_bFoundAlleyway2):
							pass
							v_bCheckForAlleyway3 = true
							v_fTransitionPos2 = float(v_fFarthestAlleywayPos2)
						else:
							pass
							if R.truth(v_bFoundAlleyway):
								pass
								v_bCheckForAlleyway2 = true
								v_fTransitionPos = float(v_fFarthestAlleywayPos)
			v_i = R.signed32(v_i + 1)
		if R.truth((float(v_fFarthestAlleywayPos) > float(0))):
			pass
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbBuildings))):
				pass
				v_building = R.coerce(R.binary("as", R.get_value((v_world).fields.get("m_BGBuildings"), v_i), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
				if R.truth((R.unary("!", v_bFoundAlleyway2) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos)))))):
					pass
					(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				else:
					pass
					if R.truth((R.unary("!", v_bFoundAlleyway3) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos2)))))):
						pass
						(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos2))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
					else:
						pass
						if R.truth((R.unary("!", v_bFoundAlleyway4) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos3)))))):
							pass
							(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos3))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
						else:
							pass
							if R.truth((R.unary("!", v_bFoundAlleyway5) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos4)))))):
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos4))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
							else:
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos5))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				R.call_member(v_building, "UpdateDepthPosition", [])
				v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateStats(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fStatsTimer")) < float(R.static_value("RDGameModeGameplay", "PreStatsDelay")))):
		pass
		(c).fields["m_fStatsTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fStatsTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fStatsTimer")) >= float(R.static_value("RDGameModeGameplay", "PreStatsDelay")))):
			pass
			if R.truth(R.unary("!", (c).fields.get("m_bDoneShowingStats"))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowPointsScreen", [])
				if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0, R.static_value("RDGameModeGameplay", "SoundFadeDuration")])
				(c).fields["m_bDoneShowingStats"] = true
				(c).fields["m_fStatsTimer"] = float(0)
	return null

static func f_UpdateHighwaySpawning(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_yellowLine: Variant = null
	var v_leftBuilding: Variant = null
	var v_rightBuilding: Variant = null
	var v_bLeft: Variant = false
	var v_fPosX: Variant = NAN
	var v_roadSign: Variant = null
	var v_roadSignOffRoad: Variant = null
	v_fPerlinX = float(NAN)
	v_fPerlinY = float(NAN)
	v_fPosZ = float(NAN)
	v_yellowLine = R.coerce(null, "RDObject")
	v_leftBuilding = R.coerce(null, "RDBuilding")
	v_rightBuilding = R.coerce(null, "RDBuilding")
	v_bLeft = false
	v_fPosX = float(NAN)
	v_roadSign = R.coerce(null, "RDRoadSign")
	v_roadSignOffRoad = R.coerce(null, "RDRoadSignOffRoad")
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "YellowLineViewDistance")))) >= float((c).fields.get("m_fNextYellowLineSpawnPosition")))):
			pass
			v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c).fields.get("m_fNextYellowLineSpawnPosition")]), "Number")
			v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c).fields.get("m_fNextYellowLineSpawnPosition")]), "Number")
			v_yellowLine = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDYellowLine")), "RDObject")
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_yellowLine, (float(v_fPerlinX) - float(2.67)), v_fPerlinY, (c).fields.get("m_fNextYellowLineSpawnPosition")])
			v_yellowLine = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDYellowLine")), "RDObject")
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_yellowLine, (float(v_fPerlinX) + float(2.67)), v_fPerlinY, (c).fields.get("m_fNextYellowLineSpawnPosition")])
			(c).fields["m_fNextYellowLineSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextYellowLineSpawnPosition"), R.static_value("RDGameModeGameplay", "YellowLineSpacing")), "Number")
		while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "BuildingViewDistance")))) >= float((c).fields.get("m_fNextBuildingSpawnPosition")))):
			pass
			v_fPosZ = float((float((c).fields.get("m_fNextBuildingSpawnPosition")) + float((float(randf()) * float(20)))))
			v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
			v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
			v_leftBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
			R.call_member(v_leftBuilding, "Init", [false, (c).fields.get("m_fLevelDifficulty")])
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_leftBuilding, (float((float(v_fPerlinX) - float(R.static_value("RDRoad", "BuildingPosX")))) - float((float(randf()) * float(15)))), v_fPerlinY, v_fPosZ])
			v_fPosZ = float((float((float((c).fields.get("m_fNextBuildingSpawnPosition")) + float(R.binary("/", R.static_value("RDGameModeGameplay", "BuildingSpacing"), 2)))) + float((float(randf()) * float(20)))))
			v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
			v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
			v_rightBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
			R.call_member(v_rightBuilding, "Init", [true, (c).fields.get("m_fLevelDifficulty")])
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_rightBuilding, (float((float(v_fPerlinX) + float(R.static_value("RDRoad", "BuildingPosX")))) + float((float(randf()) * float(15)))), v_fPerlinY, v_fPosZ])
			(c).fields["m_fNextBuildingSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextBuildingSpawnPosition"), R.static_value("RDGameModeGameplay", "BuildingSpacing")), "Number")
		if R.truth((R.unary("!", (c).fields.get("m_bSpawnRamp")) and (float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "RoadSignViewDistance")))) >= float((c).fields.get("m_fNextRoadSignSpawnPosition"))))):
			pass
			v_bLeft = (float(randf()) < float(0.5))
			v_fPosX = R.coerce((R.unary("-", R.static_value("RDRoad", "SideRoadPosX")) if R.truth(v_bLeft) else R.static_value("RDRoad", "SideRoadPosX")), "Number")
			v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c).fields.get("m_fNextRoadSignSpawnPosition")]), "Number")
			v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c).fields.get("m_fNextRoadSignSpawnPosition")]), "Number")
			v_roadSign = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), R.klass("RDRoadSign")), "RDRoadSign")
			R.call_member(v_roadSign, "Init", [(R.klass("MC_highwaysignleft") if R.truth(v_bLeft) else R.klass("MC_highwaysign"))])
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_roadSign, (float(v_fPerlinX) + float(v_fPosX)), v_fPerlinY, (c).fields.get("m_fNextRoadSignSpawnPosition")])
			v_roadSignOffRoad = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
			R.call_member(v_roadSignOffRoad, "Init", [R.klass("MC_highwaysignoffroad")])
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_roadSignOffRoad, (float(v_fPerlinX) + float(v_fPosX)), v_fPerlinY, (c).fields.get("m_fNextRoadSignSpawnPosition")])
			(v_roadSign).fields["m_OffRoadPart"] = R.coerce(v_roadSignOffRoad, "RDRoadSignOffRoad")
			(c).fields["m_fNextRoadSignSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextRoadSignSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "RoadSignSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "RoadSignSpacingRandom")))))), "Number")
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinSpeedX: Variant = NAN
	var v_fPerlinSpeedY: Variant = NAN
	var v_iCurrentPos: Variant = 0
	var v_iNewPos: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPerlinX = float(NAN)
	v_fPerlinY = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinSpeedX = float(NAN)
	v_fPerlinSpeedY = float(NAN)
	v_iCurrentPos = R.coerce(0, "int")
	v_iNewPos = R.coerce(0, "int")
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		if R.truth((c).fields.get("m_bAddAutomaticHighwayPerlinNoise")):
			pass
			while R.truth((float((c).fields.get("m_fHighwayPerlinPos")) < float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(300))))):
				pass
				v_fPerlinSpeedX = float(0.0005)
				v_fPerlinSpeedY = float(0.0002)
				R.call_static("RDWorld", "AddPerlinTrackPoint", [v_fPerlinSpeedX, v_fPerlinSpeedY])
				R.set_value(c, "m_fHighwayPerlinPos", 1, "+=")
	if R.truth((c).fields.get("m_bDoDefaultHighwaySpawning")):
		pass
		R.call_member(c, "UpdateHighwaySpawning", [])
	R.call_member((c).fields.get("m_SpawnManager"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateJet", [v_fDeltaTime])
	R.call_member(c, "UpdateHelicopter", [v_fDeltaTime])
	R.call_member(c, "UpdateChopperSupport", [v_fDeltaTime])
	if R.truth((((R.binary("==", (c.fields.get("m_Game")).fields.get("m_CustomMusic"), (c.fields.get("m_Game")).fields.get("m_TenseMusic")) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding"))) and (float(((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(1)))):
		pass
		R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth((c).fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 1])
	if R.truth(R.call_member(c, "CanGiveDistanceRP", [])):
		pass
		v_iCurrentPos = R.coerce(floorf(float((c).fields.get("m_fPlayerPos"))), "int")
		v_iNewPos = R.coerce(floorf(float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), "int")
		if R.truth((float(v_iNewPos) != float(v_iCurrentPos))):
			pass
			R.call_member(c, "AddRP", [(float((float(v_iNewPos) - float(v_iCurrentPos))) * float(R.static_value("RDGameModeGameplay", "PointsPerMeter"))), false])
			(c).fields["m_fPlayerPos"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	return null

static func f_CanGiveDistanceRP(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnKeyDown"), [v_event])
	if R.truth(R.unary("!", (c).fields.get("m_bDidFirstUpdate"))):
		pass
		return null
	if R.truth(R.logical_or(R.logical_or(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding")), func(): return R.get_value((c.fields.get("m_Game")).fields.get("m_ConfirmationDialog"), "visible")), func(): return R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", []))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
			pass
			if R.truth(R.unary("!", R.call_member(c.fields.get("m_Player"), "IsDriverSideStruggling", []))):
				pass
				((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedLeft"] = true
				(c.fields.get("m_Player")).fields["m_bSteeringLeft"] = true
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
			pass
			if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
				pass
				if R.truth(R.unary("!", R.call_member(c.fields.get("m_Player"), "IsDriverSideStruggling", []))):
					pass
					((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedRight"] = true
					(c.fields.get("m_Player")).fields["m_bSteeringRight"] = true
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
				pass
				if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
					pass
					((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedAccel"] = true
					(c.fields.get("m_Player")).fields["m_bGoForward"] = true
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
					pass
					if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
						pass
						((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedBrake"] = true
						(c.fields.get("m_Player")).fields["m_bGoBackward"] = true
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
						pass
						if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
							pass
							if R.truth(R.call_member(c.fields.get("m_Player"), "IsDriverSideStruggling", [])):
								pass
								R.call_member(c.fields.get("m_Player"), "DriverSideStruggle", [])
							else:
								pass
								if R.truth(R.call_member(c.fields.get("m_Player"), "CanStartLocationInteraction", [])):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedInteract"] = true
									R.call_member(c.fields.get("m_Player"), "StartLocationInteraction", [])
								else:
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedSwerve"] = true
									(c.fields.get("m_Player")).fields["m_bHandBraking"] = true
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHornKey"))):
							pass
							if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
								pass
								if R.truth(R.call_member(c.fields.get("m_Player"), "CanHorn", [])):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedHorn"] = true
									R.call_member(c.fields.get("m_Player"), "StartHorning", [])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_1"))):
								pass
								((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedWeaponSelection"] = true
								if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Player"), "HasWeapon", [0]), func(): return R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", [])), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
									pass
									R.call_member(c.fields.get("m_Player"), "EquipWeapon", [0])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_2"))):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedWeaponSelection"] = true
									if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Player"), "HasWeapon", [1]), func(): return R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", [])), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
										pass
										R.call_member(c.fields.get("m_Player"), "EquipWeapon", [1])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_3"))):
										pass
										if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Player"), "HasWeapon", [2]), func(): return R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", [])), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
											pass
											((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedThirdWeapon"] = true
											R.call_member(c.fields.get("m_Player"), "EquipWeapon", [2])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_4"))):
											pass
											if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Player"), "HasWeapon", [3]), func(): return R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", [])), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
												pass
												((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedFourthWeapon"] = true
												R.call_member(c.fields.get("m_Player"), "EquipWeapon", [3])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_5"))):
												pass
												if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Player"), "HasWeapon", [4]), func(): return R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", [])), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
													pass
													((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedMountedWeapon"] = true
													R.call_member(c.fields.get("m_Player"), "EquipWeapon", [4])
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPrevWeaponKey"))):
													pass
													if R.truth(R.logical_and(R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", []), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
														pass
														((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedWeaponCycle"] = true
														R.call_member(c.fields.get("m_Player"), "PrevWeapon", [])
												else:
													pass
													if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iNextWeaponKey"))):
														pass
														if R.truth(R.logical_and(R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", []), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
															pass
															((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedWeaponCycle"] = true
															R.call_member(c.fields.get("m_Player"), "NextWeapon", [])
													else:
														pass
														if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iReloadKey"))):
															pass
															if R.truth(R.call_member(c, "AreWeaponsEnabled", [])):
																pass
																if R.truth(R.call_member(c.fields.get("m_Player"), "CanReloadWeapon", [])):
																	pass
																	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedReload"] = true
																	R.call_member(c.fields.get("m_Player"), "ReloadWeapon", [])
																else:
																	pass
																	R.call_member(c.fields.get("m_Player"), "OnCouldNotReload", [])
														else:
															pass
															if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iSwitchDriverKey"))):
																pass
																if R.truth(R.call_member(c.fields.get("m_Player"), "CanSwitchDriver", [])):
																	pass
																	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedSwitchDriver"] = true
																	R.call_member(c.fields.get("m_Player"), "SwitchDriver", [])
															else:
																pass
																if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPauseKey"))):
																	pass
																	if R.truth((c.fields.get("m_Game")).fields.get("m_bPaused")):
																		pass
																		R.call_member(c.fields.get("m_Game"), "SetPause", [false])
																	else:
																		pass
																		if R.truth(R.call_member(c.fields.get("m_Game"), "CanPause", [])):
																			pass
																			R.call_member(c.fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Generic")])
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnKeyUp"), [v_event])
	if R.truth(R.unary("!", (c).fields.get("m_bDidFirstUpdate"))):
		pass
		return null
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
			pass
			(c.fields.get("m_Player")).fields["m_bSteeringLeft"] = false
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
			pass
			if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
				pass
				(c.fields.get("m_Player")).fields["m_bSteeringRight"] = false
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
				pass
				(c.fields.get("m_Player")).fields["m_bGoForward"] = false
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
					pass
					(c.fields.get("m_Player")).fields["m_bGoBackward"] = false
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
						pass
						(c.fields.get("m_Player")).fields["m_bHandBraking"] = false
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHornKey"))):
							pass
							if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
								pass
								R.call_member(c.fields.get("m_Player"), "StopHorning", [])
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseDown"), [v_event])
	if R.truth(R.unary("!", (c).fields.get("m_bDidFirstUpdate"))):
		pass
		return null
	if R.truth(((c).fields.get("m_bShowDistance") and R.binary("==", R.get_value(v_event, "target"), ((c).fields.get("m_DistanceScreen")).fields.get("Message")))):
		pass
		if R.truth((R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])) and (c).fields.get("m_bDistanceScreenReady"))):
			pass
			R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_DistanceScreen")])
			R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
			(c).fields["m_bShowDistance"] = false
			if R.truth(R.call_member((c).fields.get("m_DistanceScreen"), "contains", [(c.fields.get("m_Game")).fields.get("m_Menu")])):
				pass
				R.call_member((c).fields.get("m_DistanceScreen"), "removeChild", [(c.fields.get("m_Game")).fields.get("m_Menu")])
	else:
		pass
		if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate0")))):
			pass
			R.call_member(c.fields.get("m_Game"), "RateFile", [0])
			R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
			R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
		else:
			pass
			if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate1")))):
				pass
				R.call_member(c.fields.get("m_Game"), "RateFile", [1])
				R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
				R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
			else:
				pass
				if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate2")))):
					pass
					R.call_member(c.fields.get("m_Game"), "RateFile", [2])
					R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
					R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
				else:
					pass
					if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate3")))):
						pass
						R.call_member(c.fields.get("m_Game"), "RateFile", [3])
						R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
						R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
					else:
						pass
						if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate4")))):
							pass
							R.call_member(c.fields.get("m_Game"), "RateFile", [4])
							R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
							R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
						else:
							pass
							if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "Rate5")))):
								pass
								R.call_member(c.fields.get("m_Game"), "RateFile", [5])
								R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
								R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
							else:
								pass
								if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "NoThanks")))):
									pass
									R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
									R.call_member(c, "OnPassportNoThanks", [])
								else:
									pass
									if R.truth((R.truth((c).fields.get("m_DistanceScreen")) and R.binary("==", R.get_value(v_event, "target"), R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "Login")))):
										pass
										R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
										R.call_member(c, "OnPassportLogin", [])
	if R.truth(R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", [])):
		pass
		R.call_member((c).fields.get("m_UpgradeScreen"), "OnMouseDown", [v_event])
		return null
	if R.truth((((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding")) or (c.fields.get("m_Game")).fields.get("m_bPaused"))):
		pass
		return null
	if R.truth(R.call_member(c.fields.get("m_Player"), "IsShooterSideStruggling", [])):
		pass
		R.call_member(c.fields.get("m_Player"), "ShooterSideStruggle", [])
	else:
		pass
		if R.truth(R.call_member(c, "AreWeaponsEnabled", [])):
			pass
			((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bPressedShoot"] = true
			R.call_member(c.fields.get("m_Player"), "StartFiring", [])
	return null

static func f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.logical_and(R.call_member(c.fields.get("m_Player"), "CanSwitchWeapon", []), func(): return R.call_member(c, "AreWeaponsEnabled", []))):
		pass
		if R.truth(R.binary(">", R.get_value(v_event, "delta"), 0)):
			pass
			R.call_member(c.fields.get("m_Player"), "NextWeapon", [])
		else:
			pass
			R.call_member(c.fields.get("m_Player"), "PrevWeapon", [])
	return null

static func f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseUp"), [v_event])
	if R.truth(R.unary("!", (c).fields.get("m_bDidFirstUpdate"))):
		pass
		return null
	R.call_member(c.fields.get("m_Player"), "StopFiring", [])
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseOver"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", [])):
		pass
		R.call_member((c).fields.get("m_UpgradeScreen"), "OnMouseOver", [v_event])
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseOut"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", [])):
		pass
		R.call_member((c).fields.get("m_UpgradeScreen"), "OnMouseOut", [v_event])
	return null

static func f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_fKillDistance: Variant = NAN
	var v_fTime: Variant = NAN
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_fKillDistance = float(NAN)
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	R.call_member(c, "StoreWeaponKill", [])
	if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMutantsKilled", 1, "+=")
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
		pass
		R.call_member(c.fields.get("m_Player"), "OnShotZombie", [])
		R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieShot")) * float((c).fields.get("m_fComboMultiplier"))), true])
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iHeadshots", 1, "+=")
		v_fKillDistance = float((float(((v_zombie).fields.get("m_vLocation")).fields.get("Z")) - float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))
		if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ExpertMarksman"))) and (float(v_fKillDistance) >= float(R.static_value("RDAchievement", "ExpertMarksmanDistance"))))):
			pass
			R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "ExpertMarksman")])
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
		if R.truth((float((float(v_fTime) - float((c).fields.get("m_fHeadshotComboTime")))) < float(R.static_value("RDGameModeGameplay", "HeadshotComboDelay")))):
			pass
			R.set_value(c, "m_iHeadshotComboCount", 1, "+=")
			R.call_member(c, "HandleRapidResponseAchievement", [])
		else:
			pass
			(c).fields["m_iHeadshotComboCount"] = R.coerce(0, "int")
		(c).fields["m_fHeadshotComboTime"] = float(v_fTime)
	else:
		pass
		if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
			pass
			R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieKilledWithGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
			if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iNbZombieSplatterHits", 1, "+=")
			if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "GibsAndGravy"))) and (float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iNbZombieSplatterHits")) >= float(R.static_value("RDAchievement", "GibsAndGravyCount"))))):
				pass
				R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "GibsAndGravy")])
				R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
		else:
			pass
			R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieKilled")) * float((c).fields.get("m_fComboMultiplier"))), true])
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_zombie])
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iZombiesShot", 1, "+=")
	return null

static func f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieKilledWithGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
	if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMutantsKilled", 1, "+=")
	return null

static func f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iZombiesHit", 1, "+=")
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "BluntForceTrauma"))) and (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iZombiesHit")) >= float(R.static_value("RDAchievement", "BluntForceTraumaCount"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "BluntForceTrauma")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMutantsKilled", 1, "+=")
	if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbZombieSplatterHits", 1, "+=")
		if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "GibsAndGravy"))) and (float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iNbZombieSplatterHits")) >= float(R.static_value("RDAchievement", "GibsAndGravyCount"))))):
			pass
			R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "GibsAndGravy")])
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	else:
		pass
		if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_SlowRollOver")))):
			pass
			if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbSlowZombieKills", 1, "+=")
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
		pass
		R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieKilledWithGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
	else:
		pass
		R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerZombieKilled")) * float((c).fields.get("m_fComboMultiplier"))), true])
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_zombie])
	return null

static func f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iZombiesShot", 1, "+=")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iClingersShot", 1, "+=")
	R.call_member(c, "StoreWeaponKill", [])
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iZombiesHit", 1, "+=")
	if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMutantsKilled", 1, "+=")
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_zombie])
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iClingerState) == float(R.static_value("RDHumanoid", "ClingState_Shot")))):
		pass
		R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerHoodHeadShot")) * float((c).fields.get("m_fComboMultiplier"))), true])
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iHeadshots", 1, "+=")
		if R.truth((float((float(v_fTime) - float((c).fields.get("m_fHeadshotComboTime")))) < float(R.static_value("RDGameModeGameplay", "HeadshotComboDelay")))):
			pass
			R.set_value(c, "m_iHeadshotComboCount", 1, "+=")
			R.call_member(c, "HandleRapidResponseAchievement", [])
		else:
			pass
			(c).fields["m_iHeadshotComboCount"] = R.coerce(0, "int")
		(c).fields["m_fHeadshotComboTime"] = float(v_fTime)
	else:
		pass
		R.call_member(c, "AddRP", [(float((v_zombie).fields.get("m_iPointsPerHoodGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
		if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbZombieSplatterHits", 1, "+=")
		if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "GibsAndGravy"))) and (float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iNbZombieSplatterHits")) >= float(R.static_value("RDAchievement", "GibsAndGravyCount"))))):
			pass
			R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "GibsAndGravy")])
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnZombieArmShot(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	R.call_member(c, "AddRP", [(v_zombie).fields.get("m_iPointsPerZombieArmShotOff"), true])
	return null

static func f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iClingersShakenOff", 1, "+=")
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_zombie])
	R.call_member(c, "AddRP", [(v_zombie).fields.get("m_iPointsPerHoodKillFromCollision"), true])
	return null

static func f_OnSoldierShotDown(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	R.call_member(c, "StoreWeaponKill", [])
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
		pass
		R.call_member(c.fields.get("m_Player"), "OnShotSoldier", [])
		R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerZombieShot")) * float((c).fields.get("m_fComboMultiplier"))), true])
	else:
		pass
		if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
			pass
			R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerZombieKilledWithGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
		else:
			pass
			R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerZombieKilled")) * float((c).fields.get("m_fComboMultiplier"))), true])
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_soldier])
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iSoldiersShot", 1, "+=")
	return null

static func f_OnSoldierKilled(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iSoldiersHit", 1, "+=")
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iHitType) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
		pass
		R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerZombieKilledWithGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
	else:
		pass
		R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerZombieKilled")) * float((c).fields.get("m_fComboMultiplier"))), true])
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_soldier])
	return null

static func f_OnSoldierShotOffHood(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iSoldiersShot", 1, "+=")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iClingersShot", 1, "+=")
	R.call_member(c, "StoreWeaponKill", [])
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_soldier])
	v_fTime = float((c.fields.get("m_Game")).fields.get("m_fGameTime"))
	if R.truth((float((float(v_fTime) - float((c).fields.get("m_fComboTime")))) < float(R.static_value("RDGameModeGameplay", "ComboDelay")))):
		pass
		R.set_value(c, "m_iComboCount", 1, "+=")
		(c).fields["m_fComboMultiplier"] = float(minf(float(pow(float(R.static_value("RDGameModeGameplay", "ComboMultiplier")), float((c).fields.get("m_iComboCount")))), float(R.static_value("RDGameModeGameplay", "MaxComboMultiplier"))))
		(c).fields["m_iBestHitCombo"] = R.coerce(maxf(float((c).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iComboCount"))), "int")
		(c).fields["m_iComboPoints"] = R.coerce(R.binary("+", (c).fields.get("m_iComboPoints"), (float((c).fields.get("m_iComboCount")) * float(R.static_value("RDGameModeGameplay", "ComboPoints")))), "int")
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowCombo", [(float((c).fields.get("m_iComboCount")) + float(1))])
		R.call_member(c, "HandleSkillsIHaveThoseAchievement", [])
	else:
		pass
		(c).fields["m_iComboCount"] = R.coerce(0, "int")
		(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fComboTime"] = float(v_fTime)
	if R.truth((float(v_iClingerState) == float(R.static_value("RDHumanoid", "ClingState_Shot")))):
		pass
		R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerHoodHeadShot")) * float((c).fields.get("m_fComboMultiplier"))), true])
	else:
		pass
		R.call_member(c, "AddRP", [(float((v_soldier).fields.get("m_iPointsPerHoodGib")) * float((c).fields.get("m_fComboMultiplier"))), true])
	return null

static func f_OnSoldierGotOff(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iClingersShakenOff", 1, "+=")
	R.call_member(c, "HandleBeenThereKilledThatAchievement", [v_soldier])
	R.call_member(c, "AddRP", [(v_soldier).fields.get("m_iPointsPerHoodKillFromCollision"), true])
	return null

static func f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	(c).fields["m_fComboTime"] = R.coerce(R.unary("-", 9999), "Number")
	(c).fields["m_iComboCount"] = R.coerce(0, "int")
	(c).fields["m_fComboMultiplier"] = float(1)
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbKilledCivilians", 1, "+=")
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "MercilessRoadKill"))) and (float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iNbKilledCivilians")) >= float(R.static_value("RDAchievement", "MercilessRoadKillCount"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "MercilessRoadKill")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.call_member(c, "AddRP", [R.unary("-", R.static_value("RDGameModeGameplay", "PointsPenaltyPerCivilianKilled")), true])
	return null

static func f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	(c).fields["m_fComboTime"] = R.coerce(R.unary("-", 9999), "Number")
	(c).fields["m_iComboCount"] = R.coerce(0, "int")
	(c).fields["m_fComboMultiplier"] = float(1)
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbKilledCivilians", 1, "+=")
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "MercilessRoadKill"))) and (float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iNbKilledCivilians")) >= float(R.static_value("RDAchievement", "MercilessRoadKillCount"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "MercilessRoadKill")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.call_member(c, "AddRP", [R.unary("-", R.static_value("RDGameModeGameplay", "PointsPenaltyPerCivilianKilled")), true])
	return null

static func f_AddRP(c: Variant, a: Array) -> Variant:
	var v_iRP: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bPop: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bCheckPause: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	if R.truth((v_bCheckPause and (c.fields.get("m_Game")).fields.get("m_bPaused"))):
		pass
		return null
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iRP"] = R.coerce(R.call_static("Maths", "Clamp", [(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iRP")) + float(v_iRP)), 0, 5000]), "Number")
	if R.truth((float(v_iRP) > float(0))):
		pass
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iRPEarned"] = R.coerce(R.binary("+", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iRPEarned"), v_iRP), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateRP", [(float(v_iRP) > float(0)), v_bPop])
	return null

static func f_OnJetBombDodged(c: Variant, a: Array) -> Variant:
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbDodgedBombing", 1, "+=")
	return null

static func f_HandleBeenThereKilledThatAchievement(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = null
	var v_humanoid: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	v_zombie = R.coerce(null, "RDZombieVeryHard")
	if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "BeenThereKilledThat")))):
		pass
		if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMale")))):
			pass
			((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieMale"] = true
		else:
			pass
			if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemale")))):
				pass
				((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieFemale"] = true
			else:
				pass
				if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew")))):
					pass
					((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieMaleNew"] = true
				else:
					pass
					if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew")))):
						pass
						((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieFemaleNew"] = true
					else:
						pass
						if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieHard")))):
							pass
							((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieHard"] = true
						else:
							pass
							if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
								pass
								v_zombie = R.coerce(R.binary("as", v_humanoid, R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
								if R.truth((v_zombie).fields.get("m_bIsAlphaMutant")):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieAlpha"] = true
								else:
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieMutant"] = true
							else:
								pass
								if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieSoldier")))):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieSoldier"] = true
								else:
									pass
									if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
										pass
										((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledZombieGrub"] = true
									else:
										pass
										if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_Soldier")))):
											pass
											((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bKilledSoldier"] = true
		if R.truth((((((((((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieMale") and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieFemale")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieMaleNew")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieFemaleNew")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieHard")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieSoldier")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieMutant")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieAlpha")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledZombieGrub")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bKilledSoldier"))):
			pass
			R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "BeenThereKilledThat")])
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((R.truth((c).fields.get("m_Helicopter")) and R.unary("!", R.call_member((c).fields.get("m_Helicopter"), "IsRetreating", [])))):
		pass
		R.call_member((c).fields.get("m_Helicopter"), "StartRetreat", [])
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iBestHitCombo"] = R.coerce(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iBestHitCombo"))), "int")
	R.call_member(c, "HideTutorial", [])
	return null

static func f_OnCivilianDropped(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCiviliansSaved", 1, "+=")
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ComeWithMe")))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "ComeWithMe")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.call_member(c, "AddRP", [R.static_value("RDGameModeGameplay", "PointsPerCivilianDropped"), true])
	return null

static func f_OnCivilianTaken(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCiviliansTaken", 1, "+=")
	R.call_member(c, "AddRP", [R.static_value("RDGameModeGameplay", "PointsPerCivilianTaken"), true])
	return null

static func f_OnAimingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Aiming", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iAimingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null

static func f_OnHandlingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Handling", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iHandlingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null

static func f_OnReloadingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Reloading", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iReloadingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null

static func f_OnDrivingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Diane", "Driving", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	else:
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Cocheta", "Driving", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null

static func f_OnToughnessLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Diane", "Toughness", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	else:
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Cocheta", "Toughness", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null

static func f_OnLostFocus(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopControls", [])
	if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Game"), "CanPause", []), func(): return R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))), func(): return R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding")))):
		pass
		R.call_member(c.fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_LostFocus")])
	return null

static func f_OnPause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bForAbort: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.call_member(c, "StopControls", [])
	R.call_member(c.fields.get("m_Player"), "Pause", [v_bPause, v_bForAbort])
	return null

static func f_StopControls(c: Variant, a: Array) -> Variant:
	(c.fields.get("m_Player")).fields["m_bGoForward"] = false
	(c.fields.get("m_Player")).fields["m_bGoBackward"] = false
	(c.fields.get("m_Player")).fields["m_bSteeringLeft"] = false
	(c.fields.get("m_Player")).fields["m_bSteeringRight"] = false
	(c.fields.get("m_Player")).fields["m_bHandBraking"] = false
	R.call_member(c.fields.get("m_Player"), "StopHorning", [])
	R.call_member(c.fields.get("m_Player"), "StopFiring", [])
	return null

static func f_ActivateLocationInteraction(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_interaction: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_iType = R.coerce(R.call_member(v_interaction, "GetLocationType", []), "int")
	return null

static func f_ShowUpgradeScreen(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [0])
	R.call_member(c.fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_Upgrade")])
	R.call_member((c).fields.get("m_UpgradeScreen"), "Show", [v_iType, (c).fields.get("m_iLevelArea")])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	return null

static func f_HideUpgradeScreen(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_UpgradeScreen"), "Hide", [])
	R.call_member(c.fields.get("m_Game"), "SetPause", [false])
	if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [1])
	R.call_member(c.fields.get("m_Player"), "OnLeaveLocation", [])
	return null

static func f_OnTaskStarted(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	return null

static func f_CanPause(c: Variant, a: Array) -> Variant:
	return R.unary("!", R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", []))
	return null

static func f_StoreWeaponKill(c: Variant, a: Array) -> Variant:
	R.set_value(((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data"), "m_iKills", 1, "+=")
	return null

static func f_CanSpawnMutants(c: Variant, a: Array) -> Variant:
	return ((R.binary("==", R.get_value((c).fields.get("m_Mutants"), "length"), 0) and (float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iVeryHardZombieLevel")))) and (float((c).fields.get("m_fMutantDelay")) > float(0)))
	return null

static func f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	return (float(R.num(R.get_value((c).fields.get("m_MutantDelayMins"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantDelayMins"), "length")) - float(1))))))) + float((float(randf()) * float(R.num(R.get_value((c).fields.get("m_MutantDelayRandoms"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantDelayRandoms"), "length")) - float(1))))))))))
	return null

static func f_GetMutantCount(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_MutantCounts"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantCounts"), "length")) - float(1)))))
	return null

static func f_UpdateMutantSpawning(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	var v_iMinSpawn: Variant = 0
	var v_fRandom: Variant = NAN
	var v_mutant: Variant = null
	var v_fPosX: Variant = NAN
	var v_fPosY: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_bIsAlphaMutant: Variant = false
	var v_iActualSpawnType: Variant = 0
	var v_iRandom: Variant = 0
	var v_iSpawnType: Variant = 0
	var v_bSide: Variant = false
	var v_iRandomBuilding: Variant = 0
	var v_building: Variant = null
	var v_bCanSpawnMutants: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_rescueMode = R.coerce(null, "RDGameModeChopperRescue")
	v_iMinSpawn = R.coerce(0, "int")
	v_fRandom = float(NAN)
	v_mutant = R.coerce(null, "RDZombieVeryHard")
	v_fPosX = float(NAN)
	v_fPosY = float(NAN)
	v_fPosZ = float(NAN)
	v_bIsAlphaMutant = false
	v_iActualSpawnType = R.coerce(0, "int")
	v_iRandom = R.coerce(0, "int")
	v_iSpawnType = R.coerce(0, "int")
	v_bSide = false
	v_iRandomBuilding = R.coerce(0, "int")
	v_building = R.coerce(null, "RDBuildingNew")
	v_bCanSpawnMutants = R.coerce(R.call_member(c, "CanSpawnMutants", []), "Boolean")
	if R.truth(v_bCanSpawnMutants):
		pass
		(c).fields["m_fMutantTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fMutantTimer"), v_fDeltaTime), "Number")
		if R.truth(((float((c).fields.get("m_iSpawnPursuingMutant")) > float(0)) or (float((c).fields.get("m_fMutantTimer")) >= float((c).fields.get("m_fMutantDelay"))))):
			pass
			v_rescueMode = R.coerce(R.binary("as", c, R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
			if R.truth(R.unary("!", (c).fields.get("m_bIsHighwayLevel"))):
				pass
				R.call_member(c, "GatherValidSpawnBuildings", [])
			if R.truth((float((c).fields.get("m_iSpawnPursuingMutant")) > float(0))):
				pass
				(c).fields["m_iNbMutantsToSpawn"] = R.coerce((c).fields.get("m_iSpawnPursuingMutant"), "int")
				(c).fields["m_iSpawnPursuingMutant"] = R.coerce(0, "int")
			else:
				pass
				(c).fields["m_iNbMutantsToSpawn"] = R.coerce(R.call_member(c, "GetMutantCount", []), "int")
				v_iMinSpawn = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (c).fields.get("m_iNbMutantsToSpawn"), 2)]), "int")
				v_fRandom = float(randf())
				v_fRandom = float((float(1) - float((float((float(1) - float(v_fRandom))) * float((float(1) - float(v_fRandom)))))))
				(c).fields["m_iNbMutantsToSpawn"] = R.coerce(maxf(float(R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_iMinSpawn) + float((float(v_fRandom) * float((float((c).fields.get("m_iNbMutantsToSpawn")) - float(v_iMinSpawn))))))])), float(1)), "int")
			R.invoke(R.get_value((c).fields.get("m_MutantAttackTypes"), "splice"), [0])
			if R.truth(((c).fields.get("m_bIsHighwayLevel") or R.binary(">=", R.get_value((c).fields.get("m_SpawnBuildings"), "length"), (c).fields.get("m_iNbMutantsToSpawn")))):
				pass
				R.invoke(R.get_value((c).fields.get("m_MutantAttackTypes"), "push"), [R.static_value("RDGameModeGameplay", "MutantAttack_Side")])
			if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
				pass
				R.invoke(R.get_value((c).fields.get("m_MutantAttackTypes"), "push"), [R.static_value("RDGameModeGameplay", "MutantAttack_Back")])
			R.invoke(R.get_value((c).fields.get("m_MutantAttackTypes"), "push"), [R.static_value("RDGameModeGameplay", "MutantAttack_Front")])
			if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bChopperMode"))):
				pass
				R.invoke(R.get_value((c).fields.get("m_MutantAttackTypes"), "push"), [R.static_value("RDGameModeGameplay", "MutantAttack_AllSides")])
			if R.truth(R.binary(">", R.get_value((c).fields.get("m_MutantAttackTypes"), "length"), 0)):
				pass
				(c).fields["m_fSpawnMutantTimer"] = float(0)
				(c).fields["m_iMutantSpawnIndex"] = R.coerce(0, "int")
			else:
				pass
				(c).fields["m_iNbMutantsToSpawn"] = R.coerce(0, "int")
			(c).fields["m_fMutantTimer"] = float(0)
			(c).fields["m_fMutantDelay"] = R.coerce(R.call_member(c, "GetMutantDelay", []), "Number")
	if R.truth((float((c).fields.get("m_iMutantSpawnIndex")) < float((c).fields.get("m_iNbMutantsToSpawn")))):
		pass
		(c).fields["m_fSpawnMutantTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fSpawnMutantTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fSpawnMutantTimer")) <= float(0))):
			pass
			v_fPosX = float(0)
			v_fPosY = float(0)
			v_fPosZ = float(0)
			v_bIsAlphaMutant = ((((float((c).fields.get("m_iNbMutantsToSpawn")) == float(3)) and (float(randf()) < float(0.5))) or (float((c).fields.get("m_iNbMutantsToSpawn")) == float(4))) and (float((c).fields.get("m_iMutantSpawnIndex")) == float(0)))
			v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_MutantAttackTypes"), "length")]), "int")
			v_iSpawnType = R.coerce(R.coerce(R.get_value((c).fields.get("m_MutantAttackTypes"), v_iRandom), "int"), "int")
			if R.truth((float(v_iSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_AllSides")))):
				pass
				R.call_member((c).fields.get("m_MutantEntries"), "Reset", [])
			if R.truth((float(v_iSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_AllSides")))):
				pass
				v_iActualSpawnType = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MutantEntries"), "GetRandomValue", []), R.klass("int")), "int")
				while R.truth(((((float(v_iActualSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_Side"))) and R.unary("!", (c).fields.get("m_bIsHighwayLevel"))) and R.binary("<", R.get_value((c).fields.get("m_SpawnBuildings"), "length"), (c).fields.get("m_iNbMutantsToSpawn"))) or ((float(v_iActualSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_Back"))) and (c.fields.get("m_Player")).fields.get("m_bChopperMode")))):
					pass
					v_iActualSpawnType = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MutantEntries"), "GetRandomValue", []), R.klass("int")), "int")
			else:
				pass
				v_iActualSpawnType = R.coerce(v_iSpawnType, "int")
			if R.truth((float(v_iActualSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_Back")))):
				pass
				v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
				R.call_member(v_mutant, "InitMutant", [R.static_value("RDZombieVeryHard", "Entry_Back"), R.binary("!=", v_rescueMode, null), v_bIsAlphaMutant])
				v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDZombie", "SpawnBehindDistance"))))
				v_fPosX = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - R.num(R.call_member((c).fields.get("m_Road"), "GetRoadAreaAt", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])))) + float((float((float(randf()) * float(2))) * R.num(R.call_member((c).fields.get("m_Road"), "GetRoadAreaAt", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]))))))
				v_fPosY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
			else:
				pass
				if R.truth((float(v_iActualSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_Front")))):
					pass
					v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
					R.call_member(v_mutant, "InitMutant", [R.static_value("RDZombieVeryHard", "Entry_Front"), R.binary("!=", v_rescueMode, null), v_bIsAlphaMutant])
					v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "SpawnFrontDistance"))))
					v_fPosX = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - R.num(R.call_member((c).fields.get("m_Road"), "GetRoadAreaAt", [v_fPosZ])))) + float((float((float(randf()) * float(2))) * R.num(R.call_member((c).fields.get("m_Road"), "GetRoadAreaAt", [v_fPosZ]))))))
					v_fPosY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
				else:
					pass
					if R.truth((float(v_iActualSpawnType) == float(R.static_value("RDGameModeGameplay", "MutantAttack_Side")))):
						pass
						if R.truth((c).fields.get("m_bIsHighwayLevel")):
							pass
							v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
							R.call_member(v_mutant, "InitMutant", [R.static_value("RDZombieVeryHard", "Entry_Highway"), false, v_bIsAlphaMutant])
							v_fPosZ = float((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "SpawnHighwayDistanceMin")))) + float((float(randf()) * float((float(R.static_value("RDZombie", "SpawnHighwayDistanceMax")) - float(R.static_value("RDZombie", "SpawnHighwayDistanceMin"))))))))
							v_fPosX = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), ((R.num(R.unary("-", R.static_value("RDRoad", "SideRoadPosX"))) - float(1)) if R.truth((float(randf()) < float(0.5))) else (float(R.static_value("RDRoad", "SideRoadPosX")) + float(1)))), "Number")
							v_fPosY = float((R.num(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ])) - float(1)))
							(v_mutant).fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Background"), "int")
							(v_mutant).fields["m_bSwitchedToDynamicLayer"] = false
						else:
							pass
							v_bSide = (float(randf()) < float(0.6))
							v_mutant = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieVeryHard")]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
							R.call_member(v_mutant, "InitMutant", [(R.static_value("RDZombieVeryHard", "Entry_Side") if R.truth(v_bSide) else R.static_value("RDZombieVeryHard", "Entry_Building")), R.binary("!=", v_rescueMode, null), v_bIsAlphaMutant])
							v_iRandomBuilding = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_SpawnBuildings"), "length")]), "int")
							v_building = R.coerce(R.binary("as", R.get_value((c).fields.get("m_SpawnBuildings"), v_iRandomBuilding), R.klass("RDBuildingNew")), "RDBuildingNew")
							R.call_member(c, "GetSpawnBuildingLocation", [v_mutant, v_building, R.unary("!", v_bSide), (c).fields.get("m_vSpawnBuildingLocation")])
							v_fPosX = float(((c).fields.get("m_vSpawnBuildingLocation")).fields.get("X"))
							v_fPosY = float(((c).fields.get("m_vSpawnBuildingLocation")).fields.get("Y"))
							v_fPosZ = float(((c).fields.get("m_vSpawnBuildingLocation")).fields.get("Z"))
							(v_mutant).fields["m_SpawnBuilding"] = R.coerce(v_building, "RDEntity")
			R.call_member(v_mutant, "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnMutantDestroyed"), false, 0, true])
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_mutant, v_fPosX, v_fPosY, v_fPosZ])
			R.invoke(R.get_value((c).fields.get("m_Mutants"), "push"), [v_mutant])
			R.set_value(c, "m_iMutantSpawnIndex", 1, "+=")
			(c).fields["m_fSpawnMutantTimer"] = float((float(R.static_value("RDGameModeGameplay", "MutantSpawnDelayMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "MutantSpawnDelayMax")) - float(R.static_value("RDGameModeGameplay", "MutantSpawnDelayMin"))))))))
			R.call_member(c, "OnMutantSpawned", [])
	return null

static func f_OnMutantSpawned(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnMutantDestroyed(c: Variant, a: Array) -> Variant:
	var v_mutant: Variant = null
	var v_i: Variant = 0
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_mutant = R.coerce(null, "RDZombieVeryHard")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Mutants"), "length"))):
		pass
		v_mutant = R.coerce(R.get_value((c).fields.get("m_Mutants"), v_i), "RDZombieVeryHard")
		if R.truth(R.binary("==", v_mutant, R.get_value(v_evt, "target"))):
			pass
			R.call_member(v_mutant, "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnMutantDestroyed")])
			R.invoke(R.get_value((c).fields.get("m_Mutants"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_GatherValidSpawnBuildings(c: Variant, a: Array) -> Variant:
	var v_building: Variant = null
	var v_fDist: Variant = NAN
	var v_entityNode: Variant = null
	v_building = R.coerce(null, "RDBuildingNew")
	v_fDist = float(NAN)
	R.invoke(R.get_value((c).fields.get("m_SpawnBuildings"), "splice"), [0])
	v_entityNode = R.coerce(((c.fields.get("m_Player")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_building = R.coerce(R.binary("as", (v_entityNode).fields.get("m_Entity"), R.klass("RDBuildingNew")), "RDBuildingNew")
		if R.truth(v_building):
			pass
			v_fDist = R.coerce(R.call_static("Maths", "AbsNumber", [(float(((v_building).fields.get("m_vLocation")).fields.get("Z")) - float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
			if R.truth(((float(v_fDist) > float(R.static_value("RDGameModeGameplay", "SpawnBuildingDistanceMin"))) and (float(v_fDist) < float(R.static_value("RDGameModeGameplay", "SpawnBuildingDistanceMax"))))):
				pass
				R.invoke(R.get_value((c).fields.get("m_SpawnBuildings"), "push"), [v_building])
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null

static func f_GetSpawnBuildingLocation(c: Variant, a: Array) -> Variant:
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_building: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDBuildingNew")
	var v_bTop: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_vOutLocation: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	if R.truth(v_bTop):
		pass
		(v_vOutLocation).fields["X"] = R.coerce(R.binary("+", ((v_building).fields.get("m_vLocation")).fields.get("X"), ((v_building).fields.get("m_fTopSpotPosX") if R.truth(R.binary(">", ((v_building).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [((v_building).fields.get("m_vLocation")).fields.get("Z")]))) else R.unary("-", (v_building).fields.get("m_fTopSpotPosX")))), "Number")
		(v_vOutLocation).fields["Z"] = float((float(((v_building).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
		(v_vOutLocation).fields["Y"] = float((float(((v_building).fields.get("m_vLocation")).fields.get("Y")) + float((v_building).fields.get("m_fTopSpotPosY"))))
	else:
		pass
		(v_vOutLocation).fields["X"] = R.coerce(R.binary("+", ((v_building).fields.get("m_vLocation")).fields.get("X"), (2 if R.truth(R.binary(">", ((v_building).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [((v_building).fields.get("m_vLocation")).fields.get("Z")]))) else R.unary("-", 2))), "Number")
		(v_vOutLocation).fields["Z"] = float((float(((v_building).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
		(v_vOutLocation).fields["Y"] = float(((v_building).fields.get("m_vLocation")).fields.get("Y"))
	return null

static func f_UpdateRandomCity(c: Variant, a: Array) -> Variant:
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_fPatternSpace: Variant = NAN
	var v_waterJug: Variant = null
	var v_fPosZ: Variant = NAN
	var v_fStretch: Variant = NAN
	var v_fPatternSpacing: Variant = NAN
	var v_fSpawnRatio: Variant = NAN
	var v_iRandom: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomNew")
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = R.coerce(null, "RDObstacleWaterJug")
	v_fPosZ = float(NAN)
	v_fStretch = float(NAN)
	v_fPatternSpacing = float(NAN)
	v_fSpawnRatio = float(NAN)
	v_iRandom = R.coerce(0, "int")
	if R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) >= float((c).fields.get("m_fLevelAreaStartPosition")))):
		pass
		(c).fields["m_iLevelArea"] = R.coerce(R.get_value((c).fields.get("m_SpawnedAreas"), 0), "int")
		R.call_member(c, "OnNewLevelArea", [])
		R.invoke(R.get_value((c).fields.get("m_SpawnedAreas"), "shift"), [])
		(c).fields["m_fLevelAreaStartPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fLevelAreaStartPosition"), R.get_value((c).fields.get("m_SpawnedAreaLengths"), 0)), "Number")
		R.invoke(R.get_value((c).fields.get("m_SpawnedAreaLengths"), "shift"), [])
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fNextPatternSpawnPosition")))):
		pass
		if R.truth((c).fields.get("m_bIsHighwayLevel")):
			pass
			if R.truth(((c).fields.get("m_bSpawnRamp") and (float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = R.coerce((c).fields.get("m_LevelRampExitPatterns"), "RandomHat")
				(c).fields["m_bSpawnRamp"] = false
			else:
				pass
				(c).fields["m_bSpawnWeapons"] = false
				(c).fields["m_bSpawnCheckpoint"] = false
				if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fCheckpointPatternPosition")))):
					pass
					(c).fields["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fSpecialPatternPosition")))):
						pass
						(c).fields["m_bSpawnWeapons"] = true
						if R.truth((float((c).fields.get("m_iSpecialLocation")) == float(2))):
							pass
							(c).fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float((c).fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth((c).fields.get("m_bSpawnCheckpoint")):
					pass
					v_levelPatterns = R.coerce((c).fields.get("m_LevelCheckpointHighwayPatterns"), "RandomHat")
					(c).fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
				else:
					pass
					if R.truth((c).fields.get("m_bSpawnWeapons")):
						pass
						v_levelPatterns = R.coerce((c).fields.get("m_LevelWeaponsHighwayPatterns"), "RandomHat")
						(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float((float(R.static_value("RDGameModeGameplay", "HighwaySpecialPatternSpacingMin")) + float((float((c).fields.get("m_iLevel")) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMinIncrement")))))))) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "HighwaySpecialPatternSpacingRandom")) + float((float((c).fields.get("m_iLevel")) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandomIncrement"))))))))))
					else:
						pass
						if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fNextHardPatternSpawnPosition")))):
							pass
							v_levelPatterns = R.coerce((c).fields.get("m_LevelHardHighwayPatterns"), "RandomHat")
							(c).fields["m_fNextHardPatternSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextHardPatternSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingRandom")))))), "Number")
						else:
							pass
							v_levelPatterns = R.coerce((c).fields.get("m_LevelNormalHighwayPatterns"), "RandomHat")
			v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew")), "RDLevelPatternCustomNew")
			v_fStretch = float((float(1) + float((float(randf()) * float((float(0.25) + float((float((float(1) - float((c).fields.get("m_fLevelDifficulty")))) * float(0.25)))))))))
			(c).fields["m_bIsZombieCheckpoint"] = (c).fields.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, (c).fields.get("m_iLevel"), (c).fields.get("m_fLevelDifficulty"), (c).fields.get("m_fNextPatternSpawnPosition"), 1, v_fStretch]), "Number")
			(c).fields["m_bIsZombieCheckpoint"] = false
			(c).fields["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [(c).fields.get("m_fNextPatternSpawnPosition")])
			v_fPatternSpacing = float((float(R.static_value("RDGameModeGameplay", "PatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "PatternSpacingRandom"))))))
			if R.truth(((c.fields.get("m_Player")).fields.get("m_bIsOnFire") and (float(randf()) < float(R.static_value("RDGameModeGameplay", "WaterJugChance"))))):
				pass
				v_waterJug = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug")), "RDObstacleWaterJug")
				v_fPosZ = float((float((c).fields.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.static_value("RDRoad", "RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.static_value("RDRoad", "RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			(c).fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextPatternSpawnPosition"), (float(v_fPatternSpace) + float(v_fPatternSpacing))), "Number")
			v_fNextSpawnLevelStartPosition = float((float((c).fields.get("m_fSpawnLevelStartPosition")) + float((c).fields.get("m_fSpawnLevelLength"))))
			while R.truth((float((c).fields.get("m_fNextPatternSpawnPosition")) >= float(v_fNextSpawnLevelStartPosition))):
				pass
				R.set_value(c, "m_iSpawnLevel", 1, "+=")
				(c).fields["m_bSpawnRamp"] = false
				R.call_member(c, "SetNextSpawnLevel", [])
				(c).fields["m_fSpawnLevelStartPosition"] = float(v_fNextSpawnLevelStartPosition)
				v_fNextSpawnLevelStartPosition = float((float((c).fields.get("m_fSpawnLevelStartPosition")) + float((c).fields.get("m_fSpawnLevelLength"))))
		else:
			pass
			if R.truth(((c).fields.get("m_bSpawnRamp") and (float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = R.coerce((c).fields.get("m_LevelRampPatterns"), "RandomHat")
				(c).fields["m_bSpawnRamp"] = false
			else:
				pass
				(c).fields["m_bSpawnChurch"] = false
				(c).fields["m_bSpawnPoliceStation"] = false
				(c).fields["m_bSpawnWeapons"] = false
				(c).fields["m_bSpawnGarage"] = false
				(c).fields["m_bSpawnCheckpoint"] = false
				if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fCheckpointPatternPosition")))):
					pass
					(c).fields["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fSpecialPatternPosition")))):
						pass
						if R.truth(((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery"))) or (float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park"))))):
							pass
							(c).fields["m_bSpawnWeapons"] = true
							if R.truth((float((c).fields.get("m_iSpecialLocation")) == float(2))):
								pass
								(c).fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float((c).fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
						else:
							pass
							v_iRandom = R.coerce((c).fields.get("m_iSpecialLocation"), "int")
							(c).fields["m_bSpawnChurch"] = (float(v_iRandom) == float(0))
							(c).fields["m_bSpawnPoliceStation"] = (float(v_iRandom) == float(1))
							(c).fields["m_bSpawnWeapons"] = (float(v_iRandom) == float(2))
							(c).fields["m_bSpawnGarage"] = (float(v_iRandom) == float(3))
							(c).fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float((c).fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Residential")))):
					pass
					if R.truth((c).fields.get("m_bSpawnChurch")):
						pass
						v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialChurchPatterns"), "RandomHat")
						(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
					else:
						pass
						if R.truth((c).fields.get("m_bSpawnPoliceStation")):
							pass
							v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialPoliceStationPatterns"), "RandomHat")
							(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth((c).fields.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialWeaponsPatterns"), "RandomHat")
								(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth((c).fields.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialGaragePatterns"), "RandomHat")
									(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth((c).fields.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialCheckpointPatterns"), "RandomHat")
										(c).fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
									else:
										pass
										if R.truth(R.call_member(c, "CanHaveBlockedPatterns", [])):
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialBlockedPatterns"), "RandomHat")
										else:
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelResidentialPatterns"), "RandomHat")
				else:
					pass
					if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Town")))):
						pass
						if R.truth((c).fields.get("m_bSpawnChurch")):
							pass
							v_levelPatterns = R.coerce((c).fields.get("m_LevelTownChurchPatterns"), "RandomHat")
							(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth((c).fields.get("m_bSpawnPoliceStation")):
								pass
								v_levelPatterns = R.coerce((c).fields.get("m_LevelTownPoliceStationPatterns"), "RandomHat")
								(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth((c).fields.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = R.coerce((c).fields.get("m_LevelTownWeaponsPatterns"), "RandomHat")
									(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth((c).fields.get("m_bSpawnGarage")):
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelTownGaragePatterns"), "RandomHat")
										(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
									else:
										pass
										if R.truth((c).fields.get("m_bSpawnCheckpoint")):
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelTownCheckpointPatterns"), "RandomHat")
											(c).fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
										else:
											pass
											if R.truth(R.call_member(c, "CanHaveBlockedPatterns", [])):
												pass
												v_levelPatterns = R.coerce((c).fields.get("m_LevelTownBlockedPatterns"), "RandomHat")
											else:
												pass
												v_levelPatterns = R.coerce((c).fields.get("m_LevelTownPatterns"), "RandomHat")
					else:
						pass
						if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Industrial")))):
							pass
							if R.truth((c).fields.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = R.coerce((c).fields.get("m_LevelIndustrialWeaponsPatterns"), "RandomHat")
								(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth((c).fields.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = R.coerce((c).fields.get("m_LevelIndustrialGaragePatterns"), "RandomHat")
									(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth((c).fields.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelIndustrialCheckpointPatterns"), "RandomHat")
										(c).fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
									else:
										pass
										if R.truth(R.call_member(c, "CanHaveBlockedPatterns", [])):
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelIndustrialBlockedPatterns"), "RandomHat")
										else:
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelIndustrialPatterns"), "RandomHat")
						else:
							pass
							if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
								pass
								if R.truth((c).fields.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = R.coerce((c).fields.get("m_LevelParkWeaponsPatterns"), "RandomHat")
									(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									v_levelPatterns = R.coerce((c).fields.get("m_LevelParkPatterns"), "RandomHat")
							else:
								pass
								if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
									pass
									if R.truth((c).fields.get("m_bSpawnWeapons")):
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelCemeteryWeaponsPatterns"), "RandomHat")
										(c).fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelCemeteryPatterns"), "RandomHat")
								else:
									pass
									if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking")))):
										pass
										v_levelPatterns = R.coerce((c).fields.get("m_LevelParkingPatterns"), "RandomHat")
									else:
										pass
										if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
											pass
											v_levelPatterns = R.coerce((c).fields.get("m_LevelAlleywayPatterns"), "RandomHat")
			v_fSpawnRatio = float(minf(float((float((c).fields.get("m_fSpawnRatioBaseNormal")) + float((float((c).fields.get("m_iLevel")) * float((c).fields.get("m_fSpawnRatioIncrementNormal")))))), float(0.75)))
			if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float((c).fields.get("m_fNextHardPatternSpawnPosition")))):
				pass
				v_fSpawnRatio = float(minf(float((float((c).fields.get("m_fSpawnRatioBaseHard")) + float((float((c).fields.get("m_iLevel")) * float((c).fields.get("m_fSpawnRatioIncrementHard")))))), float(1)))
				(c).fields["m_fNextHardPatternSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextHardPatternSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "HardPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HardPatternSpacingRandom")))))), "Number")
			v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew")), "RDLevelPatternCustomNew")
			if R.truth(((((R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_ChopperShooting")))):
				pass
				v_fSpawnRatio = float(1)
			(c).fields["m_bIsZombieCheckpoint"] = (c).fields.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, (c).fields.get("m_iLevel"), (c).fields.get("m_fLevelDifficulty"), (c).fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
			(c).fields["m_bIsZombieCheckpoint"] = false
			(c).fields["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [(c).fields.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "UpdateBGBuildingDepthPos", [])
			if R.truth(((c.fields.get("m_Player")).fields.get("m_bIsOnFire") and (float(randf()) < float(R.static_value("RDGameModeGameplay", "WaterJugChance"))))):
				pass
				v_fPatternSpacing = float((float(R.static_value("RDGameModeGameplay", "PatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "PatternSpacingRandom"))))))
				v_waterJug = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug")), "RDObstacleWaterJug")
				v_fPosZ = float((float((c).fields.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.static_value("RDRoad", "RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.static_value("RDRoad", "RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			(c).fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
			v_fNextSpawnLevelStartPosition = float((float((c).fields.get("m_fSpawnLevelStartPosition")) + float((c).fields.get("m_fSpawnLevelLength"))))
			while R.truth((float((c).fields.get("m_fNextPatternSpawnPosition")) >= float(v_fNextSpawnLevelStartPosition))):
				pass
				R.set_value(c, "m_iSpawnLevel", 1, "+=")
				(c).fields["m_bSpawnRamp"] = false
				R.call_member(c, "SetNextSpawnLevel", [])
				(c).fields["m_fSpawnLevelStartPosition"] = float(v_fNextSpawnLevelStartPosition)
				v_fNextSpawnLevelStartPosition = float((float((c).fields.get("m_fSpawnLevelStartPosition")) + float((c).fields.get("m_fSpawnLevelLength"))))
	return null

static func f_SetNextSpawnLevel(c: Variant, a: Array) -> Variant:
	var v_fRandom: Variant = NAN
	v_fRandom = float(randf())
	if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Residential")))):
		pass
		if R.truth((float(v_fRandom) < float(0.2))):
			pass
			(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
			if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
				pass
				(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
				(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
		else:
			pass
			if R.truth((float(v_fRandom) < float(0.4))):
				pass
				(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
				if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
					pass
					(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
					(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
			else:
				pass
				if R.truth((float(v_fRandom) < float(0.6))):
					pass
					(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Park"), "int")
					(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ParkLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ParkLengthMax")) - float(R.static_value("RDGameModeGameplay", "ParkLengthMin"))))))))
				else:
					pass
					if R.truth((float(v_fRandom) < float(0.9))):
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Alleyway"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMax")) - float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin"))))))))
					else:
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Cemetery"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "CemeteryLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "CemeteryLengthMax")) - float(R.static_value("RDGameModeGameplay", "CemeteryLengthMin"))))))))
	else:
		pass
		if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Town")))):
			pass
			if R.truth((float(v_fRandom) < float(0.2))):
				pass
				(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
				if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
					pass
					(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
					(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
			else:
				pass
				if R.truth((float(v_fRandom) < float(0.4))):
					pass
					(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
					if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
				else:
					pass
					if R.truth((float(v_fRandom) < float(0.6))):
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Park"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ParkLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ParkLengthMax")) - float(R.static_value("RDGameModeGameplay", "ParkLengthMin"))))))))
					else:
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Alleyway"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMax")) - float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin"))))))))
		else:
			pass
			if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Industrial")))):
				pass
				if R.truth((float(v_fRandom) < float(0.2))):
					pass
					(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
					if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
				else:
					pass
					if R.truth((float(v_fRandom) < float(0.4))):
						pass
						(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
						if R.truth(R.unary("!", (c).fields.get("m_bSpawnRamp"))):
							pass
							(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
							(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
					else:
						pass
						if R.truth((float(v_fRandom) < float(0.6))):
							pass
							(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Park"), "int")
							(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ParkLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ParkLengthMax")) - float(R.static_value("RDGameModeGameplay", "ParkLengthMin"))))))))
						else:
							pass
							(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Alleyway"), "int")
							(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMax")) - float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin"))))))))
			else:
				pass
				if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
					pass
					if R.truth((float(v_fRandom) < float(0.2))):
						pass
						(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
						(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
						(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
					else:
						pass
						if R.truth((float(v_fRandom) < float(0.4))):
							pass
							(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
							(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
							(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
						else:
							pass
							if R.truth((float(v_fRandom) < float(0.6))):
								pass
								(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
								(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
								(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
							else:
								pass
								(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Park"), "int")
								(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ParkLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ParkLengthMax")) - float(R.static_value("RDGameModeGameplay", "ParkLengthMin"))))))))
				else:
					pass
					if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
						pass
						if R.truth((float(v_fRandom) < float(0.3))):
							pass
							(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Cemetery"), "int")
							(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "CemeteryLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "CemeteryLengthMax")) - float(R.static_value("RDGameModeGameplay", "CemeteryLengthMin"))))))))
						else:
							pass
							if R.truth((float(v_fRandom) < float(0.5))):
								pass
								(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
								(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
								(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
							else:
								pass
								if R.truth((float(v_fRandom) < float(0.7))):
									pass
									(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
									(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
									(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
								else:
									pass
									if R.truth((float(v_fRandom) < float(0.9))):
										pass
										(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
										(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
										(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
									else:
										pass
										(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Alleyway"), "int")
										(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "AlleywayLengthMax")) - float(R.static_value("RDGameModeGameplay", "AlleywayLengthMin"))))))))
					else:
						pass
						if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
							pass
							if R.truth((float(v_fRandom) < float(0.3))):
								pass
								(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Park"), "int")
								(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ParkLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ParkLengthMax")) - float(R.static_value("RDGameModeGameplay", "ParkLengthMin"))))))))
							else:
								pass
								if R.truth((float(v_fRandom) < float(0.5))):
									pass
									(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
									(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
									(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
								else:
									pass
									if R.truth((float(v_fRandom) < float(0.7))):
										pass
										(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
										(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
										(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
									else:
										pass
										(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
										(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
										(c).fields["m_bSpawnRamp"] = (float(randf()) < float(0.1))
						else:
							pass
							if R.truth((float((c).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Highway")))):
								pass
								(c).fields["m_bSpawnRamp"] = true
								(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Highway"), "int")
								(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "HighwayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "HighwayLengthMax")) - float(R.static_value("RDGameModeGameplay", "HighwayLengthMin"))))))))
	if R.truth((c).fields.get("m_bSpawnRamp")):
		pass
		(c).fields["m_fSpawnRampPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "HighwayTransitionDistance"))))
	R.invoke(R.get_value((c).fields.get("m_SpawnedAreas"), "push"), [(c).fields.get("m_iSpawnLevelArea")])
	R.invoke(R.get_value((c).fields.get("m_SpawnedAreaLengths"), "push"), [(c).fields.get("m_fSpawnLevelLength")])
	return null

static func f_OnBuildingReachedByZombie(c: Variant, a: Array) -> Variant:
	var v_building: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDBuildingNew")
	var v_zombie: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDZombie")
	pass
	return null

static func f_OnCivGetInCar(c: Variant, a: Array) -> Variant:
	var v_civ: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCivilian")
	pass
	return null

static func f_CanSpawnZombies(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_CanSpawnCivilian(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_CanSpawnNormalZombies(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_OnRampReached(c: Variant, a: Array) -> Variant:
	var v_fRandom: Variant = NAN
	v_fRandom = float(NAN)
	(c).fields["m_bIsHighwayLevel"] = R.unary("!", (c).fields.get("m_bIsHighwayLevel"))
	(c).fields["m_bStartAtHighSpeed"] = true
	(c).fields["m_fPlayerStartPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fPlayerStartPosition"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_bIsHighwayLevel"))):
		pass
		v_fRandom = float(randf())
		if R.truth((float(v_fRandom) < float(0.3))):
			pass
			(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Residential"), "int")
			(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "ResidentialLengthMax")) - float(R.static_value("RDGameModeGameplay", "ResidentialLengthMin"))))))))
		else:
			pass
			if R.truth((float(v_fRandom) < float(0.65))):
				pass
				(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Town"), "int")
				(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "TownLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "TownLengthMax")) - float(R.static_value("RDGameModeGameplay", "TownLengthMin"))))))))
			else:
				pass
				(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Industrial"), "int")
				(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "IndustrialLengthMax")) - float(R.static_value("RDGameModeGameplay", "IndustrialLengthMin"))))))))
		(c).fields["m_iLevelArea"] = R.coerce((c).fields.get("m_iSpawnLevelArea"), "int")
		(c).fields["m_fLevelAreaStartPosition"] = float((c).fields.get("m_fSpawnLevelLength"))
		R.invoke(R.get_value((c).fields.get("m_SpawnedAreas"), "splice"), [0])
		R.invoke(R.get_value((c).fields.get("m_SpawnedAreaLengths"), "splice"), [0])
		R.set_value((c).fields.get("m_SpawnedAreas"), 0, (c).fields.get("m_iLevelArea"), "=")
		R.set_value((c).fields.get("m_SpawnedAreaLengths"), 0, (c).fields.get("m_fSpawnLevelLength"), "=")
	else:
		pass
		(c).fields["m_iSpawnLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Highway"), "int")
		(c).fields["m_fSpawnLevelLength"] = float((float(R.static_value("RDGameModeGameplay", "HighwayLengthMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "HighwayLengthMax")) - float(R.static_value("RDGameModeGameplay", "HighwayLengthMin"))))))))
		(c).fields["m_iLevelArea"] = R.coerce(R.static_value("RDGameModeGameplay", "Area_Highway"), "int")
		(c).fields["m_fLevelAreaStartPosition"] = float((c).fields.get("m_fSpawnLevelLength"))
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(c.fields.get("m_Game"), "StartCinematic", [("EnterHighway" if R.truth((c).fields.get("m_bIsHighwayLevel")) else "ExitHighway"), false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth((c).fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 0])
	return null

static func f_CanSpawnJet(c: Variant, a: Array) -> Variant:
	return (((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed")) and R.unary("!", (c).fields.get("m_Jet"))) and (float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iJetLevel")))) and (float((c).fields.get("m_fJetDelay")) > float(0)))
	return null

static func f_UpdateJet(c: Variant, a: Array) -> Variant:
	var v_iDrops: Variant = 0
	var v_fPosZ: Variant = NAN
	var v_bCanSpawnJet: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iDrops = R.coerce(0, "int")
	v_fPosZ = float(NAN)
	v_bCanSpawnJet = R.coerce(R.call_member(c, "CanSpawnJet", []), "Boolean")
	if R.truth(v_bCanSpawnJet):
		pass
		(c).fields["m_fJetTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fJetTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fJetTimer")) >= float((c).fields.get("m_fJetDelay")))):
			pass
			v_iDrops = R.coerce(maxf(float(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.call_member(c, "GetJetDrops", [])) * float(randf()))])), float(1)), "int")
			(c).fields["m_Jet"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDJet")]), R.klass("RDJet")), "RDJet")
			R.call_member((c).fields.get("m_Jet"), "Init", [v_iDrops])
			R.call_member((c).fields.get("m_Jet"), "SetPlayDialogs", [R.call_member(c, "GetJetPlayDialogs", [])])
			R.call_member((c).fields.get("m_Jet"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetDestroyed"), false, 0, true])
			v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDJet", "SpawnDistance"))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Jet"), R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDRoad", "GetLaneXPos", [R.call_static("Maths", "RandomInt", [3])])), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), R.static_value("RDJet", "FlyHeight")), v_fPosZ])
			(c).fields["m_fJetTimer"] = float(0)
			(c).fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
	return null

static func f_OnJetDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_Jet"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetDestroyed")])
	(c).fields["m_Jet"] = R.coerce(null, "RDJet")
	return null

static func f_CanSpawnHelicopter(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_UpdateHelicopter(c: Variant, a: Array) -> Variant:
	var v_fPosZ: Variant = NAN
	var v_bCanSpawnHelicopter: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPosZ = float(NAN)
	v_bCanSpawnHelicopter = R.coerce(R.call_member(c, "CanSpawnHelicopter", []), "Boolean")
	if R.truth(v_bCanSpawnHelicopter):
		pass
		(c).fields["m_fHelicopterTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fHelicopterTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fHelicopterTimer")) >= float((c).fields.get("m_fHelicopterDelay")))):
			pass
			(c).fields["m_Helicopter"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHelicopter")]), R.klass("RDHelicopter")), "RDHelicopter")
			R.call_member((c).fields.get("m_Helicopter"), "Init", [R.call_member(c, "GetHelicopterLevel", [])])
			R.call_member((c).fields.get("m_Helicopter"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterDestroyed"), false, 0, true])
			v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDHelicopter", "SpawnDistance"))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Helicopter"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), R.static_value("RDHelicopter", "FlyHeight")), v_fPosZ])
			(c).fields["m_fHelicopterTimer"] = float(0)
			(c).fields["m_fHelicopterDelay"] = R.coerce(R.call_member(c, "GetHelicopterDelay", []), "Number")
	return null

static func f_OnHelicopterDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_Helicopter"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterDestroyed")])
	(c).fields["m_Helicopter"] = R.coerce(null, "RDHelicopter")
	return null

static func f_UpdateChopperSupport(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bCanHaveChopperSupport")):
		pass
		if R.truth(((float((c).fields.get("m_fChopperSupportTimer")) > float(0)) and R.unary("!", (c).fields.get("m_HelicopterAlly")))):
			pass
			R.call_member(c, "CallChopperSupport", [false])
		if R.truth((((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iChopperSupportLevel")) > float(0)) and R.unary("!", (c).fields.get("m_bChopperSupportAvailable"))) and R.unary("!", (c).fields.get("m_HelicopterAlly")))):
			pass
			(c).fields["m_fChopperSupportDistanceCum"] = R.coerce(R.binary("+", (c).fields.get("m_fChopperSupportDistanceCum"), (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fChopperSupportPlayerPos")))), "Number")
			if R.truth(R.binary(">", (c).fields.get("m_fChopperSupportDistanceCum"), R.get_value(R.static_value("RDPlayer", "ChopperSupportDistance"), (c).fields.get("m_iChopperSupportCount")))):
				pass
				(c).fields["m_bChopperSupportAvailable"] = true
				(c).fields["m_fChopperSupportDistanceCum"] = float(0)
				R.call_member(c.fields.get("m_Player"), "PlayChopperSupportReadyVoice", [])
		if R.truth((R.truth((c).fields.get("m_HelicopterAlly")) and R.unary("!", ((c).fields.get("m_HelicopterAlly")).fields.get("m_bRetreating")))):
			pass
			(c).fields["m_fChopperSupportTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fChopperSupportTimer"), v_fDeltaTime), "Number")
			if R.truth(R.binary(">", (c).fields.get("m_fChopperSupportTimer"), R.get_value(R.static_value("RDPlayer", "ChopperSupportDuration"), ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iChopperSupportLevel")))):
				pass
				R.call_member(c.fields.get("m_Player"), "PlayChopperSupportLeavesVoice", [])
				R.call_member((c).fields.get("m_HelicopterAlly"), "StartRetreat", [])
				(c).fields["m_fChopperSupportTimer"] = float(0)
	(c).fields["m_fChopperSupportPlayerPos"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	return null

static func f_CallChopperSupport(c: Variant, a: Array) -> Variant:
	var v_fPosZ: Variant = NAN
	var v_bCallRadio: Variant = R.coerce((a[0] if a.size() > 0 else true), "Boolean")
	if R.truth(v_bCallRadio):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayChopperSupportVoice", [])
		(c).fields["m_iChopperSupportCount"] = R.coerce(minf(float((float((c).fields.get("m_iChopperSupportCount")) + float(1))), float((R.num(R.get_value(R.static_value("RDPlayer", "ChopperSupportDistance"), "length")) - float(1)))), "int")
	(c).fields["m_HelicopterAlly"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHelicopterAlly")]), R.klass("RDHelicopterAlly")), "RDHelicopterAlly")
	R.call_member((c).fields.get("m_HelicopterAlly"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed"), false, 0, true])
	((c).fields.get("m_HelicopterAlly")).fields["m_bShootingMode"] = true
	v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDHelicopterAlly", "SpawnDistance"))))
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_HelicopterAlly"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), ((c).fields.get("m_HelicopterAlly")).fields.get("m_fFlyHeight")), v_fPosZ])
	(c).fields["m_bChopperSupportAvailable"] = false
	(c).fields["m_fChopperSupportTimer"] = float(0)
	return null

static func f_OnHelicopterAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_HelicopterAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed")])
	(c).fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	return null

static func f_CanCallChopperSupport(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_bChopperSupportAvailable") and R.unary("!", (c).fields.get("m_Helicopter")))
	return null

static func f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_IsZombieCheckpoint(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bIsZombieCheckpoint")
	return null

static func f_UpdateSpawnableZombies(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_FeedZombieClasses"), "splice"), [0])
	if R.truth(R.call_member(c, "CanSpawnNormalZombies", [])):
		pass
		R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMale")])
		R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMale")])
		R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemale")])
		R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemale")])
		if R.truth((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iHardZombieLevel")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieHard")])
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieHard")])
		if R.truth((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iNewMaleZombieLevel")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMaleNew")])
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalMaleNew")])
		if R.truth((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iNewFemaleZombieLevel")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemaleNew")])
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieNormalFemaleNew")])
		if R.truth((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iSoldierZombieLevel")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_ZombieClasses"), "push"), [R.klass("RDZombieSoldier")])
		R.invoke(R.get_value((c).fields.get("m_FeedZombieClasses"), "push"), [R.klass("RDZombieNormalMale")])
		R.invoke(R.get_value((c).fields.get("m_FeedZombieClasses"), "push"), [R.klass("RDZombieNormalFemale")])
		if R.truth((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iHardZombieLevel")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_FeedZombieClasses"), "push"), [R.klass("RDZombieHard")])
	return null

static func f_GetRandomZombieClass(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_ZombieClasses"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_ZombieClasses"), "length")]))
	return null

static func f_GetRandomFeedZombieClass(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_FeedZombieClasses"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_FeedZombieClasses"), "length")]))
	return null

static func f_CanHaveBlockedPatterns(c: Variant, a: Array) -> Variant:
	return (((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c.fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"), "GetAmmoInMag", []), 0)) or ((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_MountedMG")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c.fields.get("m_Player")).fields.get("m_WeaponMountedMG"), "GetAmmoInMag", []), 0)))
	return null

static func f_CanShowHud(c: Variant, a: Array) -> Variant:
	return ((R.truth(c.fields.get("m_Player")) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding")))
	return null

static func f_CanSpawnAmmoPoint(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_HideTutorial(c: Variant, a: Array) -> Variant:
	(c).fields["m_iTutorial"] = R.coerce(R.static_value("RDGameModeGameplay", "Tutorial_None"), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTutorial", [])
	return null

static func f_ShowTutorial(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_iTutorial: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_info = R.coerce((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "RDPlayerInfo")
	(c).fields["m_iTutorial"] = R.coerce(v_iTutorial, "int")
	if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Accel")))):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use your accel key to move forward and your brake key to slow down and stop your vehicle.", "VerticalKeys", false, 0, (v_info).fields.get("m_iAccelKey"), 0, (v_info).fields.get("m_iBrakeKey")])
	else:
		pass
		if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Turn")))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use your direction keys to turn left and right.", "HorizontalKeys", false, (v_info).fields.get("m_iLeftKey"), (v_info).fields.get("m_iRightKey")])
		else:
			pass
			if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Mouse")))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use your mouse to aim and use left-click to fire your weapon.", "Mouse", false])
			else:
				pass
				if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Reload")))):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use your reload key to reload your weapon.", "SingleKey", false, 0, (v_info).fields.get("m_iReloadKey")])
				else:
					pass
					if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_WeaponSelection")))):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use the number keys to equip a weapon.", "HorizontalKeys", false, R.static_value("Input", "Key_1"), R.static_value("Input", "Key_2")])
					else:
						pass
						if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_WeaponCycle")))):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Cycle through your weapons with your cycle keys.", "HorizontalKeys", false, (v_info).fields.get("m_iPrevWeaponKey"), (v_info).fields.get("m_iNextWeaponKey")])
						else:
							pass
							if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Swerve")))):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["HOLD the swerve key to steer more abruptly and avoid obstacles easier.", "SingleKey", false, 0, (v_info).fields.get("m_iHandbrakeKey")])
							else:
								pass
								if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Horn")))):
									pass
									R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use your horn to call out civilians, they will move out of the way or get in your vehicle while you're stopped.", "SingleKey", false, 0, (v_info).fields.get("m_iHornKey")])
								else:
									pass
									if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_ThirdWeapon")))):
										pass
										R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Equip your new weapon with the third weapon key.", "SingleKey", false, 0, R.static_value("Input", "Key_3")])
									else:
										pass
										if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_FourthWeapon")))):
											pass
											R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Equip your new weapon with the fourth weapon key.", "SingleKey", false, 0, R.static_value("Input", "Key_4")])
										else:
											pass
											if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_MountedWeapon")))):
												pass
												R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Use the mounted weapon with the mounted weapon key.", "SingleKey", false, 0, R.static_value("Input", "Key_5")])
											else:
												pass
												if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_DropCiv")))):
													pass
													R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Drop civilians at churches or police stations for extra RPs.", "SimpleMessage"])
												else:
													pass
													if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleDriver")))):
														pass
														R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Mash the interact key to get out of a driver side grapple!", "SideGrappleDriver", true, (v_info).fields.get("m_iHandbrakeKey")])
													else:
														pass
														if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleGunner")))):
															pass
															R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Mash the mouse left button to get out of a gunner side grapple!", "SideGrappleGunner", true])
														else:
															pass
															if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Location")))):
																pass
																R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["You can stop at locations such as garages, churches, weapon crates, etc to get supplies and upgrades.", "SimpleMessage"])
															else:
																pass
																if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Med")))):
																	pass
																	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Click the icons to use your meds.  You have a limited supply, use them wisely.", "Med"])
																else:
																	pass
																	if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_Chopper")))):
																		pass
																		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["The chopper assist is available, call it by clicking the chopper icon when you need assistance.", "Chopper"])
																	else:
																		pass
																		if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_SwitchDriver")))):
																			pass
																			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["You can switch seats with the switch key if you want change who's driving and who's shooting.", "SingleKey", false, 0, (v_info).fields.get("m_iSwitchDriverKey")])
																		else:
																			pass
																			if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_UpgradeSystem")))):
																				pass
																				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Your vehicle and weapons are ugpraded by stopping at locations in the city, look out for them!", "SimpleMessage"])
																			else:
																				pass
																				if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_ExtraSwerve")))):
																					pass
																					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Hold the swerve key to make sharp turns to avoid obstacles easier.", "SingleKey", false, 0, (v_info).fields.get("m_iHandbrakeKey")])
																				else:
																					pass
																					if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_ExtraLocation")))):
																						pass
																						R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Stop at garages, police stations, etc for vehicle and weapon upgrades and supplies.", "SimpleMessage"])
																					else:
																						pass
																						if R.truth((float(v_iTutorial) == float(R.static_value("RDGameModeGameplay", "Tutorial_ExtraExtraLocation")))):
																							pass
																							R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTutorial", ["Stop at churches, weapon crates, etc for upgrades and supplies.", "SimpleMessage"])
	(c).fields["m_fTutorialTime"] = float(0)
	return null

static func f_UpdateTutorials(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	v_info = R.coerce((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "RDPlayerInfo")
	if R.truth(R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "IsTutorialShown", [])):
		pass
		if R.truth((((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Accel"))) and (v_info).fields.get("m_bPressedAccel")) and (v_info).fields.get("m_bPressedBrake"))):
			pass
			R.call_member(c, "HideTutorial", [])
			(v_info).fields["m_bSeenAccelTutorial"] = true
		else:
			pass
			if R.truth((((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Turn"))) and (v_info).fields.get("m_bPressedLeft")) and (v_info).fields.get("m_bPressedRight"))):
				pass
				R.call_member(c, "HideTutorial", [])
				(v_info).fields["m_bSeenTurnTutorial"] = true
			else:
				pass
				if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Mouse"))) and (v_info).fields.get("m_bPressedShoot"))):
					pass
					R.call_member(c, "HideTutorial", [])
					(v_info).fields["m_bSeenMouseTutorial"] = true
				else:
					pass
					if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Reload"))) and (v_info).fields.get("m_bPressedReload"))):
						pass
						R.call_member(c, "HideTutorial", [])
						(v_info).fields["m_bSeenReloadTutorial"] = true
					else:
						pass
						if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_WeaponSelection"))) and (v_info).fields.get("m_bPressedWeaponSelection"))):
							pass
							R.call_member(c, "HideTutorial", [])
							(v_info).fields["m_bSeenWeaponSelectionTutorial"] = true
						else:
							pass
							if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_WeaponCycle"))) and (v_info).fields.get("m_bPressedWeaponCycle"))):
								pass
								R.call_member(c, "HideTutorial", [])
								(v_info).fields["m_bSeenWeaponCycleTutorial"] = true
							else:
								pass
								if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Swerve"))) and (float((v_info).fields.get("m_iPressSwerveCount")) >= float(2)))):
									pass
									R.call_member(c, "HideTutorial", [])
									(v_info).fields["m_bSeenSwerveTutorial"] = true
								else:
									pass
									if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_ExtraSwerve"))) and (float((v_info).fields.get("m_iPressSwerveCount")) >= float(4)))):
										pass
										R.call_member(c, "HideTutorial", [])
										(v_info).fields["m_bSeenExtraSwerveTutorial"] = true
									else:
										pass
										if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_Horn"))) and (v_info).fields.get("m_bPressedHorn"))):
											pass
											R.call_member(c, "HideTutorial", [])
											(v_info).fields["m_bSeenHornTutorial"] = true
										else:
											pass
											if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_ThirdWeapon"))) and (v_info).fields.get("m_bPressedThirdWeapon"))):
												pass
												R.call_member(c, "HideTutorial", [])
												(v_info).fields["m_bSeenThirdWeaponTutorial"] = true
											else:
												pass
												if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_FourthWeapon"))) and (v_info).fields.get("m_bPressedFourthWeapon"))):
													pass
													R.call_member(c, "HideTutorial", [])
													(v_info).fields["m_bSeenFourthWeaponTutorial"] = true
												else:
													pass
													if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_MountedWeapon"))) and (v_info).fields.get("m_bPressedMountedWeapon"))):
														pass
														R.call_member(c, "HideTutorial", [])
														(v_info).fields["m_bSeenMountedWeaponTutorial"] = true
													else:
														pass
														if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleDriver"))) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_ClingerSideLeft")))):
															pass
															R.call_member(c, "HideTutorial", [])
															R.set_value(v_info, "m_iSeenSideGrappleDriverTutorial", 1, "+=")
														else:
															pass
															if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleGunner"))) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_ClingerSideRight")))):
																pass
																R.call_member(c, "HideTutorial", [])
																R.set_value(v_info, "m_iSeenSideGrappleGunnerTutorial", 1, "+=")
															else:
																pass
																if R.truth(((float((c).fields.get("m_iTutorial")) == float(R.static_value("RDGameModeGameplay", "Tutorial_SwitchDriver"))) and (v_info).fields.get("m_bPressedSwitchDriver"))):
																	pass
																	R.call_member(c, "HideTutorial", [])
																	(v_info).fields["m_bSeenSwitchDriverTutorial"] = true
	else:
		pass
		(c).fields["m_fTutorialTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTutorialTime"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fTutorialTime")) > float(1))):
			pass
			if R.truth((R.unary("!", (v_info).fields.get("m_bSeenAccelTutorial")) and (R.unary("!", (v_info).fields.get("m_bPressedAccel")) or R.unary("!", (v_info).fields.get("m_bPressedBrake"))))):
				pass
				R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Accel")])
			else:
				pass
				if R.truth((R.unary("!", (v_info).fields.get("m_bSeenTurnTutorial")) and (R.unary("!", (v_info).fields.get("m_bPressedLeft")) or R.unary("!", (v_info).fields.get("m_bPressedRight"))))):
					pass
					R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Turn")])
				else:
					pass
					if R.truth((R.unary("!", (v_info).fields.get("m_bSeenMouseTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedShoot")))):
						pass
						R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Mouse")])
					else:
						pass
						if R.truth((R.unary("!", (v_info).fields.get("m_bSeenReloadTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedReload")))):
							pass
							R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Reload")])
						else:
							pass
							if R.truth((R.unary("!", (v_info).fields.get("m_bSeenWeaponSelectionTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedWeaponSelection")))):
								pass
								R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_WeaponSelection")])
							else:
								pass
								if R.truth((R.unary("!", (v_info).fields.get("m_bSeenSwitchDriverTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedSwitchDriver")))):
									pass
									R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_SwitchDriver")])
								else:
									pass
									if R.truth((R.unary("!", (v_info).fields.get("m_bSeenWeaponCycleTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedWeaponCycle")))):
										pass
										R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_WeaponCycle")])
									else:
										pass
										if R.truth((R.unary("!", (v_info).fields.get("m_bSeenSwerveTutorial")) and (float((v_info).fields.get("m_iPressSwerveCount")) < float(2)))):
											pass
											R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Swerve")])
										else:
											pass
											if R.truth((R.unary("!", (v_info).fields.get("m_bSeenHornTutorial")) and R.unary("!", (v_info).fields.get("m_bPressedHorn")))):
												pass
												R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Horn")])
											else:
												pass
												if R.truth(R.unary("!", (v_info).fields.get("m_bSeenUpgradeSystemTutorial"))):
													pass
													R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_UpgradeSystem")])
													(v_info).fields["m_bSeenUpgradeSystemTutorial"] = true
												else:
													pass
													if R.truth(R.logical_and(R.logical_and(R.unary("!", (v_info).fields.get("m_bSeenThirdWeaponTutorial")), func(): return R.call_member(c.fields.get("m_Player"), "HasWeapon", [2])), func(): return R.unary("!", (v_info).fields.get("m_bPressedThirdWeapon")))):
														pass
														R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_ThirdWeapon")])
													else:
														pass
														if R.truth(R.logical_and(R.logical_and(R.unary("!", (v_info).fields.get("m_bSeenFourthWeaponTutorial")), func(): return R.call_member(c.fields.get("m_Player"), "HasWeapon", [3])), func(): return R.unary("!", (v_info).fields.get("m_bPressedFourthWeapon")))):
															pass
															R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_FourthWeapon")])
														else:
															pass
															if R.truth(R.logical_and(R.logical_and(R.unary("!", (v_info).fields.get("m_bSeenMountedWeaponTutorial")), func(): return R.call_member(c.fields.get("m_Player"), "HasWeapon", [4])), func(): return R.unary("!", (v_info).fields.get("m_bPressedMountedWeapon")))):
																pass
																R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_MountedWeapon")])
															else:
																pass
																if R.truth((R.unary("!", (v_info).fields.get("m_bSeenDropCivTutorial")) and (float((v_info).fields.get("m_iCivsInCar")) > float(0)))):
																	pass
																	R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_DropCiv")])
																	(v_info).fields["m_bSeenDropCivTutorial"] = true
																else:
																	pass
																	if R.truth(((float((v_info).fields.get("m_iSeenSideGrappleDriverTutorial")) < float(3)) and R.truth((c.fields.get("m_Player")).fields.get("m_ClingerSideLeft")))):
																		pass
																		R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleDriver")])
																	else:
																		pass
																		if R.truth(((float((v_info).fields.get("m_iSeenSideGrappleGunnerTutorial")) < float(3)) and R.truth((c.fields.get("m_Player")).fields.get("m_ClingerSideRight")))):
																			pass
																			R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_SideGrappleGunner")])
																		else:
																			pass
																			if R.truth((R.unary("!", (v_info).fields.get("m_bSeenLocationTutorial")) and (float((c.fields.get("m_Player")).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_RepairRadio"))))):
																				pass
																				R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Location")])
																				(v_info).fields["m_bSeenLocationTutorial"] = true
																			else:
																				pass
																				if R.truth((R.unary("!", (v_info).fields.get("m_bSeenMedTutorial")) and ((float((v_info).fields.get("m_iMedHeals")) > float(0)) or (float((v_info).fields.get("m_iMedShields")) > float(0))))):
																					pass
																					R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Med")])
																					(v_info).fields["m_bSeenMedTutorial"] = true
																				else:
																					pass
																					if R.truth(R.logical_and(R.unary("!", (v_info).fields.get("m_bSeenChopperTutorial")), func(): return R.call_member(c, "CanCallChopperSupport", []))):
																						pass
																						R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_Chopper")])
																						(v_info).fields["m_bSeenChopperTutorial"] = true
																					else:
																						pass
																						if R.truth(((R.unary("!", (v_info).fields.get("m_bSeenExtraSwerveTutorial")) and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float(300))) and (float((v_info).fields.get("m_iPressSwerveCount")) < float(4)))):
																							pass
																							R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_ExtraSwerve")])
																						else:
																							pass
																							if R.truth(((R.unary("!", (v_info).fields.get("m_bSeenExtraLocationTutorial")) and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float(500))) and R.unary("!", (v_info).fields.get("m_bStoppedAtLocation")))):
																								pass
																								R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_ExtraLocation")])
																								(v_info).fields["m_bSeenExtraLocationTutorial"] = true
																							else:
																								pass
																								if R.truth(((R.unary("!", (v_info).fields.get("m_bSeenExtraExtraLocationTutorial")) and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float(1000))) and R.unary("!", (v_info).fields.get("m_bStoppedAtLocation")))):
																									pass
																									R.call_member(c, "ShowTutorial", [R.static_value("RDGameModeGameplay", "Tutorial_ExtraExtraLocation")])
																									(v_info).fields["m_bSeenExtraExtraLocationTutorial"] = true
	if R.truth((c.fields.get("m_Player")).fields.get("m_bHandBraking")):
		pass
		(c).fields["m_fSwerveTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSwerveTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fSwerveTimer")) > float(0.25))):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iPressSwerveCount", 1, "+=")
			(c).fields["m_fSwerveTimer"] = float(0)
	else:
		pass
		(c).fields["m_fSwerveTimer"] = float(0)
	return null

static func f_TrySpawnMotionMines(c: Variant, a: Array) -> Variant:
	var v_fSpawnPos: Variant = NAN
	var v_fLimit: Variant = NAN
	var v_iNbMines: Variant = 0
	var v_bLeft: Variant = false
	var v_fStartMinePos: Variant = NAN
	var v_fPosOffset: Variant = NAN
	var v_lastMine: Variant = null
	var v_previousMine: Variant = null
	var v_i: Variant = 0
	var v_mine: Variant = null
	var v_fStartPos: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpawnPos = float(NAN)
	v_fLimit = float(NAN)
	v_iNbMines = R.coerce(0, "int")
	v_bLeft = false
	v_fStartMinePos = float(NAN)
	v_fPosOffset = float(NAN)
	v_lastMine = R.coerce(null, "RDMotionDetectorMine")
	v_previousMine = R.coerce(null, "RDMotionDetectorMine")
	v_i = R.coerce(0, "int")
	v_mine = R.coerce(null, "RDMotionDetectorMine")
	if R.truth(((float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iMotionMineLevel"))) and (float(v_fStartPos) > float((c).fields.get("m_fNextMotionMinesSpawnPosition"))))):
		pass
		v_fSpawnPos = float((float(v_fStartPos) + float((float(randf()) * float(50)))))
		v_fLimit = R.coerce(R.call_member((c).fields.get("m_Road"), "GetRoadAreaAt", [v_fSpawnPos]), "Number")
		v_iNbMines = R.coerce(floorf(float(R.binary("/", (float(v_fLimit) * float(2)), R.static_value("RDGameModeGameplay", "MotionMineSpacing")))), "int")
		v_bLeft = (float(randf()) > float(0.5))
		v_fStartMinePos = R.coerce((R.binary("+", R.unary("-", v_fLimit), 0.5) if R.truth(v_bLeft) else (float(v_fLimit) - float(0.5))), "Number")
		v_fPosOffset = R.coerce(R.binary("+", R.unary("-", 1), (float(randf()) * float(2))), "Number")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbMines))):
			pass
			v_mine = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDMotionDetectorMine")]), R.klass("RDMotionDetectorMine")), "RDMotionDetectorMine")
			R.call_member(v_mine, "Init", [(float(v_i) == float(0))])
			((v_mine).fields.get("m_vLocation")).fields["Z"] = float((float(v_fSpawnPos) + float((float(v_i) * float(v_fPosOffset)))))
			((v_mine).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((v_mine).fields.get("m_vLocation")).fields.get("Z")]), v_fStartMinePos), (float(v_i) * R.num((R.static_value("RDGameModeGameplay", "MotionMineSpacing") if R.truth(v_bLeft) else R.unary("-", R.static_value("RDGameModeGameplay", "MotionMineSpacing")))))), "Number")
			((v_mine).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_mine).fields.get("m_vLocation")).fields.get("Z")]), "Number")
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_mine, ((v_mine).fields.get("m_vLocation")).fields.get("X"), ((v_mine).fields.get("m_vLocation")).fields.get("Y"), ((v_mine).fields.get("m_vLocation")).fields.get("Z")])
			(v_mine).fields["m_PreviousMine"] = R.coerce(v_lastMine, "RDMotionDetectorMine")
			if R.truth(v_lastMine):
				pass
				(v_lastMine).fields["m_NextMine"] = R.coerce(v_mine, "RDMotionDetectorMine")
			v_lastMine = R.coerce(v_mine, "RDMotionDetectorMine")
			v_i = R.signed32(v_i + 1)
		(c).fields["m_fNextMotionMinesSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextMotionMinesSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMax")) - float(R.static_value("RDGameModeGameplay", "MotionMinesSpacingMin")))))))), "Number")
	return null

static func f_HandleSkillsIHaveThoseAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((float((c).fields.get("m_iComboCount")) >= float(R.static_value("RDAchievement", "SkillsIHaveThoseCount"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "SkillsIHaveThose"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "SkillsIHaveThose")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_HandleRapidResponseAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((float((c).fields.get("m_iComboCount")) >= float(R.static_value("RDAchievement", "RapidResponseCount"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "RapidResponse"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "RapidResponse")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnNewLevelArea(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Residential")))):
			pass
			((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaResidential"] = true
		else:
			pass
			if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Town")))):
				pass
				((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaTown"] = true
			else:
				pass
				if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Industrial")))):
					pass
					((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaIndustrial"] = true
				else:
					pass
					if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
						pass
						((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaPark"] = true
					else:
						pass
						if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
							pass
							((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaAlleyway"] = true
						else:
							pass
							if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Highway")))):
								pass
								((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaHighway"] = true
							else:
								pass
								if R.truth((float((c).fields.get("m_iLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
									pass
									((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenAreaCemetery"] = true
		if R.truth((((((((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaResidential") and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaTown")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaIndustrial")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaPark")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaAlleyway")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaHighway")) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenAreaCemetery")) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ScenicRoute"))))):
			pass
			R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "ScenicRoute")])
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_InitTotalLevelLength(c: Variant, a: Array) -> Variant:
	var v_iNbLevels: Variant = 0
	var v_i: Variant = 0
	(c).fields["m_fTotalLevelLength"] = float(0)
	v_iNbLevels = R.coerce((R.num(R.get_value((c).fields.get("m_LevelLengths"), "length")) - float(1)), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbLevels))):
		pass
		(c).fields["m_fTotalLevelLength"] = R.coerce(R.binary("+", (c).fields.get("m_fTotalLevelLength"), R.num(R.get_value((c).fields.get("m_LevelLengths"), v_i))), "Number")
		v_i = R.signed32(v_i + 1)
	return null

static func f_GetHelicopterDelay(c: Variant, a: Array) -> Variant:
	return (float(R.num(R.get_value((c).fields.get("m_HelicopterDelayMins"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_HelicopterDelayMins"), "length")) - float(1))))))) + float((float(randf()) * float(R.num(R.get_value((c).fields.get("m_HelicopterDelayRandoms"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_HelicopterDelayRandoms"), "length")) - float(1))))))))))
	return null

static func f_GetJetDelay(c: Variant, a: Array) -> Variant:
	return (float(R.num(R.get_value((c).fields.get("m_JetDelayMins"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_JetDelayMins"), "length")) - float(1))))))) + float((float(randf()) * float(R.num(R.get_value((c).fields.get("m_JetDelayRandoms"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_JetDelayRandoms"), "length")) - float(1))))))))))
	return null

static func f_ShouldSpawnSoldierForZombie(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_SuppressSoldiers(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = null
	var v_i: Variant = 0
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_soldier = R.coerce(null, "RDSoldier")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "length"))):
		pass
		v_soldier = R.coerce(R.get_value(R.static_value("RDSoldier", "AllSoldiers"), v_i), "RDSoldier")
		R.call_member(v_soldier, "Suppress", [v_vPos])
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnSeeRamp(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayExitRampVoice", [])
	else:
		pass
		R.call_member(c.fields.get("m_Player"), "PlayRampVoice", [])
	return null

static func f_CanHaveExplodingCars(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iExplodingCarLevel")))
	return null

static func f_CanSpawnHiddenSoldier(c: Variant, a: Array) -> Variant:
	return ((float((c).fields.get("m_iLevel")) > float((c).fields.get("m_iHiddenSoldierLevel"))) or ((float((c).fields.get("m_iLevel")) == float((c).fields.get("m_iHiddenSoldierLevel"))) and R.unary("!", R.call_member(c, "HasActiveStoryDialog", []))))
	return null

static func f_CanPlayNotMovingDialog(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_SetNewgroundsScoreboard(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(R.klass("com.newgrounds.API"), "hasUserSession")):
		pass
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", true, "=")
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
	else:
		pass
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", true, "=")
	return null

static func f_OnPassportLogin(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "Login"), "mouseEnabled", false, "=")
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "USER_SIGNED_IN"), R.get_value(c, "onUserSignedIn")])
	R.call_static("com.newgrounds.API", "promptSignIn", [])
	return null

static func f_OnPassportNoThanks(c: Variant, a: Array) -> Variant:
	R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", true, "=")
	R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
	return null

static func f_onUserSignedIn(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_e, "success")):
		pass
		R.call_member(c, "PostScore", [])
		R.call_member(c, "SetNewgroundsScoreboard", [])
	R.set_value(R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "Login"), "mouseEnabled", true, "=")
	return null

static func f_PostScore(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_ReplenishEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetBounceFactor(c: Variant, a: Array) -> Variant:
	return 1
	return null

static func f_IsMountedMGEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_IsMountedRocketLauncherEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_InfiniteMountedWeaponEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_SwitchDriverEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetPlayerSpeedFactor(c: Variant, a: Array) -> Variant:
	return 1
	return null

static func f_GetHelicopterLevel(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float((float((c).fields.get("m_iLevel")) - float((c).fields.get("m_iHelicopterLevel")))) + float(1)), 1, 10])
	return null

static func f_GetJetDrops(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float((float((c).fields.get("m_iLevel")) - float((c).fields.get("m_iJetLevel")))) + float(1)), 1, 4])
	return null

static func f_GetJetPlayDialogs(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_SteeringEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_BrakingEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_SwervingEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_iMinSpawnMax")) + float((float((c).fields.get("m_fLevelDifficulty")) * float((float((c).fields.get("m_iMaxSpawnMax")) - float((c).fields.get("m_iMinSpawnMax")))))))
	return null

static func f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_fMinSpawnRate")) + float((float((c).fields.get("m_fLevelDifficulty")) * float((float((c).fields.get("m_fMaxSpawnRate")) - float((c).fields.get("m_fMinSpawnRate")))))))
	return null

static func f_IsFUBARMode(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_NoSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_AllSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_IsLavaInstantDeathEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_GetMaxSpawnZombies(c: Variant, a: Array) -> Variant:
	return R.unary("-", 1)
	return null

static func f_GetSpawnZombiesSide(c: Variant, a: Array) -> Variant:
	return 0
	return null

static func f_HasIndependantPlayerControl(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return "Distance"
	return null

static func f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float((c).fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100)
	return null

static func f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return "km"
	return null

static func f_CanSpawnGrub(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bCanSpawnGrub")
	return null

static func f_CanDoJetVoices(c: Variant, a: Array) -> Variant:
	return R.call_member(c, "IsFUBARMode", [])
	return null

static func f_UsingCustomMeds(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_UsingCustomMountedWeapons(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_HasRocketLauncher(c: Variant, a: Array) -> Variant:
	return (((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked") if R.truth(R.call_member(c, "UsingCustomMountedWeapons", [])) else ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked"))
	return null

static func f_HasMountedMG(c: Variant, a: Array) -> Variant:
	return (((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked") if R.truth(R.call_member(c, "UsingCustomMountedWeapons", [])) else ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_MountedMG")).fields.get("m_bUnlocked"))
	return null

static func f_SkipZombiesForTutorial(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_OnPostStartUpUpgradeScreen(c: Variant, a: Array) -> Variant:
	var v_music: Variant = null
	v_music = R.coerce(R.call_member(c, "GetMusic", []), "DTSound")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [v_music, 0])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Area_Residential", 0, "=")
	R.set_value(c, "Area_Town", 1, "=")
	R.set_value(c, "Area_Industrial", 2, "=")
	R.set_value(c, "Area_Park", 3, "=")
	R.set_value(c, "Area_Alleyway", 4, "=")
	R.set_value(c, "Area_Highway", 5, "=")
	R.set_value(c, "Area_Parking", 6, "=")
	R.set_value(c, "Area_ChopperShooting", 7, "=")
	R.set_value(c, "Area_Cemetery", 8, "=")
	R.set_value(c, "Area_Checkpoint", 9, "=")
	R.set_value(c, "Area_JohnHighway", 10, "=")
	R.set_value(c, "MutantAttack_Front", 0, "=")
	R.set_value(c, "MutantAttack_Back", 1, "=")
	R.set_value(c, "MutantAttack_Side", 2, "=")
	R.set_value(c, "MutantAttack_AllSides", 3, "=")
	R.set_value(c, "PreStatsDelay", 2, "=")
	R.set_value(c, "NoZombieMargin", 400, "=")
	R.set_value(c, "PointsPerMeter", 0.03, "=")
	R.set_value(c, "PointsPerCivilianDropped", 20, "=")
	R.set_value(c, "PointsPerCivilianTaken", 10, "=")
	R.set_value(c, "PointsPenaltyPerCivilianKilled", 10, "=")
	R.set_value(c, "ComboDelay", 2, "=")
	R.set_value(c, "ComboPoints", 2, "=")
	R.set_value(c, "ComboMultiplier", 1.1, "=")
	R.set_value(c, "MaxComboMultiplier", 2, "=")
	R.set_value(c, "HeadshotComboDelay", 1, "=")
	R.set_value(c, "YellowLineViewDistance", 80, "=")
	R.set_value(c, "YellowLineSpacing", 20, "=")
	R.set_value(c, "BuildingViewDistance", 200, "=")
	R.set_value(c, "BuildingSpacing", 40, "=")
	R.set_value(c, "RoadSignViewDistance", 200, "=")
	R.set_value(c, "RoadSignSpacingMin", 150, "=")
	R.set_value(c, "RoadSignSpacingRandom", 100, "=")
	R.set_value(c, "RoadSignInitialSpawnDistance", 50, "=")
	R.set_value(c, "WaterJugChance", 0.25, "=")
	R.set_value(c, "ResidentialLengthMin", 90, "=")
	R.set_value(c, "ResidentialLengthMax", 450, "=")
	R.set_value(c, "TownLengthMin", 90, "=")
	R.set_value(c, "TownLengthMax", 450, "=")
	R.set_value(c, "IndustrialLengthMin", 90, "=")
	R.set_value(c, "IndustrialLengthMax", 450, "=")
	R.set_value(c, "ParkLengthMin", 90, "=")
	R.set_value(c, "ParkLengthMax", 270, "=")
	R.set_value(c, "CemeteryLengthMin", 90, "=")
	R.set_value(c, "CemeteryLengthMax", 180, "=")
	R.set_value(c, "AlleywayLengthMin", 90, "=")
	R.set_value(c, "AlleywayLengthMax", 270, "=")
	R.set_value(c, "HighwayLengthMin", 450, "=")
	R.set_value(c, "HighwayLengthMax", 1080, "=")
	R.set_value(c, "PatternInitialSpawnDistance", 50, "=")
	R.set_value(c, "PatternViewDistance", 200, "=")
	R.set_value(c, "PatternSpacingMin", 0, "=")
	R.set_value(c, "PatternSpacingRandom", 0, "=")
	R.set_value(c, "HighwayHardPatternSpacingMin", 200, "=")
	R.set_value(c, "HighwayHardPatternSpacingRandom", 100, "=")
	R.set_value(c, "HighwaySpecialPatternSpacingMin", 400, "=")
	R.set_value(c, "HighwaySpecialPatternSpacingRandom", 300, "=")
	R.set_value(c, "HardPatternSpacingMin", 200, "=")
	R.set_value(c, "HardPatternSpacingRandom", 200, "=")
	R.set_value(c, "SpecialPatternSpacingMin", 200, "=")
	R.set_value(c, "SpecialPatternSpacingRandom", 200, "=")
	R.set_value(c, "SpecialPatternSpacingMinIncrement", 20, "=")
	R.set_value(c, "SpecialPatternSpacingRandomIncrement", 40, "=")
	R.set_value(c, "CheckpointPatternSpacingMin", 200, "=")
	R.set_value(c, "CheckpointPatternSpacingRandom", 200, "=")
	R.set_value(c, "MotionMinesSpacingMin", 400, "=")
	R.set_value(c, "MotionMinesSpacingMax", 800, "=")
	R.set_value(c, "MotionMineSpacing", 3, "=")
	R.set_value(c, "SpawnBuildingDistanceMin", 35, "=")
	R.set_value(c, "SpawnBuildingDistanceMax", 60, "=")
	R.set_value(c, "MutantSpawnDelayMin", 0.7, "=")
	R.set_value(c, "MutantSpawnDelayMax", 1.5, "=")
	R.set_value(c, "SoundFadeDuration", 8, "=")
	R.set_value(c, "Tutorial_None", R.unary("-", 1), "=")
	R.set_value(c, "Tutorial_Accel", 0, "=")
	R.set_value(c, "Tutorial_Turn", 1, "=")
	R.set_value(c, "Tutorial_Mouse", 2, "=")
	R.set_value(c, "Tutorial_Reload", 3, "=")
	R.set_value(c, "Tutorial_WeaponSelection", 4, "=")
	R.set_value(c, "Tutorial_WeaponCycle", 5, "=")
	R.set_value(c, "Tutorial_Swerve", 6, "=")
	R.set_value(c, "Tutorial_Horn", 7, "=")
	R.set_value(c, "Tutorial_ThirdWeapon", 8, "=")
	R.set_value(c, "Tutorial_FourthWeapon", 9, "=")
	R.set_value(c, "Tutorial_MountedWeapon", 10, "=")
	R.set_value(c, "Tutorial_Interact", 11, "=")
	R.set_value(c, "Tutorial_DropCiv", 12, "=")
	R.set_value(c, "Tutorial_SideGrappleDriver", 13, "=")
	R.set_value(c, "Tutorial_Location", 14, "=")
	R.set_value(c, "Tutorial_Med", 15, "=")
	R.set_value(c, "Tutorial_Chopper", 16, "=")
	R.set_value(c, "Tutorial_SwitchDriver", 17, "=")
	R.set_value(c, "Tutorial_UpgradeSystem", 18, "=")
	R.set_value(c, "Tutorial_ExtraSwerve", 19, "=")
	R.set_value(c, "Tutorial_ExtraLocation", 20, "=")
	R.set_value(c, "Tutorial_ExtraExtraLocation", 21, "=")
	R.set_value(c, "Tutorial_SideGrappleGunner", 22, "=")
	R.set_value(c, "DistanceScreenDelay", 2, "=")
	R.set_value(c, "FogInterpSpeed", 20, "=")
	R.set_value(c, "HighwayTransitionDistance", 200, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bShowStats"] = false
	(c).fields["m_bDoneShowingStats"] = false
	(c).fields["m_bShowDistance"] = false
	(c).fields["m_iComboPoints"] = R.coerce(0, "int")
	(c).fields["m_iNbSlowZombieKills"] = R.coerce(0, "int")
	(c).fields["m_fStatsTimer"] = float(NAN)
	(c).fields["m_fComboTime"] = float(NAN)
	(c).fields["m_iComboCount"] = R.coerce(0, "int")
	(c).fields["m_fComboMultiplier"] = float(1)
	(c).fields["m_fHeadshotComboTime"] = float(NAN)
	(c).fields["m_iHeadshotComboCount"] = R.coerce(0, "int")
	(c).fields["m_StartEngineSound"] = R.coerce(null, "DTSound")
	(c).fields["m_fLevelDifficulty"] = float(NAN)
	(c).fields["m_fNextYellowLineSpawnPosition"] = float(NAN)
	(c).fields["m_fNextBuildingSpawnPosition"] = float(NAN)
	(c).fields["m_fNextRoadSignSpawnPosition"] = float(NAN)
	(c).fields["m_iBestHitCombo"] = R.coerce(0, "int")
	(c).fields["m_Road"] = R.coerce(null, "RDRoad")
	(c).fields["m_UpgradeScreen"] = R.coerce(null, "RDUpgradeScreen")
	(c).fields["m_LevelLengths"] = R.coerce(null, "Array")
	(c).fields["m_fTotalLevelLength"] = float(NAN)
	(c).fields["m_fLevelAreaStartPosition"] = float(NAN)
	(c).fields["m_fPlayerStartPosition"] = float(NAN)
	(c).fields["m_fPlayerPos"] = float(NAN)
	(c).fields["m_bIsHighwayLevel"] = false
	(c).fields["m_bStartAtHighSpeed"] = false
	(c).fields["m_iLevel"] = R.coerce(0, "int")
	(c).fields["m_fLevelStartPosition"] = float(NAN)
	(c).fields["m_fLevelLength"] = float(NAN)
	(c).fields["m_iSpawnLevel"] = R.coerce(0, "int")
	(c).fields["m_fSpawnLevelStartPosition"] = float(NAN)
	(c).fields["m_iLevelArea"] = R.coerce(0, "int")
	(c).fields["m_iSpawnLevelArea"] = R.coerce(0, "int")
	(c).fields["m_fSpecialPatternPosition"] = float(NAN)
	(c).fields["m_fCheckpointPatternPosition"] = float(NAN)
	(c).fields["m_bSpawnChurch"] = false
	(c).fields["m_bSpawnPoliceStation"] = false
	(c).fields["m_bSpawnWeapons"] = false
	(c).fields["m_bSpawnGarage"] = false
	(c).fields["m_bSpawnCheckpoint"] = false
	(c).fields["m_bSpawnRamp"] = false
	(c).fields["m_fSpawnRampPosition"] = float(NAN)
	(c).fields["m_fHighwayPerlinPos"] = float(NAN)
	(c).fields["m_fNextPatternSpawnPosition"] = float(NAN)
	(c).fields["m_fNextHardPatternSpawnPosition"] = float(NAN)
	(c).fields["m_fSpawnLevelLength"] = float(NAN)
	(c).fields["m_fNextMotionMinesSpawnPosition"] = float(NAN)
	(c).fields["m_LevelNormalHighwayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelHardHighwayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelCheckpointHighwayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelWeaponsHighwayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelJohnHighwayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialBlockedPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialCheckpointPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownBlockedPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownCheckpointPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelIndustrialPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelIndustrialBlockedPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelIndustrialCheckpointPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelParkPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelCemeteryPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelParkingPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelChopperShootingPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelAlleywayPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialChurchPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialPoliceStationPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownChurchPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownPoliceStationPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialWeaponsPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownWeaponsPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelIndustrialWeaponsPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelParkWeaponsPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelCemeteryWeaponsPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelResidentialGaragePatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelTownGaragePatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelIndustrialGaragePatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelRampPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_LevelRampExitPatterns"] = R.coerce(null, "RandomHat")
	(c).fields["m_SpawnManager"] = R.coerce(null, "RDSpawnManager")
	(c).fields["m_Mutants"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_fMutantTimer"] = float(0)
	(c).fields["m_fMutantDelay"] = float(0)
	(c).fields["m_MutantDelayMins"] = R.coerce(null, "Array")
	(c).fields["m_MutantDelayRandoms"] = R.coerce(null, "Array")
	(c).fields["m_MutantCounts"] = R.coerce(null, "Array")
	(c).fields["m_iMutantSpawnIndex"] = R.coerce(0, "int")
	(c).fields["m_iNbMutantsToSpawn"] = R.coerce(0, "int")
	(c).fields["m_fSpawnMutantTimer"] = float(NAN)
	(c).fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	(c).fields["m_Helicopter"] = R.coerce(null, "RDHelicopter")
	(c).fields["m_iHelicopterLevel"] = R.coerce(1410065407, "int")
	(c).fields["m_iHelicopterMissileLevel"] = R.coerce(0, "int")
	(c).fields["m_fHelicopterTimer"] = float(NAN)
	(c).fields["m_fHelicopterDelay"] = float(NAN)
	(c).fields["m_HelicopterDelayMins"] = R.coerce(null, "Array")
	(c).fields["m_HelicopterDelayRandoms"] = R.coerce(null, "Array")
	(c).fields["m_Jet"] = R.coerce(null, "RDJet")
	(c).fields["m_fJetTimer"] = float(NAN)
	(c).fields["m_fJetDelay"] = float(NAN)
	(c).fields["m_iJetLevel"] = R.coerce(0, "int")
	(c).fields["m_JetDelayMins"] = R.coerce(null, "Array")
	(c).fields["m_JetDelayRandoms"] = R.coerce(null, "Array")
	(c).fields["m_bCanHaveChopperSupport"] = true
	(c).fields["m_fChopperSupportDistanceCum"] = float(NAN)
	(c).fields["m_bChopperSupportAvailable"] = false
	(c).fields["m_fChopperSupportPlayerPos"] = float(NAN)
	(c).fields["m_fChopperSupportTimer"] = float(NAN)
	(c).fields["m_iChopperSupportCount"] = R.coerce(0, "int")
	(c).fields["m_SpawnBuildings"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_MutantAttackTypes"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_MutantEntries"] = R.coerce(null, "RandomHat")
	(c).fields["m_iStationarySoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iAlignSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iSpikeSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iHiddenSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iBombSoldierLevel"] = R.coerce(0, "int")
	(c).fields["m_iHardZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iVeryHardZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iFeedersLevel"] = R.coerce(0, "int")
	(c).fields["m_iSpikesLevel"] = R.coerce(0, "int")
	(c).fields["m_iNewMaleZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iNewFemaleZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iSoldierZombieLevel"] = R.coerce(0, "int")
	(c).fields["m_iExplodingCarLevel"] = R.coerce(0, "int")
	(c).fields["m_iMineLevel"] = R.coerce(0, "int")
	(c).fields["m_iMotionMineLevel"] = R.coerce(0, "int")
	(c).fields["m_iFuelTruckLevel"] = R.coerce(0, "int")
	(c).fields["m_iGrubLevel"] = R.coerce(0, "int")
	(c).fields["m_bCanSpawnGrub"] = true
	(c).fields["m_fSpawnRatioBaseNormal"] = float(NAN)
	(c).fields["m_fSpawnRatioIncrementNormal"] = float(NAN)
	(c).fields["m_fSpawnRatioBaseHard"] = float(NAN)
	(c).fields["m_fSpawnRatioIncrementHard"] = float(NAN)
	(c).fields["m_iSpawnPursuingMutant"] = R.coerce(0, "int")
	(c).fields["m_iSpecialLocation"] = R.coerce(0, "int")
	(c).fields["m_ZombieClasses"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_FeedZombieClasses"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_bPlayStartEngineSound"] = true
	(c).fields["m_fTutorialTime"] = float(0)
	(c).fields["m_iTutorial"] = R.coerce(0, "int")
	(c).fields["m_SpawnedAreas"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SpawnedAreaLengths"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_bHideMouse"] = false
	(c).fields["m_IntroDialog"] = R.coerce(null, "Array")
	(c).fields["m_bPlayIntroDialog"] = false
	(c).fields["m_bAddAutomaticHighwayPerlinNoise"] = true
	(c).fields["m_DistanceScreen"] = R.coerce(null, "MC_DistanceStatsScreen")
	(c).fields["m_fDistanceScreenTimer"] = float(NAN)
	(c).fields["m_bDistanceScreenReady"] = false
	(c).fields["m_vSpawnBuildingLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fZombieSpeedFactor"] = float(1)
	(c).fields["m_fZombieHPFactor"] = float(1)
	(c).fields["m_fOilSlipperinessFactor"] = float(1)
	(c).fields["m_fImpactSpeedLossFactor"] = float(1)
	(c).fields["m_fVehicleHPFactor"] = float(1)
	(c).fields["m_bExplodingZombies"] = false
	(c).fields["m_bAlwaysCling"] = false
	(c).fields["m_bDidFirstUpdate"] = false
	(c).fields["m_HillBG"] = R.coerce(null, "RDParallaxBackground")
	(c).fields["m_BG"] = R.coerce(null, "RDParallaxBackground")
	(c).fields["m_fTargetFogDistance"] = float(NAN)
	(c).fields["m_fTargetFogRange"] = float(NAN)
	(c).fields["m_iMinSpawnMax"] = R.coerce(10, "int")
	(c).fields["m_iMaxSpawnMax"] = R.coerce(25, "int")
	(c).fields["m_fMinSpawnRate"] = float(1)
	(c).fields["m_fMaxSpawnRate"] = float(1.5)
	(c).fields["m_bIsZombieCheckpoint"] = false
	(c).fields["m_bDoDefaultHighwaySpawning"] = true
	(c).fields["m_iCustomMedShields"] = R.coerce(0, "int")
	(c).fields["m_iCustomMedHeals"] = R.coerce(0, "int")
	(c).fields["m_bDoUpgradeScreen"] = false
	(c).fields["m_fSwerveTimer"] = float(0)
	return null
