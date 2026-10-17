extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSpawnerInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpawnerInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_All", 0, "=")
	R.set_value(c, "Type_Soldier", 1, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Entity"] = R.coerce(null, "RDEntity")
	(c).fields["m_iType"] = R.coerce(0, "int")
	return null
