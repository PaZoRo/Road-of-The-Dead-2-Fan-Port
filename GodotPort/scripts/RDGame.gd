extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGame(c: Variant, a: Array) -> Variant:
	var v_rootMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.invoke(R.super_ref(c, "RDGame"), [v_rootMC])
	R.assign(c, "Instance", "RDGame", c, "=")
	R.assign(c, "DummyOwner", "RDGame", R.construct(R.klass("RDDummyEntity"), []), "=")
	return null

static func f_Debug(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.assign(c, "m_szDebug", "RDGame", R.binary("+", v_szText, "\n"), "+=")
	return null

static func f_OutputDebug(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "trace", "RDGame"), [R.static_value("RDGame", "m_szDebug")])
	return null

static func f_ClearDebug(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_szDebug", "RDGame", "", "=")
	return null

static func f_GetMC(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_child: Variant = null
	var v_mcs: Variant = null
	var v_mc: Variant = null
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	v_i = R.coerce(0, "int")
	v_child = R.coerce(null, "DisplayObject")
	v_mcs = R.coerce(R.binary("as", R.get_value(R.static_value("RDGame", "m_MovieClipsHash"), v_mcClass), R.klass("Array")), "Array")
	v_mc = R.coerce((R.get_value(v_mcs, 0) if R.truth((R.truth(v_mcs) and R.binary(">", R.get_value(v_mcs, "length"), 0))) else null), "MovieClip")
	if R.truth(v_mc):
		pass
		R.invoke(R.get_value(v_mcs, "shift"), [])
		R.invoke(R.get_value(v_mc, "gotoAndPlay"), [1])
		R.set_value(v_mc, "alpha", 1, "=")
		R.set_value(v_mc, "visible", true, "=")
		R.set_value(v_mc, "x", 0, "=")
		R.set_value(v_mc, "y", 0, "=")
		R.set_value(v_mc, "scaleX", 1, "=")
		R.set_value(v_mc, "scaleY", 1, "=")
		R.set_value(v_mc, "rotation", 0, "=")
		R.set_value(v_mc, "m_owner", null, "=")
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(v_mc, "numChildren"))):
			pass
			v_child = R.coerce(R.invoke(R.get_value(v_mc, "getChildAt"), [v_i]), "DisplayObject")
			R.set_value(v_child, "visible", true, "=")
			v_i = R.signed32(v_i + 1)
	else:
		pass
		v_mc = R.coerce(R.construct(v_mcClass, []), "MovieClip")
		if R.truth(R.unary("!", v_mcs)):
			pass
			R.set_value(R.static_value("RDGame", "m_MovieClipsHash"), v_mcClass, R.construct(R.klass("Array"), []), "=")
	return v_mc
	return null

static func f_ReturnMC(c: Variant, a: Array) -> Variant:
	var v_mcs: Variant = null
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	v_mcs = R.coerce(R.get_value(R.static_value("RDGame", "m_MovieClipsHash"), R.get_value(v_mc, "constructor")), "Array")
	R.invoke(R.get_value(v_mcs, "push"), [v_mc])
	return null

static func f_GetEntity(c: Variant, a: Array) -> Variant:
	var v_entities: Variant = null
	var v_entity: Variant = null
	var v_entityClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	v_entities = R.coerce(R.binary("as", R.get_value(R.static_value("RDGame", "m_EntitiesHash"), v_entityClass), R.klass("Array")), "Array")
	v_entity = R.coerce((R.get_value(v_entities, 0) if R.truth((R.truth(v_entities) and R.binary(">", R.get_value(v_entities, "length"), 0))) else null), "RDEntity")
	if R.truth(v_entity):
		pass
		R.invoke(R.get_value(v_entities, "shift"), [])
		R.call_member(v_entity, "SetInitialState", [])
	else:
		pass
		v_entity = R.coerce(R.construct(v_entityClass, []), "RDEntity")
		if R.truth(R.unary("!", v_entities)):
			pass
			R.set_value(R.static_value("RDGame", "m_EntitiesHash"), v_entityClass, R.construct(R.klass("Array"), []), "=")
	R.assign(c, "m_iEntitiesUsed", "RDGame", 1, "+=")
	return v_entity
	return null

static func f_ReturnEntity(c: Variant, a: Array) -> Variant:
	var v_entityClass: Variant = null
	var v_entities: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_entityClass = R.coerce(R.get_value(R.binary("as", v_entity, R.resolve(c, "Object", "RDGame")), "constructor"), "Class")
	v_entities = R.coerce(R.get_value(R.static_value("RDGame", "m_EntitiesHash"), v_entityClass), "Array")
	if R.truth(v_entities):
		pass
		R.invoke(R.get_value(v_entities, "push"), [v_entity])
		R.assign(c, "m_iEntitiesUsed", "RDGame", 1, "-=")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_slotMC: Variant = null
	var v_i: Variant = 0
	v_sound = R.coerce(null, "DTSound")
	v_slotMC = R.coerce(null, "MovieClip")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "Init"), [])
	(c).fields["m_NGUserFileID"] = R.coerce(R.unary("-", 1), "int")
	R.call_member(c, "InitSpecialDay", [])
	(c).fields["m_PlayerInfo"] = R.coerce(R.construct(R.klass("RDPlayerInfo"), []), "RDPlayerInfo")
	R.call_member((c).fields.get("m_PlayerInfo"), "LoadPlayerInfo", [])
	(c).fields["m_EntityFactory"] = R.coerce(R.construct(R.klass("RDEntityFactory"), []), "RDEntityFactory")
	(c).fields["m_MasterSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), []), "DTSoundGroup")
	R.call_member((c).fields.get("m_MasterSoundGroup"), "SetMaxVolume", [0.85])
	(c).fields["m_MusicSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_VoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_CinematicVoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_CrucialVoiceSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_GameSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_InterfaceSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	(c).fields["m_CrucialSFXSoundGroup"] = R.coerce(R.construct(R.klass("DTSoundGroup"), [(c).fields.get("m_MasterSoundGroup")]), "DTSoundGroup")
	R.call_static("SoundSystem", "SetSpacialSoundParameters", [5, 100, 1, 5])
	(c).fields["m_SoundParamsLoud"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [10, 200, 2, 10]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsSuperLoud"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [500, 1000, 2, 10]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsVoice"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [20, 100, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsCarSound"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [5, 80, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsMilitaryGun"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [10, 120, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [1, 40, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsVeryQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [0, 20, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_SoundParamsFarQuiet"] = R.coerce(R.construct(R.klass("DTSpacialSoundParams"), [0, 60, 1, 5]), "DTSpacialSoundParams")
	(c).fields["m_VoiceOverSFXMix"] = R.coerce(R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_GameSFXSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), R.static_value("RDGame", "MinVoiceOverSFXMix")]), "DTSoundGroupMix")
	R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_MusicSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), 0.3])
	R.call_static("SoundSystem", "AddSoundGroupMixing", [(c).fields.get("m_InterfaceSFXSoundGroup"), (c).fields.get("m_VoiceSoundGroup"), 0.5])
	R.call_static("RDEntity", "InitStaticVariables", [])
	R.call_static("RDPlayer", "InitStaticVariables", [])
	R.call_static("RDZombie", "InitStaticVariables", [])
	R.call_static("RDSoldier", "InitStaticVariables", [])
	R.call_static("RDCivilian", "InitStaticVariables", [])
	R.call_static("RDCarSpawnInfos", "Init", [])
	R.call_static("RDBuildingNew", "InitStaticVariables", [])
	R.call_static("RDBuildingNewBG", "InitStaticVariables", [])
	R.call_static("RDObstacleBody", "InitStaticVariables", [])
	R.call_static("RDBloodSpill", "InitStaticVariables", [])
	R.call_static("RDJet", "InitStaticVariables", [])
	R.call_static("RDHelicopter", "InitStaticVariables", [])
	R.call_static("RDCampaignDialogs", "InitStaticVariables", [])
	R.call_static("RDPassingCar", "InitStaticVariables", [])
	R.call_static("RDWeapon", "InitStaticVariables", [])
	R.call_static("RDCamera", "InitUnprojectDirections", [])
	(c).fields["m_World"] = R.coerce(R.construct(R.klass("RDWorld"), [c]), "RDWorld")
	(c).fields["m_WorldLayer"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_WorldLayer"), "mouseEnabled", false, "=")
	(c).fields["m_HudLayer"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_HudLayer"), "mouseEnabled", false, "=")
	(c).fields["m_BorderLayer"] = R.coerce(R.construct(R.klass("MC_Border"), []), "MovieClip")
	(c).fields["m_Hud"] = R.coerce(R.construct(R.klass("RDHud"), [c]), "RDHud")
	(c).fields["m_GameModeDriverSelection"] = R.coerce(R.construct(R.klass("RDGameModeDriverSelection"), [c]), "RDGameModeDriverSelection")
	(c).fields["m_GameModeStory"] = R.coerce(R.construct(R.klass("RDGameModeStory"), [c]), "RDGameModeStory")
	(c).fields["m_GameModeHardcore"] = R.coerce(R.construct(R.klass("RDGameModeHardcore"), [c]), "RDGameModeHardcore")
	(c).fields["m_GameModeTime"] = R.coerce(R.construct(R.klass("RDGameModeTime"), [c]), "RDGameModeTime")
	(c).fields["m_GameModeMilitary"] = R.coerce(R.construct(R.klass("RDGameModeMilitary"), [c]), "RDGameModeMilitary")
	(c).fields["m_GameModeDistance"] = R.coerce(R.construct(R.klass("RDGameModeDistance"), [c]), "RDGameModeDistance")
	(c).fields["m_GameModeChopperRescue"] = R.coerce(R.construct(R.klass("RDGameModeChopperRescue"), [c]), "RDGameModeChopperRescue")
	(c).fields["m_GameModeChopperRescueSandbox"] = R.coerce(R.construct(R.klass("RDGameModeChopperRescueSandbox"), [c]), "RDGameModeChopperRescueSandbox")
	(c).fields["m_GameModeMutant"] = R.coerce(R.construct(R.klass("RDGameModeMutant"), [c]), "RDGameModeMutant")
	(c).fields["m_GameModeSandbox"] = R.coerce(R.construct(R.klass("RDGameModeSandbox"), [c]), "RDGameModeSandbox")
	(c).fields["m_GameModeEditor"] = R.coerce(R.construct(R.klass("RDGameModeEditor"), [c]), "RDGameModeEditor")
	(c).fields["m_GameModeCustom"] = R.coerce(R.construct(R.klass("RDGameModeCustom"), [c]), "RDGameModeCustom")
	(c).fields["m_Player"] = R.coerce(R.construct(R.klass("RDPlayer"), []), "RDPlayer")
	((c).fields.get("m_Player")).fields["m_bDoNotDestroy"] = true
	R.call_member((c).fields.get("m_GameModeStory"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeHardcore"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeTime"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeMilitary"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeDistance"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeChopperRescue"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeChopperRescueSandbox"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeMutant"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeSandbox"), "SetPlayer", [(c).fields.get("m_Player")])
	R.call_member((c).fields.get("m_GameModeCustom"), "SetPlayer", [(c).fields.get("m_Player")])
	(c).fields["m_CurrentGameMode"] = R.coerce(null, "RDGameMode")
	(c).fields["m_MenuMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Menu"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	(c).fields["m_GameMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_GameMusic"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	(c).fields["m_HighwayMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Highway"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	(c).fields["m_TenseMusic"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Music_Tense"), (c).fields.get("m_MusicSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_GameMusic"), "SetMaxVolume", [0.75])
	(c).fields["m_Flash"] = R.coerce(R.construct(R.klass("MC_WhiteFlash"), []), "MovieClip")
	R.set_value((c).fields.get("m_Flash"), "visible", false, "=")
	R.set_value((c).fields.get("m_Flash"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_Flash"), "mouseChildren", false, "=")
	(c).fields["m_ErrorSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_ErrorSound"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_InterfaceSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_UpgradePerception"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_ButtonSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_ButtonSound"), (c).fields.get("m_CrucialSFXSoundGroup")]), "DTSound")
	(c).fields["m_CityAmbianceSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CityAmbiance"), (c).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")
	(c).fields["m_EngineSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_IntroCarMaxSpeed"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_PassBySound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CinematicPassBy"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_TireSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EditorEndingTire"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_PaperSounds"] = R.coerce(R.construct(R.klass("SequentialArray"), []), "SequentialArray")
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound01"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound02"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound03"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_member((c).fields.get("m_PaperSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_PaperSound04"), (c).fields.get("m_InterfaceSFXSoundGroup")])])
	R.call_static("RDAchievement", "Init", [])
	(c).fields["m_MessageBox"] = R.coerce(R.construct(R.klass("MC_MessageBox"), []), "MovieClip")
	R.set_value((c).fields.get("m_MessageBox"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_MessageBox"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_MessageBox"), "visible", false, "=")
	(c).fields["m_MessageBoxes"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ConfirmationDialog"] = R.coerce(R.construct(R.klass("MC_ConfirmationDialog"), []), "MovieClip")
	R.set_value((c).fields.get("m_ConfirmationDialog"), "visible", false, "=")
	(c).fields["m_ToolTip"] = R.coerce(R.construct(R.klass("MC_ToolTip"), []), "MovieClip")
	R.set_value((c).fields.get("m_ToolTip"), "visible", false, "=")
	R.set_value((c).fields.get("m_ToolTip"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_ToolTip"), "mouseChildren", false, "=")
	(c).fields["m_Menu"] = R.coerce(R.construct(R.klass("MC_MainMenu"), []), "MovieClip")
	R.call_member(c, "InitMenu", [])
	(c).fields["m_AchievementItems"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
	R.call_member(c, "ApplyOptions", [])
	(c).fields["m_MenuZombieSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan01"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan02"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan03"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan04"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan05"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan06"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan07"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan08"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MaleZombieMoan09"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan01"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan02"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan03"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan04"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan05"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan06"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan07"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan08"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan09"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan10"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan11"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuZombieSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_FemaleZombieMoan12"), (c).fields.get("m_GameSFXSoundGroup")])])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_MenuZombieSounds")).fields.get("m_Values"), "length"))):
		pass
		v_sound = R.coerce(R.invoke(R.klass("DTSound"), [R.get_value(((c).fields.get("m_MenuZombieSounds")).fields.get("m_Values"), v_i)]), "DTSound")
		R.call_member(v_sound, "SetMaxVolume", [0.5])
		v_i = R.signed32(v_i + 1)
	(c).fields["m_fMenuZombieSoundTimer"] = float((float(R.static_value("RDGame", "MenuZombieSoundDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuZombieSoundDelayRandom"))))))
	(c).fields["m_DynamicMenuInfos"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [350, 147, 121])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [260, 200, 146])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [296, 171, 110])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [316, 196, 108])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [333, 232, 129])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [249, 239, 135])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [271, 186, 122])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [136, 196, 159])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [418, 271, 143])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [441, 216, 172])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [381, 286, 155])])
	R.call_member((c).fields.get("m_DynamicMenuInfos"), "AddValue", [R.construct(R.klass("Array"), [294, 186, 104])])
	(c).fields["m_DynamicMenuJetInfo"] = R.coerce(R.construct(R.klass("Array"), [294, 303, 150]), "Array")
	(c).fields["m_fMenuJetTimer"] = float((float(R.static_value("RDGame", "MenuJetDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuJetDelayRandom"))))))
	(c).fields["m_MenuJetSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_JetPassBy"), (c).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_MenuJetSound"), "SetMaxVolume", [0.25])
	(c).fields["m_MenuExplosionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion1"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion3"), (c).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MenuExplosionSounds"), "AddValue", [R.construct(R.klass("DTSound"), [R.klass("SND_MenuExplosion4"), (c).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_PauseSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_Pause"), (R.static_value("RDGame", "Instance")).fields.get("m_InterfaceSFXSoundGroup")]), "DTSound")
	(c).fields["m_UserCampaignsPanelSlots"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot1"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot2"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot3"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot4"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot5"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot6"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot7"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot8"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot9"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot10"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot11"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot12"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot13"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot14"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot15"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot16"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot17"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "Slot18")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), v_i), "MovieClip")
		R.set_value(v_slotMC, "mouseChildren", false, "=")
		R.set_value(v_slotMC, "buttonMode", true, "=")
		v_i = R.signed32(v_i + 1)
	R.call_member(c, "HideLoadScreen", [])
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(R.static_value("RDGame", "Sorting_Best"), "int")
	R.call_member(c, "UpdateUserCampaignsPanel", [])
	R.call_member(c, "ShowFileToolTip", ["", "", "", ""])
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "mouseChildren", false, "=")
	(c).fields["m_iCampaignPropertyPage"] = R.coerce(R.static_value("RDGame", "CampaignPropertyPage_General"), "int")
	return null

static func f_Start(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bSeenStorageNotice"))):
		pass
		((c).fields.get("m_PlayerInfo")).fields["m_bSeenStorageNotice"] = true
		R.call_member(c, "SavePlayerInfo", [])
		R.call_member(c, "StartCinematic", ["StorageNotice", false])
	else:
		pass
		if R.truth(R.call_static("com.newgrounds.API", "getSaveGroup", ["Campaigns"])):
			pass
			R.call_member(c, "DoStartGame", [])
		else:
			pass
			(c).fields["m_fWaitingForAPITimer"] = float(5)
			R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "OnAPIConnected"), 0, true])
	return null

static func f_OnAPIConnected(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member(c, "DoStartGame", [])
	return null

static func f_DoStartGame(c: Variant, a: Array) -> Variant:
	(c).fields["m_NGUserFileID"] = R.coerce((R.coerce(R.get_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "loaderInfo"), "parameters"), "NewgroundsAPI_SaveFileID"), "int") if R.truth(R.binary("!=", R.get_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "loaderInfo"), "parameters"), "NewgroundsAPI_SaveFileID"), null)) else R.unary("-", 1)), "int")
	if R.truth(R.binary("!=", (c).fields.get("m_NGUserFileID"), R.unary("-", 1))):
		pass
		R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
		R.call_member(c, "SetMenuState", [R.static_value("RDGame", "MenuState_LoadNGFile"), true])
		R.call_member(c, "LoadNGUserFile", [])
	else:
		pass
		R.call_member(c, "StartCinematic", ["NGIntro", true])
	return null

