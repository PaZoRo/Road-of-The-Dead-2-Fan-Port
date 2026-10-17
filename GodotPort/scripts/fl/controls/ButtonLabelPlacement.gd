extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ButtonLabelPlacement(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.controls.ButtonLabelPlacement"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "BOTTOM", "bottom", "=")
	R.set_value(c, "TOP", "top", "=")
	R.set_value(c, "LEFT", "left", "=")
	R.set_value(c, "RIGHT", "right", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
