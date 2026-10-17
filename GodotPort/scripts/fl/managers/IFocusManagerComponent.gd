extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_get_focusEnabled(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_focusEnabled(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_get_mouseFocusEnabled(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_get_tabEnabled(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_get_tabIndex(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_setFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_drawFocus(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
