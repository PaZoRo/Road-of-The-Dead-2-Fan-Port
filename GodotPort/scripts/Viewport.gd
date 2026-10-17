extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Viewport(c: Variant, a: Array) -> Variant:
	var v_iWidth: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iHeight: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.super_ref(c, "Viewport"), [])
	(c).fields["m_iWidth"] = R.coerce(v_iWidth, "int")
	(c).fields["m_iHalfWidth"] = R.coerce(R.binary("/", (c).fields.get("m_iWidth"), 2), "int")
	(c).fields["m_iQuarterWidth"] = R.coerce(R.binary("/", (c).fields.get("m_iWidth"), 4), "int")
	(c).fields["m_iEightWidth"] = R.coerce(R.binary("/", (c).fields.get("m_iWidth"), 8), "int")
	(c).fields["m_iHeight"] = R.coerce(v_iHeight, "int")
	(c).fields["m_iHalfHeight"] = R.coerce(R.binary("/", (c).fields.get("m_iHeight"), 2), "int")
	(c).fields["m_iQuarterHeight"] = R.coerce(R.binary("/", (c).fields.get("m_iHeight"), 4), "int")
	(c).fields["m_iEightHeight"] = R.coerce(R.binary("/", (c).fields.get("m_iHeight"), 8), "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iWidth"] = R.coerce(0, "int")
	(c).fields["m_iHalfWidth"] = R.coerce(0, "int")
	(c).fields["m_iQuarterWidth"] = R.coerce(0, "int")
	(c).fields["m_iEightWidth"] = R.coerce(0, "int")
	(c).fields["m_iHeight"] = R.coerce(0, "int")
	(c).fields["m_iHalfHeight"] = R.coerce(0, "int")
	(c).fields["m_iQuarterHeight"] = R.coerce(0, "int")
	(c).fields["m_iEightHeight"] = R.coerce(0, "int")
	return null
