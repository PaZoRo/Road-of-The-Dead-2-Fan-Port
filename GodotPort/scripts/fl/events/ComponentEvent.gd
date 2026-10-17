extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ComponentEvent(c: Variant, a: Array) -> Variant:
	var v_type: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_bubbles: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_cancelable: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.invoke(R.super_ref(c, "fl.events.ComponentEvent"), [v_type, v_bubbles, v_cancelable])
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.invoke(R.resolve(c, "formatToString", "fl.events.ComponentEvent"), ["ComponentEvent", "type", "bubbles", "cancelable"])
	return null

static func f_clone(c: Variant, a: Array) -> Variant:
	return R.construct(R.klass("fl.events.ComponentEvent"), [R.resolve(c, "type", "fl.events.ComponentEvent"), R.resolve(c, "bubbles", "fl.events.ComponentEvent"), R.resolve(c, "cancelable", "fl.events.ComponentEvent")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "BUTTON_DOWN", "buttonDown", "=")
	R.set_value(c, "LABEL_CHANGE", "labelChange", "=")
	R.set_value(c, "HIDE", "hide", "=")
	R.set_value(c, "SHOW", "show", "=")
	R.set_value(c, "RESIZE", "resize", "=")
	R.set_value(c, "MOVE", "move", "=")
	R.set_value(c, "ENTER", "enter", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
