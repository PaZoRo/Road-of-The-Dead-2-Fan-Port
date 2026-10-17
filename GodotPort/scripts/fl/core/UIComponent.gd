extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_UIComponent(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.core.UIComponent"), [])
	(c).fields["instanceStyles"] = R.coerce({}, "Object")
	(c).fields["sharedStyles"] = R.coerce({}, "Object")
	(c).fields["invalidHash"] = R.coerce({}, "Object")
	(c).fields["callLaterMethods"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), []), "Dictionary")
	R.call_static("fl.managers.StyleManager", "registerInstance", [c])
	R.call_member(c, "configUI", [])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "ALL")])
	R.assign(c, "tabEnabled", "fl.core.UIComponent", R.binary("is", c, R.klass("fl.managers.IFocusManagerComponent")), "=")
	R.assign(c, "focusRect", "fl.core.UIComponent", false, "=")
	if R.truth(R.resolve(c, "tabEnabled", "fl.core.UIComponent")):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.resolve(c, "FocusEvent", "fl.core.UIComponent"), "FOCUS_IN"), R.get_value(c, "focusInHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.resolve(c, "FocusEvent", "fl.core.UIComponent"), "FOCUS_OUT"), R.get_value(c, "focusOutHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "keyDownHandler")])
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("KeyboardEvent"), "KEY_UP"), R.get_value(c, "keyUpHandler")])
	R.call_member(c, "initializeFocusManager", [])
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "hookAccessibility"), false, 0, true])
	return null

static func f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.static_value("fl.core.UIComponent", "defaultStyles")
	return null

static func f_mergeStyles(c: Variant, a: Array) -> Variant:
	var v_styleList: Variant = null
	var v_n: Variant = null
	var v_styles: Variant = null
	var v_l: Variant = 0
	var v_i: Variant = 0
	var v_list: Variant = R.coerce(a.slice(0), "*")
	v_styleList = R.coerce(null, "Object")
	v_n = R.coerce(null, "String")
	v_styles = R.coerce({}, "Object")
	v_l = R.coerce(R.coerce(R.get_value(v_list, "length"), "uint"), "uint")
	v_i = R.coerce(0, "uint")
	while R.truth((float(v_i) < float(v_l))):
		pass
		v_styleList = R.coerce(R.get_value(v_list, v_i), "Object")
		for __t1 in R.iterate(v_styleList, false):
			v_n = R.coerce(__t1, "String")
			if R.truth(R.binary("==", R.get_value(v_styles, v_n), null)):
				pass
				R.set_value(v_styles, v_n, R.get_value(R.get_value(v_list, v_i), v_n), "=")
		v_i = ((v_i + 1) & 4294967295)
	return v_styles
	return null

static func f_get_componentInspectorSetting(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_inspector")
	return null

static func f_set_componentInspectorSetting(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_inspector"] = v_value
	if R.truth((c).fields.get("_inspector")):
		pass
		R.call_member(c, "beforeComponentParameters", [])
	else:
		pass
		R.call_member(c, "afterComponentParameters", [])
	return null

static func f_beforeComponentParameters(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_afterComponentParameters(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_get_enabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_enabled")
	return null

static func f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", v_value, (c).fields.get("_enabled"))):
		pass
		return null
	(c).fields["_enabled"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null

static func f_setSize(c: Variant, a: Array) -> Variant:
	var v_width: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_height: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_width"] = float(v_width)
	(c).fields["_height"] = float(v_height)
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "RESIZE"), false])])
	return null

static func f_get_width(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_width")
	return null

static func f_set_width(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("_width")) == float(v_value))):
		pass
		return null
	R.call_member(c, "setSize", [v_value, R.get_value(c, "height")])
	return null

static func f_get_height(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_height")
	return null

static func f_set_height(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("_height")) == float(v_value))):
		pass
		return null
	R.call_member(c, "setSize", [R.get_value(c, "width"), v_value])
	return null

