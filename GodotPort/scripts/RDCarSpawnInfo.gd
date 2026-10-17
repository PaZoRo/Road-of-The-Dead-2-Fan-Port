extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCarSpawnInfo(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iMCFrame: Variant = R.coerce((a[1] if a.size() > 1 else 1), "int")
	var v_soundClass: Variant = R.coerce((a[2] if a.size() > 2 else null), "Class")
	R.invoke(R.super_ref(c, "RDCarSpawnInfo"), [])
	(c).fields["m_MCClass"] = R.coerce(v_mcClass, "Class")
	(c).fields["m_iMCFrame"] = R.coerce(v_iMCFrame, "int")
	(c).fields["m_SoundClass"] = R.coerce(v_soundClass, "Class")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_MCClass"] = R.coerce(null, "Class")
	(c).fields["m_iMCFrame"] = R.coerce(0, "int")
	(c).fields["m_SoundClass"] = R.coerce(null, "Class")
	return null
