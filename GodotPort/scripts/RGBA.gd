extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RGBA(c: Variant, a: Array) -> Variant:
	var v_fR: Variant = R.coerce((a[0] if a.size() > 0 else 255), "int")
	var v_fG: Variant = R.coerce((a[1] if a.size() > 1 else 255), "int")
	var v_fB: Variant = R.coerce((a[2] if a.size() > 2 else 255), "int")
	var v_fA: Variant = R.coerce((a[3] if a.size() > 3 else 255), "int")
	R.invoke(R.super_ref(c, "RGBA"), [])
	(c).fields["R"] = R.coerce(v_fR, "int")
	(c).fields["G"] = R.coerce(v_fG, "int")
	(c).fields["B"] = R.coerce(v_fB, "int")
	(c).fields["A"] = R.coerce(v_fA, "int")
	return null

static func f_Lerp(c: Variant, a: Array) -> Variant:
	var v_colorA: Variant = R.coerce((a[0] if a.size() > 0 else null), "RGBA")
	var v_colorB: Variant = R.coerce((a[1] if a.size() > 1 else null), "RGBA")
	var v_fRatio: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_outColor: Variant = R.coerce((a[3] if a.size() > 3 else null), "RGBA")
	(v_outColor).fields["R"] = R.coerce((float((float(v_fRatio) * float((v_colorB).fields.get("R")))) + float((float((float(1) - float(v_fRatio))) * float((v_colorA).fields.get("R"))))), "int")
	(v_outColor).fields["G"] = R.coerce((float((float(v_fRatio) * float((v_colorB).fields.get("G")))) + float((float((float(1) - float(v_fRatio))) * float((v_colorA).fields.get("G"))))), "int")
	(v_outColor).fields["B"] = R.coerce((float((float(v_fRatio) * float((v_colorB).fields.get("B")))) + float((float((float(1) - float(v_fRatio))) * float((v_colorA).fields.get("B"))))), "int")
	(v_outColor).fields["A"] = R.coerce((float((float(v_fRatio) * float((v_colorB).fields.get("A")))) + float((float((float(1) - float(v_fRatio))) * float((v_colorA).fields.get("A"))))), "int")
	return null

static func f_Set(c: Variant, a: Array) -> Variant:
	var v_otherColor: Variant = R.coerce((a[0] if a.size() > 0 else null), "RGBA")
	(c).fields["R"] = R.coerce((v_otherColor).fields.get("R"), "int")
	(c).fields["G"] = R.coerce((v_otherColor).fields.get("G"), "int")
	(c).fields["B"] = R.coerce((v_otherColor).fields.get("B"), "int")
	(c).fields["A"] = R.coerce((v_otherColor).fields.get("A"), "int")
	return null

static func f_ToInteger(c: Variant, a: Array) -> Variant:
	return (float((float((float(R.binary("/", (c).fields.get("R"), 255)) * float(R.static_value("RGBA", "kMaxRedInteger")))) + float((float(R.binary("/", (c).fields.get("G"), 255)) * float(R.static_value("RGBA", "kMaxGreenInteger")))))) + float((float(R.binary("/", (c).fields.get("B"), 255)) * float(R.static_value("RGBA", "kMaxBlueInteger")))))
	return null

static func f_ToString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", (c).fields.get("R"), ", "), (c).fields.get("G")), ", "), (c).fields.get("B")), ", "), (c).fields.get("A"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "kMaxRedInteger", 16711680, "=")
	R.set_value(c, "kMaxGreenInteger", 65280, "=")
	R.set_value(c, "kMaxBlueInteger", 255, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["R"] = R.coerce(0, "int")
	(c).fields["G"] = R.coerce(0, "int")
	(c).fields["B"] = R.coerce(0, "int")
	(c).fields["A"] = R.coerce(0, "int")
	return null
