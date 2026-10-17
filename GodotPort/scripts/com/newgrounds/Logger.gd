extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Logger(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.Logger"), [])
	return null

static func f_logInternal(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_INTERNAL"), v_rest])
	return null

static func f_logMessage(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_MESSAGE"), v_rest])
	return null

static func f_logWarning(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_WARNING"), v_rest])
	return null

static func f_logError(c: Variant, a: Array) -> Variant:
	var v_rest: Variant = R.coerce(a.slice(0), "*")
	R.invoke(R.resolve(c, "log", "com.newgrounds.Logger"), [R.static_value("com.newgrounds.Logger", "PRIORITY_ERROR"), v_rest])
	return null

static func f_log(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 1), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v__loc3_ = R.coerce(0, "uint")
	if R.truth((float(v_param1) >= float(R.static_value("com.newgrounds.Logger", "_messageLevel")))):
		pass
		v__loc3_ = R.coerce(0, "uint")
		while R.truth(R.binary("<", v__loc3_, R.get_value(v_param2, "length"))):
			pass
			R.invoke(R.resolve(c, "trace", "com.newgrounds.Logger"), [R.binary("+", R.static_value("com.newgrounds.Logger", "HEADER"), R.get_value(v_param2, v__loc3_))])
			R.invoke(R.get_value(R.static_value("com.newgrounds.Logger", "_eventDispatcher"), "dispatchEvent"), [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "LOG"), R.get_value(v_param2, v__loc3_)])])
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	if R.truth((float(v_param1) >= float(R.static_value("com.newgrounds.Logger", "_throwLevel")))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.Logger"), [R.invoke(R.get_value(v_param2, "join"), ["\n"])]))
	return null

static func f_addEventListener(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	R.invoke(R.get_value(R.static_value("com.newgrounds.Logger", "_eventDispatcher"), "addEventListener"), [v_param1, v_param2, false, 0, false])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "PRIORITY_INTERNAL", 0, "=")
	R.set_value(c, "PRIORITY_MESSAGE", 1, "=")
	R.set_value(c, "PRIORITY_WARNING", 2, "=")
	R.set_value(c, "PRIORITY_ERROR", 3, "=")
	R.set_value(c, "PRIORITY_MAX", 4, "=")
	R.set_value(c, "HEADER", "[Newgrounds API] :: ", "=")
	R.set_value(c, "_eventDispatcher", R.construct(R.resolve(c, "EventDispatcher", "com.newgrounds.Logger"), []), "=")
	R.set_value(c, "_messageLevel", R.static_value("com.newgrounds.Logger", "PRIORITY_MESSAGE"), "=")
	R.set_value(c, "_throwLevel", R.static_value("com.newgrounds.Logger", "PRIORITY_MAX"), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
