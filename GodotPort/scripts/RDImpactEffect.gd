extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDImpactEffect(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDImpactEffect"), [null, R.static_value("RDEntity", "Layer_Dynamic"), 1.5])
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(50)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
