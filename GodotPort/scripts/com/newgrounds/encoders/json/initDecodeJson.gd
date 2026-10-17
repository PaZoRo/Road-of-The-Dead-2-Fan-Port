extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_initDecodeJson(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["parseArray"] = null
	l["result"] = null
	l["i"] = 0
	l["j"] = 0
	l["strLen"] = 0
	l["str"] = null
	l["char"] = 0
	l["tempBytes"] = null
	l["blockNonFiniteNumbers"] = false
	l["charConvert"] = null
	l["parseString"] = null
	l["parse"] = null
	R.lset(l, "result", null)
	R.lset(l, "i", 0)
	R.lset(l, "j", 0)
	R.lset(l, "strLen", 0)
	R.lset(l, "str", null)
	R.lset(l, "char", 0)
	R.lset(l, "tempBytes", null)
	R.lset(l, "blockNonFiniteNumbers", false)
	R.lset(l, "charConvert", null)
	R.lset(l, "parseString", null)
	R.lset(l, "parse", null)
	R.lset(l, "tempBytes", R.construct(R.resolve(c, "ByteArray", "com.newgrounds.encoders.json.initDecodeJson"), []), "=")
	R.lset(l, "charConvert", R.construct(R.resolve(c, "Array", "com.newgrounds.encoders.json.initDecodeJson"), [256]), "=")
	R.lset(l, "j", 0, "=")
	while R.truth(R.binary("<", R.lget(l, "j"), 10)):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", R.binary("+", R.lget(l, "j"), 48), 808464384), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth(R.binary("<", R.lget(l, "j"), 16)):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", R.binary("+", R.lget(l, "j"), 55), 808464384), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth(R.binary("<", R.lget(l, "j"), 26)):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", R.binary("+", R.lget(l, "j"), 32), 808464640), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth(R.binary("<", R.lget(l, "j"), 32)):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.binary("|", R.binary("+", R.lget(l, "j"), 39), 808464640), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	while R.truth(R.binary("<", R.lget(l, "j"), 256)):
		pass
		R.set_value(R.lget(l, "charConvert"), R.lget(l, "j"), R.lget(l, "j"), "=")
		R.binary("-", R.lset(l, "j", 1, "+="), 1)
	R.set_value(R.lget(l, "charConvert"), 10, 23662, "=")
	R.set_value(R.lget(l, "charConvert"), 13, 23666, "=")
	R.set_value(R.lget(l, "charConvert"), 9, 23668, "=")
	R.set_value(R.lget(l, "charConvert"), 8, 23650, "=")
	R.set_value(R.lget(l, "charConvert"), 12, 23654, "=")
	R.set_value(R.lget(l, "charConvert"), 8, 23650, "=")
	R.set_value(R.lget(l, "charConvert"), 34, 23586, "=")
	R.set_value(R.lget(l, "charConvert"), 92, 23644, "=")
	R.set_value(R.lget(l, "charConvert"), 127, 808466246, "=")
	R.lset(l, "parseArray", R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t1", c, l), "=")
	R.lset(l, "parseString", R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t2", c, l), "=")
	R.lset(l, "parse", {"object": R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t3", c, l), "string": R.lget(l, "parseString"), "number": R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t5", c, l), "boolean": R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t6", c, l), "xml": R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t7", c, l), "undefined": R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t8", c, l)}, "=")
	return R.make_closure("com.newgrounds.encoders.json.initDecodeJson", "closure___t9", c, l)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	pass
	return null

static func f_closure___t1(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["_loc2_"] = null
	l["_loc3_"] = 0
	l["param1"] = (a[0] if a.size() > 0 else null)
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [91])
	R.lset(l, "_loc2_", 0)
	R.lset(l, "_loc3_", R.binary("-", R.get_value(R.lget(l, "param1"), "length"), 1))
	if R.truth(R.binary(">=", R.lget(l, "_loc3_"), 0)):
		pass
		while R.truth(R.binary("<", R.lget(l, "_loc2_"), R.lget(l, "_loc3_"))):
			pass
			R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_"))])
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [44])
			R.binary("-", R.lset(l, "_loc2_", 1, "+="), 1)
		R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "_loc2_"))])
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [93])
	return null

