extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Preloader(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.components.Preloader"), [])
	R.invoke(R.resolve(c, "addFrameScript", "com.newgrounds.components.Preloader"), [0, R.get_value(c, "frame1"), 9, R.get_value(c, "frame10")])
	return null

static func f_enterFrameHandler(c: Variant, a: Array) -> Variant:
	var v_loaded: Variant = NAN
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_loaded = float(0)
	if R.truth(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader")):
		pass
		v_loaded = float(R.binary("/", R.get_value(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader"), "bytesLoaded"), R.get_value(R.resolve(c, "loaderInfo", "com.newgrounds.components.Preloader"), "bytesTotal")))
	if R.truth((c).fields.get("loadingBar")):
		pass
		R.invoke(R.get_value((c).fields.get("loadingBar"), "gotoAndStop"), [(float(R.coerce((float(v_loaded) * float((R.num(R.get_value((c).fields.get("loadingBar"), "totalFrames")) - float(1)))), "int")) + float(1))])
	if R.truth(((float(v_loaded) >= float(1)) and R.binary("!=", (c).fields.get("haltComplete"), true))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.Preloader"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "enterFrameHandler")])
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.Preloader"), ["loaded"])
	return null

static func f__onPlayClick(c: Variant, a: Array) -> Variant:
	var v_theRoot: Variant = null
	var v_theParent: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_theRoot = R.coerce(R.binary("as", R.resolve(c, "root", "com.newgrounds.components.Preloader"), R.klass("MovieClip")), "MovieClip")
	v_theParent = R.coerce(R.binary("as", R.resolve(c, "parent", "com.newgrounds.components.Preloader"), R.klass("MovieClip")), "MovieClip")
	if R.truth(v_theRoot):
		pass
		R.invoke(R.get_value(v_theRoot, "play"), [])
		R.invoke(R.get_value(v_theRoot, "nextFrame"), [])
	if R.truth((R.truth(v_theParent) and R.truth(R.get_value(v_theParent, "_onLoaded")))):
		pass
		R.invoke(R.get_value(v_theParent, "_onLoaded"), [])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.Preloader"), [])
	R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.Preloader"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "enterFrameHandler")])
	return null

static func f_frame10(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("playButton")):
		pass
		R.invoke(R.get_value((c).fields.get("playButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onPlayClick")])
		R.invoke(R.get_value((c).fields.get("playButton"), "stop"), [])
		R.set_value((c).fields.get("playButton"), "buttonMode", true, "=")
	if R.truth((c).fields.get("autoPlay")):
		pass
		R.call_member(c, "_onPlayClick", [null])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["loadingBar"] = R.coerce(null, "MovieClip")
	(c).fields["playButton"] = R.coerce(null, "MovieClip")
	(c).fields["autoPlay"] = false
	(c).fields["className"] = R.coerce(null, "String")
	(c).fields["haltComplete"] = false
	return null
