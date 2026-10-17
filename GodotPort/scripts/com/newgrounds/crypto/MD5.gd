extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MD5(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.crypto.MD5"), [])
	return null

static func f_hash(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v__loc2_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc2_, "writeUTFBytes"), [v_param1])
	return R.invoke(R.resolve(c, "hashBinary", "com.newgrounds.crypto.MD5"), [v__loc2_])
	return null

static func f_hashBytes(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	return R.invoke(R.resolve(c, "hashBinary", "com.newgrounds.crypto.MD5"), [v_param1])
	return null

static func f_hashBinary(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc10_: Variant = null
	var v__loc11_: Variant = 0
	var v__loc12_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v__loc6_ = R.coerce(0, "int")
	v__loc7_ = R.coerce(0, "int")
	v__loc8_ = R.coerce(0, "int")
	v__loc9_ = R.coerce(0, "int")
	v__loc2_ = R.coerce(1732584193, "int")
	v__loc3_ = R.coerce(R.unary("-", 271733879), "int")
	v__loc4_ = R.coerce(R.unary("-", 1732584194), "int")
	v__loc5_ = R.coerce(271733878, "int")
	v__loc10_ = R.coerce(R.invoke(R.resolve(c, "createBlocks", "com.newgrounds.crypto.MD5"), [v_param1]), "Array")
	v__loc11_ = R.coerce(R.coerce(R.get_value(v__loc10_, "length"), "int"), "int")
	v__loc12_ = R.coerce(0, "int")
	while R.truth((float(v__loc12_) < float(v__loc11_))):
		pass
		v__loc6_ = R.coerce(v__loc2_, "int")
		v__loc7_ = R.coerce(v__loc3_, "int")
		v__loc8_ = R.coerce(v__loc4_, "int")
		v__loc9_ = R.coerce(v__loc5_, "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 7, R.unary("-", 680876936)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 12, R.unary("-", 389564586)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 17, 606105819]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 22, R.unary("-", 1044525330)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 7, R.unary("-", 176418897)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 12, 1200080426]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 17, R.unary("-", 1473231341)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 22, R.unary("-", 45705983)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 7, 1770035416]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 12, R.unary("-", 1958414417)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 17, R.unary("-", 42063)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 22, R.unary("-", 1990404162)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 7, 1804603682]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 12, R.unary("-", 40341101)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 17, R.unary("-", 1502002290)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ff", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 22, 1236535329]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 5, R.unary("-", 165796510)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 9, R.unary("-", 1069501632)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 14, 643717713]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 20, R.unary("-", 373897302)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 5, R.unary("-", 701558691)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 9, 38016083]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 14, R.unary("-", 660478335)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 20, R.unary("-", 405537848)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 5, 568446438]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 9, R.unary("-", 1019803690)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 14, R.unary("-", 187363961)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 20, 1163531501]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 5, R.unary("-", 1444681467)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 9, R.unary("-", 51403784)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 14, 1735328473]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "gg", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 20, R.unary("-", 1926607734)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 4, R.unary("-", 378558)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 11, R.unary("-", 2022574463)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 16, 1839030562]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 23, R.unary("-", 35309556)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 4, R.unary("-", 1530992060)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 11, 1272893353]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 16, R.unary("-", 155497632)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 23, R.unary("-", 1094730640)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 4, 681279174]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 11, R.unary("-", 358537222)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 16, R.unary("-", 722521979)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 23, 76029189]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 4, R.unary("-", 640364487)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 11, R.unary("-", 421815835)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 16, 530742520]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "hh", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 23, R.unary("-", 995338651)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(0)), "int")), 6, R.unary("-", 198630844)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(7)), "int")), 10, 1126891415]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(14)), "int")), 15, R.unary("-", 1416354905)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(5)), "int")), 21, R.unary("-", 57434055)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(12)), "int")), 6, 1700485571]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(3)), "int")), 10, R.unary("-", 1894986606)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(10)), "int")), 15, R.unary("-", 1051523)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(1)), "int")), 21, R.unary("-", 2054922799)]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(8)), "int")), 6, 1873313359]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(15)), "int")), 10, R.unary("-", 30611744)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(6)), "int")), 15, R.unary("-", 1560198380)]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(13)), "int")), 21, 1309151649]), "int")
		v__loc2_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc2_, v__loc3_, v__loc4_, v__loc5_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(4)), "int")), 6, R.unary("-", 145523070)]), "int")
		v__loc5_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc5_, v__loc2_, v__loc3_, v__loc4_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(11)), "int")), 10, R.unary("-", 1120210379)]), "int")
		v__loc4_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc4_, v__loc5_, v__loc2_, v__loc3_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(2)), "int")), 15, 718787259]), "int")
		v__loc3_ = R.coerce(R.invoke(R.resolve(c, "ii", "com.newgrounds.crypto.MD5"), [v__loc3_, v__loc4_, v__loc5_, v__loc2_, R.get_value(v__loc10_, R.coerce((float(v__loc12_) + float(9)), "int")), 21, R.unary("-", 343485551)]), "int")
		v__loc2_ = R.coerce(R.binary("+", v__loc2_, v__loc6_), "int")
		v__loc3_ = R.coerce(R.binary("+", v__loc3_, v__loc7_), "int")
		v__loc4_ = R.coerce(R.binary("+", v__loc4_, v__loc8_), "int")
		v__loc5_ = R.coerce(R.binary("+", v__loc5_, v__loc9_), "int")
		v__loc12_ = R.coerce(R.binary("+", v__loc12_, 16), "int")
	R.assign(c, "digest", "com.newgrounds.crypto.MD5", R.construct(R.klass("ByteArray"), []), "=")
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc2_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc3_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc4_])
	R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "writeInt"), [v__loc5_])
	R.set_value(R.static_value("com.newgrounds.crypto.MD5", "digest"), "position", 0, "=")
	return R.binary("+", R.binary("+", R.binary("+", R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc2_]), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc3_])), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc4_])), R.invoke(R.resolve(c, "toHex", "com.newgrounds.crypto.MD5"), [v__loc5_]))
	return null

