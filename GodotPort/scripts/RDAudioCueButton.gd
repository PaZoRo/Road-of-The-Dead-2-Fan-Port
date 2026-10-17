extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDAudioCueButton(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDAudioCueButton"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_iMaxDialogIndex"] = R.coerce(0, "int")
	return null
