extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func c1037_f_StopShake(c: Variant, a: Array) -> Variant:
	var v_shake: Variant = null
	var v_i: Variant = 0
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_fFadeOutDuration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_shake = R.coerce(null, "RDCameraShake")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Shakes"), "length"))):
		pass
		v_shake = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Shakes"), v_i), R.klass("RDCameraShake")), "RDCameraShake")
		if R.truth(R.binary("==", (v_shake).fields.get("m_szShakeName"), v_szName)):
			pass
			(v_shake).fields["m_fShakeDuration"] = float(0)
			(v_shake).fields["m_fShakeFadeInDuration"] = float(0)
			(v_shake).fields["m_fShakeFadeOutDuration"] = float(v_fFadeOutDuration)
			(v_shake).fields["m_fShakeTimer"] = float(0)
		v_i = R.signed32(v_i + 1)
	return null


static func c1037_f_Unproject2DToDir3D(c: Variant, a: Array) -> Variant:
	var v_fStepX: Variant = NAN
	var v_fStepY: Variant = NAN
	var v_iX: Variant = 0
	var v_iY: Variant = 0
	var v_fRatioX: Variant = NAN
	var v_fRatioY: Variant = NAN
	var v_vTopLeft: Variant = null
	var v_vTopRight: Variant = null
	var v_vBottomLeft: Variant = null
	var v_vBottomRight: Variant = null
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	var v_vOut: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	(v_vLocation).fields["X"] = R.coerce(R.call_static("Maths", "Clamp", [(v_vLocation).fields.get("X"), 0, (float(((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(1))]), "Number")
	(v_vLocation).fields["Y"] = R.coerce(R.call_static("Maths", "Clamp", [(v_vLocation).fields.get("Y"), 0, (float(((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHeight")) - float(1))]), "Number")
	v_fStepX = float(R.binary("/", ((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iWidth"), (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))))
	v_fStepY = float(R.binary("/", ((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHeight"), (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))))
	v_iX = R.coerce(R.call_static("Maths", "Clamp", [floorf(float(R.binary("/", (v_vLocation).fields.get("X"), v_fStepX))), 0, (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))]), "int")
	v_iY = R.coerce(R.call_static("Maths", "Clamp", [floorf(float(R.binary("/", (v_vLocation).fields.get("Y"), v_fStepY))), 0, (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))]), "int")
	v_fRatioX = float(R.binary("/", (float((v_vLocation).fields.get("X")) - float((float(v_iX) * float(v_fStepX)))), v_fStepX))
	v_fRatioY = float(R.binary("/", (float((v_vLocation).fields.get("Y")) - float((float(v_iY) * float(v_fStepY)))), v_fStepY))
	v_vTopLeft = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float(v_iY) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float(v_iX))), "DTVector3D")
	v_vTopRight = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float(v_iY) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float((float(v_iX) + float(1))))), "DTVector3D")
	v_vBottomLeft = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float((float(v_iY) + float(1))) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float(v_iX))), "DTVector3D")
	v_vBottomRight = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float((float(v_iY) + float(1))) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float((float(v_iX) + float(1))))), "DTVector3D")
	((c).fields.get("m_vTopBlend")).fields["X"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("X")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("X"))))))
	((c).fields.get("m_vTopBlend")).fields["Y"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("Y")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("Y"))))))
	((c).fields.get("m_vTopBlend")).fields["Z"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("Z")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("Z"))))))
	((c).fields.get("m_vBottomBlend")).fields["X"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("X")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("X"))))))
	((c).fields.get("m_vBottomBlend")).fields["Y"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("Y")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("Y"))))))
	((c).fields.get("m_vBottomBlend")).fields["Z"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("Z")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("Z"))))))
	(v_vOut).fields["X"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("X")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("X"))))))
	(v_vOut).fields["Y"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("Y")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("Y"))))))
	(v_vOut).fields["Z"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("Z")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("Z"))))))
	R.call_member(v_vOut, "Normalize", [])
	return null