static func f_closure___t2(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["param1"] = (a[0] if a.size() > 0 else null)
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [34])
	R.set_value(R.lget(l, "tempBytes"), "position", 0, "=")
	R.set_value(R.lget(l, "tempBytes"), "length", 0, "=")
	R.invoke(R.get_value(R.lget(l, "tempBytes"), "writeUTFBytes"), [R.lget(l, "param1")])
	R.lset(l, "i", 0, "=")
	R.lset(l, "j", 0, "=")
	R.lset(l, "strLen", R.get_value(R.lget(l, "tempBytes"), "length"), "=")
	while R.truth(R.binary("<", R.lget(l, "j"), R.lget(l, "strLen"))):
		pass
		R.lset(l, "char", R.get_value(R.lget(l, "charConvert"), R.get_value(R.lget(l, "tempBytes"), R.binary("-", R.lset(l, "j", 1, "+="), 1))), "=")
		if R.truth(R.binary(">", R.lget(l, "char"), 256)):
			pass
			if R.truth(R.binary(">", R.binary("-", R.lget(l, "j"), 1), R.lget(l, "i"))):
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeBytes"), [R.lget(l, "tempBytes"), R.lget(l, "i"), R.binary("-", R.binary("-", R.lget(l, "j"), 1), R.lget(l, "i"))])
			if R.truth(R.binary(">", R.lget(l, "char"), 65536)):
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeShort"), [23669])
				R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [R.lget(l, "char")])
			else:
				pass
				R.invoke(R.get_value(R.lget(l, "result"), "writeShort"), [R.lget(l, "char")])
			R.lset(l, "i", R.lget(l, "j"), "=")
	if R.truth(R.binary(">", R.lget(l, "strLen"), R.lget(l, "i"))):
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeBytes"), [R.lget(l, "tempBytes"), R.lget(l, "i"), R.binary("-", R.lget(l, "strLen"), R.lget(l, "i"))])
	R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [34])
	return null

static func f_closure___t3(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["_loc2_"] = null
	l["param1"] = (a[0] if a.size() > 0 else null)
	R.lset(l, "_loc2_", null)
	if R.truth(R.lget(l, "param1")):
		pass
		if R.truth(R.binary("is", R.lget(l, "param1"), R.resolve(c, "Array", "com.newgrounds.encoders.json.initDecodeJson"))):
			pass
			R.invoke(R.lget(l, "parseArray"), [R.lget(l, "param1")])
		else:
			pass
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [123])
			R.lset(l, "_loc2_", true, "=")
			for __t4 in R.iterate(R.lget(l, "param1"), false):
				R.lset(l, "str", __t4, "=")
				if R.truth(R.lget(l, "_loc2_")):
					pass
					R.lset(l, "_loc2_", false, "=")
				else:
					pass
					R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [44])
				R.invoke(R.lget(l, "parseString"), [R.lget(l, "str")])
				R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [58])
				R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.get_value(R.lget(l, "param1"), R.lget(l, "str")))), [R.get_value(R.lget(l, "param1"), R.lget(l, "str"))])
			R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [125])
	else:
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1853189228])
	return null

static func f_closure___t5(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["param1"] = (a[0] if a.size() > 0 else 0)
	if R.truth((R.unary("!", R.invoke(R.resolve(c, "isFinite", "com.newgrounds.encoders.json.initDecodeJson"), [R.lget(l, "param1")])) if R.truth(R.lget(l, "blockNonFiniteNumbers")) else false)):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), [R.binary("+", R.binary("+", "Number ", R.lget(l, "param1")), " is not encodable")]))
	R.invoke(R.get_value(R.lget(l, "result"), "writeUTFBytes"), [R.invoke(R.resolve(c, "String", "com.newgrounds.encoders.json.initDecodeJson"), [R.lget(l, "param1")])])
	return null

static func f_closure___t6(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["param1"] = (a[0] if a.size() > 0 else false)
	if R.truth(R.lget(l, "param1")):
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1953658213])
	else:
		pass
		R.invoke(R.get_value(R.lget(l, "result"), "writeByte"), [102])
		R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1634497381])
	return null

static func f_closure___t7(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["param1"] = (a[0] if a.size() > 0 else null)
	if R.truth((true if R.truth(R.binary("is", R.unary("!", R.get_value(R.lget(l, "param1"), "toXMLString")), R.resolve(c, "Function", "com.newgrounds.encoders.json.initDecodeJson"))) else R.binary("==", R.lset(l, "param1", R.binary("as", R.invoke(R.get_value(R.lget(l, "param1"), "toXMLString"), []), R.resolve(c, "String", "com.newgrounds.encoders.json.initDecodeJson")), "="), null))):
		pass
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), ["unserializable XML object encountered"]))
	R.invoke(R.lget(l, "parseString"), [R.lget(l, "param1")])
	return null

