extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_FlashAd(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.components.FlashAd"), [])
	R.invoke(R.resolve(c, "addFrameScript", "com.newgrounds.components.FlashAd"), [0, R.get_value(c, "frame1"), 1, R.get_value(c, "frame2"), 9, R.get_value(c, "frame10"), 19, R.get_value(c, "frame20")])
	return null

static func f_initPlayButton(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("playButton")):
		pass
		R.invoke(R.get_value((c).fields.get("playButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "onPlayClick")])
		if R.truth(R.unary("!", (c).fields.get("showPlayButton"))):
			pass
			R.set_value((c).fields.get("playButton"), "visible", false, "=")
	return null

static func f_onPlayClick(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "removeAd", [])
	if R.truth(R.resolve(c, "parent", "com.newgrounds.components.FlashAd")):
		pass
		R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.FlashAd"), "removeChild"), [c])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.FlashAd"), [])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.call_member(c, "initPlayButton", [])
	return null

static func f_frame10(c: Variant, a: Array) -> Variant:
	R.call_member(c, "initPlayButton", [])
	return null

static func f_frame20(c: Variant, a: Array) -> Variant:
	R.call_member(c, "initPlayButton", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["newgroundsButton"] = R.coerce(null, "SimpleButton")
	(c).fields["playButton"] = R.coerce(null, "MovieClip")
	(c).fields["adContainer"] = R.coerce(null, "MovieClip")
	return null
