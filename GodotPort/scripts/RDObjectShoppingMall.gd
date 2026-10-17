extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObjectShoppingMall(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectShoppingMall"), [R.klass("MC_ShoppingMall"), R.static_value("RDEntity", "Layer_Dynamic"), 9])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
