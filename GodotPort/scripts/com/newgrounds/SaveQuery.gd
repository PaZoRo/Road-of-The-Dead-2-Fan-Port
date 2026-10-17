extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SaveQuery(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveQuery"), [])
	(c).fields["_group"] = R.coerce(v_param1, "SaveGroup")
	(c).fields["_connection"] = R.coerce(R.get_value(v_param1, "connection"), "APIConnection")
	R.call_member(c, "reset", [])
	return null

static func f_get_group(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_group")
	return null

static func f_get_resultsPerPage(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_resultsPerPage")
	return null

static func f_set_resultsPerPage(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_resultsPerPage"] = R.coerce(minf(float(maxf(float(v_param1), float(1))), float(100)), "uint")
	return null

static func f_get_page(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_page")
	return null

static func f_set_page(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_page"] = R.coerce(maxf(float(v_param1), float(1)), "uint")
	return null

static func f_prevPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "page", 1, "-=")
	return null

static func f_nextPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "page", 1, "+=")
	return null

static func f_get_isRandomized(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_isRandomized")
	return null

static func f_set_isRandomized(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_isRandomized"] = v_param1
	return null

static func f_get_files(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_files")
	return null

static func f_reset(c: Variant, a: Array) -> Variant:
	(c).fields["_page"] = R.coerce(1, "uint")
	(c).fields["_resultsPerPage"] = R.coerce(10, "uint")
	(c).fields["_isRandomized"] = false
	(c).fields["_lookupKeys"] = R.coerce([], "Array")
	(c).fields["_lookupRatings"] = R.coerce([], "Array")
	(c).fields["_fileConditions"] = R.coerce([], "Array")
	(c).fields["_keyConditions"] = R.coerce([], "Array")
	(c).fields["_ratingConditions"] = R.coerce([], "Array")
	(c).fields["_sortFields"] = R.coerce([], "Array")
	(c).fields["_files"] = R.coerce([], "Array")
	R.call_member(c, "includeAllFields", [])
	return null

static func f_clone(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveQuery"), [(c).fields.get("_group")]), "SaveQuery")
	(v__loc1_).fields["_page"] = R.coerce((c).fields.get("_page"), "uint")
	(v__loc1_).fields["_resultsPerPage"] = R.coerce((c).fields.get("_resultsPerPage"), "uint")
	(v__loc1_).fields["_isRandomized"] = (c).fields.get("_isRandomized")
	(v__loc1_).fields["_lookupKeys"] = R.coerce(R.invoke(R.get_value((c).fields.get("_lookupKeys"), "concat"), []), "Array")
	(v__loc1_).fields["_lookupRatings"] = R.coerce(R.invoke(R.get_value((c).fields.get("_lookupRatings"), "concat"), []), "Array")
	(v__loc1_).fields["_fileConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_fileConditions"), "concat"), []), "Array")
	(v__loc1_).fields["_keyConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_keyConditions"), "concat"), []), "Array")
	(v__loc1_).fields["_ratingConditions"] = R.coerce(R.invoke(R.get_value((c).fields.get("_ratingConditions"), "concat"), []), "Array")
	return v__loc1_
	return null

static func f_includeAllFields(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc1_ = R.coerce(null, "SaveKey")
	v__loc2_ = R.coerce(null, "SaveRating")
	for __t1 in R.iterate(R.get_value((c).fields.get("_group"), "keys"), true):
		v__loc1_ = R.coerce(__t1, "SaveKey")
		R.invoke(R.get_value((c).fields.get("_lookupKeys"), "push"), [R.get_value(v__loc1_, "id")])
	for __t2 in R.iterate(R.get_value((c).fields.get("_group"), "ratings"), true):
		v__loc2_ = R.coerce(__t2, "SaveRating")
		R.invoke(R.get_value((c).fields.get("_lookupRatings"), "push"), [R.get_value(v__loc2_, "id")])
	return null

static func f_addCondition(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "*")
	v__loc4_ = R.coerce(0, "int")
	v__loc5_ = R.coerce(null, "SaveKey")
	v__loc6_ = R.coerce(null, "Array")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc4_ = R.coerce(R.invoke(R.get_value(R.static_value("com.newgrounds.SaveQuery", "FILE_FIELDS"), "indexOf"), [v_param1]), "int")
	if R.truth((float(v__loc4_) >= float(0))):
		pass
		R.invoke(R.get_value((c).fields.get("_fileConditions"), "push"), [{"field": v__loc4_, "operator": v_param2, "value": v_param3}])
	else:
		pass
		v__loc5_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v_param1]), "SaveKey")
		if R.truth(v__loc5_):
			pass
			v_param3 = R.coerce(R.call_member(v__loc5_, "validateValue", [v_param3]), "*")
			R.invoke(R.get_value((c).fields.get("_keyConditions"), "push"), [{"key_id": R.get_value(v__loc5_, "id"), "operator": v_param2, "value": v_param3}])
			return null
		v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "split"), ["."]), "Array")
		v__loc7_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [R.get_value(v__loc6_, 0)]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			if R.truth(R.binary("!=", R.get_value(v__loc6_, 1), "votes")):
				pass
				v_param3 = R.coerce(R.call_member(v__loc7_, "validateValue", [v_param3]), "*")
			R.invoke(R.get_value((c).fields.get("_ratingConditions"), "push"), [{"rating_id": R.get_value(v__loc7_, "id"), "operator": v_param2, "value": v_param3, "column": (R.get_value(v__loc6_, 1) if R.truth(R.get_value(v__loc6_, 1)) else "score")}])
			return null
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "The save group \"", R.get_value((c).fields.get("_group"), "name")), "\" does not have a field named \""), v_param1), "\".")])
	return null

