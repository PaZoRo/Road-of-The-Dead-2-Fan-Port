extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObjectDust(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectDust"), [R.klass("MC_HelicopterDust"), R.static_value("RDEntity", "Layer_Dynamic")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
