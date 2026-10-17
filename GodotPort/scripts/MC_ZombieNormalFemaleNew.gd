extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ZombieNormalFemaleNew(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ZombieNormalFemaleNew"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_ZombieNormalFemaleNew"), [0, R.get_value(c, "frame1"), 30, R.get_value(c, "frame31"), 74, R.get_value(c, "frame75"), 80, R.get_value(c, "frame81"), 105, R.get_value(c, "frame106"), 129, R.get_value(c, "frame130"), 153, R.get_value(c, "frame154"), 174, R.get_value(c, "frame175"), 208, R.get_value(c, "frame209"), 229, R.get_value(c, "frame230"), 249, R.get_value(c, "frame250"), 274, R.get_value(c, "frame275"), 290, R.get_value(c, "frame291"), 308, R.get_value(c, "frame309"), 352, R.get_value(c, "frame353"), 367, R.get_value(c, "frame368"), 379, R.get_value(c, "frame380")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_ZombieNormalFemaleNew"), [])
	return null

static func f_frame31(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame75(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame81(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame106(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame130(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame154(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame175(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame209(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame230(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame250(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame275(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame291(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame309(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame353(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame368(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame380(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["Explosion"] = R.coerce(null, "MovieClip")
	return null