static func f_setStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	if R.truth((R.binary("===", R.get_value((c).fields.get("instanceStyles"), v_style), v_value) and R.unary("!", R.binary("is", v_value, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value((c).fields.get("instanceStyles"), v_style, v_value, "=")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null

static func f_clearStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(c, "setStyle", [v_style, null])
	return null

static func f_getStyle(c: Variant, a: Array) -> Variant:
	var v_style: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("instanceStyles"), v_style)
	return null

static func f_move(c: Variant, a: Array) -> Variant:
	var v_x: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_y: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_x"] = float(v_x)
	(c).fields["_y"] = float(v_y)
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [v_x]), "=")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [v_y]), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "MOVE")])])
	return null

static func f_get_x(c: Variant, a: Array) -> Variant:
	return (R.get_value(R.super_ref(c, "fl.core.UIComponent"), "x") if R.truth(R.invoke(R.resolve(c, "isNaN", "fl.core.UIComponent"), [(c).fields.get("_x")])) else (c).fields.get("_x"))
	return null

static func f_set_x(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "move", [v_value, (c).fields.get("_y")])
	return null

static func f_get_y(c: Variant, a: Array) -> Variant:
	return (R.get_value(R.super_ref(c, "fl.core.UIComponent"), "y") if R.truth(R.invoke(R.resolve(c, "isNaN", "fl.core.UIComponent"), [(c).fields.get("_y")])) else (c).fields.get("_y"))
	return null

static func f_set_y(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "move", [(c).fields.get("_x"), v_value])
	return null

static func f_get_scaleX(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.get_value(c, "width"), (c).fields.get("startWidth"))
	return null

static func f_set_scaleX(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setSize", [(float((c).fields.get("startWidth")) * float(v_value)), R.get_value(c, "height")])
	return null

static func f_get_scaleY(c: Variant, a: Array) -> Variant:
	return R.binary("/", R.get_value(c, "height"), (c).fields.get("startHeight"))
	return null

static func f_set_scaleY(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setSize", [R.get_value(c, "width"), (float((c).fields.get("startHeight")) * float(v_value))])
	return null

static func f_getScaleY(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY")
	return null

static func f_setScaleY(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY", v_value, "=")
	return null

static func f_getScaleX(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX")
	return null

static func f_setScaleX(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX", v_value, "=")
	return null

static func f_get_visible(c: Variant, a: Array) -> Variant:
	return R.get_value(R.super_ref(c, "fl.core.UIComponent"), "visible")
	return null

static func f_set_visible(c: Variant, a: Array) -> Variant:
	var v_t: Variant = null
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "visible"), v_value)):
		pass
		return null
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "visible", v_value, "=")
	v_t = R.coerce((R.static_value("fl.events.ComponentEvent", "SHOW") if R.truth(v_value) else R.static_value("fl.events.ComponentEvent", "HIDE")), "String")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.core.UIComponent"), [R.construct(R.klass("fl.events.ComponentEvent"), [v_t, true])])
	return null

static func f_validateNow(c: Variant, a: Array) -> Variant:
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "ALL"), false])
	R.call_member(c, "draw", [])
	return null

static func f_invalidate(c: Variant, a: Array) -> Variant:
	var v_property: Variant = R.coerce((a[0] if a.size() > 0 else "all"), "String")
	var v_callLater: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.set_value((c).fields.get("invalidHash"), v_property, true, "=")
	if R.truth(v_callLater):
		pass
		R.call_member(c, "callLater", [R.get_value(c, "draw")])
	return null