static func f_InitMCOriginalPos(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bButtonMode: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.set_value(v_mc, "m_fOriginalPosX", R.get_value(v_mc, "x"), "=")
	R.set_value(v_mc, "m_fOriginalPosY", R.get_value(v_mc, "y"), "=")
	if R.truth(v_bButtonMode):
		pass
		R.set_value(v_mc, "buttonMode", true, "=")
		R.set_value(v_mc, "mouseChildren", false, "=")
		R.set_value(v_mc, "m_fLeftNamePos", R.get_value(R.get_value(v_mc, "LeftName"), "x"), "=")
		R.set_value(v_mc, "m_fCenterNamePos", R.get_value(R.get_value(v_mc, "CenterName"), "x"), "=")
		R.call_member(c, "HighlightButtonMC", [v_mc, false])
	return null

static func f_InitButtonOriginalPos(c: Variant, a: Array) -> Variant:
	var v_button: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDMenuButton")
	(v_button).fields["m_fOriginalPosX"] = R.coerce(R.get_value(v_button, "x"), "Number")
	(v_button).fields["m_fOriginalPosY"] = R.coerce(R.get_value(v_button, "y"), "Number")
	return null

static func f_SetButtonName(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_szName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.set_value(R.get_value(v_mc, "LeftName"), "text", v_szName, "=")
	R.set_value(R.get_value(v_mc, "CenterName"), "text", "", "=")
	return null

static func f_HighlightButtonMC(c: Variant, a: Array) -> Variant:
	var v_newTextFormat: Variant = null
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_newTextFormat = R.coerce(null, "TextFormat")
	R.set_value(R.get_value(v_mc, "BG"), "alpha", (0.9 if R.truth(v_bHighlight) else 0.8), "=")
	v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
	R.set_value(v_newTextFormat, "color", (16777215 if R.truth(v_bHighlight) else 13421772), "=")
	R.invoke(R.get_value(R.get_value(v_mc, "LeftName"), "setTextFormat"), [v_newTextFormat])
	v_newTextFormat = R.coerce(R.construct(R.klass("TextFormat"), []), "TextFormat")
	R.set_value(v_newTextFormat, "color", (16777215 if R.truth(v_bHighlight) else 13421772), "=")
	R.invoke(R.get_value(R.get_value(v_mc, "CenterName"), "setTextFormat"), [v_newTextFormat])
	R.set_value(R.get_value(v_mc, "LeftName"), "x", R.binary("+", R.get_value(v_mc, "m_fLeftNamePos"), ((2 if R.truth(R.binary("<", R.get_value(v_mc, "x"), 200)) else R.unary("-", 2)) if R.truth(v_bHighlight) else 0)), "=")
	R.set_value(R.get_value(v_mc, "CenterName"), "x", R.binary("+", R.get_value(v_mc, "m_fCenterNamePos"), ((2 if R.truth(R.binary("<", R.get_value(v_mc, "x"), 200)) else R.unary("-", 2)) if R.truth(v_bHighlight) else 0)), "=")
	return null

static func f_InitMenu(c: Variant, a: Array) -> Variant:
	var v_item: Variant = null
	var v_i: Variant = 0
	v_item = R.coerce(null, "MovieClip")
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey1"), "Steer Left"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey2"), "Steer Right"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey3"), "Accelerate"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey4"), "Brake"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey5"), "Swerve/Interact"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey6"), "Horn"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey7"), "Switch Driver"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey8"), "Reload"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey9"), "Cycle Previous"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey10"), "Cycle Next"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SetKey11"), "Pause Key"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "Sounds"), "Sounds"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "Music"), "Music"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "Quality"), "Quality"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "ZombieTints"), "Zombie Tints"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "SaveData"), "Clear Save Data"])
	R.call_member(c, "SetButtonName", [R.get_value((c).fields.get("m_Menu"), "Fullscreen"), "Full Screen"])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "StoryMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Challenges")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "UserCampaigns")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "CampaignEditor")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Options")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Achievements")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "HighScores")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Resume")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Abort")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "HardcoreMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "TimeMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SurvivalMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "RescueMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "MutantMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "MilitaryMode")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "ChallengesBack")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "HardcoreModeLock")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "RescueModeLock")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "MutantModeLock")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "MilitaryModeLock")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "VehicleControlsLabel")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "WeaponControlsLabel")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "GeneralOptionsLabel")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey1"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey2"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey3"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey4"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey5"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey6"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey7"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey8"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey9"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey10"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SetKey11"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Sounds"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Music"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Quality"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "ZombieTints"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Fullscreen"), true])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "SaveData"), true])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "OptionsBack")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits1")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits2")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits3")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits4")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits5")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits6")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits7")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits8")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits9")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits10")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits11")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits12")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits13")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits14")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits15")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "Credits16")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "CreditsBack")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "HighScoresPanel")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "AchievementsPanel")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "AchievementsBack")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "HighScoresBack")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "UserCampaignsBack")])
	R.call_member(c, "InitMCOriginalPos", [R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesPlay")])
	R.call_member(c, "InitButtonOriginalPos", [R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesBack")])
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SpecialDayName"), "visible", (float((c).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_None"))), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SpecialDayName"), "text", R.call_member(c, "GetSpecialDayName", []), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SpecialDayName"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "gotoAndStop"), [1])
	(c).fields["m_SurvivalGuideTableItems"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft1")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft2")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft3")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft4")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft5")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft6")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft7")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft8")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft9")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft10")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft11")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemLeft12")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight1")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight2")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight3")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight4")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight5")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight6")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight7")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight8")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight9")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight10")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight11")])
	R.invoke(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "push"), [R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "ItemRight12")])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "length"))):
		pass
		v_item = R.coerce(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), v_i), "MovieClip")
		R.set_value(v_item, "m_iIndex", (float(v_i) + float(1)), "=")
		R.set_value(v_item, "mouseChildren", false, "=")
		R.set_value(v_item, "buttonMode", true, "=")
		R.set_value(R.get_value(v_item, "Underline"), "visible", false, "=")
		R.invoke(R.get_value(v_item, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnSurvivalTableItemDown"), false, 0, true])
		R.invoke(R.get_value(v_item, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnSurvivalTableItemOver"), false, 0, true])
		R.invoke(R.get_value(v_item, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnSurvivalTableItemOut"), false, 0, true])
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SandboxMode"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "RescueSandboxMode"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "UserCampaigns"), "visible", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")]), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "CampaignEditor"), "visible", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")]), "=")
	return null

static func f_GetSpecialDayName(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Friday13th")))):
		pass
		return "Friday 13th"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_NewYear")))):
		pass
		return "New Year"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MartinLutherKingDay")))):
		pass
		return "Martin Luther King Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MardiGras")))):
		pass
		return "Mardi Gras"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ValentinesDay")))):
		pass
		return "Valentine's Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_SaintPatricksDay")))):
		pass
		return "Saint-Patrick's Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Easter")))):
		pass
		return "Easter"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_AprilsFool")))):
		pass
		return ""
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_CincoDeMayo")))):
		pass
		return "Cinco De Mayo"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MothersDay")))):
		pass
		return "Mother's Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_FathersDay")))):
		pass
		return "Father's Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_WatermelonDay")))):
		pass
		return "Watermelon Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_LaborDay")))):
		pass
		return "Labor Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
		pass
		return "Halloween"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
		pass
		return "Thanksgiving"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Christmas")))):
		pass
		return "Christmas"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MadnessDay")))):
		pass
		return "Madness Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay")))):
		pass
		return "Pico Day"
	if R.truth((float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_RobotDay")))):
		pass
		return "Robot Day"
	return ""
	return null

static func f_InitInterface(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
		pass
		R.call_member(c, "SetPause", [false])
		if R.truth(R.invoke(R.get_value(c.fields.get("m_RootMC"), "contains"), [(c).fields.get("m_MessageBox")])):
			pass
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_MessageBox")])
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_Menu")])
		R.set_value(R.get_value((c).fields.get("m_Menu"), "PauseLabel"), "visible", false, "=")
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_ConfirmationDialog")])
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_ToolTip")])
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_Flash")])
		R.call_member(c, "PlayCustomMusic", [(c).fields.get("m_MenuMusic"), 0, true, 0])
		R.call_member((c).fields.get("m_CityAmbianceSound"), "Play", [true, 0.5])
		R.call_member(c, "DoFlash", [1, 1])
		R.call_member(c, "UpdateOptionsPanel", [])
		R.call_member(c, "SlideInterface", [R.static_value("RDGame", "MenuState_All"), false, true])
		R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet1"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet2"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet4"), "visible", false, "=")
		(c).fields["m_MenuJets"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
		R.call_member((c).fields.get("m_MenuJets"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet1")])
		R.call_member((c).fields.get("m_MenuJets"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet2")])
		R.call_member((c).fields.get("m_MenuJets"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Jet4")])
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion1"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion2"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion3"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion4"), "visible", false, "=")
		(c).fields["m_MenuExplosions"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
		R.call_member((c).fields.get("m_MenuExplosions"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion1")])
		R.call_member((c).fields.get("m_MenuExplosions"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion2")])
		R.call_member((c).fields.get("m_MenuExplosions"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion3")])
		R.call_member((c).fields.get("m_MenuExplosions"), "AddValue", [R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Explosion4")])
		R.set_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "stageFocusRect", false, "=")
		R.call_member(c.fields.get("m_FocusManager"), "setFocus", [(c).fields.get("m_Menu")])
		if R.truth((float((c).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_NewYear")))):
			pass
			R.invoke(R.get_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Fireworks"), "gotoAndStop"), [1])
			R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "Fireworks"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "LaborDay"), "visible", (float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_LaborDay"))), "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "LaborDaySign"), "visible", (float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_LaborDay"))), "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "FemaleZombie"), "visible", ((float((c).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_RobotDay"))) and (float((c).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_LaborDay")))), "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "FemaleRobot"), "visible", (float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_RobotDay"))), "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "MaleZombie"), "visible", (float((c).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_RobotDay"))), "=")
		R.set_value(R.get_value(R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), "MaleRobot"), "visible", (float((c).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_RobotDay"))), "=")
	else:
		pass
		if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Cinematic")))):
			pass
			if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "StorageNotice")):
				pass
				R.invoke(R.get_value(R.resolve(c, "Security", "RDGame"), "showSettings"), [R.get_value(R.resolve(c, "SecurityPanel", "RDGame"), "LOCAL_STORAGE")])
	return null

static func f_ScaleAndCache(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.set_value(R.get_value(R.get_value(v_mc, "Content"), "Content"), "scaleX", 2, "=")
	R.set_value(R.get_value(R.get_value(v_mc, "Content"), "Content"), "scaleY", 2, "=")
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(v_mc, "Content")])
	R.set_value(R.get_value(v_mc, "Content"), "scaleX", 0.5, "=")
	R.set_value(R.get_value(v_mc, "Content"), "scaleY", 0.5, "=")
	return null

static func f_EndCinematic(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.truth((c).fields.get("m_CurrentGameMode")), func(): return R.call_member((c).fields.get("m_CurrentGameMode"), "IsInCinematic", []))):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "EndCinematic", [])
	else:
		pass
		if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "NGIntro")):
			pass
			R.call_member(c, "StartCinematic", ["SDFIntro", false])
		else:
			pass
			if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "SDFIntro")):
				pass
				R.call_member(c, "StartCinematic", ["EDIntro", false])
			else:
				pass
				if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "EDIntro")):
					pass
					R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
				else:
					pass
					if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "GameIntro")):
						pass
						R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
					else:
						pass
						if R.truth((R.binary("==", c.fields.get("m_szCurrentCinematic"), "EnterHighway") or R.binary("==", c.fields.get("m_szCurrentCinematic"), "ExitHighway"))):
							pass
							R.call_member(c, "StartGameMode", [(c).fields.get("m_CinematicTransitionGameMode")])
						else:
							pass
							if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "ChopperTransition")):
								pass
								R.call_member(c, "StartGameMode", [(c).fields.get("m_CinematicTransitionGameMode")])
							else:
								pass
								if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "GameEnding")):
									pass
									R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
								else:
									pass
									R.invoke(R.get_value(R.super_ref(c, "RDGame"), "EndCinematic"), [])
	R.call_member(c, "ClearCinematic", [])
	return null

static func f_SkipCinematic(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.truth((c).fields.get("m_CurrentGameMode")), func(): return R.call_member((c).fields.get("m_CurrentGameMode"), "IsInCinematic", []))):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "EndCinematic", [])
	else:
		pass
		if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "StorageNotice")):
			pass
			R.call_member(c, "DoStartGame", [])
		else:
			pass
			if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "NGIntro")):
				pass
				R.call_member(c, "StartCinematic", ["SDFIntro", false])
			else:
				pass
				if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "SDFIntro")):
					pass
					R.call_member(c, "StartCinematic", ["EDIntro", false])
				else:
					pass
					if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "EDIntro")):
						pass
						R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
					else:
						pass
						if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "GameIntro")):
							pass
							R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
						else:
							pass
							if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "GameEnding")):
								pass
								R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
							else:
								pass
								if R.truth(R.binary("==", c.fields.get("m_szCurrentCinematic"), "ChopperTransition")):
									pass
									R.call_member(c, "StartGameMode", [(c).fields.get("m_CinematicTransitionGameMode")])
								else:
									pass
									R.invoke(R.get_value(R.super_ref(c, "RDGame"), "SkipCinematic"), [])
	R.call_member(c, "ClearCinematic", [])
	return null

static func f_BeginGameState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "BeginGameState"), [v_iState])
	if R.truth(((float(v_iState) == float(R.static_value("BasicGame", "GameState_MainMenu"))) or (float(v_iState) == float(R.static_value("BasicGame", "GameState_Cinematic"))))):
		pass
		if R.truth(R.binary("==", R.get_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "quality"), R.get_value(R.resolve(c, "StageQuality", "RDGame"), "LOW"))):
			pass
			pass
		R.set_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGame"), "MEDIUM"), "=")
		if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
			pass
			(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
			(c).fields["m_LoadedFile"] = R.coerce(null, "SaveFile")
			(c).fields["m_bPlayFromEditor"] = false
			R.set_value(R.get_value((c).fields.get("m_Menu"), "ChallengeModeNotice"), "visible", false, "=")
			R.set_value(R.get_value((c).fields.get("m_Menu"), "MutantModeNotice"), "visible", false, "=")
			if R.truth((((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bSeenChallengeModeNotice")))):
				pass
				R.set_value(R.get_value((c).fields.get("m_Menu"), "ChallengeModeNotice"), "visible", true, "=")
				R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "ChallengeModeNotice"), "gotoAndPlay"), [1])
				((c).fields.get("m_PlayerInfo")).fields["m_bSeenChallengeModeNotice"] = true
				((c).fields.get("m_PlayerInfo")).fields["m_bSeenMutantModeNotice"] = true
				R.call_member(((c).fields.get("m_Hud")).fields.get("m_TutorialSound"), "Play", [])
			if R.truth((((c).fields.get("m_PlayerInfo")).fields.get("m_bMutantLevelFinished") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bSeenMutantModeNotice")))):
				pass
				R.set_value(R.get_value((c).fields.get("m_Menu"), "MutantModeNotice"), "visible", true, "=")
				R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "MutantModeNotice"), "gotoAndPlay"), [1])
				((c).fields.get("m_PlayerInfo")).fields["m_bSeenMutantModeNotice"] = true
				R.call_member(((c).fields.get("m_Hud")).fields.get("m_TutorialSound"), "Play", [])
			R.call_member(c, "SendAllAPIStats", [])
	else:
		pass
		if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_Game")))):
			pass
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_WorldLayer")])
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_HudLayer")])
	R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_BorderLayer")])
	return null

static func f_EndGameState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "EndGameState"), [v_iState])
	if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_Game")))):
		pass
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_WorldLayer")])
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_HudLayer")])
		R.call_member(c, "StartGameMode", [null])
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "addChild"), [(c).fields.get("m_MessageBox")])
		(c).fields["m_iLastDeathType"] = R.coerce(R.static_value("RDPlayer", "DeathType_None"), "int")
	else:
		pass
		if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
			pass
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_ConfirmationDialog")])
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_ToolTip")])
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_Flash")])
			R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_Menu")])
			R.set_value((c).fields.get("m_ToolTip"), "visible", false, "=")
			if R.truth((c).fields.get("m_MenuZombieSound")):
				pass
				R.call_member((c).fields.get("m_MenuZombieSound"), "Stop", [])
				(c).fields["m_MenuZombieSound"] = R.coerce(null, "DTSound")
			R.call_member((c).fields.get("m_CityAmbianceSound"), "Stop", [0.5])
			(c).fields["m_iMenuState"] = R.coerce(R.static_value("RDGame", "MenuState_None"), "int")
			(c).fields["m_iPendingMenuState"] = R.coerce(R.static_value("RDGame", "MenuState_None"), "int")
	if R.truth(R.invoke(R.get_value(c.fields.get("m_RootMC"), "contains"), [(c).fields.get("m_BorderLayer")])):
		pass
		R.invoke(R.get_value(c.fields.get("m_RootMC"), "removeChild"), [(c).fields.get("m_BorderLayer")])
	return null

static func f_Tick(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_fFPS"] = float(R.binary("/", 1, v_fDeltaTime))
	(c).fields["m_fPrePauseDeltaTime"] = float(0.03333)
	v_fDeltaTime = R.coerce((0 if R.truth(c.fields.get("m_bPaused")) else (c).fields.get("m_fPrePauseDeltaTime")), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "Tick"), [v_fDeltaTime])
	return null

static func f_UpdateFlash(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.get_value((c).fields.get("m_Flash"), "visible")):
		pass
		if R.truth((c).fields.get("m_bFlashFadeOut")):
			pass
			R.set_value((c).fields.get("m_Flash"), "alpha", (float(R.binary("/", (c).fields.get("m_fFlashTime"), (c).fields.get("m_fFlashDuration"))) * float(R.binary("/", (c).fields.get("m_fFlashTime"), (c).fields.get("m_fFlashDuration")))), "=")
			if R.truth((float((c).fields.get("m_fFlashTime")) == float(0))):
				pass
				R.set_value((c).fields.get("m_Flash"), "visible", false, "=")
			(c).fields["m_fFlashTime"] = float(maxf(float((float((c).fields.get("m_fFlashTime")) - float((c).fields.get("m_fPrePauseDeltaTime")))), float(0)))
		else:
			pass
			R.set_value((c).fields.get("m_Flash"), "alpha", (float(R.binary("/", (c).fields.get("m_fFlashTime"), (c).fields.get("m_fFlashDuration"))) * float(R.binary("/", (c).fields.get("m_fFlashTime"), (c).fields.get("m_fFlashDuration")))), "=")
			(c).fields["m_fFlashTime"] = float(minf(float((float((c).fields.get("m_fFlashTime")) + float((c).fields.get("m_fPrePauseDeltaTime")))), float((c).fields.get("m_fFlashDuration"))))
	return null