static func f_sortOn(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v__loc3_ = R.coerce(0, "int")
	v__loc4_ = R.coerce(null, "SaveKey")
	v__loc5_ = R.coerce(null, "Array")
	v__loc6_ = R.coerce(null, "SaveRating")
	v__loc3_ = R.coerce(R.invoke(R.get_value(R.static_value("com.newgrounds.SaveQuery", "FILE_FIELDS"), "indexOf"), [v_param1]), "int")
	if R.truth((float(v__loc3_) >= float(0))):
		pass
		R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_FILES"), "field": v__loc3_, "desc": v_param2}])
	else:
		pass
		v__loc4_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v_param1]), "SaveKey")
		if R.truth(v__loc4_):
			pass
			R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_KEYS"), "field": R.get_value(v__loc4_, "id"), "desc": v_param2}])
			return null
		v__loc5_ = R.coerce(R.invoke(R.get_value(v_param1, "split"), ["."]), "Array")
		v__loc6_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [R.get_value(v__loc5_, 0)]), "SaveRating")
		if R.truth(v__loc6_):
			pass
			R.invoke(R.get_value((c).fields.get("_sortFields"), "push"), [{"table": R.static_value("com.newgrounds.SaveQuery", "TABLE_RATINGS"), "field": R.get_value(v__loc6_, "id"), "desc": v_param2, "extra": (R.get_value(v__loc5_, 1) if R.truth(R.get_value(v__loc5_, 1)) else "score")}])
			return null
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "The save group \"", R.get_value((c).fields.get("_group"), "name")), "\" does not have a field named \""), v_param1), "\".")])
	return null

