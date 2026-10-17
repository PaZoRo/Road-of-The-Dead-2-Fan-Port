extends RefCounted
const R = preload("res://runtime/as_runtime.gd")
const STEP_COUNT: int = 29

static func step_0(c: Variant, l: Dictionary) -> void :
	l["sound"] = R.coerce(null, "DTSound")
	l["slotMC"] = R.coerce(null, "MovieClip")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "Init"), [])
	(c).fields["m_NGUserFileID"] = R.coerce(R.unary("-", 1), "int")
	R.call_member(c, "InitSpecialDay", [])
	(c).fields["m_PlayerInfo"] = R.coerce(R.construct(R.klass("RDPlayerInfo"), []), "RDPlayerInfo")

static func step_1(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_PlayerInfo"), "LoadPlayerInfo", [])
	(c).fields["m_EntityFactory"] = R.coerce(R.construct(R.klass("RDEntityFactory"), []), "RDEntityFactory")
	(c).fields["m_MasterSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), []), "DTSoundGroup")
	R.call_member((c).fields.get("m_MasterSoundGroup"), "SetMaxVolume", [0.85])
	(c).fields["m_MusicSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_VoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")

static func step_2(c: Variant, l: Dictionary) -> void :
	(c).fields["m_CinematicVoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_CrucialVoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_GameSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_InterfaceSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_CrucialSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	R.call_static("SoundSystem", "SetSpacialSoundParameters", [5, 100, 1, 5])

static func step_3(c: Variant, l: Dictionary) -> void :
	(c).fields["m_SoundParamsLoud"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [10, 200, 2, 10]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsSuperLoud"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [500, 1000, 2, 10]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsVoice"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [20, 100, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsCarSound"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [5, 80, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsMilitaryGun"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [10, 120, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [1, 40, 1, 5]), "DTSpacialSoundParams")

static func step_4(c: Variant, l: Dictionary) -> void :
	(c).fields["m_SoundParamsVeryQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [0, 20, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsFarQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [0, 60, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_VoiceOverSFXMix"] = R.coerce(R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_GameSFXSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), R.static_value("RDGame", "MinVoiceOverSFXMix")]), "DTSoundGroupMix")
	R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_MusicSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), 0.3])
	R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_InterfaceSFXSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), 0.5])
	R.call_static("RDEntity", "InitStaticVariables", [])

static func step_5(c: Variant, l: Dictionary) -> void :
	R.call_static("RDPlayer", "InitStaticVariables", [])
	R.call_static("RDZombie", "InitStaticVariables", [])
	R.call_static("RDSoldier", "InitStaticVariables", [])
	R.call_static("RDCivilian", "InitStaticVariables", [])
	R.call_static("RDCarSpawnInfos", "Init", [])
	R.call_static("RDBuildingNew", "InitStaticVariables", [])

static func step_6(c: Variant, l: Dictionary) -> void :
	R.call_static("RDBuildingNewBG", "InitStaticVariables", [])
	R.call_static("RDObstacleBody", "InitStaticVariables", [])
	R.call_static("RDBloodSpill", "InitStaticVariables", [])
	R.call_static("RDJet", "InitStaticVariables", [])
	R.call_static("RDHelicopter", "InitStaticVariables", [])
	R.call_static("RDCampaignDialogs", "InitStaticVariables", [])

