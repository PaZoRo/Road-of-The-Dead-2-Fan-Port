extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTVector2D(c: Variant, a: Array) -> Variant:
	var v_inX: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	var v_inY: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.invoke(R.super_ref(c, "DTVector2D"), [])
	(c).fields["X"] = float(v_inX)
	(c).fields["Y"] = float(v_inY)
	return null

static func f_Set(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = float((v_vOther).fields.get("X"))
	(c).fields["Y"] = float((v_vOther).fields.get("Y"))
	return null

static func f_Equals(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return ((float(absf(float((float((c).fields.get("X")) - float((v_vOther).fields.get("X")))))) <= float(R.static_value("Maths", "EPSILON"))) and (float(absf(float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y")))))) <= float(R.static_value("Maths", "EPSILON"))))
	return null

static func f_Add(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = R.coerce(R.binary("+", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("+", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	return null

static func f_Subtract(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	(c).fields["X"] = R.coerce(R.binary("-", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("-", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	return null

static func f_Multiply(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("*", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("*", (c).fields.get("Y"), v_fScalar), "Number")
	return null

static func f_Divide(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fScalar), "Number")
	return null

static func f_Invert(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = R.coerce(R.unary("-", (c).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.unary("-", (c).fields.get("Y")), "Number")
	return null

static func f_Size(c: Variant, a: Array) -> Variant:
	return sqrt(float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))))
	return null

static func f_SquaredSize(c: Variant, a: Array) -> Variant:
	return (float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))
	return null

static func f_Dot(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return (float((float((c).fields.get("X")) * float((v_vOther).fields.get("X")))) + float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Y")))))
	return null

static func f_Cross(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	return (float((float((c).fields.get("X")) * float((v_vOther).fields.get("Y")))) - float((float((c).fields.get("Y")) * float((v_vOther).fields.get("X")))))
	return null

static func f_Normalize(c: Variant, a: Array) -> Variant:
	var v_fSize: Variant = NAN
	v_fSize = R.coerce(R.call_member(c, "Size", []), "Number")
	if R.truth((float(v_fSize) > float(R.static_value("Maths", "EPSILON")))):
		pass
		R.call_member(c, "Divide", [v_fSize])
	else:
		pass
		(c).fields["X"] = float(0)
		(c).fields["Y"] = float(0)
	return v_fSize
	return null

static func f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ")")
	return null

static func f_DistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	return sqrt(float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Zero", R.construct(R.klass("DTVector2D"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = float(NAN)
	(c).fields["Y"] = float(NAN)
	return null
