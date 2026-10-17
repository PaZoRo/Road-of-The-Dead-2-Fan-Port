extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SaveKey(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveKey"), [])
	(c).fields["_name"] = R.coerce(v_param1, "String")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_type"] = R.coerce(v_param3, "uint")
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null

static func f_get_type(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_type")
	return null

static func f_validateValue(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc2_ = R.coerce(0, "int")
	var __t1 = (c).fields.get("_type")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_INTEGER")):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_FLOAT")):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_BOOLEAN")):
		__t2 = 2
	if __t2 == -1 and R.binary("===", __t1, R.static_value("com.newgrounds.SaveKey", "TYPE_STRING")):
		__t2 = 3
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			v_param1 = R.coerce(R.num(v_param1), "*")
			if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [v_param1]))):
				pass
				v__loc2_ = R.coerce(R.coerce(v_param1, "int"), "int")
				if R.truth(R.binary("!=", v__loc2_, v_param1)):
					pass
					R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Float value ", v_param1), " given for integer key \""), (c).fields.get("_name")), "\". Clamping to "), v__loc2_), ".")])
				return v__loc2_
			break
		if __t2 >= 0 and __t2 <= 1:
			pass
			v_param1 = R.coerce(R.num(v_param1), "*")
			if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [v_param1]))):
				pass
				return R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveKey"), [R.num(v_param1)])
			break
		if __t2 >= 0 and __t2 <= 2:
			pass
			return (R.truth(v_param1) and (float(R.coerce(v_param1, "int")) != float(0)))
		if __t2 >= 0 and __t2 <= 3:
			pass
			return (R.invoke(R.get_value(v_param1, "toString"), []) if R.truth(v_param1) else "")
	return null
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "TYPE_FLOAT", 1, "=")
	R.set_value(c, "TYPE_INTEGER", 2, "=")
	R.set_value(c, "TYPE_STRING", 3, "=")
	R.set_value(c, "TYPE_BOOLEAN", 4, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_type"] = R.coerce(0, "uint")
	return null