static func f_closure___t8(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["param1"] = (a[0] if a.size() > 0 else false)
	R.invoke(R.get_value(R.lget(l, "result"), "writeUnsignedInt"), [1853189228])
	return null

static func f_closure___t9(c: Variant, a: Array, parent_scope: Dictionary) -> Variant:
	var l: Dictionary = {"@parent": parent_scope}
	l["byteOutput"] = null
	l["input"] = null
	l["writeTo"] = null
	l["strictNumberSupport"] = false
	l["e"] = null
	l["param1"] = (a[0] if a.size() > 0 else null)
	l["param2"] = (a[1] if a.size() > 1 else null)
	l["param3"] = (a[2] if a.size() > 2 else false)
	R.lset(l, "byteOutput", null)
	R.lset(l, "input", R.lget(l, "param1"))
	R.lset(l, "writeTo", R.lget(l, "param2"))
	R.lset(l, "strictNumberSupport", R.lget(l, "param3"))
	R.lset(l, "blockNonFiniteNumbers", R.lget(l, "strictNumberSupport"), "=")
	R.last_error = null
	if R.truth(R.lget(l, "writeTo")):
		pass
		R.lset(l, "result", R.lget(l, "writeTo"), "=")
		R.set_value(R.lget(l, "result"), "endian", "bigEndian", "=")
		R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.lget(l, "input"))), [R.lget(l, "input")])
		R.set_value(R.lget(l, "byteOutput"), "position", 0, "=")
		return R.invoke(R.get_value(R.lget(l, "byteOutput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteOutput"), "length")])
	var __t10 = R.unary("typeof", R.lget(l, "input"))
	var __t11 = -1
	if __t11 == -1 and R.binary("===", __t10, "xml"):
		__t11 = 0
	if __t11 == -1 and R.binary("===", __t10, "object"):
		__t11 = 1
	if __t11 == -1 and R.binary("===", __t10, "string"):
		__t11 = 2
	if __t11 == -1 and R.binary("===", __t10, "number"):
		__t11 = 3
	if __t11 == -1 and R.binary("===", __t10, "boolean"):
		__t11 = 4
	if __t11 == -1 and R.binary("===", __t10, "undefined"):
		__t11 = 5
	if __t11 == -1:
		__t11 = 6
	for __case__t11 in [0]:
		if __t11 >= 0 and __t11 <= 0:
			pass
			if R.truth((true if R.truth(R.binary("is", R.unary("!", R.get_value(R.lget(l, "input"), "toXMLString")), R.resolve(c, "Function", "com.newgrounds.encoders.json.initDecodeJson"))) else R.binary("==", R.lset(l, "input", R.binary("as", R.invoke(R.get_value(R.lget(l, "input"), "toXMLString"), []), R.resolve(c, "String", "com.newgrounds.encoders.json.initDecodeJson")), "="), null))):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), ["unserializable XML object encountered"]))
			break
		if __t11 >= 0 and __t11 <= 1:
			pass
		if __t11 >= 0 and __t11 <= 2:
			pass
			break
		if __t11 >= 0 and __t11 <= 3:
			pass
			if R.truth((R.unary("!", R.invoke(R.resolve(c, "isFinite", "com.newgrounds.encoders.json.initDecodeJson"), [R.binary("as", R.lget(l, "input"), R.resolve(c, "Number", "com.newgrounds.encoders.json.initDecodeJson"))])) if R.truth(R.lget(l, "blockNonFiniteNumbers")) else false)):
				pass
				return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), [R.binary("+", R.binary("+", "Number ", R.lget(l, "input")), " is not encodable")]))
			return R.invoke(R.resolve(c, "String", "com.newgrounds.encoders.json.initDecodeJson"), [R.lget(l, "input")])
			break
		if __t11 >= 0 and __t11 <= 4:
			pass
			return ("true" if R.truth(R.lget(l, "input")) else "false")
		if __t11 >= 0 and __t11 <= 5:
			pass
			return "null"
		if __t11 >= 0 and __t11 <= 6:
			pass
			return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), [R.binary("+", R.binary("+", "Unexpected type \"", R.unary("typeof", R.lget(l, "input"))), "\" encountered")]))
	R.lset(l, "result", R.lset(l, "byteOutput", R.construct(R.resolve(c, "ByteArray", "com.newgrounds.encoders.json.initDecodeJson"), []), "="), "=")
	R.set_value(R.lget(l, "result"), "endian", "bigEndian", "=")
	R.invoke(R.get_value(R.lget(l, "parse"), R.unary("typeof", R.lget(l, "input"))), [R.lget(l, "input")])
	R.set_value(R.lget(l, "byteOutput"), "position", 0, "=")
	return R.invoke(R.get_value(R.lget(l, "byteOutput"), "readUTFBytes"), [R.get_value(R.lget(l, "byteOutput"), "length")])
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		return R.raise_error(R.construct(R.resolve(c, "Error", "com.newgrounds.encoders.json.initDecodeJson"), ["Unexpected type encountered"]))
	return null