static func f_UpdateGameState(c: Variant, a: Array) -> Variant:
	var v_explosionMC: Variant = null
	var v_dynamicMenuInfos: Variant = null
	var v_fMoveTime: Variant = NAN
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fScale: Variant = NAN
	var v_jetMC: Variant = null
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_fDeltaTime: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_explosionMC = R.coerce(null, "MovieClip")
	v_dynamicMenuInfos = R.coerce(null, "Array")
	v_fMoveTime = float(NAN)
	v_fX = float(NAN)
	v_fY = float(NAN)
	v_fScale = float(NAN)
	v_jetMC = R.coerce(null, "MovieClip")
	if R.truth((float((c).fields.get("m_fWaitingForAPITimer")) > float(0))):
		pass
		(c).fields["m_fWaitingForAPITimer"] = R.coerce(R.binary("-", (c).fields.get("m_fWaitingForAPITimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fWaitingForAPITimer")) <= float(0))):
			pass
			R.call_member(c, "DoStartGame", [])
	R.call_member(c, "UpdateFlash", [v_fDeltaTime])
	R.call_member(c, "UpdateContentLink", [v_fDeltaTime])
	R.call_member(c, "UpdateToolTip", [(c).fields.get("m_fPrePauseDeltaTime")])
	if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) > float(0))):
		pass
		(c).fields["m_fAPITimeoutTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fAPITimeoutTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) <= float(0))):
			pass
			R.call_member(c, "HideLoadScreen", [])
			R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Game")))):
		pass
		R.call_member(c, "UpdateGame", [v_fDeltaTime])
		R.call_member(c, "UpdateInGameMenu", [v_fDeltaTime])
	else:
		pass
		if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
			pass
			R.call_member(c, "UpdateAchievements", [v_fDeltaTime])
			R.call_member(c, "UpdateFileToolTip", [])
			if R.truth((R.unary("!", (c).fields.get("m_MenuZombieSound")) or R.unary("!", R.call_member((c).fields.get("m_MenuZombieSound"), "IsPlaying", [])))):
				pass
				(c).fields["m_fMenuZombieSoundTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fMenuZombieSoundTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fMenuZombieSoundTimer")) <= float(0))):
					pass
					(c).fields["m_fMenuZombieSoundTimer"] = float((float(R.static_value("RDGame", "MenuZombieSoundDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuZombieSoundDelayRandom"))))))
					(c).fields["m_MenuZombieSound"] = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MenuZombieSounds"), "GetRandomValue", []), R.klass("DTSound")), "DTSound")
					R.call_member((c).fields.get("m_MenuZombieSound"), "Play", [])
			if R.truth((float((c).fields.get("m_fMenuExplosionTimer")) > float(0))):
				pass
				(c).fields["m_fMenuExplosionTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fMenuExplosionTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fMenuExplosionTimer")) <= float(0))):
					pass
					R.call_member(c, "PlayMenuExplosionSound", [])
					v_explosionMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MenuExplosions"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
					R.set_value(v_explosionMC, "visible", true, "=")
					R.invoke(R.get_value(v_explosionMC, "gotoAndPlay"), [1])
					R.set_value(c, "m_iMenuExplosionCount", 1, "-=")
					if R.truth((float((c).fields.get("m_iMenuExplosionCount")) > float(0))):
						pass
						(c).fields["m_fMenuExplosionTimer"] = float((float(R.static_value("RDGame", "MenuExtraExplosionDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuExtraExplosionDelayRandom"))))))
			(c).fields["m_fMenuJetTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fMenuJetTimer"), v_fDeltaTime), "Number")
			if R.truth(R.unary("!", (c).fields.get("m_bMenuMoving"))):
				pass
				v_fMoveTime = float((float(5) + float((float(randf()) * float(3)))))
				if R.truth((float((c).fields.get("m_fMenuJetTimer")) <= float(0))):
					pass
					v_dynamicMenuInfos = R.coerce((c).fields.get("m_DynamicMenuJetInfo"), "Array")
					v_jetMC = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MenuJets"), "GetRandomValue", []), R.klass("MovieClip")), "MovieClip")
					R.set_value(v_jetMC, "visible", true, "=")
					R.invoke(R.get_value(v_jetMC, "gotoAndPlay"), ["fly"])
					R.call_member((c).fields.get("m_MenuJetSound"), "Play", [])
					(c).fields["m_fMenuJetTimer"] = float((float(R.static_value("RDGame", "MenuJetDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuJetDelayRandom"))))))
					v_fMoveTime = float((float(1) + float((float(randf()) * float(1)))))
					(c).fields["m_fMenuExplosionTimer"] = float((float(R.static_value("RDGame", "MenuExplosionDelayMin")) + float((float(randf()) * float(R.static_value("RDGame", "MenuExplosionDelayRandom"))))))
					(c).fields["m_iMenuExplosionCount"] = R.coerce(R.binary("+", 1, R.call_static("Maths", "RandomInt", [3])), "int")
				else:
					pass
					v_dynamicMenuInfos = R.coerce(R.binary("as", R.call_member((c).fields.get("m_DynamicMenuInfos"), "GetRandomValue", []), R.klass("Array")), "Array")
				v_fX = float(R.num(R.get_value(v_dynamicMenuInfos, 0)))
				v_fY = float(R.num(R.get_value(v_dynamicMenuInfos, 1)))
				v_fScale = float(R.binary("/", R.get_value(v_dynamicMenuInfos, 2), 100))
				R.call_static("gs.TweenLite", "to", [R.get_value(c.fields.get("m_RootMC"), "MenuScreen"), v_fMoveTime, {"x": v_fX, "y": v_fY, "scaleX": v_fScale, "scaleY": v_fScale, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": R.get_value(c, "OnMenuMoveDone")}])
				(c).fields["m_bMenuMoving"] = true
		else:
			pass
			if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Cinematic")))):
				pass
				R.call_member(c, "UpdateCinematic", [v_fDeltaTime])
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "UpdateGameState"), [v_iState, v_fDeltaTime])
	return null

static func f_PlayMenuExplosionSound(c: Variant, a: Array) -> Variant:
	var v_explosionSound: Variant = null
	v_explosionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MenuExplosionSounds"), "GetRandomValue", []), R.klass("DTSound")), "DTSound")
	R.call_member(v_explosionSound, "Play", [])
	return null

static func f_OnMenuMoveDone(c: Variant, a: Array) -> Variant:
	(c).fields["m_bMenuMoving"] = false
	return null

static func f_UpdateGame(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "Update", [v_fDeltaTime])
		R.call_member((c).fields.get("m_Hud"), "Update", [v_fDeltaTime])
		R.call_member(c, "UpdateMessageBox", [v_fDeltaTime])
	return null

static func f_UpdateInGameMenu(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Achievements")))):
		pass
		R.call_member(c, "UpdateAchievements", [(c).fields.get("m_fPrePauseDeltaTime")])
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_slot: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_i = R.coerce(0, "int")
	v_slot = R.coerce(null, "MovieClip")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseDown"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_Hud"), "OnMouseDown", [v_event])):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_ConfirmationDialog"), "YesButton"))):
		pass
		R.call_member(c, "PlayButtonSound", [])
		R.call_member(c, "OnConfirmationYes", [])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_ConfirmationDialog"), "NoButton"))):
			pass
			R.call_member(c, "PlayButtonSound", [])
			R.call_member(c, "OnConfirmationNo", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_ConfirmationDialog"), "NewButton"))):
				pass
				R.call_member(c, "PlayButtonSound", [])
				R.call_member(c, "OnConfirmationNew", [])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_ConfirmationDialog"), "ResumeButton"))):
					pass
					R.call_member(c, "PlayButtonSound", [])
					R.call_member(c, "OnConfirmationResume", [])
				else:
					pass
					if R.truth(R.get_value((c).fields.get("m_ConfirmationDialog"), "visible")):
						pass
						return null
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(c.fields.get("m_RootMC"), "SkipCinematicButton"))):
						pass
						R.call_member(c, "SkipCinematic", [])
						R.call_member(c, "PlayButtonSound", [])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "StoryMode"))):
							pass
							if R.truth((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iStoryLevel")) > float(0))):
								pass
								R.call_member(c, "ShowConfirmation", [R.static_value("RDGame", "Confirmation_StoryMode")])
								R.call_member(c, "PlayButtonSound", [])
							else:
								pass
								(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeStory"), "RDGameMode")
								R.call_member(c, "StartCinematic", ["GameIntro", false])
								R.call_member(c, "PlayButtonSound", [])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HardcoreMode"))):
								pass
								if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished")):
									pass
									R.call_member(c, "PlayButtonSound", [])
									(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeHardcore"), "RDGameMode")
									R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
								else:
									pass
									R.call_member(c, "PlayErrorSound", [])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "TimeMode"))):
									pass
									R.call_member(c, "PlayButtonSound", [])
									(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeTime"), "RDGameMode")
									R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalMode"))):
										pass
										R.call_member(c, "PlayButtonSound", [])
										(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeDistance"), "RDGameMode")
										R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "RescueMode"))):
											pass
											if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished")):
												pass
												R.call_member(c, "PlayButtonSound", [])
												(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeChopperRescue"), "RDGameMode")
												R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
											else:
												pass
												R.call_member(c, "PlayErrorSound", [])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "RescueSandboxMode"))):
												pass
												R.call_member(c, "PlayButtonSound", [])
												(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeChopperRescueSandbox"), "RDGameMode")
												R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MilitaryMode"))):
													pass
													if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished")):
														pass
														R.call_member(c, "PlayButtonSound", [])
														(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeMilitary"), "RDGameMode")
														R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
													else:
														pass
														R.call_member(c, "PlayErrorSound", [])
												else:
													pass
													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MutantMode"))):
														pass
														if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMutantLevelFinished")):
															pass
															R.call_member(c, "PlayButtonSound", [])
															(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeMutant"), "RDGameMode")
															R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
														else:
															pass
															R.call_member(c, "PlayErrorSound", [])
													else:
														pass
														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SandboxMode"))):
															pass
															(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeSandbox"), "RDGameMode")
															R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
															R.call_member(c, "PlayButtonSound", [])
														else:
															pass
															if R.truth(((((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "ChallengesBack")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "OptionsBack"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "CreditsBack"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "AchievementsBack"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HighScoresBack")))):
																pass
																R.call_member(c, "GoToMenuState", [(c).fields.get("m_iPreviousMenuState")])
																R.call_member(c, "PlayButtonSound", [])
															else:
																pass
																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaignsBack"))):
																	pass
																	R.call_member(c, "CancelLoadFiles", [])
																	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
																	R.call_member(c, "PlayButtonSound", [])
																else:
																	pass
																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits2"))):
																		pass
																		R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://evil-dog.newgrounds.com"]), "_blank"])
																	else:
																		pass
																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits4"))):
																			pass
																			R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://sickdeathfiend.newgrounds.com"]), "_blank"])
																		else:
																			pass
																			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits6"))):
																				pass
																				R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.symphonyofspecters.com"]), "_blank"])
																			else:
																				pass
																				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits8"))):
																					pass
																					R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.newgrounds.com"]), "_blank"])
																				else:
																					pass
																					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits10"))):
																						pass
																						R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://sapphire.newgrounds.com/"]), "_blank"])
																					else:
																						pass
																						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits11"))):
																							pass
																							R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://general-ivan.newgrounds.com/"]), "_blank"])
																						else:
																							pass
																							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits12"))):
																								pass
																								R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.youtube.com/druoxtheshredder"]), "_blank"])
																							else:
																								pass
																								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits13"))):
																									pass
																									R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.jaxamoto.com"]), "_blank"])
																								else:
																									pass
																									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits14"))):
																										pass
																										R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.youtube.com/vaabeckie"]), "_blank"])
																									else:
																										pass
																										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits15"))):
																											pass
																											R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://antfish.webs.com"]), "_blank"])
																										else:
																											pass
																											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits16"))):
																												pass
																												R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://sickdeathfiend.newgrounds.com"]), "_blank"])
																											else:
																												pass
																												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits"))):
																													pass
																													R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Credits")])
																													R.call_member(c, "PlayButtonSound", [])
																												else:
																													pass
																													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Challenges"))):
																														pass
																														R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_GameModes")])
																														R.call_member(c, "PlayButtonSound", [])
																													else:
																														pass
																														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaigns"))):
																															pass
																															R.call_member(c, "PlayButtonSound", [])
																															if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Kongregate")])):
																																pass
																																R.call_member(c, "InitUserCampaignsPanel", [])
																															else:
																																pass
																																R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_UserCampaigns")])
																														else:
																															pass
																															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesPlay"))):
																																pass
																																R.call_member(c, "PlayButtonSound", [])
																																(c).fields["m_LoadedFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iPendingUserCampaignIndex")), "SaveFile")
																																(c).fields["m_bLoadedFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
																																(c).fields["m_bLoadedFileRated"] = false
																																R.call_member(c, "PlayCustomCampaign", [R.binary("as", R.get_value((c).fields.get("m_LoadedFile"), "data"), R.klass("ByteArray")), false])
																															else:
																																pass
																																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesBack"))):
																																	pass
																																	R.call_member(c, "PlayButtonSound", [])
																																	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_UserCampaigns")])
																																else:
																																	pass
																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "General"))):
																																		pass
																																		R.call_member(c, "PlayButtonSound", [])
																																		R.call_member(c, "SetCampaignPropertyPanel", [R.static_value("RDGame", "CampaignPropertyPage_General")])
																																		return true
																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "Weapons"))):
																																		pass
																																		R.call_member(c, "PlayButtonSound", [])
																																		R.call_member(c, "SetCampaignPropertyPanel", [R.static_value("RDGame", "CampaignPropertyPage_Weapons")])
																																		return true
																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "Controls"))):
																																		pass
																																		R.call_member(c, "PlayButtonSound", [])
																																		R.call_member(c, "SetCampaignPropertyPanel", [R.static_value("RDGame", "CampaignPropertyPage_Controls")])
																																		return true
																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "CampaignEditor"))):
																																		pass
																																		R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeEditor")])
																																		R.call_member(c, "PlayButtonSound", [])
																																	else:
																																		pass
																																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Achievements"))):
																																			pass
																																			R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Achievements")])
																																			R.call_member(c, "PlayButtonSound", [])
																																		else:
																																			pass
																																			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollUp"))):
																																				pass
																																				(c).fields["m_fAchievementsScrollSpeed"] = R.coerce(R.unary("-", R.static_value("RDGame", "AchievementsScrollSpeed")), "Number")
																																				R.call_member(c, "PlayButtonSound", [])
																																			else:
																																				pass
																																				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollDown"))):
																																					pass
																																					(c).fields["m_fAchievementsScrollSpeed"] = float(R.static_value("RDGame", "AchievementsScrollSpeed"))
																																					R.call_member(c, "PlayButtonSound", [])
																																				else:
																																					pass
																																					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Options"))):
																																						pass
																																						R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Options")])
																																						R.call_member(c, "PlayButtonSound", [])
																																					else:
																																						pass
																																						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Sounds"))):
																																							pass
																																							R.call_member(c, "SetSoundsOn", [R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bSound"))])
																																							R.call_member(c, "PlayButtonSound", [])
																																						else:
																																							pass
																																							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Music"))):
																																								pass
																																								R.call_member(c, "SetMusicOn", [R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic"))])
																																								R.call_member(c, "PlayButtonSound", [])
																																							else:
																																								pass
																																								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Quality"))):
																																									pass
																																									R.call_member(c, "ToggleQuality", [])
																																									R.call_member(c, "PlayButtonSound", [])
																																								else:
																																									pass
																																									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "ZombieTints"))):
																																										pass
																																										R.call_member(c, "SetZombieTintsOn", [R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bZombieTints"))])
																																										R.call_member(c, "PlayButtonSound", [])
																																									else:
																																										pass
																																										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Fullscreen"))):
																																											pass
																																											R.call_member(c, "SetFullscreen", [R.unary("!", (c).fields.get("m_bFullscreen"))])
																																											R.call_member(c, "PlayButtonSound", [])
																																										else:
																																											pass
																																											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SaveData"))):
																																												pass
																																												R.call_member(c, "DeleteSaveGame", [])
																																												R.call_member(c, "PlayButtonSound", [])
																																											else:
																																												pass
																																												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey1"))):
																																													pass
																																													if R.truth((float((c).fields.get("m_iEditedKey")) == float(1))):
																																														pass
																																														(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																														R.call_member(c, "UpdateOptionsPanel", [])
																																													else:
																																														pass
																																														R.call_member(c, "SelectKey", [1])
																																													R.call_member(c, "PlayButtonSound", [])
																																												else:
																																													pass
																																													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey2"))):
																																														pass
																																														if R.truth((float((c).fields.get("m_iEditedKey")) == float(2))):
																																															pass
																																															(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																															R.call_member(c, "UpdateOptionsPanel", [])
																																														else:
																																															pass
																																															R.call_member(c, "SelectKey", [2])
																																														R.call_member(c, "PlayButtonSound", [])
																																													else:
																																														pass
																																														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey3"))):
																																															pass
																																															if R.truth((float((c).fields.get("m_iEditedKey")) == float(3))):
																																																pass
																																																(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																R.call_member(c, "UpdateOptionsPanel", [])
																																															else:
																																																pass
																																																R.call_member(c, "SelectKey", [3])
																																															R.call_member(c, "PlayButtonSound", [])
																																														else:
																																															pass
																																															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey4"))):
																																																pass
																																																if R.truth((float((c).fields.get("m_iEditedKey")) == float(4))):
																																																	pass
																																																	(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																	R.call_member(c, "UpdateOptionsPanel", [])
																																																else:
																																																	pass
																																																	R.call_member(c, "SelectKey", [4])
																																																R.call_member(c, "PlayButtonSound", [])
																																															else:
																																																pass
																																																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey5"))):
																																																	pass
																																																	if R.truth((float((c).fields.get("m_iEditedKey")) == float(5))):
																																																		pass
																																																		(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																		R.call_member(c, "UpdateOptionsPanel", [])
																																																	else:
																																																		pass
																																																		R.call_member(c, "SelectKey", [5])
																																																	R.call_member(c, "PlayButtonSound", [])
																																																else:
																																																	pass
																																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey6"))):
																																																		pass
																																																		if R.truth((float((c).fields.get("m_iEditedKey")) == float(6))):
																																																			pass
																																																			(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																			R.call_member(c, "UpdateOptionsPanel", [])
																																																		else:
																																																			pass
																																																			R.call_member(c, "SelectKey", [6])
																																																		R.call_member(c, "PlayButtonSound", [])
																																																	else:
																																																		pass
																																																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey7"))):
																																																			pass
																																																			if R.truth((float((c).fields.get("m_iEditedKey")) == float(7))):
																																																				pass
																																																				(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																				R.call_member(c, "UpdateOptionsPanel", [])
																																																			else:
																																																				pass
																																																				R.call_member(c, "SelectKey", [7])
																																																			R.call_member(c, "PlayButtonSound", [])
																																																		else:
																																																			pass
																																																			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey8"))):
																																																				pass
																																																				if R.truth((float((c).fields.get("m_iEditedKey")) == float(8))):
																																																					pass
																																																					(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																					R.call_member(c, "UpdateOptionsPanel", [])
																																																				else:
																																																					pass
																																																					R.call_member(c, "SelectKey", [8])
																																																				R.call_member(c, "PlayButtonSound", [])
																																																			else:
																																																				pass
																																																				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey9"))):
																																																					pass
																																																					if R.truth((float((c).fields.get("m_iEditedKey")) == float(9))):
																																																						pass
																																																						(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																						R.call_member(c, "UpdateOptionsPanel", [])
																																																					else:
																																																						pass
																																																						R.call_member(c, "SelectKey", [9])
																																																					R.call_member(c, "PlayButtonSound", [])
																																																				else:
																																																					pass
																																																					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey10"))):
																																																						pass
																																																						if R.truth((float((c).fields.get("m_iEditedKey")) == float(10))):
																																																							pass
																																																							(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																							R.call_member(c, "UpdateOptionsPanel", [])
																																																						else:
																																																							pass
																																																							R.call_member(c, "SelectKey", [10])
																																																						R.call_member(c, "PlayButtonSound", [])
																																																					else:
																																																						pass
																																																						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey11"))):
																																																							pass
																																																							if R.truth((float((c).fields.get("m_iEditedKey")) == float(11))):
																																																								pass
																																																								(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
																																																								R.call_member(c, "UpdateOptionsPanel", [])
																																																							else:
																																																								pass
																																																								R.call_member(c, "SelectKey", [11])
																																																							R.call_member(c, "PlayButtonSound", [])
																																																						else:
																																																							pass
																																																							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HighScores"))):
																																																								pass
																																																								R.call_member(c, "SetHighScoreMode", ["Out Of Time Distance"])
																																																								R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Highscores")])
																																																								R.call_member(c, "PlayButtonSound", [])
																																																							else:
																																																								pass
																																																								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "TimeMode"))):
																																																									pass
																																																									R.call_member(c, "DoFlash", [1, 0.25])
																																																									R.call_member(c, "PlayButtonSound", [])
																																																									R.call_member(c, "SetHighScoreMode", ["Out Of Time Distance"])
																																																								else:
																																																									pass
																																																									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "MilitaryMode"))):
																																																										pass
																																																										R.call_member(c, "DoFlash", [1, 0.25])
																																																										R.call_member(c, "PlayButtonSound", [])
																																																										R.call_member(c, "SetHighScoreMode", ["F.U.B.A.R. Distance"])
																																																									else:
																																																										pass
																																																										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "RescueMode"))):
																																																											pass
																																																											R.call_member(c, "DoFlash", [1, 0.25])
																																																											R.call_member(c, "PlayButtonSound", [])
																																																											R.call_member(c, "SetHighScoreMode", ["Rescue OP"])
																																																										else:
																																																											pass
																																																											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "DistanceMode"))):
																																																												pass
																																																												R.call_member(c, "DoFlash", [1, 0.25])
																																																												R.call_member(c, "PlayButtonSound", [])
																																																												R.call_member(c, "SetHighScoreMode", ["Dead State Distance"])
																																																											else:
																																																												pass
																																																												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "MutantMode"))):
																																																													pass
																																																													R.call_member(c, "DoFlash", [1, 0.25])
																																																													R.call_member(c, "PlayButtonSound", [])
																																																													R.call_member(c, "SetHighScoreMode", ["Mutant Meltdown Distance"])
																																																												else:
																																																													pass
																																																													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotRoad"))):
																																																														pass
																																																														R.call_member(c, "PlayButtonSound", [])
																																																														R.call_member(c, "SetContentLink", [1])
																																																													else:
																																																														pass
																																																														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotLab"))):
																																																															pass
																																																															R.call_member(c, "PlayButtonSound", [])
																																																															R.call_member(c, "SetContentLink", [2])
																																																														else:
																																																															pass
																																																															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotRange"))):
																																																																pass
																																																																R.call_member(c, "PlayButtonSound", [])
																																																																R.call_member(c, "SetContentLink", [3])
																																																															else:
																																																																pass
																																																																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotSoundtrack"))):
																																																																	pass
																																																																	R.call_member(c, "PlayButtonSound", [])
																																																																	R.call_member(c, "SetContentLink", [4])
																																																																else:
																																																																	pass
																																																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotPoster"))):
																																																																		pass
																																																																		R.call_member(c, "PlayButtonSound", [])
																																																																		R.call_member(c, "SetContentLink", [5])
																																																																	else:
																																																																		pass
																																																																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotFacebook"))):
																																																																			pass
																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																			R.call_member(c, "SetContentLink", [6])
																																																																		else:
																																																																			pass
																																																																			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotNewgrounds"))):
																																																																				pass
																																																																				R.call_member(c, "PlayButtonSound", [])
																																																																				R.call_member(c, "SetContentLink", [7])
																																																																			else:
																																																																				pass
																																																																				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RoadLink"))):
																																																																					pass
																																																																					R.call_member(c, "PlayButtonSound", [])
																																																																					R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.newgrounds.com/portal/view/550714"]), "_blank"])
																																																																				else:
																																																																					pass
																																																																					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "LabLink"))):
																																																																						pass
																																																																						R.call_member(c, "PlayButtonSound", [])
																																																																						R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.newgrounds.com/portal/view/581901"]), "_blank"])
																																																																					else:
																																																																						pass
																																																																						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RangeLink"))):
																																																																							pass
																																																																							R.call_member(c, "PlayButtonSound", [])
																																																																							R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.evil-dog.com/range-of-the-dead.html"]), "_blank"])
																																																																						else:
																																																																							pass
																																																																							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "SoundtrackLink"))):
																																																																								pass
																																																																								R.call_member(c, "PlayButtonSound", [])
																																																																								R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://evil-dog.bandcamp.com/album/saga-of-the-dead-soundtrack"]), "_blank"])
																																																																							else:
																																																																								pass
																																																																								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "PosterLink"))):
																																																																									pass
																																																																									R.call_member(c, "PlayButtonSound", [])
																																																																									R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.newgrounds.com/store/product/saga-of-the-dead-poster"]), "_blank"])
																																																																								else:
																																																																									pass
																																																																									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "FacebookLink"))):
																																																																										pass
																																																																										R.call_member(c, "PlayButtonSound", [])
																																																																										R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["https://www.facebook.com/SagaOfTheDead"]), "_blank"])
																																																																									else:
																																																																										pass
																																																																										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "NewgroundsLink"))):
																																																																											pass
																																																																											R.call_member(c, "PlayButtonSound", [])
																																																																											R.invoke(R.resolve(c, "navigateToURL", "RDGame"), [R.construct(R.resolve(c, "URLRequest", "RDGame"), ["http://www.newgrounds.com/games"]), "_blank"])
																																																																										else:
																																																																											pass
																																																																											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"))):
																																																																												pass
																																																																												R.call_member(c, "ShowSurvivalGuide", [])
																																																																											else:
																																																																												pass
																																																																												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "Exit"))):
																																																																													pass
																																																																													R.call_member(c, "PlayPaperSound", [])
																																																																													R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", false, "=")
																																																																													R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "visible", false, "=")
																																																																													R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"), "visible", true, "=")
																																																																												else:
																																																																													pass
																																																																													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "Previous"))):
																																																																														pass
																																																																														R.call_member(c, "PlayPaperSound", [])
																																																																														(c).fields["m_iSurvivalGuideTablePage"] = R.coerce(0, "int")
																																																																														R.call_member(c, "UpdateSurvivalGuideTable", [])
																																																																													else:
																																																																														pass
																																																																														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "Next"))):
																																																																															pass
																																																																															R.call_member(c, "PlayPaperSound", [])
																																																																															(c).fields["m_iSurvivalGuideTablePage"] = R.coerce(1, "int")
																																																																															R.call_member(c, "UpdateSurvivalGuideTable", [])
																																																																														else:
																																																																															pass
																																																																															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Next"))):
																																																																																pass
																																																																																R.call_member(c, "PlayPaperSound", [])
																																																																																(c).fields["m_iSurvivalGuidePage"] = R.coerce(R.call_member(c, "GetNextSurvivalPage", []), "int")
																																																																																R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "gotoAndStop"), [(c).fields.get("m_iSurvivalGuidePage")])
																																																																																R.call_member((c).fields.get("m_PlayerInfo"), "SeeSurvivalItem", [(c).fields.get("m_iSurvivalGuidePage")])
																																																																																R.call_member(c, "SavePlayerInfo", [])
																																																																																R.call_member(c, "UpdateSurvivalGuideNavigation", [])
																																																																															else:
																																																																																pass
																																																																																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Previous"))):
																																																																																	pass
																																																																																	R.call_member(c, "PlayPaperSound", [])
																																																																																	(c).fields["m_iSurvivalGuidePage"] = R.coerce(R.call_member(c, "GetPreviousSurvivalPage", []), "int")
																																																																																	R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "gotoAndStop"), [(c).fields.get("m_iSurvivalGuidePage")])
																																																																																	R.call_member((c).fields.get("m_PlayerInfo"), "SeeSurvivalItem", [(c).fields.get("m_iSurvivalGuidePage")])
																																																																																	R.call_member(c, "SavePlayerInfo", [])
																																																																																	R.call_member(c, "UpdateSurvivalGuideNavigation", [])
																																																																																else:
																																																																																	pass
																																																																																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Exit"))):
																																																																																		pass
																																																																																		R.call_member(c, "PlayPaperSound", [])
																																																																																		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", true, "=")
																																																																																		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "visible", false, "=")
																																																																																		R.call_member(c, "UpdateSurvivalGuideTable", [])
																																																																																	else:
																																																																																		pass
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopYours")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropYours")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropYours"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Yours")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopRecent")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRecent")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRecent"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Recent")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopBest")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropBest")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropBest"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Best")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopWorst")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropWorst")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropWorst"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Worst")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopUnrated")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropUnrated")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropUnrated"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Unrated")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopRandom")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRandom")))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRandom"), "visible")):
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [false])
																																																																																				R.call_member(c, "SetUserCampaignsSorting", [R.static_value("RDGame", "Sorting_Random")])
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			else:
																																																																																				pass
																																																																																				R.call_member(c, "ShowSortingMenu", [true])
																																																																																			return true
																																																																																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "ScrollLeft"))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth((float((c).fields.get("m_iUserCampaignsPage")) > float(0))):
																																																																																				pass
																																																																																				R.set_value(c, "m_iUserCampaignsPage", 1, "-=")
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			return true
																																																																																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "ScrollRight"))):
																																																																																			pass
																																																																																			R.call_member(c, "PlayButtonSound", [])
																																																																																			if R.truth((float((c).fields.get("m_iUserCampaignsPage")) < float(999))):
																																																																																				pass
																																																																																				R.set_value(c, "m_iUserCampaignsPage", 1, "+=")
																																																																																				R.call_member(c, "UpdateUserCampaignsPanel", [])
																																																																																				R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting"), (c).fields.get("m_iUserCampaignsPage")])
																																																																																			return true
																																																																																		if R.truth(((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns"))) and R.truth((c).fields.get("m_LoadedFiles")))):
																																																																																			pass
																																																																																			v_i = R.coerce(0, "int")
																																																																																			while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
																																																																																				pass
																																																																																				v_slot = R.coerce(R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), v_i), "MovieClip")
																																																																																				if R.truth((R.binary("<", v_i, R.get_value((c).fields.get("m_LoadedFiles"), "length")) and R.binary("==", R.get_value(v_event, "target"), v_slot))):
																																																																																					pass
																																																																																					(c).fields["m_iPendingUserCampaignIndex"] = R.coerce(v_i, "int")
																																																																																					R.call_member(c, "PlayButtonSound", [])
																																																																																					R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_UserCampaignProperties")])
																																																																																				v_i = R.signed32(v_i + 1)
																																																																																		else:
																																																																																			pass
																																																																																			if R.truth((c).fields.get("m_CurrentGameMode")):
																																																																																				pass
																																																																																				R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseDown", [v_event])
	return null

static func f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseWheel"), [v_event])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseWheel", [v_event])
	return null

static func f_OnArmorGamesScoreBoardClose(c: Variant, a: Array) -> Variant:
	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
	return null

