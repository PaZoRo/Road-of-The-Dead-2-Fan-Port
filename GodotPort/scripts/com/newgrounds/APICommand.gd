extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APICommand(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.APICommand"), [])
	(c).fields["_command"] = R.coerce(v_param1, "String")
	(c).fields["_parameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	(c).fields["_secureParameters"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.APICommand"), []), "Object")
	(c).fields["_timeoutTimer"] = R.coerce(R.construct(R.resolve(c, "Timer", "com.newgrounds.APICommand"), [R.static_value("com.newgrounds.APICommand", "TIMEOUT_INTERVAL"), 1]), "Timer")
	R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "com.newgrounds.APICommand"), "TIMER"), R.get_value(c, "onTimeout")])
	(c).fields["_hasTimeout"] = true
	return null

static func f_stopPendingCommands(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(null, "APICommand")
	for __t1 in R.iterate(R.static_value("com.newgrounds.APICommand", "_pendingCommands"), true):
		v__loc1_ = R.coerce(__t1, "APICommand")
		R.call_member(v__loc1_, "close", [])
	R.assign(c, "_pendingCommands", "com.newgrounds.APICommand", [], "=")
	return null

static func f_onThrottleTimer(c: Variant, a: Array) -> Variant:
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

static func f_encryptHex(c: Variant, a: Array) -> Variant:
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

static func f_get_command(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_command")
	return null

static func f_set_command(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_command"] = R.coerce(v_param1, "String")
	return null

static func f_get_hasTimeout(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_hasTimeout")
	return null

static func f_set_hasTimeout(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_hasTimeout"] = v_param1
	return null

static func f_get_parameters(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_parameters")
	return null

static func f_set_parameters(c: Variant, a: Array) -> Variant:
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

static func f_get_preventCache(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_preventCache")
	return null

static func f_set_preventCache(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_preventCache"] = v_param1
	return null

static func f_get_secureParameters(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_secureParameters")
	return null

static func f_set_secureParameters(c: Variant, a: Array) -> Variant:
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

static func f_get_hasSecureParameters(c: Variant, a: Array) -> Variant:
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

static func f_addFile(c: Variant, a: Array) -> Variant:
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

static func f_removeFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("_files")):
		pass
		R.delete_value((c).fields.get("_files"), v_param1)
	return null

static func f_clearFiles(c: Variant, a: Array) -> Variant:
	(c).fields["_files"] = R.coerce(null, "Object")
	return null

static func f_close(c: Variant, a: Array) -> Variant:
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

static func f_loadInBrowser(c: Variant, a: Array) -> Variant:
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

static func f_send(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	if R.truth((float(R.static_value("com.newgrounds.APICommand", "_throttleCount")) >= float(R.static_value("com.newgrounds.APICommand", "THROTTLE_THRESHOLD")))):
		pass
		R.invoke(R.get_value(R.static_value("com.newgrounds.APICommand", "_commandQueue"), "push"), [{"connection": v_param1, "command": c}])
	else:
		pass
		R.call_member(c, "sendInternal", [v_param1])
	return null

static func f_sendInternal(c: Variant, a: Array) -> Variant:
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

static func f_onTimeout(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.call_member(c, "close", [])
	R.call_static("com.newgrounds.Logger", "logError", ["Command timed out."])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_TIMED_OUT")])])
	return null

static func f_onError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_static("com.newgrounds.Logger", "logError", ["Error when sending command:", v_param1])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_UNKNOWN")])])
	R.call_member(c, "close", [])
	return null

static func f_onComplete(c: Variant, a: Array) -> Variant:
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

static func f_startLoader(c: Variant, a: Array) -> Variant:
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

static func f_as3CompleteHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onComplete", [R.get_value((c).fields.get("_loader"), "data")])
	return null

static func f_as3UpdateHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.get_value((c).fields.get("_timeoutTimer"), "running")):
		pass
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "reset"), [])
		R.invoke(R.get_value((c).fields.get("_timeoutTimer"), "start"), [])
	return null

static func f_as3ErrorHandler(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onError", [R.invoke(R.get_value(v_param1, "toString"), [])])
	return null

static func f_buildMultipartData(c: Variant, a: Array) -> Variant:
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

static func f_init_statics(c: Variant, a: Array) -> Variant:
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

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_command"] = R.coerce(null, "String")
	(c).fields["_parameters"] = R.coerce(null, "Object")
	(c).fields["_secureParameters"] = R.coerce(null, "Object")
	(c).fields["_files"] = R.coerce(null, "Object")
	(c).fields["_preventCache"] = false
	(c).fields["_hasTimeout"] = false
	(c).fields["_timeoutTimer"] = R.coerce(null, "Timer")
	(c).fields["_loader"] = R.coerce(null, "URLLoader")
	return null

static func f_closure___t11(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc1_": "*"}
	l["_loc1_"] = null
	R.lset(l, "_loc1_", R.construct(R.resolve(c, "Timer", "com.newgrounds.APICommand"), [R.static_value("com.newgrounds.APICommand", "THROTTLE_TICK_INTERVAL"), 0]))
	R.invoke(R.get_value(R.lget(l, "_loc1_"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "com.newgrounds.APICommand"), "TIMER"), R.resolve(c, "onThrottleTimer", "com.newgrounds.APICommand")])
	R.invoke(R.get_value(R.lget(l, "_loc1_"), "start"), [])
	return R.lget(l, "_loc1_")
	return null
