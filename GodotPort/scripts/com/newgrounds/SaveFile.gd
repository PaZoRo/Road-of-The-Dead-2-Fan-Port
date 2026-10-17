extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SaveFile(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	R.invoke(R.super_ref(c, "com.newgrounds.SaveFile"), [])
	(c).fields["_iconLoader"] = R.coerce(R.construct(R.klass("com.newgrounds.BitmapLoader"), [R.static_value("com.newgrounds.SaveFile", "DEFAULT_ICON"), null]), "BitmapLoader")
	(c).fields["_group"] = R.coerce(v_param1, "SaveGroup")
	(c).fields["_keys"] = R.coerce({}, "Object")
	(c).fields["_ratings"] = R.coerce({}, "Object")
	(c).fields["_numVotes"] = R.coerce({}, "Object")
	return null

static func f_get_currentFile(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.SaveFile", "_currentFile")
	return null

static func f_fromObject(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "SaveGroup")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v__loc4_ = R.coerce(null, "Object")
	v__loc5_ = R.coerce(null, "Object")
	v__loc6_ = R.coerce(null, "SaveKey")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc3_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveFile"), [v_param1]), "SaveFile")
	(v__loc3_).fields["_name"] = R.coerce(R.get_value(v_param2, "filename"), "String")
	(v__loc3_).fields["_description"] = R.coerce(R.get_value(v_param2, "description"), "String")
	(v__loc3_).fields["_id"] = R.coerce(R.get_value(v_param2, "save_id"), "uint")
	(v__loc3_).fields["_authorId"] = R.coerce(R.get_value(v_param2, "user_id"), "uint")
	(v__loc3_).fields["_authorName"] = R.coerce(R.get_value(v_param2, "user_name"), "String")
	(v__loc3_).fields["_createdDate"] = R.coerce(R.get_value(v_param2, "created"), "String")
	(v__loc3_).fields["_modifiedDate"] = R.coerce(R.get_value(v_param2, "last_update"), "String")
	(v__loc3_).fields["_views"] = R.coerce(R.get_value(v_param2, "views"), "uint")
	if R.truth((R.truth(R.get_value(v_param2, "thumb")) and R.binary("!=", R.get_value(v_param2, "thumb"), ""))):
		pass
		R.set_value((v__loc3_).fields.get("_iconLoader"), "url", R.binary("+", R.static_value("com.newgrounds.SaveFile", "_imageFilePath"), R.get_value(v_param2, "thumb")), "=")
	(v__loc3_).fields["_dataURL"] = R.coerce(R.binary("+", R.static_value("com.newgrounds.SaveFile", "_saveFilePath"), R.get_value(v_param2, "file")), "String")
	(v__loc3_).fields["_fileSize"] = R.coerce(R.get_value(v_param2, "file_size"), "uint")
	(v__loc3_).fields["_approved"] = R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_UNAPPROVED"))
	(v__loc3_).fields["_readOnly"] = false
	(v__loc3_).fields["_public"] = (R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_PRIVATE")) and R.binary("!=", R.get_value(v_param2, "status"), R.static_value("com.newgrounds.SaveFile", "STATUS_UNAPPROVED")))
	for __t1 in R.iterate(R.get_value(v_param2, "keys"), true):
		v__loc4_ = R.coerce(__t1, "Object")
		v__loc6_ = R.coerce(R.call_member(v_param1, "getKeyById", [R.get_value(v__loc4_, "id")]), "SaveKey")
		if R.truth(v__loc6_):
			pass
			R.set_value((v__loc3_).fields.get("_keys"), R.get_value(v__loc6_, "name"), R.call_member(v__loc6_, "validateValue", [R.get_value(v__loc4_, "value")]), "=")
	for __t2 in R.iterate(R.get_value(v_param2, "ratings"), true):
		v__loc5_ = R.coerce(__t2, "Object")
		v__loc7_ = R.coerce(R.call_member(v_param1, "getRatingById", [R.get_value(v__loc5_, "id")]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			R.set_value((v__loc3_).fields.get("_ratings"), R.get_value(v__loc7_, "name"), R.call_member(v__loc7_, "validateValue", [R.get_value(v__loc5_, "score")]), "=")
			R.set_value((v__loc3_).fields.get("_numVotes"), R.get_value(v__loc7_, "name"), R.coerce(R.get_value(v__loc5_, "votes"), "int"), "=")
	return v__loc3_
	return null

static func f_get_group(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_group")
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_set_name(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_name"] = R.coerce(v_param1, "String")
	return null

static func f_get_description(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_description")
	return null

static func f_set_description(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_description"] = R.coerce(v_param1, "String")
	return null

static func f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null

static func f_get_data(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_data")
	return null

static func f_set_data(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	(c).fields["_data"] = R.coerce(v_param1, "*")
	return null

static func f_get_bytesLoaded(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_data")):
		pass
		return R.get_value(c, "bytesTotal")
	if R.truth(R.unary("!", (c).fields.get("_dataLoader"))):
		pass
		return 0
	return R.get_value((c).fields.get("_dataLoader"), "bytesLoaded")
	return null

static func f_get_bytesTotal(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_fileSize")
	return null

static func f_get_readOnly(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_readOnly")
	return null

static func f_get_draft(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_draft")
	return null

static func f_set_draft(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_draft"] = v_param1
	return null

static func f_get_authorId(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_authorId")
	return null

static func f_get_authorName(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_authorName")
	return null

static func f_get_keys(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_keys")
	return null

static func f_get_ratings(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_ratings")
	return null

static func f_get_numVotes(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numVotes")
	return null

static func f_get_views(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_views")
	return null

static func f_get_createdDate(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_createdDate")
	return null

static func f_get_updatedDate(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_modifiedDate")
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", "Save File: ", (c).fields.get("_name"))
	return null

static func f_get_icon(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "bitmapData")
	return null

static func f_set_icon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	R.call_member(c, "createIcon", [v_param1])
	return null

static func f_get_iconLoaded(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "loaded")
	return null

static func f_createIcon(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = NAN
	var v__loc4_: Variant = NAN
	var v__loc8_: Variant = NAN
	var v__loc9_: Variant = null
	var v__loc2_: Variant = null
	var v__loc5_: Variant = NAN
	var v__loc6_: Variant = NAN
	var v__loc7_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "IBitmapDrawable")
	v__loc3_ = float(NAN)
	v__loc4_ = float(NAN)
	v__loc8_ = float(NAN)
	v__loc9_ = R.coerce(null, "Rectangle")
	v__loc2_ = R.coerce(R.construct(R.klass("BitmapData"), [R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH"), R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT"), false, 0]), "BitmapData")
	v__loc5_ = float(0)
	v__loc6_ = float(0)
	if R.truth(R.binary("is", v_param1, R.klass("BitmapData"))):
		pass
		v__loc3_ = R.coerce(R.get_value(R.invoke(R.klass("BitmapData"), [v_param1]), "width"), "Number")
		v__loc4_ = R.coerce(R.get_value(R.invoke(R.klass("BitmapData"), [v_param1]), "height"), "Number")
	else:
		pass
		if R.truth(R.binary("is", v_param1, R.resolve(c, "DisplayObject", "com.newgrounds.SaveFile"))):
			pass
			v__loc9_ = R.coerce(R.invoke(R.get_value(R.invoke(R.resolve(c, "DisplayObject", "com.newgrounds.SaveFile"), [v_param1]), "getBounds"), [null]), "Rectangle")
			v__loc5_ = R.coerce(R.get_value(v__loc9_, "left"), "Number")
			v__loc6_ = R.coerce(R.get_value(v__loc9_, "top"), "Number")
			v__loc3_ = R.coerce(R.get_value(v__loc9_, "width"), "Number")
			v__loc4_ = R.coerce(R.get_value(v__loc9_, "height"), "Number")
	v__loc7_ = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
	v__loc8_ = float(minf(float(R.binary("/", R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH"), v__loc3_)), float(R.binary("/", R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT"), v__loc4_))))
	R.invoke(R.get_value(v__loc7_, "translate"), [R.unary("-", v__loc5_), R.unary("-", v__loc6_)])
	R.invoke(R.get_value(v__loc7_, "scale"), [v__loc8_, v__loc8_])
	R.invoke(R.get_value(v__loc7_, "translate"), [R.binary("/", (float(R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH")) - float((float(v__loc3_) * float(v__loc8_)))), 2), R.binary("/", (float(R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT")) - float((float(v__loc4_) * float(v__loc8_)))), 2)])
	R.invoke(R.get_value(v__loc2_, "draw"), [v_param1, v__loc7_])
	R.set_value((c).fields.get("_iconLoader"), "bitmapData", v__loc2_, "=")
	return null

static func f_attachIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	if R.truth((c).fields.get("_iconLoader")):
		pass
		return R.call_member((c).fields.get("_iconLoader"), "attachBitmap", [v_param1])
	R.call_static("com.newgrounds.Logger", "logError", ["No icon available for this sumbission."])
	return null
	return null

static func f_deleteFile(c: Variant, a: Array) -> Variant:
	var v__loc1_: Variant = null
	if R.truth(R.unary("!", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "hasUserSession"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The user must be logged-in to delete a file."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	if R.truth(R.unary("!", (c).fields.get("_id"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The file does not exist."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), ["deleteSaveFile"]), "APICommand")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "save_id", (c).fields.get("_id"), "=")
	R.call_member(v__loc1_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), R.get_value(c, "onFileDeleted")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendCommand"), [v__loc1_])
	return null

static func f_save(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "hasUserSession"))):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["The user must be logged-in to save a file."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_NOT_LOGGED_IN")])])
		return null
	R.set_value(R.klass("com.newgrounds.BitmapLoader"), "_cacheSeed", 1, "+=")
	R.assign(c, "_currentFile", "com.newgrounds.SaveFile", c, "=")
	R.call_member(c, "encodeData", [true])
	return null

static func f_doSave(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v__loc6_: Variant = null
	var v__loc7_: Variant = null
	var v__loc8_: Variant = null
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	v__loc3_ = R.coerce(null, "String")
	v__loc4_ = R.coerce(null, "Array")
	v__loc5_ = R.coerce(null, "String")
	v__loc6_ = R.coerce(null, "SaveKey")
	v__loc7_ = R.coerce(null, "SaveRating")
	v__loc8_ = R.coerce(null, "ByteArray")
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.APICommand"), ["saveFile"]), "APICommand")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "group", R.get_value((c).fields.get("_group"), "id"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "user_name", R.get_value(R.get_value((c).fields.get("_group"), "connection"), "username"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "filename", (c).fields.get("_name"), "=")
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "description", (c).fields.get("_description"), "=")
	if R.truth((c).fields.get("_draft")):
		pass
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "draft", true, "=")
	if R.truth((R.truth((c).fields.get("_id")) and R.unary("!", (c).fields.get("_readOnly")))):
		pass
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "overwrite", 1, "=")
		R.set_value(R.get_value(v__loc1_, "secureParameters"), "save_id", (c).fields.get("_id"), "=")
	v__loc2_ = R.coerce([], "Array")
	for __t3 in R.iterate((c).fields.get("_keys"), false):
		v__loc3_ = R.coerce(__t3, "String")
		v__loc6_ = R.coerce(R.call_member((c).fields.get("_group"), "getKey", [v__loc3_]), "SaveKey")
		if R.truth(v__loc6_):
			pass
			R.invoke(R.get_value(v__loc2_, "push"), [{"id": R.get_value(v__loc6_, "id"), "value": R.call_member(v__loc6_, "validateValue", [R.get_value((c).fields.get("_keys"), v__loc3_)])}])
		else:
			pass
			R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "No key named \"", v__loc3_), "\" in save group \""), R.get_value((c).fields.get("_group"), "name")), "\".")])
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "keys", v__loc2_, "=")
	v__loc4_ = R.coerce([], "Array")
	for __t4 in R.iterate((c).fields.get("_ratings"), false):
		v__loc5_ = R.coerce(__t4, "String")
		v__loc7_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [v__loc5_]), "SaveRating")
		if R.truth(v__loc7_):
			pass
			R.invoke(R.get_value(v__loc4_, "push"), [{"id": R.get_value(v__loc7_, "id"), "value": R.call_member(v__loc7_, "validateValue", [R.get_value((c).fields.get("_ratings"), v__loc5_)])}])
		else:
			pass
			R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", "No rating named \"", v__loc5_), "\" in save group \""), R.get_value((c).fields.get("_group"), "name")), "\".")])
	R.set_value(R.get_value(v__loc1_, "secureParameters"), "ratings", v__loc4_, "=")
	v__loc8_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc8_, "writeObject"), [(c).fields.get("_encodedData")])
	R.invoke(R.get_value(v__loc8_, "compress"), [])
	R.call_member(v__loc1_, "addFile", ["file", v__loc8_, "file"])
	if R.truth(R.get_value(c, "iconLoaded")):
		pass
		R.call_member(v__loc1_, "addFile", ["thumbnail", R.call_static("com.newgrounds.encoders.PNGEncoder", "encode", [R.get_value(c, "icon")]), "thumbnail"])
	R.call_member(v__loc1_, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "COMMAND_COMPLETE"), R.get_value(c, "onSaveComplete")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendCommand"), [v__loc1_])
	return null