static func c1038_f_RDCameraEditor(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCameraEditor"), [])
	c.fields["m_fMaxViewDistance"] = float(150)
	c.fields["m_fRampDistance"] = float(300)
	c.fields["m_fRampFactor"] = float(R.binary("/", 3500, c.fields.get("m_fRampDistance")))
	return null


static func c1038_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = float(R.static_value("RDCameraEditor", "CamHeight"))
	R.invoke(R.get_value(c.fields.get("m_RotationMatrix"), "identity"), [])
	R.invoke(R.get_value(c.fields.get("m_RotationMatrix"), "appendRotation"), [R.unary("-", (c.fields.get("m_vRotation")).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
	c.fields["m_fRelativeLocationX"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	return null


static func c1063_f_Debug(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.assign(c, "m_szDebug", "RDGame", R.binary("+", v_szText, "\n"), "+=")
	return null


static func c1063_f_OutputDebug(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "trace", "RDGame"), [R.static_value("RDGame", "m_szDebug")])
	return null


static func c1063_f_ClearDebug(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_szDebug", "RDGame", "", "=")
	return null


static func c1063_f_GetMC(c: Variant, a: Array) -> Variant:
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


static func c1063_f_GetEntity(c: Variant, a: Array) -> Variant:
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


static func c1063_f_Init(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnAPIConnected(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member(c, "DoStartGame", [])
	return null


static func c1063_f_ScaleAndCache(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.set_value(R.get_value(R.get_value(v_mc, "Content"), "Content"), "scaleX", 2, "=")
	R.set_value(R.get_value(R.get_value(v_mc, "Content"), "Content"), "scaleY", 2, "=")
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(v_mc, "Content")])
	R.set_value(R.get_value(v_mc, "Content"), "scaleX", 0.5, "=")
	R.set_value(R.get_value(v_mc, "Content"), "scaleY", 0.5, "=")
	return null


static func c1063_f_EndCinematic(c: Variant, a: Array) -> Variant:
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


static func c1063_f_PlayMenuExplosionSound(c: Variant, a: Array) -> Variant:
	var v_explosionSound: Variant = null
	v_explosionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MenuExplosionSounds"), "GetRandomValue", []), R.klass("DTSound")), "DTSound")
	R.call_member(v_explosionSound, "Play", [])
	return null


static func c1063_f_OnMouseDown(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnMouseWheel"), [v_event])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnMouseWheel", [v_event])
	return null


static func c1063_f_OnArmorGamesScoreBoardClose(c: Variant, a: Array) -> Variant:
	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
	return null


static func c1063_f_OnMouseUp(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnKeyDown(c: Variant, a: Array) -> Variant:
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


static func c1063_f_KeyIsAlreadyUsed(c: Variant, a: Array) -> Variant:
	var v_iEditedKey: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPressedKey: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return ((((((((((((float(v_iEditedKey) != float(1)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iLeftKey")))) or ((float(v_iEditedKey) != float(2)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iRightKey"))))) or ((float(v_iEditedKey) != float(3)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iAccelKey"))))) or ((float(v_iEditedKey) != float(4)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iBrakeKey"))))) or ((float(v_iEditedKey) != float(5)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iHandbrakeKey"))))) or ((float(v_iEditedKey) != float(6)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iHornKey"))))) or ((float(v_iEditedKey) != float(7)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iSwitchDriverKey"))))) or ((float(v_iEditedKey) != float(8)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iReloadKey"))))) or ((float(v_iEditedKey) != float(9)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iPrevWeaponKey"))))) or ((float(v_iEditedKey) != float(10)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iNextWeaponKey"))))) or ((float(v_iEditedKey) != float(11)) and (float(v_iPressedKey) == float(((c).fields.get("m_PlayerInfo")).fields.get("m_iPauseKey")))))
	return null


static func c1063_f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnKeyUp"), [v_event])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnKeyUp", [v_event])
	return null


static func c1063_f_AddEntity(c: Variant, a: Array) -> Variant:
	var v_entityToAdd: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.call_member((c).fields.get("m_World"), "AddEntity", [v_entityToAdd, v_fX, v_fY, v_fZ])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnEntityAdded", [v_entityToAdd])
	return null


static func c1063_f_CompleteAchievement(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnMessageBoxSlideInStart(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_InterfaceSound"), "Play", [])
	return null


static func c1063_f_OnMessageBoxSlideInDone(c: Variant, a: Array) -> Variant:
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_MessageBox"), 1, {"alpha": 0, "delay": 2.5, "onComplete": R.get_value(c, "OnMessageBoxSlideOutDone"), "ease": R.get_value(R.klass("gs.easing.Quart"), "easeIn")}])
	return null


static func c1063_f_OnMessageBoxSlideOutDone(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("m_MessageBox"), "visible", false, "=")
	return null


static func c1063_f_ShowMessageBox(c: Variant, a: Array) -> Variant:
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


static func c1063_f_ShowConfirmation(c: Variant, a: Array) -> Variant:
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


static func c1063_f_HideConfirmation(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("m_ConfirmationDialog"), "visible", false, "=")
	return null


static func c1063_f_OnConfirmationYes(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnConfirmationNo(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_Abort")))):
		pass
		(c).fields["m_iPauseType"] = R.coerce(R.static_value("RDGame", "PauseType_Generic"), "int")
		R.call_member(c, "SetPause", [false])
	R.call_member(c, "HideConfirmation", [])
	return null


static func c1063_f_ResetStoryMode(c: Variant, a: Array) -> Variant:
	((c).fields.get("m_PlayerInfo")).fields["m_iStoryLevel"] = R.coerce(0, "int")
	((c).fields.get("m_PlayerInfo")).fields["m_fStoryProgress"] = float(0)
	(((c).fields.get("m_PlayerInfo")).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = false
	(((c).fields.get("m_PlayerInfo")).fields.get("m_MountedMG")).fields["m_bUnlocked"] = false
	return null


static func c1063_f_OnConfirmationNew(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_StoryMode")))):
		pass
		R.call_member(c, "ResetStoryMode", [])
		(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeStory"), "RDGameMode")
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "StartCinematic", ["GameIntro", false])
	R.call_member(c, "HideConfirmation", [])
	return null


static func c1063_f_OnConfirmationResume(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iConfirmedItem")) == float(R.static_value("RDGame", "Confirmation_StoryMode")))):
		pass
		(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeStory"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	R.call_member(c, "HideConfirmation", [])
	return null


static func c1063_f_AddAchievementSection(c: Variant, a: Array) -> Variant:
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


static func c1063_f_AddAchievementRange(c: Variant, a: Array) -> Variant:
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


static func c1063_f_AddAchievementGroupSpacing(c: Variant, a: Array) -> Variant:
	(c).fields["m_fAchievementItemPosY"] = R.coerce(R.binary("+", (c).fields.get("m_fAchievementItemPosY"), R.static_value("RDGame", "AchievementGroupSpacing")), "Number")
	return null


static func c1063_f_ToggleQuality(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetQuality", [R.binary("%", (float(((c).fields.get("m_PlayerInfo")).fields.get("m_iQuality")) + float(1)), 3)])
	return null


static func c1063_f_SetQuality(c: Variant, a: Array) -> Variant:
	var v_iQuality: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	((c).fields.get("m_PlayerInfo")).fields["m_iQuality"] = R.coerce(v_iQuality, "int")
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SetZombieTintsOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bZombieTints"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SetFullscreen(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bFullscreen"] = v_bOn
	R.set_value(R.get_value(c.fields.get("m_RootMC"), "stage"), "displayState", (R.get_value(R.resolve(c, "StageDisplayState", "RDGame"), "FULL_SCREEN_INTERACTIVE") if R.truth((c).fields.get("m_bFullscreen")) else R.get_value(R.resolve(c, "StageDisplayState", "RDGame"), "NORMAL")), "=")
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SetMusicOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bMusic"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SetSoundsOn(c: Variant, a: Array) -> Variant:
	var v_bOn: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_PlayerInfo")).fields["m_bSound"] = v_bOn
	R.call_member(c, "SavePlayerInfo", [])
	R.call_member(c, "ApplyOptions", [])
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SelectKey(c: Variant, a: Array) -> Variant:
	var v_iKey: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iEditedKey"] = R.coerce(v_iKey, "int")
	R.call_member(c, "UpdateOptionsPanel", [])
	return null


static func c1063_f_SetHighScoreMode(c: Variant, a: Array) -> Variant:
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


static func c1063_f_DeleteSaveGame(c: Variant, a: Array) -> Variant:
	R.call_member(c, "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteSaveGame")])
	return null


static func c1063_f_PlayErrorSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_ErrorSound"), "Play", [])
	return null


static func c1063_f_PlayInterfaceSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_InterfaceSound"), "Play", [])
	return null


static func c1063_f_PlayButtonSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_ButtonSound"), "Play", [])
	return null


static func c1063_f_OnLostFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnLostFocus"), [v_evt])
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnLostFocus", [])
	return null


static func c1063_f_OnGotFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGame"), "OnGotFocus"), [v_evt])
	R.call_member(c.fields.get("m_FocusManager"), "setFocus", [R.get_value(c.fields.get("m_RootMC"), "stage")])
	return null


static func c1063_f_FormatDistanceScoreCallback(c: Variant, a: Array) -> Variant:
	var v_score: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", v_score, 10)]), 100), " KM")
	return null


static func c1063_f_CanPause(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.logical_and(R.truth((c).fields.get("m_CurrentGameMode")), func(): return R.call_member((c).fields.get("m_CurrentGameMode"), "CanPause", [])), func(): return R.call_member(((c).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "CanPause", []))
	return null


static func c1063_f_PlayCustomPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	(c).fields["m_bPlayFromEditor"] = true
	(c).fields["m_CustomPatternData"] = R.coerce(v_patternData, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null


static func c1063_f_PlayCustomArea(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	(c).fields["m_bPlayFromEditor"] = true
	(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(v_areaData, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null


static func c1063_f_PlayCustomCampaign(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bFromEditor: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	(c).fields["m_bPlayFromEditor"] = v_bFromEditor
	(c).fields["m_CustomPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_CustomCampaignData"] = R.coerce(v_campaignData, "ByteArray")
	(c).fields["m_ActiveMode"] = R.coerce((c).fields.get("m_GameModeCustom"), "RDGameMode")
	R.call_member(c, "StartGameMode", [(c).fields.get("m_GameModeDriverSelection")])
	return null


static func c1063_f_ShowSurvivalGuide(c: Variant, a: Array) -> Variant:
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


static func c1063_f_GetNextSurvivalPage(c: Variant, a: Array) -> Variant:
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


static func c1063_f_GetPreviousSurvivalPage(c: Variant, a: Array) -> Variant:
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


static func c1063_f_UpdateSurvivalGuideNavigation(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Next"), "visible", R.binary("!=", R.call_member(c, "GetNextSurvivalPage", []), R.static_value("RDUnlockData", "Survival_Max")), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "SurvivalGuide"), "Previous"), "visible", R.binary("!=", R.call_member(c, "GetPreviousSurvivalPage", []), 0), "=")
	return null


static func c1063_f_UpdateSurvivalGuideTable(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnSurvivalTableItemDown(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnSurvivalTableItemOver(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(R.get_value(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "Underline"), "visible", true, "=")
	return null


static func c1063_f_OnSurvivalTableItemOut(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(R.get_value(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "Underline"), "visible", false, "=")
	return null


static func c1063_f_PlayCinematicVoice(c: Variant, a: Array) -> Variant:
	var v_voiceClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_mouthMC: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	(c).fields["m_CinematicMouth"] = R.coerce(v_mouthMC, "MovieClip")
	(c).fields["m_CinematicVoice"] = R.coerce(R.construct(R.klass("DTSound"), [v_voiceClass, (c).fields.get("m_CinematicVoiceSoundGroup"), true]), "DTSound")
	R.call_member((c).fields.get("m_CinematicVoice"), "Play", [])
	return null


static func c1063_f_SetCinematicMouth(c: Variant, a: Array) -> Variant:
	var v_mouthMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	(c).fields["m_CinematicMouth"] = R.coerce(v_mouthMC, "MovieClip")
	return null


static func c1063_f_SetCinematicPerlinScene(c: Variant, a: Array) -> Variant:
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


static func c1063_f_ResetFocus(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_FocusManager"), "setFocus", [null])
	return null


static func c1063_f_InitUserCampaignsPanel(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnArmorGamesShareListClose(c: Variant, a: Array) -> Variant:
	R.call_member(c, "GoToMenuState", [R.static_value("RDGame", "MenuState_Main")])
	return null


static func c1063_f_OnArmorGamesCampaignClocked(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_data, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "name")])
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "data")])
	else:
		pass
		R.invoke(R.resolve(c, "trace", "RDGame"), [R.get_value(v_data, "error")])
	return null


static func c1063_f_RegisterKongregateListeners(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c.fields.get("m_KongregateAPI"), "sharedContent"), "addLoadListener"), ["Campaign", R.get_value(c, "OnKongCampaignLoad")])
	return null


static func c1063_f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth((c).fields.get("m_CurrentGameMode")):
		pass
		R.call_member((c).fields.get("m_CurrentGameMode"), "OnKongCampaignLoad", [v_params])
	return null


static func c1063_f_CancelLoadFiles(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	v_file = R.coerce(null, "SaveFile")
	R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	if R.truth((R.truth((c).fields.get("m_LoadedFiles")) and R.binary("<", (c).fields.get("m_iLoadFileIndex"), R.get_value((c).fields.get("m_LoadedFiles"), "length")))):
		pass
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "SaveFile")
		R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	return null


static func c1063_f_LoadUserCampaigns(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnLoadFilesDone(c: Variant, a: Array) -> Variant:
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


static func c1063_f_LoadFile(c: Variant, a: Array) -> Variant:
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


static func c1063_f_OnFileLoaded(c: Variant, a: Array) -> Variant:
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


static func c1063_f_SetUserCampaignsSorting(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iUserCampaignsSorting"] = R.coerce(v_iSorting, "int")
	return null


static func c1063_f_ShowSortingMenu(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropYours"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRecent"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropBest"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropWorst"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropUnrated"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_Menu"), "UserCampaignsPanel"), "DropRandom"), "visible", v_bShow, "=")
	return null


static func c1063_f_ClearUserCampaignsPanelSlots(c: Variant, a: Array) -> Variant:
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


static func c1063_f_ShowLoadScreen(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_Menu"), "LoadScreen"), "visible", true, "=")
	return null


static func c1063_f_LoadNGUserFile(c: Variant, a: Array) -> Variant:
	var v_m_NGQuery: Variant = null
	R.call_member(c, "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(15)
	v_m_NGQuery = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", ["Campaigns"]), "SaveQuery")
	R.call_member(v_m_NGQuery, "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_ID"), "=", (c).fields.get("m_NGUserFileID")])
	R.call_member(v_m_NGQuery, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnLoadNGUserQueryComplete"), false, 0, true])
	R.call_member(v_m_NGQuery, "execute", [])
	(c).fields["m_NGUserFileID"] = R.coerce(R.unary("-", 1), "int")
	return null


static func c1063_f_OnLoadNGUserQueryComplete(c: Variant, a: Array) -> Variant:
	var v_queryResults: Variant = null
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v_queryResults = R.coerce(R.get_value(R.get_value(v_e, "data"), "files"), "Array")
	if R.truth((R.truth(v_queryResults) and R.binary(">", R.get_value(v_queryResults, "length"), 0))):
		pass
		(c).fields["m_PendingLoadedFile"] = R.coerce(R.get_value(v_queryResults, 0), "SaveFile")
		R.call_member((c).fields.get("m_PendingLoadedFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnNGUserFileLoaded"), false, 0, true])
		R.call_member((c).fields.get("m_PendingLoadedFile"), "load", [])
	return null


static func c1063_f_OnNGUserFileLoaded(c: Variant, a: Array) -> Variant:
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


static func c1063_f_RateFile(c: Variant, a: Array) -> Variant:
	var v_iRating: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((c).fields.get("m_LoadedFile")):
		pass
		R.call_member(c, "ShowLoadScreen", [])
		(c).fields["m_fAPITimeoutTimer"] = float(10)
		(c).fields["m_RatedFile"] = R.coerce((c).fields.get("m_LoadedFile"), "SaveFile")
		R.call_member((c).fields.get("m_RatedFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete"), false, 0, true])
		R.call_member((c).fields.get("m_RatedFile"), "sendVote", ["Rating", v_iRating])
	return null


static func c1063_f_OnRateComplete(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	R.call_member((c).fields.get("m_RatedFile"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete")])
	(c).fields["m_RatedFile"] = R.coerce(null, "SaveFile")
	R.call_member(c, "HideLoadScreen", [])
	(c).fields["m_bLoadedFileRated"] = true
	return null


static func c1063_f_OnTimelineEvent(c: Variant, a: Array) -> Variant:
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


static func c1063_f_LoadCampaignProperties(c: Variant, a: Array) -> Variant:
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


static func c1063_f_SetCampaignPropertyPanel(c: Variant, a: Array) -> Variant:
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


static func c1063_f_SetupProperty(c: Variant, a: Array) -> Variant:
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


static func c1063_f_EnableProperty(c: Variant, a: Array) -> Variant:
	var v_propertyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bEnabled: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bMouseChildren: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.set_value(v_propertyMC, "mouseEnabled", false, "=")
	R.set_value(v_propertyMC, "mouseChildren", false, "=")
	R.set_value(v_propertyMC, "alpha", (1 if R.truth(v_bEnabled) else 0.75), "=")
	return null


static func c1063_f_GetArmorGamesScoreTypes(c: Variant, a: Array) -> Variant:
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


static func c1064_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1064_f_GoToMainMenu(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
	return null


static func c1064_f_ToggleQuality(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "ToggleQuality", [])
	return null


static func c1064_f_HasNextLevel(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1064_f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return ""
	return null


static func c1064_f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return 0
	return null


static func c1064_f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return ""
	return null


static func c1064_f_HasActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_GetSavedLevel(c: Variant, a: Array) -> Variant:
	return 0
	return null


static func c1064_f_IsInCinematic(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_CanPause(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_GetUnlimitedSpawning(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_CanCallChopperSupport(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_CanShowHud(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_IsChopperMode(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_CanHaveExplodingCars(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1064_f_CanSpawnHiddenSoldier(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_AreWeaponsEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1064_f_InvincibleHellfireEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_HasRocketLauncher(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1064_f_HasMountedMG(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1065_f_RDGameModeChopperRescue(c: Variant, a: Array) -> Variant:
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


static func c1065_f_StartGameMode(c: Variant, a: Array) -> Variant:
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


static func c1065_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "BeginGameMode"), [])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill01"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill02"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill03"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill04"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ZombieKillSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CivilianBuildingKill05"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")])])
	return null


static func c1065_f_EndGameMode(c: Variant, a: Array) -> Variant:
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


static func c1065_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
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


static func c1065_f_UpdateChopperMovement(c: Variant, a: Array) -> Variant:
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


static func c1065_f_MoveChopperNoise(c: Variant, a: Array) -> Variant:
	var v_fTime: Variant = NAN
	var v_fExtent: Variant = NAN
	v_fTime = float((float(0.2) + float((float(randf()) * float(0.2)))))
	v_fExtent = float(0.5)
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_ChopperNoiseMC"), v_fTime, {"m_fChopperNoiseX": R.binary("+", R.unary("-", v_fExtent), (float((float(randf()) * float(2))) * float(v_fExtent))), "ease": R.get_value(R.klass("gs.easing.Linear"), "easeInOut")}])
	R.call_static("gs.TweenLite", "to", [(c).fields.get("m_ChopperNoiseMC"), v_fTime, {"m_fChopperNoiseZ": R.binary("+", R.unary("-", v_fExtent), (float((float(randf()) * float(2))) * float(v_fExtent))), "ease": R.get_value(R.klass("gs.easing.Linear"), "easeInOut"), "onComplete": R.get_value(c, "MoveChopperNoise")}])
	return null


static func c1065_f_GetRescueBuilding(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	if R.truth(R.binary(">=", v_i, R.get_value(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_SafeZones"), "length"))):
		pass
		return null
	return R.binary("as", R.get_value(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_SafeZones"), v_i), R.klass("RDBuildingNew"))
	return null


static func c1065_f_SetState(c: Variant, a: Array) -> Variant:
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


static func c1065_f_OnKeyDown(c: Variant, a: Array) -> Variant:
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


static func c1065_f_OnKeyUp(c: Variant, a: Array) -> Variant:
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


static func c1065_f_IsChopperMode(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1065_f_SpawnRescuePattern(c: Variant, a: Array) -> Variant:
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


static func c1065_f_SetChopperSpot(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["m_fChopperSpotX"] = float(v_fX)
	(c).fields["m_fChopperSpotY"] = float(v_fY)
	(c).fields["m_fChopperSpotZ"] = float(v_fZ)
	return null


static func c1065_f_OnBuildingReachedByZombie(c: Variant, a: Array) -> Variant:
	var v_building: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDBuildingNew")
	var v_zombie: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDZombie")
	(c).fields["m_iCiviliansInBuilding"] = R.coerce(maxf(float((float((c).fields.get("m_iCiviliansInBuilding")) - float((v_zombie).fields.get("m_iCivilianEatCount")))), float(0)), "int")
	(c).fields["m_iCiviliansToSave"] = R.coerce(maxf(float((float((c).fields.get("m_iCiviliansToSave")) - float((v_zombie).fields.get("m_iCivilianEatCount")))), float(0)), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "UpdateLocationCivCount", [])
	R.call_member((c).fields.get("m_RescueBuilding"), "PlaySoundOnActor", [R.get_value((c).fields.get("m_ZombieKillSounds"), (c).fields.get("m_iZombieKillSound"))])
	(c).fields["m_iZombieKillSound"] = R.coerce(R.binary("%", (float((c).fields.get("m_iZombieKillSound")) + float(1)), R.get_value((c).fields.get("m_ZombieKillSounds"), "length")), "int")
	return null


static func c1065_f_CanGiveDistanceRP(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1065_f_CanSpawnCivilian(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1065_f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianHit"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null


static func c1065_f_OnCivilianExploded(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianExploded"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null


static func c1065_f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnCivilianShot"), [])
	R.set_value(c, "m_iCiviliansToSave", 1, "-=")
	return null


static func c1065_f_OnCivGetInCar(c: Variant, a: Array) -> Variant:
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


static func c1065_f_GetMaxSpawnZombies(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float(R.static_value("RDGameModeChopperRescue", "MaxSpawnBase")) + float((float(c.fields.get("m_iLevel")) * float(R.static_value("RDGameModeChopperRescue", "MaxSpawnIncrement"))))), 0, 10])
	return null


static func c1065_f_GetSpawnZombiesSide(c: Variant, a: Array) -> Variant:
	return (1 if R.truth((float(((c).fields.get("m_RescueBuilding")).fields.get("m_fRelativeLocationX")) < float(0))) else R.unary("-", 1))
	return null


static func c1065_f_LoadExternalPattern(c: Variant, a: Array) -> Variant:
	var v_mLoader: Variant = null
	var v_mRequest: Variant = null
	(c).fields["m_PatternMCs"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	v_mLoader = R.coerce(R.construct(R.resolve(c, "Loader", "RDGameModeChopperRescue"), []), "Loader")
	v_mRequest = R.coerce(R.construct(R.resolve(c, "URLRequest", "RDGameModeChopperRescue"), ["LevelPatternEditor.swf"]), "URLRequest")
	R.invoke(R.get_value(R.get_value(v_mLoader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onCompleteHandler"), false, 0, true])
	R.invoke(R.get_value(v_mLoader, "load"), [v_mRequest])
	return null


static func c1065_f_onCompleteHandler(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_loadEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "numChildren"))):
		pass
		R.call_member((c).fields.get("m_PatternMCs"), "AddValue", [R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(v_loadEvent, "currentTarget"), "content"), "getChildAt"), [v_i]), R.klass("MovieClip"))])
		v_i = R.signed32(v_i + 1)
	return null


static func c1065_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "OnPlayerFailed"), [v_evt])
	R.call_member(c, "StartFailScreen", [])
	return null


static func c1065_f_StartFailScreen(c: Variant, a: Array) -> Variant:
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


static func c1065_f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Rescue OP", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null


static func c1065_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
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


static func c1065_f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null


static func c1065_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1065_f_CanShowHud(c: Variant, a: Array) -> Variant:
	return ((R.truth(c.fields.get("m_Player")) and R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))) and (float((c).fields.get("m_iCiviliansToSave")) > float(0)))
	return null


static func c1065_f_CanSpawnJet(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1065_f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Rescue OP", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestChopperRescueRescues")])
	return null


static func c1065_f_CanSpawnMutants(c: Variant, a: Array) -> Variant:
	if R.truth((R.unary("!", (c).fields.get("m_bCanSpawnMutants")) or (float(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_iKillableEnemies")) == float(0)))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeChopperRescue"), "CanSpawnMutants"), [])
	return null


static func c1065_f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	return (float(2) + float((float(randf()) * float(15))))
	return null


static func c1065_f_OnMutantSpawned(c: Variant, a: Array) -> Variant:
	(c).fields["m_bCanSpawnMutants"] = false
	return null


static func c1065_f_HasIndependantPlayerControl(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1065_f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return "Civilians Saved"
	return null


static func c1065_f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_iTotalCiviliansSaved")
	return null


static func c1065_f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return ""
	return null


static func c1065_f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1066_f_RDGameModeChopperRescueSandbox(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeChopperRescueSandbox"), [v_theGame])
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
	return null


static func c1067_f_RDGameModeCustom(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeCustom"), [v_theGame])
	c.fields["m_bDoDefaultHighwaySpawning"] = false
	c.fields["m_DistanceScreen"] = R.coerce(R.construct(R.klass("MC_DistanceStatsScreen"), []), "MC_DistanceStatsScreen")
	(c).fields["m_TimeOutSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
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
	c.fields["m_iHelicopterLevel"] = R.coerce(0, "int")
	c.fields["m_iJetLevel"] = R.coerce(0, "int")
	(c).fields["m_ChopperSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingChopper"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNuke"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNukeWave"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	c.fields["m_bAddAutomaticHighwayPerlinNoise"] = false
	return null


static func c1067_f_Reset(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopEndingSounds", [])
	(c).fields["m_bSpawnHighwayRamp"] = true
	(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce(R.unary("-", 1), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "Reset"), [])
	c.fields["m_fLevelStartPosition"] = float(0)
	c.fields["m_fNextPatternSpawnPosition"] = float(0)
	(c).fields["m_fNextChallengeSpawnPosition"] = float(0)
	(c).fields["m_iCurrentChallengeSpawnIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengeIndex"] = R.coerce(0, "int")
	(c).fields["m_fForcedStopTimer"] = float(0)
	(c).fields["m_bDoFirstInit"] = true
	c.fields["m_fJetDelay"] = float(0)
	c.fields["m_fHelicopterDelay"] = float(0)
	c.fields["m_fLevelDifficulty"] = float(1)
	(c).fields["m_fAreaSpeedFactor"] = float(1)
	c.fields["m_fZombieSpeedFactor"] = float(1)
	c.fields["m_fZombieHPFactor"] = float(1)
	c.fields["m_fOilSlipperinessFactor"] = float(1)
	c.fields["m_fImpactSpeedLossFactor"] = float(1)
	c.fields["m_fVehicleHPFactor"] = float(1)
	c.fields["m_bExplodingZombies"] = false
	c.fields["m_bAlwaysCling"] = false
	(c).fields["m_fSpawnRate"] = float(0)
	(c).fields["m_bFUBARMode"] = false
	(c).fields["m_bNoSoldierZombie"] = false
	(c).fields["m_bAllSoldierZombie"] = false
	(c).fields["m_fEndCampaignTimer"] = float(0)
	(c).fields["m_bLavaModeInstantDeath"] = false
	R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengeAreaCounts"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_ChallengePatternCounts"), "splice"), [0])
	(c).fields["m_iChallengePlayerIndex"] = R.coerce(0, "int")
	R.call_member(c, "UpdateNextLevel", [])
	return null


static func c1067_f_StartGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "StartGameMode"), [])
	c.fields["m_iCustomMedShields"] = R.coerce((0 if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedShields")), "int")
	c.fields["m_iCustomMedHeals"] = R.coerce((0 if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedHeals")), "int")
	(c).fields["m_iCampaignAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_bPlayAreaDialog"] = true
	(c).fields["m_fPlayAreaDialogPos"] = float(0)
	(c).fields["m_fDialogPosPatternPos"] = float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))
	(c).fields["m_fDialogTimer"] = float(0)
	(c).fields["m_iLevelCounter"] = R.coerce(0, "int")
	(c).fields["m_fTime"] = float(0)
	(c).fields["m_bFirstLoad"] = true
	(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
	(c).fields["m_iTotalZombiesKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansKilled"] = R.coerce(0, "int")
	(c).fields["m_iTotalCiviliansSaved"] = R.coerce(0, "int")
	return null


static func c1067_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_iChallengeIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_areaPattern: Variant = null
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_music: Variant = null
	v_iChallengeIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_areaPattern = R.coerce(null, "RDPatternInfo")
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "BeginGameMode"), [])
	if R.truth((c).fields.get("m_bFirstLoad")):
		pass
		(c).fields["m_bValidData"] = true
		(c).fields["m_UniquePattern"] = R.coerce((R.construct(R.klass("RDLevelPatternCustomData"), [(c.fields.get("m_Game")).fields.get("m_CustomPatternData")]) if R.truth((c.fields.get("m_Game")).fields.get("m_CustomPatternData")) else null), "RDLevelPatternCustomData")
		if R.truth((c).fields.get("m_UniquePattern")):
			pass
			((c).fields.get("m_UniquePattern")).fields["m_bAllowFlip"] = false
		(c).fields["m_AreaPatterns"] = R.coerce(null, "RandomHat")
		(c).fields["m_CampaignInfo"] = R.coerce(null, "RDCampaignInfo")
		if R.truth((c.fields.get("m_Game")).fields.get("m_CustomAreaData")):
			pass
			R.call_member(c, "LoadCustomAreaPatterns", [(c.fields.get("m_Game")).fields.get("m_CustomAreaData")])
		else:
			pass
			if R.truth((c.fields.get("m_Game")).fields.get("m_CustomCampaignData")):
				pass
				R.call_member(c, "LoadCustomCampaignPatterns", [(c.fields.get("m_Game")).fields.get("m_CustomCampaignData")])
		if R.truth(c.fields.get("m_HillBG")):
			pass
			(c.fields.get("m_HillBG")).fields["m_bUseFog"] = true
		(c.fields.get("m_BG")).fields["m_bUseFog"] = true
		(c).fields["m_bFirstLoad"] = false
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			R.call_member(c, "UpdateChallengePreSpawn", [])
			v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengePlayerIndex"), 20), "int")
			v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
			v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
		else:
			pass
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iCampaignAreaIndex")), "RDAreaInfo")
			R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", (v_areaInfo).fields.get("m_szAreaName")])
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
			R.call_member(c, "UpdateNextLevel", [])
		R.call_member(c.fields.get("m_BG"), "SetHidden", [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
	v_music = R.coerce(R.call_member(c, "GetMusic", []), "DTSound")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [v_music, 0])
	R.set_value(R.get_value(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_HudMC"), "InvalidFileVersionMessage"), "visible", R.unary("!", R.call_member((c.fields.get("m_Game")).fields.get("m_CurrentGameMode"), "UsesValidFileVersion", [])), "=")
	return null


static func c1067_f_LoadCustomAreaPatterns(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternData: Variant = null
	var v_iDataBytes: Variant = 0
	var v_newPattern: Variant = null
	var v_iIconBytes: Variant = 0
	var v_iconData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternData = R.coerce(null, "ByteArray")
	v_iDataBytes = R.coerce(0, "int")
	v_newPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_iIconBytes = R.coerce(0, "int")
	v_iconData = R.coerce(null, "ByteArray")
	(c).fields["m_AreaPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.set_value(v_savedData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			R.invoke(R.get_value(v_savedData, "readInt"), [])
			R.invoke(R.get_value(v_savedData, "readUTF"), [])
			v_patternData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			R.invoke(R.get_value(v_savedData, "readBytes"), [v_patternData, 0, v_iDataBytes])
			v_newPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [v_patternData]), "RDLevelPatternCustomData")
			(v_newPattern).fields["m_bAllowFlip"] = false
			R.call_member((c).fields.get("m_AreaPatterns"), "AddValue", [v_newPattern])
			v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_iconData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value(v_savedData, "readBytes"), [v_iconData, 0, v_iIconBytes])
			v_i = R.signed32(v_i + 1)
	return null


static func c1067_f_LoadCustomCampaignPatterns(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_iNbDialogs: Variant = 0
	var v_t: Variant = 0
	var v_iNbGroups: Variant = 0
	var v_g: Variant = 0
	var v_groupsThatCanBeFirst: Variant = null
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_iNbAreas: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_i = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_iNbDialogs = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_iNbGroups = R.coerce(0, "int")
	v_g = R.coerce(0, "int")
	v_groupsThatCanBeFirst = R.coerce(null, "Array")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_iNbAreas = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
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
		v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_t = R.coerce(0, "int")
		while R.truth((float(v_t) < float(v_iNbDialogs))):
			pass
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
			v_t = R.signed32(v_t + 1)
		((c).fields.get("m_CampaignInfo")).fields["m_Groups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
		v_iNbGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_g = R.coerce(0, "int")
		while R.truth((float(v_g) < float(v_iNbGroups))):
			pass
			v_group = R.coerce(R.construct(R.klass("RDAreaGroup"), []), "RDAreaGroup")
			R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "push"), [v_group])
			(v_group).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
			(v_group).fields["m_iMinLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			(v_group).fields["m_iMaxLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			(v_group).fields["m_bCanBeFirst"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			(v_group).fields["m_bRandomized"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			v_iNbLinkedGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
				pass
				R.invoke(R.get_value((v_group).fields.get("m_LinkedGroups"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				v_i = R.signed32(v_i + 1)
			v_iNbAreas = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbAreas))):
				pass
				v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
				(v_areaInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_szAreaName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_areaInfo).fields["m_iAreaLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_bAllowFlip"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_t = R.coerce(0, "int")
				while R.truth((float(v_t) < float(v_iNbDialogs))):
					pass
					R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
					R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
					v_t = R.signed32(v_t + 1)
				(v_areaInfo).fields["m_bOverrideSpawning"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_fJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_fMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_iMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bFullSpeedMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bLavaMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bLavaInstantKill"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fForcedStopDuration"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bOverrideDifficulty"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_fPatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_fSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
				(v_areaInfo).fields["m_bSpikeSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bBombSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bOil"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bSpike"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bMine"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bExplodingCar"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bGrub"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bBaseSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_areaInfo).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iDataSize = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
				v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_j = R.coerce(0, "int")
				while R.truth((float(v_j) < float(v_iNbPatterns))):
					pass
					v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
					(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
					v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
					R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
					R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
					(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
					R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
					R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
					v_j = R.signed32(v_j + 1)
				R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
				R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
				v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Icon"), 0, v_iIconBytes])
				v_i = R.signed32(v_i + 1)
			if R.truth((v_group).fields.get("m_bRandomized")):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float((R.num(R.get_value(((v_group).fields.get("m_AreaIndices")).fields.get("m_Values"), "length")) * float(20))))):
					pass
					R.invoke(R.get_value((v_group).fields.get("m_RandomAreaIndices"), "push"), [R.binary("as", R.call_member((v_group).fields.get("m_AreaIndices"), "GetRandomValue", []), R.klass("int"))])
					v_i = R.signed32(v_i + 1)
			v_g = R.signed32(v_g + 1)
		v_groupsThatCanBeFirst = R.coerce(R.construct(R.klass("Array"), []), "Array")
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
			pass
			v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_i), "RDAreaGroup")
			if R.truth((v_group).fields.get("m_bCanBeFirst")):
				pass
				R.invoke(R.get_value(v_groupsThatCanBeFirst, "push"), [v_i])
			v_i = R.signed32(v_i + 1)
		if R.truth(R.binary(">", R.get_value(v_groupsThatCanBeFirst, "length"), 0)):
			pass
			(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value(v_groupsThatCanBeFirst, R.call_static("Maths", "RandomInt", [R.get_value(v_groupsThatCanBeFirst, "length")])), "int")
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
		(v_group).fields["m_iLength"] = R.coerce(R.binary("+", (v_group).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((float((v_group).fields.get("m_iMaxLength")) - float((v_group).fields.get("m_iMinLength")))) + float(1))])), "int")
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = R.coerce((4 if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown")) else 0), "Number")
		(c.fields.get("m_Player")).fields["m_iNbBlownTires"] = R.coerce((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires"), "int")
		R.call_member(c.fields.get("m_Player"), "UpdateTireValues", [])
		R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "visible", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreWeaponsEnabled", []), "=")
		if R.truth(R.call_member(c, "IsMountedMGEnabled", [])):
			pass
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = true
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
			R.call_member((c.fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"), "ReplenishAmmo", [false, 1])
		if R.truth(R.call_member(c, "IsMountedRocketLauncherEnabled", [])):
			pass
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = true
			(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
			R.call_member((c.fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
		R.call_member(c.fields.get("m_Player"), "InitWeaponsArray", [])
		c.fields["m_fZombieSpeedFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor"))
		c.fields["m_fZombieHPFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor"))
		c.fields["m_fOilSlipperinessFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor"))
		c.fields["m_fImpactSpeedLossFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor"))
		c.fields["m_fVehicleHPFactor"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor"))
		c.fields["m_bExplodingZombies"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies")
		c.fields["m_bAlwaysCling"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling")
		(c).fields["m_fTime"] = float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime"))
		(c.fields.get("m_Camera")).fields["m_fFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) else R.static_value("RDCamera", "NoFogDistance")), "Number")
		(c.fields.get("m_Camera")).fields["m_fFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) else R.static_value("RDCamera", "NoFogRange")), "Number")
		c.fields["m_fVehicleDamageMultiplier"] = float(R.binary("/", 1, ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor")))
		c.fields["m_fBodyDamageMultiplier"] = float(R.binary("/", 1, ((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor")))
		c.fields["m_bCanHaveChopperSupport"] = R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"))
	(c).fields["m_bValidData"] = (float(v_iFileVersion) <= float(R.static_value("RDGame", "CurrentFileVersion")))
	return null


static func c1067_f_UsesValidFileVersion(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bValidData")
	return null


static func c1067_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	R.call_member(c, "StopEndingSounds", [])
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "visible", true, "=")
	if R.truth((R.unary("!", (c).fields.get("m_bHighwayTransition")) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")))):
		pass
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iMedShields"] = R.coerce(c.fields.get("m_iCustomMedShields"), "int")
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iMedHeals"] = R.coerce(c.fields.get("m_iCustomMedHeals"), "int")
	(c).fields["m_bHighwayTransition"] = false
	return null


static func c1067_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowDistance")):
		pass
		R.call_member(c, "UpdateDistanceScreen", [v_fDeltaTime])
		return null
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	if R.truth((c).fields.get("m_bValidData")):
		pass
		R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
		R.call_member(c, "UpdateHighwaySpawning", [])
		R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
		if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
			pass
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(v_fDeltaTime))), float(0)))
			if R.truth((float((c).fields.get("m_fTime")) == float(0))):
				pass
				R.call_member(c.fields.get("m_Player"), "Explode", [])
			else:
				pass
				if R.truth((float((c).fields.get("m_fTime")) < float(R.static_value("RDGameModeCustom", "AlertTime")))):
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
	return null


static func c1067_f_UpdateChallengePreSpawn(c: Variant, a: Array) -> Variant:
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_areaInfo: Variant = null
	var v_group: Variant = null
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iRandomLinkedGroup: Variant = 0
	var v_newGroup: Variant = null
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iAreaIndex = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iRandomLinkedGroup = R.coerce(0, "int")
	v_newGroup = R.coerce(null, "RDAreaGroup")
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float((float(R.static_value("RDGameModeGameplay", "PatternViewDistance")) * float(3))))) >= float((c).fields.get("m_fNextChallengeSpawnPosition")))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), R.klass("RDAreaGroup")), "RDAreaGroup")
		v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", (c).fields.get("m_iCurrentAreaIndex"), R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", (c).fields.get("m_iCurrentAreaIndex"), R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
		v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
		v_iPatternIndex = R.coerce(R.binary("as", R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int")), "int")
		R.set_value((c).fields.get("m_ChallengeGroups"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iCurrentGroupIndex"), "=")
		R.set_value((c).fields.get("m_ChallengeAreas"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iCurrentAreaIndex"), "=")
		R.set_value((c).fields.get("m_ChallengePatterns"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), v_iPatternIndex, "=")
		R.set_value((c).fields.get("m_ChallengePatternCounts"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iChallengePatternCount"), "=")
		R.set_value((c).fields.get("m_ChallengeAreaCounts"), (c).fields.get("m_iCurrentChallengeSpawnIndex"), (c).fields.get("m_iChallengeAreaCount"), "=")
		(c).fields["m_iCurrentChallengeSpawnIndex"] = R.coerce(R.binary("%", (float((c).fields.get("m_iCurrentChallengeSpawnIndex")) + float(1)), 20), "int")
		(c).fields["m_fNextChallengeSpawnPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextChallengeSpawnPosition"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
		R.set_value(c, "m_iChallengePatternCount", 1, "+=")
		R.set_value(c, "m_iChallengeAreaCount", 1, "+=")
		if R.truth((float((c).fields.get("m_iChallengeAreaCount")) == float((v_group).fields.get("m_iLength")))):
			pass
			v_iRandomLinkedGroup = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((v_group).fields.get("m_LinkedGroups"), "length")]), "int")
			(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), v_iRandomLinkedGroup), "int")
			v_newGroup = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
			(v_newGroup).fields["m_iLength"] = R.coerce(R.binary("+", (v_newGroup).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((v_newGroup).fields.get("m_iMaxLength")) - float((v_newGroup).fields.get("m_iMinLength")))])), "int")
			(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
			(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
			(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iChallengePatternCount")) == float((v_areaInfo).fields.get("m_iAreaLength")))):
				pass
				R.set_value(c, "m_iCurrentAreaIndex", 1, "+=")
				(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	return null


static func c1067_f_UpdateRandomCity(c: Variant, a: Array) -> Variant:
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_fPatternSpace: Variant = NAN
	var v_waterJug: Variant = null
	var v_areaInfo: Variant = null
	var v_fSpawnRatio: Variant = NAN
	var v_fCurrentPatternSpawnPosition: Variant = NAN
	var v_group: Variant = null
	var v_iPattern: Variant = 0
	var v_patternInfo: Variant = null
	var v_newLevelPattern: Variant = null
	var v_iNextCampaignAreaIndex: Variant = 0
	var v_bHasEndingEntity: Variant = false
	var v_bOnHighway: Variant = false
	var v_bNextOnHighway: Variant = false
	var v_bIsHighwayTransition: Variant = false
	var v_nextAreaInfo: Variant = null
	var v_nextAreaPattern: Variant = null
	var v_transitionEntity: Variant = null
	var v_ramp: Variant = null
	var v_fPosZ: Variant = NAN
	var v_entity: Variant = null
	var v_entity2: Variant = null
	var v_fPosX: Variant = NAN
	var v_iChallengeIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_iActualAreaIndex: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iNextChallengeIndex: Variant = 0
	var v_nextPatternInfo: Variant = null
	var v_areaPattern: Variant = null
	var v_fLevelLength: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = R.coerce(null, "RDObstacleWaterJug")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_fSpawnRatio = float(NAN)
	v_fCurrentPatternSpawnPosition = float(NAN)
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPattern = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_newLevelPattern = R.coerce(null, "RDLevelPatternCustomData")
	v_iNextCampaignAreaIndex = R.coerce(0, "int")
	v_bHasEndingEntity = false
	v_bOnHighway = false
	v_bNextOnHighway = false
	v_bIsHighwayTransition = false
	v_nextAreaInfo = R.coerce(null, "RDAreaInfo")
	v_nextAreaPattern = R.coerce(null, "RDPatternInfo")
	v_transitionEntity = R.coerce(null, "RDEntity")
	v_ramp = R.coerce(null, "RDHighwayRamp")
	v_fPosZ = float(NAN)
	v_entity = R.coerce(null, "RDRoadSign")
	v_entity2 = R.coerce(null, "RDRoadSignOffRoad")
	v_fPosX = float(NAN)
	v_iChallengeIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_iActualAreaIndex = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iNextChallengeIndex = R.coerce(0, "int")
	v_nextPatternInfo = R.coerce(null, "RDPatternInfo")
	v_areaPattern = R.coerce(null, "RDPatternInfo")
	v_fLevelLength = float(NAN)
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))))):
		pass
		R.call_member(c, "UpdateChallengePreSpawn", [])
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextPatternSpawnPosition")))):
		pass
		if R.truth((c).fields.get("m_UniquePattern")):
			pass
			v_fSpawnRatio = float(1)
			v_levelPattern = R.coerce((c).fields.get("m_UniquePattern"), "RDLevelPatternCustomData")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, 0, c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
			R.call_member(c, "UpdateBGBuildingDepthPos", [])
			c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
		else:
			pass
			if R.truth((c).fields.get("m_AreaPatterns")):
				pass
				v_levelPatterns = R.coerce((c).fields.get("m_AreaPatterns"), "RandomHat")
				v_fSpawnRatio = float(1)
				v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomData")), "RDLevelPatternCustomData")
				v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, 0, c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
				R.call_member(c, "UpdateBGBuildingDepthPos", [])
				c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
			else:
				pass
				if R.truth((c).fields.get("m_CampaignInfo")):
					pass
					v_fCurrentPatternSpawnPosition = float(c.fields.get("m_fNextPatternSpawnPosition"))
					R.set_value(c, "m_iLevelCounter", 1, "+=")
					if R.truth((float((c).fields.get("m_iLevelCounter")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength")))):
						pass
						(c).fields["m_iLevelCounter"] = R.coerce(0, "int")
						R.assign(c, "m_iLevel", "RDGameModeCustom", 1, "+=")
					if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
						pass
						v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
						if R.truth(R.binary("<", (c).fields.get("m_iCampaignAreaIndex"), R.get_value((v_group).fields.get("m_Areas"), "length"))):
							pass
							(c).fields["m_SpawnAreaInfo"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iCampaignAreaIndex")), "RDAreaInfo")
							v_iPattern = R.coerce(R.binary("as", R.call_member(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int")), "int")
							v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_Patterns"), v_iPattern), "RDPatternInfo")
							v_newLevelPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [(v_patternInfo).fields.get("m_Data")]), "RDLevelPatternCustomData")
							(v_newLevelPattern).fields["m_bAllowFlip"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllowFlip")
							v_levelPattern = R.coerce(v_newLevelPattern, "RDLevelPatternCustomData")
							R.call_member(c, "UpdateCampaignParameters", [])
							(v_levelPattern).fields["m_bLavaMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bLavaMode")
							v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), (c).fields.get("m_fPatternSpawnRatio"), 1]), "Number")
							R.call_member(c, "UpdateBGBuildingDepthPos", [])
							if R.truth((c).fields.get("m_bSpawnHighwayRamp")):
								pass
								v_iNextCampaignAreaIndex = R.coerce((R.coerce((float((c).fields.get("m_iCampaignAreaIndex")) + float(1)), "int") if R.truth((float((float((c).fields.get("m_iCampaignPatternIndex")) + float(1))) >= float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iAreaLength")))) else (c).fields.get("m_iCampaignAreaIndex")), "int")
								if R.truth((float(v_iNextCampaignAreaIndex) != float((c).fields.get("m_iCampaignAreaIndex")))):
									pass
									v_bHasEndingEntity = false
									v_bOnHighway = (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									v_bNextOnHighway = v_bOnHighway
									if R.truth(R.binary("<", v_iNextCampaignAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length"))):
										pass
										v_nextAreaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iNextCampaignAreaIndex), "RDAreaInfo")
										v_nextAreaPattern = R.coerce(R.get_value((v_nextAreaInfo).fields.get("m_Patterns"), 0), "RDPatternInfo")
										v_bNextOnHighway = (float((v_nextAreaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									else:
										pass
										v_bHasEndingEntity = true
									v_bIsHighwayTransition = R.binary("!=", v_bOnHighway, v_bNextOnHighway)
									if R.truth((v_bIsHighwayTransition or v_bHasEndingEntity)):
										pass
										v_fPosZ = float(maxf(float(c.fields.get("m_fNextPatternSpawnPosition")), float((float(2) * float(R.static_value("RDRoad", "RenderStepSize"))))))
										if R.truth(v_bHasEndingEntity):
											pass
											if R.truth((float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
												pass
												v_transitionEntity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopper")]), R.klass("RDEndChopper")), "RDEntity")
										else:
											pass
											if R.truth(R.unary("!", v_bOnHighway)):
												pass
												v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
												R.call_member(v_ramp, "Init", [R.klass("MC_HighwayRamp"), R.unary("!", v_bHasEndingEntity)])
												v_transitionEntity = R.coerce(v_ramp, "RDEntity")
											else:
												pass
												v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
												R.call_member(v_ramp, "Init", [R.klass("MovieClip"), R.unary("!", v_bHasEndingEntity)])
												v_transitionEntity = R.coerce(v_ramp, "RDEntity")
												v_entity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), R.klass("RDRoadSign")), "RDRoadSign")
												R.call_member(v_entity, "Init", [R.klass("MC_highwaysignrampexit")])
												v_entity2 = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
												R.call_member(v_entity2, "Init", [R.klass("MC_highwaysignoffroad")])
												(v_entity).fields["m_OffRoadPart"] = R.coerce(v_entity2, "RDRoadSignOffRoad")
												v_fPosX = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(1)))
												R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
												R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity2, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										if R.truth(v_transitionEntity):
											pass
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_transitionEntity, R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce((c).fields.get("m_iCampaignAreaIndex"), "int")
										(c).fields["m_fHighwayRampPos"] = float(v_fPosZ)
										(c).fields["m_bSpawnHighwayRamp"] = false
							if R.truth((R.binary("==", (c).fields.get("m_iHighwayRampCampaignAreaIndex"), R.unary("-", 1)) or (float((c).fields.get("m_iCampaignAreaIndex")) < float((c).fields.get("m_iHighwayRampCampaignAreaIndex"))))):
								pass
								R.set_value(c, "m_iCampaignPatternIndex", 1, "+=")
								if R.truth((float((c).fields.get("m_iCampaignPatternIndex")) == float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_iAreaLength")))):
									pass
									R.set_value(c, "m_iCampaignAreaIndex", 1, "+=")
									(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
							c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
						else:
							pass
							c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), 9999999), "Number")
					else:
						pass
						if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
							pass
							if R.truth((R.binary("==", (c).fields.get("m_iHighwayRampCampaignAreaIndex"), R.unary("-", 1)) or (float((c).fields.get("m_iChallengeIndex")) < float((c).fields.get("m_iHighwayRampCampaignAreaIndex"))))):
								pass
								v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengeIndex"), 20), "int")
								v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
								v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
								v_iActualAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
								v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
								(c).fields["m_SpawnAreaInfo"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
								v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iChallengeIndex), "int"), "int")
								v_patternInfo = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_Patterns"), v_iPatternIndex), R.klass("RDPatternInfo")), "RDPatternInfo")
								v_newLevelPattern = R.coerce(R.construct(R.klass("RDLevelPatternCustomData"), [(v_patternInfo).fields.get("m_Data")]), "RDLevelPatternCustomData")
								(v_newLevelPattern).fields["m_bAllowFlip"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllowFlip")
								v_levelPattern = R.coerce(v_newLevelPattern, "RDLevelPatternCustomData")
								R.call_member(c, "UpdateCampaignParameters", [])
								(v_levelPattern).fields["m_bLavaMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bLavaMode")
								v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), (c).fields.get("m_fPatternSpawnRatio"), 1]), "Number")
								R.call_member(c, "UpdateBGBuildingDepthPos", [])
								if R.truth((c).fields.get("m_bSpawnHighwayRamp")):
									pass
									v_iNextChallengeIndex = R.coerce(R.binary("%", (float((c).fields.get("m_iChallengeIndex")) + float(1)), 20), "int")
									v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iNextChallengeIndex), "int"), "int")
									v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
									v_iActualAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iNextChallengeIndex), "int"), "int")
									v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
									v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
									v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iNextChallengeIndex), "int"), "int")
									v_nextPatternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), R.klass("RDPatternInfo")), "RDPatternInfo")
									v_bOnHighway = (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									v_bNextOnHighway = (float((v_nextPatternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
									if R.truth(R.binary("!=", v_bOnHighway, v_bNextOnHighway)):
										pass
										v_fPosZ = float(maxf(float(c.fields.get("m_fNextPatternSpawnPosition")), float((float(2) * float(R.static_value("RDRoad", "RenderStepSize"))))))
										if R.truth(v_bNextOnHighway):
											pass
											v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
											R.call_member(v_ramp, "Init", [R.klass("MC_HighwayRamp")])
										else:
											pass
											v_ramp = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")]), R.klass("RDHighwayRamp")), "RDHighwayRamp")
											R.call_member(v_ramp, "Init", [R.klass("MovieClip")])
											v_entity = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")]), R.klass("RDRoadSign")), "RDRoadSign")
											R.call_member(v_entity, "Init", [R.klass("MC_highwaysignrampexit")])
											v_entity2 = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")]), R.klass("RDRoadSignOffRoad")), "RDRoadSignOffRoad")
											R.call_member(v_entity2, "Init", [R.klass("MC_highwaysignoffroad")])
											(v_entity).fields["m_OffRoadPart"] = R.coerce(v_entity2, "RDRoadSignOffRoad")
											v_fPosX = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(1)))
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
											R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity2, R.binary("+", R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), v_fPosX), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										R.call_member(c.fields.get("m_Game"), "AddEntity", [v_ramp, R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
										(c).fields["m_iHighwayRampCampaignAreaIndex"] = R.coerce((c).fields.get("m_iChallengeIndex"), "int")
										(c).fields["m_iHighwayRampGroupIndex"] = R.coerce(v_iGroupIndex, "int")
										(c).fields["m_iHighwayRampAreaIndex"] = R.coerce(v_iActualAreaIndex, "int")
										(c).fields["m_iHighwayRampChallengePatternCount"] = R.coerce(R.get_value((c).fields.get("m_ChallengePatternCounts"), v_iNextChallengeIndex), "int")
										(c).fields["m_iHighwayRampChallengeAreaCount"] = R.coerce(R.get_value((c).fields.get("m_ChallengeAreaCounts"), v_iNextChallengeIndex), "int")
										(c).fields["m_bSpawnHighwayRamp"] = false
								c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
								R.set_value(c, "m_iChallengeIndex", 1, "+=")
							else:
								pass
								c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), 9999999), "Number")
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
			pass
			v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
			(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
			c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
			if R.truth((((c).fields.get("m_bPlayAreaDialog") and (float((c).fields.get("m_iDialogPosAreaIndex")) < float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))) and (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c).fields.get("m_fPlayAreaDialogPos")) + float(((c).fields.get("m_ActiveArea")).fields.get("m_fDialogOffset"))))))):
				pass
				R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), ((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0])
				(c).fields["m_bPlayAreaDialog"] = false
			if R.truth(((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding")) and (float((c).fields.get("m_iDialogPosAreaIndex")) == float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))) and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c).fields.get("m_fHighwayRampPos")) - float(R.static_value("RDRoad", "RenderStepSize"))))))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowEnding", [((c).fields.get("m_ActiveArea")).fields.get("m_iType")])
				R.call_member(c.fields.get("m_Player"), "StartEnding", [((c).fields.get("m_ActiveArea")).fields.get("m_iType")])
				R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), ((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0])
				if R.truth((float(((c).fields.get("m_ActiveArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
					pass
					R.call_member(c.fields.get("m_Game"), "DoFlash", [1, 0.25])
					((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
				if R.truth((R.binary("==", R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_DialogCues"), 0), R.unary("-", 1)) and R.binary("==", R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_DialogTexts"), 0), ""))):
					pass
					(c).fields["m_fEndCampaignTimer"] = float(3)
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [""])
					R.call_member(c, "OnAreaDialogEnded", [])
			if R.truth((float((c).fields.get("m_fEndCampaignTimer")) > float(0))):
				pass
				(c).fields["m_fEndCampaignTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fEndCampaignTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fEndCampaignTimer")) <= float(0))):
					pass
					R.call_member(c, "EndCampaign", [])
			if R.truth((float((c).fields.get("m_fForcedStopTimer")) > float(0))):
				pass
				(c).fields["m_fForcedStopTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fForcedStopTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fForcedStopTimer")) <= float(0))):
					pass
					(c.fields.get("m_Player")).fields["m_bForceBrake"] = false
			while R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((c).fields.get("m_fDialogPosPatternPos")))):
				pass
				R.set_value(c, "m_iDialogPosPatternIndex", 1, "+=")
				if R.truth((float((c).fields.get("m_iDialogPosPatternIndex")) >= float(((c).fields.get("m_ActiveArea")).fields.get("m_iAreaLength")))):
					pass
					(c).fields["m_bPlayAreaDialog"] = true
					(c).fields["m_fPlayAreaDialogPos"] = float((c).fields.get("m_fDialogPosPatternPos"))
					(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
					v_fLevelLength = float((float((float((v_areaInfo).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))))
					c.fields["m_fLevelStartPosition"] = R.coerce(R.binary("+", c.fields.get("m_fLevelStartPosition"), v_fLevelLength), "Number")
					R.set_value(c, "m_iDialogPosAreaIndex", 1, "+=")
					R.call_member(c, "UpdateNextLevel", [])
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
					if R.truth((float((c).fields.get("m_iDialogPosAreaIndex")) < float((R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))))):
						pass
						R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", (v_areaInfo).fields.get("m_szAreaName")])
					if R.truth((float((v_areaInfo).fields.get("m_fForcedStopDuration")) > float(0))):
						pass
						(c).fields["m_fForcedStopTimer"] = float((v_areaInfo).fields.get("m_fForcedStopDuration"))
						(c.fields.get("m_Player")).fields["m_bForceBrake"] = true
					R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [(v_areaInfo).fields.get("m_bFullSpeedMode")])
					(c).fields["m_fAreaSpeedFactor"] = float((v_areaInfo).fields.get("m_fPlayerSpeedFactor"))
					c.fields["m_fTargetFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and (v_areaInfo).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogDistance")), "Number")
					c.fields["m_fTargetFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and (v_areaInfo).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogRange")), "Number")
					(c).fields["m_bLavaModeInstantDeath"] = (v_areaInfo).fields.get("m_bLavaInstantKill")
				(c).fields["m_fDialogPosPatternPos"] = R.coerce(R.binary("+", (c).fields.get("m_fDialogPosPatternPos"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
				pass
				v_iChallengeIndex = R.coerce(R.binary("%", (c).fields.get("m_iChallengePlayerIndex"), 20), "int")
				v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iChallengeIndex), "int"), "int")
				v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
				v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iChallengeIndex), "int"), "int")
				v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
				(c).fields["m_ActiveArea"] = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
				v_areaPattern = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
				c.fields["m_bIsHighwayLevel"] = (float((v_areaPattern).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
				R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [((c).fields.get("m_ActiveArea")).fields.get("m_bFullSpeedMode")])
				(c).fields["m_fAreaSpeedFactor"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fPlayerSpeedFactor"))
				(c).fields["m_bLavaModeInstantDeath"] = ((c).fields.get("m_ActiveArea")).fields.get("m_bLavaInstantKill")
				while R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float((c).fields.get("m_fDialogPosPatternPos")))):
					pass
					R.set_value(c, "m_iChallengePlayerIndex", 1, "+=")
					(c).fields["m_fDialogPosPatternPos"] = R.coerce(R.binary("+", (c).fields.get("m_fDialogPosPatternPos"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
				if R.truth(((c).fields.get("m_bPlayAreaDialog") and (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_fDialogOffset"))))):
					pass
					R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), ((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), 0])
					(c).fields["m_bPlayAreaDialog"] = false
				if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
					pass
					(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [""])
						R.call_member(c, "OnAreaDialogEnded", [])
		if R.truth((c).fields.get("m_bDoFirstInit")):
			pass
			c.fields["m_fHelicopterDelay"] = R.coerce(R.call_member(c, "GetHelicopterDelay", []), "Number")
			c.fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
			c.fields["m_fMutantDelay"] = R.coerce(R.call_member(c, "GetMutantDelay", []), "Number")
			(c).fields["m_bDoFirstInit"] = false
			if R.truth((float(((c).fields.get("m_ActiveArea")).fields.get("m_fForcedStopDuration")) > float(0))):
				pass
				(c).fields["m_fForcedStopTimer"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fForcedStopDuration"))
				(c.fields.get("m_Player")).fields["m_bForceBrake"] = true
			R.call_member(c.fields.get("m_Player"), "SetFullSpeedMode", [((c).fields.get("m_ActiveArea")).fields.get("m_bFullSpeedMode")])
			(c).fields["m_fAreaSpeedFactor"] = float(((c).fields.get("m_ActiveArea")).fields.get("m_fPlayerSpeedFactor"))
			(c.fields.get("m_Camera")).fields["m_fFogDistance"] = R.coerce((R.static_value("RDCamera", "FogDistance") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and ((c).fields.get("m_ActiveArea")).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogDistance")), "Number")
			(c.fields.get("m_Camera")).fields["m_fFogRange"] = R.coerce((R.static_value("RDCamera", "FogRange") if R.truth((R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")) and ((c).fields.get("m_ActiveArea")).fields.get("m_bFog"))) else R.static_value("RDCamera", "NoFogRange")), "Number")
			c.fields["m_fTargetFogDistance"] = float((c.fields.get("m_Camera")).fields.get("m_fFogDistance"))
			c.fields["m_fTargetFogRange"] = float((c.fields.get("m_Camera")).fields.get("m_fFogRange"))
			(c).fields["m_bLavaModeInstantDeath"] = ((c).fields.get("m_ActiveArea")).fields.get("m_bLavaInstantKill")
	return null


static func c1067_f_PlayAreaDialog(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = null
	var v_dialogClass: Variant = null
	var v_szDialog: Variant = null
	var v_cues: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_texts: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	var v_iIndex: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_voice = R.coerce(null, "DTSpacialSound")
	(c).fields["m_AreaDialogCues"] = R.coerce(v_cues, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(v_texts, "Array")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(v_iIndex, "int")
	v_dialogClass = R.coerce(R.call_static("RDCampaignDialogs", "GetSound", [R.get_value((c).fields.get("m_AreaDialogCues"), (c).fields.get("m_iAreaDialogIndex"))]), "Class")
	if R.truth(v_dialogClass):
		pass
		v_voice = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [v_dialogClass, (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), (c.fields.get("m_Game")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Center"), v_voice, R.static_value("RDPlayer", "VoicePriority_Crucial")])
	v_szDialog = R.coerce(R.get_value((c).fields.get("m_AreaDialogTexts"), (c).fields.get("m_iAreaDialogIndex")), "String")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowDialogBox", [v_szDialog])
	(c).fields["m_fDialogTimer"] = R.coerce((3 if R.truth(R.binary("==", v_szDialog, "")) else maxf(float((R.num(R.get_value(v_szDialog, "length")) * float(R.static_value("RDCampaignDialogs", "DialogTimePerCharacter")))), float(R.static_value("RDCampaignDialogs", "MinDialogTime")))), "Number")
	return null


static func c1067_f_OnAreaDialogEnded(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
		if R.truth((float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1))))):
			pass
			R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
		else:
			pass
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iDialogPosAreaIndex")), "RDAreaInfo")
			if R.truth((float((v_areaInfo).fields.get("m_iType")) != float(R.static_value("RDAreaInfo", "Type_Normal")))):
				pass
				R.call_member(c, "EndCampaign", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1))))):
			pass
			R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
	return null


static func c1067_f_EndCampaign(c: Variant, a: Array) -> Variant:
	c.fields["m_bShowDistance"] = false
	c.fields["m_bShowStats"] = true
	return null


static func c1067_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnPlayerFailed"), [v_evt])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTimeBonus", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTime", [])
	if R.truth((R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))))):
		pass
		c.fields["m_bShowDistance"] = true
		c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	return null


static func c1067_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) < float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
		pass
		c.fields["m_fDistanceScreenTimer"] = R.coerce(R.binary("+", c.fields.get("m_fDistanceScreenTimer"), v_fDeltaTime), "Number")
		if R.truth((float(c.fields.get("m_fDistanceScreenTimer")) >= float(R.static_value("RDGameModeGameplay", "DistanceScreenDelay")))):
			pass
			R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [c.fields.get("m_DistanceScreen")])
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("RatePanel"), "visible", (((R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")) and R.binary("!=", (c.fields.get("m_Game")).fields.get("m_LoadedFile"), null)) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bLoadedFileOwned"))) and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bLoadedFileRated"))), "=")
			if R.truth(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSound")):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0, R.static_value("RDGameModeGameplay", "SoundFadeDuration")])
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
				pass
				R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Distance Reached", "=")
				R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100), " KM"), "=")
			else:
				pass
				if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
					pass
					R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Zombies Killed", "=")
					R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalZombiesKilled"), "=")
				else:
					pass
					if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
						pass
						R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Civilians Killed", "=")
						R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalCiviliansKilled"), "=")
					else:
						pass
						if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
							pass
							R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("PointsTitle"), "Value"), "text", "Civilians Saved", "=")
							R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("Points"), "Value"), "text", (c).fields.get("m_iTotalCiviliansSaved"), "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPointsTitle"), "Value"), "text", "Challenge Target", "=")
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", ((c).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget"), "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
			R.set_value((c.fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
			R.call_member(c.fields.get("m_DistanceScreen"), "addChild", [(c.fields.get("m_Game")).fields.get("m_Menu")])
			R.call_member(c.fields.get("m_Game"), "SlideInterface", [R.static_value("RDGame", "MenuState_All"), false, true])
			R.call_member(c.fields.get("m_Game"), "GoToMenuState", [R.static_value("RDGame", "MenuState_ContentPanel")])
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
			R.call_member(c.fields.get("m_Game"), "PlayInterfaceSound", [])
	return null


static func c1067_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1067_f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	return R.binary("==", (c).fields.get("m_UniquePattern"), null)
	return null


static func c1067_f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "PlayNukeSound")):
		pass
		R.call_member((c).fields.get("m_NukeSound"), "Play", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "PlayNukeWaveSound")):
			pass
			R.call_member((c).fields.get("m_NukeWaveSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "PlayChopperSound")):
				pass
				R.call_member((c).fields.get("m_ChopperSound"), "Play", [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "PlayEngineSound")):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Play", [])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "StopEngineSound")):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PlayPassBySound")):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Play", [])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "PlayTireSound")):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Play", [])
	return null


static func c1067_f_StopEndingSounds(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_NukeSound"), "Stop", [])
	R.call_member((c).fields.get("m_NukeWaveSound"), "Stop", [])
	R.call_member((c).fields.get("m_ChopperSound"), "Stop", [])
	return null


static func c1067_f_IsOnHighway(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveArea")).fields.get("m_Patterns"), 0), "RDPatternInfo")
	return (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
	return null


static func c1067_f_OnRampReached(c: Variant, a: Array) -> Variant:
	c.fields["m_fPlayerStartPosition"] = R.coerce(R.binary("+", c.fields.get("m_fPlayerStartPosition"), ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")), "Number")
	c.fields["m_bIsHighwayLevel"] = R.unary("!", c.fields.get("m_bIsHighwayLevel"))
	c.fields["m_bStartAtHighSpeed"] = true
	(c).fields["m_iCampaignAreaIndex"] = R.coerce((float((c).fields.get("m_iHighwayRampCampaignAreaIndex")) + float(1)), "int")
	(c).fields["m_iCampaignPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPosAreaIndex"] = R.coerce((c).fields.get("m_iCampaignAreaIndex"), "int")
	(c).fields["m_iDialogPosPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentGroupIndex"] = R.coerce((c).fields.get("m_iHighwayRampGroupIndex"), "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce((c).fields.get("m_iHighwayRampAreaIndex"), "int")
	(c).fields["m_iChallengePatternCount"] = R.coerce((c).fields.get("m_iHighwayRampChallengePatternCount"), "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce((c).fields.get("m_iHighwayRampChallengeAreaCount"), "int")
	(c).fields["m_bHighwayTransition"] = true
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(c.fields.get("m_Game"), "StartCinematic", [("EnterHighway" if R.truth(c.fields.get("m_bIsHighwayLevel")) else "ExitHighway"), false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth(c.fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 0])
	return null


static func c1067_f_AddRP(c: Variant, a: Array) -> Variant:
	var v_iRP: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bPop: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bCheckPause: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "AddRP"), [v_iRP, v_bPop, v_bCheckPause])
	return null


static func c1067_f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieKilled"), [v_zombie, v_iHitType])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float((v_zombie).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))):
				pass
				if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")) != float(0))):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")])
					(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")))), float(0)))
	return null


static func c1067_f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotDown"), [v_zombie, v_iHitType])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null


static func c1067_f_OnZombieShotByHelicopter(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotByHelicopter"), [v_zombie, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null


static func c1067_f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieShotOffHood"), [v_zombie, v_iClingerState])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")))), float(0)))
	return null