static func step_7(c: Variant, l: Dictionary) -> void :
	R.call_static("RDPassingCar", "InitStaticVariables", [])
	R.call_static("RDWeapon", "InitStaticVariables", [])
	R.call_static("RDCamera", "InitUnprojectDirections", [])
	(c).fields["m_World"] = R.coerce(R.construct(R.klass("RDWorld"), [c]), "RDWorld")
	(c).fields["m_WorldLayer"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_WorldLayer"), "mouseEnabled", false, "=")

static func step_8(c: Variant, l: Dictionary) -> void :
	(c).fields["m_HudLayer"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_HudLayer"), "mouseEnabled", false, "=")
	(c).fields["m_BorderLayer"] = R.coerce(R.construct(R.klass("MC_Border"), []), "MovieClip")
	(c).fields["m_Hud"] = R.coerce(R.construct(R.klass("RDHud"), [c]), "RDHud")
	(c).fields["m_GameModeDriverSelection"] = R.coerce(R.construct(R.klass("RDGameModeDriverSelection"), [c]), "RDGameModeDriverSelection")
	(c).fields["m_GameModeStory"] = R.coerce(R.construct(R.klass("RDGameModeStory"), [c]), "RDGameModeStory")

static func step_9(c: Variant, l: Dictionary) -> void :
	(c).fields["m_GameModeHardcore"] = R.coerce(R.construct(R.klass("RDGameModeHardcore"), [c]), "RDGameModeHardcore")
	(c).fields["m_GameModeTime"] = R.coerce(R.construct(R.klass("RDGameModeTime"), [c]), "RDGameModeTime")
	(c).fields["m_GameModeMilitary"] = R.coerce(R.construct(R.klass("RDGameModeMilitary"), [c]), "RDGameModeMilitary")
	(c).fields["m_GameModeDistance"] = R.coerce(R.construct(R.klass("RDGameModeDistance"), [c]), "RDGameModeDistance")
	(c).fields["m_GameModeChopperRescue"] = R.coerce(R.construct(R.klass("RDGameModeChopperRescue"), [c]), "RDGameModeChopperRescue")
	(c).fields["m_GameModeChopperRescueSandbox"] = R.coerce(R.construct(R.klass("RDGameModeChopperRescueSandbox"), [c]), "RDGameModeChopperRescueSandbox")

static func step_10(c: Variant, l: Dictionary) -> void :
	(c).fields["m_GameModeMutant"] = R.coerce(R.construct(R.klass("RDGameModeMutant"), [c]), "RDGameModeMutant")
	(c).fields["m_GameModeSandbox"] = R.coerce(R.construct(R.klass("RDGameModeSandbox"), [c]), "RDGameModeSandbox")
	(c).fields["m_GameModeEditor"] = R.coerce(R.construct(R.klass("RDGameModeEditor"), [c]), "RDGameModeEditor")
	(c).fields["m_GameModeCustom"] = R.coerce(R.construct(R.klass("RDGameModeCustom"), [c]), "RDGameModeCustom")
	(c).fields["m_Player"] = R.coerce(R.construct(R.klass("RDPlayer"), []), "RDPlayer")
	((c).fields.get("m_Player")).fields["m_bDoNotDestroy"] = true

static func step_11(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_GameModeStory"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeHardcore"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeTime"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeMilitary"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeDistance"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeChopperRescue"), "SetPlayer", [(c).fields.get("m_Player")])

static func step_12(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_GameModeChopperRescueSandbox"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeMutant"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeSandbox"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeCustom"), "SetPlayer", [(c).fields.get("m_Player")])
	(c).fields["m_CurrentGameMode"] = R.coerce(null, "RDGameMode")
	(c).fields["m_MenuMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Menu"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")

static func step_13(c: Variant, l: Dictionary) -> void :
	(c).fields["m_GameMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_GameMusic"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	(c).fields["m_HighwayMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Highway"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	(c).fields["m_TenseMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Tense"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_GameMusic"), "SetMaxVolume", [0.75])
	(c).fields["m_Flash"] = R.coerce(R.construct(R.klass("MC_WhiteFlash"), []), "MovieClip")
	R.set_value((c).fields.get("m_Flash"), "visible", false, "=")

static func step_14(c: Variant, l: Dictionary) -> void :
	R.set_value((c).fields.get("m_Flash"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_Flash"), "mouseChildren", false, "=")
	(c).fields["m_ErrorSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_ErrorSound"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_InterfaceSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_UpgradePerception"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_ButtonSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_ButtonSound"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_CityAmbianceSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CityAmbiance"), (c).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")

static func step_15(c: Variant, l: Dictionary) -> void :
	(c).fields["m_EngineSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_IntroCarMaxSpeed"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_PassBySound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CinematicPassBy"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_TireSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EditorEndingTire"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_PaperSounds"] = R.coerce(R.construct(R.klass("SequentialArray"), []), "SequentialArray")
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound01"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound02"), (c).fields.get("m_InterfaceSFXSoundGroup")])])

static func step_16(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound03"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound04"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_static("RDAchievement", "Init", [])
	(c).fields["m_MessageBox"] = R.coerce(R.construct(R.klass("MC_MessageBox"), []), "MovieClip")
	R.set_value((c).fields.get("m_MessageBox"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_MessageBox"), "mouseEnabled", false, "=")

static func step_17(c: Variant, l: Dictionary) -> void :
	R.set_value((c).fields.get("m_MessageBox"), "visible", false, "=")
	(c).fields["m_MessageBoxes"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ConfirmationDialog"] = R.coerce(R.construct(R.klass("MC_ConfirmationDialog"), []), "MovieClip")
	R.set_value((c).fields.get("m_ConfirmationDialog"), "visible", false, "=")
	(c).fields["m_ToolTip"] = R.coerce(R.construct(R.klass("MC_ToolTip"), []), "MovieClip")
	R.set_value((c).fields.get("m_ToolTip"), "visible", false, "=")

static func step_18(c: Variant, l: Dictionary) -> void :
	R.set_value((c).fields.get("m_ToolTip"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_ToolTip"), "mouseChildren", false, "=")
	(c).fields["m_Menu"] = R.coerce(R.construct(R.klass("MC_MainMenu"), []), "MovieClip")
	R.call_member(c, "InitMenu", [])
	(c).fields["m_AchievementItems"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")

static func step_19(c: Variant, l: Dictionary) -> void :
	R.call_member(c, "ApplyOptions", [])
	(c).fields["m_MenuZombieSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan01"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan02"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan03"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan04"), (c).fields.get("m_GameSFXSoundGroup")])])

static func step_20(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan05"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan06"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan07"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan08"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan09"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan01"), (c).fields.get("m_GameSFXSoundGroup")])])

static func step_21(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan02"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan03"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan04"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan05"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan06"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan07"), (c).fields.get("m_GameSFXSoundGroup")])])

static func step_22(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan08"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan09"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan10"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan11"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan12"), (c).fields.get("m_GameSFXSoundGroup")])])
	l["i"] = R.coerce(0, "int")

static func step_23(c: Variant, l: Dictionary) -> void :
	while R.truth(R.binary("<", l["i"], R.get_value(((c).fields.get("m_MenuZombieSounds")).fields.get("m_Values"), "length"))):
		pass
		l["sound"] = R.coerce(R.invoke(R.klass("DTSound"), [R.get_value(((c).fields.get("m_MenuZombieSounds")).fields.get("m_Values"), l["i"])]), "DTSound")
		R.call_member(l["sound"], "SetMaxVolume", [0.5])
		l["i"] = R.signed32(l["i"] + 1)
	(c).fields["m_fMenuZombieSoundTimer"] = float((float(R.static_value("RDGame", "MenuZombieSoundDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuZombieSoundDelayRandom"))))))
	(c).fields["m_DynamicMenuInfos"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [350, 147, 121])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [260, 200, 146])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [296, 171, 110])])

