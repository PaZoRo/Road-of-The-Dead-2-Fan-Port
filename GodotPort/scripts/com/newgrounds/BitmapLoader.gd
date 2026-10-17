extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_BitmapLoader(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.BitmapLoader"), [])
	(c).fields["_bitmapData"] = R.coerce(v_param1, "BitmapData")
	(c).fields["_url"] = R.coerce(v_param2, "String")
	return null

static func f_get_url(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_url")
	return null

static func f_set_url(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_loaded"] = false
	(c).fields["_url"] = R.coerce(v_param1, "String")
	return null

static func f_get_bitmapData(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_bitmapData")
	return null

static func f_set_bitmapData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	(c).fields["_bitmapData"] = R.coerce(v_param1, "BitmapData")
	(c).fields["_loaded"] = true
	return null

static func f_get_loaded(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_loaded")
	return null

static func f_createLoader(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc1_ = R.coerce(R.construct(R.resolve(c, "Loader", "com.newgrounds.BitmapLoader"), []), "Loader")
	v__loc2_ = R.coerce(R.construct(R.resolve(c, "URLRequest", "com.newgrounds.BitmapLoader"), [(c).fields.get("_url")]), "URLRequest")
	R.set_value(v__loc2_, "method", R.get_value(R.resolve(c, "URLRequestMethod", "com.newgrounds.BitmapLoader"), "GET"), "=")
	R.set_value(v__loc2_, "data", R.invoke(R.get_value(R.static_value("com.newgrounds.BitmapLoader", "_cacheSeed"), "toString"), []), "=")
	R.invoke(R.get_value(v__loc1_, "load"), [v__loc2_, R.static_value("com.newgrounds.BitmapLoader", "LOADER_CONTEXT")])
	return v__loc1_
	return null

static func f_disposeLoader(c: Variant, a: Array) -> Variant:
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

static func f_load(c: Variant, a: Array) -> Variant:
	if R.truth((R.unary("!", (c).fields.get("_url")) or R.binary("==", (c).fields.get("_url"), ""))):
		pass
		R.call_member(c, "onLoadComplete", [null])
		return null
	R.call_member(c, "disposeLoader", [])
	(c).fields["_loader"] = R.coerce(R.call_member(c, "createLoader", []), "Loader")
	R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "onLoadComplete")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_loader"), "contentLoaderInfo"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.BitmapLoader"), "IO_ERROR"), R.get_value(c, "onLoadComplete")])
	return null

static func f_attachBitmap(c: Variant, a: Array) -> Variant:
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

static func f_onLoadComplete(c: Variant, a: Array) -> Variant:
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

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_cacheSeed", 0, "=")
	R.set_value(c, "LOADER_CONTEXT", R.construct(R.resolve(c, "LoaderContext", "com.newgrounds.BitmapLoader"), [true]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_url"] = R.coerce(null, "String")
	(c).fields["_bitmapData"] = R.coerce(null, "BitmapData")
	(c).fields["_loaded"] = true
	(c).fields["_loader"] = R.coerce(null, "Loader")
	return null