static func f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseUp"), [v_event])
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollUp")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollDown")))):
		pass
		(c).fields["m_fAchievementsScrollSpeed"] = float(0)
	else:
		pass
		if R.truth((c).fields.get("m_CurrentGameMode")):
			pass
			R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseUp", [v_event])
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_slot: Variant = null
	var v_file: Variant = null
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_i = R.coerce(0, "int")
	v_slot = R.coerce(null, "MovieClip")
	v_file = R.coerce(null, "SaveFile")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseOver"), [v_event])
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDGame")), "DisplayObject")
	if R.truth(R.call_member((c).fields.get("m_Hud"), "OnMouseOver", [v_event])):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "StoryMode"))):
		pass
		R.call_member(c, "SetToolTip", ["Play as two soldiers trying to escape the quarantined city while the military operation fails to contain the outbreak.", v_target])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Challenges"))):
			pass
			R.call_member(c, "SetToolTip", ["Test your survival skills in 5 different challenge modes pitting you against time, the zombie hordes and the military.", v_target])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaigns"))):
				pass
				R.call_member(c, "SetToolTip", ["Experience a whole new world of user campaigns, awesome stories created by users.", v_target])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "CampaignEditor"))):
					pass
					R.call_member(c, "SetToolTip", ["Use the campaign editor to create your own campaigns, build and share patterns and areas to be used in user campaigns.", v_target])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Options"))):
						pass
						R.call_member(c, "SetToolTip", ["Customize your controls, toggle sounds and music, adjust the visual quality and delete your save game.", v_target])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Achievements"))):
							pass
							R.call_member(c, "SetToolTip", ["The Evans City zombie outbreak will put your survival skills to the test.  Are you up to the challenge?  Try and complete all the achievements!", v_target])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HighScores"))):
								pass
								R.call_member(c, "SetToolTip", ["If you want to be the greatest survivors, you must compete with the best!  Check out the best scores for all the challenge modes.", v_target])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits"))):
									pass
									R.call_member(c, "SetToolTip", ["Check out the team behind Road of the Dead 2 and click our names to visit our personal sites.  Thanks for your great support!", v_target])
								else:
									pass
									if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RoadLink"))):
										pass
										R.call_member(c, "SetToolTip", ["Play the original award winning game!  Play as John Creasman, a local mechanic trying to escape the quarantined city through the highway.", v_target])
									else:
										pass
										if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "LabLink"))):
											pass
											R.call_member(c, "SetToolTip", ["Play as scientist Allen C. Tyler and experiment with zombies to find out what makes them tick in an attempt to find a solution to the zombie virus.", v_target])
										else:
											pass
											if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RangeLink"))):
												pass
												R.call_member(c, "SetToolTip", ["Play the sequel to Lab of the Dead where Allen has left the lab and hones his long range shooting skills with his rifle, bow and grenades.", v_target])
											else:
												pass
												if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "SoundtrackLink"))):
													pass
													R.call_member(c, "SetToolTip", ["Experience the music from the Saga of the Dead games anytime and anywhere with this original soundtrack. Thanks for the support!", v_target])
												else:
													pass
													if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "PosterLink"))):
														pass
														R.call_member(c, "SetToolTip", ["Add a touch of zombie apocalypse on your wall with this awesome Saga of the Dead poster. Thanks for the support!", v_target])
													else:
														pass
														if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "FacebookLink"))):
															pass
															R.call_member(c, "SetToolTip", ["Join the Saga of the Dead community to stay up to date with zombie news and the development of our upcoming zombie games.", v_target])
														else:
															pass
															if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "NewgroundsLink"))):
																pass
																R.call_member(c, "SetToolTip", ["Visit Newgrounds.com, our sponsor, and play a ton more awesome games, watch amazing movies and check out their art and music portals as well!", v_target])
															else:
																pass
																if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HardcoreMode"))):
																	pass
																	R.call_member(c, "SetToolTip", [R.binary("+", "In Hardcore mode, you must complete the story mode without ever dying.  Are you truly able to survive the zombie apocalypse?", ("" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMutantLevelFinished")) else "\nComplete Lost Guns to unlock.")), v_target])
																else:
																	pass
																	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "TimeMode"))):
																		pass
																		R.call_member(c, "SetToolTip", ["Race against the clock in this intense game mode where killing zombies give you extra time to survive.", v_target])
																	else:
																		pass
																		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalMode"))):
																			pass
																			R.call_member(c, "SetToolTip", ["Go as far as you can in this survival mode, trying to stay alive, battling the zombie hordes and driving through dangerous areas.", v_target])
																		else:
																			pass
																			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "RescueMode"))):
																				pass
																				R.call_member(c, "SetToolTip", [R.binary("+", "Play as the gunner on a rescue chopper and rescue civilians from their sieged buildings.", ("" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished")) else "\nComplete Lost Guns to unlock.")), v_target])
																			else:
																				pass
																				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MutantMode"))):
																					pass
																					R.call_member(c, "SetToolTip", [R.binary("+", "Face the wrath of the mutants in this insane challenge mode.", ("" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMutantLevelFinished")) else "\nEncounter the mutants in Lost Guns to unlock.")), v_target])
																				else:
																					pass
																					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MilitaryMode"))):
																						pass
																						R.call_member(c, "SetToolTip", [R.binary("+", "You're going rogue as the military operation is doomed to fail.  As deserters, you become the enemy.", ("" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished")) else "\nComplete Lost Guns to unlock.")), v_target])
																					else:
																						pass
																						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"))):
																							pass
																							R.call_member(c, "SetToolTip", ["Get all kinds of insight about all kind of things to make your survival easier. As you play, you will unlock more topics.", v_target])
																						else:
																							pass
																							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "ZombieTints"))):
																								pass
																								R.call_member(c, "HighlightButtonMC", [R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), true])
																								R.call_member(c, "SetToolTip", ["Zombie tints gives various skin tones to the zombies. It comes with a certain performance cost so if the game is running slow, turning this options off may help.", v_target])
																							else:
																								pass
																								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Fullscreen"))):
																									pass
																									R.call_member(c, "HighlightButtonMC", [R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), true])
																									R.call_member(c, "SetToolTip", ["Toggle the full screen mode.  Be aware that playing the game in full screen mode requires a very good computer.", v_target])
																								else:
																									pass
																									if R.truth(((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns"))) and R.truth((c).fields.get("m_LoadedFiles")))):
																										pass
																										v_i = R.coerce(0, "int")
																										while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
																											pass
																											v_slot = R.coerce(R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), v_i), "MovieClip")
																											if R.truth((R.binary("<", v_i, R.get_value((c).fields.get("m_LoadedFiles"), "length")) and R.binary("==", R.get_value(v_event, "target"), v_slot))):
																												pass
																												v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_i), "SaveFile")
																												R.call_member(c, "ShowFileToolTip", [R.get_value(v_file, "name"), R.get_value(v_file, "authorName"), R.get_value(v_file, "description"), R.binary("+", (R.get_value(R.get_value(v_file, "ratings"), "Rating") if R.truth(R.get_value(R.get_value(v_file, "ratings"), "Rating")) else "0.0"), "/5.0")])
																											v_i = R.signed32(v_i + 1)
																									else:
																										pass
																										if R.truth(((((((((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey5"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey6"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey7"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey8"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey9"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey10"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey11"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Sounds"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Music"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Quality"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SaveData")))):
																											pass
																											R.call_member(c, "HighlightButtonMC", [R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), true])
																										else:
																											pass
																											if R.truth((c).fields.get("m_CurrentGameMode")):
																												pass
																												R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseOver", [v_event])
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseOut"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_Hud"), "OnMouseOut", [v_event])):
		pass
		return null
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollUp")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "ScrollDown")))):
		pass
		(c).fields["m_fAchievementsScrollSpeed"] = float(0)
	else:
		pass
		if R.truth((((((((((((((((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "StoryMode")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Challenges"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "UserCampaigns"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "CampaignEditor"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Credits"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Achievements"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Options"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HighScores"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RoadLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "LabLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RangeLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "SoundtrackLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "PosterLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "FacebookLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "NewgroundsLink"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "HardcoreMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "TimeMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "RescueMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MutantMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "MilitaryMode"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton")))):
			pass
			R.call_member(c, "SetToolTip", [""])
		else:
			pass
			if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "ZombieTints")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Fullscreen")))):
				pass
				R.call_member(c, "SetToolTip", [""])
				R.call_member(c, "HighlightButtonMC", [R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), false])
			else:
				pass
				if R.truth(((((((((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey5"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey6"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey7"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey8"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey9"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey10"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SetKey11"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Sounds"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Music"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "Quality"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_Menu"), "SaveData")))):
					pass
					R.call_member(c, "HighlightButtonMC", [R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), false])
				else:
					pass
					if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns")))):
						pass
						R.call_member(c, "ShowFileToolTip", ["", "", "", ""])
					else:
						pass
						if R.truth((c).fields.get("m_CurrentGameMode")):
							pass
							R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseOut", [v_event])
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_iPressedKey: Variant = 0
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_iPressedKey = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnKeyDown"), [v_event])
	if R.truth(R.binary("!=", (c).fields.get("m_iEditedKey"), R.unary("-", 1))):
		pass
		v_iPressedKey = R.coerce(R.coerce(R.get_value(v_event, "keyCode"), "int"), "int")
		if R.truth(R.unary("!", R.call_member(c, "KeyIsAlreadyUsed", [(c).fields.get("m_iEditedKey"), v_iPressedKey]))):
			pass
			var __t1 = (c).fields.get("m_iEditedKey")
			var __t2 = -1
			if __t2 == -1 and R.binary("===", __t1, 1):
				__t2 = 0
			if __t2 == -1 and R.binary("===", __t1, 2):
				__t2 = 1
			if __t2 == -1 and R.binary("===", __t1, 3):
				__t2 = 2
			if __t2 == -1 and R.binary("===", __t1, 4):
				__t2 = 3
			if __t2 == -1 and R.binary("===", __t1, 5):
				__t2 = 4
			if __t2 == -1 and R.binary("===", __t1, 6):
				__t2 = 5
			if __t2 == -1 and R.binary("===", __t1, 7):
				__t2 = 6
			if __t2 == -1 and R.binary("===", __t1, 8):
				__t2 = 7
			if __t2 == -1 and R.binary("===", __t1, 9):
				__t2 = 8
			if __t2 == -1 and R.binary("===", __t1, 10):
				__t2 = 9
			if __t2 == -1 and R.binary("===", __t1, 11):
				__t2 = 10
			for __case__t2 in [0]:
				if __t2 >= 0 and __t2 <= 0:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iLeftKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 1:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iRightKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 2:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iAccelKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 3:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iBrakeKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 4:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iHandbrakeKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 5:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iHornKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 6:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iSwitchDriverKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 7:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iReloadKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 8:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iPrevWeaponKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 9:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iNextWeaponKey"] = R.coerce(v_iPressedKey, "int")
					break
				if __t2 >= 0 and __t2 <= 10:
					pass
					((c).fields.get("m_PlayerInfo")).fields["m_iPauseKey"] = R.coerce(v_iPressedKey, "int")
			(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
			R.call_member(c, "SavePlayerInfo", [])
			R.call_member(c, "UpdateOptionsPanel", [])
		else:
			pass
			R.call_member(c, "PlayErrorSound", [])
		return null
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnKeyDown", [v_event])
	return null

static func f_KeyIsAlreadyUsed(c: Variant, a: Array) -> Variant:
	var v_iEditedKey: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPressedKey: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return ((((((((((((float(v_iEditedKey) != float(1)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iLeftKey")))) or ((float(v_iEditedKey) != float(2)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iRightKey"))))) or ((float(v_iEditedKey) != float(3)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iAccelKey"))))) or ((float(v_iEditedKey) != float(4)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iBrakeKey"))))) or ((float(v_iEditedKey) != float(5)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iHandbrakeKey"))))) or ((float(v_iEditedKey) != float(6)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iHornKey"))))) or ((float(v_iEditedKey) != float(7)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iSwitchDriverKey"))))) or ((float(v_iEditedKey) != float(8)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iReloadKey"))))) or ((float(v_iEditedKey) != float(9)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iPrevWeaponKey"))))) or ((float(v_iEditedKey) != float(10)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iNextWeaponKey"))))) or ((float(v_iEditedKey) != float(11)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iPauseKey")))))
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnKeyUp"), [v_event])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnKeyUp", [v_event])
	return null

static func f_DoFlash(c: Variant, a: Array) -> Variant:
	var v_fOpacity: Variant = R.coerce((a[0] if a.size() > 0 else 1), "Number")
	var v_fDuration: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v_bFadeOut: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	R.set_value((c).fields.get("m_Flash"), "visible", true, "=")
	R.set_value((c).fields.get("m_Flash"), "alpha", (v_fOpacity if R.truth(v_bFadeOut) else 0), "=")
	(c).fields["m_fFlashOpacity"] = float(v_fOpacity)
	(c).fields["m_fFlashDuration"] = float(v_fDuration)
	(c).fields["m_fFlashTime"] = R.coerce((v_fDuration if R.truth(v_bFadeOut) else 0), "Number")
	(c).fields["m_bFlashFadeOut"] = v_bFadeOut
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	R.call_member(c, "SetPause", [false])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "EndGameMode", [])
		if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
			pass
			R.call_member((c).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [1])
		if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic")):
			pass
			R.call_member((c).fields.get("m_MusicSoundGroup"), "SetMaxVolume", [1])
		if R.truth(((c).fields.get("m_CurrentGameMode")).fields.get("m_bHasHud")):
			pass
			R.call_member((c).fields.get("m_Hud"), "Hide", [])
	R.call_member(c, "SetToolTip", ["", null])
	(c).fields["m_CurrentGameMode"] = R.coerce(v_gameMode, "RDGameMode")
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Game")])
		R.call_member((c).fields.get("m_Hud"), "SetPlayer", [((c).fields.get("m_CurrentGameMode")).fields.get("m_Player")])
		R.call_member((c).fields.get("m_CurrentGameMode"), "BeginGameMode", [])
		if R.truth(((c).fields.get("m_CurrentGameMode")).fields.get("m_bHasHud")):
			pass
			R.call_member((c).fields.get("m_Hud"), "Show", [])
	return null

static func f_HideFlash(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("m_Flash"), "visible", false, "=")
	return null

static func f_AddEntity(c: Variant, a: Array) -> Variant:
	var v_entityToAdd: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.call_member((c).fields.get("m_World"), "AddEntity", [v_entityToAdd, v_fX, v_fY, v_fZ])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnEntityAdded", [v_entityToAdd])
	return null

static func f_CompleteAchievement(c: Variant, a: Array) -> Variant:
	var v_iPoints: Variant = 0
	var v_iAchievement: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iPoints = R.coerce(0, "int")
	if R.truth((c).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(R.unary("!", R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_iAchievement))):
		pass
		if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")])):
			pass
			if R.truth(R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_NGMedals"), v_iAchievement), "")):
				pass
				R.call_static("com.newgrounds.API", "unlockMedal", [R.get_value(R.static_value("RDAchievement", "m_NGMedals"), v_iAchievement)])
		else:
			pass
			if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Kongregate")])):
				pass
				if R.truth((R.truth(c.fields.get("m_KongregateAPI")) and R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_KongStats"), v_iAchievement), ""))):
					pass
					R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), [R.get_value(R.static_value("RDAchievement", "m_KongStats"), v_iAchievement), true])
			else:
				pass
				if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])):
					pass
					if R.truth((R.truth(c.fields.get("m_ArmorGamesAPI")) and R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_ArmorQuests"), v_iAchievement), ""))):
						pass
						R.invoke(R.get_value(R.get_value(c.fields.get("m_ArmorGamesAPI2"), "quests"), "submit"), [{"key": R.get_value(R.static_value("RDAchievement", "m_ArmorQuests"), v_iAchievement)}])
		v_iPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDAchievement", "m_Rewards"), v_iAchievement), "int"), "int")
		R.call_member(c, "ShowMessageBox", [R.get_value(R.static_value("RDAchievement", "m_Names"), v_iAchievement), R.binary("+", v_iPoints, " RP")])
		((c).fields.get("m_PlayerInfo")).fields["m_iRP"] = float(minf(float((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iRP")) + float(v_iPoints))), float(5000)))
		((c).fields.get("m_PlayerInfo")).fields["m_iRPEarned"] = R.coerce(R.binary("+", ((c).fields.get("m_PlayerInfo")).fields.get("m_iRPEarned"), v_iPoints), "int")
		R.set_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_iAchievement, true, "=")
		R.call_member((c).fields.get("m_Hud"), "UpdateRP", [true, true])
		if R.truth((c).fields.get("m_CurrentGameMode")):
			pass
			R.call_member((c).fields.get("m_CurrentGameMode"), "OnNewAchievementCompleted", [])
	return null

static func f_UpdateMessageBox(c: Variant, a: Array) -> Variant:
	var v_messageObject: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_messageObject = R.coerce(null, "Object")
	if R.truth((R.binary(">", R.get_value((c).fields.get("m_MessageBoxes"), "length"), 0) and R.unary("!", R.get_value((c).fields.get("m_MessageBox"), "visible")))):
		pass
		v_messageObject = R.coerce(R.get_value((c).fields.get("m_MessageBoxes"), 0), "Object")
		R.set_value(R.get_value((c).fields.get("m_MessageBox"), "Title"), "text", R.get_value(v_messageObject, "m_szTitle"), "=")
		R.set_value(R.get_value((c).fields.get("m_MessageBox"), "InfoMessage"), "text", R.get_value(v_messageObject, "m_szMessage"), "=")
		R.set_value((c).fields.get("m_MessageBox"), "visible", true, "=")
		R.set_value((c).fields.get("m_MessageBox"), "alpha", 1, "=")
		R.set_value((c).fields.get("m_MessageBox"), "x", R.unary("-", 500), "=")
		R.call_static("gs.TweenLite", "to", [(c).fields.get("m_MessageBox"), 0.3, {"x": 0, "delay": 0.5, "onStart": R.get_value(c, "OnMessageBoxSlideInStart"), "onComplete": R.get_value(c, "OnMessageBoxSlideInDone"), "ease": R.get_value(R.klass("gs.easing.Quart"), "easeOut")}])
		R.invoke(R.get_value((c).fields.get("m_MessageBoxes"), "splice"), [0, 1])
	return null

static func f_OnMessageBoxSlideInStart(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_InterfaceSound"), "Play", [])
	return null

static func f_OnMessageBoxSlideInDone(c: Variant, a: Array) -> Variant:
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_MessageBox"), 1, {"alpha": 0, "delay": 2.5, "onComplete": R.get_value(c, "OnMessageBoxSlideOutDone"), "ease": R.get_value(R.klass("gs.easing.Quart"), "easeIn")}])
	return null

static func f_OnMessageBoxSlideOutDone(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("m_MessageBox"), "visible", false, "=")
	return null

static func f_ShowMessageBox(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_currentMessage: Variant = null
	var v_newMessage: Variant = null
	var v_szTitle: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szMessage: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_i = R.coerce(0, "int")
	v_currentMessage = R.coerce(null, "Object")
	if R.truth(R.binary("==", v_szTitle, "Error")):
		pass
		if R.truth(R.logical_and(R.get_value((c).fields.get("m_MessageBox"), "visible"), func(): return R.binary("==", R.get_value(R.get_value((c).fields.get("m_MessageBox"), "Title"), "text"), v_szTitle))):
			pass
			return null
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_MessageBoxes"), "length"))):
			pass
			v_currentMessage = R.coerce(R.get_value((c).fields.get("m_MessageBoxes"), v_i), "Object")
			if R.truth(R.binary("==", R.get_value(v_currentMessage, "m_szTitle"), v_szTitle)):
				pass
				return null
			v_i = R.signed32(v_i + 1)
	v_newMessage = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_newMessage, "m_szTitle", v_szTitle, "=")
	R.set_value(v_newMessage, "m_szMessage", v_szMessage, "=")
	R.invoke(R.get_value((c).fields.get("m_MessageBoxes"), "push"), [v_newMessage])
	return null

static func f_ShowConfirmation(c: Variant, a: Array) -> Variant:
	var v_bIsResumeConfirmation: Variant = false
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iConfirmedItem"] = R.coerce(v_iItem, "int")
	if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_DeleteSaveGame")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Delete your save data?\nYou will lose all your progress", "=")
	else:
		pass
		if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_StoryMode")))):
			pass
			R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Where do you wanna start\nLost Guns?", "=")
		else:
			pass
			if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_StoryHardcoreMode")))):
				pass
				R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Where do you wanna start\nHighway To Hell?", "=")
			else:
				pass
				if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_Abort")))):
					pass
					R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Abort your escape and\nreturn to the menu?", "=")
				else:
					pass
					if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_NewPattern")))):
						pass
						R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to start a new pattern?", "=")
					else:
						pass
						if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_LoadPattern")))):
							pass
							R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to load this pattern?", "=")
						else:
							pass
							if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_NewArea")))):
								pass
								R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to start a new area?", "=")
							else:
								pass
								if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_LoadArea")))):
									pass
									R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to load this area?", "=")
								else:
									pass
									if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_NewCampaign")))):
										pass
										R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to start a new campaign?", "=")
									else:
										pass
										if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_LoadCampaign")))):
											pass
											R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to load this campaign?", "=")
										else:
											pass
											if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_OverwriteFile")))):
												pass
												R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "A file with that name already exists.\nDo you want to overwrite it?", "=")
											else:
												pass
												if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_ConfirmSave")))):
													pass
													R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to save this file?", "=")
												else:
													pass
													if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_DeleteAreaGroup")))):
														pass
														R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to delete this area group?", "=")
													else:
														pass
														if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_ApplyPattern")))):
															pass
															R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to apply the changes to this area's pattern?", "=")
														else:
															pass
															if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_ApplyArea")))):
																pass
																R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to apply the changes to this campaign's area?", "=")
															else:
																pass
																if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_DeletePatterns")))):
																	pass
																	R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to delete the selected patterns?", "=")
																else:
																	pass
																	if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_DeleteAreas")))):
																		pass
																		R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to delete the selected areas?", "=")
																	else:
																		pass
																		if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_LoadUserCampaign")))):
																			pass
																			R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to play this user campaign?", "=")
																		else:
																			pass
																			if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_ClearObjects")))):
																				pass
																				R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to delete all the objects in this pattern?", "=")
																			else:
																				pass
																				if R.truth((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_DeleteFile")))):
																					pass
																					R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ConfirmationMessage"), "text", "Are you sure you want to delete this file?", "=")
	R.set_value((c).fields.get("m_ConfirmationDialog"), "visible", true, "=")
	v_bIsResumeConfirmation = ((float(v_iItem) == float(R.static_value("RDGame", "Confirmation_StoryMode"))) or (float(v_iItem) == float(R.static_value("RDGame", "Confirmation_StoryHardcoreMode"))))
	R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "YesButton"), "visible", R.unary("!", v_bIsResumeConfirmation), "=")
	R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "NoButton"), "visible", R.unary("!", v_bIsResumeConfirmation), "=")
	R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "NewButton"), "visible", v_bIsResumeConfirmation, "=")
	R.set_value(R.get_value((c).fields.get("m_ConfirmationDialog"), "ResumeButton"), "visible", v_bIsResumeConfirmation, "=")
	R.call_member(c, "DoFlash", [1, 0.5])
	R.call_member((c).fields.get("m_InterfaceSound"), "Play", [])
	return null

static func f_HideConfirmation(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("m_ConfirmationDialog"), "visible", false, "=")
	return null

static func f_OnConfirmationYes(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	v_bProcessed = R.coerce(R.call_member(((c).fields.get("m_GameModeEditor")).fields.get("m_Interface"), "OnConfirmationYes", [(c).fields.get("m_iConfirmedItem")]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_DeleteSaveGame")))):
			pass
			R.call_member((c).fields.get("m_PlayerInfo"), "Reset", [])
			R.call_member(c, "SavePlayerInfo", [])
			R.call_member(c, "ApplyOptions", [])
			R.call_member(c, "UpdateOptionsPanel", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_Abort")))):
				pass
				if R.truth((c).fields.get("m_bPlayFromEditor")):
					pass
					R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeEditor")])
				else:
					pass
					R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
	R.call_member(c, "HideConfirmation", [])
	return null

static func f_OnConfirmationNo(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_Abort")))):
		pass
		(c).fields["m_iPauseType"] = R.coerce(R.static_value("RDGame", "PauseType_Generic"), "int")
		R.call_member(c, "SetPause", [false])
	R.call_member(c, "HideConfirmation", [])
	return null

static func f_ResetStoryMode(c: Variant, a: Array) -> Variant:
	((c).fields.get("m_PlayerInfo")).fields["m_iStoryLevel"] = R.coerce(0, "int")
	((c).fields.get("m_PlayerInfo")).fields["m_fStoryProgress"] = float(0)
	(((c).fields.get("m_PlayerInfo")).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = false
	(((c).fields.get("m_PlayerInfo")).fields.get("m_MountedMG")).fields["m_bUnlocked"] = false
	return null

static func f_OnConfirmationNew(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_StoryMode")))):
		pass
		R.call_member(c, "ResetStoryMode", [])
		(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeStory"), "RDGameMode")
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "StartCinematic", ["GameIntro", false])
	R.call_member(c, "HideConfirmation", [])
	return null

static func f_OnConfirmationResume(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_StoryMode")))):
		pass
		(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeStory"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	R.call_member(c, "HideConfirmation", [])
	return null

static func f_AddAchievementSection(c: Variant, a: Array) -> Variant:
	var v_achievementSection: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_achievementSection = R.coerce(R.construct(R.klass("MC_AchievementSection"), []), "MovieClip")
	R.set_value(v_achievementSection, "x", R.static_value("RDGame", "AchievementPosX"), "=")
	R.set_value(v_achievementSection, "y", (c).fields.get("m_fAchievementItemPosY"), "=")
	R.set_value(v_achievementSection, "m_fMaxAlpha", 1, "=")
	(c).fields["m_fAchievementItemPosY"] = R.coerce(R.binary("+", (c).fields.get("m_fAchievementItemPosY"), R.static_value("RDGame", "AchievementSectionHeight")), "Number")
	R.set_value(R.get_value(v_achievementSection, "SectionName"), "text", v_szName, "=")
	R.set_value(v_achievementSection, "mouseChildren", false, "=")
	R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "addChild"), [v_achievementSection])
	R.invoke(R.get_value((c).fields.get("m_AchievementItems"), "push"), [v_achievementSection])
	return null

static func f_AddAchievementRange(c: Variant, a: Array) -> Variant:
	var v_achievementItem: Variant = null
	var v_i: Variant = 0
	var v_iFirst: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iLast: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_achievementItem = R.coerce(null, "MovieClip")
	v_i = R.coerce(v_iFirst, "int")
	while R.truth((float(v_i) <= float(v_iLast))):
		pass
		v_achievementItem = R.coerce(R.construct(R.klass("MC_AchievementItem"), []), "MovieClip")
		R.set_value(v_achievementItem, "x", R.static_value("RDGame", "AchievementPosX"), "=")
		R.set_value(v_achievementItem, "y", (c).fields.get("m_fAchievementItemPosY"), "=")
		(c).fields["m_fAchievementItemPosY"] = R.coerce(R.binary("+", (c).fields.get("m_fAchievementItemPosY"), R.static_value("RDGame", "AchievementHeight")), "Number")
		R.set_value(R.get_value(v_achievementItem, "AchievementName"), "text", R.get_value(R.static_value("RDAchievement", "m_Names"), v_i), "=")
		R.set_value(R.get_value(v_achievementItem, "Hint"), "text", R.get_value(R.static_value("RDAchievement", "m_Hints"), v_i), "=")
		R.set_value(R.get_value(v_achievementItem, "Reward"), "text", R.binary("+", R.get_value(R.static_value("RDAchievement", "m_Rewards"), v_i), " RP"), "=")
		R.set_value(v_achievementItem, "mouseChildren", false, "=")
		R.set_value(v_achievementItem, "mouseEnabled", false, "=")
		R.set_value(v_achievementItem, "m_fMaxAlpha", (1 if R.truth(R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_i)) else 0.5), "=")
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "addChild"), [v_achievementItem])
		R.invoke(R.get_value((c).fields.get("m_AchievementItems"), "push"), [v_achievementItem])
		v_i = R.signed32(v_i + 1)
	R.call_member(c, "AddAchievementGroupSpacing", [])
	return null

static func f_AddAchievementGroupSpacing(c: Variant, a: Array) -> Variant:
	(c).fields["m_fAchievementItemPosY"] = R.coerce(R.binary("+", (c).fields.get("m_fAchievementItemPosY"), R.static_value("RDGame", "AchievementGroupSpacing")), "Number")
	return null

static func f_UpdateAchievements(c: Variant, a: Array) -> Variant:
	var v_iNbAchievements: Variant = 0
	var v_i: Variant = 0
	var v_achievementItem: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iNbAchievements = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_achievementItem = R.coerce(null, "MovieClip")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "visible")):
		pass
		(c).fields["m_fAchievementsScroll"] = R.coerce(R.call_static("Maths", "Clamp", [(float((c).fields.get("m_fAchievementsScroll")) + float((float((c).fields.get("m_fAchievementsScrollSpeed")) * float(v_fDeltaTime)))), 0, (c).fields.get("m_fAchievementScrollHeight")]), "Number")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "y", (float(R.static_value("RDGame", "AchievementPosY")) - float((c).fields.get("m_fAchievementsScroll"))), "=")
		v_iNbAchievements = R.coerce(R.coerce(R.get_value((c).fields.get("m_AchievementItems"), "length"), "int"), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbAchievements))):
			pass
			v_achievementItem = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "getChildAt"), [v_i]), "MovieClip")
			if R.truth((float((R.num(R.get_value(v_achievementItem, "y")) - float((c).fields.get("m_fAchievementsScroll")))) < float(100))):
				pass
				R.set_value(v_achievementItem, "alpha", (R.num(R.call_static("Maths", "Clamp", [R.binary("/", (float((R.num(R.get_value(v_achievementItem, "y")) - float((c).fields.get("m_fAchievementsScroll")))) + float(R.static_value("RDGame", "AchievementHeight"))), R.static_value("RDGame", "AchievementHeight")), 0, 1])) * R.num(R.get_value(v_achievementItem, "m_fMaxAlpha"))), "=")
			else:
				pass
				R.set_value(v_achievementItem, "alpha", (float((float(1) - R.num(R.call_static("Maths", "Clamp", [R.binary("/", (float((float((R.num(R.get_value(v_achievementItem, "y")) - float((c).fields.get("m_fAchievementsScroll")))) - float(R.static_value("RDGame", "AchievementsScrollHeight")))) + float(R.static_value("RDGame", "AchievementHeight"))), R.static_value("RDGame", "AchievementHeight")), 0, 1])))) * R.num(R.get_value(v_achievementItem, "m_fMaxAlpha"))), "=")
			v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateOptionsPanel(c: Variant, a: Array) -> Variant:
	var v_szEnterKey: Variant = null
	if R.truth(R.unary("!", R.get_value((c).fields.get("m_Menu"), "StoryMode"))):
		pass
		return null
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "Music"), "CenterName"), "text", ("On" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "Sounds"), "CenterName"), "text", ("On" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "Quality"), "CenterName"), "text", ("Low" if R.truth((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(0))) else ("Medium" if R.truth((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(1))) else "High")), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ZombieTints"), "CenterName"), "text", ("On" if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bZombieTints")) else "Off"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "Fullscreen"), "CenterName"), "text", ("On" if R.truth((c).fields.get("m_bFullscreen")) else "Off"), "=")
	v_szEnterKey = R.coerce("[Press key]", "String")
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey1"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(1))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iLeftKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey2"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(2))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iRightKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey3"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(3))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iAccelKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey4"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(4))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iBrakeKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey5"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(5))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iHandbrakeKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey6"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(6))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iHornKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey7"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(7))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iSwitchDriverKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey8"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(8))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iReloadKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey9"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(9))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iPrevWeaponKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey10"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(10))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iNextWeaponKey")]))])
	R.call_member(c, "SetKeyName", [R.get_value((c).fields.get("m_Menu"), "SetKey11"), (v_szEnterKey if R.truth((float((c).fields.get("m_iEditedKey")) == float(11))) else R.call_static("Input", "GetKeyName", [((c).fields.get("m_PlayerInfo")).fields.get("m_iPauseKey")]))])
	return null

static func f_SetKeyName(c: Variant, a: Array) -> Variant:
	var v_keyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_szText: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.set_value(R.get_value(v_keyMC, "CenterName"), "text", v_szText, "=")
	return null

static func f_ToggleQuality(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetQuality", [R.binary("%", (float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) + float(1)), 3)])
	return null

static func f_SetQuality(c: Variant, a: Array) -> Variant:
	var v_iQuality: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	((c).fields.get("m_PlayerInfo")).fields["m_iQuality"] = R.coerce(v_iQuality, "int")
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_SetZombieTintsOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bZombieTints"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_SetFullscreen(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bFullscreen"] = v_bOn
	R.set_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "displayState", (R.get_value(R.resolve(c, "StageDisplayState", "RDGame"), "FULL_SCREEN_INTERACTIVE") if R.truth((c).fields.get("m_bFullscreen")) else R.get_value(R.resolve(c, "StageDisplayState", "RDGame"), "NORMAL")), "=")
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_SetMusicOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bMusic"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_SetSoundsOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bSound"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_ApplyOptions(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", c.fields.get("m_bPaused"))):
		pass
		R.call_member((c).fields.get("m_MusicSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic")) else 0)])
	if R.truth(R.unary("!", c.fields.get("m_bPaused"))):
		pass
		R.call_member((c).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else 0)])
	R.call_member((c).fields.get("m_InterfaceSFXSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else 0)])
	R.call_member((c).fields.get("m_CrucialSFXSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else 0)])
	R.call_member((c).fields.get("m_VoiceSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else 0)])
	R.call_member((c).fields.get("m_CrucialVoiceSoundGroup"), "SetMaxVolume", [(1 if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")) else 0)])
	R.call_member((c).fields.get("m_CityAmbianceSound"), "SetMaxVolume", [(0.4 if R.truth((R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic")) and ((c).fields.get("m_PlayerInfo")).fields.get("m_bSound"))) else 0)])
	if R.truth((float(c.fields.get("m_iGameState")) != float(R.static_value("BasicGame", "GameState_MainMenu")))):
		pass
		R.set_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "quality", (R.get_value(R.resolve(c, "StageQuality", "RDGame"), "LOW") if R.truth((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(0))) else (R.get_value(R.resolve(c, "StageQuality", "RDGame"), "MEDIUM") if R.truth((float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) == float(1))) else R.get_value(R.resolve(c, "StageQuality", "RDGame"), "HIGH"))), "=")
	return null

static func f_SelectKey(c: Variant, a: Array) -> Variant:
	var v_iKey: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iEditedKey"] = R.coerce(v_iKey, "int")
	R.call_member(c, "UpdateOptionsPanel", [])
	return null

static func f_SetHighScoreMode(c: Variant, a: Array) -> Variant:
	var v_scoreTypes: Variant = null
	var v_szBoardName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_scoreTypes = R.coerce(null, "Array")
	if R.truth(R.binary("==", v_szBoardName, "Out Of Time Distance")):
		pass
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScore"), "text", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance"), 10)]), 100), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KM"), "visible", true, "=")
	else:
		pass
		if R.truth(R.binary("==", v_szBoardName, "Dead State Distance")):
			pass
			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScore"), "text", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance"), 10)]), 100), "=")
			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KM"), "visible", true, "=")
		else:
			pass
			if R.truth(R.binary("==", v_szBoardName, "Rescue OP")):
				pass
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScore"), "text", ((c).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues"), "=")
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KM"), "visible", false, "=")
			else:
				pass
				if R.truth(R.binary("==", v_szBoardName, "Mutant Meltdown Distance")):
					pass
					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScore"), "text", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance"), 10)]), 100), "=")
					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KM"), "visible", true, "=")
				else:
					pass
					if R.truth(R.binary("==", v_szBoardName, "F.U.B.A.R. Distance")):
						pass
						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScore"), "text", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance"), 10)]), 100), "=")
						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KM"), "visible", true, "=")
	if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScoreBoard"), "scoreBoardName", v_szBoardName, "=")
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScoreBoard"), "loadScores"), [])
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "KongMessage"), "visible", false, "=")
	else:
		pass
		if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "Scores"), "HighScoreBoard"), "visible", false, "=")
		else:
			pass
			if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				R.invoke(R.get_value(c.fields.get("m_ArmorGamesAPI"), "initAGUI"), [{"onClose": R.get_value(c, "OnArmorGamesScoreBoardClose")}])
				v_scoreTypes = R.coerce(R.call_member(c, "GetArmorGamesScoreTypes", []), "Array")
				R.invoke(R.get_value(c.fields.get("m_ArmorGamesAPI"), "showScoreboardList"), [v_scoreTypes, v_szBoardName, c.fields.get("m_RootMC")])
	return null