static func c1067_f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieGotOff"), [v_zombie, v_bFromSideCollision])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")))), float(0)))
	return null


static func c1067_f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnZombieExploded"), [v_zombie])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float((v_zombie).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")))), float(0)))
		else:
			pass
			if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")) != float(0))):
				pass
				R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
				(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")))), float(0)))
	return null


static func c1067_f_OnSoldierKilled(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierKilled"), [v_soldier, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")))), float(0)))
	return null


static func c1067_f_OnSoldierShotDown(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierShotDown"), [v_soldier, v_iHitType])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")))), float(0)))
	return null


static func c1067_f_OnSoldierShotOffHood(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierShotOffHood"), [v_soldier, v_iClingerState])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null


static func c1067_f_OnSoldierGotOff(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnSoldierGotOff"), [v_soldier, v_bFromSideCollision])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null


static func c1067_f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianHit"), [])
	R.set_value(c, "m_iTotalCiviliansKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")))), float(0)))
	return null


static func c1067_f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianShot"), [])
	R.set_value(c, "m_iTotalCiviliansKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")))), float(0)))
	return null


static func c1067_f_OnHelicopterDefeated(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnHelicopterDefeated"), [])
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")))), float(0)))
	return null


static func c1067_f_OnFeedersHit(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnFeedersHit"), [])
	R.set_value(c, "m_iTotalZombiesKilled", 1, "+=")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")) > float(0)))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")) != float(0))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")])
			(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) + float(((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")))), float(0)))
	return null


static func c1067_f_OnCivilianDropped(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeCustom"), "OnCivilianDropped"), [v_evt])
	R.set_value(c, "m_iTotalCiviliansSaved", 1, "+=")
	return null


static func c1067_f_AreWeaponsEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons")))
	return null


static func c1067_f_AreAmmoPointsEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints")))
	return null


static func c1067_f_ReplenishEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish")))
	return null


static func c1067_f_InfiniteAmmoEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"))
	return null


static func c1067_f_GetBounceFactor(c: Variant, a: Array) -> Variant:
	return (R.call_static("Maths", "Clamp", [((c).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor"), 1, 10]) if R.truth((c).fields.get("m_CampaignInfo")) else 1)
	return null


static func c1067_f_GetHelicopterDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fHellfireDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null


static func c1067_f_GetHelicopterLevel(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_iHellfireLevel")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(1))
		return maxf(float(R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))])), float(1))
	return 1
	return null


static func c1067_f_GetJetDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fJetDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null


static func c1067_f_GetJetDrops(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return R.call_static("Maths", "Clamp", [(float(((c).fields.get("m_ActiveArea")).fields.get("m_iJetDrops")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1))), 1, 3])
		return R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))]), 1, 3])
	return 1
	return null


static func c1067_f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return maxf(float((float(((c).fields.get("m_ActiveArea")).fields.get("m_fMutantDelay")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
		return maxf(float((float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))), float(0))
	return 0
	return null


static func c1067_f_GetMutantCount(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bOverrideSpawning")):
			pass
			return R.call_static("Maths", "Clamp", [(float(((c).fields.get("m_ActiveArea")).fields.get("m_iMutantCount")) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_ActiveArea")).fields.get("m_bRandomizeSpawningValues")) else 1))), 1, 4])
		return R.call_static("Maths", "Clamp", [R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount")))))) * R.num(((float(0.9) + float((float(randf()) * float(0.2)))) if R.truth(((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")) else 1)))]), 1, 4]), 1, 4])
	return 0
	return null


static func c1067_f_InvincibleHellfireEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"))
	return null


static func c1067_f_IsMountedMGEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"))
	return null


static func c1067_f_IsMountedRocketLauncherEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"))
	return null


static func c1067_f_InfiniteMountedWeaponEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"))
	return null


static func c1067_f_SwitchDriverEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch")))
	return null


static func c1067_f_ArcadeAmmoPickupEnabled(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_CampaignInfo")) and ((c).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"))
	return null