static func f_execute(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	v__loc1_ = R.coerce({}, "Object")
	R.set_value(v__loc1_, "page", (c).fields.get("_page"), "=")
	R.set_value(v__loc1_, "num_results", (c).fields.get("_resultsPerPage"), "=")
	if R.truth((c).fields.get("_isRandomized")):
		pass
		R.set_value(v__loc1_, "randomize", 1, "=")
	if R.truth((R.truth((c).fields.get("_lookupKeys")) and R.truth(R.get_value((c).fields.get("_lookupKeys"), "length")))):
		pass
		R.set_value(v__loc1_, "lookup_keys", (c).fields.get("_lookupKeys"), "=")
	if R.truth((R.truth((c).fields.get("_lookupRatings")) and R.truth(R.get_value((c).fields.get("_lookupRatings"), "length")))):
		pass
		R.set_value(v__loc1_, "lookup_ratings", (c).fields.get("_lookupRatings"), "=")
	if R.truth((R.truth((c).fields.get("_fileConditions")) and R.truth(R.get_value((c).fields.get("_fileConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "file_conditions", (c).fields.get("_fileConditions"), "=")
	if R.truth((R.truth((c).fields.get("_keyConditions")) and R.truth(R.get_value((c).fields.get("_keyConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "key_conditions", (c).fields.get("_keyConditions"), "=")
	if R.truth((R.truth((c).fields.get("_ratingConditions")) and R.truth(R.get_value((c).fields.get("_ratingConditions"), "length")))):
		pass
		R.set_value(v__loc1_, "rating_conditions", (c).fields.get("_ratingConditions"), "=")
	if R.truth((R.truth((c).fields.get("_sortFields")) and R.truth(R.get_value((c).fields.get("_sortFields"), "length")))):
		pass
		R.set_value(v__loc1_, "sort_conditions", (c).fields.get("_sortFields"), "=")
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["lookupSaveFiles", R.get_value(c, "onQueryComplete"), {"publisher_id": ((c).fields.get("_connection")).fields.get("publisherId"), "group_id": R.get_value((c).fields.get("_group"), "id"), "query": v__loc1_}])
	return null

static func f_onQueryComplete(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Object")
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(null, "SaveFile")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
		(c).fields["_files"] = R.coerce([], "Array")
		if R.truth(R.get_value(v__loc2_, "files")):
			pass
			v__loc3_ = R.coerce(0, "uint")
			while R.truth(R.binary("<", v__loc3_, R.get_value(R.get_value(v__loc2_, "files"), "length"))):
				pass
				v__loc4_ = R.coerce(R.call_static("com.newgrounds.SaveFile", "fromObject", [(c).fields.get("_group"), R.get_value(R.get_value(v__loc2_, "files"), v__loc3_)]), "SaveFile")
				if R.truth(v__loc4_):
					pass
					R.invoke(R.get_value((c).fields.get("_files"), "push"), [v__loc4_])
				v__loc3_ = ((v__loc3_ + 1) & 4294967295)
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), c])])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Query failed: ", R.get_value(v_param1, "error"))])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), c, R.get_value(v_param1, "error")])])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "FILE_ID", "fileId", "=")
	R.set_value(c, "AUTHOR_ID", "authorId", "=")
	R.set_value(c, "AUTHOR_NAME", "authorName", "=")
	R.set_value(c, "FILE_NAME", "fileName", "=")
	R.set_value(c, "CREATED_ON", "createdOn", "=")
	R.set_value(c, "UPDATED_ON", "updatedOn", "=")
	R.set_value(c, "FILE_VIEWS", "fileViews", "=")
	R.set_value(c, "FILE_STATUS", "fileStatus", "=")
	R.set_value(c, "FILE_FIELDS", [R.static_value("com.newgrounds.SaveQuery", "FILE_ID"), R.static_value("com.newgrounds.SaveQuery", "AUTHOR_ID"), R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), R.static_value("com.newgrounds.SaveQuery", "FILE_NAME"), R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), R.static_value("com.newgrounds.SaveQuery", "UPDATED_ON"), R.static_value("com.newgrounds.SaveQuery", "FILE_VIEWS"), R.static_value("com.newgrounds.SaveQuery", "FILE_STATUS")], "=")
	R.set_value(c, "OPERATOR_EQUAL", "=", "=")
	R.set_value(c, "OPERATOR_LESS_THAN", "<", "=")
	R.set_value(c, "OPERATOR_GREATER_THAN", ">", "=")
	R.set_value(c, "OPERATOR_NOT_EQUAL", "!=", "=")
	R.set_value(c, "OPERATOR_LESS_OR_EQUAL", "<=", "=")
	R.set_value(c, "OPERATOR_GREATER_OR_EQUAL", ">=", "=")
	R.set_value(c, "OPERATOR_CONTAINS", "*", "=")
	R.set_value(c, "OPERATOR_NOT_CONTAINS", "!*", "=")
	R.set_value(c, "OPERATOR_NOT_BEGINS_WITH", "!*=", "=")
	R.set_value(c, "OPERATOR_NOT_ENDS_WITH", "!=*", "=")
	R.set_value(c, "OPERATOR_BEGINS_WITH", "*=", "=")
	R.set_value(c, "OPERATOR_ENDS_WITH", "=*", "=")
	R.set_value(c, "TABLE_FILES", 1, "=")
	R.set_value(c, "TABLE_KEYS", 2, "=")
	R.set_value(c, "TABLE_RATINGS", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_connection"] = R.coerce(null, "APIConnection")
	(c).fields["_group"] = R.coerce(null, "SaveGroup")
	(c).fields["_page"] = R.coerce(1, "uint")
	(c).fields["_resultsPerPage"] = R.coerce(10, "uint")
	(c).fields["_isRandomized"] = false
	(c).fields["_files"] = R.coerce(null, "Array")
	(c).fields["_totalResults"] = R.coerce(0, "uint")
	(c).fields["_lookupKeys"] = R.coerce(null, "Array")
	(c).fields["_lookupRatings"] = R.coerce(null, "Array")
	(c).fields["_fileConditions"] = R.coerce(null, "Array")
	(c).fields["_keyConditions"] = R.coerce(null, "Array")
	(c).fields["_ratingConditions"] = R.coerce(null, "Array")
	(c).fields["_sortFields"] = R.coerce(null, "Array")
	return null
