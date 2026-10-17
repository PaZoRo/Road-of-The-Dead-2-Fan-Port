extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_LabelButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.LabelButton"), [])
	return null

static func f_getStyleDefinition(c: Variant, a: Array) -> Variant:
	return R.invoke(R.resolve(c, "mergeStyles", "fl.controls.LabelButton"), [R.static_value("fl.controls.LabelButton", "defaultStyles"), R.call_static("fl.controls.BaseButton", "getStyleDefinition", [])])
	return null

static func f_get_label(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_label")
	return null

static func f_set_label(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_label"] = R.coerce(v_value, "String")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("textField"), "text"), (c).fields.get("_label"))):
		pass
		R.set_value((c).fields.get("textField"), "text", (c).fields.get("_label"), "=")
		R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("fl.events.ComponentEvent"), [R.static_value("fl.events.ComponentEvent", "LABEL_CHANGE")])])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STYLES")])
	return null

static func f_get_labelPlacement(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_labelPlacement")
	return null

static func f_set_labelPlacement(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_labelPlacement"] = R.coerce(v_value, "String")
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE")])
	return null

static func f_get_toggle(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_toggle")
	return null

static func f_set_toggle(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.logical_and(R.unary("!", v_value), func(): return R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "selected"))):
		pass
		R.set_value(c, "selected", false, "=")
	(c).fields["_toggle"] = v_value
	if R.truth((c).fields.get("_toggle")):
		pass
		R.invoke(R.resolve(c, "addEventListener", "fl.controls.LabelButton"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "toggleSelected"), false, 0, true])
	else:
		pass
		R.invoke(R.resolve(c, "removeEventListener", "fl.controls.LabelButton"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "toggleSelected")])
	R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null

static func f_toggleSelected(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.set_value(c, "selected", R.unary("!", R.get_value(c, "selected")), "=")
	R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("Event"), [R.get_value(R.klass("Event"), "CHANGE"), true])])
	return null

static func f_get_selected(c: Variant, a: Array) -> Variant:
	return (c.fields.get("_selected") if R.truth((c).fields.get("_toggle")) else false)
	return null

static func f_set_selected(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	c.fields["_selected"] = v_value
	if R.truth((c).fields.get("_toggle")):
		pass
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "STATE")])
	return null

static func f_configUI(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "configUI"), [])
	(c).fields["textField"] = R.coerce(R.construct(R.klass("TextField"), []), "TextField")
	R.set_value((c).fields.get("textField"), "type", R.get_value(R.resolve(c, "TextFieldType", "fl.controls.LabelButton"), "DYNAMIC"), "=")
	R.set_value((c).fields.get("textField"), "selectable", false, "=")
	R.invoke(R.resolve(c, "addChild", "fl.controls.LabelButton"), [(c).fields.get("textField")])
	return null

static func f_draw(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.get_value((c).fields.get("textField"), "text"), (c).fields.get("_label"))):
		pass
		R.set_value(c, "label", (c).fields.get("_label"), "=")
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "STYLES"), R.static_value("fl.core.InvalidationType", "STATE")])):
		pass
		R.call_member(c, "drawBackground", [])
		R.call_member(c, "drawIcon", [])
		R.call_member(c, "drawTextFormat", [])
		R.call_member(c, "invalidate", [R.static_value("fl.core.InvalidationType", "SIZE"), false])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE")])):
		pass
		R.call_member(c, "drawLayout", [])
	if R.truth(R.call_member(c, "isInvalid", [R.static_value("fl.core.InvalidationType", "SIZE"), R.static_value("fl.core.InvalidationType", "STYLES")])):
		pass
		if R.truth(R.logical_and(c.fields.get("isFocused"), func(): return R.get_value(R.resolve(c, "focusManager", "fl.controls.LabelButton"), "showFocusIndicator"))):
			pass
			R.call_member(c, "drawFocus", [true])
	R.call_member(c, "validate", [])
	return null

static func f_drawIcon(c: Variant, a: Array) -> Variant:
	var v_oldIcon: Variant = null
	var v_styleName: Variant = null
	var v_iconStyle: Variant = null
	v_oldIcon = R.coerce((c).fields.get("icon"), "DisplayObject")
	v_styleName = R.coerce((c.fields.get("mouseState") if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else "disabled"), "String")
	if R.truth(R.get_value(c, "selected")):
		pass
		v_styleName = R.coerce(R.binary("+", R.binary("+", "selected", R.invoke(R.get_value(R.invoke(R.get_value(v_styleName, "substr"), [0, 1]), "toUpperCase"), [])), R.invoke(R.get_value(v_styleName, "substr"), [1])), "String")
	v_styleName = R.coerce(R.binary("+", v_styleName, "Icon"), "String")
	v_iconStyle = R.coerce(R.call_member(c, "getStyleValue", [v_styleName]), "Object")
	if R.truth(R.binary("==", v_iconStyle, null)):
		pass
		v_iconStyle = R.coerce(R.call_member(c, "getStyleValue", ["icon"]), "Object")
	if R.truth(R.binary("!=", v_iconStyle, null)):
		pass
		(c).fields["icon"] = R.coerce(R.call_member(c, "getDisplayObjectInstance", [v_iconStyle]), "DisplayObject")
	if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
		pass
		R.invoke(R.resolve(c, "addChildAt", "fl.controls.LabelButton"), [(c).fields.get("icon"), 1])
	if R.truth((R.binary("!=", v_oldIcon, null) and R.binary("!=", v_oldIcon, (c).fields.get("icon")))):
		pass
		R.invoke(R.resolve(c, "removeChild", "fl.controls.LabelButton"), [v_oldIcon])
	return null

