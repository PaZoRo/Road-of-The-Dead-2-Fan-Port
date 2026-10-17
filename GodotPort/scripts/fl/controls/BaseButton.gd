extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_BaseButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.BaseButton"), [])
	R.assign(c, "buttonMode", "fl.controls.BaseButton", true, "=")
	R.assign(c, "mouseChildren", "fl.controls.BaseButton", false, "=")
	R.assign(c, "useHandCursor", "fl.controls.BaseButton", false, "=")
	R.call_member(c, "setupMouseEvents", [])
	R.call_member(c, "setMouseState", ["up"])
	(c).fields["pressTimer"] = R.coerce(R.construct(R.resolve(c, "Timer", "fl.controls.BaseButton"), [1, 0]), "Timer")
	R.invoke(R.get_value((c).fields.get("pressTimer"), "addEventListener"), [R.get_value(R.resolve(c, "TimerEvent", "fl.controls.BaseButton"), "TIMER"), R.get_value(c, "buttonDown"), false, 0, true])
	return null

static func f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.static_value("fl.controls.BaseButton", "defaultStyles")
	return null

static func f_get_enabled(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.controls.BaseButton"), "enabled")
	return null

static func f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.super_ref(c, "fl.controls.BaseButton"), "enabled", v_value, "=")
	R.assign(c, "mouseEnabled", "fl.controls.BaseButton", v_value, "=")
	return null

static func f_get_selected(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_selected")
	return null

static func f_set_selected(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", (c).fields.get("_selected"), v_value)):
		pass
		return null
	(c).fields["_selected"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null

static func f_get_autoRepeat(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_autoRepeat")
	return null

static func f_set_autoRepeat(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_autoRepeat"] = v_value
	return null

static func f_set_mouseStateLocked(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_mouseStateLocked"] = v_value
	if R.truth(R.binary("==", v_value, false)):
		pass
		R.call_member(c, "setMouseState", [(c).fields.get("unlockedMouseState")])
	else:
		pass
		(c).fields["unlockedMouseState"] = R.coerce((c).fields.get("mouseState"), "String")
	return null

static func f_setMouseState(c: Variant, a: Array) -> Variant:
	var v_state: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("_mouseStateLocked")):
		pass
		(c).fields["unlockedMouseState"] = R.coerce(v_state, "String")
		return null
	if R.truth(R.binary("==", (c).fields.get("mouseState"), v_state)):
		pass
		return null
	(c).fields["mouseState"] = R.coerce(v_state, "String")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null

static func f_setupMouseEvents(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "ROLL_OVER"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "MOUSE_UP"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "fl.controls.BaseButton"), [R.get_value(R.klass("MouseEvent"), "ROLL_OUT"), R.get_value(c, "mouseEventHandler"), false, 0, true])
	return null

static func f_mouseEventHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"))):
		pass
		R.call_member(c, "setMouseState", ["down"])
		R.call_member(c, "startPress", [])
	else:
		pass
		if R.truth((R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "ROLL_OVER")) or R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "MOUSE_UP")))):
			pass
			R.call_member(c, "setMouseState", ["over"])
			R.call_member(c, "endPress", [])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "type"), R.get_value(R.klass("MouseEvent"), "ROLL_OUT"))):
				pass
				R.call_member(c, "setMouseState", ["up"])
				R.call_member(c, "endPress", [])
	return null

static func f_startPress(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_autoRepeat")):
		pass
		R.set_value((c).fields.get("pressTimer"), "delay", R.num(R.call_member(c, "getStyleValue", ["repeatDelay"])), "=")
		R.invoke(R.get_value((c).fields.get("pressTimer"), "start"), [])
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.BaseButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "BUTTON_DOWN"), true])])
	return null

static func f_buttonDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "TimerEvent")
	if R.truth(R.unary("!", (c).fields.get("_autoRepeat"))):
		pass
		R.call_member(c, "endPress", [])
		return null
	if R.truth(R.binary("==", R.get_value((c).fields.get("pressTimer"), "currentCount"), 1)):
		pass
		R.set_value((c).fields.get("pressTimer"), "delay", R.num(R.call_member(c, "getStyleValue", ["repeatInterval"])), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.BaseButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "BUTTON_DOWN"), true])])
	return null

static func f_endPress(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("pressTimer"), "reset"), [])
	return null

static func f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES"), R.static_value("fl.core.InvalidationType", "STATE")])):
		pass
		R.call_member(c, "drawBackground", [])
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE"), false])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")])):
		pass
		R.call_member(c, "drawLayout", [])
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.BaseButton"), "draw"), [])
	return null

static func f_drawBackground(c: Variant, a: Array) -> Variant:
	var v_styleName: Variant = null
	var v_bg: Variant = null
	v_styleName = R.coerce(((c).fields.get("mouseState") if R.truth(R.get_value(c, "enabled")) else "disabled"), "String")
	if R.truth(R.get_value(c, "selected")):
		pass
		v_styleName = R.coerce(R.binary("+", R.binary("+", "selected", R.invoke(R.get_value(R.invoke(R.get_value(v_styleName, "substr"), [0, 1]), "toUpperCase"), [])), R.invoke(R.get_value(v_styleName, "substr"), [1])), "String")
	v_styleName = R.coerce(R.binary("+", v_styleName, "Skin"), "String")
	v_bg = R.coerce((c).fields.get("background"), "DisplayObject")
	(c).fields["background"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [R.call_member(c, "getStyleValue", [v_styleName])]), "DisplayObject")
	R.invoke(R.resolve(c, "addChildAt", "fl.controls.BaseButton"), [(c).fields.get("background"), 0])
	if R.truth((R.binary("!=", v_bg, null) and R.binary("!=", v_bg, (c).fields.get("background")))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.BaseButton"), [v_bg])
	return null

static func f_drawLayout(c: Variant, a: Array) -> Variant:
	R.set_value((c).fields.get("background"), "width", R.resolve(c, "width", "fl.controls.BaseButton"), "=")
	R.set_value((c).fields.get("background"), "height", R.resolve(c, "height", "fl.controls.BaseButton"), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "defaultStyles", {"upSkin": "Button_upSkin", "downSkin": "Button_downSkin", "overSkin": "Button_overSkin", "disabledSkin": "Button_disabledSkin", "selectedDisabledSkin": "Button_selectedDisabledSkin", "selectedUpSkin": "Button_selectedUpSkin", "selectedDownSkin": "Button_selectedDownSkin", "selectedOverSkin": "Button_selectedOverSkin", "focusRectSkin": null, "focusRectPadding": null, "repeatDelay": 500, "repeatInterval": 35}, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["background"] = R.coerce(null, "DisplayObject")
	(c).fields["mouseState"] = R.coerce(null, "String")
	(c).fields["_selected"] = false
	(c).fields["_autoRepeat"] = false
	(c).fields["pressTimer"] = R.coerce(null, "Timer")
	(c).fields["_mouseStateLocked"] = false
	(c).fields["unlockedMouseState"] = R.coerce(null, "String")
	return null