static func c1067_f_GetPlayerSpeedFactor(c: Variant, a: Array) -> Variant:
	return ((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor")) * float((c).fields.get("m_fAreaSpeedFactor"))) if R.truth((c).fields.get("m_CampaignInfo")) else 1)
	return null


static func c1067_f_GetJetPlayDialogs(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1067_f_SteeringEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering")))
	return null


static func c1067_f_BrakingEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking")))
	return null


static func c1067_f_SwervingEnabled(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_CampaignInfo")) or R.unary("!", ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving")))
	return null


static func c1067_f_UpdateCampaignParameters(c: Variant, a: Array) -> Variant:
	var v_iNeverLevel: Variant = 0
	v_iNeverLevel = R.coerce(0, "int")
	if R.truth((R.truth((c).fields.get("m_SpawnAreaInfo")) and ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bOverrideDifficulty"))):
		pass
		(c).fields["m_fPatternSpawnRatio"] = float(minf(float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_fPatternRatio")), float(1)))
		(c).fields["m_fSpawnRate"] = float(minf(float(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_fSpawnRate")), float(2)))
		v_iNeverLevel = R.coerce(9999999999999, "int")
		c.fields["m_iStationarySoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iAlignSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iSpikeSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bSpikeSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iHiddenSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBaseSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iBombSoldierLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bBombSoldier")) else v_iNeverLevel), "int")
		c.fields["m_iHardZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iFeedersLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iSpikesLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bSpike")) else v_iNeverLevel), "int")
		c.fields["m_iNewMaleZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iNewFemaleZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iSoldierZombieLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bZombie")) else v_iNeverLevel), "int")
		c.fields["m_iExplodingCarLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bExplodingCar")) else v_iNeverLevel), "int")
		c.fields["m_iMineLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bMine")) else v_iNeverLevel), "int")
		c.fields["m_iGrubLevel"] = R.coerce((0 if R.truth(((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bGrub")) else v_iNeverLevel), "int")
	else:
		pass
		(c).fields["m_fPatternSpawnRatio"] = float(minf(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio")))))), float(1)))
		(c).fields["m_fSpawnRate"] = float(minf(float((float(((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate")) + float((float(c.fields.get("m_iLevel")) * float(((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate")))))), float(2)))
		c.fields["m_iStationarySoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iAlignSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iSpikeSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel"), "int")
		c.fields["m_iHiddenSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "int")
		c.fields["m_iBombSoldierLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel"), "int")
		c.fields["m_iHardZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iFeedersLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iSpikesLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel"), "int")
		c.fields["m_iNewMaleZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iNewFemaleZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iSoldierZombieLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "int")
		c.fields["m_iExplodingCarLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel"), "int")
		c.fields["m_iMineLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel"), "int")
		c.fields["m_iGrubLevel"] = R.coerce(((c).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel"), "int")
	if R.truth((R.truth((c).fields.get("m_SpawnAreaInfo")) and ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bOverrideSpawning"))):
		pass
		(c).fields["m_bFUBARMode"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bFUBARMode")
		(c).fields["m_bNoSoldierZombie"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bNoSoldierZombie")
		(c).fields["m_bAllSoldierZombie"] = ((c).fields.get("m_SpawnAreaInfo")).fields.get("m_bAllSoldierZombie")
	else:
		pass
		(c).fields["m_bFUBARMode"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode")
		(c).fields["m_bNoSoldierZombie"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie")
		(c).fields["m_bAllSoldierZombie"] = ((c).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie")
	c.fields["m_fLevelDifficulty"] = float((c).fields.get("m_fPatternSpawnRatio"))
	return null


static func c1067_f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	return (float(10) + float((R.num(R.call_static("Maths", "Clamp", [(c).fields.get("m_fSpawnRate"), 0, 2])) * float(10))))
	return null


static func c1067_f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(c).fields.get("m_fSpawnRate"), 0, 2])
	return null


static func c1067_f_IsFUBARMode(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bFUBARMode")
	return null


static func c1067_f_NoSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bNoSoldierZombie")
	return null


static func c1067_f_AllSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bAllSoldierZombie")
	return null


static func c1067_f_IsLavaInstantDeathEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bLavaModeInstantDeath")
	return null


static func c1067_f_CanSpawnHelicopter(c: Variant, a: Array) -> Variant:
	return ((((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed")) and R.unary("!", c.fields.get("m_Helicopter"))) and R.unary("!", c.fields.get("m_HelicopterAlly"))) and (float(c.fields.get("m_iLevel")) >= float(c.fields.get("m_iHelicopterLevel")))) and (float(c.fields.get("m_fHelicopterDelay")) > float(0)))
	return null


static func c1067_f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1067_f_HasNextLevel(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return true
		return R.binary("!=", (c).fields.get("m_szNextLevelName"), "")
	return false
	return null


static func c1067_f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return (c).fields.get("m_szNextLevelName")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return "Distance"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
			pass
			return "Zombies Killed"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
			pass
			return "Civilians Killed"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
			pass
			return "Civilians Saved"
	return ""
	return null


static func c1067_f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return R.invoke(R.get_value(R.klass("Math"), "round"), [(float((c).fields.get("m_fNextLevelPosition")) - float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))])
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100)
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled")))):
			pass
			return (c).fields.get("m_iTotalZombiesKilled")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled")))):
			pass
			return (c).fields.get("m_iTotalCiviliansKilled")
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved")))):
			pass
			return (c).fields.get("m_iTotalCiviliansSaved")
	return 0
	return null


static func c1067_f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_CampaignInfo")):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			return "m"
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")) == float(R.static_value("RDCampaignInfo", "Goal_DistanceReached")))):
			pass
			return "km"
	return ""
	return null


static func c1067_f_UpdateNextLevel(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth((R.truth((c).fields.get("m_CampaignInfo")) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), R.klass("RDAreaGroup")), "RDAreaGroup")
		(c).fields["m_szNextLevelName"] = R.coerce("", "String")
		(c).fields["m_iNextLevel"] = R.coerce((c).fields.get("m_iDialogPosAreaIndex"), "int")
		(c).fields["m_fNextLevelPosition"] = float(c.fields.get("m_fLevelStartPosition"))
		while R.truth((R.binary("<", (c).fields.get("m_iNextLevel"), R.get_value((v_group).fields.get("m_Areas"), "length")) and R.binary("==", (c).fields.get("m_szNextLevelName"), ""))):
			pass
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iNextLevel")), "RDAreaInfo")
			(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextLevelPosition"), (float((float((v_areaInfo).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.set_value(c, "m_iNextLevel", 1, "+=")
			if R.truth(R.binary("<", (c).fields.get("m_iNextLevel"), R.get_value((v_group).fields.get("m_Areas"), "length"))):
				pass
				v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (c).fields.get("m_iNextLevel")), "RDAreaInfo")
				(c).fields["m_szNextLevelName"] = R.coerce((v_areaInfo).fields.get("m_szAreaName"), "String")
			else:
				pass
				(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("-", (c).fields.get("m_fNextLevelPosition"), (float(1) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
				(c).fields["m_szNextLevelName"] = R.coerce("Ending", "String")
	return null


static func c1067_f_UsingCustomMeds(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1067_f_UsingCustomMountedWeapons(c: Variant, a: Array) -> Variant:
	return ((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked") or (((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked"))
	return null


static func c1068_f_RDGameModeDistance(c: Variant, a: Array) -> Variant:
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


static func c1068_f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "Reset"), [])
	return null


static func c1068_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "BeginGameMode"), [])
	return null


static func c1068_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDistance"), "EndGameMode"), [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null


static func c1068_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
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


static func c1068_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
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


static func c1068_f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Dead State Distance", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null


static func c1068_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
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


static func c1068_f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null


static func c1068_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1068_f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Dead State Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestSurvivalDistance")])
	return null


static func c1069_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	var v_bChopperMode: Variant = false
	var v_newFilters: Variant = null
	v_iRandom = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "BeginGameMode"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "OnStartDriverSelection", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [(c).fields.get("m_MC")])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [1])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", true, "=")
	v_bChopperMode = R.coerce(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", []), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DrivingLabel"), "visible", R.unary("!", v_bChopperMode), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GunnerLabel"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "visible", R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "HasStoryProgress", []), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "Progress"), "text", R.binary("+", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fStoryProgress")) * float(100))]), "%"), "=")
	(c).fields["m_bSelectionDone"] = false
	(c).fields["m_fDoneTalkingTimer"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "x", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "y", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "scaleX", 1, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Content"), "scaleY", 1, "=")
	R.call_member(c, "UpdateVehicle", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), "visible", true, "=")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bShowWeaponStatsButton"] = true
	R.set_value(R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), "visible", (((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bJohnEndingSeen") and R.unary("!", v_bChopperMode)), "=")
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	(c).fields["m_bDianeWeaponStats"] = false
	(c).fields["m_bCochetaWeaponStats"] = false
	(c).fields["m_fContentBrightness"] = float(0)
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "x", (c).fields.get("m_fBaseMenuButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "x", (c).fields.get("m_fBaseBackButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), "x", (c).fields.get("m_fBaseSwitchVehiclePos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), "y", (c).fields.get("m_fBaseDianeWeaponStatsButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), "y", (c).fields.get("m_fBaseCochetaWeaponStatsButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "y", (c).fields.get("m_fBaseDianeButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "y", (c).fields.get("m_fBaseCochetaButtonPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "x", (c).fields.get("m_fBaseDianeStatsPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "x", (c).fields.get("m_fBaseCochetaStatsPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DrivingLabel"), "y", (c).fields.get("m_fBaseDrivingLabelPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GunnerLabel"), "y", (c).fields.get("m_fBaseGunnerLabelPos"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StoryProgress"), "x", (c).fields.get("m_fBaseStoryProgressPos"), "=")
	v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "visible", false, "=")
	R.call_member(c, "InitStats", [])
	if R.truth((v_bChopperMode and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic")))):
		pass
		R.call_member((c).fields.get("m_FlySound"), "Play", [true])
	if R.truth((float((c.fields.get("m_Game")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MothersDay")))):
		pass
		(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaMothersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
		(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeMothersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
	else:
		pass
		if R.truth((float((c.fields.get("m_Game")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_FathersDay")))):
			pass
			(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaFathersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
			(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeFathersDay"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
		else:
			pass
			if R.truth(v_bChopperMode):
				pass
				(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaChopperSwitch"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
				(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeChopperShooting"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
			else:
				pass
				v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [3]), "int")
				if R.truth((float(v_iRandom) == float(0))):
					pass
					(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
					(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
				else:
					pass
					if R.truth((float(v_iRandom) == float(1))):
						pass
						(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
						(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
					else:
						pass
						if R.truth((float(v_iRandom) == float(2))):
							pass
							(c).fields["m_CochetaDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_CochetaDriving3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSound")
							(c).fields["m_DianeDrivingVoice"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_DianeDriving3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup"), true]), "DTSound")
	R.set_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "visible", false, "=")
	if R.truth((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bJohnEndingSeen") and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bSeenJohnCarNotice")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "JohnCarUnlocked"), "gotoAndPlay"), [1])
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bSeenJohnCarNotice"] = true
		R.call_member(((c.fields.get("m_Game")).fields.get("m_Hud")).fields.get("m_TutorialSound"), "Play", [])
	return null


static func c1069_f_UpdateVehicle(c: Variant, a: Array) -> Variant:
	var v_bChopperMode: Variant = false
	v_bChopperMode = R.coerce(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", []), "Boolean")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Hummer"), "visible", (R.unary("!", v_bChopperMode) and ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Chopper"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "ChopperBladeShadow"), "visible", v_bChopperMode, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Car"), "visible", (R.unary("!", v_bChopperMode) and R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	return null


static func c1069_f_UpdateDianeMouth(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	var v_fDataVolume: Variant = NAN
	var v_fVolumeRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iFrame = R.coerce(0, "int")
	v_fDataVolume = float(NAN)
	v_fVolumeRatio = float(NAN)
	v_iFrame = R.coerce(1, "int")
	if R.truth(R.call_member((c).fields.get("m_DianeDrivingVoice"), "IsPlaying", [])):
		pass
		v_fDataVolume = R.coerce(R.call_member((c).fields.get("m_DianeDrivingVoice"), "GetDataVolume", []), "Number")
		v_fVolumeRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float(v_fDataVolume) - float(0.1)), 0.1), 0, 1]), "Number")
		v_iFrame = R.coerce((float(1) + float(ceilf(float((float(v_fVolumeRatio) * float(20)))))), "int")
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [v_iFrame])
	else:
		pass
		R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndStop"), [1])
	return null


static func c1069_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "EndGameMode"), [])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_MC")])
	R.call_member((c).fields.get("m_FlySound"), "Stop", [])
	return null


static func c1069_f_Update(c: Variant, a: Array) -> Variant:
	var v_color: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeDriverSelection"), "Update"), [v_fDeltaTime])
	if R.truth((((c).fields.get("m_bSelectionDone") and R.unary("!", R.call_member((c).fields.get("m_CochetaDrivingVoice"), "IsPlaying", []))) and R.unary("!", R.call_member((c).fields.get("m_DianeDrivingVoice"), "IsPlaying", [])))):
		pass
		(c).fields["m_fDoneTalkingTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDoneTalkingTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fDoneTalkingTimer")) >= float(0.5))):
			pass
			((c.fields.get("m_Game")).fields.get("m_ActiveMode")).fields["m_bDoStartGameMode"] = true
			R.call_member(c.fields.get("m_Game"), "StartGameMode", [(c.fields.get("m_Game")).fields.get("m_ActiveMode")])
	if R.truth(((c).fields.get("m_bDianeWeaponStats") or (c).fields.get("m_bCochetaWeaponStats"))):
		pass
		(c).fields["m_fContentBrightness"] = float(maxf(float((float((c).fields.get("m_fContentBrightness")) - float((float(0.4) * float(v_fDeltaTime))))), R.num(R.unary("-", 0.2))))
	else:
		pass
		(c).fields["m_fContentBrightness"] = float(minf(float((float((c).fields.get("m_fContentBrightness")) + float((float(0.4) * float(v_fDeltaTime))))), float(0)))
	v_color = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
	R.set_value(v_color, "brightness", (c).fields.get("m_fContentBrightness"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "transform"), "colorTransform", v_color, "=")
	R.call_member(c, "UpdateDianeMouth", [v_fDeltaTime])
	return null


static func c1069_f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_newFilters: Variant = null
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_newFilters = R.coerce(null, "Array")
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeDriverSelection"), [12255232, 0.7])])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
			pass
			v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
			R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeDriverSelection"), [12255232, 0.7])])
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
		else:
			pass
			if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving")))):
				pass
				R.call_member(c.fields.get("m_Game"), "SetToolTip", ["The Driving skill levels up as you play and affects how well you can steer in combination with your tires.", v_target])
			else:
				pass
				if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness")))):
					pass
					R.call_member(c.fields.get("m_Game"), "SetToolTip", ["Toughness levels up as you play and affects your control upon collisions and explosions, the explosion body damage and your strength against side grapplers.", v_target])
				else:
					pass
					if R.truth((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon1")))):
						pass
						R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponPistol", "Description"), v_target])
					else:
						pass
						if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon2")))):
							pass
							R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponShotgun", "Description"), v_target])
						else:
							pass
							if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon3")))):
								pass
								R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponMAC11", "Description"), v_target])
							else:
								pass
								if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon4")))):
									pass
									R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponM16", "Description"), v_target])
								else:
									pass
									if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon2")))):
										pass
										R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponMP5", "Description"), v_target])
									else:
										pass
										if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon3")))):
											pass
											R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponSPAS12", "Description"), v_target])
										else:
											pass
											if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon4")))):
												pass
												R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDWeaponM60", "Description"), v_target])
											else:
												pass
												if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4")))):
													pass
													R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponDamageToolTip"), v_target])
												else:
													pass
													if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4")))):
														pass
														R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAccuracyToolTip"), v_target])
													else:
														pass
														if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4")))):
															pass
															R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponCapacityToolTip"), v_target])
														else:
															pass
															if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4")))):
																pass
																R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponAimingToolTip"), v_target])
															else:
																pass
																if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4")))):
																	pass
																	R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponHandlingToolTip"), v_target])
																else:
																	pass
																	if R.truth((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4")))):
																		pass
																		R.call_member(c.fields.get("m_Game"), "SetToolTip", [R.static_value("RDUnlockData", "WeaponReloadingToolTip"), v_target])
	return null


static func c1069_f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_newFilters: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_newFilters = R.coerce(null, "Array")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "filters", v_newFilters, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
			pass
			v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Cocheta"), "filters", v_newFilters, "=")
		else:
			pass
			if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "WeaponLabel4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "Weapon4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "WeaponLabel4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "Weapon4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4")))):
				pass
				R.call_member(c.fields.get("m_Game"), "SetToolTip", ["", null])
	return null


static func c1069_f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth((c).fields.get("m_bSelectionDone")):
		pass
		return null
	if R.truth(((c).fields.get("m_bDianeWeaponStats") or (c).fields.get("m_bCochetaWeaponStats"))):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "BackButton"))):
			pass
			R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
			R.call_member(c, "ZoomTo", [0, 0, 1])
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), 0.5, {"x": 600, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), 0.5, {"x": 600, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
			R.call_member(c, "SlideInterface", [true, false, true, true])
			(c).fields["m_bDianeWeaponStats"] = false
			(c).fields["m_bCochetaWeaponStats"] = false
			R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", true, "=")
			R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", true, "=")
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "MenuButton"))):
			pass
			R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
			if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
				pass
				R.call_member(c.fields.get("m_Game"), "StartGameMode", [(c.fields.get("m_Game")).fields.get("m_GameModeEditor")])
			else:
				pass
				R.call_member(c.fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
			R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "SwitchVehicle"))):
				pass
				((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bUsingHummer"] = R.unary("!", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))
				R.call_member((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "SavePlayerInfo", [])
				R.call_member(c.fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "UpdateVehicle", [])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeButton"))):
					pass
					R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
					(c.fields.get("m_Game")).fields["m_bIsFemale"] = R.coerce((false if R.truth(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", [])) else true), "Boolean")
					(c.fields.get("m_Game")).fields["m_bLastIsFemale"] = (c.fields.get("m_Game")).fields.get("m_bIsFemale")
					R.call_member((c).fields.get("m_DianeDrivingVoice"), "Play", [])
					R.invoke(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "Content"), "Diane"), "Head"), "gotoAndPlay"), [2])
					(c).fields["m_bSelectionDone"] = true
					R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
					R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
					R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
					R.call_member(c, "ZoomTo", [R.unary("-", 5), R.unary("-", 43), 1.32])
					R.call_member(c, "SlideInterface", [false, false, false, false])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaButton"))):
						pass
						R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
						(c.fields.get("m_Game")).fields["m_bIsFemale"] = R.coerce((true if R.truth(R.call_member((c.fields.get("m_Game")).fields.get("m_ActiveMode"), "IsChopperMode", [])) else false), "Boolean")
						(c.fields.get("m_Game")).fields["m_bLastIsFemale"] = (c.fields.get("m_Game")).fields.get("m_bIsFemale")
						R.call_member((c).fields.get("m_CochetaDrivingVoice"), "Play", [])
						(c).fields["m_bSelectionDone"] = true
						R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
						R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
						R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
						R.call_member(c, "ZoomTo", [R.unary("-", 184), R.unary("-", 3), 1.19])
						R.call_member(c, "SlideInterface", [false, false, false, false])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"))):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
							R.call_member(c, "ZoomTo", [R.unary("-", 237), R.unary("-", 60), 1.44])
							R.call_member(c, "SlideInterface", [false, true, false, false])
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "visible", true, "=")
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "x", 600, "=")
							R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), 0.5, {"x": 165, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
							R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
							R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
							(c).fields["m_bDianeWeaponStats"] = true
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"))):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_ButtonSound"), "Play", [])
								R.call_member(c, "ZoomTo", [R.unary("-", 554), 4, 1.71])
								R.call_member(c, "SlideInterface", [false, true, false, false])
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "visible", true, "=")
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "x", 600, "=")
								R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), 0.5, {"x": 165, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
								R.set_value(R.get_value((c).fields.get("m_MC"), "DianeButton"), "mouseEnabled", false, "=")
								R.set_value(R.get_value((c).fields.get("m_MC"), "CochetaButton"), "mouseEnabled", false, "=")
								(c).fields["m_bCochetaWeaponStats"] = true
	return null


static func c1069_f_SlideInterface(c: Variant, a: Array) -> Variant:
	var v_bMain: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bBack: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bMenu: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_bStats: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "MenuButton"), "visible", v_bMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "BackButton"), "visible", v_bBack, "=")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "MenuButton"), 0.25, {"x": ((c).fields.get("m_fBaseMenuButtonPos") if R.truth(v_bMenu) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "BackButton"), 0.25, {"x": ((c).fields.get("m_fBaseBackButtonPos") if R.truth(v_bBack) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "SwitchVehicle"), 0.25, {"x": ((c).fields.get("m_fBaseSwitchVehiclePos") if R.truth(v_bMain) else R.unary("-", 140)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DrivingLabel"), 0.25, {"y": ((c).fields.get("m_fBaseDrivingLabelPos") if R.truth(v_bMain) else R.unary("-", 70)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "GunnerLabel"), 0.25, {"y": ((c).fields.get("m_fBaseGunnerLabelPos") if R.truth(v_bMain) else R.unary("-", 70)), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeWeaponStatsButton"), 0.25, {"y": ((c).fields.get("m_fBaseDianeWeaponStatsButtonPos") if R.truth(v_bMain) else 415), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaWeaponStatsButton"), 0.25, {"y": ((c).fields.get("m_fBaseCochetaWeaponStatsButtonPos") if R.truth(v_bMain) else 415), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeButton"), 0.25, {"y": ((c).fields.get("m_fBaseDianeButtonPos") if R.truth(v_bMain) else 430), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaButton"), 0.25, {"y": ((c).fields.get("m_fBaseCochetaButtonPos") if R.truth(v_bMain) else 430), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "DianeStats"), 0.25, {"x": ((c).fields.get("m_fBaseDianeStatsPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseDianeStatsPos")) - float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "CochetaStats"), 0.25, {"x": ((c).fields.get("m_fBaseCochetaStatsPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseCochetaStatsPos")) + float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "StoryProgress"), 0.25, {"x": ((c).fields.get("m_fBaseStoryProgressPos") if R.truth(v_bStats) else (float((c).fields.get("m_fBaseStoryProgressPos")) + float(160))), "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	return null


static func c1069_f_ZoomTo(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fScale: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	R.call_static("gs.TweenLite", "to", [R.get_value((c).fields.get("m_MC"), "Content"), 0.5, {"x": v_fX, "y": v_fY, "scaleX": v_fScale, "scaleY": v_fScale, "ease": R.get_value(R.klass("gs.easing.Quad"), "easeOut")}])
	return null


static func c1069_f_InitStats(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Driving"), "Driving", true, (v_info).fields.get("m_iDianeDrivingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeStats"), "Toughness"), "Toughness", true, (v_info).fields.get("m_iDianeToughnessLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Driving"), "Driving", true, (v_info).fields.get("m_iCochetaDrivingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaStats"), "Toughness"), "Toughness", true, (v_info).fields.get("m_iCochetaToughnessLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage1"), "Damage", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy1"), "Accuracy", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity1"), "Capacity", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming1"), "Aiming", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling1"), "Handling", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading1"), "Reloading", true, ((v_info).fields.get("m_DianePistol")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage2"), "Damage", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy2"), "Accuracy", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity2"), "Capacity", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming2"), "Aiming", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling2"), "Handling", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading2"), "Reloading", true, ((v_info).fields.get("m_DianeShotgun")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"), "visible", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage3"), ("Damage" if R.truth(((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy3"), "Accuracy", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity3"), "Capacity", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming3"), "Aiming", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling3"), "Handling", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading3"), "Reloading", true, ((v_info).fields.get("m_DianeMAC11")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"), "visible", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeDamage4"), ("Damage" if R.truth(((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAccuracy4"), "Accuracy", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeCapacity4"), "Capacity", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeAiming4"), "Aiming", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeHandling4"), "Handling", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "DianeWeaponStats"), "DianeReloading4"), "Reloading", true, ((v_info).fields.get("m_DianeM16")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage1"), "Damage", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy1"), "Accuracy", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity1"), "Capacity", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming1"), "Aiming", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling1"), "Handling", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading1"), "Reloading", true, ((v_info).fields.get("m_CochetaPistol")).fields.get("m_iReloadingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage2"), "Damage", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy2"), "Accuracy", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity2"), "Capacity", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming2"), "Aiming", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling2"), "Handling", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading2"), "Reloading", true, ((v_info).fields.get("m_CochetaMP5")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"), "visible", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage3"), ("Damage" if R.truth(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy3"), "Accuracy", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity3"), "Capacity", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming3"), "Aiming", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling3"), "Handling", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading3"), "Reloading", true, ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iReloadingLevel"), true])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4"), "visible", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), "=")
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaDamage4"), ("Damage" if R.truth(((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")) else "Not available"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"), ((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel"), false, ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAccuracy4"), "Accuracy", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaCapacity4"), "Capacity", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel"), false])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaAiming4"), "Aiming", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iAimingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaHandling4"), "Handling", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iHandlingLevel"), true])
	R.call_member(c, "SetupUpgradeSlot", [R.get_value(R.get_value((c).fields.get("m_MC"), "CochetaWeaponStats"), "CochetaReloading4"), "Reloading", true, ((v_info).fields.get("m_CochetaM60")).fields.get("m_iReloadingLevel"), true])
	return null


static func c1069_f_SetupUpgradeSlot(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_szLeftName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_bShowBars: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_iLevel: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_bOrganicSlot: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_bEnabled: Variant = R.coerce((a[5] if a.size() > 5 else true), "Boolean")
	R.set_value(R.get_value(v_slotMC, "LeftName"), "text", v_szLeftName, "=")
	R.set_value(R.get_value(v_slotMC, "Bars"), "visible", v_bShowBars, "=")
	if R.truth(v_bOrganicSlot):
		pass
		v_iLevel = R.signed32(v_iLevel + 1)
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar1"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(1))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar2"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(2))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar3"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(3))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar4"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(4))) else 1)])
	R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar5"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(5))) else 1)])
	if R.truth(v_bOrganicSlot):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar6"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(6))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar7"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(7))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar8"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(8))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar9"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(9))) else 1)])
		R.invoke(R.get_value(R.get_value(R.get_value(v_slotMC, "Bars"), "Bar10"), "gotoAndStop"), [(3 if R.truth((float(v_iLevel) >= float(10))) else 1)])
	R.set_value(v_slotMC, "mouseEnabled", v_bEnabled, "=")
	return null


