extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APIConnector(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.components.APIConnector"), [])
	R.invoke(R.resolve(c, "addFrameScript", "com.newgrounds.components.APIConnector"), [0, R.get_value(c, "frame1")])
	R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.APIConnector"), [R.get_value(R.klass("Event"), "FRAME_CONSTRUCTED"), R.get_value(c, "__setProp_handler"), false, 0, true])
	return null

static func f_initAd(c: Variant, a: Array) -> Variant:
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

static func f__onLoaded(c: Variant, a: Array) -> Variant:
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

static func f__apiConnect(c: Variant, a: Array) -> Variant:
	var v_api: Variant = null
	v_api = R.coerce(R.klass("com.newgrounds.API"), "*")
	if R.truth((R.truth(v_api) and R.unary("!", R.get_value(v_api, "connected")))):
		pass
		if R.truth(R.unary("!", (c).fields.get("apiId"))):
			pass
			R.call_static("com.newgrounds.Logger", "logError", ["No API ID entered in the API Connector component.", "You can create an API ID for this submission at http://newgrounds.com/account/flashapi", "Enter your API ID into the API Connector using the Component Inspector (Window -> Component Inspector)."])
			return null
		var __t3 = (c).fields.get("debugMode")
		var __t4 = -1
		if __t4 == -1 and R.binary("===", __t3, "Off"):
			__t4 = 1
		if __t4 == -1 and R.binary("===", __t3, "Simulate Logged-in User"):
			__t4 = 2
		if __t4 == -1 and R.binary("===", __t3, "Simulate Logged-out User"):
			__t4 = 3
		if __t4 == -1 and R.binary("===", __t3, "Simulate New Version"):
			__t4 = 4
		if __t4 == -1 and R.binary("===", __t3, "Simulate Host Blocked"):
			__t4 = 5
		if __t4 == -1:
			__t4 = 0
		for __case__t4 in [0]:
			if __t4 >= 0 and __t4 <= 0:
				pass
			if __t4 >= 0 and __t4 <= 1:
				pass
				R.set_value(v_api, "debugMode", R.get_value(v_api, "RELEASE_MODE"), "=")
				break
			if __t4 >= 0 and __t4 <= 2:
				pass
				R.set_value(v_api, "debugMode", R.get_value(v_api, "DEBUG_MODE_LOGGED_IN"), "=")
				break
			if __t4 >= 0 and __t4 <= 3:
				pass
				R.set_value(v_api, "debugMode", R.get_value(v_api, "DEBUG_MODE_LOGGED_OUT"), "=")
				break
			if __t4 >= 0 and __t4 <= 4:
				pass
				R.set_value(v_api, "debugMode", R.get_value(v_api, "DEBUG_MODE_NEW_VERSION"), "=")
				break
			if __t4 >= 0 and __t4 <= 5:
				pass
				R.set_value(v_api, "debugMode", R.get_value(v_api, "DEBUG_MODE_HOST_BLOCKED"), "=")
		if R.truth((c).fields.get("loader")):
			pass
			((c).fields.get("loader")).fields["haltComplete"] = true
		R.invoke(R.get_value(v_api, "addEventListener"), [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "_onConnected")])
		R.invoke(R.get_value(v_api, "connect"), [R.resolve(c, "root", "com.newgrounds.components.APIConnector"), (c).fields.get("apiId"), (c).fields.get("encryptionKey"), (c).fields.get("movieVersion")])
	return null

static func f__onConnected(c: Variant, a: Array) -> Variant:
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

static func f_forceAlwaysOnTop(c: Variant, a: Array) -> Variant:
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

