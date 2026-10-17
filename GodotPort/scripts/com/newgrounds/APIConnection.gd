extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APIConnection(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.APIConnection"), [])
	R.call_member(c, "reset", [])
	return null

static func f_get_hostURL(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_hostURL")
	return null

static func f_set_hostURL(c: Variant, a: Array) -> Variant:
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

static func f_get_sandboxType(c: Variant, a: Array) -> Variant:
	return R.get_value(R.resolve(c, "Security", "com.newgrounds.APIConnection"), "sandboxType")
	return null

static func f_get_isNetworkHost(c: Variant, a: Array) -> Variant:
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

static func f_get_hasUserSession(c: Variant, a: Array) -> Variant:
	return ((R.binary("!=", (c).fields.get("sessionId"), null) and R.binary("!=", (c).fields.get("sessionId"), "")) and (float((c).fields.get("publisherId")) != float(0)))
	return null

static func f_get_connected(c: Variant, a: Array) -> Variant:
	return R.binary("==", (c).fields.get("connectionState"), R.static_value("com.newgrounds.APIConnection", "CONNECTED"))
	return null

static func f_reset(c: Variant, a: Array) -> Variant:
	(c).fields["connectionState"] = R.coerce(R.static_value("com.newgrounds.APIConnection", "NOT_CONNECTED"), "String")
	(c).fields["encryptionKey"] = R.coerce(null, "String")
	(c).fields["sessionId"] = R.coerce(null, "String")
	(c).fields["userEmail"] = R.coerce(null, "String")
	(c).fields["username"] = R.coerce(null, "String")
	(c).fields["userId"] = R.coerce(0, "uint")
	(c).fields["userpageFormat"] = R.coerce(0, "uint")
	return null

static func f_assertInitialized(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("initialized"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["You must initialized the API using API.connect() before using this command."])
		return false
	return true
	return null

static func f_assertConnected(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.unary("!", (c).fields.get("connectionState")), R.static_value("com.newgrounds.APIConnection", "CONNECTED"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["You must establish a connection using API.connect() before using this command."])
		return false
	return true
	return null

static func f_sendSimpleCommand(c: Variant, a: Array) -> Variant:
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

static func f_sendCommand(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APICommand")
	R.call_member(v_param1, "send", [c])
	return null

static func f_loadInBrowser(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	v__loc4_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), [v_param1]), "APICommand")
	R.set_value(v__loc4_, "parameters", v_param3, "=")
	R.call_member(v__loc4_, "loadInBrowser", [c, v_param2])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "NOT_CONNECTED", "notConnected", "=")
	R.set_value(c, "CONNECTING", "connecting", "=")
	R.set_value(c, "CONNECTED", "connected", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["initialized"] = false
	(c).fields["connectionState"] = R.coerce("notConnected", "String")
	(c).fields["apiURL"] = R.coerce("http://www.ngads.com/gateway_v2.php", "String")
	(c).fields["apiId"] = R.coerce(null, "String")
	(c).fields["debug"] = false
	(c).fields["trackerId"] = R.coerce(0, "uint")
	(c).fields["publisherId"] = R.coerce(0, "uint")
	(c).fields["encryptionKey"] = R.coerce(null, "String")
	(c).fields["sessionId"] = R.coerce(null, "String")
	(c).fields["userEmail"] = R.coerce(null, "String")
	(c).fields["username"] = R.coerce(null, "String")
	(c).fields["userId"] = R.coerce(0, "uint")
	(c).fields["userpageFormat"] = R.coerce(0, "uint")
	(c).fields["_hostURL"] = R.coerce(null, "String")
	(c).fields["hostDomain"] = R.coerce(null, "String")
	return null
