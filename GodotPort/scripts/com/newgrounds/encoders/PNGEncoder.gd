extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_PNGEncoder(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.encoders.PNGEncoder"), [])
	return null

static func f_encode(c: Variant, a: Array) -> Variant:
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v__loc4_: Variant = null
	var v__loc5_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	v__loc6_ = R.coerce(0, "uint")
	v__loc7_ = R.coerce(0, "int")
	v__loc2_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc2_, "writeUnsignedInt"), [2303741511])
	R.invoke(R.get_value(v__loc2_, "writeUnsignedInt"), [218765834])
	v__loc3_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v__loc3_, "writeInt"), [R.get_value(v_param1, "width")])
	R.invoke(R.get_value(v__loc3_, "writeInt"), [R.get_value(v_param1, "height")])
	R.invoke(R.get_value(v__loc3_, "writeUnsignedInt"), [134610944])
	R.invoke(R.get_value(v__loc3_, "writeByte"), [0])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229472850, v__loc3_])
	v__loc4_ = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	v__loc5_ = R.coerce(0, "int")
	while R.truth(R.binary("<", v__loc5_, R.get_value(v_param1, "height"))):
		pass
		R.invoke(R.get_value(v__loc4_, "writeByte"), [0])
		if R.truth(R.unary("!", R.get_value(v_param1, "transparent"))):
			pass
			v__loc7_ = R.coerce(0, "int")
			while R.truth(R.binary("<", v__loc7_, R.get_value(v_param1, "width"))):
				pass
				v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "getPixel"), [v__loc7_, v__loc5_]), "uint")
				R.invoke(R.get_value(v__loc4_, "writeUnsignedInt"), [R.coerce(R.binary("|", R.binary("<<", R.binary("&", v__loc6_, 16777215), 8), 255), "uint")])
				v__loc7_ = R.signed32(v__loc7_ + 1)
		else:
			pass
			v__loc7_ = R.coerce(0, "int")
			while R.truth(R.binary("<", v__loc7_, R.get_value(v_param1, "width"))):
				pass
				v__loc6_ = R.coerce(R.invoke(R.get_value(v_param1, "getPixel32"), [v__loc7_, v__loc5_]), "uint")
				R.invoke(R.get_value(v__loc4_, "writeUnsignedInt"), [R.coerce(R.binary("|", R.binary("<<", R.binary("&", v__loc6_, 16777215), 8), R.binary(">>>", v__loc6_, 24)), "uint")])
				v__loc7_ = R.signed32(v__loc7_ + 1)
		v__loc5_ = R.signed32(v__loc5_ + 1)
	R.invoke(R.get_value(v__loc4_, "compress"), [])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229209940, v__loc4_])
	R.invoke(R.resolve(c, "writeChunk", "com.newgrounds.encoders.PNGEncoder"), [v__loc2_, 1229278788, null])
	return v__loc2_
	return null

static func f_writeChunk(c: Variant, a: Array) -> Variant:
	var v__loc8_: Variant = 0
	var v__loc9_: Variant = 0
	var v__loc10_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = 0
	var v__loc6_: Variant = 0
	var v__loc7_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "ByteArray")
	v__loc8_ = R.coerce(0, "uint")
	v__loc9_ = R.coerce(0, "uint")
	v__loc10_ = R.coerce(0, "uint")
	if R.truth(R.unary("!", R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTableComputed"))):
		pass
		R.assign(c, "crcTableComputed", "com.newgrounds.encoders.PNGEncoder", true, "=")
		R.assign(c, "crcTable", "com.newgrounds.encoders.PNGEncoder", [], "=")
		v__loc9_ = R.coerce(0, "uint")
		while R.truth((float(v__loc9_) < float(256))):
			pass
			v__loc8_ = R.coerce(v__loc9_, "uint")
			v__loc10_ = R.coerce(0, "uint")
			while R.truth((float(v__loc10_) < float(8))):
				pass
				if R.truth(R.binary("&", v__loc8_, 1)):
					pass
					v__loc8_ = R.coerce(R.coerce(R.binary("^", R.coerce(3988292384, "uint"), R.coerce(R.binary(">>>", v__loc8_, 1), "uint")), "uint"), "uint")
				else:
					pass
					v__loc8_ = R.coerce(R.coerce(R.binary(">>>", v__loc8_, 1), "uint"), "uint")
				v__loc10_ = ((v__loc10_ + 1) & 4294967295)
			R.set_value(R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTable"), v__loc9_, v__loc8_, "=")
			v__loc9_ = ((v__loc9_ + 1) & 4294967295)
	v__loc4_ = R.coerce(0, "uint")
	if R.truth(R.binary("!=", v_param3, null)):
		pass
		v__loc4_ = R.coerce(R.get_value(v_param3, "length"), "uint")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v__loc4_])
	v__loc5_ = R.coerce(R.get_value(v_param1, "position"), "uint")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v_param2])
	if R.truth(R.binary("!=", v_param3, null)):
		pass
		R.invoke(R.get_value(v_param1, "writeBytes"), [v_param3])
	v__loc6_ = R.coerce(R.get_value(v_param1, "position"), "uint")
	R.set_value(v_param1, "position", v__loc5_, "=")
	v__loc8_ = R.coerce(4294967295, "uint")
	v__loc7_ = R.coerce(0, "int")
	while R.truth((float(v__loc7_) < float((float(v__loc6_) - float(v__loc5_))))):
		pass
		v__loc8_ = R.coerce(R.coerce(R.binary("^", R.get_value(R.static_value("com.newgrounds.encoders.PNGEncoder", "crcTable"), R.binary("&", R.binary("^", v__loc8_, R.invoke(R.get_value(v_param1, "readUnsignedByte"), [])), R.coerce(255, "uint"))), R.coerce(R.binary(">>>", v__loc8_, 8), "uint")), "uint"), "uint")
		v__loc7_ = R.signed32(v__loc7_ + 1)
	v__loc8_ = R.coerce(R.coerce(R.binary("^", v__loc8_, R.coerce(4294967295, "uint")), "uint"), "uint")
	R.set_value(v_param1, "position", v__loc6_, "=")
	R.invoke(R.get_value(v_param1, "writeUnsignedInt"), [v__loc8_])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "crcTable", null, "=")
	R.set_value(c, "crcTableComputed", false, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
