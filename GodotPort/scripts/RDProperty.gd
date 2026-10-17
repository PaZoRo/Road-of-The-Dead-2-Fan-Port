extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDProperty(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_defaultValue: Variant = R.coerce((a[2] if a.size() > 2 else null), "*")
	R.invoke(R.super_ref(c, "RDProperty"), [])
	(c).fields["m_szName"] = R.coerce(v_szName, "String")
	(c).fields["m_iType"] = R.coerce(v_iType, "int")
	R.call_member(c, "SetValue", [v_defaultValue])
	return null

static func f_SetValue(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
		pass
		(c).fields["m_fNumberValue"] = float(R.binary("as", v_value, R.klass("Number")))
	else:
		pass
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
			pass
			(c).fields["m_bBooleanValue"] = R.binary("as", v_value, R.klass("Boolean"))
		else:
			pass
			if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
				pass
				(c).fields["m_szStringValue"] = R.coerce(R.binary("as", v_value, R.klass("String")), "String")
	return null

static func f_GetValue(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
		pass
		return (c).fields.get("m_fNumberValue")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
		pass
		return (c).fields.get("m_bBooleanValue")
	if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
		pass
		return (c).fields.get("m_szStringValue")
	return null
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Number", 0, "=")
	R.set_value(c, "Type_Boolean", 1, "=")
	R.set_value(c, "Type_String", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce(null, "String")
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_fNumberValue"] = float(0)
	(c).fields["m_bBooleanValue"] = false
	(c).fields["m_szStringValue"] = R.coerce("", "String")
	return null