static func f_setSharedStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_style: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	if R.truth((R.binary("===", R.get_value((c).fields.get("sharedStyles"), v_name), v_style) and R.unary("!", R.binary("is", v_style, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value((c).fields.get("sharedStyles"), v_name, v_style, "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("instanceStyles"), v_name), null)):
		pass
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null

static func f_get_focusEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_focusEnabled")
	return null

static func f_set_focusEnabled(c: Variant, a: Array) -> Variant:
	var v_b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_focusEnabled"] = v_b
	return null

static func f_get_mouseFocusEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_mouseFocusEnabled")
	return null

static func f_set_mouseFocusEnabled(c: Variant, a: Array) -> Variant:
	var v_b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_mouseFocusEnabled"] = v_b
	return null

static func f_get_focusManager(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	v_o = R.coerce(c, "DisplayObject")
	while R.truth(v_o):
		pass
		if R.truth(R.binary("!=", R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_o), null)):
			pass
			return R.invoke(R.klass("fl.managers.IFocusManager"), [R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_o)])
		v_o = R.coerce(R.get_value(v_o, "parent"), "DisplayObject")
	return null
	return null

static func f_set_focusManager(c: Variant, a: Array) -> Variant:
	var v_f: Variant = R.coerce((a[0] if a.size() > 0 else null), "IFocusManager")
	R.set_value(R.static_value("fl.core.UIComponent", "focusManagers"), c, v_f, "=")
	return null

static func f_drawFocus(c: Variant, a: Array) -> Variant:
	var v_focusPadding: Variant = NAN
	var v_focused: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_focusPadding = float(NAN)
	(c).fields["isFocused"] = v_focused
	if R.truth(R.logical_and(R.binary("!=", (c).fields.get("uiFocusRect"), null), func(): return R.invoke(R.resolve(c, "contains", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect")]))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect")])
		(c).fields["uiFocusRect"] = R.coerce(null, "DisplayObject")
	if R.truth(v_focused):
		pass
		(c).fields["uiFocusRect"] = R.coerce(R.binary("as", R.call_member(c, "getDisplayObjectInstance", [R.call_member(c, "getStyleValue", ["focusRectSkin"])]), R.klass("Sprite")), "DisplayObject")
		if R.truth(R.binary("==", (c).fields.get("uiFocusRect"), null)):
			pass
			return null
		v_focusPadding = float(R.num(R.call_member(c, "getStyleValue", ["focusRectPadding"])))
		R.set_value((c).fields.get("uiFocusRect"), "x", R.unary("-", v_focusPadding), "=")
		R.set_value((c).fields.get("uiFocusRect"), "y", R.unary("-", v_focusPadding), "=")
		R.set_value((c).fields.get("uiFocusRect"), "width", R.binary("+", R.get_value(c, "width"), (float(v_focusPadding) * float(2))), "=")
		R.set_value((c).fields.get("uiFocusRect"), "height", R.binary("+", R.get_value(c, "height"), (float(v_focusPadding) * float(2))), "=")
		R.invoke(R.resolve(c, "addChildAt", "fl.core.UIComponent"), [(c).fields.get("uiFocusRect"), 0])
	return null

static func f_setFocus(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "fl.core.UIComponent")):
		pass
		R.set_value(R.resolve(c, "stage", "fl.core.UIComponent"), "focus", c, "=")
	return null

static func f_getFocus(c: Variant, a: Array) -> Variant:
	if R.truth(R.resolve(c, "stage", "fl.core.UIComponent")):
		pass
		return R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "focus")
	return null
	return null

static func f_setIMEMode(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "enabled": "Boolean"}
	l["e"] = null
	l["enabled"] = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("!=", (c).fields.get("_imeMode"), null)):
		pass
		if R.truth(R.lget(l, "enabled")):
			pass
			R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "enabled", true, "=")
			(c).fields["_oldIMEMode"] = R.coerce(R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), "String")
			R.last_error = null
			if R.truth((R.unary("!", (c).fields.get("errorCaught")) and R.binary("!=", R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")))):
				pass
				R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode", (c).fields.get("_imeMode"), "=")
			(c).fields["errorCaught"] = false
			if R.last_error != null:
				R.lset(l, "e", R.last_error)
				R.last_error = null
				c.fields["errorCaught"] = true
				return R.raise_error(R.construct(R.resolve(c, "Error", "fl.core.UIComponent"), [R.binary("+", "IME mode not supported: ", c.fields.get("_imeMode"))]))
		else:
			pass
			if R.truth((R.binary("!=", R.get_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")) and R.binary("!=", (c).fields.get("_oldIMEMode"), R.get_value(R.resolve(c, "IMEConversionMode", "fl.core.UIComponent"), "UNKNOWN")))):
				pass
				R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "conversionMode", (c).fields.get("_oldIMEMode"), "=")
			R.set_value(R.resolve(c, "IME", "fl.core.UIComponent"), "enabled", false, "=")
	return null

static func f_drawNow(c: Variant, a: Array) -> Variant:
	R.call_member(c, "draw", [])
	return null

static func f_configUI(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"r": "Number", "w": "Number", "h": "Number"}
	l["r"] = NAN
	l["w"] = NAN
	l["h"] = NAN
	(c).fields["isLivePreview"] = R.coerce(R.call_member(c, "checkLivePreview", []), "Boolean")
	R.lset(l, "r", R.resolve(c, "rotation", "fl.core.UIComponent"))
	R.assign(c, "rotation", "fl.core.UIComponent", 0, "=")
	R.lset(l, "w", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "width"))
	R.lset(l, "h", R.get_value(R.super_ref(c, "fl.core.UIComponent"), "height"))
	R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleX", R.set_value(R.super_ref(c, "fl.core.UIComponent"), "scaleY", 1, "="), "=")
	R.call_member(c, "setSize", [R.lget(l, "w"), R.lget(l, "h")])
	R.call_member(c, "move", [R.get_value(R.super_ref(c, "fl.core.UIComponent"), "x"), R.get_value(R.super_ref(c, "fl.core.UIComponent"), "y")])
	R.assign(c, "rotation", "fl.core.UIComponent", R.lget(l, "r"), "=")
	(c).fields["startWidth"] = float(R.lget(l, "w"))
	(c).fields["startHeight"] = float(R.lget(l, "h"))
	if R.truth(R.binary(">", R.resolve(c, "numChildren", "fl.core.UIComponent"), 0)):
		pass
		R.invoke(R.resolve(c, "removeChildAt", "fl.core.UIComponent"), [0])
	return null

static func f_checkLivePreview(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"className": "String", "e": "Error"}
	l["className"] = null
	l["e"] = null
	R.lset(l, "className", null)
	if R.truth(R.binary("==", R.resolve(c, "parent", "fl.core.UIComponent"), null)):
		pass
		return false
	R.last_error = null
	R.lset(l, "className", R.invoke(R.resolve(c, "getQualifiedClassName", "fl.core.UIComponent"), [R.resolve(c, "parent", "fl.core.UIComponent")]), "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return R.binary("==", R.lget(l, "className"), "fl.livepreview::LivePreviewParent")
	return null

static func f_isInvalid(c: Variant, a: Array) -> Variant:
	var v_property: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_properties: Variant = R.coerce(a.slice(1), "*")
	if R.truth((R.truth(R.get_value((c).fields.get("invalidHash"), v_property)) or R.truth(R.get_value((c).fields.get("invalidHash"), R.static_value("fl.core.InvalidationType", "ALL"))))):
		pass
		return true
	while R.truth(R.binary(">", R.get_value(v_properties, "length"), 0)):
		pass
		if R.truth(R.get_value((c).fields.get("invalidHash"), R.invoke(R.get_value(v_properties, "pop"), []))):
			pass
			return true
	return false
	return null

static func f_validate(c: Variant, a: Array) -> Variant:
	(c).fields["invalidHash"] = R.coerce({}, "Object")
	return null

static func f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE"), R.static_value("fl.core.InvalidationType", "STYLES")])):
		pass
		if R.truth(R.logical_and((c).fields.get("isFocused"), func(): return R.get_value(R.get_value(c, "focusManager"), "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
	R.call_member(c, "validate", [])
	return null

static func f_getDisplayObjectInstance(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"classDef": "Object", "e": "Error", "skin": "Object"}
	l["classDef"] = null
	l["e"] = null
	l["skin"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.lset(l, "classDef", null)
	if R.truth(R.binary("is", R.lget(l, "skin"), R.resolve(c, "Class", "fl.core.UIComponent"))):
		pass
		return R.binary("as", R.construct(R.lget(l, "skin"), []), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	if R.truth(R.binary("is", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))):
		pass
		R.set_value(R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent")), "x", 0, "=")
		R.set_value(R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent")), "y", 0, "=")
		return R.binary("as", R.lget(l, "skin"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	R.last_error = null
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getDefinitionByName", "fl.core.UIComponent"), [R.invoke(R.get_value(R.lget(l, "skin"), "toString"), [])]), "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		R.last_error = null
		R.lset(l, "classDef", R.binary("as", R.invoke(R.get_value(R.get_value(R.resolve(c, "loaderInfo", "fl.core.UIComponent"), "applicationDomain"), "getDefinition"), [R.invoke(R.get_value(R.lget(l, "skin"), "toString"), [])]), R.resolve(c, "Object", "fl.core.UIComponent")), "=")
		if R.last_error != null:
			R.lset(l, "e", R.last_error)
			R.last_error = null
			pass
	if R.truth(R.binary("==", R.lget(l, "classDef"), null)):
		pass
		return null
	return R.binary("as", R.construct(R.lget(l, "classDef"), []), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))
	return null

static func f_getStyleValue(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return (R.get_value((c).fields.get("sharedStyles"), v_name) if R.truth(R.binary("==", R.get_value((c).fields.get("instanceStyles"), v_name), null)) else R.get_value((c).fields.get("instanceStyles"), v_name))
	return null

static func f_copyStylesToChild(c: Variant, a: Array) -> Variant:
	var v_n: Variant = null
	var v_child: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	var v_styleMap: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v_n = R.coerce(null, "String")
	for __t2 in R.iterate(v_styleMap, false):
		v_n = R.coerce(__t2, "String")
		R.call_member(v_child, "setStyle", [v_n, R.call_member(c, "getStyleValue", [R.get_value(v_styleMap, v_n)])])
	return null

static func f_callLater(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError", "fn": "Function"}
	l["se"] = null
	l["fn"] = R.coerce((a[0] if a.size() > 0 else null), "Function")
	if R.truth(R.static_value("fl.core.UIComponent", "inCallLaterPhase")):
		pass
		return null
	R.set_value((c).fields.get("callLaterMethods"), R.lget(l, "fn"), true, "=")
	if R.truth(R.binary("!=", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
		pass
		R.last_error = null
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "addEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "invalidate"), [])
		if R.last_error != null:
			R.lset(l, "se", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "callLaterDispatcher", "fl.core.UIComponent"), false, 0, true])
	else:
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
	return null

static func f_callLaterDispatcher(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"methods": "Dictionary", "method": "Object", "se1": "SecurityError", "se2": "SecurityError", "event": "Event"}
	l["methods"] = null
	l["method"] = null
	l["se1"] = null
	l["se2"] = null
	l["event"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "method", null)
	if R.truth(R.binary("==", R.get_value(R.lget(l, "event"), "type"), R.get_value(R.klass("Event"), "ADDED_TO_STAGE"))):
		pass
		R.last_error = null
		R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher")])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "addEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "invalidate"), [])
		return null
		if R.last_error != null:
			R.lset(l, "se1", R.last_error)
			R.last_error = null
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "callLaterDispatcher", "fl.core.UIComponent"), false, 0, true])
	else:
		pass
		R.invoke(R.get_value(R.get_value(R.lget(l, "event"), "target"), "removeEventListener"), [R.get_value(R.klass("Event"), "RENDER"), R.get_value(c, "callLaterDispatcher")])
		R.invoke(R.get_value(R.get_value(R.lget(l, "event"), "target"), "removeEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "callLaterDispatcher")])
		R.last_error = null
		if R.truth(R.binary("==", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
			pass
			R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "callLaterDispatcher"), false, 0, true])
			return null
		if R.last_error != null:
			R.lset(l, "se2", R.last_error)
			R.last_error = null
			pass
	R.assign(c, "inCallLaterPhase", "fl.core.UIComponent", true, "=")
	R.lset(l, "methods", (c).fields.get("callLaterMethods"), "=")
	for __t3 in R.iterate(R.lget(l, "methods"), false):
		R.lset(l, "method", __t3, "=")
		R.invoke(R.lget(l, "method"), [])
		R.delete_value(R.lget(l, "methods"), R.lget(l, "method"))
	R.assign(c, "inCallLaterPhase", "fl.core.UIComponent", false, "=")
	return null

static func f_initializeFocusManager(c: Variant, a: Array) -> Variant:
	var v_fm: Variant = null
	var v_fmUserDict: Variant = null
	v_fm = R.coerce(null, "IFocusManager")
	v_fmUserDict = R.coerce(null, "Dictionary")
	if R.truth(R.binary("==", R.resolve(c, "stage", "fl.core.UIComponent"), null)):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler"), false, 0, true])
	else:
		pass
		R.call_member(c, "createFocusManager", [])
		v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
		if R.truth(R.binary("!=", v_fm, null)):
			pass
			v_fmUserDict = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm), "Dictionary")
			if R.truth(R.binary("==", v_fmUserDict, null)):
				pass
				v_fmUserDict = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "Dictionary")
				R.set_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm, v_fmUserDict, "=")
			R.set_value(v_fmUserDict, c, true, "=")
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "removedHandler")])
	return null

static func f_addedHandler(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler")])
	R.call_member(c, "initializeFocusManager", [])
	return null

static func f_removedHandler(c: Variant, a: Array) -> Variant:
	var v_fmUserDict: Variant = null
	var v_dictEmpty: Variant = false
	var v_key: Variant = null
	var v_key2: Variant = null
	var v_compFM: Variant = null
	var v_fm: Variant = null
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_fmUserDict = R.coerce(null, "Dictionary")
	v_dictEmpty = false
	v_key = R.coerce(null, "*")
	v_key2 = R.coerce(null, "*")
	v_compFM = R.coerce(null, "IFocusManager")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "REMOVED_FROM_STAGE"), R.get_value(c, "removedHandler")])
	R.invoke(R.resolve(c, "addEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "addedHandler")])
	v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
	if R.truth(R.binary("!=", v_fm, null)):
		pass
		v_fmUserDict = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm), "Dictionary")
		if R.truth(R.binary("!=", v_fmUserDict, null)):
			pass
			R.delete_value(v_fmUserDict, c)
			v_dictEmpty = true
			v__loc8_ = R.coerce(0, "int")
			v__loc9_ = R.coerce(v_fmUserDict, "*")
			for __t4 in R.iterate(v__loc9_, false):
				v_key = R.coerce(__t4, "*")
				v_dictEmpty = false
			if R.truth(v_dictEmpty):
				pass
				R.delete_value(R.static_value("fl.core.UIComponent", "focusManagerUsers"), v_fm)
				v_fmUserDict = R.coerce(null, "Dictionary")
		if R.truth(R.binary("==", v_fmUserDict, null)):
			pass
			R.call_member(v_fm, "deactivate", [])
			for __t5 in R.iterate(R.static_value("fl.core.UIComponent", "focusManagers"), false):
				v_key2 = R.coerce(__t5, "*")
				v_compFM = R.coerce(R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_key2), "IFocusManager")
				if R.truth(R.binary("==", v_fm, v_compFM)):
					pass
					R.delete_value(R.static_value("fl.core.UIComponent", "focusManagers"), v_key2)
	return null

