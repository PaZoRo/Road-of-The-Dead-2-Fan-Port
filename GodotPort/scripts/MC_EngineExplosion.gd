extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EngineExplosion(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EngineExplosion"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_EngineExplosion"), [31, R.get_value(c, "frame32")])
	return null

static func f_frame32(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_EngineExplosion"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
