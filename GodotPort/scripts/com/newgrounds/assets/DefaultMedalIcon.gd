extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DefaultMedalIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	R.invoke(R.super_ref(c, "com.newgrounds.assets.DefaultMedalIcon"), [v_param1, v_param2])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
