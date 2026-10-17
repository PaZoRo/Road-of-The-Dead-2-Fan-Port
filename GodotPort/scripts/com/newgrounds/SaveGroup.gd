extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SaveGroup(c: Variant, a: Array) -> Variant:
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = null
	var v__loc9_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "uint")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else null), "Array")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else null), "Array")
	v__loc7_ = R.coerce(0, "uint")
	v__loc8_ = R.coerce(null, "SaveKey")
	v__loc9_ = R.coerce(null, "SaveRating")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveGroup"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_id"] = R.coerce(v_param3, "uint")
	(c).fields["_name"] = R.coerce(v_param2, "String")
	(c).fields["_type"] = R.coerce(v_param4, "uint")
	(c).fields["_keysArray"] = R.coerce(v_param5, "Array")
	(c).fields["_ratingsArray"] = R.coerce(v_param6, "Array")
	(c).fields["_keys"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.SaveGroup"), []), "Object")
	(c).fields["_ratings"] = R.coerce(R.construct(R.resolve(c, "Object", "com.newgrounds.SaveGroup"), []), "Object")
	for __t1 in R.iterate(v_param5, true):
		v__loc8_ = R.coerce(__t1, "SaveKey")
		R.set_value((c).fields.get("_keys"), R.get_value(v__loc8_, "name"), v__loc8_, "=")
	for __t2 in R.iterate(v_param6, true):
		v__loc9_ = R.coerce(__t2, "SaveRating")
		R.set_value((c).fields.get("_ratings"), R.get_value(v__loc9_, "name"), v__loc9_, "=")
	return null

static func f_get_connection(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_connection")
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_get_type(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_type")
	return null

static func f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null

static func f_get_keys(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_keysArray")
	return null

static func f_get_ratings(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_ratingsArray")
	return null

static func f_getKey(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("_keys"), v_param1)
	return null

static func f_getRating(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value((c).fields.get("_ratings"), v_param1)
	return null

static func f_getKeyById(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v__loc2_ = R.coerce(null, "SaveKey")
	for __t3 in R.iterate((c).fields.get("_keys"), true):
		v__loc2_ = R.coerce(__t3, "SaveKey")
		if R.truth(R.binary("==", R.get_value(v__loc2_, "id"), v_param1)):
			pass
			return v__loc2_
	return null
	return null

static func f_getRatingById(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v__loc2_ = R.coerce(null, "SaveRating")
	for __t4 in R.iterate((c).fields.get("_ratings"), true):
		v__loc2_ = R.coerce(__t4, "SaveRating")
		if R.truth(R.binary("==", R.get_value(v__loc2_, "id"), v_param1)):
			pass
			return v__loc2_
	return null
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "SaveGroup: ", R.get_value(c, "name")), "  Keys: "), (c).fields.get("_keysArray")), "  Ratings: "), (c).fields.get("_ratingsArray"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "TYPE_SYSTEM", 0, "=")
	R.set_value(c, "TYPE_PRIVATE", 1, "=")
	R.set_value(c, "TYPE_PUBLIC", 2, "=")
	R.set_value(c, "TYPE_MODERATED", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_connection"] = R.coerce(null, "APIConnection")
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_type"] = R.coerce(0, "uint")
	(c).fields["_keysArray"] = R.coerce(null, "Array")
	(c).fields["_ratingsArray"] = R.coerce(null, "Array")
	(c).fields["_keys"] = R.coerce(null, "Object")
	(c).fields["_ratings"] = R.coerce(null, "Object")
	return null