static func f_encodeData(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_encoderQueue"] = R.coerce([], "Array")
	(c).fields["_encoding"] = v_param1
	if R.truth(v_param1):
		pass
		(c).fields["_encodedData"] = R.coerce((c).fields.get("_data"), "*")
		R.call_member(c, "preEncodeObject", [c, "_encodedData"])
	else:
		pass
		R.call_member(c, "preEncodeObject", [c, "_data"])
	R.call_member(c, "encodeObject", [])
	return null

static func f_preEncodeObject(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"_loc4_": "Boolean", "_loc6_": "Boolean", "_loc7_": "String", "_loc3_": "Object", "error": "*", "_loc5_": "Object", "param1": "Object", "param2": "String"}
	l["_loc4_"] = false
	l["_loc6_"] = false
	l["_loc7_"] = null
	l["_loc3_"] = null
	l["error"] = null
	l["_loc5_"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["param2"] = R.coerce((a[1] if a.size() > 1 else null), "String")
	R.lset(l, "_loc4_", false)
	R.lset(l, "_loc6_", false)
	R.lset(l, "_loc7_", null)
	R.lset(l, "_loc3_", R.get_value(R.lget(l, "param1"), R.lget(l, "param2")))
	R.last_error = null
	if R.truth((c).fields.get("_encoding")):
		pass
		R.lset(l, "_loc4_", R.binary("is", R.lget(l, "_loc3_"), R.klass("BitmapData")), "=")
	else:
		pass
		R.lset(l, "_loc4_", R.binary("==", R.get_value(R.lget(l, "_loc3_"), "type"), "__bitmap"), "=")
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		pass
	R.lset(l, "_loc5_", R.lget(l, "_loc3_"))
	R.lset(l, "_loc6_", R.binary("is", R.lget(l, "_loc3_"), R.klass("ByteArray")), "=")
	if R.truth(R.lget(l, "_loc4_")):
		pass
		R.invoke(R.get_value((c).fields.get("_encoderQueue"), "push"), [{"parent": R.lget(l, "param1"), "property": R.lget(l, "param2")}])
	else:
		pass
		if R.truth((R.binary("==", R.unary("typeof", R.lget(l, "_loc3_")), "object") and R.unary("!", R.lget(l, "_loc6_")))):
			pass
			if R.truth((c).fields.get("_encoding")):
				pass
				if R.truth(R.binary("is", R.lget(l, "_loc3_"), R.klass("Array"))):
					pass
					R.lset(l, "_loc5_", [], "=")
				else:
					pass
					R.lset(l, "_loc5_", {}, "=")
				for __t5 in R.iterate(R.lget(l, "_loc3_"), false):
					R.lset(l, "_loc7_", __t5, "=")
					R.set_value(R.lget(l, "_loc5_"), R.lget(l, "_loc7_"), R.get_value(R.lget(l, "_loc3_"), R.lget(l, "_loc7_")), "=")
				R.set_value(R.lget(l, "param1"), R.lget(l, "param2"), R.lget(l, "_loc5_"), "=")
			for __t6 in R.iterate(R.lget(l, "_loc5_"), false):
				R.lset(l, "_loc7_", __t6, "=")
				R.call_member(c, "preEncodeObject", [R.lget(l, "_loc5_"), R.lget(l, "_loc7_")])
	return null

static func f_encodeObject(c: Variant, a: Array) -> Variant:
	var v__loc5_: Variant = null
	var v__loc1_: Variant = null
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	v__loc5_ = R.coerce(null, "Object")
	if R.truth(R.unary("!", R.get_value((c).fields.get("_encoderQueue"), "length"))):
		pass
		if R.truth((c).fields.get("_encoding")):
			pass
			R.call_member(c, "doSave", [])
		else:
			pass
			(c).fields["_dataLoaded"] = true
			R.call_member(c, "checkLoadComplete", [])
		return null
	v__loc1_ = R.coerce(R.invoke(R.get_value((c).fields.get("_encoderQueue"), "pop"), []), "Object")
	v__loc2_ = R.coerce(R.get_value(v__loc1_, "parent"), "Object")
	v__loc3_ = R.coerce(R.get_value(v__loc1_, "property"), "String")
	v__loc4_ = R.coerce(R.get_value(v__loc2_, v__loc3_), "Object")
	if R.truth((c).fields.get("_encoding")):
		pass
		v__loc5_ = R.coerce({"type": "__bitmap", "width": R.get_value(v__loc4_, "width"), "height": R.get_value(v__loc4_, "height"), "transparent": R.get_value(v__loc4_, "transparent")}, "Object")
		R.set_value(v__loc2_, v__loc3_, v__loc5_, "=")
		R.set_value(v__loc5_, "data", R.construct(R.klass("ByteArray"), []), "=")
		R.invoke(R.get_value(R.get_value(v__loc5_, "data"), "writeBytes"), [R.invoke(R.get_value(v__loc4_, "getPixels"), [R.get_value(v__loc4_, "rect")])])
		R.set_value(R.get_value(v__loc5_, "data"), "position", 0, "=")
	else:
		pass
		v__loc5_ = R.coerce(R.construct(R.klass("BitmapData"), [R.get_value(v__loc4_, "width"), R.get_value(v__loc4_, "height"), R.get_value(v__loc4_, "transparent")]), "Object")
		R.invoke(R.get_value(v__loc5_, "setPixels"), [R.get_value(v__loc5_, "rect"), R.get_value(v__loc4_, "data")])
		R.set_value(v__loc2_, v__loc3_, v__loc5_, "=")
	R.call_member(c, "encodeObject", [])
	return null

static func f_onIconLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth((R.unary("!", R.get_value(v_param1, "success")) and R.truth(R.get_value((c).fields.get("_iconLoader"), "url")))):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", ["Unable to load the icon for this save file."])
	R.call_member((c).fields.get("_iconLoader"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "ICON_LOADED"), R.get_value(c, "onIconLoaded")])
	R.call_member(c, "checkLoadComplete", [])
	return null

static func f_checkLoadComplete(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and((c).fields.get("_dataLoaded"), func(): return R.get_value(c, "iconLoaded"))):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["Data loaded."])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c])])
	return null

