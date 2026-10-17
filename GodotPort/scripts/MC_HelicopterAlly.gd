extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_HelicopterAlly(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_HelicopterAlly"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_HelicopterAlly"), [0, R.get_value(c, "frame1"), 172, R.get_value(c, "frame173"), 223, R.get_value(c, "frame224")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_HelicopterAlly"), [])
	return null

static func f_frame173(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_HelicopterAlly"), ["Idle"])
	return null

static func f_frame224(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_HelicopterAlly"), ["Idle"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["MuzzleFlash"] = R.coerce(null, "MovieClip")
	return null
