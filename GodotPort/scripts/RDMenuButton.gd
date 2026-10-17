extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDMenuButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMenuButton"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["LeftName"] = R.coerce(null, "TextField")
	(c).fields["m_fOriginalPosX"] = float(NAN)
	(c).fields["m_fOriginalPosY"] = float(NAN)
	return null