static func f_PlayCustomMusic(c: Variant, a: Array) -> Variant:
	var v_music: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSound")
	var v_fFade: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v_bLooping: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	var v_fOffset: Variant = R.coerce((a[3] if a.size() > 3 else 0), "Number")
	if R.truth(R.binary("==", v_music, (c).fields.get("m_CustomMusic"))):
		pass
		return null
	(c).fields["m_CustomMusic"] = R.coerce(v_music, "DTSound")
	if R.truth(R.binary("==", v_music, (c).fields.get("m_GameMusic"))):
		pass
		if R.truth(R.unary("!", R.call_member((c).fields.get("m_GameMusic"), "IsPlaying", []))):
			pass
			R.call_member((c).fields.get("m_GameMusic"), "Play", [v_bLooping, v_fFade, v_fOffset])
		else:
			pass
			R.call_member((c).fields.get("m_GameMusic"), "Mute", [false, v_fFade])
		R.call_member((c).fields.get("m_HighwayMusic"), "Stop", [v_fFade])
		R.call_member((c).fields.get("m_MenuMusic"), "Stop", [v_fFade])
		R.call_member((c).fields.get("m_TenseMusic"), "Stop", [v_fFade])
	else:
		pass
		if R.truth(R.binary("==", v_music, (c).fields.get("m_HighwayMusic"))):
			pass
			R.call_member((c).fields.get("m_GameMusic"), "Mute", [true, v_fFade])
			R.call_member((c).fields.get("m_HighwayMusic"), "Play", [v_bLooping, v_fFade, v_fOffset])
			R.call_member((c).fields.get("m_MenuMusic"), "Stop", [v_fFade])
			R.call_member((c).fields.get("m_TenseMusic"), "Stop", [v_fFade])
		else:
			pass
			if R.truth(R.binary("==", v_music, (c).fields.get("m_MenuMusic"))):
				pass
				R.call_member((c).fields.get("m_GameMusic"), "Mute", [true, v_fFade])
				R.call_member((c).fields.get("m_MenuMusic"), "Play", [v_bLooping, v_fFade, v_fOffset])
				R.call_member((c).fields.get("m_HighwayMusic"), "Stop", [v_fFade])
				R.call_member((c).fields.get("m_TenseMusic"), "Stop", [v_fFade])
			else:
				pass
				if R.truth(R.binary("==", v_music, (c).fields.get("m_TenseMusic"))):
					pass
					R.call_member((c).fields.get("m_GameMusic"), "Mute", [true, v_fFade])
					R.call_member((c).fields.get("m_HighwayMusic"), "Stop", [v_fFade])
					R.call_member((c).fields.get("m_MenuMusic"), "Stop", [v_fFade])
					R.call_member((c).fields.get("m_TenseMusic"), "Play", [v_bLooping, v_fFade, v_fOffset])
				else:
					pass
					R.call_member((c).fields.get("m_GameMusic"), "Mute", [true, v_fFade])
					R.call_member((c).fields.get("m_HighwayMusic"), "Stop", [v_fFade])
					R.call_member((c).fields.get("m_MenuMusic"), "Stop", [v_fFade])
					R.call_member((c).fields.get("m_TenseMusic"), "Stop", [v_fFade])
	return null

static func f_SavePlayerInfo(c: Variant, a: Array) -> Variant:
	var v_bSuccess: Variant = false
	if R.truth((R.truth((c).fields.get("m_CurrentGameMode")) and R.truth(R.binary("as", (c).fields.get("m_CurrentGameMode"), R.klass("RDGameModeCustom"))))):
		pass
		return null
	v_bSuccess = R.coerce(R.call_member((c).fields.get("m_PlayerInfo"), "SavePlayerInfo", []), "Boolean")
	if R.truth(R.unary("!", v_bSuccess)):
		pass
		R.call_member(c, "ShowMessageBox", ["Could not save!", "Make sure flash local storage is enabled."])
	return null

static func f_DeleteSaveGame(c: Variant, a: Array) -> Variant:
	R.call_member(c, "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteSaveGame")])
	return null

static func f_StartCinematic(c: Variant, a: Array) -> Variant:
	var v_szCinematicName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_bIsCinematicSkipable: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	(c).fields["m_CinematicMouth"] = R.coerce(null, "MovieClip")
	(c).fields["m_CinematicVoice"] = R.coerce(null, "DTSound")
	(c).fields["m_CinematicPerlinScene"] = R.coerce(null, "MovieClip")
	R.call_member(c, "PlayCustomMusic", [null])
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "StartCinematic"), [v_szCinematicName, v_bIsCinematicSkipable])
	return null

static func f_PlayErrorSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_ErrorSound"), "Play", [])
	return null

static func f_PlayInterfaceSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_InterfaceSound"), "Play", [])
	return null

static func f_PlayButtonSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_ButtonSound"), "Play", [])
	return null

static func f_PlayPaperSound(c: Variant, a: Array) -> Variant:
	R.call_member(R.binary("as", R.call_member((c).fields.get("m_PaperSounds"), "GetValue", []), R.klass("DTSound")), "Play", [])
	return null

static func f_SetToolTip(c: Variant, a: Array) -> Variant:
	var v_point: Variant = null
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_target: Variant = R.coerce((a[1] if a.size() > 1 else null), "DisplayObject")
	v_point = R.coerce(null, "Point")
	(c).fields["m_ToolTipTarget"] = R.coerce(v_target, "DisplayObject")
	R.set_value(R.get_value((c).fields.get("m_ToolTip"), "Hint"), "text", v_szText, "=")
	R.set_value((c).fields.get("m_ToolTip"), "visible", false, "=")
	(c).fields["m_fToolTipTimer"] = float(0)
	if R.truth((c).fields.get("m_ToolTipTarget")):
		pass
		v_point = R.coerce(R.construct(R.klass("Point"), [R.get_value((c).fields.get("m_ToolTipTarget"), "x"), R.get_value((c).fields.get("m_ToolTipTarget"), "y")]), "Point")
		v_point = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("m_ToolTipTarget"), "parent"), "localToGlobal"), [v_point]), "Point")
		(c).fields["m_fToolTipTargetX"] = R.coerce(R.get_value(v_point, "x"), "Number")
		(c).fields["m_fToolTipTargetY"] = R.coerce(R.get_value(v_point, "y"), "Number")
		if R.truth((float((c).fields.get("m_fToolTipTargetX")) < float(300))):
			pass
			R.invoke(R.get_value((c).fields.get("m_ToolTip"), "gotoAndStop"), [(4 if R.truth((float((c).fields.get("m_fToolTipTargetY")) < float(150))) else 3)])
		else:
			pass
			R.invoke(R.get_value((c).fields.get("m_ToolTip"), "gotoAndStop"), [(2 if R.truth((float((c).fields.get("m_fToolTipTargetY")) < float(150))) else 1)])
		(c).fields["m_fToolTipMouseX"] = R.coerce(R.get_value(c.fields.get("m_RootMC"), "mouseX"), "Number")
		(c).fields["m_fToolTipMouseY"] = R.coerce(R.get_value(c.fields.get("m_RootMC"), "mouseY"), "Number")
	R.call_member(c, "UpdateToolTip", [])
	return null

static func f_UpdateToolTip(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	if R.truth((c).fields.get("m_ToolTipTarget")):
		pass
		if R.truth((R.binary("==", R.get_value(c.fields.get("m_RootMC"), "mouseX"), (c).fields.get("m_fToolTipMouseX")) and R.binary("==", R.get_value(c.fields.get("m_RootMC"), "mouseY"), (c).fields.get("m_fToolTipMouseY")))):
			pass
			(c).fields["m_fToolTipTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fToolTipTimer"), v_fDeltaTime), "Number")
		else:
			pass
			(c).fields["m_fToolTipTimer"] = float(0)
		R.set_value((c).fields.get("m_ToolTip"), "visible", (float((c).fields.get("m_fToolTipTimer")) > float(0.2)), "=")
		R.set_value((c).fields.get("m_ToolTip"), "x", R.binary("+", R.get_value(c.fields.get("m_RootMC"), "mouseX"), (175 if R.truth((float((c).fields.get("m_fToolTipTargetX")) < float(300))) else R.unary("-", 175))), "=")
		R.set_value((c).fields.get("m_ToolTip"), "y", R.binary("+", R.get_value(c.fields.get("m_RootMC"), "mouseY"), (98 if R.truth((float((c).fields.get("m_fToolTipTargetY")) < float(150))) else R.unary("-", 98))), "=")
		(c).fields["m_fToolTipMouseX"] = R.coerce(R.get_value(c.fields.get("m_RootMC"), "mouseX"), "Number")
		(c).fields["m_fToolTipMouseY"] = R.coerce(R.get_value(c.fields.get("m_RootMC"), "mouseY"), "Number")
	return null

static func f_SendAllAPIStats(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(R.static_value("RDAchievement", "Max")))):
			pass
			if R.truth((R.truth(R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_i)) and R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_NGMedals"), v_i), ""))):
				pass
				R.call_static("com.newgrounds.API", "unlockMedal", [R.get_value(R.static_value("RDAchievement", "m_NGMedals"), v_i)])
			v_i = R.signed32(v_i + 1)
	else:
		pass
		if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(R.static_value("RDAchievement", "Max")))):
				pass
				if R.truth((R.truth(R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_i)) and R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_KongStats"), v_i), ""))):
					pass
					R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), [R.get_value(R.static_value("RDAchievement", "m_KongStats"), v_i), R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_i)])
				v_i = R.signed32(v_i + 1)
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), ["Rescue OP", ((c).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")])
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), ["Dead State Distance", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance")])
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), ["F.U.B.A.R. Distance", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance")])
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), ["Mutant Meltdown Distance", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance")])
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "stats"), "submit"), ["Out Of Time Distance", ((c).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance")])
		else:
			pass
			if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(R.static_value("RDAchievement", "Max")))):
					pass
					if R.truth((R.truth(R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), v_i)) and R.binary("!=", R.get_value(R.static_value("RDAchievement", "m_ArmorQuests"), v_i), ""))):
						pass
						R.invoke(R.get_value(R.get_value(c.fields.get("m_ArmorGamesAPI2"), "quests"), "submit"), [{"key": R.get_value(R.static_value("RDAchievement", "m_ArmorQuests"), v_i)}])
					v_i = R.signed32(v_i + 1)
	return null

static func f_Pause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "Pause"), [v_bPause])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnPause", [v_bPause, (float((c).fields.get("m_iPauseType")) == float(R.static_value("RDGame", "PauseType_Abort")))])
	return null

static func f_OnLostFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnLostFocus"), [v_evt])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnLostFocus", [])
	return null

static func f_OnGotFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnGotFocus"), [v_evt])
	R.call_member(c.fields.get("m_FocusManager"), "setFocus", [R.get_value(c.fields.get("m_RootMC"), "stage")])
	return null

static func f_FormatDistanceScoreCallback(c: Variant, a: Array) -> Variant:
	var v_score: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", v_score, 10)]), 100), " KM")
	return null

