extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Perlin(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Perlin"), [])
	return null

static func f_noise(c: Variant, a: Array) -> Variant:
	var v_fFreq: Variant = NAN
	var v_fPers: Variant = NAN
	var v_x: Variant = NAN
	var v_y: Variant = NAN
	var v_z: Variant = NAN
	var v_xf: Variant = NAN
	var v_yf: Variant = NAN
	var v_zf: Variant = NAN
	var v_u: Variant = NAN
	var v_v: Variant = NAN
	var v_w: Variant = NAN
	var v_x1: Variant = NAN
	var v_y1: Variant = NAN
	var v_z1: Variant = NAN
	var v_X: Variant = 0
	var v_Y: Variant = 0
	var v_Z: Variant = 0
	var v_A: Variant = 0
	var v_B: Variant = 0
	var v_AA: Variant = 0
	var v_AB: Variant = 0
	var v_BA: Variant = 0
	var v_BB: Variant = 0
	var v_hash: Variant = 0
	var v_g1: Variant = NAN
	var v_g2: Variant = NAN
	var v_g3: Variant = NAN
	var v_g4: Variant = NAN
	var v_g5: Variant = NAN
	var v_g6: Variant = NAN
	var v_g7: Variant = NAN
	var v_g8: Variant = NAN
	var v_i: Variant = 0
	var v_s: Variant = NAN
	var v__x: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v__y: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v__z: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	v_fFreq = float(NAN)
	v_fPers = float(NAN)
	v_x = float(NAN)
	v_y = float(NAN)
	v_z = float(NAN)
	v_xf = float(NAN)
	v_yf = float(NAN)
	v_zf = float(NAN)
	v_u = float(NAN)
	v_v = float(NAN)
	v_w = float(NAN)
	v_x1 = float(NAN)
	v_y1 = float(NAN)
	v_z1 = float(NAN)
	v_X = R.coerce(0, "int")
	v_Y = R.coerce(0, "int")
	v_Z = R.coerce(0, "int")
	v_A = R.coerce(0, "int")
	v_B = R.coerce(0, "int")
	v_AA = R.coerce(0, "int")
	v_AB = R.coerce(0, "int")
	v_BA = R.coerce(0, "int")
	v_BB = R.coerce(0, "int")
	v_hash = R.coerce(0, "int")
	v_g1 = float(NAN)
	v_g2 = float(NAN)
	v_g3 = float(NAN)
	v_g4 = float(NAN)
	v_g5 = float(NAN)
	v_g6 = float(NAN)
	v_g7 = float(NAN)
	v_g8 = float(NAN)
	v_i = R.coerce(0, "int")
	if R.truth(R.unary("!", R.static_value("Perlin", "initialized"))):
		pass
		R.invoke(R.resolve(c, "init", "Perlin"), [])
	v_s = float(0)
	v__x = R.coerce(R.binary("+", v__x, R.static_value("Perlin", "iXoffset")), "Number")
	v__y = R.coerce(R.binary("+", v__y, R.static_value("Perlin", "iYoffset")), "Number")
	v__z = R.coerce(R.binary("+", v__z, R.static_value("Perlin", "iZoffset")), "Number")
	while R.truth((float(v_i) < float(R.static_value("Perlin", "iOctaves")))):
		pass
		v_fFreq = float(R.num(R.get_value(R.static_value("Perlin", "aOctFreq"), v_i)))
		v_fPers = float(R.num(R.get_value(R.static_value("Perlin", "aOctPers"), v_i)))
		v_x = float((float(v__x) * float(v_fFreq)))
		v_y = float((float(v__y) * float(v_fFreq)))
		v_z = float((float(v__z) * float(v_fFreq)))
		v_xf = float(floorf(float(v_x)))
		v_yf = float(floorf(float(v_y)))
		v_zf = float(floorf(float(v_z)))
		v_X = R.coerce(R.binary("&", v_xf, 255), "int")
		v_Y = R.coerce(R.binary("&", v_yf, 255), "int")
		v_Z = R.coerce(R.binary("&", v_zf, 255), "int")
		v_x = R.coerce(R.binary("-", v_x, v_xf), "Number")
		v_y = R.coerce(R.binary("-", v_y, v_yf), "Number")
		v_z = R.coerce(R.binary("-", v_z, v_zf), "Number")
		v_u = float((float((float((float(v_x) * float(v_x))) * float(v_x))) * float((float((float(v_x) * float((float((float(v_x) * float(6))) - float(15))))) + float(10)))))
		v_v = float((float((float((float(v_y) * float(v_y))) * float(v_y))) * float((float((float(v_y) * float((float((float(v_y) * float(6))) - float(15))))) + float(10)))))
		v_w = float((float((float((float(v_z) * float(v_z))) * float(v_z))) * float((float((float(v_z) * float((float((float(v_z) * float(6))) - float(15))))) + float(10)))))
		v_A = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_X), "int")) + float(v_Y)), "int")
		v_AA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_A), "int")) + float(v_Z)), "int")
		v_AB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_A) + float(1)), "int")), "int")) + float(v_Z)), "int")
		v_B = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_X) + float(1)), "int")), "int")) + float(v_Y)), "int")
		v_BA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_B), "int")) + float(v_Z)), "int")
		v_BB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_B) + float(1)), "int")), "int")) + float(v_Z)), "int")
		v_x1 = float((float(v_x) - float(1)))
		v_y1 = float((float(v_y) - float(1)))
		v_z1 = float((float(v_z) - float(1)))
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BB) + float(1)), "int")), "int"), 15), "int")
		v_g1 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AB) + float(1)), "int")), "int"), 15), "int")
		v_g2 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BA) + float(1)), "int")), "int"), 15), "int")
		v_g3 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AA) + float(1)), "int")), "int"), 15), "int")
		v_g4 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BB), "int"), 15), "int")
		v_g5 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AB), "int"), 15), "int")
		v_g6 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BA), "int"), 15), "int")
		v_g7 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
		v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AA), "int"), 15), "int")
		v_g8 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
		v_g2 = R.coerce(R.binary("+", v_g2, (float(v_u) * float((float(v_g1) - float(v_g2))))), "Number")
		v_g4 = R.coerce(R.binary("+", v_g4, (float(v_u) * float((float(v_g3) - float(v_g4))))), "Number")
		v_g6 = R.coerce(R.binary("+", v_g6, (float(v_u) * float((float(v_g5) - float(v_g6))))), "Number")
		v_g8 = R.coerce(R.binary("+", v_g8, (float(v_u) * float((float(v_g7) - float(v_g8))))), "Number")
		v_g4 = R.coerce(R.binary("+", v_g4, (float(v_v) * float((float(v_g2) - float(v_g4))))), "Number")
		v_g8 = R.coerce(R.binary("+", v_g8, (float(v_v) * float((float(v_g6) - float(v_g8))))), "Number")
		v_s = R.coerce(R.binary("+", v_s, (float((float(v_g8) + float((float(v_w) * float((float(v_g4) - float(v_g8))))))) * float(v_fPers))), "Number")
		v_i = R.signed32(v_i + 1)
	return (float((float((float(v_s) * float(R.static_value("Perlin", "fPersMax")))) + float(1))) * float(0.5))
	return null

