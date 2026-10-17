extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ZombieVeryHard(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ZombieVeryHard"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_ZombieVeryHard"), [0, R.get_value(c, "frame1"), 12, R.get_value(c, "frame13"), 37, R.get_value(c, "frame38"), 61, R.get_value(c, "frame62"), 84, R.get_value(c, "frame85"), 105, R.get_value(c, "frame106"), 125, R.get_value(c, "frame126"), 142, R.get_value(c, "frame143"), 166, R.get_value(c, "frame167"), 177, R.get_value(c, "frame178"), 197, R.get_value(c, "frame198"), 227, R.get_value(c, "frame228"), 276, R.get_value(c, "frame277"), 298, R.get_value(c, "frame299"), 309, R.get_value(c, "frame310"), 340, R.get_value(c, "frame341"), 347, R.get_value(c, "frame348"), 379, R.get_value(c, "frame380"), 389, R.get_value(c, "frame390"), 402, R.get_value(c, "frame403"), 409, R.get_value(c, "frame410"), 419, R.get_value(c, "frame420"), 450, R.get_value(c, "frame451"), 456, R.get_value(c, "frame457"), 467, R.get_value(c, "frame468"), 478, R.get_value(c, "frame479"), 485, R.get_value(c, "frame486"), 497, R.get_value(c, "frame498"), 508, R.get_value(c, "frame509"), 516, R.get_value(c, "frame517")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_ZombieVeryHard"), [])
	return null

static func f_frame13(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame38(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame62(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame85(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame106(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame126(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame143(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame167(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["EndHitForBlood"])
	return null

static func f_frame178(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame198(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame228(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame277(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame299(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame310(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame341(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame348(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame380(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame390(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame403(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame410(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame420(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame451(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame457(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame468(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame479(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame486(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_frame498(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame509(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["PlayStepSound"])
	return null

static func f_frame517(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["AnimEnded"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Explosion"] = R.coerce(null, "MovieClip")
	return null
