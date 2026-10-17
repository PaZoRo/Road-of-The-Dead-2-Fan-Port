extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_initDecodeJson(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "parseStringEscaped": "Function", "position": "uint", "byteInput": "ByteArray", "char": "uint", "charConvert": "ByteArray", "isNumberChar": "ByteArray", "stringHelper": "ByteArray", "isWhitespace": "ByteArray", "parseNumber": "Function", "parseWhitespace": "Function", "parse": "Object"}
	l["i"] = 0
	l["parseStringEscaped"] = null
	l["position"] = 0
	l["byteInput"] = null
	l["char"] = 0
	l["charConvert"] = null
	l["isNumberChar"] = null
	l["stringHelper"] = null
	l["isWhitespace"] = null
	l["parseNumber"] = null
	l["parseWhitespace"] = null
	l["parse"] = null
	R.lset(l, "position", 0)
	R.lset(l, "byteInput", null)
	R.lset(l, "char", 0)
	R.lset(l, "charConvert", null)
	R.lset(l, "isNumberChar", null)
	R.lset(l, "stringHelper", null)
	R.lset(l, "isWhitespace", null)
	R.lset(l, "parseNumber", null)
	R.lset(l, "parseWhitespace", null)
	R.lset(l, "parse", null)
	R.lset(l, "charConvert", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "charConvert"), "length", 256, "=")
	R.set_value(R.lget(l, "charConvert"), 34, 34, "=")
	R.set_value(R.lget(l, "charConvert"), 92, 92, "=")
	R.set_value(R.lget(l, "charConvert"), 47, 47, "=")
	R.set_value(R.lget(l, "charConvert"), 98, 8, "=")
	R.set_value(R.lget(l, "charConvert"), 102, 12, "=")
	R.set_value(R.lget(l, "charConvert"), 110, 10, "=")
	R.set_value(R.lget(l, "charConvert"), 114, 13, "=")
	R.set_value(R.lget(l, "charConvert"), 116, 9, "=")
	R.lset(l, "isNumberChar", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "isNumberChar"), "length", 256, "=")
	R.set_value(R.lget(l, "isNumberChar"), 43, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 45, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 46, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 48, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 49, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 50, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 51, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 52, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 53, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 54, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 55, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 56, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 57, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 69, 1, "=")
	R.set_value(R.lget(l, "isNumberChar"), 101, 1, "=")
	R.lset(l, "stringHelper", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "stringHelper"), "length", 256, "=")
	R.lset(l, "i", 0, "=")
	while R.truth((float(R.lget(l, "i")) < float(256))):
		pass
		R.set_value(R.lget(l, "stringHelper"), R.binary("-", R.lset(l, "i", 1, "+="), 1), 1, "=")
	R.set_value(R.lget(l, "stringHelper"), 34, 0, "=")
	R.set_value(R.lget(l, "stringHelper"), 92, 0, "=")
	R.lset(l, "isWhitespace", R.construct(R.klass("ByteArray"), []), "=")
	R.set_value(R.lget(l, "isWhitespace"), "length", 256, "=")
	R.set_value(R.lget(l, "isWhitespace"), 9, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 10, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 13, 1, "=")
	R.set_value(R.lget(l, "isWhitespace"), 32, 1, "=")
	R.lset(l, "parseNumber", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t1", c, l), "=")
	R.lset(l, "parseWhitespace", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t2", c, l), "=")
	R.lset(l, "parseStringEscaped", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t3", c, l), "=")
	R.lset(l, "parse", R.object_value([["34", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t4", c, l)], ["123", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t5", c, l)], ["91", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t7", c, l)], ["116", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t9", c, l)], ["102", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t10", c, l)], ["110", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t11", c, l)], ["110", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t12", c, l)], ["125", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t13", c, l)], ["44", R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t14", c, l)], ["45", R.lget(l, "parseNumber")], ["48", R.lget(l, "parseNumber")], ["49", R.lget(l, "parseNumber")], ["50", R.lget(l, "parseNumber")], ["51", R.lget(l, "parseNumber")], ["52", R.lget(l, "parseNumber")], ["53", R.lget(l, "parseNumber")], ["54", R.lget(l, "parseNumber")], ["55", R.lget(l, "parseNumber")], ["56", R.lget(l, "parseNumber")], ["57", R.lget(l, "parseNumber")], ["13", R.lget(l, "parseWhitespace")], ["10", R.lget(l, "parseWhitespace")], ["9", R.lget(l, "parseWhitespace")], ["32", R.lget(l, "parseWhitespace")]]), "=")
	return R.make_closure("com.newgrounds.encoders.json.decodeJson", "closure___t15", c, l)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(R.binary("===", R.lget(l, "position"), 1)):
		pass
		R.set_value(R.lget(l, "byteInput"), "position", 0, "=")
		return R.invoke(R.resolve(c, "parseFloat", "com.newgrounds.encoders.json.decodeJson"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteInput"), "length")])])
	R.set_value(R.lget(l, "byteInput"), "position", (R.num(R.lget(l, "position")) - float(1)), "=")
	while R.truth(R.get_value(R.lget(l, "isNumberChar"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
		pass
		pass
	return R.num(R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.binary("+", R.lset(l, "position", 1, "-="), 1)) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))) - float(1))]))
	return null

static func f_closure___t2(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	return R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), [])
	return null

