extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_aprilfoolsbloodimpact(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_aprilfoolsbloodimpact"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_aprilfoolsbloodimpact"), [20, R.get_value(c, "frame21")])
	return null

static func f_frame21(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_aprilfoolsbloodimpact"), [])
	if R.truth(R.logical_and(R.truth(R.resolve(c, "parent", "MC_aprilfoolsbloodimpact")), func(): return R.invoke(R.get_value(R.resolve(c, "parent", "MC_aprilfoolsbloodimpact"), "contains"), [c]))):
		pass
		if R.truth(R.get_value(c, "m_owner")):
			pass
			R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnEffectEnded"), [c])
		R.invoke(R.get_value(R.resolve(c, "parent", "MC_aprilfoolsbloodimpact"), "removeChild"), [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
