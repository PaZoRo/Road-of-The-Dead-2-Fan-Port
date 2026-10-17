extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCameraEditor(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCameraEditor"), [])
	c.fields["m_fMaxViewDistance"] = float(150)
	c.fields["m_fRampDistance"] = float(300)
	c.fields["m_fRampFactor"] = float(R.binary("/", 3500, c.fields.get("m_fRampDistance")))
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = float(R.static_value("RDCameraEditor", "CamHeight"))
	R.invoke(R.get_value(c.fields.get("m_RotationMatrix"), "identity"), [])
	R.invoke(R.get_value(c.fields.get("m_RotationMatrix"), "appendRotation"), [R.unary("-", (c.fields.get("m_vRotation")).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
	c.fields["m_fRelativeLocationX"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "CamHeight", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
