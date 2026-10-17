extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeChopperRescue(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeChopperRescue"), [v_theGame])
	c.fields["m_bCanSpawnGrub"] = false
	(c).fields["m_RescuePatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue1")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue2")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue3")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue4")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue5")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue6")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue7")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue8")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue9")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue10")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue11")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue12")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue13")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue14")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue15")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue16")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue17")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue18")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue19")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue20")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue21")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue22")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue23")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue24")])])
	R.call_member((c).fields.get("m_RescuePatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_LG_Rescue25")])])
	c.fields["m_bCanHaveChopperSupport"] = false
	(c).fields["m_ChopperNoiseMC"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseX", 0, "=")
	R.set_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseZ", 0, "=")
	c.fields["m_bPlayStartEngineSound"] = false
	(c).fields["m_AmmoVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierAmmo01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierAmmo02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierAmmo03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_AmmoSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_AmmoSound"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_MaleLandVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperLand01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperLand02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperLand03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_MaleSuccessVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperSuccess01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperSuccess02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperSuccess03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_MaleFailureVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MaleFailureVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperFailure01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleFailureVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperFailure02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_MaleForwardVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperForward01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperForward02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperForward03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_MaleBackwardVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperBackward01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperBackward02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_MaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperBackward03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_FemaleLandVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_FemaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperLand01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperLand02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleLandVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperLand03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_FemaleSuccessVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_FemaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperSuccess01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperSuccess02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleSuccessVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperSuccess03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_FemaleFailureVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_FemaleFailureVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperFailure01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleFailureVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperFailure02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_FemaleForwardVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_FemaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperForward01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperForward02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleForwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperForward03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_FemaleBackwardVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_FemaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperBackward01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperBackward02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_FemaleBackwardVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperBackward03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "StartGameMode"), [])
	(c).fields["m_iRescues"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansSaved"] = R.coerce(0, "int")
	c.fields["m_fLevelDifficulty"] = float(0)
	(c).fields["m_bStartLanding"] = true
	R.call_member(c, "MoveChopperNoise", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "SetVolume", [0.25])
	(c).fields["m_iPerfectRescues"] = R.coerce(0, "int")
	(c).fields["m_iSpeedVoiceTime"] = R.coerce(0, "int")
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "BeginGameMode"), [])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill01"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill02"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill03"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill04"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill05"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "EndGameMode"), [])
	R.set_value(R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "BlackHudScreen"), "visible", false, "=")
	R.set_value(R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "BlackHudScreen"), "alpha", 0, "=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_ZombieKillSounds"), "length"))):
		pass
		R.call_member(R.binary("as", R.get_value((c).fields.get("m_ZombieKillSounds"), v_i), R.klass("DTSpacialSound")), "Destroy", [])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "splice"), [0])
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_civilian: Variant = null
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_civilian = R.coerce(null, "RDCivilian")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowDistance")):
		pass
		R.call_member(c, "UpdateDistanceScreen", [v_fDeltaTime])
		return null
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	if R.truth((c).fields.get("m_bStartLanding")):
		pass
		R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_Landing")])
		(c).fields["m_bStartLanding"] = false
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Shooting"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Landing"))))):
		pass
		R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Shooting")))):
		pass
		if R.truth((float(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_iKillableEnemies")) == float(0))):
			pass
			(c).fields["m_fSecureDelayTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSecureDelayTimer"), v_fDeltaTime), "Number")
			if R.truth(((c).fields.get("m_bPlaySuccessVoice") and (float((c).fields.get("m_fSecureDelayTimer")) >= float(0.5)))):
				pass
				if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleSuccessVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
				else:
					pass
					R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleSuccessVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
				(c).fields["m_bPlaySuccessVoice"] = false
			if R.truth((float((c).fields.get("m_fSecureDelayTimer")) >= float(2))):
				pass
				R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_SecuringCivilians")])
		if R.truth((float((c).fields.get("m_iCiviliansToSave")) == float(0))):
			pass
			if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
				pass
				R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleFailureVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			else:
				pass
				R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleFailureVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_TakingOff")])
	else:
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_SecuringCivilians")))):
			pass
			if R.truth((float((c).fields.get("m_iCiviliansInBuilding")) > float(0))):
				pass
				(c).fields["m_fSecureCivilianTime"] = R.coerce(R.binary("-", (c).fields.get("m_fSecureCivilianTime"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fSecureCivilianTime")) < float(0))):
					pass
					(c).fields["m_fSecureCivilianTime"] = float((float(R.static_value("RDGameModeChopperRescue", "SecureCivilianDelayMin")) + float((float(randf()) * float((float(R.static_value("RDGameModeChopperRescue", "SecureCivilianDelayMax")) - float(R.static_value("RDGameModeChopperRescue", "SecureCivilianDelayMin"))))))))
					v_civilian = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCivilian")]), R.klass("RDCivilian")), "RDCivilian")
					R.call_member(v_civilian, "Init", [R.binary("<", (((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("Z")]))])
					R.call_member(c.fields.get("m_Game"), "AddEntity", [v_civilian, R.binary("+", (((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("X"), (0.25 if R.truth(R.binary("<", (((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("Z")]))) else R.unary("-", 0.25))), R.call_static("RDWorld", "GetPerlinY", [(float((((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("Z")) - float(0.2))]), (float((((c).fields.get("m_RescueBuilding")).fields.get("m_vLocation")).fields.get("Z")) - float(0.2))])
					R.call_member(v_civilian, "StartGoToPlayer", [])
					R.call_member((c).fields.get("m_RescueBuilding"), "OpenDoor", [])
					R.set_value(c, "m_iCiviliansInBuilding", 1, "-=")
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateLocationCivCount", [])
			if R.truth((float((c).fields.get("m_iCiviliansToSave")) == float(0))):
				pass
				if R.truth((float((c).fields.get("m_iCiviliansSavedInWave")) == float(0))):
					pass
					if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
						pass
						R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleFailureVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
					else:
						pass
						R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleFailureVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
				else:
					pass
					R.set_value(c, "m_iRescues", 1, "+=")
					c.fields["m_iLevel"] = R.coerce(floorf(float(R.binary("/", (c).fields.get("m_iRescues"), R.static_value("RDGameModeChopperRescue", "RescuesPerLevel")))), "int")
					R.call_member(c, "UpdateSpawnableZombies", [])
					if R.truth((float((c).fields.get("m_iCiviliansSavedInWave")) == float((c).fields.get("m_iCiviliansInBuildingAtStart")))):
						pass
						R.set_value(c, "m_iPerfectRescues", 1, "+=")
						if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "MetalDragon"))) and (float((c).fields.get("m_iPerfectRescues")) >= float(R.static_value("RDAchievement", "MetalDragonCount"))))):
							pass
							R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "MetalDragon")])
							R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
					else:
						pass
						(c).fields["m_iPerfectRescues"] = R.coerce(0, "int")
				R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_TakingOff")])
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_FlyingToTarget")))):
				pass
				(c).fields["m_fFlyToTargetTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFlyToTargetTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fFlyToTargetTimer")) >= float(R.static_value("RDGameModeChopperRescue", "FlyToTargetDuration")))):
					pass
					R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_Landing")])
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_TakingOff")))):
					pass
					if R.truth((float((c).fields.get("m_fTakeOffFadeTimer")) < float(R.static_value("RDGameModeChopperRescue", "TakeOffFadeDelay")))):
						pass
						(c).fields["m_fTakeOffFadeTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fTakeOffFadeTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fTakeOffFadeTimer")) >= float(R.static_value("RDGameModeChopperRescue", "TakeOffFadeDelay")))):
							pass
							R.call_static("gs.TweenLite", "to", [R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "BlackHudScreen"), 3, {"autoAlpha": 1, "ease": R.get_value(R.klass("gs.easing.Linear"), "easeNone")}])
							R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0.25, 3])
					if R.truth((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY))) < float(R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2)))):
						pass
						((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [1, R.static_value("RDGameModeChopperRescue", "MaxSpeedY"), R.binary("/", (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY)), R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))]), "Number")
					else:
						pass
						((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [R.static_value("RDGameModeChopperRescue", "MaxSpeedY"), 1, R.binary("/", (float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY))) - float(R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))), R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))]), "Number")
						if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float((float(v_fPerlinY) + float(R.static_value("RDGameModeChopperRescue", "FlyHeight")))))]), 0.1)):
							pass
							if R.truth((float((c).fields.get("m_iCiviliansSavedInWave")) == float(0))):
								pass
								R.call_member(c, "StartFailScreen", [])
							else:
								pass
								((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = float(0)
								R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_FlyingToTarget")])
				else:
					pass
					if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Landing")))):
						pass
						if R.truth((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY))) < float(R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2)))):
							pass
							((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [R.unary("-", 1), R.unary("-", R.static_value("RDGameModeChopperRescue", "MaxSpeedY")), R.binary("/", (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY)), R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))]), "Number")
							if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float((float(v_fPerlinY) + float(R.static_value("RDGameModeChopperRescue", "GroundHeight")))))]), 0.1)):
								pass
								((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = float(0)
								R.call_member(c, "SetState", [R.static_value("RDGameModeChopperRescue", "State_Shooting")])
						else:
							pass
							((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [R.unary("-", R.static_value("RDGameModeChopperRescue", "MaxSpeedY")), R.unary("-", 1), R.binary("/", (float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) - float(v_fPerlinY))) - float(R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))), R.binary("/", R.static_value("RDGameModeChopperRescue", "FlyHeight"), 2))]), "Number")
	R.call_member(c, "UpdateChopperMovement", [v_fDeltaTime])
	((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("Maths", "Clamp", [(float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float((float(((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Y")) * float(v_fDeltaTime)))), (float(v_fPerlinY) + float(R.static_value("RDGameModeChopperRescue", "GroundHeight"))), (float(v_fPerlinY) + float(R.static_value("RDGameModeChopperRescue", "FlyHeight")))]), "Number")
	if R.truth((c).fields.get("m_bPlayFlySound")):
		pass
		(c).fields["m_bPlayFlySound"] = false
		if R.truth(R.unary("!", R.call_member((c.fields.get("m_Player")).fields.get("m_FlySound"), "IsPlaying", []))):
			pass
			R.call_member(c.fields.get("m_Player"), "PlaySoundOnActor", [(c.fields.get("m_Player")).fields.get("m_FlySound"), true])
	if R.truth(R.call_member((c.fields.get("m_Player")).fields.get("m_Weapon"), "ShouldReplenishAmmo", [])):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Center"), (c).fields.get("m_AmmoVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
		R.call_member((c).fields.get("m_AmmoSound"), "Play", [])
		R.call_member((c.fields.get("m_Player")).fields.get("m_Weapon"), "ReplenishAmmo", [true, 1])
	return null

static func f_UpdateChopperMovement(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fSpeedZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bMoveChopperLeft")):
		pass
		(c).fields["m_fMoveTargetX"] = float(maxf(float((float((c).fields.get("m_fMoveTargetX")) - float((float(R.static_value("RDGameModeChopperRescue", "MoveSpeed")) * float(v_fDeltaTime))))), R.num(R.unary("-", R.static_value("RDGameModeChopperRescue", "MaxMoveDistanceX")))))
	if R.truth((c).fields.get("m_bMoveChopperRight")):
		pass
		(c).fields["m_fMoveTargetX"] = float(minf(float((float((c).fields.get("m_fMoveTargetX")) + float((float(R.static_value("RDGameModeChopperRescue", "MoveSpeed")) * float(v_fDeltaTime))))), float(R.static_value("RDGameModeChopperRescue", "MaxMoveDistanceX"))))
	if R.truth((c).fields.get("m_bMoveChopperForward")):
		pass
		(c).fields["m_fMoveTargetZ"] = float(minf(float((float((c).fields.get("m_fMoveTargetZ")) + float((float(R.static_value("RDGameModeChopperRescue", "MoveSpeed")) * float(v_fDeltaTime))))), float(R.static_value("RDGameModeChopperRescue", "MaxMoveDistanceZ"))))
	if R.truth((c).fields.get("m_bMoveChopperBackward")):
		pass
		(c).fields["m_fMoveTargetZ"] = float(maxf(float((float((c).fields.get("m_fMoveTargetZ")) - float((float(R.static_value("RDGameModeChopperRescue", "MoveSpeed")) * float(v_fDeltaTime))))), R.num(R.unary("-", R.static_value("RDGameModeChopperRescue", "MaxMoveDistanceZ")))))
	((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"), R.binary("+", R.binary("+", (c).fields.get("m_fChopperSpotZ"), R.get_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseZ")), (c).fields.get("m_fMoveTargetZ")), v_fDeltaTime, R.static_value("RDGameModeChopperRescue", "ChopperMoveInterpSpeed")]), "Number")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fTargetX = R.coerce(R.binary("+", R.binary("+", (c).fields.get("m_fChopperSpotX"), R.get_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseX")), (c).fields.get("m_fMoveTargetX")), "Number")
	v_fTargetX = R.coerce(R.call_static("Maths", "Clamp", [v_fTargetX, (float(v_fPerlinX) - float(R.static_value("RDRoad", "SideWalkPosX"))), (float(v_fPerlinX) + float(R.static_value("RDRoad", "SideWalkPosX")))]), "Number")
	((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), v_fTargetX, v_fDeltaTime, R.static_value("RDGameModeChopperRescue", "ChopperMoveInterpSpeed")]), "Number")
	(c.fields.get("m_Player")).fields["m_fRelativeLocationX"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float(v_fPerlinX)))
	R.call_member(c.fields.get("m_Player"), "UpdateDepthPosition", [])
	v_fSpeedZ = float(R.binary("/", (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fLastLocationZ"))), v_fDeltaTime))
	(c).fields["m_fLastLocationZ"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Shooting"))) and (float(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_iKillableEnemies")) > float(0)))):
		pass
		if R.truth(((c).fields.get("m_bMoveChopperForward") and (float(v_fSpeedZ) > float(R.static_value("RDGameModeChopperRescue", "SpeedForMovementVoice"))))):
			pass
			if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDGameModeChopperRescue"), [])) - float((c).fields.get("m_iSpeedVoiceTime")))) > float(3000))):
				pass
				if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleForwardVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
				else:
					pass
					R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleForwardVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
				(c).fields["m_iSpeedVoiceTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "RDGameModeChopperRescue"), []), "int")
		else:
			pass
			if R.truth(((c).fields.get("m_bMoveChopperBackward") and R.binary("<", v_fSpeedZ, R.unary("-", R.static_value("RDGameModeChopperRescue", "SpeedForMovementVoice"))))):
				pass
				if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDGameModeChopperRescue"), [])) - float((c).fields.get("m_iSpeedVoiceTime")))) > float(3000))):
					pass
					if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
						pass
						R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleBackwardVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
					else:
						pass
						R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleBackwardVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
					(c).fields["m_iSpeedVoiceTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "RDGameModeChopperRescue"), []), "int")
	return null

static func f_MoveChopperNoise(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_fExtent: Variant = NAN
	v_fTime = float((float(0.2) + float((float(randf()) * float(0.2)))))
	v_fExtent = float(0.5)
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_ChopperNoiseMC"), v_fTime, {"m_fChopperNoiseX": R.binary("+", R.unary("-", v_fExtent), (float((float(randf()) * float(2))) * float(v_fExtent))), "ease": R.get_value(R.klass("gs.easing.Linear"), "easeInOut")}])
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_ChopperNoiseMC"), v_fTime, {"m_fChopperNoiseZ": R.binary("+", R.unary("-", v_fExtent), (float((float(randf()) * float(2))) * float(v_fExtent))), "ease": R.get_value(R.klass("gs.easing.Linear"), "easeInOut"), "onComplete": R.get_value(c, "MoveChopperNoise")}])
	return null

static func f_GetRescueBuilding(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	if R.truth(R.binary(">=", v_i, R.get_value(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_SafeZones"), "length"))):
		pass
		return null
	return R.binary("as", R.get_value(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_SafeZones"), v_i), R.klass("RDBuildingNew"))
	return null

static func f_SetState(c: Variant, a: Array) -> Variant:
	var v_iMinCivies: Variant = NAN
	var v_iMaxCivies: Variant = NAN
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iMinCivies = float(NAN)
	v_iMaxCivies = float(NAN)
	(c).fields["m_iState"] = R.coerce(v_iState, "int")
	if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Landing")))):
		pass
		R.call_member(c, "SpawnRescuePattern", [])
		((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fChopperSpotX"))
		((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Z"] = float((c).fields.get("m_fChopperSpotZ"))
		((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Y"] = float((float((c).fields.get("m_fChopperSpotY")) + float(R.static_value("RDGameModeChopperRescue", "FlyHeight"))))
		(c).fields["m_fLastLocationZ"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
		((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Z"] = float(0)
		((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["Y"] = float(0)
		((c.fields.get("m_Player")).fields.get("m_vVelocity")).fields["X"] = float(0)
		R.call_member(c.fields.get("m_Game"), "AddEntity", [c.fields.get("m_Player"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])
		(c).fields["m_bMoveChopperLeft"] = false
		(c).fields["m_bMoveChopperRight"] = false
		(c).fields["m_bMoveChopperForward"] = false
		(c).fields["m_bMoveChopperBackward"] = false
		(c).fields["m_fMoveTargetX"] = float(0)
		(c).fields["m_fMoveTargetZ"] = float(0)
		R.set_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseX", 0, "=")
		R.set_value((c).fields.get("m_ChopperNoiseMC"), "m_fChopperNoiseZ", 0, "=")
		(c).fields["m_bPlayFlySound"] = true
		v_iMinCivies = float(minf(float((float(3) + float((float((c).fields.get("m_iRescues")) * float(0.05))))), float(10)))
		v_iMaxCivies = float(minf(float((float(5) + float((float((c).fields.get("m_iRescues")) * float(0.07))))), float(10)))
		(c).fields["m_iCiviliansInBuilding"] = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_iMinCivies) + float((float(randf()) * float((float(v_iMaxCivies) - float(v_iMinCivies))))))]), "int")
		(c).fields["m_iCiviliansInBuildingAtStart"] = R.coerce((c).fields.get("m_iCiviliansInBuilding"), "int")
		(c).fields["m_iCiviliansToSave"] = R.coerce((c).fields.get("m_iCiviliansInBuilding"), "int")
		(c).fields["m_fSecureCivilianTime"] = float(0)
		(c).fields["m_iCiviliansSavedInWave"] = R.coerce(0, "int")
		(c).fields["m_RescueBuilding"] = R.coerce(R.call_member(c, "GetRescueBuilding", []), "RDBuildingNew")
		(c).fields["m_fFlyToTargetTimer"] = float(0)
		(c).fields["m_bPlayCivLine"] = true
		(c).fields["m_fSecureDelayTimer"] = float(0)
		R.call_static("gs.TweenLite", "to", [R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "BlackHudScreen"), 3, {"autoAlpha": 0, "ease": R.get_value(R.klass("gs.easing.Linear"), "easeNone")}])
		R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [1, 2])
		R.call_member(c.fields.get("m_Player"), "RaiseFiringArm", [])
		R.call_member(c.fields.get("m_Player"), "FullReplenish", [])
		if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
			pass
			R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_MaleLandVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
		else:
			pass
			R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_FemaleLandVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
		(c).fields["m_bPlaySuccessVoice"] = true
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateWeaponDisplay", [])
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateAmmoDisplay", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_TakingOff")))):
			pass
			(c).fields["m_fTakeOffFadeTimer"] = float(0)
			R.call_member(c.fields.get("m_Player"), "StopFiring", [])
			R.call_member((c.fields.get("m_Player")).fields.get("m_Weapon"), "CancelReload", [])
			R.call_member(c.fields.get("m_Player"), "LowerGun", [0.5])
			(c.fields.get("m_Player")).fields["m_bGunRaising"] = false
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_SecuringCivilians")))):
				pass
				(c).fields["m_bMoveChopperLeft"] = false
				(c).fields["m_bMoveChopperRight"] = false
				(c).fields["m_bMoveChopperForward"] = false
				(c).fields["m_bMoveChopperBackward"] = false
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnKeyDown"), [v_event])
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
		pass
		(c).fields["m_bMoveChopperLeft"] = true
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
			pass
			(c).fields["m_bMoveChopperRight"] = true
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
				pass
				(c).fields["m_bMoveChopperForward"] = true
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
					pass
					(c).fields["m_bMoveChopperBackward"] = true
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnKeyUp"), [v_event])
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
		pass
		(c).fields["m_bMoveChopperLeft"] = false
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
			pass
			(c).fields["m_bMoveChopperRight"] = false
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
				pass
				(c).fields["m_bMoveChopperForward"] = false
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
					pass
					(c).fields["m_bMoveChopperBackward"] = false
	return null

static func f_IsChopperMode(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_SpawnRescuePattern(c: Variant, a: Array) -> Variant:
	var v_levelPattern: Variant = null
	var v_patternMC: Variant = null
	var v_skyBG: Variant = null
	var v_bg: Variant = null
	var v_fSpawnRatio: Variant = NAN
	v_levelPattern = R.coerce(null, "RDLevelPattern")
	v_patternMC = R.coerce(null, "MovieClip")
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "ResetNavMesh", [])
	R.call_static("RDWorld", "ResetPerlinTrack", [])
	R.call_member(c.fields.get("m_SpawnManager"), "Reset", [])
	c.fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [c.fields.get("m_Road"), 0, 0, 0])
	R.call_member(c.fields.get("m_Road"), "InitRoadSliceEntities", [0])
	v_skyBG = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member(v_skyBG, "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [v_skyBG, 0, 0, 0])
	v_bg = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member(v_bg, "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [v_bg, 0, 0, 0])
	v_fSpawnRatio = float(minf(float((float(R.static_value("RDGameModeChopperRescue", "SpawnRatioBaseNormal")) + float((float(c.fields.get("m_iLevel")) * float(R.static_value("RDGameModeChopperRescue", "SpawnRatioIncrementNormal")))))), float(1)))
	if R.truth((c).fields.get("m_PatternMCs")):
		pass
		v_patternMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_PatternMCs"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
		v_levelPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomNew"), [null, v_patternMC]), "RDLevelPattern")
		v_fSpawnRatio = float(1)
	else:
		pass
		v_levelPattern = R.coerce(R.binary("as", R.call_member((c).fields.get("m_RescuePatterns"), "GetRandomValue", []), R.klass("RDLevelPattern")), "RDLevelPattern")
	R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), 0, v_fSpawnRatio, 1])
	(c).fields["m_bCanSpawnMutants"] = true
	return null

static func f_SetChopperSpot(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["m_fChopperSpotX"] = float(v_fX)
	(c).fields["m_fChopperSpotY"] = float(v_fY)
	(c).fields["m_fChopperSpotZ"] = float(v_fZ)
	return null

static func f_OnBuildingReachedByZombie(c: Variant, a: Array) -> Variant:
	var v_building: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDBuildingNew")
	var v_zombie: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDZombie")
	(c).fields["m_iCiviliansInBuilding"] = R.coerce(maxf(float((float((c).fields.get("m_iCiviliansInBuilding")) - float((v_zombie).fields.get("m_iCivilianEatCount")))), float(0)), "int")
	(c).fields["m_iCiviliansToSave"] = R.coerce(maxf(float((float((c).fields.get("m_iCiviliansToSave")) - float((v_zombie).fields.get("m_iCivilianEatCount")))), float(0)), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateLocationCivCount", [])
	R.call_member((c).fields.get("m_RescueBuilding"), "PlaySoundOnActor", [R.get_value((c).fields.get("m_ZombieKillSounds"), (c).fields.get("m_iZombieKillSound"))])
	(c).fields["m_iZombieKillSound"] = R.coerce(R.binary("%", (float((c).fields.get("m_iZombieKillSound")) + float(1)), R.get_value((c).fields.get("m_ZombieKillSounds"), "length")), "int")
	return null

static func f_CanGiveDistanceRP(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_CanSpawnCivilian(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianHit"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null

static func f_OnCivilianExploded(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianExploded"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null

static func f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianShot"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null

static func f_OnCivGetInCar(c: Variant, a: Array) -> Variant:
	var v_civ: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCivilian")
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	R.set_value(c, "m_iTotalCiviliansSaved", 1, "+=")
	R.set_value(c, "m_iCiviliansSavedInWave", 1, "+=")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateCivCount", [])
	R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCiviliansSaved", 1, "+=")
	R.call_member(c, "AddRP", [R.static_value("RDGameModeGameplay", "PointsPerCivilianDropped"), true])
	if R.truth((c).fields.get("m_bPlayCivLine")):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayCivSafeInChopperVoice", [(v_civ).fields.get("m_bIsMale")])
		(c).fields["m_bPlayCivLine"] = false
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "HeavenSent"))) and (float((c).fields.get("m_iTotalCiviliansSaved")) >= float(R.static_value("RDAchievement", "HeavenSentCount"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "HeavenSent")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_GetMaxSpawnZombies(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float(R.static_value("RDGameModeChopperRescue", "MaxSpawnBase")) + float((float(c.fields.get("m_iLevel")) * float(R.static_value("RDGameModeChopperRescue", "MaxSpawnIncrement"))))), 0, 10])
	return null

static func f_GetSpawnZombiesSide(c: Variant, a: Array) -> Variant:
	return (1 if R.truth((float(((c).fields.get("m_RescueBuilding")).fields.get("m_fRelativeLocationX")) < float(0))) else R.unary("-", 1))
	return null

static func f_LoadExternalPattern(c: Variant, a: Array) -> Variant:
	var v_mLoader: Variant = null
	var v_mRequest: Variant = null
	(c).fields["m_PatternMCs"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	v_mLoader = R.coerce(R.construct(R.resolve(c, "Loader", "RDGameModeChopperRescue"), []), "Loader")
	v_mRequest = R.coerce(R.construct(R.resolve(c, "URLRequest", "RDGameModeChopperRescue"), ["LevelPatternEditor.swf"]), "URLRequest")
	R.invoke(R.get_value(R.get_value(v_mLoader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onCompleteHandler"), false, 0, true])
	R.invoke(R.get_value(v_mLoader, "load"), [v_mRequest])
	return null

static func f_onCompleteHandler(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_loadEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "numChildren"))):
		pass
		R.call_member((c).fields.get("m_PatternMCs"), "AddValue", [R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "getChildAt"), [v_i]), R.klass("MovieClip"))])
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnPlayerFailed"), [v_evt])
	R.call_member(c, "StartFailScreen", [])
	return null

static func f_StartFailScreen(c: Variant, a: Array) -> Variant:
	c.fields["m_bShowDistance"] = true
	c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iBestChopperRescueRescues"] = R.coerce(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")), float((c).fields.get("m_iTotalCiviliansSaved"))), "int")
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
				R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "stats"), "submit"), ["Rescue OP", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Rescue OP", "String")
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
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Operation Result", "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), "Value"), "text", "Best Operation", "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", R.binary("+", R.binary("+", R.binary("+", (c).fields.get("m_iTotalCiviliansSaved"), " Civilian"), ("s" if R.truth((float((c).fields.get("m_iTotalCiviliansSaved")) > float(1))) else "")), " Rescued."), "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", R.binary("+", R.binary("+", R.binary("+", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues"), " Civilian"), ("s" if R.truth((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")) > float(1))) else "")), " Rescued."), "=")
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
						R.set_value(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGameModeChopperRescue"), "HIGH"), "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showScoreboardSubmit"), [floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "getUserName"), []), "Rescue OP", v_scoreTypes, (c.fields.get("m_Game")).fields.get("m_RootMC")])
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

static func f_CanShowHud(c: Variant, a: Array) -> Variant:
	return ((R.truth(c.fields.get("m_Player")) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))) and (float((c).fields.get("m_iCiviliansToSave")) > float(0)))
	return null

static func f_CanSpawnJet(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Rescue OP", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")])
	return null