static func f_closure___t3(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"param1": "String"}
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "String")
	while R.truth(true):
		pass
		if R.truth(R.binary("===", R.lset(l, "char", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), "="), 117)):
			pass
			R.set_value(R.lget(l, "byteInput"), "position", R.lget(l, "position"), "=")
			R.lset(l, "char", R.invoke(R.resolve(c, "parseInt", "com.newgrounds.encoders.json.decodeJson"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [4]), 16]), "=")
			R.lset(l, "position", R.binary("+", R.lget(l, "position"), 4), "=")
		else:
			pass
			if R.truth(R.unary("!", R.lset(l, "char", R.get_value(R.lget(l, "charConvert"), R.lget(l, "char")), "="))):
				pass
				break
			R.set_value(R.lget(l, "byteInput"), "position", R.lget(l, "position"), "=")
		R.lset(l, "param1", R.binary("+", R.lget(l, "param1"), R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.lget(l, "char")])), "=")
		while R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
			pass
			pass
		if R.truth(R.binary(">", (R.num(R.lget(l, "position")) - float(1)), R.get_value(R.lget(l, "byteInput"), "position"))):
			pass
			R.lset(l, "param1", R.binary("+", R.lget(l, "param1"), R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])), "=")
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
			pass
			return R.lget(l, "param1")
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unknown escaped character encountered at position ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null

static func f_closure___t4(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
		pass
		R.set_value(R.lget(l, "byteInput"), "position", (R.num(R.lget(l, "position")) - float(1)), "=")
		while R.truth(R.get_value(R.lget(l, "stringHelper"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)))):
			pass
			pass
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
			pass
			return R.invoke(R.lget(l, "parseStringEscaped"), [R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])])
		return R.invoke(R.get_value(R.lget(l, "byteInput"), "readUTFBytes"), [(float((R.num(R.lget(l, "position")) - float(1))) - R.num(R.get_value(R.lget(l, "byteInput"), "position")))])
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 92)):
		pass
		return R.invoke(R.lget(l, "parseStringEscaped"), [""])
	return ""
	return null

static func f_closure___t5(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc2_": "*", "_loc1_": "*"}
	l["_loc2_"] = null
	l["_loc1_"] = null
	R.lset(l, "_loc2_", null)
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 125)):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
		return {}
	R.lset(l, "_loc1_", {})
	while R.truth(true):
		pass
		var __t6 = true
		while __t6 or R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			__t6 = false
			R.lset(l, "_loc2_", R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 58)):
				pass
				while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
					pass
					R.binary("-", R.lset(l, "position", 1, "+="), 1)
				if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 58)):
					pass
					break
			else:
				pass
				R.binary("-", R.lset(l, "position", 1, "+="), 1)
			R.set_value(R.lget(l, "_loc1_"), R.lget(l, "_loc2_"), R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 125)):
			pass
			return R.lget(l, "_loc1_")
		while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
			pass
			R.binary("-", R.lset(l, "position", 1, "+="), 1)
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 125)):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected , or } at ", (R.num(R.lget(l, "position")) - float(1)))]))
			return R.lget(l, "_loc1_")
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected : at ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null

