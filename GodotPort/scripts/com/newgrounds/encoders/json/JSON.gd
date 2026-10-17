extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_JSON(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.json.JSON"), [])
	return null

static func f_encode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	return R.invoke(R.klass("com.newgrounds.encoders.json.encodeJson"), [v_param1])
	return null

static func f_decode(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.invoke(R.klass("com.newgrounds.encoders.json.decodeJson"), [v_param1])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
