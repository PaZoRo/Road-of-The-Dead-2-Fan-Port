extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_MCWithAllSounds(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_MCWithAllSounds"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_MCWithAllSounds"), [0, R.resolve(c, "frame1", "MC_MCWithAllSounds")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_MCWithAllSounds"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
