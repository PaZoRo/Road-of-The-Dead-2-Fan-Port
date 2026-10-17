extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_API(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.API"), [])
	return null

static func f_get_connected(c: Variant, a: Array) -> Variant:
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "connected")
	return null

static func f_get_isNetworkHost(c: Variant, a: Array) -> Variant:
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "isNetworkHost")
	return null

static func f_get_apiId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("apiId")
	return null

static func f_get_debugMode(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_debugMode")
	return null

static func f_set_debugMode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.assign(c, "_debugMode", "com.newgrounds.API", v_param1, "=")
	return null

static func f_get_publisherId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId")
	return null

static func f_get_sessionId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("sessionId")
	return null

static func f_get_hostDomain(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("hostDomain")
	return null

static func f_get_hostURL(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "hostURL")
	return null

static func f_get_isNewgrounds(c: Variant, a: Array) -> Variant:
	return (float((R.static_value("com.newgrounds.API", "_connection")).fields.get("publisherId")) == float(1))
	return null

static func f_get_hasUserSession(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return R.get_value(R.static_value("com.newgrounds.API", "_connection"), "hasUserSession")
	return null

static func f_get_username(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("username")
	return null

static func f_get_userId(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])
	return (R.static_value("com.newgrounds.API", "_connection")).fields.get("userId")
	return null

static func f_assertConnected(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertConnected", [])):
		pass
		return true
	if R.truth(v_param1):
		pass
		R.invoke(R.resolve(c, "dispatchEvent", "com.newgrounds.API"), [v_param1, null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_CONNECTED")])
	return false
	return null

static func f_get_serverTime(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_serverTime")
	return null

static func f_get_adsApproved(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_adsApproved")
	return null

static func f_get_adFeedURL(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_adFeedURL")
	return null

static func f_get_medals(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_medalsArray")
	return null

static func f_get_scoreBoards(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_scoreBoardsArray")
	return null

static func f_get_saveGroups(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.API", "_saveGroupsArray")
	return null

static func f_connect(c: Variant, a: Array) -> Variant:
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

static func f_doConnect(c: Variant, a: Array) -> Variant:
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

static func f_onConnect(c: Variant, a: Array) -> Variant:
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

static func f_onMetadataLoaded(c: Variant, a: Array) -> Variant:
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

static func f_disconnect(c: Variant, a: Array) -> Variant:
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

static func f_loadNewgrounds(c: Variant, a: Array) -> Variant:
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadNewgrounds"])
	return null

static func f_loadOfficialVersion(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadOfficialVersion", false])
	return null

static func f_promptSignIn(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.invoke(R.resolve(c, "navigateToURL", "com.newgrounds.API"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.API"), [R.binary("+", R.static_value("com.newgrounds.API", "PASSPORT_URL"), R.get_value(R.static_value("com.newgrounds.API", "_bridge"), "widgetId"))]), "_blank"])
		R.call_member(R.static_value("com.newgrounds.API", "_bridge"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "BRIDGE_EVENT_RECEIVED"), R.resolve(c, "onUserSignedIn", "com.newgrounds.API"), false, 0, true])
	return null

static func f_onUserSignedIn(c: Variant, a: Array) -> Variant:
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

static func f_loadMySite(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadMySite"])
	return null

static func f_loadCustomLink(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", [])):
		pass
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "loadInBrowser", ["loadCustomLink", true, {"link": v_param1}])
	return null

static func f_getMedal(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value(R.static_value("com.newgrounds.API", "_medals"), v_param1)
	return null

static func f_unlockMedal(c: Variant, a: Array) -> Variant:
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

static func f_onMedalUnlocked(c: Variant, a: Array) -> Variant:
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

static func f_onMedalUnlockConfirmed(c: Variant, a: Array) -> Variant:
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

static func f_clearLocalMedals(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(null, "Medal")
	for __t4 in R.iterate(R.static_value("com.newgrounds.API", "_medals"), true):
		v__loc1_ = R.coerce(__t4, "Medal")
		R.call_member(v__loc1_, "setUnlocked", [false])
	if R.truth(R.unary("!", R.resolve(c, "hasUserSession", "com.newgrounds.API"))):
		pass
		R.invoke(R.resolve(c, "saveLocal", "com.newgrounds.API"), ["medals_unlocked", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), [])])
	return null

static func f_getScoreBoard(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	return R.get_value(R.static_value("com.newgrounds.API", "_scoreBoards"), v_param1)
	return null

static func f_loadScores(c: Variant, a: Array) -> Variant:
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

static func f_postScore(c: Variant, a: Array) -> Variant:
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

static func f_getSaveGroup(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), []))):
		pass
		return null
	return R.get_value(R.static_value("com.newgrounds.API", "_saveGroups"), v_param1)
	return null

static func f_getSaveGroupById(c: Variant, a: Array) -> Variant:
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

static func f_createSaveFile(c: Variant, a: Array) -> Variant:
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

static func f_loadSaveFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["loadSaveFile", R.resolve(c, "onFileLoaded", "com.newgrounds.API"), {"save_id": v_param1, "get_contents": v_param2}])
	return null

static func f_onFileLoaded(c: Variant, a: Array) -> Variant:
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

static func f_createSaveQuery(c: Variant, a: Array) -> Variant:
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

static func f_createSaveQueryByDate(c: Variant, a: Array) -> Variant:
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

static func f_createSaveQueryByName(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "createSaveQuery", "com.newgrounds.API"), [v_param1]), "SaveQuery")
	R.call_member(v__loc5_, "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_NAME"), (R.static_value("com.newgrounds.SaveQuery", "OPERATOR_EQUAL") if R.truth(v_param3) else R.static_value("com.newgrounds.SaveQuery", "OPERATOR_CONTAINS")), v_param2])
	return v__loc5_
	return null

static func f_createSaveQueryByRating(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "createSaveQuery", "com.newgrounds.API"), [v_param1]), "SaveQuery")
	R.call_member(v__loc4_, "sortOn", [v_param2, v_param3])
	return v__loc4_
	return null

static func f_onRequestedFileLoaded(c: Variant, a: Array) -> Variant:
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

static func f_addEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else true), "Boolean")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "addEventListener", [v_param1, v_param2, false, v_param3, v_param4])
	return null

static func f_removeEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "removeEventListener", [v_param1, v_param2])
	return null

static func f_dispatchEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	R.call_member(R.static_value("com.newgrounds.API", "_dispatcher"), "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [v_param1, v_param2, v_param3])])
	return null

static func f_saveLocal(c: Variant, a: Array) -> Variant:
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

static func f_loadLocal(c: Variant, a: Array) -> Variant:
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

static func f_logCustomEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.invoke(R.resolve(c, "assertConnected", "com.newgrounds.API"), [])):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", "Logged event: ", v_param1)])
		R.call_member(R.static_value("com.newgrounds.API", "_connection"), "sendSimpleCommand", ["logCustomEvent", null, {"event": v_param1}])
	return null

static func f_encodeData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.unary("!", R.call_member(R.static_value("com.newgrounds.API", "_connection"), "assertInitialized", []))):
		pass
		return null
	return R.call_static("com.newgrounds.crypto.RC4", "encrypt", [R.invoke(R.get_value(R.get_value(R.get_value(R.get_value(R.get_value(R.resolve(c, "com", "com.newgrounds.API"), "newgrounds"), "encoders"), "json"), "JSON"), "encode"), [v_param1]), (R.static_value("com.newgrounds.API", "_connection")).fields.get("encryptionKey")])
	return null

static func f_decodeData(c: Variant, a: Array) -> Variant:
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

static func f_stopPendingCommands(c: Variant, a: Array) -> Variant:
	R.call_static("com.newgrounds.APICommand", "stopPendingCommands", [])
	R.call_static("com.newgrounds.Logger", "logMessage", ["Pending commands stopped."])
	return null

static func f_trimWhitespace(c: Variant, a: Array) -> Variant:
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

static func f_checkRootLoaderInfo(c: Variant, a: Array) -> Variant:
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

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_bridge", null, "=")
	R.set_value(c, "_movieName", null, "=")
	R.set_value(c, "_movieVersion", null, "=")
	R.set_value(c, "_root", null, "=")
	R.set_value(c, "_newVersion", false, "=")
	R.set_value(c, "_serverTime", null, "=")
	R.set_value(c, "_adFeedURL", null, "=")
	R.set_value(c, "_imageFilePath", null, "=")
	R.set_value(c, "_saveFilePath", null, "=")
	R.set_value(c, "_requestedSaveFileId", 0, "=")
	R.set_value(c, "_requestedSaveGroupId", 0, "=")
	R.set_value(c, "RELEASE_MODE", "releaseMode", "=")
	R.set_value(c, "DEBUG_MODE_LOGGED_IN", "debugModeLoggedIn", "=")
	R.set_value(c, "DEBUG_MODE_LOGGED_OUT", "debugModeLoggedOut", "=")
	R.set_value(c, "DEBUG_MODE_NEW_VERSION", "debugModeNewVersion", "=")
	R.set_value(c, "DEBUG_MODE_HOST_BLOCKED", "debugModeHostBlocked", "=")
	R.set_value(c, "TEST_AD_FEED_URL", "http://www.ngads.com/adtest.php", "=")
	R.set_value(c, "PASSPORT_URL", "https://www.newgrounds.com/login/remote/", "=")
	R.set_value(c, "_dispatcher", R.construct(R.klass("com.newgrounds.APIEventDispatcher"), []), "=")
	R.set_value(c, "_connection", R.construct(R.klass("com.newgrounds.APIConnection"), []), "=")
	R.set_value(c, "_debugMode", R.static_value("com.newgrounds.API", "DEBUG_MODE_LOGGED_IN"), "=")
	R.set_value(c, "_adsApproved", false, "=")
	R.set_value(c, "_medals", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.set_value(c, "_medalsArray", [], "=")
	R.set_value(c, "_scoreBoards", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.set_value(c, "_scoreBoardsArray", [], "=")
	R.set_value(c, "_saveGroups", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.set_value(c, "_saveGroupsArray", [], "=")
	R.set_value(c, "_sharedObjects", R.construct(R.resolve(c, "Object", "com.newgrounds.API"), []), "=")
	R.set_value(c, "VERSION", "3.2 AS3", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
