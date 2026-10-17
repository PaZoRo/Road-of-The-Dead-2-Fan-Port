extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObjectBulletImpact(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObjectBulletImpact"), [null, R.static_value("RDEntity", "Layer_Dynamic")])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	c.fields["m_fScale"] = float(v_fScale)
	R.call_member(c, "InitMCs", [v_mcClass])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
