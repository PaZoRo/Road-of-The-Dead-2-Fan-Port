extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPatternSpawnInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPatternSpawnInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fObjectLength"] = float(NAN)
	(c).fields["m_fObjectPosX"] = float(NAN)
	(c).fields["m_fObjectPosZ"] = float(NAN)
	return null