static func f___setProp_ad_APIConnector_AD_0(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "curFrame": "int"}
	l["e"] = null
	l["curFrame"] = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((((R.binary("!=", (c).fields.get("ad"), null) and (float(R.lget(l, "curFrame")) >= float(1))) and (float(R.lget(l, "curFrame")) <= float(21))) and (R.binary("==", R.get_value((c).fields.get("__setPropDict"), (c).fields.get("ad")), null) or R.unary("!", ((float(R.coerce(R.get_value((c).fields.get("__setPropDict"), (c).fields.get("ad")), "int")) >= float(1)) and (float(R.coerce(R.get_value((c).fields.get("__setPropDict"), (c).fields.get("ad")), "int")) <= float(21))))))):
		pass
		R.set_value((c).fields.get("__setPropDict"), (c).fields.get("ad"), R.lget(l, "curFrame"), "=")
		R.last_error = null
		R.set_value((c).fields.get("ad"), "componentInspectorSetting", true, "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
		R.set_value((c).fields.get("ad"), "apiId", "", "=")
		R.set_value((c).fields.get("ad"), "showBorder", true, "=")
		((c).fields.get("ad")).fields["adType"] = R.coerce("Video", "String")
		R.last_error = null
		R.set_value((c).fields.get("ad"), "componentInspectorSetting", false, "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
	return null

static func f___setProp_handler(c: Variant, a: Array) -> Variant:
	var v_curFrame: Variant = 0
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_curFrame = R.coerce(R.resolve(c, "currentFrame", "com.newgrounds.components.APIConnector"), "int")
	if R.truth((float((c).fields.get("__lastFrameProp")) == float(v_curFrame))):
		pass
		return null
	(c).fields["__lastFrameProp"] = R.coerce(v_curFrame, "int")
	R.call_member(c, "__setProp_ad_APIConnector_AD_0", [v_curFrame])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.APIConnector"), [])
	if R.truth((R.truth(R.resolve(c, "root", "com.newgrounds.components.APIConnector")) and R.binary("is", R.resolve(c, "root", "com.newgrounds.components.APIConnector"), R.klass("MovieClip")))):
		pass
		R.invoke(R.get_value(R.invoke(R.klass("MovieClip"), [R.resolve(c, "root", "com.newgrounds.components.APIConnector")]), "stop"), [])
	R.assign(c, "x", "com.newgrounds.components.APIConnector", R.coerce(R.resolve(c, "x", "com.newgrounds.components.APIConnector"), "int"), "=")
	R.assign(c, "y", "com.newgrounds.components.APIConnector", R.coerce(R.resolve(c, "y", "com.newgrounds.components.APIConnector"), "int"), "=")
	if R.truth(R.unary("!", (c).fields.get("debugMode"))):
		pass
		(c).fields["debugMode"] = R.coerce("Simulate Logged-in User", "String")
	if R.truth(R.unary("!", (c).fields.get("connectorType"))):
		pass
		(c).fields["connectorType"] = R.coerce("Flash Ad + Preloader", "String")
	if R.truth(R.unary("!", (c).fields.get("adType"))):
		pass
		(c).fields["adType"] = R.coerce("Video", "String")
	if R.truth((c).fields.get("ad")):
		pass
		((c).fields.get("ad")).fields["adType"] = R.coerce((c).fields.get("adType"), "String")
	R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.APIConnector"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "initAd")])
	if R.truth(R.binary("==", (c).fields.get("connectorType"), "Invisible")):
		pass
		R.assign(c, "visible", "com.newgrounds.components.APIConnector", false, "=")
	R.call_member(c, "_apiConnect", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["loader"] = R.coerce(null, "Preloader")
	(c).fields["ad"] = R.coerce(null, "FlashAd")
	(c).fields["__setPropDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "com.newgrounds.components.APIConnector"), [true]), "Dictionary")
	(c).fields["__lastFrameProp"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["apiId"] = R.coerce(null, "String")
	(c).fields["encryptionKey"] = R.coerce(null, "String")
	(c).fields["movieVersion"] = R.coerce(null, "String")
	(c).fields["debugMode"] = R.coerce(null, "String")
	(c).fields["connectorType"] = R.coerce(null, "String")
	(c).fields["redirectOnHostBlocked"] = false
	(c).fields["redirectOnNewVersion"] = false
	(c).fields["adType"] = R.coerce(null, "String")
	(c).fields["className"] = R.coerce(null, "String")
	(c).fields["_redirect"] = false
	return null
