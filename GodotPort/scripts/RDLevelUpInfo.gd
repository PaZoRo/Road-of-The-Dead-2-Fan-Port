extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDLevelUpInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDLevelUpInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce(null, "String")
	(c).fields["m_szCategory"] = R.coerce(null, "String")
	(c).fields["m_iLevel"] = R.coerce(0, "int")
	(c).fields["m_iMaxLevel"] = R.coerce(0, "int")
	(c).fields["m_fDuration"] = float(NAN)
	return null
