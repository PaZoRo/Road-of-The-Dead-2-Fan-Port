extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_BasicGame(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"err": "Error", "rootMC": "MovieClip"}
	l["err"] = null
	l["rootMC"] = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.invoke(R.super_ref(c, "BasicGame"), [])
	(c).fields["m_RootMC"] = R.coerce(R.lget(l, "rootMC"), "MovieClip")
	R.assign(c, "Instance", "BasicGame", c, "=")
	(c).fields["m_iGameState"] = R.coerce(R.static_value("BasicGame", "GameState_Init"), "int")
	(c).fields["m_iGameTick"] = R.coerce(0, "uint")
	(c).fields["m_iLastTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "BasicGame"), []), "uint")
	(c).fields["m_fGameTime"] = float(0)
	(c).fields["m_fFrameDelta"] = float(0)
	(c).fields["m_szPendingCinematic"] = R.coerce("", "String")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnMouseDown")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_UP"), R.get_value(c, "OnMouseUp")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnMouseOver")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnMouseOut")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_WHEEL"), R.get_value(c, "OnMouseWheel")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "OnCoreKeyDown")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("KeyboardEvent"), "KEY_UP"), R.get_value(c, "OnCoreKeyUp")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "OnLostFocus")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "addEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "OnGotFocus")])
	if R.truth(R.binary("!=", R.call_member(c, "GetSaveGamePath", []), "")):
		pass
		R.last_error = null
		(c).fields["m_GameData"] = R.coerce(R.invoke(R.get_value(R.resolve(c, "SharedObject", "BasicGame"), "getLocal"), [R.call_member(c, "GetSaveGamePath", []), "/"]), "SharedObject")
		if R.last_error != null:
			R.lset(l, "err", R.last_error)
			R.last_error = null
			c.fields["m_GameData"] = R.coerce(null, "SharedObject")
	return null

static func f_HasAPI(c: Variant, a: Array) -> Variant:
	var v_iAPI: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return R.binary("!=", R.binary("&", R.static_value("BasicGame", "m_iAPI"), v_iAPI), 0)
	return null

static func f_GetFocusManagerTarget(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_RootMC")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_focusTarget: Variant = null
	if R.truth(R.unary("!", R.call_member(c, "IsSiteAllowed", []))):
		pass
		R.invoke(R.get_value((c).fields.get("m_RootMC"), "gotoAndStop"), ["SiteLocked"])
		(c).fields["m_bSiteBlocked"] = true
		return null
	(c).fields["m_Viewport"] = R.coerce(R.construct(R.klass("Viewport"), [R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "stageWidth"), R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "stageHeight")]), "Viewport")
	v_focusTarget = R.coerce(R.call_member(c, "GetFocusManagerTarget", []), "MovieClip")
	(c).fields["m_FocusManager"] = R.coerce(R.construct(R.klass("fl.managers.FocusManager"), [v_focusTarget]), "FocusManager")
	R.call_static("Input", "InitKeyNames", [])
	if R.truth((float(R.static_value("BasicGame", "m_iAPI")) == float(R.static_value("BasicGame", "API_Kongregate")))):
		pass
		R.call_member(c, "InitKongAPI", [])
	else:
		pass
		if R.truth((float(R.static_value("BasicGame", "m_iAPI")) == float(R.static_value("BasicGame", "API_ArmorGames")))):
			pass
			R.call_member(c, "InitArmorGamesAPI", [])
			R.call_member(c, "InitArmorGamesAPI2", [])
	return null

