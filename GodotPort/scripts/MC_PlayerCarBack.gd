extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_PlayerCarBack(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_PlayerCarBack"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_PlayerCarBack"), [25, R.get_value(c, "frame26"), 56, R.get_value(c, "frame57"), 70, R.get_value(c, "frame71"), 84, R.get_value(c, "frame85")])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_PlayerCarBack"), [])
	return null

static func f_frame57(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_PlayerCarBack"), [])
	return null

static func f_frame71(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_PlayerCarBack"), [])
	return null

static func f_frame85(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_PlayerCarBack"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Hummer"] = R.coerce(null, "MovieClip")
	return null
