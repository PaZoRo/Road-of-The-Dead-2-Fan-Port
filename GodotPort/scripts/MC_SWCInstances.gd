extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_SWCInstances(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_SWCInstances"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_SWCInstances"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["allSounds"] = R.coerce(null, "MC_MCWithAllSounds")
	return null
