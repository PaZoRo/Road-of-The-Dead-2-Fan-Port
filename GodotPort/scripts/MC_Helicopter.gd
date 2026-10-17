extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_Helicopter(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_Helicopter"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_Helicopter"), [0, R.get_value(c, "frame1"), 172, R.get_value(c, "frame173"), 225, R.get_value(c, "frame226"), 305, R.get_value(c, "frame306"), 315, R.get_value(c, "frame316"), 323, R.get_value(c, "frame324"), 334, R.get_value(c, "frame335"), 341, R.get_value(c, "frame342"), 351, R.get_value(c, "frame352"), 360, R.get_value(c, "frame361"), 366, R.get_value(c, "frame367"), 372, R.get_value(c, "frame373"), 378, R.get_value(c, "frame379"), 379, R.get_value(c, "frame380"), 402, R.get_value(c, "frame403")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_Helicopter"), [])
	return null

static func f_frame173(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_Helicopter"), ["Idle"])
	return null

static func f_frame226(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_Helicopter"), ["Idle"])
	return null

static func f_frame306(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "MC_Helicopter"), ["Crash"])
	return null

static func f_frame316(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame324(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound2"])
	return null

static func f_frame335(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame342(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame352(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound2"])
	return null

static func f_frame361(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame367(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame373(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound2"])
	return null

static func f_frame379(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["ExplosionSound1"])
	return null

static func f_frame380(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["FinalExplosion"])
	return null

static func f_frame403(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Smoke"] = R.coerce(null, "MC_Smoke")
	(c).fields["MuzzleFlash"] = R.coerce(null, "MovieClip")
	return null