static func f_drawTextFormat(c: Variant, a: Array) -> Variant:
	var v_uiStyles: Variant = null
	var v_defaultTF: Variant = null
	var v_tf: Variant = null
	v_uiStyles = R.coerce(R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "Object")
	v_defaultTF = R.coerce((R.binary("as", R.get_value(v_uiStyles, "defaultTextFormat"), R.klass("TextFormat")) if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else R.binary("as", R.get_value(v_uiStyles, "defaultDisabledTextFormat"), R.klass("TextFormat"))), "TextFormat")
	R.invoke(R.get_value((c).fields.get("textField"), "setTextFormat"), [v_defaultTF])
	v_tf = R.coerce(R.binary("as", R.call_member(c, "getStyleValue", [("textFormat" if R.truth(R.resolve(c, "enabled", "fl.controls.LabelButton")) else "disabledTextFormat")]), R.klass("TextFormat")), "TextFormat")
	if R.truth(R.binary("!=", v_tf, null)):
		pass
		R.invoke(R.get_value((c).fields.get("textField"), "setTextFormat"), [v_tf])
	else:
		pass
		v_tf = R.coerce(v_defaultTF, "TextFormat")
	R.set_value((c).fields.get("textField"), "defaultTextFormat", v_tf, "=")
	R.call_member(c, "setEmbedFont", [])
	return null

static func f_setEmbedFont(c: Variant, a: Array) -> Variant:
	var v_embed: Variant = null
	v_embed = R.coerce(R.call_member(c, "getStyleValue", ["embedFonts"]), "Object")
	if R.truth(R.binary("!=", v_embed, null)):
		pass
		R.set_value((c).fields.get("textField"), "embedFonts", v_embed, "=")
	return null

