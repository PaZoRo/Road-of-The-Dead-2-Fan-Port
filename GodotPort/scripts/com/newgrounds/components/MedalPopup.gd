extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MedalPopup(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.components.MedalPopup"), [])
	R.invoke(R.resolve(c, "addFrameScript", "com.newgrounds.components.MedalPopup"), [0, R.get_value(c, "frame1"), 14, R.get_value(c, "frame15"), 22, R.get_value(c, "frame23"), 83, R.get_value(c, "frame84"), 104, R.get_value(c, "frame105")])
	return null

static func f_onMedalUnlocked(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_event, "success")):
		pass
		R.invoke(R.get_value((c).fields.get("_medalQueue"), "push"), [R.get_value(v_event, "data")])
		R.call_member(c, "showNextUnlock", [])
	return null

static func f_showNextUnlock(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlockedMedal")):
		pass
		return null
	if R.truth(R.unary("!", R.get_value((c).fields.get("_medalQueue"), "length"))):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.MedalPopup"), ["hidden"])
		R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "medalPopupEnterFrame")])
		return null
	(c).fields["_unlockedMedal"] = R.coerce(R.invoke(R.klass("com.newgrounds.Medal"), [R.invoke(R.get_value((c).fields.get("_medalQueue"), "shift"), [])]), "Medal")
	R.invoke(R.resolve(c, "gotoAndPlay", "com.newgrounds.components.MedalPopup"), ["medalUnlocked"])
	return null

static func f_medalPopupEnterFrame(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"topIndex": "uint", "error": "*", "event": "Event"}
	l["topIndex"] = 0
	l["error"] = null
	l["event"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "topIndex", 0)
	if R.truth((c).fields.get("_alwaysOnTop")):
		pass
		R.last_error = null
		if R.truth(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup")):
			pass
			R.lset(l, "topIndex", (R.num(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "numChildren")) - float(1)), "=")
			if R.truth(R.binary("!=", R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "getChildIndex"), [c]), R.lget(l, "topIndex"))):
				pass
				R.invoke(R.get_value(R.resolve(c, "parent", "com.newgrounds.components.MedalPopup"), "setChildIndex"), [c, R.lget(l, "topIndex")])
		if R.last_error != null:
			R.lset(l, "error", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "removeEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "medalPopupEnterFrame", "com.newgrounds.components.MedalPopup")])
	if R.truth((c).fields.get("_medalScrollRect")):
		pass
		R.invoke(R.get_value((c).fields.get("_medalScrollRect"), "offset"), [2, 0])
		R.set_value((c).fields.get("medalNameClip"), "scrollRect", (c).fields.get("_medalScrollRect"), "=")
		if R.truth(R.binary(">=", R.get_value((c).fields.get("_medalScrollRect"), "left"), R.binary("+", R.get_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "textWidth"), 10))):
			pass
			(c).fields["_medalScrollRect"] = R.coerce(null, "Rectangle")
			R.invoke(R.resolve(c, "play", "com.newgrounds.components.MedalPopup"), [])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.MedalPopup"), ["hidden"])
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCKED"), R.get_value(c, "onMedalUnlocked")])
	R.assign(c, "x", "com.newgrounds.components.MedalPopup", R.coerce(R.resolve(c, "x", "com.newgrounds.components.MedalPopup"), "int"), "=")
	R.assign(c, "y", "com.newgrounds.components.MedalPopup", R.coerce(R.resolve(c, "y", "com.newgrounds.components.MedalPopup"), "int"), "=")
	(c).fields["_medalQueue"] = R.coerce([], "Array")
	(c).fields["_alwaysOnTop"] = true
	if R.truth((c).fields.get("alwaysOnTop")):
		pass
		(c).fields["_alwaysOnTop"] = R.binary("==", (c).fields.get("alwaysOnTop"), "true")
	return null

static func f_frame15(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlockedMedal")):
		pass
		if R.truth((R.truth((c).fields.get("medalNameClip")) and R.truth(R.get_value((c).fields.get("medalNameClip"), "textField")))):
			pass
			R.set_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "text", R.get_value((c).fields.get("_unlockedMedal"), "name"), "=")
		if R.truth((c).fields.get("medalPointsText")):
			pass
			R.set_value((c).fields.get("medalPointsText"), "text", R.invoke(R.get_value(R.get_value((c).fields.get("_unlockedMedal"), "value"), "toString"), []), "=")
		if R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "textWidth"), R.get_value((c).fields.get("medalNameClip"), "width"))):
			pass
			(c).fields["_medalScrollRect"] = R.coerce(R.construct(R.klass("Rectangle"), [R.unary("-", R.get_value((c).fields.get("medalNameClip"), "width")), 0, R.get_value((c).fields.get("medalNameClip"), "width"), R.get_value((c).fields.get("medalNameClip"), "height")]), "Rectangle")
			R.set_value(R.get_value((c).fields.get("medalNameClip"), "textField"), "width", 1000, "=")
			R.set_value((c).fields.get("medalNameClip"), "scrollRect", (c).fields.get("_medalScrollRect"), "=")
		R.invoke(R.resolve(c, "addEventListener", "com.newgrounds.components.MedalPopup"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "medalPopupEnterFrame")])
	return null

static func f_frame23(c: Variant, a: Array) -> Variant:
	if R.truth((R.truth((c).fields.get("_unlockedMedal")) and R.truth((c).fields.get("medalIcon")))):
		pass
		R.call_member((c).fields.get("_unlockedMedal"), "attachIcon", [(c).fields.get("medalIcon")])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_medalScrollRect")):
		pass
		R.invoke(R.resolve(c, "stop", "com.newgrounds.components.MedalPopup"), [])
	return null

static func f_frame105(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.MedalPopup"), [])
	(c).fields["_unlockedMedal"] = R.coerce(null, "Medal")
	R.call_member(c, "showNextUnlock", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["medalNameClip"] = R.coerce(null, "MovieClip")
	(c).fields["medalPointsText"] = R.coerce(null, "TextField")
	(c).fields["medalIcon"] = R.coerce(null, "MovieClip")
	(c).fields["alwaysOnTop"] = R.coerce(null, "String")
	(c).fields["_unlockedMedal"] = R.coerce(null, "Medal")
	(c).fields["_medalQueue"] = R.coerce(null, "Array")
	(c).fields["_alwaysOnTop"] = false
	(c).fields["_medalScrollRect"] = R.coerce(null, "Rectangle")
	return null
