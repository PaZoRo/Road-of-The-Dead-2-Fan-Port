extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_fighterjetsideview_2783(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.fighterjetsideview_2783"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.fighterjetsideview_2783"), [45, R.get_value(c, "frame46")])
	return null

static func f_frame46(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.fighterjetsideview_2783"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
