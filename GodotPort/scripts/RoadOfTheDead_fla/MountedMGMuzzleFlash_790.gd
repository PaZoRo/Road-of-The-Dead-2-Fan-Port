extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MountedMGMuzzleFlash_790(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.MountedMGMuzzleFlash_790"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.MountedMGMuzzleFlash_790"), [3, R.get_value(c, "frame4"), 7, R.get_value(c, "frame8"), 11, R.get_value(c, "frame12")])
	return null

static func f_frame4(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MountedMGMuzzleFlash_790"), [])
	return null

static func f_frame8(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MountedMGMuzzleFlash_790"), [])
	return null

static func f_frame12(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.MountedMGMuzzleFlash_790"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
