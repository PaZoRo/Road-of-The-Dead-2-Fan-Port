extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_FlashAdBase(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"error": "*"}
	l["error"] = null
	(c).fields["adType"] = R.coerce((c).fields.get("VIDEO_ADS"), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.components.FlashAdBase"), [])
	R.last_error = null
	R.invoke(R.get_value(R.resolve(c, "Security", "com.newgrounds.components.FlashAdBase"), "allowDomain"), ["server.cpmstar.com"])
	R.invoke(R.get_value(R.resolve(c, "Security", "com.newgrounds.components.FlashAdBase"), "allowInsecureDomain"), ["server.cpmstar.com"])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["idle"])
	R.assign(c, "x", "com.newgrounds.components.FlashAdBase", R.coerce(R.resolve(c, "x", "com.newgrounds.components.FlashAdBase"), "int"), "=")
	R.assign(c, "y", "com.newgrounds.components.FlashAdBase", R.coerce(R.resolve(c, "y", "com.newgrounds.components.FlashAdBase"), "int"), "=")
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.FlashAdBase"), [])
	if R.truth(R.get_value(c, "newgroundsButton")):
		pass
		R.invoke(R.get_value(R.get_value(c, "newgroundsButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "onNGClick")])
	R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "onRemovedFromStage")])
	R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "init")])
	return null

static func f_get__adContainer(c: Variant, a: Array) -> Variant:
	return R.get_value(c, "adContainer")
	return null

static func f_get__newgroundsButton(c: Variant, a: Array) -> Variant:
	return R.get_value(c, "newgroundsButton")
	return null

static func f_get_fullScreen(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_fullScreen")
	return null

static func f_set_fullScreen(c: Variant, a: Array) -> Variant:
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

static func f_get_showBorder(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_showBorder")
	return null

static func f_set_showBorder(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_showBorder"] = v_param1
	if R.truth((c).fields.get("_showBorder")):
		pass
		if R.truth((c).fields.get("_ad")):
			pass
			if R.truth(R.get_value((c).fields.get("_ad"), "content")):
				pass
				R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["loaded"])
			else:
				pass
				R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["loading"])
		else:
			pass
			R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["idle"])
	else:
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.FlashAdBase"), ["noBorder"])
	return null

static func f_init(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "init")])
	if R.truth(R.get_value(R.klass("com.newgrounds.API"), "adFeedURL")):
		pass
		R.call_member(c, "loadAdFeed", [])
	else:
		pass
		R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "API_CONNECTED"), R.get_value(c, "loadAdFeed")])
	return null

static func f_loadAdFeed(c: Variant, a: Array) -> Variant:
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

static func f_onAdFeedLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(((R.truth((c).fields.get("_adFeedLoader")) and R.truth(R.get_value((c).fields.get("_adFeedLoader"), "data"))) and R.binary("!=", R.get_value((c).fields.get("_adFeedLoader"), "data"), ""))):
		pass
		R.call_member(c, "loadAd", [R.get_value((c).fields.get("_adFeedLoader"), "data")])
	else:
		pass
		R.call_member(c, "onAdError", [])
	return null

static func f_loadAd(c: Variant, a: Array) -> Variant:
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

static func f_drawFullScreenRect(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase")):
		pass
		R.assign(c, "x", "com.newgrounds.components.FlashAdBase", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")) - R.num(R.resolve(c, "width", "com.newgrounds.components.FlashAdBase"))), 2), "=")
		R.assign(c, "y", "com.newgrounds.components.FlashAdBase", R.binary("/", (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")) - R.num(R.resolve(c, "height", "com.newgrounds.components.FlashAdBase"))), 2), "=")
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "beginFill"), [0])
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "drawRect"), [R.unary("-", R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")), R.unary("-", R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")), (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageWidth")) * float(2)), (R.num(R.get_value(R.resolve(c, "stage", "com.newgrounds.components.FlashAdBase"), "stageHeight")) * float(2))])
		R.invoke(R.get_value(R.resolve(c, "graphics", "com.newgrounds.components.FlashAdBase"), "endFill"), [])
	return null

static func f_removeAd(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error"}
	l["e"] = null
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "onRemovedFromStage")])
	if R.truth((c).fields.get("_adFeedLoader")):
		pass
		R.last_error = null
		R.invoke(R.get_value((c).fields.get("_adFeedLoader"), "close"), [])
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
	if R.truth((c).fields.get("_ad")):
		pass
		R.last_error = null
		R.invoke(R.get_value((c).fields.get("_ad"), "close"), [])
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
		R.last_error = null
		R.invoke(R.get_value(R.invoke(R.resolve(c, "Object", "com.newgrounds.components.FlashAdBase"), [(c).fields.get("_ad")]), "unloadAndStop"), [true])
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			R.invoke(R.get_value(c.fields.get("_ad"), "unload"), [])
		if R.truth(R.get_value((c).fields.get("_ad"), "parent")):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("_ad"), "parent"), "removeChild"), [(c).fields.get("_ad")])
		(c).fields["_ad"] = R.coerce(null, "Loader")
	R.call_static("com.newgrounds.Logger", "logError", ["Ad destroyed."])
	return null

static func f_onAdError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_static("com.newgrounds.Logger", "logError", ["Unable to load ad."])
	R.call_member(c, "removeAd", [])
	return null

static func f_onRemovedFromStage(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "removeAd", [])
	return null

static func f_onAddedToStage(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.FlashAdBase"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "onAddedToStage")])
	if R.truth(R.get_value(c, "fullScreen")):
		pass
		R.call_member(c, "drawFullScreenRect", [])
	return null

static func f_onNGClick(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_static("com.newgrounds.API", "loadNewgrounds", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_showBorder"] = true
	(c).fields["showPlayButton"] = false
	(c).fields["_fullScreen"] = false
	(c).fields["adType"] = R.coerce(null, "String")
	(c).fields["VIDEO_ADS"] = R.coerce("Video", "String")
	(c).fields["SIMPLE_ADS"] = R.coerce("Simple", "String")
	(c).fields["_adFeedLoader"] = R.coerce(null, "URLLoader")
	(c).fields["_ad"] = R.coerce(null, "Loader")
	return null

static func f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "Event"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.lget(l, "param1"), "preventDefault"), [])
	return null