static func f_createFocusManager(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"myTopLevel": "DisplayObjectContainer", "stageAccessOK": "Boolean", "se": "SecurityError"}
	l["myTopLevel"] = null
	l["stageAccessOK"] = false
	l["se"] = null
	R.lset(l, "stageAccessOK", true)
	R.last_error = null
	R.invoke(R.get_value(R.resolve(c, "stage", "fl.core.UIComponent"), "getChildAt"), [0])
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		R.lset(l, "stageAccessOK", false, "=")
	R.lset(l, "myTopLevel", null, "=")
	if R.truth(R.lget(l, "stageAccessOK")):
		pass
		R.lset(l, "myTopLevel", R.resolve(c, "stage", "fl.core.UIComponent"), "=")
	else:
		pass
		R.lset(l, "myTopLevel", c, "=")
		R.last_error = null
		while R.truth(R.binary("!=", R.get_value(R.lget(l, "myTopLevel"), "parent"), null)):
			pass
			R.lset(l, "myTopLevel", R.get_value(R.lget(l, "myTopLevel"), "parent"), "=")
		if R.last_error != null:
			R.lset(l, "se", R.last_error)
			R.last_error = null
			pass
	if R.truth(R.binary("==", R.get_value(R.static_value("fl.core.UIComponent", "focusManagers"), R.lget(l, "myTopLevel")), null)):
		pass
		R.set_value(R.static_value("fl.core.UIComponent", "focusManagers"), R.lget(l, "myTopLevel"), R.construct(R.klass("fl.managers.FocusManager"), [R.lget(l, "myTopLevel")]), "=")
	return null

