extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ZombieHard(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ZombieHard"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_ZombieHard"), [0, R.get_value(c, "frame1"), 44, R.get_value(c, "frame45"), 83, R.get_value(c, "frame84"), 89, R.get_value(c, "frame90"), 114, R.get_value(c, "frame115"), 138, R.get_value(c, "frame139"), 161, R.get_value(c, "frame162"), 181, R.get_value(c, "frame182"), 207, R.get_value(c, "frame208"), 227, R.get_value(c, "frame228"), 245, R.get_value(c, "frame246"), 270, R.get_value(c, "frame271"), 283, R.get_value(c, "frame284"), 300, R.get_value(c, "frame301"), 359, R.get_value(c, "frame360"), 376, R.get_value(c, "frame377"), 400, R.get_value(c, "frame401")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_ZombieHard"), [])
	return null

static func f_frame45(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame90(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame115(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame139(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame162(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame182(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame208(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame228(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame246(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame271(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame284(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame301(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame360(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame377(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame401(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["Explosion"] = R.coerce(null, "MovieClip")
	return null