static func f_GoToMenuState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member(c, "SetToolTip", ["", null])
	(c).fields["m_iPreviousMenuState"] = R.coerce((c).fields.get("m_iMenuState"), "int")
	(c).fields["m_iPendingMenuState"] = R.coerce(v_iState, "int")
	R.call_member(c, "SlideInterface", [(c).fields.get("m_iMenuState"), false, false])
	return null

static func f_SetMenuState(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bInstant: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_i = R.coerce(0, "int")
	if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Options")))):
		pass
		(c).fields["m_iEditedKey"] = R.coerce(R.unary("-", 1), "int")
		R.call_member(c, "UpdateOptionsPanel", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Achievements")))):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AchievementItems"), "length"))):
				pass
				R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "Achievements"), "AchievementsContainer"), "removeChild"), [R.get_value((c).fields.get("m_AchievementItems"), v_i)])
				v_i = R.signed32(v_i + 1)
			R.invoke(R.get_value((c).fields.get("m_AchievementItems"), "splice"), [0])
			R.set_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "visible", false, "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns")))):
				pass
				R.call_member(c, "ShowFileToolTip", ["", "", "", ""])
				if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])):
					pass
					R.invoke(R.get_value(c.fields.get("m_ArmorGamesAPI"), "closeAGUI"), [])
	(c).fields["m_iMenuState"] = R.coerce(v_iState, "int")
	(c).fields["m_iPendingMenuState"] = R.coerce(R.static_value("RDGame", "MenuState_None"), "int")
	if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns")))):
		pass
		R.call_member(c, "InitUserCampaignsPanel", [])
	R.set_value(R.get_value((c).fields.get("m_Menu"), "MenuTitle"), "visible", ((float((c).fields.get("m_iMenuState")) != float(R.static_value("RDGame", "MenuState_UserCampaigns"))) or R.unary("!", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")]))), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "HighScoresBack"), "visible", R.unary("!", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsBack"), "visible", R.unary("!", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "visible", R.unary("!", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])), "=")
	R.call_member(c, "SlideInterface", [(c).fields.get("m_iMenuState"), true, false])
	if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Achievements")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "visible", true, "=")
		(c).fields["m_fAchievementItemPosY"] = float(0)
		R.call_member(c, "AddAchievementSection", ["Behind The Wheel"])
		R.call_member(c, "AddAchievementRange", [R.static_value("RDAchievement", "FuckWheels"), R.static_value("RDAchievement", "FreeRide")])
		R.call_member(c, "AddAchievementSection", ["Killing Expertise"])
		R.call_member(c, "AddAchievementRange", [R.static_value("RDAchievement", "ExpertMarksman"), R.static_value("RDAchievement", "WhenOurPowersCombine")])
		R.call_member(c, "AddAchievementSection", ["Apocalyptic Mettle"])
		R.call_member(c, "AddAchievementRange", [R.static_value("RDAchievement", "PillsHere"), R.static_value("RDAchievement", "PerfectSoldiers")])
		R.call_member(c, "AddAchievementSection", ["Stared Death In The Face. Death Blinked"])
		R.call_member(c, "AddAchievementRange", [R.static_value("RDAchievement", "IntoTheWild"), R.static_value("RDAchievement", "FirstBlood")])
		(c).fields["m_fAchievementScrollHeight"] = float((float((c).fields.get("m_fAchievementItemPosY")) - float(180)))
		(c).fields["m_fAchievementsScroll"] = float(0)
		(c).fields["m_fAchievementsScrollSpeed"] = float(0)
		R.call_member(c, "UpdateAchievements", [0])
	else:
		pass
		if R.truth((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaignProperties")))):
			pass
			R.call_member(c, "LoadCampaignProperties", [])
			R.call_member(c, "SetCampaignPropertyPanel", [(c).fields.get("m_iCampaignPropertyPage")])
	R.set_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "visible", false, "=")
	if R.truth((((((((float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Main"))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_GameModes")))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Achievements")))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Highscores")))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_Options")))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_InGame")))) or (float((c).fields.get("m_iMenuState")) == float(R.static_value("RDGame", "MenuState_ContentPanel"))))):
		pass
		R.set_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "visible", true, "=")
		if R.truth(R.unary("!", (((float((c).fields.get("m_iPreviousMenuState")) == float(R.static_value("RDGame", "MenuState_Main"))) or (float((c).fields.get("m_iPreviousMenuState")) == float(R.static_value("RDGame", "MenuState_GameModes")))) or (float((c).fields.get("m_iPreviousMenuState")) == float(R.static_value("RDGame", "MenuState_InGame")))))):
			pass
			R.call_member(c, "SetContentLink", [R.binary("+", 1, R.call_static("Maths", "RandomInt", [3]))])
	return null

static func f_SlideMenuMC(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bRight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bOn: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_fDelay: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_bInstant: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_bCallback: Variant = R.coerce((a[5] if a.size() > 5 else false), "Boolean")
	if R.truth(v_bInstant):
		pass
		R.set_value(v_mc, "x", (R.num(R.get_value(v_mc, "m_fOriginalPosX")) if R.truth(v_bOn) else R.binary("+", R.get_value(v_mc, "m_fOriginalPosX"), (R.static_value("RDGame", "MenuItemSlide") if R.truth(v_bRight) else R.unary("-", R.static_value("RDGame", "MenuItemSlide"))))), "=")
	else:
		pass
		R.call_static("gs.TweenLite", "to", [v_mc, R.static_value("RDGame", "MenuSlideTime"), {"x": (R.get_value(v_mc, "m_fOriginalPosX") if R.truth(v_bOn) else R.binary("+", R.get_value(v_mc, "m_fOriginalPosX"), (R.static_value("RDGame", "MenuItemSlide") if R.truth(v_bRight) else R.unary("-", R.static_value("RDGame", "MenuItemSlide"))))), "delay": v_fDelay, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": (R.get_value(c, "OnInterfaceSlideDone") if R.truth(v_bCallback) else null)}])
	R.set_value(v_mc, "mouseEnabled", v_bOn, "=")
	return null

static func f_SlideMenuButton(c: Variant, a: Array) -> Variant:
	var v_button: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDMenuButton")
	var v_bRight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bOn: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_fDelay: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_bInstant: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_bCallback: Variant = R.coerce((a[5] if a.size() > 5 else false), "Boolean")
	if R.truth(v_bInstant):
		pass
		R.set_value(v_button, "x", ((v_button).fields.get("m_fOriginalPosX") if R.truth(v_bOn) else R.binary("+", (v_button).fields.get("m_fOriginalPosX"), (R.static_value("RDGame", "MenuItemSlide") if R.truth(v_bRight) else R.unary("-", R.static_value("RDGame", "MenuItemSlide"))))), "=")
	else:
		pass
		R.call_static("gs.TweenLite", "to", [v_button, R.static_value("RDGame", "MenuSlideTime"), {"x": ((v_button).fields.get("m_fOriginalPosX") if R.truth(v_bOn) else R.binary("+", (v_button).fields.get("m_fOriginalPosX"), (R.static_value("RDGame", "MenuItemSlide") if R.truth(v_bRight) else R.unary("-", R.static_value("RDGame", "MenuItemSlide"))))), "delay": v_fDelay, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": (R.get_value(c, "OnInterfaceSlideDone") if R.truth(v_bCallback) else null)}])
	R.set_value(v_button, "mouseEnabled", v_bOn, "=")
	return null

static func f_OnInterfaceSlideDone(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iPendingMenuState")) != float(R.static_value("RDGame", "MenuState_None")))):
		pass
		R.call_member(c, "SetMenuState", [(c).fields.get("m_iPendingMenuState")])
	return null

static func f_SlideInterface(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"fDelay": "Number", "iMenuState": "int", "bOn": "Boolean", "bInstant": "Boolean"}
	l["fDelay"] = NAN
	l["iMenuState"] = R.coerce((a[0] if a.size() > 0 else 0), "int")
	l["bOn"] = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	l["bInstant"] = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.lset(l, "fDelay", 0)
	if R.truth((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_None")))):
		pass
		R.call_member(c, "OnInterfaceSlideDone", [])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_Main"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "StoryMode"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Challenges"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "UserCampaigns"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "CampaignEditor"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Options"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Achievements"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "HighScores"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_GameModes"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "HardcoreMode"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "HardcoreModeLock"), true, (R.lget(l, "bOn") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished"))), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "TimeMode"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "SurvivalMode"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "RescueMode"), true, R.lget(l, "bOn"), R.lget(l, "fDelay"), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "RescueModeLock"), true, (R.lget(l, "bOn") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished"))), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "MutantMode"), true, R.lget(l, "bOn"), R.lget(l, "fDelay"), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "MutantModeLock"), true, (R.lget(l, "bOn") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bMutantLevelFinished"))), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "MilitaryMode"), true, R.lget(l, "bOn"), R.lget(l, "fDelay"), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "MilitaryModeLock"), true, (R.lget(l, "bOn") and R.unary("!", ((c).fields.get("m_PlayerInfo")).fields.get("m_bStoryModeFinished"))), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "ChallengesBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_Options"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "VehicleControlsLabel"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey1"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey2"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey3"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey4"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey5"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey6"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey7"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "WeaponControlsLabel"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey8"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey9"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey10"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "GeneralOptionsLabel"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SetKey11"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Fullscreen"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Sounds"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Music"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Quality"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "ZombieTints"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "SaveData"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SaveData"), "mouseEnabled", (float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_MainMenu"))), "=")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SaveData"), "alpha", (1 if R.truth((float(c.fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_MainMenu")))) else 0.5), "=")
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "OptionsBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_Achievements"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		if R.truth(R.lget(l, "bInstant")):
			pass
			R.set_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "x", (R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "=")
		else:
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), R.static_value("RDGame", "MenuSlideTime"), {"x": (R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "delay": R.lget(l, "fDelay"), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": R.get_value(c, "OnInterfaceSlideDone")}])
		R.set_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "mouseChildren", R.lget(l, "bOn"), "=")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "AchievementsPanel"), "mouseEnabled", R.lget(l, "bOn"), "=")
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "AchievementsBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_Highscores"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		if R.truth(R.lget(l, "bInstant")):
			pass
			R.set_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "x", (R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "=")
		else:
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), R.static_value("RDGame", "MenuSlideTime"), {"x": (R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "delay": R.lget(l, "fDelay"), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": R.get_value(c, "OnInterfaceSlideDone")}])
		R.set_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "mouseChildren", R.lget(l, "bOn"), "=")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "HighScoresPanel"), "mouseEnabled", R.lget(l, "bOn"), "=")
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "HighScoresBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_Credits"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Credits1"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits2"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Credits3"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits4"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Credits5"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits6"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Credits7"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits8"), false, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuMC", [R.get_value((c).fields.get("m_Menu"), "Credits9"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits10"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits11"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits12"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits13"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits14"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits15"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits16"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "CreditsBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_InGame"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Resume"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Abort"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Options"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Achievements"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "HighScores"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "Credits"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaigns"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		if R.truth(R.lget(l, "bInstant")):
			pass
			R.set_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "x", (R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "=")
		else:
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), R.static_value("RDGame", "MenuSlideTime"), {"x": (R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else (R.num(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "m_fOriginalPosX")) - float(R.static_value("RDGame", "MenuPanelItemSlide")))), "delay": R.lget(l, "fDelay"), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut"), "onComplete": R.get_value(c, "OnInterfaceSlideDone")}])
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "UserCampaignsBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_UserCampaignProperties"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		if R.truth(R.lget(l, "bInstant")):
			pass
			R.set_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "x", (R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else R.binary("+", R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "m_fOriginalPosX"), R.static_value("RDGame", "MenuPanelItemSlide"))), "=")
		else:
			pass
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), R.static_value("RDGame", "MenuSlideTime"), {"x": (R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "m_fOriginalPosX") if R.truth(R.lget(l, "bOn")) else R.binary("+", R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "m_fOriginalPosX"), R.static_value("RDGame", "MenuPanelItemSlide"))), "delay": R.lget(l, "fDelay"), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeInOut")}])
		R.lset(l, "fDelay", 0, "=")
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesPlay"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant")])
		R.call_member(c, "SlideMenuButton", [R.get_value((c).fields.get("m_Menu"), "UserCampaignPropertiesBack"), true, R.lget(l, "bOn"), R.lset(l, "fDelay", (float(R.lget(l, "fDelay")) + float(R.static_value("RDGame", "MenuSlideDelay"))), "="), R.lget(l, "bInstant"), true])
	if R.truth(((float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_ContentPanel"))) or (float(R.lget(l, "iMenuState")) == float(R.static_value("RDGame", "MenuState_All"))))):
		pass
		if R.truth(R.unary("!", R.lget(l, "bInstant"))):
			pass
			R.call_member(c, "OnInterfaceSlideDone", [])
	return null

static func f_InitSpecialDay(c: Variant, a: Array) -> Variant:
	var v_iSpecialDay: Variant = 0
	var v_currentDate: Variant = null
	v_iSpecialDay = R.coerce(R.static_value("RDGame", "SpecialDay_None"), "int")
	(c).fields["m_iSpecialDay"] = R.coerce(v_iSpecialDay, "int")
	v_currentDate = R.coerce(R.construct(R.resolve(c, "Date", "RDGame"), []), "Date")
	if R.truth((R.binary("==", R.get_value(v_currentDate, "date"), 13) and R.binary("==", R.get_value(v_currentDate, "day"), 5))):
		pass
		(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_Friday13th"), "int")
	else:
		pass
		if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 0) and R.binary("==", R.get_value(v_currentDate, "date"), 1))):
			pass
			(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_NewYear"), "int")
		else:
			pass
			if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 0) and R.binary("==", R.get_value(v_currentDate, "date"), 21))):
				pass
				(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_MartinLutherKingDay"), "int")
			else:
				pass
				if R.truth((((((((((((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2013) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 12)) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2014) and R.binary("==", R.get_value(v_currentDate, "month"), 2)) and R.binary("==", R.get_value(v_currentDate, "date"), 4))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2015) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 17))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2016) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 9))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2017) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 28))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2018) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 13))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2019) and R.binary("==", R.get_value(v_currentDate, "month"), 2)) and R.binary("==", R.get_value(v_currentDate, "date"), 5))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2020) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 25))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2021) and R.binary("==", R.get_value(v_currentDate, "month"), 1)) and R.binary("==", R.get_value(v_currentDate, "date"), 16))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2022) and R.binary("==", R.get_value(v_currentDate, "month"), 2)) and R.binary("==", R.get_value(v_currentDate, "date"), 1)))):
					pass
					(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_MardiGras"), "int")
				else:
					pass
					if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 1) and R.binary("==", R.get_value(v_currentDate, "date"), 14))):
						pass
						(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_ValentinesDay"), "int")
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 2) and R.binary("==", R.get_value(v_currentDate, "date"), 17))):
							pass
							(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_SaintPatricksDay"), "int")
						else:
							pass
							if R.truth((((((((((((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2013) and R.binary("==", R.get_value(v_currentDate, "month"), 2)) and R.binary("==", R.get_value(v_currentDate, "date"), 31)) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2014) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 20))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2015) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 5))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2016) and R.binary("==", R.get_value(v_currentDate, "month"), 2)) and R.binary("==", R.get_value(v_currentDate, "date"), 27))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2017) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 16))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2018) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 1))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2019) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 21))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2020) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 12))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2021) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 4))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2022) and R.binary("==", R.get_value(v_currentDate, "month"), 3)) and R.binary("==", R.get_value(v_currentDate, "date"), 17)))):
								pass
								(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_Easter"), "int")
							else:
								pass
								if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 3) and R.binary("==", R.get_value(v_currentDate, "date"), 1))):
									pass
									(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_AprilsFool"), "int")
								else:
									pass
									if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 4) and R.binary("==", R.get_value(v_currentDate, "date"), 5))):
										pass
										(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_CincoDeMayo"), "int")
									else:
										pass
										if R.truth((((((((((((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2013) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 12)) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2014) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 11))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2015) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 10))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2016) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 8))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2017) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 14))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2018) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 13))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2019) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 12))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2020) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 10))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2021) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 9))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2022) and R.binary("==", R.get_value(v_currentDate, "month"), 4)) and R.binary("==", R.get_value(v_currentDate, "date"), 8)))):
											pass
											(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_MothersDay"), "int")
										else:
											pass
											if R.truth((((((((((((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2013) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 16)) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2014) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 15))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2015) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 21))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2016) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 19))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2017) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 18))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2018) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 17))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2019) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 16))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2020) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 21))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2021) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 20))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2022) and R.binary("==", R.get_value(v_currentDate, "month"), 5)) and R.binary("==", R.get_value(v_currentDate, "date"), 19)))):
												pass
												(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_FathersDay"), "int")
											else:
												pass
												if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 7) and R.binary("==", R.get_value(v_currentDate, "date"), 3))):
													pass
													(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_WatermelonDay"), "int")
												else:
													pass
													if R.truth((((((((((((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2013) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 2)) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2014) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 1))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2015) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 7))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2016) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 5))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2017) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 4))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2018) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 3))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2019) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 2))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2020) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 7))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2021) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 6))) or ((R.binary("==", R.get_value(v_currentDate, "fullYear"), 2022) and R.binary("==", R.get_value(v_currentDate, "month"), 8)) and R.binary("==", R.get_value(v_currentDate, "date"), 5)))):
														pass
														(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_LaborDay"), "int")
													else:
														pass
														if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 9) and R.binary("==", R.get_value(v_currentDate, "date"), 31))):
															pass
															(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_Halloween"), "int")
														else:
															pass
															if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 10) and R.binary("==", R.get_value(v_currentDate, "date"), 28))):
																pass
																(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_ThanksGiving"), "int")
															else:
																pass
																if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 11) and R.binary("==", R.get_value(v_currentDate, "date"), 25))):
																	pass
																	(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_Christmas"), "int")
																else:
																	pass
																	if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 8) and R.binary("==", R.get_value(v_currentDate, "date"), 22))):
																		pass
																		(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_MadnessDay"), "int")
																	else:
																		pass
																		if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 3) and ((R.binary("==", R.get_value(v_currentDate, "date"), 26) or R.binary("==", R.get_value(v_currentDate, "date"), 27)) or R.binary("==", R.get_value(v_currentDate, "date"), 28)))):
																			pass
																			(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_PicoDay"), "int")
																		else:
																			pass
																			if R.truth((R.binary("==", R.get_value(v_currentDate, "month"), 6) and R.binary("==", R.get_value(v_currentDate, "date"), 10))):
																				pass
																				(c).fields["m_iSpecialDay"] = R.coerce(R.static_value("RDGame", "SpecialDay_RobotDay"), "int")
	return null

static func f_CanPause(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.logical_and(R.truth((c).fields.get("m_CurrentGameMode")), func(): return R.call_member((c).fields.get("m_CurrentGameMode"), "CanPause", [])), func(): return R.call_member(((c).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "CanPause", []))
	return null

static func f_SetPause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPauseType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bSurvivalGuide: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	if R.truth(v_bPause):
		pass
		(c).fields["m_iPauseType"] = R.coerce(v_iPauseType, "int")
	if R.truth(R.binary("!=", v_bPause, c.fields.get("m_bPaused"))):
		pass
		if R.truth(v_bPause):
			pass
			R.call_member((c).fields.get("m_PauseSound"), "Play", [])
			R.call_member((c).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [0])
			if R.truth((float((c).fields.get("m_iPauseType")) != float(R.static_value("RDGame", "PauseType_Upgrade")))):
				pass
				R.call_member((c).fields.get("m_MusicSoundGroup"), "SetMaxVolume", [0])
		else:
			pass
			if R.truth((float((c).fields.get("m_iPauseType")) != float(R.static_value("RDGame", "PauseType_Abort")))):
				pass
				if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
					pass
					R.call_member((c).fields.get("m_GameSFXSoundGroup"), "SetMaxVolume", [1])
				if R.truth(((c).fields.get("m_PlayerInfo")).fields.get("m_bMusic")):
					pass
					R.call_member((c).fields.get("m_MusicSoundGroup"), "SetMaxVolume", [1])
	if R.truth(R.binary("!=", v_bPause, c.fields.get("m_bPaused"))):
		pass
		R.call_member((c).fields.get("m_Hud"), "SetPause", [v_bPause, v_iPauseType, v_bSurvivalGuide])
	R.call_member(c, "Pause", [v_bPause])
	return null

static func f_PlayCustomPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	(c).fields["m_bPlayFromEditor"] = true
	(c).fields["m_CustomPatternData"] = R.coerce(v_patternData, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null

static func f_PlayCustomArea(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	(c).fields["m_bPlayFromEditor"] = true
	(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(v_areaData, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null

static func f_PlayCustomCampaign(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bFromEditor: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	(c).fields["m_bPlayFromEditor"] = v_bFromEditor
	(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(v_campaignData, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null

static func f_SetContentLink(c: Variant, a: Array) -> Variant:
	var v_iLink: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iContentLink"] = R.coerce(v_iLink, "int")
	(c).fields["m_fContentLinkTimer"] = float(0)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RoadLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(1)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "LabLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(2)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RangeLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(3)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "SoundtrackLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(4)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "PosterLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(5)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "FacebookLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(6)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "NewgroundsLink"), "visible", (float((c).fields.get("m_iContentLink")) == float(7)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotRoad"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(1))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotLab"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(2))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotRange"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(3))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotSoundtrack"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(4))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotPoster"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(5))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotFacebook"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(6))) else 0.5), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "DotNewgrounds"), "alpha", (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(7))) else 0.5), "=")
	return null

