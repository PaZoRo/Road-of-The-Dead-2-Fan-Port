extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDProjectile(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	R.invoke(R.super_ref(c, "RDProjectile"), [v_mcClass, v_fScale])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDProjectile"), "SetInitialState"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_vTrajectoryStart"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_Instigator"] = R.coerce(null, "RDEntity")
	return null