static func f_onDataLoaded(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"byteArray": "ByteArray", "data": "*", "error": "Error", "param1": "*"}
	l["byteArray"] = null
	l["data"] = null
	l["error"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.lset(l, "byteArray", null)
	R.lset(l, "data", R.lget(l, "param1"))
	R.last_error = null
	if R.truth(R.lget(l, "data")):
		pass
		R.lset(l, "byteArray", R.lget(l, "data"), "=")
		R.invoke(R.get_value(R.lget(l, "byteArray"), "uncompress"), [])
		(c).fields["_data"] = R.coerce(R.invoke(R.get_value(R.lget(l, "byteArray"), "readObject"), []), "*")
		R.call_member(c, "encodeData", [false])
	if R.last_error != null:
		R.lset(l, "error", R.last_error)
		R.last_error = null
		R.call_static("com.newgrounds.Logger", "logError", ["Error while loading data:", R.lget(l, "error")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c, R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_FILE")])])
	return null

static func f_onDataError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_static("com.newgrounds.Logger", "logError", ["Unable to load data:", v_param1])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), c, R.static_value("com.newgrounds.APIEvent", "ERROR_BAD_FILE")])])
	return null

static func f_onSaveComplete(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "File \"", (c).fields.get("_name")), "\" saved!")])
		if R.truth(R.get_value(v_param1, "data")):
			pass
			(c).fields["_id"] = R.coerce(R.get_value(R.get_value(v_param1, "data"), "save_id"), "uint")
			(c).fields["_dataURL"] = R.coerce(R.invoke(R.resolve(c, "unescape", "com.newgrounds.SaveFile"), [R.get_value(R.get_value(v_param1, "data"), "file_url")]), "String")
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), c])])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Error saving file \"", (c).fields.get("_name")), "\":"), R.get_value(v_param1, "error")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), c, R.get_value(v_param1, "error")])])
	return null

