extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSpawnerWeightInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpawnerWeightInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Spawner"] = R.coerce(null, "RDSpawnerInfo")
	(c).fields["m_fWeight"] = float(NAN)
	return null
