extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ZombieSoldier(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ZombieSoldier"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_ZombieSoldier"), [0, R.get_value(c, "frame1"), 40, R.get_value(c, "frame41"), 79, R.get_value(c, "frame80"), 85, R.get_value(c, "frame86"), 108, R.get_value(c, "frame109"), 134, R.get_value(c, "frame135"), 158, R.get_value(c, "frame159"), 182, R.get_value(c, "frame183"), 213, R.get_value(c, "frame214"), 229, R.get_value(c, "frame230"), 246, R.get_value(c, "frame247"), 272, R.get_value(c, "frame273"), 288, R.get_value(c, "frame289"), 306, R.get_value(c, "frame307"), 324, R.get_value(c, "frame325")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_ZombieSoldier"), [])
	return null

static func f_frame41(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame80(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame86(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame109(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame135(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame159(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame183(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame214(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame230(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame247(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame273(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame289(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame307(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame325(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["Explosion"] = R.coerce(null, "MovieClip")
	return null
