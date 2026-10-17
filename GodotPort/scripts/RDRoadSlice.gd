extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDRoadSlice(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDRoadSlice"), [R.klass("MovieClip")])
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	c.fields["m_bMovableInEditor"] = false
	c.fields["m_bDeletableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSlice"), "SetInitialState"), [])
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	pass
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "graphics"), "clear"), [])
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSlice"), "Destroy"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iType"] = R.coerce(0, "int")
	(c).fields["m_iNextType"] = R.coerce(0, "int")
	(c).fields["m_iIndex"] = R.coerce(0, "int")
	return null
