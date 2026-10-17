extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Button(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.Button"), [])
	return null

static func f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.call_static("fl.core.UIComponent", "mergeStyles", [R.call_static("fl.controls.LabelButton", "getStyleDefinition", []), R.static_value("fl.controls.Button", "defaultStyles")])
	return null

static func f_get_emphasized(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_emphasized")
	return null

static func f_set_emphasized(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_emphasized"] = v_value
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null

static func f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_or(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES")]), func(): return R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")]))):
		pass
		R.call_member(c, "drawEmphasized", [])
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.Button"), "draw"), [])
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "setChildIndex", "fl.controls.Button"), [(c).fields.get("emphasizedBorder"), (R.num(R.resolve(c, "numChildren", "fl.controls.Button")) - float(1))])
	return null

static func f_drawEmphasized(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"padding": "Number", "emphasizedStyle": "Object"}
	l["padding"] = NAN
	l["emphasizedStyle"] = null
	R.lset(l, "padding", NAN)
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.Button"), [(c).fields.get("emphasizedBorder")])
	(c).fields["emphasizedBorder"] = R.coerce(null, "DisplayObject")
	if R.truth(R.unary("!", (c).fields.get("_emphasized"))):
		pass
		return null
	R.lset(l, "emphasizedStyle", R.call_member(c, "getStyleValue", ["emphasizedSkin"]))
	if R.truth(R.binary("!=", R.lget(l, "emphasizedStyle"), null)):
		pass
		(c).fields["emphasizedBorder"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [R.lget(l, "emphasizedStyle")]), "DisplayObject")
	if R.truth(R.binary("!=", (c).fields.get("emphasizedBorder"), null)):
		pass
		R.invoke(R.resolve(c, "addChildAt", "fl.controls.Button"), [(c).fields.get("emphasizedBorder"), 0])
		R.lset(l, "padding", R.num(R.call_member(c, "getStyleValue", ["emphasizedPadding"])), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "x", R.set_value((c).fields.get("emphasizedBorder"), "y", R.unary("-", R.lget(l, "padding")), "="), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "width", R.binary("+", R.resolve(c, "width", "fl.controls.Button"), (float(R.lget(l, "padding")) * float(2))), "=")
		R.set_value((c).fields.get("emphasizedBorder"), "height", R.binary("+", R.resolve(c, "height", "fl.controls.Button"), (float(R.lget(l, "padding")) * float(2))), "=")
	return null

static func f_drawFocus(c: Variant, a: Array) -> Variant:
	var v_emphasizedPadding: Variant = NAN
	var v_focusPadding: Variant = null
	var v_focused: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_emphasizedPadding = float(NAN)
	v_focusPadding = R.coerce(null, "*")
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.Button"), "drawFocus"), [v_focused])
	if R.truth(v_focused):
		pass
		v_emphasizedPadding = float(R.num(R.call_member(c, "getStyleValue", ["emphasizedPadding"])))
		if R.truth(((float(v_emphasizedPadding) < float(0)) or R.unary("!", (c).fields.get("_emphasized")))):
			pass
			v_emphasizedPadding = float(0)
		v_focusPadding = R.coerce(R.call_member(c, "getStyleValue", ["focusRectPadding"]), "*")
		v_focusPadding = R.coerce((2 if R.truth(R.binary("==", v_focusPadding, null)) else v_focusPadding), "*")
		v_focusPadding = R.coerce(R.binary("+", v_focusPadding, v_emphasizedPadding), "*")
		R.set_value(c.fields.get("uiFocusRect"), "x", R.unary("-", v_focusPadding), "=")
		R.set_value(c.fields.get("uiFocusRect"), "y", R.unary("-", v_focusPadding), "=")
		R.set_value(c.fields.get("uiFocusRect"), "width", R.binary("+", R.resolve(c, "width", "fl.controls.Button"), (R.num(v_focusPadding) * float(2))), "=")
		R.set_value(c.fields.get("uiFocusRect"), "height", R.binary("+", R.resolve(c, "height", "fl.controls.Button"), (R.num(v_focusPadding) * float(2))), "=")
	return null

static func f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.controls.Button", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.controls.Button", "createAccessibilityImplementation"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "defaultStyles", {"emphasizedSkin": "Button_emphasizedSkin", "emphasizedPadding": 2}, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_emphasized"] = false
	(c).fields["emphasizedBorder"] = R.coerce(null, "DisplayObject")
	return null
