extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeDistance(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeDistance"), [v_theGame])
	c.fields["m_LevelLengths"] = R.coerce(R.construct(R.klass("Array"), [500, 600, 600, 700, 700, 800, 800, 900, 900, 1000]), "Array")
	R.call_member(c, "InitTotalLevelLength", [])
	R.call_member(c, "InitPatterns", [])
	c.fields["m_fSpawnRatioBaseNormal"] = float(0.5)
	c.fields["m_fSpawnRatioIncrementNormal"] = float(0.02)
	c.fields["m_fSpawnRatioBaseHard"] = float(0.7)
	c.fields["m_fSpawnRatioIncrementHard"] = float(0.03)
	c.fields["m_iStationarySoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iAlignSoldierLevel"] = R.coerce(1, "int")
	c.fields["m_iSpikeSoldierLevel"] = R.coerce(2, "int")
	c.fields["m_iHiddenSoldierLevel"] = R.coerce(3, "int")
	c.fields["m_iBombSoldierLevel"] = R.coerce(4, "int")
	c.fields["m_iHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iVeryHardZombieLevel"] = R.coerce(2, "int")
	c.fields["m_iFeedersLevel"] = R.coerce(1, "int")
	c.fields["m_iSpikesLevel"] = R.coerce(4, "int")
	c.fields["m_iNewMaleZombieLevel"] = R.coerce(1, "int")
	c.fields["m_iNewFemaleZombieLevel"] = R.coerce(1, "int")
	c.fields["m_iSoldierZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iJetLevel"] = R.coerce(6, "int")
	c.fields["m_iHelicopterLevel"] = R.coerce(3, "int")
	c.fields["m_iHelicopterMissileLevel"] = R.coerce(7, "int")
	c.fields["m_iExplodingCarLevel"] = R.coerce(4, "int")
	c.fields["m_iMineLevel"] = R.coerce(5, "int")
	c.fields["m_iMotionMineLevel"] = R.coerce(6, "int")
	c.fields["m_iFuelTruckLevel"] = R.coerce(0, "int")
	c.fields["m_iGrubLevel"] = R.coerce(1, "int")
	c.fields["m_IntroDialog"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroDistance_1C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroDistance_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	c.fields["m_MutantDelayMins"] = R.coerce(R.construct(R.klass("Array"), [50, 50, 50, 45, 40, 35, 30, 25, 20]), "Array")
	c.fields["m_MutantDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [25, 25, 25, 25, 25, 25, 25, 25, 25]), "Array")
	c.fields["m_MutantCounts"] = R.coerce(R.construct(R.klass("Array"), [1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4]), "Array")
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "Reset"), [])
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "BeginGameMode"), [])
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "EndGameMode"), [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fLevelLength: Variant = NAN
	var v_fNextLevelStartPosition: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowDistance")):
		pass
		R.call_member(c, "UpdateDistanceScreen", [v_fDeltaTime])
		return null
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
	v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	if R.truth((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) >= float(v_fNextLevelStartPosition))):
		pass
		R.assign(c, "m_iLevel", "RDGameModeDistance", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		c.fields["m_fLevelStartPosition"] = float(v_fNextLevelStartPosition)
		v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
		v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ZombieSlayer"))) and (float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) >= float(R.static_value("RDAchievement", "ZombieSlayerDistance"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "ZombieSlayer")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowDistance"] = true
	c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBestSurvivalDistance"] = float(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance")), float(floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))))))
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		if R.truth(R.get_value(R.klass("com.newgrounds.API"), "hasUserSession")):
			pass
			R.call_member(c, "PostScore", [])
	else:
		pass
		if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			if R.truth((c.fields.get("m_Game")).fields.get("m_KongregateAPI")):
				pass
				R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "stats"), "submit"), ["Dead State Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance")])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Dead State Distance", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null

static func f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
	var v_scoreTypes: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_scoreTypes = R.coerce(null, "Array")
	if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) < float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
		pass
		c.fields["m_fDistanceScreenTimer"] = R.coerce(R.binary("+", c.fields.get("m_fDistanceScreenTimer"), v_fDeltaTime), "Number")
		if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) >= float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
			pass
			R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [c.fields.get("m_DistanceScreen")])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", false, "=")
			if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0, R.static_value("RDGameModeGameplay", "SoundFadeDuration")])
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100), " KM"), "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance"), 10)]), 100), " KM"), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "visible", R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "visible", R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "visible", R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), "visible", R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("Message"), "visible", R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])), "=")
			if R.truth(R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")]))):
				pass
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
			if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
				pass
				R.call_member(c, "SetNewgroundsScoreboard", [])
				R.set_value((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "x", R.unary("-", 350), "=")
				R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "x", R.unary("-", 350), "=")
				R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), 0.5, {"x": 0, "delay": 0, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
				R.call_static("gs.TweenLite", "to", [(c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), 0.5, {"x": 0, "delay": 0, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			else:
				pass
				if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Kongregate")])):
					pass
					R.set_value((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
					R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
				else:
					pass
					if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])):
						pass
						R.set_value((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
						R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "initAGUI"), [{"onClose": R.get_value(c, "OnArmorGamesScoreBoardClosed")}])
						v_scoreTypes = R.coerce(R.call_member(c.fields.get("m_Game"), "GetArmorGamesScoreTypes", []), "Array")
						R.set_value(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGameModeDistance"), "HIGH"), "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showScoreboardSubmit"), [floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "getUserName"), []), "Dead State Distance", v_scoreTypes, (c.fields.get("m_Game")).fields.get("m_RootMC")])
			R.call_member(c.fields.get("m_Game"), "PlayInterfaceSound", [])
	return null

static func f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null

static func f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null

static func f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Dead State Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
