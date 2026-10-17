extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_get_defaultButton(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_defaultButton(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Button")
	pass
	return null

static func f_get_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_get_nextTabIndex(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_get_showFocusIndicator(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_showFocusIndicator(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_getFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_setFocus(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	pass
	return null

static func f_showFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_hideFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_activate(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_deactivate(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_findFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	pass
	return null

static func f_getNextFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_get_form(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_form(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