static func f_Start(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StartCinematic", ["EngineIntro", true])
	return null

static func f_GetSaveGamePath(c: Variant, a: Array) -> Variant:
	return ""
	return null

static func f_Run(c: Variant, a: Array) -> Variant:
	var v_iNewTime: Variant = 0
	var v_iDeltaTime: Variant = 0
	if R.truth((c).fields.get("m_bSiteBlocked")):
		pass
		return null
	v_iNewTime = R.coerce(R.invoke(R.resolve(c, "getTimer", "BasicGame"), []), "int")
	v_iDeltaTime = R.coerce((float(v_iNewTime) - float((c).fields.get("m_iLastTime"))), "uint")
	(c).fields["m_iLastTime"] = R.coerce(v_iNewTime, "uint")
	(c).fields["m_fFrameDelta"] = float(R.binary("/", v_iDeltaTime, 1000))
	R.call_member(c, "Tick", [(c).fields.get("m_fFrameDelta")])
	R.call_member(c, "Render", [])
	(c).fields["m_bRanOnce"] = true
	return null

static func f_Tick(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_fGameTime"] = R.coerce(R.binary("+", (c).fields.get("m_fGameTime"), v_fDeltaTime), "Number")
	R.call_member(c, "UpdateGameState", [(c).fields.get("m_iGameState"), v_fDeltaTime])
	R.call_static("SoundSystem", "Update", [v_fDeltaTime])
	R.set_value(c, "m_iGameTick", 1, "+=")
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
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

static func f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseUpProcessed"] = false
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseOverProcessed"] = false
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseOutProcessed"] = false
	return null

static func f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bMouseWheelProcessed"] = false
	return null

static func f_OnCoreKeyDown(c: Variant, a: Array) -> Variant:
	var v_bAlreadyDown: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_bAlreadyDown = R.binary("as", R.get_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode")), R.klass("Boolean"))
	if R.truth(R.unary("!", v_bAlreadyDown)):
		pass
		R.set_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode"), true, "=")
		R.call_member(c, "OnKeyDown", [v_event])
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bKeyDownProcessed"] = false
	return null

static func f_OnCoreKeyUp(c: Variant, a: Array) -> Variant:
	var v_bAlreadyDown: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_bAlreadyDown = R.binary("as", R.get_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode")), R.klass("Boolean"))
	if R.truth(v_bAlreadyDown):
		pass
		R.set_value(R.static_value("Input", "KeyDown"), R.get_value(v_event, "keyCode"), null, "=")
		R.call_member(c, "OnKeyUp", [v_event])
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("m_bRanOnce"))):
		pass
		return null
	(c).fields["m_bKeyUpProcessed"] = false
	return null

static func f_SetGameState(c: Variant, a: Array) -> Variant:
	var v_iNewState: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth(R.binary("==", v_iNewState, (c).fields.get("m_iGameState"))):
		pass
		return null
	R.call_member(c, "EndGameState", [(c).fields.get("m_iGameState")])
	(c).fields["m_iGameState"] = R.coerce(v_iNewState, "int")
	R.call_member(c, "BeginGameState", [(c).fields.get("m_iGameState")])
	return null

static func f_BeginGameState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
		pass
		R.call_member(c, "ShowMainMenu", [])
	else:
		pass
		if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_Game")))):
			pass
			R.call_member(c, "ShowGame", [])
	return null

static func f_EndGameState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_MainMenu")))):
		pass
		R.call_member(c, "HideMainMenu", [])
	else:
		pass
		if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_Game")))):
			pass
			R.call_member(c, "HideGame", [])
	return null

static func f_ShowGame(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_RootMC"), "gotoAndPlay"), ["Game"])
	return null

static func f_HideGame(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_ShowMainMenu(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_RootMC"), "gotoAndPlay"), ["Menu"])
	return null

static func f_HideMainMenu(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_UpdateGameState(c: Variant, a: Array) -> Variant:
	var v_iState: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_fDeltaTime: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	if R.truth((float(v_iState) == float(R.static_value("BasicGame", "GameState_Game")))):
		pass
		if R.truth(R.binary("!=", (c).fields.get("m_szPendingCinematic"), "")):
			pass
			R.call_member(c, "StartPendingCinematic", [])
			return null
	return null

static func f_StartCinematic(c: Variant, a: Array) -> Variant:
	var v_szCinematicName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_bIsCinematicSkipable: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	(c).fields["m_szPendingCinematic"] = R.coerce(v_szCinematicName, "String")
	(c).fields["m_bIsCinematicSkipable"] = v_bIsCinematicSkipable
	if R.truth((float((c).fields.get("m_iGameState")) != float(R.static_value("BasicGame", "GameState_Game")))):
		pass
		R.call_member(c, "StartPendingCinematic", [])
	return null

static func f_StartPendingCinematic(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentCinematic"] = R.coerce((c).fields.get("m_szPendingCinematic"), "String")
	(c).fields["m_szPendingCinematic"] = R.coerce("", "String")
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Cinematic")])
	R.invoke(R.get_value((c).fields.get("m_RootMC"), "gotoAndPlay"), [(c).fields.get("m_szCurrentCinematic")])
	return null

static func f_EndCinematic(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentCinematic"] = R.coerce("", "String")
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Game")])
	return null

static func f_SkipCinematic(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentCinematic"] = R.coerce("", "String")
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_Game")])
	return null

static func f_GetCurrentCinematic(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_szCurrentCinematic") if R.truth((float((c).fields.get("m_iGameState")) == float(R.static_value("BasicGame", "GameState_Cinematic")))) else "")
	return null

static func f_PlayMusic(c: Variant, a: Array) -> Variant:
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

static func f_OnMusicFinished(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	pass
	return null

static func f_StopMusic(c: Variant, a: Array) -> Variant:
	var v_fFadeDuration: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	if R.truth((c).fields.get("m_CurrentMusic")):
		pass
		R.call_member((c).fields.get("m_CurrentMusic"), "Stop", [v_fFadeDuration])
		(c).fields["m_CurrentMusic"] = R.coerce(null, "DTSound")
		(c).fields["m_CurrentMusicClass"] = R.coerce(null, "Class")
	return null

static func f_IsPlayingMusic(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_CurrentMusic")), func(): return R.call_member((c).fields.get("m_CurrentMusic"), "IsPlaying", []))
	return null

static func f_Pause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("!=", v_bPause, (c).fields.get("m_bPaused"))):
		pass
		(c).fields["m_bPaused"] = v_bPause
		if R.truth((c).fields.get("m_bPaused")):
			pass
			R.call_member(c, "DispatchEvent", [R.static_value("BasicGame", "Event_Paused")])
		else:
			pass
			R.call_member(c, "DispatchEvent", [R.static_value("BasicGame", "Event_UnPaused")])
	return null

static func f_IsSiteAllowed(c: Variant, a: Array) -> Variant:
	var v_szAllowedURL: Variant = null
	var v_szURL: Variant = null
	var v_i: Variant = 0
	v_szAllowedURL = R.coerce(null, "String")
	if R.truth(R.binary("==", R.get_value(R.static_value("BasicGame", "m_AllowedSites"), "length"), 0)):
		pass
		return true
	v_szURL = R.coerce(R.get_value(R.get_value(R.get_value((c).fields.get("m_RootMC"), "stage"), "loaderInfo"), "url"), "String")
	if R.truth(R.binary("!=", R.invoke(R.get_value(v_szURL, "indexOf"), ["DogTek"]), R.unary("-", 1))):
		pass
		return true
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.static_value("BasicGame", "m_AllowedSites"), "length"))):
		pass
		v_szAllowedURL = R.coerce(R.string(R.get_value(R.static_value("BasicGame", "m_AllowedSites"), v_i)), "String")
		if R.truth(R.binary("!=", R.invoke(R.get_value(v_szURL, "indexOf"), [v_szAllowedURL]), R.unary("-", 1))):
			pass
			return true
		v_i = R.signed32(v_i + 1)
	return false
	return null

static func f_InitInterface(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_InitKongAPI(c: Variant, a: Array) -> Variant:
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

static func f_OnInitKongAPICompleted(c: Variant, a: Array) -> Variant:
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

static func f_RegisterKongregateListeners(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_InitArmorGamesAPI(c: Variant, a: Array) -> Variant:
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

static func f_OnInitArmorGamesAPICompleted(c: Variant, a: Array) -> Variant:
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

static func f_InitArmorGamesAPI2(c: Variant, a: Array) -> Variant:
	var v_agi_url: Variant = null
	var v_loader: Variant = null
	v_agi_url = R.coerce("http://agi.armorgames.com/assets/agi/AGI2.swf", "String")
	R.invoke(R.get_value(R.resolve(c, "Security", "BasicGame"), "allowDomain"), ["agi.armorgames.com"])
	v_loader = R.coerce(R.construct(R.resolve(c, "Loader", "BasicGame"), []), "Loader")
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "BasicGame"), "IO_ERROR"), R.get_value(c, "OnArmorGamesAPI2Failed")])
	R.invoke(R.get_value(R.get_value(v_loader, "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "OnArmorGamesAPI2Loaded")])
	R.invoke(R.get_value(v_loader, "load"), [R.construct(R.resolve(c, "URLRequest", "BasicGame"), [v_agi_url])])
	return null

static func f_OnArmorGamesAPI2Loaded(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_ArmorGamesAPI2"] = R.coerce(R.get_value(R.get_value(v_e, "currentTarget"), "content"), "*")
	R.invoke(R.get_value((c).fields.get("m_ArmorGamesAPI2"), "connect"), [{"stage": R.get_value((c).fields.get("m_RootMC"), "stage"), "apiKey": "31944FBD-6FD3-4406-8453-AC652DD96ACC", "callback": R.get_value(c, "OnArmorGamesAPI2Connection")}])
	return null

static func f_OnArmorGamesAPI2Connection(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.unary("!", R.get_value(v_data, "success"))):
		pass
		R.call_member(c, "ShowMessageBox", ["Error", "Could not load the ArmorGames API!\nArmorGames features are disabled."])
	return null

static func f_OnArmorGamesAPI2Failed(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "IOErrorEvent")
	R.call_member(c, "ShowMessageBox", ["Error", "Could not load the ArmorGames API!\nArmorGames features are disabled."])
	return null

static func f_ShowMessageBox(c: Variant, a: Array) -> Variant:
	var v_szTitle: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szMessage: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	pass
	return null

static func f_OnLostFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	pass
	return null

static func f_OnGotFocus(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_static("Input", "ClearKeyDown", [])
	return null

static func f_OnTimelineEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_PlayCinematicVoice(c: Variant, a: Array) -> Variant:
	var v_voiceClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_mouthMC: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	pass
	return null

static func f_SetCinematicMouth(c: Variant, a: Array) -> Variant:
	var v_mouthMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	pass
	return null

static func f_SetCinematicPerlinScene(c: Variant, a: Array) -> Variant:
	var v_sceneMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_fSpeed: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fAmplitude: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Instance", null, "=")
	R.set_value(c, "m_szArmorGamesDevKey", null, "=")
	R.set_value(c, "m_szArmorGamesGameKey", null, "=")
	R.set_value(c, "m_szArmorGamesAPI2Key", null, "=")
	R.set_value(c, "Event_Paused", "Event_Paused", "=")
	R.set_value(c, "Event_UnPaused", "Event_UnPaused", "=")
	R.set_value(c, "GameState_Init", R.unary("-", 1), "=")
	R.set_value(c, "GameState_MainMenu", 0, "=")
	R.set_value(c, "GameState_Game", 1, "=")
	R.set_value(c, "GameState_Cinematic", 2, "=")
	R.set_value(c, "API_Newgrounds", R.binary("<<", 1, 0), "=")
	R.set_value(c, "API_Kongregate", R.binary("<<", 1, 1), "=")
	R.set_value(c, "API_ArmorGames", R.binary("<<", 1, 2), "=")
	R.set_value(c, "API_Mochi", R.binary("<<", 1, 3), "=")
	R.set_value(c, "API_NewgroundsPassport", R.binary("<<", 1, 4), "=")
	R.set_value(c, "API_NoNewgroundsAds", R.binary("<<", 1, 5), "=")
	R.set_value(c, "API_FGL", R.binary("<<", 1, 6), "=")
	R.set_value(c, "m_AllowedSites", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_iAPI", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_RootMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_Viewport"] = R.coerce(null, "Viewport")
	(c).fields["m_FocusManager"] = R.coerce(null, "FocusManager")
	(c).fields["m_iLanguage"] = R.coerce(0, "int")
	(c).fields["m_iGameState"] = R.coerce(0, "int")
	(c).fields["m_iGameTick"] = R.coerce(0, "uint")
	(c).fields["m_iLastTime"] = R.coerce(0, "uint")
	(c).fields["m_fGameTime"] = float(NAN)
	(c).fields["m_fFrameDelta"] = float(NAN)
	(c).fields["m_bPaused"] = false
	(c).fields["m_bRanOnce"] = false
	(c).fields["m_bMouseDownProcessed"] = false
	(c).fields["m_bMouseUpProcessed"] = false
	(c).fields["m_bMouseOverProcessed"] = false
	(c).fields["m_bMouseOutProcessed"] = false
	(c).fields["m_bMouseWheelProcessed"] = false
	(c).fields["m_bKeyDownProcessed"] = false
	(c).fields["m_bKeyUpProcessed"] = false
	(c).fields["m_szPendingCinematic"] = R.coerce(null, "String")
	(c).fields["m_szCurrentCinematic"] = R.coerce(null, "String")
	(c).fields["m_bIsCinematicSkipable"] = false
	(c).fields["m_CurrentMusic"] = R.coerce(null, "DTSound")
	(c).fields["m_CurrentMusicClass"] = R.coerce(null, "Class")
	(c).fields["m_GameData"] = R.coerce(null, "SharedObject")
	(c).fields["m_bSiteBlocked"] = false
	(c).fields["m_KongregateAPI"] = R.coerce(null, "*")
	(c).fields["m_ArmorGamesAPI"] = R.coerce(null, "Object")
	(c).fields["m_ArmorGamesAPI2"] = R.coerce(null, "*")
	return null
