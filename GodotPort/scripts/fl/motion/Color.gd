extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Color(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 1), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 1), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "Number")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "Number")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "Number")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "Number")
	R.invoke(R.super_ref(c, "fl.motion.Color"), [v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7, v_param8])
	return null

static func f_fromXML(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "XML")
	return R.invoke(R.klass("fl.motion.Color"), [R.invoke(R.get_value(R.construct(R.klass("fl.motion.Color"), []), "parseXML"), [v_param1])])
	return null

static func f_interpolateTransform(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = NAN
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ColorTransform")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "ColorTransform")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v__loc4_ = float((float(1) - float(v_param3)))
	return R.construct(R.klass("ColorTransform"), [(float((R.num(R.get_value(v_param1, "redMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "redMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "greenMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "greenMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "blueMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "blueMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "alphaMultiplier")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "alphaMultiplier")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "redOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "redOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "greenOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "greenOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "blueOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "blueOffset")) * float(v_param3)))), (float((R.num(R.get_value(v_param1, "alphaOffset")) * float(v__loc4_))) + float((R.num(R.get_value(v_param2, "alphaOffset")) * float(v_param3))))])
	return null

static func f_interpolateColor(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = NAN
	var v__loc5_: Variant = 0
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc11_: Variant = 0
	var v__loc12_: Variant = 0
	var v__loc13_: Variant = 0
	var v__loc14_: Variant = 0
	var v__loc15_: Variant = 0
	var v__loc16_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v__loc4_ = float((float(1) - float(v_param3)))
	v__loc5_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 24), 255), "uint"), "uint")
	v__loc6_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 16), 255), "uint"), "uint")
	v__loc7_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param1, 8), 255), "uint"), "uint")
	v__loc8_ = R.coerce(R.coerce(R.binary("&", v_param1, 255), "uint"), "uint")
	v__loc9_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 24), 255), "uint"), "uint")
	v__loc10_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 16), 255), "uint"), "uint")
	v__loc11_ = R.coerce(R.coerce(R.binary("&", R.binary(">>", v_param2, 8), 255), "uint"), "uint")
	v__loc12_ = R.coerce(R.coerce(R.binary("&", v_param2, 255), "uint"), "uint")
	v__loc13_ = R.coerce((float((float(v__loc5_) * float(v__loc4_))) + float((float(v__loc9_) * float(v_param3)))), "uint")
	v__loc14_ = R.coerce((float((float(v__loc6_) * float(v__loc4_))) + float((float(v__loc10_) * float(v_param3)))), "uint")
	v__loc15_ = R.coerce((float((float(v__loc7_) * float(v__loc4_))) + float((float(v__loc11_) * float(v_param3)))), "uint")
	v__loc16_ = R.coerce((float((float(v__loc8_) * float(v__loc4_))) + float((float(v__loc12_) * float(v_param3)))), "uint")
	return R.coerce(R.binary("|", R.binary("|", R.binary("|", R.binary("<<", v__loc13_, 24), R.binary("<<", v__loc14_, 16)), R.binary("<<", v__loc15_, 8)), v__loc16_), "uint")
	return null

static func f_get_brightness(c: Variant, a: Array) -> Variant:
	return ((float(1) - R.num(R.get_value(c, "redMultiplier"))) if R.truth(R.get_value(c, "redOffset")) else (R.num(R.get_value(c, "redMultiplier")) - float(1)))
	return null

static func f_set_brightness(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc2_": "Number", "_loc3_": "Number", "param1": "Number"}
	l["_loc2_"] = NAN
	l["_loc3_"] = NAN
	l["param1"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(R.lget(l, "param1")) > float(1))):
		pass
		R.lset(l, "param1", 1, "=")
	else:
		pass
		if R.truth(R.binary("<", R.lget(l, "param1"), R.unary("-", 1))):
			pass
			R.lset(l, "param1", R.unary("-", 1), "=")
	R.lset(l, "_loc2_", (float(1) - float(absf(float(R.lget(l, "param1"))))))
	R.lset(l, "_loc3_", 0)
	if R.truth((float(R.lget(l, "param1")) > float(0))):
		pass
		R.lset(l, "_loc3_", (float(R.lget(l, "param1")) * float(255)), "=")
	R.set_value(c, "redMultiplier", R.set_value(c, "greenMultiplier", R.set_value(c, "blueMultiplier", R.lget(l, "_loc2_"), "="), "="), "=")
	R.set_value(c, "redOffset", R.set_value(c, "greenOffset", R.set_value(c, "blueOffset", R.lget(l, "_loc3_"), "="), "="), "=")
	return null

