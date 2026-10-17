extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPatternInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPatternInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Regular", 0, "=")
	R.set_value(c, "Type_AlleywayResidential", 1, "=")
	R.set_value(c, "Type_AlleywayTown", 2, "=")
	R.set_value(c, "Type_AlleywayIndustrial", 3, "=")
	R.set_value(c, "Type_AlleywayMixed", 4, "=")
	R.set_value(c, "Type_Highway", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce("", "String")
	(c).fields["m_szDescription"] = R.coerce("", "String")
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_iID"] = R.coerce(0, "int")
	(c).fields["m_szAuthorName"] = R.coerce("", "String")
	(c).fields["m_Icon"] = R.coerce(null, "ByteArray")
	(c).fields["m_Data"] = R.coerce(null, "ByteArray")
	(c).fields["m_Pattern"] = R.coerce(null, "RDLevelPatternCustomData")
	return null
