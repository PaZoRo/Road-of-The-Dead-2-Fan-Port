extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeTime(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeTime"), [v_theGame])
	(c).fields["m_TimeOutSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	c.fields["m_LevelLengths"] = R.coerce(R.construct(R.klass("Array"), [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400]), "Array")
	R.call_member(c, "InitTotalLevelLength", [])
	R.call_member(c, "InitPatterns", [])
	c.fields["m_IntroDialog"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroTime_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroTime_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "StartGameMode"), [])
	(c).fields["m_fTime"] = float(R.static_value("RDGameModeTime", "InitialTime"))
	(c).fields["m_fTimeFactor"] = float(1)
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "Reset"), [])
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "BeginGameMode"), [])
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fLevelLength: Variant = NAN
	var v_fNextLevelStartPosition: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	(c).fields["m_fTimeFactor"] = float(maxf(float((float(R.static_value("RDGameModeTime", "BaseTimeFactor")) - float((float(c.fields.get("m_iLevel")) * float((c).fields.get("m_fTimeFactorIncrement")))))), float(0.5)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowDistance")):
		pass
		R.call_member(c, "UpdateDistanceScreen", [v_fDeltaTime])
		return null
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	if R.truth(((float((c).fields.get("m_fTime")) >= float(R.static_value("RDAchievement", "DeadOnTimeCount"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "DeadOnTime"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "DeadOnTime")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(v_fDeltaTime))), float(0)))
	if R.truth((float((c).fields.get("m_fTime")) == float(0))):
		pass
		R.call_member(c.fields.get("m_Player"), "Explode", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_fTime")) < float(R.static_value("RDGameModeTime", "AlertTime")))):
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
	v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
	v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	if R.truth((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) >= float(v_fNextLevelStartPosition))):
		pass
		R.assign(c, "m_iLevel", "RDGameModeTime", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		c.fields["m_fLevelStartPosition"] = float(v_fNextLevelStartPosition)
		v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
		v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	return null

static func f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieKilled"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotDown"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnZombieShotByHelicopter(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotByHelicopter"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotByHelicopterTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotByHelicopterTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotOffHood"), [v_zombie, v_iClingerState])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieGotOff"), [v_zombie, v_bFromSideCollision])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieGotOffTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieGotOffTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieExploded"), [v_zombie])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieExplodedTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieExplodedTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnCivilianHit"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [R.unary("-", R.static_value("RDGameModeTime", "CivilianTimePenalty"))])
	(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(R.static_value("RDGameModeTime", "CivilianTimePenalty")))), float(0)))
	return null

static func f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnCivilianShot"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [R.unary("-", R.static_value("RDGameModeTime", "CivilianTimePenalty"))])
	(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(R.static_value("RDGameModeTime", "CivilianTimePenalty")))), float(0)))
	return null

static func f_OnFeedersHit(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnFeedersHit"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "FeedersHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "FeedersHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowDistance"] = true
	c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTimeBonus", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTime", [])
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBestDeadOnTimeDistance"] = float(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance")), float(floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))))))
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
				R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "stats"), "submit"), ["Out Of Time Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance")])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Out Of Time Distance", "String")
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
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance"), 10)]), 100), " KM"), "=")
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
						R.set_value(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGameModeTime"), "HIGH"), "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showScoreboardSubmit"), [floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "getUserName"), []), "Out Of Time Distance", v_scoreTypes, (c.fields.get("m_Game")).fields.get("m_RootMC")])
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
	R.call_static("com.newgrounds.API", "postScore", ["Out Of Time Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "InitialTime", 30, "=")
	R.set_value(c, "AlertTime", 3, "=")
	R.set_value(c, "MaxLevel", 9, "=")
	R.set_value(c, "CivilianTimePenalty", 10, "=")
	R.set_value(c, "ZombieHitTimeBonus", 2, "=")
	R.set_value(c, "ZombieShotDownTimeBonus", 3, "=")
	R.set_value(c, "ZombieGotOffTimeBonus", 3, "=")
	R.set_value(c, "FeedersHitTimeBonus", 3, "=")
	R.set_value(c, "ZombieExplodedTimeBonus", 3, "=")
	R.set_value(c, "ZombieShotByHelicopterTimeBonus", 2, "=")
	R.set_value(c, "TimeComboMultiplier", 1.05, "=")
	R.set_value(c, "BaseTimeFactor", 1, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fTime"] = float(NAN)
	(c).fields["m_TimeOutSound"] = R.coerce(null, "DTSound")
	(c).fields["m_fTimeFactor"] = float(1)
	(c).fields["m_fTimeFactorIncrement"] = float(0.05)
	return null
