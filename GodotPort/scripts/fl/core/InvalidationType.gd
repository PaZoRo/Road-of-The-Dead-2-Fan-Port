extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_InvalidationType(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.core.InvalidationType"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "ALL", "all", "=")
	R.set_value(c, "SIZE", "size", "=")
	R.set_value(c, "STYLES", "styles", "=")
	R.set_value(c, "RENDERER_STYLES", "rendererStyles", "=")
	R.set_value(c, "STATE", "state", "=")
	R.set_value(c, "DATA", "data", "=")
	R.set_value(c, "SCROLL", "scroll", "=")
	R.set_value(c, "SELECTED", "selected", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
