extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SequentialArray(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SequentialArray"), [])
	(c).fields["m_Values"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iIndex"] = R.coerce(0, "int")
	return null

static func f_AddValue(c: Variant, a: Array) -> Variant:
	var v_newValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.invoke(R.get_value((c).fields.get("m_Values"), "push"), [v_newValue])
	return null

static func f_GetValue(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	if R.truth(R.binary("==", (c).fields.get("m_iIndex"), R.get_value((c).fields.get("m_Values"), "length"))):
		pass
		(c).fields["m_iIndex"] = R.coerce(0, "int")
	return R.get_value((c).fields.get("m_Values"), R.binary("-", R.set_value(c, "m_iIndex", 1, "+="), 1))
	return null

static func f_GetNbValues(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_Values"), "length")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Values"] = R.coerce(null, "Array")
	(c).fields["m_iIndex"] = R.coerce(0, "int")
	return null