static func f_sendVote(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v__loc3_ = R.coerce(R.call_member((c).fields.get("_group"), "getRating", [v_param1]), "SaveRating")
	if R.truth(R.unary("!", v__loc3_)):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "No save rating named \"", v_param1), "\" exists for this save group.")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), {}, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	v_param2 = R.coerce(R.call_member(v__loc3_, "validateValue", [v_param2]), "Number")
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.SaveFile"), [v_param2])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Invalid vote (", v_param2), "). "), v_param1), " allows a range of "), R.get_value(v__loc3_, "minimum")), "-"), R.get_value(v__loc3_, "maximum")), ".")])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), {}, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Voting ", v_param2), " for "), v_param1), " on "), (c).fields.get("_name")), "...")])
	R.invoke(R.get_value(R.get_value((c).fields.get("_group"), "connection"), "sendSimpleCommand"), ["rateSaveFile", R.get_value(c, "onVoteComplete"), null, {"group": R.get_value((c).fields.get("_group"), "id"), "save_id": (c).fields.get("_id"), "rating_id": R.get_value(v__loc3_, "id"), "vote": v_param2}])
	return null

static func f_onVoteComplete(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc3_ = R.coerce(null, "SaveRating")
	v__loc2_ = R.coerce(R.get_value(v_param1, "error"), "String")
	if R.truth(R.get_value(R.get_value(v_param1, "data"), "already_voted")):
		pass
		R.call_static("com.newgrounds.Logger", "logError", ["Vote failed. You've already voted on this rating today."])
		v__loc2_ = R.coerce(R.static_value("com.newgrounds.APIEvent", "ERROR_ALREADY_VOTED"), "String")
	if R.truth(R.binary("==", v__loc2_, R.static_value("com.newgrounds.APIEvent", "ERROR_NONE"))):
		pass
		v__loc3_ = R.coerce(R.call_member((c).fields.get("_group"), "getRatingById", [R.get_value(R.get_value(v_param1, "data"), "rating_id")]), "SaveRating")
		if R.truth(v__loc3_):
			pass
			R.set_value((c).fields.get("_ratings"), R.get_value(v__loc3_, "name"), R.call_member(v__loc3_, "validateValue", [R.get_value(R.get_value(v_param1, "data"), "score")]), "=")
		R.call_static("com.newgrounds.Logger", "logMessage", ["Vote complete!"])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), c, v__loc2_])])
	return null