static func c1071_f_GetMusic(c: Variant, a: Array) -> Variant:
	return ((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth((c).fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic"))
	return null


static func c1071_f_EndGameMode(c: Variant, a: Array) -> Variant:
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


static func c1071_f_UpdateStats(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnKeyUp(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnMouseDown(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnMouseWheel(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseUp"), [v_event])
	if R.truth(R.unary("!", (c).fields.get("m_bDidFirstUpdate"))):
		pass
		return null
	R.call_member(c.fields.get("m_Player"), "StopFiring", [])
	return null


static func c1071_f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseOver"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", [])):
		pass
		R.call_member((c).fields.get("m_UpgradeScreen"), "OnMouseOver", [v_event])
	return null


static func c1071_f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "OnMouseOut"), [v_event])
	if R.truth(R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", [])):
		pass
		R.call_member((c).fields.get("m_UpgradeScreen"), "OnMouseOut", [v_event])
	return null


static func c1071_f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnZombieExploded(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnZombieKilled(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnZombieArmShot(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	R.call_member(c, "AddRP", [(v_zombie).fields.get("m_iPointsPerZombieArmShotOff"), true])
	return null


static func c1071_f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnSoldierShotDown(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnSoldierKilled(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnSoldierShotOffHood(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnSoldierGotOff(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnCivilianHit(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnCivilianShot(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnJetBombDodged(c: Variant, a: Array) -> Variant:
	if R.truth(((c.fields.get("m_Player")).fields.get("m_bFailed") or (c.fields.get("m_Player")).fields.get("m_bInEnding"))):
		pass
		return null
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iNbDodgedBombing", 1, "+=")
	return null


static func c1071_f_HandleBeenThereKilledThatAchievement(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((R.truth((c).fields.get("m_Helicopter")) and R.unary("!", R.call_member((c).fields.get("m_Helicopter"), "IsRetreating", [])))):
		pass
		R.call_member((c).fields.get("m_Helicopter"), "StartRetreat", [])
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iBestHitCombo"] = R.coerce(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iBestHitCombo")), float((c).fields.get("m_iBestHitCombo"))), "int")
	R.call_member(c, "HideTutorial", [])
	return null


static func c1071_f_OnCivilianDropped(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnCivilianTaken(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCiviliansTaken", 1, "+=")
	R.call_member(c, "AddRP", [R.static_value("RDGameModeGameplay", "PointsPerCivilianTaken"), true])
	return null


static func c1071_f_OnAimingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Aiming", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iAimingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null


static func c1071_f_OnHandlingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Handling", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iHandlingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null


static func c1071_f_OnReloadingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_szWeaponName"), "Reloading", (((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iReloadingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null


static func c1071_f_OnDrivingLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Diane", "Driving", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	else:
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Cocheta", "Driving", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null


static func c1071_f_OnToughnessLevelUp(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")):
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Diane", "Toughness", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	else:
		pass
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Cocheta", "Toughness", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel"), R.static_value("RDPlayer", "MaxOrganicLevel")])
	return null


static func c1071_f_OnLostFocus(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopControls", [])
	if R.truth(R.logical_and(R.logical_and(R.call_member(c.fields.get("m_Game"), "CanPause", []), func(): return R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))), func(): return R.unary("!", (c.fields.get("m_Player")).fields.get("m_bInEnding")))):
		pass
		R.call_member(c.fields.get("m_Game"), "SetPause", [true, R.static_value("RDGame", "PauseType_LostFocus")])
	return null


static func c1071_f_ActivateLocationInteraction(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_interaction: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_iType = R.coerce(R.call_member(v_interaction, "GetLocationType", []), "int")
	return null


static func c1071_f_OnTaskStarted(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	return null


static func c1071_f_CanPause(c: Variant, a: Array) -> Variant:
	return R.unary("!", R.call_member((c).fields.get("m_UpgradeScreen"), "IsShown", []))
	return null


static func c1071_f_StoreWeaponKill(c: Variant, a: Array) -> Variant:
	R.set_value(((c.fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_Data"), "m_iKills", 1, "+=")
	return null


static func c1071_f_CanSpawnMutants(c: Variant, a: Array) -> Variant:
	return ((R.binary("==", R.get_value((c).fields.get("m_Mutants"), "length"), 0) and (float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iVeryHardZombieLevel")))) and (float((c).fields.get("m_fMutantDelay")) > float(0)))
	return null


static func c1071_f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	return (float(R.num(R.get_value((c).fields.get("m_MutantDelayMins"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantDelayMins"), "length")) - float(1))))))) + float((float(randf()) * float(R.num(R.get_value((c).fields.get("m_MutantDelayRandoms"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantDelayRandoms"), "length")) - float(1))))))))))
	return null


static func c1071_f_GetMutantCount(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_MutantCounts"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_MutantCounts"), "length")) - float(1)))))
	return null


static func c1071_f_OnMutantDestroyed(c: Variant, a: Array) -> Variant:
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


static func c1071_f_GatherValidSpawnBuildings(c: Variant, a: Array) -> Variant:
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


static func c1071_f_GetSpawnBuildingLocation(c: Variant, a: Array) -> Variant:
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


static func c1071_f_UpdateRandomCity(c: Variant, a: Array) -> Variant:
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


static func c1071_f_SetNextSpawnLevel(c: Variant, a: Array) -> Variant:
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


static func c1071_f_CanSpawnZombies(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_CanSpawnCivilian(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_OnRampReached(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnJetDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_Jet"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetDestroyed")])
	(c).fields["m_Jet"] = R.coerce(null, "RDJet")
	return null


static func c1071_f_OnHelicopterDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_Helicopter"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterDestroyed")])
	(c).fields["m_Helicopter"] = R.coerce(null, "RDHelicopter")
	return null


static func c1071_f_CallChopperSupport(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnHelicopterAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_HelicopterAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed")])
	(c).fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	return null


static func c1071_f_GetRandomFeedZombieClass(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_FeedZombieClasses"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_FeedZombieClasses"), "length")]))
	return null


static func c1071_f_CanHaveBlockedPatterns(c: Variant, a: Array) -> Variant:
	return (((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c.fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"), "GetAmmoInMag", []), 0)) or ((((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_MountedMG")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c.fields.get("m_Player")).fields.get("m_WeaponMountedMG"), "GetAmmoInMag", []), 0)))
	return null


static func c1071_f_HideTutorial(c: Variant, a: Array) -> Variant:
	(c).fields["m_iTutorial"] = R.coerce(R.static_value("RDGameModeGameplay", "Tutorial_None"), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTutorial", [])
	return null


static func c1071_f_HandleSkillsIHaveThoseAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((float((c).fields.get("m_iComboCount")) >= float(R.static_value("RDAchievement", "SkillsIHaveThoseCount"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "SkillsIHaveThose"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "SkillsIHaveThose")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1071_f_HandleRapidResponseAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Game")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((float((c).fields.get("m_iComboCount")) >= float(R.static_value("RDAchievement", "RapidResponseCount"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "RapidResponse"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "RapidResponse")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1071_f_OnNewLevelArea(c: Variant, a: Array) -> Variant:
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


static func c1071_f_InitTotalLevelLength(c: Variant, a: Array) -> Variant:
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


static func c1071_f_GetJetDelay(c: Variant, a: Array) -> Variant:
	return (float(R.num(R.get_value((c).fields.get("m_JetDelayMins"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_JetDelayMins"), "length")) - float(1))))))) + float((float(randf()) * float(R.num(R.get_value((c).fields.get("m_JetDelayRandoms"), minf(float((c).fields.get("m_iLevel")), float((R.num(R.get_value((c).fields.get("m_JetDelayRandoms"), "length")) - float(1))))))))))
	return null


static func c1071_f_SuppressSoldiers(c: Variant, a: Array) -> Variant:
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


static func c1071_f_OnSeeRamp(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsHighwayLevel")):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayExitRampVoice", [])
	else:
		pass
		R.call_member(c.fields.get("m_Player"), "PlayRampVoice", [])
	return null


static func c1071_f_CanHaveExplodingCars(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_iLevel")) >= float((c).fields.get("m_iExplodingCarLevel")))
	return null


static func c1071_f_CanSpawnHiddenSoldier(c: Variant, a: Array) -> Variant:
	return ((float((c).fields.get("m_iLevel")) > float((c).fields.get("m_iHiddenSoldierLevel"))) or ((float((c).fields.get("m_iLevel")) == float((c).fields.get("m_iHiddenSoldierLevel"))) and R.unary("!", R.call_member(c, "HasActiveStoryDialog", []))))
	return null


static func c1071_f_CanPlayNotMovingDialog(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_SetNewgroundsScoreboard(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(R.klass("com.newgrounds.API"), "hasUserSession")):
		pass
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", true, "=")
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
	else:
		pass
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", false, "=")
		R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", true, "=")
	return null


static func c1071_f_OnPassportLogin(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "Login"), "mouseEnabled", false, "=")
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "USER_SIGNED_IN"), R.get_value(c, "onUserSignedIn")])
	R.call_static("com.newgrounds.API", "promptSignIn", [])
	return null


static func c1071_f_OnPassportNoThanks(c: Variant, a: Array) -> Variant:
	R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "visible", true, "=")
	R.set_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "visible", false, "=")
	return null


static func c1071_f_onUserSignedIn(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_e, "success")):
		pass
		R.call_member(c, "PostScore", [])
		R.call_member(c, "SetNewgroundsScoreboard", [])
	R.set_value(R.get_value(((c).fields.get("m_DistanceScreen")).fields.get("PassportPanel"), "Login"), "mouseEnabled", true, "=")
	return null


static func c1071_f_ReplenishEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_IsMountedMGEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_IsMountedRocketLauncherEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_InfiniteMountedWeaponEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_SwitchDriverEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_GetHelicopterLevel(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float((float((c).fields.get("m_iLevel")) - float((c).fields.get("m_iHelicopterLevel")))) + float(1)), 1, 10])
	return null


static func c1071_f_GetJetDrops(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float((float((c).fields.get("m_iLevel")) - float((c).fields.get("m_iJetLevel")))) + float(1)), 1, 4])
	return null


static func c1071_f_GetJetPlayDialogs(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_SteeringEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_BrakingEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_SwervingEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1071_f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_iMinSpawnMax")) + float((float((c).fields.get("m_fLevelDifficulty")) * float((float((c).fields.get("m_iMaxSpawnMax")) - float((c).fields.get("m_iMinSpawnMax")))))))
	return null


static func c1071_f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_fMinSpawnRate")) + float((float((c).fields.get("m_fLevelDifficulty")) * float((float((c).fields.get("m_fMaxSpawnRate")) - float((c).fields.get("m_fMinSpawnRate")))))))
	return null


static func c1071_f_NoSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_AllSoldierZombieEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_IsLavaInstantDeathEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_GetMaxSpawnZombies(c: Variant, a: Array) -> Variant:
	return R.unary("-", 1)
	return null


static func c1071_f_GetSpawnZombiesSide(c: Variant, a: Array) -> Variant:
	return 0
	return null


static func c1071_f_HasIndependantPlayerControl(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return "Distance"
	return null


static func c1071_f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", floorf(float((float((c).fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), 10)]), 100)
	return null


static func c1071_f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return "km"
	return null


static func c1071_f_CanSpawnGrub(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bCanSpawnGrub")
	return null


static func c1071_f_CanDoJetVoices(c: Variant, a: Array) -> Variant:
	return R.call_member(c, "IsFUBARMode", [])
	return null


static func c1071_f_HasRocketLauncher(c: Variant, a: Array) -> Variant:
	return (((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked") if R.truth(R.call_member(c, "UsingCustomMountedWeapons", [])) else ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked"))
	return null


static func c1071_f_HasMountedMG(c: Variant, a: Array) -> Variant:
	return (((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked") if R.truth(R.call_member(c, "UsingCustomMountedWeapons", [])) else ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_MountedMG")).fields.get("m_bUnlocked"))
	return null


static func c1071_f_SkipZombiesForTutorial(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1071_f_OnPostStartUpUpgradeScreen(c: Variant, a: Array) -> Variant:
	var v_music: Variant = null
	v_music = R.coerce(R.call_member(c, "GetMusic", []), "DTSound")
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [v_music, 0])
	return null


static func c1072_f_RDGameModeHardcore(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeHardcore"), [v_theGame])
	c.fields["m_bIsHardcore"] = true
	return null


static func c1072_f_OnStartDriverSelection(c: Variant, a: Array) -> Variant:
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	c.fields["m_bIsChopperShootingLevel"] = false
	return null


static func c1072_f_StartGameMode(c: Variant, a: Array) -> Variant:
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeHardcore"), "StartGameMode"), [])
	return null


static func c1072_f_SetSavedLevel(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iHardcoreStoryLevel"] = R.coerce(v_iLevel, "int")
	return null


static func c1072_f_GetSavedLevel(c: Variant, a: Array) -> Variant:
	return (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHardcoreStoryLevel")
	return null


static func c1072_f_CompleteStoryMode(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "HardcoreSurvival")))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "HardcoreSurvival")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1072_f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1073_f_RDGameModeMilitary(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeMilitary"), [v_theGame])
	c.fields["m_LevelLengths"] = R.coerce(R.construct(R.klass("Array"), [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400]), "Array")
	R.call_member(c, "InitTotalLevelLength", [])
	R.call_member(c, "InitPatterns", [])
	c.fields["m_bCanHaveChopperSupport"] = false
	c.fields["m_iHelicopterLevel"] = R.coerce(3, "int")
	c.fields["m_iHelicopterMissileLevel"] = R.coerce(5, "int")
	c.fields["m_iJetLevel"] = R.coerce(2, "int")
	c.fields["m_IntroDialog"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMilitary_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMilitary_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMilitary_3R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMilitary_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	c.fields["m_JetDelayMins"] = R.coerce(R.construct(R.klass("Array"), [65, 60, 55, 55, 50, 50, 45, 45, 40, 40]), "Array")
	c.fields["m_JetDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [40, 40, 35, 35, 30, 30, 25, 25, 20, 20]), "Array")
	return null


static func c1073_f_InitPatterns(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "InitPatterns"), [])
	c.fields["m_LevelNormalHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military01")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military02")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military03")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military04")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military05")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military06")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military07")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military08")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military09")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military10")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military11")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military12")])])
	R.call_member(c.fields.get("m_LevelNormalHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military13")])])
	c.fields["m_LevelHardHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military01")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military02")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military03")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military04")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military05")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military06")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military07")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military08")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military09")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military10")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military11")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military12")])])
	R.call_member(c.fields.get("m_LevelHardHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_military13")])])
	c.fields["m_LevelWeaponsHighwayPatterns"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member(c.fields.get("m_LevelWeaponsHighwayPatterns"), "AddValue", [R.construct(R.klass("RDLevelPatternCustomNew"), [R.klass("MC_LevelPattern_weapons01")])])
	return null


static func c1073_f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "Reset"), [])
	return null


static func c1073_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "BeginGameMode"), [])
	return null


static func c1073_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "EndGameMode"), [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null


static func c1073_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fLevelLength: Variant = NAN
	var v_fNextLevelStartPosition: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "UpdateGameplay"), [v_fDeltaTime])
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
		R.assign(c, "m_iLevel", "RDGameModeMilitary", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		c.fields["m_fLevelStartPosition"] = float(v_fNextLevelStartPosition)
		v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
		v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "FirstBlood"))) and (float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) >= float(R.static_value("RDAchievement", "FirstBloodDistance"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "FirstBlood")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1073_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMilitary"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowDistance"] = true
	c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBestMilitaryDistance"] = float(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance")), float(floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))))))
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
				R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "stats"), "submit"), ["F.U.B.A.R. Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance")])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1073_f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("F.U.B.A.R. Distance", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null


static func c1073_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
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
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance"), 10)]), 100), " KM"), "=")
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
						R.set_value(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGameModeMilitary"), "HIGH"), "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showScoreboardSubmit"), [floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "getUserName"), []), "F.U.B.A.R. Distance", v_scoreTypes, (c.fields.get("m_Game")).fields.get("m_RootMC")])
			R.call_member(c.fields.get("m_Game"), "PlayInterfaceSound", [])
	return null


static func c1073_f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null


static func c1073_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1073_f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c.fields.get("m_Player")).fields.get("m_Dialog")) or R.binary("!=", (c.fields.get("m_Player")).fields.get("m_Dialog"), c.fields.get("m_IntroDialog")))
	return null


static func c1073_f_ShouldSpawnSoldierForZombie(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1073_f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["F.U.B.A.R. Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMilitaryDistance")])
	return null


static func c1073_f_GetJetPlayDialogs(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1073_f_IsFUBARMode(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1073_f_CanSpawnHelicopter(c: Variant, a: Array) -> Variant:
	return ((((R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed")) and R.unary("!", c.fields.get("m_Helicopter"))) and R.unary("!", c.fields.get("m_HelicopterAlly"))) and (float(c.fields.get("m_iLevel")) >= float(c.fields.get("m_iHelicopterLevel")))) and (float(c.fields.get("m_fHelicopterDelay")) > float(0)))
	return null


static func c1073_f_IsZombieCheckpoint(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1074_f_RDGameModeMutant(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeMutant"), [v_theGame])
	c.fields["m_LevelLengths"] = R.coerce(R.construct(R.klass("Array"), [500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500, 500]), "Array")
	R.call_member(c, "InitTotalLevelLength", [])
	R.call_member(c, "InitPatterns", [])
	c.fields["m_MutantDelayMins"] = R.coerce(R.construct(R.klass("Array"), [5, 4, 3, 3, 3]), "Array")
	c.fields["m_MutantDelayRandoms"] = R.coerce(R.construct(R.klass("Array"), [3, 2.5, 2, 2]), "Array")
	c.fields["m_MutantCounts"] = R.coerce(R.construct(R.klass("Array"), [2, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6]), "Array")
	c.fields["m_iVeryHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_IntroDialog"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMutant_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMutant_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMutant_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroMutant_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	return null


static func c1074_f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMutant"), "Reset"), [])
	return null


static func c1074_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMutant"), "BeginGameMode"), [])
	return null


static func c1074_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMutant"), "EndGameMode"), [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null


static func c1074_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fLevelLength: Variant = NAN
	var v_fNextLevelStartPosition: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMutant"), "UpdateGameplay"), [v_fDeltaTime])
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
		R.assign(c, "m_iLevel", "RDGameModeMutant", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		c.fields["m_fLevelStartPosition"] = float(v_fNextLevelStartPosition)
		v_fLevelLength = float(R.num(R.get_value(c.fields.get("m_LevelLengths"), minf(float(c.fields.get("m_iLevel")), float((R.num(R.get_value(c.fields.get("m_LevelLengths"), "length")) - float(1)))))))
		v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	R.call_member(c, "UpdateRandomCity", [v_fDeltaTime])
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "MutantStomp"))) and (float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) >= float(R.static_value("RDAchievement", "MutantStompDistance"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "MutantStomp")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1074_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeMutant"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowDistance"] = true
	c.fields["m_fStatsTimer"] = float((float(R.static_value("RDGameModeGameplay", "PreStatsDelay")) - float(0.5)))
	c.fields["m_bShowStats"] = true
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fBestMutantDistance"] = float(maxf(float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance")), float(floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))))))
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
				R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "stats"), "submit"), ["Mutant Meltdown Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance")])
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1074_f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Mutant Meltdown Distance", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null


static func c1074_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
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
			R.set_value(R.get_value((c.fields.get("m_DistanceScreen")).fields.get("BestPoints"), "Value"), "text", R.binary("+", R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance"), 10)]), 100), " KM"), "=")
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
						R.set_value(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "stage"), "quality", R.get_value(R.resolve(c, "StageQuality", "RDGameModeMutant"), "HIGH"), "=")
						R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showScoreboardSubmit"), [floorf(float((float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))), R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "getUserName"), []), "Mutant Meltdown Distance", v_scoreTypes, (c.fields.get("m_Game")).fields.get("m_RootMC")])
			R.call_member(c.fields.get("m_Game"), "PlayInterfaceSound", [])
	return null


static func c1074_f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null


static func c1074_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1074_f_CanSpawnZombies(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1074_f_CanSpawnNormalZombies(c: Variant, a: Array) -> Variant:
	return false
	return null


static func c1074_f_GetMusic(c: Variant, a: Array) -> Variant:
	return (c.fields.get("m_Game")).fields.get("m_TenseMusic")
	return null


static func c1074_f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Mutant Meltdown Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestMutantDistance")])
	return null


static func c1075_f_RDGameModeSandbox(c: Variant, a: Array) -> Variant:
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


static func c1075_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "BeginGameMode"), [])
	R.call_member(c, "LoadExternalPattern", [])
	return null


static func c1075_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	R.call_member(c, "UpdatePatterns", [])
	return null


static func c1075_f_UpdatePatterns(c: Variant, a: Array) -> Variant:
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


static func c1075_f_LoadExternalPattern(c: Variant, a: Array) -> Variant:
	var v_mLoader: Variant = null
	var v_mRequest: Variant = null
	v_mLoader = R.coerce(R.construct(R.resolve(c, "Loader", "RDGameModeSandbox"), []), "Loader")
	v_mRequest = R.coerce(R.construct(R.resolve(c, "URLRequest", "RDGameModeSandbox"), ["LevelPatternEditor.swf"]), "URLRequest")
	R.invoke(R.get_value(R.get_value(v_mLoader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onCompleteHandler"), false, 0, true])
	R.invoke(R.get_value(v_mLoader, "load"), [v_mRequest])
	return null


static func c1075_f_onCompleteHandler(c: Variant, a: Array) -> Variant:
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


static func c1075_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeSandbox"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowStats"] = true
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1076_f_OnStartDriverSelection(c: Variant, a: Array) -> Variant:
	var v_iLevelTag: Variant = 0
	v_iLevelTag = R.coerce(0, "int")
	if R.truth((R.binary("==", (c).fields.get("m_iDebugLevel"), R.unary("-", 1)) and R.unary("!", (c).fields.get("m_bIsHardcore")))):
		pass
		v_iLevelTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iStoryLevel")) * float(7))) + float(5))), "int"), "int")
		if R.truth(R.binary("!=", R.binary("&", v_iLevelTag, R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iStoryLevel", 1, "-=")
	(c).fields["m_bIsChopperShootingLevel"] = false
	return null


static func c1076_f_OnPostStartUpUpgradeScreen(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "OnPostStartUpUpgradeScreen"), [])
	R.call_member(c, "DisplayLevel", [])
	return null


static func c1076_f_DisplayLevel(c: Variant, a: Array) -> Variant:
	var v_szLevelName: Variant = null
	v_szLevelName = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float(c.fields.get("m_iLevel")) * float(7))), "String")
	if R.truth(R.binary("!=", v_szLevelName, "")):
		pass
		R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", v_szLevelName])
	return null


static func c1076_f_GetMusic(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (c.fields.get("m_Game")).fields.get("m_TenseMusic")
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetMusic"), [])
	return null


static func c1076_f_OnJohnDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_John"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJohnDestroyed")])
	(c).fields["m_John"] = R.coerce(null, "RDJohnCar")
	return null


static func c1076_f_OnPreChangeLevel(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Mutants1")), 0)):
		pass
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMutantLevelFinished"] = true
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1076_f_OnStoryDialogFinished(c: Variant, a: Array) -> Variant:
	var v_iJet: Variant = 0
	var v_storyJet: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_iJet = R.coerce(0, "int")
	v_storyJet = R.coerce(null, "RDJet")
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_RadioRepair")), 0)):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bRadioRepaired"))):
			pass
			(c).fields["m_bRadioRepair"] = true
			(c).fields["m_fRadioRepairTime"] = float(1)
			(c).fields["m_iRadioRepairAttempt"] = R.coerce(0, "int")
	else:
		pass
		if R.truth(R.binary("==", (c.fields.get("m_Player")).fields.get("m_Dialog"), (c).fields.get("m_HelicopterVoice"))):
			pass
			(c.fields.get("m_HelicopterAlly")).fields["m_bShootingMode"] = true
		else:
			pass
			if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Jets")), 0)):
				pass
				v_iJet = R.coerce(0, "int")
				while R.truth(R.binary("<", v_iJet, R.get_value((c).fields.get("m_StoryJets"), "length"))):
					pass
					v_storyJet = R.coerce(R.get_value((c).fields.get("m_StoryJets"), v_iJet), "RDJet")
					R.call_member(v_storyJet, "StartStoryComeBack", [])
					v_iJet = R.signed32(v_iJet + 1)
				(c).fields["m_bPlayJetsComingBackDialog"] = true
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished")])
	(c).fields["m_StoryDialog"] = R.coerce(null, "Array")
	return null


static func c1076_f_CompleteStoryMode(c: Variant, a: Array) -> Variant:
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bStoryModeFinished"] = true
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "IntoTheWild")))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "IntoTheWild")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1076_f_OnHelicopterAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c.fields.get("m_HelicopterAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed")])
	c.fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	return null


static func c1076_f_OnJetAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_JetAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetAllyDestroyed")])
	(c).fields["m_JetAlly"] = R.coerce(null, "RDJetAlly")
	return null


static func c1076_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowStats"] = true
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTime", [])
	if R.truth((R.truth(c.fields.get("m_HelicopterAlly")) and R.unary("!", R.call_member(c.fields.get("m_HelicopterAlly"), "IsRetreating", [])))):
		pass
		R.call_member(c.fields.get("m_HelicopterAlly"), "StartRetreat", [])
	return null


static func c1076_f_HasActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return R.logical_or((c).fields.get("m_bPlayStoryDialog"), func(): return R.logical_and(R.truth((c).fields.get("m_StoryDialog")), func(): return R.call_member((c.fields.get("m_Player")).fields.get("m_DialogLine"), "IsPlaying", [])))
	return null


static func c1076_f_HasAnyActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_StoryDialog")), func(): return R.call_member((c.fields.get("m_Player")).fields.get("m_DialogLine"), "IsPlaying", []))
	return null


static func c1076_f_SetSavedLevel(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iStoryLevel"] = R.coerce(v_iLevel, "int")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fStoryProgress"] = float(c.fields.get("m_fLevelDifficulty"))
	return null