static func step_24(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [316, 196, 108])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [333, 232, 129])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [249, 239, 135])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [271, 186, 122])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [136, 196, 159])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [418, 271, 143])])

static func step_25(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [441, 216, 172])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [381, 286, 155])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [294, 186, 104])])
	(c).fields["m_DynamicMenuJetInfo"] = R.coerce(R.construct(R.klass("Array"), [294, 303, 150]), "Array")
	(c).fields["m_fMenuJetTimer"] = float((float(R.static_value("RDGame", "MenuJetDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuJetDelayRandom"))))))
	(c).fields["m_MenuJetSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_JetPassBy"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")

static func step_26(c: Variant, l: Dictionary) -> void :
	R.call_member((c).fields.get("m_MenuJetSound"), "SetMaxVolume", [0.25])
	(c).fields["m_MenuExplosionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion1"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion3"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion4"), (c).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_PauseSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Pause"), (R.static_value("RDGame", "Instance")).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")

static func step_27(c: Variant, l: Dictionary) -> void :
	(c).fields["m_UserCampaignsPanelSlots"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot1"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot2"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot3"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot4"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot5"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot6"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot7"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot8"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot9"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot10"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot11"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot12"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot13"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot14"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot15"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot16"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot17"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot18")]), "Array")
	l["i"] = R.coerce(0, "int")
	while R.truth(R.binary("<", l["i"], R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
		pass
		l["slotMC"] = R.coerce(R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), l["i"]), "MovieClip")
		R.set_value(l["slotMC"], "mouseChildren", false, "=")
		R.set_value(l["slotMC"], "buttonMode", true, "=")
		l["i"] = R.signed32(l["i"] + 1)
	R.call_member(c, "HideLoadScreen", [])
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(R.static_value("RDGame", "Sorting_Best"), "int")
	R.call_member(c, "UpdateUserCampaignsPanel", [])

static func step_28(c: Variant, l: Dictionary) -> void :
	R.call_member(c, "ShowFileToolTip", ["", "", "", ""])
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "mouseChildren", false, "=")
	(c).fields["m_iCampaignPropertyPage"] = R.coerce(R.static_value("RDGame", "CampaignPropertyPage_General"), "int")
