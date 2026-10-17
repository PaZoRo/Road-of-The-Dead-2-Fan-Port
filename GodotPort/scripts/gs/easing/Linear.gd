extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Linear(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "gs.easing.Linear"), [])
	return null

static func f_easeNone(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null

static func f_easeIn(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null

static func f_easeOut(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null

static func f_easeInOut(c: Variant, a: Array) -> Variant:
	var v_t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float(R.binary("/", (float(v_c) * float(v_t)), v_d)) + float(v_b))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
