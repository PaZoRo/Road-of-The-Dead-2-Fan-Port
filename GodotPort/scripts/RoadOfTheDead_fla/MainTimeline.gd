extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MainTimeline(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.MainTimeline"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.MainTimeline"), [0, R.get_value(c, "frame1"), 10, R.get_value(c, "frame11"), 11, R.get_value(c, "frame12"), 12, R.get_value(c, "frame13"), 13, R.get_value(c, "frame14"), 14, R.get_value(c, "frame15"), 42, R.get_value(c, "frame43"), 54, R.get_value(c, "frame55"), 56, R.get_value(c, "frame57"), 351, R.get_value(c, "frame352"), 364, R.get_value(c, "frame365"), 375, R.get_value(c, "frame376"), 376, R.get_value(c, "frame377"), 380, R.get_value(c, "frame381"), 392, R.get_value(c, "frame393"), 393, R.get_value(c, "frame394"), 408, R.get_value(c, "frame409"), 409, R.get_value(c, "frame410"), 683, R.get_value(c, "frame684"), 1022, R.get_value(c, "frame1023"), 1030, R.get_value(c, "frame1031"), 1043, R.get_value(c, "frame1044"), 1056, R.get_value(c, "frame1057"), 1114, R.get_value(c, "frame1115"), 1117, R.get_value(c, "frame1118"), 1141, R.get_value(c, "frame1142"), 1153, R.get_value(c, "frame1154"), 1196, R.get_value(c, "frame1197"), 1482, R.get_value(c, "frame1483"), 3261, R.get_value(c, "frame3262"), 4138, R.get_value(c, "frame4139"), 4168, R.get_value(c, "frame4169"), 4199, R.get_value(c, "frame4200"), 4273, R.get_value(c, "frame4274"), 4305, R.get_value(c, "frame4306"), 4338, R.get_value(c, "frame4339"), 4393, R.get_value(c, "frame4394"), 4416, R.get_value(c, "frame4417"), 4448, R.get_value(c, "frame4449"), 4475, R.get_value(c, "frame4476"), 4483, R.get_value(c, "frame4484"), 4531, R.get_value(c, "frame4532"), 4552, R.get_value(c, "frame4553"), 4569, R.get_value(c, "frame4570"), 4598, R.get_value(c, "frame4599"), 4610, R.get_value(c, "frame4611"), 4627, R.get_value(c, "frame4628"), 4643, R.get_value(c, "frame4644"), 4675, R.get_value(c, "frame4676"), 4712, R.get_value(c, "frame4713"), 4752, R.get_value(c, "frame4753"), 4773, R.get_value(c, "frame4774"), 4794, R.get_value(c, "frame4795"), 4814, R.get_value(c, "frame4815"), 4846, R.get_value(c, "frame4847"), 4868, R.get_value(c, "frame4869"), 4879, R.get_value(c, "frame4880"), 4910, R.get_value(c, "frame4911"), 4936, R.get_value(c, "frame4937"), 4955, R.get_value(c, "frame4956"), 4968, R.get_value(c, "frame4969"), 5049, R.get_value(c, "frame5050"), 5094, R.get_value(c, "frame5095"), 5109, R.get_value(c, "frame5110"), 5158, R.get_value(c, "frame5159"), 5176, R.get_value(c, "frame5177"), 5243, R.get_value(c, "frame5244"), 5290, R.get_value(c, "frame5291"), 5297, R.get_value(c, "frame5298"), 5332, R.get_value(c, "frame5333"), 5341, R.get_value(c, "frame5342"), 5379, R.get_value(c, "frame5380"), 5476, R.get_value(c, "frame5477"), 5504, R.get_value(c, "frame5505"), 5519, R.get_value(c, "frame5520"), 5551, R.get_value(c, "frame5552"), 5595, R.get_value(c, "frame5596"), 5628, R.get_value(c, "frame5629"), 5633, R.get_value(c, "frame5634"), 5682, R.get_value(c, "frame5683"), 5694, R.get_value(c, "frame5695"), 5763, R.get_value(c, "frame5764"), 5769, R.get_value(c, "frame5770"), 5803, R.get_value(c, "frame5804"), 5816, R.get_value(c, "frame5817"), 5854, R.get_value(c, "frame5855"), 5902, R.get_value(c, "frame5903"), 5922, R.get_value(c, "frame5923"), 5926, R.get_value(c, "frame5927"), 5945, R.get_value(c, "frame5946"), 5976, R.get_value(c, "frame5977"), 5985, R.get_value(c, "frame5986"), 6011, R.get_value(c, "frame6012"), 6018, R.get_value(c, "frame6019"), 6055, R.get_value(c, "frame6056"), 6083, R.get_value(c, "frame6084"), 6093, R.get_value(c, "frame6094"), 6140, R.get_value(c, "frame6141"), 6167, R.get_value(c, "frame6168"), 6188, R.get_value(c, "frame6189"), 6276, R.get_value(c, "frame6277"), 6298, R.get_value(c, "frame6299"), 6312, R.get_value(c, "frame6313"), 6340, R.get_value(c, "frame6341"), 6403, R.get_value(c, "frame6404"), 6420, R.get_value(c, "frame6421"), 6449, R.get_value(c, "frame6450"), 6482, R.get_value(c, "frame6483"), 6536, R.get_value(c, "frame6537"), 6557, R.get_value(c, "frame6558"), 6567, R.get_value(c, "frame6568"), 6593, R.get_value(c, "frame6594"), 6622, R.get_value(c, "frame6623"), 6656, R.get_value(c, "frame6657"), 6661, R.get_value(c, "frame6662"), 6718, R.get_value(c, "frame6719"), 6790, R.get_value(c, "frame6791"), 6794, R.get_value(c, "frame6795"), 6824, R.get_value(c, "frame6825"), 6850, R.get_value(c, "frame6851"), 6878, R.get_value(c, "frame6879"), 6896, R.get_value(c, "frame6897"), 6927, R.get_value(c, "frame6928"), 6943, R.get_value(c, "frame6944"), 6965, R.get_value(c, "frame6966"), 6970, R.get_value(c, "frame6971"), 7046, R.get_value(c, "frame7047"), 7049, R.get_value(c, "frame7050"), 7073, R.get_value(c, "frame7074"), 7091, R.get_value(c, "frame7092"), 7109, R.get_value(c, "frame7110"), 7137, R.get_value(c, "frame7138"), 7153, R.get_value(c, "frame7154"), 7191, R.get_value(c, "frame7192"), 7215, R.get_value(c, "frame7216"), 7230, R.get_value(c, "frame7231"), 7286, R.get_value(c, "frame7287"), 7326, R.get_value(c, "frame7327"), 7371, R.get_value(c, "frame7372"), 7381, R.get_value(c, "frame7382"), 7424, R.get_value(c, "frame7425"), 7462, R.get_value(c, "frame7463"), 7470, R.get_value(c, "frame7471"), 7482, R.get_value(c, "frame7483"), 7502, R.get_value(c, "frame7503"), 7533, R.get_value(c, "frame7534"), 7559, R.get_value(c, "frame7560"), 7572, R.get_value(c, "frame7573"), 7604, R.get_value(c, "frame7605"), 7631, R.get_value(c, "frame7632"), 7653, R.get_value(c, "frame7654"), 7710, R.get_value(c, "frame7711"), 7728, R.get_value(c, "frame7729"), 7747, R.get_value(c, "frame7748"), 7751, R.get_value(c, "frame7752"), 7762, R.get_value(c, "frame7763"), 7806, R.get_value(c, "frame7807"), 7851, R.get_value(c, "frame7852"), 7874, R.get_value(c, "frame7875"), 7911, R.get_value(c, "frame7912"), 7938, R.get_value(c, "frame7939"), 7964, R.get_value(c, "frame7965"), 8028, R.get_value(c, "frame8029"), 8075, R.get_value(c, "frame8076"), 8083, R.get_value(c, "frame8084"), 8093, R.get_value(c, "frame8094"), 8111, R.get_value(c, "frame8112"), 8152, R.get_value(c, "frame8153"), 8198, R.get_value(c, "frame8199"), 8201, R.get_value(c, "frame8202"), 8202, R.get_value(c, "frame8203"), 8225, R.get_value(c, "frame8226"), 8263, R.get_value(c, "frame8264"), 8272, R.get_value(c, "frame8273"), 8293, R.get_value(c, "frame8294"), 8305, R.get_value(c, "frame8306"), 8329, R.get_value(c, "frame8330"), 8333, R.get_value(c, "frame8334"), 8401, R.get_value(c, "frame8402"), 8404, R.get_value(c, "frame8405"), 8510, R.get_value(c, "frame8511"), 8552, R.get_value(c, "frame8553"), 8586, R.get_value(c, "frame8587"), 8598, R.get_value(c, "frame8599"), 8602, R.get_value(c, "frame8603"), 8652, R.get_value(c, "frame8653"), 8664, R.get_value(c, "frame8665"), 8719, R.get_value(c, "frame8720"), 8726, R.get_value(c, "frame8727"), 8784, R.get_value(c, "frame8785"), 8811, R.get_value(c, "frame8812"), 8863, R.get_value(c, "frame8864"), 8947, R.get_value(c, "frame8948"), 8949, R.get_value(c, "frame8950"), 8999, R.get_value(c, "frame9000"), 9003, R.get_value(c, "frame9004"), 9093, R.get_value(c, "frame9094"), 9099, R.get_value(c, "frame9100"), 9150, R.get_value(c, "frame9151"), 9172, R.get_value(c, "frame9173"), 9208, R.get_value(c, "frame9209"), 9213, R.get_value(c, "frame9214"), 9257, R.get_value(c, "frame9258"), 9289, R.get_value(c, "frame9290"), 9307, R.get_value(c, "frame9308"), 9344, R.get_value(c, "frame9345"), 9376, R.get_value(c, "frame9377"), 9417, R.get_value(c, "frame9418"), 9463, R.get_value(c, "frame9464"), 10377, R.get_value(c, "frame10378"), 11372, R.get_value(c, "frame11373"), 11494, R.get_value(c, "frame11495")])
	R.invoke(R.resolve(c, "addEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "FRAME_CONSTRUCTED"), R.get_value(c, "__setProp_handler"), false, 0, true])
	return null

static func f_OnAddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.set_value(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline"), "showDefaultContextMenu", false, "=")
	R.set_value(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline"), "tabChildren", false, "=")
	R.invoke(R.resolve(c, "addEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "EnterFrameHandler")])
	return null

static func f_OnAPIConnected(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member(c, "TestSession", [])
	return null

static func f_TestSession(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", R.get_value(R.klass("com.newgrounds.API"), "hasUserSession"))):
		pass
		R.set_value((c).fields.get("PreloaderStory"), "visible", false, "=")
		R.set_value((c).fields.get("PassportPanel"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("PassportPanel"), "Login"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "OnLogin"), false, 0, true])
		R.invoke(R.get_value(R.get_value((c).fields.get("PassportPanel"), "NoThanks"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "OnNoThanks"), false, 0, true])
	return null

static func f_onUserSignedIn(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth(R.get_value(v_event, "success")):
		pass
		R.set_value((c).fields.get("PassportPanel"), "visible", false, "=")
		R.set_value((c).fields.get("PreloaderStory"), "visible", true, "=")
	R.set_value(R.get_value((c).fields.get("PassportPanel"), "Login"), "mouseEnabled", true, "=")
	return null

static func f_OnLogin(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(R.get_value((c).fields.get("PassportPanel"), "Login"), "mouseEnabled", false, "=")
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "USER_SIGNED_IN"), R.get_value(c, "onUserSignedIn")])
	R.call_static("com.newgrounds.API", "promptSignIn", [])
	return null

static func f_OnNoThanks(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value((c).fields.get("PassportPanel"), "visible", false, "=")
	R.set_value((c).fields.get("PreloaderStory"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("PassportPanel"), "NoThanks"), "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "OnNoThanks")])
	return null

static func f_EnterFrameHandler(c: Variant, a: Array) -> Variant:
	var v_fLoadingRatio: Variant = NAN
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_fLoadingRatio = float(R.binary("/", R.get_value(R.resolve(c, "loaderInfo", "RoadOfTheDead_fla.MainTimeline"), "bytesLoaded"), R.get_value(R.resolve(c, "loaderInfo", "RoadOfTheDead_fla.MainTimeline"), "bytesTotal")))
	R.invoke(R.get_value((c).fields.get("loadingBar"), "gotoAndStop"), [(float(1) + float(floorf(float((float(v_fLoadingRatio) * float(100))))))])
	R.invoke(R.get_value((c).fields.get("loadingBar2"), "gotoAndStop"), [(float(1) + float(floorf(float((float(v_fLoadingRatio) * float(100))))))])
	R.invoke(R.get_value(R.resolve(c, "Mouse", "RoadOfTheDead_fla.MainTimeline"), "show"), [])
	if R.truth(R.binary("==", R.get_value(R.resolve(c, "loaderInfo", "RoadOfTheDead_fla.MainTimeline"), "bytesLoaded"), R.get_value(R.resolve(c, "loaderInfo", "RoadOfTheDead_fla.MainTimeline"), "bytesTotal"))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "EnterFrameHandler")])
		R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.MainTimeline"), ["Ready"])
	return null

static func f_OnNGPromoClicked(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Lab"))):
		pass
		R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/581901"])])
	else:
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Poltergifts"))):
			pass
			R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/556670"])])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Hippolyta"))):
				pass
				R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/530069"])])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Punk"))):
					pass
					R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/525045"])])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Feed"))):
						pass
						R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/516397"])])
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Death1"))):
							pass
							R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/366511"])])
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Death2"))):
								pass
								R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/505277"])])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("NGPromo"), "Kitten"))):
									pass
									R.invoke(R.resolve(c, "navigateToURL", "RoadOfTheDead_fla.MainTimeline"), [R.construct(R.resolve(c, "URLRequest", "RoadOfTheDead_fla.MainTimeline"), ["http://www.newgrounds.com/portal/view/304999"])])
	return null

