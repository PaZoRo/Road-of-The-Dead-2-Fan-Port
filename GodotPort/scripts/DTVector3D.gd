extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTVector3D(c: Variant, a: Array) -> Variant:
	var v_inX: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	var v_inY: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v_inZ: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	R.invoke(R.super_ref(c, "DTVector3D"), [])
	(c).fields["X"] = float(v_inX)
	(c).fields["Y"] = float(v_inY)
	(c).fields["Z"] = float(v_inZ)
	return null

static func f_Set(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = float((v_vOther).fields.get("X"))
	(c).fields["Y"] = float((v_vOther).fields.get("Y"))
	(c).fields["Z"] = float((v_vOther).fields.get("Z"))
	return null

static func f_SetValues(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["X"] = float(v_fX)
	(c).fields["Y"] = float(v_fY)
	(c).fields["Z"] = float(v_fZ)
	return null

static func f_Equals(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	return (((float(absf(float((float((c).fields.get("X")) - float((v_vOther).fields.get("X")))))) <= float(R.static_value("Maths", "EPSILON"))) and (float(absf(float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y")))))) <= float(R.static_value("Maths", "EPSILON")))) and (float(absf(float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z")))))) <= float(R.static_value("Maths", "EPSILON"))))
	return null

static func f_Add(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = R.coerce(R.binary("+", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("+", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.binary("+", (c).fields.get("Z"), (v_vOther).fields.get("Z")), "Number")
	return null

static func f_Subtract(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	(c).fields["X"] = R.coerce(R.binary("-", (c).fields.get("X"), (v_vOther).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.binary("-", (c).fields.get("Y"), (v_vOther).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.binary("-", (c).fields.get("Z"), (v_vOther).fields.get("Z")), "Number")
	return null

static func f_Multiply(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("*", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("*", (c).fields.get("Y"), v_fScalar), "Number")
	(c).fields["Z"] = R.coerce(R.binary("*", (c).fields.get("Z"), v_fScalar), "Number")
	return null

static func f_Divide(c: Variant, a: Array) -> Variant:
	var v_fScalar: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fScalar), "Number")
	(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fScalar), "Number")
	(c).fields["Z"] = R.coerce(R.binary("/", (c).fields.get("Z"), v_fScalar), "Number")
	return null

static func f_Invert(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = R.coerce(R.unary("-", (c).fields.get("X")), "Number")
	(c).fields["Y"] = R.coerce(R.unary("-", (c).fields.get("Y")), "Number")
	(c).fields["Z"] = R.coerce(R.unary("-", (c).fields.get("Z")), "Number")
	return null

static func f_SetZero(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = float(0)
	(c).fields["Y"] = float(0)
	(c).fields["Z"] = float(0)
	return null

static func f_GetLength(c: Variant, a: Array) -> Variant:
	return sqrt(float((float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((c).fields.get("Z")))))))
	return null

static func f_GetSquaredLength(c: Variant, a: Array) -> Variant:
	return (float((float((float((c).fields.get("X")) * float((c).fields.get("X")))) + float((float((c).fields.get("Y")) * float((c).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((c).fields.get("Z")))))
	return null

static func f_Dot(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	return (float((float((float((c).fields.get("X")) * float((v_vOther).fields.get("X")))) + float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Y")))))) + float((float((c).fields.get("Z")) * float((v_vOther).fields.get("Z")))))
	return null

static func f_Cross(c: Variant, a: Array) -> Variant:
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vOut: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	(v_vOut).fields["X"] = float((float((float((c).fields.get("Y")) * float((v_vOther).fields.get("Z")))) - float((float((c).fields.get("Z")) * float((v_vOther).fields.get("Y"))))))
	(v_vOut).fields["Y"] = float((float((float((c).fields.get("Z")) * float((v_vOther).fields.get("X")))) - float((float((c).fields.get("X")) * float((v_vOther).fields.get("Z"))))))
	(v_vOut).fields["Z"] = float((float((float((c).fields.get("X")) * float((v_vOther).fields.get("Y")))) - float((float((c).fields.get("Y")) * float((v_vOther).fields.get("X"))))))
	return v_vOut
	return null

static func f_Normalize(c: Variant, a: Array) -> Variant:
	var v_fSize: Variant = NAN
	v_fSize = R.coerce(R.call_member(c, "GetLength", []), "Number")
	if R.truth((float(v_fSize) > float(R.static_value("Maths", "EPSILON")))):
		pass
		(c).fields["X"] = R.coerce(R.binary("/", (c).fields.get("X"), v_fSize), "Number")
		(c).fields["Y"] = R.coerce(R.binary("/", (c).fields.get("Y"), v_fSize), "Number")
		(c).fields["Z"] = R.coerce(R.binary("/", (c).fields.get("Z"), v_fSize), "Number")
	else:
		pass
		(c).fields["X"] = float(0)
		(c).fields["Y"] = float(0)
		(c).fields["Z"] = float(0)
	return v_fSize
	return null

static func f_IsZero(c: Variant, a: Array) -> Variant:
	return (((float((c).fields.get("X")) == float(0)) and (float((c).fields.get("Y")) == float(0))) and (float((c).fields.get("Z")) == float(0)))
	return null

static func f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "(", (c).fields.get("X")), ", "), (c).fields.get("Y")), ", "), (c).fields.get("Z")), ")")
	return null

static func f_DistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return sqrt(float((float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))))
	return null

static func f_SquaredDistanceFrom(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return (float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))
	return null

static func f_IsNear(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_vOther: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fX = float((float((c).fields.get("X")) - float((v_vOther).fields.get("X"))))
	v_fY = float((float((c).fields.get("Y")) - float((v_vOther).fields.get("Y"))))
	v_fZ = float((float((c).fields.get("Z")) - float((v_vOther).fields.get("Z"))))
	return (float(sqrt(float((float((float((float(v_fX) * float(v_fX))) + float((float(v_fY) * float(v_fY))))) + float((float(v_fZ) * float(v_fZ))))))) < float(1))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Zero", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "Up", R.construct(R.klass("DTVector3D"), [0, 1, 0]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["X"] = float(NAN)
	(c).fields["Y"] = float(NAN)
	(c).fields["Z"] = float(NAN)
	return null