static func f_closure___t7(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"_loc1_": "*"}
	l["_loc1_"] = null
	while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
	if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 93)):
		pass
		R.binary("-", R.lset(l, "position", 1, "+="), 1)
		return []
	R.lset(l, "_loc1_", [])
	while R.truth(true):
		pass
		var __t8 = true
		while __t8 or R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			__t8 = false
			R.set_value(R.lget(l, "_loc1_"), R.get_value(R.lget(l, "_loc1_"), "length"), R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), []), "=")
		if R.truth(R.binary("===", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 93)):
			pass
			break
		R.binary("+", R.lset(l, "position", 1, "-="), 1)
		while R.truth(R.get_value(R.lget(l, "isWhitespace"), R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")))):
			pass
			R.binary("-", R.lset(l, "position", 1, "+="), 1)
		if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1)), 44)):
			pass
			if R.truth(R.binary("!==", R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), 93)):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected , or ] at ", (R.num(R.lget(l, "position")) - float(1)))]))
			return R.lget(l, "_loc1_")
	return R.lget(l, "_loc1_")
	return null

static func f_closure___t9(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 114) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 117)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 101))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 3), "=")
		return true
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"true\" at position ", R.lget(l, "position"))]))
	return null

static func f_closure___t10(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth((((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 97) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 108)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 115)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 3)), 101))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 4), "=")
		return false
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"false\" at position ", (R.num(R.lget(l, "position")) - float(1)))]))
	return null

static func f_closure___t11(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	if R.truth(((R.binary("===", R.get_value(R.lget(l, "byteInput"), R.lget(l, "position")), 117) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 1)), 108)) and R.binary("===", R.get_value(R.lget(l, "byteInput"), R.binary("+", R.lget(l, "position"), 2)), 108))):
		pass
		R.lset(l, "position", R.binary("+", R.lget(l, "position"), 3), "=")
		return null
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Expected \"null\" at position ", R.lget(l, "position"))]))
	return null

static func f_closure___t12(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected end of array at ", R.lget(l, "position"))]))
	return null

static func f_closure___t13(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected end of object at ", R.lget(l, "position"))]))
	return null

static func f_closure___t14(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {}
	return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", "Unexpected comma at ", R.lget(l, "position"))]))
	return null

static func f_closure___t15(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["@types"] = {"input": "*", "e": "TypeError", "param1": "*"}
	l["input"] = null
	l["e"] = null
	l["param1"] = R.coerce((a[0] if a.size() > 0 else null), "*")
	R.lset(l, "input", R.lget(l, "param1"))
	if R.truth(R.binary("is", R.lget(l, "input"), R.klass("String"))):
		pass
		R.lset(l, "byteInput", R.construct(R.klass("ByteArray"), []), "=")
		R.invoke(R.get_value(R.lget(l, "byteInput"), "writeUTFBytes"), [R.binary("as", R.lget(l, "input"), R.klass("String"))])
	else:
		pass
		if R.truth(R.unary("!", R.binary("is", R.lget(l, "input"), R.klass("ByteArray")))):
			pass
			return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.decodeJson"), [R.binary("+", R.binary("+", "Unexpected input <", R.lget(l, "input")), ">")]))
		R.lset(l, "byteInput", R.binary("as", R.lget(l, "input"), R.klass("ByteArray")), "=")
	R.lset(l, "position", 0, "=")
	R.last_error = null
	return R.invoke(R.get_value(R.lget(l, "parse"), R.get_value(R.lget(l, "byteInput"), R.binary("-", R.lset(l, "position", 1, "+="), 1))), [])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		if R.truth(R.binary("<", (R.num(R.lget(l, "position")) - float(1)), R.get_value(R.lget(l, "byteInput"), "length"))):
			pass
			R.set_value(R.lget(l, "e"), "message", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Unexpected character ", R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1)))])), " (0x"), R.invoke(R.get_value(R.get_value(R.lget(l, "byteInput"), (R.num(R.lget(l, "position")) - float(1))), "toString"), [16])), ")"), " at position "), (R.num(R.lget(l, "position")) - float(1))), " ("), R.get_value(R.lget(l, "e"), "message")), ")"), "=")
		return R.raise_error(R.lget(l, "e"))
	return null
