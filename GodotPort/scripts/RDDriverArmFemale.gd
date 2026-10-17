extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDDriverArmFemale(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDriverArmFemale"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDDriverArmFemale"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.call_member(c, "UpdateBlood", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateBlood", [])
	return null

static func f_UpdateBlood(c: Variant, a: Array) -> Variant:
	var v_fBlood: Variant = NAN
	v_fBlood = float(NAN)
	if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
		pass
		v_fBlood = float((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")).fields.get("m_fFemaleArmBloodLevel"))
		if R.truth((float(v_fBlood) > float(66))):
			pass
			R.set_value((c).fields.get("Blood1"), "alpha", 0, "=")
		else:
			pass
			if R.truth((float(v_fBlood) > float(33))):
				pass
				R.set_value((c).fields.get("Blood1"), "alpha", 1, "=")
			else:
				pass
				R.set_value((c).fields.get("Blood1"), "alpha", R.binary("/", v_fBlood, 33), "=")
		if R.truth((float(v_fBlood) > float(66))):
			pass
			R.set_value((c).fields.get("Blood2"), "alpha", 1, "=")
		else:
			pass
			if R.truth((float(v_fBlood) > float(33))):
				pass
				R.set_value((c).fields.get("Blood2"), "alpha", R.binary("/", (float(v_fBlood) - float(33)), 33), "=")
			else:
				pass
				R.set_value((c).fields.get("Blood2"), "alpha", 0, "=")
		if R.truth((float(v_fBlood) > float(66))):
			pass
			R.set_value((c).fields.get("Blood3"), "alpha", R.binary("/", (float(v_fBlood) - float(66)), 33), "=")
		else:
			pass
			R.set_value((c).fields.get("Blood3"), "alpha", 0, "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Blood1"] = R.coerce(null, "MovieClip")
	(c).fields["Blood2"] = R.coerce(null, "MovieClip")
	(c).fields["Blood3"] = R.coerce(null, "MovieClip")
	return null