static func f_UpdateContentLink(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.logical_and(R.get_value((c).fields.get("m_Menu"), "visible"), func(): return R.truth(R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "visible")))):
		pass
		if R.truth((R.unary("!", (c).fields.get("m_ToolTipTarget")) or ((((((R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RoadLink")) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "LabLink"))) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "RangeLink"))) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "SoundtrackLink"))) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "PosterLink"))) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "FacebookLink"))) and R.binary("!=", (c).fields.get("m_ToolTipTarget"), R.get_value(R.get_value((c).fields.get("m_Menu"), "ContentPanel"), "NewgroundsLink"))))):
			pass
			(c).fields["m_fContentLinkTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fContentLinkTimer"), v_fDeltaTime), "Number")
			if R.truth(R.binary(">=", (c).fields.get("m_fContentLinkTimer"), (1 if R.truth((float((c).fields.get("m_iContentLink")) == float(0))) else 5))):
				pass
				if R.truth((float((c).fields.get("m_iContentLink")) == float(0))):
					pass
					(c).fields["m_iContentLink"] = R.coerce(R.binary("+", R.call_static("Maths", "RandomInt", [6]), 1), "int")
				else:
					pass
					R.set_value(c, "m_iContentLink", 1, "+=")
					if R.truth((float((c).fields.get("m_iContentLink")) == float(7))):
						pass
						(c).fields["m_iContentLink"] = R.coerce(1, "int")
				R.call_member(c, "SetContentLink", [(c).fields.get("m_iContentLink")])
	return null

static func f_ShowSurvivalGuide(c: Variant, a: Array) -> Variant:
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else R.unary("-", 1)), "int")
	R.call_member(c, "PlayPaperSound", [])
	if R.truth(R.binary("!=", v_iItem, R.unary("-", 1))):
		pass
		(c).fields["m_iSurvivalGuidePage"] = R.coerce(v_iItem, "int")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "visible", true, "=")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", false, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "gotoAndStop"), [(c).fields.get("m_iSurvivalGuidePage")])
		R.call_member((c).fields.get("m_PlayerInfo"), "SeeSurvivalItem", [(c).fields.get("m_iSurvivalGuidePage")])
		R.call_member(c, "SavePlayerInfo", [])
		R.call_member(c, "UpdateSurvivalGuideNavigation", [])
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", true, "=")
		R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideButton"), "visible", false, "=")
		(c).fields["m_iSurvivalGuideTablePage"] = R.coerce(0, "int")
		R.call_member(c, "UpdateSurvivalGuideTable", [])
	return null

static func f_GetNextSurvivalPage(c: Variant, a: Array) -> Variant:
	var v_iPage: Variant = 0
	v_iPage = R.coerce((float((c).fields.get("m_iSurvivalGuidePage")) + float(1)), "int")
	while R.truth((float(v_iPage) < float(R.static_value("RDUnlockData", "Survival_Max")))):
		pass
		if R.truth(R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemUnlocked", [v_iPage])):
			pass
			break
		v_iPage = R.signed32(v_iPage + 1)
	return v_iPage
	return null

static func f_GetPreviousSurvivalPage(c: Variant, a: Array) -> Variant:
	var v_iPage: Variant = null
	v_iPage = R.coerce(R.coerce((float((c).fields.get("m_iSurvivalGuidePage")) - float(1)), "int"), "*")
	while R.truth(R.binary(">", v_iPage, 0)):
		pass
		if R.truth(R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemUnlocked", [v_iPage])):
			pass
			break
		v_iPage = R.coerce(R.num(v_iPage) - 1, "*")
	return v_iPage
	return null

static func f_UpdateSurvivalGuideNavigation(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Next"), "visible", R.binary("!=", R.call_member(c, "GetNextSurvivalPage", []), R.static_value("RDUnlockData", "Survival_Max")), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Previous"), "visible", R.binary("!=", R.call_member(c, "GetPreviousSurvivalPage", []), 0), "=")
	return null

static func f_UpdateSurvivalGuideTable(c: Variant, a: Array) -> Variant:
	var v_item: Variant = null
	var v_iActualItem: Variant = 0
	var v_iStartingItem: Variant = 0
	var v_i: Variant = 0
	v_item = R.coerce(null, "MovieClip")
	v_iActualItem = R.coerce(0, "int")
	v_iStartingItem = R.coerce((float((c).fields.get("m_iSurvivalGuideTablePage")) * float(20)), "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SurvivalGuideTableItems"), "length"))):
		pass
		v_item = R.coerce(R.get_value((c).fields.get("m_SurvivalGuideTableItems"), v_i), "MovieClip")
		v_iActualItem = R.coerce((float((float(v_iStartingItem) + float(v_i))) + float(1)), "int")
		R.set_value(v_item, "visible", (float(v_iActualItem) < float(R.static_value("RDUnlockData", "Survival_Max"))), "=")
		if R.truth(R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemUnlocked", [v_iActualItem])):
			pass
			R.set_value(R.get_value(v_item, "ItemName"), "text", R.binary("+", R.call_static("RDUnlockData", "GetSurvivalItemName", [v_iActualItem]), ("" if R.truth(R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemSeen", [v_iActualItem])) else " (NEW)")), "=")
			R.set_value(v_item, "mouseEnabled", true, "=")
		else:
			pass
			R.set_value(R.get_value(v_item, "ItemName"), "text", "???????", "=")
			R.set_value(v_item, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "Next"), "visible", (float((c).fields.get("m_iSurvivalGuideTablePage")) == float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "Previous"), "visible", (float((c).fields.get("m_iSurvivalGuideTablePage")) == float(1)), "=")
	return null

static func f_UnlockSurvivalItem(c: Variant, a: Array) -> Variant:
	var v_bFullyUnlocked: Variant = false
	var v_i: Variant = 0
	var v_iItem: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bFullyUnlocked = false
	v_i = R.coerce(0, "int")
	if R.truth((R.binary("!=", v_iItem, R.unary("-", 1)) and R.unary("!", R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemUnlocked", [v_iItem])))):
		pass
		R.call_member(c, "PlayPaperSound", [])
		R.call_member((c).fields.get("m_PlayerInfo"), "UnlockSurvivalItem", [v_iItem])
		R.call_member((c).fields.get("m_Hud"), "ShowSurvivalGuideNotice", [v_iItem])
		v_bFullyUnlocked = true
		v_i = R.coerce(R.static_value("RDUnlockData", "Survival_Vehicles"), "int")
		while R.truth((float(v_i) < float(R.static_value("RDUnlockData", "Survival_Max")))):
			pass
			if R.truth(R.unary("!", R.call_member((c).fields.get("m_PlayerInfo"), "IsSurvivalItemUnlocked", [v_i]))):
				pass
				v_bFullyUnlocked = false
				break
			v_i = R.signed32(v_i + 1)
		if R.truth((v_bFullyUnlocked and R.unary("!", R.get_value(((c).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "KnowledgeIsSurvival"))))):
			pass
			R.call_member(c, "CompleteAchievement", [R.static_value("RDAchievement", "KnowledgeIsSurvival")])
		R.call_member(c, "SavePlayerInfo", [])
	return null

static func f_OnSurvivalTableItemDown(c: Variant, a: Array) -> Variant:
	var v_iStartingItem: Variant = 0
	var v_iItem: Variant = 0
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_iStartingItem = R.coerce((float((c).fields.get("m_iSurvivalGuideTablePage")) * float(20)), "int")
	v_iItem = R.coerce(R.coerce(R.get_value(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "m_iIndex"), "int"), "int")
	R.call_member(c, "PlayPaperSound", [])
	(c).fields["m_iSurvivalGuidePage"] = R.coerce((float(v_iStartingItem) + float(v_iItem)), "int")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuideTable"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "gotoAndStop"), [(c).fields.get("m_iSurvivalGuidePage")])
	R.call_member((c).fields.get("m_PlayerInfo"), "SeeSurvivalItem", [(c).fields.get("m_iSurvivalGuidePage")])
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "UpdateSurvivalGuideNavigation", [])
	return null

static func f_OnSurvivalTableItemOver(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(R.get_value(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "Underline"), "visible", true, "=")
	return null

static func f_OnSurvivalTableItemOut(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(R.get_value(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "Underline"), "visible", false, "=")
	return null

static func f_ClearCinematic(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CinematicVoice")):
		pass
		R.call_member((c).fields.get("m_CinematicVoice"), "Stop", [])
		(c).fields["m_CinematicVoice"] = R.coerce(null, "DTSound")
	(c).fields["m_CinematicMouth"] = R.coerce(null, "MovieClip")
	(c).fields["m_CinematicPerlinScene"] = R.coerce(null, "MovieClip")
	return null

static func f_PlayCinematicVoice(c: Variant, a: Array) -> Variant:
	var v_voiceClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_mouthMC: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	(c).fields["m_CinematicMouth"] = R.coerce(v_mouthMC, "MovieClip")
	(c).fields["m_CinematicVoice"] = R.coerce(R.construct(R.klass("DTSound"), [v_voiceClass, (c).fields.get("m_CinematicVoiceSoundGroup"), true]), "DTSound")
	R.call_member((c).fields.get("m_CinematicVoice"), "Play", [])
	return null

static func f_SetCinematicMouth(c: Variant, a: Array) -> Variant:
	var v_mouthMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	(c).fields["m_CinematicMouth"] = R.coerce(v_mouthMC, "MovieClip")
	return null

static func f_SetCinematicPerlinScene(c: Variant, a: Array) -> Variant:
	var v_sceneMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_fSpeed: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fAmplitude: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["m_CinematicPerlinScene"] = R.coerce(v_sceneMC, "MovieClip")
	if R.truth(v_sceneMC):
		pass
		v_fSpeed = R.coerce(R.binary("*", v_fSpeed, 1.1), "Number")
		v_fAmplitude = R.coerce(R.binary("*", v_fAmplitude, 0.9), "Number")
		(c).fields["m_fCinematicPerlinSceneSpeed"] = float(v_fSpeed)
		(c).fields["m_fCinematicPerlinSceneAmplitude"] = float(v_fAmplitude)
		(c).fields["m_fCinematicPerlinSceneStartX"] = R.coerce(R.get_value(v_sceneMC, "x"), "Number")
		(c).fields["m_fCinematicPerlinSceneStartY"] = R.coerce(R.get_value(v_sceneMC, "y"), "Number")
		R.call_member(c, "UpdateCinematic", [0])
	return null

static func f_UpdateCinematic(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	var v_fDataVolume: Variant = NAN
	var v_fVolumeRatio: Variant = NAN
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iFrame = R.coerce(0, "int")
	v_fDataVolume = float(NAN)
	v_fVolumeRatio = float(NAN)
	v_fX = float(NAN)
	v_fY = float(NAN)
	if R.truth((R.truth((c).fields.get("m_CinematicMouth")) and R.truth((c).fields.get("m_CinematicVoice")))):
		pass
		v_iFrame = R.coerce(1, "int")
		if R.truth(R.call_member((c).fields.get("m_CinematicVoice"), "IsPlaying", [])):
			pass
			v_fDataVolume = R.coerce(R.call_member((c).fields.get("m_CinematicVoice"), "GetDataVolume", []), "Number")
			v_fVolumeRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float(v_fDataVolume) - float(0.1)), 0.1), 0, 1]), "Number")
			v_iFrame = R.coerce((float(1) + float(ceilf(float((float(v_fVolumeRatio) * float(20)))))), "int")
			R.invoke(R.get_value((c).fields.get("m_CinematicMouth"), "gotoAndStop"), [v_iFrame])
		else:
			pass
			R.invoke(R.get_value((c).fields.get("m_CinematicMouth"), "gotoAndStop"), [1])
	if R.truth((c).fields.get("m_CinematicPerlinScene")):
		pass
		(c).fields["m_fCinematicPerlinScenePerlinX"] = R.coerce(R.binary("+", (c).fields.get("m_fCinematicPerlinScenePerlinX"), (c).fields.get("m_fCinematicPerlinSceneSpeed")), "Number")
		(c).fields["m_fCinematicPerlinScenePerlinY"] = R.coerce(R.binary("+", (c).fields.get("m_fCinematicPerlinScenePerlinY"), (c).fields.get("m_fCinematicPerlinSceneSpeed")), "Number")
		v_fX = float((R.num(R.call_static("Perlin", "noise", [(c).fields.get("m_fCinematicPerlinScenePerlinX")])) * float((c).fields.get("m_fCinematicPerlinSceneAmplitude"))))
		v_fY = float((R.num(R.call_static("Perlin", "noise", [(float((c).fields.get("m_fCinematicPerlinScenePerlinY")) + float(123.123))])) * float((c).fields.get("m_fCinematicPerlinSceneAmplitude"))))
		R.set_value((c).fields.get("m_CinematicPerlinScene"), "x", (float((c).fields.get("m_fCinematicPerlinSceneStartX")) + float(v_fX)), "=")
		R.set_value((c).fields.get("m_CinematicPerlinScene"), "y", (float((c).fields.get("m_fCinematicPerlinSceneStartY")) + float(v_fY)), "=")
	return null

static func f_ResetFocus(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_FocusManager"), "setFocus", [null])
	return null

static func f_InitUserCampaignsPanel(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "visible", R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")]), "=")
	if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_member(c, "ShowSortingMenu", [false])
		R.call_member(c, "LoadUserCampaigns", [(c).fields.get("m_iUserCampaignsSorting")])
	else:
		pass
		if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "sharedContent"), "browse"), ["Campaign", "BY_RATING"])
		else:
			pass
			if R.truth(R.invoke(R.resolve(c, "HasAPI", "RDGame"), [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				R.invoke(R.get_value(c.fields.get("m_ArmorGamesAPI"), "initAGUI"), [{"onClose": R.get_value(c, "OnArmorGamesShareListClose")}])
				R.invoke(R.get_value(c.fields.get("m_ArmorGamesAPI"), "showGameShareList"), [R.get_value(c, "OnArmorGamesCampaignClocked")])
	return null

static func f_OnArmorGamesShareListClose(c: Variant, a: Array) -> Variant:
	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
	return null

static func f_OnArmorGamesCampaignClocked(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_data, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "name")])
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "data")])
	else:
		pass
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "error")])
	return null

static func f_RegisterKongregateListeners(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "sharedContent"), "addLoadListener"), ["Campaign", R.get_value(c, "OnKongCampaignLoad")])
	return null

static func f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnKongCampaignLoad", [v_params])
	return null

static func f_CancelLoadFiles(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	v_file = R.coerce(null, "SaveFile")
	R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	if R.truth((R.truth((c).fields.get("m_LoadedFiles")) and R.binary("<", (c).fields.get("m_iLoadFileIndex"), R.get_value((c).fields.get("m_LoadedFiles"), "length")))):
		pass
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "SaveFile")
		R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	return null

static func f_LoadUserCampaigns(c: Variant, a: Array) -> Variant:
	var v_bSortDescending: Variant = false
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.call_member(c, "CancelLoadFiles", [])
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(v_iSorting, "int")
	(c).fields["m_iUserCampaignsPage"] = R.coerce(v_iPage, "int")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "PageNumber"), "text", R.binary("+", "Page ", (float(v_iPage) + float(1))), "=")
	R.call_member(c, "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	R.call_member(c, "ClearUserCampaignsPanelSlots", [])
	v_bSortDescending = (float(v_iSorting) != float(R.static_value("RDGame", "Sorting_Worst")))
	(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", ["Campaigns"]), "SaveQuery")
	R.set_value((c).fields.get("_query"), "resultsPerPage", 18, "=")
	R.set_value((c).fields.get("_query"), "page", (float(v_iPage) + float(1)), "=")
	R.call_member((c).fields.get("_query"), "addCondition", ["FileVersion", "<=", R.static_value("RDGame", "CurrentFileVersion")])
	if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Yours")))):
		pass
		R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), "=", R.get_value(R.klass("com.newgrounds.API"), "username")])
	else:
		pass
		if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Recent")))):
			pass
			R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
		else:
			pass
			if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Best")))):
				pass
				R.call_member((c).fields.get("_query"), "sortOn", ["Rating", true])
			else:
				pass
				if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Worst")))):
					pass
					R.call_member((c).fields.get("_query"), "sortOn", ["Rating", false])
				else:
					pass
					if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Unrated")))):
						pass
						R.call_member((c).fields.get("_query"), "addCondition", ["Rating.votes", "=", 0])
					else:
						pass
						if R.truth((float(v_iSorting) == float(R.static_value("RDGame", "Sorting_Random")))):
							pass
							R.set_value((c).fields.get("_query"), "isRandomized", true, "=")
	R.call_member((c).fields.get("_query"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnLoadFilesDone"), false, 0, true])
	R.call_member((c).fields.get("_query"), "execute", [])
	return null

static func f_OnLoadFilesDone(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_i: Variant = 0
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v_file = R.coerce(null, "SaveFile")
	v_slotMC = R.coerce(null, "MovieClip")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	(c).fields["_queryResults"] = R.coerce(R.get_value(R.get_value(v_e, "data"), "files"), "Array")
	(c).fields["m_LoadedFiles"] = R.coerce(R.construct(R.klass("Array"), [R.get_value((c).fields.get("_queryResults"), "length")]), "Array")
	v_i = R.coerce(0, "uint")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_queryResults"), "length"))):
		pass
		v_file = R.coerce(R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), v_i), "SaveFile")
		R.set_value((c).fields.get("m_LoadedFiles"), v_i, v_file, "=")
		v_i = ((v_i + 1) & 4294967295)
	v_i = R.coerce(0, "uint")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), v_i)]), "MovieClip")
		R.set_value(R.get_value(v_slotMC, "Loading"), "visible", R.binary("<", v_i, R.get_value((c).fields.get("m_LoadedFiles"), "length")), "=")
		R.set_value(v_slotMC, "mouseEnabled", false, "=")
		v_i = ((v_i + 1) & 4294967295)
	R.call_member(c, "HideLoadScreen", [])
	R.call_member(c, "LoadFile", [0])
	return null

static func f_LoadFile(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(null, "SaveFile")
	if R.truth(R.binary("<", v_iIndex, R.get_value((c).fields.get("m_LoadedFiles"), "length"))):
		pass
		(c).fields["m_iLoadFileIndex"] = R.coerce(v_iIndex, "int")
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "SaveFile")
		R.call_member(v_file, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded"), false, 0, true])
		R.call_member(v_file, "load", [])
	return null

static func f_OnFileLoaded(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_iconBitmap: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "SaveFile")
	R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), (c).fields.get("m_iLoadFileIndex"))]), "MovieClip")
	R.set_value(R.get_value(v_slotMC, "Loading"), "visible", false, "=")
	R.set_value(v_slotMC, "mouseEnabled", true, "=")
	v_iconBitmap = R.coerce(R.construct(R.klass("Bitmap"), [R.get_value(v_file, "icon")]), "Bitmap")
	R.invoke(R.get_value(v_slotMC, "addChild"), [v_iconBitmap])
	R.set_value(c, "m_iLoadFileIndex", 1, "+=")
	R.call_member(c, "LoadFile", [(c).fields.get("m_iLoadFileIndex")])
	return null

static func f_SetUserCampaignsSorting(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(v_iSorting, "int")
	return null

static func f_ShowSortingMenu(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropYours"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRecent"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropBest"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropWorst"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropUnrated"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRandom"), "visible", v_bShow, "=")
	return null

static func f_ClearUserCampaignsPanelSlots(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = null
	var v_i: Variant = 0
	v_slotMC = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.get_value((c).fields.get("m_UserCampaignsPanelSlots"), v_i), "MovieClip")
		while R.truth(R.binary(">", R.get_value(v_slotMC, "numChildren"), 3)):
			pass
			R.invoke(R.get_value(v_slotMC, "removeChildAt"), [3])
		R.set_value(R.get_value(v_slotMC, "Highlight"), "visible", false, "=")
		R.set_value(R.get_value(v_slotMC, "Loading"), "visible", false, "=")
		R.set_value(v_slotMC, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_HideLoadScreen(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_Menu"), "LoadScreen"), "visible", false, "=")
	return null

static func f_ShowLoadScreen(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_Menu"), "LoadScreen"), "visible", true, "=")
	return null

static func f_UpdateUserCampaignsPanel(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopYours"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Yours"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopRecent"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Recent"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopBest"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Best"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopWorst"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Worst"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopUnrated"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Unrated"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "TopRandom"), "visible", (float((c).fields.get("m_iUserCampaignsSorting")) == float(R.static_value("RDGame", "Sorting_Random"))), "=")
	return null

static func f_ShowFileToolTip(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szAuthorName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_szDescription: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_szRating: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	if R.truth(R.binary("!=", v_szName, "")):
		pass
		R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "visible", true, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "FileName"), "text", v_szName, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "AuthorName"), "text", v_szAuthorName, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "Description"), "text", v_szDescription, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "Rating"), "text", v_szRating, "=")
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "visible", false, "=")
	return null

static func f_UpdateFileToolTip(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "x", R.call_static("Maths", "Clamp", [R.get_value(c.fields.get("m_RootMC"), "mouseX"), R.binary("/", R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "width"), 2), (float((c.fields.get("m_Viewport")).fields.get("m_iWidth")) - float(R.binary("/", R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "width"), 2)))]), "=")
	R.set_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "y", R.get_value(c.fields.get("m_RootMC"), "mouseY"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "x", 0, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "InfoBox"), "y", (50 if R.truth(R.binary("<", R.get_value(R.get_value((c).fields.get("m_Menu"), "FileToolTip"), "y"), 200)) else R.unary("-", 50)), "=")
	return null

static func f_LoadNGUserFile(c: Variant, a: Array) -> Variant:
	var v_m_NGQuery: Variant = null
	R.call_member(c, "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(15)
	v_m_NGQuery = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", ["Campaigns"]), "SaveQuery")
	R.call_member(v_m_NGQuery, "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_ID"), "=", (c).fields.get("m_NGUserFileID")])
	R.call_member(v_m_NGQuery, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnLoadNGUserQueryComplete"), false, 0, true])
	R.call_member(v_m_NGQuery, "execute", [])
	(c).fields["m_NGUserFileID"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_OnLoadNGUserQueryComplete(c: Variant, a: Array) -> Variant:
	var v_queryResults: Variant = null
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v_queryResults = R.coerce(R.get_value(R.get_value(v_e, "data"), "files"), "Array")
	if R.truth((R.truth(v_queryResults) and R.binary(">", R.get_value(v_queryResults, "length"), 0))):
		pass
		(c).fields["m_PendingLoadedFile"] = R.coerce(R.get_value(v_queryResults, 0), "SaveFile")
		R.call_member((c).fields.get("m_PendingLoadedFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnNGUserFileLoaded"), false, 0, true])
		R.call_member((c).fields.get("m_PendingLoadedFile"), "load", [])
	return null

static func f_OnNGUserFileLoaded(c: Variant, a: Array) -> Variant:
	var v_savedData: Variant = null
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	(c).fields["m_LoadedFile"] = R.coerce((c).fields.get("m_PendingLoadedFile"), "SaveFile")
	(c).fields["m_bLoadedFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedFileRated"] = false
	R.call_member(c, "HideLoadScreen", [])
	v_savedData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_PendingLoadedFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "PlayCustomCampaign", [v_savedData, false])
	return null

static func f_RateFile(c: Variant, a: Array) -> Variant:
	var v_iRating: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((c).fields.get("m_LoadedFile")):
		pass
		R.call_member(c, "ShowLoadScreen", [])
		(c).fields["m_fAPITimeoutTimer"] = float(10)
		(c).fields["m_RatedFile"] = R.coerce((c).fields.get("m_LoadedFile"), "SaveFile")
		R.call_member((c).fields.get("m_RatedFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete"), false, 0, true])
		R.call_member((c).fields.get("m_RatedFile"), "sendVote", ["Rating", v_iRating])
	return null