static func f_IsOnSite(c: Variant, a: Array) -> Variant:
	var v_szURL: Variant = null
	var v_szSite: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_szURL = R.coerce(R.get_value(R.get_value(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline"), "loaderInfo"), "url"), "String")
	return R.binary("!=", R.invoke(R.get_value(v_szURL, "indexOf"), [v_szSite]), R.unary("-", 1))
	return null

static func f_OnPlayPressed(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.get_value((c).fields.get("PassportPanel"), "NoThanks"), "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "OnNoThanks")])
	R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "OnAPIConnected")])
	R.invoke(R.resolve(c, "play", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_EnterFrameRunHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_Game"), "Run", [])
	return null

static func f___setProp_NGAds_Scene1_Content_0(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "curFrame": "int"}
	l["e"] = null
	l["curFrame"] = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((((R.binary("!=", (c).fields.get("NGAds"), null) and (float(R.lget(l, "curFrame")) >= float(1))) and (float(R.lget(l, "curFrame")) <= float(11))) and (R.binary("==", R.get_value((c).fields.get("__setPropDict"), (c).fields.get("NGAds")), null) or R.unary("!", ((float(R.coerce(R.get_value((c).fields.get("__setPropDict"), (c).fields.get("NGAds")), "int")) >= float(1)) and (float(R.coerce(R.get_value((c).fields.get("__setPropDict"), (c).fields.get("NGAds")), "int")) <= float(11))))))):
		pass
		R.set_value((c).fields.get("__setPropDict"), (c).fields.get("NGAds"), R.lget(l, "curFrame"), "=")
		R.last_error = null
		R.set_value((c).fields.get("NGAds"), "componentInspectorSetting", true, "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
		((c).fields.get("NGAds")).fields["apiId"] = R.coerce("31426:dKuX4hIo", "String")
		((c).fields.get("NGAds")).fields["encryptionKey"] = R.coerce("XsiqOcaZckN3lhCLz9wtQyvV8DJqenl7", "String")
		((c).fields.get("NGAds")).fields["debugMode"] = R.coerce("Simulate Logged-in User", "String")
		((c).fields.get("NGAds")).fields["movieVersion"] = R.coerce("", "String")
		((c).fields.get("NGAds")).fields["connectorType"] = R.coerce("Flash Ad Only", "String")
		((c).fields.get("NGAds")).fields["redirectOnNewVersion"] = false
		((c).fields.get("NGAds")).fields["redirectOnHostBlocked"] = false
		((c).fields.get("NGAds")).fields["adType"] = R.coerce("Simple", "String")
		R.last_error = null
		R.set_value((c).fields.get("NGAds"), "componentInspectorSetting", false, "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
	return null

static func f___setProp_handler(c: Variant, a: Array) -> Variant:
	var v_curFrame: Variant = 0
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_curFrame = R.coerce(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.MainTimeline"), "int")
	if R.truth((float((c).fields.get("__lastFrameProp")) == float(v_curFrame))):
		pass
		return null
	(c).fields["__lastFrameProp"] = R.coerce(v_curFrame, "int")
	R.call_member(c, "__setProp_NGAds_Scene1_Content_0", [v_curFrame])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "IsOnSite", ["kongregate.com"])):
		pass
		R.set_value(R.klass("BasicGame"), "m_iAPI", R.static_value("BasicGame", "API_Kongregate"), "=")
	else:
		pass
		if R.truth(R.call_member(c, "IsOnSite", ["armorgames.com"])):
			pass
			R.set_value(R.klass("BasicGame"), "m_iAPI", R.static_value("BasicGame", "API_ArmorGames"), "=")
		else:
			pass
			R.set_value(R.klass("BasicGame"), "m_iAPI", R.static_value("BasicGame", "API_Newgrounds"), "=")
	R.set_value(R.klass("BasicGame"), "m_szArmorGamesDevKey", "47c84ed89dd19ea8c0612cf9075c2f1a", "=")
	R.set_value(R.klass("BasicGame"), "m_szArmorGamesGameKey", "road-of-the-dead-2", "=")
	(c).fields["bHasPromo"] = R.unary("!", R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")]))
	R.set_value((c).fields.get("PassportPanel"), "visible", false, "=")
	R.set_value((c).fields.get("NGPromo"), "visible", (c).fields.get("bHasPromo"), "=")
	R.set_value((c).fields.get("PreloaderStory"), "visible", R.unary("!", (c).fields.get("bHasPromo")), "=")
	R.set_value((c).fields.get("NGAds"), "visible", R.unary("!", (c).fields.get("bHasPromo")), "=")
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	if R.truth(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline")):
		pass
		R.set_value(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline"), "showDefaultContextMenu", false, "=")
		R.set_value(R.resolve(c, "stage", "RoadOfTheDead_fla.MainTimeline"), "tabChildren", false, "=")
		R.invoke(R.resolve(c, "addEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "EnterFrameHandler")])
	else:
		pass
		R.invoke(R.resolve(c, "addEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "OnAddedToStage")])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		if R.truth(R.call_static("com.newgrounds.API", "getSaveGroup", ["Campaigns"])):
			pass
			R.call_member(c, "TestSession", [])
		else:
			pass
			R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "OnAPIConnected"), 0, true])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Lab"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Poltergifts"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Hippolyta"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Punk"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Feed"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Death1"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Death2"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	R.invoke(R.get_value(R.get_value((c).fields.get("NGPromo"), "Kitten"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnNGPromoClicked")])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	R.invoke(R.get_value((c).fields.get("PlayButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnPlayPressed")])
	if R.truth(R.binary("!=", R.get_value(R.get_value(R.get_value(c, "loaderInfo"), "parameters"), "NewgroundsAPI_SaveFileID"), null)):
		pass
		R.call_static("com.newgrounds.API", "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "OnAPIConnected")])
		R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.MainTimeline"), ["Init"])
	return null

static func f_frame12(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "play", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.MainTimeline"), ["Init"])
	return null

static func f_frame14(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.MainTimeline"), ["Init"])
	return null

static func f_frame15(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.MainTimeline"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.MainTimeline")) - float(1))])
	return null

static func f_frame43(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	(c).fields["gameClass"] = R.coerce(R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["RDGame"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), "Class")
	(c).fields["m_Game"] = R.coerce(R.construct((c).fields.get("gameClass"), [c]), "BasicGame")
	R.call_member((c).fields.get("m_Game"), "Init", [])
	R.call_member((c).fields.get("m_Game"), "Start", [])
	R.invoke(R.resolve(c, "addEventListener", "RoadOfTheDead_fla.MainTimeline"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "EnterFrameRunHandler")])
	return null

static func f_frame55(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "InitInterface", [])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_frame57(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame352(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame365(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "InitInterface", [])
	return null

static func f_frame376(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_frame377(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.MainTimeline"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.MainTimeline")) - float(1))])
	return null

static func f_frame381(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "InitInterface", [])
	return null

static func f_frame393(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_frame394(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.MainTimeline"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.MainTimeline")) - float(1))])
	return null

