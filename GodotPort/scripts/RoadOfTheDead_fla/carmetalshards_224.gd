extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_carmetalshards_224(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.carmetalshards_224"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.carmetalshards_224"), [17, R.get_value(c, "frame18"), 37, R.get_value(c, "frame38"), 58, R.get_value(c, "frame59"), 81, R.get_value(c, "frame82"), 102, R.get_value(c, "frame103")])
	return null

static func f_frame18(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.carmetalshards_224"), [])
	return null

static func f_frame38(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.carmetalshards_224"), [])
	return null

static func f_frame59(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.carmetalshards_224"), [])
	return null

static func f_frame82(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.carmetalshards_224"), [])
	return null

static func f_frame103(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.carmetalshards_224"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
