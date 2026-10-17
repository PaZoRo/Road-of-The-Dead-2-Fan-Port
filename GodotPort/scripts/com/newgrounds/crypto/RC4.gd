extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RC4(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.crypto.RC4"), [])
	return null

static func f_encrypt(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_]), "Array")
	return R.invoke(R.resolve(c, "charsToHex", "com.newgrounds.crypto.RC4"), [v__loc5_])
	return null

static func f_encryptbin(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	return R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_])
	return null

static func f_decrypt(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hexToChars", "com.newgrounds.crypto.RC4"), [v_param1]), "Array")
	v__loc4_ = R.coerce(R.invoke(R.resolve(c, "strToChars", "com.newgrounds.crypto.RC4"), [v_param2]), "Array")
	v__loc5_ = R.coerce(R.invoke(R.resolve(c, "calculate", "com.newgrounds.crypto.RC4"), [v__loc3_, v__loc4_]), "Array")
	return R.invoke(R.resolve(c, "charsToStr", "com.newgrounds.crypto.RC4"), [v__loc5_])
	return null

static func f_initialize(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc2_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc3_ = R.coerce(0, "uint")
	v__loc2_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(R.get_value(v_param1, "length"), "uint")
	v__loc5_ = R.coerce(0, "uint")
	while R.truth((float(v__loc5_) <= float(255))):
		pass
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "mykey"), v__loc5_, R.get_value(v_param1, R.binary("%", v__loc5_, v__loc4_)), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_, v__loc5_, "=")
		v__loc5_ = ((v__loc5_ + 1) & 4294967295)
	v__loc5_ = R.coerce(0, "uint")
	while R.truth((float(v__loc5_) <= float(255))):
		pass
		v__loc2_ = R.coerce(R.binary("%", R.binary("+", R.binary("+", v__loc2_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_)), R.get_value(R.static_value("com.newgrounds.crypto.RC4", "mykey"), v__loc5_)), 256), "uint")
		v__loc3_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_), "uint"), "uint")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc5_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc2_), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc2_, v__loc3_, "=")
		v__loc5_ = ((v__loc5_ + 1) & 4294967295)
	return null

static func f_calculate(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc9_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v__loc6_ = R.coerce(0, "uint")
	v__loc7_ = R.coerce(0, "uint")
	v__loc8_ = R.coerce(0, "uint")
	v__loc10_ = R.coerce(0, "uint")
	R.invoke(R.resolve(c, "initialize", "com.newgrounds.crypto.RC4"), [v_param2])
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc9_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc9_, R.get_value(v_param1, "length"))):
		pass
		v__loc3_ = R.coerce(R.binary("%", (float(v__loc3_) + float(1)), 256), "uint")
		v__loc4_ = R.coerce(R.binary("%", R.binary("+", v__loc4_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_)), 256), "uint")
		v__loc7_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_), "uint"), "uint")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_, R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_), "=")
		R.set_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_, v__loc7_, "=")
		v__loc10_ = R.coerce(R.binary("%", R.binary("+", R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc3_), R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc4_)), 256), "uint")
		v__loc6_ = R.coerce(R.coerce(R.get_value(R.static_value("com.newgrounds.crypto.RC4", "sbox"), v__loc10_), "uint"), "uint")
		v__loc8_ = R.coerce(R.coerce(R.binary("^", R.get_value(v_param1, v__loc9_), v__loc6_), "uint"), "uint")
		R.invoke(R.get_value(v__loc5_, "push"), [v__loc8_])
		v__loc9_ = ((v__loc9_ + 1) & 4294967295)
	return v__loc5_
	return null

static func f_charsToHex(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc2_ = R.coerce(R.construct(R.klass("String"), [""]), "String")
	v__loc3_ = R.coerce(R.construct(R.klass("Array"), ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]), "Array")
	v__loc4_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc4_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.binary("+", R.get_value(v__loc3_, R.binary(">>", R.get_value(v_param1, v__loc4_), 4)), R.get_value(v__loc3_, R.binary("&", R.get_value(v_param1, v__loc4_), 15)))), "String")
		v__loc4_ = ((v__loc4_ + 1) & 4294967295)
	return v__loc2_
	return null

static func f_hexToChars(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce((2 if R.truth(R.binary("==", R.invoke(R.get_value(v_param1, "substr"), [0, 2]), "0x")) else 0), "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		R.invoke(R.get_value(v__loc2_, "push"), [R.invoke(R.resolve(c, "parseInt", "com.newgrounds.crypto.RC4"), [R.invoke(R.get_value(v_param1, "substr"), [v__loc3_, 2]), 16])])
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, 2), "uint")
	return v__loc2_
	return null

static func f_charsToStr(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v__loc2_ = R.coerce(R.construct(R.klass("String"), [""]), "String")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(v_param1, v__loc3_)])), "String")
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null

static func f_strToChars(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce(0, "uint")
	while R.truth(R.binary("<", v__loc3_, R.get_value(v_param1, "length"))):
		pass
		R.invoke(R.get_value(v__loc2_, "push"), [R.invoke(R.get_value(v_param1, "charCodeAt"), [v__loc3_])])
		v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	return v__loc2_
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "sbox", R.construct(R.klass("Array"), [255]), "=")
	R.set_value(c, "mykey", R.construct(R.klass("Array"), [255]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
