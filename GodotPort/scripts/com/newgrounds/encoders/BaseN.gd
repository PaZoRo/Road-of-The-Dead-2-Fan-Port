extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_BaseN(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.BaseN"), [])
	if R.truth(v_param1):
		pass
		(c).fields["_hash"] = R.coerce(v_param1, "String")
	else:
		pass
		(c).fields["_hash"] = R.coerce(R.static_value("com.newgrounds.encoders.BaseN", "DEFAULT_HASH"), "String")
	(c).fields["_base"] = R.coerce(R.get_value((c).fields.get("_hash"), "length"), "uint")
	(c).fields["_reverseHash"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "com.newgrounds.encoders.BaseN"), []), "Dictionary")
	v__loc2_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc2_, R.get_value((c).fields.get("_hash"), "length"))):
		pass
		R.set_value((c).fields.get("_reverseHash"), R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [v__loc2_]), v__loc2_, "=")
		v__loc2_ = ((v__loc2_ + 1) & 4294967295)
	return null

static func f_encodeUint(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 1), "uint")
	v__loc3_ = R.coerce("", "String")
	v__loc4_ = R.coerce(v_param1, "uint")
	while R.truth((float(v__loc4_) != float(0))):
		pass
		v__loc3_ = R.coerce(R.binary("+", R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [R.binary("%", v__loc4_, (c).fields.get("_base"))]), v__loc3_), "String")
		v__loc4_ = R.coerce(R.binary("/", v__loc4_, (c).fields.get("_base")), "uint")
	while R.truth(R.binary("<", R.get_value(v__loc3_, "length"), v_param2)):
		pass
		v__loc3_ = R.coerce(R.binary("+", R.invoke(R.get_value((c).fields.get("_hash"), "charAt"), [0]), v__loc3_), "String")
	return v__loc3_
	return null

static func f_decodeUint(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(0, "uint")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("*", v__loc2_, (c).fields.get("_base")), "uint")
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.get_value((c).fields.get("_reverseHash"), R.invoke(R.get_value(v_param1, "charAt"), [v__loc3_]))), "uint")
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "DEFAULT_HASH", "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~@#$%^&*()+|;/", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_hash"] = R.coerce(null, "String")
	(c).fields["_base"] = R.coerce(0, "uint")
	(c).fields["_reverseHash"] = R.coerce(null, "Dictionary")
	return null