static func f_isOurFocus(c: Variant, a: Array) -> Variant:
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	return R.binary("==", v_target, c)
	return null

static func f_focusInHandler(c: Variant, a: Array) -> Variant:
	var v_fm: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	v_fm = R.coerce(null, "IFocusManager")
	if R.truth(R.call_member(c, "isOurFocus", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))])):
		pass
		v_fm = R.coerce(R.get_value(c, "focusManager"), "IFocusManager")
		if R.truth(R.logical_and(R.truth(v_fm), func(): return R.get_value(v_fm, "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
			(c).fields["isFocused"] = true
	return null

static func f_focusOutHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.call_member(c, "isOurFocus", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "fl.core.UIComponent"))])):
		pass
		R.call_member(c, "drawFocus", [false])
		(c).fields["isFocused"] = false
	return null

static func f_keyDownHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	pass
	return null

static func f_keyUpHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	pass
	return null

static func f_hookAccessibility(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "removeEventListener", "fl.core.UIComponent"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "hookAccessibility")])
	R.call_member(c, "initializeAccessibility", [])
	return null

static func f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.core.UIComponent", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.core.UIComponent", "createAccessibilityImplementation"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "inCallLaterPhase", false, "=")
	R.set_value(c, "defaultStyles", {"focusRectSkin": "focusRectSkin", "focusRectPadding": 2, "textFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 0, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "disabledTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 10066329, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "defaultTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 0, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0]), "defaultDisabledTextFormat": R.construct(R.klass("TextFormat"), ["_sans", 11, 10066329, false, false, false, "", "", R.get_value(R.resolve(c, "TextFormatAlign", "fl.core.UIComponent"), "LEFT"), 0, 0, 0, 0])}, "=")
	R.set_value(c, "focusManagers", R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "=")
	R.set_value(c, "focusManagerUsers", R.construct(R.resolve(c, "Dictionary", "fl.core.UIComponent"), [true]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["version"] = R.coerce("3.0.3.1", "String")
	(c).fields["focusTarget"] = R.coerce(null, "IFocusManagerComponent")
	(c).fields["isLivePreview"] = false
	(c).fields["tempText"] = R.coerce(null, "TextField")
	(c).fields["instanceStyles"] = R.coerce(null, "Object")
	(c).fields["sharedStyles"] = R.coerce(null, "Object")
	(c).fields["callLaterMethods"] = R.coerce(null, "Dictionary")
	(c).fields["invalidateFlag"] = false
	(c).fields["_enabled"] = true
	(c).fields["invalidHash"] = R.coerce(null, "Object")
	(c).fields["uiFocusRect"] = R.coerce(null, "DisplayObject")
	(c).fields["isFocused"] = false
	(c).fields["_focusEnabled"] = true
	(c).fields["_mouseFocusEnabled"] = true
	(c).fields["_width"] = float(NAN)
	(c).fields["_height"] = float(NAN)
	(c).fields["_x"] = float(NAN)
	(c).fields["_y"] = float(NAN)
	(c).fields["startWidth"] = float(NAN)
	(c).fields["startHeight"] = float(NAN)
	(c).fields["_imeMode"] = R.coerce(null, "String")
	(c).fields["_oldIMEMode"] = R.coerce(null, "String")
	(c).fields["errorCaught"] = false
	(c).fields["_inspector"] = false
	return null