static func f_CanSpawnMutants(c: Variant, a: Array) -> Variant:
	if R.truth((R.unary("!", (c).fields.get("m_bCanSpawnMutants")) or (float(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_iKillableEnemies")) == float(0)))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "CanSpawnMutants"), [])
	return null

static func f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	return (float(2) + float((float(randf()) * float(15))))
	return null

static func f_OnMutantSpawned(c: Variant, a: Array) -> Variant:
	(c).fields["m_bCanSpawnMutants"] = false
	return null

static func f_HasIndependantPlayerControl(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return "Civilians Saved"
	return null

static func f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_iTotalCiviliansSaved")
	return null

static func f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return ""
	return null

static func f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "State_FlyingToTarget", 0, "=")
	R.set_value(c, "State_Shooting", 1, "=")
	R.set_value(c, "State_TakingOff", 2, "=")
	R.set_value(c, "State_Landing", 3, "=")
	R.set_value(c, "State_SecuringCivilians", 4, "=")
	R.set_value(c, "State_Failed", 5, "=")
	R.set_value(c, "FlyHeight", 5, "=")
	R.set_value(c, "GroundHeight", 1.5, "=")
	R.set_value(c, "MaxSpeed", 5, "=")
	R.set_value(c, "MaxSpeedY", 0.5, "=")
	R.set_value(c, "AccelLength", 5, "=")
	R.set_value(c, "DeccelLength", 20, "=")
	R.set_value(c, "FlyToTargetDuration", 1, "=")
	R.set_value(c, "LandDistance", 6, "=")
	R.set_value(c, "LandOffset", 3, "=")
	R.set_value(c, "TakeOffFadeDelay", 1, "=")
	R.set_value(c, "SecureCivilianDelayMin", 0.3, "=")
	R.set_value(c, "SecureCivilianDelayMax", 1, "=")
	R.set_value(c, "SpawnRatioBaseNormal", 0.5, "=")
	R.set_value(c, "SpawnRatioIncrementNormal", 0.05, "=")
	R.set_value(c, "MaxSpawnBase", 0, "=")
	R.set_value(c, "MaxSpawnIncrement", 0.25, "=")
	R.set_value(c, "RescuesPerLevel", 2, "=")
	R.set_value(c, "SpeedForMovementVoice", 0.5, "=")
	R.set_value(c, "MaxMoveDistanceX", 5, "=")
	R.set_value(c, "MaxMoveDistanceZ", 5, "=")
	R.set_value(c, "ChopperMoveInterpSpeed", 0.6, "=")
	R.set_value(c, "MoveSpeed", 2.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_RescuePatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_iState"] = R.coerce(0, "int")
	(c).fields["m_bPlayFlySound"] = false
	(c).fields["m_fChopperSpotX"] = float(NAN)
	(c).fields["m_fChopperSpotY"] = float(NAN)
	(c).fields["m_fChopperSpotZ"] = float(NAN)
	(c).fields["m_iCiviliansInBuilding"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansInBuildingAtStart"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansToSave"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansSaved"] = R.coerce(0, "int")
	(c).fields["m_iCiviliansSavedInWave"] = R.coerce(0, "int")
	(c).fields["m_fSecureCivilianTime"] = float(NAN)
	(c).fields["m_RescueBuilding"] = R.coerce(null, "RDBuildingNew")
	(c).fields["m_fFlyToTargetTimer"] = float(NAN)
	(c).fields["m_bPlayCivLine"] = false
	(c).fields["m_iRescues"] = R.coerce(0, "int")
	(c).fields["m_fSecureDelayTimer"] = float(NAN)
	(c).fields["m_fTakeOffFadeTimer"] = float(NAN)
	(c).fields["m_iPerfectRescues"] = R.coerce(0, "int")
	(c).fields["m_PatternMCs"] = R.coerce(null, "RandomHat")
	(c).fields["m_bMoveChopperLeft"] = false
	(c).fields["m_bMoveChopperRight"] = false
	(c).fields["m_bMoveChopperForward"] = false
	(c).fields["m_bMoveChopperBackward"] = false
	(c).fields["m_fMoveTargetX"] = float(NAN)
	(c).fields["m_fMoveTargetZ"] = float(NAN)
	(c).fields["m_ChopperNoiseMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_bStartLanding"] = false
	(c).fields["m_ZombieKillSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iZombieKillSound"] = R.coerce(0, "int")
	(c).fields["m_AmmoVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_AmmoSound"] = R.coerce(null, "DTSound")
	(c).fields["m_MaleLandVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_MaleSuccessVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_MaleFailureVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_MaleForwardVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_MaleBackwardVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_FemaleLandVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_FemaleSuccessVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_FemaleFailureVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_FemaleForwardVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_FemaleBackwardVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_fLastLocationZ"] = float(NAN)
	(c).fields["m_iSpeedVoiceTime"] = R.coerce(0, "int")
	(c).fields["m_bPlaySuccessVoice"] = false
	(c).fields["m_bCanSpawnMutants"] = true
	return null
