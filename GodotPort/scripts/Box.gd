extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Box(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Box"), [])
	(c).fields["X"] = float(0)
	(c).fields["Y"] = float(0)
	(c).fields["Z"] = float(0)
	(c).fields["W"] = float(0)
	(c).fields["H"] = float(0)
	(c).fields["D"] = float(0)
	return null

static func f_Set(c: Variant, a: Array) -> Variant:
	var v_fLocX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fLocY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fLocZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fSizeX: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSizeY: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fSizeZ: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	(c).fields["X"] = float(v_fLocX)
	(c).fields["Y"] = float(v_fLocY)
	(c).fields["Z"] = float(v_fLocZ)
	(c).fields["W"] = float(v_fSizeX)
	(c).fields["H"] = float(v_fSizeY)
	(c).fields["D"] = float(v_fSizeZ)
	return null

static func f_SetFromBox(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	(c).fields["X"] = float((v_otherBox).fields.get("X"))
	(c).fields["Y"] = float((v_otherBox).fields.get("Y"))
	(c).fields["Z"] = float((v_otherBox).fields.get("Z"))
	(c).fields["W"] = float((v_otherBox).fields.get("W"))
	(c).fields["H"] = float((v_otherBox).fields.get("H"))
	(c).fields["D"] = float((v_otherBox).fields.get("D"))
	return null

static func f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ", "), (c).fields.get("Z")), ") ("), (c).fields.get("W")), ", "), (c).fields.get("H")), ", "), (c).fields.get("D")), ")")
	return null

static func f_Intersect3D(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	return false
	return null

static func f_Intersect2D(c: Variant, a: Array) -> Variant:
	var v_otherBox: Variant = R.coerce((a[0] if a.size() > 0 else null), "Box")
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = float(NAN)
	(c).fields["Y"] = float(NAN)
	(c).fields["Z"] = float(NAN)
	(c).fields["W"] = float(NAN)
	(c).fields["H"] = float(NAN)
	(c).fields["D"] = float(NAN)
	return null