static func c1076_f_OnRadioRepaired(c: Variant, a: Array) -> Variant:
	(c).fields["m_RadioRepairedVoice"] = R.coerce((R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 3) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 3)), "DTSpacialSound")
	R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Diane") if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Cocheta")), (c).fields.get("m_RadioRepairedVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	(c.fields.get("m_Player")).fields["m_bForceBrake"] = false
	(c).fields["m_bRadioRepaired"] = true
	return null


static func c1076_f_OnHelicopterArrived(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_HelicopterVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	R.call_member(c.fields.get("m_Game"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_SupportChoppers")])
	return null


static func c1076_f_OnSeeRamp(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_EnterHighway")), 0)):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_RampVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	else:
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_ExitRampVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	return null


static func c1076_f_OnRampReached(c: Variant, a: Array) -> Variant:
	var v_bOnHighway: Variant = false
	v_bOnHighway = ((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iHighwayLevelStart"))) and (float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iHighwayLevelEnd"))))
	R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
	R.call_member(c, "UpdateSpawnableZombies", [])
	R.call_member(c, "SetSavedLevel", [c.fields.get("m_iLevel")])
	(c).fields["m_iLevelTag"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(5))), "int")
	(c).fields["m_iLevelTag2"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(6))), "int")
	c.fields["m_bIsHighwayLevel"] = ((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iHighwayLevelStart"))) and (float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iHighwayLevelEnd"))))
	c.fields["m_bStartAtHighSpeed"] = true
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(c.fields.get("m_Game"), "StartCinematic", [("ExitHighway" if R.truth(v_bOnHighway) else "EnterHighway"), false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth(c.fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 0])
	return null


static func c1076_f_OnSeeEndChopper(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_EndChopperVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	return null


static func c1076_f_OnJetsComing(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_JetsComingVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	return null


static func c1076_f_OnEndChopperReached(c: Variant, a: Array) -> Variant:
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponCocheta")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponCocheta"] = R.coerce(0, "int")
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponDiane")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponDiane"] = R.coerce(0, "int")
	R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
	R.call_member(c, "UpdateSpawnableZombies", [])
	R.call_member(c, "SetSavedLevel", [c.fields.get("m_iLevel")])
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(R.static_value("RDGame", "Instance"), "StartCinematic", ["ChopperTransition", false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	return null


static func c1076_f_OnJohnCalled(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_SeeJohnVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	return null


static func c1076_f_GetUnlimitedSpawning(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bIsChopperShootingLevel")
	return null


static func c1076_f_GetMutantCount(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "IsChopperMode", [])):
		pass
		return 1
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount4Level")))):
		pass
		return 4
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount3Level")))):
		pass
		return 3
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount2Level")))):
		pass
		return 2
	return 1
	return null


static func c1076_f_GetJetDrops(c: Variant, a: Array) -> Variant:
	var v_iDrops: Variant = 0
	v_iDrops = R.coerce(0, "int")
	if R.truth((float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iLessJetsLevel")))):
		pass
		v_iDrops = R.coerce(R.call_static("Maths", "Clamp", [floorf(float((float((float(c.fields.get("m_iLevel")) - float(c.fields.get("m_iJetLevel")))) * float(0.5)))), 1, 3]), "int")
	else:
		pass
		v_iDrops = R.coerce(maxf(float((float(3) - float(floorf(float((float((float(c.fields.get("m_iLevel")) - float((c).fields.get("m_iLessJetsLevel")))) * float(0.5))))))), float(1)), "int")
	return v_iDrops
	return null


static func c1076_f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return true
	return null


static func c1076_f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (20 if R.truth((c).fields.get("m_bIsHardcore")) else 10)
	if R.truth(((R.truth(((float(c.fields.get("m_iSpawnLevel")) >= float((c).fields.get("m_iChopperSupportStartLevel"))) and (float(c.fields.get("m_iSpawnLevel")) <= float((c).fields.get("m_iChopperSupportEndLevel"))))) and R.truth(c.fields.get("m_HelicopterAlly"))) and (c.fields.get("m_HelicopterAlly")).fields.get("m_bShootingMode"))):
		pass
		return 20
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetSpawnMax"), [])
	return null


static func c1076_f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (1 if R.truth((c).fields.get("m_bIsHardcore")) else 0.75)
	if R.truth(((R.truth(((float(c.fields.get("m_iSpawnLevel")) >= float((c).fields.get("m_iChopperSupportStartLevel"))) and (float(c.fields.get("m_iSpawnLevel")) <= float((c).fields.get("m_iChopperSupportEndLevel"))))) and R.truth(c.fields.get("m_HelicopterAlly"))) and (c.fields.get("m_HelicopterAlly")).fields.get("m_bShootingMode"))):
		pass
		return 1.25
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetSpawnRate"), [])
	return null


static func c1076_f_CanSpawnGrub(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking")))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "CanSpawnGrub"), [])
	return null


static func c1077_f_RDGameModeTime(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeTime"), [v_theGame])
	(c).fields["m_TimeOutSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	c.fields["m_LevelLengths"] = R.coerce(R.construct(R.klass("Array"), [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400]), "Array")
	R.call_member(c, "InitTotalLevelLength", [])
	R.call_member(c, "InitPatterns", [])
	c.fields["m_IntroDialog"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroTime_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ModeIntroTime_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	return null


static func c1077_f_StartGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "StartGameMode"), [])
	(c).fields["m_fTime"] = float(R.static_value("RDGameModeTime", "InitialTime"))
	(c).fields["m_fTimeFactor"] = float(1)
	return null


static func c1077_f_Reset(c: Variant, a: Array) -> Variant:
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "Reset"), [])
	return null


static func c1077_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "BeginGameMode"), [])
	return null


static func c1077_f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_TimeOutSound"), "Stop", [])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	return null


static func c1077_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
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


static func c1077_f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieKilled"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotDown"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnZombieShotByHelicopter(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotByHelicopter"), [v_zombie, v_iHitType])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotByHelicopterTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotByHelicopterTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieShotOffHood"), [v_zombie, v_iClingerState])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieShotDownTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieGotOff"), [v_zombie, v_bFromSideCollision])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieGotOffTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieGotOffTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnZombieExploded"), [v_zombie])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "ZombieExplodedTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "ZombieExplodedTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnCivilianHit"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [R.unary("-", R.static_value("RDGameModeTime", "CivilianTimePenalty"))])
	(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(R.static_value("RDGameModeTime", "CivilianTimePenalty")))), float(0)))
	return null


static func c1077_f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnCivilianShot"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [R.unary("-", R.static_value("RDGameModeTime", "CivilianTimePenalty"))])
	(c).fields["m_fTime"] = float(maxf(float((float((c).fields.get("m_fTime")) - float(R.static_value("RDGameModeTime", "CivilianTimePenalty")))), float(0)))
	return null


static func c1077_f_OnFeedersHit(c: Variant, a: Array) -> Variant:
	if R.truth((c.fields.get("m_Player")).fields.get("m_bFailed")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeTime"), "OnFeedersHit"), [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTimeBonus", [(float((float(R.static_value("RDGameModeTime", "FeedersHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))])
	(c).fields["m_fTime"] = R.coerce(R.binary("+", (c).fields.get("m_fTime"), (float((float(R.static_value("RDGameModeTime", "FeedersHitTimeBonus")) * float((c).fields.get("m_fTimeFactor")))) * float(pow(float(R.static_value("RDGameModeTime", "TimeComboMultiplier")), float(c.fields.get("m_iComboCount")))))), "Number")
	return null


static func c1077_f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
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


static func c1077_f_OnScorePosted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted")])
	((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Out Of Time Distance", "String")
	R.call_member((c.fields.get("m_DistanceScreen")).fields.get("ScoreBoard"), "loadScores", [])
	return null


static func c1077_f_UpdateDistanceScreen(c: Variant, a: Array) -> Variant:
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


static func c1077_f_OnArmorGamesScoreBoardClosed(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [c.fields.get("m_DistanceScreen")])
	c.fields["m_bShowDistance"] = false
	return null


static func c1077_f_OnDistanceScreenReady(c: Variant, a: Array) -> Variant:
	c.fields["m_bDistanceScreenReady"] = true
	return null


static func c1077_f_PostScore(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), R.get_value(c, "OnScorePosted"), 0, true])
	R.call_static("com.newgrounds.API", "postScore", ["Out Of Time Distance", ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_fBestDeadOnTimeDistance")])
	return null


static func c1091_f_Load(c: Variant, a: Array) -> Variant:
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	var v_iLevel: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSpawnRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	return 0
	return null


static func c1092_f_RDLevelPatternCustomData(c: Variant, a: Array) -> Variant:
	var v_customData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	R.invoke(R.super_ref(c, "RDLevelPatternCustomData"), [])
	(c).fields["m_CustomData"] = R.coerce(v_customData, "ByteArray")
	return null


static func c1092_f_Load(c: Variant, a: Array) -> Variant:
	var v_iNbChild: Variant = 0
	var v_i: Variant = 0
	var v_gameplayMode: Variant = null
	var v_spawnInfo: Variant = null
	var v_iNbEntities: Variant = 0
	var v_szName: Variant = null
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_entityInfo: Variant = null
	var v_entityProperties: Variant = null
	var v_iNbProperties: Variant = 0
	var v_p: Variant = 0
	var v_szPropertyName: Variant = null
	var v_iPropertyType: Variant = 0
	var v_propValue: Variant = null
	var v_iSlideIndex: Variant = 0
	var v_iRandom: Variant = 0
	var v_szClassName: Variant = null
	var v_entity: Variant = null
	var v_fPatternSpace: Variant = NAN
	var v_bFlip: Variant = false
	var v_iFileVersion: Variant = 0
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	var v_iLevel: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSpawnRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	v_iNbChild = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_spawnInfo = R.coerce(null, "RDPatternSpawnInfo")
	v_iNbEntities = R.coerce(0, "int")
	v_szName = R.coerce(null, "String")
	v_fX = float(NAN)
	v_fY = float(NAN)
	v_fZ = float(NAN)
	v_entityInfo = R.coerce(null, "RDEntitySpawnInfo")
	v_entityProperties = R.coerce(null, "Array")
	v_iNbProperties = R.coerce(0, "int")
	v_p = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_iPropertyType = R.coerce(0, "int")
	v_propValue = R.coerce(null, "*")
	v_iSlideIndex = R.coerce(0, "int")
	v_iRandom = R.coerce(0, "int")
	v_szClassName = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_gameplayMode = R.coerce(R.binary("as", v_gameMode, R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fPatternSpace = float(0)
	v_bFlip = ((c).fields.get("m_bAllowFlip") and (float(randf()) < float(0.5)))
	R.invoke(R.get_value((c).fields.get("m_Grounds"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Generics"), "splice"), [0])
	R.call_member((c).fields.get("m_Hazards"), "Clear", [])
	R.call_member((c).fields.get("m_SideHazards"), "Clear", [])
	R.call_member((c).fields.get("m_Zombies"), "Clear", [])
	R.call_member((c).fields.get("m_Soldiers"), "Clear", [])
	R.set_value((c).fields.get("m_CustomData"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(c).fields["m_iPatternType"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		v_iNbEntities = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbEntities))):
			pass
			v_szName = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "String")
			v_fX = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_fY = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_fZ = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_iNbProperties = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
			if R.truth((float(v_iNbProperties) > float(0))):
				pass
				v_entityProperties = R.coerce(R.construct(R.klass("Array"), []), "Array")
				v_p = R.coerce(0, "int")
				while R.truth((float(v_p) < float(v_iNbProperties))):
					pass
					v_szPropertyName = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "String")
					v_iPropertyType = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
					if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Number")))):
						pass
						v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "*")
					else:
						pass
						if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Boolean")))):
							pass
							v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readBoolean"), []), "*")
						else:
							pass
							if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_String")))):
								pass
								v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "*")
					R.invoke(R.get_value(v_entityProperties, "push"), [v_szPropertyName])
					R.invoke(R.get_value(v_entityProperties, "push"), [v_propValue])
					v_p = R.signed32(v_p + 1)
			if R.truth(R.call_member(c, "CanSpawn", [v_szName, v_fX, v_fY, v_fZ, v_gameplayMode, v_iLevel, v_fDifficulty])):
				pass
				v_entityInfo = R.coerce(R.call_member(c, "GetEntitySpawnInfo", []), "RDEntitySpawnInfo")
				(v_entityInfo).fields["m_szName"] = R.coerce(v_szName, "String")
				(v_entityInfo).fields["m_fX"] = float(v_fX)
				(v_entityInfo).fields["m_fY"] = float(v_fY)
				(v_entityInfo).fields["m_fZ"] = float(v_fZ)
				(v_entityInfo).fields["m_Properties"] = R.coerce(v_entityProperties, "Array")
				if R.truth(R.call_member(c, "IsGeneric", [v_szName])):
					pass
					R.invoke(R.get_value((c).fields.get("m_Generics"), "push"), [v_entityInfo])
				else:
					pass
					if R.truth(R.call_member(c, "IsHazard", [v_szName, v_gameplayMode])):
						pass
						if R.truth(R.binary("<=", R.call_static("Maths", "AbsNumber", [v_fX]), 10)):
							pass
							R.call_member((c).fields.get("m_Hazards"), "AddValue", [v_entityInfo])
						else:
							pass
							R.call_member((c).fields.get("m_SideHazards"), "AddValue", [v_entityInfo])
					else:
						pass
						if R.truth(R.call_member(c, "IsZombie", [v_szName])):
							pass
							R.call_member((c).fields.get("m_Zombies"), "AddValue", [v_entityInfo])
						else:
							pass
							if R.truth(R.call_member(c, "IsSoldier", [v_szName])):
								pass
								R.call_member((c).fields.get("m_Soldiers"), "AddValue", [v_entityInfo])
			v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Grounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_iSlideIndex = R.coerce((float((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((v_gameplayMode).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice")))) + float(v_i)), "int")
		R.call_member(c, "SpawnGround", [v_iSlideIndex, v_i, R.get_value((c).fields.get("m_Grounds"), v_i), v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bLavaMode")):
		pass
		v_iSlideIndex = R.coerce((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((v_gameplayMode).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(0))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(1))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(2))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(3))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(4))])
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Generics"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Generics"), v_i), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
		v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Hazards")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Hazards"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(10)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_SideHazards")).fields.get("m_Values"), "length")) * float(minf(float((float(v_fSpawnRatio) * float(1.5))), float(1)))))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_SideHazards"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Zombies")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Zombies"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			if R.truth(R.logical_and(R.binary("==", (v_entityInfo).fields.get("m_szName"), "ZombieSoldier"), func(): return R.call_member(v_gameplayMode, "NoSoldierZombieEnabled", []))):
				pass
				v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [5]), "int")
				if R.truth((float(v_iRandom) == float(0))):
					pass
					(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNormalMale", "String")
				else:
					pass
					if R.truth((float(v_iRandom) == float(1))):
						pass
						(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNormalFemale", "String")
					else:
						pass
						if R.truth((float(v_iRandom) == float(2))):
							pass
							(v_entityInfo).fields["m_szName"] = R.coerce("ZombieHard", "String")
						else:
							pass
							if R.truth((float(v_iRandom) == float(3))):
								pass
								(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNewFemale", "String")
							else:
								pass
								if R.truth((float(v_iRandom) == float(4))):
									pass
									(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNewMale", "String")
			else:
				pass
				if R.truth(R.logical_and(R.binary("!=", (v_entityInfo).fields.get("m_szName"), "ZombieSoldier"), func(): return R.call_member(v_gameplayMode, "AllSoldierZombieEnabled", []))):
					pass
					(v_entityInfo).fields["m_szName"] = R.coerce("ZombieSoldier", "String")
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Soldiers")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Soldiers"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bLavaMode")):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(16))):
			pass
			v_fX = R.coerce(((R.num(R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))) - float((float(randf()) * float(10)))) if R.truth((float(v_i) < float(8))) else (float(R.static_value("RDRoad", "SideWalkPosX")) + float((float(randf()) * float(10))))), "Number")
			v_fZ = float((float(1) + float((float(randf()) * float((float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(2)))))))
			v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [20]), "int")
			if R.truth((float(v_iRandom) < float(8))):
				pass
				v_szClassName = R.coerce("Smoke", "String")
			else:
				pass
				if R.truth((float(v_iRandom) < float(16))):
					pass
					v_szClassName = R.coerce("Fire", "String")
				else:
					pass
					if R.truth((float(v_iRandom) < float(18))):
						pass
						v_szClassName = R.coerce("BurningCar01", "String")
					else:
						pass
						if R.truth((float(v_iRandom) < float(20))):
							pass
							v_szClassName = R.coerce("BurningCar02", "String")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szClassName]), "RDEntity")
			((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(v_fZ)))
			((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", v_fX, R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation")).fields.get("Z")])), "Number")
			((v_entity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Number")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			v_i = R.signed32(v_i + 1)
	return (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))
	return null


static func c1092_f_CanSpawn(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_gameplayMode: Variant = R.coerce((a[4] if a.size() > 4 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[6] if a.size() > 6 else NAN), "Number")
	if R.truth(((c).fields.get("m_bLavaMode") and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))):
		pass
		return false
	if R.truth(((((((((((R.binary("==", v_szName, "ZombieRandom") or R.binary("==", v_szName, "ZombieNormalMale")) or R.binary("==", v_szName, "ZombieNormalFemale")) or R.binary("==", v_szName, "ZombieHard")) or R.binary("==", v_szName, "ZombieNewFemale")) or R.binary("==", v_szName, "ZombieNewMale")) or R.binary("==", v_szName, "ZombieSoldier")) or R.binary("==", v_szName, "ZombieRandomFeed")) or R.binary("==", v_szName, "ZombieNormalMaleFeed")) or R.binary("==", v_szName, "ZombieNormalFemaleFeed")) or R.binary("==", v_szName, "ZombieHardFeed"))):
		pass
		if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iHardZombieLevel")))):
			pass
			return false
	else:
		pass
		if R.truth((R.binary("==", v_szName, "ZombieMutant") or R.binary("==", v_szName, "ZombieMutantAlpha"))):
			pass
			if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iHardZombieLevel")))):
				pass
				return false
		else:
			pass
			if R.truth(R.binary("==", v_szName, "ZombieGrub")):
				pass
				if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iGrubLevel")))):
					pass
					return false
			else:
				pass
				if R.truth((R.binary("==", v_szName, "SoldierStationary") or R.binary("==", v_szName, "SoldierAlign"))):
					pass
					if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iAlignSoldierLevel")))):
						pass
						return false
				else:
					pass
					if R.truth(R.binary("==", v_szName, "SoldierSpikes")):
						pass
						if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel")))):
							pass
							return false
					else:
						pass
						if R.truth(R.binary("==", v_szName, "SoldierBomb")):
							pass
							if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iBombSoldierLevel")))):
								pass
								return false
						else:
							pass
							if R.truth((R.binary("==", v_szName, "Mine") or R.binary("==", v_szName, "MotionMine"))):
								pass
								if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iMineLevel")))):
									pass
									return false
							else:
								pass
								if R.truth(R.binary("==", v_szName, "Spikes")):
									pass
									if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikesLevel")))):
										pass
										return false
	return true
	return null


static func c1092_f_IsGeneric(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", v_szName, "BuildingResidentialRandom") or R.binary("==", v_szName, "BuildingTownRandom")) or R.binary("==", v_szName, "BuildingIndustrialRandom")) or R.binary("==", v_szName, "BuildingGarage")) or R.binary("==", v_szName, "BuildingPoliceStation1")) or R.binary("==", v_szName, "BuildingPoliceStation2")) or R.binary("==", v_szName, "BuildingChurch1")) or R.binary("==", v_szName, "BuildingChurch2")) or R.binary("==", v_szName, "BuildingResidential1")) or R.binary("==", v_szName, "BuildingResidential2")) or R.binary("==", v_szName, "BuildingResidential3")) or R.binary("==", v_szName, "BuildingResidential4")) or R.binary("==", v_szName, "BuildingResidential5")) or R.binary("==", v_szName, "BuildingResidential6")) or R.binary("==", v_szName, "BuildingResidential7")) or R.binary("==", v_szName, "BuildingResidential8")) or R.binary("==", v_szName, "BuildingResidential1Damage")) or R.binary("==", v_szName, "BuildingResidential3Damage")) or R.binary("==", v_szName, "BuildingTown1")) or R.binary("==", v_szName, "BuildingTown2")) or R.binary("==", v_szName, "BuildingTown3")) or R.binary("==", v_szName, "BuildingTown4")) or R.binary("==", v_szName, "BuildingTown5")) or R.binary("==", v_szName, "BuildingTown6")) or R.binary("==", v_szName, "BuildingTown7")) or R.binary("==", v_szName, "BuildingTown8")) or R.binary("==", v_szName, "BuildingTown9")) or R.binary("==", v_szName, "BuildingTown10")) or R.binary("==", v_szName, "BuildingTown11")) or R.binary("==", v_szName, "BuildingTown12")) or R.binary("==", v_szName, "BuildingTown3Damage")) or R.binary("==", v_szName, "BuildingTown7Damage")) or R.binary("==", v_szName, "BuildingTown11Damage")) or R.binary("==", v_szName, "BuildingTown12Damage")) or R.binary("==", v_szName, "BuildingIndustrial1")) or R.binary("==", v_szName, "BuildingIndustrial2")) or R.binary("==", v_szName, "BuildingIndustrial3")) or R.binary("==", v_szName, "BuildingIndustrial4")) or R.binary("==", v_szName, "BuildingIndustrial1Damage")) or R.binary("==", v_szName, "BuildingIndustrial4Damage")) or R.binary("==", v_szName, "BGBuildingResidentialRandom")) or R.binary("==", v_szName, "BGBuildingTownRandom")) or R.binary("==", v_szName, "BGBuildingIndustrialRandom")) or R.binary("==", v_szName, "BGBuildingMixedRandom")) or R.binary("==", v_szName, "CivilianLeft")) or R.binary("==", v_szName, "CivilianRight")) or R.binary("==", v_szName, "Bush1")) or R.binary("==", v_szName, "Bush2")) or R.binary("==", v_szName, "Bush3")) or R.binary("==", v_szName, "Bush3")) or R.binary("==", v_szName, "SmallHillTop")) or R.binary("==", v_szName, "GrassTop")) or R.binary("==", v_szName, "FireHydrant")) or R.binary("==", v_szName, "FireHydrantFlowing")) or R.binary("==", v_szName, "RoadBlood")) or R.binary("==", v_szName, "WaterJug")) or R.binary("==", v_szName, "HighwayRamp")) or R.binary("==", v_szName, "Box")) or R.binary("==", v_szName, "ConstructionSign")) or R.binary("==", v_szName, "ElectronicSign")) or R.binary("==", v_szName, "GardenGnome")) or R.binary("==", v_szName, "LawnFlamingo")) or R.binary("==", v_szName, "MailBox")) or R.binary("==", v_szName, "RoadKill")) or R.binary("==", v_szName, "ShoppingCart")) or R.binary("==", v_szName, "Table")) or R.binary("==", v_szName, "TrafficBarrel")) or R.binary("==", v_szName, "TrafficCone")) or R.binary("==", v_szName, "TrafficLight")) or R.binary("==", v_szName, "TrashCan")) or R.binary("==", v_szName, "BeerKeg")) or R.binary("==", v_szName, "Cherub")) or R.binary("==", v_szName, "Pumpkin")) or R.binary("==", v_szName, "Snowman")) or R.binary("==", v_szName, "ValentineTable")) or R.binary("==", v_szName, "WaterMelon")) or R.binary("==", v_szName, "Chopper")) or R.binary("==", v_szName, "WeaponCrate"))):
		pass
		return true
	return false
	return null


static func c1092_f_IsHazard(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", v_szName, "BurningCar01") or R.binary("==", v_szName, "BurningCar02")) or R.binary("==", v_szName, "SmallCarNarrowRandom")) or R.binary("==", v_szName, "SmallCarWideRandom")) or R.binary("==", v_szName, "SmallCar01")) or R.binary("==", v_szName, "SmallCar02")) or R.binary("==", v_szName, "SmallCar03")) or R.binary("==", v_szName, "SmallCar04")) or R.binary("==", v_szName, "SmallCar05")) or R.binary("==", v_szName, "SmallCar06")) or R.binary("==", v_szName, "SmallCar07")) or R.binary("==", v_szName, "SmallCar08")) or R.binary("==", v_szName, "SmallCar09")) or R.binary("==", v_szName, "SmallCar10")) or R.binary("==", v_szName, "SmallCar12")) or R.binary("==", v_szName, "SmallCar13")) or R.binary("==", v_szName, "MediumCarNarrowRandom")) or R.binary("==", v_szName, "MediumCarWideRandom")) or R.binary("==", v_szName, "MediumCar01")) or R.binary("==", v_szName, "MediumCar02")) or R.binary("==", v_szName, "MediumCar03")) or R.binary("==", v_szName, "MediumCar04")) or R.binary("==", v_szName, "MediumCar05")) or R.binary("==", v_szName, "MediumCar06")) or R.binary("==", v_szName, "MediumCar07")) or R.binary("==", v_szName, "MediumCar08")) or R.binary("==", v_szName, "MediumCar09")) or R.binary("==", v_szName, "MediumCar10")) or R.binary("==", v_szName, "MediumCar11")) or R.binary("==", v_szName, "MediumCar13")) or R.binary("==", v_szName, "MediumCar14")) or R.binary("==", v_szName, "MediumCar15")) or R.binary("==", v_szName, "LargeCarNarrowRandom")) or R.binary("==", v_szName, "LargeCarWideRandom")) or R.binary("==", v_szName, "LargeCar01")) or R.binary("==", v_szName, "LargeCar02")) or R.binary("==", v_szName, "LargeCar03")) or R.binary("==", v_szName, "LargeCar04")) or R.binary("==", v_szName, "LargeCar05")) or R.binary("==", v_szName, "LargeCar06")) or R.binary("==", v_szName, "LargeCar07")) or R.binary("==", v_szName, "LargeCar08")) or R.binary("==", v_szName, "LargeCar09")) or R.binary("==", v_szName, "LargeCar10")) or R.binary("==", v_szName, "LargeCar11")) or R.binary("==", v_szName, "LargeCar12")) or R.binary("==", v_szName, "LargeCar13")) or R.binary("==", v_szName, "LargeCar14")) or R.binary("==", v_szName, "LargeCar15")) or R.binary("==", v_szName, "LargeCar16")) or R.binary("==", v_szName, "LargeCar17")) or R.binary("==", v_szName, "Ambulance")) or R.binary("==", v_szName, "HummerWide")) or R.binary("==", v_szName, "HummerWideDamaged")) or R.binary("==", v_szName, "HummerNarrow")) or R.binary("==", v_szName, "HummerNarrowDamaged")) or R.binary("==", v_szName, "ArmyTruck")) or R.binary("==", v_szName, "FuelTruck")) or R.binary("==", v_szName, "FireTruck")) or R.binary("==", v_szName, "Bus")) or R.binary("==", v_szName, "Semi")) or R.binary("==", v_szName, "RandomTree")) or R.binary("==", v_szName, "MapleTree")) or R.binary("==", v_szName, "AltTree")) or R.binary("==", v_szName, "PineTree")) or R.binary("==", v_szName, "DeadTree")) or R.binary("==", v_szName, "Barracade")) or R.binary("==", v_szName, "Dumpster")) or R.binary("==", v_szName, "Fence")) or R.binary("==", v_szName, "Mine")) or R.binary("==", v_szName, "MotionMine")) or R.binary("==", v_szName, "Oil")) or R.binary("==", v_szName, "SandBags")) or R.binary("==", v_szName, "SandBagsBloody")) or R.binary("==", v_szName, "Spikes")) or R.binary("==", v_szName, "TombRandom")) or R.binary("==", v_szName, "Tomb1")) or R.binary("==", v_szName, "Tomb2")) or R.binary("==", v_szName, "Tomb3")) or R.binary("==", v_szName, "PassingCar"))):
		pass
		return true
	return false
	return null


static func c1092_f_IsZombie(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((((((((((((R.binary("==", v_szName, "ZombieRandom") or R.binary("==", v_szName, "ZombieRandomFeed")) or R.binary("==", v_szName, "ZombieNormalMale")) or R.binary("==", v_szName, "ZombieNormalFemale")) or R.binary("==", v_szName, "ZombieHard")) or R.binary("==", v_szName, "ZombieNewFemale")) or R.binary("==", v_szName, "ZombieNewMale")) or R.binary("==", v_szName, "ZombieSoldier")) or R.binary("==", v_szName, "ZombieMutant")) or R.binary("==", v_szName, "ZombieMutantAlpha")) or R.binary("==", v_szName, "ZombieNormalMaleFeed")) or R.binary("==", v_szName, "ZombieNormalFemaleFeed")) or R.binary("==", v_szName, "ZombieHardFeed")) or R.binary("==", v_szName, "ZombieGrub"))):
		pass
		return true
	return false
	return null


static func c1092_f_IsSoldier(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((R.binary("==", v_szName, "SoldierAlign") or R.binary("==", v_szName, "SoldierBomb")) or R.binary("==", v_szName, "SoldierSpikes")) or R.binary("==", v_szName, "SoldierStationary"))):
		pass
		return true
	return false
	return null


static func c1092_f_SpawnYellowDots(c: Variant, a: Array) -> Variant:
	var v_yellowDot: Variant = null
	var v_iNbDots: Variant = 0
	var v_i: Variant = 0
	var v_fStartPosition: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_iSlicePos: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_iSliceType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: Variant = R.coerce((a[3] if a.size() > 3 else null), "RDGameModeGameplay")
	v_yellowDot = R.coerce(null, "RDObject")
	v_iNbDots = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	if R.truth((((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Town"))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))))):
		pass
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
	else:
		pass
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
			pass
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
		else:
			pass
			if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(14))):
					pass
					v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDWhiteLine")]), R.klass("RDObject")), "RDObject")
					R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.binary("+", R.unary("-", 20), R.binary("/", (float(v_i) * float((float(20) * float(2)))), 14)), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
					v_i = R.signed32(v_i + 1)
	return null


static func c1092_f_SpawnGround(c: Variant, a: Array) -> Variant:
	var v_p: Variant = 0
	var v_fPerlinSpeedX: Variant = NAN
	var v_fPerlinSpeedY: Variant = NAN
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPosIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: Variant = R.coerce((a[3] if a.size() > 3 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[6] if a.size() > 6 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[7] if a.size() > 7 else NAN), "Number")
	var v_bFlip: Variant = R.coerce((a[8] if a.size() > 8 else false), "Boolean")
	v_p = R.coerce(0, "int")
	v_fPerlinSpeedX = float(NAN)
	v_fPerlinSpeedY = float(NAN)
	v_fPerlinSpeedX = float(0.001)
	v_fPerlinSpeedY = float(0.0008)
	if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
		pass
		v_fPerlinSpeedX = float(0.0005)
		v_fPerlinSpeedY = float(0.0001)
	else:
		pass
		if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
			pass
			v_fPerlinSpeedX = float(0)
			v_fPerlinSpeedY = float(0.0012)
		else:
			pass
			if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
				pass
				v_fPerlinSpeedX = float(0)
				v_fPerlinSpeedY = float(0.0008)
			else:
				pass
				if R.truth(((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking"))) or (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_ChopperShooting"))))):
					pass
					v_fPerlinSpeedX = float(0)
					v_fPerlinSpeedY = float(0)
	R.call_member((v_gameplayMode).fields.get("m_Road"), "SetRoadSlice", [v_iType, v_iIndex])
	((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(R.static_value("RDRoad", "RenderStepSize"))
	v_p = R.coerce(0, "int")
	while R.truth((float(v_p) < float(R.static_value("RDRoad", "RenderStepSize")))):
		pass
		R.call_static("RDWorld", "AddPerlinTrackPoint", [v_fPerlinSpeedX, v_fPerlinSpeedY])
		v_p = R.signed32(v_p + 1)
	R.call_member(c, "SpawnYellowDots", [v_fStartPosition, R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_iPosIndex) * float(R.static_value("RDRoad", "RenderStepSize")))]), v_iType, v_gameplayMode])
	return null


static func c1092_f_Spawn(c: Variant, a: Array) -> Variant:
	var v_carSpawnInfo: Variant = null
	var v_fObjectPosX: Variant = NAN
	var v_fObjectPosZ: Variant = NAN
	var v_i: Variant = 0
	var v_szPropertyName: Variant = null
	var v_propertyValue: Variant = null
	var v_entity: Variant = null
	var v_entityInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntitySpawnInfo")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	var v_bFlip: Variant = R.coerce((a[6] if a.size() > 6 else false), "Boolean")
	v_carSpawnInfo = R.coerce(null, "RDCarSpawnInfo")
	v_fObjectPosX = float(NAN)
	v_fObjectPosZ = float(NAN)
	v_i = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_propertyValue = R.coerce(null, "*")
	v_entity = R.coerce(null, "RDEntity")
	((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(0)
	v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [(v_entityInfo).fields.get("m_szName")]), "RDEntity")
	if R.truth(v_entity):
		pass
		v_fObjectPosX = float((float((v_entityInfo).fields.get("m_fX")) * R.num((R.unary("-", 1) if R.truth(v_bFlip) else 1))))
		v_fObjectPosZ = float((float((v_entityInfo).fields.get("m_fZ")) * float(v_fStretch)))
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(v_fObjectPosX)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float(v_fObjectPosZ)
		((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ"))))
		((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation")).fields.get("Z")])), "Number")
		((v_entity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		R.call_member(v_entity, "UpdateFlip", [])
		if R.truth((v_entityInfo).fields.get("m_Properties")):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value((v_entityInfo).fields.get("m_Properties"), "length"))):
				pass
				v_szPropertyName = R.coerce(R.get_value((v_entityInfo).fields.get("m_Properties"), v_i), "String")
				v_propertyValue = R.coerce(R.get_value((v_entityInfo).fields.get("m_Properties"), (float(v_i) + float(1))), "*")
				R.call_member(v_entity, "SetProperty", [v_szPropertyName, v_propertyValue])
				v_i = R.coerce(R.binary("+", v_i, 2), "int")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
	else:
		pass
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(0)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float((float((v_entityInfo).fields.get("m_fZ")) * float(v_fStretch)))
	return (c).fields.get("m_SpawnInfo")
	return null


static func c1092_f_GetFlippedGround(c: Variant, a: Array) -> Variant:
	var v_iSliceType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bFlip: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(v_bFlip):
		pass
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))):
			pass
			return R.static_value("RDRoad", "SliceType_GrassAndPavement")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndGrass")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))):
			pass
			return R.static_value("RDRoad", "SliceType_GrassAndDirt")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))):
			pass
			return R.static_value("RDRoad", "SliceType_DirtAndGrass")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndDirt")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt")))):
			pass
			return R.static_value("RDRoad", "SliceType_DirtAndPavement")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndSnow")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow")))):
			pass
			return R.static_value("RDRoad", "SliceType_SnowAndPavement")
	return v_iSliceType
	return null


