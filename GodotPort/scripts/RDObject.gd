extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObject(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iLayer: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fScale: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	R.invoke(R.super_ref(c, "RDObject"), [v_mcClass, v_fScale])
	c.fields["m_fMinRenderScale"] = float(0.001)
	c.fields["m_iLayer"] = R.coerce(v_iLayer, "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObject"), "SetInitialState"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