static func f_frame409(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MainTimeline"), [])
	return null

static func f_frame410(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.MainTimeline"), [(R.num(R.resolve(c, "currentFrame", "RoadOfTheDead_fla.MainTimeline")) - float(1))])
	return null

static func f_frame684(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame1023(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame1031(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayEngineSound"])
	return null

static func f_frame1044(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayPassBySound"])
	return null

static func f_frame1057(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayTireSound"])
	return null

static func f_frame1115(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["StopEngineSound"])
	return null

static func f_frame1118(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayEngineSound"])
	return null

static func f_frame1142(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayTireSound"])
	return null

static func f_frame1154(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayPassBySound"])
	return null

static func f_frame1197(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["StopEngineSound"])
	return null

static func f_frame1483(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame3262(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_frame4139(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame4169(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4200(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending04_2"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame4274(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame4306(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4339(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	return null

static func f_frame4394(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4417(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending04_4"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame4449(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["worried"])
	return null

static func f_frame4476(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4484(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4532(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["takeoffhelmet"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame4553(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4570(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4599(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame4611(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4628(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4644(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame4676(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Diane"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4713(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["angry"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame4753(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4774(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame4795(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4815(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending04_6"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	return null

static func f_frame4847(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4869(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame4880(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending04_7"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame4911(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4937(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame4956(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame4969(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5050(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5095(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5110(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	return null

static func f_frame5159(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5177(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5244(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5291(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5298(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["nod"])
	return null

static func f_frame5333(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5342(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5380(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending05"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Diane"), "Head")])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame5477(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending06"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame5505(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5520(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5552(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending_CochetaGrunt"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Cocheta"), "Head")])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame5596(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending_CochetaStruggle"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Cocheta"), "Head")])
	return null

static func f_frame5629(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookright"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame5634(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5683(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending07"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Cocheta"), "Head")])
	return null

static func f_frame5695(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["okay"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame5764(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["headdown"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame5770(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending08"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame5804(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5817(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5855(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending09"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame5903(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5923(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending10"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame5927(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["nod"])
	return null

static func f_frame5946(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5977(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame5986(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6012(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Diane"), "gotoAndStop"), ["worried"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame6019(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Diane"), "gotoAndPlay"), ["worried"])
	return null

static func f_frame6056(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Diane"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6084(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndStop"), ["worrieddown"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame6094(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["worried"])
	return null

static func f_frame6141(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndStop"), ["blink"])
	return null

static func f_frame6168(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndStop"), [1])
	return null

static func f_frame6189(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Soldiers"), "gotoAndPlay"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Soldiers"), 0.005, 50])
	return null

static func f_frame6277(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["headdown"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame6299(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6313(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6341(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndStop"), ["blink"])
	return null

static func f_frame6404(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame6421(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame6450(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending12"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame6483(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6537(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6558(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["worried"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame6568(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending13"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame6594(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6623(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6657(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame6662(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending14"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Cocheta"), "Head")])
	return null

static func f_frame6719(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["angry"])
	return null

static func f_frame6791(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["worried"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame6795(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending15"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame6825(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6851(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6879(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	return null

static func f_frame6897(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending16"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame6928(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6944(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame6966(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Diane"), "gotoAndPlay"), ["question"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame6971(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending17"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Diane"), "Head")])
	return null

static func f_frame7047(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame7050(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending18"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame7074(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["nod"])
	return null

static func f_frame7092(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7110(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame7138(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7154(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7192(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7216(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["angry"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame7231(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7287(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Cocheta"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7327(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Diane"), "gotoAndPlay"), ["waiting"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame7372(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Diane"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7382(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Diane"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7425(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Diane"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7463(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame7471(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7483(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7503(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["headdown"])
	return null

static func f_frame7534(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7560(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame7573(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending20"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame7605(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7632(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7654(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame7711(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame7729(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7748(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame7752(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7763(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending22"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame7807(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7852(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7875(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7912(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookright"])
	return null

static func f_frame7939(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame7965(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8029(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8076(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8084(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8094(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookdown"])
	return null

static func f_frame8112(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8153(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8199(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame8202(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["look2"])
	return null

static func f_frame8203(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending23"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame8226(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8264(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8273(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["look2"])
	return null

static func f_frame8294(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8306(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8330(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame8334(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending25"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Diane"), "Head")])
	return null

static func f_frame8402(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookrightquick"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame8405(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending26"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame8511(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8553(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8587(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8599(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	return null

static func f_frame8603(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8653(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8665(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8720(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookright"])
	return null

static func f_frame8727(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8785(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8812(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame8864(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Soldiers"), 0.005, 50])
	return null

static func f_frame8948(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndStop"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame8950(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending28"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame9000(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Diane"), 0.005, 50])
	return null

static func f_frame9004(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending29"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Diane"), "Head")])
	return null

static func f_frame9094(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["lookright"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame9100(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending30"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame9151(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Cocheta"), "gotoAndPlay"), ["worried"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Cocheta"), 0.005, 50])
	return null

static func f_frame9173(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending31"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value((c).fields.get("Cocheta"), "Head")])
	return null

static func f_frame9209(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame9214(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayCinematicVoice", [R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "RoadOfTheDead_fla.MainTimeline"), ["SND_Ending32"]), R.resolve(c, "Class", "RoadOfTheDead_fla.MainTimeline")), R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	return null

static func f_frame9258(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame9290(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["nod"])
	return null

static func f_frame9308(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame9345(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicMouth", [R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "Mouth")])
	R.invoke(R.get_value((c).fields.get("Sherman"), "gotoAndPlay"), ["idle"])
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [(c).fields.get("Sherman"), 0.005, 50])
	return null

static func f_frame9377(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame9418(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value((c).fields.get("Sherman"), "Head"), "gotoAndPlay"), ["blink"])
	return null

static func f_frame9464(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetCinematicPerlinScene", [null, 0.005, 50])
	return null

static func f_frame10378(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["UnlockJohnCar"])
	return null

static func f_frame11373(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "OnTimelineEvent", ["PlayMenuMusic"])
	return null

static func f_frame11495(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "EndCinematic", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Soldiers"] = R.coerce(null, "MovieClip")
	(c).fields["Cocheta"] = R.coerce(null, "MovieClip")
	(c).fields["Sherman"] = R.coerce(null, "MovieClip")
	(c).fields["NGPromo"] = R.coerce(null, "MovieClip")
	(c).fields["Diane"] = R.coerce(null, "MovieClip")
	(c).fields["SuppressZone"] = R.coerce(null, "MC_SoldierSuppressZone")
	(c).fields["MenuScreen"] = R.coerce(null, "MovieClip")
	(c).fields["loadingBar"] = R.coerce(null, "MovieClip")
	(c).fields["PreloaderStory"] = R.coerce(null, "MovieClip")
	(c).fields["PassportPanel"] = R.coerce(null, "MovieClip")
	(c).fields["HiddenSoldierIcon"] = R.coerce(null, "MC_HiddenSoldierIcon")
	(c).fields["SkipCinematicButton"] = R.coerce(null, "SimpleButton")
	(c).fields["NGAds"] = R.coerce(null, "APIConnector")
	(c).fields["loadingBar2"] = R.coerce(null, "MovieClip")
	(c).fields["StorageNotice"] = R.coerce(null, "MovieClip")
	(c).fields["DudeBro"] = R.coerce(null, "MC_DudeBro")
	(c).fields["PlayButton"] = R.coerce(null, "SimpleButton")
	(c).fields["__setPropDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "RoadOfTheDead_fla.MainTimeline"), [true]), "Dictionary")
	(c).fields["__lastFrameProp"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["bHasPromo"] = false
	(c).fields["gameClass"] = R.coerce(null, "Class")
	(c).fields["m_Game"] = R.coerce(null, "BasicGame")
	return null
