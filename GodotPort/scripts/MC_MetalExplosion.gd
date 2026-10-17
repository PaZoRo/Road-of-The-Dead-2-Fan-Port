extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_MetalExplosion(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_MetalExplosion"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_MetalExplosion"), [25, R.get_value(c, "frame26")])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_MetalExplosion"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
