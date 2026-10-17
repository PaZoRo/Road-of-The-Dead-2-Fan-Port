extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SaveRating(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveRating"), [])
	(c).fields["_name"] = R.coerce(v_param1, "String")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_isFloat"] = v_param3
	(c).fields["_minimum"] = float(v_param4)
	(c).fields["_maximum"] = float(v_param5)
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null

static func f_get_isFloat(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_isFloat")
	return null

static func f_get_minimum(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_minimum")
	return null

static func f_get_maximum(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_maximum")
	return null

static func f_validateValue(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc2_: Variant = NAN
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc3_ = R.coerce(0, "int")
	v__loc2_ = float(R.num(v_param1))
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveRating"), [v__loc2_])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Invalid value for rating \"", (c).fields.get("_name")), "\".")])
		return NAN
	if R.truth((float(v__loc2_) < float((c).fields.get("_minimum")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", v__loc2_, " is out of acceptable range for rating \""), (c).fields.get("_name")), "\". Clamping to "), (c).fields.get("_minimum")), ".")])
		return (c).fields.get("_minimum")
	if R.truth((float(v__loc2_) > float((c).fields.get("_maximum")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", v__loc2_, " is out of acceptable range for rating \""), (c).fields.get("_name")), "\". Clamping to "), (c).fields.get("_maximum")), ".")])
		return (c).fields.get("_maximum")
	if R.truth(R.unary("!", R.get_value(c, "isFloat"))):
		pass
		v__loc3_ = R.coerce(R.coerce(v__loc2_, "int"), "int")
		if R.truth((float(v__loc3_) != float(v__loc2_))):
			pass
			R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Float value ", v__loc2_), " given for integer rating \""), (c).fields.get("_name")), "\". Clamping to "), v__loc3_), ".")])
		return v__loc3_
	return v__loc2_
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_isFloat"] = false
	(c).fields["_minimum"] = float(NAN)
	(c).fields["_maximum"] = float(NAN)
	return null