static func f_drawLayout(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"tmpWidth": "Number", "tmpHeight": "Number", "txtPad": "Number", "placement": "String", "txtW": "Number", "txtH": "Number", "paddedIconW": "Number", "paddedIconH": "Number"}
	l["tmpWidth"] = NAN
	l["tmpHeight"] = NAN
	l["txtPad"] = NAN
	l["placement"] = null
	l["txtW"] = NAN
	l["txtH"] = NAN
	l["paddedIconW"] = NAN
	l["paddedIconH"] = NAN
	R.lset(l, "tmpWidth", NAN)
	R.lset(l, "tmpHeight", NAN)
	R.lset(l, "txtPad", R.num(R.call_member(c, "getStyleValue", ["textPadding"])))
	R.lset(l, "placement", (R.static_value("fl.controls.ButtonLabelPlacement", "TOP") if R.truth((R.binary("==", (c).fields.get("icon"), null) and R.binary("==", (c).fields.get("mode"), "center"))) else (c).fields.get("_labelPlacement")))
	R.set_value((c).fields.get("textField"), "height", R.binary("+", R.get_value((c).fields.get("textField"), "textHeight"), 4), "=")
	R.lset(l, "txtW", R.binary("+", R.get_value((c).fields.get("textField"), "textWidth"), 4))
	R.lset(l, "txtH", R.binary("+", R.get_value((c).fields.get("textField"), "textHeight"), 4))
	R.lset(l, "paddedIconW", (0 if R.truth(R.binary("==", (c).fields.get("icon"), null)) else R.binary("+", R.get_value((c).fields.get("icon"), "width"), R.lget(l, "txtPad"))))
	R.lset(l, "paddedIconH", (0 if R.truth(R.binary("==", (c).fields.get("icon"), null)) else R.binary("+", R.get_value((c).fields.get("icon"), "height"), R.lget(l, "txtPad"))))
	R.set_value((c).fields.get("textField"), "visible", R.binary(">", R.get_value(R.get_value(c, "label"), "length"), 0), "=")
	if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
		pass
		R.set_value((c).fields.get("icon"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("icon"), "width"))), 2)]), "=")
		R.set_value((c).fields.get("icon"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("icon"), "height"))), 2)]), "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("textField"), "visible"), false)):
		pass
		R.set_value((c).fields.get("textField"), "width", 0, "=")
		R.set_value((c).fields.get("textField"), "height", 0, "=")
	else:
		pass
		if R.truth((R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM")) or R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "TOP")))):
			pass
			R.lset(l, "tmpWidth", maxf(float(0), float(minf(float(R.lget(l, "txtW")), float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float((float(2) * float(R.lget(l, "txtPad"))))))))), "=")
			if R.truth((float((R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - float(2))) > float(R.lget(l, "txtH")))):
				pass
				R.lset(l, "tmpHeight", R.lget(l, "txtH"), "=")
			else:
				pass
				R.lset(l, "tmpHeight", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - float(2)), "=")
			R.set_value((c).fields.get("textField"), "width", R.lset(l, "txtW", R.lget(l, "tmpWidth"), "="), "=")
			R.set_value((c).fields.get("textField"), "height", R.lset(l, "txtH", R.lget(l, "tmpHeight"), "="), "=")
			R.set_value((c).fields.get("textField"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "txtW"))), 2)]), "=")
			R.set_value((c).fields.get("textField"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.binary("/", (float((R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("textField"), "height")))) - float(R.lget(l, "paddedIconH"))), 2), (R.lget(l, "paddedIconH") if R.truth(R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM"))) else 0))]), "=")
			if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
				pass
				R.set_value((c).fields.get("icon"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [((R.num(R.get_value((c).fields.get("textField"), "y")) - float(R.lget(l, "paddedIconH"))) if R.truth(R.binary("==", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "BOTTOM"))) else R.binary("+", R.binary("+", R.get_value((c).fields.get("textField"), "y"), R.get_value((c).fields.get("textField"), "height")), R.lget(l, "txtPad")))]), "=")
		else:
			pass
			R.lset(l, "tmpWidth", maxf(float(0), float(minf(float(R.lget(l, "txtW")), float((float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "paddedIconW")))) - float((float(2) * float(R.lget(l, "txtPad"))))))))), "=")
			R.set_value((c).fields.get("textField"), "width", R.lset(l, "txtW", R.lget(l, "tmpWidth"), "="), "=")
			R.set_value((c).fields.get("textField"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.binary("/", (float((R.num(R.resolve(c, "width", "fl.controls.LabelButton")) - float(R.lget(l, "txtW")))) - float(R.lget(l, "paddedIconW"))), 2), (R.lget(l, "paddedIconW") if R.truth(R.binary("!=", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "LEFT"))) else 0))]), "=")
			R.set_value((c).fields.get("textField"), "y", R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (R.num(R.resolve(c, "height", "fl.controls.LabelButton")) - R.num(R.get_value((c).fields.get("textField"), "height"))), 2)]), "=")
			if R.truth(R.binary("!=", (c).fields.get("icon"), null)):
				pass
				R.set_value((c).fields.get("icon"), "x", R.invoke(R.get_value(R.klass("Math"), "round"), [((R.num(R.get_value((c).fields.get("textField"), "x")) - float(R.lget(l, "paddedIconW"))) if R.truth(R.binary("!=", R.lget(l, "placement"), R.static_value("fl.controls.ButtonLabelPlacement", "LEFT"))) else R.binary("+", R.binary("+", R.get_value((c).fields.get("textField"), "x"), R.lget(l, "txtW")), R.lget(l, "txtPad")))]), "=")
	R.invoke(R.get_value(R.super_ref(c, "fl.controls.LabelButton"), "drawLayout"), [])
	return null

static func f_keyDownHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", R.resolve(c, "enabled", "fl.controls.LabelButton"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.controls.LabelButton"), "SPACE"))):
		pass
		if R.truth(R.binary("==", (c).fields.get("oldMouseState"), null)):
			pass
			(c).fields["oldMouseState"] = R.coerce(c.fields.get("mouseState"), "String")
		R.call_member(c, "setMouseState", ["down"])
		R.call_member(c, "startPress", [])
	return null

static func f_keyUpHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", R.resolve(c, "enabled", "fl.controls.LabelButton"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.controls.LabelButton"), "SPACE"))):
		pass
		R.call_member(c, "setMouseState", [(c).fields.get("oldMouseState")])
		(c).fields["oldMouseState"] = R.coerce(null, "String")
		R.call_member(c, "endPress", [])
		R.invoke(R.resolve(c, "dispatchEvent", "fl.controls.LabelButton"), [R.construct(R.klass("MouseEvent"), [R.get_value(R.klass("MouseEvent"), "CLICK")])])
	return null

static func f_initializeAccessibility(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.static_value("fl.controls.LabelButton", "createAccessibilityImplementation"), null)):
		pass
		R.invoke(R.static_value("fl.controls.LabelButton", "createAccessibilityImplementation"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "createAccessibilityImplementation", null, "=")
	R.set_value(c, "defaultStyles", {"icon": null, "upIcon": null, "downIcon": null, "overIcon": null, "disabledIcon": null, "selectedDisabledIcon": null, "selectedUpIcon": null, "selectedDownIcon": null, "selectedOverIcon": null, "textFormat": null, "disabledTextFormat": null, "textPadding": 5, "embedFonts": false}, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["textField"] = R.coerce(null, "TextField")
	(c).fields["_labelPlacement"] = R.coerce("right", "String")
	(c).fields["_toggle"] = false
	(c).fields["icon"] = R.coerce(null, "DisplayObject")
	(c).fields["oldMouseState"] = R.coerce(null, "String")
	(c).fields["_label"] = R.coerce("Label", "String")
	(c).fields["mode"] = R.coerce("center", "String")
	return null
