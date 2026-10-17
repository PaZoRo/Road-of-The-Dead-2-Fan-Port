extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func c0_f_Start(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StartCinematic", ["EngineIntro", true])
	return null


static func c0_f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseDownProcessed"] = false
	if R.truth(((float((c).fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Cinematic"))) and (c).fields.get("m_bIsCinematicSkipable"))):
		pass
		R.call_member(c, "SkipCinematic", [])
		(c).fields["m_bMouseDownProcessed"] = true
	return null


static func c0_f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseUpProcessed"] = false
	return null


static func c0_f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseWheelProcessed"] = false
	return null


static func c0_f_OnCoreKeyDown(c: Variant, a: Array) -> Variant:
	var v_bAlreadyDown: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_bAlreadyDown = R.binary("as", R.get_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode")), R.klass("Boolean"))
	if R.truth(R.unary("!", v_bAlreadyDown)):
		pass
		R.set_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode"), true, "=")
		R.call_member(c, "OnKeyDown", [v_event])
	return null


static func c0_f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bKeyDownProcessed"] = false
	return null


static func c0_f_OnCoreKeyUp(c: Variant, a: Array) -> Variant:
	var v_bAlreadyDown: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_bAlreadyDown = R.binary("as", R.get_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode")), R.klass("Boolean"))
	if R.truth(v_bAlreadyDown):
		pass
		R.set_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode"), null, "=")
		R.call_member(c, "OnKeyUp", [v_event])
	return null


static func c0_f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bKeyUpProcessed"] = false
	return null


static func c0_f_EndCinematic(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentCinematic"] = R.coerce("", "String")
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Game")])
	return null


static func c0_f_SkipCinematic(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentCinematic"] = R.coerce("", "String")
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Game")])
	return null


static func c0_f_GetCurrentCinematic(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_szCurrentCinematic") if R.truth((float((c).fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Cinematic")))) else "")
	return null


static func c0_f_PlayMusic(c: Variant, a: Array) -> Variant:
	var v_musicClassToPlay: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_soundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_fFadeDuration: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	var v_bLooping: Variant = R.coerce((a[3] if a.size() > 3 else true), "Boolean")
	if R.truth(R.binary("==", v_musicClassToPlay, (c).fields.get("m_CurrentMusicClass"))):
		pass
		return null
	R.call_member(c, "StopMusic", [v_fFadeDuration])
	(c).fields["m_CurrentMusicClass"] = R.coerce(v_musicClassToPlay, "Class")
	if R.truth(v_musicClassToPlay):
		pass
		(c).fields["m_CurrentMusic"] = R.coerce(R.construct(R.klass("DTSound"), [v_musicClassToPlay, v_soundGroup]), "DTSound")
		R.call_member((c).fields.get("m_CurrentMusic"), "SetSoundCompleteCallback", [R.get_value(c, "OnMusicFinished")])
		R.call_member((c).fields.get("m_CurrentMusic"), "Play", [v_bLooping, v_fFadeDuration])
	return null


static func c0_f_StopMusic(c: Variant, a: Array) -> Variant:
	var v_fFadeDuration: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	if R.truth((c).fields.get("m_CurrentMusic")):
		pass
		R.call_member((c).fields.get("m_CurrentMusic"), "Stop", [v_fFadeDuration])
		(c).fields["m_CurrentMusic"] = R.coerce(null, "DTSound")
		(c).fields["m_CurrentMusicClass"] = R.coerce(null, "Class")
	return null


static func c0_f_IsPlayingMusic(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_CurrentMusic")), func(): return R.call_member((c).fields.get("m_CurrentMusic"), "IsPlaying", []))
	return null


static func c0_f_InitKongAPI(c: Variant, a: Array) -> Variant:
	var v_paramObj: Variant = null
	var v_apiPath: Variant = null
	var v_request: Variant = null
	var v_loader: Variant = null
	v_paramObj = R.coerce(R.get_value(R.invoke(R.resolve(c, "LoaderInfo", "BasicGame"), [R.get_value((c).fields.get("m_RootMC"), "loaderInfo")]), "parameters"), "Object")
	v_apiPath = R.coerce(R.logical_or(R.get_value(v_paramObj, "kongregate_api_path"), func(): return "http://www.kongregate.com/flash/API_AS3_Local.swf"), "String")
	R.invoke(R.get_value(R.resolve(c, "Security", "BasicGame"), "allowDomain"), [v_apiPath])
	v_request = R.coerce(R.construct(R.resolve(c, "URLRequest", "BasicGame"), [v_apiPath]), "URLRequest")
	v_loader = R.coerce(R.construct(R.resolve(c, "Loader", "BasicGame"), []), "Loader")
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "OnInitKongAPICompleted")])
	R.invoke(R.get_value(v_loader, "load"), [v_request])
	R.invoke(R.get_value((c).fields.get("m_RootMC"), "addChild"), [v_loader])
	return null


static func c0_f_OnInitKongAPICompleted(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_KongregateAPI"] = R.coerce(R.get_value(R.get_value(v_event, "target"), "content"), "*")
	if R.truth((c).fields.get("m_KongregateAPI")):
		pass
		R.call_member(c, "RegisterKongregateListeners", [])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_KongregateAPI"), "services"), "connect"), [])
	else:
		pass
		R.call_member(c, "ShowMessageBox", ["Error", "Could not load the Kongregate API!\nChallenges are disabled."])
	return null


static func c0_f_InitArmorGamesAPI(c: Variant, a: Array) -> Variant:
	var v_agi_url: Variant = null
	var v_urlRequest: Variant = null
	var v_loader: Variant = null
	v_agi_url = R.coerce("http://agi.armorgames.com/assets/agi/AGI.swf", "String")
	R.invoke(R.get_value(R.resolve(c, "Security", "BasicGame"), "allowDomain"), [v_agi_url])
	v_urlRequest = R.coerce(R.construct(R.resolve(c, "URLRequest", "BasicGame"), [v_agi_url]), "URLRequest")
	v_loader = R.coerce(R.construct(R.resolve(c, "Loader", "BasicGame"), []), "Loader")
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "OnInitArmorGamesAPICompleted")])
	R.invoke(R.get_value(v_loader, "load"), [v_urlRequest])
	return null


static func c0_f_OnInitArmorGamesAPICompleted(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_ArmorGamesAPI"] = R.coerce(R.get_value(R.get_value(v_event, "currentTarget"), "content"), "Object")
	if R.truth((c).fields.get("m_ArmorGamesAPI")):
		pass
		R.invoke(R.get_value((c).fields.get("m_RootMC"), "addChild"), [R.binary("as", (c).fields.get("m_ArmorGamesAPI"), R.resolve(c, "DisplayObject", "BasicGame"))])
		R.invoke(R.get_value((c).fields.get("m_ArmorGamesAPI"), "init"), [R.static_value("BasicGame", "m_szArmorGamesDevKey"), R.static_value("BasicGame", "m_szArmorGamesGameKey")])
	else:
		pass
		R.call_member(c, "ShowMessageBox", ["Error", "Could not load the ArmorGames Interface!\nArmorGames features are disabled."])
	return null


static func c0_f_InitArmorGamesAPI2(c: Variant, a: Array) -> Variant:
	var v_agi_url: Variant = null
	var v_loader: Variant = null
	v_agi_url = R.coerce("http://agi.armorgames.com/assets/agi/AGI2.swf", "String")
	R.invoke(R.get_value(R.resolve(c, "Security", "BasicGame"), "allowDomain"), ["agi.armorgames.com"])
	v_loader = R.coerce(R.construct(R.resolve(c, "Loader", "BasicGame"), []), "Loader")
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "BasicGame"), "IO_ERROR"), R.get_value(c, "OnArmorGamesAPI2Failed")])
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "OnArmorGamesAPI2Loaded")])
	R.invoke(R.get_value(v_loader, "load"), [R.construct(R.resolve(c, "URLRequest", "BasicGame"), [v_agi_url])])
	return null


static func c0_f_OnArmorGamesAPI2Loaded(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_ArmorGamesAPI2"] = R.coerce(R.get_value(R.get_value(v_e, "currentTarget"), "content"), "*")
	R.invoke(R.get_value((c).fields.get("m_ArmorGamesAPI2"), "connect"), [{"stage": R.get_value((c).fields.get("m_RootMC"), "stage"), "apiKey": "31944FBD-6FD3-4406-8453-AC652DD96ACC", "callback": R.get_value(c, "OnArmorGamesAPI2Connection")}])
	return null


static func c0_f_OnArmorGamesAPI2Connection(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.unary("!", R.get_value(v_data, "success"))):
		pass
		R.call_member(c, "ShowMessageBox", ["Error", "Could not load the ArmorGames API!\nArmorGames features are disabled."])
	return null


static func c0_f_OnArmorGamesAPI2Failed(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "IOErrorEvent")
	R.call_member(c, "ShowMessageBox", ["Error", "Could not load the ArmorGames API!\nArmorGames features are disabled."])
	return null


static func c0_f_OnGotFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_static("Input", "ClearKeyDown", [])
	return null


static func c1_f_BasicObject(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "BasicObject"), [])
	if R.truth(R.binary("==", R.get_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), [])), null)):
		pass
		R.set_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []), 0, "=")
	(c).fields["m_szName"] = R.coerce(R.binary("+", R.binary("+", R.invoke(R.resolve(c, "toString", "BasicObject"), []), "_"), R.get_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []))), "String")
	R.set_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []), 1, "+=")
	(c).fields["m_properties"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "RegisterProperties", [])
	return null


static func c1_f_ResetClassCounts(c: Variant, a: Array) -> Variant:
	R.assign(c, "GObjectClassCount", "BasicObject", R.construct(R.resolve(c, "Object", "BasicObject"), []), "=")
	return null


static func c1_f_GetName(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_szName")
	return null


static func c1_f_SaveState(c: Variant, a: Array) -> Variant:
	var v_propertyItem: Variant = null
	var v_newSaveObject: Variant = null
	var v_i: Variant = 0
	var v_saveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_propertyItem = R.coerce(null, "Object")
	v_newSaveObject = R.coerce(R.construct(R.resolve(c, "Object", "BasicObject"), []), "Object")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_properties"), "length"))):
		pass
		v_propertyItem = R.coerce(R.get_value((c).fields.get("m_properties"), v_i), "Object")
		R.set_value(v_newSaveObject, R.get_value(v_propertyItem, "m_szName"), R.invoke(R.get_value(v_propertyItem, "m_getterFunction"), []), "=")
		v_i = R.signed32(v_i + 1)
	R.set_value(v_saveData, R.call_member(c, "GetName", []), v_newSaveObject, "=")
	return null


static func c1_f_LoadState(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_propertyItem: Variant = null
	var v_saveObject: Variant = null
	var v_saveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_i = R.coerce(0, "int")
	v_propertyItem = R.coerce(null, "Object")
	v_saveObject = R.coerce(R.get_value(v_saveData, R.call_member(c, "GetName", [])), "Object")
	if R.truth(v_saveObject):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_properties"), "length"))):
			pass
			v_propertyItem = R.coerce(R.get_value((c).fields.get("m_properties"), v_i), "Object")
			R.invoke(R.get_value(v_propertyItem, "m_setterFunction"), [R.get_value(v_saveObject, R.get_value(v_propertyItem, "m_szName"))])
			v_i = R.signed32(v_i + 1)
	return null


static func c1_f_RegisterProperty(c: Variant, a: Array) -> Variant:
	var v_newProperty: Variant = null
	var v_szPropertyName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iPropertyType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iPersistenceLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_setterFunction: Variant = R.coerce((a[3] if a.size() > 3 else null), "Function")
	var v_getterFunction: Variant = R.coerce((a[4] if a.size() > 4 else null), "Function")
	v_newProperty = R.coerce(R.construct(R.resolve(c, "Object", "BasicObject"), []), "Object")
	R.set_value(v_newProperty, "m_szName", v_szPropertyName, "=")
	R.set_value(v_newProperty, "m_iType", v_iPropertyType, "=")
	R.set_value(v_newProperty, "m_iPersistenceLevel", v_iPersistenceLevel, "=")
	R.set_value(v_newProperty, "m_setterFunction", v_setterFunction, "=")
	R.set_value(v_newProperty, "m_getterFunction", v_getterFunction, "=")
	R.invoke(R.get_value((c).fields.get("m_properties"), "push"), [v_newProperty])
	return null


static func c1_f_GetProperties(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_properties")
	return null


static func c2_f_Box(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Box"), [])
	(c).fields["X"] = float(0)
	(c).fields["Y"] = float(0)
	(c).fields["Z"] = float(0)
	(c).fields["W"] = float(0)
	(c).fields["H"] = float(0)
	(c).fields["D"] = float(0)
	return null


static func c2_f_SetFromBox(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	(c).fields["X"] = float((v_otherBox).fields.get("X"))
	(c).fields["Y"] = float((v_otherBox).fields.get("Y"))
	(c).fields["Z"] = float((v_otherBox).fields.get("Z"))
	(c).fields["W"] = float((v_otherBox).fields.get("W"))
	(c).fields["H"] = float((v_otherBox).fields.get("H"))
	(c).fields["D"] = float((v_otherBox).fields.get("D"))
	return null


static func c2_f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ", "), (c).fields.get("Z")), ") ("), (c).fields.get("W")), ", "), (c).fields.get("H")), ", "), (c).fields.get("D")), ")")
	return null


static func c2_f_Intersect3D(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	return false
	return null


static func c2_f_Intersect2D(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	return false
	return null


static func c3_f_DTGraphicUtils(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DTGraphicUtils"), [])
	return null


static func c3_f_GetMCClass(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mcClass": "Class", "e": "Error", "szClassName": "String"}
	l["mcClass"] = null
	l["e"] = null
	l["szClassName"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "mcClass", null)
	R.last_error = null
	return R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "DTGraphicUtils"), [R.lget(l, "szClassName")]), R.resolve(c, "Class", "DTGraphicUtils"))
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return null
	return null


static func c4_f_DTSound(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_soundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_bHandlePitch: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.invoke(R.super_ref(c, "DTSound"), [])
	(c).fields["m_fVolume"] = float(0)
	(c).fields["m_fMaxVolume"] = float(1)
	(c).fields["m_fPan"] = float(0)
	(c).fields["m_bLooping"] = false
	(c).fields["m_SoundClass"] = R.coerce(v_soundClass, "Class")
	if R.truth(v_bHandlePitch):
		pass
		(c).fields["m_TargetBytes"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
		(c).fields["m_fPosition"] = float(0)
		(c).fields["m_fRate"] = float(1)
		(c).fields["m_PitchSound"] = R.coerce(R.construct((c).fields.get("m_SoundClass"), []), "Sound")
		(c).fields["m_Sound"] = R.coerce(R.construct(R.klass("Sound"), []), "Sound")
		R.invoke(R.get_value((c).fields.get("m_Sound"), "addEventListener"), [R.get_value(R.resolve(c, "SampleDataEvent", "DTSound"), "SAMPLE_DATA"), R.get_value(c, "OnSamplePitchData")])
	else:
		pass
		(c).fields["m_Sound"] = R.coerce(R.construct((c).fields.get("m_SoundClass"), []), "Sound")
	(c).fields["m_SoundGroup"] = R.coerce(v_soundGroup, "DTSoundGroup")
	(c).fields["m_SoundCompleteCallback"] = R.coerce(null, "Function")
	(c).fields["m_bFading"] = false
	(c).fields["m_fFadeVolumeStart"] = float(0)
	(c).fields["m_fFadeVolumeEnd"] = float(0)
	(c).fields["m_fFadeDuration"] = float(0)
	(c).fields["m_fFadeTimer"] = float(0)
	(c).fields["m_fDataVolume"] = float(0)
	return null


static func c4_f_SetPitch(c: Variant, a: Array) -> Variant:
	var v_fRate: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(v_fRate) < float(0))):
		pass
		v_fRate = float(0)
	(c).fields["m_fRate"] = float(v_fRate)
	return null


static func c4_f_SetPitchCallback(c: Variant, a: Array) -> Variant:
	var v_setPitchFunction: Variant = R.coerce((a[0] if a.size() > 0 else null), "Function")
	(c).fields["m_GetPitchCallback"] = R.coerce(v_setPitchFunction, "Function")
	return null


static func c4_f_OnSamplePitchData(c: Variant, a: Array) -> Variant:
	var v_l0: Variant = NAN
	var v_r0: Variant = NAN
	var v_l1: Variant = NAN
	var v_r1: Variant = NAN
	var v_fF1: Variant = NAN
	var v_fF2: Variant = NAN
	var v_fRate: Variant = NAN
	var v_data: Variant = null
	var v_scaledBlockSize: Variant = NAN
	var v_positionInt: Variant = 0
	var v_fAlpha: Variant = NAN
	var v_positionTargetNum: Variant = NAN
	var v_positionTargetInt: Variant = 0
	var v_need: Variant = 0
	var v_read: Variant = 0
	var v_n: Variant = 0
	var v_iDataVolumes: Variant = 0
	var v_i: Variant = 0
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "SampleDataEvent")
	v_l0 = float(NAN)
	v_r0 = float(NAN)
	v_l1 = float(NAN)
	v_r1 = float(NAN)
	v_fF1 = float(NAN)
	v_fF2 = float(NAN)
	v_fRate = float((c).fields.get("m_fRate"))
	if R.truth(R.truth((c).fields.get("m_GetPitchCallback"))):
		pass
		v_fRate = R.coerce(R.call_member(c, "m_GetPitchCallback", []), "Number")
	R.set_value((c).fields.get("m_TargetBytes"), "position", 0, "=")
	v_data = R.coerce(R.get_value(v_event, "data"), "ByteArray")
	v_scaledBlockSize = float((float((c).fields.get("BLOCK_SIZE")) * float(v_fRate)))
	v_positionInt = R.coerce((c).fields.get("m_fPosition"), "int")
	v_fAlpha = float((float((c).fields.get("m_fPosition")) - float(v_positionInt)))
	v_positionTargetNum = float(v_fAlpha)
	v_positionTargetInt = R.coerce(R.unary("-", 1), "int")
	v_need = R.coerce((float(ceilf(float(v_scaledBlockSize))) + float(2)), "int")
	v_read = R.coerce(R.invoke(R.get_value((c).fields.get("m_PitchSound"), "extract"), [(c).fields.get("m_TargetBytes"), v_need, v_positionInt]), "int")
	v_n = R.coerce(((c).fields.get("BLOCK_SIZE") if R.truth((float(v_read) == float(v_need))) else R.coerce(R.binary("/", v_read, v_fRate), "int")), "int")
	(c).fields["m_fDataVolume"] = float(0)
	v_iDataVolumes = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_n))):
		pass
		if R.truth((float(R.coerce(v_positionTargetNum, "int")) != float(v_positionTargetInt))):
			pass
			v_positionTargetInt = R.coerce(v_positionTargetNum, "int")
			R.set_value((c).fields.get("m_TargetBytes"), "position", R.binary("<<", v_positionTargetInt, 3), "=")
			v_l0 = R.coerce(R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []), "Number")
			v_r0 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
			v_l1 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
			v_r1 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
		v_fF1 = float((float(v_l0) + float((float(v_fAlpha) * float((float(v_l1) - float(v_l0)))))))
		v_fF2 = float((float(v_r0) + float((float(v_fAlpha) * float((float(v_r1) - float(v_r0)))))))
		R.invoke(R.get_value(v_data, "writeFloat"), [v_fF1])
		R.invoke(R.get_value(v_data, "writeFloat"), [v_fF2])
		(c).fields["m_fDataVolume"] = R.coerce(R.binary("+", (c).fields.get("m_fDataVolume"), (float(absf(float(v_fF1))) + float(absf(float(v_fF2))))), "Number")
		v_iDataVolumes = R.coerce(R.binary("+", v_iDataVolumes, 2), "int")
		v_positionTargetNum = R.coerce(R.binary("+", v_positionTargetNum, v_fRate), "Number")
		v_fAlpha = R.coerce(R.binary("+", v_fAlpha, v_fRate), "Number")
		while R.truth((float(v_fAlpha) >= float(1))):
			pass
			v_fAlpha = R.coerce(R.num(v_fAlpha) - 1, "Number")
		v_i = R.signed32(v_i + 1)
	if R.truth((float(v_i) < float((c).fields.get("BLOCK_SIZE")))):
		pass
		while R.truth((float(v_i) < float((c).fields.get("BLOCK_SIZE")))):
			pass
			R.invoke(R.get_value(v_data, "writeFloat"), [0])
			R.invoke(R.get_value(v_data, "writeFloat"), [0])
			v_iDataVolumes = R.coerce(R.binary("+", v_iDataVolumes, 2), "int")
			v_i = R.signed32(v_i + 1)
	(c).fields["m_fPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fPosition"), v_scaledBlockSize), "Number")
	if R.truth((float(v_read) == float(0))):
		pass
		(c).fields["m_bPitchSoundDone"] = true
	(c).fields["m_fDataVolume"] = R.coerce(R.binary("/", (c).fields.get("m_fDataVolume"), v_iDataVolumes), "Number")
	return null


static func c4_f_GetDataVolume(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_fDataVolume")
	return null


static func c5_f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_static("SoundSystem", "RemoveSoundGroup", [c])
	(c).fields["m_SoundGroup"] = R.coerce(null, "DTSoundGroup")
	return null


static func c5_f_SetVolume(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fNewVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fVolume"))
	(c).fields["m_fVolume"] = float(v_fNewVolume)
	if R.truth((float((c).fields.get("m_fVolume")) != float(v_fOldVolume))):
		pass
		R.call_static("SoundSystem", "OnSoundGroupModified", [c])
	return null


static func c5_f_SetPan(c: Variant, a: Array) -> Variant:
	var v_fOldPan: Variant = NAN
	var v_fNewPan: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldPan = float((c).fields.get("m_fPan"))
	(c).fields["m_fPan"] = float(v_fNewPan)
	if R.truth((float((c).fields.get("m_fPan")) != float(v_fOldPan))):
		pass
		R.call_static("SoundSystem", "OnSoundGroupModified", [c])
	return null


static func c5_f_StartFade(c: Variant, a: Array) -> Variant:
	var v_fVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fFadeDuration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	if R.truth((float(v_fFadeDuration) > float(0))):
		pass
		(c).fields["m_bFading"] = true
		(c).fields["m_fFadeVolumeStart"] = float((c).fields.get("m_fVolume"))
		(c).fields["m_fFadeVolumeEnd"] = float(v_fVolume)
		(c).fields["m_fFadeDuration"] = float(v_fFadeDuration)
		(c).fields["m_fFadeTimer"] = float(0)
	else:
		pass
		(c).fields["m_bFading"] = false
		R.call_member(c, "SetVolume", [v_fVolume])
	return null


static func c7_f_DTSpacialSound(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fVolumeFallOffDistance: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fVolumeMaxDistance: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fPanFallOffDistance: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fPanMaxDistance: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_soundGroup: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTSoundGroup")
	var v_bHandlePitch: Variant = R.coerce((a[6] if a.size() > 6 else false), "Boolean")
	R.invoke(R.super_ref(c, "DTSpacialSound"), [v_soundClass, v_soundGroup, v_bHandlePitch])
	(c).fields["m_fVolumeFallOffDistance"] = float(v_fVolumeFallOffDistance)
	(c).fields["m_fVolumeMaxDistance"] = float(v_fVolumeMaxDistance)
	(c).fields["m_fPanFallOffDistance"] = float(v_fPanFallOffDistance)
	(c).fields["m_fPanMaxDistance"] = float(v_fPanMaxDistance)
	return null


static func c9_f_DTVector2D(c: Variant, a: Array) -> Variant:
	var v_inX: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	var v_inY: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.invoke(R.super_ref(c, "DTVector2D"), [])
	(c).fields["X"] = float(v_inX)
	(c).fields["Y"] = float(v_inY)
	return null


static func c9_f_Set(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = float((v_vOther).fields.get("X"))
	(c).fields["Y"] = float((v_vOther).fields.get("Y"))
	return null


static func c9_f_Equals(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return ((float(absf(float((float((c).fields.get("X")) - float((v_vOther).fields.get("X")))))) <= float(R.static_value("Maths", "EPSILON"))) and (float(absf(float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y")))))) <= float(R.static_value("Maths", "EPSILON"))))
	return null


static func c9_f_Add(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = R.coerce(R.binary("+", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("+", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	return null


static func c9_f_Subtract(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = R.coerce(R.binary("-", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("-", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	return null


static func c9_f_Multiply(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("*", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("*", (c).fields.get("Y"), v_fScalar), "Number")
	return null


static func c9_f_Divide(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fScalar), "Number")
	return null


static func c9_f_Invert(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = R.coerce(R.unary("-", (c).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.unary("-", (c).fields.get("Y")), "Number")
	return null


static func c9_f_Size(c: Variant, a: Array) -> Variant:
	return sqrt(float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))))
	return null


static func c9_f_SquaredSize(c: Variant, a: Array) -> Variant:
	return (float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))
	return null


static func c9_f_Dot(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return (float((float((c).fields.get("X")) * float((v_vOther).fields.get("X")))) + float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Y")))))
	return null


static func c9_f_Cross(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return (float((float((c).fields.get("X")) * float((v_vOther).fields.get("Y")))) - float((float((c).fields.get("Y")) * float((v_vOther).fields.get("X")))))
	return null


static func c9_f_Normalize(c: Variant, a: Array) -> Variant:
	var v_fSize: Variant = NAN
	v_fSize = R.coerce(R.call_member(c, "Size", []), "Number")
	if R.truth((float(v_fSize) > float(R.static_value("Maths", "EPSILON")))):
		pass
		R.call_member(c, "Divide", [v_fSize])
	else:
		pass
		(c).fields["X"] = float(0)
		(c).fields["Y"] = float(0)
	return v_fSize
	return null


static func c9_f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ")")
	return null


static func c9_f_DistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	return sqrt(float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))))
	return null


static func c10_f_DTVector3D(c: Variant, a: Array) -> Variant:
	var v_inX: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	var v_inY: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v_inZ: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	R.invoke(R.super_ref(c, "DTVector3D"), [])
	(c).fields["X"] = float(v_inX)
	(c).fields["Y"] = float(v_inY)
	(c).fields["Z"] = float(v_inZ)
	return null


static func c10_f_Set(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = float((v_vOther).fields.get("X"))
	(c).fields["Y"] = float((v_vOther).fields.get("Y"))
	(c).fields["Z"] = float((v_vOther).fields.get("Z"))
	return null


static func c10_f_SetValues(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["X"] = float(v_fX)
	(c).fields["Y"] = float(v_fY)
	(c).fields["Z"] = float(v_fZ)
	return null


static func c10_f_Equals(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	return (((float(absf(float((float((c).fields.get("X")) - float((v_vOther).fields.get("X")))))) <= float(R.static_value("Maths", "EPSILON"))) and (float(absf(float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y")))))) <= float(R.static_value("Maths", "EPSILON")))) and (float(absf(float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z")))))) <= float(R.static_value("Maths", "EPSILON"))))
	return null


static func c10_f_Add(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = R.coerce(R.binary("+", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("+", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.binary("+", (c).fields.get("Z"), (v_vOther).fields.get("Z")), "Number")
	return null


static func c10_f_Subtract(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = R.coerce(R.binary("-", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("-", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.binary("-", (c).fields.get("Z"), (v_vOther).fields.get("Z")), "Number")
	return null


static func c10_f_Multiply(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("*", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("*", (c).fields.get("Y"), v_fScalar), "Number")
	(c).fields["Z"] = R.coerce(R.binary("*", (c).fields.get("Z"), v_fScalar), "Number")
	return null


static func c10_f_Divide(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fScalar), "Number")
	(c).fields["Z"] = R.coerce(R.binary("/", (c).fields.get("Z"), v_fScalar), "Number")
	return null


static func c10_f_Invert(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = R.coerce(R.unary("-", (c).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.unary("-", (c).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.unary("-", (c).fields.get("Z")), "Number")
	return null


static func c10_f_GetLength(c: Variant, a: Array) -> Variant:
	return sqrt(float((float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((c).fields.get("Z")))))))
	return null


static func c10_f_GetSquaredLength(c: Variant, a: Array) -> Variant:
	return (float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((c).fields.get("Z")))))
	return null


static func c10_f_Dot(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	return (float((float((float((c).fields.get("X")) * float((v_vOther).fields.get("X")))) + float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((v_vOther).fields.get("Z")))))
	return null


static func c10_f_Cross(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vOut: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	(v_vOut).fields["X"] = float((float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Z")))) - float((float((c).fields.get("Z")) * float((v_vOther).fields.get("Y"))))))
	(v_vOut).fields["Y"] = float((float((float((c).fields.get("Z")) * float((v_vOther).fields.get("X")))) - float((float((c).fields.get("X")) * float((v_vOther).fields.get("Z"))))))
	(v_vOut).fields["Z"] = float((float((float((c).fields.get("X")) * float((v_vOther).fields.get("Y")))) - float((float((c).fields.get("Y")) * float((v_vOther).fields.get("X"))))))
	return v_vOut
	return null


static func c10_f_Normalize(c: Variant, a: Array) -> Variant:
	var v_fSize: Variant = NAN
	v_fSize = R.coerce(R.call_member(c, "GetLength", []), "Number")
	if R.truth((float(v_fSize) > float(R.static_value("Maths", "EPSILON")))):
		pass
		(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fSize), "Number")
		(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fSize), "Number")
		(c).fields["Z"] = R.coerce(R.binary("/", (c).fields.get("Z"), v_fSize), "Number")
	else:
		pass
		(c).fields["X"] = float(0)
		(c).fields["Y"] = float(0)
		(c).fields["Z"] = float(0)
	return v_fSize
	return null


static func c10_f_IsZero(c: Variant, a: Array) -> Variant:
	return (((float((c).fields.get("X")) == float(0)) and (float((c).fields.get("Y")) == float(0))) and (float((c).fields.get("Z")) == float(0)))
	return null


static func c10_f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ", "), (c).fields.get("Z")), ")")
	return null


static func c10_f_DistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return sqrt(float((float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))))
	return null


static func c10_f_SquaredDistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return (float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))
	return null


static func c10_f_IsNear(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return (float(sqrt(float((float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))))) < float(1))
	return null


static func c11_f_DogTekIntro(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DogTekIntro"), [])
	(c).fields["m_bRunning"] = false
	(c).fields["m_fShake"] = float(0)
	(c).fields["m_fPosX"] = R.coerce(R.resolve(c, "x", "DogTekIntro"), "Number")
	(c).fields["m_fPosY"] = R.coerce(R.resolve(c, "y", "DogTekIntro"), "Number")
	return null


static func c11_f_StartEffect(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_newLine: Variant = null
	var v_iColor: Variant = null
	v_i = R.coerce(0, "int")
	v_newLine = R.coerce(null, "MovieClip")
	v_iColor = R.coerce(null, "*")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("DogTekIntro", "kNbLines")))):
		pass
		v_newLine = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
		R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "addChild"), [v_newLine])
		R.set_value(v_newLine, "x", 0, "=")
		R.set_value(v_newLine, "y", 0, "=")
		R.set_value(v_newLine, "fX", 0, "=")
		R.set_value(v_newLine, "fY", 0, "=")
		R.set_value(v_newLine, "fAngle", (float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)), "=")
		R.set_value(v_newLine, "fSpeed", (float(2) + float((float(randf()) * float(20)))), "=")
		R.set_value(v_newLine, "fThickness", (float((float(1) - float(R.binary("/", v_i, R.static_value("DogTekIntro", "kNbLines"))))) * float(5)), "=")
		v_iColor = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(float(20) + float((float(R.binary("/", v_i, R.static_value("DogTekIntro", "kNbLines"))) * float(205))))]), "*")
		R.set_value(v_newLine, "lineColor", R.binary("|", R.binary("|", R.binary("<<", v_iColor, 16), R.binary("<<", v_iColor, 8)), v_iColor), "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_bRunning"] = true
	R.invoke(R.resolve(c, "addEventListener", "DogTekIntro"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrameHandler")])
	return null


static func c11_f_StopEffect(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRunning"] = false
	R.invoke(R.resolve(c, "removeEventListener", "DogTekIntro"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrameHandler")])
	while R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "removeChildAt"), [0])
	return null


static func c11_f_OnEnterFrameHandler(c: Variant, a: Array) -> Variant:
	var v_lineMC: Variant = null
	var v_fOldX: Variant = NAN
	var v_fOldY: Variant = NAN
	var v_i: Variant = 0
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_lineMC = R.coerce(null, "MovieClip")
	v_fOldX = float(NAN)
	v_fOldY = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_bRunning"))):
		pass
		return null
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "numChildren"))):
		pass
		v_lineMC = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "getChildAt"), [v_i]), "MovieClip")
		R.set_value(v_lineMC, "fAngle", (float((float(randf()) * float(R.binary("/", R.get_value(R.klass("Math"), "PI"), 4.3)))) - float(R.binary("/", R.binary("/", R.get_value(R.klass("Math"), "PI"), 4.3), 2))), "+=")
		v_fOldX = float(R.num(R.get_value(v_lineMC, "fX")))
		v_fOldY = float(R.num(R.get_value(v_lineMC, "fY")))
		R.set_value(v_lineMC, "fX", (float(cos(R.num(R.get_value(v_lineMC, "fAngle")))) * R.num(R.get_value(v_lineMC, "fSpeed"))), "+=")
		R.set_value(v_lineMC, "fY", (float(sin(R.num(R.get_value(v_lineMC, "fAngle")))) * R.num(R.get_value(v_lineMC, "fSpeed"))), "+=")
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "lineStyle"), [R.get_value(v_lineMC, "fThickness"), R.get_value(v_lineMC, "lineColor"), 100])
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "moveTo"), [R.invoke(R.get_value(R.klass("Math"), "round"), [v_fOldX]), R.invoke(R.get_value(R.klass("Math"), "round"), [v_fOldY])])
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "lineTo"), [R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(v_lineMC, "fX")]), R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(v_lineMC, "fY")])])
		v_i = R.signed32(v_i + 1)
	R.assign(c, "x", "DogTekIntro", (float((float((c).fields.get("m_fPosX")) + float((float(randf()) * float((c).fields.get("m_fShake")))))) - float(R.binary("/", (c).fields.get("m_fShake"), 2))), "=")
	R.assign(c, "y", "DogTekIntro", (float((float((c).fields.get("m_fPosY")) + float((float(randf()) * float((c).fields.get("m_fShake")))))) - float(R.binary("/", (c).fields.get("m_fShake"), 2))), "=")
	(c).fields["m_fShake"] = R.coerce(R.binary("+", (c).fields.get("m_fShake"), R.static_value("DogTekIntro", "kShakeSpeed")), "Number")
	return null


static func c12_f_DogTekIntroMC(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DogTekIntroMC"), [])
	R.invoke(R.resolve(c, "addFrameScript", "DogTekIntroMC"), [48, R.get_value(c, "frame49"), 78, R.get_value(c, "frame79"), 83, R.get_value(c, "frame84")])
	return null


static func c12_f_frame49(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StartEffect", [])
	return null


static func c12_f_frame79(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopEffect", [])
	return null


static func c12_f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "DogTekIntroMC"), [])
	return null


static func c15_f_Input(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Input"), [])
	return null


static func c15_f_SetKeyDown(c: Variant, a: Array) -> Variant:
	var v_iKeyCode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bDown: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.set_value(R.static_value("Input", "KeyDown"), v_iKeyCode, (true if R.truth(v_bDown) else null), "=")
	return null


static func c15_f_IsKeyDown(c: Variant, a: Array) -> Variant:
	var v_iKeyCode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return R.binary("!=", R.get_value(R.static_value("Input", "KeyDown"), v_iKeyCode), null)
	return null


static func c15_f_ClearKeyDown(c: Variant, a: Array) -> Variant:
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_A"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_B"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_C"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_D"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_E"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_F"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_G"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_H"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_I"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_J"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_K"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_L"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_M"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_N"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_O"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_P"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Q"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_R"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_S"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_T"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_U"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_V"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_W"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_X"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Y"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Z"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_1"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_2"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_3"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_4"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_5"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_6"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_7"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_8"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_9"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_0"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_CapsLock"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Shift"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Ctrl"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Space"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Left"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Down"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Right"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Up"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_SemiColon"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Quotation"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_AccentGrave"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Minus"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Equal"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_OpeningBracket"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_BackSlash"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_ClosingBracket"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_BackSpace"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Enter"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Slash"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Comma"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Period"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumSlash"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumStar"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumMinus"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumPlus"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Home"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_PgUp"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumCenter"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_End"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_PgDown"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Insert"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Delete"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_NumPeriod"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num1"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num2"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num3"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num4"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num5"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num6"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num7"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num8"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num9"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Num0"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_Escape"), null, "=")
	R.set_value(R.static_value("Input", "KeyDown"), R.static_value("Input", "Key_None"), null, "=")
	return null


static func c1024_f_Maths(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Maths"), [])
	return null


static func c1024_f_QuickSort(c: Variant, a: Array) -> Variant:
	var v_pivot: Variant = null
	var v_l_hold: Variant = 0
	var v_r_hold: Variant = 0
	var v_pivotIndex: Variant = 0
	var v_array: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_left: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_right: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_CmpFunc: Variant = R.coerce((a[3] if a.size() > 3 else null), "Function")
	v_pivot = R.coerce(null, "Object")
	v_l_hold = R.coerce(0, "int")
	v_r_hold = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value(v_array, "length"), 0)):
		pass
		return null
	v_l_hold = R.coerce(v_left, "int")
	v_r_hold = R.coerce(v_right, "int")
	v_pivot = R.coerce(R.get_value(v_array, v_left), "Object")
	while R.truth((float(v_left) < float(v_right))):
		pass
		while R.truth((R.truth(R.invoke(v_CmpFunc, [R.get_value(v_array, v_right), v_pivot])) and (float(v_left) < float(v_right)))):
			pass
			v_right = R.signed32(v_right - 1)
		if R.truth((float(v_left) != float(v_right))):
			pass
			R.set_value(v_array, v_left, R.get_value(v_array, v_right), "=")
			v_left = R.signed32(v_left + 1)
		while R.truth((R.truth(R.invoke(v_CmpFunc, [v_pivot, R.get_value(v_array, v_left)])) and (float(v_left) < float(v_right)))):
			pass
			v_left = R.signed32(v_left + 1)
		if R.truth((float(v_left) != float(v_right))):
			pass
			R.set_value(v_array, v_right, R.get_value(v_array, v_left), "=")
			v_right = R.signed32(v_right - 1)
	R.set_value(v_array, v_left, v_pivot, "=")
	v_pivotIndex = R.coerce(v_left, "int")
	v_left = R.coerce(v_l_hold, "int")
	v_right = R.coerce(v_r_hold, "int")
	if R.truth((float(v_left) < float(v_pivotIndex))):
		pass
		R.invoke(R.resolve(c, "QuickSort", "Maths"), [v_array, v_left, (float(v_pivotIndex) - float(1)), v_CmpFunc])
	if R.truth((float(v_right) > float(v_pivotIndex))):
		pass
		R.invoke(R.resolve(c, "QuickSort", "Maths"), [v_array, (float(v_pivotIndex) + float(1)), v_right, v_CmpFunc])
	return null


static func c1024_f_InterpolateVector(c: Variant, a: Array) -> Variant:
	var v_fInterpDist: Variant = NAN
	var v_fDist: Variant = NAN
	var v_vActualValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vTargetValue: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_fSpeed: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fDeltaTime: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	v_fInterpDist = float(NAN)
	R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Set", [v_vTargetValue])
	R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Subtract", [v_vActualValue])
	v_fDist = R.coerce(R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "GetLength", []), "Number")
	if R.truth((float(v_fDist) > float(0))):
		pass
		v_fInterpDist = float((float(v_fSpeed) * float(v_fDeltaTime)))
		if R.truth((float(v_fInterpDist) > float(v_fDist))):
			pass
			v_fInterpDist = float(v_fDist)
		R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Normalize", [])
		R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Multiply", [v_fInterpDist])
		R.call_member(v_vActualValue, "Add", [R.static_value("Maths", "m_vInterpolateVectorDiff")])
	return null


static func c1024_f_RadToDeg(c: Variant, a: Array) -> Variant:
	var v_fRad: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(v_fRad) * float(180)), R.get_value(R.klass("Math"), "PI"))
	return null


static func c1024_f_GetZAngleFromDir(c: Variant, a: Array) -> Variant:
	var v_fAngle: Variant = NAN
	var v_vDir: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fAngle = R.coerce(R.call_static("Maths", "RadToDeg", [acos(float((v_vDir).fields.get("X")))]), "Number")
	if R.truth((float((v_vDir).fields.get("Y")) < float(0))):
		pass
		v_fAngle = float((float(360) - float(v_fAngle)))
	return v_fAngle
	return null


static func c1024_f_GetShortestAngleBetween(c: Variant, a: Array) -> Variant:
	var v_fAngleA: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fAngleB: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fAngleA = R.coerce(R.binary("%", v_fAngleA, 360), "Number")
	v_fAngleB = R.coerce(R.binary("%", v_fAngleB, 360), "Number")
	if R.truth(R.binary("<", (float(v_fAngleA) - float(v_fAngleB)), R.unary("-", 180))):
		pass
		v_fAngleA = R.coerce(R.binary("+", v_fAngleA, 360), "Number")
	else:
		pass
		if R.truth((float((float(v_fAngleA) - float(v_fAngleB))) > float(180))):
			pass
			v_fAngleA = R.coerce(R.binary("-", v_fAngleA, 360), "Number")
	return (float(v_fAngleB) - float(v_fAngleA))
	return null


static func c1024_f_Sign(c: Variant, a: Array) -> Variant:
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return (R.unary("-", 1) if R.truth((float(v_fNumber) < float(0))) else 1)
	return null


static func c1024_f_Round(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_fNumber) * float(v_fRoundFactor))]), v_fRoundFactor)
	return null


static func c1024_f_Floor(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", floorf(float((float(v_fNumber) * float(v_fRoundFactor)))), v_fRoundFactor)
	return null


static func c1024_f_Ceil(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", ceilf(float((float(v_fNumber) * float(v_fRoundFactor)))), v_fRoundFactor)
	return null


static func c1024_f_sinh(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(pow(R.num(R.get_value(R.klass("Math"), "E")), float(v_fX))) - float(pow(R.num(R.get_value(R.klass("Math"), "E")), R.num(R.unary("-", v_fX))))), 2)
	return null


static func c1024_f_cosh(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(pow(R.num(R.get_value(R.klass("Math"), "E")), float(v_fX))) + float(pow(R.num(R.get_value(R.klass("Math"), "E")), R.num(R.unary("-", v_fX))))), 2)
	return null


static func c1024_f_RayPlaneIntersection(c: Variant, a: Array) -> Variant:
	var v_fDot: Variant = NAN
	var v_fTolerance: Variant = NAN
	var v_fDist: Variant = NAN
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vPlanePos: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vPlaneNormal: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	v_fDot = R.coerce(R.call_member(v_vRayDir, "Dot", [v_vPlaneNormal]), "Number")
	v_fTolerance = float(1e-05)
	if R.truth(((float(v_fDot) < float(v_fTolerance)) and R.binary(">", v_fDot, R.unary("-", v_fTolerance)))):
		pass
		return false
	R.call_member(R.static_value("Maths", "m_vRayPlaneIntersectionDelta"), "Set", [v_vPlanePos])
	R.call_member(R.static_value("Maths", "m_vRayPlaneIntersectionDelta"), "Subtract", [v_vRayPos])
	v_fDist = float(R.binary("/", R.call_member(v_vPlaneNormal, "Dot", [R.static_value("Maths", "m_vRayPlaneIntersectionDelta")]), v_fDot))
	if R.truth(R.binary("<", v_fDist, R.unary("-", v_fTolerance))):
		pass
		return false
	(v_vOutIntersection).fields["X"] = float((float((v_vRayPos).fields.get("X")) + float((float((v_vRayDir).fields.get("X")) * float(v_fDist)))))
	(v_vOutIntersection).fields["Y"] = float((float((v_vRayPos).fields.get("Y")) + float((float((v_vRayDir).fields.get("Y")) * float(v_fDist)))))
	(v_vOutIntersection).fields["Z"] = float((float((v_vRayPos).fields.get("Z")) + float((float((v_vRayDir).fields.get("Z")) * float(v_fDist)))))
	return true
	return null


static func c1024_f_RayTriangleIntersection(c: Variant, a: Array) -> Variant:
	var v_r: Variant = NAN
	var v_a: Variant = NAN
	var v_b: Variant = NAN
	var v_uu: Variant = NAN
	var v_uv: Variant = NAN
	var v_vv: Variant = NAN
	var v_wu: Variant = NAN
	var v_wv: Variant = NAN
	var v_D: Variant = NAN
	var v_s: Variant = NAN
	var v_t: Variant = NAN
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vP1: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vP2: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vP3: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTVector3D")
	v_r = float(NAN)
	v_a = float(NAN)
	v_b = float(NAN)
	v_uu = float(NAN)
	v_uv = float(NAN)
	v_vv = float(NAN)
	v_wu = float(NAN)
	v_wv = float(NAN)
	v_D = float(NAN)
	v_s = float(NAN)
	v_t = float(NAN)
	R.call_member(R.static_value("Maths", "u"), "Set", [v_vP2])
	R.call_member(R.static_value("Maths", "u"), "Subtract", [v_vP1])
	R.call_member(R.static_value("Maths", "v"), "Set", [v_vP3])
	R.call_member(R.static_value("Maths", "v"), "Subtract", [v_vP1])
	R.call_member(R.static_value("Maths", "u"), "Cross", [R.static_value("Maths", "v"), R.static_value("Maths", "n")])
	if R.truth(R.call_member(R.static_value("Maths", "n"), "IsZero", [])):
		pass
		return false
	R.assign(c, "dir", "Maths", v_vRayDir, "=")
	R.call_member(R.static_value("Maths", "w0"), "Set", [v_vRayPos])
	R.call_member(R.static_value("Maths", "w0"), "Subtract", [v_vP1])
	v_a = R.coerce(R.unary("-", R.call_member(R.static_value("Maths", "n"), "Dot", [R.static_value("Maths", "w0")])), "Number")
	v_b = R.coerce(R.call_member(R.static_value("Maths", "n"), "Dot", [R.static_value("Maths", "dir")]), "Number")
	if R.truth((float(absf(float(v_b))) < float(1e-08))):
		pass
		if R.truth((float(v_a) == float(0))):
			pass
			return false
		return false
	v_r = float(R.binary("/", v_a, v_b))
	if R.truth((float(v_r) < float(0))):
		pass
		return false
	R.call_member(v_vOutIntersection, "Set", [R.static_value("Maths", "dir")])
	R.call_member(v_vOutIntersection, "Multiply", [v_r])
	R.call_member(v_vOutIntersection, "Add", [v_vRayPos])
	v_uu = R.coerce(R.call_member(R.static_value("Maths", "u"), "Dot", [R.static_value("Maths", "u")]), "Number")
	v_uv = R.coerce(R.call_member(R.static_value("Maths", "u"), "Dot", [R.static_value("Maths", "v")]), "Number")
	v_vv = R.coerce(R.call_member(R.static_value("Maths", "v"), "Dot", [R.static_value("Maths", "v")]), "Number")
	R.call_member(R.static_value("Maths", "w"), "Set", [v_vOutIntersection])
	R.call_member(R.static_value("Maths", "w"), "Subtract", [v_vP1])
	v_wu = R.coerce(R.call_member(R.static_value("Maths", "w"), "Dot", [R.static_value("Maths", "u")]), "Number")
	v_wv = R.coerce(R.call_member(R.static_value("Maths", "w"), "Dot", [R.static_value("Maths", "v")]), "Number")
	v_D = float((float((float(v_uv) * float(v_uv))) - float((float(v_uu) * float(v_vv)))))
	v_s = float(R.binary("/", (float((float(v_uv) * float(v_wv))) - float((float(v_vv) * float(v_wu)))), v_D))
	if R.truth(((float(v_s) < float(0)) or (float(v_s) > float(1)))):
		pass
		return false
	v_t = float(R.binary("/", (float((float(v_uv) * float(v_wu))) - float((float(v_uu) * float(v_wv)))), v_D))
	if R.truth(((float(v_t) < float(0)) or (float((float(v_s) + float(v_t))) > float(1)))):
		pass
		return false
	return true
	return null


static func c1024_f_RayQuadIntersection(c: Variant, a: Array) -> Variant:
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vP1: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vP2: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vP3: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	var v_vP4: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[6] if a.size() > 6 else null), "DTVector3D")
	return R.logical_or(R.invoke(R.resolve(c, "RayTriangleIntersection", "Maths"), [v_vRayPos, v_vRayDir, v_vP1, v_vP2, v_vP3, v_vOutIntersection]), func(): return R.invoke(R.resolve(c, "RayTriangleIntersection", "Maths"), [v_vRayPos, v_vRayDir, v_vP3, v_vP2, v_vP4, v_vOutIntersection]))
	return null


static func c1024_f_AbsInt(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return (R.coerce(R.unary("-", v_value), "int") if R.truth((float(v_value) < float(0))) else v_value)
	return null


static func c1025_f_Perlin(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Perlin"), [])
	return null


static func c1025_f_fill(c: Variant, a: Array) -> Variant:
	var v_fFreq: Variant = NAN
	var v_fPers: Variant = NAN
	var v_x: Variant = NAN
	var v_y: Variant = NAN
	var v_z: Variant = NAN
	var v_xf: Variant = NAN
	var v_yf: Variant = NAN
	var v_zf: Variant = NAN
	var v_u: Variant = NAN
	var v_v: Variant = NAN
	var v_w: Variant = NAN
	var v_x1: Variant = NAN
	var v_y1: Variant = NAN
	var v_z1: Variant = NAN
	var v_baseX: Variant = NAN
	var v_px: Variant = 0
	var v_py: Variant = 0
	var v_i: Variant = 0
	var v_X: Variant = 0
	var v_Y: Variant = 0
	var v_Z: Variant = 0
	var v_A: Variant = 0
	var v_B: Variant = 0
	var v_AA: Variant = 0
	var v_AB: Variant = 0
	var v_BA: Variant = 0
	var v_BB: Variant = 0
	var v_hash: Variant = 0
	var v_g1: Variant = NAN
	var v_g2: Variant = NAN
	var v_g3: Variant = NAN
	var v_g4: Variant = NAN
	var v_g5: Variant = NAN
	var v_g6: Variant = NAN
	var v_g7: Variant = NAN
	var v_g8: Variant = NAN
	var v_color: Variant = 0
	var v_s: Variant = NAN
	var v_width: Variant = 0
	var v_height: Variant = 0
	var v_bitmap: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	var v__x: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v__y: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	var v__z: Variant = R.coerce((a[3] if a.size() > 3 else 0), "Number")
	v_fFreq = float(NAN)
	v_fPers = float(NAN)
	v_x = float(NAN)
	v_y = float(NAN)
	v_z = float(NAN)
	v_xf = float(NAN)
	v_yf = float(NAN)
	v_zf = float(NAN)
	v_u = float(NAN)
	v_v = float(NAN)
	v_w = float(NAN)
	v_x1 = float(NAN)
	v_y1 = float(NAN)
	v_z1 = float(NAN)
	v_baseX = float(NAN)
	v_px = R.coerce(0, "int")
	v_py = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_X = R.coerce(0, "int")
	v_Y = R.coerce(0, "int")
	v_Z = R.coerce(0, "int")
	v_A = R.coerce(0, "int")
	v_B = R.coerce(0, "int")
	v_AA = R.coerce(0, "int")
	v_AB = R.coerce(0, "int")
	v_BA = R.coerce(0, "int")
	v_BB = R.coerce(0, "int")
	v_hash = R.coerce(0, "int")
	v_g1 = float(NAN)
	v_g2 = float(NAN)
	v_g3 = float(NAN)
	v_g4 = float(NAN)
	v_g5 = float(NAN)
	v_g6 = float(NAN)
	v_g7 = float(NAN)
	v_g8 = float(NAN)
	v_color = R.coerce(0, "int")
	if R.truth(R.unary("!", R.static_value("Perlin", "initialized"))):
		pass
		R.invoke(R.resolve(c, "init", "Perlin"), [])
	v_s = float(0)
	v_baseX = float((float((float(v__x) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iXoffset"))))
	v__y = float((float((float(v__y) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iYoffset"))))
	v__z = float((float((float(v__z) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iZoffset"))))
	v_width = R.coerce(R.get_value(v_bitmap, "width"), "int")
	v_height = R.coerce(R.get_value(v_bitmap, "height"), "int")
	v_py = R.coerce(0, "int")
	while R.truth((float(v_py) < float(v_height))):
		pass
		v__x = float(v_baseX)
		v_px = R.coerce(0, "int")
		while R.truth((float(v_px) < float(v_width))):
			pass
			v_s = float(0)
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(R.static_value("Perlin", "iOctaves")))):
				pass
				v_fFreq = float(R.num(R.get_value(R.static_value("Perlin", "aOctFreq"), v_i)))
				v_fPers = float(R.num(R.get_value(R.static_value("Perlin", "aOctPers"), v_i)))
				v_x = float((float(v__x) * float(v_fFreq)))
				v_y = float((float(v__y) * float(v_fFreq)))
				v_z = float((float(v__z) * float(v_fFreq)))
				v_xf = float(floorf(float(v_x)))
				v_yf = float(floorf(float(v_y)))
				v_zf = float(floorf(float(v_z)))
				v_X = R.coerce(R.binary("&", v_xf, 255), "int")
				v_Y = R.coerce(R.binary("&", v_yf, 255), "int")
				v_Z = R.coerce(R.binary("&", v_zf, 255), "int")
				v_x = R.coerce(R.binary("-", v_x, v_xf), "Number")
				v_y = R.coerce(R.binary("-", v_y, v_yf), "Number")
				v_z = R.coerce(R.binary("-", v_z, v_zf), "Number")
				v_u = float((float((float((float(v_x) * float(v_x))) * float(v_x))) * float((float((float(v_x) * float((float((float(v_x) * float(6))) - float(15))))) + float(10)))))
				v_v = float((float((float((float(v_y) * float(v_y))) * float(v_y))) * float((float((float(v_y) * float((float((float(v_y) * float(6))) - float(15))))) + float(10)))))
				v_w = float((float((float((float(v_z) * float(v_z))) * float(v_z))) * float((float((float(v_z) * float((float((float(v_z) * float(6))) - float(15))))) + float(10)))))
				v_A = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_X), "int")) + float(v_Y)), "int")
				v_AA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_A), "int")) + float(v_Z)), "int")
				v_AB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_A) + float(1)), "int")), "int")) + float(v_Z)), "int")
				v_B = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_X) + float(1)), "int")), "int")) + float(v_Y)), "int")
				v_BA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_B), "int")) + float(v_Z)), "int")
				v_BB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_B) + float(1)), "int")), "int")) + float(v_Z)), "int")
				v_x1 = float((float(v_x) - float(1)))
				v_y1 = float((float(v_y) - float(1)))
				v_z1 = float((float(v_z) - float(1)))
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BB) + float(1)), "int")), "int"), 15), "int")
				v_g1 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AB) + float(1)), "int")), "int"), 15), "int")
				v_g2 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BA) + float(1)), "int")), "int"), 15), "int")
				v_g3 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AA) + float(1)), "int")), "int"), 15), "int")
				v_g4 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BB), "int"), 15), "int")
				v_g5 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AB), "int"), 15), "int")
				v_g6 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BA), "int"), 15), "int")
				v_g7 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AA), "int"), 15), "int")
				v_g8 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_g2 = R.coerce(R.binary("+", v_g2, (float(v_u) * float((float(v_g1) - float(v_g2))))), "Number")
				v_g4 = R.coerce(R.binary("+", v_g4, (float(v_u) * float((float(v_g3) - float(v_g4))))), "Number")
				v_g6 = R.coerce(R.binary("+", v_g6, (float(v_u) * float((float(v_g5) - float(v_g6))))), "Number")
				v_g8 = R.coerce(R.binary("+", v_g8, (float(v_u) * float((float(v_g7) - float(v_g8))))), "Number")
				v_g4 = R.coerce(R.binary("+", v_g4, (float(v_v) * float((float(v_g2) - float(v_g4))))), "Number")
				v_g8 = R.coerce(R.binary("+", v_g8, (float(v_v) * float((float(v_g6) - float(v_g8))))), "Number")
				v_s = R.coerce(R.binary("+", v_s, (float((float(v_g8) + float((float(v_w) * float((float(v_g4) - float(v_g8))))))) * float(v_fPers))), "Number")
				v_i = R.signed32(v_i + 1)
			v_color = R.coerce(R.coerce((float((float((float(v_s) * float(R.static_value("Perlin", "fPersMax")))) + float(1))) * float(128)), "int"), "int")
			R.invoke(R.get_value(v_bitmap, "setPixel32"), [v_px, v_py, R.binary("|", R.binary("|", R.binary("|", 4278190080, R.binary("<<", v_color, 16)), R.binary("<<", v_color, 8)), v_color)])
			v__x = R.coerce(R.binary("+", v__x, R.static_value("Perlin", "baseFactor")), "Number")
			v_px = R.signed32(v_px + 1)
		v__y = R.coerce(R.binary("+", v__y, R.static_value("Perlin", "baseFactor")), "Number")
		v_py = R.signed32(v_py + 1)
	return null


static func c1025_f_get_octaves(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "iOctaves")
	return null


static func c1025_f_set_octaves(c: Variant, a: Array) -> Variant:
	var v__iOctaves: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.assign(c, "iOctaves", "Perlin", v__iOctaves, "=")
	R.invoke(R.resolve(c, "octFreqPers", "Perlin"), [])
	return null


static func c1025_f_get_falloff(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "fPersistence")
	return null


static func c1025_f_set_falloff(c: Variant, a: Array) -> Variant:
	var v__fPersistence: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.assign(c, "fPersistence", "Perlin", v__fPersistence, "=")
	R.invoke(R.resolve(c, "octFreqPers", "Perlin"), [])
	return null


static func c1025_f_get_seed(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "iSeed")
	return null


static func c1025_f_set_seed(c: Variant, a: Array) -> Variant:
	var v__iSeed: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.assign(c, "iSeed", "Perlin", v__iSeed, "=")
	R.invoke(R.resolve(c, "seedOffset", "Perlin"), [])
	return null


static func c1026_f_RDAchievement(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDAchievement"), [])
	return null


static func c1027_f_RDArcadeAmmoPickup(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDArcadeAmmoPickup"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Volume"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = float((float((((c).fields.get("m_Car")).fields.get("m_CollisionBounds")).fields.get("X")) - float(4)))
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float((((c).fields.get("m_Car")).fields.get("m_CollisionBounds")).fields.get("W")) + float(8)))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null


static func c1027_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null


static func c1027_f_Init(c: Variant, a: Array) -> Variant:
	var v_car: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacleCarMilitary")
	(c).fields["m_Car"] = R.coerce(v_car, "RDObstacleCarMilitary")
	return null


static func c1027_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "Update"), [v_fDeltaTime])
	return null


static func c1027_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))
	return null


static func c1027_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDArcadeAmmoPickup"), "TouchedBy"), [v_entity])
	if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
		pass
		R.call_member((c).fields.get("m_Player"), "DoAmmoPointTask", [(c).fields.get("m_Car"), true])
		c.fields["m_bDestroyMe"] = true
	return null


static func c1029_f_GetTypeName(c: Variant, a: Array) -> Variant:
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


static func c1031_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null


static func c1031_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDBloodSpill"), "TouchedBy"), [v_entity])
	(c).fields["m_bTriggered"] = true
	return null


static func c1035_f_RDBulletCase(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBulletCase"), [])
	return null


static func c1035_f_Init(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVelX"] = float((float(150) + float((float(randf()) * float(150)))))
	(c).fields["m_fVelY"] = R.coerce(R.binary("+", R.unary("-", 200), (float(randf()) * R.num(R.unary("-", 150)))), "Number")
	(c).fields["m_fVelRot"] = float((float(10) + float((float(randf()) * float(400)))))
	(c).fields["m_fLifeTime"] = float(1)
	R.invoke(R.resolve(c, "addEventListener", "RDBulletCase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	return null


static func c1035_f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "Update", [])
	return null


static func c1035_f_Update(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVelY"] = R.coerce(R.binary("+", (c).fields.get("m_fVelY"), (float(800) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta")))), "Number")
	R.assign(c, "rotation", "RDBulletCase", (float((c).fields.get("m_fVelRot")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	R.assign(c, "x", "RDBulletCase", (float((c).fields.get("m_fVelX")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	R.assign(c, "y", "RDBulletCase", (float((c).fields.get("m_fVelY")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	(c).fields["m_fLifeTime"] = R.coerce(R.binary("-", (c).fields.get("m_fLifeTime"), (R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta")), "Number")
	if R.truth((float((c).fields.get("m_fLifeTime")) < float(0))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "RDBulletCase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame")])
		R.invoke(R.get_value(R.get_value(c, "parent"), "removeChild"), [c])
		R.call_static("RDGame", "ReturnMC", [c])
	return null


static func c1040_f_RDCampaignDialogs(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCampaignDialogs"), [])
	return null


static func c1040_f_GetSound(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", v_iIndex, R.unary("-", 1))):
		pass
		return null
	return R.binary("as", R.get_value(R.static_value("RDCampaignDialogs", "m_Data"), (float(v_iIndex) * float(2))), R.resolve(c, "Class", "RDCampaignDialogs"))
	return null


static func c1040_f_GetText(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", v_iIndex, R.unary("-", 1))):
		pass
		return "No Dialog"
	return R.binary("as", R.get_value(R.static_value("RDCampaignDialogs", "m_Data"), (float((float(v_iIndex) * float(2))) + float(1))), R.klass("String"))
	return null


static func c1040_f_GetNbDialogs(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.get_value(R.static_value("RDCampaignDialogs", "m_Data"), "length"), 2)
	return null


static func c1041_f_GetTypeName(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return ("Story" if R.truth((float(v_iType) == float(R.static_value("RDCampaignInfo", "Type_Story")))) else "Challenge")
	return null


static func c1041_f_GetGoalName(c: Variant, a: Array) -> Variant:
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


static func c1046_f_RDCinematicHummer(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_gameMode: Variant = null
	var v_iBumperFrame: Variant = 0
	var v_iBumperAddonFrame: Variant = 0
	R.invoke(R.super_ref(c, "RDCinematicHummer"), [])
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_gameMode = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_CinematicTransitionGameMode"), "RDGameMode")
	if R.truth(R.get_value(c, "HummerRocketLauncher")):
		pass
		R.set_value(R.get_value(c, "HummerRocketLauncher"), "visible", R.logical_and(R.logical_and((v_info).fields.get("m_bUsingHummer"), func(): return v_gameMode), func(): return R.call_member(v_gameMode, "HasRocketLauncher", [])), "=")
	if R.truth(R.get_value(c, "HummerLMG")):
		pass
		R.set_value(R.get_value(c, "HummerLMG"), "visible", R.logical_and(R.logical_and((v_info).fields.get("m_bUsingHummer"), func(): return v_gameMode), func(): return R.call_member(v_gameMode, "HasMountedMG", [])), "=")
	if R.truth((c).fields.get("HummerIntact")):
		pass
		R.set_value((c).fields.get("HummerIntact"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperHP")) >= float(50))), "=")
	if R.truth((c).fields.get("HummerDamaged")):
		pass
		R.set_value((c).fields.get("HummerDamaged"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperHP")) < float(50))), "=")
	if R.truth(R.get_value(c, "HummerBumper")):
		pass
		R.set_value(R.get_value(c, "HummerBumper"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperAddonHP")) > float(0))), "=")
	if R.truth((c).fields.get("Hummer")):
		pass
		R.set_value((c).fields.get("Hummer"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	if R.truth((c).fields.get("CarRocketLauncher")):
		pass
		R.set_value((c).fields.get("CarRocketLauncher"), "visible", R.logical_and((R.unary("!", (v_info).fields.get("m_bUsingHummer")) and R.truth(v_gameMode)), func(): return R.call_member(v_gameMode, "HasRocketLauncher", [])), "=")
	if R.truth((c).fields.get("CarLMG")):
		pass
		R.set_value((c).fields.get("CarLMG"), "visible", R.logical_and((R.unary("!", (v_info).fields.get("m_bUsingHummer")) and R.truth(v_gameMode)), func(): return R.call_member(v_gameMode, "HasMountedMG", [])), "=")
	if R.truth((c).fields.get("CarIntact")):
		pass
		R.set_value((c).fields.get("CarIntact"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperHP")) >= float(50))), "=")
	if R.truth((c).fields.get("CarDamaged")):
		pass
		R.set_value((c).fields.get("CarDamaged"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperHP")) < float(50))), "=")
	if R.truth((c).fields.get("CarBumper")):
		pass
		R.set_value((c).fields.get("CarBumper"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperAddonHP")) > float(0))), "=")
	if R.truth((c).fields.get("Car")):
		pass
		R.set_value((c).fields.get("Car"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	v_iBumperFrame = R.coerce(0, "int")
	if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(84))):
		pass
		v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fine"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken1MinHP")))):
			pass
			v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken1"), "int")
		else:
			pass
			if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken2MinHP")))):
				pass
				v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken2"), "int")
			else:
				pass
				if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken3MinHP")))):
					pass
					v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken3"), "int")
				else:
					pass
					if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperSmokeMinHP")))):
						pass
						v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Smoke"), "int")
					else:
						pass
						if R.truth((float((v_info).fields.get("m_fBumperHP")) > float(0))):
							pass
							v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fire"), "int")
	v_iBumperAddonFrame = R.coerce(4, "int")
	if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(75))):
		pass
		v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fine"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(50))):
			pass
			v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken1"), "int")
		else:
			pass
			if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(25))):
				pass
				v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken2"), "int")
			else:
				pass
				if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) > float(0))):
					pass
					v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken3"), "int")
	if R.truth(R.get_value(c, "Smoke")):
		pass
		R.set_value(R.get_value(c, "Smoke"), "visible", ((float((v_info).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Smoke")))), "=")
	if R.truth(R.get_value(c, "Fire")):
		pass
		R.set_value(R.get_value(c, "Fire"), "visible", ((float((v_info).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Fire")))), "=")
	return null


static func c1047_f_RDCivilian(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCivilian"), [R.klass("MC_Civilian"), R.static_value("RDSpawnType", "Civilian"), R.static_value("RDCivilian", "Scale")])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_Civilian"), "int")
	c.fields["m_fSurvivalGuideDistance"] = float(30)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Civilians"), "int")
	(c).fields["m_iHP"] = R.coerce(1, "int")
	(c).fields["m_fDirectionTimer"] = float(0)
	(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	if R.truth(R.binary("==", R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), null)):
		pass
		(c).fields["m_bPlayPleaSound"] = true
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
		pass
		(c).fields["m_bIsTurkey"] = (float(randf()) < float(0.5))
	(c).fields["m_bIsMale"] = ((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay"))) or (float(randf()) > float(0.5)))
	if R.truth((c).fields.get("m_bIsMale")):
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_MalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_MaleGruntSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "RandomHat")
	(c).fields["m_fSpeedZ"] = float((float(R.static_value("RDCivilian", "SpeedZ")) * float((float(0.9) + float((float(randf()) * float(0.2)))))))
	return null


static func c1047_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "SetInitialState"), [])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFleeFromPlayer"] = false
	(c).fields["m_bGoToPlayer"] = false
	R.call_member((c).fields.get("m_vDir"), "SetZero", [])
	(c).fields["m_bGotInCar"] = false
	R.call_member((c).fields.get("m_vMoveTarget"), "SetZero", [])
	R.call_member((c).fields.get("m_vMoveToDelta"), "SetZero", [])
	(c).fields["m_iHP"] = R.coerce(1, "int")
	(c).fields["m_fDirectionTimer"] = float(0)
	(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	(c).fields["m_bPlayPleaSound"] = false
	if R.truth(R.binary("==", R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), null)):
		pass
		(c).fields["m_bPlayPleaSound"] = true
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
		pass
		(c).fields["m_bIsTurkey"] = (float(randf()) < float(0.5))
	(c).fields["m_bIsMale"] = ((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay"))) or (float(randf()) > float(0.5)))
	if R.truth((c).fields.get("m_bIsMale")):
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_MalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_MaleGruntSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "RandomHat")
	(c).fields["m_fSpeedZ"] = float((float(R.static_value("RDCivilian", "SpeedZ")) * float((float(0.9) + float((float(randf()) * float(0.2)))))))
	return null


static func c1047_f_Init(c: Variant, a: Array) -> Variant:
	var v_bGoingRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bGoingRight"] = v_bGoingRight
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null


static func c1047_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", true, "=")
		return null
	if R.truth((((c).fields.get("m_bHitFinished") and (float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Shot")))) or (c).fields.get("m_bGotInCar"))):
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasSoundPlaying", []))):
			pass
			c.fields["m_bDestroyMe"] = true
		return null
	R.call_member(c, "UpdateState", [v_fDeltaTime])
	return null


static func c1047_f_UpdateState(c: Variant, a: Array) -> Variant:
	var v_fPleaDistance: Variant = NAN
	var v_pleaSound: Variant = null
	var v_gameplayMode: Variant = null
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPleaDistance = float(NAN)
	v_pleaSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or (c).fields.get("m_bGotInCar"))):
		pass
		return null
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
	if R.truth((c).fields.get("m_bPlayPleaSound")):
		pass
		v_fPleaDistance = R.coerce((R.static_value("RDCivilian", "PleaDistanceTurkey") if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))) else R.static_value("RDCivilian", "PleaDistance")), "Number")
		if R.truth((float(v_fDistance) < float(v_fPleaDistance))):
			pass
			if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDCivilian"), [])) - float(R.static_value("RDCivilian", "m_iLastPleaTime")))) > float(1000))):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyVoice")])
				else:
					pass
					v_pleaSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_PleaSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_pleaSound])
				R.assign(c, "m_iLastPleaTime", "RDCivilian", R.invoke(R.resolve(c, "getTimer", "RDCivilian"), []), "=")
			(c).fields["m_bPlayPleaSound"] = false
	if R.truth(((((c).fields.get("m_Player")).fields.get("m_bHorning") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) and (float(v_fDistance) < float(R.static_value("RDCivilian", "HornDetectDistance"))))):
		pass
		if R.truth((R.unary("!", (c).fields.get("m_bFleeFromPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDCivilian", "GoToPlayerSpeed"))))):
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
		else:
			pass
			if R.truth(R.logical_and((R.unary("!", (c).fields.get("m_bGoToPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))), func(): return R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", []))):
				pass
				R.call_member(c, "StartGoToPlayer", [])
				R.call_member((c).fields.get("m_Player"), "OnCivComing", [])
	if R.truth((c).fields.get("m_bGoToPlayer")):
		pass
		if R.truth(((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDCivilian", "GoToPlayerSpeed"))) or R.unary("!", R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", [])))):
			pass
			(c).fields["m_bGoToPlayer"] = false
		else:
			pass
			if R.truth((float(v_fDistance) <= float(R.static_value("RDCivilian", "GetInCarDistance")))):
				pass
				R.call_member((c).fields.get("m_Player"), "OnCivGetInCar", [c])
				R.call_member(v_gameplayMode, "OnCivGetInCar", [c])
				(c).fields["m_bGotInCar"] = true
				R.call_member(c, "UpdateAnimation", [true])
	else:
		pass
		(c).fields["m_fDirectionTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDirectionTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fDirectionTimer")) >= float((c).fields.get("m_fDirectionDelay")))):
			pass
			(c).fields["m_bGoingRight"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
		if R.truth((((R.unary("!", (c).fields.get("m_bFleeFromPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))) and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) and (float(v_fDistance) < float(R.static_value("RDCivilian", "FleeSlowPlayerDistance"))))):
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	return null


static func c1047_f_StartGoToPlayer(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	(c).fields["m_bGoToPlayer"] = true
	(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) >= float((c.fields.get("m_vLocation")).fields.get("X")))
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null


static func c1047_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fSpeedX: Variant = NAN
	var v_fSpeedZ: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedX = float(NAN)
	v_fSpeedZ = float(NAN)
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or c.fields.get("m_bEditorMode"))):
		pass
		return null
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth((c).fields.get("m_bGoToPlayer")):
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (R.unary("-", 0.6) if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) >= float((c.fields.get("m_vLocation")).fields.get("X")))) else 0.6)), "Number")
		((c).fields.get("m_vMoveTarget")).fields["Z"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
		v_fSpeedX = float((float(R.static_value("RDCivilian", "SpeedX")) * float(3)))
		v_fSpeedZ = float((float((c).fields.get("m_fSpeedZ")) * float(3)))
	else:
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), (R.static_value("RDCivilian", "SpeedX") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", R.static_value("RDCivilian", "SpeedX")))), "Number")
		((c).fields.get("m_vMoveTarget")).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fSpeedZ"))))
		v_fSpeedX = float(R.static_value("RDCivilian", "SpeedX"))
		v_fSpeedZ = float((c).fields.get("m_fSpeedZ"))
	R.call_member(c, "GetRelativeMoveToDelta", [(c).fields.get("m_fRelativeLocationX"), (c).fields.get("m_vMoveTarget"), v_fSpeedX, v_fSpeedZ, v_fDeltaTime, (c).fields.get("m_vMoveToDelta")])
	if R.truth(((float(((c).fields.get("m_vMoveToDelta")).fields.get("X")) != float(0)) or (float(((c).fields.get("m_vMoveToDelta")).fields.get("Z")) != float(0)))):
		pass
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, ((c).fields.get("m_vMoveToDelta")).fields.get("X"), 0, ((c).fields.get("m_vMoveToDelta")).fields.get("Z"), (c).fields.get("m_Player")])
	(c).fields["m_fRelativeLocationX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), ((c).fields.get("m_vMoveToDelta")).fields.get("X")), "Number")
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c).fields.get("m_fRelativeLocationX")), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_bGoToPlayer"))):
		pass
		if R.truth(((R.unary("!", (c).fields.get("m_bGoingRight")) and R.binary("<", (c).fields.get("m_fRelativeLocationX"), R.binary("+", R.unary("-", v_fRoadLimit), 1))) or ((c).fields.get("m_bGoingRight") and (float((c).fields.get("m_fRelativeLocationX")) > float((float(v_fRoadLimit) - float(1))))))):
			pass
			(c).fields["m_bGoingRight"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c.fields.get("m_vVelocity")).fields["X"] = R.coerce((R.static_value("RDCivilian", "SpeedX") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", R.static_value("RDCivilian", "SpeedX"))), "Number")
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	(c).fields["m_bGoingRight"] = (float((c.fields.get("m_vVelocity")).fields.get("X")) > float(0))
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null


static func c1047_f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth((((((R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "SideHit", (c).fields.get("m_szCharacterName"))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "FrontHit", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "RollOverHit", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "Shot", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), "HitTurkey")) or R.binary("==", c.fields.get("m_szAnim"), "GibHit"))):
		pass
		(c).fields["m_bHitFinished"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		if R.truth(c.fields.get("m_Base")):
			pass
			R.call_member(c.fields.get("m_Base"), "DetachEntity", [c])
		return null
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "InCar")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnEndAnim"), [])
	return null


static func c1047_f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_szNewAnim: Variant = null
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_szNewAnim = R.coerce("", "String")
	if R.truth((c).fields.get("m_bGotInCar")):
		pass
		v_szNewAnim = R.coerce("InCar", "String")
	else:
		pass
		if R.truth((float((c).fields.get("m_iHP")) <= float(0))):
			pass
			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
				pass
				v_szNewAnim = R.coerce("HitTurkey", "String")
			else:
				pass
				v_szNewAnim = R.coerce(R.binary("+", "Shot", (c).fields.get("m_szCharacterName")), "String")
		else:
			pass
			if R.truth((c).fields.get("m_bExploded")):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					v_szNewAnim = R.coerce("HitTurkey", "String")
				else:
					pass
					v_szNewAnim = R.coerce("GibHit", "String")
			else:
				pass
				if R.truth(c.fields.get("m_bHit")):
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
						pass
						v_szNewAnim = R.coerce("HitTurkey", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
							pass
							v_szNewAnim = R.coerce("GibHit", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Front")))):
								pass
								v_szNewAnim = R.coerce(R.binary("+", "FrontHit", (c).fields.get("m_szCharacterName")), "String")
							else:
								pass
								if R.truth(((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_RollOver"))) or (float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_SlowRollOver"))))):
									pass
									v_szNewAnim = R.coerce(R.binary("+", "RollOverHit", (c).fields.get("m_szCharacterName")), "String")
								else:
									pass
									v_szNewAnim = R.coerce(R.binary("+", "SideHit", (c).fields.get("m_szCharacterName")), "String")
				else:
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
						pass
						v_szNewAnim = R.coerce(R.binary("+", ("Sprint" if R.truth((c).fields.get("m_bGoToPlayer")) else "Run"), "Turkey"), "String")
					else:
						pass
						v_szNewAnim = R.coerce(R.binary("+", ("Sprint" if R.truth((c).fields.get("m_bGoToPlayer")) else "Run"), (c).fields.get("m_szCharacterName")), "String")
	R.call_member(c, "PlayAnim", [v_szNewAnim, v_bForce])
	return null


static func c1047_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", c.fields.get("m_bHit")) and ((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))))
	return null


static func c1047_f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_iHitAlign: Variant = 0
	var v_gruntSound: Variant = null
	var v_fSpeed: Variant = NAN
	var v_hitSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_iHitAlign = R.coerce(0, "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or (c).fields.get("m_bGotInCar"))):
		pass
		return false
	c.fields["m_bHit"] = true
	v_fSpeed = float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))
	if R.truth(R.logical_and(((c).fields.get("m_bGoToPlayer") and (float(v_fSpeed) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))), func(): return R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", []))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnCivGetInCar", [c])
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		R.call_member(v_gameplayMode, "OnCivGetInCar", [c])
		(c).fields["m_bGotInCar"] = true
		R.call_member(c, "UpdateAnimation", [true])
		return false
	if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinMultiHitSpeed")))):
		pass
		v_iHitAlign = R.coerce(R.call_member((c).fields.get("m_Player"), "GetHitAlign", [c]), "int")
		if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
			pass
			if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinGibSpeed")))):
				pass
				(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
			else:
				pass
				(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
		else:
			pass
			if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center")))):
				pass
				(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
			else:
				pass
				if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight"))))):
					pass
					if R.truth((float(randf()) < float(0.4))):
						pass
						(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
					else:
						pass
						(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
				else:
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
	else:
		pass
		(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_SlowRollOver"), "int")
		R.call_member(c, "DoRollOverEffect", [])
	c.fields["m_bFlippedX"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
	R.call_member(c, "UpdateDepthPosition", [])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	c.fields["m_bUseCurvyCamera"] = false
	R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
	v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_hitSound])
	if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
		pass
		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
			pass
			R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyGruntVoice")])
		else:
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	else:
		pass
		R.call_member(c, "StopVoiceSound", [])
	R.call_member(c, "UpdateAnimation", [true])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianHit", [])
	return false
	return null


static func c1047_f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		(c).fields["m_bExploded"] = true
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		R.call_member(c, "UpdateAnimation", [true])
		R.call_member(c, "AddGroundBlood", [5, true])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianExploded", [])
	return null


static func c1047_f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bExploded")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	if R.truth((float((c).fields.get("m_iHP")) > float(0))):
		pass
		(c).fields["m_iHP"] = R.coerce(R.binary("-", (c).fields.get("m_iHP"), v_iDamage), "int")
		if R.truth((float((c).fields.get("m_iHP")) <= float(0))):
			pass
			c.fields["m_bHit"] = true
			(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyGruntVoice")])
				else:
					pass
					v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			else:
				pass
				R.call_member(c, "StopVoiceSound", [])
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "AddGroundBlood", [5])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianShot", [])
		else:
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
			R.call_member(c, "AddGroundBlood", [1])
	return null


static func c1047_f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	return null


static func c1048_f_RDDamageType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDamageType"), [])
	return null


static func c1051_f_RDDudeBro(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDudeBro"), [])
	c.fields["m_bCanBeHitByExplosion"] = false
	c.fields["m_bCanBeHitByBullet"] = false
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDDudeBro", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDDudeBro", "MovingSpeedMax")) - float(R.static_value("RDDudeBro", "MovingSpeedMin"))))))))
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_SegwaySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroSegway"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroVoice"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ScreamSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DudeBroScream"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	return null


static func c1051_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "SetInitialState"), [])
	(c).fields["m_fSpeed"] = float((float(R.static_value("RDDudeBro", "MovingSpeedMin")) + float((float(randf()) * float((float(R.static_value("RDDudeBro", "MovingSpeedMax")) - float(R.static_value("RDDudeBro", "MovingSpeedMin"))))))))
	(c).fields["m_bStartPassBy"] = true
	(c).fields["m_bPlayVoice"] = true
	(c).fields["m_szFaceAnim"] = R.coerce("", "String")
	return null


static func c1051_f_InitDudeBro(c: Variant, a: Array) -> Variant:
	var v_bGoingRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.call_member(c, "Init", [R.klass("MC_DudeBro")])
	(c).fields["m_bGoingRight"] = v_bGoingRight
	c.fields["m_bFlippedX"] = R.unary("!", v_bGoingRight)
	return null


static func c1051_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistanceRatio: Variant = NAN
	var v_szAnim: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistanceRatio = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bStartPassBy") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDDudeBro", "MoveDistance"))))))):
		pass
		(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(((c).fields.get("m_fSpeed") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", (c).fields.get("m_fSpeed"))), "Number")
		(c.fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fStartPosX"))
		(c).fields["m_bStartPassBy"] = false
		(c).fields["m_bPassingBy"] = true
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SegwaySound"), true])
	if R.truth(((c).fields.get("m_bPlayVoice") and (float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.binary("/", R.static_value("RDDudeBro", "MoveDistance"), 2))))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [((c).fields.get("m_VoiceSound") if R.truth((float(randf()) > float(0.5))) else (c).fields.get("m_ScreamSound"))])
		(c).fields["m_bPlayVoice"] = false
	v_szAnim = R.coerce("Idle", "String")
	if R.truth(R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", [])):
		pass
		v_szAnim = R.coerce("Talk", "String")
	else:
		pass
		if R.truth(R.call_member((c).fields.get("m_ScreamSound"), "IsPlaying", [])):
			pass
			v_szAnim = R.coerce("Scream", "String")
	if R.truth(R.binary("!=", v_szAnim, (c).fields.get("m_szFaceAnim"))):
		pass
		(c).fields["m_szFaceAnim"] = R.coerce(v_szAnim, "String")
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Body"), "gotoAndPlay"), [(c).fields.get("m_szFaceAnim")])
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		v_fDistanceRatio = float((float(1) - R.num(R.call_static("Maths", "Clamp", [R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 100), 0, 1]))))
		R.call_member((c).fields.get("m_SegwaySound"), "SetMaxVolume", [v_fDistanceRatio])
		R.call_member((c).fields.get("m_VoiceSound"), "SetMaxVolume", [v_fDistanceRatio])
		R.call_member((c).fields.get("m_ScreamSound"), "SetMaxVolume", [v_fDistanceRatio])
	return null


static func c1051_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bPassingBy")):
		pass
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)), 0, 0])
	return null


static func c1051_f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "OnAddedToWorld"), [])
	(c).fields["m_fStartPosX"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce((R.unary("-", 1000) if R.truth((c).fields.get("m_bGoingRight")) else 1000), "Number")
	return null


static func c1051_f_CanSpawnZombie(c: Variant, a: Array) -> Variant:
	var v_bUnlimited: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	return false
	return null


static func c1051_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null


static func c1051_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_zombie = R.coerce(R.binary("as", v_entity, R.klass("RDZombie")), "RDZombie")
	if R.truth(v_zombie):
		pass
		R.call_member(v_zombie, "HandleCarCollision", [c])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDDudeBro"), "TouchedBy"), [v_entity])
	return null


static func c1054_f_RDEndChopper(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDEndChopper"), [R.klass("MC_EndChopper"), R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDEndChopper", "Scale")])
	(c).fields["m_bWarnPlayer"] = true
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	(c).fields["m_bSpawnCollision"] = true
	(c).fields["m_ChopperSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	return null


static func c1054_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_bSpawnCollision"] = true
	(c).fields["m_bPlaySound"] = true
	return null


static func c1054_f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_collision: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	v_collision = R.coerce(null, "RDEndChopperCollision")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth((c).fields.get("m_bPlaySound")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ChopperSound"), true])
		(c).fields["m_bPlaySound"] = false
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDEndChopper", "WarnDistance")))) > float((c.fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		if R.truth(v_storyMode):
			pass
			R.call_member(v_storyMode, "OnSeeEndChopper", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth(((c).fields.get("m_bSpawnCollision") and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_collision = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopperCollision")]), R.klass("RDEndChopperCollision")), "RDEndChopperCollision")
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_collision, R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))])
		(c).fields["m_bSpawnCollision"] = false
	return null


static func c1054_f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")):
		pass
		return R.get_value(c.fields.get("m_MC"), "BulletCollision")
	return R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "GetBulletHitMC"), [])
	return null


static func c1055_f_RDEndChopperCollision(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDEndChopperCollision"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Ramp"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDRoad", "FarWallPosX")), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float(R.static_value("RDRoad", "FarWallPosX")) * float(2)))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null


static func c1055_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopperCollision"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null


static func c1055_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopperCollision"), "Update"), [v_fDeltaTime])
	return null


static func c1055_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))
	return null


static func c1055_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopperCollision"), "TouchedBy"), [v_entity])
	v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
	if R.truth(v_storyMode):
		pass
		R.call_member(v_storyMode, "OnEndChopperReached", [])
	return null


static func c1062_f_RDExplosive(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDExplosive"), [null, R.static_value("RDExplosive", "Scale")])
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null


static func c1062_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDExplosive"), "SetInitialState"), [])
	(c).fields["m_bDetonated"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Instigator"] = R.coerce(null, "RDEntity")
	return null


static func c1062_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_bPerceivable: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_fRangeX: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fRangeZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [R.get_value(c.fields.get("m_MC"), "totalFrames")])
	(c).fields["m_fRangeX"] = float(v_fRangeX)
	(c).fields["m_fRangeZ"] = float(v_fRangeZ)
	return null


static func c1062_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDExplosive"), "Update"), [v_fDeltaTime])
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		if R.truth((c).fields.get("m_bDetonated")):
			pass
			(c).fields["m_fTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fTimer")) >= float((c).fields.get("m_fDelay")))):
				pass
				R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [1])
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.05, 0, 0, 0.4])
				R.call_member(c, "DealRadialDamage", [c, R.static_value("RDExplosive", "ExplosionRangeX"), R.static_value("RDExplosive", "ExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Missile")])
				(c).fields["m_bExploded"] = true
	return null


static func c1062_f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100))
	return null


static func c1062_f_Detonate(c: Variant, a: Array) -> Variant:
	var v_fDelay: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	(c).fields["m_fDelay"] = float(v_fDelay)
	(c).fields["m_fTimer"] = float(0)
	(c).fields["m_bDetonated"] = true
	return null


static func c1079_f_RDGroundBlood(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDGroundBlood"), [null, R.static_value("RDEntity", "Layer_Dynamic"), 1.5])
	R.call_member(c, "SetRandomMC", [])
	c.fields["m_fFadeDistance"] = float(30)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_fMinRenderScale"] = float(0.01)
	return null


static func c1079_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGroundBlood"), "SetInitialState"), [])
	R.call_member(c, "SetRandomMC", [])
	return null


static func c1079_f_SetRandomMC(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = null
	var v_iRandomClass: Variant = 0
	v_mcClass = R.coerce(null, "Class")
	v_iRandomClass = R.coerce(R.call_static("Maths", "RandomInt", [6]), "int")
	if R.truth((float(v_iRandomClass) == float(0))):
		pass
		v_mcClass = R.coerce(R.klass("MC_GroundBlood1"), "Class")
	else:
		pass
		if R.truth((float(v_iRandomClass) == float(1))):
			pass
			v_mcClass = R.coerce(R.klass("MC_GroundBlood2"), "Class")
		else:
			pass
			if R.truth((float(v_iRandomClass) == float(2))):
				pass
				v_mcClass = R.coerce(R.klass("MC_GroundBlood3"), "Class")
			else:
				pass
				if R.truth((float(v_iRandomClass) == float(3))):
					pass
					v_mcClass = R.coerce(R.klass("MC_GroundBlood4"), "Class")
				else:
					pass
					if R.truth((float(v_iRandomClass) == float(4))):
						pass
						v_mcClass = R.coerce(R.klass("MC_GroundBlood5"), "Class")
					else:
						pass
						if R.truth((float(v_iRandomClass) == float(5))):
							pass
							v_mcClass = R.coerce(R.klass("MC_GroundBlood6"), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	return null


static func c1080_f_RDHelicopter(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHelicopter"), [R.klass("MC_Helicopter"), R.static_value("RDHelicopter", "Scale")])
	c.fields["m_bUpdateOutOfView"] = true
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_AttackChoppers"), "int")
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterFireLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_CollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_CollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_CollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_AlertSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterBrokenAlert"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	R.call_member((c).fields.get("m_AlertSound"), "SetMaxVolume", [0.75])
	(c).fields["m_RocketSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_RocketLaunch"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ExplosionSound1"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_ExplosionSound2"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_fWarningTimer"] = float(R.binary("/", R.static_value("RDHelicopter", "WarningDelay"), 2))
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Helicopter"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	(c).fields["m_fHP"] = float(R.static_value("RDHelicopter", "MaxHP"))
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "stop"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_bCanBeHitByExplosion"] = true
	return null


static func c1080_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "SetInitialState"), [])
	(c).fields["m_bBroken"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFiring"] = false
	(c).fields["m_bUsingMissiles"] = false
	(c).fields["m_bRetreating"] = false
	(c).fields["m_fBrokenHeight"] = float(0)
	(c).fields["m_fHP"] = float(R.static_value("RDHelicopter", "MaxHP"))
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "stop"), [])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fWarningTimer"] = float(R.binary("/", R.static_value("RDHelicopter", "WarningDelay"), 2))
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	return null


static func c1080_f_Init(c: Variant, a: Array) -> Variant:
	var v_fDifficultyRatio: Variant = NAN
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 1), "int")
	(c).fields["m_iDifficultyLevel"] = R.coerce(v_iLevel, "int")
	v_fDifficultyRatio = float(R.binary("/", (float((c).fields.get("m_iDifficultyLevel")) - float(1)), 9))
	(c).fields["m_fFiringDurationMin"] = float((float(R.static_value("RDHelicopter", "FiringDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "FiringDurationMinMax")) - float(R.static_value("RDHelicopter", "FiringDurationMinMin"))))))))
	(c).fields["m_fFiringDurationRandom"] = float((float(R.static_value("RDHelicopter", "FiringDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "FiringDurationRandomMax")) - float(R.static_value("RDHelicopter", "FiringDurationRandomMin"))))))))
	(c).fields["m_fNotFiringDurationMin"] = float((float(R.static_value("RDHelicopter", "NotFiringDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NotFiringDurationMinMax")) - float(R.static_value("RDHelicopter", "NotFiringDurationMinMin"))))))))
	(c).fields["m_fNotFiringDurationRandom"] = float((float(R.static_value("RDHelicopter", "NotFiringDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NotFiringDurationRandomMax")) - float(R.static_value("RDHelicopter", "NotFiringDurationRandomMin"))))))))
	(c).fields["m_fMissileDelayMin"] = float((float(R.static_value("RDHelicopter", "MissileDelayMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDelayMinMax")) - float(R.static_value("RDHelicopter", "MissileDelayMinMin"))))))))
	(c).fields["m_fMissileDelayRandom"] = float((float(R.static_value("RDHelicopter", "MissileDelayRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDelayRandomMax")) - float(R.static_value("RDHelicopter", "MissileDelayRandomMin"))))))))
	(c).fields["m_fMissileDurationMin"] = float((float(R.static_value("RDHelicopter", "MissileDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDurationMinMax")) - float(R.static_value("RDHelicopter", "MissileDurationMinMin"))))))))
	(c).fields["m_fMissileDurationRandom"] = float((float(R.static_value("RDHelicopter", "MissileDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "MissileDurationRandomMax")) - float(R.static_value("RDHelicopter", "MissileDurationRandomMin"))))))))
	(c).fields["m_fNoMissileDurationMin"] = float((float(R.static_value("RDHelicopter", "NoMissileDurationMinMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NoMissileDurationMinMax")) - float(R.static_value("RDHelicopter", "NoMissileDurationMinMin"))))))))
	(c).fields["m_fNoMissileDurationRandom"] = float((float(R.static_value("RDHelicopter", "NoMissileDurationRandomMin")) + float((float(v_fDifficultyRatio) * float((float(R.static_value("RDHelicopter", "NoMissileDurationRandomMax")) - float(R.static_value("RDHelicopter", "NoMissileDurationRandomMin"))))))))
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
	(c).fields["m_fMissileTimer"] = float(0)
	(c).fields["m_fMissileDuration"] = R.coerce(((float((c).fields.get("m_fMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDurationRandom"))))) if R.truth((c).fields.get("m_bUsingMissiles")) else (float((c).fields.get("m_fNoMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNoMissileDurationRandom")))))), "Number")
	(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
	(c).fields["m_bFiringMissileRight"] = (float(randf()) > float(0.5))
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_MachineGun"), "int")
	(c).fields["m_bCanUseMissiles"] = (float(v_iLevel) >= float(5))
	return null


static func c1080_f_Update(c: Variant, a: Array) -> Variant:
	var v_dust: Variant = null
	var v_fPosZ: Variant = NAN
	var v_missile: Variant = null
	var v_bHitPlayer: Variant = false
	var v_fDamage: Variant = NAN
	var v_bulletMissSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_dust = R.coerce(null, "RDObject")
	v_fPosZ = float(NAN)
	v_missile = R.coerce(null, "RDMissile")
	v_bHitPlayer = false
	v_fDamage = float(NAN)
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "Update"), [v_fDeltaTime])
	if R.truth((R.unary("!", R.call_member((c).fields.get("m_FlySound"), "IsPlaying", [])) and (float((c).fields.get("m_fHP")) > float(0)))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound"), true])
		(c).fields["m_DispatchSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_DispatchSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_DispatchSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnHelicopterArrived", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth((((((R.unary("!", (c).fields.get("m_bBroken")) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and (R.unary("!", (c).fields.get("m_AlertMessageSound")) or R.unary("!", R.call_member((c).fields.get("m_AlertMessageSound"), "IsPlaying", [])))) and (R.unary("!", (c).fields.get("m_DispatchSound")) or R.unary("!", R.call_member((c).fields.get("m_DispatchSound"), "IsPlaying", [])))) and (R.unary("!", (c).fields.get("m_MissileRequestSound")) or R.unary("!", R.call_member((c).fields.get("m_MissileRequestSound"), "IsPlaying", [])))) and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopter", "WarningMinDistance"))))))):
		pass
		(c).fields["m_fWarningTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fWarningTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fWarningTimer")) >= float(R.static_value("RDHelicopter", "WarningDelay")))):
			pass
			R.call_member(c, "StopAllVoices", [])
			(c).fields["m_WarningSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_WarningSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_WarningSound")])
			(c).fields["m_fWarningTimer"] = float(0)
	(c).fields["m_fDustTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDustTimer"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fDustTimer")) >= float((c).fields.get("m_fDustDelay")))):
		pass
		(c).fields["m_fDustTimer"] = float(0)
		(c).fields["m_fDustDelay"] = float((float(R.static_value("RDHelicopter", "DustDelayMin")) + float((float(randf()) * float(R.static_value("RDHelicopter", "DustDelayRandom"))))))
		v_dust = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectDust")]), R.klass("RDObject")), "RDObject")
		R.invoke(R.get_value((v_dust).fields.get("m_MC"), "gotoAndPlay"), [R.binary("+", "Variation", R.binary("+", R.call_static("Maths", "RandomInt", [4]), 1))])
		v_fPosZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(4)))
		R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_dust, (float((float((c.fields.get("m_vLocation")).fields.get("X")) - float(1))) + float((float(randf()) * float(2)))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
	if R.truth(((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopter", "MinFiringOffset"))))) and R.unary("!", (c).fields.get("m_bBroken")))):
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_SwitchToMissile")))):
			pass
			if R.truth((R.unary("!", (c).fields.get("m_MissileRequestSound")) or R.unary("!", R.call_member((c).fields.get("m_MissileRequestSound"), "IsPlaying", [])))):
				pass
				(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Missile"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_Missile")))):
				pass
				if R.truth(((c).fields.get("m_Player")).fields.get("m_bFailed")):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Idle"), "int")
				else:
					pass
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float((c).fields.get("m_fMissileDelay")))):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RocketSound")])
						v_missile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDMissile")]), R.klass("RDMissile")), "RDMissile")
						R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_missile, R.binary("+", (c.fields.get("m_vLocation")).fields.get("X"), (R.static_value("RDHelicopter", "FireMissileOffsetX") if R.truth((c).fields.get("m_bFiringMissileRight")) else R.unary("-", R.static_value("RDHelicopter", "FireMissileOffsetX")))), (float((c.fields.get("m_vLocation")).fields.get("Y")) + float(R.static_value("RDHelicopter", "FireMissileOffsetY"))), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(0.1))])
						R.call_member(v_missile, "StartSeek", [(c).fields.get("m_Player"), (c).fields.get("m_bFiringMissileRight")])
						(c).fields["m_fFireBulletTimer"] = float(0)
						(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
						(c).fields["m_bFiringMissileRight"] = R.unary("!", (c).fields.get("m_bFiringMissileRight"))
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun")))):
					pass
					if R.truth(((c).fields.get("m_Player")).fields.get("m_bFailed")):
						pass
						if R.truth((c).fields.get("m_bFiring")):
							pass
							R.call_member(c, "StopFiring", [])
						(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_Idle"), "int")
					else:
						pass
						(c).fields["m_fFiringTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFiringTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fFiringTimer")) >= float((c).fields.get("m_fFiringDuration")))):
							pass
							(c).fields["m_bFiring"] = R.unary("!", (c).fields.get("m_bFiring"))
							if R.truth((c).fields.get("m_bFiring")):
								pass
								R.call_member(c, "StartFiring", [])
							else:
								pass
								R.call_member(c, "StopFiring", [])
							(c).fields["m_fFiringTimer"] = float(0)
							(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
						if R.truth((c).fields.get("m_bFiring")):
							pass
							(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
							if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float(R.static_value("RDHelicopter", "FireBulletDelay")))):
								pass
								(c).fields["m_fFireBulletTimer"] = float(0)
								v_bHitPlayer = R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))]), R.static_value("RDHelicopter", "FireWidth"))
								if R.truth(v_bHitPlayer):
									pass
									v_fDamage = float(R.static_value("RDHelicopter", "BodyFireDamage"))
									R.call_member((c).fields.get("m_Player"), "TakeDamage", [v_fDamage, c, R.static_value("RDDamageType", "HelicopterBullet")])
								else:
									pass
									v_bulletMissSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
									R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
		if R.truth(((c).fields.get("m_bCanUseMissiles") and ((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_Missile")))))):
			pass
			(c).fields["m_fMissileTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fMissileTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fMissileTimer")) >= float((c).fields.get("m_fMissileDuration")))):
				pass
				(c).fields["m_bUsingMissiles"] = R.unary("!", (c).fields.get("m_bUsingMissiles"))
				(c).fields["m_fMissileTimer"] = float(0)
				(c).fields["m_fMissileDuration"] = R.coerce(((float((c).fields.get("m_fMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDurationRandom"))))) if R.truth((c).fields.get("m_bUsingMissiles")) else (float((c).fields.get("m_fNoMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNoMissileDurationRandom")))))), "Number")
				(c).fields["m_bFiring"] = false
				R.call_member(c, "StopFiring", [])
				(c).fields["m_fFiringTimer"] = float(0)
				(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
				(c).fields["m_fFireBulletTimer"] = float(0)
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDHelicopter", "State_MachineGun")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_SwitchToMissile"), "int")
					R.call_member(c, "StopAllVoices", [])
					(c).fields["m_MissileRequestSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_MissileRequestSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_MissileRequestSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDHelicopter", "State_MachineGun"), "int")
	return null


static func c1080_f_StartFiring(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "gotoAndPlay"), [1])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null


static func c1080_f_StopFiring(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "stop"), [])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	(c).fields["m_fFireBulletTimer"] = float(0)
	return null


static func c1080_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fDistanceX: Variant = NAN
	var v_fInterpSpeed: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_fTargetZ: Variant = NAN
	var v_fDistanceRatio: Variant = NAN
	var v_fMaxSpeed: Variant = NAN
	var v_fNewZ: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(20))]), "Number")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fTargetX = R.coerce((v_fPerlinX if R.truth((c).fields.get("m_bBroken")) else (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")), "Number")
	v_fTargetX = R.coerce(R.call_static("Maths", "Clamp", [v_fTargetX, (float(v_fPerlinX) - float(v_fRoadLimit)), (float(v_fPerlinX) + float(v_fRoadLimit))]), "Number")
	v_fDistanceX = float((float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fInterpSpeed = R.coerce((0.1 if R.truth((c).fields.get("m_bBroken")) else 0.6), "Number")
	v_fNewX = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), v_fTargetX, v_fDeltaTime, v_fInterpSpeed]), "Number")
	if R.truth((c).fields.get("m_bBroken")):
		pass
		(c).fields["m_fBrokenHeight"] = R.coerce(R.binary("+", (c).fields.get("m_fBrokenHeight"), (float(R.static_value("RDHelicopter", "BrokenSpeedUp")) * float(v_fDeltaTime))), "Number")
	v_fNewY = R.coerce(R.binary("+", R.binary("+", R.static_value("RDHelicopter", "FlyHeight"), ((c).fields.get("m_fBrokenHeight") if R.truth((c).fields.get("m_bBroken")) else 0)), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	v_fTargetZ = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(20)))
	v_fDistanceRatio = float(minf(float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(v_fTargetZ))]), 60)), float(1)))
	v_fMaxSpeed = float(maxf(float((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) * float(2))), float(R.binary("/", R.binary("/", (float(50) * float(1000)), 60), 60))))
	if R.truth((c).fields.get("m_bBroken")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(R.binary("-", (c.fields.get("m_vVelocity")).fields.get("Z"), (R.num((R.static_value("RDHelicopter", "RetreatDeccel") if R.truth((c).fields.get("m_bRetreating")) else R.static_value("RDHelicopter", "BrokenDeccel"))) * float(v_fDeltaTime))), "Number")
	else:
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float((float((float((float(1) - float(v_fDistanceRatio))) * float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")))) + float((float(v_fDistanceRatio) * float(v_fMaxSpeed)))))
	v_fNewZ = float(minf(float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float(v_fTargetZ)))
	v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fDeltaY = float((float(v_fNewY) - float((c.fields.get("m_vLocation")).fields.get("Y"))))
	v_fDeltaZ = float((float(v_fNewZ) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	R.set_value(c.fields.get("m_MC"), "rotation", (float(v_fDistanceX) * float(R.static_value("RDHelicopter", "DistanceRotationRatio"))), "=")
	return null


static func c1080_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_RoadSign"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile"))))
	return null


static func c1080_f_Touched(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
	R.call_member(c, "ResetFiring", [])
	if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "InvincibleHellfireEnabled", []))):
		pass
		R.call_member(c, "DoDamage", [R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 4), true])
	return null


static func c1080_f_ResetFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiring"] = false
	R.call_member(c, "StopFiring", [])
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_fFiringDuration"] = R.coerce(((float((c).fields.get("m_fFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringDurationRandom"))))) if R.truth((c).fields.get("m_bFiring")) else (float((c).fields.get("m_fNotFiringDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringDurationRandom")))))), "Number")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fMissileDelay"] = float((float((c).fields.get("m_fMissileDelayMin")) + float((float(randf()) * float((c).fields.get("m_fMissileDelayRandom"))))))
	return null


static func c1080_f_DoDamage(c: Variant, a: Array) -> Variant:
	var v_fOldHP: Variant = NAN
	var v_fDamage: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bFromCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fOldHP = float(NAN)
	if R.truth(((float((c).fields.get("m_fHP")) > float(0)) and R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "InvincibleHellfireEnabled", [])))):
		pass
		v_fOldHP = float((c).fields.get("m_fHP"))
		(c).fields["m_fHP"] = R.coerce(R.binary("-", (c).fields.get("m_fHP"), v_fDamage), "Number")
		if R.truth((float((c).fields.get("m_fHP")) <= float(0))):
			pass
			R.call_member(c, "ResetFiring", [])
			R.call_member(c, "StopAllVoices", [])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_AlertSound")])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FlySound")])
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Explode"])
		else:
			pass
			if R.truth((float((c).fields.get("m_fHP")) <= float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 4)))):
				pass
				if R.truth(R.unary("!", (c).fields.get("m_bBroken"))):
					pass
					(c).fields["m_bBroken"] = true
					R.call_member(c, "StopAllVoices", [])
					(c).fields["m_AlertMessageSound"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDHelicopter", "m_AlertMessageSounds"), "GetValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [(c).fields.get("m_AlertMessageSound"), R.static_value("RDPlayer", "RadioPriority_AirSupport")])
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_AlertSound"), true])
					R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "play"), [])
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Crash"])
					R.call_member(c, "ResetFiring", [])
					R.call_member((c).fields.get("m_Player"), "OnHelicopterDefeated", [])
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnHelicopterDefeated", [])
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.6])
			else:
				pass
				if R.truth(v_bFromCollision):
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.6])
				if R.truth(((float(v_fOldHP) > float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 2))) and (float((c).fields.get("m_fHP")) <= float(R.binary("/", R.static_value("RDHelicopter", "MaxHP"), 2))))):
					pass
					R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "play"), [])
	return null


static func c1080_f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	R.call_member(c, "DoDamage", [v_iDamage, false])
	return null


static func c1080_f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth(R.binary("==", R.binary("as", v_instigator, R.klass("RDMissile")), null)):
		pass
		R.call_member(c, "DoDamage", [v_iDamage, false])
		if R.truth((float((c).fields.get("m_fHP")) > float(0))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
	return null


static func c1080_f_StopAllVoices(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_WarningSound")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_WarningSound")])
		(c).fields["m_WarningSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_AlertMessageSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_AlertMessageSound")])
		(c).fields["m_AlertMessageSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_DispatchSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_DispatchSound")])
		(c).fields["m_DispatchSound"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_MissileRequestSound")):
		pass
		R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_MissileRequestSound")])
		(c).fields["m_MissileRequestSound"] = R.coerce(null, "DTSpacialSound")
	return null


static func c1080_f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return ((c).fields.get("m_bBroken") and R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100)))
	return null


static func c1080_f_StartRetreat(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRetreating"] = true
	(c).fields["m_bBroken"] = true
	R.call_member(c, "StopFiring", [])
	return null


static func c1080_f_IsRetreating(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bBroken")
	return null


static func c1080_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "ExplosionSound1")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplosionSound1")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.1])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "ExplosionSound2")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplosionSound2")])
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 0.1])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "FinalExplosion")):
				pass
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HelicopterCollision", 0.1, 0, 0, 1])
			else:
				pass
				R.invoke(R.get_value(R.super_ref(c, "RDHelicopter"), "OnAnimEvent"), [v_szEvent])
	return null


static func c1081_f_RDHelicopterAlly(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHelicopterAlly"), [R.klass("MC_HelicopterAlly"), R.static_value("RDHelicopterAlly", "Scale")])
	c.fields["m_bUpdateOutOfView"] = true
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_FireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterFireLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_RocketSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_RocketLaunch"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_HitByMutantSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_PunchHood"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_BulletMissSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_BulletMissSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Helicopter"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_bFiring"] = false
	(c).fields["m_bFiringMissiles"] = true
	(c).fields["m_fFiringMissilesTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	return null


static func c1081_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopterAlly"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFiringGun"] = false
	(c).fields["m_bRetreating"] = false
	(c).fields["m_fRetreatPosX"] = float(0)
	(c).fields["m_fFlyHeight"] = float(6)
	(c).fields["m_fSoundVolume"] = float(0)
	(c).fields["m_bShootingMode"] = false
	(c).fields["m_ShootTarget"] = R.coerce(null, "RDEntity")
	(c).fields["m_bShootTargetIsCar"] = false
	(c).fields["m_fChangeShootingPosTimer"] = float(0)
	(c).fields["m_fRoadLimit"] = float(9999)
	(c).fields["m_fShootingPosX"] = float(0)
	(c).fields["m_fDustTimer"] = float(0)
	(c).fields["m_fDustDelay"] = float(0)
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_fFiringTimer"] = float(0)
	(c).fields["m_bFiring"] = false
	(c).fields["m_bFiringMissiles"] = true
	(c).fields["m_fFiringMissilesTimer"] = float(0)
	(c).fields["m_bWarnPlayer"] = true
	return null


static func c1081_f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_fPosX: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fLimit: Variant = NAN
	var v_bOnRoad: Variant = false
	var v_dust: Variant = null
	var v_projectile: Variant = null
	var v_bulletMissSound: Variant = null
	var v_gameplayMode: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	v_fPosX = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinX = float(NAN)
	v_fLimit = float(NAN)
	v_bOnRoad = false
	v_dust = R.coerce(null, "RDObject")
	v_projectile = R.coerce(null, "RDMissileAlly")
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
		(c).fields["m_fShootingPosX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	R.invoke(R.get_value(R.super_ref(c, "RDHelicopterAlly"), "Update"), [v_fDeltaTime])
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth(R.unary("!", R.call_member((c).fields.get("m_FlySound"), "IsPlaying", []))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound"), true])
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		(c).fields["m_fSoundVolume"] = float((float(1) - float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), R.static_value("RDHelicopterAlly", "SpawnDistance")))))
	else:
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bRetreating"))):
			pass
			(c).fields["m_fSoundVolume"] = float(1)
		else:
			pass
			(c).fields["m_fSoundVolume"] = float(maxf(float((float((c).fields.get("m_fSoundVolume")) - float((float(R.static_value("RDHelicopterAlly", "FlySoundVolumeFadeSpeed")) * float(v_fDeltaTime))))), float(0)))
	R.call_member((c).fields.get("m_FlySound"), "SetMaxVolume", [(c).fields.get("m_fSoundVolume")])
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		if R.truth(v_storyMode):
			pass
			R.call_member(v_storyMode, "OnHelicopterArrived", [])
		(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_fDustTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDustTimer"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fDustTimer")) >= float((c).fields.get("m_fDustDelay")))):
		pass
		(c).fields["m_fDustTimer"] = float(0)
		(c).fields["m_fDustDelay"] = float((float(R.static_value("RDHelicopterAlly", "DustDelayMin")) + float((float(randf()) * float(R.static_value("RDHelicopterAlly", "DustDelayRandom"))))))
		v_fPosX = float((float((float((c.fields.get("m_vLocation")).fields.get("X")) - float(1))) + float((float(randf()) * float(2)))))
		v_fPosZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(4)))
		v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
		v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadLimitAt", [v_fPosZ]), "Number")
		v_bOnRoad = ((float(v_fPosX) > float((float(v_fPerlinX) - float(v_fLimit)))) and (float(v_fPosX) < float((float(v_fPerlinX) + float(v_fLimit)))))
		v_dust = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectDust")]), R.klass("RDObject")), "RDObject")
		R.invoke(R.get_value((v_dust).fields.get("m_MC"), "gotoAndPlay"), [R.binary("+", "Variation", R.binary("+", R.call_static("Maths", "RandomInt", [4]), 1))])
		R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_dust, v_fPosX, R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
	if R.truth(((c).fields.get("m_bShootingMode") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(5)))))):
		pass
		if R.truth((c).fields.get("m_bFiring")):
			pass
			R.call_member(c, "GetShootingTargets", [])
			if R.truth((c).fields.get("m_ShootTarget")):
				pass
				if R.truth(((c).fields.get("m_bShootTargetIsCar") and (c).fields.get("m_bFiringMissiles"))):
					pass
					if R.truth((c).fields.get("m_bFiringGun")):
						pass
						R.call_member(c, "StopFiring", [])
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) <= float(0))):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RocketSound")])
						v_projectile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDMissileAlly")]), R.klass("RDMissileAlly")), "RDMissileAlly")
						(v_projectile).fields["m_Instigator"] = R.coerce(c, "RDEntity")
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["Y"] = float((float((c.fields.get("m_vLocation")).fields.get("Y")) - float(2)))
						((v_projectile).fields.get("m_vTrajectoryStart")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
						((c).fields.get("m_vMissileDir")).fields["X"] = float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("X"))
						((c).fields.get("m_vMissileDir")).fields["Y"] = float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("Y"))
						((c).fields.get("m_vMissileDir")).fields["Z"] = float((float((((c).fields.get("m_ShootTarget")).fields.get("m_vLocation")).fields.get("Z")) - float(1)))
						R.call_member((c).fields.get("m_vMissileDir"), "Subtract", [(v_projectile).fields.get("m_vTrajectoryStart")])
						R.call_member((c).fields.get("m_vMissileDir"), "Normalize", [])
						((v_projectile).fields.get("m_vVelocity")).fields["X"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("X")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						((v_projectile).fields.get("m_vVelocity")).fields["Y"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("Y")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						((v_projectile).fields.get("m_vVelocity")).fields["Z"] = float((float(((c).fields.get("m_vMissileDir")).fields.get("Z")) * float(R.static_value("RDHelicopterAlly", "MissileSpeed"))))
						R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_projectile, (c.fields.get("m_vLocation")).fields.get("X"), (float((c.fields.get("m_vLocation")).fields.get("Y")) - float(0.5)), (c.fields.get("m_vLocation")).fields.get("Z")])
						(c).fields["m_fFireBulletTimer"] = float(R.static_value("RDHelicopterAlly", "FireMissileDelay"))
				else:
					pass
					if R.truth(R.unary("!", (c).fields.get("m_bFiringGun"))):
						pass
						R.call_member(c, "StartFiring", [])
					(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c).fields.get("m_fFireBulletTimer")) <= float(0))):
						pass
						if R.truth((c).fields.get("m_ShootTarget")):
							pass
							R.call_member((c).fields.get("m_ShootTarget"), "TakeDamage", [R.static_value("RDHelicopterAlly", "FireDamage"), c, R.static_value("RDDamageType", "DevastatingBullet")])
							R.call_member(c, "SpawnBulletImpact", [((c).fields.get("m_ShootTarget")).fields.get("m_vLocation"), false])
						else:
							pass
							v_bulletMissSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
							R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
							((c).fields.get("m_vBulletImpactLocation")).fields["X"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c.fields.get("m_vVelocity")).fields.get("X")) * float(0.1)))))
							((c).fields.get("m_vBulletImpactLocation")).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceZ"))))
							R.call_member(c, "SpawnBulletImpact", [(c).fields.get("m_vBulletImpactLocation"), false])
						(c).fields["m_fFireBulletTimer"] = float(R.static_value("RDHelicopterAlly", "FireBulletDelay"))
		(c).fields["m_fFiringMissilesTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFiringMissilesTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fFiringMissilesTimer")) <= float(0))):
			pass
			(c).fields["m_bFiringMissiles"] = R.unary("!", (c).fields.get("m_bFiringMissiles"))
			if R.truth((c).fields.get("m_bFiringMissiles")):
				pass
				(c).fields["m_fFiringMissilesTimer"] = float((float((c).fields.get("m_fFiringMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringMissileDurationRandom"))))))
			else:
				pass
				(c).fields["m_fFiringMissilesTimer"] = float((float((c).fields.get("m_fNotFiringMissileDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringMissileDurationRandom"))))))
		(c).fields["m_fFiringTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fFiringTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fFiringTimer")) <= float(0))):
			pass
			(c).fields["m_bFiring"] = R.unary("!", (c).fields.get("m_bFiring"))
			if R.truth((c).fields.get("m_bFiring")):
				pass
				(c).fields["m_fFiringTimer"] = float((float((c).fields.get("m_fFiringGunDurationMin")) + float((float(randf()) * float((c).fields.get("m_fFiringGunDurationRandom"))))))
			else:
				pass
				if R.truth((c).fields.get("m_bFiringGun")):
					pass
					R.call_member(c, "StopFiring", [])
				(c).fields["m_fFiringTimer"] = float((float((c).fields.get("m_fNotFiringGunDurationMin")) + float((float(randf()) * float((c).fields.get("m_fNotFiringGunDurationRandom"))))))
	return null


static func c1081_f_SpawnBulletImpact(c: Variant, a: Array) -> Variant:
	var v_fZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_bOnGrass: Variant = false
	var v_newImpact: Variant = null
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_bHit: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_fZ = float((float((v_vLocation).fields.get("Z")) - float((float(randf()) * float(1)))))
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fZ]), "Number")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_bOnGrass = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "IsOnGrass", [(float((v_vLocation).fields.get("X")) - float(v_fPerlinX)), v_fZ]), "Boolean")
	v_newImpact = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectBulletImpact")]), R.klass("RDObjectBulletImpact")), "RDObjectBulletImpact")
	R.call_member(v_newImpact, "Init", [(R.klass("MC_BulletImpactBloodChopper") if R.truth(v_bHit) else (R.klass("MC_BulletImpactGrassChopper") if R.truth(v_bOnGrass) else R.klass("MC_BulletImpactPavementChopper"))), (float(1) + float((float(randf()) * float(1))))])
	R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_newImpact, R.binary("+", (v_vLocation).fields.get("X"), R.binary("+", R.unary("-", 1), (float(randf()) * float(2)))), R.call_static("RDWorld", "GetPerlinY", [v_fZ]), (v_vLocation).fields.get("Z")])
	return null


static func c1081_f_GetShootingTargets(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	(c).fields["m_ShootTarget"] = R.coerce(null, "RDEntity")
	v_entityNode = R.coerce((((c).fields.get("m_Player")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth((((((v_entity).fields.get("m_bCanBeShotByHelicopter") and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceZ")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHelicopterAlly", "ShootingMaxDistanceZ")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((float((c.fields.get("m_vLocation")).fields.get("X")) + float(R.static_value("RDHelicopterAlly", "ShootingMinDistanceX")))))) and (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) < float((float((c.fields.get("m_vLocation")).fields.get("X")) + float(R.static_value("RDHelicopterAlly", "ShootingMaxDistanceX"))))))):
			pass
			(c).fields["m_ShootTarget"] = R.coerce(v_entity, "RDEntity")
			(c).fields["m_bShootTargetIsCar"] = R.coerce(R.binary("as", (c).fields.get("m_ShootTarget"), R.klass("RDObstacleCar")), "Boolean")
			break
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null


static func c1081_f_StartFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringGun"] = true
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "gotoAndPlay"), [1])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null


static func c1081_f_StopFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringGun"] = false
	R.set_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "MuzzleFlash"), "stop"), [])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	(c).fields["m_fFireBulletTimer"] = float(0)
	return null


static func c1081_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fRoadLimit: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fInterpSpeed: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_fDistanceX: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_fTargetZ: Variant = NAN
	var v_fDistanceRatio: Variant = NAN
	var v_fMaxSpeed: Variant = NAN
	var v_fNewZ: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fRoadLimit = float(NAN)
	v_fTargetX = float(NAN)
	v_fInterpSpeed = float(NAN)
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fRetreatPosX"] = R.coerce(R.binary("+", (c).fields.get("m_fRetreatPosX"), (float(30) * float(v_fDeltaTime))), "Number")
		v_fTargetX = R.coerce(R.binary("+", (c).fields.get("m_fRetreatPosX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
		v_fInterpSpeed = float(0.3)
	else:
		pass
		v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(20))]), "Number")
		(c).fields["m_fChangeShootingPosTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fChangeShootingPosTimer"), v_fDeltaTime), "Number")
		if R.truth(((float((c).fields.get("m_fChangeShootingPosTimer")) <= float(0)) or (float(v_fRoadLimit) < float((c).fields.get("m_fRoadLimit"))))):
			pass
			(c).fields["m_fChangeShootingPosTimer"] = float((float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMin")) + float((float(randf()) * float((float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMax")) - float(R.static_value("RDHelicopterAlly", "ChangeShootingPosDelayMin"))))))))
			(c).fields["m_fTargetShootingPosX"] = R.coerce(R.binary("+", R.unary("-", v_fRoadLimit), (float((float(randf()) * float(2))) * float(v_fRoadLimit))), "Number")
		(c).fields["m_fRoadLimit"] = float(v_fRoadLimit)
		if R.truth((float((c).fields.get("m_fTargetShootingPosX")) < float((c).fields.get("m_fShootingPosX")))):
			pass
			(c).fields["m_fShootingPosX"] = float(maxf(float((float((c).fields.get("m_fShootingPosX")) - float((float(R.static_value("RDHelicopterAlly", "ShootingSpeedX")) * float(v_fDeltaTime))))), float((c).fields.get("m_fTargetShootingPosX"))))
		else:
			pass
			(c).fields["m_fShootingPosX"] = float(minf(float((float((c).fields.get("m_fShootingPosX")) + float((float(R.static_value("RDHelicopterAlly", "ShootingSpeedX")) * float(v_fDeltaTime))))), float((c).fields.get("m_fTargetShootingPosX"))))
		(c).fields["m_fRetreatPosX"] = float((c).fields.get("m_fShootingPosX"))
		v_fTargetX = R.coerce(R.binary("+", (c).fields.get("m_fShootingPosX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
		v_fInterpSpeed = float(1)
	v_fDistanceX = float((float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fNewX = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), v_fTargetX, v_fDeltaTime, v_fInterpSpeed]), "Number")
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fFlyHeight"] = R.coerce(R.binary("+", (c).fields.get("m_fFlyHeight"), (float(2) * float(v_fDeltaTime))), "Number")
	v_fNewY = R.coerce(R.binary("+", (c).fields.get("m_fFlyHeight"), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	v_fTargetZ = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(20)))
	v_fDistanceRatio = float(minf(float(R.binary("/", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(v_fTargetZ))]), 60)), float(1)))
	v_fMaxSpeed = float(maxf(float((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) * float(2))), float(R.binary("/", R.binary("/", (float(50) * float(1000)), 60), 60))))
	if R.truth((c).fields.get("m_bRetreating")):
		pass
		(c).fields["m_fRetreatSpeedZ"] = R.coerce(R.binary("+", (c).fields.get("m_fRetreatSpeedZ"), (float(R.binary("/", R.binary("/", (float(20) * float(1000)), 60), 60)) * float(v_fDeltaTime))), "Number")
	else:
		pass
		(c).fields["m_fRetreatSpeedZ"] = float(v_fMaxSpeed)
	(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(((c).fields.get("m_fRetreatSpeedZ") if R.truth((c).fields.get("m_bRetreating")) else (float((float((float(1) - float(v_fDistanceRatio))) * float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")))) + float((float(v_fDistanceRatio) * float(v_fMaxSpeed))))), "Number")
	v_fNewZ = float(minf(float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float(v_fTargetZ)))
	v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
	v_fDeltaY = float((float(v_fNewY) - float((c.fields.get("m_vLocation")).fields.get("Y"))))
	v_fDeltaZ = float((float(v_fNewZ) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	R.set_value(c.fields.get("m_MC"), "rotation", R.call_static("Maths", "Clamp", [(float(v_fDistanceX) * float(R.static_value("RDHelicopterAlly", "DistanceRotationRatio"))), R.unary("-", 45), 45]), "=")
	return null


static func c1081_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))
	return null


static func c1081_f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary(">", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])))]), 25)
	return null


static func c1081_f_StartRetreat(c: Variant, a: Array) -> Variant:
	(c).fields["m_bShootingMode"] = false
	(c).fields["m_bRetreating"] = true
	R.call_member(c, "StopFiring", [])
	return null


static func c1081_f_IsRetreating(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bRetreating")
	return null


static func c1081_f_OnHitByJumpingMutant(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Hit"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HitByMutantSound")])
	return null


static func c1081_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 4, "=")
	R.set_value(c, "SpawnDistance", 10, "=")
	R.set_value(c, "FlySoundVolumeFadeSpeed", 0.15, "=")
	R.set_value(c, "DustDelayMin", 0.05, "=")
	R.set_value(c, "DustDelayRandom", 0.15, "=")
	R.set_value(c, "MinFiringOffset", 10, "=")
	R.set_value(c, "ShootingMinDistanceZ", 5, "=")
	R.set_value(c, "ShootingMaxDistanceZ", 40, "=")
	R.set_value(c, "ShootingMinDistanceX", R.unary("-", 8), "=")
	R.set_value(c, "ShootingMaxDistanceX", 8, "=")
	R.set_value(c, "ShootingSpeedX", 5, "=")
	R.set_value(c, "ChangeShootingPosDelayMin", 3, "=")
	R.set_value(c, "ChangeShootingPosDelayMax", 2, "=")
	R.set_value(c, "FireDamage", 150, "=")
	R.set_value(c, "FireWidth", 3, "=")
	R.set_value(c, "FireBulletDelay", 0.1, "=")
	R.set_value(c, "FireMissileDelay", 1, "=")
	R.set_value(c, "DistanceRotationRatio", 2, "=")
	R.set_value(c, "RetreatDeccel", R.binary("/", R.binary("/", (float(6) * float(1000)), 60), 60), "=")
	R.set_value(c, "MissileSpeed", R.binary("/", R.binary("/", (float(200) * float(1000)), 60), 60), "=")
	R.set_value(c, "FireMissileOffsetX", 1, "=")
	R.set_value(c, "FireMissileOffsetY", R.unary("-", 0.1), "=")
	return null


static func c1082_f_RDHelp(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHelp"), [])
	return null


static func c1083_f_RDHighwayRamp(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHighwayRamp"), [null, R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDHighwayRamp", "Scale")])
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactConcrete")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.25)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.5)
	(c).fields["m_bWarnPlayer"] = true
	return null


static func c1083_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = true
	return null


static func c1083_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_bWithCollision: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.call_member(c, "InitMCs", [v_mcClass])
	(c).fields["m_bSpawnCollision"] = v_bWithCollision
	c.fields["m_bCanBeHitByBullet"] = R.binary("!=", v_mcClass, R.klass("MovieClip"))
	return null


static func c1083_f_Update(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_collision: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_collision = R.coerce(null, "RDHighwayRampCollision")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHighwayRamp", "WarnDistance")))) > float((c.fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		if R.truth(v_gameplayMode):
			pass
			R.call_member(v_gameplayMode, "OnSeeRamp", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth((c).fields.get("m_bSpawnCollision")):
		pass
		v_collision = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRampCollision")]), R.klass("RDHighwayRampCollision")), "RDHighwayRampCollision")
		R.call_member(v_collision, "Init", [c])
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_collision, R.call_static("RDWorld", "GetPerlinX", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))]), R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))]), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))])
		(c).fields["m_bSpawnCollision"] = false
	return null


static func c1083_f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")):
		pass
		return R.get_value(c.fields.get("m_MC"), "BulletCollision")
	return R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "GetBulletHitMC"), [])
	return null


static func c1083_f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "OnAddedToWorld"), [])
	R.assign(c, "m_bRampPresent", "RDHighwayRamp", true, "=")
	return null


static func c1083_f_Destroy(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_bRampPresent", "RDHighwayRamp", false, "=")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "Destroy"), [])
	return null


static func c1083_f_InitProperties(c: Variant, a: Array) -> Variant:
	R.call_member(c, "AddProperty", ["Going Left", R.static_value("RDProperty", "Type_Boolean"), false])
	return null


static func c1083_f_SetProperty(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "SetProperty"), [v_szName, v_value])
	if R.truth(R.binary("==", v_szName, "Going Left")):
		pass
		c.fields["m_bFlippedX"] = R.binary("as", v_value, R.klass("Boolean"))
	return null


static func c1084_f_RDHighwayRampCollision(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHighwayRampCollision"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Ramp"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDRoad", "FarWallPosX")), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float(R.static_value("RDRoad", "FarWallPosX")) * float(2)))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null


static func c1084_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null


static func c1084_f_Init(c: Variant, a: Array) -> Variant:
	var v_ramp: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHighwayRamp")
	(c).fields["m_Ramp"] = R.coerce(v_ramp, "RDHighwayRamp")
	return null


static func c1084_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "Update"), [v_fDeltaTime])
	return null


static func c1084_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))
	return null


static func c1084_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRampCollision"), "TouchedBy"), [v_entity])
	if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		if R.truth(R.binary("!=", ((c).fields.get("m_Ramp")).fields.get("m_szFactoryName"), "HighwayRamp")):
			pass
			R.call_member(v_gameplayMode, "OnRampReached", [])
	return null


static func c1087_f_RDImpactEffect(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDImpactEffect"), [null, R.static_value("RDEntity", "Layer_Dynamic"), 1.5])
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(50)
	return null


static func c1087_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	return null


static func c1090_f_RDJohnCar(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDJohnCar"), [R.klass("MC_johnscarbackview"), R.static_value("RDJohnCar", "Scale")])
	c.fields["m_fMinRenderScale"] = float(0.003)
	(c).fields["m_EngineSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_CarMaxSpeed4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_HornSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Horn2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_VoiceSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_JohnCameo"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_bCallToPlayer"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	return null


static func c1090_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "SetInitialState"), [])
	(c).fields["m_bCallToPlayer"] = true
	(c).fields["m_bCalledPlayer"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	return null


static func c1090_f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "Update"), [v_fDeltaTime])
	if R.truth(R.unary("!", R.call_member((c).fields.get("m_EngineSound"), "IsPlaying", []))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_EngineSound"), true])
	if R.truth(((c).fields.get("m_bCallToPlayer") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_VoiceSound")])
		(c).fields["m_bCallToPlayer"] = false
		(c).fields["m_bCalledPlayer"] = true
	if R.truth(((c).fields.get("m_bCalledPlayer") and R.unary("!", R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", [])))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		R.call_member(v_storyMode, "OnJohnCalled", [])
		(c).fields["m_bCalledPlayer"] = false
	return null


static func c1090_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fSpeedX: Variant = NAN
	var v_fDistanceRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedX = float(R.static_value("RDJohnCar", "SpeedX"))
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce((R.unary("-", 5) if R.truth(R.binary(">", (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]))) else 5), "Number")
		v_fSpeedX = R.coerce(R.binary("*", v_fSpeedX, 10), "Number")
	else:
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = float(0)
	v_fDistanceRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), 100), 0, 1]), "Number")
	(c.fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("Z"), (R.num(R.call_static("Maths", "Lerp", [(float(((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")) * float(1.25)), (float(((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")) * float(5)), (float((float(v_fDistanceRatio) * float(v_fDistanceRatio))) * float(v_fDistanceRatio))])) * float(v_fDeltaTime))), "Number")
	if R.truth((float(((c).fields.get("m_vMoveTarget")).fields.get("X")) > float((c).fields.get("m_fRelativeLocationX")))):
		pass
		(c).fields["m_fRelativeLocationX"] = float(minf(float((float((c).fields.get("m_fRelativeLocationX")) + float((float(v_fSpeedX) * float(v_fDeltaTime))))), float(((c).fields.get("m_vMoveTarget")).fields.get("X"))))
	else:
		pass
		(c).fields["m_fRelativeLocationX"] = float(maxf(float((float((c).fields.get("m_fRelativeLocationX")) - float((float(v_fSpeedX) * float(v_fDeltaTime))))), float(((c).fields.get("m_vMoveTarget")).fields.get("X"))))
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	R.call_member(c, "UpdateDepthPosition", [])
	return null


static func c1090_f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(150))))
	return null


static func c1090_f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJohnCar"), "OnAddedToWorld"), [])
	((c).fields.get("m_vMoveTarget")).fields["X"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c).fields["m_fRelativeLocationX"] = float(((c).fields.get("m_vMoveTarget")).fields.get("X"))
	return null


static func c1096_f_RDMine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMine"), [R.klass("MC_mine"), R.static_value("RDMine", "Scale")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Mines"), "int")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FenceHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BeepSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MineBeep"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsFarQuiet")]), "DTSpacialSound")
	c.fields["m_bExplode"] = true
	c.fields["m_szExplodeAnim"] = R.coerce("Explode", "String")
	c.fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(5)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fHP"] = float(1)
	return null


static func c1096_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_fHP"] = float(1)
	(c).fields["m_fBeepTimer"] = float(0)
	return null


static func c1096_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "Update"), [v_fDeltaTime])
	if R.truth(((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) > float(0))) and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		(c).fields["m_fBeepDelay"] = R.coerce(R.call_static("Maths", "Clamp", [(float(0.1) + float(R.binary("/", (float(v_fDistance) * float(0.9)), 50))), 0, 1]), "Number")
		(c).fields["m_fBeepTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fBeepTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fBeepTimer")) >= float((c).fields.get("m_fBeepDelay")))):
			pass
			(c).fields["m_fBeepTimer"] = float(0)
			R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", true, "=")
			R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Light"), "gotoAndPlay"), [1])
			if R.truth(((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDMine", "m_iBeepTick")))) > float(5)) or (float(v_fDistance) < float(R.static_value("RDMine", "m_fBeepDistance"))))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BeepSound")])
				R.assign(c, "m_iBeepTick", "RDMine", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
				R.assign(c, "m_fBeepDistance", "RDMine", v_fDistance, "=")
	return null


static func c1096_f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMinesShot", 1, "+=")
	return null


static func c1096_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null


static func c1096_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "TouchedBy"), [v_entity])
	R.call_member(c, "Explode", [v_entity])
	return null


static func c1099_f_RDMotionDetectorMine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMotionDetectorMine"), [R.klass("MC_minemotion"), R.static_value("RDMotionDetectorMine", "Scale")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_MotionDetectorMines"), "int")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FenceHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BeepSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ProximityMine"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsFarQuiet")]), "DTSpacialSound")
	c.fields["m_bExplode"] = true
	c.fields["m_szExplodeAnim"] = R.coerce("Explode", "String")
	c.fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(5)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fHP"] = float(1)
	c.fields["m_fExplosionRangeX"] = float(4)
	c.fields["m_fExplosionRangeZ"] = float(8)
	c.fields["m_fExplosionDamage"] = float(500)
	return null


static func c1099_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "SetInitialState"), [])
	(c).fields["m_fBeepTimer"] = float(0)
	(c).fields["m_bPlayBeep"] = true
	(c).fields["m_bWaitToExplode"] = false
	(c).fields["m_bDetectPlayer"] = false
	(c).fields["m_bMineExploded"] = false
	(c).fields["m_fDelayedExplosionTimer"] = float(0)
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_fHP"] = float(1)
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_NextMine"] = R.coerce(null, "RDMotionDetectorMine")
	(c).fields["m_PreviousMine"] = R.coerce(null, "RDMotionDetectorMine")
	return null


static func c1099_f_Init(c: Variant, a: Array) -> Variant:
	var v_bDetectPlayer: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bDetectPlayer"] = v_bDetectPlayer
	return null


static func c1099_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "Update"), [v_fDeltaTime])
	if R.truth((((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) > float(0))) and R.unary("!", (c).fields.get("m_bMineExploded"))) and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		(c).fields["m_fBeepDelay"] = R.coerce(R.call_static("Maths", "Clamp", [(float(0.1) + float(R.binary("/", (float(v_fDistance) * float(0.9)), 50))), 0, 1]), "Number")
		(c).fields["m_fBeepTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fBeepTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fBeepTimer")) >= float((c).fields.get("m_fBeepDelay")))):
			pass
			(c).fields["m_fBeepTimer"] = float(0)
			R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", true, "=")
			R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Light"), "gotoAndPlay"), [1])
		if R.truth((c).fields.get("m_bDetectPlayer")):
			pass
			if R.truth(((c).fields.get("m_bPlayBeep") and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), R.call_member(c, "GetDetectDistance", [])))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BeepSound")])
				(c).fields["m_bPlayBeep"] = false
				(c).fields["m_bWaitToExplode"] = true
			if R.truth(((c).fields.get("m_bWaitToExplode") and R.unary("!", R.call_member((c).fields.get("m_BeepSound"), "IsPlaying", [])))):
				pass
				(c).fields["m_bMineExploded"] = true
				R.call_member(c, "Explode", [c])
				(c).fields["m_bWaitToExplode"] = false
		if R.truth((float((c).fields.get("m_fDelayedExplosionTimer")) > float(0))):
			pass
			(c).fields["m_fDelayedExplosionTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDelayedExplosionTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fDelayedExplosionTimer")) <= float(0))):
				pass
				(c).fields["m_bMineExploded"] = true
				R.call_member(c, "Explode", [c])
	return null


static func c1099_f_StartDelayedExplosion(c: Variant, a: Array) -> Variant:
	(c).fields["m_fDelayedExplosionTimer"] = float(R.static_value("RDMotionDetectorMine", "ExplosionDelay"))
	return null


static func c1099_f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMinesShot", 1, "+=")
	return null


static func c1099_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and R.unary("!", (c).fields.get("m_bMineExploded"))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null


static func c1099_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "TouchedBy"), [v_entity])
	(c).fields["m_bMineExploded"] = true
	R.call_member(c, "Explode", [v_entity])
	return null


static func c1099_f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "TakeExplosionDamage"), [v_entity, v_instigator, v_iDamage, v_iDamageType, v_fDamageRatio])
	return null


static func c1099_f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "Explode"), [v_instigator])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BeepSound")])
	if R.truth((c).fields.get("m_NextMine")):
		pass
		R.call_member((c).fields.get("m_NextMine"), "StartDelayedExplosion", [])
	if R.truth((c).fields.get("m_PreviousMine")):
		pass
		R.call_member((c).fields.get("m_PreviousMine"), "StartDelayedExplosion", [])
	return null


static func c1099_f_GetDetectDistance(c: Variant, a: Array) -> Variant:
	return (float(R.static_value("RDMotionDetectorMine", "MinDetectDistance")) + float((R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])) * float((float(R.static_value("RDMotionDetectorMine", "MaxDetectDistance")) - float(R.static_value("RDMotionDetectorMine", "MinDetectDistance")))))))
	return null


static func c1101_f_RDObjectBulletImpact(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectBulletImpact"), [null, R.static_value("RDEntity", "Layer_Dynamic")])
	return null


static func c1101_f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	c.fields["m_fScale"] = float(v_fScale)
	R.call_member(c, "InitMCs", [v_mcClass])
	return null


static func c1102_f_RDObjectDust(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectDust"), [R.klass("MC_HelicopterDust"), R.static_value("RDEntity", "Layer_Dynamic")])
	return null


static func c1103_f_RDObjectEngineExplosion(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectEngineExplosion"), [R.klass("MC_EngineExplosion"), R.static_value("RDEntity", "Layer_Dynamic"), 6])
	return null


static func c1104_f_RDObjectFire(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectFire"), [R.klass("MC_Fire"), R.static_value("RDEntity", "Layer_Dynamic"), 2])
	return null


static func c1105_f_RDObjectMetalExplosion(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectMetalExplosion"), [R.klass("MC_MetalExplosion"), R.static_value("RDEntity", "Layer_Dynamic"), 6])
	return null


static func c1106_f_RDObjectShoppingMall(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectShoppingMall"), [R.klass("MC_ShoppingMall"), R.static_value("RDEntity", "Layer_Dynamic"), 9])
	return null


static func c1107_f_RDObjectSmoke(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectSmoke"), [R.klass("MC_Smoke"), R.static_value("RDEntity", "Layer_Dynamic"), 4])
	return null


static func c1157_f_RDOilSlick(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDOilSlick"), [R.klass("MC_OilSpill"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_OilSpills"), "int")
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_OilSlick"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 1.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(3)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	return null


static func c1157_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDOilSlick"), "SetInitialState"), [])
	(c).fields["m_bTriggered"] = false
	return null


static func c1157_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null


static func c1157_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDOilSlick"), "TouchedBy"), [v_entity])
	if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))):
		pass
		(c).fields["m_bTriggered"] = true
	return null


static func c1158_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDParallaxBackground"), "SetInitialState"), [])
	(c).fields["m_bUseFog"] = false
	(c).fields["m_bHidden"] = false
	return null


static func c1158_f_SetHidden(c: Variant, a: Array) -> Variant:
	var v_bHidden: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bHidden"] = v_bHidden
	if R.truth((c).fields.get("m_bHidden")):
		pass
		R.set_value(c.fields.get("m_MC"), "alpha", 0, "=")
	else:
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bUseFog"))):
			pass
			R.set_value(c.fields.get("m_MC"), "alpha", 1, "=")
	return null


static func c1160_f_RDPatternInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPatternInfo"), [])
	return null


static func c1167_f_RDProjectile(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	R.invoke(R.super_ref(c, "RDProjectile"), [v_mcClass, v_fScale])
	return null


static func c1167_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDProjectile"), "SetInitialState"), [])
	return null


static func c1168_f_RDProperty(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_defaultValue: Variant = R.coerce((a[2] if a.size() > 2 else null), "*")
	R.invoke(R.super_ref(c, "RDProperty"), [])
	(c).fields["m_szName"] = R.coerce(v_szName, "String")
	(c).fields["m_iType"] = R.coerce(v_iType, "int")
	R.call_member(c, "SetValue", [v_defaultValue])
	return null


static func c1168_f_SetValue(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
		pass
		(c).fields["m_fNumberValue"] = float(R.binary("as", v_value, R.klass("Number")))
	else:
		pass
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
			pass
			(c).fields["m_bBooleanValue"] = R.binary("as", v_value, R.klass("Boolean"))
		else:
			pass
			if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
				pass
				(c).fields["m_szStringValue"] = R.coerce(R.binary("as", v_value, R.klass("String")), "String")
	return null


static func c1168_f_GetValue(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
		pass
		return (c).fields.get("m_fNumberValue")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
		pass
		return (c).fields.get("m_bBooleanValue")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
		pass
		return (c).fields.get("m_szStringValue")
	return null
	return null


static func c1173_f_RDSoldier(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSoldier"), [R.klass("MC_Soldier"), R.static_value("RDSpawnType", "Soldier"), R.static_value("RDSoldier", "Scale")])
	(c).fields["m_SuppressZone"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MC_SoldierSuppressZone")]), "MovieClip")
	R.set_value((c).fields.get("m_SuppressZone"), "alpha", 0, "=")
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_SuppressZone")])
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_Soldier"), "int")
	(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_None"), "int")
	(c).fields["m_fClingFireTimer"] = float(0)
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_MachineGunFireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierMachineGunFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsMilitaryGun")]), "DTSpacialSound")
	R.call_member((c).fields.get("m_MachineGunFireSound"), "SetMaxVolume", [0.9])
	(c).fields["m_PistolFireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPistolFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsMilitaryGun")]), "DTSpacialSound")
	(c).fields["m_HeadshotHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HeadshotHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_GibHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_GibHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_bInitBehavior"] = true
	(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = (float(randf()) < float(0.25))
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_fClingHP"] = float(30)
	c.fields["m_fBodyHP"] = float(10)
	c.fields["m_fHeadHP"] = float(10)
	(c).fields["m_BlockedHeadHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	(c).fields["m_BlockedHeadHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	c.fields["m_fClingChanceMultiplier"] = float(0.6)
	return null


static func c1173_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "SetInitialState"), [])
	(c).fields["m_SuppressZone"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MC_SoldierSuppressZone")]), "MovieClip")
	R.set_value((c).fields.get("m_SuppressZone"), "alpha", 0, "=")
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_SuppressZone")])
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Spikes"] = R.coerce(null, "RDSpikeStrip")
	(c).fields["m_bSlideRight"] = false
	(c).fields["m_bAdjusted"] = false
	(c).fields["m_bAdjusting"] = false
	(c).fields["m_bDonateExplosiveRight"] = false
	(c).fields["m_bHasCorrectedAim"] = false
	(c).fields["m_bInitBehavior"] = false
	(c).fields["m_bSpawnGoLeft"] = false
	(c).fields["m_bHasGunOut"] = false
	(c).fields["m_fIsFiringTimer"] = float(0)
	(c).fields["m_fIsFiringDuration"] = float(0)
	(c).fields["m_bIsFiring"] = false
	(c).fields["m_fSuppressValue"] = float(0)
	(c).fields["m_fSlideOutTimer"] = float(0)
	(c).fields["m_fSlideOutDelay"] = float(0)
	(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_bCanBeHitForBlood"] = false
	(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	(c).fields["m_bHitForBlood"] = false
	(c).fields["m_fDissapearTimer"] = float(0)
	(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_None"), "int")
	(c).fields["m_fClingFireTimer"] = float(0)
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_bInitBehavior"] = true
	(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = (float(randf()) < float(0.25))
	c.fields["m_fClingHP"] = float(30)
	c.fields["m_fBodyHP"] = float(10)
	c.fields["m_fHeadHP"] = float(10)
	return null


static func c1173_f_Init(c: Variant, a: Array) -> Variant:
	var v_bIsVoice2: Variant = false
	var v_iBehavior: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bIsVoice2 = false
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iBehavior"] = R.coerce(v_iBehavior, "int")
	if R.truth((((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer"))) or (float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))) or (float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot"))))):
		pass
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_EnemySoldiers"), "int")
	else:
		pass
		if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
			pass
			c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_SpikeSoldiers"), "int")
		else:
			pass
			if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
				pass
				c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_BombSquad"), "int")
	if R.truth((c).fields.get("m_bGiveCue")):
		pass
		if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			v_bIsVoice2 = R.static_value("RDSoldier", "m_bShootPlayerVoiceMale2")
			R.assign(c, "m_bShootPlayerVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bShootPlayerVoiceMale2")), "=")
		else:
			pass
			if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				v_bIsVoice2 = R.static_value("RDSoldier", "m_bAdjustAndShootPlayerVoiceMale2")
				R.assign(c, "m_bAdjustAndShootPlayerVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bAdjustAndShootPlayerVoiceMale2")), "=")
			else:
				pass
				if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
					pass
					v_bIsVoice2 = R.static_value("RDSoldier", "m_bSliderOutAndShootVoiceMale2")
					R.assign(c, "m_bSliderOutAndShootVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bSliderOutAndShootVoiceMale2")), "=")
				else:
					pass
					if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
						pass
						v_bIsVoice2 = R.static_value("RDSoldier", "m_bPullSpikeStripVoiceMale2")
						R.assign(c, "m_bPullSpikeStripVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bPullSpikeStripVoiceMale2")), "=")
					else:
						pass
						if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
							pass
							v_bIsVoice2 = R.static_value("RDSoldier", "m_bTriggerExplosionVoiceMale2")
							R.assign(c, "m_bTriggerExplosionVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bTriggerExplosionVoiceMale2")), "=")
	else:
		pass
		v_bIsVoice2 = (float(randf()) < float(0.5))
	if R.truth(v_bIsVoice2):
		pass
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GruntSounds"), "RandomHat")
		(c).fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GetOnHoodSounds"), "RandomHat")
		(c).fields["m_ThreatSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "RandomHat")
		(c).fields["m_CollisionSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "RandomHat")
		(c).fields["m_GetOffSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "RandomHat")
		(c).fields["m_StationaryCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2StationaryCueSounds"), "RandomHat")
		(c).fields["m_AlignAndShootCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2AlignAndShootCueSounds"), "RandomHat")
		(c).fields["m_HiddenCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2HiddenCueSounds"), "RandomHat")
		(c).fields["m_SpikesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2SpikesCueSounds"), "RandomHat")
		(c).fields["m_ExplosivesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2ExplosivesCueSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GruntSounds"), "RandomHat")
		(c).fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GetOnHoodSounds"), "RandomHat")
		(c).fields["m_ThreatSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "RandomHat")
		(c).fields["m_CollisionSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "RandomHat")
		(c).fields["m_GetOffSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "RandomHat")
		(c).fields["m_StationaryCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1StationaryCueSounds"), "RandomHat")
		(c).fields["m_AlignAndShootCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1AlignAndShootCueSounds"), "RandomHat")
		(c).fields["m_HiddenCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1HiddenCueSounds"), "RandomHat")
		(c).fields["m_SpikesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1SpikesCueSounds"), "RandomHat")
		(c).fields["m_ExplosivesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1ExplosivesCueSounds"), "RandomHat")
	return null


static func c1173_f_Update(c: Variant, a: Array) -> Variant:
	var v_cueSounds: Variant = null
	var v_cueSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_cueSounds = R.coerce(null, "RandomHat")
	v_cueSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["Run"])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["EditorSpikes"])
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["EditorBombs"])
		return null
	if R.truth((c).fields.get("m_bGiveCue")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			v_cueSounds = R.coerce((c).fields.get("m_StationaryCueSounds"), "RandomHat")
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				v_cueSounds = R.coerce((c).fields.get("m_AlignAndShootCueSounds"), "RandomHat")
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
					pass
					v_cueSounds = R.coerce((c).fields.get("m_HiddenCueSounds"), "RandomHat")
				else:
					pass
					if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
						pass
						v_cueSounds = R.coerce((c).fields.get("m_SpikesCueSounds"), "RandomHat")
					else:
						pass
						if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
							pass
							v_cueSounds = R.coerce((c).fields.get("m_ExplosivesCueSounds"), "RandomHat")
		if R.truth(v_cueSounds):
			pass
			v_cueSound = R.coerce(R.binary("as", R.call_member(v_cueSounds, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_cueSound])
		(c).fields["m_bGiveCue"] = false
	if R.truth((c).fields.get("m_bHitFinished")):
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasSoundPlaying", []))):
			pass
			(c).fields["m_fDissapearTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDissapearTimer"), v_fDeltaTime), "Number")
			if R.truth(((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Shot"))) or (float((c).fields.get("m_fDissapearTimer")) > float(10)))):
				pass
				c.fields["m_bDestroyMe"] = true
		return null
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.call_member(c, "UpdateClingState", [v_fDeltaTime])
	else:
		pass
		R.call_member(c, "UpdateState", [v_fDeltaTime])
	return null


static func c1173_f_UpdateState(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	var v_fDistance: Variant = NAN
	var v_fLimit: Variant = NAN
	var v_bPull: Variant = false
	var v_iPlayerLane: Variant = 0
	var v_fDamage: Variant = NAN
	var v_bHitPlayer: Variant = false
	var v_hitEntity: Variant = null
	var v_bulletHitCarSound: Variant = null
	var v_bulletMissSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedRatio = float(NAN)
	v_fDistance = float(NAN)
	v_fLimit = float(NAN)
	v_bPull = false
	v_iPlayerLane = R.coerce(0, "int")
	v_fDamage = float(NAN)
	v_bHitPlayer = false
	v_hitEntity = R.coerce(null, "RDEntity")
	v_bulletHitCarSound = R.coerce(null, "DTSpacialSound")
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (c).fields.get("m_bExploded"))):
		pass
		return null
	if R.truth((c).fields.get("m_bInitBehavior")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
			pass
			R.call_member(c, "SetupExplosives", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				R.call_member(c, "SetupSpikes", [])
		(c).fields["m_bInitBehavior"] = false
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Hidden"), "int")
		else:
			pass
			if R.truth(((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip"))) or (float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion"))))):
				pass
				(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStripIdle"), "int")
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_Spawning")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Spawning"), "int")
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
	if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle")))):
		pass
		if R.truth((((float((c.fields.get("m_vLocation")).fields.get("Z")) >= float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))):
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
				pass
				v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
				if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "FireDistance")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_IdleToFire"), "int")
					R.call_member(c, "UpdateAnimation", [true])
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
					pass
					if R.truth(R.unary("!", (c).fields.get("m_bAdjusting"))):
						pass
						v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
						if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "AdjustDistance")))):
							pass
							v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
							(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(5))) + float((float(randf()) * float(5)))), R.unary("-", v_fLimit), v_fLimit]), "Number")
							(c).fields["m_bAdjusting"] = true
	else:
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Hidden")))):
			pass
			v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
			v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
			if R.truth((float(v_fDistance) < float(maxf(float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "SlideOutDistance")))), float(10))))):
				pass
				(c).fields["m_fSlideOutTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSlideOutTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fSlideOutTimer")) >= float((c).fields.get("m_fSlideOutDelay")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideOut"), "int")
					R.call_member(c, "UpdateAnimation", [true])
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStripIdle")))):
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
					pass
					v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
					v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
					if R.truth((float(v_fDistance) < float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "PullSpikesDistance")))))):
						pass
						v_bPull = false
						v_iPlayerLane = R.coerce(R.call_static("RDRoad", "GetLaneFromXPos", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])))]), "int")
						if R.truth((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) == float(v_iPlayerLane))):
							pass
							v_bPull = (float(randf()) < float(0.25))
						else:
							pass
							v_bPull = (float(randf()) < float(0.75))
						if R.truth(v_bPull):
							pass
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStrip"), "int")
							R.call_member(c, "UpdateAnimation", [true])
				else:
					pass
					v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
					v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
					if R.truth((float(v_fDistance) < float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "TriggerExplosionDistance")))))):
						pass
						(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStrip"), "int")
						R.call_member(c, "UpdateAnimation", [true])
			else:
				pass
				if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire"))))):
					pass
					if R.truth((((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))) or ((c).fields.get("m_Player")).fields.get("m_bFailed")) or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
						pass
						(c).fields["m_bIsFiring"] = false
						R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
						R.call_member(c, "UpdateAnimation", [true])
					else:
						pass
						(c).fields["m_fIsFiringTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fIsFiringTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fIsFiringTimer")) > float((c).fields.get("m_fIsFiringDuration")))):
							pass
							(c).fields["m_bIsFiring"] = R.unary("!", (c).fields.get("m_bIsFiring"))
							(c).fields["m_fIsFiringTimer"] = float(0)
							(c).fields["m_fIsFiringDuration"] = R.coerce(((float(R.static_value("RDSoldier", "FiringDurationMin")) + float((float(randf()) * float((float(R.static_value("RDSoldier", "FiringDurationMax")) - float(R.static_value("RDSoldier", "FiringDurationMin"))))))) if R.truth((c).fields.get("m_bIsFiring")) else (float(R.static_value("RDSoldier", "NotFiringDurationMin")) + float((float(randf()) * float((float(R.static_value("RDSoldier", "NotFiringDurationMax")) - float(R.static_value("RDSoldier", "NotFiringDurationMin")))))))), "Number")
							if R.truth((c).fields.get("m_bIsFiring")):
								pass
								if R.truth(R.unary("!", R.call_member((c).fields.get("m_MachineGunFireSound"), "IsPlaying", []))):
									pass
									R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
							else:
								pass
								R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
							R.call_member(c, "UpdateAnimation", [true])
						if R.truth((c).fields.get("m_bIsFiring")):
							pass
							(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
							if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float(R.static_value("RDSoldier", "FireBulletDelay")))):
								pass
								(c).fields["m_fFireBulletTimer"] = float(0)
								v_fDamage = R.coerce((R.static_value("RDSoldier", "HiddenBodyFireDamage") if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))) else R.static_value("RDSoldier", "BodyFireDamage")), "Number")
								v_bHitPlayer = ((c).fields.get("m_bHasCorrectedAim") or R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDSoldier", "FireWidth")))
								v_hitEntity = R.coerce(R.call_member(c, "TestLineOfFire", [v_bHitPlayer]), "RDEntity")
								if R.truth(v_hitEntity):
									pass
									if R.truth(R.binary("==", R.binary("as", v_hitEntity, R.klass("RDZombie")), null)):
										pass
										R.call_member(c, "AddSuppressValue", [0.3])
									R.call_member(v_hitEntity, "OnSoldierBulletHit", [v_fDamage, R.static_value("RDDamageType", "SoldierMachineGunBullet")])
								else:
									pass
									if R.truth(v_bHitPlayer):
										pass
										if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDSoldier", "m_iPlayerDamageTime")))) > float(3))):
											pass
											R.call_member((c).fields.get("m_Player"), "TakeDamage", [v_fDamage, c, R.static_value("RDDamageType", "SoldierMachineGunBullet")])
											R.assign(c, "m_iPlayerDamageTime", "RDSoldier", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
									else:
										pass
										if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDSoldier", "MissWidth"))):
											pass
											v_bulletHitCarSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
											R.call_member(c, "PlaySoundOnActor", [v_bulletHitCarSound])
										else:
											pass
											v_bulletMissSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
											R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
						if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))):
							pass
							if R.truth((c).fields.get("m_bHasCorrectedAim")):
								pass
								if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDSoldier", "IdleAimCorrectionMaxSpeed")))):
									pass
									(c).fields["m_bHasCorrectedAim"] = false
							else:
								pass
								if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDSoldier", "IdleAimCorrectionMinSpeed")))):
									pass
									(c).fields["m_fIdleAimCorrectionTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fIdleAimCorrectionTimer"), v_fDeltaTime), "Number")
									if R.truth((float((c).fields.get("m_fIdleAimCorrectionTimer")) >= float(R.static_value("RDSoldier", "IdleAimCorrectionDelay")))):
										pass
										(c).fields["m_bHasCorrectedAim"] = true
				else:
					pass
					if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Spawning")))):
						pass
						if R.truth((((((c).fields.get("m_bSpawnGoLeft") and (float((c).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fSpawnWalkTarget")))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float((c).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fSpawnWalkTarget"))))) or ((c).fields.get("m_bSpawnGoLeft") and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fRelativeLocationX"))))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fRelativeLocationX")))))):
							pass
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
							(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
	return null


static func c1173_f_UpdateClingState(c: Variant, a: Array) -> Variant:
	var v_threatSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_threatSound = R.coerce(null, "DTSpacialSound")
	if R.truth((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))):
		pass
		(c).fields["m_fClingFireTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fClingFireTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fClingFireTimer")) >= float(R.static_value("RDSoldier", "ClingFireDelay")))):
			pass
			(c).fields["m_fClingFireTimer"] = float(0)
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Attack"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
	if R.truth(((((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))) and R.unary("!", R.call_member(c, "HasVoicePlaying", [])))):
		pass
		(c).fields["m_fThreatTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fThreatTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fThreatTimer")) <= float(0))):
			pass
			(c).fields["m_fThreatTimer"] = float((float(R.static_value("RDSoldier", "ThreatDelayMin")) + float((float(randf()) * float(R.static_value("RDSoldier", "ThreatDelayRandom"))))))
			v_threatSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_ThreatSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_threatSound])
	return null


static func c1173_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_vDir: Variant = null
	var v_fDistance: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_vDir = R.coerce(null, "DTVector3D")
	v_fDistance = float(NAN)
	if R.truth((c.fields.get("m_bEditorMode") or (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None"))))):
		pass
		return null
	v_fDeltaX = float(0)
	v_fDeltaY = float(0)
	v_fDeltaZ = float(0)
	if R.truth((c).fields.get("m_bExploded")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		v_fDeltaZ = float(0)
		v_fDeltaX = float(0)
	else:
		pass
		if R.truth(R.unary("!", c.fields.get("m_bHit"))):
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle")))):
				pass
				if R.truth((c).fields.get("m_bAdjusting")):
					pass
					if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float((c).fields.get("m_fAdjustPosX")))]), 0.1)):
						pass
						v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
						if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "FireDistance")))):
							pass
							(c).fields["m_bAdjusting"] = false
							(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Fire"), "int")
							R.call_member(c, "UpdateAnimation", [true])
						(c.fields.get("m_vVelocity")).fields["X"] = float(0)
					else:
						pass
						if R.truth((float((c).fields.get("m_fAdjustPosX")) < float((c).fields.get("m_fRelativeLocationX")))):
							pass
							v_fDeltaX = float(maxf(float((float((c).fields.get("m_fAdjustPosX")) - float((c).fields.get("m_fRelativeLocationX")))), float((R.num(R.unary("-", R.static_value("RDSoldier", "SpeedX"))) * float(v_fDeltaTime)))))
							(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDSoldier", "SpeedX")), "Number")
						else:
							pass
							if R.truth((float((c).fields.get("m_fAdjustPosX")) > float((c).fields.get("m_fRelativeLocationX")))):
								pass
								v_fDeltaX = float(minf(float((float((c).fields.get("m_fAdjustPosX")) - float((c).fields.get("m_fRelativeLocationX")))), float((float(R.static_value("RDSoldier", "SpeedX")) * float(v_fDeltaTime)))))
								(c.fields.get("m_vVelocity")).fields["X"] = float(R.static_value("RDSoldier", "SpeedX"))
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Spawning")))):
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = R.coerce((R.unary("-", (c).fields.get("m_fSpawnSpeedX")) if R.truth((c).fields.get("m_bSpawnGoLeft")) else (c).fields.get("m_fSpawnSpeedX")), "Number")
					v_fDeltaX = float((float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)))
			if R.truth((float(v_fDeltaX) != float(0))):
				pass
				c.fields["m_bFlippedX"] = (float(v_fDeltaX) < float(0))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ, (c).fields.get("m_Player")])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	return null


static func c1173_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_explosive: Variant = null
	var v_iNewSpikeLane: Variant = 0
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_i = R.coerce(0, "int")
	v_explosive = R.coerce(null, "RDExplosive")
	v_iNewSpikeLane = R.coerce(0, "int")
	if R.truth(R.binary("==", v_szEvent, "EndHitForBlood")):
		pass
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "TriggerPulled")):
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				v_iNewSpikeLane = R.coerce((R.coerce((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) - float(1)), "int") if R.truth(c.fields.get("m_bFlippedX")) else R.coerce((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) + float(1)), "int")), "int")
				R.call_member((c).fields.get("m_Spikes"), "SlideTo", [R.binary("+", R.call_static("RDRoad", "GetLaneXPos", [v_iNewSpikeLane]), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))])
			else:
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(R.static_value("RDSoldier", "NbExplosives")))):
					pass
					v_explosive = R.coerce(R.invoke(R.klass("RDExplosive"), [R.get_value((c).fields.get("m_Explosives"), v_i)]), "RDExplosive")
					R.call_member(v_explosive, "Detonate", [(float(v_i) * float(R.static_value("RDSoldier", "ExplosiveDelay")))])
					v_i = R.signed32(v_i + 1)
		else:
			pass
			R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnAnimEvent"), [v_szEvent])
	return null


static func c1173_f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth((((((R.binary("==", c.fields.get("m_szAnim"), "SideHit") or R.binary("==", c.fields.get("m_szAnim"), "FrontHit")) or R.binary("==", c.fields.get("m_szAnim"), "HeadlessHit")) or R.binary("==", c.fields.get("m_szAnim"), "RollOverHit")) or R.binary("==", c.fields.get("m_szAnim"), "GibHit")) or R.binary("==", c.fields.get("m_szAnim"), "Shot"))):
		pass
		(c).fields["m_bCanBeHitForBlood"] = false
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
		(c).fields["m_bHitFinished"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(((((R.binary("==", c.fields.get("m_szAnim"), "Idle") or R.binary("==", c.fields.get("m_szAnim"), "SlideOutIdle")) or R.binary("==", c.fields.get("m_szAnim"), "PullSpikeStripIdle")) or R.binary("==", c.fields.get("m_szAnim"), "PullSpikeStrip")) or R.binary("==", c.fields.get("m_szAnim"), "Hidden"))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "SlideOut")):
		pass
		if R.truth(((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding")) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideOutIdle"), "int")
		else:
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideFire"), "int")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
	else:
		pass
		if R.truth(R.binary("==", c.fields.get("m_szAnim"), "SlideIn")):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Hidden"), "int")
		else:
			pass
			if R.truth(R.binary("==", c.fields.get("m_szAnim"), "IdleToFire")):
				pass
				if R.truth(((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding")) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
					(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Fire"), "int")
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnEndAnim"), [])
	return null


static func c1173_f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_szNewAnim: Variant = null
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_szNewAnim = R.coerce("", "String")
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		v_szNewAnim = R.coerce("Clinging", "String")
	else:
		pass
		if R.truth((c).fields.get("m_bExploded")):
			pass
			v_szNewAnim = R.coerce("GibHit", "String")
		else:
			pass
			if R.truth(c.fields.get("m_bHit")):
				pass
				if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
					pass
					v_szNewAnim = R.coerce("Shot", "String")
				else:
					pass
					if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
						pass
						v_szNewAnim = R.coerce("GibHit", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Front")))):
							pass
							v_szNewAnim = R.coerce("FrontHit", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Headless")))):
								pass
								v_szNewAnim = R.coerce("HeadlessHit", "String")
							else:
								pass
								if R.truth(((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_RollOver"))) or (float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_SlowRollOver"))))):
									pass
									v_szNewAnim = R.coerce("RollOverHit", "String")
								else:
									pass
									v_szNewAnim = R.coerce("SideHit", "String")
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_IdleToFire")))):
					pass
					v_szNewAnim = R.coerce("IdleToFire", "String")
				else:
					pass
					if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))):
						pass
						v_szNewAnim = R.coerce(("Fire" if R.truth((c).fields.get("m_bIsFiring")) else "NoFire"), "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Hidden")))):
							pass
							v_szNewAnim = R.coerce("Hidden", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideOut")))):
								pass
								v_szNewAnim = R.coerce("SlideOut", "String")
							else:
								pass
								if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideIn")))):
									pass
									v_szNewAnim = R.coerce("SlideIn", "String")
								else:
									pass
									if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideOutIdle")))):
										pass
										v_szNewAnim = R.coerce("SlideOutIdle", "String")
									else:
										pass
										if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire")))):
											pass
											v_szNewAnim = R.coerce(("SlideFire" if R.truth((c).fields.get("m_bIsFiring")) else "SlideNoFire"), "String")
										else:
											pass
											if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStripIdle")))):
												pass
												v_szNewAnim = R.coerce("PullSpikeStripIdle", "String")
											else:
												pass
												if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStrip")))):
													pass
													v_szNewAnim = R.coerce("PullSpikeStrip", "String")
												else:
													pass
													if R.truth((float((c.fields.get("m_vVelocity")).fields.get("X")) != float(0))):
														pass
														v_szNewAnim = R.coerce("Run", "String")
													else:
														pass
														v_szNewAnim = R.coerce("Idle", "String")
	R.call_member(c, "PlayAnim", [v_szNewAnim, v_bForce])
	return null


static func c1173_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (((R.unary("!", c.fields.get("m_bHit")) or ((c).fields.get("m_bCanBeHitForBlood") and R.binary("==", v_entity, (c).fields.get("m_Player")))) and R.unary("!", (c).fields.get("m_bExploded"))) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null


static func c1173_f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_fClingChance: Variant = NAN
	var v_bCling: Variant = false
	var v_clingSound: Variant = null
	var v_getOnHoodSound: Variant = null
	var v_fSpeed: Variant = NAN
	var v_hitSound: Variant = null
	var v_iHitAlign: Variant = 0
	var v_gruntSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_fClingChance = float(NAN)
	v_bCling = false
	v_clingSound = R.coerce(null, "DTSpacialSound")
	v_getOnHoodSound = R.coerce(null, "DTSpacialSound")
	v_fSpeed = float(NAN)
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_iHitAlign = R.coerce(0, "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bCanBeHitForBlood")):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bHitForBlood"))):
			pass
			R.call_member((c).fields.get("m_Player"), "OnHitSoldierForBlood", [c])
			(c).fields["m_bHitForBlood"] = true
			v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [v_hitSound])
			if R.truth((c).fields.get("m_bCanBeHitForBloodWithAnim")):
				pass
				c.fields["m_bFlippedX"] = (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float((c).fields.get("m_fRelativeLocationX")))
				(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
				R.call_member(c, "UpdateDepthPosition", [])
				(c.fields.get("m_vVelocity")).fields["X"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
				c.fields["m_bUseCurvyCamera"] = false
				R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
				(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Headless"), "int")
				R.call_member(c, "UpdateAnimation", [true])
	else:
		pass
		v_fClingChance = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingChance", [(float((c.fields.get("m_vLocation")).fields.get("X")) < float(((v_entity).fields.get("m_vLocation")).fields.get("X"))), c]), "Number")
		v_bCling = R.coerce(((float(randf()) < float(v_fClingChance)) if R.truth((float(v_fClingChance) > float(0))) else false), "Boolean")
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		if R.truth(v_bCling):
			pass
			c.fields["m_bClingLeft"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(((v_entity).fields.get("m_vLocation")).fields.get("X")))
			R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
			R.call_member((c).fields.get("m_Player"), "SetClinger", [c, c.fields.get("m_bClingLeft"), false])
			c.fields["m_ClingMC"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [c]), "MovieClip")
			R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "addChild"), [c.fields.get("m_ClingMC")])
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Start"), "int")
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "UpdateClingAnimation", [])
			(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
			R.call_member(c, "UpdateDepthPosition", [])
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			c.fields["m_bUseCurvyCamera"] = false
			R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
			v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [v_clingSound])
			v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
			return true
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		v_fSpeed = float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))
		if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinMultiHitSpeed")))):
			pass
			v_iHitAlign = R.coerce(R.call_member((c).fields.get("m_Player"), "GetHitAlign", [c]), "int")
			if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
				pass
				if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinGibSpeed")))):
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
					R.call_member((c).fields.get("m_Player"), "OnGibSoldier", [c])
				else:
					pass
					(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
			else:
				pass
				if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center")))):
					pass
					(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
				else:
					pass
					if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight"))))):
						pass
						if R.truth((float(randf()) < float(0.4))):
							pass
							(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
						else:
							pass
							(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
					else:
						pass
						(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
		else:
			pass
			(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_SlowRollOver"), "int")
			R.call_member(c, "DoRollOverEffect", [])
		c.fields["m_bFlippedX"] = (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float((c).fields.get("m_fRelativeLocationX")))
		(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
		R.call_member(c, "UpdateDepthPosition", [])
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		c.fields["m_bUseCurvyCamera"] = false
		R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
		else:
			pass
			R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "UpdateAnimation", [true])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierKilled", [c, (c).fields.get("m_iHitType")])
	return false
	return null


static func c1173_f_OnClingAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "ClingAnimDoAttack")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PistolFireSound")])
		R.call_member((c).fields.get("m_Player"), "TakeDamage", [R.static_value("RDSoldier", "ClingBodyFireDamage"), c, R.static_value("RDDamageType", "SoldierPistolBullet")])
		(c).fields["m_bHasGunOut"] = false
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "ClingAnimDoFakeAttack")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PistolFireSound")])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "ClingAnimDrawGun")):
				pass
				(c).fields["m_bHasGunOut"] = true
			else:
				pass
				R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnClingAnimEvent"), [v_szEvent])
	return null


static func c1173_f_OnClingAnimationEnded(c: Variant, a: Array) -> Variant:
	if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Attack"))))):
		pass
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
	else:
		pass
		if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideLeft"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideRight"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
		else:
			pass
			if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot"))))):
				pass
				R.call_member((c).fields.get("m_Player"), "SetClinger", [null, (float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))), false])
				R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
				R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
				(c).fields["m_bHitFinished"] = true
				R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
				return null
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnClingAnimationEnded"), [])
	return null


static func c1173_f_UpdateClingAnimation(c: Variant, a: Array) -> Variant:
	var v_szClingAnimation: Variant = null
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		return null
	v_szClingAnimation = R.coerce("", "String")
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start")))):
		pass
		v_szClingAnimation = R.coerce("Start", "String")
	else:
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))):
			pass
			v_szClingAnimation = R.coerce("Idle", "String")
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideLeft")))):
				pass
				v_szClingAnimation = R.coerce("CollideLeft", "String")
			else:
				pass
				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideRight")))):
					pass
					v_szClingAnimation = R.coerce("CollideRight", "String")
				else:
					pass
					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Attack")))):
						pass
						v_szClingAnimation = R.coerce("Attack", "String")
					else:
						pass
						if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))):
							pass
							v_szClingAnimation = R.coerce("GetOff", "String")
						else:
							pass
							if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))):
								pass
								v_szClingAnimation = R.coerce(("ShotLeft" if R.truth(c.fields.get("m_bClingLeft")) else "Shot"), "String")
	if R.truth(R.binary("!=", v_szClingAnimation, "")):
		pass
		R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndPlay"), [v_szClingAnimation])
	return null


static func c1173_f_OnSideCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_getOffSound: Variant = null
	var v_bRightSide: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(R.static_value("RDSoldier", "SideCollisionClingDamage")))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
			pass
			v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		else:
			pass
			v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOffSound])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, true])
		(c).fields["m_bHasGunOut"] = false
		R.call_member(c, "UpdateClingAnimation", [])
	return null


static func c1173_f_OnDirectCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_getOffSound: Variant = null
	var v_fSpeedRatio: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bRightSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "DirectCollisionClingDamage")))))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
			pass
			v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		else:
			pass
			v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOffSound])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, false])
		(c).fields["m_bHasGunOut"] = false
		R.call_member(c, "UpdateClingAnimation", [])
	return null


static func c1173_f_OnForceGetOff(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	c.fields["m_fClingHP"] = float(0)
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
	(c).fields["m_bHasGunOut"] = false
	v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlayVoiceSound", [v_getOffSound])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, false])
	R.call_member(c, "UpdateClingAnimation", [])
	return null


static func c1173_f_ForceRemove(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), false])
	R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
	R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
	(c).fields["m_bHitFinished"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	return null


static func c1173_f_GetBlockedHeadShotChance(c: Variant, a: Array) -> Variant:
	return 0.5
	return null


static func c1173_f_GetBlockedTorsoShotChance(c: Variant, a: Array) -> Variant:
	return 0.5
	return null


static func c1173_f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
		pass
		c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
		if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
			pass
			c.fields["m_bHit"] = true
			if R.truth((c).fields.get("m_bRegisteredAsKillable")):
				pass
				R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
				(c).fields["m_bRegisteredAsKillable"] = false
			(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
			R.call_member((c).fields.get("m_Player"), "OnGibSoldier", [c])
			if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
			else:
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "AddGroundBlood", [5])
		else:
			pass
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			R.call_member(c, "AddGroundBlood", [1])
	return null


static func c1173_f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_bHead: Variant = false
	var v_fLimit: Variant = NAN
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	v_bHead = false
	v_fLimit = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	if R.truth((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded")))):
		pass
		c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "globalToLocal"), [v_hitPos]), "Point")
		v_bHead = R.binary("<", R.get_value(c.fields.get("m_BulletHitPos"), "y"), R.unary("-", 220))
		if R.truth(v_bHead):
			pass
			if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedHeadShotChance", []))):
				pass
				(c).fields["m_bBlockedHeadShot"] = true
			else:
				pass
				if R.truth((float(c.fields.get("m_fHeadHP")) > float(0))):
					pass
					c.fields["m_fHeadHP"] = R.coerce(R.binary("-", c.fields.get("m_fHeadHP"), v_iDamage), "Number")
					if R.truth((float(c.fields.get("m_fHeadHP")) <= float(0))):
						pass
						c.fields["m_bHit"] = true
						if R.truth((c).fields.get("m_bRegisteredAsKillable")):
							pass
							R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
							(c).fields["m_bRegisteredAsKillable"] = false
						(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
						(c).fields["m_bCanBeHitForBlood"] = true
						(c).fields["m_bCanBeHitForBloodWithAnim"] = true
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
						(c.fields.get("m_vVelocity")).fields["X"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
						R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
						R.call_member(c, "UpdateAnimation", [true])
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotDown", [c, (c).fields.get("m_iHitType")])
						R.call_member(c, "AddGroundBlood", [5])
					else:
						pass
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
						R.call_member(c, "AddGroundBlood", [1])
		else:
			pass
			if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
				pass
				c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
				if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
					pass
					c.fields["m_bHit"] = true
					if R.truth((c).fields.get("m_bRegisteredAsKillable")):
						pass
						R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
						(c).fields["m_bRegisteredAsKillable"] = false
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
					(c).fields["m_bCanBeHitForBlood"] = true
					(c).fields["m_bCanBeHitForBloodWithAnim"] = true
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
					(c.fields.get("m_vVelocity")).fields["X"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
					v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_gruntSound])
					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
					R.call_member(c, "UpdateAnimation", [true])
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotDown", [c, (c).fields.get("m_iHitType")])
					R.call_member(c, "AddGroundBlood", [5])
				else:
					pass
					if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
						pass
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
					R.call_member(c, "AddGroundBlood", [1])
		R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_IdleToFire"), "int")
			R.call_member(c, "UpdateAnimation", [true])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				if R.truth(R.unary("!", (c).fields.get("m_bAdjusting"))):
					pass
					v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
					(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(3))) + float((float(randf()) * float(3)))), R.unary("-", v_fLimit), v_fLimit]), "Number")
					(c).fields["m_bAdjusting"] = true
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	(c).fields["m_bBlockedHeadShot"] = false
	return null


static func c1173_f_DamageHead(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedHeadShotChance", []))):
		pass
		return true
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "HeadDamageKillDelay")))), float(0)))
	c.fields["m_fHeadHP"] = float(maxf(float((float(c.fields.get("m_fHeadHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fHeadHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Shot"), "int")
		if R.truth(((c).fields.get("m_bHasGunOut") and R.unary("!", R.get_value(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "QuickDraw"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "QuickDraw")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member(c, "StopVoiceSound", [])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null


static func c1173_f_DamageTorso(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedTorsoShotChance", []))):
		pass
		return true
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "BodyDamageKillDelay")))), float(0)))
	c.fields["m_fBodyHP"] = float(maxf(float((float(c.fields.get("m_fBodyHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fBodyHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_getOffSound])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null


static func c1173_f_DamageBody(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_fClingHP")) == float(0)))):
		pass
		return null
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "BodyDamageKillDelay")))), float(0)))
	c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_getOffSound])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return null


static func c1173_f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("X")]))))
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "+=")
	R.invoke(R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "push"), [c])
	R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "+=")
	(c).fields["m_bRegisteredAsKillable"] = true
	return null


static func c1173_f_Destroy(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "-=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("RDSoldier", "AllSoldiers"), v_i), c)):
			pass
			R.invoke(R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	if R.truth((c).fields.get("m_Explosives")):
		pass
		R.invoke(R.get_value((c).fields.get("m_Explosives"), "splice"), [0])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "Destroy"), [])
	return null


static func c1173_f_StopAnimations(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "removeChild"), [(c).fields.get("m_SuppressZone")])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_SuppressZone")])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "StopAnimations"), [])
	return null


static func c1173_f_StartSpawning(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	var v_fRoadLimit: Variant = NAN
	var v_spawnFrom: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_iRandom = R.coerce(0, "int")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_Spawning"), "int")
	(c).fields["m_bSpawnGoLeft"] = R.binary(">", ((v_spawnFrom).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]))
	v_fRoadLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_fSpawnWalkTarget"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(3))) + float((float(randf()) * float(6)))), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
	(c).fields["m_fSpawnSpeedX"] = float((float((float(0.75) + float((float(randf()) * float(0.5))))) * float(R.static_value("RDSoldier", "SpeedX"))))
	R.call_member(c, "UpdateAnimation", [true])
	if R.truth(((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) == float(0)) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDSoldier", "m_iLastPlayerNotMovingTime")))) > float(500)))):
		pass
		v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [4]), "int")
		if R.truth((float(v_iRandom) == float(0))):
			pass
			(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
		else:
			pass
			if R.truth((float(v_iRandom) == float(1))):
				pass
				(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
			else:
				pass
				if R.truth((float(v_iRandom) == float(2))):
					pass
					(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
				else:
					pass
					if R.truth((float(v_iRandom) == float(3))):
						pass
						(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PlayerNotMovingVoice")])
		R.assign(c, "m_iLastPlayerNotMovingTime", "RDSoldier", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
	return null


static func c1173_f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_missile: Variant = null
	var v_explosive: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_missile = R.coerce(null, "RDMissileAlly")
	v_explosive = R.coerce(R.binary("as", v_instigator, R.klass("RDExplosive")), "RDExplosive")
	if R.truth((R.truth(v_explosive) and R.binary("==", (v_explosive).fields.get("m_Instigator"), c))):
		pass
		return null
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		(c).fields["m_bExploded"] = true
		R.call_member(c, "UpdateAnimation", [true])
		v_missile = R.coerce(R.binary("as", v_entity, R.klass("RDMissileAlly")), "RDMissileAlly")
		if R.truth((R.unary("!", v_missile) or R.binary("==", v_instigator, (c).fields.get("m_Player")))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCollateralKills", 1, "+=")
		R.call_member(c, "AddGroundBlood", [5, true])
	return null


static func c1173_f_SetupExplosives(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_explosive: Variant = null
	var v_fPosX: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_i: Variant = 0
	v_fLimit = float(NAN)
	v_explosive = R.coerce(null, "RDExplosive")
	v_fPosX = float(NAN)
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	c.fields["m_bFlippedX"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))
	(c).fields["m_bDonateExplosiveRight"] = (float(randf()) > float(0.5))
	(c).fields["m_Explosives"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDSoldier", "NbExplosives")))):
		pass
		v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
		v_explosive = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDExplosive")]), R.klass("RDExplosive")), "RDExplosive")
		R.call_member(v_explosive, "Init", [(R.klass("MC_Explosion") if R.truth((float(randf()) > float(0.5))) else R.klass("MC_Explosion2")), true, 5, 10])
		(v_explosive).fields["m_Instigator"] = R.coerce(c, "RDEntity")
		v_fPosX = float(0)
		if R.truth(c.fields.get("m_bFlippedX")):
			pass
			if R.truth((c).fields.get("m_bDonateExplosiveRight")):
				pass
				v_fPosX = float((float((float((float(v_fLimit) - float(R.static_value("RDSoldier", "ExplosiveMargin")))) - float((float((float(R.static_value("RDSoldier", "NbExplosives")) - float(1))) * float(R.static_value("RDSoldier", "ExplosiveSpacing")))))) + float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
			else:
				pass
				v_fPosX = float((float((float(v_fLimit) - float(R.static_value("RDSoldier", "ExplosiveMargin")))) - float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
		else:
			pass
			if R.truth((c).fields.get("m_bDonateExplosiveRight")):
				pass
				v_fPosX = R.coerce(R.binary("+", R.binary("+", R.unary("-", v_fLimit), R.static_value("RDSoldier", "ExplosiveMargin")), (float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing")))), "Number")
			else:
				pass
				v_fPosX = float((R.num(R.binary("+", R.binary("+", R.unary("-", v_fLimit), R.static_value("RDSoldier", "ExplosiveMargin")), (float((float(R.static_value("RDSoldier", "NbExplosives")) - float(1))) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))) - float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosive, (float(v_fPosX) + float(v_fPerlinX)), v_fPerlinY, (c.fields.get("m_vLocation")).fields.get("Z")])
		R.invoke(R.get_value((c).fields.get("m_Explosives"), "push"), [v_explosive])
		v_i = R.signed32(v_i + 1)
	return null


static func c1173_f_SetupSpikes(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_iSpikesLane: Variant = 0
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_iSpikesLane = R.coerce((2 if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))) else 0), "int")
	(c).fields["m_Spikes"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSpikeStrip")]), R.klass("RDSpikeStrip")), "RDSpikeStrip")
	((c).fields.get("m_Spikes")).fields["m_iLane"] = R.coerce(v_iSpikesLane, "int")
	R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Spikes"), R.binary("+", R.call_static("RDRoad", "GetLaneXPos", [v_iSpikesLane]), v_fPerlinX), v_fPerlinY, (c.fields.get("m_vLocation")).fields.get("Z")])
	c.fields["m_bFlippedX"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))
	return null


static func c1173_f_TestLineOfFire(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_fHitX: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fSlope: Variant = NAN
	var v_entityNode: Variant = null
	var v_bToPlayer: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_entity = R.coerce(null, "RDEntity")
	v_fHitX = float(NAN)
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) <= float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		return null
	v_fTargetX = R.coerce(((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float(1)) if R.truth(v_bToPlayer) else (c.fields.get("m_vLocation")).fields.get("X")), "Number")
	v_fSlope = float(R.binary("/", (float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))), (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))))
	v_entityNode = R.coerce((c.fields.get("m_EntityNode")).fields.get("m_Previous"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
			pass
			return null
		if R.truth(R.call_member(v_entity, "CanBlockSoldierBullets", [])):
			pass
			v_fHitX = float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))) * float(v_fSlope)))))
			if R.truth(((float(v_fHitX) >= float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("X")))) - float(0.5)))) and (float(v_fHitX) <= float((float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("X")))) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("W")))) + float(0.5)))))):
				pass
				return v_entity
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Previous"), "RDEntityNode")
	return null
	return null


static func c1173_f_Suppress(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fDistance = float(NAN)
	if R.truth((c.fields.get("m_bHit") or (c).fields.get("m_bExploded"))):
		pass
		return null
	if R.truth((((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire"))))):
		pass
		v_fDistance = R.coerce(R.call_member(v_vPos, "DistanceFrom", [c.fields.get("m_vLocation")]), "Number")
		R.call_member(c, "AddSuppressValue", [(float(1) - float(minf(float(R.binary("/", v_fDistance, R.static_value("RDSoldier", "MaxSuppressDistance"))), float(1))))])
	return null


static func c1173_f_AddSuppressValue(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_fValue: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fLimit = float(NAN)
	(c).fields["m_fSuppressValue"] = R.coerce(R.binary("+", (c).fields.get("m_fSuppressValue"), v_fValue), "Number")
	if R.truth((float((c).fields.get("m_fSuppressValue")) >= float(R.static_value("RDSoldier", "SuppressThreshold")))):
		pass
		(c).fields["m_fSuppressValue"] = float(0)
		(c).fields["m_bIsFiring"] = false
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle"))))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
			(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer"), "int")
			v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
			(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), ((R.num(R.unary("-", 1)) - float((float(randf()) * float(2)))) if R.truth((float(randf()) > float(0.5))) else (float(1) + float((float(randf()) * float(2)))))), R.unary("-", v_fLimit), v_fLimit]), "Number")
			(c).fields["m_bAdjusting"] = true
		else:
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideIn"), "int")
			(c).fields["m_fSlideOutTimer"] = float(0)
			(c).fields["m_fSlideOutDelay"] = float((float(0.5) + float((float(randf()) * float(1.5)))))
		(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
		R.call_member(c, "UpdateAnimation", [true])
	return null


static func c1173_f_GetEditorAdjustedPosX(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion"))) or (float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip"))))):
		pass
		return (8 if R.truth((float(v_fX) > float(0))) else R.unary("-", 8))
	return v_fX
	return null


static func c1173_f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	return null


static func c1173_f_GetSuppressZoneMC(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_SuppressZone")
	return null


static func c1173_f_OnKilledByZombie(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	c.fields["m_bHit"] = true
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
	(c).fields["m_bCanBeHitForBlood"] = true
	(c).fields["m_bCanBeHitForBloodWithAnim"] = true
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
	R.call_member(c, "UpdateAnimation", [true])
	return null


static func c1178_f_RDSpikeStrip(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpikeStrip"), [R.klass("MC_SpikeStrip"), R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDSpikeStrip", "Scale")])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_SpikeStrips"), "int")
	(c).fields["m_fHP"] = float(300)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_SpikeStrip"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDRoad", "LaneHalfWidth")), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float(2) * float(R.static_value("RDRoad", "LaneHalfWidth"))))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c).fields["m_SlideSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SpikeSlide"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SpikeExplode"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_fFadeDistance"] = float(130)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_bCanBeHitByExplosion"] = true
	c.fields["m_bCanBeShotByHelicopter"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	return null


static func c1178_f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "SetInitialState"), [])
	(c).fields["m_fHP"] = float(300)
	(c).fields["m_bTriggered"] = false
	(c).fields["m_bSliding"] = false
	(c).fields["m_bDestroyed"] = false
	(c).fields["m_bCanBeDestroyed"] = false
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null


static func c1178_f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))) and R.unary("!", (c).fields.get("m_bDestroyed")))
	return null


static func c1178_f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "TouchedBy"), [v_entity])
	(c).fields["m_bTriggered"] = true
	return null


static func c1178_f_SlideTo(c: Variant, a: Array) -> Variant:
	var v_fPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_bSliding"] = true
	(c).fields["m_fSlideToPosX"] = float(v_fPosX)
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SlideSound")])
	return null


static func c1178_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bCanBeDestroyed") and R.unary("!", R.call_member(c, "HasSoundPlaying", [])))):
		pass
		c.fields["m_bDestroyMe"] = true
	return null


static func c1178_f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bSliding")):
		pass
		(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), (c).fields.get("m_fSlideToPosX"), v_fDeltaTime, R.static_value("RDSpikeStrip", "SlideInterpSpeed")]), "Number")
	return null


static func c1178_f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, R.static_value("RDEntity", "AnimEvent_Destroy"))):
		pass
		(c).fields["m_bCanBeDestroyed"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "OnAnimEvent"), [v_szEvent])
	return null


static func c1178_f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null


static func c1178_f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_fHP")) != float(0))
	return null


static func c1178_f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null


static func c1178_f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null


static func c1178_f_Explode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["blownup"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
	(c).fields["m_bDestroyed"] = true
	return null


static func c1179_f_RDUnlockData(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDUnlockData"), [])
	return null


static func c1215_f_Set(c: Variant, a: Array) -> Variant:
	var v_otherColor: Variant = R.coerce((a[0] if a.size() > 0 else null), "RGBA")
	(c).fields["R"] = R.coerce((v_otherColor).fields.get("R"), "int")
	(c).fields["G"] = R.coerce((v_otherColor).fields.get("G"), "int")
	(c).fields["B"] = R.coerce((v_otherColor).fields.get("B"), "int")
	(c).fields["A"] = R.coerce((v_otherColor).fields.get("A"), "int")
	return null


static func c1215_f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", (c).fields.get("R"), ", "), (c).fields.get("G")), ", "), (c).fields.get("B")), ", "), (c).fields.get("A"))
	return null


static func c1216_f_RandomHat(c: Variant, a: Array) -> Variant:
	var v_bAutoRefills: Variant = R.coerce((a[0] if a.size() > 0 else true), "Boolean")
	R.invoke(R.super_ref(c, "RandomHat"), [])
	(c).fields["m_bAutoRefills"] = v_bAutoRefills
	(c).fields["m_Values"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_HatValues"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null


static func c1216_f_Clear(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_Values"), "splice"), [0, R.get_value((c).fields.get("m_Values"), "length")])
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [0, R.get_value((c).fields.get("m_HatValues"), "length")])
	return null


static func c1216_f_AddValue(c: Variant, a: Array) -> Variant:
	var v_newValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.invoke(R.get_value((c).fields.get("m_Values"), "push"), [v_newValue])
	return null


static func c1216_f_Reset(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [0, R.get_value((c).fields.get("m_HatValues"), "length")])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Values"), "length"))):
		pass
		R.invoke(R.get_value((c).fields.get("m_HatValues"), "push"), [R.get_value((c).fields.get("m_Values"), v_i)])
		v_i = R.signed32(v_i + 1)
	return null


static func c1216_f_GetRandomValue(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iValueIndex: Variant = 0
	var v_randomValue: Variant = null
	v_i = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_HatValues"), "length"), 0)):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bAutoRefills"))):
			pass
			return null
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Values"), "length"))):
			pass
			R.invoke(R.get_value((c).fields.get("m_HatValues"), "push"), [R.get_value((c).fields.get("m_Values"), v_i)])
			v_i = R.signed32(v_i + 1)
	v_iValueIndex = R.coerce(floorf(float((float(randf()) * R.num(R.get_value((c).fields.get("m_HatValues"), "length"))))), "int")
	v_randomValue = R.coerce(R.get_value((c).fields.get("m_HatValues"), v_iValueIndex), "Object")
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [v_iValueIndex, 1])
	return v_randomValue
	return null


static func c1216_f_IsEmpty(c: Variant, a: Array) -> Variant:
	return R.binary("==", R.get_value((c).fields.get("m_HatValues"), "length"), 0)
	return null


static func c1216_f_GetTotalNbValues(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_Values"), "length")
	return null


static func c2669_f_SequentialArray(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SequentialArray"), [])
	(c).fields["m_Values"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iIndex"] = R.coerce(0, "int")
	return null


static func c2669_f_AddValue(c: Variant, a: Array) -> Variant:
	var v_newValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.invoke(R.get_value((c).fields.get("m_Values"), "push"), [v_newValue])
	return null


static func c2669_f_GetValue(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	if R.truth(R.binary("==", (c).fields.get("m_iIndex"), R.get_value((c).fields.get("m_Values"), "length"))):
		pass
		(c).fields["m_iIndex"] = R.coerce(0, "int")
	return R.get_value((c).fields.get("m_Values"), R.binary("-", R.set_value(c, "m_iIndex", 1, "+="), 1))
	return null


static func c2669_f_GetNbValues(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_Values"), "length")
	return null


static func c2670_f_SoundSystem(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SoundSystem"), [])
	return null


static func c2670_f_RemoveSoundGroup(c: Variant, a: Array) -> Variant:
	var v_iLength: Variant = 0
	var v_i: Variant = 0
	var v_soundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	v_iLength = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iLength))):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), v_i), v_soundGroup)):
			pass
			R.invoke(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null


static func c2670_f_RemoveActiveSound(c: Variant, a: Array) -> Variant:
	var v_currentSound: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	var v_sound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSound")
	v_currentSound = R.coerce(null, "DTSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_currentSound = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), v_i), R.klass("DTSound")), "DTSound")
		if R.truth(R.binary("==", v_currentSound, v_sound)):
			pass
			R.invoke(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "splice"), [v_i, 1])
			return null
		v_i = R.signed32(v_i + 1)
	return null


static func c2675_f_API(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.API"), [])
	return null


static func c2675_f_get_connected(c: Variant, a: Array) -> Variant:
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "connected")
	return null


static func c2675_f_get_isNetworkHost(c: Variant, a: Array) -> Variant:
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "isNetworkHost")
	return null


static func c2675_f_get_apiId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("apiId")
	return null


static func c2675_f_get_debugMode(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_debugMode")
	return null


static func c2675_f_set_debugMode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.assign(c, "_debugMode", "com.newgrounds.API", v_param1, "=")
	return null


static func c2675_f_get_publisherId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId")
	return null


static func c2675_f_get_sessionId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("sessionId")
	return null


static func c2675_f_get_hostDomain(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("hostDomain")
	return null


static func c2675_f_get_hostURL(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "hostURL")
	return null


static func c2675_f_get_isNewgrounds(c: Variant, a: Array) -> Variant:
	return (float((R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId")) == float(1))
	return null


static func c2675_f_get_hasUserSession(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "hasUserSession")
	return null


static func c2675_f_get_username(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("username")
	return null


static func c2675_f_get_userId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("userId")
	return null


static func c2675_f_assertConnected(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertConnected", [])):
		pass
		return true
	if R.truth(v_param1):
		pass
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [v_param1, null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_CONNECTED")])
	return false
	return null


static func c2675_f_get_serverTime(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_serverTime")
	return null


static func c2675_f_get_adsApproved(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_adsApproved")
	return null


static func c2675_f_get_adFeedURL(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_adFeedURL")
	return null


static func c2675_f_get_medals(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_medalsArray")
	return null


static func c2675_f_get_scoreBoards(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_scoreBoardsArray")
	return null


static func c2675_f_get_saveGroups(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_saveGroupsArray")
	return null


static func c2675_f_connect(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else ""), "String")
	v__loc5_ = R.coerce(0, "uint")
	R.set_value(R.klass("com.newgrounds.APIEventDispatcher"), "globalDispatcher", R.static_value("com.newgrounds.API", "_dispatcher"), "=")
	R.invoke(R.get_value(R.resolve(c, "Security", "com.newgrounds.API"), "loadPolicyFile"), ["http://apifiles.ngfiles.com/crossdomain.xml"])
	if R.truth((R.static_value("com.newgrounds.API", "_connection")).fields.get("initialized")):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["Connection already in progress. Please call API.disconnect() before attempting another connection."])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), false, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_CONNECTED")])
		return null
	v_param2 = R.coerce(R.invoke(R.resolve(c, "trimWhitespace", "com.newgrounds.API"), [v_param2]), "String")
	if R.truth(v_param3):
		pass
		v_param3 = R.coerce(R.invoke(R.resolve(c, "trimWhitespace", "com.newgrounds.API"), [v_param3]), "String")
	if R.truth((R.unary("!", v_param2) or R.binary("==", v_param2, ""))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["No apiId given. Please use the API ID from your API settings page."])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), false, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "====== Newgrounds API v", R.static_value("com.newgrounds.API", "VERSION")), " ======")])
	(R.static_value("com.newgrounds.API", "_connection")).fields["connectionState"] = R.coerce(R.static_value("com.newgrounds.APIConnection", "CONNECTING"), "String")
	R.assign(c, "_root", "com.newgrounds.API", v_param1, "=")
	R.assign(c, "_movieVersion", "com.newgrounds.API", v_param4, "=")
	(R.static_value("com.newgrounds.API", "_connection")).fields["apiId"] = R.coerce(v_param2, "String")
	v__loc5_ = R.coerce(R.coerce(R.invoke(R.get_value(v_param2, "indexOf"), [":"]), "uint"), "uint")
	if R.truth(R.binary("!=", v__loc5_, R.unary("-", 1))):
		pass
		(R.static_value("com.newgrounds.API", "_connection")).fields["trackerId"] = R.coerce(R.coerce(R.invoke(R.get_value(v_param2, "substring"), [0, v__loc5_]), "uint"), "uint")
	else:
		pass
		(R.static_value("com.newgrounds.API", "_connection")).fields["trackerId"] = R.coerce(R.coerce(v_param2, "uint"), "uint")
	if R.truth(R.unary("!", (R.static_value("com.newgrounds.API", "_connection")).fields.get("trackerId"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Invalid API ID: ", v_param2)])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), false, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])
		return null
	(R.static_value("com.newgrounds.API", "_connection")).fields["encryptionKey"] = R.coerce(v_param3, "String")
	(R.static_value("com.newgrounds.API", "_connection")).fields["initialized"] = true
	if R.truth(R.unary("!", R.get_value(R.static_value("com.newgrounds.API", "_root"), "loaderInfo"))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", ["The root DisplayObject is currently not on the stage. Connection will be completed once it is added to stage."])
	R.invoke(R.get_value(R.static_value("com.newgrounds.API", "_root"), "addEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "checkRootLoaderInfo", "com.newgrounds.API")])
	R.invoke(R.resolve(c, "checkRootLoaderInfo", "com.newgrounds.API"), [null])
	return null


static func c2675_f_doConnect(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.logical_and(R.resolve(c, "isNetworkHost", "com.newgrounds.API"), func(): return R.binary("!=", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "RELEASE_MODE")))):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["Live file detected, turning off debug mode."])
		R.assign(c, "_debugMode", "com.newgrounds.API", R.static_value("com.newgrounds.API", "RELEASE_MODE"), "=")
	if R.truth((R.truth(v_param1) and R.truth(R.get_value(v_param1, "NewgroundsAPI_SandboxID")))):
		pass
		R.assign(c, "_bridge", "com.newgrounds.API", R.construct(R.klass("com.newgrounds.Bridge"), [R.get_value(v_param1, "NewgroundsAPI_SandboxID")]), "=")
		R.set_value(R.klass("com.newgrounds.APICommand"), "bridge", R.static_value("com.newgrounds.API", "_bridge"), "=")
	else:
		pass
		R.assign(c, "_bridge", "com.newgrounds.API", R.construct(R.klass("com.newgrounds.Bridge"), [R.call_static("com.newgrounds.crypto.MD5", "hash", [R.string(randf())])]), "=")
		R.set_value(R.klass("com.newgrounds.APICommand"), "bridge", R.static_value("com.newgrounds.API", "_bridge"), "=")
	if R.truth(R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "RELEASE_MODE"))):
		pass
		if R.truth(v_param1):
			pass
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_UserName")):
				pass
				(R.static_value("com.newgrounds.API", "_connection")).fields["username"] = R.coerce(R.get_value(v_param1, "NewgroundsAPI_UserName"), "String")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_UserID")):
				pass
				(R.static_value("com.newgrounds.API", "_connection")).fields["userId"] = R.coerce(R.get_value(v_param1, "NewgroundsAPI_UserID"), "uint")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_PublisherID")):
				pass
				(R.static_value("com.newgrounds.API", "_connection")).fields["publisherId"] = R.coerce(R.get_value(v_param1, "NewgroundsAPI_PublisherID"), "uint")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_UserpageFormat")):
				pass
				(R.static_value("com.newgrounds.API", "_connection")).fields["userpageFormat"] = R.coerce(R.get_value(v_param1, "NewgroundsAPI_UserpageFormat"), "uint")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_SessionID")):
				pass
				(R.static_value("com.newgrounds.API", "_connection")).fields["sessionId"] = R.coerce(R.get_value(v_param1, "NewgroundsAPI_SessionID"), "String")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_SaveGroupID")):
				pass
				R.assign(c, "_requestedSaveGroupId", "com.newgrounds.API", R.get_value(v_param1, "NewgroundsAPI_SaveGroupID"), "=")
			if R.truth(R.get_value(v_param1, "NewgroundsAPI_SaveFileID")):
				pass
				R.assign(c, "_requestedSaveFileId", "com.newgrounds.API", R.get_value(v_param1, "NewgroundsAPI_SaveFileID"), "=")
	else:
		pass
		(R.static_value("com.newgrounds.API", "_connection")).fields["debug"] = true
		if R.truth((R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "DEBUG_MODE_LOGGED_IN")) or R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "DEBUG_MODE_LOGGED_OUT")))):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["publisherId"] = R.coerce(1, "uint")
		if R.truth(R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "DEBUG_MODE_LOGGED_IN"))):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["sessionId"] = R.coerce("D3bu64p1U53R", "String")
			(R.static_value("com.newgrounds.API", "_connection")).fields["userId"] = R.coerce(10, "uint")
			(R.static_value("com.newgrounds.API", "_connection")).fields["username"] = R.coerce("API-Debugger", "String")
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["connectMovie", R.resolve(c, "onConnect", "com.newgrounds.API"), {"host": (R.static_value("com.newgrounds.API", "_connection")).fields.get("hostDomain"), "movie_version": R.static_value("com.newgrounds.API", "_movieVersion"), "publisher_id": (R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId")}])
	return null


static func c2675_f_onConnect(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
	if R.truth(R.unary("!", R.get_value(v_param1, "success"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["Unable to connect to the API."])
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "reset", [])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(v_param1, "data"), R.get_value(v_param1, "error")])
		return null
	if R.truth(R.binary("!=", R.resolve(c, "debugMode", "com.newgrounds.API"), R.static_value("com.newgrounds.API", "RELEASE_MODE"))):
		pass
		R.assign(c, "_adFeedURL", "com.newgrounds.API", R.static_value("com.newgrounds.API", "TEST_AD_FEED_URL"), "=")
	else:
		pass
		if R.truth(R.get_value(v__loc2_, "ad_url")):
			pass
			R.assign(c, "_adFeedURL", "com.newgrounds.API", R.invoke(R.resolve(c, "unescape", "com.newgrounds.API"), [R.get_value(v__loc2_, "ad_url")]), "=")
	var __t1 = R.get_value(v__loc2_, "ad_status")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, R.unary("-", 1)):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, 0):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, 1):
		__t2 = 2
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			R.call_static("com.newgrounds.Logger", "logWarning", ["Your movie is not approved to run Flash Ads."])
			break
		if __t2 >= 0 and __t2 <= 1:
			pass
			R.call_static("com.newgrounds.Logger", "logWarning", ["Your movie is still awaiting approval to run Flash Ads."])
			break
		if __t2 >= 0 and __t2 <= 2:
			pass
			R.call_static("com.newgrounds.Logger", "logMessage", ["Your movie is approved to run Flash Ads!"])
	R.assign(c, "_adsApproved", "com.newgrounds.API", R.binary("==", R.get_value(v__loc2_, "ad_status"), 1), "=")
	if R.truth((R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "DEBUG_MODE_HOST_BLOCKED")) or R.truth(R.get_value(v__loc2_, "deny_host")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", (R.static_value("com.newgrounds.API", "_connection")).fields.get("hostDomain"), " does not have permission to host this movie!"), "Update your API configuration to allow this host."])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), {"officialURL": R.invoke(R.resolve(c, "unescape", "com.newgrounds.API"), [R.get_value(v__loc2_, "movie_url")])}, R.static_value("com.newgrounds.APIEvent", "ERROR_HOST_BLOCKED")])
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "reset", [])
		return null
	R.assign(c, "_movieName", "com.newgrounds.API", (R.get_value(v__loc2_, "movieName") if R.truth(R.get_value(v__loc2_, "movieName")) else ""), "=")
	R.call_static("com.newgrounds.Logger", "logMessage", ["Connecting to the Newgrounds API Gateway...", R.binary("+", R.binary("+", "----- ", R.get_value(v__loc2_, "movie_name")), " -----")])
	if R.truth(R.binary("==", R.static_value("com.newgrounds.API", "_debugMode"), R.static_value("com.newgrounds.API", "DEBUG_MODE_NEW_VERSION"))):
		pass
		R.set_value(v__loc2_, "movie_version", "Debug Mode", "=")
	if R.truth(R.get_value(v__loc2_, "movie_version")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["A new version of this movie is available.", R.binary("+", "Current version:\t", R.static_value("com.newgrounds.API", "_movieVersion")), R.binary("+", "Newest version:\t", R.get_value(v__loc2_, "movie_version")), "Use API.loadOfficialVersion() to link to the latest version."])
		R.assign(c, "_newVersion", "com.newgrounds.API", true, "=")
	else:
		pass
		R.assign(c, "_newVersion", "com.newgrounds.API", false, "=")
	R.assign(c, "_serverTime", "com.newgrounds.API", R.construct(R.resolve(c, "Date", "com.newgrounds.API"), [(float(R.coerce(R.get_value(v__loc2_, "time"), "int")) * float(1000))]), "=")
	if R.truth(R.get_value(v__loc2_, "request_portal_url")):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["setPortalID", null, {"portal_url": R.get_value(R.static_value("com.newgrounds.API", "_connection"), "hostURL")}])
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["preloadSettings", R.resolve(c, "onMetadataLoaded", "com.newgrounds.API"), {"publisher_id": (R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId"), "user_id": (R.static_value("com.newgrounds.API", "_connection")).fields.get("userId")}])
	return null


static func c2675_f_onMetadataLoaded(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc8_: Variant = false
	var v__loc9_: Variant = false
	var v__loc10_: Variant = false
	var v__loc11_: Variant = null
	var v__loc12_: Variant = null
	var v__loc13_: Variant = null
	var v__loc14_: Variant = null
	var v__loc15_: Variant = null
	var v__loc16_: Variant = null
	var v__loc17_: Variant = null
	var v__loc18_: Variant = null
	var v__loc19_: Variant = null
	var v__loc2_: Variant = null
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(0, "uint")
	v__loc6_ = R.coerce(null, "Object")
	v__loc7_ = R.coerce(null, "Object")
	v__loc8_ = false
	v__loc9_ = false
	v__loc10_ = false
	v__loc11_ = R.coerce(null, "Medal")
	v__loc12_ = R.coerce(null, "Object")
	v__loc13_ = R.coerce(null, "ScoreBoard")
	v__loc14_ = R.coerce(null, "Object")
	v__loc15_ = R.coerce(null, "Array")
	v__loc16_ = R.coerce(null, "Array")
	v__loc17_ = R.coerce(null, "SaveGroup")
	v__loc18_ = R.coerce(null, "Object")
	v__loc19_ = R.coerce(null, "Object")
	v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
	if R.truth(R.unary("!", R.get_value(v_param1, "success"))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", ["Unable to load movie metadata."])
		R.invoke(R.resolve(c, "disconnect", "com.newgrounds.API"), [])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), null, R.get_value(v_param1, "error")])
		return null
	v__loc5_ = R.coerce(0, "uint")
	if R.truth(R.get_value(v__loc2_, "medals")):
		pass
		v__loc5_ = R.coerce(R.coerce(R.get_value(R.get_value(v__loc2_, "medals"), "length"), "uint"), "uint")
		if R.truth(R.resolve(c, "hasUserSession", "com.newgrounds.API")):
			pass
			v__loc6_ = R.coerce(R.invoke(R.resolve(c, "loadLocal", "com.newgrounds.API"), [R.binary("+", "medals_unlocked_", R.resolve(c, "username", "com.newgrounds.API"))]), "Object")
		else:
			pass
			v__loc6_ = R.coerce(R.invoke(R.resolve(c, "loadLocal", "com.newgrounds.API"), ["medals_unlocked"]), "Object")
		v__loc3_ = R.coerce(0, "uint")
		while R.truth((float(v__loc3_) < float(v__loc5_))):
			pass
			v__loc7_ = R.coerce(R.get_value(R.get_value(v__loc2_, "medals"), v__loc3_), "Object")
			v__loc8_ = R.truth(R.get_value(v__loc7_, "medal_unlocked"))
			v__loc9_ = (R.truth(v__loc6_) and R.truth(R.get_value(v__loc6_, R.get_value(v__loc7_, "medal_id"))))
			v__loc10_ = R.coerce((v__loc8_ if R.truth(R.resolve(c, "hasUserSession", "com.newgrounds.API")) else v__loc9_), "Boolean")
			if R.truth(R.binary("!=", R.resolve(c, "debugMode", "com.newgrounds.API"), R.static_value("com.newgrounds.API", "RELEASE_MODE"))):
				pass
				v__loc10_ = false
			v__loc11_ = R.coerce(R.construct(R.klass("com.newgrounds.Medal"), [R.static_value("com.newgrounds.API", "_connection"), R.get_value(v__loc7_, "medal_id"), R.get_value(v__loc7_, "medal_name"), R.get_value(v__loc7_, "medal_description"), R.truth(R.coerce(R.get_value(v__loc7_, "secret"), "int")), v__loc10_, R.get_value(v__loc7_, "medal_value"), R.get_value(v__loc7_, "medal_difficulty"), R.get_value(v__loc7_, "medal_icon")]), "Medal")
			R.call_member(v__loc11_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCKED"), R.resolve(c, "onMedalUnlocked", "com.newgrounds.API"), false, 0, true])
			R.call_member(v__loc11_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCK_CONFIRMED"), R.resolve(c, "onMedalUnlockConfirmed", "com.newgrounds.API"), false, 0, true])
			R.set_value(R.static_value("com.newgrounds.API", "_medals"), R.get_value(v__loc11_, "name"), v__loc11_, "=")
			R.invoke(R.get_value(R.static_value("com.newgrounds.API", "_medalsArray"), "push"), [v__loc11_])
			R.call_static("com.newgrounds.Logger", "logMessage", [v__loc11_])
			if R.truth(R.logical_and(R.logical_and(R.resolve(c, "hasUserSession", "com.newgrounds.API"), func(): return v__loc9_), func(): return R.unary("!", v__loc8_))):
				pass
				R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "Server missed the \"", R.get_value(v__loc11_, "name")), "\" unlock. Resending...")])
				R.call_member(v__loc11_, "unlock", [])
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", v__loc5_, " medal"), ("s" if R.truth((float(v__loc5_) != float(1))) else "")), " initialized.")])
	v__loc5_ = R.coerce(0, "uint")
	if R.truth(R.get_value(v__loc2_, "score_boards")):
		pass
		v__loc5_ = R.coerce(R.coerce(R.get_value(R.get_value(v__loc2_, "score_boards"), "length"), "uint"), "uint")
		v__loc3_ = R.coerce(0, "uint")
		while R.truth((float(v__loc3_) < float(v__loc5_))):
			pass
			v__loc12_ = R.coerce(R.get_value(R.get_value(v__loc2_, "score_boards"), v__loc3_), "Object")
			v__loc13_ = R.coerce(R.construct(R.klass("com.newgrounds.ScoreBoard"), [R.static_value("com.newgrounds.API", "_connection"), R.get_value(v__loc12_, "name"), R.get_value(v__loc12_, "id")]), "ScoreBoard")
			R.set_value(R.static_value("com.newgrounds.API", "_scoreBoards"), R.get_value(v__loc13_, "name"), v__loc13_, "=")
			R.invoke(R.get_value(R.static_value("com.newgrounds.API", "_scoreBoardsArray"), "push"), [v__loc13_])
			R.call_static("com.newgrounds.Logger", "logMessage", [v__loc13_])
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", v__loc5_, " scoreboard"), ("s" if R.truth((float(v__loc5_) != float(1))) else "")), " initialized.")])
	v__loc5_ = R.coerce(0, "uint")
	if R.truth(R.get_value(v__loc2_, "save_groups")):
		pass
		v__loc5_ = R.coerce(R.coerce(R.get_value(R.get_value(v__loc2_, "save_groups"), "length"), "uint"), "uint")
		v__loc3_ = R.coerce(0, "uint")
		while R.truth((float(v__loc3_) < float(v__loc5_))):
			pass
			v__loc14_ = R.coerce(R.get_value(R.get_value(v__loc2_, "save_groups"), v__loc3_), "Object")
			v__loc15_ = R.coerce([], "Array")
			if R.truth(R.get_value(v__loc14_, "keys")):
				pass
				v__loc4_ = R.coerce(0, "uint")
				while R.truth(R.binary("<", v__loc4_, R.get_value(R.get_value(v__loc14_, "keys"), "length"))):
					pass
					v__loc18_ = R.coerce(R.get_value(R.get_value(v__loc14_, "keys"), v__loc4_), "Object")
					R.invoke(R.get_value(v__loc15_, "push"), [R.construct(R.klass("com.newgrounds.SaveKey"), [R.get_value(v__loc18_, "name"), R.get_value(v__loc18_, "id"), R.get_value(v__loc18_, "type")])])
					v__loc4_ = ((v__loc4_ + 1) & 4294967295)
			v__loc16_ = R.coerce([], "Array")
			if R.truth(R.get_value(v__loc14_, "ratings")):
				pass
				v__loc4_ = R.coerce(0, "uint")
				while R.truth(R.binary("<", v__loc4_, R.get_value(R.get_value(v__loc14_, "ratings"), "length"))):
					pass
					v__loc19_ = R.coerce(R.get_value(R.get_value(v__loc14_, "ratings"), v__loc4_), "Object")
					R.invoke(R.get_value(v__loc16_, "push"), [R.construct(R.klass("com.newgrounds.SaveRating"), [R.get_value(v__loc19_, "name"), R.get_value(v__loc19_, "id"), R.get_value(v__loc19_, "float"), R.get_value(v__loc19_, "min"), R.get_value(v__loc19_, "max")])])
					v__loc4_ = ((v__loc4_ + 1) & 4294967295)
			v__loc17_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveGroup"), [R.static_value("com.newgrounds.API", "_connection"), R.get_value(v__loc14_, "group_name"), R.get_value(v__loc14_, "group_id"), R.get_value(v__loc14_, "group_type"), v__loc15_, v__loc16_]), "SaveGroup")
			R.set_value(R.static_value("com.newgrounds.API", "_saveGroups"), R.get_value(v__loc17_, "name"), v__loc17_, "=")
			R.invoke(R.get_value(R.static_value("com.newgrounds.API", "_saveGroupsArray"), "push"), [v__loc17_])
			R.call_static("com.newgrounds.Logger", "logMessage", [v__loc17_])
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", v__loc5_, " save group"), ("s" if R.truth((float(v__loc5_) != float(1))) else "")), " initialized.")])
	if R.truth(R.get_value(v__loc2_, "save_file_path")):
		pass
		R.assign(c, "_saveFilePath", "com.newgrounds.API", R.binary("+", R.get_value(v__loc2_, "save_file_path"), "/"), "=")
		R.set_value(R.klass("com.newgrounds.SaveFile"), "_saveFilePath", R.static_value("com.newgrounds.API", "_saveFilePath"), "=")
		R.call_static("com.newgrounds.Logger", "logInternal", [R.binary("+", "Save file path: ", R.static_value("com.newgrounds.API", "_saveFilePath"))])
	if R.truth(R.get_value(v__loc2_, "image_file_path")):
		pass
		R.assign(c, "_imageFilePath", "com.newgrounds.API", R.binary("+", R.get_value(v__loc2_, "image_file_path"), "/"), "=")
		R.set_value(R.klass("com.newgrounds.SaveFile"), "_imageFilePath", R.static_value("com.newgrounds.API", "_imageFilePath"), "=")
		R.call_static("com.newgrounds.Logger", "logInternal", [R.binary("+", "Image file path: ", R.static_value("com.newgrounds.API", "_imageFilePath"))])
	R.call_static("com.newgrounds.Logger", "logMessage", ["Connection complete!"])
	(R.static_value("com.newgrounds.API", "_connection")).fields["connectionState"] = R.coerce(R.static_value("com.newgrounds.APIConnection", "CONNECTED"), "String")
	R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), {"movieName": R.static_value("com.newgrounds.API", "_movieName"), "newVersion": R.static_value("com.newgrounds.API", "_newVersion")}])
	if R.truth((R.truth(R.static_value("com.newgrounds.API", "_requestedSaveFileId")) and R.truth(R.static_value("com.newgrounds.API", "_requestedSaveGroupId")))):
		pass
		R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.resolve(c, "onRequestedFileLoaded", "com.newgrounds.API")])
		R.call_static("com.newgrounds.API", "loadSaveFile", [R.static_value("com.newgrounds.API", "_requestedSaveFileId"), false])
	return null


static func c2675_f_disconnect(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(null, "Medal")
	if R.truth(R.unary("!", R.get_value(R.static_value("com.newgrounds.API", "_connection"), "connected"))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", ["The Newgrounds API is already disconnected."])
		return null
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "reset", [])
	for __t3 in R.iterate(R.static_value("com.newgrounds.API", "_medals"), true):
		v__loc1_ = R.coerce(__t3, "Medal")
		R.call_member(v__loc1_, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCKED"), R.resolve(c, "onMedalUnlocked", "com.newgrounds.API")])
		R.call_member(v__loc1_, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCK_CONFIRMED"), R.resolve(c, "onMedalUnlockConfirmed", "com.newgrounds.API")])
	R.assign(c, "_newVersion", "com.newgrounds.API", false, "=")
	R.assign(c, "_medals", "com.newgrounds.API", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.assign(c, "_medalsArray", "com.newgrounds.API", [], "=")
	R.assign(c, "_scoreBoards", "com.newgrounds.API", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.assign(c, "_scoreBoardsArray", "com.newgrounds.API", [], "=")
	R.assign(c, "_saveGroups", "com.newgrounds.API", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.assign(c, "_saveGroupsArray", "com.newgrounds.API", [], "=")
	R.assign(c, "_sharedObjects", "com.newgrounds.API", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.assign(c, "_imageFilePath", "com.newgrounds.API", null, "=")
	R.assign(c, "_saveFilePath", "com.newgrounds.API", null, "=")
	R.call_static("com.newgrounds.Logger", "logMessage", ["Disconnected from the Newgrounds API."])
	return null


static func c2675_f_loadNewgrounds(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadNewgrounds"])
	return null


static func c2675_f_loadOfficialVersion(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadOfficialVersion", false])
	return null


static func c2675_f_promptSignIn(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.invoke(R.resolve(c, "navigateToURL", "com.newgrounds.API"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.API"), [R.binary("+", R.static_value("com.newgrounds.API", "PASSPORT_URL"), R.get_value(R.static_value("com.newgrounds.API", "_bridge"), "widgetId"))]), "_blank"])
		R.call_member(R.static_value("com.newgrounds.API", "_bridge"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "BRIDGE_EVENT_RECEIVED"), R.resolve(c, "onUserSignedIn", "com.newgrounds.API"), false, 0, true])
	return null


static func c2675_f_onUserSignedIn(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc2_": "Object", "error": "*", "param1": "APIEvent"}
	l["_loc2_"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member(R.static_value("com.newgrounds.API", "_bridge"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "BRIDGE_EVENT_RECEIVED"), R.resolve(c, "onUserSignedIn", "com.newgrounds.API")])
	R.lset(l, "_loc2_", R.get_value(R.lget(l, "param1"), "data"))
	if R.truth(R.get_value(R.lget(l, "param1"), "success")):
		pass
		R.last_error = null
		if R.truth(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_UserName")):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["username"] = R.coerce(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_UserName"), "String")
		if R.truth(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_UserID")):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["userId"] = R.coerce(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_UserID"), "uint")
		if R.truth(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_PublisherID")):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["publisherId"] = R.coerce(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_PublisherID"), "uint")
		if R.truth(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_SessionID")):
			pass
			(R.static_value("com.newgrounds.API", "_connection")).fields["sessionId"] = R.coerce(R.get_value(R.lget(l, "_loc2_"), "NewgroundsAPI_SessionID"), "String")
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["preloadSettings", R.resolve(c, "onMetadataLoaded", "com.newgrounds.API"), {"publisher_id": (R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId"), "user_id": (R.static_value("com.newgrounds.API", "_connection")).fields.get("userId")}])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "User ", (R.static_value("com.newgrounds.API", "_connection")).fields.get("username")), " signed in.")])
	R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "USER_SIGNED_IN"), null, (null if R.truth(R.get_value(R.lget(l, "param1"), "success")) else R.static_value("com.newgrounds.APIEvent", "ERROR_SIGN_IN_FAILED"))])
	return null


static func c2675_f_loadMySite(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadMySite"])
	return null


static func c2675_f_loadCustomLink(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadCustomLink", true, {"link": v_param1}])
	return null


static func c2675_f_getMedal(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value(R.static_value("com.newgrounds.API", "_medals"), v_param1)
	return null


static func c2675_f_unlockMedal(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	v__loc2_ = R.coerce(R.get_value(R.static_value("com.newgrounds.API", "_medals"), v_param1), "Medal")
	if R.truth(R.unary("!", v__loc2_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "No medal named \"", v_param1), "\" was found.")])
		return null
	R.call_member(v__loc2_, "unlock", [])
	return null


static func c2675_f_onMedalUnlocked(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Medal")
	v__loc3_ = R.coerce(null, "Object")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		v__loc2_ = R.coerce(R.invoke(R.klass("com.newgrounds.Medal"), [R.get_value(v_param1, "data")]), "Medal")
		if R.truth(R.resolve(c, "hasUserSession", "com.newgrounds.API")):
			pass
			v__loc3_ = R.coerce(R.invoke(R.resolve(c, "loadLocal", "com.newgrounds.API"), [R.binary("+", "medals_unlocked_", R.resolve(c, "username", "com.newgrounds.API"))]), "Object")
			if R.truth(R.unary("!", v__loc3_)):
				pass
				v__loc3_ = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "Object")
			R.set_value(v__loc3_, R.get_value(v__loc2_, "id"), true, "=")
			R.invoke(R.resolve(c, "saveLocal", "com.newgrounds.API"), [R.binary("+", "medals_unlocked_", R.resolve(c, "username", "com.newgrounds.API")), v__loc3_])
		else:
			pass
			v__loc3_ = R.coerce(R.invoke(R.resolve(c, "loadLocal", "com.newgrounds.API"), ["medals_unlocked"]), "Object")
			if R.truth(R.unary("!", v__loc3_)):
				pass
				v__loc3_ = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "Object")
			R.set_value(v__loc3_, R.get_value(R.invoke(R.klass("com.newgrounds.Medal"), [R.get_value(v_param1, "data")]), "id"), true, "=")
			R.invoke(R.resolve(c, "saveLocal", "com.newgrounds.API"), ["medals_unlocked", v__loc3_])
			R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "User is not logged in. Medal \"", R.get_value(v__loc2_, "name")), "\" unlocked locally.")])
	return null


static func c2675_f_onMedalUnlockConfirmed(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Object")
	if R.truth(R.resolve(c, "hasUserSession", "com.newgrounds.API")):
		pass
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "loadLocal", "com.newgrounds.API"), [R.binary("+", "medals_unlocked_", R.resolve(c, "username", "com.newgrounds.API"))]), "Object")
		if R.truth(R.unary("!", v__loc2_)):
			pass
			v__loc2_ = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "Object")
		else:
			pass
			R.delete_value(v__loc2_, R.get_value(R.invoke(R.klass("com.newgrounds.Medal"), [R.get_value(v_param1, "data")]), "id"))
		R.invoke(R.resolve(c, "saveLocal", "com.newgrounds.API"), [R.binary("+", "medals_unlocked_", R.resolve(c, "username", "com.newgrounds.API")), v__loc2_])
	return null


static func c2675_f_clearLocalMedals(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(null, "Medal")
	for __t4 in R.iterate(R.static_value("com.newgrounds.API", "_medals"), true):
		v__loc1_ = R.coerce(__t4, "Medal")
		R.call_member(v__loc1_, "setUnlocked", [false])
	if R.truth(R.unary("!", R.resolve(c, "hasUserSession", "com.newgrounds.API"))):
		pass
		R.invoke(R.resolve(c, "saveLocal", "com.newgrounds.API"), ["medals_unlocked", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), [])])
	return null


static func c2675_f_getScoreBoard(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	return R.get_value(R.static_value("com.newgrounds.API", "_scoreBoards"), v_param1)
	return null


static func c2675_f_loadScores(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else "All-Time"), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 1), "uint")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 10), "uint")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	v__loc6_ = R.coerce(R.get_value(R.static_value("com.newgrounds.API", "_scoreBoards"), v_param1), "ScoreBoard")
	if R.truth(R.unary("!", v__loc6_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "No scoreboard named \"", v_param1), "\" was found.")])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "SCORES_LOADED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])
		return null
	R.set_value(v__loc6_, "period", v_param2, "=")
	R.set_value(v__loc6_, "firstResult", v_param3, "=")
	R.set_value(v__loc6_, "numResults", v_param4, "=")
	R.set_value(v__loc6_, "tag", v_param5, "=")
	R.call_member(v__loc6_, "loadScores", [])
	return v__loc6_
	return null


static func c2675_f_postScore(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	if R.truth(R.unary("!", R.resolve(c, "hasUserSession", "com.newgrounds.API"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The user must be logged-in to post a score."])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])
		return null
	v__loc4_ = R.coerce(R.get_value(R.static_value("com.newgrounds.API", "_scoreBoards"), v_param1), "ScoreBoard")
	if R.truth(R.unary("!", v__loc4_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "No scoreboard named \"", v_param1), "\" was found.")])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])
		return null
	R.call_member(v__loc4_, "postScore", [v_param2, v_param3])
	return null


static func c2675_f_getSaveGroup(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	return R.get_value(R.static_value("com.newgrounds.API", "_saveGroups"), v_param1)
	return null


static func c2675_f_getSaveGroupById(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v__loc2_ = R.coerce(null, "SaveGroup")
	for __t5 in R.iterate(R.static_value("com.newgrounds.API", "_saveGroups"), true):
		v__loc2_ = R.coerce(__t5, "SaveGroup")
		if R.truth(R.binary("==", R.get_value(v__loc2_, "id"), v_param1)):
			pass
			return v__loc2_
	return null
	return null


static func c2675_f_createSaveFile(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	v__loc2_ = R.coerce(R.invoke(R.resolve(c, "getSaveGroup", "com.newgrounds.API"), [v_param1]), "SaveGroup")
	if R.truth(R.unary("!", v__loc2_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "The save group \"", v_param1), "\" was not found.")])
		return null
	return R.construct(R.klass("com.newgrounds.SaveFile"), [v__loc2_])
	return null


static func c2675_f_loadSaveFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["loadSaveFile", R.resolve(c, "onFileLoaded", "com.newgrounds.API"), {"save_id": v_param1, "get_contents": v_param2}])
	return null


static func c2675_f_onFileLoaded(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "SaveFile")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		v__loc2_ = R.coerce(R.call_static("com.newgrounds.SaveFile", "fromObject", [R.invoke(R.resolve(c, "getSaveGroupById", "com.newgrounds.API"), [R.get_value(R.get_value(v_param1, "data"), "group_id")]), R.get_value(R.get_value(v_param1, "data"), "file")]), "SaveFile")
		if R.truth(R.get_value(R.get_value(v_param1, "data"), "get_contents")):
			pass
			R.call_member(v__loc2_, "load", [])
		else:
			pass
			R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), v__loc2_])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["Unable to load file:", R.get_value(v_param1, "error")])
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), null, R.get_value(v_param1, "error")])
	return null


static func c2675_f_createSaveQuery(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	v__loc2_ = R.coerce(R.invoke(R.resolve(c, "getSaveGroup", "com.newgrounds.API"), [v_param1]), "SaveGroup")
	if R.truth(R.unary("!", v__loc2_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "The save group \"", v_param1), "\" was not found.")])
		return null
	return R.construct(R.klass("com.newgrounds.SaveQuery"), [v__loc2_])
	return null


static func c2675_f_createSaveQueryByDate(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "createSaveQuery", "com.newgrounds.API"), [v_param1]), "SaveQuery")
	if R.truth(R.unary("!", v__loc3_)):
		pass
		return null
	R.call_member(v__loc3_, "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), v_param2])
	return v__loc3_
	return null


static func c2675_f_createSaveQueryByName(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "createSaveQuery", "com.newgrounds.API"), [v_param1]), "SaveQuery")
	R.call_member(v__loc5_, "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_NAME"), (R.static_value("com.newgrounds.SaveQuery", "OPERATOR_EQUAL") if R.truth(v_param3) else R.static_value("com.newgrounds.SaveQuery", "OPERATOR_CONTAINS")), v_param2])
	return v__loc5_
	return null


static func c2675_f_createSaveQueryByRating(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "createSaveQuery", "com.newgrounds.API"), [v_param1]), "SaveQuery")
	R.call_member(v__loc4_, "sortOn", [v_param2, v_param3])
	return v__loc4_
	return null


static func c2675_f_onRequestedFileLoaded(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "SaveFile")
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.resolve(c, "onRequestedFileLoaded", "com.newgrounds.API")])
	if R.truth(R.get_value(v_param1, "success")):
		pass
		v__loc2_ = R.coerce(R.binary("as", R.get_value(v_param1, "data"), R.klass("com.newgrounds.SaveFile")), "SaveFile")
		if R.truth(v__loc2_):
			pass
			R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [R.static_value("com.newgrounds.APIEvent", "FILE_REQUESTED"), v__loc2_])
	return null


static func c2675_f_addEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else true), "Boolean")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "addEventListener", [v_param1, v_param2, false, v_param3, v_param4])
	return null


static func c2675_f_removeEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "removeEventListener", [v_param1, v_param2])
	return null


static func c2675_f_dispatchEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [v_param1, v_param2, v_param3])])
	return null


static func c2675_f_saveLocal(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"sharedObject": "SharedObject", "sharedObjectName": "String", "saveId": "String", "saveData": "Object", "error": "Error", "param1": "String", "param2": "Object"}
	l["sharedObject"] = null
	l["sharedObjectName"] = null
	l["saveId"] = null
	l["saveData"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "Object")
	R.lset(l, "sharedObject", null)
	R.lset(l, "sharedObjectName", null)
	R.lset(l, "saveId", R.lget(l, "param1"))
	R.lset(l, "saveData", R.lget(l, "param2"))
	R.last_error = null
	R.lset(l, "sharedObjectName", R.binary("+", R.binary("+", R.binary("+", "ng_ap_secure_", (R.static_value("com.newgrounds.API", "_connection")).fields.get("trackerId")), "_"), R.call_static("com.newgrounds.crypto.RC4", "encrypt", [R.lget(l, "saveId"), (R.static_value("com.newgrounds.API", "_connection")).fields.get("encryptionKey")])), "=")
	if R.truth(R.unary("!", R.get_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId")))):
		pass
		R.set_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId"), R.invoke(R.get_value(R.resolve(c, "SharedObject", "com.newgrounds.API"), "getLocal"), [R.lget(l, "sharedObjectName")]), "=")
	R.lset(l, "sharedObject", R.get_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId")), "=")
	R.set_value(R.get_value(R.lget(l, "sharedObject"), "data"), "data", R.invoke(R.resolve(c, "encodeData", "com.newgrounds.API"), [R.lget(l, "saveData")]), "=")
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_static("com.newgrounds.Logger", "logError", ["Unable to save local data.", R.lget(l, "error")])
		return false
	return true
	return null


static func c2675_f_loadLocal(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"sharedObject": "SharedObject", "sharedObjectName": "String", "saveId": "String", "error": "Error", "param1": "String"}
	l["sharedObject"] = null
	l["sharedObjectName"] = null
	l["saveId"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "sharedObject", null)
	R.lset(l, "sharedObjectName", null)
	R.lset(l, "saveId", R.lget(l, "param1"))
	R.last_error = null
	R.lset(l, "sharedObjectName", R.binary("+", R.binary("+", R.binary("+", "ng_ap_secure_", (R.static_value("com.newgrounds.API", "_connection")).fields.get("trackerId")), "_"), R.call_static("com.newgrounds.crypto.RC4", "encrypt", [R.lget(l, "saveId"), (R.static_value("com.newgrounds.API", "_connection")).fields.get("encryptionKey")])), "=")
	if R.truth(R.unary("!", R.get_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId")))):
		pass
		R.set_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId"), R.invoke(R.get_value(R.resolve(c, "SharedObject", "com.newgrounds.API"), "getLocal"), [R.lget(l, "sharedObjectName")]), "=")
	R.lset(l, "sharedObject", R.get_value(R.static_value("com.newgrounds.API", "_sharedObjects"), R.lget(l, "saveId")), "=")
	if R.truth(((R.truth(R.lget(l, "sharedObject")) and R.truth(R.get_value(R.lget(l, "sharedObject"), "data"))) and R.truth(R.get_value(R.get_value(R.lget(l, "sharedObject"), "data"), "data")))):
		pass
		return R.invoke(R.resolve(c, "decodeData", "com.newgrounds.API"), [R.get_value(R.get_value(R.lget(l, "sharedObject"), "data"), "data")])
	return null
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_static("com.newgrounds.Logger", "logError", ["Unable to load local data.", R.lget(l, "error")])
	return null
	return null


static func c2675_f_logCustomEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), [])):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", "Logged event: ", v_param1)])
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["logCustomEvent", null, {"event": v_param1}])
	return null


static func c2675_f_encodeData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.unary("!", R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", []))):
		pass
		return null
	return R.call_static("com.newgrounds.crypto.RC4", "encrypt", [R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.API"), "newgrounds"), "encoders"), "json"), "JSON"), "encode"), [v_param1]), (R.static_value("com.newgrounds.API", "_connection")).fields.get("encryptionKey")])
	return null


static func c2675_f_decodeData(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "Error", "param1": "String"}
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", []))):
		pass
		return null
	R.last_error = null
	return R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.API"), "newgrounds"), "encoders"), "json"), "JSON"), "decode"), [R.call_static("com.newgrounds.crypto.RC4", "decrypt", [R.lget(l, "param1"), (R.static_value("com.newgrounds.API", "_connection")).fields.get("encryptionKey")])]), R.resolve(c, "Object", "com.newgrounds.API"))
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	return null
	return null


static func c2675_f_stopPendingCommands(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.APICommand", "stopPendingCommands", [])
	R.call_static("com.newgrounds.Logger", "logMessage", ["Pending commands stopped."])
	return null


static func c2675_f_trimWhitespace(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", v_param1)):
		pass
		return null
	v__loc2_ = R.coerce(0, "int")
	while R.truth(R.binary("==", R.invoke(R.get_value(v_param1, "charAt"), [v__loc2_]), " ")):
		pass
		v__loc2_ = R.signed32(v__loc2_ + 1)
	v__loc3_ = R.coerce(R.coerce((R.num(R.get_value(v_param1, "length")) - float(1)), "int"), "*")
	while R.truth((R.binary("==", R.invoke(R.get_value(v_param1, "charAt"), [v__loc3_]), " ") and R.binary(">=", v__loc3_, 0))):
		pass
		v__loc3_ = R.coerce(R.num(v__loc3_) - 1, "*")
	return R.invoke(R.get_value(v_param1, "slice"), [v__loc2_, R.binary("+", v__loc3_, 1)])
	return null


static func c2675_f_checkRootLoaderInfo(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"event": "Event", "loaderInfo": "LoaderInfo", "error": "Error", "param1": "Event"}
	l["event"] = null
	l["loaderInfo"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "event", R.lget(l, "param1"))
	R.lset(l, "loaderInfo", R.get_value(R.static_value("com.newgrounds.API", "_root"), "loaderInfo"))
	if R.truth(R.lget(l, "loaderInfo")):
		pass
		R.last_error = null
		while R.truth(R.get_value(R.lget(l, "loaderInfo"), "loader")):
			pass
			R.lset(l, "loaderInfo", R.get_value(R.get_value(R.lget(l, "loaderInfo"), "loader"), "loaderInfo"), "=")
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			return null
		R.invoke(R.get_value(R.static_value("com.newgrounds.API", "_root"), "removeEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "checkRootLoaderInfo", "com.newgrounds.API")])
		R.set_value(R.static_value("com.newgrounds.API", "_connection"), "hostURL", R.get_value(R.lget(l, "loaderInfo"), "url"), "=")
		R.invoke(R.resolve(c, "doConnect", "com.newgrounds.API"), [R.get_value(R.lget(l, "loaderInfo"), "parameters")])
	return null


static func c2676_f_APICommand(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.APICommand"), [])
	(c).fields["_command"] = R.coerce(v_param1, "String")
	(c).fields["_parameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	(c).fields["_secureParameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	(c).fields["_timeoutTimer"] = R.coerce(R.construct(R.resolve(c, "Timer", "com.newgrounds.APICommand"), [R.static_value("com.newgrounds.APICommand", "TIMEOUT_INTERVAL"), 1]), "Timer")
	R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "com.newgrounds.APICommand"), "TIMER"), R.get_value(c, "onTimeout")])
	(c).fields["_hasTimeout"] = true
	return null


static func c2676_f_stopPendingCommands(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(null, "APICommand")
	for __t1 in R.iterate(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), true):
		v__loc1_ = R.coerce(__t1, "APICommand")
		R.call_member(v__loc1_, "close", [])
	R.assign(c, "_pendingCommands", "com.newgrounds.APICommand", [], "=")
	return null


static func c2676_f_onThrottleTimer(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc2_ = R.coerce(null, "Object")
	if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "com.newgrounds.APICommand"), [])) - float(R.static_value("com.newgrounds.APICommand", "_throttleTimestamp")))) >= float(R.static_value("com.newgrounds.APICommand", "THROTTLE_INTERVAL")))):
		pass
		R.assign(c, "_throttleCount", "com.newgrounds.APICommand", 0, "=")
		R.assign(c, "_throttleCount", "com.newgrounds.APICommand", 0, "=")
		while R.truth((R.truth(R.get_value(R.static_value("com.newgrounds.APICommand", "_commandQueue"), "length")) and (float(R.static_value("com.newgrounds.APICommand", "_throttleCount")) < float(R.static_value("com.newgrounds.APICommand", "THROTTLE_THRESHOLD"))))):
			pass
			v__loc2_ = R.coerce(R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "_commandQueue"), "shift"), []), "Object")
			R.invoke(R.get_value(R.get_value(v__loc2_, "command"), "send"), [R.get_value(v__loc2_, "connection")])
			R.assign(c, "_throttleCount", "com.newgrounds.APICommand", 1, "+=")
	return null


static func c2676_f_encryptHex(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.binary("%", R.get_value(v_param1, "length"), 6), "uint")
	v__loc3_ = R.coerce("", "String")
	v__loc4_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc4_, R.get_value(v_param1, "length"))):
		pass
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.call_member(R.static_value("com.newgrounds.APICommand", "_encryptor"), "encodeUint", [R.coerce(R.binary("+", "0x", R.invoke(R.get_value(v_param1, "substr"), [v__loc4_, 6])), "uint"), 4])), "String")
		v__loc4_ = R.coerce(R.binary("+", v__loc4_, 6), "uint")
	return R.binary("+", R.invoke(R.get_value(v__loc2_, "toString"), []), v__loc3_)
	return null


static func c2676_f_get_command(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_command")
	return null


static func c2676_f_set_command(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_command"] = R.coerce(v_param1, "String")
	return null


static func c2676_f_get_hasTimeout(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_hasTimeout")
	return null


static func c2676_f_set_hasTimeout(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_hasTimeout"] = v_param1
	return null


static func c2676_f_get_parameters(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_parameters")
	return null


static func c2676_f_set_parameters(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v__loc2_ = R.coerce(null, "String")
	(c).fields["_parameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	if R.truth(v_param1):
		pass
		for __t2 in R.iterate(v_param1, false):
			v__loc2_ = R.coerce(__t2, "String")
			R.set_value((c).fields.get("_parameters"), v__loc2_, R.get_value(v_param1, v__loc2_), "=")
	return null


static func c2676_f_get_preventCache(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_preventCache")
	return null


static func c2676_f_set_preventCache(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_preventCache"] = v_param1
	return null


static func c2676_f_get_secureParameters(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_secureParameters")
	return null


static func c2676_f_set_secureParameters(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v__loc2_ = R.coerce(null, "String")
	(c).fields["_secureParameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	if R.truth(v_param1):
		pass
		for __t3 in R.iterate(v_param1, false):
			v__loc2_ = R.coerce(__t3, "String")
			R.set_value((c).fields.get("_secureParameters"), v__loc2_, R.get_value(v_param1, v__loc2_), "=")
	return null


static func c2676_f_get_hasSecureParameters(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = null
	v__loc1_ = R.coerce(null, "String")
	v__loc2_ = R.coerce(0, "int")
	v__loc3_ = R.coerce((c).fields.get("_secureParameters"), "*")
	for __t4 in R.iterate(v__loc3_, false):
		v__loc1_ = R.coerce(__t4, "String")
		return true
	return false
	return null


static func c2676_f_addFile(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "ByteArray")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else "application/octet-stream"), "String")
	if R.truth(R.unary("!", (c).fields.get("_files"))):
		pass
		(c).fields["_files"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	v__loc5_ = R.coerce({"filename": v_param1, "data": v_param2, "dataField": v_param3, "contentType": v_param4}, "Object")
	R.set_value((c).fields.get("_files"), v_param1, v__loc5_, "=")
	return null


static func c2676_f_removeFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("_files")):
		pass
		R.delete_value((c).fields.get("_files"), v_param1)
	return null


static func c2676_f_clearFiles(c: Variant, a: Array) -> Variant:
	(c).fields["_files"] = R.coerce(null, "Object")
	return null


static func c2676_f_close(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc1_": "uint", "error": "Error"}
	l["_loc1_"] = 0
	l["error"] = null
	R.lset(l, "_loc1_", 0)
	if R.truth((c).fields.get("_loader")):
		pass
		R.last_error = null
		R.invoke(R.get_value((c).fields.get("_loader"), "close"), [])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			pass
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "stop"), [])
		R.lset(l, "_loc1_", 0, "=")
		while R.truth(R.binary("<", R.lget(l, "_loc1_"), R.get_value(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), "length"))):
			pass
			if R.truth(R.binary("==", R.get_value(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), R.lget(l, "_loc1_")), c)):
				pass
				R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), "splice"), [R.lget(l, "_loc1_"), 1])
				break
			R.binary("-", R.lset(l, "_loc1_", 1, "+="), 1)
		(c).fields["_loader"] = R.coerce(null, "URLLoader")
	return null


static func c2676_f_loadInBrowser(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v__loc4_ = R.coerce(null, "String")
	v__loc5_ = R.coerce(null, "String")
	R.set_value((c).fields.get("_parameters"), "command_id", (c).fields.get("_command"), "=")
	R.set_value((c).fields.get("_parameters"), "tracker_id", ((v_param1).fields.get("apiId") if R.truth((v_param1).fields.get("apiId")) else 1), "=")
	if R.truth((v_param1).fields.get("debug")):
		pass
		R.set_value((c).fields.get("_parameters"), "debug", 1, "=")
	v__loc3_ = R.coerce(R.binary("+", R.binary("+", (v_param1).fields.get("apiURL"), "?host="), R.invoke(R.resolve(c, "escape", "com.newgrounds.APICommand"), [(v_param1).fields.get("hostDomain")])), "String")
	for __t5 in R.iterate((c).fields.get("_parameters"), false):
		v__loc4_ = R.coerce(__t5, "String")
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.binary("+", R.binary("+", R.binary("+", "&", R.invoke(R.resolve(c, "escape", "com.newgrounds.APICommand"), [v__loc4_])), "="), R.invoke(R.resolve(c, "escape", "com.newgrounds.APICommand"), [R.get_value((c).fields.get("_parameters"), v__loc4_)]))), "String")
	if R.truth(v_param2):
		pass
		v__loc5_ = R.coerce("_blank", "String")
	else:
		pass
		v__loc5_ = R.coerce("_top", "String")
	R.invoke(R.resolve(c, "navigateToURL", "com.newgrounds.APICommand"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.APICommand"), [v__loc3_]), v__loc5_])
	return null


static func c2676_f_send(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	if R.truth((float(R.static_value("com.newgrounds.APICommand", "_throttleCount")) >= float(R.static_value("com.newgrounds.APICommand", "THROTTLE_THRESHOLD")))):
		pass
		R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "_commandQueue"), "push"), [{"connection": v_param1, "command": c}])
	else:
		pass
		R.call_member(c, "sendInternal", [v_param1])
	return null


static func c2676_f_sendInternal(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = 0
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc8_: Variant = null
	var v__loc9_: Variant = null
	var v__loc10_: Variant = null
	var v__loc11_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	v__loc2_ = R.coerce(null, "Object")
	v__loc3_ = R.coerce(null, "String")
	v__loc4_ = R.coerce(null, "*")
	v__loc5_ = R.coerce(0, "uint")
	v__loc6_ = R.coerce(null, "String")
	v__loc7_ = R.coerce(null, "Object")
	v__loc8_ = R.coerce(null, "String")
	v__loc9_ = R.coerce(null, "String")
	v__loc10_ = R.coerce(null, "String")
	v__loc11_ = R.coerce(null, "String")
	v__loc2_ = R.coerce(R.construct(R.resolve(c, "URLVariables", "com.newgrounds.APICommand"), []), "Object")
	R.set_value(v__loc2_, "command_id", (c).fields.get("_command"), "=")
	R.set_value(v__loc2_, "tracker_id", (v_param1).fields.get("apiId"), "=")
	if R.truth((v_param1).fields.get("debug")):
		pass
		R.set_value(v__loc2_, "debug", 1, "=")
	if R.truth((c).fields.get("_preventCache")):
		pass
		R.set_value(v__loc2_, "seed", randf(), "=")
	for __t6 in R.iterate((c).fields.get("_parameters"), false):
		v__loc3_ = R.coerce(__t6, "String")
		v__loc4_ = R.coerce(R.get_value((c).fields.get("_parameters"), v__loc3_), "*")
		if R.truth(R.binary("!=", v__loc4_, null)):
			pass
			if R.truth(R.binary("is", v__loc4_, R.klass("Boolean"))):
				pass
				R.set_value(v__loc2_, v__loc3_, R.coerce(v__loc4_, "int"), "=")
			else:
				pass
				R.set_value(v__loc2_, v__loc3_, v__loc4_, "=")
	if R.truth(R.get_value(c, "hasSecureParameters")):
		pass
		v__loc7_ = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
		for __t7 in R.iterate((c).fields.get("_secureParameters"), false):
			v__loc3_ = R.coerce(__t7, "String")
			v__loc4_ = R.coerce(R.get_value((c).fields.get("_secureParameters"), v__loc3_), "*")
			if R.truth(R.binary("!=", v__loc4_, null)):
				pass
				if R.truth(R.binary("is", v__loc4_, R.klass("Boolean"))):
					pass
					R.set_value(v__loc7_, v__loc3_, R.coerce(v__loc4_, "int"), "=")
				else:
					pass
					R.set_value(v__loc7_, v__loc3_, v__loc4_, "=")
		v__loc8_ = R.coerce("", "String")
		v__loc5_ = R.coerce(0, "uint")
		while R.truth((float(v__loc5_) < float(16))):
			pass
			v__loc8_ = R.coerce(R.binary("+", v__loc8_, R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "ENCRYPTOR_RADIX"), "charAt"), [R.coerce((float(randf()) * R.num(R.get_value(R.static_value("com.newgrounds.APICommand", "ENCRYPTOR_RADIX"), "length"))), "uint")])), "String")
			v__loc5_ = ((v__loc5_ + 1) & 4294967295)
		R.set_value(v__loc2_, "command_id", "securePacket", "=")
		R.set_value(v__loc7_, "command_id", (c).fields.get("_command"), "=")
		R.set_value(v__loc7_, "as_version", 3, "=")
		R.set_value(v__loc7_, "session_id", (v_param1).fields.get("sessionId"), "=")
		R.set_value(v__loc7_, "user_email", (v_param1).fields.get("userEmail"), "=")
		R.set_value(v__loc7_, "publisher_id", (v_param1).fields.get("publisherId"), "=")
		R.set_value(v__loc7_, "seed", v__loc8_, "=")
		v__loc9_ = R.coerce(R.call_static("com.newgrounds.crypto.MD5", "hash", [v__loc8_]), "String")
		v__loc10_ = R.coerce(R.call_static("com.newgrounds.crypto.RC4", "encrypt", [R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.APICommand"), "newgrounds"), "encoders"), "json"), "JSON"), "encode"), [v__loc7_]), (v_param1).fields.get("encryptionKey")]), "String")
		R.set_value(v__loc2_, "secure", R.invoke(R.resolve(c, "encryptHex", "com.newgrounds.APICommand"), [R.binary("+", v__loc9_, v__loc10_)]), "=")
	R.call_static("com.newgrounds.Logger", "logInternal", ["Sending packet:", v__loc2_])
	if R.truth((c).fields.get("_files")):
		pass
		v__loc11_ = R.coerce("", "String")
		v__loc5_ = R.coerce(0, "uint")
		while R.truth((float(v__loc5_) < float(32))):
			pass
			v__loc11_ = R.coerce(R.binary("+", v__loc11_, R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.coerce((float(97) + float((float(randf()) * float(25)))), "uint")])), "String")
			v__loc5_ = ((v__loc5_ + 1) & 4294967295)
		v__loc6_ = R.coerce(R.binary("+", R.binary("+", "multipart/form-data; boundary=\"", v__loc11_), "\""), "String")
		v__loc2_ = R.coerce(R.call_member(c, "buildMultipartData", [v__loc11_, v__loc2_, (c).fields.get("_files")]), "Object")
	else:
		pass
		for __t8 in R.iterate(v__loc2_, false):
			v__loc3_ = R.coerce(__t8, "String")
			if R.truth(R.binary("==", R.unary("typeof", R.get_value(v__loc2_, v__loc3_)), "object")):
				pass
				R.set_value(v__loc2_, v__loc3_, R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.APICommand"), "newgrounds"), "encoders"), "json"), "JSON"), "encode"), [R.get_value(v__loc2_, v__loc3_)]), "=")
		v__loc6_ = R.coerce("application/x-www-form-urlencoded", "String")
	R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), "push"), [c])
	R.assign(c, "_throttleCount", "com.newgrounds.APICommand", 1, "+=")
	R.assign(c, "_throttleTimestamp", "com.newgrounds.APICommand", R.invoke(R.resolve(c, "getTimer", "com.newgrounds.APICommand"), []), "=")
	R.call_member(c, "startLoader", [(v_param1).fields.get("apiURL"), v__loc2_, v__loc6_])
	return null


static func c2676_f_onTimeout(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.call_member(c, "close", [])
	R.call_static("com.newgrounds.Logger", "logError", ["Command timed out."])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_TIMED_OUT")])])
	return null


static func c2676_f_onError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_static("com.newgrounds.Logger", "logError", ["Error when sending command:", v_param1])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_UNKNOWN")])])
	R.call_member(c, "close", [])
	return null


static func c2676_f_onComplete(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"response": "Object", "data": "String", "e": "*", "param1": "String"}
	l["response"] = null
	l["data"] = null
	l["e"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "response", null)
	R.lset(l, "data", R.lget(l, "param1"))
	R.call_static("com.newgrounds.Logger", "logInternal", ["Received packet:", R.lget(l, "data")])
	R.last_error = null
	if R.truth((R.unary("!", R.lget(l, "data")) or R.binary("==", R.lget(l, "data"), ""))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.APICommand"), []))
	R.lset(l, "response", R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.APICommand"), "newgrounds"), "encoders"), "json"), "JSON"), "decode"), [R.lget(l, "data")]), "=")
	if R.truth(R.unary("!", R.lget(l, "response"))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.APICommand"), []))
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), R.lget(l, "response"), (R.static_value("com.newgrounds.APIEvent", "ERROR_NONE") if R.truth((R.truth(R.lget(l, "response")) and R.truth(R.get_value(R.lget(l, "response"), "success")))) else R.static_value("com.newgrounds.APIEvent", "ERROR_COMMAND_FAILED"))])])
	if R.truth(R.static_value("com.newgrounds.APICommand", "bridge")):
		pass
		R.call_member(R.static_value("com.newgrounds.APICommand", "bridge"), "sendEvent", [R.get_value(R.lget(l, "response"), "command_id"), R.lget(l, "response")])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Invalid response returned from server: ", R.lget(l, "data"))])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_RESPONSE")])])
	R.call_member(c, "close", [])
	return null


static func c2676_f_startLoader(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"url": "String", "data": "Object", "contentType": "String", "urlRequest": "URLRequest", "error": "*", "param1": "String", "param2": "Object", "param3": "String"}
	l["url"] = null
	l["data"] = null
	l["contentType"] = null
	l["urlRequest"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "Object")
	l["param3"] = R.coerce((a[2] if a.size() > 2 else null), "String")
	R.lset(l, "url", R.lget(l, "param1"))
	R.lset(l, "data", R.lget(l, "param2"))
	R.lset(l, "contentType", R.lget(l, "param3"))
	R.lset(l, "urlRequest", R.construct(R.resolve(c, "URLRequest", "com.newgrounds.APICommand"), [R.lget(l, "url")]))
	R.set_value(R.lget(l, "urlRequest"), "data", R.lget(l, "data"), "=")
	R.set_value(R.lget(l, "urlRequest"), "method", R.get_value(R.resolve(c, "URLRequestMethod", "com.newgrounds.APICommand"), "POST"), "=")
	R.set_value(R.lget(l, "urlRequest"), "contentType", R.lget(l, "contentType"), "=")
	(c).fields["_loader"] = R.coerce(R.construct(R.resolve(c, "URLLoader", "com.newgrounds.APICommand"), []), "URLLoader")
	R.invoke(R.get_value((c).fields.get("_loader"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "as3CompleteHandler")])
	R.invoke(R.get_value((c).fields.get("_loader"), "addEventListener"), [R.get_value(R.klass("Event"), "OPEN"), R.get_value(c, "as3UpdateHandler")])
	R.invoke(R.get_value((c).fields.get("_loader"), "addEventListener"), [R.get_value(R.resolve(c, "ProgressEvent", "com.newgrounds.APICommand"), "PROGRESS"), R.get_value(c, "as3UpdateHandler")])
	R.invoke(R.get_value((c).fields.get("_loader"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.APICommand"), "IO_ERROR"), R.get_value(c, "as3ErrorHandler")])
	R.invoke(R.get_value((c).fields.get("_loader"), "addEventListener"), [R.get_value(R.resolve(c, "SecurityErrorEvent", "com.newgrounds.APICommand"), "SECURITY_ERROR"), R.get_value(c, "as3ErrorHandler")])
	R.last_error = null
	R.invoke(R.get_value((c).fields.get("_loader"), "load"), [R.lget(l, "urlRequest")])
	if R.truth((c).fields.get("_hasTimeout")):
		pass
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "start"), [])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_member(c, "onError", [R.invoke(R.get_value(R.lget(l, "error"), "toString"), [])])
	return null


static func c2676_f_as3CompleteHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onComplete", [R.get_value((c).fields.get("_loader"), "data")])
	return null


static func c2676_f_as3UpdateHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.get_value((c).fields.get("_timeoutTimer"), "running")):
		pass
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "reset"), [])
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "start"), [])
	return null


static func c2676_f_as3ErrorHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onError", [R.invoke(R.get_value(v_param1, "toString"), [])])
	return null


static func c2676_f_buildMultipartData(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	v__loc5_ = R.coerce(null, "String")
	v__loc6_ = R.coerce(null, "Object")
	v__loc4_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.set_value(v__loc4_, "endian", R.get_value(R.resolve(c, "Endian", "com.newgrounds.APICommand"), "BIG_ENDIAN"), "=")
	v_param1 = R.coerce(R.binary("+", "--", v_param1), "String")
	for __t9 in R.iterate(v_param2, false):
		v__loc5_ = R.coerce(__t9, "String")
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", v_param1, R.static_value("com.newgrounds.APICommand", "CRLF"))])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", R.binary("+", R.binary("+", "Content-Disposition: form-data; name=\"", v__loc5_), "\""), R.static_value("com.newgrounds.APICommand", "CRLF"))])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.static_value("com.newgrounds.APICommand", "CRLF")])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", R.invoke(R.get_value(R.get_value(v_param2, v__loc5_), "toString"), []), R.static_value("com.newgrounds.APICommand", "CRLF"))])
	if R.truth((c).fields.get("_files")):
		pass
		for __t10 in R.iterate(v_param3, true):
			v__loc6_ = R.coerce(__t10, "Object")
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", v_param1, R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", "Content-Disposition: form-data; name=\"Filename\"", R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.static_value("com.newgrounds.APICommand", "CRLF")])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", R.get_value(v__loc6_, "filename"), R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", v_param1, R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Content-Disposition: form-data; name=\"", R.get_value(v__loc6_, "dataField")), "\"; filename=\""), R.get_value(v__loc6_, "filename")), "\""), R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", R.binary("+", "Content-Type: ", R.get_value(v__loc6_, "contentType")), R.static_value("com.newgrounds.APICommand", "CRLF"))])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.static_value("com.newgrounds.APICommand", "CRLF")])
			R.invoke(R.get_value(v__loc4_, "writeBytes"), [R.get_value(v__loc6_, "data")])
			R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.static_value("com.newgrounds.APICommand", "CRLF")])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", v_param1, R.static_value("com.newgrounds.APICommand", "CRLF"))])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", "Content-Disposition: form-data; name=\"Upload\"", R.static_value("com.newgrounds.APICommand", "CRLF"))])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.static_value("com.newgrounds.APICommand", "CRLF")])
		R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", "Submit Query", R.static_value("com.newgrounds.APICommand", "CRLF"))])
	R.invoke(R.get_value(v__loc4_, "writeUTFBytes"), [R.binary("+", v_param1, "--")])
	R.set_value(v__loc4_, "position", 0, "=")
	return v__loc4_
	return null


static func c2676_f_init_statics(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	R.set_value(c, "bridge", null, "=")
	R.set_value(c, "_throttleTimestamp", 0, "=")
	R.set_value(c, "TIMEOUT_INTERVAL", 10000, "=")
	R.set_value(c, "THROTTLE_INTERVAL", 10050, "=")
	R.set_value(c, "THROTTLE_TICK_INTERVAL", 1000, "=")
	R.set_value(c, "THROTTLE_THRESHOLD", 24, "=")
	R.set_value(c, "_throttleCount", 0, "=")
	R.set_value(c, "_commandQueue", [], "=")
	R.set_value(c, "ENCRYPTOR_RADIX", "/g8236klvBQ#&|;Zb*7CEA59%s`Oue1wziFp$rDVY@TKxUPWytSaGHJ>dmoMR^<0~4qNLhc(I+fjn)X", "=")
	R.set_value(c, "_encryptor", R.construct(R.klass("com.newgrounds.encoders.BaseN"), [R.static_value("com.newgrounds.APICommand", "ENCRYPTOR_RADIX")]), "=")
	R.set_value(c, "_pendingCommands", [], "=")
	R.set_value(c, "CRLF", "\r\n", "=")
	R.set_value(c, "_throttleTimer", R.invoke(R.make_closure("com.newgrounds.APICommand", "closure___t11", c, l), []), "=")
	return null


static func c2676_f_closure___t11(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc1_": "*"}
	l["_loc1_"] = null
	R.lset(l, "_loc1_", R.construct(R.resolve(c, "Timer", "com.newgrounds.APICommand"), [R.static_value("com.newgrounds.APICommand", "THROTTLE_TICK_INTERVAL"), 0]))
	R.invoke(R.get_value(R.lget(l, "_loc1_"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "com.newgrounds.APICommand"), "TIMER"), R.resolve(c, "onThrottleTimer", "com.newgrounds.APICommand")])
	R.invoke(R.get_value(R.lget(l, "_loc1_"), "start"), [])
	return R.lget(l, "_loc1_")
	return null

static func c2677_f_get_hostURL(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_hostURL")
	return null


static func c2677_f_set_hostURL(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(null, "Array")
	(c).fields["_hostURL"] = R.coerce(v_param1, "String")
	(c).fields["hostDomain"] = R.coerce(null, "String")
	if R.truth((c).fields.get("_hostURL")):
		pass
		v__loc2_ = R.coerce(R.invoke(R.get_value((c).fields.get("_hostURL"), "split"), ["/"]), "Array")
		if R.truth((R.binary("!=", R.get_value(v__loc2_, 0), "file:") and R.binary("!=", (c).fields.get("_hostURL"), "localhost"))):
			pass
			(c).fields["hostDomain"] = R.coerce(R.invoke(R.get_value(R.invoke(R.get_value(v__loc2_, "splice"), [0, 3]), "join"), ["/"]), "String")
	if R.truth(R.unary("!", (c).fields.get("hostDomain"))):
		pass
		(c).fields["hostDomain"] = R.coerce("localhost", "String")
	return null


static func c2677_f_get_sandboxType(c: Variant, a: Array) -> Variant:
	return R.get_value(R.resolve(c, "Security", "com.newgrounds.APIConnection"), "sandboxType")
	return null


static func c2677_f_get_isNetworkHost(c: Variant, a: Array) -> Variant:
	var __t1 = R.get_value(c, "sandboxType")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, "localWithFile"):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, "localWithNetwork"):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, "localTrusted"):
		__t2 = 2
	if __t2 == -1 and R.binary("===", __t1, "application"):
		__t2 = 3
	if __t2 == -1 and R.binary("===", __t1, "remote"):
		__t2 = 4
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
		if __t2 >= 0 and __t2 <= 1:
			pass
		if __t2 >= 0 and __t2 <= 2:
			pass
		if __t2 >= 0 and __t2 <= 3:
			pass
			return false
		if __t2 >= 0 and __t2 <= 4:
			pass
	return true
	return null


static func c2677_f_get_hasUserSession(c: Variant, a: Array) -> Variant:
	return ((R.binary("!=", (c).fields.get("sessionId"), null) and R.binary("!=", (c).fields.get("sessionId"), "")) and (float((c).fields.get("publisherId")) != float(0)))
	return null


static func c2677_f_get_connected(c: Variant, a: Array) -> Variant:
	return R.binary("==", (c).fields.get("connectionState"), R.static_value("com.newgrounds.APIConnection", "CONNECTED"))
	return null


static func c2677_f_assertInitialized(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("initialized"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["You must initialized the API using API.connect() before using this command."])
		return false
	return true
	return null


static func c2677_f_assertConnected(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.unary("!", (c).fields.get("connectionState")), R.static_value("com.newgrounds.APIConnection", "CONNECTED"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["You must establish a connection using API.connect() before using this command."])
		return false
	return true
	return null


static func c2677_f_sendSimpleCommand(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else null), "Object")
	v__loc5_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), [v_param1]), "APICommand")
	R.set_value(v__loc5_, "parameters", v_param3, "=")
	R.set_value(v__loc5_, "secureParameters", v_param4, "=")
	if R.truth(R.binary("!=", v_param2, null)):
		pass
		R.call_member(v__loc5_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), v_param2])
	R.call_member(v__loc5_, "send", [c])
	return null


static func c2677_f_sendCommand(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APICommand")
	R.call_member(v_param1, "send", [c])
	return null


static func c2677_f_loadInBrowser(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	v__loc4_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), [v_param1]), "APICommand")
	R.set_value(v__loc4_, "parameters", v_param3, "=")
	R.call_member(v__loc4_, "loadInBrowser", [c, v_param2])
	return null


static func c2678_f_clone(c: Variant, a: Array) -> Variant:
	return R.construct(R.klass("com.newgrounds.APIEvent"), [R.resolve(c, "type", "com.newgrounds.APIEvent"), (c).fields.get("_data"), (c).fields.get("_error")])
	return null


static func c2678_f_get_success(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_success")
	return null


static func c2678_f_get_data(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_data")
	return null


static func c2678_f_get_error(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_error")
	return null


static func c2679_f_get_globalDispatcher(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")
	return null


static func c2679_f_set_globalDispatcher(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "EventDispatcher")
	R.assign(c, "_globalDispatcher", "com.newgrounds.APIEventDispatcher", v_param1, "=")
	return null


static func c2679_f_runEventQueue(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc3_ = R.coerce(null, "Array")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(null, "Object")
	v__loc2_ = R.coerce(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "length"), "uint")
	if R.truth(v__loc2_):
		pass
		v__loc3_ = R.coerce(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "Array")
		R.assign(c, "_eventQueue", "com.newgrounds.APIEventDispatcher", [], "=")
		v__loc4_ = R.coerce(0, "uint")
		while R.truth((float(v__loc4_) < float(v__loc2_))):
			pass
			v__loc5_ = R.coerce(R.get_value(v__loc3_, v__loc4_), "Object")
			R.invoke(R.get_value(R.get_value(v__loc5_, "dispatcher"), "actualDispatchEvent"), [R.get_value(v__loc5_, "event")])
			v__loc4_ = ((v__loc4_ + 1) & 4294967295)
	return null


static func c2679_f_dispatchEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "push"), [{"dispatcher": c, "event": v_param1}])
	return true
	return null


static func c2679_f_actualDispatchEvent(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = false
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v__loc2_ = R.coerce(R.invoke(R.get_value(R.super_ref(c, "com.newgrounds.APIEventDispatcher"), "dispatchEvent"), [v_param1]), "Boolean")
	if R.truth((R.truth(R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")) and R.binary("!=", c, R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")))):
		pass
		R.invoke(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher"), "dispatchEvent"), [v_param1])
	return null


static func c2680_f_BitmapLoader(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.BitmapLoader"), [])
	(c).fields["_bitmapData"] = R.coerce(v_param1, "BitmapData")
	(c).fields["_url"] = R.coerce(v_param2, "String")
	return null


static func c2680_f_get_url(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_url")
	return null


static func c2680_f_set_url(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_loaded"] = false
	(c).fields["_url"] = R.coerce(v_param1, "String")
	return null


static func c2680_f_get_bitmapData(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_bitmapData")
	return null


static func c2680_f_set_bitmapData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	(c).fields["_bitmapData"] = R.coerce(v_param1, "BitmapData")
	(c).fields["_loaded"] = true
	return null


static func c2680_f_get_loaded(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_loaded")
	return null


static func c2680_f_createLoader(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc1_ = R.coerce(R.construct(R.resolve(c, "Loader", "com.newgrounds.BitmapLoader"), []), "Loader")
	v__loc2_ = R.coerce(R.construct(R.resolve(c, "URLRequest", "com.newgrounds.BitmapLoader"), [(c).fields.get("_url")]), "URLRequest")
	R.set_value(v__loc2_, "method", R.get_value(R.resolve(c, "URLRequestMethod", "com.newgrounds.BitmapLoader"), "GET"), "=")
	R.set_value(v__loc2_, "data", R.invoke(R.get_value(R.static_value("com.newgrounds.BitmapLoader", "_cacheSeed"), "toString"), []), "=")
	R.invoke(R.get_value(v__loc1_, "load"), [v__loc2_, R.static_value("com.newgrounds.BitmapLoader", "LOADER_CONTEXT")])
	return v__loc1_
	return null


static func c2680_f_disposeLoader(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "*"}
	l["error"] = null
	if R.truth((c).fields.get("_loader")):
		pass
		R.last_error = null
		R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "removeEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onLoadComplete")])
		R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "removeEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.BitmapLoader"), "IO_ERROR"), R.get_value(c, "onLoadComplete")])
		R.invoke(R.get_value((c).fields.get("_loader"), "unload"), [])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			pass
		(c).fields["_loader"] = R.coerce(null, "Loader")
	return null


static func c2680_f_load(c: Variant, a: Array) -> Variant:
	if R.truth((R.unary("!", (c).fields.get("_url")) or R.binary("==", (c).fields.get("_url"), ""))):
		pass
		R.call_member(c, "onLoadComplete", [null])
		return null
	R.call_member(c, "disposeLoader", [])
	(c).fields["_loader"] = R.coerce(R.call_member(c, "createLoader", []), "Loader")
	R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onLoadComplete")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.BitmapLoader"), "IO_ERROR"), R.get_value(c, "onLoadComplete")])
	return null


static func c2680_f_attachBitmap(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	v__loc2_ = R.coerce(R.construct(R.klass("Sprite"), []), "Sprite")
	if R.truth(((R.truth(R.unary("!", (c).fields.get("_loaded"))) and R.truth((c).fields.get("_url"))) and R.binary("!=", (c).fields.get("_url"), ""))):
		pass
		if R.truth(R.unary("!", (c).fields.get("_loader"))):
			pass
			R.call_member(c, "load", [])
		R.invoke(R.get_value(v__loc2_, "addChild"), [R.call_member(c, "createLoader", [])])
	else:
		pass
		R.invoke(R.get_value(v__loc2_, "addChild"), [R.construct(R.klass("Bitmap"), [(c).fields.get("_bitmapData")])])
	if R.truth(v_param1):
		pass
		R.invoke(R.get_value(v_param1, "addChild"), [v__loc2_])
	return v__loc2_
	return null


static func c2680_f_onLoadComplete(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"bitmapData": "BitmapData", "event": "Event", "error": "SecurityError", "param1": "Event"}
	l["bitmapData"] = null
	l["event"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "bitmapData", null)
	R.lset(l, "event", R.lget(l, "param1"))
	R.last_error = null
	if R.truth(((R.truth(R.logical_and(R.lget(l, "event"), func(): return R.binary("==", R.get_value(R.lget(l, "event"), "type"), R.get_value(R.klass("Event"), "COMPLETE")))) and R.truth((c).fields.get("_loader"))) and R.binary("is", R.get_value((c).fields.get("_loader"), "content"), R.klass("Bitmap")))):
		pass
		R.lset(l, "bitmapData", R.get_value(R.invoke(R.klass("Bitmap"), [R.get_value((c).fields.get("_loader"), "content")]), "bitmapData"), "=")
		(c).fields["_bitmapData"] = R.coerce(R.lget(l, "bitmapData"), "BitmapData")
		(c).fields["_loaded"] = true
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		if R.truth(R.lget(l, "bitmapData")):
			pass
			R.invoke(R.get_value(R.lget(l, "bitmapData"), "dispose"), [])
	R.call_member(c, "disposeLoader", [])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "ICON_LOADED"), c, (null if R.truth((c).fields.get("_loaded")) else R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_FILE"))])])
	return null


static func c2680_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_cacheSeed", 0, "=")
	R.set_value(c, "LOADER_CONTEXT", R.construct(R.resolve(c, "LoaderContext", "com.newgrounds.BitmapLoader"), [true]), "=")
	return null


static func c2681_f_Bridge(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.Bridge"), [])
	(c).fields["_widgetId"] = R.coerce(v_param1, "String")
	(c).fields["_inConnection"] = R.coerce(R.construct(R.resolve(c, "LocalConnection", "com.newgrounds.Bridge"), []), "LocalConnection")
	(c).fields["_outConnection"] = R.coerce(R.construct(R.resolve(c, "LocalConnection", "com.newgrounds.Bridge"), []), "LocalConnection")
	R.set_value((c).fields.get("_inConnection"), "client", c, "=")
	R.invoke(R.get_value((c).fields.get("_inConnection"), "allowDomain"), ["www.newgrounds.com"])
	R.invoke(R.get_value((c).fields.get("_inConnection"), "allowInsecureDomain"), ["www.newgrounds.com"])
	R.invoke(R.get_value((c).fields.get("_inConnection"), "connect"), [R.binary("+", "_rec_", (c).fields.get("_widgetId"))])
	R.invoke(R.get_value((c).fields.get("_outConnection"), "addEventListener"), [R.get_value(R.resolve(c, "StatusEvent", "com.newgrounds.Bridge"), "STATUS"), R.get_value(c, "onStatus")])
	R.call_static("com.newgrounds.Logger", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "LOG"), R.get_value(c, "onLogMessage")])
	return null


static func c2681_f_get_widgetId(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_widgetId")
	return null


static func c2681_f_onLogMessage(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "*", "param1": "APIEvent"}
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.last_error = null
	R.invoke(R.get_value((c).fields.get("_outConnection"), "send"), [(c).fields.get("_widgetId"), "sendEvent", "trace", R.string(R.get_value(R.lget(l, "param1"), "data"))])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	return null


static func c2681_f_sendEvent(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "*", "param1": "String", "param2": "Object"}
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "Object")
	if R.truth((c).fields.get("_outConnection")):
		pass
		R.lset(l, "param2", {"data": R.lget(l, "param2")}, "=")
		R.last_error = null
		R.invoke(R.get_value((c).fields.get("_outConnection"), "send"), [(c).fields.get("_widgetId"), "sendEvent", R.lget(l, "param1"), R.lget(l, "param2")])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			pass
	return null


static func c2681_f_receiveEvent(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc2_": "Object", "error": "*", "param1": "String"}
	l["_loc2_"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "_loc2_", null)
	R.last_error = null
	R.lset(l, "_loc2_", R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.Bridge"), "newgrounds"), "encoders"), "json"), "JSON"), "decode"), [R.lget(l, "param1")]), "=")
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.Bridge"), [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "BRIDGE_EVENT_RECEIVED"), R.lget(l, "_loc2_"), (R.static_value("com.newgrounds.APIEvent", "ERROR_UNKNOWN") if R.truth(R.binary("==", R.lget(l, "_loc2_"), null)) else null)])])
	return null


static func c2682_f_Logger(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.Logger"), [])
	return null


static func c2682_f_logInternal(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_INTERNAL"), v_rest])
	return null


static func c2682_f_logMessage(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_MESSAGE"), v_rest])
	return null


static func c2682_f_logWarning(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_WARNING"), v_rest])
	return null


static func c2682_f_addEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	R.invoke(R.get_value(R.static_value("com.newgrounds.Logger", "_eventDispatcher"), "addEventListener"), [v_param1, v_param2, false, 0, false])
	return null


static func c2683_f_Medal(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else false), "Boolean")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "uint")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "uint")
	var v_param9: Variant = R.coerce((a[8] if a.size() > 8 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.Medal"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_name"] = R.coerce(v_param3, "String")
	(c).fields["_description"] = R.coerce(v_param4, "String")
	(c).fields["_secret"] = v_param5
	(c).fields["_unlocked"] = v_param6
	(c).fields["_value"] = R.coerce(v_param7, "uint")
	(c).fields["_difficulty"] = R.coerce(R.get_value(R.static_value("com.newgrounds.Medal", "DIFFICULTIES"), v_param8), "String")
	(c).fields["_iconLoader"] = R.coerce(R.construct(R.klass("com.newgrounds.BitmapLoader"), [R.static_value("com.newgrounds.Medal", "DEFAULT_ICON"), v_param9]), "BitmapLoader")
	R.call_member((c).fields.get("_iconLoader"), "load", [])
	return null


static func c2683_f_get_difficulty(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_difficulty")
	return null


static func c2683_f_get_icon(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "bitmapData")
	return null


static func c2683_f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null


static func c2683_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2683_f_get_description(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_description")
	return null


static func c2683_f_get_secret(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_secret")
	return null


static func c2683_f_get_unlocked(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_unlocked")
	return null


static func c2683_f_get_value(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_value")
	return null


static func c2683_f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Medal: ", (c).fields.get("_name")), "\t\t("), ("unlocked, " if R.truth((c).fields.get("_unlocked")) else "locked, ")), (c).fields.get("_value")), "pts, "), (c).fields.get("_difficulty")), ")")
	return null


static func c2683_f_attachIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	return R.call_member((c).fields.get("_iconLoader"), "attachBitmap", [v_param1])
	return null


static func c2683_f_unlock(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlocked")):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", "Medal \"", (c).fields.get("_name")), "\" is already unlocked.")])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "Unlocking medal \"", R.get_value(c, "name")), "\"...")])
	(c).fields["_unlocked"] = true
	if R.truth(R.get_value((c).fields.get("_connection"), "hasUserSession")):
		pass
		R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["unlockMedal", R.get_value(c, "onUnlockConfirmed"), null, {"medal_id": R.get_value(c, "id")}])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCKED"), c])])
	return null


static func c2683_f_setUnlocked(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_unlocked"] = v_param1
	return null


static func c2683_f_onUnlockConfirmed(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "Medal \"", R.get_value(c, "name")), "\" unlocked.")])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Failed to unlock \"", R.get_value(c, "name")), "\"!")])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCK_CONFIRMED"), c, R.get_value(v_param1, "error")])])
	return null


static func c2684_f_SaveFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveFile"), [])
	(c).fields["_iconLoader"] = R.coerce(R.construct(R.klass("com.newgrounds.BitmapLoader"), [R.static_value("com.newgrounds.SaveFile", "DEFAULT_ICON"), null]), "BitmapLoader")
	(c).fields["_group"] = R.coerce(v_param1, "SaveGroup")
	(c).fields["_keys"] = R.coerce({}, "Object")
	(c).fields["_ratings"] = R.coerce({}, "Object")
	(c).fields["_numVotes"] = R.coerce({}, "Object")
	return null


static func c2684_f_get_currentFile(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.SaveFile", "_currentFile")
	return null


static func c2684_f_fromObject(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v__loc4_ = R.coerce(null, "Object")
	v__loc5_ = R.coerce(null, "Object")
	v__loc6_ = R.coerce(null, "SaveKey")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc3_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveFile"), [v_param1]), "SaveFile")
	(v__loc3_).fields["_name"] = R.coerce(R.get_value(v_param2, "filename"), "String")
	(v__loc3_).fields["_description"] = R.coerce(R.get_value(v_param2, "description"), "String")
	(v__loc3_).fields["_id"] = R.coerce(R.get_value(v_param2, "save_id"), "uint")
	(v__loc3_).fields["_authorId"] = R.coerce(R.get_value(v_param2, "user_id"), "uint")
	(v__loc3_).fields["_authorName"] = R.coerce(R.get_value(v_param2, "user_name"), "String")
	(v__loc3_).fields["_createdDate"] = R.coerce(R.get_value(v_param2, "created"), "String")
	(v__loc3_).fields["_modifiedDate"] = R.coerce(R.get_value(v_param2, "last_update"), "String")
	(v__loc3_).fields["_views"] = R.coerce(R.get_value(v_param2, "views"), "uint")
	if R.truth((R.truth(R.get_value(v_param2, "thumb")) and R.binary("!=", R.get_value(v_param2, "thumb"), ""))):
		pass
		R.set_value((v__loc3_).fields.get("_iconLoader"), "url", R.binary("+", R.static_value("com.newgrounds.SaveFile", "_imageFilePath"), R.get_value(v_param2, "thumb")), "=")
	(v__loc3_).fields["_dataURL"] = R.coerce(R.binary("+", R.static_value("com.newgrounds.SaveFile", "_saveFilePath"), R.get_value(v_param2, "file")), "String")
	(v__loc3_).fields["_fileSize"] = R.coerce(R.get_value(v_param2, "file_size"), "uint")
	(v__loc3_).fields["_approved"] = R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_UNAPPROVED"))
	(v__loc3_).fields["_readOnly"] = false
	(v__loc3_).fields["_public"] = (R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_PRIVATE")) and R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_UNAPPROVED")))
	for __t1 in R.iterate(R.get_value(v_param2, "keys"), true):
		v__loc4_ = R.coerce(__t1, "Object")
		v__loc6_ = R.coerce(R.call_member(v_param1, "getKeyById", [R.get_value(v__loc4_, "id")]), "SaveKey")
		if R.truth(v__loc6_):
			pass
			R.set_value((v__loc3_).fields.get("_keys"), R.get_value(v__loc6_, "name"), R.call_member(v__loc6_, "validateValue", [R.get_value(v__loc4_, "value")]), "=")
	for __t2 in R.iterate(R.get_value(v_param2, "ratings"), true):
		v__loc5_ = R.coerce(__t2, "Object")
		v__loc7_ = R.coerce(R.call_member(v_param1, "getRatingById", [R.get_value(v__loc5_, "id")]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			R.set_value((v__loc3_).fields.get("_ratings"), R.get_value(v__loc7_, "name"), R.call_member(v__loc7_, "validateValue", [R.get_value(v__loc5_, "score")]), "=")
			R.set_value((v__loc3_).fields.get("_numVotes"), R.get_value(v__loc7_, "name"), R.coerce(R.get_value(v__loc5_, "votes"), "int"), "=")
	return v__loc3_
	return null


static func c2684_f_get_group(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_group")
	return null


static func c2684_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2684_f_set_name(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_name"] = R.coerce(v_param1, "String")
	return null


static func c2684_f_get_description(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_description")
	return null


static func c2684_f_set_description(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_description"] = R.coerce(v_param1, "String")
	return null


static func c2684_f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null


static func c2684_f_get_data(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_data")
	return null


static func c2684_f_set_data(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	(c).fields["_data"] = R.coerce(v_param1, "*")
	return null


static func c2684_f_get_bytesLoaded(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_data")):
		pass
		return R.get_value(c, "bytesTotal")
	if R.truth(R.unary("!", (c).fields.get("_dataLoader"))):
		pass
		return 0
	return R.get_value((c).fields.get("_dataLoader"), "bytesLoaded")
	return null


static func c2684_f_get_bytesTotal(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_fileSize")
	return null


static func c2684_f_get_readOnly(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_readOnly")
	return null


static func c2684_f_get_draft(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_draft")
	return null


static func c2684_f_set_draft(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_draft"] = v_param1
	return null


static func c2684_f_get_authorId(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_authorId")
	return null


static func c2684_f_get_authorName(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_authorName")
	return null


static func c2684_f_get_keys(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_keys")
	return null


static func c2684_f_get_ratings(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_ratings")
	return null


static func c2684_f_get_numVotes(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numVotes")
	return null


static func c2684_f_get_views(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_views")
	return null


static func c2684_f_get_createdDate(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_createdDate")
	return null


static func c2684_f_get_updatedDate(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_modifiedDate")
	return null


static func c2684_f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", "Save File: ", (c).fields.get("_name"))
	return null


static func c2684_f_get_icon(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "bitmapData")
	return null


static func c2684_f_set_icon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	R.call_member(c, "createIcon", [v_param1])
	return null


static func c2684_f_get_iconLoaded(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "loaded")
	return null


static func c2684_f_createIcon(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = NAN
	var v__loc4_: Variant = NAN
	var v__loc8_: Variant = NAN
	var v__loc9_: Variant = null
	var v__loc2_: Variant = null
	var v__loc5_: Variant = NAN
	var v__loc6_: Variant = NAN
	var v__loc7_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "IBitmapDrawable")
	v__loc3_ = float(NAN)
	v__loc4_ = float(NAN)
	v__loc8_ = float(NAN)
	v__loc9_ = R.coerce(null, "Rectangle")
	v__loc2_ = R.coerce(R.construct(R.klass("BitmapData"), [R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH"), R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT"), false, 0]), "BitmapData")
	v__loc5_ = float(0)
	v__loc6_ = float(0)
	if R.truth(R.binary("is", v_param1, R.klass("BitmapData"))):
		pass
		v__loc3_ = R.coerce(R.get_value(R.invoke(R.klass("BitmapData"), [v_param1]), "width"), "Number")
		v__loc4_ = R.coerce(R.get_value(R.invoke(R.klass("BitmapData"), [v_param1]), "height"), "Number")
	else:
		pass
		if R.truth(R.binary("is", v_param1, R.resolve(c, "DisplayObject", "com.newgrounds.SaveFile"))):
			pass
			v__loc9_ = R.coerce(R.invoke(R.get_value(R.invoke(R.resolve(c, "DisplayObject", "com.newgrounds.SaveFile"), [v_param1]), "getBounds"), [null]), "Rectangle")
			v__loc5_ = R.coerce(R.get_value(v__loc9_, "left"), "Number")
			v__loc6_ = R.coerce(R.get_value(v__loc9_, "top"), "Number")
			v__loc3_ = R.coerce(R.get_value(v__loc9_, "width"), "Number")
			v__loc4_ = R.coerce(R.get_value(v__loc9_, "height"), "Number")
	v__loc7_ = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
	v__loc8_ = float(minf(float(R.binary("/", R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH"), v__loc3_)), float(R.binary("/", R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT"), v__loc4_))))
	R.invoke(R.get_value(v__loc7_, "translate"), [R.unary("-", v__loc5_), R.unary("-", v__loc6_)])
	R.invoke(R.get_value(v__loc7_, "scale"), [v__loc8_, v__loc8_])
	R.invoke(R.get_value(v__loc7_, "translate"), [R.binary("/", (float(R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH")) - float((float(v__loc3_) * float(v__loc8_)))), 2), R.binary("/", (float(R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT")) - float((float(v__loc4_) * float(v__loc8_)))), 2)])
	R.invoke(R.get_value(v__loc2_, "draw"), [v_param1, v__loc7_])
	R.set_value((c).fields.get("_iconLoader"), "bitmapData", v__loc2_, "=")
	return null


static func c2684_f_attachIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	if R.truth((c).fields.get("_iconLoader")):
		pass
		return R.call_member((c).fields.get("_iconLoader"), "attachBitmap", [v_param1])
	R.call_static("com.newgrounds.Logger", "logError", ["No icon available for this sumbission."])
	return null
	return null


static func c2684_f_deleteFile(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	if R.truth(R.unary("!", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "hasUserSession"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The user must be logged-in to delete a file."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	if R.truth(R.unary("!", (c).fields.get("_id"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The file does not exist."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), ["deleteSaveFile"]), "APICommand")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "save_id", (c).fields.get("_id"), "=")
	R.call_member(v__loc1_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), R.get_value(c, "onFileDeleted")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendCommand"), [v__loc1_])
	return null


static func c2684_f_save(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "hasUserSession"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The user must be logged-in to save a file."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	R.set_value(R.klass("com.newgrounds.BitmapLoader"), "_cacheSeed", 1, "+=")
	R.assign(c, "_currentFile", "com.newgrounds.SaveFile", c, "=")
	R.call_member(c, "encodeData", [true])
	return null


static func c2684_f_doSave(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc8_: Variant = null
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc3_ = R.coerce(null, "String")
	v__loc4_ = R.coerce(null, "Array")
	v__loc5_ = R.coerce(null, "String")
	v__loc6_ = R.coerce(null, "SaveKey")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc8_ = R.coerce(null, "ByteArray")
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), ["saveFile"]), "APICommand")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "group", R.get_value((c).fields.get("_group"), "id"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "user_name", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "username"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "filename", (c).fields.get("_name"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "description", (c).fields.get("_description"), "=")
	if R.truth((c).fields.get("_draft")):
		pass
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "draft", true, "=")
	if R.truth((R.truth((c).fields.get("_id")) and R.unary("!", (c).fields.get("_readOnly")))):
		pass
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "overwrite", 1, "=")
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "save_id", (c).fields.get("_id"), "=")
	v__loc2_ = R.coerce([], "Array")
	for __t3 in R.iterate((c).fields.get("_keys"), false):
		v__loc3_ = R.coerce(__t3, "String")
		v__loc6_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v__loc3_]), "SaveKey")
		if R.truth(v__loc6_):
			pass
			R.invoke(R.get_value(v__loc2_, "push"), [{"id": R.get_value(v__loc6_, "id"), "value": R.call_member(v__loc6_, "validateValue", [R.get_value((c).fields.get("_keys"), v__loc3_)])}])
		else:
			pass
			R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "No key named \"", v__loc3_), "\" in save group \""), R.get_value((c).fields.get("_group"), "name")), "\".")])
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "keys", v__loc2_, "=")
	v__loc4_ = R.coerce([], "Array")
	for __t4 in R.iterate((c).fields.get("_ratings"), false):
		v__loc5_ = R.coerce(__t4, "String")
		v__loc7_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [v__loc5_]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			R.invoke(R.get_value(v__loc4_, "push"), [{"id": R.get_value(v__loc7_, "id"), "value": R.call_member(v__loc7_, "validateValue", [R.get_value((c).fields.get("_ratings"), v__loc5_)])}])
		else:
			pass
			R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "No rating named \"", v__loc5_), "\" in save group \""), R.get_value((c).fields.get("_group"), "name")), "\".")])
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "ratings", v__loc4_, "=")
	v__loc8_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc8_, "writeObject"), [(c).fields.get("_encodedData")])
	R.invoke(R.get_value(v__loc8_, "compress"), [])
	R.call_member(v__loc1_, "addFile", ["file", v__loc8_, "file"])
	if R.truth(R.get_value(c, "iconLoaded")):
		pass
		R.call_member(v__loc1_, "addFile", ["thumbnail", R.call_static("com.newgrounds.encoders.PNGEncoder", "encode", [R.get_value(c, "icon")]), "thumbnail"])
	R.call_member(v__loc1_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), R.get_value(c, "onSaveComplete")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendCommand"), [v__loc1_])
	return null


static func c2684_f_encodeData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_encoderQueue"] = R.coerce([], "Array")
	(c).fields["_encoding"] = v_param1
	if R.truth(v_param1):
		pass
		(c).fields["_encodedData"] = R.coerce((c).fields.get("_data"), "*")
		R.call_member(c, "preEncodeObject", [c, "_encodedData"])
	else:
		pass
		R.call_member(c, "preEncodeObject", [c, "_data"])
	R.call_member(c, "encodeObject", [])
	return null


static func c2684_f_preEncodeObject(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc4_": "Boolean", "_loc6_": "Boolean", "_loc7_": "String", "_loc3_": "Object", "error": "*", "_loc5_": "Object", "param1": "Object", "param2": "String"}
	l["_loc4_"] = false
	l["_loc6_"] = false
	l["_loc7_"] = null
	l["_loc3_"] = null
	l["error"] = null
	l["_loc5_"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.lset(l, "_loc4_", false)
	R.lset(l, "_loc6_", false)
	R.lset(l, "_loc7_", null)
	R.lset(l, "_loc3_", R.get_value(R.lget(l, "param1"), R.lget(l, "param2")))
	R.last_error = null
	if R.truth((c).fields.get("_encoding")):
		pass
		R.lset(l, "_loc4_", R.binary("is", R.lget(l, "_loc3_"), R.klass("BitmapData")), "=")
	else:
		pass
		R.lset(l, "_loc4_", R.binary("==", R.get_value(R.lget(l, "_loc3_"), "type"), "__bitmap"), "=")
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	R.lset(l, "_loc5_", R.lget(l, "_loc3_"))
	R.lset(l, "_loc6_", R.binary("is", R.lget(l, "_loc3_"), R.klass("ByteArray")), "=")
	if R.truth(R.lget(l, "_loc4_")):
		pass
		R.invoke(R.get_value((c).fields.get("_encoderQueue"), "push"), [{"parent": R.lget(l, "param1"), "property": R.lget(l, "param2")}])
	else:
		pass
		if R.truth((R.binary("==", R.unary("typeof", R.lget(l, "_loc3_")), "object") and R.unary("!", R.lget(l, "_loc6_")))):
			pass
			if R.truth((c).fields.get("_encoding")):
				pass
				if R.truth(R.binary("is", R.lget(l, "_loc3_"), R.klass("Array"))):
					pass
					R.lset(l, "_loc5_", [], "=")
				else:
					pass
					R.lset(l, "_loc5_", {}, "=")
				for __t5 in R.iterate(R.lget(l, "_loc3_"), false):
					R.lset(l, "_loc7_", __t5, "=")
					R.set_value(R.lget(l, "_loc5_"), R.lget(l, "_loc7_"), R.get_value(R.lget(l, "_loc3_"), R.lget(l, "_loc7_")), "=")
				R.set_value(R.lget(l, "param1"), R.lget(l, "param2"), R.lget(l, "_loc5_"), "=")
			for __t6 in R.iterate(R.lget(l, "_loc5_"), false):
				R.lset(l, "_loc7_", __t6, "=")
				R.call_member(c, "preEncodeObject", [R.lget(l, "_loc5_"), R.lget(l, "_loc7_")])
	return null


static func c2684_f_encodeObject(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	v__loc5_ = R.coerce(null, "Object")
	if R.truth(R.unary("!", R.get_value((c).fields.get("_encoderQueue"), "length"))):
		pass
		if R.truth((c).fields.get("_encoding")):
			pass
			R.call_member(c, "doSave", [])
		else:
			pass
			(c).fields["_dataLoaded"] = true
			R.call_member(c, "checkLoadComplete", [])
		return null
	v__loc1_ = R.coerce(R.invoke(R.get_value((c).fields.get("_encoderQueue"), "pop"), []), "Object")
	v__loc2_ = R.coerce(R.get_value(v__loc1_, "parent"), "Object")
	v__loc3_ = R.coerce(R.get_value(v__loc1_, "property"), "String")
	v__loc4_ = R.coerce(R.get_value(v__loc2_, v__loc3_), "Object")
	if R.truth((c).fields.get("_encoding")):
		pass
		v__loc5_ = R.coerce({"type": "__bitmap", "width": R.get_value(v__loc4_, "width"), "height": R.get_value(v__loc4_, "height"), "transparent": R.get_value(v__loc4_, "transparent")}, "Object")
		R.set_value(v__loc2_, v__loc3_, v__loc5_, "=")
		R.set_value(v__loc5_, "data", R.construct(R.klass("ByteArray"), []), "=")
		R.invoke(R.get_value(R.get_value(v__loc5_, "data"), "writeBytes"), [R.invoke(R.get_value(v__loc4_, "getPixels"), [R.get_value(v__loc4_, "rect")])])
		R.set_value(R.get_value(v__loc5_, "data"), "position", 0, "=")
	else:
		pass
		v__loc5_ = R.coerce(R.construct(R.klass("BitmapData"), [R.get_value(v__loc4_, "width"), R.get_value(v__loc4_, "height"), R.get_value(v__loc4_, "transparent")]), "Object")
		R.invoke(R.get_value(v__loc5_, "setPixels"), [R.get_value(v__loc5_, "rect"), R.get_value(v__loc4_, "data")])
		R.set_value(v__loc2_, v__loc3_, v__loc5_, "=")
	R.call_member(c, "encodeObject", [])
	return null


static func c2684_f_onIconLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth((R.unary("!", R.get_value(v_param1, "success")) and R.truth(R.get_value((c).fields.get("_iconLoader"), "url")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", ["Unable to load the icon for this save file."])
	R.call_member((c).fields.get("_iconLoader"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "ICON_LOADED"), R.get_value(c, "onIconLoaded")])
	R.call_member(c, "checkLoadComplete", [])
	return null


static func c2684_f_checkLoadComplete(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and((c).fields.get("_dataLoaded"), func(): return R.get_value(c, "iconLoaded"))):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["Data loaded."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c])])
	return null


static func c2684_f_onDataLoaded(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"byteArray": "ByteArray", "data": "*", "error": "Error", "param1": "*"}
	l["byteArray"] = null
	l["data"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.lset(l, "byteArray", null)
	R.lset(l, "data", R.lget(l, "param1"))
	R.last_error = null
	if R.truth(R.lget(l, "data")):
		pass
		R.lset(l, "byteArray", R.lget(l, "data"), "=")
		R.invoke(R.get_value(R.lget(l, "byteArray"), "uncompress"), [])
		(c).fields["_data"] = R.coerce(R.invoke(R.get_value(R.lget(l, "byteArray"), "readObject"), []), "*")
		R.call_member(c, "encodeData", [false])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_static("com.newgrounds.Logger", "logError", ["Error while loading data:", R.lget(l, "error")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c, R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_FILE")])])
	return null


static func c2684_f_onDataError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_static("com.newgrounds.Logger", "logError", ["Unable to load data:", v_param1])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c, R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_FILE")])])
	return null


static func c2684_f_onSaveComplete(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "File \"", (c).fields.get("_name")), "\" saved!")])
		if R.truth(R.get_value(v_param1, "data")):
			pass
			(c).fields["_id"] = R.coerce(R.get_value(R.get_value(v_param1, "data"), "save_id"), "uint")
			(c).fields["_dataURL"] = R.coerce(R.invoke(R.resolve(c, "unescape", "com.newgrounds.SaveFile"), [R.get_value(R.get_value(v_param1, "data"), "file_url")]), "String")
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), c])])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Error saving file \"", (c).fields.get("_name")), "\":"), R.get_value(v_param1, "error")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), c, R.get_value(v_param1, "error")])])
	return null


static func c2684_f_sendVote(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v__loc3_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [v_param1]), "SaveRating")
	if R.truth(R.unary("!", v__loc3_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "No save rating named \"", v_param1), "\" exists for this save group.")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), {}, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	v_param2 = R.coerce(R.call_member(v__loc3_, "validateValue", [v_param2]), "Number")
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveFile"), [v_param2])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Invalid vote (", v_param2), "). "), v_param1), " allows a range of "), R.get_value(v__loc3_, "minimum")), "-"), R.get_value(v__loc3_, "maximum")), ".")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), {}, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Voting ", v_param2), " for "), v_param1), " on "), (c).fields.get("_name")), "...")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendSimpleCommand"), ["rateSaveFile", R.get_value(c, "onVoteComplete"), null, {"group": R.get_value((c).fields.get("_group"), "id"), "save_id": (c).fields.get("_id"), "rating_id": R.get_value(v__loc3_, "id"), "vote": v_param2}])
	return null


static func c2684_f_onVoteComplete(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc3_ = R.coerce(null, "SaveRating")
	v__loc2_ = R.coerce(R.get_value(v_param1, "error"), "String")
	if R.truth(R.get_value(R.get_value(v_param1, "data"), "already_voted")):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["Vote failed. You've already voted on this rating today."])
		v__loc2_ = R.coerce(R.static_value("com.newgrounds.APIEvent", "ERROR_ALREADY_VOTED"), "String")
	if R.truth(R.binary("==", v__loc2_, R.static_value("com.newgrounds.APIEvent", "ERROR_NONE"))):
		pass
		v__loc3_ = R.coerce(R.call_member((c).fields.get("_group"), "getRatingById", [R.get_value(R.get_value(v_param1, "data"), "rating_id")]), "SaveRating")
		if R.truth(v__loc3_):
			pass
			R.set_value((c).fields.get("_ratings"), R.get_value(v__loc3_, "name"), R.call_member(v__loc3_, "validateValue", [R.get_value(R.get_value(v_param1, "data"), "score")]), "=")
		R.call_static("com.newgrounds.Logger", "logMessage", ["Vote complete!"])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), c, v__loc2_])])
	return null


static func c2684_f_onFileDeleted(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		(c).fields["_id"] = R.coerce(0, "uint")
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), c, R.get_value(v_param1, "error")])])
	return null


static func c2684_f_clone(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc1_: Variant = null
	v__loc2_ = R.coerce(null, "String")
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveFile"), [(c).fields.get("_group")]), "SaveFile")
	(v__loc1_).fields["_data"] = R.coerce((c).fields.get("_data"), "*")
	(v__loc1_).fields["_description"] = R.coerce((c).fields.get("_description"), "String")
	(v__loc1_).fields["_draft"] = (c).fields.get("_draft")
	(v__loc1_).fields["_fileSize"] = R.coerce((c).fields.get("_fileSize"), "uint")
	R.set_value((v__loc1_).fields.get("_iconLoader"), "bitmapData", R.get_value((c).fields.get("_iconLoader"), "bitmapData"), "=")
	for __t7 in R.iterate((c).fields.get("_keys"), false):
		v__loc2_ = R.coerce(__t7, "String")
		R.set_value((v__loc1_).fields.get("_keys"), v__loc2_, R.get_value((c).fields.get("_keys"), v__loc2_), "=")
	for __t8 in R.iterate((c).fields.get("_ratings"), false):
		v__loc2_ = R.coerce(__t8, "String")
		R.set_value((v__loc1_).fields.get("_ratings"), v__loc2_, R.get_value((c).fields.get("_ratings"), v__loc2_), "=")
	for __t9 in R.iterate((c).fields.get("_numVotes"), false):
		v__loc2_ = R.coerce(__t9, "String")
		R.set_value((v__loc1_).fields.get("_numVotes"), v__loc2_, R.get_value((c).fields.get("_numVotes"), v__loc2_), "=")
	(v__loc1_).fields["_name"] = R.coerce((c).fields.get("_name"), "String")
	return v__loc1_
	return null


static func c2684_f_load(c: Variant, a: Array) -> Variant:
	R.assign(c, "_currentFile", "com.newgrounds.SaveFile", c, "=")
	(c).fields["_dataLoaded"] = false
	(c).fields["_data"] = R.coerce(null, "*")
	if R.truth(R.unary("!", R.get_value(c, "iconLoaded"))):
		pass
		R.call_member((c).fields.get("_iconLoader"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "ICON_LOADED"), R.get_value(c, "onIconLoaded")])
		R.call_member((c).fields.get("_iconLoader"), "load", [])
	(c).fields["_dataLoader"] = R.coerce(R.construct(R.resolve(c, "URLLoader", "com.newgrounds.SaveFile"), []), "URLLoader")
	R.set_value((c).fields.get("_dataLoader"), "dataFormat", R.get_value(R.resolve(c, "URLLoaderDataFormat", "com.newgrounds.SaveFile"), "BINARY"), "=")
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "as3DataLoaded")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.SaveFile"), "IO_ERROR"), R.get_value(c, "as3DataError")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.resolve(c, "SecurityErrorEvent", "com.newgrounds.SaveFile"), "SECURITY_ERROR"), R.get_value(c, "as3DataError")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "load"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.SaveFile"), [R.binary("+", R.binary("+", (c).fields.get("_dataURL"), "&random="), randf())])])
	return null


static func c2684_f_as3DataLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onDataLoaded", [R.get_value((c).fields.get("_dataLoader"), "data")])
	return null


static func c2684_f_as3DataError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onDataError", [R.invoke(R.get_value(v_param1, "toString"), [])])
	return null


static func c2684_f_decodeObject(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v__loc2_ = R.coerce(null, "BitmapData")
	v__loc3_ = R.coerce(null, "String")
	if R.truth(R.binary("==", R.invoke(R.resolve(c, "getQualifiedClassName", "com.newgrounds.SaveFile"), [v_param1]), "Object")):
		pass
		if R.truth(R.binary("==", R.get_value(v_param1, "type"), "__bitmap")):
			pass
			v__loc2_ = R.coerce(R.construct(R.klass("BitmapData"), [R.get_value(v_param1, "width"), R.get_value(v_param1, "height"), R.get_value(v_param1, "transparent")]), "BitmapData")
			R.invoke(R.get_value(v__loc2_, "setPixels"), [R.get_value(v__loc2_, "rect"), R.get_value(v_param1, "data")])
			v_param1 = R.coerce(v__loc2_, "Object")
		else:
			pass
			for __t10 in R.iterate(v_param1, false):
				v__loc3_ = R.coerce(__t10, "String")
				R.set_value(v_param1, v__loc3_, R.call_member(c, "decodeObject", [R.get_value(v_param1, v__loc3_)]), "=")
	return v_param1
	return null


static func c2685_f_SaveGroup(c: Variant, a: Array) -> Variant:
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = null
	var v__loc9_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "uint")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else null), "Array")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else null), "Array")
	v__loc7_ = R.coerce(0, "uint")
	v__loc8_ = R.coerce(null, "SaveKey")
	v__loc9_ = R.coerce(null, "SaveRating")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveGroup"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_id"] = R.coerce(v_param3, "uint")
	(c).fields["_name"] = R.coerce(v_param2, "String")
	(c).fields["_type"] = R.coerce(v_param4, "uint")
	(c).fields["_keysArray"] = R.coerce(v_param5, "Array")
	(c).fields["_ratingsArray"] = R.coerce(v_param6, "Array")
	(c).fields["_keys"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.SaveGroup"), []), "Object")
	(c).fields["_ratings"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.SaveGroup"), []), "Object")
	for __t1 in R.iterate(v_param5, true):
		v__loc8_ = R.coerce(__t1, "SaveKey")
		R.set_value((c).fields.get("_keys"), R.get_value(v__loc8_, "name"), v__loc8_, "=")
	for __t2 in R.iterate(v_param6, true):
		v__loc9_ = R.coerce(__t2, "SaveRating")
		R.set_value((c).fields.get("_ratings"), R.get_value(v__loc9_, "name"), v__loc9_, "=")
	return null


static func c2685_f_get_connection(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_connection")
	return null


static func c2685_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2685_f_get_type(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_type")
	return null


static func c2685_f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null


static func c2685_f_get_keys(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_keysArray")
	return null


static func c2685_f_get_ratings(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_ratingsArray")
	return null


static func c2685_f_getKey(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("_keys"), v_param1)
	return null


static func c2685_f_getRating(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("_ratings"), v_param1)
	return null


static func c2685_f_getKeyById(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v__loc2_ = R.coerce(null, "SaveKey")
	for __t3 in R.iterate((c).fields.get("_keys"), true):
		v__loc2_ = R.coerce(__t3, "SaveKey")
		if R.truth(R.binary("==", R.get_value(v__loc2_, "id"), v_param1)):
			pass
			return v__loc2_
	return null
	return null


static func c2685_f_getRatingById(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v__loc2_ = R.coerce(null, "SaveRating")
	for __t4 in R.iterate((c).fields.get("_ratings"), true):
		v__loc2_ = R.coerce(__t4, "SaveRating")
		if R.truth(R.binary("==", R.get_value(v__loc2_, "id"), v_param1)):
			pass
			return v__loc2_
	return null
	return null


static func c2685_f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "SaveGroup: ", R.get_value(c, "name")), "  Keys: "), (c).fields.get("_keysArray")), "  Ratings: "), (c).fields.get("_ratingsArray"))
	return null


static func c2686_f_SaveKey(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveKey"), [])
	(c).fields["_name"] = R.coerce(v_param1, "String")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_type"] = R.coerce(v_param3, "uint")
	return null


static func c2686_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2686_f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null


static func c2686_f_get_type(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_type")
	return null


static func c2686_f_validateValue(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc2_ = R.coerce(0, "int")
	var __t1 = (c).fields.get("_type")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_INTEGER")):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_FLOAT")):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_BOOLEAN")):
		__t2 = 2
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_STRING")):
		__t2 = 3
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			v_param1 = R.coerce(R.num(v_param1), "*")
			if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [v_param1]))):
				pass
				v__loc2_ = R.coerce(R.coerce(v_param1, "int"), "int")
				if R.truth(R.binary("!=", v__loc2_, v_param1)):
					pass
					R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Float value ", v_param1), " given for integer key \""), (c).fields.get("_name")), "\". Clamping to "), v__loc2_), ".")])
				return v__loc2_
			break
		if __t2 >= 0 and __t2 <= 1:
			pass
			v_param1 = R.coerce(R.num(v_param1), "*")
			if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [v_param1]))):
				pass
				return R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [R.num(v_param1)])
			break
		if __t2 >= 0 and __t2 <= 2:
			pass
			return (R.truth(v_param1) and (float(R.coerce(v_param1, "int")) != float(0)))
		if __t2 >= 0 and __t2 <= 3:
			pass
			return (R.invoke(R.get_value(v_param1, "toString"), []) if R.truth(v_param1) else "")
	return null
	return null


static func c2686_f_toString(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2687_f_SaveQuery(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveQuery"), [])
	(c).fields["_group"] = R.coerce(v_param1, "SaveGroup")
	(c).fields["_connection"] = R.coerce(R.get_value(v_param1, "connection"), "APIConnection")
	R.call_member(c, "reset", [])
	return null


static func c2687_f_get_group(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_group")
	return null


static func c2687_f_get_resultsPerPage(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_resultsPerPage")
	return null


static func c2687_f_set_resultsPerPage(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_resultsPerPage"] = R.coerce(minf(float(maxf(float(v_param1), float(1))), float(100)), "uint")
	return null


static func c2687_f_get_page(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_page")
	return null


static func c2687_f_set_page(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_page"] = R.coerce(maxf(float(v_param1), float(1)), "uint")
	return null


static func c2687_f_prevPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "page", 1, "-=")
	return null


static func c2687_f_nextPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "page", 1, "+=")
	return null


static func c2687_f_get_isRandomized(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_isRandomized")
	return null


static func c2687_f_set_isRandomized(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_isRandomized"] = v_param1
	return null


static func c2687_f_get_files(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_files")
	return null


static func c2687_f_reset(c: Variant, a: Array) -> Variant:
	(c).fields["_page"] = R.coerce(1, "uint")
	(c).fields["_resultsPerPage"] = R.coerce(10, "uint")
	(c).fields["_isRandomized"] = false
	(c).fields["_lookupKeys"] = R.coerce([], "Array")
	(c).fields["_lookupRatings"] = R.coerce([], "Array")
	(c).fields["_fileConditions"] = R.coerce([], "Array")
	(c).fields["_keyConditions"] = R.coerce([], "Array")
	(c).fields["_ratingConditions"] = R.coerce([], "Array")
	(c).fields["_sortFields"] = R.coerce([], "Array")
	(c).fields["_files"] = R.coerce([], "Array")
	R.call_member(c, "includeAllFields", [])
	return null


static func c2687_f_clone(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveQuery"), [(c).fields.get("_group")]), "SaveQuery")
	(v__loc1_).fields["_page"] = R.coerce((c).fields.get("_page"), "uint")
	(v__loc1_).fields["_resultsPerPage"] = R.coerce((c).fields.get("_resultsPerPage"), "uint")
	(v__loc1_).fields["_isRandomized"] = (c).fields.get("_isRandomized")
	(v__loc1_).fields["_lookupKeys"] = R.coerce(R.invoke(R.get_value((c).fields.get("_lookupKeys"), "concat"), []), "Array")
	(v__loc1_).fields["_lookupRatings"] = R.coerce(R.invoke(R.get_value((c).fields.get("_lookupRatings"), "concat"), []), "Array")
	(v__loc1_).fields["_fileConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_fileConditions"), "concat"), []), "Array")
	(v__loc1_).fields["_keyConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_keyConditions"), "concat"), []), "Array")
	(v__loc1_).fields["_ratingConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_ratingConditions"), "concat"), []), "Array")
	return v__loc1_
	return null


static func c2687_f_includeAllFields(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc1_ = R.coerce(null, "SaveKey")
	v__loc2_ = R.coerce(null, "SaveRating")
	for __t1 in R.iterate(R.get_value((c).fields.get("_group"), "keys"), true):
		v__loc1_ = R.coerce(__t1, "SaveKey")
		R.invoke(R.get_value((c).fields.get("_lookupKeys"), "push"), [R.get_value(v__loc1_, "id")])
	for __t2 in R.iterate(R.get_value((c).fields.get("_group"), "ratings"), true):
		v__loc2_ = R.coerce(__t2, "SaveRating")
		R.invoke(R.get_value((c).fields.get("_lookupRatings"), "push"), [R.get_value(v__loc2_, "id")])
	return null


static func c2687_f_addCondition(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "*")
	v__loc4_ = R.coerce(0, "int")
	v__loc5_ = R.coerce(null, "SaveKey")
	v__loc6_ = R.coerce(null, "Array")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc4_ = R.coerce(R.invoke(R.get_value(R.static_value("com.newgrounds.SaveQuery", "FILE_FIELDS"), "indexOf"), [v_param1]), "int")
	if R.truth((float(v__loc4_) >= float(0))):
		pass
		R.invoke(R.get_value((c).fields.get("_fileConditions"), "push"), [{"field": v__loc4_, "operator": v_param2, "value": v_param3}])
	else:
		pass
		v__loc5_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v_param1]), "SaveKey")
		if R.truth(v__loc5_):
			pass
			v_param3 = R.coerce(R.call_member(v__loc5_, "validateValue", [v_param3]), "*")
			R.invoke(R.get_value((c).fields.get("_keyConditions"), "push"), [{"key_id": R.get_value(v__loc5_, "id"), "operator": v_param2, "value": v_param3}])
			return null
		v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "split"), ["."]), "Array")
		v__loc7_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [R.get_value(v__loc6_, 0)]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			if R.truth(R.binary("!=", R.get_value(v__loc6_, 1), "votes")):
				pass
				v_param3 = R.coerce(R.call_member(v__loc7_, "validateValue", [v_param3]), "*")
			R.invoke(R.get_value((c).fields.get("_ratingConditions"), "push"), [{"rating_id": R.get_value(v__loc7_, "id"), "operator": v_param2, "value": v_param3, "column": (R.get_value(v__loc6_, 1) if R.truth(R.get_value(v__loc6_, 1)) else "score")}])
			return null
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "The save group \"", R.get_value((c).fields.get("_group"), "name")), "\" does not have a field named \""), v_param1), "\".")])
	return null


static func c2687_f_sortOn(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v__loc3_ = R.coerce(0, "int")
	v__loc4_ = R.coerce(null, "SaveKey")
	v__loc5_ = R.coerce(null, "Array")
	v__loc6_ = R.coerce(null, "SaveRating")
	v__loc3_ = R.coerce(R.invoke(R.get_value(R.static_value("com.newgrounds.SaveQuery", "FILE_FIELDS"), "indexOf"), [v_param1]), "int")
	if R.truth((float(v__loc3_) >= float(0))):
		pass
		R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_FILES"), "field": v__loc3_, "desc": v_param2}])
	else:
		pass
		v__loc4_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v_param1]), "SaveKey")
		if R.truth(v__loc4_):
			pass
			R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_KEYS"), "field": R.get_value(v__loc4_, "id"), "desc": v_param2}])
			return null
		v__loc5_ = R.coerce(R.invoke(R.get_value(v_param1, "split"), ["."]), "Array")
		v__loc6_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [R.get_value(v__loc5_, 0)]), "SaveRating")
		if R.truth(v__loc6_):
			pass
			R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_RATINGS"), "field": R.get_value(v__loc6_, "id"), "desc": v_param2, "extra": (R.get_value(v__loc5_, 1) if R.truth(R.get_value(v__loc5_, 1)) else "score")}])
			return null
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "The save group \"", R.get_value((c).fields.get("_group"), "name")), "\" does not have a field named \""), v_param1), "\".")])
	return null


static func c2687_f_execute(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce({}, "Object")
	R.set_value(v__loc1_, "page", (c).fields.get("_page"), "=")
	R.set_value(v__loc1_, "num_results", (c).fields.get("_resultsPerPage"), "=")
	if R.truth((c).fields.get("_isRandomized")):
		pass
		R.set_value(v__loc1_, "randomize", 1, "=")
	if R.truth((R.truth((c).fields.get("_lookupKeys")) and R.truth(R.get_value((c).fields.get("_lookupKeys"), "length")))):
		pass
		R.set_value(v__loc1_, "lookup_keys", (c).fields.get("_lookupKeys"), "=")
	if R.truth((R.truth((c).fields.get("_lookupRatings")) and R.truth(R.get_value((c).fields.get("_lookupRatings"), "length")))):
		pass
		R.set_value(v__loc1_, "lookup_ratings", (c).fields.get("_lookupRatings"), "=")
	if R.truth((R.truth((c).fields.get("_fileConditions")) and R.truth(R.get_value((c).fields.get("_fileConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "file_conditions", (c).fields.get("_fileConditions"), "=")
	if R.truth((R.truth((c).fields.get("_keyConditions")) and R.truth(R.get_value((c).fields.get("_keyConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "key_conditions", (c).fields.get("_keyConditions"), "=")
	if R.truth((R.truth((c).fields.get("_ratingConditions")) and R.truth(R.get_value((c).fields.get("_ratingConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "rating_conditions", (c).fields.get("_ratingConditions"), "=")
	if R.truth((R.truth((c).fields.get("_sortFields")) and R.truth(R.get_value((c).fields.get("_sortFields"), "length")))):
		pass
		R.set_value(v__loc1_, "sort_conditions", (c).fields.get("_sortFields"), "=")
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["lookupSaveFiles", R.get_value(c, "onQueryComplete"), {"publisher_id": ((c).fields.get("_connection")).fields.get("publisherId"), "group_id": R.get_value((c).fields.get("_group"), "id"), "query": v__loc1_}])
	return null


static func c2687_f_onQueryComplete(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Object")
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(null, "SaveFile")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
		(c).fields["_files"] = R.coerce([], "Array")
		if R.truth(R.get_value(v__loc2_, "files")):
			pass
			v__loc3_ = R.coerce(0, "uint")
			while R.truth(R.binary("<", v__loc3_, R.get_value(R.get_value(v__loc2_, "files"), "length"))):
				pass
				v__loc4_ = R.coerce(R.call_static("com.newgrounds.SaveFile", "fromObject", [(c).fields.get("_group"), R.get_value(R.get_value(v__loc2_, "files"), v__loc3_)]), "SaveFile")
				if R.truth(v__loc4_):
					pass
					R.invoke(R.get_value((c).fields.get("_files"), "push"), [v__loc4_])
				v__loc3_ = ((v__loc3_ + 1) & 4294967295)
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), c])])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Query failed: ", R.get_value(v_param1, "error"))])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), c, R.get_value(v_param1, "error")])])
	return null


static func c2688_f_SaveRating(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveRating"), [])
	(c).fields["_name"] = R.coerce(v_param1, "String")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_isFloat"] = v_param3
	(c).fields["_minimum"] = float(v_param4)
	(c).fields["_maximum"] = float(v_param5)
	return null


static func c2688_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2688_f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null


static func c2688_f_get_isFloat(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_isFloat")
	return null


static func c2688_f_get_minimum(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_minimum")
	return null


static func c2688_f_get_maximum(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_maximum")
	return null


static func c2688_f_validateValue(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc2_: Variant = NAN
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc3_ = R.coerce(0, "int")
	v__loc2_ = float(R.num(v_param1))
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveRating"), [v__loc2_])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Invalid value for rating \"", (c).fields.get("_name")), "\".")])
		return NAN
	if R.truth((float(v__loc2_) < float((c).fields.get("_minimum")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", v__loc2_, " is out of acceptable range for rating \""), (c).fields.get("_name")), "\". Clamping to "), (c).fields.get("_minimum")), ".")])
		return (c).fields.get("_minimum")
	if R.truth((float(v__loc2_) > float((c).fields.get("_maximum")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", v__loc2_, " is out of acceptable range for rating \""), (c).fields.get("_name")), "\". Clamping to "), (c).fields.get("_maximum")), ".")])
		return (c).fields.get("_maximum")
	if R.truth(R.unary("!", R.get_value(c, "isFloat"))):
		pass
		v__loc3_ = R.coerce(R.coerce(v__loc2_, "int"), "int")
		if R.truth((float(v__loc3_) != float(v__loc2_))):
			pass
			R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Float value ", v__loc2_), " given for integer rating \""), (c).fields.get("_name")), "\". Clamping to "), v__loc3_), ".")])
		return v__loc3_
	return v__loc2_
	return null


static func c2688_f_toString(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2689_f_Score(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.Score"), [])
	(c).fields["_rank"] = R.coerce(v_param1, "uint")
	(c).fields["_username"] = R.coerce(v_param2, "String")
	(c).fields["_score"] = R.coerce(v_param3, "String")
	(c).fields["_numericValue"] = float(v_param4)
	(c).fields["_tag"] = R.coerce(v_param5, "String")
	return null


static func c2689_f_get_numericValue(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numericValue")
	return null


static func c2689_f_get_rank(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_rank")
	return null


static func c2689_f_get_score(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_score")
	return null


static func c2689_f_get_tag(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tag")
	return null


static func c2689_f_get_username(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_username")
	return null


static func c2689_f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", (c).fields.get("_rank"), ".\t"), (c).fields.get("_username")), "\t"), (c).fields.get("_score"))
	return null


static func c2690_f_ScoreBoard(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	R.invoke(R.super_ref(c, "com.newgrounds.ScoreBoard"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_name"] = R.coerce(v_param2, "String")
	(c).fields["_id"] = R.coerce(v_param3, "uint")
	return null


static func c2690_f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null


static func c2690_f_get_scores(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_scores")
	return null


static func c2690_f_get_period(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_period")
	return null


static func c2690_f_set_period(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_period"] = R.coerce(v_param1, "String")
	return null


static func c2690_f_get_firstResult(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_firstResult")
	return null


static func c2690_f_set_firstResult(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_firstResult"] = R.coerce(maxf(float(1), float(v_param1)), "uint")
	return null


static func c2690_f_get_numResults(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numResults")
	return null


static func c2690_f_set_numResults(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_numResults"] = R.coerce(v_param1, "uint")
	return null


static func c2690_f_get_tag(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tag")
	return null


static func c2690_f_set_tag(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_tag"] = R.coerce(v_param1, "String")
	return null


static func c2690_f_get_page(c: Variant, a: Array) -> Variant:
	return (float(ceilf(float(R.binary("/", (float((c).fields.get("_firstResult")) - float(1)), (c).fields.get("_numResults"))))) + float(1))
	return null


static func c2690_f_prevPage(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value(c, "firstResult"), (c).fields.get("_numResults"))):
		pass
		R.set_value(c, "firstResult", (c).fields.get("_numResults"), "-=")
	return null


static func c2690_f_nextPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "firstResult", (c).fields.get("_numResults"), "+=")
	return null


static func c2690_f_loadScores(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["loadScores", R.get_value(c, "onScoresLoaded"), {"publisher_id": ((c).fields.get("_connection")).fields.get("publisherId"), "board": (c).fields.get("_id"), "page": (float(R.binary("/", (float((c).fields.get("_firstResult")) - float(1)), (c).fields.get("_numResults"))) + float(1)), "num_results": (c).fields.get("_numResults"), "period": (c).fields.get("_period"), "tag": (c).fields.get("_tag")}])
	return null


static func c2690_f_postScore(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.ScoreBoard"), [v_param1])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Cannot post invalid score: ", v_param1)])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Posting a score of ", v_param1), " by "), ((c).fields.get("_connection")).fields.get("username")), " to scoreboard \""), (c).fields.get("_name")), "\"...")])
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["postScore", R.get_value(c, "onScorePosted"), null, {"user_name": ((c).fields.get("_connection")).fields.get("username"), "board": (c).fields.get("_id"), "value": v_param1, "tag": v_param2}])
	return null


static func c2690_f_onScoresLoaded(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(null, "Object")
	v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
	(c).fields["_scores"] = R.coerce([], "Array")
	if R.truth(R.get_value(v__loc2_, "first_result")):
		pass
		v__loc3_ = R.coerce(R.coerce(R.get_value(v__loc2_, "first_result"), "uint"), "uint")
	else:
		pass
		v__loc3_ = R.coerce((c).fields.get("_firstResult"), "uint")
	if R.truth(R.get_value(v__loc2_, "scores")):
		pass
		v__loc4_ = R.coerce(0, "uint")
		while R.truth(R.binary("<", v__loc4_, R.get_value(R.get_value(v__loc2_, "scores"), "length"))):
			pass
			v__loc5_ = R.coerce(R.get_value(R.get_value(v__loc2_, "scores"), v__loc4_), "Object")
			if R.truth(v__loc5_):
				pass
				R.set_value((c).fields.get("_scores"), v__loc4_, R.construct(R.klass("com.newgrounds.Score"), [v__loc3_, R.get_value(v__loc5_, "username"), R.get_value(v__loc5_, "value"), R.get_value(v__loc5_, "numeric_value"), R.get_value(v__loc5_, "tag")]), "=")
			v__loc4_ = ((v__loc4_ + 1) & 4294967295)
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORES_LOADED"), c])])
	return null


static func c2690_f_onScorePosted(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Object")
	v__loc3_ = R.coerce(null, "Object")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["Score posted!"])
		v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
		v__loc3_ = R.coerce({}, "Object")
		R.set_value(v__loc3_, "score", R.get_value(v__loc2_, "value"), "=")
		R.set_value(v__loc3_, "scoreBoard", c, "=")
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Error posting score: ", R.get_value(v_param1, "error"))])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), v__loc3_, R.get_value(v_param1, "error")])])
	return null


static func c2690_f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", "Scoreboard: ", (c).fields.get("_name"))
	return null


static func c2691_f_DefaultMedalIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	R.invoke(R.super_ref(c, "com.newgrounds.assets.DefaultMedalIcon"), [v_param1, v_param2])
	return null


static func c2692_f_initAd(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.APIConnector"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "initAd")])
	if R.truth(R.unary("!", (c).fields.get("adType"))):
		pass
		(c).fields["adType"] = R.coerce("Video", "String")
	if R.truth((c).fields.get("ad")):
		pass
		((c).fields.get("ad")).fields["adType"] = R.coerce((c).fields.get("adType"), "String")
	var __t1 = (c).fields.get("connectorType")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, "Flash Ad + Preloader"):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, "Flash Ad Only"):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, "Invisible"):
		__t2 = 2
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.APIConnector"), ["adPreloader"])
			break
		if __t2 >= 0 and __t2 <= 1:
			pass
			R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.APIConnector"), ["ad"])
			break
		if __t2 >= 0 and __t2 <= 2:
			pass
			R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.APIConnector"), ["invisible"])
	return null


static func c2692_f__onLoaded(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mainClass": "Class", "main": "*", "error": "*"}
	l["mainClass"] = null
	l["main"] = null
	l["error"] = null
	R.lset(l, "mainClass", null)
	R.lset(l, "main", null)
	R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.APIConnector"), ["invisible"])
	if R.truth((c).fields.get("_redirect")):
		pass
		R.call_static("com.newgrounds.API", "loadOfficialVersion", [])
		return null
	if R.truth((c).fields.get("className")):
		pass
		R.last_error = null
		R.lset(l, "mainClass", R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "com.newgrounds.components.APIConnector"), [(c).fields.get("className")]), R.resolve(c, "Class", "com.newgrounds.components.APIConnector")), "=")
		if R.truth((R.truth(R.lget(l, "mainClass")) and R.truth(R.resolve(c, "parent", "com.newgrounds.components.APIConnector")))):
			pass
			R.lset(l, "main", R.construct(R.lget(l, "mainClass"), []), "=")
			R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.APIConnector"), "addChild"), [R.lget(l, "main")])
			R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.APIConnector"), "removeChild"), [c])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Unable to create main class: ", c.fields.get("className"))])
	return null


static func c2692_f__onConnected(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth((c).fields.get("loader")):
		pass
		((c).fields.get("loader")).fields["haltComplete"] = false
	if R.truth(R.logical_and(R.logical_and((c).fields.get("redirectOnNewVersion"), func(): return R.get_value(v_event, "success")), func(): return R.truth(R.get_value(R.get_value(v_event, "data"), "newVersion")))):
		pass
		(c).fields["_redirect"] = true
	if R.truth((((c).fields.get("redirectOnHostBlocked") and R.unary("!", R.get_value(v_event, "success"))) and R.binary("==", R.get_value(v_event, "error"), R.static_value("com.newgrounds.APIEvent", "ERROR_HOST_BLOCKED")))):
		pass
		(c).fields["_redirect"] = true
	if R.truth((c).fields.get("_redirect")):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.APIConnector"), ["adPreloader"])
		R.call_member(c, "forceAlwaysOnTop", [])
	return null


static func c2692_f_forceAlwaysOnTop(c: Variant, a: Array) -> Variant:
	var v_topIndex: Variant = 0
	v_topIndex = R.coerce(0, "uint")
	if R.truth(R.resolve(c, "parent", "com.newgrounds.components.APIConnector")):
		pass
		v_topIndex = R.coerce((R.num(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.APIConnector"), "numChildren")) - float(1)), "uint")
		if R.truth(R.binary("!=", R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.APIConnector"), "getChildIndex"), [c]), v_topIndex)):
			pass
			R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.APIConnector"), "setChildIndex"), [c, v_topIndex])
	if R.truth(R.resolve(c, "stage", "com.newgrounds.components.APIConnector")):
		pass
		R.assign(c, "x", "com.newgrounds.components.APIConnector", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.APIConnector"), "stageWidth")) - R.num(R.resolve(c, "width", "com.newgrounds.components.APIConnector"))), 2), "=")
		R.assign(c, "y", "com.newgrounds.components.APIConnector", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.APIConnector"), "stageHeight")) - R.num(R.resolve(c, "height", "com.newgrounds.components.APIConnector"))), 2), "=")
		R.assign(c, "visible", "com.newgrounds.components.APIConnector", true, "=")
	if R.truth((R.truth(R.resolve(c, "root", "com.newgrounds.components.APIConnector")) and R.binary("is", R.resolve(c, "root", "com.newgrounds.components.APIConnector"), R.klass("MovieClip")))):
		pass
		R.invoke(R.get_value(R.invoke(R.klass("MovieClip"), [R.resolve(c, "root", "com.newgrounds.components.APIConnector")]), "stop"), [])
	return null


static func c2693_f_onPlayClick(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "removeAd", [])
	if R.truth(R.resolve(c, "parent", "com.newgrounds.components.FlashAd")):
		pass
		R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.FlashAd"), "removeChild"), [c])
	return null


static func c2693_f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.FlashAd"), [])
	return null


static func c2693_f_frame10(c: Variant, a: Array) -> Variant:
	R.call_member(c, "initPlayButton", [])
	return null


static func c2693_f_frame20(c: Variant, a: Array) -> Variant:
	R.call_member(c, "initPlayButton", [])
	return null


static func c2694_f_get__adContainer(c: Variant, a: Array) -> Variant:
	return R.get_value(c, "adContainer")
	return null


static func c2694_f_get__newgroundsButton(c: Variant, a: Array) -> Variant:
	return R.get_value(c, "newgroundsButton")
	return null


static func c2694_f_get_fullScreen(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_fullScreen")
	return null


static func c2694_f_set_fullScreen(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_fullScreen"] = v_param1
	if R.truth(v_param1):
		pass
		if R.truth(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase")):
			pass
			R.call_member(c, "drawFullScreenRect", [])
		else:
			pass
			R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "onAddedToStage")])
	else:
		pass
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "clear"), [])
	return null


static func c2694_f_get_showBorder(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_showBorder")
	return null


static func c2694_f_init(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "init")])
	if R.truth(R.get_value(R.klass("com.newgrounds.API"), "adFeedURL")):
		pass
		R.call_member(c, "loadAdFeed", [])
	else:
		pass
		R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "loadAdFeed")])
	return null


static func c2694_f_loadAdFeed(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"adFeedRequest": "URLRequest", "event": "APIEvent", "e": "Error", "param1": "APIEvent"}
	l["adFeedRequest"] = null
	l["event"] = null
	l["e"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.lset(l, "event", R.lget(l, "param1"))
	if R.truth(R.unary("!", R.get_value(R.klass("com.newgrounds.API"), "adFeedURL"))):
		pass
		return null
	if R.truth((c).fields.get("_showBorder")):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["loading"])
	(c).fields["_adFeedLoader"] = R.coerce(R.construct(R.resolve(c, "URLLoader", "com.newgrounds.components.FlashAdBase"), []), "URLLoader")
	R.invoke(R.get_value((c).fields.get("_adFeedLoader"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onAdFeedLoaded")])
	R.invoke(R.get_value((c).fields.get("_adFeedLoader"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.components.FlashAdBase"), "IO_ERROR"), R.get_value(c, "onAdError")])
	R.invoke(R.get_value((c).fields.get("_adFeedLoader"), "addEventListener"), [R.get_value(R.resolve(c, "SecurityErrorEvent", "com.newgrounds.components.FlashAdBase"), "SECURITY_ERROR"), R.get_value(c, "onAdError")])
	R.lset(l, "adFeedRequest", R.construct(R.resolve(c, "URLRequest", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("com.newgrounds.API"), "adFeedURL")]), "=")
	R.last_error = null
	R.invoke(R.get_value((c).fields.get("_adFeedLoader"), "load"), [R.lget(l, "adFeedRequest")])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		R.call_member(c, "onAdError", [])
	return null


static func c2694_f_onAdFeedLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(((R.truth((c).fields.get("_adFeedLoader")) and R.truth(R.get_value((c).fields.get("_adFeedLoader"), "data"))) and R.binary("!=", R.get_value((c).fields.get("_adFeedLoader"), "data"), ""))):
		pass
		R.call_member(c, "loadAd", [R.get_value((c).fields.get("_adFeedLoader"), "data")])
	else:
		pass
		R.call_member(c, "onAdError", [])
	return null


static func c2694_f_loadAd(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"adURL": "String", "error": "Error", "param1": "String"}
	l["adURL"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "adURL", R.lget(l, "param1"))
	if R.truth((c).fields.get("_ad")):
		pass
		R.call_member(c, "removeAd", [])
	R.call_static("com.newgrounds.Logger", "logMessage", ["Loading flash ad..."])
	(c).fields["_ad"] = R.coerce(R.construct(R.resolve(c, "Loader", "com.newgrounds.components.FlashAdBase"), []), "Loader")
	R.invoke(R.get_value(R.get_value((c).fields.get("_ad"), "contentLoaderInfo"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.components.FlashAdBase"), "IO_ERROR"), R.get_value(c, "onAdError")])
	R.last_error = null
	R.invoke(R.get_value(R.get_value(R.invoke(R.resolve(c, "Object", "com.newgrounds.components.FlashAdBase"), [R.get_value((c).fields.get("_ad"), "contentLoaderInfo")]), "uncaughtErrorEvents"), "addEventListener"), ["uncaughtError", R.make_closure("com.newgrounds.components.FlashAdBase", "closure___t1", c, l)])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	R.last_error = null
	if R.truth(R.binary("!=", (c).fields.get("adType"), (c).fields.get("VIDEO_ADS"))):
		pass
		if R.truth(R.binary(">=", R.invoke(R.get_value(R.lget(l, "adURL"), "indexOf"), ["?"]), 0)):
			pass
			R.lset(l, "adURL", "&", "+=")
		else:
			pass
			R.lset(l, "adURL", "?", "+=")
		R.lset(l, "adURL", "blockoverlays=1", "+=")
	R.invoke(R.get_value((c).fields.get("_ad"), "load"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.components.FlashAdBase"), [R.lget(l, "adURL")]), R.construct(R.resolve(c, "LoaderContext", "com.newgrounds.components.FlashAdBase"), [false, R.construct(R.resolve(c, "ApplicationDomain", "com.newgrounds.components.FlashAdBase"), [null])])])
	if R.truth(R.get_value(c, "_adContainer")):
		pass
		R.invoke(R.get_value(R.get_value(c, "_adContainer"), "addChild"), [(c).fields.get("_ad")])
	if R.truth((c).fields.get("_showBorder")):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["loaded"])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_member(c, "onAdError", [])
	return null


static func c2694_f_drawFullScreenRect(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase")):
		pass
		R.assign(c, "x", "com.newgrounds.components.FlashAdBase", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")) - R.num(R.resolve(c, "width", "com.newgrounds.components.FlashAdBase"))), 2), "=")
		R.assign(c, "y", "com.newgrounds.components.FlashAdBase", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")) - R.num(R.resolve(c, "height", "com.newgrounds.components.FlashAdBase"))), 2), "=")
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "beginFill"), [0])
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "drawRect"), [R.unary("-", R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")), R.unary("-", R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")), (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")) * float(2)), (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")) * float(2))])
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "endFill"), [])
	return null


static func c2694_f_onAdError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_static("com.newgrounds.Logger", "logError", ["Unable to load ad."])
	R.call_member(c, "removeAd", [])
	return null


static func c2694_f_onAddedToStage(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "onAddedToStage")])
	if R.truth(R.get_value(c, "fullScreen")):
		pass
		R.call_member(c, "drawFullScreenRect", [])
	return null


static func c2694_f_onNGClick(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_static("com.newgrounds.API", "loadNewgrounds", [])
	return null


static func c2694_f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Event"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.lget(l, "param1"), "preventDefault"), [])
	return null

static func c2695_f_onMedalUnlocked(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_event, "success")):
		pass
		R.invoke(R.get_value((c).fields.get("_medalQueue"), "push"), [R.get_value(v_event, "data")])
		R.call_member(c, "showNextUnlock", [])
	return null


static func c2695_f_showNextUnlock(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlockedMedal")):
		pass
		return null
	if R.truth(R.unary("!", R.get_value((c).fields.get("_medalQueue"), "length"))):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.MedalPopup"), ["hidden"])
		R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "medalPopupEnterFrame")])
		return null
	(c).fields["_unlockedMedal"] = R.coerce(R.invoke(R.klass("com.newgrounds.Medal"), [R.invoke(R.get_value((c).fields.get("_medalQueue"), "shift"), [])]), "Medal")
	R.invoke(R.resolve(c, "gotoAndPlay", "com.newgrounds.components.MedalPopup"), ["medalUnlocked"])
	return null


static func c2695_f_medalPopupEnterFrame(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"topIndex": "uint", "error": "*", "event": "Event"}
	l["topIndex"] = 0
	l["error"] = null
	l["event"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "topIndex", 0)
	if R.truth((c).fields.get("_alwaysOnTop")):
		pass
		R.last_error = null
		if R.truth(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup")):
			pass
			R.lset(l, "topIndex", (R.num(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "numChildren")) - float(1)), "=")
			if R.truth(R.binary("!=", R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "getChildIndex"), [c]), R.lget(l, "topIndex"))):
				pass
				R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "setChildIndex"), [c, R.lget(l, "topIndex")])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "medalPopupEnterFrame", "com.newgrounds.components.MedalPopup")])
	if R.truth((c).fields.get("_medalScrollRect")):
		pass
		R.invoke(R.get_value((c).fields.get("_medalScrollRect"), "offset"), [2, 0])
		R.set_value((c).fields.get("medalNameClip"), "scrollRect", (c).fields.get("_medalScrollRect"), "=")
		if R.truth(R.binary(">=", R.get_value((c).fields.get("_medalScrollRect"), "left"), R.binary("+", R.get_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "textWidth"), 10))):
			pass
			(c).fields["_medalScrollRect"] = R.coerce(null, "Rectangle")
			R.invoke(R.resolve(c, "play", "com.newgrounds.components.MedalPopup"), [])
	return null


static func c2695_f_frame15(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlockedMedal")):
		pass
		if R.truth((R.truth((c).fields.get("medalNameClip")) and R.truth(R.get_value((c).fields.get("medalNameClip"), "textField")))):
			pass
			R.set_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "text", R.get_value((c).fields.get("_unlockedMedal"), "name"), "=")
		if R.truth((c).fields.get("medalPointsText")):
			pass
			R.set_value((c).fields.get("medalPointsText"), "text", R.invoke(R.get_value(R.get_value((c).fields.get("_unlockedMedal"), "value"), "toString"), []), "=")
		if R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "textWidth"), R.get_value((c).fields.get("medalNameClip"), "width"))):
			pass
			(c).fields["_medalScrollRect"] = R.coerce(R.construct(R.klass("Rectangle"), [R.unary("-", R.get_value((c).fields.get("medalNameClip"), "width")), 0, R.get_value((c).fields.get("medalNameClip"), "width"), R.get_value((c).fields.get("medalNameClip"), "height")]), "Rectangle")
			R.set_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "width", 1000, "=")
			R.set_value((c).fields.get("medalNameClip"), "scrollRect", (c).fields.get("_medalScrollRect"), "=")
		R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "medalPopupEnterFrame")])
	return null


static func c2695_f_frame23(c: Variant, a: Array) -> Variant:
	if R.truth((R.truth((c).fields.get("_unlockedMedal")) and R.truth((c).fields.get("medalIcon")))):
		pass
		R.call_member((c).fields.get("_unlockedMedal"), "attachIcon", [(c).fields.get("medalIcon")])
	return null


static func c2695_f_frame84(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_medalScrollRect")):
		pass
		R.invoke(R.resolve(c, "stop", "com.newgrounds.components.MedalPopup"), [])
	return null


static func c2695_f_frame105(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.MedalPopup"), [])
	(c).fields["_unlockedMedal"] = R.coerce(null, "Medal")
	R.call_member(c, "showNextUnlock", [])
	return null


static func c2696_f_enterFrameHandler(c: Variant, a: Array) -> Variant:
	var v_loaded: Variant = NAN
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_loaded = float(0)
	if R.truth(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader")):
		pass
		v_loaded = float(R.binary("/", R.get_value(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader"), "bytesLoaded"), R.get_value(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader"), "bytesTotal")))
	if R.truth((c).fields.get("loadingBar")):
		pass
		R.invoke(R.get_value((c).fields.get("loadingBar"), "gotoAndStop"), [(float(R.coerce((float(v_loaded) * float((R.num(R.get_value((c).fields.get("loadingBar"), "totalFrames")) - float(1)))), "int")) + float(1))])
	if R.truth(((float(v_loaded) >= float(1)) and R.binary("!=", (c).fields.get("haltComplete"), true))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.Preloader"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "enterFrameHandler")])
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.Preloader"), ["loaded"])
	return null


static func c2696_f__onPlayClick(c: Variant, a: Array) -> Variant:
	var v_theRoot: Variant = null
	var v_theParent: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_theRoot = R.coerce(R.binary("as", R.resolve(c, "root", "com.newgrounds.components.Preloader"), R.klass("MovieClip")), "MovieClip")
	v_theParent = R.coerce(R.binary("as", R.resolve(c, "parent", "com.newgrounds.components.Preloader"), R.klass("MovieClip")), "MovieClip")
	if R.truth(v_theRoot):
		pass
		R.invoke(R.get_value(v_theRoot, "play"), [])
		R.invoke(R.get_value(v_theRoot, "nextFrame"), [])
	if R.truth((R.truth(v_theParent) and R.truth(R.get_value(v_theParent, "_onLoaded")))):
		pass
		R.invoke(R.get_value(v_theParent, "_onLoaded"), [])
	return null


static func c2696_f_frame10(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("playButton")):
		pass
		R.invoke(R.get_value((c).fields.get("playButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onPlayClick")])
		R.invoke(R.get_value((c).fields.get("playButton"), "stop"), [])
		R.set_value((c).fields.get("playButton"), "buttonMode", true, "=")
	if R.truth((c).fields.get("autoPlay")):
		pass
		R.call_member(c, "_onPlayClick", [null])
	return null


static func c2697_f__onPageClick(c: Variant, a: Array) -> Variant:
	var v_clip: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_clip = R.coerce(R.get_value(v_event, "currentTarget"), "*")
	if R.truth((R.truth((c).fields.get("_scoreBoard")) and R.unary("!", (c).fields.get("_loading")))):
		pass
		if R.truth(R.binary("==", v_clip, (c).fields.get("prevButton"))):
			pass
			R.call_member((c).fields.get("_scoreBoard"), "prevPage", [])
		else:
			pass
			R.call_member((c).fields.get("_scoreBoard"), "nextPage", [])
		R.call_member(c, "loadScores", [])
	return null


static func c2697_f__onListChange(c: Variant, a: Array) -> Variant:
	var v_selection: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	(c).fields["period"] = R.coerce(R.get_value(v_selection, "data"), "String")
	R.call_member(c, "loadScores", [])
	return null


static func c2697_f_onScoreClick(c: Variant, a: Array) -> Variant:
	var v_scoreClip: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_scoreClip = R.coerce(R.binary("as", R.get_value(v_event, "currentTarget"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.get_value(v_scoreClip, "usernameText")):
		pass
		R.invoke(R.resolve(c, "navigateToURL", "com.newgrounds.components.ScoreBrowser"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.components.ScoreBrowser"), [R.binary("+", R.binary("+", "http://", R.get_value(R.get_value(v_scoreClip, "usernameText"), "text")), ".newgrounds.com")]), "_blank"])
	return null


static func c2697_f_onReloadClick(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "loadScores", [])
	return null


static func c2697_f_frame21(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("reloadButton")):
		pass
		R.invoke(R.get_value((c).fields.get("reloadButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "onReloadClick")])
	return null


static func c2697_f_frame30(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.ScoreBrowser"), [])
	return null


static func c2698_f_MD5(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.crypto.MD5"), [])
	return null


static func c2698_f_hash(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc2_, "writeUTFBytes"), [v_param1])
	return R.invoke(R.resolve(c, "hashBinary", "com.newgrounds.crypto.MD5"), [v__loc2_])
	return null


static func c2698_f_hashBytes(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	return R.invoke(R.resolve(c, "hashBinary", "com.newgrounds.crypto.MD5"), [v_param1])
	return null


static func c2698_f_hashBinary(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc10_: Variant = null
	var v__loc11_: Variant = 0
	var v__loc12_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v__loc6_ = R.coerce(0, "int")
	v__loc7_ = R.coerce(0, "int")
	v__loc8_ = R.coerce(0, "int")
	v__loc9_ = R.coerce(0, "int")
	v__loc2_ = R.coerce(1732584193, "int")
	v__loc3_ = R.coerce(R.unary("-", 271733879), "int")
	v__loc4_ = R.coerce(R.unary("-", 1732584194), "int")
	v__loc5_ = R.coerce(271733878, "int")
	v__loc10_ = R.coerce(R.invoke(R.resolve(c, "createBlocks", "com.newgrounds.crypto.MD5"), [v_param1]), "Array")
	v__loc11_ = R.coerce(R.coerce(R.get_value(v__loc10_, "length"), "int"), "int")
	v__loc12_ = R.coerce(0, "int")
	while R.truth((float(v__loc12_) < float(v__loc11_))):
		pass
		v__loc6_ = R.coerce(v__loc2_, "int")
		v__loc7_ = R.coerce(v__loc3_, "int")
		v__loc8_ = R.coerce(v__loc4_, "int")
		v__loc9_ = R.coerce(v__loc5_, "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 7, R.unary("-", 680876936)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 12, R.unary("-", 389564586)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 17, 606105819]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 22, R.unary("-", 1044525330)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 7, R.unary("-", 176418897)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 12, 1200080426]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 17, R.unary("-", 1473231341)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 22, R.unary("-", 45705983)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 7, 1770035416]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 12, R.unary("-", 1958414417)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 17, R.unary("-", 42063)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 22, R.unary("-", 1990404162)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 7, 1804603682]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 12, R.unary("-", 40341101)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 17, R.unary("-", 1502002290)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 22, 1236535329]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 5, R.unary("-", 165796510)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 9, R.unary("-", 1069501632)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 14, 643717713]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 20, R.unary("-", 373897302)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 5, R.unary("-", 701558691)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 9, 38016083]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 14, R.unary("-", 660478335)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 20, R.unary("-", 405537848)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 5, 568446438]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 9, R.unary("-", 1019803690)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 14, R.unary("-", 187363961)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 20, 1163531501]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 5, R.unary("-", 1444681467)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 9, R.unary("-", 51403784)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 14, 1735328473]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 20, R.unary("-", 1926607734)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 4, R.unary("-", 378558)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 11, R.unary("-", 2022574463)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 16, 1839030562]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 23, R.unary("-", 35309556)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 4, R.unary("-", 1530992060)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 11, 1272893353]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 16, R.unary("-", 155497632)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 23, R.unary("-", 1094730640)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 4, 681279174]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 11, R.unary("-", 358537222)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 16, R.unary("-", 722521979)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 23, 76029189]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 4, R.unary("-", 640364487)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 11, R.unary("-", 421815835)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 16, 530742520]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 23, R.unary("-", 995338651)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 6, R.unary("-", 198630844)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 10, 1126891415]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 15, R.unary("-", 1416354905)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 21, R.unary("-", 57434055)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 6, 1700485571]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 10, R.unary("-", 1894986606)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 15, R.unary("-", 1051523)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 21, R.unary("-", 2054922799)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 6, 1873313359]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 10, R.unary("-", 30611744)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 15, R.unary("-", 1560198380)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 21, 1309151649]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 6, R.unary("-", 145523070)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 10, R.unary("-", 1120210379)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 15, 718787259]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 21, R.unary("-", 343485551)]), "int")
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, v__loc6_), "int")
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, v__loc7_), "int")
		v__loc4_ = R.coerce(R.binary("+", v__loc4_, v__loc8_), "int")
		v__loc5_ = R.coerce(R.binary("+", v__loc5_, v__loc9_), "int")
		v__loc12_ = R.coerce(R.binary("+", v__loc12_, 16), "int")
	R.assign(c, "digest", "com.newgrounds.crypto.MD5", R.construct(R.klass("ByteArray"), []), "=")
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc2_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc3_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc4_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc5_])
	R.set_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "position", 0, "=")
	return R.binary("+", R.binary("+", R.binary("+", R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc2_]), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc3_])), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc4_])), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc5_]))
	return null


static func c2698_f_f(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("|", R.binary("&", v_param1, v_param2), R.binary("&", R.unary("~", v_param1), v_param3))
	return null


static func c2698_f_g(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("|", R.binary("&", v_param1, v_param3), R.binary("&", v_param2, R.unary("~", v_param3)))
	return null


static func c2698_f_h(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("^", R.binary("^", v_param1, v_param2), v_param3)
	return null


static func c2698_f_i(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("^", v_param2, R.binary("|", v_param1, R.unary("~", v_param3)))
	return null


static func c2698_f_transform(c: Variant, a: Array) -> Variant:
	var v__loc9_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Function")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "int")
	v__loc9_ = R.coerce((float((float((float(v_param2) + float(R.coerce(R.invoke(v_param1, [v_param3, v_param4, v_param5]), "int")))) + float(v_param6))) + float(v_param8)), "int")
	return R.binary("+", R.invoke(R.resolve(c, "rol", "com.newgrounds.crypto.MD5"), [v__loc9_, v_param7]), v_param3)
	return null


static func c2698_f_ff(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "f", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null


static func c2698_f_gg(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "g", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null


static func c2698_f_hh(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "h", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null


static func c2698_f_ii(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "i", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null


static func c2698_f_createBlocks(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce((R.num(R.get_value(v_param1, "length")) * float(8)), "int")
	v__loc4_ = R.coerce(255, "int")
	v__loc5_ = R.coerce(0, "int")
	while R.truth((float(v__loc5_) < float(v__loc3_))):
		pass
		R.set_value(v__loc2_, R.coerce(R.binary(">>", v__loc5_, 5), "int"), R.binary("|", R.get_value(v__loc2_, R.coerce(R.binary(">>", v__loc5_, 5), "int")), R.binary("<<", R.binary("&", R.get_value(v_param1, R.binary("/", v__loc5_, 8)), v__loc4_), R.binary("%", v__loc5_, 32))), "=")
		v__loc5_ = R.coerce(R.binary("+", v__loc5_, 8), "int")
	R.set_value(v__loc2_, R.coerce(R.binary(">>", v__loc3_, 5), "int"), R.binary("|", R.get_value(v__loc2_, R.coerce(R.binary(">>", v__loc3_, 5), "int")), R.binary("<<", 128, R.binary("%", v__loc3_, 32))), "=")
	R.set_value(v__loc2_, R.coerce(R.binary("+", R.binary("<<", R.binary(">>>", (float(v__loc3_) + float(64)), 9), 4), 14), "int"), v__loc3_, "=")
	return v__loc2_
	return null


static func c2698_f_rol(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return R.binary("|", R.binary("<<", v_param1, v_param2), R.binary(">>>", v_param1, (float(32) - float(v_param2))))
	return null


static func c2698_f_ror(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v__loc3_ = R.coerce((float(32) - float(v_param2)), "int")
	return R.binary("|", R.binary("<<", v_param1, v__loc3_), R.binary(">>>", v_param1, (float(32) - float(v__loc3_))))
	return null


static func c2698_f_toHex(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v__loc4_ = R.coerce(0, "int")
	v__loc5_ = R.coerce(0, "int")
	v__loc3_ = R.coerce("", "String")
	if R.truth(v_param2):
		pass
		v__loc4_ = R.coerce(0, "int")
		while R.truth((float(v__loc4_) < float(4))):
			pass
			v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.binary("+", R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float((float(3) - float(v__loc4_))) * float(8))) + float(4))), 15)]), R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float(3) - float(v__loc4_))) * float(8))), 15)]))), "String")
			v__loc4_ = R.signed32(v__loc4_ + 1)
	else:
		pass
		v__loc5_ = R.coerce(0, "int")
		while R.truth((float(v__loc5_) < float(4))):
			pass
			v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.binary("+", R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float(v__loc5_) * float(8))) + float(4))), 15)]), R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float(v__loc5_) * float(8))), 15)]))), "String")
			v__loc5_ = R.signed32(v__loc5_ + 1)
	return v__loc3_
	return null


static func c2699_f_RC4(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.crypto.RC4"), [])
	return null


static func c2699_f_encrypt(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_]), "Array")
	return R.invoke(R.resolve(c, "charsToHex", "com.newgrounds.crypto.RC4"), [v__loc5_])
	return null


static func c2699_f_encryptbin(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	return R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_])
	return null


static func c2699_f_decrypt(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hexToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_]), "Array")
	return R.invoke(R.resolve(c, "charsToStr", "com.newgrounds.crypto.RC4"), [v__loc5_])
	return null


static func c2699_f_initialize(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc2_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc3_ = R.coerce(0, "uint")
	v__loc2_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(R.get_value(v_param1, "length"), "uint")
	v__loc5_ = R.coerce(0, "uint")
	while R.truth((float(v__loc5_) <= float(255))):
		pass
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "mykey"), v__loc5_, R.get_value(v_param1, R.binary("%", v__loc5_, v__loc4_)), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_, v__loc5_, "=")
		v__loc5_ = ((v__loc5_ + 1) & 4294967295)
	v__loc5_ = R.coerce(0, "uint")
	while R.truth((float(v__loc5_) <= float(255))):
		pass
		v__loc2_ = R.coerce(R.binary("%", R.binary("+", R.binary("+", v__loc2_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_)), R.get_value(R.static_value("com.newgrounds.crypto.RC4", "mykey"), v__loc5_)), 256), "uint")
		v__loc3_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_), "uint"), "uint")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc2_), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc2_, v__loc3_, "=")
		v__loc5_ = ((v__loc5_ + 1) & 4294967295)
	return null


static func c2699_f_calculate(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc9_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v__loc6_ = R.coerce(0, "uint")
	v__loc7_ = R.coerce(0, "uint")
	v__loc8_ = R.coerce(0, "uint")
	v__loc10_ = R.coerce(0, "uint")
	R.invoke(R.resolve(c, "initialize", "com.newgrounds.crypto.RC4"), [v_param2])
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc9_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc9_, R.get_value(v_param1, "length"))):
		pass
		v__loc3_ = R.coerce(R.binary("%", (float(v__loc3_) + float(1)), 256), "uint")
		v__loc4_ = R.coerce(R.binary("%", R.binary("+", v__loc4_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_)), 256), "uint")
		v__loc7_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_), "uint"), "uint")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_, v__loc7_, "=")
		v__loc10_ = R.coerce(R.binary("%", R.binary("+", R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_), R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_)), 256), "uint")
		v__loc6_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc10_), "uint"), "uint")
		v__loc8_ = R.coerce(R.coerce(R.binary("^", R.get_value(v_param1, v__loc9_), v__loc6_), "uint"), "uint")
		R.invoke(R.get_value(v__loc5_, "push"), [v__loc8_])
		v__loc9_ = ((v__loc9_ + 1) & 4294967295)
	return v__loc5_
	return null


static func c2699_f_charsToHex(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc2_ = R.coerce(R.construct(R.klass("String"), [""]), "String")
	v__loc3_ = R.coerce(R.construct(R.klass("Array"), ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]), "Array")
	v__loc4_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc4_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.binary("+", R.get_value(v__loc3_, R.binary(">>", R.get_value(v_param1, v__loc4_), 4)), R.get_value(v__loc3_, R.binary("&", R.get_value(v_param1, v__loc4_), 15)))), "String")
		v__loc4_ = ((v__loc4_ + 1) & 4294967295)
	return v__loc2_
	return null


static func c2699_f_hexToChars(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce((2 if R.truth(R.binary("==", R.invoke(R.get_value(v_param1, "substr"), [0, 2]), "0x")) else 0), "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		R.invoke(R.get_value(v__loc2_, "push"), [R.invoke(R.resolve(c, "parseInt", "com.newgrounds.crypto.RC4"), [R.invoke(R.get_value(v_param1, "substr"), [v__loc3_, 2]), 16])])
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, 2), "uint")
	return v__loc2_
	return null


static func c2699_f_charsToStr(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc2_ = R.coerce(R.construct(R.klass("String"), [""]), "String")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(v_param1, v__loc3_)])), "String")
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null


static func c2699_f_strToChars(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		R.invoke(R.get_value(v__loc2_, "push"), [R.invoke(R.get_value(v_param1, "charCodeAt"), [v__loc3_])])
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null


static func c2700_f_BaseN(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.BaseN"), [])
	if R.truth(v_param1):
		pass
		(c).fields["_hash"] = R.coerce(v_param1, "String")
	else:
		pass
		(c).fields["_hash"] = R.coerce(R.static_value("com.newgrounds.encoders.BaseN", "DEFAULT_HASH"), "String")
	(c).fields["_base"] = R.coerce(R.get_value((c).fields.get("_hash"), "length"), "uint")
	(c).fields["_reverseHash"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "com.newgrounds.encoders.BaseN"), []), "Dictionary")
	v__loc2_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc2_, R.get_value((c).fields.get("_hash"), "length"))):
		pass
		R.set_value((c).fields.get("_reverseHash"), R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [v__loc2_]), v__loc2_, "=")
		v__loc2_ = ((v__loc2_ + 1) & 4294967295)
	return null


static func c2700_f_encodeUint(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 1), "uint")
	v__loc3_ = R.coerce("", "String")
	v__loc4_ = R.coerce(v_param1, "uint")
	while R.truth((float(v__loc4_) != float(0))):
		pass
		v__loc3_ = R.coerce(R.binary("+", R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [R.binary("%", v__loc4_, (c).fields.get("_base"))]), v__loc3_), "String")
		v__loc4_ = R.coerce(R.binary("/", v__loc4_, (c).fields.get("_base")), "uint")
	while R.truth(R.binary("<", R.get_value(v__loc3_, "length"), v_param2)):
		pass
		v__loc3_ = R.coerce(R.binary("+", R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [0]), v__loc3_), "String")
	return v__loc3_
	return null


static func c2700_f_decodeUint(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(0, "uint")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("*", v__loc2_, (c).fields.get("_base")), "uint")
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.get_value((c).fields.get("_reverseHash"), R.invoke(R.get_value(v_param1, "charAt"), [v__loc3_]))), "uint")
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null


static func c2701_f_PNGEncoder(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.PNGEncoder"), [])
	return null


static func c2701_f_encode(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	v__loc6_ = R.coerce(0, "uint")
	v__loc7_ = R.coerce(0, "int")
	v__loc2_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc2_, "writeUnsignedInt"), [2303741511])
	R.invoke(R.get_value(v__loc2_, "writeUnsignedInt"), [218765834])
	v__loc3_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc3_, "writeInt"), [R.get_value(v_param1, "width")])
	R.invoke(R.get_value(v__loc3_, "writeInt"), [R.get_value(v_param1, "height")])
	R.invoke(R.get_value(v__loc3_, "writeUnsignedInt"), [134610944])
	R.invoke(R.get_value(v__loc3_, "writeByte"), [0])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229472850, v__loc3_])
	v__loc4_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	v__loc5_ = R.coerce(0, "int")
	while R.truth(R.binary("<", v__loc5_, R.get_value(v_param1, "height"))):
		pass
		R.invoke(R.get_value(v__loc4_, "writeByte"), [0])
		if R.truth(R.unary("!", R.get_value(v_param1, "transparent"))):
			pass
			v__loc7_ = R.coerce(0, "int")
			while R.truth(R.binary("<", v__loc7_, R.get_value(v_param1, "width"))):
				pass
				v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "getPixel"), [v__loc7_, v__loc5_]), "uint")
				R.invoke(R.get_value(v__loc4_, "writeUnsignedInt"), [R.coerce(R.binary("|", R.binary("<<", R.binary("&", v__loc6_, 16777215), 8), 255), "uint")])
				v__loc7_ = R.signed32(v__loc7_ + 1)
		else:
			pass
			v__loc7_ = R.coerce(0, "int")
			while R.truth(R.binary("<", v__loc7_, R.get_value(v_param1, "width"))):
				pass
				v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "getPixel32"), [v__loc7_, v__loc5_]), "uint")
				R.invoke(R.get_value(v__loc4_, "writeUnsignedInt"), [R.coerce(R.binary("|", R.binary("<<", R.binary("&", v__loc6_, 16777215), 8), R.binary(">>>", v__loc6_, 24)), "uint")])
				v__loc7_ = R.signed32(v__loc7_ + 1)
		v__loc5_ = R.signed32(v__loc5_ + 1)
	R.invoke(R.get_value(v__loc4_, "compress"), [])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229209940, v__loc4_])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229278788, null])
	return v__loc2_
	return null


static func c2701_f_writeChunk(c: Variant, a: Array) -> Variant:
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "ByteArray")
	v__loc8_ = R.coerce(0, "uint")
	v__loc9_ = R.coerce(0, "uint")
	v__loc10_ = R.coerce(0, "uint")
	if R.truth(R.unary("!", R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTableComputed"))):
		pass
		R.assign(c, "crcTableComputed", "com.newgrounds.encoders.PNGEncoder", true, "=")
		R.assign(c, "crcTable", "com.newgrounds.encoders.PNGEncoder", [], "=")
		v__loc9_ = R.coerce(0, "uint")
		while R.truth((float(v__loc9_) < float(256))):
			pass
			v__loc8_ = R.coerce(v__loc9_, "uint")
			v__loc10_ = R.coerce(0, "uint")
			while R.truth((float(v__loc10_) < float(8))):
				pass
				if R.truth(R.binary("&", v__loc8_, 1)):
					pass
					v__loc8_ = R.coerce(R.coerce(R.binary("^", R.coerce(3988292384, "uint"), R.coerce(R.binary(">>>", v__loc8_, 1), "uint")), "uint"), "uint")
				else:
					pass
					v__loc8_ = R.coerce(R.coerce(R.binary(">>>", v__loc8_, 1), "uint"), "uint")
				v__loc10_ = ((v__loc10_ + 1) & 4294967295)
			R.set_value(R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTable"), v__loc9_, v__loc8_, "=")
			v__loc9_ = ((v__loc9_ + 1) & 4294967295)
	v__loc4_ = R.coerce(0, "uint")
	if R.truth(R.binary("!=", v_param3, null)):
		pass
		v__loc4_ = R.coerce(R.get_value(v_param3, "length"), "uint")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v__loc4_])
	v__loc5_ = R.coerce(R.get_value(v_param1, "position"), "uint")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v_param2])
	if R.truth(R.binary("!=", v_param3, null)):
		pass
		R.invoke(R.get_value(v_param1, "writeBytes"), [v_param3])
	v__loc6_ = R.coerce(R.get_value(v_param1, "position"), "uint")
	R.set_value(v_param1, "position", v__loc5_, "=")
	v__loc8_ = R.coerce(4294967295, "uint")
	v__loc7_ = R.coerce(0, "int")
	while R.truth((float(v__loc7_) < float((float(v__loc6_) - float(v__loc5_))))):
		pass
		v__loc8_ = R.coerce(R.coerce(R.binary("^", R.get_value(R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTable"), R.binary("&", R.binary("^", v__loc8_, R.invoke(R.get_value(v_param1, "readUnsignedByte"), [])), R.coerce(255, "uint"))), R.coerce(R.binary(">>>", v__loc8_, 8), "uint")), "uint"), "uint")
		v__loc7_ = R.signed32(v__loc7_ + 1)
	v__loc8_ = R.coerce(R.coerce(R.binary("^", v__loc8_, R.coerce(4294967295, "uint")), "uint"), "uint")
	R.set_value(v_param1, "position", v__loc6_, "=")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v__loc8_])
	return null


static func c2702_f_JSON(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.json.JSON"), [])
	return null


static func c2702_f_encode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	return R.invoke(R.klass("com.newgrounds.encoders.json.encodeJson"), [v_param1])
	return null


static func c2702_f_decode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.invoke(R.klass("com.newgrounds.encoders.json.decodeJson"), [v_param1])
	return null


static func c2703_f_initDecodeJson(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "parseStringEscaped": "Function", "position": "uint", "byteInput": "ByteArray", "char": "uint", "charConvert": "ByteArray", "isNumberChar": "ByteArray", "stringHelper": "ByteArray", "isWhitespace": "ByteArray", "parseNumber": "Function", "parseWhitespace": "Function", "parse": "Object"}
	l["i"] = 0
	l["parseStringEscaped"] = null
	l["position"] = 0
	l["byteInput"] = null
	l["char"] = 0
	l["charConvert"] = null
	l["isNumberChar"] = null
	l["stringHelper"] = null
	l["isWhitespace"] = null
	l["parseNumber"] = null
	l["parseWhitespace"] = null
	l["parse"] = null
	R.lset(l, "position", 0)
	R.lset(l, "byteInput", null)
	R.lset(l, "char", 0)
	R.lset(l, "charConvert", null)
	R.lset(l, "isNumberChar", null)
	R.lset(l, "stringHelper", null)
	R.lset(l, "isWhitespace", null)
	R.lset(l, "parseNumber", null)
	R.lset(l, "parseWhitespace", null)
	R.lset(l, "parse", null)
	R.lset(l, "charConvert", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "charConvert"), "length", 256, "=")
	R.set_value(R.lget(l, "charConvert"), 34, 34, "=")
	R.set_value(R.lget(l, "charConvert"), 92, 92, "=")
	R.set_value(R.lget(l, "charConvert"), 47, 47, "=")
	R.set_value(R.lget(l, "charConvert"), 98, 8, "=")
	R.set_value(R.lget(l, "charConvert"), 102, 12, "=")
	R.set_value(R.lget(l, "charConvert"), 110, 10, "=")
	R.set_value(R.lget(l, "charConvert"), 114, 13, "=")
	R.set_value(R.lget(l, "charConvert"), 116, 9, "=")
	R.lset(l, "isNumberChar", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "isNumberChar"), "length", 256, "=")
	R.set_value(R.lget(l, "isNumberChar"), 43, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 45, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 46, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 48, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 49, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 50, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 51, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 52, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 53, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 54, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 55, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 56, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 57, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 69, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 101, 1, "=")
	R.lset(l, "stringHelper", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "stringHelper"), "length", 256, "=")
	R.lset(l, "i", 0, "=")
	while R.truth((float(R.lget(l, "i")) < float(256))):
		pass
		R.set_value(R.lget(l, "stringHelper"), R.binary("-", R.lset(l, "i", 1, "+="), 1), 1, "=")
	R.set_value(R.lget(l, "stringHelper"), 34, 0, "=")
	R.set_value(R.lget(l, "stringHelper"), 92, 0, "=")
	R.lset(l, "isWhitespace", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "isWhitespace"), "length", 256, "=")
	R.set_value(R.lget(l, "isWhitespace"), 9, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 10, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 13, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 32, 1, "=")
	R.lset(l, "parseNumber", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t1", c, l), "=")
	R.lset(l, "parseWhitespace", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t2", c, l), "=")
	R.lset(l, "parseStringEscaped", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t3", c, l), "=")
	R.lset(l, "parse", R.object_value([["34", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t4", c, l)], ["123", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t5", c, l)], ["91", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t7", c, l)], ["116", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t9", c, l)], ["102", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t10", c, l)], ["110", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t11", c, l)], ["110", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t12", c, l)], ["125", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t13", c, l)], ["44", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t14", c, l)], ["45", R.lget(l, "parseNumber")], ["48", R.lget(l, "parseNumber")], ["49", R.lget(l, "parseNumber")], ["50", R.lget(l, "parseNumber")], ["51", R.lget(l, "parseNumber")], ["52", R.lget(l, "parseNumber")], ["53", R.lget(l, "parseNumber")], ["54", R.lget(l, "parseNumber")], ["55", R.lget(l, "parseNumber")], ["56", R.lget(l, "parseNumber")], ["57", R.lget(l, "parseNumber")], ["13", R.lget(l, "parseWhitespace")], ["10", R.lget(l, "parseWhitespace")], ["9", R.lget(l, "parseWhitespace")], ["32", R.lget(l, "parseWhitespace")]]), "=")
	return R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t15", c, l)
	return null


static func c2703_f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(R.binary("===", R.lget(l, "position"), 1)):
		pass
		R.set_value(R.lget(l, "byteInput"), "position", 0, "=")
		return R.invoke(R.resolve(c, "parseFloat", "com.newgrounds.encoders.json.decodeJson"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteInput"), "length")])])
	R.set_value(R.lget(l, "byteInput"), "position", (R.num(R.lget(l, "position")) - float(1)), "=")
	while R.truth(R.get_value(R.lget(l, "isNumberChar"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
		pass
		pass
	return R.num(R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.binary("+", R.lset(l, "position", 1, "-="), 1)) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))) - float(1))]))
	return null


static func c2703_f_closure___t2(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	return R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), [])
	return null


static func c2703_f_closure___t3(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "String"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	while R.truth(true):
		pass
		if R.truth(R.binary("===", R.lset(l, "char", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), "="), 117)):
			pass
			R.set_value(R.lget(l, "byteInput"), "position", R.lget(l, "position"), "=")
			R.lset(l, "char", R.invoke(R.resolve(c, "parseInt", "com.newgrounds.encoders.json.decodeJson"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [4]), 16]), "=")
			R.lset(l, "position", R.binary("+", R.lget(l, "position"), 4), "=")
		else:
			pass
			if R.truth(R.unary("!", R.lset(l, "char", R.get_value(R.lget(l, "charConvert"), R.lget(l, "char")), "="))):
				pass
				break
			R.set_value(R.lget(l, "byteInput"), "position", R.lget(l, "position"), "=")
		R.lset(l, "param1", R.binary("+", R.lget(l, "param1"), R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.lget(l, "char")])), "=")
		while R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
			pass
			pass
		if R.truth(R.binary(">", (R.num(R.lget(l, "position")) - float(1)), R.get_value(R.lget(l, "byteInput"), "position"))):
			pass
			R.lset(l, "param1", R.binary("+", R.lget(l, "param1"), R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])), "=")
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
			pass
			return R.lget(l, "param1")
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unknown escaped character encountered at position ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null


static func c2703_f_closure___t4(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
		pass
		R.set_value(R.lget(l, "byteInput"), "position", (R.num(R.lget(l, "position")) - float(1)), "=")
		while R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
			pass
			pass
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
			pass
			return R.invoke(R.lget(l, "parseStringEscaped"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])])
		return R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
		pass
		return R.invoke(R.lget(l, "parseStringEscaped"), [""])
	return ""
	return null


static func c2703_f_closure___t5(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc2_": "*", "_loc1_": "*"}
	l["_loc2_"] = null
	l["_loc1_"] = null
	R.lset(l, "_loc2_", null)
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 125)):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
		return {}
	R.lset(l, "_loc1_", {})
	while R.truth(true):
		pass
		var __t6 = true
		while __t6 or R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			__t6 = false
			R.lset(l, "_loc2_", R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 58)):
				pass
				while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
					pass
					R.binary("-", R.lset(l, "position", 1, "+="), 1)
				if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 58)):
					pass
					break
			else:
				pass
				R.binary("-", R.lset(l, "position", 1, "+="), 1)
			R.set_value(R.lget(l, "_loc1_"), R.lget(l, "_loc2_"), R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 125)):
			pass
			return R.lget(l, "_loc1_")
		while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
			pass
			R.binary("-", R.lset(l, "position", 1, "+="), 1)
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 125)):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected , or } at ", (R.num(R.lget(l, "position")) - float(1)))]))
			return R.lget(l, "_loc1_")
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected : at ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null


static func c2703_f_closure___t7(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc1_": "*"}
	l["_loc1_"] = null
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 93)):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
		return []
	R.lset(l, "_loc1_", [])
	while R.truth(true):
		pass
		var __t8 = true
		while __t8 or R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			__t8 = false
			R.set_value(R.lget(l, "_loc1_"), R.get_value(R.lget(l, "_loc1_"), "length"), R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 93)):
			pass
			break
		R.binary("+", R.lset(l, "position", 1, "-="), 1)
		while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
			pass
			R.binary("-", R.lset(l, "position", 1, "+="), 1)
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 93)):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected , or ] at ", (R.num(R.lget(l, "position")) - float(1)))]))
			return R.lget(l, "_loc1_")
	return R.lget(l, "_loc1_")
	return null


static func c2703_f_closure___t9(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 114) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 117)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 101))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 3), "=")
		return true
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"true\" at position ", R.lget(l, "position"))]))
	return null


static func c2703_f_closure___t10(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth((((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 97) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 108)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 115)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 3)), 101))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 4), "=")
		return false
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"false\" at position ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null


static func c2703_f_closure___t11(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 117) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 108)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 108))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 3), "=")
		return null
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"null\" at position ", R.lget(l, "position"))]))
	return null


static func c2703_f_closure___t12(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected end of array at ", R.lget(l, "position"))]))
	return null


static func c2703_f_closure___t13(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected end of object at ", R.lget(l, "position"))]))
	return null


static func c2703_f_closure___t14(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected comma at ", R.lget(l, "position"))]))
	return null


static func c2703_f_closure___t15(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"input": "*", "e": "TypeError", "param1": "*"}
	l["input"] = null
	l["e"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.lset(l, "input", R.lget(l, "param1"))
	if R.truth(R.binary("is", R.lget(l, "input"), R.klass("String"))):
		pass
		R.lset(l, "byteInput", R.construct(R.klass("ByteArray"), []), "=")
		R.invoke(R.get_value(R.lget(l, "byteInput"), "writeUTFBytes"), [R.binary("as", R.lget(l, "input"), R.klass("String"))])
	else:
		pass
		if R.truth(R.unary("!", R.binary("is", R.lget(l, "input"), R.klass("ByteArray")))):
			pass
			return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", R.binary("+", "Unexpected input <", R.lget(l, "input")), ">")]))
		R.lset(l, "byteInput", R.binary("as", R.lget(l, "input"), R.klass("ByteArray")), "=")
	R.lset(l, "position", 0, "=")
	R.last_error = null
	return R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), [])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		if R.truth(R.binary("<", (R.num(R.lget(l, "position")) - float(1)), R.get_value(R.lget(l, "byteInput"), "length"))):
			pass
			R.set_value(R.lget(l, "e"), "message", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Unexpected character ", R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1)))])), " (0x"), R.invoke(R.get_value(R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), "toString"), [16])), ")"), " at position "), (R.num(R.lget(l, "position")) - float(1))), " ("), R.get_value(R.lget(l, "e"), "message")), ")"), "=")
		return R.raise_error(R.lget(l, "e"))
	return null

static func c2704_f_initDecodeJson(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"parseArray": "Function", "result": "IDataOutput", "i": "int", "j": "int", "strLen": "int", "str": "String", "char": "int", "tempBytes": "ByteArray", "blockNonFiniteNumbers": "Boolean", "charConvert": "Array", "parseString": "Function", "parse": "Object"}
	l["parseArray"] = null
	l["result"] = null
	l["i"] = 0
	l["j"] = 0
	l["strLen"] = 0
	l["str"] = null
	l["char"] = 0
	l["tempBytes"] = null
	l["blockNonFiniteNumbers"] = false
	l["charConvert"] = null
	l["parseString"] = null
	l["parse"] = null
	R.lset(l, "result", null)
	R.lset(l, "i", 0)
	R.lset(l, "j", 0)
	R.lset(l, "strLen", 0)
	R.lset(l, "str", null)
	R.lset(l, "char", 0)
	R.lset(l, "tempBytes", null)
	R.lset(l, "blockNonFiniteNumbers", false)
	R.lset(l, "charConvert", null)
	R.lset(l, "parseString", null)
	R.lset(l, "parse", null)
	R.lset(l, "tempBytes", R.construct(R.klass("ByteArray"), []), "=")
	R.lset(l, "charConvert", R.construct(R.klass("Array"), [256]), "=")
	R.lset(l, "j", 0, "=")
	while R.truth((float(R.lget(l, "j")) < float(10))):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", (float(R.lget(l, "j")) + float(48)), 808464384), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth((float(R.lget(l, "j")) < float(16))):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", (float(R.lget(l, "j")) + float(55)), 808464384), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth((float(R.lget(l, "j")) < float(26))):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", (float(R.lget(l, "j")) + float(32)), 808464640), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth((float(R.lget(l, "j")) < float(32))):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", (float(R.lget(l, "j")) + float(39)), 808464640), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth((float(R.lget(l, "j")) < float(256))):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.lget(l, "j"), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	R.set_value(R.lget(l, "charConvert"), 10, 23662, "=")
	R.set_value(R.lget(l, "charConvert"), 13, 23666, "=")
	R.set_value(R.lget(l, "charConvert"), 9, 23668, "=")
	R.set_value(R.lget(l, "charConvert"), 8, 23650, "=")
	R.set_value(R.lget(l, "charConvert"), 12, 23654, "=")
	R.set_value(R.lget(l, "charConvert"), 8, 23650, "=")
	R.set_value(R.lget(l, "charConvert"), 34, 23586, "=")
	R.set_value(R.lget(l, "charConvert"), 92, 23644, "=")
	R.set_value(R.lget(l, "charConvert"), 127, 808466246, "=")
	R.lset(l, "parseArray", R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t1", c, l), "=")
	R.lset(l, "parseString", R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t2", c, l), "=")
	R.lset(l, "parse", {"object": R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t3", c, l), "string": R.lget(l, "parseString"), "number": R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t5", c, l), "boolean": R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t6", c, l), "xml": R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t7", c, l), "undefined": R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t8", c, l)}, "=")
	return R.make_closure("com.newgrounds.encoders.json.encodeJson", "closure___t9", c, l)
	return null


static func c2704_f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc2_": "*", "_loc3_": "int", "param1": "Array"}
	l["_loc2_"] = null
	l["_loc3_"] = 0
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Array")
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [91])
	R.lset(l, "_loc2_", 0)
	R.lset(l, "_loc3_", (R.num(R.get_value(R.lget(l, "param1"), "length")) - float(1)))
	if R.truth((float(R.lget(l, "_loc3_")) >= float(0))):
		pass
		while R.truth(R.binary("<", R.lget(l, "_loc2_"), R.lget(l, "_loc3_"))):
			pass
			R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_"))])
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [44])
			R.binary("-", R.lset(l, "_loc2_", 1, "+="), 1)
		R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_"))])
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [93])
	return null


static func c2704_f_closure___t2(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "String"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [34])
	R.set_value(R.lget(l, "tempBytes"), "position", 0, "=")
	R.set_value(R.lget(l, "tempBytes"), "length", 0, "=")
	R.invoke(R.get_value(R.lget(l, "tempBytes"), "writeUTFBytes"), [R.lget(l, "param1")])
	R.lset(l, "i", 0, "=")
	R.lset(l, "j", 0, "=")
	R.lset(l, "strLen", R.get_value(R.lget(l, "tempBytes"), "length"), "=")
	while R.truth(R.binary("<", R.lget(l, "j"), R.lget(l, "strLen"))):
		pass
		R.lset(l, "char", R.get_value(R.lget(l, "charConvert"), R.get_value(R.lget(l, "tempBytes"), R.binary("-", R.lset(l, "j", 1, "+="), 1))), "=")
		if R.truth(R.binary(">", R.lget(l, "char"), 256)):
			pass
			if R.truth(R.binary(">", (R.num(R.lget(l, "j")) - float(1)), R.lget(l, "i"))):
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeBytes"), [R.lget(l, "tempBytes"), R.lget(l, "i"), (float((R.num(R.lget(l, "j")) - float(1))) - R.num(R.lget(l, "i")))])
			if R.truth(R.binary(">", R.lget(l, "char"), 65536)):
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeShort"), [23669])
				R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [R.lget(l, "char")])
			else:
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeShort"), [R.lget(l, "char")])
			R.lset(l, "i", R.lget(l, "j"), "=")
	if R.truth(R.binary(">", R.lget(l, "strLen"), R.lget(l, "i"))):
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeBytes"), [R.lget(l, "tempBytes"), R.lget(l, "i"), (R.num(R.lget(l, "strLen")) - R.num(R.lget(l, "i")))])
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [34])
	return null


static func c2704_f_closure___t3(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc2_": "*", "param1": "Object"}
	l["_loc2_"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.lset(l, "_loc2_", null)
	if R.truth(R.lget(l, "param1")):
		pass
		if R.truth(R.binary("is", R.lget(l, "param1"), R.klass("Array"))):
			pass
			R.invoke(R.lget(l, "parseArray"), [R.lget(l, "param1")])
		else:
			pass
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [123])
			R.lset(l, "_loc2_", true, "=")
			for __t4 in R.iterate(R.lget(l, "param1"), false):
				R.lset(l, "str", __t4, "=")
				if R.truth(R.lget(l, "_loc2_")):
					pass
					R.lset(l, "_loc2_", false, "=")
				else:
					pass
					R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [44])
				R.invoke(R.lget(l, "parseString"), [R.lget(l, "str")])
				R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [58])
				R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "str")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "str"))])
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [125])
	else:
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1853189228])
	return null


static func c2704_f_closure___t5(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Number"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.logical_and(R.lget(l, "blockNonFiniteNumbers"), func(): return R.unary("!", R.invoke(R.resolve(c, "isFinite", "com.newgrounds.encoders.json.encodeJson"), [R.lget(l, "param1")])))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), [R.binary("+", R.binary("+", "Number ", R.lget(l, "param1")), " is not encodable")]))
	R.invoke(R.get_value(R.lget(l, "result"), "writeUTFBytes"), [R.string(R.lget(l, "param1"))])
	return null


static func c2704_f_closure___t6(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Boolean"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.lget(l, "param1")):
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1953658213])
	else:
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [102])
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1634497381])
	return null


static func c2704_f_closure___t7(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Object"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth((R.binary("is", R.unary("!", R.get_value(R.lget(l, "param1"), "toXMLString")), R.resolve(c, "Function", "com.newgrounds.encoders.json.encodeJson")) or R.binary("==", R.lset(l, "param1", R.binary("as", R.invoke(R.get_value(R.lget(l, "param1"), "toXMLString"), []), R.klass("String")), "="), null))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), ["unserializable XML object encountered"]))
	R.invoke(R.lget(l, "parseString"), [R.lget(l, "param1")])
	return null


static func c2704_f_closure___t8(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Boolean"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1853189228])
	return null


static func c2704_f_closure___t9(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"byteOutput": "*", "input": "Object", "writeTo": "IDataOutput", "strictNumberSupport": "Boolean", "e": "TypeError", "param1": "Object", "param2": "IDataOutput", "param3": "Boolean"}
	l["byteOutput"] = null
	l["input"] = null
	l["writeTo"] = null
	l["strictNumberSupport"] = false
	l["e"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "IDataOutput")
	l["param3"] = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.lset(l, "byteOutput", null)
	R.lset(l, "input", R.lget(l, "param1"))
	R.lset(l, "writeTo", R.lget(l, "param2"))
	R.lset(l, "strictNumberSupport", R.lget(l, "param3"))
	R.lset(l, "blockNonFiniteNumbers", R.lget(l, "strictNumberSupport"), "=")
	R.last_error = null
	if R.truth(R.lget(l, "writeTo")):
		pass
		R.lset(l, "result", R.lget(l, "writeTo"), "=")
		R.set_value(R.lget(l, "result"), "endian", "bigEndian", "=")
		R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.lget(l, "input"))), [R.lget(l, "input")])
		R.set_value(R.lget(l, "byteOutput"), "position", 0, "=")
		return R.invoke(R.get_value(R.lget(l, "byteOutput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteOutput"), "length")])
	var __t10 = R.unary("typeof", R.lget(l, "input"))
	var __t11 = -1
	if __t11 == -1 and R.binary("===", __t10, "xml"):
		__t11 = 0
	if __t11 == -1 and R.binary("===", __t10, "object"):
		__t11 = 1
	if __t11 == -1 and R.binary("===", __t10, "string"):
		__t11 = 2
	if __t11 == -1 and R.binary("===", __t10, "number"):
		__t11 = 3
	if __t11 == -1 and R.binary("===", __t10, "boolean"):
		__t11 = 4
	if __t11 == -1 and R.binary("===", __t10, "undefined"):
		__t11 = 5
	if __t11 == -1:
		__t11 = 6
	for __case__t11 in [0]:
		if __t11 >= 0 and __t11 <= 0:
			pass
			if R.truth((R.binary("is", R.unary("!", R.get_value(R.lget(l, "input"), "toXMLString")), R.resolve(c, "Function", "com.newgrounds.encoders.json.encodeJson")) or R.binary("==", R.lset(l, "input", R.binary("as", R.invoke(R.get_value(R.lget(l, "input"), "toXMLString"), []), R.klass("String")), "="), null))):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), ["unserializable XML object encountered"]))
			break
		if __t11 >= 0 and __t11 <= 1:
			pass
		if __t11 >= 0 and __t11 <= 2:
			pass
			break
		if __t11 >= 0 and __t11 <= 3:
			pass
			if R.truth(R.logical_and(R.lget(l, "blockNonFiniteNumbers"), func(): return R.unary("!", R.invoke(R.resolve(c, "isFinite", "com.newgrounds.encoders.json.encodeJson"), [R.binary("as", R.lget(l, "input"), R.klass("Number"))])))):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), [R.binary("+", R.binary("+", "Number ", R.lget(l, "input")), " is not encodable")]))
			return R.string(R.lget(l, "input"))
			break
		if __t11 >= 0 and __t11 <= 4:
			pass
			return ("true" if R.truth(R.lget(l, "input")) else "false")
		if __t11 >= 0 and __t11 <= 5:
			pass
			return "null"
		if __t11 >= 0 and __t11 <= 6:
			pass
			return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), [R.binary("+", R.binary("+", "Unexpected type \"", R.unary("typeof", R.lget(l, "input"))), "\" encountered")]))
	R.lset(l, "result", R.lset(l, "byteOutput", R.construct(R.klass("ByteArray"), []), "="), "=")
	R.set_value(R.lget(l, "result"), "endian", "bigEndian", "=")
	R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.lget(l, "input"))), [R.lget(l, "input")])
	R.set_value(R.lget(l, "byteOutput"), "position", 0, "=")
	return R.invoke(R.get_value(R.lget(l, "byteOutput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteOutput"), "length")])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.encodeJson"), ["Unexpected type encountered"]))
	return null

static func c2708_f_BaseButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.BaseButton"), [])
	R.assign(c, "buttonMode", "fl.controls.BaseButton", true, "=")
	R.assign(c, "mouseChildren", "fl.controls.BaseButton", false, "=")
	R.assign(c, "useHandCursor", "fl.controls.BaseButton", false, "=")
	R.call_member(c, "setupMouseEvents", [])
	R.call_member(c, "setMouseState", ["up"])
	(c).fields["pressTimer"] = R.coerce(R.construct(R.resolve(c, "Timer", "fl.controls.BaseButton"), [1, 0]), "Timer")
	R.invoke(R.get_value((c).fields.get("pressTimer"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "fl.controls.BaseButton"), "TIMER"), R.get_value(c, "buttonDown"), false, 0, true])
	return null


static func c2708_f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.static_value("fl.controls.BaseButton", "defaultStyles")
	return null


static func c2708_f_get_enabled(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.controls.BaseButton"), "enabled")
	return null


static func c2708_f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.super_ref(c, "fl.controls.BaseButton"), "enabled", v_value, "=")
	R.assign(c, "mouseEnabled", "fl.controls.BaseButton", v_value, "=")
	return null


static func c2708_f_get_selected(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_selected")
	return null


static func c2708_f_set_selected(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", (c).fields.get("_selected"), v_value)):
		pass
		return null
	(c).fields["_selected"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null


static func c2708_f_get_autoRepeat(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_autoRepeat")
	return null


static func c2708_f_set_autoRepeat(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_autoRepeat"] = v_value
	return null


static func c2708_f_set_mouseStateLocked(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_mouseStateLocked"] = v_value
	if R.truth(R.binary("==", v_value, false)):
		pass
		R.call_member(c, "setMouseState", [(c).fields.get("unlockedMouseState")])
	else:
		pass
		(c).fields["unlockedMouseState"] = R.coerce((c).fields.get("mouseState"), "String")
	return null


static func c2708_f_setMouseState(c: Variant, a: Array) -> Variant:
	var v_state: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("_mouseStateLocked")):
		pass
		(c).fields["unlockedMouseState"] = R.coerce(v_state, "String")
		return null
	if R.truth(R.binary("==", (c).fields.get("mouseState"), v_state)):
		pass
		return null
	(c).fields["mouseState"] = R.coerce(v_state, "String")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null


static func c2708_f_setupMouseEvents(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "ROLL_OVER"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "MOUSE_UP"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "ROLL_OUT"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	return null


static func c2708_f_mouseEventHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"))):
		pass
		R.call_member(c, "setMouseState", ["down"])
		R.call_member(c, "startPress", [])
	else:
		pass
		if R.truth((R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "ROLL_OVER")) or R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "MOUSE_UP")))):
			pass
			R.call_member(c, "setMouseState", ["over"])
			R.call_member(c, "endPress", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "ROLL_OUT"))):
				pass
				R.call_member(c, "setMouseState", ["up"])
				R.call_member(c, "endPress", [])
	return null


static func c2708_f_startPress(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_autoRepeat")):
		pass
		R.set_value((c).fields.get("pressTimer"), "delay", R.num(R.call_member(c, "getStyleValue", ["repeatDelay"])), "=")
		R.invoke(R.get_value((c).fields.get("pressTimer"), "start"), [])
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.BaseButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "BUTTON_DOWN"), true])])
	return null


static func c2708_f_buttonDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "TimerEvent")
	if R.truth(R.unary("!", (c).fields.get("_autoRepeat"))):
		pass
		R.call_member(c, "endPress", [])
		return null
	if R.truth(R.binary("==", R.get_value((c).fields.get("pressTimer"), "currentCount"), 1)):
		pass
		R.set_value((c).fields.get("pressTimer"), "delay", R.num(R.call_member(c, "getStyleValue", ["repeatInterval"])), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.BaseButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "BUTTON_DOWN"), true])])
	return null


static func c2708_f_endPress(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("pressTimer"), "reset"), [])
	return null


static func c2708_f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES"), R.static_value("fl.core.InvalidationType", "STATE")])):
		pass
		R.call_member(c, "drawBackground", [])
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE"), false])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")])):
		pass
		R.call_member(c, "drawLayout", [])
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.BaseButton"), "draw"), [])
	return null


static func c2708_f_drawBackground(c: Variant, a: Array) -> Variant:
	var v_styleName: Variant = null
	var v_bg: Variant = null
	v_styleName = R.coerce(((c).fields.get("mouseState") if R.truth(R.get_value(c, "enabled")) else "disabled"), "String")
	if R.truth(R.get_value(c, "selected")):
		pass
		v_styleName = R.coerce(R.binary("+", R.binary("+", "selected", R.invoke(R.get_value(R.invoke(R.get_value(v_styleName, "substr"), [0, 1]), "toUpperCase"), [])), R.invoke(R.get_value(v_styleName, "substr"), [1])), "String")
	v_styleName = R.coerce(R.binary("+", v_styleName, "Skin"), "String")
	v_bg = R.coerce((c).fields.get("background"), "DisplayObject")
	(c).fields["background"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [R.call_member(c, "getStyleValue", [v_styleName])]), "DisplayObject")
	R.invoke(R.resolve(c, "addChildAt", "fl.controls.BaseButton"), [(c).fields.get("background"), 0])
	if R.truth((R.binary("!=", v_bg, null) and R.binary("!=", v_bg, (c).fields.get("background")))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.BaseButton"), [v_bg])
	return null


static func c2708_f_drawLayout(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("background"), "width", R.resolve(c, "width", "fl.controls.BaseButton"), "=")
	R.set_value((c).fields.get("background"), "height", R.resolve(c, "height", "fl.controls.BaseButton"), "=")
	return null


static func c2708_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "defaultStyles", {"upSkin": "Button_upSkin", "downSkin": "Button_downSkin", "overSkin": "Button_overSkin", "disabledSkin": "Button_disabledSkin", "selectedDisabledSkin": "Button_selectedDisabledSkin", "selectedUpSkin": "Button_selectedUpSkin", "selectedDownSkin": "Button_selectedDownSkin", "selectedOverSkin": "Button_selectedOverSkin", "focusRectSkin": null, "focusRectPadding": null, "repeatDelay": 500, "repeatInterval": 35}, "=")
	return null


static func c2709_f_Button(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.Button"), [])
	return null


static func c2709_f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.call_static("fl.core.UIComponent", "mergeStyles", [R.call_static("fl.controls.LabelButton", "getStyleDefinition", []), R.static_value("fl.controls.Button", "defaultStyles")])
	return null


static func c2709_f_get_emphasized(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_emphasized")
	return null


static func c2709_f_set_emphasized(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_emphasized"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null


static func c2709_f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_or(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES")]), func(): return R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")]))):
		pass
		R.call_member(c, "drawEmphasized", [])
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.Button"), "draw"), [])
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "setChildIndex", "fl.controls.Button"), [(c).fields.get("emphasizedBorder"), (R.num(R.resolve(c, "numChildren", "fl.controls.Button")) - float(1))])
	return null


static func c2709_f_drawEmphasized(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"padding": "Number", "emphasizedStyle": "Object"}
	l["padding"] = NAN
	l["emphasizedStyle"] = null
	R.lset(l, "padding", NAN)
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.Button"), [(c).fields.get("emphasizedBorder")])
	(c).fields["emphasizedBorder"] = R.coerce(null, "DisplayObject")
	if R.truth(R.unary("!", (c).fields.get("_emphasized"))):
		pass
		return null
	R.lset(l, "emphasizedStyle", R.call_member(c, "getStyleValue", ["emphasizedSkin"]))
	if R.truth(R.binary("!=", R.lget(l, "emphasizedStyle"), null)):
		pass
		(c).fields["emphasizedBorder"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [R.lget(l, "emphasizedStyle")]), "DisplayObject")
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "addChildAt", "fl.controls.Button"), [(c).fields.get("emphasizedBorder"), 0])
		R.lset(l, "padding", R.num(R.call_member(c, "getStyleValue", ["emphasizedPadding"])), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "x", R.set_value((c).fields.get("emphasizedBorder"), "y", R.unary("-", R.lget(l, "padding")), "="), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "width", R.binary("+", R.resolve(c, "width", "fl.controls.Button"), (float(R.lget(l, "padding")) * float(2))), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "height", R.binary("+", R.resolve(c, "height", "fl.controls.Button"), (float(R.lget(l, "padding")) * float(2))), "=")
	return null


static func c2709_f_drawFocus(c: Variant, a: Array) -> Variant:
	var v_emphasizedPadding: Variant = NAN
	var v_focusPadding: Variant = null
	var v_focused: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_emphasizedPadding = float(NAN)
	v_focusPadding = R.coerce(null, "*")
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.Button"), "drawFocus"), [v_focused])
	if R.truth(v_focused):
		pass
		v_emphasizedPadding = float(R.num(R.call_member(c, "getStyleValue", ["emphasizedPadding"])))
		if R.truth(((float(v_emphasizedPadding) < float(0)) or R.unary("!", (c).fields.get("_emphasized")))):
			pass
			v_emphasizedPadding = float(0)
		v_focusPadding = R.coerce(R.call_member(c, "getStyleValue", ["focusRectPadding"]), "*")
		v_focusPadding = R.coerce((2 if R.truth(R.binary("==", v_focusPadding, null)) else v_focusPadding), "*")
		v_focusPadding = R.coerce(R.binary("+", v_focusPadding, v_emphasizedPadding), "*")
		R.set_value(c.fields.get("uiFocusRect"), "x", R.unary("-", v_focusPadding), "=")
		R.set_value(c.fields.get("uiFocusRect"), "y", R.unary("-", v_focusPadding), "=")
		R.set_value(c.fields.get("uiFocusRect"), "width", R.binary("+", R.resolve(c, "width", "fl.controls.Button"), (R.num(v_focusPadding) * float(2))), "=")
		R.set_value(c.fields.get("uiFocusRect"), "height", R.binary("+", R.resolve(c, "height", "fl.controls.Button"), (R.num(v_focusPadding) * float(2))), "=")
	return null


static func c2709_f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.controls.Button", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.controls.Button", "createAccessibilityImplementation"), [c])
	return null


static func c2709_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "defaultStyles", {"emphasizedSkin": "Button_emphasizedSkin", "emphasizedPadding": 2}, "=")
	return null


static func c2710_f_ButtonLabelPlacement(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.ButtonLabelPlacement"), [])
	return null


static func c2711_f_LabelButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.LabelButton"), [])
	return null


static func c2711_f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.invoke(R.resolve(c, "mergeStyles", "fl.controls.LabelButton"), [R.static_value("fl.controls.LabelButton", "defaultStyles"), R.call_static("fl.controls.BaseButton", "getStyleDefinition", [])])
	return null


static func c2711_f_get_label(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_label")
	return null


static func c2711_f_set_label(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_label"] = R.coerce(v_value, "String")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("textField"), "text"), (c).fields.get("_label"))):
		pass
		R.set_value((c).fields.get("textField"), "text", (c).fields.get("_label"), "=")
		R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "LABEL_CHANGE")])])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null


static func c2711_f_get_labelPlacement(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_labelPlacement")
	return null


static func c2711_f_set_labelPlacement(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_labelPlacement"] = R.coerce(v_value, "String")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	return null


static func c2711_f_get_toggle(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_toggle")
	return null


static func c2711_f_set_toggle(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.logical_and(R.unary("!", v_value), func(): return R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "selected"))):
		pass
		R.set_value(c, "selected", false, "=")
	(c).fields["_toggle"] = v_value
	if R.truth((c).fields.get("_toggle")):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.controls.LabelButton"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "toggleSelected"), false, 0, true])
	else:
		pass
		R.invoke(R.resolve(c, "removeEventListener", "fl.controls.LabelButton"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "toggleSelected")])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null


static func c2711_f_toggleSelected(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(c, "selected", R.unary("!", R.get_value(c, "selected")), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("Event"), [R.get_value(R.klass("Event"), "CHANGE"), true])])
	return null


static func c2711_f_get_selected(c: Variant, a: Array) -> Variant:
	return (c.fields.get("_selected") if R.truth((c).fields.get("_toggle")) else false)
	return null


static func c2711_f_set_selected(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	c.fields["_selected"] = v_value
	if R.truth((c).fields.get("_toggle")):
		pass
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null


static func c2711_f_configUI(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "configUI"), [])
	(c).fields["textField"] = R.coerce(R.construct(R.klass("TextField"), []), "TextField")
	R.set_value((c).fields.get("textField"), "type", R.get_value(R.resolve(c, "TextFieldType", "fl.controls.LabelButton"), "DYNAMIC"), "=")
	R.set_value((c).fields.get("textField"), "selectable", false, "=")
	R.invoke(R.resolve(c, "addChild", "fl.controls.LabelButton"), [(c).fields.get("textField")])
	return null


static func c2711_f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.get_value((c).fields.get("textField"), "text"), (c).fields.get("_label"))):
		pass
		R.set_value(c, "label", (c).fields.get("_label"), "=")
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES"), R.static_value("fl.core.InvalidationType", "STATE")])):
		pass
		R.call_member(c, "drawBackground", [])
		R.call_member(c, "drawIcon", [])
		R.call_member(c, "drawTextFormat", [])
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE"), false])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")])):
		pass
		R.call_member(c, "drawLayout", [])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE"), R.static_value("fl.core.InvalidationType", "STYLES")])):
		pass
		if R.truth(R.logical_and(c.fields.get("isFocused"), func(): return R.get_value(R.resolve(c, "focusManager", "fl.controls.LabelButton"), "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
	R.call_member(c, "validate", [])
	return null


static func c2711_f_drawIcon(c: Variant, a: Array) -> Variant:
	var v_oldIcon: Variant = null
	var v_styleName: Variant = null
	var v_iconStyle: Variant = null
	v_oldIcon = R.coerce((c).fields.get("icon"), "DisplayObject")
	v_styleName = R.coerce((c.fields.get("mouseState") if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else "disabled"), "String")
	if R.truth(R.get_value(c, "selected")):
		pass
		v_styleName = R.coerce(R.binary("+", R.binary("+", "selected", R.invoke(R.get_value(R.invoke(R.get_value(v_styleName, "substr"), [0, 1]), "toUpperCase"), [])), R.invoke(R.get_value(v_styleName, "substr"), [1])), "String")
	v_styleName = R.coerce(R.binary("+", v_styleName, "Icon"), "String")
	v_iconStyle = R.coerce(R.call_member(c, "getStyleValue", [v_styleName]), "Object")
	if R.truth(R.binary("==", v_iconStyle, null)):
		pass
		v_iconStyle = R.coerce(R.call_member(c, "getStyleValue", ["icon"]), "Object")
	if R.truth(R.binary("!=", v_iconStyle, null)):
		pass
		(c).fields["icon"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [v_iconStyle]), "DisplayObject")
	if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
		pass
		R.invoke(R.resolve(c, "addChildAt", "fl.controls.LabelButton"), [(c).fields.get("icon"), 1])
	if R.truth((R.binary("!=", v_oldIcon, null) and R.binary("!=", v_oldIcon, (c).fields.get("icon")))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.LabelButton"), [v_oldIcon])
	return null


static func c2711_f_drawTextFormat(c: Variant, a: Array) -> Variant:
	var v_uiStyles: Variant = null
	var v_defaultTF: Variant = null
	var v_tf: Variant = null
	v_uiStyles = R.coerce(R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "Object")
	v_defaultTF = R.coerce((R.binary("as", R.get_value(v_uiStyles, "defaultTextFormat"), R.klass("TextFormat")) if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else R.binary("as", R.get_value(v_uiStyles, "defaultDisabledTextFormat"), R.klass("TextFormat"))), "TextFormat")
	R.invoke(R.get_value((c).fields.get("textField"), "setTextFormat"), [v_defaultTF])
	v_tf = R.coerce(R.binary("as", R.call_member(c, "getStyleValue", [("textFormat" if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else "disabledTextFormat")]), R.klass("TextFormat")), "TextFormat")
	if R.truth(R.binary("!=", v_tf, null)):
		pass
		R.invoke(R.get_value((c).fields.get("textField"), "setTextFormat"), [v_tf])
	else:
		pass
		v_tf = R.coerce(v_defaultTF, "TextFormat")
	R.set_value((c).fields.get("textField"), "defaultTextFormat", v_tf, "=")
	R.call_member(c, "setEmbedFont", [])
	return null


static func c2711_f_setEmbedFont(c: Variant, a: Array) -> Variant:
	var v_embed: Variant = null
	v_embed = R.coerce(R.call_member(c, "getStyleValue", ["embedFonts"]), "Object")
	if R.truth(R.binary("!=", v_embed, null)):
		pass
		R.set_value((c).fields.get("textField"), "embedFonts", v_embed, "=")
	return null


static func c2711_f_drawLayout(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"tmpWidth": "Number", "tmpHeight": "Number", "txtPad": "Number", "placement": "String", "txtW": "Number", "txtH": "Number", "paddedIconW": "Number", "paddedIconH": "Number"}
	l["tmpWidth"] = NAN
	l["tmpHeight"] = NAN
	l["txtPad"] = NAN
	l["placement"] = null
	l["txtW"] = NAN
	l["txtH"] = NAN
	l["paddedIconW"] = NAN
	l["paddedIconH"] = NAN
	R.lset(l, "tmpWidth", NAN)
	R.lset(l, "tmpHeight", NAN)
	R.lset(l, "txtPad", R.num(R.call_member(c, "getStyleValue", ["textPadding"])))
	R.lset(l, "placement", (R.static_value("fl.controls.ButtonLabelPlacement", "TOP") if R.truth((R.binary("==", (c).fields.get("icon"), null) and R.binary("==", (c).fields.get("mode"), "center"))) else (c).fields.get("_labelPlacement")))
	R.set_value((c).fields.get("textField"), "height", R.binary("+", R.get_value((c).fields.get("textField"), "textHeight"), 4), "=")
	R.lset(l, "txtW", R.binary("+", R.get_value((c).fields.get("textField"), "textWidth"), 4))
	R.lset(l, "txtH", R.binary("+", R.get_value((c).fields.get("textField"), "textHeight"), 4))
	R.lset(l, "paddedIconW", (0 if R.truth(R.binary("==", (c).fields.get("icon"), null)) else R.binary("+", R.get_value((c).fields.get("icon"), "width"), R.lget(l, "txtPad"))))
	R.lset(l, "paddedIconH", (0 if R.truth(R.binary("==", (c).fields.get("icon"), null)) else R.binary("+", R.get_value((c).fields.get("icon"), "height"), R.lget(l, "txtPad"))))
	R.set_value((c).fields.get("textField"), "visible", R.binary(">", R.get_value(R.get_value(c, "label"), "length"), 0), "=")
	if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
		pass
		R.set_value((c).fields.get("icon"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("icon"), "width"))), 2)]), "=")
		R.set_value((c).fields.get("icon"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("icon"), "height"))), 2)]), "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("textField"), "visible"), false)):
		pass
		R.set_value((c).fields.get("textField"), "width", 0, "=")
		R.set_value((c).fields.get("textField"), "height", 0, "=")
	else:
		pass
		if R.truth((R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM")) or R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "TOP")))):
			pass
			R.lset(l, "tmpWidth", maxf(float(0), float(minf(float(R.lget(l, "txtW")), float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float((float(2) * float(R.lget(l, "txtPad"))))))))), "=")
			if R.truth((float((R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - float(2))) > float(R.lget(l, "txtH")))):
				pass
				R.lset(l, "tmpHeight", R.lget(l, "txtH"), "=")
			else:
				pass
				R.lset(l, "tmpHeight", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - float(2)), "=")
			R.set_value((c).fields.get("textField"), "width", R.lset(l, "txtW", R.lget(l, "tmpWidth"), "="), "=")
			R.set_value((c).fields.get("textField"), "height", R.lset(l, "txtH", R.lget(l, "tmpHeight"), "="), "=")
			R.set_value((c).fields.get("textField"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "txtW"))), 2)]), "=")
			R.set_value((c).fields.get("textField"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.binary("/", (float((R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("textField"), "height")))) - float(R.lget(l, "paddedIconH"))), 2), (R.lget(l, "paddedIconH") if R.truth(R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM"))) else 0))]), "=")
			if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
				pass
				R.set_value((c).fields.get("icon"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [((R.num(R.get_value((c).fields.get("textField"), "y")) - float(R.lget(l, "paddedIconH"))) if R.truth(R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM"))) else R.binary("+", R.binary("+", R.get_value((c).fields.get("textField"), "y"), R.get_value((c).fields.get("textField"), "height")), R.lget(l, "txtPad")))]), "=")
		else:
			pass
			R.lset(l, "tmpWidth", maxf(float(0), float(minf(float(R.lget(l, "txtW")), float((float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "paddedIconW")))) - float((float(2) * float(R.lget(l, "txtPad"))))))))), "=")
			R.set_value((c).fields.get("textField"), "width", R.lset(l, "txtW", R.lget(l, "tmpWidth"), "="), "=")
			R.set_value((c).fields.get("textField"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.binary("/", (float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "txtW")))) - float(R.lget(l, "paddedIconW"))), 2), (R.lget(l, "paddedIconW") if R.truth(R.binary("!=", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "LEFT"))) else 0))]), "=")
			R.set_value((c).fields.get("textField"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("textField"), "height"))), 2)]), "=")
			if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
				pass
				R.set_value((c).fields.get("icon"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [((R.num(R.get_value((c).fields.get("textField"), "x")) - float(R.lget(l, "paddedIconW"))) if R.truth(R.binary("!=", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "LEFT"))) else R.binary("+", R.binary("+", R.get_value((c).fields.get("textField"), "x"), R.lget(l, "txtW")), R.lget(l, "txtPad")))]), "=")
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "drawLayout"), [])
	return null


static func c2711_f_keyDownHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", R.resolve(c, "enabled", "fl.controls.LabelButton"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.controls.LabelButton"), "SPACE"))):
		pass
		if R.truth(R.binary("==", (c).fields.get("oldMouseState"), null)):
			pass
			(c).fields["oldMouseState"] = R.coerce(c.fields.get("mouseState"), "String")
		R.call_member(c, "setMouseState", ["down"])
		R.call_member(c, "startPress", [])
	return null


static func c2711_f_keyUpHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", R.resolve(c, "enabled", "fl.controls.LabelButton"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.controls.LabelButton"), "SPACE"))):
		pass
		R.call_member(c, "setMouseState", [(c).fields.get("oldMouseState")])
		(c).fields["oldMouseState"] = R.coerce(null, "String")
		R.call_member(c, "endPress", [])
		R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("MouseEvent"), [R.get_value(R.klass("MouseEvent"), "CLICK")])])
	return null


static func c2711_f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.controls.LabelButton", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.controls.LabelButton", "createAccessibilityImplementation"), [c])
	return null


static func c2711_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "defaultStyles", {"icon": null, "upIcon": null, "downIcon": null, "overIcon": null, "disabledIcon": null, "selectedDisabledIcon": null, "selectedUpIcon": null, "selectedDownIcon": null, "selectedOverIcon": null, "textFormat": null, "disabledTextFormat": null, "textPadding": 5, "embedFonts": false}, "=")
	return null


static func c2712_f_InvalidationType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.core.InvalidationType"), [])
	return null


static func c2713_f_UIComponent(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.core.UIComponent"), [])
	(c).fields["instanceStyles"] = R.coerce({}, "Object")
	(c).fields["sharedStyles"] = R.coerce({}, "Object")
	(c).fields["invalidHash"] = R.coerce({}, "Object")
	(c).fields["callLaterMethods"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), []), "Dictionary")
	R.call_static("fl.managers.StyleManager", "registerInstance", [c])
	R.call_member(c, "configUI", [])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "ALL")])
	R.assign(c, "tabEnabled", "fl.core.UIComponent", R.binary("is", c, R.klass("fl.managers.IFocusManagerComponent")), "=")
	R.assign(c, "focusRect", "fl.core.UIComponent", false, "=")
	if R.truth(R.resolve(c, "tabEnabled", "fl.core.UIComponent")):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.resolve(c, "FocusEvent", "fl.core.UIComponent"), "FOCUS_IN"), R.get_value(c, "focusInHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.resolve(c, "FocusEvent", "fl.core.UIComponent"), "FOCUS_OUT"), R.get_value(c, "focusOutHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "keyDownHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("KeyboardEvent"), "KEY_UP"), R.get_value(c, "keyUpHandler")])
	R.call_member(c, "initializeFocusManager", [])
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "hookAccessibility"), false, 0, true])
	return null


static func c2713_f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.static_value("fl.core.UIComponent", "defaultStyles")
	return null


static func c2713_f_mergeStyles(c: Variant, a: Array) -> Variant:
	var v_styleList: Variant = null
	var v_n: Variant = null
	var v_styles: Variant = null
	var v_l: Variant = 0
	var v_i: Variant = 0
	var v_list: Variant = R.coerce(a.slice(0), "*")
	v_styleList = R.coerce(null, "Object")
	v_n = R.coerce(null, "String")
	v_styles = R.coerce({}, "Object")
	v_l = R.coerce(R.coerce(R.get_value(v_list, "length"), "uint"), "uint")
	v_i = R.coerce(0, "uint")
	while R.truth((float(v_i) < float(v_l))):
		pass
		v_styleList = R.coerce(R.get_value(v_list, v_i), "Object")
		for __t1 in R.iterate(v_styleList, false):
			v_n = R.coerce(__t1, "String")
			if R.truth(R.binary("==", R.get_value(v_styles, v_n), null)):
				pass
				R.set_value(v_styles, v_n, R.get_value(R.get_value(v_list, v_i), v_n), "=")
		v_i = ((v_i + 1) & 4294967295)
	return v_styles
	return null


static func c2713_f_get_componentInspectorSetting(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_inspector")
	return null


static func c2713_f_set_componentInspectorSetting(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_inspector"] = v_value
	if R.truth((c).fields.get("_inspector")):
		pass
		R.call_member(c, "beforeComponentParameters", [])
	else:
		pass
		R.call_member(c, "afterComponentParameters", [])
	return null


static func c2713_f_get_enabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_enabled")
	return null


static func c2713_f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", v_value, (c).fields.get("_enabled"))):
		pass
		return null
	(c).fields["_enabled"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null


static func c2713_f_setSize(c: Variant, a: Array) -> Variant:
	var v_width: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_height: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_width"] = float(v_width)
	(c).fields["_height"] = float(v_height)
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "RESIZE"), false])])
	return null


static func c2713_f_get_width(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_width")
	return null


static func c2713_f_set_width(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("_width")) == float(v_value))):
		pass
		return null
	R.call_member(c, "setSize", [v_value, R.get_value(c, "height")])
	return null


static func c2713_f_get_height(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_height")
	return null


static func c2713_f_set_height(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("_height")) == float(v_value))):
		pass
		return null
	R.call_member(c, "setSize", [R.get_value(c, "width"), v_value])
	return null


static func c2713_f_setStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	if R.truth((R.binary("===", R.get_value((c).fields.get("instanceStyles"), v_style), v_value) and R.unary("!", R.binary("is", v_value, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value((c).fields.get("instanceStyles"), v_style, v_value, "=")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null


static func c2713_f_clearStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(c, "setStyle", [v_style, null])
	return null


static func c2713_f_getStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("instanceStyles"), v_style)
	return null


static func c2713_f_move(c: Variant, a: Array) -> Variant:
	var v_x: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_y: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_x"] = float(v_x)
	(c).fields["_y"] = float(v_y)
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [v_x]), "=")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [v_y]), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "MOVE")])])
	return null


static func c2713_f_get_x(c: Variant, a: Array) -> Variant:
	return (R.get_value(R.super_ref(c, "fl.core.UIComponent"), "x") if R.truth(R.invoke(R.resolve(c, "isNaN", "fl.core.UIComponent"), [(c).fields.get("_x")])) else (c).fields.get("_x"))
	return null


static func c2713_f_set_x(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "move", [v_value, (c).fields.get("_y")])
	return null


static func c2713_f_get_y(c: Variant, a: Array) -> Variant:
	return (R.get_value(R.super_ref(c, "fl.core.UIComponent"), "y") if R.truth(R.invoke(R.resolve(c, "isNaN", "fl.core.UIComponent"), [(c).fields.get("_y")])) else (c).fields.get("_y"))
	return null


static func c2713_f_set_y(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "move", [(c).fields.get("_x"), v_value])
	return null


static func c2713_f_get_scaleX(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.get_value(c, "width"), (c).fields.get("startWidth"))
	return null


static func c2713_f_set_scaleX(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setSize", [(float((c).fields.get("startWidth")) * float(v_value)), R.get_value(c, "height")])
	return null


static func c2713_f_get_scaleY(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.get_value(c, "height"), (c).fields.get("startHeight"))
	return null


static func c2713_f_set_scaleY(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setSize", [R.get_value(c, "width"), (float((c).fields.get("startHeight")) * float(v_value))])
	return null


static func c2713_f_getScaleY(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY")
	return null


static func c2713_f_setScaleY(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY", v_value, "=")
	return null


static func c2713_f_getScaleX(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX")
	return null


static func c2713_f_setScaleX(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX", v_value, "=")
	return null


static func c2713_f_get_visible(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "visible")
	return null


static func c2713_f_set_visible(c: Variant, a: Array) -> Variant:
	var v_t: Variant = null
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "visible"), v_value)):
		pass
		return null
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "visible", v_value, "=")
	v_t = R.coerce((R.static_value("fl.events.ComponentEvent", "SHOW") if R.truth(v_value) else R.static_value("fl.events.ComponentEvent", "HIDE")), "String")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [v_t, true])])
	return null


static func c2713_f_validateNow(c: Variant, a: Array) -> Variant:
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "ALL"), false])
	R.call_member(c, "draw", [])
	return null


static func c2713_f_invalidate(c: Variant, a: Array) -> Variant:
	var v_property: Variant = R.coerce((a[0] if a.size() > 0 else "all"), "String")
	var v_callLater: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.set_value((c).fields.get("invalidHash"), v_property, true, "=")
	if R.truth(v_callLater):
		pass
		R.call_member(c, "callLater", [R.get_value(c, "draw")])
	return null


static func c2713_f_setSharedStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_style: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	if R.truth((R.binary("===", R.get_value((c).fields.get("sharedStyles"), v_name), v_style) and R.unary("!", R.binary("is", v_style, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value((c).fields.get("sharedStyles"), v_name, v_style, "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("instanceStyles"), v_name), null)):
		pass
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null


static func c2713_f_get_focusEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_focusEnabled")
	return null


static func c2713_f_set_focusEnabled(c: Variant, a: Array) -> Variant:
	var v_b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_focusEnabled"] = v_b
	return null


static func c2713_f_get_mouseFocusEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_mouseFocusEnabled")
	return null


static func c2713_f_set_mouseFocusEnabled(c: Variant, a: Array) -> Variant:
	var v_b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_mouseFocusEnabled"] = v_b
	return null


static func c2713_f_get_focusManager(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	v_o = R.coerce(c, "DisplayObject")
	while R.truth(v_o):
		pass
		if R.truth(R.binary("!=", R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_o), null)):
			pass
			return R.invoke(R.klass("fl.managers.IFocusManager"), [R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_o)])
		v_o = R.coerce(R.get_value(v_o, "parent"), "DisplayObject")
	return null
	return null


static func c2713_f_set_focusManager(c: Variant, a: Array) -> Variant:
	var v_f: Variant = R.coerce((a[0] if a.size() > 0 else null), "IFocusManager")
	R.set_value(R.static_value("fl.core.UIComponent", "focusManagers"), c, v_f, "=")
	return null


static func c2713_f_drawFocus(c: Variant, a: Array) -> Variant:
	var v_focusPadding: Variant = NAN
	var v_focused: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_focusPadding = float(NAN)
	(c).fields["isFocused"] = v_focused
	if R.truth(R.logical_and(R.binary("!=", (c).fields.get("uiFocusRect"), null), func(): return R.invoke(R.resolve(c, "contains", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect")]))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect")])
		(c).fields["uiFocusRect"] = R.coerce(null, "DisplayObject")
	if R.truth(v_focused):
		pass
		(c).fields["uiFocusRect"] = R.coerce(R.binary("as", R.call_member(c, "getDisplayObjectInstance", [R.call_member(c, "getStyleValue", ["focusRectSkin"])]), R.klass("Sprite")), "DisplayObject")
		if R.truth(R.binary("==", (c).fields.get("uiFocusRect"), null)):
			pass
			return null
		v_focusPadding = float(R.num(R.call_member(c, "getStyleValue", ["focusRectPadding"])))
		R.set_value((c).fields.get("uiFocusRect"), "x", R.unary("-", v_focusPadding), "=")
		R.set_value((c).fields.get("uiFocusRect"), "y", R.unary("-", v_focusPadding), "=")
		R.set_value((c).fields.get("uiFocusRect"), "width", R.binary("+", R.get_value(c, "width"), (float(v_focusPadding) * float(2))), "=")
		R.set_value((c).fields.get("uiFocusRect"), "height", R.binary("+", R.get_value(c, "height"), (float(v_focusPadding) * float(2))), "=")
		R.invoke(R.resolve(c, "addChildAt", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect"), 0])
	return null


static func c2713_f_setFocus(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "fl.core.UIComponent")):
		pass
		R.set_value(R.resolve(c, "stage", "fl.core.UIComponent"), "focus", c, "=")
	return null


static func c2713_f_getFocus(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "fl.core.UIComponent")):
		pass
		return R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "focus")
	return null
	return null


static func c2713_f_setIMEMode(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "enabled": "Boolean"}
	l["e"] = null
	l["enabled"] = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("!=", (c).fields.get("_imeMode"), null)):
		pass
		if R.truth(R.lget(l, "enabled")):
			pass
			R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "enabled", true, "=")
			(c).fields["_oldIMEMode"] = R.coerce(R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), "String")
			R.last_error = null
			if R.truth((R.unary("!", (c).fields.get("errorCaught")) and R.binary("!=", R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")))):
				pass
				R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode", (c).fields.get("_imeMode"), "=")
			(c).fields["errorCaught"] = false
			if R.last_error != null:
				R.lset(l, "e", R.last_error)
				R.last_error = null
				c.fields["errorCaught"] = true
				return R.raise_error(R.construct(R.resolve(c, "Error", "fl.core.UIComponent"), [R.binary("+", "IME mode not supported: ", c.fields.get("_imeMode"))]))
		else:
			pass
			if R.truth((R.binary("!=", R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")) and R.binary("!=", (c).fields.get("_oldIMEMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")))):
				pass
				R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode", (c).fields.get("_oldIMEMode"), "=")
			R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "enabled", false, "=")
	return null


static func c2713_f_drawNow(c: Variant, a: Array) -> Variant:
	R.call_member(c, "draw", [])
	return null


static func c2713_f_configUI(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"r": "Number", "w": "Number", "h": "Number"}
	l["r"] = NAN
	l["w"] = NAN
	l["h"] = NAN
	(c).fields["isLivePreview"] = R.coerce(R.call_member(c, "checkLivePreview", []), "Boolean")
	R.lset(l, "r", R.resolve(c, "rotation", "fl.core.UIComponent"))
	R.assign(c, "rotation", "fl.core.UIComponent", 0, "=")
	R.lset(l, "w", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "width"))
	R.lset(l, "h", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "height"))
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX", R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY", 1, "="), "=")
	R.call_member(c, "setSize", [R.lget(l, "w"), R.lget(l, "h")])
	R.call_member(c, "move", [R.get_value(R.super_ref(c, "fl.core.UIComponent"), "x"), R.get_value(R.super_ref(c, "fl.core.UIComponent"), "y")])
	R.assign(c, "rotation", "fl.core.UIComponent", R.lget(l, "r"), "=")
	(c).fields["startWidth"] = float(R.lget(l, "w"))
	(c).fields["startHeight"] = float(R.lget(l, "h"))
	if R.truth(R.binary(">", R.resolve(c, "numChildren", "fl.core.UIComponent"), 0)):
		pass
		R.invoke(R.resolve(c, "removeChildAt", "fl.core.UIComponent"), [0])
	return null


static func c2713_f_checkLivePreview(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"className": "String", "e": "Error"}
	l["className"] = null
	l["e"] = null
	R.lset(l, "className", null)
	if R.truth(R.binary("==", R.resolve(c, "parent", "fl.core.UIComponent"), null)):
		pass
		return false
	R.last_error = null
	R.lset(l, "className", R.invoke(R.resolve(c, "getQualifiedClassName", "fl.core.UIComponent"), [R.resolve(c, "parent", "fl.core.UIComponent")]), "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return R.binary("==", R.lget(l, "className"), "fl.livepreview::LivePreviewParent")
	return null


static func c2713_f_isInvalid(c: Variant, a: Array) -> Variant:
	var v_property: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_properties: Variant = R.coerce(a.slice(1), "*")
	if R.truth((R.truth(R.get_value((c).fields.get("invalidHash"), v_property)) or R.truth(R.get_value((c).fields.get("invalidHash"), R.static_value("fl.core.InvalidationType", "ALL"))))):
		pass
		return true
	while R.truth(R.binary(">", R.get_value(v_properties, "length"), 0)):
		pass
		if R.truth(R.get_value((c).fields.get("invalidHash"), R.invoke(R.get_value(v_properties, "pop"), []))):
			pass
			return true
	return false
	return null


static func c2713_f_validate(c: Variant, a: Array) -> Variant:
	(c).fields["invalidHash"] = R.coerce({}, "Object")
	return null


static func c2713_f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE"), R.static_value("fl.core.InvalidationType", "STYLES")])):
		pass
		if R.truth(R.logical_and((c).fields.get("isFocused"), func(): return R.get_value(R.get_value(c, "focusManager"), "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
	R.call_member(c, "validate", [])
	return null


static func c2713_f_getDisplayObjectInstance(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"classDef": "Object", "e": "Error", "skin": "Object"}
	l["classDef"] = null
	l["e"] = null
	l["skin"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.lset(l, "classDef", null)
	if R.truth(R.binary("is", R.lget(l, "skin"), R.resolve(c, "Class", "fl.core.UIComponent"))):
		pass
		return R.binary("as", R.construct(R.lget(l, "skin"), []), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	if R.truth(R.binary("is", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))):
		pass
		R.set_value(R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent")), "x", 0, "=")
		R.set_value(R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent")), "y", 0, "=")
		return R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	R.last_error = null
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getDefinitionByName", "fl.core.UIComponent"), [R.invoke(R.get_value(R.lget(l, "skin"), "toString"), [])]), "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		R.last_error = null
		R.lset(l, "classDef", R.binary("as", R.invoke(R.get_value(R.get_value(R.resolve(c, "loaderInfo", "fl.core.UIComponent"), "applicationDomain"), "getDefinition"), [R.invoke(R.get_value(R.lget(l, "skin"), "toString"), [])]), R.resolve(c, "Object", "fl.core.UIComponent")), "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
	if R.truth(R.binary("==", R.lget(l, "classDef"), null)):
		pass
		return null
	return R.binary("as", R.construct(R.lget(l, "classDef"), []), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	return null


static func c2713_f_getStyleValue(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return (R.get_value((c).fields.get("sharedStyles"), v_name) if R.truth(R.binary("==", R.get_value((c).fields.get("instanceStyles"), v_name), null)) else R.get_value((c).fields.get("instanceStyles"), v_name))
	return null


static func c2713_f_copyStylesToChild(c: Variant, a: Array) -> Variant:
	var v_n: Variant = null
	var v_child: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	var v_styleMap: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v_n = R.coerce(null, "String")
	for __t2 in R.iterate(v_styleMap, false):
		v_n = R.coerce(__t2, "String")
		R.call_member(v_child, "setStyle", [v_n, R.call_member(c, "getStyleValue", [R.get_value(v_styleMap, v_n)])])
	return null


static func c2713_f_callLater(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError", "fn": "Function"}
	l["se"] = null
	l["fn"] = R.coerce((a[0] if a.size() > 0 else null), "Function")
	if R.truth(R.static_value("fl.core.UIComponent", "inCallLaterPhase")):
		pass
		return null
	R.set_value((c).fields.get("callLaterMethods"), R.lget(l, "fn"), true, "=")
	if R.truth(R.binary("!=", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
		pass
		R.last_error = null
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "addEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "invalidate"), [])
		if R.last_error != null:
			R.lset(l, "se", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "callLaterDispatcher", "fl.core.UIComponent"), false, 0, true])
	else:
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
	return null


static func c2713_f_callLaterDispatcher(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"methods": "Dictionary", "method": "Object", "se1": "SecurityError", "se2": "SecurityError", "event": "Event"}
	l["methods"] = null
	l["method"] = null
	l["se1"] = null
	l["se2"] = null
	l["event"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "method", null)
	if R.truth(R.binary("==", R.get_value(R.lget(l, "event"), "type"), R.get_value(R.klass("Event"), "ADDED_TO_STAGE"))):
		pass
		R.last_error = null
		R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher")])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "addEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "invalidate"), [])
		return null
		if R.last_error != null:
			R.lset(l, "se1", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "callLaterDispatcher", "fl.core.UIComponent"), false, 0, true])
	else:
		pass
		R.invoke(R.get_value(R.get_value(R.lget(l, "event"), "target"), "removeEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher")])
		R.invoke(R.get_value(R.get_value(R.lget(l, "event"), "target"), "removeEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "callLaterDispatcher")])
		R.last_error = null
		if R.truth(R.binary("==", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
			pass
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
			return null
		if R.last_error != null:
			R.lset(l, "se2", R.last_error)
			R.last_error = null
			pass
	R.assign(c, "inCallLaterPhase", "fl.core.UIComponent", true, "=")
	R.lset(l, "methods", (c).fields.get("callLaterMethods"), "=")
	for __t3 in R.iterate(R.lget(l, "methods"), false):
		R.lset(l, "method", __t3, "=")
		R.invoke(R.lget(l, "method"), [])
		R.delete_value(R.lget(l, "methods"), R.lget(l, "method"))
	R.assign(c, "inCallLaterPhase", "fl.core.UIComponent", false, "=")
	return null


static func c2713_f_initializeFocusManager(c: Variant, a: Array) -> Variant:
	var v_fm: Variant = null
	var v_fmUserDict: Variant = null
	v_fm = R.coerce(null, "IFocusManager")
	v_fmUserDict = R.coerce(null, "Dictionary")
	if R.truth(R.binary("==", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler"), false, 0, true])
	else:
		pass
		R.call_member(c, "createFocusManager", [])
		v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
		if R.truth(R.binary("!=", v_fm, null)):
			pass
			v_fmUserDict = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm), "Dictionary")
			if R.truth(R.binary("==", v_fmUserDict, null)):
				pass
				v_fmUserDict = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "Dictionary")
				R.set_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm, v_fmUserDict, "=")
			R.set_value(v_fmUserDict, c, true, "=")
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "removedHandler")])
	return null


static func c2713_f_addedHandler(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler")])
	R.call_member(c, "initializeFocusManager", [])
	return null


static func c2713_f_removedHandler(c: Variant, a: Array) -> Variant:
	var v_fmUserDict: Variant = null
	var v_dictEmpty: Variant = false
	var v_key: Variant = null
	var v_key2: Variant = null
	var v_compFM: Variant = null
	var v_fm: Variant = null
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_fmUserDict = R.coerce(null, "Dictionary")
	v_dictEmpty = false
	v_key = R.coerce(null, "*")
	v_key2 = R.coerce(null, "*")
	v_compFM = R.coerce(null, "IFocusManager")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "removedHandler")])
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler")])
	v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
	if R.truth(R.binary("!=", v_fm, null)):
		pass
		v_fmUserDict = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm), "Dictionary")
		if R.truth(R.binary("!=", v_fmUserDict, null)):
			pass
			R.delete_value(v_fmUserDict, c)
			v_dictEmpty = true
			v__loc8_ = R.coerce(0, "int")
			v__loc9_ = R.coerce(v_fmUserDict, "*")
			for __t4 in R.iterate(v__loc9_, false):
				v_key = R.coerce(__t4, "*")
				v_dictEmpty = false
			if R.truth(v_dictEmpty):
				pass
				R.delete_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm)
				v_fmUserDict = R.coerce(null, "Dictionary")
		if R.truth(R.binary("==", v_fmUserDict, null)):
			pass
			R.call_member(v_fm, "deactivate", [])
			for __t5 in R.iterate(R.static_value("fl.core.UIComponent", "focusManagers"), false):
				v_key2 = R.coerce(__t5, "*")
				v_compFM = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_key2), "IFocusManager")
				if R.truth(R.binary("==", v_fm, v_compFM)):
					pass
					R.delete_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_key2)
	return null


static func c2713_f_createFocusManager(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"myTopLevel": "DisplayObjectContainer", "stageAccessOK": "Boolean", "se": "SecurityError"}
	l["myTopLevel"] = null
	l["stageAccessOK"] = false
	l["se"] = null
	R.lset(l, "stageAccessOK", true)
	R.last_error = null
	R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "getChildAt"), [0])
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		R.lset(l, "stageAccessOK", false, "=")
	R.lset(l, "myTopLevel", null, "=")
	if R.truth(R.lget(l, "stageAccessOK")):
		pass
		R.lset(l, "myTopLevel", R.resolve(c, "stage", "fl.core.UIComponent"), "=")
	else:
		pass
		R.lset(l, "myTopLevel", c, "=")
		R.last_error = null
		while R.truth(R.binary("!=", R.get_value(R.lget(l, "myTopLevel"), "parent"), null)):
			pass
			R.lset(l, "myTopLevel", R.get_value(R.lget(l, "myTopLevel"), "parent"), "=")
		if R.last_error != null:
			R.lset(l, "se", R.last_error)
			R.last_error = null
			pass
	if R.truth(R.binary("==", R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), R.lget(l, "myTopLevel")), null)):
		pass
		R.set_value(R.static_value("fl.core.UIComponent", "focusManagers"), R.lget(l, "myTopLevel"), R.construct(R.klass("fl.managers.FocusManager"), [R.lget(l, "myTopLevel")]), "=")
	return null


static func c2713_f_isOurFocus(c: Variant, a: Array) -> Variant:
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	return R.binary("==", v_target, c)
	return null


static func c2713_f_focusInHandler(c: Variant, a: Array) -> Variant:
	var v_fm: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	v_fm = R.coerce(null, "IFocusManager")
	if R.truth(R.call_member(c, "isOurFocus", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))])):
		pass
		v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
		if R.truth(R.logical_and(R.truth(v_fm), func(): return R.get_value(v_fm, "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
			(c).fields["isFocused"] = true
	return null


static func c2713_f_focusOutHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.call_member(c, "isOurFocus", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))])):
		pass
		R.call_member(c, "drawFocus", [false])
		(c).fields["isFocused"] = false
	return null


static func c2713_f_hookAccessibility(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "hookAccessibility")])
	R.call_member(c, "initializeAccessibility", [])
	return null


static func c2713_f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.core.UIComponent", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.core.UIComponent", "createAccessibilityImplementation"), [c])
	return null


static func c2713_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "inCallLaterPhase", false, "=")
	R.set_value(c, "defaultStyles", {"focusRectSkin": "focusRectSkin", "focusRectPadding": 2, "textFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 0, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "disabledTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 10066329, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "defaultTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 0, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "defaultDisabledTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 10066329, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0])}, "=")
	R.set_value(c, "focusManagers", R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "=")
	R.set_value(c, "focusManagerUsers", R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "=")
	return null


static func c2714_f_ComponentEvent(c: Variant, a: Array) -> Variant:
	var v_type: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_bubbles: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_cancelable: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.invoke(R.super_ref(c, "fl.events.ComponentEvent"), [v_type, v_bubbles, v_cancelable])
	return null


static func c2714_f_toString(c: Variant, a: Array) -> Variant:
	return R.invoke(R.resolve(c, "formatToString", "fl.events.ComponentEvent"), ["ComponentEvent", "type", "bubbles", "cancelable"])
	return null


static func c2714_f_clone(c: Variant, a: Array) -> Variant:
	return R.construct(R.klass("fl.events.ComponentEvent"), [R.resolve(c, "type", "fl.events.ComponentEvent"), R.resolve(c, "bubbles", "fl.events.ComponentEvent"), R.resolve(c, "cancelable", "fl.events.ComponentEvent")])
	return null


static func c2715_f_addedHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_target = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObject")
	if R.truth(R.get_value(v_target, "stage")):
		pass
		R.call_member(c, "addFocusables", [R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")])])
	return null


static func c2715_f_removedHandler(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_io: Variant = null
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_i = R.coerce(0, "int")
	v_io = R.coerce(null, "InteractiveObject")
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObject")
	if R.truth((R.binary("is", v_o, R.klass("fl.managers.IFocusManagerComponent")) and R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true))):
		pass
		if R.truth(R.binary("==", v_o, (c).fields.get("lastFocus"))):
			pass
			R.invoke(R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [(c).fields.get("lastFocus")]), "drawFocus"), [false])
			(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false])
		R.delete_value((c).fields.get("focusableObjects"), v_o)
		(c).fields["calculateCandidates"] = true
	else:
		pass
		if R.truth((R.binary("is", v_o, R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")) and R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true))):
			pass
			v_io = R.coerce(R.binary("as", v_o, R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")), "InteractiveObject")
			if R.truth(v_io):
				pass
				if R.truth(R.binary("==", v_io, (c).fields.get("lastFocus"))):
					pass
					(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
				R.delete_value((c).fields.get("focusableObjects"), v_io)
				(c).fields["calculateCandidates"] = true
			R.invoke(R.get_value(v_o, "addEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false, 0, true])
	R.call_member(c, "removeFocusables", [v_o])
	return null


static func c2715_f_removeFocusables(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v_dob: Variant = null
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	v_p = R.coerce(null, "Object")
	v_dob = R.coerce(null, "DisplayObject")
	if R.truth(R.binary("is", v_o, R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"))):
		pass
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_CHILDREN_CHANGE"), R.get_value(c, "tabChildrenChangeHandler"), false])
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_INDEX_CHANGE"), R.get_value(c, "tabIndexChangeHandler"), false])
		for __t1 in R.iterate((c).fields.get("focusableObjects"), false):
			v_p = R.coerce(__t1, "Object")
			v_dob = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [v_p]), "DisplayObject")
			if R.truth(R.invoke(R.get_value(R.invoke(R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"), [v_o]), "contains"), [v_dob])):
				pass
				if R.truth(R.binary("==", v_dob, (c).fields.get("lastFocus"))):
					pass
					(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
				R.invoke(R.get_value(v_dob, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false])
				R.delete_value((c).fields.get("focusableObjects"), v_p)
				(c).fields["calculateCandidates"] = true
	return null


static func c2715_f_isTabVisible(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"p": "DisplayObjectContainer", "se": "SecurityError", "o": "DisplayObject"}
	l["p"] = null
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	R.lset(l, "p", null)
	R.last_error = null
	R.lset(l, "p", R.get_value(R.lget(l, "o"), "parent"), "=")
	while R.truth(((R.truth(R.lget(l, "p")) and R.truth(R.unary("!", R.binary("is", R.lget(l, "p"), R.resolve(c, "Stage", "fl.managers.FocusManager"))))) and R.unary("!", R.logical_and(R.get_value(R.lget(l, "p"), "parent"), func(): return R.binary("is", R.get_value(R.lget(l, "p"), "parent"), R.resolve(c, "Stage", "fl.managers.FocusManager")))))):
		pass
		if R.truth(R.unary("!", R.get_value(R.lget(l, "p"), "tabChildren"))):
			pass
			return false
		R.lset(l, "p", R.get_value(R.lget(l, "p"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return true
	return null


static func c2715_f_isValidFocusCandidate(c: Variant, a: Array) -> Variant:
	var v_tg: Variant = null
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	var v_groupName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_tg = R.coerce(null, "IFocusManagerGroup")
	if R.truth(R.unary("!", R.call_member(c, "isEnabledAndVisible", [v_o]))):
		pass
		return false
	if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
		pass
		v_tg = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
		if R.truth(R.binary("==", v_groupName, R.get_value(v_tg, "groupName"))):
			pass
			return false
	return true
	return null


static func c2715_f_isEnabledAndVisible(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"formParent": "DisplayObjectContainer", "tf": "TextField", "sb": "SimpleButton", "se": "SecurityError", "o": "DisplayObject"}
	l["formParent"] = null
	l["tf"] = null
	l["sb"] = null
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	R.lset(l, "formParent", null)
	R.lset(l, "tf", null)
	R.lset(l, "sb", null)
	R.last_error = null
	R.lset(l, "formParent", R.get_value(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")]), "parent"), "=")
	while R.truth(R.binary("!=", R.lget(l, "o"), R.lget(l, "formParent"))):
		pass
		if R.truth(R.binary("is", R.lget(l, "o"), R.klass("fl.core.UIComponent"))):
			pass
			if R.truth(R.unary("!", R.get_value(R.invoke(R.klass("fl.core.UIComponent"), [R.lget(l, "o")]), "enabled"))):
				pass
				return false
		else:
			pass
			if R.truth(R.binary("is", R.lget(l, "o"), R.klass("TextField"))):
				pass
				R.lset(l, "tf", R.invoke(R.klass("TextField"), [R.lget(l, "o")]), "=")
				if R.truth((R.binary("==", R.get_value(R.lget(l, "tf"), "type"), R.get_value(R.resolve(c, "TextFieldType", "fl.managers.FocusManager"), "DYNAMIC")) or R.unary("!", R.get_value(R.lget(l, "tf"), "selectable")))):
					pass
					return false
			else:
				pass
				if R.truth(R.binary("is", R.lget(l, "o"), R.resolve(c, "SimpleButton", "fl.managers.FocusManager"))):
					pass
					R.lset(l, "sb", R.invoke(R.resolve(c, "SimpleButton", "fl.managers.FocusManager"), [R.lget(l, "o")]), "=")
					if R.truth(R.unary("!", R.get_value(R.lget(l, "sb"), "enabled"))):
						pass
						return false
		if R.truth(R.unary("!", R.get_value(R.lget(l, "o"), "visible"))):
			pass
			return false
		R.lset(l, "o", R.get_value(R.lget(l, "o"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return true
	return null


static func c2715_f_tabEnabledChangeHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_registeredFocusableObject: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["calculateCandidates"] = true
	v_o = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	v_registeredFocusableObject = R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true)
	if R.truth(R.get_value(v_o, "tabEnabled")):
		pass
		if R.truth(R.logical_and(R.unary("!", v_registeredFocusableObject), func(): return R.call_member(c, "isTabVisible", [v_o]))):
			pass
			if R.truth(R.unary("!", R.binary("is", v_o, R.klass("fl.managers.IFocusManagerComponent")))):
				pass
				R.set_value(v_o, "focusRect", false, "=")
			R.set_value((c).fields.get("focusableObjects"), v_o, true, "=")
	else:
		pass
		if R.truth(v_registeredFocusableObject):
			pass
			R.delete_value((c).fields.get("focusableObjects"), v_o)
	return null


static func c2715_f_tabIndexChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["calculateCandidates"] = true
	return null


static func c2715_f_tabChildrenChangeHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.binary("!=", R.get_value(v_event, "target"), R.get_value(v_event, "currentTarget"))):
		pass
		return null
	(c).fields["calculateCandidates"] = true
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObjectContainer")
	if R.truth(R.get_value(v_o, "tabChildren")):
		pass
		R.call_member(c, "addFocusables", [v_o, true])
	else:
		pass
		R.call_member(c, "removeFocusables", [v_o])
	return null


static func c2715_f_deactivate(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError"}
	l["se"] = null
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	(c).fields["focusableObjects"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.FocusManager"), [true]), "Dictionary")
	(c).fields["focusableCandidates"] = R.coerce(null, "Array")
	(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
	(c).fields["defButton"] = R.coerce(null, "Button")
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "ADDED"), R.get_value(c, "addedHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "REMOVED"), R.get_value(c, "removedHandler"), false])
	R.last_error = null
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.get_value(c, "mouseFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.get_value(c, "keyFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "activateHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "deactivateHandler"), false])
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.get_value(c, "mouseFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.get_value(c, "keyFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "activateHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "deactivateHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_IN"), R.get_value(c, "focusInHandler"), true])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_OUT"), R.get_value(c, "focusOutHandler"), true])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "mouseDownHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "keyDownHandler"), true])
	(c).fields["activated"] = false
	return null


static func c2715_f_focusInHandler(c: Variant, a: Array) -> Variant:
	var v_x: Variant = null
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	v_x = R.coerce(null, "Button")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	if R.truth(R.invoke(R.get_value(R.get_value(c, "form"), "contains"), [v_target])):
		pass
		(c).fields["lastFocus"] = R.coerce(R.call_member(c, "findFocusManagerComponent", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_target])]), "InteractiveObject")
		if R.truth(R.binary("is", (c).fields.get("lastFocus"), R.klass("fl.controls.Button"))):
			pass
			v_x = R.coerce(R.invoke(R.klass("fl.controls.Button"), [(c).fields.get("lastFocus")]), "Button")
			if R.truth((c).fields.get("defButton")):
				pass
				R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
				(c).fields["defButton"] = R.coerce(v_x, "Button")
				R.set_value(v_x, "emphasized", true, "=")
		else:
			pass
			if R.truth((R.truth((c).fields.get("defButton")) and R.binary("!=", (c).fields.get("defButton"), (c).fields.get("_defaultButton")))):
				pass
				R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
				(c).fields["defButton"] = R.coerce((c).fields.get("_defaultButton"), "Button")
				R.set_value((c).fields.get("_defaultButton"), "emphasized", true, "=")
	return null


static func c2715_f_focusOutHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")), "InteractiveObject")
	return null


static func c2715_f_activateHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	if R.truth((c).fields.get("lastFocus")):
		pass
		if R.truth(R.binary("is", (c).fields.get("lastFocus"), R.klass("fl.managers.IFocusManagerComponent"))):
			pass
			R.invoke(R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [(c).fields.get("lastFocus")]), "setFocus"), [])
		else:
			pass
			R.set_value(R.get_value(R.get_value(c, "form"), "stage"), "focus", (c).fields.get("lastFocus"), "=")
	(c).fields["lastAction"] = R.coerce("ACTIVATE", "String")
	return null


static func c2715_f_deactivateHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	return null


static func c2715_f_mouseFocusChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.binary("is", R.get_value(v_event, "relatedObject"), R.klass("TextField"))):
		pass
		return null
	R.invoke(R.get_value(v_event, "preventDefault"), [])
	return null


static func c2715_f_keyFocusChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	R.set_value(c, "showFocusIndicator", true, "=")
	if R.truth(((R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "TAB")) or R.binary("==", R.get_value(v_event, "keyCode"), 0)) and R.unary("!", R.invoke(R.get_value(v_event, "isDefaultPrevented"), [])))):
		pass
		R.call_member(c, "setFocusToNextObject", [v_event])
		R.invoke(R.get_value(v_event, "preventDefault"), [])
	return null


static func c2715_f_keyDownHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "TAB"))):
		pass
		(c).fields["lastAction"] = R.coerce("KEY", "String")
		if R.truth((c).fields.get("calculateCandidates")):
			pass
			R.call_member(c, "sortFocusableObjects", [])
			(c).fields["calculateCandidates"] = false
	if R.truth(R.logical_and((R.truth(R.logical_and(R.get_value(c, "defaultButtonEnabled"), func(): return R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "ENTER")))) and R.truth(R.get_value(c, "defaultButton"))), func(): return R.get_value((c).fields.get("defButton"), "enabled"))):
		pass
		R.call_member(c, "sendDefaultButtonEvent", [])
	return null


static func c2715_f_mouseDownHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.invoke(R.get_value(v_event, "isDefaultPrevented"), [])):
		pass
		return null
	v_o = R.coerce(R.call_member(c, "getTopLevelFocusTarget", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")])]), "InteractiveObject")
	if R.truth(R.unary("!", v_o)):
		pass
		return null
	R.set_value(c, "showFocusIndicator", false, "=")
	if R.truth(((R.binary("!=", v_o, (c).fields.get("lastFocus")) or R.binary("==", (c).fields.get("lastAction"), "ACTIVATE")) and R.unary("!", R.binary("is", v_o, R.klass("TextField"))))):
		pass
		R.call_member(c, "setFocus", [v_o])
	(c).fields["lastAction"] = R.coerce("MOUSEDOWN", "String")
	return null


static func c2715_f_get_defaultButton(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_defaultButton")
	return null


static func c2715_f_set_defaultButton(c: Variant, a: Array) -> Variant:
	var v_button: Variant = null
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "Button")
	v_button = R.coerce((R.invoke(R.klass("fl.controls.Button"), [v_value]) if R.truth(v_value) else null), "Button")
	if R.truth(R.binary("!=", v_button, (c).fields.get("_defaultButton"))):
		pass
		if R.truth((c).fields.get("_defaultButton")):
			pass
			R.set_value((c).fields.get("_defaultButton"), "emphasized", false, "=")
		if R.truth((c).fields.get("defButton")):
			pass
			R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
		(c).fields["_defaultButton"] = R.coerce(v_button, "Button")
		(c).fields["defButton"] = R.coerce(v_button, "Button")
		if R.truth(v_button):
			pass
			R.set_value(v_button, "emphasized", true, "=")
	return null


static func c2715_f_sendDefaultButtonEvent(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("defButton"), "dispatchEvent", [R.construct(R.klass("MouseEvent"), [R.get_value(R.klass("MouseEvent"), "CLICK")])])
	return null


static func c2715_f_setFocusToNextObject(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", R.call_member(c, "hasFocusableObjects", []))):
		pass
		return null
	v_o = R.coerce(R.call_member(c, "getNextFocusManagerComponent", [R.get_value(v_event, "shiftKey")]), "InteractiveObject")
	if R.truth(v_o):
		pass
		R.call_member(c, "setFocus", [v_o])
	return null


static func c2715_f_hasFocusableObjects(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = null
	v_o = R.coerce(null, "Object")
	v__loc2_ = R.coerce(0, "int")
	v__loc3_ = R.coerce((c).fields.get("focusableObjects"), "*")
	for __t2 in R.iterate(v__loc3_, false):
		v_o = R.coerce(__t2, "Object")
		return true
	return false
	return null


static func c2715_f_getNextFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var v_tg: Variant = null
	var v_o: Variant = null
	var v_g: Variant = null
	var v_i: Variant = 0
	var v_bSearchAll: Variant = false
	var v_start: Variant = 0
	var v_j: Variant = 0
	var v_backward: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_tg = R.coerce(null, "IFocusManagerGroup")
	if R.truth(R.unary("!", R.call_member(c, "hasFocusableObjects", []))):
		pass
		return null
	if R.truth((c).fields.get("calculateCandidates")):
		pass
		R.call_member(c, "sortFocusableObjects", [])
		(c).fields["calculateCandidates"] = false
	v_o = R.coerce(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "focus"), "DisplayObject")
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.call_member(c, "findFocusManagerComponent", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o])])]), "DisplayObject")
	v_g = R.coerce("", "String")
	if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
		pass
		v_tg = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
		v_g = R.coerce(R.get_value(v_tg, "groupName"), "String")
	v_i = R.coerce(R.call_member(c, "getIndexOfFocusedObject", [v_o]), "int")
	v_bSearchAll = false
	v_start = R.coerce(v_i, "int")
	if R.truth(R.binary("==", v_i, R.unary("-", 1))):
		pass
		if R.truth(v_backward):
			pass
			v_i = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
		v_bSearchAll = true
	v_j = R.coerce(R.call_member(c, "getIndexOfNextObject", [v_i, v_backward, v_bSearchAll, v_g]), "int")
	return R.call_member(c, "findFocusManagerComponent", [R.get_value((c).fields.get("focusableCandidates"), v_j)])
	return null


static func c2715_f_getIndexOfFocusedObject(c: Variant, a: Array) -> Variant:
	var v_n: Variant = 0
	var v_i: Variant = 0
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	v_n = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_n))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("focusableCandidates"), v_i), v_o)):
			pass
			return v_i
		v_i = R.signed32(v_i + 1)
	return R.unary("-", 1)
	return null


static func c2715_f_getIndexOfNextObject(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_tg1: Variant = null
	var v_j: Variant = 0
	var v_obj: Variant = null
	var v_tg2: Variant = null
	var v_n: Variant = 0
	var v_start: Variant = 0
	var v_i: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_shiftKey: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bSearchAll: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_groupName: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	v_o = R.coerce(null, "DisplayObject")
	v_tg1 = R.coerce(null, "IFocusManagerGroup")
	v_j = R.coerce(0, "int")
	v_obj = R.coerce(null, "DisplayObject")
	v_tg2 = R.coerce(null, "IFocusManagerGroup")
	v_n = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
	v_start = R.coerce(v_i, "int")
	while R.truth(true):
		pass
		if R.truth(v_shiftKey):
			pass
			v_i = R.signed32(v_i - 1)
		else:
			pass
			v_i = R.signed32(v_i + 1)
		if R.truth(v_bSearchAll):
			pass
			if R.truth((v_shiftKey and (float(v_i) < float(0)))):
				pass
				break
			if R.truth((R.unary("!", v_shiftKey) and (float(v_i) == float(v_n)))):
				pass
				break
		else:
			pass
			v_i = R.coerce(R.coerce(R.binary("%", (float(v_i) + float(v_n)), v_n), "int"), "int")
			if R.truth((float(v_start) == float(v_i))):
				pass
				break
		if R.truth(R.call_member(c, "isValidFocusCandidate", [R.get_value((c).fields.get("focusableCandidates"), v_i), v_groupName])):
			pass
			v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.call_member(c, "findFocusManagerComponent", [R.get_value((c).fields.get("focusableCandidates"), v_i)])]), "DisplayObject")
			if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
				pass
				v_tg1 = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
				v_j = R.coerce(0, "int")
				while R.truth(R.binary("<", v_j, R.get_value((c).fields.get("focusableCandidates"), "length"))):
					pass
					v_obj = R.coerce(R.get_value((c).fields.get("focusableCandidates"), v_j), "DisplayObject")
					if R.truth(R.binary("is", v_obj, R.klass("fl.managers.IFocusManagerGroup"))):
						pass
						v_tg2 = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_obj]), "IFocusManagerGroup")
						if R.truth(R.logical_and(R.binary("==", R.get_value(v_tg2, "groupName"), R.get_value(v_tg1, "groupName")), func(): return R.get_value(v_tg2, "selected"))):
							pass
							v_i = R.coerce(v_j, "int")
							break
					v_j = R.signed32(v_j + 1)
			return v_i
	return v_i
	return null


static func c2715_f_sortFocusableObjects(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_c: Variant = null
	v_o = R.coerce(null, "Object")
	v_c = R.coerce(null, "InteractiveObject")
	(c).fields["focusableCandidates"] = R.coerce([], "Array")
	for __t3 in R.iterate((c).fields.get("focusableObjects"), false):
		v_o = R.coerce(__t3, "Object")
		v_c = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o]), "InteractiveObject")
		if R.truth(((R.truth(R.get_value(v_c, "tabIndex")) and R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "fl.managers.FocusManager"), [R.num(R.get_value(v_c, "tabIndex"))])))) and R.binary(">", R.get_value(v_c, "tabIndex"), 0))):
			pass
			R.call_member(c, "sortFocusableObjectsTabIndex", [])
			return null
		R.invoke(R.get_value((c).fields.get("focusableCandidates"), "push"), [v_c])
	R.invoke(R.get_value((c).fields.get("focusableCandidates"), "sort"), [R.get_value(c, "sortByDepth")])
	return null


static func c2715_f_sortFocusableObjectsTabIndex(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_c: Variant = null
	v_o = R.coerce(null, "Object")
	v_c = R.coerce(null, "InteractiveObject")
	(c).fields["focusableCandidates"] = R.coerce([], "Array")
	for __t4 in R.iterate((c).fields.get("focusableObjects"), false):
		v_o = R.coerce(__t4, "Object")
		v_c = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o]), "InteractiveObject")
		if R.truth((R.truth(R.get_value(v_c, "tabIndex")) and R.unary("!", R.invoke(R.resolve(c, "isNaN", "fl.managers.FocusManager"), [R.num(R.get_value(v_c, "tabIndex"))])))):
			pass
			R.invoke(R.get_value((c).fields.get("focusableCandidates"), "push"), [v_c])
	R.invoke(R.get_value((c).fields.get("focusableCandidates"), "sort"), [R.get_value(c, "sortByTabIndex")])
	return null


static func c2715_f_sortByDepth(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"index": "int", "tmp": "String", "tmp2": "String", "val1": "String", "val2": "String", "zeros": "String", "a": "DisplayObject", "b": "DisplayObject", "se1": "SecurityError", "se2": "SecurityError", "aa": "InteractiveObject", "bb": "InteractiveObject"}
	l["index"] = 0
	l["tmp"] = null
	l["tmp2"] = null
	l["val1"] = null
	l["val2"] = null
	l["zeros"] = null
	l["a"] = null
	l["b"] = null
	l["se1"] = null
	l["se2"] = null
	l["aa"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	l["bb"] = R.coerce((a[1] if a.size() > 1 else null), "InteractiveObject")
	R.lset(l, "index", 0)
	R.lset(l, "tmp", null)
	R.lset(l, "tmp2", null)
	R.lset(l, "val1", "")
	R.lset(l, "val2", "")
	R.lset(l, "zeros", "0000")
	R.lset(l, "a", R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.lget(l, "aa")]))
	R.lset(l, "b", R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.lget(l, "bb")]))
	R.last_error = null
	while R.truth((R.binary("!=", R.lget(l, "a"), R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")])) and R.truth(R.get_value(R.lget(l, "a"), "parent")))):
		pass
		R.lset(l, "index", R.call_member(c, "getChildIndex", [R.get_value(R.lget(l, "a"), "parent"), R.lget(l, "a")]), "=")
		R.lset(l, "tmp", R.invoke(R.get_value(R.lget(l, "index"), "toString"), [16]), "=")
		if R.truth(R.binary("<", R.get_value(R.lget(l, "tmp"), "length"), 4)):
			pass
			R.lset(l, "tmp2", R.binary("+", R.invoke(R.get_value(R.lget(l, "zeros"), "substring"), [0, (float(4) - R.num(R.get_value(R.lget(l, "tmp"), "length")))]), R.lget(l, "tmp")), "=")
		R.lset(l, "val1", R.binary("+", R.lget(l, "tmp2"), R.lget(l, "val1")), "=")
		R.lset(l, "a", R.get_value(R.lget(l, "a"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se1", R.last_error)
		R.last_error = null
		pass
	R.last_error = null
	while R.truth((R.binary("!=", R.lget(l, "b"), R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")])) and R.truth(R.get_value(R.lget(l, "b"), "parent")))):
		pass
		R.lset(l, "index", R.call_member(c, "getChildIndex", [R.get_value(R.lget(l, "b"), "parent"), R.lget(l, "b")]), "=")
		R.lset(l, "tmp", R.invoke(R.get_value(R.lget(l, "index"), "toString"), [16]), "=")
		if R.truth(R.binary("<", R.get_value(R.lget(l, "tmp"), "length"), 4)):
			pass
			R.lset(l, "tmp2", R.binary("+", R.invoke(R.get_value(R.lget(l, "zeros"), "substring"), [0, (float(4) - R.num(R.get_value(R.lget(l, "tmp"), "length")))]), R.lget(l, "tmp")), "=")
		R.lset(l, "val2", R.binary("+", R.lget(l, "tmp2"), R.lget(l, "val2")), "=")
		R.lset(l, "b", R.get_value(R.lget(l, "b"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se2", R.last_error)
		R.last_error = null
		pass
	return (1 if R.truth(R.binary(">", R.lget(l, "val1"), R.lget(l, "val2"))) else (R.unary("-", 1) if R.truth(R.binary("<", R.lget(l, "val1"), R.lget(l, "val2"))) else 0))
	return null


static func c2715_f_getChildIndex(c: Variant, a: Array) -> Variant:
	var v_parent: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	var v_child: Variant = R.coerce((a[1] if a.size() > 1 else null), "DisplayObject")
	return R.invoke(R.get_value(v_parent, "getChildIndex"), [v_child])
	return null


static func c2715_f_sortByTabIndex(c: Variant, a: Array) -> Variant:
	var v_a: Variant = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else null), "InteractiveObject")
	return (1 if R.truth(R.binary(">", R.get_value(v_a, "tabIndex"), R.get_value(v_b, "tabIndex"))) else (R.unary("-", 1) if R.truth(R.binary("<", R.get_value(v_a, "tabIndex"), R.get_value(v_b, "tabIndex"))) else R.coerce(R.call_member(c, "sortByDepth", [v_a, v_b]), "int")))
	return null


static func c2715_f_get_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_defaultButtonEnabled")
	return null


static func c2715_f_set_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_defaultButtonEnabled"] = v_value
	return null


static func c2715_f_get_nextTabIndex(c: Variant, a: Array) -> Variant:
	return 0
	return null


static func c2715_f_get_showFocusIndicator(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_showFocusIndicator")
	return null


static func c2715_f_set_showFocusIndicator(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_showFocusIndicator"] = v_value
	return null


static func c2715_f_set_form(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	(c).fields["_form"] = R.coerce(v_value, "DisplayObjectContainer")
	return null


static func c2715_f_getFocus(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	v_o = R.coerce(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "focus"), "InteractiveObject")
	return R.call_member(c, "findFocusManagerComponent", [v_o])
	return null


static func c2715_f_findFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"p": "InteractiveObject", "se": "SecurityError", "component": "InteractiveObject"}
	l["p"] = null
	l["se"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	R.lset(l, "p", R.lget(l, "component"))
	R.last_error = null
	while R.truth(R.lget(l, "component")):
		pass
		if R.truth(R.logical_and(R.binary("is", R.lget(l, "component"), R.klass("fl.managers.IFocusManagerComponent")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "component")]), "focusEnabled"))):
			pass
			return R.lget(l, "component")
		R.lset(l, "component", R.get_value(R.lget(l, "component"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return R.lget(l, "p")
	return null


static func c2715_f_getTopLevelFocusTarget(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError", "o": "InteractiveObject"}
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	R.last_error = null
	while R.truth(R.binary("!=", R.lget(l, "o"), R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(c, "form")]))):
		pass
		if R.truth(R.logical_and(R.logical_and(R.logical_and(R.binary("is", R.lget(l, "o"), R.klass("fl.managers.IFocusManagerComponent")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "o")]), "focusEnabled")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "o")]), "mouseFocusEnabled")), func(): return R.get_value(R.invoke(R.klass("fl.core.UIComponent"), [R.lget(l, "o")]), "enabled"))):
			pass
			return R.lget(l, "o")
		R.lset(l, "o", R.get_value(R.lget(l, "o"), "parent"), "=")
		if R.truth(R.binary("==", R.lget(l, "o"), null)):
			pass
			break
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return null
	return null


static func c2719_f_StyleManager(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.managers.StyleManager"), [])
	(c).fields["styleToClassesHash"] = R.coerce({}, "Object")
	(c).fields["classToInstancesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["classToStylesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["classToDefaultStylesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["globalStyles"] = R.coerce(R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "Object")
	return null


static func c2719_f_getInstance(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.static_value("fl.managers.StyleManager", "_instance"), null)):
		pass
		R.assign(c, "_instance", "fl.managers.StyleManager", R.construct(R.klass("fl.managers.StyleManager"), []), "=")
	return R.static_value("fl.managers.StyleManager", "_instance")
	return null


static func c2719_f_registerInstance(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"target": "Class", "defaultStyles": "Object", "styleToClasses": "Object", "n": "String", "inst": "StyleManager", "classDef": "Class", "err": "Error", "e": "Error", "instance": "UIComponent"}
	l["target"] = null
	l["defaultStyles"] = null
	l["styleToClasses"] = null
	l["n"] = null
	l["inst"] = null
	l["classDef"] = null
	l["err"] = null
	l["e"] = null
	l["instance"] = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	R.lset(l, "target", null)
	R.lset(l, "defaultStyles", null)
	R.lset(l, "styleToClasses", null)
	R.lset(l, "n", null)
	R.lset(l, "inst", R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []))
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [R.lget(l, "instance")]))
	if R.truth(R.binary("==", R.lget(l, "classDef"), null)):
		pass
		return null
	if R.truth(R.binary("==", R.get_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef")), null)):
		pass
		R.set_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef"), R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "=")
		R.lset(l, "target", R.lget(l, "classDef"), "=")
		while R.truth(R.binary("==", R.lget(l, "defaultStyles"), null)):
			pass
			if R.truth(R.binary("!=", R.get_value(R.lget(l, "target"), "getStyleDefinition"), null)):
				pass
				R.lset(l, "defaultStyles", R.invoke(R.get_value(R.lget(l, "target"), "getStyleDefinition"), []), "=")
				break
			R.last_error = null
			R.lset(l, "target", R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(R.lget(l, "instance"), "loaderInfo"), "applicationDomain"), "getDefinition"), [R.invoke(R.resolve(c, "getQualifiedSuperclassName", "fl.managers.StyleManager"), [R.lget(l, "target")])]), R.resolve(c, "Class", "fl.managers.StyleManager")), "=")
			if R.last_error != null:
				R.lset(l, "err", R.last_error)
				R.last_error = null
				R.last_error = null
				R.lset(l, "target", R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "getQualifiedSuperclassName", "fl.managers.StyleManager"), [R.lget(l, "target")])]), R.resolve(c, "Class", "fl.managers.StyleManager")), "=")
				if R.last_error != null:
					R.lset(l, "e", R.last_error)
					R.last_error = null
					R.lset(l, "defaultStyles", R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "=")
					break
		R.lset(l, "styleToClasses", (R.lget(l, "inst")).fields.get("styleToClassesHash"), "=")
		for __t1 in R.iterate(R.lget(l, "defaultStyles"), false):
			R.lset(l, "n", __t1, "=")
			if R.truth(R.binary("==", R.get_value(R.lget(l, "styleToClasses"), R.lget(l, "n")), null)):
				pass
				R.set_value(R.lget(l, "styleToClasses"), R.lget(l, "n"), R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "=")
			R.set_value(R.get_value(R.lget(l, "styleToClasses"), R.lget(l, "n")), R.lget(l, "classDef"), true, "=")
		R.set_value((R.lget(l, "inst")).fields.get("classToDefaultStylesDict"), R.lget(l, "classDef"), R.lget(l, "defaultStyles"), "=")
		if R.truth(R.binary("==", R.get_value((R.lget(l, "inst")).fields.get("classToStylesDict"), R.lget(l, "classDef")), null)):
			pass
			R.set_value((R.lget(l, "inst")).fields.get("classToStylesDict"), R.lget(l, "classDef"), {}, "=")
	R.set_value(R.get_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef")), R.lget(l, "instance"), true, "=")
	R.invoke(R.resolve(c, "setSharedStyles", "fl.managers.StyleManager"), [R.lget(l, "instance")])
	return null


static func c2719_f_setSharedStyles(c: Variant, a: Array) -> Variant:
	var v_n: Variant = null
	var v_inst: Variant = null
	var v_classDef: Variant = null
	var v_styles: Variant = null
	var v_instance: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	v_n = R.coerce(null, "String")
	v_inst = R.coerce(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "StyleManager")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_instance]), "Class")
	v_styles = R.coerce(R.get_value((v_inst).fields.get("classToDefaultStylesDict"), v_classDef), "Object")
	for __t2 in R.iterate(v_styles, false):
		v_n = R.coerce(__t2, "String")
		R.call_member(v_instance, "setSharedStyle", [v_n, R.invoke(R.resolve(c, "getSharedStyle", "fl.managers.StyleManager"), [v_instance, v_n])])
	return null


static func c2719_f_getSharedStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_inst: Variant = null
	var v_style: Variant = null
	var v_instance: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_instance]), "Class")
	v_inst = R.coerce(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "StyleManager")
	v_style = R.coerce(R.get_value(R.get_value((v_inst).fields.get("classToStylesDict"), v_classDef), v_name), "Object")
	if R.truth(R.binary("!=", v_style, null)):
		pass
		return v_style
	v_style = R.coerce(R.get_value((v_inst).fields.get("globalStyles"), v_name), "Object")
	if R.truth(R.binary("!=", v_style, null)):
		pass
		return v_style
	return R.get_value(R.get_value((v_inst).fields.get("classToDefaultStylesDict"), v_classDef), v_name)
	return null


static func c2719_f_getComponentStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_styleHash: Variant = null
	var v_component: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_component]), "Class")
	v_styleHash = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), v_classDef), "Object")
	return (null if R.truth(R.binary("==", v_styleHash, null)) else R.get_value(v_styleHash, v_name))
	return null


static func c2719_f_clearComponentStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_styleHash: Variant = null
	var v_component: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_component]), "Class")
	v_styleHash = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), v_classDef), "Object")
	if R.truth((R.binary("!=", v_styleHash, null) and R.binary("!=", R.get_value(v_styleHash, v_name), null))):
		pass
		R.delete_value(v_styleHash, v_name)
		R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [v_classDef, v_name])
	return null


static func c2719_f_setComponentStyle(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"classDef": "Class", "styleHash": "Object", "component": "Object", "name": "String", "style": "Object"}
	l["classDef"] = null
	l["styleHash"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["name"] = R.coerce((a[1] if a.size() > 1 else null), "String")
	l["style"] = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [R.lget(l, "component")]))
	R.lset(l, "styleHash", R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), R.lget(l, "classDef")))
	if R.truth(R.binary("==", R.lget(l, "styleHash"), null)):
		pass
		R.lset(l, "styleHash", R.set_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), R.lget(l, "classDef"), {}, "="), "=")
	if R.truth(R.binary("==", R.lget(l, "styleHash"), R.lget(l, "style"))):
		pass
		return null
	R.set_value(R.lget(l, "styleHash"), R.lget(l, "name"), R.lget(l, "style"), "=")
	R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [R.lget(l, "classDef"), R.lget(l, "name")])
	return null


static func c2719_f_getClassDef(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "component": "Object"}
	l["e"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.binary("is", R.lget(l, "component"), R.resolve(c, "Class", "fl.managers.StyleManager"))):
		pass
		return R.binary("as", R.lget(l, "component"), R.resolve(c, "Class", "fl.managers.StyleManager"))
	R.last_error = null
	return R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "getQualifiedClassName", "fl.managers.StyleManager"), [R.lget(l, "component")])]), R.resolve(c, "Class", "fl.managers.StyleManager"))
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		if R.truth(R.binary("is", R.lget(l, "component"), R.klass("fl.core.UIComponent"))):
			pass
			R.last_error = null
			return R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(R.lget(l, "component"), "loaderInfo"), "applicationDomain"), "getDefinition"), [R.invoke(R.resolve(c, "getQualifiedClassName", "fl.managers.StyleManager"), [R.lget(l, "component")])]), R.resolve(c, "Class", "fl.managers.StyleManager"))
			if R.last_error != null:
				R.lset(l, "e", R.last_error)
				R.last_error = null
				pass
	return null
	return null


static func c2719_f_invalidateStyle(c: Variant, a: Array) -> Variant:
	var v_classRef: Variant = null
	var v_classes: Variant = null
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_classRef = R.coerce(null, "Object")
	v_classes = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "styleToClassesHash"), v_name), "Dictionary")
	if R.truth(R.binary("==", v_classes, null)):
		pass
		return null
	for __t3 in R.iterate(v_classes, false):
		v_classRef = R.coerce(__t3, "Object")
		R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "Class", "fl.managers.StyleManager"), [v_classRef]), v_name])
	return null


static func c2719_f_invalidateComponentStyle(c: Variant, a: Array) -> Variant:
	var v_obj: Variant = null
	var v_instance: Variant = null
	var v_instances: Variant = null
	var v_componentClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_obj = R.coerce(null, "Object")
	v_instance = R.coerce(null, "UIComponent")
	v_instances = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToInstancesDict"), v_componentClass), "Dictionary")
	if R.truth(R.binary("==", v_instances, null)):
		pass
		return null
	for __t4 in R.iterate(v_instances, false):
		v_obj = R.coerce(__t4, "Object")
		v_instance = R.coerce(R.binary("as", v_obj, R.klass("fl.core.UIComponent")), "UIComponent")
		if R.truth(R.binary("!=", v_instance, null)):
			pass
			R.call_member(v_instance, "setSharedStyle", [v_name, R.invoke(R.resolve(c, "getSharedStyle", "fl.managers.StyleManager"), [v_instance, v_name])])
	return null


static func c2719_f_setStyle(c: Variant, a: Array) -> Variant:
	var v_styles: Variant = null
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_style: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v_styles = R.coerce(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "globalStyles"), "Object")
	if R.truth((R.binary("===", R.get_value(v_styles, v_name), v_style) and R.unary("!", R.binary("is", v_style, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value(v_styles, v_name, v_style, "=")
	R.invoke(R.resolve(c, "invalidateStyle", "fl.managers.StyleManager"), [v_name])
	return null


static func c2719_f_clearStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.resolve(c, "setStyle", "fl.managers.StyleManager"), [v_name, null])
	return null


static func c2719_f_getStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "globalStyles"), v_name)
	return null


static func c2720_f_Color(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 1), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 1), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "Number")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "Number")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "Number")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "Number")
	R.invoke(R.super_ref(c, "fl.motion.Color"), [v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7, v_param8])
	return null


static func c2720_f_fromXML(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "XML")
	return R.invoke(R.klass("fl.motion.Color"), [R.invoke(R.get_value(R.construct(R.klass("fl.motion.Color"), []), "parseXML"), [v_param1])])
	return null


static func c2720_f_interpolateTransform(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = NAN
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ColorTransform")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "ColorTransform")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v__loc4_ = float((float(1) - float(v_param3)))
	return R.construct(R.klass("ColorTransform"), [(float((R.num(R.get_value(v_param1, "redMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "redMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "greenMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "greenMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "blueMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "blueMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "alphaMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "alphaMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "redOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "redOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "greenOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "greenOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "blueOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "blueOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "alphaOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "alphaOffset")) * float(v_param3))))])
	return null


static func c2720_f_interpolateColor(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = NAN
	var v__loc5_: Variant = 0
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc11_: Variant = 0
	var v__loc12_: Variant = 0
	var v__loc13_: Variant = 0
	var v__loc14_: Variant = 0
	var v__loc15_: Variant = 0
	var v__loc16_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v__loc4_ = float((float(1) - float(v_param3)))
	v__loc5_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 24), 255), "uint"), "uint")
	v__loc6_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 16), 255), "uint"), "uint")
	v__loc7_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 8), 255), "uint"), "uint")
	v__loc8_ = R.coerce(R.coerce(R.binary("&", v_param1, 255), "uint"), "uint")
	v__loc9_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 24), 255), "uint"), "uint")
	v__loc10_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 16), 255), "uint"), "uint")
	v__loc11_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 8), 255), "uint"), "uint")
	v__loc12_ = R.coerce(R.coerce(R.binary("&", v_param2, 255), "uint"), "uint")
	v__loc13_ = R.coerce((float((float(v__loc5_) * float(v__loc4_))) + float((float(v__loc9_) * float(v_param3)))), "uint")
	v__loc14_ = R.coerce((float((float(v__loc6_) * float(v__loc4_))) + float((float(v__loc10_) * float(v_param3)))), "uint")
	v__loc15_ = R.coerce((float((float(v__loc7_) * float(v__loc4_))) + float((float(v__loc11_) * float(v_param3)))), "uint")
	v__loc16_ = R.coerce((float((float(v__loc8_) * float(v__loc4_))) + float((float(v__loc12_) * float(v_param3)))), "uint")
	return R.coerce(R.binary("|", R.binary("|", R.binary("|", R.binary("<<", v__loc13_, 24), R.binary("<<", v__loc14_, 16)), R.binary("<<", v__loc15_, 8)), v__loc16_), "uint")
	return null


static func c2720_f_get_brightness(c: Variant, a: Array) -> Variant:
	return ((float(1) - R.num(R.get_value(c, "redMultiplier"))) if R.truth(R.get_value(c, "redOffset")) else (R.num(R.get_value(c, "redMultiplier")) - float(1)))
	return null


static func c2720_f_set_brightness(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc2_": "Number", "_loc3_": "Number", "param1": "Number"}
	l["_loc2_"] = NAN
	l["_loc3_"] = NAN
	l["param1"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(R.lget(l, "param1")) > float(1))):
		pass
		R.lset(l, "param1", 1, "=")
	else:
		pass
		if R.truth(R.binary("<", R.lget(l, "param1"), R.unary("-", 1))):
			pass
			R.lset(l, "param1", R.unary("-", 1), "=")
	R.lset(l, "_loc2_", (float(1) - float(absf(float(R.lget(l, "param1"))))))
	R.lset(l, "_loc3_", 0)
	if R.truth((float(R.lget(l, "param1")) > float(0))):
		pass
		R.lset(l, "_loc3_", (float(R.lget(l, "param1")) * float(255)), "=")
	R.set_value(c, "redMultiplier", R.set_value(c, "greenMultiplier", R.set_value(c, "blueMultiplier", R.lget(l, "_loc2_"), "="), "="), "=")
	R.set_value(c, "redOffset", R.set_value(c, "greenOffset", R.set_value(c, "blueOffset", R.lget(l, "_loc3_"), "="), "="), "=")
	return null


static func c2720_f_setTint(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc3_": "uint", "_loc4_": "uint", "_loc5_": "uint", "param1": "uint", "param2": "Number"}
	l["_loc3_"] = 0
	l["_loc4_"] = 0
	l["_loc5_"] = 0
	l["param1"] = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_tintColor"] = float(R.lget(l, "param1"))
	(c).fields["_tintMultiplier"] = float(R.lget(l, "param2"))
	R.set_value(c, "redMultiplier", R.set_value(c, "greenMultiplier", R.set_value(c, "blueMultiplier", (float(1) - float(R.lget(l, "param2"))), "="), "="), "=")
	R.lset(l, "_loc3_", R.coerce(R.binary("&", R.binary(">>", R.lget(l, "param1"), 16), 255), "uint"))
	R.lset(l, "_loc4_", R.coerce(R.binary("&", R.binary(">>", R.lget(l, "param1"), 8), 255), "uint"))
	R.lset(l, "_loc5_", R.coerce(R.binary("&", R.lget(l, "param1"), 255), "uint"))
	R.set_value(c, "redOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc3_")) * float(R.lget(l, "param2")))]), "=")
	R.set_value(c, "greenOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc4_")) * float(R.lget(l, "param2")))]), "=")
	R.set_value(c, "blueOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc5_")) * float(R.lget(l, "param2")))]), "=")
	return null


static func c2720_f_get_tintColor(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tintColor")
	return null


static func c2720_f_set_tintColor(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	R.call_member(c, "setTint", [v_param1, R.get_value(c, "tintMultiplier")])
	return null


static func c2720_f_deriveTintColor(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = NAN
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	v__loc1_ = float(R.binary("/", 1, R.get_value(c, "tintMultiplier")))
	v__loc2_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "redOffset")) * float(v__loc1_))]), "uint")
	v__loc3_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "greenOffset")) * float(v__loc1_))]), "uint")
	v__loc4_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "blueOffset")) * float(v__loc1_))]), "uint")
	return R.coerce(R.binary("|", R.binary("|", R.binary("<<", v__loc2_, 16), R.binary("<<", v__loc3_, 8)), v__loc4_), "uint")
	return null


static func c2720_f_get_tintMultiplier(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tintMultiplier")
	return null


static func c2720_f_set_tintMultiplier(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setTint", [R.get_value(c, "tintColor"), v_param1])
	return null


static func c2720_f_parseXML(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = 0
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "XML")
	v__loc3_ = R.coerce(null, "XML")
	v__loc4_ = R.coerce(null, "String")
	v__loc5_ = R.coerce(0, "uint")
	if R.truth(R.unary("!", v_param1)):
		pass
		return c
	v__loc2_ = R.coerce(R.get_value(R.invoke(R.get_value(v_param1, "elements"), []), 0), "XML")
	if R.truth(R.unary("!", v__loc2_)):
		pass
		return c
	for __t1 in R.iterate(R.invoke(R.get_value(v__loc2_, "attributes"), []), true):
		v__loc3_ = R.coerce(__t1, "XML")
		v__loc4_ = R.coerce(R.invoke(R.get_value(v__loc3_, "localName"), []), "String")
		if R.truth(R.binary("==", v__loc4_, "tintColor")):
			pass
			v__loc5_ = R.coerce(R.binary("as", R.num(R.invoke(R.get_value(v__loc3_, "toString"), [])), R.klass("uint")), "uint")
			R.set_value(c, "tintColor", v__loc5_, "=")
		else:
			pass
			R.set_value(c, v__loc4_, R.num(R.invoke(R.get_value(v__loc3_, "toString"), [])), "=")
	return c
	return null


static func c2735_f_TweenLite(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mode": "int", "$target": "Object", "$duration": "Number", "$vars": "Object"}
	l["mode"] = 0
	l["$target"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["$duration"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["$vars"] = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.invoke(R.super_ref(c, "gs.TweenLite"), [])
	if R.truth(R.binary("==", R.lget(l, "$target"), null)):
		pass
		return null
	if R.truth(R.unary("!", R.static_value("gs.TweenLite", "_classInitted"))):
		pass
		R.assign(c, "currentTime", "gs.TweenLite", R.invoke(R.resolve(c, "getTimer", "gs.TweenLite"), []), "=")
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_sprite"), "addEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "updateAll", "gs.TweenLite")])
		if R.truth(R.binary("==", R.static_value("gs.TweenLite", "overwriteManager"), null)):
			pass
			R.assign(c, "overwriteManager", "gs.TweenLite", {"mode": 1, "enabled": false}, "=")
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_timer"), "addEventListener"), ["timer", R.resolve(c, "killGarbage", "gs.TweenLite")])
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_timer"), "start"), [])
		R.assign(c, "_classInitted", "gs.TweenLite", true, "=")
	(c).fields["vars"] = R.coerce(R.lget(l, "$vars"), "Object")
	(c).fields["duration"] = R.coerce(R.logical_or(R.lget(l, "$duration"), func(): return 0.001), "Number")
	(c).fields["delay"] = R.coerce(R.logical_or(R.num(R.get_value(R.lget(l, "$vars"), "delay")), func(): return 0), "Number")
	(c).fields["combinedTimeScale"] = R.coerce(R.logical_or(R.num(R.get_value(R.lget(l, "$vars"), "timeScale")), func(): return 1), "Number")
	(c).fields["active"] = ((float(R.lget(l, "$duration")) == float(0)) and (float((c).fields.get("delay")) == float(0)))
	(c).fields["target"] = R.coerce(R.lget(l, "$target"), "Object")
	(c).fields["_isDisplayObject"] = R.binary("is", R.lget(l, "$target"), R.resolve(c, "DisplayObject", "gs.TweenLite"))
	if R.truth(R.unary("!", R.binary("is", R.get_value((c).fields.get("vars"), "ease"), R.resolve(c, "Function", "gs.TweenLite")))):
		pass
		R.set_value((c).fields.get("vars"), "ease", R.static_value("gs.TweenLite", "defaultEase"), "=")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "easeParams"), null)):
		pass
		R.set_value((c).fields.get("vars"), "proxiedEase", R.get_value((c).fields.get("vars"), "ease"), "=")
		R.set_value((c).fields.get("vars"), "ease", R.get_value(c, "easeProxy"), "=")
	(c).fields["ease"] = R.coerce(R.get_value((c).fields.get("vars"), "ease"), "Function")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "gs.TweenLite"), [R.num(R.get_value((c).fields.get("vars"), "autoAlpha"))]))):
		pass
		R.set_value((c).fields.get("vars"), "alpha", R.num(R.get_value((c).fields.get("vars"), "autoAlpha")), "=")
		R.set_value((c).fields.get("vars"), "visible", R.binary(">", R.get_value((c).fields.get("vars"), "alpha"), 0), "=")
	(c).fields["_specialVars"] = R.coerce((R.get_value((c).fields.get("vars"), "exposedProps") if R.truth(R.binary("==", R.get_value((c).fields.get("vars"), "isTV"), true)) else (c).fields.get("vars")), "Object")
	(c).fields["tweens"] = R.coerce([], "Array")
	(c).fields["_subTweens"] = R.coerce([], "Array")
	(c).fields["_hst"] = R.coerce(R.set_value(c, "initted", false, "="), "Boolean")
	(c).fields["initTime"] = float(R.static_value("gs.TweenLite", "currentTime"))
	(c).fields["startTime"] = float((float((c).fields.get("initTime")) + float((float((c).fields.get("delay")) * float(1000)))))
	R.lset(l, "mode", (R.coerce(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "mode"), "int") if R.truth((R.binary("==", R.get_value(R.lget(l, "$vars"), "overwrite"), null) or (R.unary("!", R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")) and R.binary(">", R.get_value(R.lget(l, "$vars"), "overwrite"), 1)))) else R.coerce(R.get_value(R.lget(l, "$vars"), "overwrite"), "int")))
	if R.truth((R.binary("==", R.get_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target")), null) or (R.binary("!=", R.lget(l, "$target"), null) and (float(R.lget(l, "mode")) == float(1))))):
		pass
		R.set_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target"), [], "=")
	R.invoke(R.get_value(R.get_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target")), "push"), [c])
	if R.truth(((R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true) and R.binary("!=", R.get_value((c).fields.get("vars"), "renderOnStart"), true)) or (c).fields.get("active"))):
		pass
		R.call_member(c, "initTweenVals", [])
		if R.truth((c).fields.get("active")):
			pass
			R.call_member(c, "render", [(float((c).fields.get("startTime")) + float(1))])
		else:
			pass
			R.call_member(c, "render", [(c).fields.get("startTime")])
		if R.truth(((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "visible"), null) and R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true)) and (c).fields.get("_isDisplayObject"))):
			pass
			R.set_value((c).fields.get("target"), "visible", R.get_value((c).fields.get("_specialVars"), "visible"), "=")
	return null


static func c2735_f_to(c: Variant, a: Array) -> Variant:
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__duration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__vars: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	return R.construct(R.klass("gs.TweenLite"), [v__target, v__duration, v__vars])
	return null


static func c2735_f_from(c: Variant, a: Array) -> Variant:
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__duration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__vars: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.set_value(v__vars, "runBackwards", true, "=")
	return R.construct(R.klass("gs.TweenLite"), [v__target, v__duration, v__vars])
	return null


static func c2735_f_delayedCall(c: Variant, a: Array) -> Variant:
	var v__delay: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v__onComplete: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v__onCompleteParams: Variant = R.coerce((a[2] if a.size() > 2 else null), "Array")
	return R.construct(R.klass("gs.TweenLite"), [v__onComplete, 0, {"delay": v__delay, "onComplete": v__onComplete, "onCompleteParams": v__onCompleteParams, "overwrite": 0}])
	return null


static func c2735_f_updateAll(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"a": "Array", "i": "*", "tween": "TweenLite", "t": "uint", "ml": "Dictionary", "$e": "Event"}
	l["a"] = null
	l["i"] = null
	l["tween"] = null
	l["t"] = 0
	l["ml"] = null
	l["$e"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "a", null)
	R.lset(l, "i", 0)
	R.lset(l, "tween", null)
	R.lset(l, "t", R.assign(c, "currentTime", "gs.TweenLite", R.invoke(R.resolve(c, "getTimer", "gs.TweenLite"), []), "="))
	R.lset(l, "ml", R.static_value("gs.TweenLite", "masterList"))
	for __t1 in R.iterate(R.lget(l, "ml"), true):
		R.lset(l, "a", __t1, "=")
		R.lset(l, "i", R.coerce((R.num(R.get_value(R.lget(l, "a"), "length")) - float(1)), "int"), "=")
		while R.truth(R.binary(">", R.lget(l, "i"), R.unary("-", 1))):
			pass
			R.lset(l, "tween", R.get_value(R.lget(l, "a"), R.lget(l, "i")), "=")
			if R.truth(R.binary("!=", R.lget(l, "tween"), null)):
				pass
				if R.truth((R.lget(l, "tween")).fields.get("active")):
					pass
					R.call_member(R.lget(l, "tween"), "render", [R.lget(l, "t")])
				else:
					pass
					if R.truth((R.lget(l, "tween")).fields.get("gc")):
						pass
						R.invoke(R.get_value(R.lget(l, "a"), "splice"), [R.lget(l, "i"), 1])
					else:
						pass
						if R.truth((float(R.lget(l, "t")) >= float((R.lget(l, "tween")).fields.get("startTime")))):
							pass
							R.call_member(R.lget(l, "tween"), "activate", [])
							R.call_member(R.lget(l, "tween"), "render", [R.lget(l, "t")])
			R.binary("+", R.lset(l, "i", 1, "-="), 1)
	return null


static func c2735_f_removeTween(c: Variant, a: Array) -> Variant:
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else null), "TweenLite")
	var v__clear: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	if R.truth(R.binary("!=", v__t, null)):
		pass
		if R.truth(v__clear):
			pass
			R.call_member(v__t, "clear", [])
		R.set_value(v__t, "enabled", false, "=")
	return null


static func c2735_f_killTweensOf(c: Variant, a: Array) -> Variant:
	var v_a: Variant = null
	var v_i: Variant = null
	var v_tween: Variant = null
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__complete: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_a = R.coerce(null, "Array")
	v_i = R.coerce(0, "*")
	v_tween = R.coerce(null, "TweenLite")
	if R.truth((R.binary("!=", v__target, null) and R.binary("!=", R.get_value(R.static_value("gs.TweenLite", "masterList"), v__target), null))):
		pass
		v_a = R.coerce(R.get_value(R.static_value("gs.TweenLite", "masterList"), v__target), "Array")
		v_i = R.coerce(R.coerce((R.num(R.get_value(v_a, "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			v_tween = R.coerce(R.get_value(v_a, v_i), "TweenLite")
			if R.truth((v__complete and R.unary("!", (v_tween).fields.get("gc")))):
				pass
				R.call_member(v_tween, "complete", [false])
			R.call_member(v_tween, "clear", [])
			v_i = R.coerce(R.num(v_i) - 1, "*")
		R.delete_value(R.static_value("gs.TweenLite", "masterList"), v__target)
	return null


static func c2735_f_killGarbage(c: Variant, a: Array) -> Variant:
	var v_tgt: Variant = null
	var v_a: Variant = null
	var v_ml: Variant = null
	var v__e: Variant = R.coerce((a[0] if a.size() > 0 else null), "TimerEvent")
	v_tgt = R.coerce(null, "Object")
	v_a = R.coerce(null, "Array")
	v_ml = R.coerce(R.static_value("gs.TweenLite", "masterList"), "Dictionary")
	for __t2 in R.iterate(v_ml, false):
		v_tgt = R.coerce(__t2, "Object")
		if R.truth(R.binary("==", R.get_value(R.get_value(v_ml, v_tgt), "length"), 0)):
			pass
			R.delete_value(v_ml, v_tgt)
	return null


static func c2735_f_easeOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"$t": "Number", "$b": "Number", "$c": "Number", "$d": "Number"}
	l["$t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["$b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["$c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["$d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((R.num(R.unary("-", R.lget(l, "$c"))) * R.num(R.lset(l, "$t", R.binary("/", R.lget(l, "$t"), R.lget(l, "$d")), "=")))) * float((float(R.lget(l, "$t")) - float(2))))) + float(R.lget(l, "$b")))
	return null


static func c2735_f_tintProxy(c: Variant, a: Array) -> Variant:
	var v_n: Variant = NAN
	var v_r: Variant = NAN
	var v_sc: Variant = null
	var v_ec: Variant = null
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	v_n = float(R.num(R.get_value(R.get_value(v__o, "target"), "progress")))
	v_r = float((float(1) - float(v_n)))
	v_sc = R.coerce(R.get_value(R.get_value(v__o, "info"), "color"), "Object")
	v_ec = R.coerce(R.get_value(R.get_value(v__o, "info"), "endColor"), "Object")
	R.set_value(R.get_value(R.get_value(R.get_value(v__o, "info"), "target"), "transform"), "colorTransform", R.construct(R.klass("ColorTransform"), [(float((R.num(R.get_value(v_sc, "redMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "redMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "greenMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "greenMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "blueMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "blueMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "alphaMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "alphaMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "redOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "redOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "greenOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "greenOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "blueOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "blueOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "alphaOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "alphaOffset")) * float(v_n))))]), "=")
	return null


static func c2735_f_frameProxy(c: Variant, a: Array) -> Variant:
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.invoke(R.get_value(R.get_value(R.get_value(v__o, "info"), "target"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(R.get_value(v__o, "target"), "frame")])])
	return null


static func c2735_f_volumeProxy(c: Variant, a: Array) -> Variant:
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.set_value(R.get_value(R.get_value(v__o, "info"), "target"), "soundTransform", R.get_value(v__o, "target"), "=")
	return null


static func c2735_f_visibleProxy(c: Variant, a: Array) -> Variant:
	var v_t: Variant = null
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_t = R.coerce(R.get_value(R.get_value(v__o, "info"), "tween"), "TweenLite")
	if R.truth((float((v_t).fields.get("duration")) == float(v__time))):
		pass
		if R.truth((R.binary("!=", R.get_value((v_t).fields.get("vars"), "runBackwards"), true) and R.binary("==", (v_t).fields.get("ease"), R.get_value((v_t).fields.get("vars"), "ease")))):
			pass
			R.set_value((v_t).fields.get("target"), "visible", R.get_value((v_t).fields.get("vars"), "visible"), "=")
	else:
		pass
		if R.truth(R.binary("!=", R.get_value((v_t).fields.get("target"), "visible"), true)):
			pass
			R.set_value((v_t).fields.get("target"), "visible", true, "=")
	return null


static func c2735_f_initTweenVals(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v_i: Variant = null
	var v_endArray: Variant = null
	var v_clr: Variant = null
	var v_endClr: Variant = null
	var v_tp: Variant = null
	var v__hrp: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v__reservedProps: Variant = R.coerce((a[1] if a.size() > 1 else ""), "String")
	v_p = R.coerce(null, "String")
	v_i = R.coerce(0, "*")
	v_endArray = R.coerce(null, "Array")
	v_clr = R.coerce(null, "ColorTransform")
	v_endClr = R.coerce(null, "ColorTransform")
	v_tp = R.coerce(null, "Object")
	if R.truth((R.unary("!", v__hrp) and R.truth(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")))):
		pass
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "manageOverwrites"), [c, R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target"))])
	if R.truth(R.binary("is", (c).fields.get("target"), R.klass("Array"))):
		pass
		v_endArray = R.coerce(R.logical_or(R.get_value((c).fields.get("vars"), "endArray"), func(): return []), "Array")
		v_i = R.coerce(0, "*")
		while R.truth(R.binary("<", v_i, R.get_value(v_endArray, "length"))):
			pass
			if R.truth((R.binary("!=", R.get_value((c).fields.get("target"), v_i), R.get_value(v_endArray, v_i)) and R.binary("!=", R.get_value((c).fields.get("target"), v_i), null))):
				pass
				R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), R.invoke(R.get_value(v_i, "toString"), []), R.get_value((c).fields.get("target"), v_i), (R.num(R.get_value(v_endArray, v_i)) - R.num(R.get_value((c).fields.get("target"), v_i))), R.invoke(R.get_value(v_i, "toString"), [])], "=")
			v_i = R.coerce(R.num(v_i) + 1, "*")
	else:
		pass
		if R.truth(((R.binary("!=", R.unary("typeof", R.get_value((c).fields.get("_specialVars"), "tint")), "undefined") or R.binary("==", R.get_value((c).fields.get("vars"), "removeTint"), true)) and (c).fields.get("_isDisplayObject"))):
			pass
			v_clr = R.coerce(R.get_value(R.get_value((c).fields.get("target"), "transform"), "colorTransform"), "ColorTransform")
			v_endClr = R.coerce(R.construct(R.klass("ColorTransform"), []), "ColorTransform")
			if R.truth(R.binary("!=", R.get_value((c).fields.get("_specialVars"), "alpha"), null)):
				pass
				R.set_value(v_endClr, "alphaMultiplier", R.get_value((c).fields.get("_specialVars"), "alpha"), "=")
				R.delete_value((c).fields.get("_specialVars"), "alpha")
			else:
				pass
				R.set_value(v_endClr, "alphaMultiplier", R.get_value((c).fields.get("target"), "alpha"), "=")
			if R.truth((R.binary("!=", R.get_value((c).fields.get("vars"), "removeTint"), true) and ((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "tint"), null) and R.binary("!=", R.get_value((c).fields.get("_specialVars"), "tint"), "")) or R.binary("==", R.get_value((c).fields.get("_specialVars"), "tint"), 0)))):
				pass
				R.set_value(v_endClr, "color", R.get_value((c).fields.get("_specialVars"), "tint"), "=")
			R.call_member(c, "addSubTween", ["tint", R.resolve(c, "tintProxy", "gs.TweenLite"), {"progress": 0}, {"progress": 1}, {"target": (c).fields.get("target"), "color": v_clr, "endColor": v_endClr}])
		if R.truth((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "frame"), null) and (c).fields.get("_isDisplayObject"))):
			pass
			R.call_member(c, "addSubTween", ["frame", R.resolve(c, "frameProxy", "gs.TweenLite"), {"frame": R.get_value((c).fields.get("target"), "currentFrame")}, {"frame": R.get_value((c).fields.get("_specialVars"), "frame")}, {"target": (c).fields.get("target")}])
		if R.truth(R.logical_and(R.unary("!", R.invoke(R.resolve(c, "isNaN", "gs.TweenLite"), [R.get_value((c).fields.get("vars"), "volume")])), func(): return R.invoke(R.get_value((c).fields.get("target"), "hasOwnProperty"), ["soundTransform"]))):
			pass
			R.call_member(c, "addSubTween", ["volume", R.resolve(c, "volumeProxy", "gs.TweenLite"), R.get_value((c).fields.get("target"), "soundTransform"), {"volume": R.get_value((c).fields.get("vars"), "volume")}, {"target": (c).fields.get("target")}])
		if R.truth((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "visible"), null) and (c).fields.get("_isDisplayObject"))):
			pass
			R.call_member(c, "addSubTween", ["visible", R.resolve(c, "visibleProxy", "gs.TweenLite"), {}, {}, {"tween": c}])
		for __t3 in R.iterate((c).fields.get("_specialVars"), false):
			v_p = R.coerce(__t3, "String")
			if R.truth(R.unary("!", ((((((((((((((((((R.binary("==", v_p, "ease") or R.binary("==", v_p, "delay")) or R.binary("==", v_p, "overwrite")) or R.binary("==", v_p, "onComplete")) or R.binary("==", v_p, "onCompleteParams")) or R.binary("==", v_p, "runBackwards")) or R.binary("==", v_p, "visible")) or R.binary("==", v_p, "autoOverwrite")) or R.binary("==", v_p, "persist")) or R.binary("==", v_p, "onUpdate")) or R.binary("==", v_p, "onUpdateParams")) or R.binary("==", v_p, "autoAlpha")) or (R.binary("==", v_p, "timeScale") and R.unary("!", R.binary("is", (c).fields.get("target"), R.klass("gs.TweenLite"))))) or R.binary("==", v_p, "onStart")) or R.binary("==", v_p, "onStartParams")) or R.binary("==", v_p, "renderOnStart")) or R.binary("==", v_p, "proxiedEase")) or R.binary("==", v_p, "easeParams")) or (v__hrp and R.binary("!=", R.invoke(R.get_value(v__reservedProps, "indexOf"), [R.binary("+", R.binary("+", " ", v_p), " ")]), R.unary("-", 1)))))):
				pass
				if R.truth((R.unary("!", ((c).fields.get("_isDisplayObject") and ((R.binary("==", v_p, "tint") or R.binary("==", v_p, "removeTint")) or R.binary("==", v_p, "frame")))) and R.unary("!", R.logical_and(R.binary("==", v_p, "volume"), func(): return R.invoke(R.get_value((c).fields.get("target"), "hasOwnProperty"), ["soundTransform"]))))):
					pass
					if R.truth(R.binary("==", R.unary("typeof", R.get_value((c).fields.get("_specialVars"), v_p)), "number")):
						pass
						R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), v_p, R.get_value((c).fields.get("target"), v_p), (R.num(R.get_value((c).fields.get("_specialVars"), v_p)) - R.num(R.get_value((c).fields.get("target"), v_p))), v_p], "=")
					else:
						pass
						R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), v_p, R.get_value((c).fields.get("target"), v_p), R.num(R.get_value((c).fields.get("_specialVars"), v_p)), v_p], "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true)):
		pass
		v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("tweens"), "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			v_tp = R.coerce(R.get_value((c).fields.get("tweens"), v_i), "Object")
			R.set_value(v_tp, 2, R.get_value(v_tp, 3), "+=")
			R.set_value(v_tp, 3, R.unary("-", 1), "*=")
			v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onUpdate"), null)):
		pass
		(c).fields["_hasUpdate"] = true
	(c).fields["initted"] = true
	return null


static func c2735_f_addSubTween(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v__name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v__proxy: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v__target: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	var v__props: Variant = R.coerce((a[3] if a.size() > 3 else null), "Object")
	var v__info: Variant = R.coerce((a[4] if a.size() > 4 else null), "Object")
	v_p = R.coerce(null, "String")
	R.set_value((c).fields.get("_subTweens"), R.get_value((c).fields.get("_subTweens"), "length"), {"name": v__name, "proxy": v__proxy, "target": v__target, "info": v__info}, "=")
	for __t4 in R.iterate(v__props, false):
		v_p = R.coerce(__t4, "String")
		if R.truth(R.binary("==", R.unary("typeof", R.get_value(v__props, v_p)), "number")):
			pass
			R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [v__target, v_p, R.get_value(v__target, v_p), (R.num(R.get_value(v__props, v_p)) - R.num(R.get_value(v__target, v_p))), v__name], "=")
		else:
			pass
			R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [v__target, v_p, R.get_value(v__target, v_p), R.num(R.get_value(v__props, v_p)), v__name], "=")
	(c).fields["_hst"] = true
	return null


static func c2735_f_render(c: Variant, a: Array) -> Variant:
	var v_factor: Variant = NAN
	var v_tp: Variant = null
	var v_i: Variant = null
	var v_time: Variant = NAN
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v_factor = float(NAN)
	v_tp = R.coerce(null, "Object")
	v_i = R.coerce(0, "*")
	v_time = float(R.binary("/", (float(v__t) - float((c).fields.get("startTime"))), 1000))
	if R.truth((float(v_time) >= float((c).fields.get("duration")))):
		pass
		v_time = float((c).fields.get("duration"))
		v_factor = R.coerce((1 if R.truth((R.binary("==", (c).fields.get("ease"), R.get_value((c).fields.get("vars"), "ease")) or (float((c).fields.get("duration")) == float(0.001)))) else 0), "Number")
	else:
		pass
		v_factor = R.coerce(R.call_member(c, "ease", [v_time, 0, 1, (c).fields.get("duration")]), "Number")
	v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("tweens"), "length")) - float(1)), "int"), "*")
	while R.truth(R.binary(">", v_i, R.unary("-", 1))):
		pass
		v_tp = R.coerce(R.get_value((c).fields.get("tweens"), v_i), "Object")
		R.set_value(R.get_value(v_tp, 0), R.get_value(v_tp, 1), R.binary("+", R.get_value(v_tp, 2), (float(v_factor) * R.num(R.get_value(v_tp, 3)))), "=")
		v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth((c).fields.get("_hst")):
		pass
		v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("_subTweens"), "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("_subTweens"), v_i), "proxy"), [R.get_value((c).fields.get("_subTweens"), v_i), v_time])
			v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth((c).fields.get("_hasUpdate")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onUpdate"), "apply"), [null, R.get_value((c).fields.get("vars"), "onUpdateParams")])
	if R.truth((float(v_time) == float((c).fields.get("duration")))):
		pass
		R.call_member(c, "complete", [true])
	return null


static func c2735_f_activate(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	(c).fields["started"] = R.coerce(R.set_value(c, "active", true, "="), "Boolean")
	if R.truth(R.unary("!", (c).fields.get("initted"))):
		pass
		R.call_member(c, "initTweenVals", [])
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onStart"), null)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onStart"), "apply"), [null, R.get_value((c).fields.get("vars"), "onStartParams")])
	if R.truth((float((c).fields.get("duration")) == float(0.001))):
		pass
		R.set_value(c, "startTime", 1, "-=")
	return null


static func c2735_f_complete(c: Variant, a: Array) -> Variant:
	var v__skipRender: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.unary("!", v__skipRender)):
		pass
		if R.truth(R.unary("!", (c).fields.get("initted"))):
			pass
			R.call_member(c, "initTweenVals", [])
		(c).fields["startTime"] = float((float(R.static_value("gs.TweenLite", "currentTime")) - float(R.binary("/", (float((c).fields.get("duration")) * float(1000)), (c).fields.get("combinedTimeScale")))))
		R.call_member(c, "render", [R.static_value("gs.TweenLite", "currentTime")])
		return null
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "persist"), true)):
		pass
		R.set_value(c, "enabled", false, "=")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onComplete"), null)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onComplete"), "apply"), [null, R.get_value((c).fields.get("vars"), "onCompleteParams")])
	return null


static func c2735_f_clear(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	(c).fields["tweens"] = R.coerce([], "Array")
	(c).fields["_subTweens"] = R.coerce([], "Array")
	(c).fields["vars"] = R.coerce({}, "Object")
	(c).fields["_hst"] = R.coerce(R.set_value(c, "_hasUpdate", false, "="), "Boolean")
	return null


static func c2735_f_killVars(c: Variant, a: Array) -> Variant:
	var v__vars: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")):
		pass
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "killVars"), [v__vars, (c).fields.get("vars"), (c).fields.get("tweens"), (c).fields.get("_subTweens"), []])
	return null


static func c2735_f_easeProxy(c: Variant, a: Array) -> Variant:
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v__b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v__d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "proxiedEase"), "apply"), [null, R.invoke(R.get_value(R.resolve(c, "arguments", "gs.TweenLite"), "concat"), [R.get_value((c).fields.get("vars"), "easeParams")])])
	return null


static func c2735_f_get_enabled(c: Variant, a: Array) -> Variant:
	return R.unary("!", (c).fields.get("gc"))
	return null


static func c2735_f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_a: Variant = null
	var v_found: Variant = false
	var v_i: Variant = null
	var v__b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_a = R.coerce(null, "Array")
	v_found = false
	v_i = R.coerce(0, "*")
	if R.truth(v__b):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), null)):
			pass
			R.set_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target"), [c], "=")
		else:
			pass
			v_a = R.coerce(R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), "Array")
			v_i = R.coerce(R.coerce((R.num(R.get_value(v_a, "length")) - float(1)), "int"), "*")
			while R.truth(R.binary(">", v_i, R.unary("-", 1))):
				pass
				if R.truth(R.binary("==", R.get_value(v_a, v_i), c)):
					pass
					v_found = true
					break
				v_i = R.coerce(R.num(v_i) - 1, "*")
			if R.truth(R.unary("!", v_found)):
				pass
				R.invoke(R.get_value(R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), "push"), [c])
	else:
		pass
		if R.truth(R.binary("is", (c).fields.get("target"), R.resolve(c, "DisplayObject", "gs.TweenLite"))):
			pass
			pass
	(c).fields["gc"] = R.unary("!", v__b)
	if R.truth((c).fields.get("gc")):
		pass
		(c).fields["active"] = false
	else:
		pass
		(c).fields["active"] = (c).fields.get("started")
	return null


static func c2735_f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "overwriteManager", null, "=")
	R.set_value(c, "currentTime", 0, "=")
	R.set_value(c, "_classInitted", false, "=")
	R.set_value(c, "version", 9.26, "=")
	R.set_value(c, "killDelayedCallsTo", R.get_value(R.klass("gs.TweenLite"), "killTweensOf"), "=")
	R.set_value(c, "defaultEase", R.get_value(R.klass("gs.TweenLite"), "easeOut"), "=")
	R.set_value(c, "masterList", R.construct(R.resolve(c, "Dictionary", "gs.TweenLite"), [false]), "=")
	R.set_value(c, "_sprite", R.construct(R.klass("Sprite"), []), "=")
	R.set_value(c, "_timer", R.construct(R.resolve(c, "Timer", "gs.TweenLite"), [2000]), "=")
	return null


static func c2736_f_Linear(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "gs.easing.Linear"), [])
	return null


static func c2736_f_easeNone(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null


static func c2736_f_easeIn(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null


static func c2736_f_easeOut(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null


static func c2736_f_easeInOut(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null


static func c2737_f_Quad(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "gs.easing.Quad"), [])
	return null


static func c2737_f_easeIn(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((float(R.lget(l, "c")) * R.num(R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.lget(l, "d")), "=")))) * float(R.lget(l, "t")))) + float(R.lget(l, "b")))
	return null


static func c2737_f_easeOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((R.num(R.unary("-", R.lget(l, "c"))) * R.num(R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.lget(l, "d")), "=")))) * float((float(R.lget(l, "t")) - float(2))))) + float(R.lget(l, "b")))
	return null


static func c2738_f_Quart(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "gs.easing.Quart"), [])
	return null


static func c2738_f_easeIn(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((float((float((float(R.lget(l, "c")) * R.num(R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.lget(l, "d")), "=")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) + float(R.lget(l, "b")))
	return null


static func c2738_f_easeOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((R.num(R.unary("-", R.lget(l, "c"))) * float((float((float((float((R.num(R.lset(l, "t", (float(R.binary("/", R.lget(l, "t"), R.lget(l, "d"))) - float(1)), "=")) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) - float(1))))) + float(R.lget(l, "b")))
	return null


static func c2738_f_easeInOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.binary("/", R.lget(l, "d"), 2)), "=")
	if R.truth((float(R.lget(l, "t")) < float(1))):
		pass
		return (float((float((float((float((float(R.binary("/", R.lget(l, "c"), 2)) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) + float(R.lget(l, "b")))
	return (float((float(R.binary("/", R.unary("-", R.lget(l, "c")), 2)) * float((float((float((float((R.num(R.lset(l, "t", (float(R.lget(l, "t")) - float(2)), "=")) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) - float(2))))) + float(R.lget(l, "b")))
	return null


static func c2765_f_frame19(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "zombie4hoodgrapple24"), ["Normal"])
	return null


static func c2765_f_frame55(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "zombie4hoodgrapple24"), ["Alpha"])
	return null
