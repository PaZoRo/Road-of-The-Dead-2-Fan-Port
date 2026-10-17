extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Quad(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "gs.easing.Quad"), [])
	return null

static func f_easeIn(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((float(R.lget(l, "c")) * R.num(R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.lget(l, "d")), "=")))) * float(R.lget(l, "t")))) + float(R.lget(l, "b")))
	return null

static func f_easeOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((R.num(R.unary("-", R.lget(l, "c"))) * R.num(R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.lget(l, "d")), "=")))) * float((float(R.lget(l, "t")) - float(2))))) + float(R.lget(l, "b")))
	return null

static func f_easeInOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"t": "Number", "b": "Number", "c": "Number", "d": "Number"}
	l["t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.lset(l, "t", R.binary("/", R.lget(l, "t"), R.binary("/", R.lget(l, "d"), 2)), "=")
	if R.truth((float(R.lget(l, "t")) < float(1))):
		pass
		return (float((float((float(R.binary("/", R.lget(l, "c"), 2)) * float(R.lget(l, "t")))) * float(R.lget(l, "t")))) + float(R.lget(l, "b")))
	return (float((float(R.binary("/", R.unary("-", R.lget(l, "c")), 2)) * float((float((R.num(R.lset(l, "t", 1, "-=")) * float((float(R.lget(l, "t")) - float(2))))) - float(1))))) + float(R.lget(l, "b")))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
