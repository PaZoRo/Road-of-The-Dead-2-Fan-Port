extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBulletInfo(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBulletInfo"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fPosX"] = float(NAN)
	(c).fields["m_fPosY"] = float(NAN)
	(c).fields["m_fSpreadAngle"] = float(NAN)
	(c).fields["m_fSpreadAmplitude"] = float(NAN)
	(c).fields["m_fDamage"] = float(NAN)
	return null
