extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCameraShake(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCameraShake"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szShakeName"] = R.coerce(null, "String")
	(c).fields["m_fShakeIntensity"] = float(NAN)
	(c).fields["m_fShakeDuration"] = float(NAN)
	(c).fields["m_fShakeFadeInDuration"] = float(NAN)
	(c).fields["m_fShakeFadeOutDuration"] = float(NAN)
	(c).fields["m_fShakeTimer"] = float(NAN)
	return null