static func c1092_f_GetEntitySpawnInfo(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "length"), 0)):
		pass
		return R.binary("as", R.invoke(R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "pop"), []), R.klass("RDEntitySpawnInfo"))
	return R.construct(R.klass("RDEntitySpawnInfo"), [])
	return null


static func c1092_f_ReturnEntitySpawnInfo(c: Variant, a: Array) -> Variant:
	var v_spawnInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntitySpawnInfo")
	R.invoke(R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "push"), [v_spawnInfo])
	return null


static func c1169_f_GetLaneXPos(c: Variant, a: Array) -> Variant:
	var v_iLane: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var __t1 = v_iLane
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, 0):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, 2):
		__t2 = 1
	if __t2 == -1:
		__t2 = 2
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			return R.static_value("RDRoad", "Lane1PosX")
		if __t2 >= 0 and __t2 <= 1:
			pass
			return R.static_value("RDRoad", "Lane3PosX")
		if __t2 >= 0 and __t2 <= 2:
			pass
			return R.static_value("RDRoad", "Lane2PosX")
	return null


static func c1169_f_GetLaneFromXPos(c: Variant, a: Array) -> Variant:
	var v_fPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return floorf(float(R.binary("/", (float(v_fPosX) + float(R.static_value("RDRoad", "RoadLimit"))), (float(R.static_value("RDRoad", "LaneHalfWidth")) * float(2)))))
	return null


static func c1169_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoad"), "SetInitialState"), [])
	(c).fields["m_bAddSliceEntities"] = true
	R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [0])
	(c).fields["m_SliceEntity"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_SliceEntityGround"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_bLastSliceLava"] = false
	(c).fields["m_iAreaSliceIndex"] = R.coerce(0, "int")
	(c).fields["m_iMode"] = R.coerce(R.static_value("RDRoad", "Mode_Normal"), "int")
	R.call_member(c, "Reset", [])
	return null


static func c1169_f_TestBulletHit(c: Variant, a: Array) -> Variant:
	var v_bHit: Variant = false
	var v_bHitWall: Variant = false
	var v_effectClasses: Variant = null
	var v_effectSounds: Variant = null
	var v_positions3D1: Variant = null
	var v_positions3D2: Variant = null
	var v_fPerlinX: Variant = NAN
	var v_fPerlinX1: Variant = NAN
	var v_fPerlinX2: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fPerlinY1: Variant = NAN
	var v_fPerlinY2: Variant = NAN
	var v_fHalfWall: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPosZ1: Variant = NAN
	var v_fPosZ2: Variant = NAN
	var v_fWallPos: Variant = NAN
	var v_iType: Variant = 0
	var v_iPreviousType: Variant = 0
	var v_bHasFrontWall: Variant = false
	var v_effectClass: Variant = null
	var v_impactEffect: Variant = null
	var v_effectSound: Variant = null
	var v_iMaterial: Variant = 0
	var v_camera: Variant = null
	var v_gameplayMode: Variant = null
	var v_fAxisAngle: Variant = NAN
	var v_fAngle: Variant = NAN
	var v_i: Variant = 0
	var v_bulletInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDBulletInfo")
	var v_weapon: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDWeapon")
	v_bHit = false
	v_bHitWall = false
	v_effectClasses = R.coerce(null, "Array")
	v_effectSounds = R.coerce(null, "Array")
	v_positions3D1 = R.coerce(null, "Array")
	v_positions3D2 = R.coerce(null, "Array")
	v_fPerlinX = float(NAN)
	v_fPerlinX1 = float(NAN)
	v_fPerlinX2 = float(NAN)
	v_fPerlinY = float(NAN)
	v_fPerlinY1 = float(NAN)
	v_fPerlinY2 = float(NAN)
	v_fHalfWall = float(NAN)
	v_fPosZ = float(NAN)
	v_fPosZ1 = float(NAN)
	v_fPosZ2 = float(NAN)
	v_fWallPos = float(NAN)
	v_iType = R.coerce(0, "int")
	v_iPreviousType = R.coerce(0, "int")
	v_bHasFrontWall = false
	v_effectClass = R.coerce(null, "Class")
	v_impactEffect = R.coerce(null, "RDImpactEffect")
	v_effectSound = R.coerce(null, "DTSpacialSound")
	v_iMaterial = R.coerce(R.static_value("RDRoad", "Material_Pavement"), "int")
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	((c).fields.get("m_vBulletPos")).fields["X"] = float((v_bulletInfo).fields.get("m_fPosX"))
	((c).fields.get("m_vBulletPos")).fields["Y"] = float((v_bulletInfo).fields.get("m_fPosY"))
	R.call_member(v_camera, "Unproject2DToDir3D", [(c).fields.get("m_vBulletPos"), (c).fields.get("m_vCamDir")])
	R.invoke(R.get_value((c).fields.get("m_mRot"), "identity"), [])
	R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [((v_camera).fields.get("m_vRotation")).fields.get("Y"), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
	v_fAxisAngle = float((float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)))
	R.set_value((c).fields.get("m_vAxis"), "z", cos(float(v_fAxisAngle)), "=")
	v_fAngle = float((float(randf()) * R.num(R.call_member(v_weapon, "GetBulletSpreadAngle", []))))
	R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [v_fAngle, (c).fields.get("m_vAxis")])
	R.set_value((c).fields.get("m_vTempDir"), "x", ((c).fields.get("m_vCamDir")).fields.get("X"), "=")
	R.set_value((c).fields.get("m_vTempDir"), "y", ((c).fields.get("m_vCamDir")).fields.get("Y"), "=")
	R.set_value((c).fields.get("m_vTempDir"), "z", ((c).fields.get("m_vCamDir")).fields.get("Z"), "=")
	(c).fields["m_vTempDir"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_mRot"), "transformVector"), [(c).fields.get("m_vTempDir")]), "Vector3D")
	((c).fields.get("m_vCamDir")).fields["X"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "x"), "Number")
	((c).fields.get("m_vCamDir")).fields["Y"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "y"), "Number")
	((c).fields.get("m_vCamDir")).fields["Z"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "z"), "Number")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(4))):
		pass
		if R.truth(R.binary(">", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
			pass
			v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_iPreviousType = R.coerce((c).fields.get("m_iLastSliceType"), "int")
			if R.truth((float(v_i) > float(0))):
				pass
				v_iPreviousType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_i) - float(1))), "int"), "int")
			v_bHasFrontWall = ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))) and (float(v_iPreviousType) != float(R.static_value("RDRoad", "SliceType_Alleyway"))))
			if R.truth(v_bHasFrontWall):
				pass
				v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i), R.klass("Array")), "Array")
				v_fPosZ = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 5), "Z")), "Number")
				v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
				v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
				R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "AlleywayPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "FarWallPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "AlleywayPosX"))), v_fPerlinY, v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "FarWallPosX"))), v_fPerlinY, v_fPosZ])
				v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
				if R.truth(v_bHitWall):
					pass
					v_bHit = true
					break
				R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "FarWallPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "AlleywayPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "FarWallPosX"))), v_fPerlinY, v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "AlleywayPosX"))), v_fPerlinY, v_fPosZ])
				v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
				if R.truth(v_bHitWall):
					pass
					v_bHit = true
					break
			v_positions3D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), (R.static_value("RDRoad", "Layer_Highway") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "Layer_Main"))), v_i), R.klass("Array")), "Array")
			v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), (R.static_value("RDRoad", "Layer_Highway") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "Layer_Main"))), (float(v_i) + float(1))), R.klass("Array")), "Array")
			v_fWallPos = R.coerce((R.static_value("RDRoad", "AlleywayPosX") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))) else (R.static_value("RDRoad", "SideRoadPosX") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "FarWallPosX"))), "Number")
			v_fPosZ1 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D1, 0), "Z")), "Number")
			v_fPosZ2 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 0), "Z")), "Number")
			v_fPerlinX1 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ1]), "Number")
			v_fPerlinX2 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ2]), "Number")
			v_fPerlinY1 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ1]), "Number")
			v_fPerlinY2 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ2]), "Number")
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
		else:
			pass
			v_positions3D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i), R.klass("Array")), "Array")
			v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), (float(v_i) + float(1))), R.klass("Array")), "Array")
			v_fWallPos = float(R.static_value("RDRoad", "SideRoadPosX"))
			v_fPosZ1 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D1, 0), "Z")), "Number")
			v_fPosZ2 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 0), "Z")), "Number")
			v_fPerlinX1 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ1]), "Number")
			v_fPerlinX2 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ2]), "Number")
			v_fPerlinY1 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ1]), "Number")
			v_fPerlinY2 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ2]), "Number")
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
		v_i = R.signed32(v_i + 1)
	if R.truth(v_bHit):
		pass
		v_iMaterial = R.coerce(R.call_member(c, "GetGroundMaterialAt", [(c).fields.get("m_vHitLocation")]), "int")
		if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Pavement")))):
			pass
			v_effectClasses = R.coerce((c).fields.get("m_PavementHitEffects"), "Array")
			v_effectSounds = R.coerce((c).fields.get("m_PavementHitSounds"), "Array")
		else:
			pass
			if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Concrete")))):
				pass
				v_effectClasses = R.coerce(((c).fields.get("m_ConcreteWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_ConcreteHitEffects")), "Array")
				v_effectSounds = R.coerce((c).fields.get("m_ConcreteHitSounds"), "Array")
			else:
				pass
				if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Grass")))):
					pass
					v_effectClasses = R.coerce(((c).fields.get("m_GrassWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_GrassHitEffects")), "Array")
					v_effectSounds = R.coerce((c).fields.get("m_GrassHitSounds"), "Array")
				else:
					pass
					if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Dirt")))):
						pass
						v_effectClasses = R.coerce((c).fields.get("m_DirtHitEffects"), "Array")
						v_effectSounds = R.coerce((c).fields.get("m_DirtHitSounds"), "Array")
					else:
						pass
						if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Snow")))):
							pass
							v_effectClasses = R.coerce(((c).fields.get("m_SnowWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_SnowHitEffects")), "Array")
							v_effectSounds = R.coerce((c).fields.get("m_SnowHitSounds"), "Array")
						else:
							pass
							if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Lava")))):
								pass
								v_effectClasses = R.coerce(((c).fields.get("m_LavaWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_LavaHitEffects")), "Array")
								v_effectSounds = R.coerce((c).fields.get("m_LavaHitSounds"), "Array")
		if R.truth((R.truth(v_effectClasses) and R.truth(v_effectSounds))):
			pass
			v_effectClass = R.coerce(R.get_value(v_effectClasses, R.call_static("Maths", "RandomInt", [R.get_value(v_effectClasses, "length")])), "Class")
			v_impactEffect = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDImpactEffect")]), R.klass("RDImpactEffect")), "RDImpactEffect")
			R.call_member(v_impactEffect, "Init", [v_effectClass])
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_impactEffect, ((c).fields.get("m_vHitLocation")).fields.get("X"), ((c).fields.get("m_vHitLocation")).fields.get("Y"), ((c).fields.get("m_vHitLocation")).fields.get("Z")])
			v_effectSound = R.coerce(R.binary("as", R.get_value(v_effectSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_effectSounds, "length")])), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(v_impactEffect, "PlaySoundOnActor", [v_effectSound])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iPropertyValue"), R.binary("+", R.unary("-", 1), R.call_static("Maths", "RandomInt", [3])))), "int")
	return null


static func c1169_f_SetLavaSlice(c: Variant, a: Array) -> Variant:
	var v_bLava: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_LavaRoadSlices"), "length"), 0)):
		pass
		(c).fields["m_bLastSliceLava"] = v_bLava
	while R.truth(R.binary(">=", v_iIndex, R.get_value((c).fields.get("m_LavaRoadSlices"), "length"))):
		pass
		R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "push"), [false])
	R.set_value((c).fields.get("m_LavaRoadSlices"), v_iIndex, v_bLava, "=")
	return null


static func c1169_f_AddBackwardRoadSlice(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "unshift"), [v_iType])
	return null