static func f_f(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("|", R.binary("&", v_param1, v_param2), R.binary("&", R.unary("~", v_param1), v_param3))
	return null

static func f_g(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("|", R.binary("&", v_param1, v_param3), R.binary("&", v_param2, R.unary("~", v_param3)))
	return null

static func f_h(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("^", R.binary("^", v_param1, v_param2), v_param3)
	return null

static func f_i(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	return R.binary("^", v_param2, R.binary("|", v_param1, R.unary("~", v_param3)))
	return null

static func f_transform(c: Variant, a: Array) -> Variant:
	var v__loc9_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Function")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "int")
	v__loc9_ = R.coerce((float((float((float(v_param2) + float(R.coerce(R.invoke(v_param1, [v_param3, v_param4, v_param5]), "int")))) + float(v_param6))) + float(v_param8)), "int")
	return R.binary("+", R.invoke(R.resolve(c, "rol", "com.newgrounds.crypto.MD5"), [v__loc9_, v_param7]), v_param3)
	return null

static func f_ff(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "f", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null

static func f_gg(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "g", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null

static func f_hh(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "h", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null

static func f_ii(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "int")
	return R.invoke(R.resolve(c, "transform", "com.newgrounds.crypto.MD5"), [R.resolve(c, "i", "com.newgrounds.crypto.MD5"), v_param1, v_param2, v_param3, v_param4, v_param5, v_param6, v_param7])
	return null

static func f_createBlocks(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v__loc2_ = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v__loc3_ = R.coerce((R.num(R.get_value(v_param1, "length")) * float(8)), "int")
	v__loc4_ = R.coerce(255, "int")
	v__loc5_ = R.coerce(0, "int")
	while R.truth((float(v__loc5_) < float(v__loc3_))):
		pass
		R.set_value(v__loc2_, R.coerce(R.binary(">>", v__loc5_, 5), "int"), R.binary("|", R.get_value(v__loc2_, R.coerce(R.binary(">>", v__loc5_, 5), "int")), R.binary("<<", R.binary("&", R.get_value(v_param1, R.binary("/", v__loc5_, 8)), v__loc4_), R.binary("%", v__loc5_, 32))), "=")
		v__loc5_ = R.coerce(R.binary("+", v__loc5_, 8), "int")
	R.set_value(v__loc2_, R.coerce(R.binary(">>", v__loc3_, 5), "int"), R.binary("|", R.get_value(v__loc2_, R.coerce(R.binary(">>", v__loc3_, 5), "int")), R.binary("<<", 128, R.binary("%", v__loc3_, 32))), "=")
	R.set_value(v__loc2_, R.coerce(R.binary("+", R.binary("<<", R.binary(">>>", (float(v__loc3_) + float(64)), 9), 4), 14), "int"), v__loc3_, "=")
	return v__loc2_
	return null

static func f_rol(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	return R.binary("|", R.binary("<<", v_param1, v_param2), R.binary(">>>", v_param1, (float(32) - float(v_param2))))
	return null

static func f_ror(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v__loc3_ = R.coerce((float(32) - float(v_param2)), "int")
	return R.binary("|", R.binary("<<", v_param1, v__loc3_), R.binary(">>>", v_param1, (float(32) - float(v__loc3_))))
	return null

static func f_toHex(c: Variant, a: Array) -> Variant:
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v__loc4_ = R.coerce(0, "int")
	v__loc5_ = R.coerce(0, "int")
	v__loc3_ = R.coerce("", "String")
	if R.truth(v_param2):
		pass
		v__loc4_ = R.coerce(0, "int")
		while R.truth((float(v__loc4_) < float(4))):
			pass
			v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.binary("+", R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float((float(3) - float(v__loc4_))) * float(8))) + float(4))), 15)]), R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float(3) - float(v__loc4_))) * float(8))), 15)]))), "String")
			v__loc4_ = R.signed32(v__loc4_ + 1)
	else:
		pass
		v__loc5_ = R.coerce(0, "int")
		while R.truth((float(v__loc5_) < float(4))):
			pass
			v__loc3_ = R.coerce(R.binary("+", v__loc3_, R.binary("+", R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float((float(v__loc5_) * float(8))) + float(4))), 15)]), R.invoke(R.get_value(R.static_value("com.newgrounds.crypto.MD5", "hexChars"), "charAt"), [R.binary("&", R.binary(">>", v_param1, (float(v__loc5_) * float(8))), 15)]))), "String")
			v__loc5_ = R.signed32(v__loc5_ + 1)
	return v__loc3_
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "digest", null, "=")
	R.set_value(c, "hexChars", "0123456789abcdef", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
