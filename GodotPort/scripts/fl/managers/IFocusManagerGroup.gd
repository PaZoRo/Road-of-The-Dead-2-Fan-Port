extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_get_groupName(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_groupName(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_get_selected(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_set_selected(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