static func f_onFileDeleted(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		(c).fields["_id"] = R.coerce(0, "uint")
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), c, R.get_value(v_param1, "error")])])
	return null

static func f_clone(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc1_: Variant = null
	v__loc2_ = R.coerce(null, "String")
	v__loc1_ = R.coerce(R.construct(R.klass("com.newgrounds.SaveFile"), [(c).fields.get("_group")]), "SaveFile")
	(v__loc1_).fields["_data"] = R.coerce((c).fields.get("_data"), "*")
	(v__loc1_).fields["_description"] = R.coerce((c).fields.get("_description"), "String")
	(v__loc1_).fields["_draft"] = (c).fields.get("_draft")
	(v__loc1_).fields["_fileSize"] = R.coerce((c).fields.get("_fileSize"), "uint")
	R.set_value((v__loc1_).fields.get("_iconLoader"), "bitmapData", R.get_value((c).fields.get("_iconLoader"), "bitmapData"), "=")
	for __t7 in R.iterate((c).fields.get("_keys"), false):
		v__loc2_ = R.coerce(__t7, "String")
		R.set_value((v__loc1_).fields.get("_keys"), v__loc2_, R.get_value((c).fields.get("_keys"), v__loc2_), "=")
	for __t8 in R.iterate((c).fields.get("_ratings"), false):
		v__loc2_ = R.coerce(__t8, "String")
		R.set_value((v__loc1_).fields.get("_ratings"), v__loc2_, R.get_value((c).fields.get("_ratings"), v__loc2_), "=")
	for __t9 in R.iterate((c).fields.get("_numVotes"), false):
		v__loc2_ = R.coerce(__t9, "String")
		R.set_value((v__loc1_).fields.get("_numVotes"), v__loc2_, R.get_value((c).fields.get("_numVotes"), v__loc2_), "=")
	(v__loc1_).fields["_name"] = R.coerce((c).fields.get("_name"), "String")
	return v__loc1_
	return null

static func f_load(c: Variant, a: Array) -> Variant:
	R.assign(c, "_currentFile", "com.newgrounds.SaveFile", c, "=")
	(c).fields["_dataLoaded"] = false
	(c).fields["_data"] = R.coerce(null, "*")
	if R.truth(R.unary("!", R.get_value(c, "iconLoaded"))):
		pass
		R.call_member((c).fields.get("_iconLoader"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "ICON_LOADED"), R.get_value(c, "onIconLoaded")])
		R.call_member((c).fields.get("_iconLoader"), "load", [])
	(c).fields["_dataLoader"] = R.coerce(R.construct(R.resolve(c, "URLLoader", "com.newgrounds.SaveFile"), []), "URLLoader")
	R.set_value((c).fields.get("_dataLoader"), "dataFormat", R.get_value(R.resolve(c, "URLLoaderDataFormat", "com.newgrounds.SaveFile"), "BINARY"), "=")
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.klass("Event"), "COMPLETE"), R.get_value(c, "as3DataLoaded")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.resolve(c, "IOErrorEvent", "com.newgrounds.SaveFile"), "IO_ERROR"), R.get_value(c, "as3DataError")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "addEventListener"), [R.get_value(R.resolve(c, "SecurityErrorEvent", "com.newgrounds.SaveFile"), "SECURITY_ERROR"), R.get_value(c, "as3DataError")])
	R.invoke(R.get_value((c).fields.get("_dataLoader"), "load"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.SaveFile"), [R.binary("+", R.binary("+", (c).fields.get("_dataURL"), "&random="), randf())])])
	return null

static func f_as3DataLoaded(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onDataLoaded", [R.get_value((c).fields.get("_dataLoader"), "data")])
	return null

static func f_as3DataError(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "onDataError", [R.invoke(R.get_value(v_param1, "toString"), [])])
	return null

static func f_decodeObject(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v__loc2_ = R.coerce(null, "BitmapData")
	v__loc3_ = R.coerce(null, "String")
	if R.truth(R.binary("==", R.invoke(R.resolve(c, "getQualifiedClassName", "com.newgrounds.SaveFile"), [v_param1]), "Object")):
		pass
		if R.truth(R.binary("==", R.get_value(v_param1, "type"), "__bitmap")):
			pass
			v__loc2_ = R.coerce(R.construct(R.klass("BitmapData"), [R.get_value(v_param1, "width"), R.get_value(v_param1, "height"), R.get_value(v_param1, "transparent")]), "BitmapData")
			R.invoke(R.get_value(v__loc2_, "setPixels"), [R.get_value(v__loc2_, "rect"), R.get_value(v_param1, "data")])
			v_param1 = R.coerce(v__loc2_, "Object")
		else:
			pass
			for __t10 in R.iterate(v_param1, false):
				v__loc3_ = R.coerce(__t10, "String")
				R.set_value(v_param1, v__loc3_, R.call_member(c, "decodeObject", [R.get_value(v_param1, v__loc3_)]), "=")
	return v_param1
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_currentFile", null, "=")
	R.set_value(c, "ICON_WIDTH", 90, "=")
	R.set_value(c, "ICON_HEIGHT", 90, "=")
	R.set_value(c, "DEFAULT_ICON", R.construct(R.klass("BitmapData"), [R.static_value("com.newgrounds.SaveFile", "ICON_WIDTH"), R.static_value("com.newgrounds.SaveFile", "ICON_HEIGHT"), false, 0]), "=")
	R.set_value(c, "STATUS_PRIVATE", 0, "=")
	R.set_value(c, "STATUS_SHARED", 1, "=")
	R.set_value(c, "STATUS_UNAPPROVED", 2, "=")
	R.set_value(c, "STATUS_APPROVED", 3, "=")
	R.set_value(c, "_imageFilePath", "", "=")
	R.set_value(c, "_saveFilePath", "", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_group"] = R.coerce(null, "SaveGroup")
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_description"] = R.coerce(null, "String")
	(c).fields["_authorId"] = R.coerce(0, "uint")
	(c).fields["_authorName"] = R.coerce(null, "String")
	(c).fields["_createdDate"] = R.coerce(null, "String")
	(c).fields["_modifiedDate"] = R.coerce(null, "String")
	(c).fields["_views"] = R.coerce(0, "uint")
	(c).fields["_readOnly"] = false
	(c).fields["_public"] = false
	(c).fields["_approved"] = false
	(c).fields["_draft"] = false
	(c).fields["_iconLoader"] = R.coerce(null, "BitmapLoader")
	(c).fields["_keys"] = R.coerce(null, "Object")
	(c).fields["_ratings"] = R.coerce(null, "Object")
	(c).fields["_numVotes"] = R.coerce(null, "Object")
	(c).fields["_dataURL"] = R.coerce(null, "String")
	(c).fields["_data"] = R.coerce(null, "*")
	(c).fields["_dataLoaded"] = false
	(c).fields["_encodedData"] = R.coerce(null, "*")
	(c).fields["_encoderQueue"] = R.coerce(null, "Array")
	(c).fields["_encoding"] = false
	(c).fields["_encodingParent"] = R.coerce(null, "Object")
	(c).fields["_encodingProperty"] = R.coerce(null, "String")
	(c).fields["_fileSize"] = R.coerce(0, "uint")
	(c).fields["_dataLoader"] = R.coerce(null, "URLLoader")
	return null
