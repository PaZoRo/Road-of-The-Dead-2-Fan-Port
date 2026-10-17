extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTGraphicUtils(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DTGraphicUtils"), [])
	return null

static func f_GetMCClass(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mcClass": "Class", "e": "Error", "szClassName": "String"}
	l["mcClass"] = null
	l["e"] = null
	l["szClassName"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.lset(l, "mcClass", null)
	R.last_error = null
	return R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "DTGraphicUtils"), [R.lget(l, "szClassName")]), R.resolve(c, "Class", "DTGraphicUtils"))
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return null
	return null

static func f_CacheAsBitmap(c: Variant, a: Array) -> Variant:
	var v_bitmap: Variant = null
	var v_bounds: Variant = null
	var v_buffer: Variant = null
	var v_matrix: Variant = null
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	v_bitmap = R.coerce(null, "Bitmap")
	v_bounds = R.coerce(R.invoke(R.get_value(v_mc, "getBounds"), [v_mc]), "Rectangle")
	v_buffer = R.coerce(R.construct(R.klass("BitmapData"), [R.binary("+", R.get_value(v_mc, "width"), 10), R.binary("+", R.get_value(v_mc, "height"), 10), true, 16777215]), "BitmapData")
	v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
	R.set_value(v_matrix, "tx", R.binary("+", R.unary("-", R.get_value(v_bounds, "left")), 5), "=")
	R.set_value(v_matrix, "ty", R.binary("+", R.unary("-", R.get_value(v_bounds, "top")), 5), "=")
	R.invoke(R.get_value(v_buffer, "draw"), [v_mc, v_matrix])
	v_bitmap = R.coerce(R.construct(R.klass("Bitmap"), [v_buffer]), "Bitmap")
	R.set_value(v_bitmap, "smoothing", true, "=")
	R.set_value(v_bitmap, "x", (R.num(R.get_value(v_bounds, "left")) - float(5)), "=")
	R.set_value(v_bitmap, "y", (R.num(R.get_value(v_bounds, "top")) - float(5)), "=")
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "clear"), [])
	while R.truth(R.binary(">", R.get_value(v_mc, "numChildren"), 0)):
		pass
		R.invoke(R.get_value(v_mc, "removeChildAt"), [0])
	R.invoke(R.get_value(v_mc, "addChild"), [v_bitmap])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
