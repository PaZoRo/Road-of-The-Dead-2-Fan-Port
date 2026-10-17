extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDYellowLine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDYellowLine"), [R.klass("MC_YellowLine"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_fFadeDistance"] = float(30)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_fMinRenderScale"] = float(0.02)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
