extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCarDrivingAway(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCarDrivingAway"), [R.klass("MC_CarDrivingAway")])
	c.fields["m_fMinRenderScale"] = float(0.003)
	c.fields["m_bSelectableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCarDrivingAway"), "SetInitialState"), [])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c.fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("Z"), (float(R.static_value("RDCarDrivingAway", "Speed")) * float(v_fDeltaTime))), "Number")
	R.call_member(c, "UpdateDepthPosition", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Speed", R.binary("/", R.binary("/", (float(135) * float(1000)), 60), 60), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