static func f_OnRateComplete(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	R.call_member((c).fields.get("m_RatedFile"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete")])
	(c).fields["m_RatedFile"] = R.coerce(null, "SaveFile")
	R.call_member(c, "HideLoadScreen", [])
	(c).fields["m_bLoadedFileRated"] = true
	return null

static func f_OnTimelineEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "PlayMenuMusic")):
		pass
		R.call_member(c, "PlayCustomMusic", [(c).fields.get("m_MenuMusic"), 0, true, 0])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "UnlockJohnCar")):
			pass
			((c).fields.get("m_PlayerInfo")).fields["m_bJohnEndingSeen"] = true
			R.call_member(c, "SavePlayerInfo", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "PlayEngineSound")):
				pass
				R.call_member((c).fields.get("m_EngineSound"), "Play", [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "StopEngineSound")):
					pass
					R.call_member((c).fields.get("m_EngineSound"), "Stop", [])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "PlayPassBySound")):
						pass
						R.call_member((c).fields.get("m_PassBySound"), "Play", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PlayTireSound")):
							pass
							R.call_member((c).fields.get("m_TireSound"), "Play", [])
	return null

static func f_LoadCampaignProperties(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_file: Variant = null
	var v_savedData: Variant = null
	var v_iFileVersion: Variant = 0
	v_i = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iPendingUserCampaignIndex")), "SaveFile")
	v_savedData = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
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
	return null

static func f_SetCampaignPropertyPanel(c: Variant, a: Array) -> Variant:
	var v_bIsStoryCampaign: Variant = false
	var v_bGeneral: Variant = false
	var v_bWeapons: Variant = false
	var v_bControls: Variant = false
	var v_iPage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iCampaignPropertyPage"] = R.coerce(v_iPage, "int")
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "CampaignType"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalType"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalTarget"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "TiresBlown"), false, "Tires Blown"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoWeapons"), false, "No Weapons"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoAmmoPoints"), false, "No Ammo Points"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoReplenish"), false, "No Ammo Replenish"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteAmmo"), false, "Infinite Ammo"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InvincibleHellfire"), false, "Invincible Hellfire"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "BounceFactor"), true, "Bounce Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), true, "Player Speed Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedMG"), false, "Mounted MG"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedRocketLauncher"), false, "Mounted Rocket Launcher"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), false, "Infinite Mounted Weapon"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoDriverSwitch"), false, "No Driver Switch"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), false, "Arcade Ammo Pickups"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSteering"), false, "No Steering"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBraking"), false, "No Braking"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSwerving"), false, "No Swerving"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), true, "Player Car HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), true, "Player Body HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), true, "Zombie Speed Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieHPFactor"), true, "Zombie HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), true, "Oil Slipperiness Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), true, "Speed Loss Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "VehicleHPFactor"), true, "Vehicle HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ExplodingZombies"), false, "Exploding Zombies"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "AlwaysCling"), false, "Enemies Always Cling"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "Fog"), false, "Fog Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBackgroundCity"), false, "No Background City"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoChopperSupport"), false, "No Chopper Support"])
	v_bIsStoryCampaign = (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))
	v_bGeneral = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDGame", "CampaignPropertyPage_General")))
	v_bWeapons = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDGame", "CampaignPropertyPage_Weapons")))
	v_bControls = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDGame", "CampaignPropertyPage_Controls")))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GeneralUnderline"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "WeaponsUnderline"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ControlsUnderline"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "CampaignType"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalType"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalTarget"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InvincibleHellfire"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieHPFactor"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "VehicleHPFactor"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ExplodingZombies"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "AlwaysCling"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "Fog"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBackgroundCity"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoChopperSupport"), "visible", v_bGeneral, "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "CampaignType"), "Value"), "text", R.call_static("RDCampaignInfo", "GetTypeName", [((c).fields.get("m_CampaignInfo")).fields.get("m_iType")]), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalType"), "Value"), "text", R.call_static("RDCampaignInfo", "GetGoalName", [((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")]), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalTarget"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InvincibleHellfire"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ExplodingZombies"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "AlwaysCling"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "Fog"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBackgroundCity"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoChopperSupport"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"), "=")
	R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalType"), R.unary("!", v_bIsStoryCampaign), false])
	R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "GoalTarget"), R.unary("!", v_bIsStoryCampaign), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoWeapons"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoAmmoPoints"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoReplenish"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteAmmo"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedMG"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), "visible", v_bWeapons, "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoWeapons"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoAmmoPoints"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoReplenish"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteAmmo"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedMG"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "TiresBlown"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "BounceFactor"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoDriverSwitch"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSteering"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBraking"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSwerving"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "visible", v_bControls, "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "TiresBlown"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "BounceFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoDriverSwitch"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSteering"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoBraking"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "NoSwerving"), "Check"), "visible", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor"), "=")
	return null

static func f_SetupProperty(c: Variant, a: Array) -> Variant:
	var v_propertyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bMouseChildren: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_szName: Variant = R.coerce((a[2] if a.size() > 2 else ""), "String")
	R.invoke(R.get_value(R.get_value(v_propertyMC, "BG"), "gotoAndStop"), [1])
	R.set_value(v_propertyMC, "buttonMode", false, "=")
	R.set_value(v_propertyMC, "mouseChildren", false, "=")
	R.set_value(v_propertyMC, "mouseEnabled", false, "=")
	R.set_value(R.get_value(v_propertyMC, "Name"), "mouseEnabled", false, "=")
	if R.truth((R.binary("!=", v_szName, "") and R.truth(R.get_value(v_propertyMC, "Name")))):
		pass
		R.set_value(R.get_value(v_propertyMC, "Name"), "text", v_szName, "=")
	return null

static func f_EnableProperty(c: Variant, a: Array) -> Variant:
	var v_propertyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bEnabled: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bMouseChildren: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.set_value(v_propertyMC, "mouseEnabled", false, "=")
	R.set_value(v_propertyMC, "mouseChildren", false, "=")
	R.set_value(v_propertyMC, "alpha", (1 if R.truth(v_bEnabled) else 0.75), "=")
	return null

static func f_GetArmorGamesScoreTypes(c: Variant, a: Array) -> Variant:
	var v_outOfTimeScoreType: Variant = null
	var v_deadStateScoreType: Variant = null
	var v_rescueOPScoreType: Variant = null
	var v_mutantMeltdownScoreType: Variant = null
	var v_fubarScoreType: Variant = null
	var v_scoreTypes: Variant = null
	v_outOfTimeScoreType = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_outOfTimeScoreType, "type", "Out Of Time Distance", "=")
	R.set_value(v_outOfTimeScoreType, "format", "custom", "=")
	R.set_value(v_outOfTimeScoreType, "customFormatCallback", R.get_value(c, "FormatDistanceScoreCallback"), "=")
	R.set_value(v_outOfTimeScoreType, "descending", true, "=")
	v_deadStateScoreType = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_deadStateScoreType, "type", "Dead State Distance", "=")
	R.set_value(v_deadStateScoreType, "format", "custom", "=")
	R.set_value(v_deadStateScoreType, "customFormatCallback", R.get_value(c, "FormatDistanceScoreCallback"), "=")
	R.set_value(v_deadStateScoreType, "descending", true, "=")
	v_rescueOPScoreType = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_rescueOPScoreType, "type", "Rescue OP", "=")
	R.set_value(v_rescueOPScoreType, "descending", true, "=")
	v_mutantMeltdownScoreType = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_mutantMeltdownScoreType, "type", "Mutant Meltdown Distance", "=")
	R.set_value(v_mutantMeltdownScoreType, "format", "custom", "=")
	R.set_value(v_mutantMeltdownScoreType, "customFormatCallback", R.get_value(c, "FormatDistanceScoreCallback"), "=")
	R.set_value(v_mutantMeltdownScoreType, "descending", true, "=")
	v_fubarScoreType = R.coerce(R.construct(R.resolve(c, "Object", "RDGame"), []), "Object")
	R.set_value(v_fubarScoreType, "type", "F.U.B.A.R. Distance", "=")
	R.set_value(v_fubarScoreType, "format", "custom", "=")
	R.set_value(v_fubarScoreType, "customFormatCallback", R.get_value(c, "FormatDistanceScoreCallback"), "=")
	R.set_value(v_fubarScoreType, "descending", true, "=")
	v_scoreTypes = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(v_scoreTypes, "push"), [v_outOfTimeScoreType])
	R.invoke(R.get_value(v_scoreTypes, "push"), [v_deadStateScoreType])
	R.invoke(R.get_value(v_scoreTypes, "push"), [v_rescueOPScoreType])
	R.invoke(R.get_value(v_scoreTypes, "push"), [v_mutantMeltdownScoreType])
	R.invoke(R.get_value(v_scoreTypes, "push"), [v_fubarScoreType])
	return v_scoreTypes
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "DummyOwner", null, "=")
	R.set_value(c, "Instance", null, "=")
	R.set_value(c, "m_szDebug", "", "=")
	R.set_value(c, "FileVersion_Launch", 1, "=")
	R.set_value(c, "CurrentFileVersion", R.static_value("RDGame", "FileVersion_Launch"), "=")
	R.set_value(c, "AchievementPosX", 0, "=")
	R.set_value(c, "AchievementPosY", 70, "=")
	R.set_value(c, "AchievementHeight", 45, "=")
	R.set_value(c, "AchievementSectionHeight", 40, "=")
	R.set_value(c, "AchievementsScrollSpeed", 200, "=")
	R.set_value(c, "AchievementsScrollHeight", 170, "=")
	R.set_value(c, "AchievementGroupSpacing", 10, "=")
	R.set_value(c, "MenuZombieSoundDelayMin", 5, "=")
	R.set_value(c, "MenuZombieSoundDelayRandom", 5, "=")
	R.set_value(c, "MenuJetDelayMin", 7, "=")
	R.set_value(c, "MenuJetDelayRandom", 13, "=")
	R.set_value(c, "MenuExplosionDelayMin", 2, "=")
	R.set_value(c, "MenuExplosionDelayRandom", 2, "=")
	R.set_value(c, "MenuExtraExplosionDelayMin", 0.25, "=")
	R.set_value(c, "MenuExtraExplosionDelayRandom", 0.3, "=")
	R.set_value(c, "Confirmation_DeleteSaveGame", 0, "=")
	R.set_value(c, "Confirmation_StoryMode", 1, "=")
	R.set_value(c, "Confirmation_StoryHardcoreMode", 2, "=")
	R.set_value(c, "Confirmation_Abort", 3, "=")
	R.set_value(c, "Confirmation_NewPattern", 4, "=")
	R.set_value(c, "Confirmation_LoadPattern", 5, "=")
	R.set_value(c, "Confirmation_NewArea", 6, "=")
	R.set_value(c, "Confirmation_LoadArea", 7, "=")
	R.set_value(c, "Confirmation_NewCampaign", 8, "=")
	R.set_value(c, "Confirmation_LoadCampaign", 9, "=")
	R.set_value(c, "Confirmation_OverwriteFile", 10, "=")
	R.set_value(c, "Confirmation_ApplyPattern", 11, "=")
	R.set_value(c, "Confirmation_ApplyArea", 12, "=")
	R.set_value(c, "Confirmation_DeletePatterns", 13, "=")
	R.set_value(c, "Confirmation_DeleteAreas", 14, "=")
	R.set_value(c, "Confirmation_LoadUserCampaign", 15, "=")
	R.set_value(c, "Confirmation_ConfirmSave", 16, "=")
	R.set_value(c, "Confirmation_DeleteAreaGroup", 17, "=")
	R.set_value(c, "Confirmation_ClearObjects", 18, "=")
	R.set_value(c, "Confirmation_DeleteFile", 19, "=")
	R.set_value(c, "MenuState_None", 0, "=")
	R.set_value(c, "MenuState_Main", 1, "=")
	R.set_value(c, "MenuState_GameModes", 2, "=")
	R.set_value(c, "MenuState_Options", 3, "=")
	R.set_value(c, "MenuState_Achievements", 4, "=")
	R.set_value(c, "MenuState_Highscores", 5, "=")
	R.set_value(c, "MenuState_Credits", 6, "=")
	R.set_value(c, "MenuState_InGame", 7, "=")
	R.set_value(c, "MenuState_UserCampaigns", 8, "=")
	R.set_value(c, "MenuState_LoadNGFile", 9, "=")
	R.set_value(c, "MenuState_ContentPanel", 10, "=")
	R.set_value(c, "MenuState_UserCampaignProperties", 11, "=")
	R.set_value(c, "MenuState_All", 12, "=")
	R.set_value(c, "SpecialDay_None", 0, "=")
	R.set_value(c, "SpecialDay_Friday13th", 1, "=")
	R.set_value(c, "SpecialDay_NewYear", 2, "=")
	R.set_value(c, "SpecialDay_MartinLutherKingDay", 3, "=")
	R.set_value(c, "SpecialDay_MardiGras", 4, "=")
	R.set_value(c, "SpecialDay_ValentinesDay", 5, "=")
	R.set_value(c, "SpecialDay_SaintPatricksDay", 6, "=")
	R.set_value(c, "SpecialDay_Easter", 7, "=")
	R.set_value(c, "SpecialDay_AprilsFool", 8, "=")
	R.set_value(c, "SpecialDay_CincoDeMayo", 9, "=")
	R.set_value(c, "SpecialDay_MothersDay", 10, "=")
	R.set_value(c, "SpecialDay_FathersDay", 11, "=")
	R.set_value(c, "SpecialDay_WatermelonDay", 14, "=")
	R.set_value(c, "SpecialDay_LaborDay", 15, "=")
	R.set_value(c, "SpecialDay_Halloween", 17, "=")
	R.set_value(c, "SpecialDay_ThanksGiving", 18, "=")
	R.set_value(c, "SpecialDay_Christmas", 19, "=")
	R.set_value(c, "SpecialDay_MadnessDay", 21, "=")
	R.set_value(c, "SpecialDay_PicoDay", 22, "=")
	R.set_value(c, "SpecialDay_RobotDay", 23, "=")
	R.set_value(c, "Sorting_Yours", 0, "=")
	R.set_value(c, "Sorting_Recent", 1, "=")
	R.set_value(c, "Sorting_Best", 2, "=")
	R.set_value(c, "Sorting_Worst", 3, "=")
	R.set_value(c, "Sorting_Unrated", 4, "=")
	R.set_value(c, "Sorting_Random", 5, "=")
	R.set_value(c, "CampaignPropertyPage_General", 1, "=")
	R.set_value(c, "CampaignPropertyPage_Weapons", 2, "=")
	R.set_value(c, "CampaignPropertyPage_Controls", 3, "=")
	R.set_value(c, "MinVoiceOverSFXMix", 0.5, "=")
	R.set_value(c, "MaxVoiceOverSFXMix", 0.25, "=")
	R.set_value(c, "MenuItemSlide", 350, "=")
	R.set_value(c, "MenuPanelItemSlide", 700, "=")
	R.set_value(c, "MenuSlideTime", 0.13, "=")
	R.set_value(c, "MenuSlideDelay", 0.02, "=")
	R.set_value(c, "ReferenceResX", 600, "=")
	R.set_value(c, "ReferenceResY", 400, "=")
	R.set_value(c, "PauseType_Generic", 0, "=")
	R.set_value(c, "PauseType_Abort", 1, "=")
	R.set_value(c, "PauseType_Upgrade", 2, "=")
	R.set_value(c, "PauseType_LostFocus", 3, "=")
	R.set_value(c, "m_MovieClipsHash", R.construct(R.resolve(c, "Object", "RDGame"), []), "=")
	R.set_value(c, "m_EntitiesHash", R.construct(R.resolve(c, "Object", "RDGame"), []), "=")
	R.set_value(c, "m_iEntitiesUsed", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_PlayerInfo"] = R.coerce(null, "RDPlayerInfo")
	(c).fields["m_MasterSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_MusicSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_VoiceSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_CinematicVoiceSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_CrucialVoiceSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_GameSFXSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_InterfaceSFXSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_CrucialSFXSoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_SoundParamsLoud"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsSuperLoud"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsVoice"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsCarSound"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsMilitaryGun"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsQuiet"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsVeryQuiet"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_SoundParamsFarQuiet"] = R.coerce(null, "DTSpacialSoundParams")
	(c).fields["m_World"] = R.coerce(null, "RDWorld")
	(c).fields["m_WorldLayer"] = R.coerce(null, "MovieClip")
	(c).fields["m_HudLayer"] = R.coerce(null, "MovieClip")
	(c).fields["m_BorderLayer"] = R.coerce(null, "MovieClip")
	(c).fields["m_Hud"] = R.coerce(null, "RDHud")
	(c).fields["m_GameModeDriverSelection"] = R.coerce(null, "RDGameModeDriverSelection")
	(c).fields["m_GameModeStory"] = R.coerce(null, "RDGameModeStory")
	(c).fields["m_GameModeHardcore"] = R.coerce(null, "RDGameModeHardcore")
	(c).fields["m_GameModeTime"] = R.coerce(null, "RDGameModeTime")
	(c).fields["m_GameModeMilitary"] = R.coerce(null, "RDGameModeMilitary")
	(c).fields["m_GameModeDistance"] = R.coerce(null, "RDGameModeDistance")
	(c).fields["m_GameModeChopperRescue"] = R.coerce(null, "RDGameModeChopperRescue")
	(c).fields["m_GameModeChopperRescueSandbox"] = R.coerce(null, "RDGameModeChopperRescueSandbox")
	(c).fields["m_GameModeMutant"] = R.coerce(null, "RDGameModeMutant")
	(c).fields["m_GameModeSandbox"] = R.coerce(null, "RDGameModeSandbox")
	(c).fields["m_GameModeEditor"] = R.coerce(null, "RDGameModeEditor")
	(c).fields["m_GameModeCustom"] = R.coerce(null, "RDGameModeCustom")
	(c).fields["m_CurrentGameMode"] = R.coerce(null, "RDGameMode")
	(c).fields["m_CustomMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_MenuMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_TenseMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_GameMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_HighwayMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_Flash"] = R.coerce(null, "MovieClip")
	(c).fields["m_fFlashDuration"] = float(NAN)
	(c).fields["m_fFlashTime"] = float(NAN)
	(c).fields["m_fFlashOpacity"] = float(NAN)
	(c).fields["m_bFlashFadeOut"] = false
	(c).fields["m_ErrorSound"] = R.coerce(null, "DTSound")
	(c).fields["m_InterfaceSound"] = R.coerce(null, "DTSound")
	(c).fields["m_ButtonSound"] = R.coerce(null, "DTSound")
	(c).fields["m_CityAmbianceSound"] = R.coerce(null, "DTSound")
	(c).fields["m_PaperSounds"] = R.coerce(null, "SequentialArray")
	(c).fields["m_EngineSound"] = R.coerce(null, "DTSound")
	(c).fields["m_PassBySound"] = R.coerce(null, "DTSound")
	(c).fields["m_TireSound"] = R.coerce(null, "DTSound")
	(c).fields["m_MessageBox"] = R.coerce(null, "MovieClip")
	(c).fields["m_MessageBoxes"] = R.coerce(null, "Array")
	(c).fields["m_ConfirmationDialog"] = R.coerce(null, "MovieClip")
	(c).fields["m_iConfirmedItem"] = R.coerce(0, "int")
	(c).fields["m_ToolTip"] = R.coerce(null, "MovieClip")
	(c).fields["m_ToolTipTarget"] = R.coerce(null, "DisplayObject")
	(c).fields["m_fToolTipTargetX"] = float(NAN)
	(c).fields["m_fToolTipTargetY"] = float(NAN)
	(c).fields["m_fToolTipMouseX"] = float(NAN)
	(c).fields["m_fToolTipMouseY"] = float(NAN)
	(c).fields["m_fToolTipTimer"] = float(NAN)
	(c).fields["m_Menu"] = R.coerce(null, "MovieClip")
	(c).fields["m_AchievementItems"] = R.coerce(null, "Array")
	(c).fields["m_fAchievementScrollHeight"] = float(NAN)
	(c).fields["m_fAchievementsScroll"] = float(NAN)
	(c).fields["m_fAchievementsScrollSpeed"] = float(NAN)
	(c).fields["m_fAchievementItemPosY"] = float(NAN)
	(c).fields["m_iEditedKey"] = R.coerce(0, "int")
	(c).fields["m_MenuZombieSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_fMenuZombieSoundTimer"] = float(NAN)
	(c).fields["m_MenuZombieSound"] = R.coerce(null, "DTSound")
	(c).fields["m_iLastDeathType"] = R.coerce(0, "int")
	(c).fields["m_VoiceOverSFXMix"] = R.coerce(null, "DTSoundGroupMix")
	(c).fields["m_bIsFemale"] = false
	(c).fields["m_bLastIsFemale"] = false
	(c).fields["m_ActiveMode"] = R.coerce(null, "RDGameMode")
	(c).fields["m_CinematicTransitionGameMode"] = R.coerce(null, "RDGameMode")
	(c).fields["m_DynamicMenuInfos"] = R.coerce(null, "RandomHat")
	(c).fields["m_bMenuMoving"] = false
	(c).fields["m_fMenuJetTimer"] = float(NAN)
	(c).fields["m_DynamicMenuJetInfo"] = R.coerce(null, "Array")
	(c).fields["m_MenuJets"] = R.coerce(null, "RandomHat")
	(c).fields["m_MenuJetSound"] = R.coerce(null, "DTSound")
	(c).fields["m_fMenuExplosionTimer"] = float(0)
	(c).fields["m_MenuExplosions"] = R.coerce(null, "RandomHat")
	(c).fields["m_MenuExplosionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_iMenuExplosionCount"] = R.coerce(0, "int")
	(c).fields["m_iPendingMenuState"] = R.coerce(0, "int")
	(c).fields["m_iPreviousMenuState"] = R.coerce(0, "int")
	(c).fields["m_iMenuState"] = R.coerce(0, "int")
	(c).fields["m_iSpecialDay"] = R.coerce(0, "int")
	(c).fields["m_fPrePauseDeltaTime"] = float(NAN)
	(c).fields["m_fFPS"] = float(0)
	(c).fields["m_PauseSound"] = R.coerce(null, "DTSound")
	(c).fields["m_iPauseType"] = R.coerce(0, "int")
	(c).fields["m_EntityFactory"] = R.coerce(null, "RDEntityFactory")
	(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_iContentLink"] = R.coerce(0, "int")
	(c).fields["m_fContentLinkTimer"] = float(NAN)
	(c).fields["m_iSurvivalGuidePage"] = R.coerce(1, "int")
	(c).fields["m_iSurvivalGuideTablePage"] = R.coerce(0, "int")
	(c).fields["m_SurvivalGuideTableItems"] = R.coerce(null, "Array")
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_CinematicMouth"] = R.coerce(null, "MovieClip")
	(c).fields["m_CinematicVoice"] = R.coerce(null, "DTSound")
	(c).fields["m_CinematicPerlinScene"] = R.coerce(null, "MovieClip")
	(c).fields["m_fCinematicPerlinSceneSpeed"] = float(NAN)
	(c).fields["m_fCinematicPerlinSceneAmplitude"] = float(NAN)
	(c).fields["m_fCinematicPerlinSceneStartX"] = float(NAN)
	(c).fields["m_fCinematicPerlinSceneStartY"] = float(NAN)
	(c).fields["m_fCinematicPerlinScenePerlinX"] = float(0)
	(c).fields["m_fCinematicPerlinScenePerlinY"] = float(0)
	(c).fields["m_bPlayFromEditor"] = false
	(c).fields["m_UserCampaignsPanelSlots"] = R.coerce(null, "Array")
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(0, "int")
	(c).fields["m_iUserCampaignsPage"] = R.coerce(0, "int")
	(c).fields["m_SaveFile"] = R.coerce(null, "SaveFile")
	(c).fields["m_LoadedFiles"] = R.coerce(null, "Array")
	(c).fields["_query"] = R.coerce(null, "SaveQuery")
	(c).fields["_queryResults"] = R.coerce([], "Array")
	(c).fields["m_iLoadFileIndex"] = R.coerce(0, "int")
	(c).fields["m_iPendingUserCampaignIndex"] = R.coerce(0, "int")
	(c).fields["m_NGUserFileID"] = R.coerce(0, "int")
	(c).fields["m_PendingLoadedFile"] = R.coerce(null, "SaveFile")
	(c).fields["m_LoadedFile"] = R.coerce(null, "SaveFile")
	(c).fields["m_bLoadedFileRated"] = false
	(c).fields["m_bLoadedFileOwned"] = false
	(c).fields["m_RatedFile"] = R.coerce(null, "SaveFile")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	(c).fields["m_bFullscreen"] = false
	(c).fields["m_iCampaignPropertyPage"] = R.coerce(0, "int")
	(c).fields["m_CampaignInfo"] = R.coerce(null, "RDCampaignInfo")
	(c).fields["m_fWaitingForAPITimer"] = float(0)
	return null
