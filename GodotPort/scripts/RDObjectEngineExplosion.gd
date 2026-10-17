extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObjectEngineExplosion(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectEngineExplosion"), [R.klass("MC_EngineExplosion"), R.static_value("RDEntity", "Layer_Dynamic"), 6])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