static func f_setTint(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc3_": "uint", "_loc4_": "uint", "_loc5_": "uint", "param1": "uint", "param2": "Number"}
	l["_loc3_"] = 0
	l["_loc4_"] = 0
	l["_loc5_"] = 0
	l["param1"] = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["_tintColor"] = float(R.lget(l, "param1"))
	(c).fields["_tintMultiplier"] = float(R.lget(l, "param2"))
	R.set_value(c, "redMultiplier", R.set_value(c, "greenMultiplier", R.set_value(c, "blueMultiplier", (float(1) - float(R.lget(l, "param2"))), "="), "="), "=")
	R.lset(l, "_loc3_", R.coerce(R.binary("&", R.binary(">>", R.lget(l, "param1"), 16), 255), "uint"))
	R.lset(l, "_loc4_", R.coerce(R.binary("&", R.binary(">>", R.lget(l, "param1"), 8), 255), "uint"))
	R.lset(l, "_loc5_", R.coerce(R.binary("&", R.lget(l, "param1"), 255), "uint"))
	R.set_value(c, "redOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc3_")) * float(R.lget(l, "param2")))]), "=")
	R.set_value(c, "greenOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc4_")) * float(R.lget(l, "param2")))]), "=")
	R.set_value(c, "blueOffset", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(R.lget(l, "_loc5_")) * float(R.lget(l, "param2")))]), "=")
	return null

static func f_get_tintColor(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tintColor")
	return null

static func f_set_tintColor(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	R.call_member(c, "setTint", [v_param1, R.get_value(c, "tintMultiplier")])
	return null

static func f_deriveTintColor(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = NAN
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	v__loc1_ = float(R.binary("/", 1, R.get_value(c, "tintMultiplier")))
	v__loc2_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "redOffset")) * float(v__loc1_))]), "uint")
	v__loc3_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "greenOffset")) * float(v__loc1_))]), "uint")
	v__loc4_ = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(R.num(R.get_value(c, "blueOffset")) * float(v__loc1_))]), "uint")
	return R.coerce(R.binary("|", R.binary("|", R.binary("<<", v__loc2_, 16), R.binary("<<", v__loc3_, 8)), v__loc4_), "uint")
	return null

static func f_get_tintMultiplier(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tintMultiplier")
	return null

static func f_set_tintMultiplier(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "setTint", [R.get_value(c, "tintColor"), v_param1])
	return null

static func f_parseXML(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = 0
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "XML")
	v__loc3_ = R.coerce(null, "XML")
	v__loc4_ = R.coerce(null, "String")
	v__loc5_ = R.coerce(0, "uint")
	if R.truth(R.unary("!", v_param1)):
		pass
		return c
	v__loc2_ = R.coerce(R.get_value(R.invoke(R.get_value(v_param1, "elements"), []), 0), "XML")
	if R.truth(R.unary("!", v__loc2_)):
		pass
		return c
	for __t1 in R.iterate(R.invoke(R.get_value(v__loc2_, "attributes"), []), true):
		v__loc3_ = R.coerce(__t1, "XML")
		v__loc4_ = R.coerce(R.invoke(R.get_value(v__loc3_, "localName"), []), "String")
		if R.truth(R.binary("==", v__loc4_, "tintColor")):
			pass
			v__loc5_ = R.coerce(R.binary("as", R.num(R.invoke(R.get_value(v__loc3_, "toString"), [])), R.klass("uint")), "uint")
			R.set_value(c, "tintColor", v__loc5_, "=")
		else:
			pass
			R.set_value(c, v__loc4_, R.num(R.invoke(R.get_value(v__loc3_, "toString"), [])), "=")
	return c
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_tintColor"] = float(0)
	(c).fields["_tintMultiplier"] = float(0)
	return null