static func f_fill(c: Variant, a: Array) -> Variant:
	var v_fFreq: Variant = NAN
	var v_fPers: Variant = NAN
	var v_x: Variant = NAN
	var v_y: Variant = NAN
	var v_z: Variant = NAN
	var v_xf: Variant = NAN
	var v_yf: Variant = NAN
	var v_zf: Variant = NAN
	var v_u: Variant = NAN
	var v_v: Variant = NAN
	var v_w: Variant = NAN
	var v_x1: Variant = NAN
	var v_y1: Variant = NAN
	var v_z1: Variant = NAN
	var v_baseX: Variant = NAN
	var v_px: Variant = 0
	var v_py: Variant = 0
	var v_i: Variant = 0
	var v_X: Variant = 0
	var v_Y: Variant = 0
	var v_Z: Variant = 0
	var v_A: Variant = 0
	var v_B: Variant = 0
	var v_AA: Variant = 0
	var v_AB: Variant = 0
	var v_BA: Variant = 0
	var v_BB: Variant = 0
	var v_hash: Variant = 0
	var v_g1: Variant = NAN
	var v_g2: Variant = NAN
	var v_g3: Variant = NAN
	var v_g4: Variant = NAN
	var v_g5: Variant = NAN
	var v_g6: Variant = NAN
	var v_g7: Variant = NAN
	var v_g8: Variant = NAN
	var v_color: Variant = 0
	var v_s: Variant = NAN
	var v_width: Variant = 0
	var v_height: Variant = 0
	var v_bitmap: Variant = R.coerce((a[0] if a.size() > 0 else null), "BitmapData")
	var v__x: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v__y: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	var v__z: Variant = R.coerce((a[3] if a.size() > 3 else 0), "Number")
	v_fFreq = float(NAN)
	v_fPers = float(NAN)
	v_x = float(NAN)
	v_y = float(NAN)
	v_z = float(NAN)
	v_xf = float(NAN)
	v_yf = float(NAN)
	v_zf = float(NAN)
	v_u = float(NAN)
	v_v = float(NAN)
	v_w = float(NAN)
	v_x1 = float(NAN)
	v_y1 = float(NAN)
	v_z1 = float(NAN)
	v_baseX = float(NAN)
	v_px = R.coerce(0, "int")
	v_py = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_X = R.coerce(0, "int")
	v_Y = R.coerce(0, "int")
	v_Z = R.coerce(0, "int")
	v_A = R.coerce(0, "int")
	v_B = R.coerce(0, "int")
	v_AA = R.coerce(0, "int")
	v_AB = R.coerce(0, "int")
	v_BA = R.coerce(0, "int")
	v_BB = R.coerce(0, "int")
	v_hash = R.coerce(0, "int")
	v_g1 = float(NAN)
	v_g2 = float(NAN)
	v_g3 = float(NAN)
	v_g4 = float(NAN)
	v_g5 = float(NAN)
	v_g6 = float(NAN)
	v_g7 = float(NAN)
	v_g8 = float(NAN)
	v_color = R.coerce(0, "int")
	if R.truth(R.unary("!", R.static_value("Perlin", "initialized"))):
		pass
		R.invoke(R.resolve(c, "init", "Perlin"), [])
	v_s = float(0)
	v_baseX = float((float((float(v__x) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iXoffset"))))
	v__y = float((float((float(v__y) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iYoffset"))))
	v__z = float((float((float(v__z) * float(R.static_value("Perlin", "baseFactor")))) + float(R.static_value("Perlin", "iZoffset"))))
	v_width = R.coerce(R.get_value(v_bitmap, "width"), "int")
	v_height = R.coerce(R.get_value(v_bitmap, "height"), "int")
	v_py = R.coerce(0, "int")
	while R.truth((float(v_py) < float(v_height))):
		pass
		v__x = float(v_baseX)
		v_px = R.coerce(0, "int")
		while R.truth((float(v_px) < float(v_width))):
			pass
			v_s = float(0)
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(R.static_value("Perlin", "iOctaves")))):
				pass
				v_fFreq = float(R.num(R.get_value(R.static_value("Perlin", "aOctFreq"), v_i)))
				v_fPers = float(R.num(R.get_value(R.static_value("Perlin", "aOctPers"), v_i)))
				v_x = float((float(v__x) * float(v_fFreq)))
				v_y = float((float(v__y) * float(v_fFreq)))
				v_z = float((float(v__z) * float(v_fFreq)))
				v_xf = float(floorf(float(v_x)))
				v_yf = float(floorf(float(v_y)))
				v_zf = float(floorf(float(v_z)))
				v_X = R.coerce(R.binary("&", v_xf, 255), "int")
				v_Y = R.coerce(R.binary("&", v_yf, 255), "int")
				v_Z = R.coerce(R.binary("&", v_zf, 255), "int")
				v_x = R.coerce(R.binary("-", v_x, v_xf), "Number")
				v_y = R.coerce(R.binary("-", v_y, v_yf), "Number")
				v_z = R.coerce(R.binary("-", v_z, v_zf), "Number")
				v_u = float((float((float((float(v_x) * float(v_x))) * float(v_x))) * float((float((float(v_x) * float((float((float(v_x) * float(6))) - float(15))))) + float(10)))))
				v_v = float((float((float((float(v_y) * float(v_y))) * float(v_y))) * float((float((float(v_y) * float((float((float(v_y) * float(6))) - float(15))))) + float(10)))))
				v_w = float((float((float((float(v_z) * float(v_z))) * float(v_z))) * float((float((float(v_z) * float((float((float(v_z) * float(6))) - float(15))))) + float(10)))))
				v_A = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_X), "int")) + float(v_Y)), "int")
				v_AA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_A), "int")) + float(v_Z)), "int")
				v_AB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_A) + float(1)), "int")), "int")) + float(v_Z)), "int")
				v_B = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_X) + float(1)), "int")), "int")) + float(v_Y)), "int")
				v_BA = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), v_B), "int")) + float(v_Z)), "int")
				v_BB = R.coerce((float(R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_B) + float(1)), "int")), "int")) + float(v_Z)), "int")
				v_x1 = float((float(v_x) - float(1)))
				v_y1 = float((float(v_y) - float(1)))
				v_z1 = float((float(v_z) - float(1)))
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BB) + float(1)), "int")), "int"), 15), "int")
				v_g1 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AB) + float(1)), "int")), "int"), 15), "int")
				v_g2 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_BA) + float(1)), "int")), "int"), 15), "int")
				v_g3 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), R.coerce((float(v_AA) + float(1)), "int")), "int"), 15), "int")
				v_g4 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z1)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z1))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BB), "int"), 15), "int")
				v_g5 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AB), "int"), 15), "int")
				v_g6 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y1) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y1))), ((v_y1 if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y1) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_BA), "int"), 15), "int")
				v_g7 = R.coerce(R.binary("+", ((v_x1 if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x1) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x1 if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x1) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_hash = R.coerce(R.binary("&", R.coerce(R.get_value(R.static_value("Perlin", "p"), v_AA), "int"), 15), "int")
				v_g8 = R.coerce(R.binary("+", ((v_x if R.truth((float(v_hash) < float(8))) else v_y) if R.truth(R.binary("==", R.binary("&", v_hash, 1), 0)) else (R.unary("-", v_x) if R.truth((float(v_hash) < float(8))) else R.unary("-", v_y))), ((v_y if R.truth((float(v_hash) < float(4))) else (v_x if R.truth((float(v_hash) == float(12))) else v_z)) if R.truth(R.binary("==", R.binary("&", v_hash, 2), 0)) else (R.unary("-", v_y) if R.truth((float(v_hash) < float(4))) else (R.unary("-", v_x) if R.truth((float(v_hash) == float(14))) else R.unary("-", v_z))))), "Number")
				v_g2 = R.coerce(R.binary("+", v_g2, (float(v_u) * float((float(v_g1) - float(v_g2))))), "Number")
				v_g4 = R.coerce(R.binary("+", v_g4, (float(v_u) * float((float(v_g3) - float(v_g4))))), "Number")
				v_g6 = R.coerce(R.binary("+", v_g6, (float(v_u) * float((float(v_g5) - float(v_g6))))), "Number")
				v_g8 = R.coerce(R.binary("+", v_g8, (float(v_u) * float((float(v_g7) - float(v_g8))))), "Number")
				v_g4 = R.coerce(R.binary("+", v_g4, (float(v_v) * float((float(v_g2) - float(v_g4))))), "Number")
				v_g8 = R.coerce(R.binary("+", v_g8, (float(v_v) * float((float(v_g6) - float(v_g8))))), "Number")
				v_s = R.coerce(R.binary("+", v_s, (float((float(v_g8) + float((float(v_w) * float((float(v_g4) - float(v_g8))))))) * float(v_fPers))), "Number")
				v_i = R.signed32(v_i + 1)
			v_color = R.coerce(R.coerce((float((float((float(v_s) * float(R.static_value("Perlin", "fPersMax")))) + float(1))) * float(128)), "int"), "int")
			R.invoke(R.get_value(v_bitmap, "setPixel32"), [v_px, v_py, R.binary("|", R.binary("|", R.binary("|", 4278190080, R.binary("<<", v_color, 16)), R.binary("<<", v_color, 8)), v_color)])
			v__x = R.coerce(R.binary("+", v__x, R.static_value("Perlin", "baseFactor")), "Number")
			v_px = R.signed32(v_px + 1)
		v__y = R.coerce(R.binary("+", v__y, R.static_value("Perlin", "baseFactor")), "Number")
		v_py = R.signed32(v_py + 1)
	return null

static func f_get_octaves(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "iOctaves")
	return null

static func f_set_octaves(c: Variant, a: Array) -> Variant:
	var v__iOctaves: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.assign(c, "iOctaves", "Perlin", v__iOctaves, "=")
	R.invoke(R.resolve(c, "octFreqPers", "Perlin"), [])
	return null

static func f_get_falloff(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "fPersistence")
	return null

static func f_set_falloff(c: Variant, a: Array) -> Variant:
	var v__fPersistence: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.assign(c, "fPersistence", "Perlin", v__fPersistence, "=")
	R.invoke(R.resolve(c, "octFreqPers", "Perlin"), [])
	return null

static func f_get_seed(c: Variant, a: Array) -> Variant:
	return R.static_value("Perlin", "iSeed")
	return null

static func f_set_seed(c: Variant, a: Array) -> Variant:
	var v__iSeed: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.assign(c, "iSeed", "Perlin", v__iSeed, "=")
	R.invoke(R.resolve(c, "seedOffset", "Perlin"), [])
	return null

static func f_init(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "seedOffset", "Perlin"), [])
	R.invoke(R.resolve(c, "octFreqPers", "Perlin"), [])
	R.assign(c, "initialized", "Perlin", true, "=")
	return null

static func f_octFreqPers(c: Variant, a: Array) -> Variant:
	var v_fFreq: Variant = NAN
	var v_fPers: Variant = NAN
	var v_i: Variant = 0
	v_fFreq = float(NAN)
	v_fPers = float(NAN)
	v_i = R.coerce(0, "int")
	R.assign(c, "aOctFreq", "Perlin", [], "=")
	R.assign(c, "aOctPers", "Perlin", [], "=")
	R.assign(c, "fPersMax", "Perlin", 0, "=")
	while R.truth((float(v_i) < float(R.static_value("Perlin", "iOctaves")))):
		pass
		v_fFreq = float(pow(float(2), float(v_i)))
		v_fPers = float(pow(float(R.static_value("Perlin", "fPersistence")), float(v_i)))
		R.assign(c, "fPersMax", "Perlin", v_fPers, "+=")
		R.invoke(R.get_value(R.static_value("Perlin", "aOctFreq"), "push"), [v_fFreq])
		R.invoke(R.get_value(R.static_value("Perlin", "aOctPers"), "push"), [v_fPers])
		v_i = R.signed32(v_i + 1)
	R.assign(c, "fPersMax", "Perlin", R.binary("/", 1, R.static_value("Perlin", "fPersMax")), "=")
	return null

static func f_seedOffset(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	R.assign(c, "iXoffset", "Perlin", R.assign(c, "iSeed", "Perlin", R.binary("%", (float(R.static_value("Perlin", "iSeed")) * float(16807)), 2147483647), "="), "=")
	R.assign(c, "iYoffset", "Perlin", R.assign(c, "iSeed", "Perlin", R.binary("%", (float(R.static_value("Perlin", "iSeed")) * float(16807)), 2147483647), "="), "=")
	R.assign(c, "iZoffset", "Perlin", R.assign(c, "iSeed", "Perlin", R.binary("%", (float(R.static_value("Perlin", "iSeed")) * float(16807)), 2147483647), "="), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "aOctFreq", null, "=")
	R.set_value(c, "aOctPers", null, "=")
	R.set_value(c, "fPersMax", NAN, "=")
	R.set_value(c, "iXoffset", NAN, "=")
	R.set_value(c, "iYoffset", NAN, "=")
	R.set_value(c, "iZoffset", NAN, "=")
	R.set_value(c, "p", [151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180, 151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225, 140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148, 247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32, 57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175, 74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122, 60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54, 65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169, 200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64, 52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212, 207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213, 119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9, 129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104, 218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241, 81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157, 184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93, 222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180], "=")
	R.set_value(c, "iOctaves", 4, "=")
	R.set_value(c, "fPersistence", 0.5, "=")
	R.set_value(c, "iSeed", 123, "=")
	R.set_value(c, "baseFactor", R.binary("/", 1, 64), "=")
	R.set_value(c, "initialized", false, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