static func c1169_f_GetRoadLimit(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return R.static_value("RDRoad", "AlleywayPosX")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	return R.static_value("RDRoad", "FarWallPosX")
	return null


static func c1169_f_GetRoadLimitAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iType = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_iRoadSlice = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return R.static_value("RDRoad", "AlleywayPosX")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	return R.static_value("RDRoad", "FarWallPosX")
	return null


static func c1169_f_GetRoadAreaAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iType = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_iRoadSlice = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return (float(R.static_value("RDRoad", "SideRoadPosX")) - float(1))
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return (float(R.static_value("RDRoad", "AlleywayLimit")) - float(1))
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
		pass
		return (float(R.static_value("RDRoad", "ParkingLimit")) - float(1))
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return (float(R.static_value("RDRoad", "RoadLimit")) - float(1))
	return (float(R.static_value("RDRoad", "SideWalkPosX")) - float(1))
	return null


static func c1169_f_GetRoadSliceType(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SliceType_Highway")
	return R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int")
	return null


static func c1169_f_GetGroundMaterialAt(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = null
	var v_iSlice: Variant = 0
	var v_bLava: Variant = false
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	v_iSlice = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [(v_vPos).fields.get("Z")]), "int")
	v_bLava = R.coerce(R.call_member(c, "IsLavaAt", [(v_vPos).fields.get("Z")]), "Boolean")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(v_vPos).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(v_vPos).fields.get("Z")]), "Number")
	if R.truth((float((float((v_vPos).fields.get("Y")) - float(v_fPerlinY))) > float(0.01))):
		pass
		if R.truth((v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))):
			pass
			return R.static_value("RDRoad", "Material_Lava")
		if R.truth((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Park"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
			pass
			return R.static_value("RDRoad", "Material_Grass")
		if R.truth(((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Snow"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Ice")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
			pass
			return R.static_value("RDRoad", "Material_Snow")
		return R.static_value("RDRoad", "Material_Concrete")
	if R.truth((v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))):
		pass
		return R.static_value("RDRoad", "Material_Lava")
	if R.truth((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Town"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "StreetPosX"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Highway"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "RoadPosX")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Concrete")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway"))))):
		pass
		return R.static_value("RDRoad", "Material_Concrete")
	if R.truth(((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Snow"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Ice")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX")))))):
		pass
		return R.static_value("RDRoad", "Material_Snow")
	if R.truth(((((((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary("<=", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Dirt")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Mud")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Sand"))))):
		pass
		return R.static_value("RDRoad", "Material_Dirt")
	if R.truth((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Park"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Cemetery")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return R.static_value("RDRoad", "Material_Grass")
	return R.static_value("RDRoad", "Material_Pavement")
	return null


static func c1169_f_SetMode(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iMode"] = R.coerce(v_iMode, "int")
	return null


static func c1169_f_IsOnGrass(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	if R.truth((((((((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Park"))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return true
	return false
	return null


static func c1170_f_RDRoadSign(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDRoadSign"), [null, R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_RoadSign"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	c.fields["m_fFadeDistance"] = float(150)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fBulletHitEffectScaleMin"] = float(2)
	c.fields["m_fBulletHitEffectScaleMax"] = float(4)
	return null


static func c1170_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "SetInitialState"), [])
	(c).fields["m_bCrashed"] = false
	return null


static func c1170_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null


static func c1170_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bCrashed")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float(maxf(float((float((c.fields.get("m_vVelocity")).fields.get("Z")) - float((float((c).fields.get("m_fHitDeccel")) * float(v_fDeltaTime))))), float(0)))
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, 0, 0, (float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))])
	return null


static func c1170_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bCrashed")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Helicopter"))))
	return null


static func c1170_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "TouchedBy"), [v_entity])
	(c.fields.get("m_vVelocity")).fields["Z"] = float((float(((v_entity).fields.get("m_vVelocity")).fields.get("Z")) * float(1.15)))
	(c).fields["m_fHitDeccel"] = float((float(((v_entity).fields.get("m_vVelocity")).fields.get("Z")) * float(0.4)))
	(c).fields["m_bCrashed"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Break"])
	if R.truth((c).fields.get("m_OffRoadPart")):
		pass
		R.call_member((c).fields.get("m_OffRoadPart"), "Break", [])
	return null


static func c1170_f_Destroy(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "Destroy"), [])
	(c).fields["m_OffRoadPart"] = R.coerce(null, "RDRoadSignOffRoad")
	return null


static func c1171_f_RDRoadSignOffRoad(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDRoadSignOffRoad"), [null, R.static_value("RDEntity", "Layer_SideBackground")])
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fBulletHitEffectScaleMin"] = float(2)
	c.fields["m_fBulletHitEffectScaleMax"] = float(4)
	return null


static func c1171_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSignOffRoad"), "SetInitialState"), [])
	return null


static func c1171_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null


static func c1171_f_Break(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Break"])
	return null


static func c1172_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSlice"), "SetInitialState"), [])
	return null


static func c1172_f_Destroy(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "graphics"), "clear"), [])
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSlice"), "Destroy"), [])
	return null


static func c1175_f_RDSpawnType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpawnType"), [])
	return null


static func c1181_f_OnUnequip(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopFiring", [])
	(c).fields["m_bReloading"] = false
	(c).fields["m_bCancelReload"] = false
	(c).fields["m_bFiringAmmo"] = false
	(c).fields["m_bEquiped"] = false
	return null


static func c1181_f_StartFiring(c: Variant, a: Array) -> Variant:
	R.call_member(c, "FireAmmo", [])
	(c).fields["m_bFiring"] = true
	if R.truth((c).fields.get("m_bAutoFire")):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null


static func c1181_f_FireAmmo(c: Variant, a: Array) -> Variant:
	var v_projectile: Variant = null
	var v_camera: Variant = null
	var v_fSpeed: Variant = NAN
	var v_i: Variant = 0
	var v_bulletInfo: Variant = null
	var v_fMaxSpread: Variant = NAN
	v_projectile = R.coerce(null, "RDProjectile")
	v_camera = R.coerce(null, "RDCamera")
	v_fSpeed = float(NAN)
	v_i = R.coerce(0, "int")
	v_bulletInfo = R.coerce(null, "RDBulletInfo")
	(c).fields["m_bFiringAmmo"] = true
	R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", (c).fields.get("m_szAnimName"), "_fire"), R.binary("+", R.call_static("Maths", "RandomInt", [(c).fields.get("m_iNbFireAnims")]), 1))])
	if R.truth(R.unary("!", (c).fields.get("m_bAutoFire"))):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["ShootShake", (c).fields.get("m_fShakeStrength"), 0, 0, (c).fields.get("m_fShakeDuration")])
	if R.truth((R.unary("!", (c).fields.get("m_bMountedWeapon")) or R.unary("!", R.call_member(c, "HasInfiniteAmmo", [])))):
		pass
		R.set_value((c).fields.get("m_Data"), "m_iAmmoInMag", 1, "-=")
	R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
	R.call_member((c).fields.get("m_Player"), "OnWeaponShot", [])
	if R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) == float(0)) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) == float(0)))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnWeaponEmpty", [])
	if R.truth((c).fields.get("m_bFireProjectile")):
		pass
		v_projectile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [(c).fields.get("m_ProjectileClass")]), R.klass("RDProjectile")), "RDProjectile")
		(v_projectile).fields["m_Instigator"] = R.coerce((c).fields.get("m_Player"), "RDEntity")
		v_camera = R.coerce((((c).fields.get("m_Player")).fields.get("m_GameModeGameplay")).fields.get("m_Camera"), "RDCamera")
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["X"] = float(((v_camera).fields.get("m_vLocation")).fields.get("X"))
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["Y"] = float(((v_camera).fields.get("m_vLocation")).fields.get("Y"))
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["Z"] = float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))
		((c).fields.get("m_vAimingPos")).fields["X"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingX"))
		((c).fields.get("m_vAimingPos")).fields["Y"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingY"))
		R.call_member(v_camera, "Unproject2DToDir3D", [(c).fields.get("m_vAimingPos"), (c).fields.get("m_vProjDir")])
		R.invoke(R.get_value((c).fields.get("m_mRot"), "identity"), [])
		R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [((v_camera).fields.get("m_vRotation")).fields.get("Y"), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
		R.set_value((c).fields.get("m_vTempDir"), "x", ((c).fields.get("m_vProjDir")).fields.get("X"), "=")
		R.set_value((c).fields.get("m_vTempDir"), "y", ((c).fields.get("m_vProjDir")).fields.get("Y"), "=")
		R.set_value((c).fields.get("m_vTempDir"), "z", ((c).fields.get("m_vProjDir")).fields.get("Z"), "=")
		(c).fields["m_vTempDir"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_mRot"), "transformVector"), [(c).fields.get("m_vTempDir")]), "Vector3D")
		((c).fields.get("m_vProjDir")).fields["X"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "x"), "Number")
		((c).fields.get("m_vProjDir")).fields["Y"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "y"), "Number")
		((c).fields.get("m_vProjDir")).fields["Z"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "z"), "Number")
		v_fSpeed = float(R.binary("/", R.binary("/", (float((c).fields.get("m_fProjectileSpeed")) * float(1500)), 60), 60))
		((v_projectile).fields.get("m_vVelocity")).fields["X"] = float((float(((c).fields.get("m_vProjDir")).fields.get("X")) * float(v_fSpeed)))
		((v_projectile).fields.get("m_vVelocity")).fields["Y"] = float((float(((c).fields.get("m_vProjDir")).fields.get("Y")) * float(v_fSpeed)))
		((v_projectile).fields.get("m_vVelocity")).fields["Z"] = float((float(((c).fields.get("m_vProjDir")).fields.get("Z")) * float(v_fSpeed)))
		R.call_member((((c).fields.get("m_Player")).fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_projectile, (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float(3)), (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iRocketsShot", 1, "+=")
	else:
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float((c).fields.get("m_iBulletsShotAtOnce")))):
			pass
			v_bulletInfo = R.coerce(R.get_value(R.static_value("RDWeapon", "m_BulletInfos"), R.static_value("RDWeapon", "m_iBulletInfoIndex")), "RDBulletInfo")
			R.assign(c, "m_iBulletInfoIndex", "RDWeapon", R.binary("%", (float(R.static_value("RDWeapon", "m_iBulletInfoIndex")) + float(1)), R.static_value("RDWeapon", "NbBulletInfos")), "=")
			(v_bulletInfo).fields["m_fPosX"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingX"))
			(v_bulletInfo).fields["m_fPosY"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingY"))
			(v_bulletInfo).fields["m_fSpreadAngle"] = float((float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)))
			(v_bulletInfo).fields["m_fSpreadAmplitude"] = float(R.binary("/", (float(randf()) * R.num(R.call_member(c, "GetBulletSpread", []))), 100))
			R.invoke(R.get_value((c).fields.get("m_BulletsToShoot"), "push"), [v_bulletInfo])
			v_i = R.signed32(v_i + 1)
		R.call_member(c, "UpdateBulletShots", [])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iBulletsShot", 1, "+=")
	if R.truth((float((c).fields.get("m_iBulletsShotAtOnce")) > float(1))):
		pass
		R.call_member((c).fields.get("m_Player"), "AddHandlingInfluence", [(float(randf()) > float(0.5)), (float((c).fields.get("m_fKickBackMin")) + float((float(R.binary("/", ((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel"), 5)) * float((float((c).fields.get("m_fKickBackMax")) - float((c).fields.get("m_fKickBackMin")))))))])
	v_fMaxSpread = float((float((c).fields.get("m_MaxBulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_MaxBulletSpreadMax")) - float((c).fields.get("m_MaxBulletSpreadMin"))))), 5))))
	(c).fields["m_fBulletSpread"] = float(minf(float((float((c).fields.get("m_fBulletSpread")) + float((float((c).fields.get("m_BulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_BulletSpreadMax")) - float((c).fields.get("m_BulletSpreadMin"))))), 5)))))), float(v_fMaxSpread)))
	R.call_member(c, "AddHandlingPoints", [(c).fields.get("m_fHandlingPointsPerShot")])
	(c).fields["m_fOverheat"] = float(minf(float((float((c).fields.get("m_fOverheat")) + float((c).fields.get("m_fOverheatSpeed")))), float(1)))
	if R.truth((float((c).fields.get("m_fOverheat")) == float(1))):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [((c).fields.get("m_Player")).fields.get("m_SmokingEngineSound")])
		R.call_member(c, "StopFiring", [])
		(c).fields["m_bOverheated"] = true
	if R.truth(R.unary("!", (c).fields.get("m_bAutoFire"))):
		pass
		(c).fields["m_fFireDelayTimer"] = float((float((c).fields.get("m_fFireDelayMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float((c).fields.get("m_fFireDelayMax")) - float((c).fields.get("m_fFireDelayMin"))))), 9))))
	return null


static func c1181_f_IsIdle(c: Variant, a: Array) -> Variant:
	return (((R.unary("!", (c).fields.get("m_bFiringAmmo")) and R.unary("!", (c).fields.get("m_bReloading"))) and (c).fields.get("m_bEquiped")) and (float((c).fields.get("m_fFireDelayTimer")) == float(0)))
	return null


static func c1181_f_EndFiringAmmo(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringAmmo"] = false
	if R.truth((((R.unary("!", (c).fields.get("m_bFiring")) or (R.unary("!", (c).fields.get("m_bAutoFire")) and R.unary("!", (c).fields.get("m_bTimeBasedAutoFire")))) or R.unary("!", R.call_member(c, "IsIdle", []))) or R.unary("!", R.call_member(c, "HasAmmoInMag", [])))):
		pass
		R.call_member(c, "StopFiring", [])
		R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndStop"), [R.binary("+", (c).fields.get("m_szAnimName"), "_idle")])
	else:
		pass
		R.call_member(c, "FireAmmo", [])
	return null


static func c1181_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_iAmmo: Variant = 0
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_iAmmo = R.coerce(0, "int")
	if R.truth(R.binary("==", v_szEvent, "WeaponEndFire")):
		pass
		R.call_member(c, "EndFiringAmmo", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "WeaponEndReload")):
			pass
			R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndStop"), [R.binary("+", (c).fields.get("m_szAnimName"), "_idle")])
			(c).fields["m_bReloading"] = false
			(c).fields["m_bCancelReload"] = false
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "WeaponReloadMag")):
				pass
				if R.truth(R.logical_or(R.binary("==", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.unary("-", 1)), func(): return R.call_member(c, "HasInfiniteAmmo", []))):
					pass
					((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAmmoInMag"), (float((c).fields.get("m_iMagSize")) - float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")))), "int")
				else:
					pass
					v_iAmmo = R.coerce(minf(float((float((c).fields.get("m_iMagSize")) - float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")))), float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"))), "int")
					((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAmmoInMag"), v_iAmmo), "int")
					((c).fields.get("m_Data")).fields["m_iAmmoInBag"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), v_iAmmo), "int")
				R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
				R.call_member(c, "AddReloadingPoints", [(c).fields.get("m_iReloadingPointsPerReload")])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "WeaponReloadOneBullet")):
					pass
					R.set_value((c).fields.get("m_Data"), "m_iAmmoInMag", 1, "+=")
					if R.truth(R.unary("!", R.call_member(c, "HasInfiniteAmmo", []))):
						pass
						R.set_value((c).fields.get("m_Data"), "m_iAmmoInBag", 1, "-=")
					R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
					R.call_member(c, "AddReloadingPoints", [(c).fields.get("m_iReloadingPointsPerReload")])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "SpawnBulletCase")):
						pass
						if R.truth(R.unary("!", (c).fields.get("m_bMountedWeapon"))):
							pass
							R.call_member(c, "SpawnBulletCase", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "ReloadSound1")):
							pass
							if R.truth((c).fields.get("m_ReloadSound1")):
								pass
								R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound1")])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "ReloadSound2")):
								pass
								if R.truth((c).fields.get("m_ReloadSound2")):
									pass
									R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound2")])
							else:
								pass
								if R.truth(R.binary("==", v_szEvent, "ReloadSound3")):
									pass
									if R.truth((c).fields.get("m_ReloadSound3")):
										pass
										R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound3")])
								else:
									pass
									if R.truth(R.binary("==", v_szEvent, "ReloadSound4")):
										pass
										if R.truth((c).fields.get("m_ReloadSound4")):
											pass
											R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound4")])
									else:
										pass
										if R.truth(R.binary("==", v_szEvent, "ReloadSound5")):
											pass
											if R.truth((c).fields.get("m_ReloadSound5")):
												pass
												R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound5")])
	return null


static func c1181_f_CanReload(c: Variant, a: Array) -> Variant:
	return ((((c).fields.get("m_bEquiped") and R.unary("!", (c).fields.get("m_bReloading"))) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) < float((c).fields.get("m_iMagSize")))) and (R.binary("==", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.unary("-", 1)) or (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) > float(0))))
	return null


static func c1181_f_IsWeaponEmpty(c: Variant, a: Array) -> Variant:
	return ((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) == float(0)) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) == float(0)))
	return null


static func c1181_f_Reload(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", (c).fields.get("m_szAnimName"), "_reload"), (float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) + float(1)))])
	(c).fields["m_bReloading"] = true
	(c).fields["m_bFiringAmmo"] = false
	(c).fields["m_fReloadingTime"] = float(0)
	R.call_member(c, "StopFiring", [])
	return null


static func c1181_f_CanCancelReload(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_bCanCancelReload") and (float((c).fields.get("m_fReloadingTime")) > float(0.3)))
	return null


static func c1181_f_CancelReload(c: Variant, a: Array) -> Variant:
	(c).fields["m_bCancelReload"] = true
	return null


static func c1181_f_InterruptReload(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bReloading")):
		pass
		(c).fields["m_bReloading"] = false
		R.invoke(R.get_value((c).fields.get("m_GunMC"), "stop"), [])
	return null


static func c1181_f_HasAmmoInMag(c: Variant, a: Array) -> Variant:
	return (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) > float(0))
	return null


static func c1181_f_ShouldReplenishAmmo(c: Variant, a: Array) -> Variant:
	var v_iMaxSize: Variant = 0
	v_iMaxSize = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", (c).fields.get("m_MaxAmmoMin"), R.unary("-", 1))) else R.coerce((float((float((c).fields.get("m_MaxAmmoMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MaxAmmoMax")) - float((c).fields.get("m_MaxAmmoMin"))))), 5)))) - float((c).fields.get("m_iMagSize"))), "int")), "int")
	if R.truth(R.binary("==", v_iMaxSize, R.unary("-", 1))):
		pass
		return false
	return (float(R.binary("/", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.num(v_iMaxSize))) < float(0.1))
	return null


static func c1181_f_OnNoAmmo(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_NoAmmoSound")])
	return null


static func c1181_f_SpawnBulletCase(c: Variant, a: Array) -> Variant:
	var v_newBulletCase: Variant = null
	R.set_value((c).fields.get("m_BulletCasePoint"), "x", R.get_value(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "BulletCasePos"), "x"), "=")
	R.set_value((c).fields.get("m_BulletCasePoint"), "y", R.get_value(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "BulletCasePos"), "y"), "=")
	(c).fields["m_BulletCasePoint"] = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "localToGlobal"), [(c).fields.get("m_BulletCasePoint")]), "Point")
	(c).fields["m_BulletCasePoint"] = R.coerce(R.invoke(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "BulletCaseContainer"), "globalToLocal"), [(c).fields.get("m_BulletCasePoint")]), "Point")
	v_newBulletCase = R.coerce(R.call_static("RDGame", "GetMC", [(c).fields.get("m_BulletCaseClass")]), "MovieClip")
	R.set_value(v_newBulletCase, "x", R.get_value((c).fields.get("m_BulletCasePoint"), "x"), "=")
	R.set_value(v_newBulletCase, "y", R.get_value((c).fields.get("m_BulletCasePoint"), "y"), "=")
	R.invoke(R.get_value(v_newBulletCase, "Init"), [])
	R.invoke(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "BulletCaseContainer"), "addChild"), [v_newBulletCase])
	return null


static func c1181_f_TryBulletOnClinger(c: Variant, a: Array) -> Variant:
	var v_fDistZ: Variant = NAN
	var v_hits: Variant = null
	var v_bHit: Variant = false
	var v_clingerMC: Variant = null
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	var v_bulletInfo: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDBulletInfo")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_fDistZ = float(NAN)
	v_hits = R.coerce(null, "Array")
	v_bHit = false
	v_clingerMC = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [v_clinger]), "MovieClip")
	if R.truth(v_clingerMC):
		pass
		v_fDistZ = float(2)
		R.set_value((c).fields.get("m_BulletShotPos"), "x", (float((v_bulletInfo).fields.get("m_fPosX")) + float((float((float(cos(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
		R.set_value((c).fields.get("m_BulletShotPos"), "y", (float((v_bulletInfo).fields.get("m_fPosY")) + float((float((float(sin(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
		v_bHit = R.coerce(R.invoke(R.get_value(v_clingerMC, "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), true]), "Boolean")
		if R.truth(v_bHit):
			pass
			v_hits = R.coerce(R.invoke(R.get_value((R.static_value("RDGame", "Instance")).fields.get("m_WorldLayer"), "getObjectsUnderPoint"), [(c).fields.get("m_BulletShotPos")]), "Array")
			if R.truth(R.unary("!", R.call_member(c, "ValidateBulletTest", [v_clingerMC, v_hits]))):
				pass
				v_bHit = false
			if R.truth(v_bHit):
				pass
				R.call_member((c).fields.get("m_Player"), "OnBulletHitClinger", [v_iDamage, (c).fields.get("m_BulletShotPos"), v_clinger])
	return v_bHit
	return null


static func c1181_f_ValidateBulletTest(c: Variant, a: Array) -> Variant:
	var v_hit: Variant = null
	var v_parent: Variant = null
	var v_iCount: Variant = 0
	var v_i: Variant = 0
	var v_clingerMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_hits: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v_hit = R.coerce(null, "DisplayObject")
	v_parent = R.coerce(null, "DisplayObject")
	v_iCount = R.coerce(R.coerce(R.get_value(v_hits, "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iCount))):
		pass
		v_hit = R.coerce(R.binary("as", R.get_value(v_hits, v_i), R.resolve(c, "DisplayObject", "RDWeapon")), "DisplayObject")
		v_parent = R.coerce(R.get_value(v_hit, "parent"), "DisplayObject")
		while R.truth(v_parent):
			pass
			if R.truth(R.binary("==", v_parent, v_clingerMC)):
				pass
				return true
			v_parent = R.coerce(R.get_value(v_parent, "parent"), "DisplayObject")
		v_i = R.signed32(v_i + 1)
	return false
	return null


static func c1181_f_GetBulletSpreadAngle(c: Variant, a: Array) -> Variant:
	return (float(R.binary("/", R.call_member(c, "GetBulletSpread", []), 100)) * float(R.static_value("RDWeapon", "BulletSpreadAngleRatio")))
	return null


static func c1181_f_AddAimingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iAimingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAimingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "AimingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iAimingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iAimingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iAimingLevel", 1, "+=")
			((c).fields.get("m_Data")).fields["m_iAimingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iAimingPoints"), v_iLevelPoints), "Number")
			R.call_member((c).fields.get("m_Player"), "OnAimingLevelUp", [])
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "AimingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iAimingLevel")), "int"), "int")
	return null


static func c1181_f_AddHandlingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iHandlingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iHandlingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "HandlingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iHandlingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iHandlingLevel", 1, "+=")
			R.call_member((c).fields.get("m_Player"), "OnHandlingLevelUp", [])
			((c).fields.get("m_Data")).fields["m_iHandlingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iHandlingPoints"), v_iLevelPoints), "Number")
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "HandlingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")), "int"), "int")
	return null


static func c1181_f_AddReloadingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(0))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, 10), "Number")
	else:
		pass
		if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(1))):
			pass
			v_iPoint = R.coerce(R.binary("*", v_iPoint, 5), "Number")
		else:
			pass
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(2))):
				pass
				v_iPoint = R.coerce(R.binary("*", v_iPoint, 2), "Number")
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iReloadingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iReloadingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "ReloadingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iReloadingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iReloadingLevel", 1, "+=")
			R.call_member((c).fields.get("m_Player"), "OnReloadingLevelUp", [])
			((c).fields.get("m_Data")).fields["m_iReloadingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iReloadingPoints"), v_iLevelPoints), "Number")
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "ReloadingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")), "int"), "int")
	return null


static func c1181_f_StartFireSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound"), (c).fields.get("m_bAutoFire")])
	return null


static func c1181_f_StopFireSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	if R.truth((c).fields.get("m_bAutoFire")):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireEndSound")])
	return null


static func c1186_f_FireAmmo(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDWeaponMountedMG"), "FireAmmo"), [])
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "x", (float((c.fields.get("m_Player")).fields.get("m_fMountedMGMuzzlePos")) + float((float((c.fields.get("m_Player")).fields.get("m_fAimingRatioX")) * float(200)))), "=")
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "gotoAndPlay"), [R.binary("+", "Fire", R.binary("+", R.call_static("Maths", "RandomInt", [3]), 1))])
	return null


static func c1189_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "WeaponEndReloadShell")):
		pass
		if R.truth((((float((c.fields.get("m_Data")).fields.get("m_iAmmoInMag")) < float(c.fields.get("m_iMagSize"))) and R.unary("!", c.fields.get("m_bCancelReload"))) and (float((c.fields.get("m_Data")).fields.get("m_iAmmoInBag")) > float(0)))):
			pass
			R.invoke(R.get_value(c.fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", c.fields.get("m_szAnimName"), "_reloadloop"), (float((c.fields.get("m_Data")).fields.get("m_iReloadingLevel")) + float(1)))])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDWeaponSPAS12"), "OnAnimEvent"), [v_szEvent])
	return null


static func c1191_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "WeaponEndReloadShell")):
		pass
		if R.truth((((float((c.fields.get("m_Data")).fields.get("m_iAmmoInMag")) < float(c.fields.get("m_iMagSize"))) and R.unary("!", c.fields.get("m_bCancelReload"))) and (float((c.fields.get("m_Data")).fields.get("m_iAmmoInBag")) > float(0)))):
			pass
			R.invoke(R.get_value(c.fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", c.fields.get("m_szAnimName"), "_reloadloop"), (float((c.fields.get("m_Data")).fields.get("m_iReloadingLevel")) + float(1)))])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDWeaponShotgun"), "OnAnimEvent"), [v_szEvent])
	return null


static func c1193_f_Unload(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_spawnerInfo: Variant = null
	var v_iNbEntities: Variant = 0
	v_i = R.coerce(0, "int")
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	v_spawnerInfo = R.coerce(null, "RDSpawnerInfo")
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_Entities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_entityNode = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Entities"), v_i), R.klass("RDEntityNode")), "RDEntityNode")
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		R.invoke(R.get_value((v_entity).fields.get("m_ContainerMC"), "removeChild"), [(v_entity).fields.get("m_MainMC")])
		R.call_member(v_entity, "Destroy", [])
		(v_entityNode).fields["m_Entity"] = R.coerce(null, "RDEntity")
		(v_entityNode).fields["m_Next"] = R.coerce(null, "RDEntityNode")
		(v_entityNode).fields["m_Previous"] = R.coerce(null, "RDEntityNode")
		R.call_member(c, "ReturnEntityNode", [v_entityNode])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_Entities"), "splice"), [0])
	(c).fields["m_FirstEntity"] = R.coerce(null, "RDEntityNode")
	R.invoke(R.get_value((c).fields.get("m_SafeZones"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Garages"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_WeaponCrates"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_AmmoPoints"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Fences"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_ZombieSpawners"), "length"))):
		pass
		v_spawnerInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_ZombieSpawners"), v_i), R.klass("RDSpawnerInfo")), "RDSpawnerInfo")
		R.call_member(c, "ReturnSpawnerInfo", [v_spawnerInfo])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_ZombieSpawners"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [0])
	return null


static func c1193_f_Hide(c: Variant, a: Array) -> Variant:
	var v_worldLayer: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerBG")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerSideBG")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerRoad")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerOverRoad")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerDynamic")])
	return null


static func c1193_f_AddEntity(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	var v_entityToAdd: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	((v_entityToAdd).fields.get("m_vLocation")).fields["X"] = float(v_fX)
	((v_entityToAdd).fields.get("m_vLocation")).fields["Y"] = float(v_fY)
	((v_entityToAdd).fields.get("m_vLocation")).fields["Z"] = float(v_fZ)
	v_entityNode = R.coerce(R.call_member(c, "GetEntityNode", []), "RDEntityNode")
	(v_entityNode).fields["m_Entity"] = R.coerce(v_entityToAdd, "RDEntity")
	(v_entityNode).fields["m_Next"] = R.coerce((c).fields.get("m_FirstEntity"), "RDEntityNode")
	if R.truth((c).fields.get("m_FirstEntity")):
		pass
		((c).fields.get("m_FirstEntity")).fields["m_Previous"] = R.coerce(v_entityNode, "RDEntityNode")
	(c).fields["m_FirstEntity"] = R.coerce(v_entityNode, "RDEntityNode")
	R.invoke(R.get_value((c).fields.get("m_Entities"), "push"), [v_entityNode])
	(v_entityToAdd).fields["m_EntityNode"] = R.coerce(v_entityNode, "RDEntityNode")
	R.call_member(v_entityToAdd, "SetWorld", [c])
	R.call_member(c, "AddEntityToLayer", [v_entityToAdd])
	R.call_member(v_entityToAdd, "UpdateDepthPosition", [])
	R.call_member(c, "AddEntityToNavMesh", [v_entityToAdd])
	R.call_member(v_entityToAdd, "OnAddedToWorld", [])
	return null


static func c1193_f_RemoveEntityFromLayer(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((v_entity).fields.get("m_ContainerMC"), "removeChild"), [(v_entity).fields.get("m_MainMC")])
	return null


static func c1193_f_RemoveSafeZone(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SafeZones"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_SafeZones"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_SafeZones"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_AddGarage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_Garages"), "push"), [v_entity])
	return null


static func c1193_f_RemoveGarage(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Garages"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_Garages"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_Garages"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_RemoveWeaponCrate(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_WeaponCrates"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_WeaponCrates"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_WeaponCrates"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_RemoveAmmoPoint(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AmmoPoints"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_AmmoPoints"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_AmmoPoints"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_RemoveFence(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Fences"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_Fences"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_Fences"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_AddBGBuilding(c: Variant, a: Array) -> Variant:
	var v_building: Variant = null
	var v_iNbBuildings: Variant = 0
	var v_i: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_building = R.coerce(null, "RDEntity")
	v_iNbBuildings = R.coerce(R.coerce(R.get_value((c).fields.get("m_BGBuildings"), "length"), "int"), "int")
	v_i = R.coerce(R.coerce((float(v_iNbBuildings) - float(1)), "int"), "*")
	while R.truth(R.binary(">=", v_i, 0)):
		pass
		v_building = R.coerce(R.get_value((c).fields.get("m_BGBuildings"), v_i), "RDEntity")
		if R.truth((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) > float(((v_building).fields.get("m_vLocation")).fields.get("Z")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [R.binary("+", v_i, 1), 0, v_entity])
			return null
		v_i = R.coerce(R.num(v_i) - 1, "*")
	R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "unshift"), [v_entity])
	return null


static func c1193_f_RemoveBGBuilding(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_BGBuildings"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_BGBuildings"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c1193_f_GetEntityNode(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	v_entityNode = R.coerce(null, "RDEntityNode")
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_EntityNodesPool"), "length"), 0)):
		pass
		v_entityNode = R.coerce(R.binary("as", R.invoke(R.get_value((c).fields.get("m_EntityNodesPool"), "pop"), []), R.klass("RDEntityNode")), "RDEntityNode")
		(v_entityNode).fields["m_Entity"] = R.coerce(null, "RDEntity")
		(v_entityNode).fields["m_Next"] = R.coerce(null, "RDEntityNode")
		(v_entityNode).fields["m_Previous"] = R.coerce(null, "RDEntityNode")
		return v_entityNode
	return R.construct(R.klass("RDEntityNode"), [])
	return null
