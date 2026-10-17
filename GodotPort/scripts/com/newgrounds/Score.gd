extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Score(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.Score"), [])
	(c).fields["_rank"] = R.coerce(v_param1, "uint")
	(c).fields["_username"] = R.coerce(v_param2, "String")
	(c).fields["_score"] = R.coerce(v_param3, "String")
	(c).fields["_numericValue"] = float(v_param4)
	(c).fields["_tag"] = R.coerce(v_param5, "String")
	return null

static func f_get_numericValue(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numericValue")
	return null

static func f_get_rank(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_rank")
	return null

static func f_get_score(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_score")
	return null

static func f_get_tag(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tag")
	return null

static func f_get_username(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_username")
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", (c).fields.get("_rank"), ".\t"), (c).fields.get("_username")), "\t"), (c).fields.get("_score"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_numericValue"] = float(NAN)
	(c).fields["_rank"] = R.coerce(0, "uint")
	(c).fields["_username"] = R.coerce(null, "String")
	(c).fields["_score"] = R.coerce(null, "String")
	(c).fields["_tag"] = R.coerce(null, "String")
	return null
