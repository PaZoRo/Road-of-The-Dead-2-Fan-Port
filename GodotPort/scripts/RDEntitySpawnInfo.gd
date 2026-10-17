extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEntitySpawnInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDEntitySpawnInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce(null, "String")
	(c).fields["m_fX"] = float(NAN)
	(c).fields["m_fY"] = float(NAN)
	(c).fields["m_fZ"] = float(NAN)
	(c).fields["m_Properties"] = R.coerce(null, "Array")
	return null
