extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APIShim(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.shims.APIShim"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["__a"] = R.coerce(null, "API")
	(c).fields["__b"] = R.coerce(null, "FlashAdBase")
	return null
