extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Bridge(c: Variant, a: Array) -> Variant:
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

static func f_get_widgetId(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_widgetId")
	return null

static func f_onLogMessage(c: Variant, a: Array) -> Variant:
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

static func f_sendEvent(c: Variant, a: Array) -> Variant:
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

static func f_receiveEvent(c: Variant, a: Array) -> Variant:
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

static func f_onStatus(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_inConnection"] = R.coerce(null, "LocalConnection")
	(c).fields["_outConnection"] = R.coerce(null, "LocalConnection")
	(c).fields["_widgetId"] = R.coerce(null, "String")
	return null
