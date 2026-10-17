extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RandomHat(c: Variant, a: Array) -> Variant:
	var v_bAutoRefills: Variant = R.coerce((a[0] if a.size() > 0 else true), "Boolean")
	R.invoke(R.super_ref(c, "RandomHat"), [])
	(c).fields["m_bAutoRefills"] = v_bAutoRefills
	(c).fields["m_Values"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_HatValues"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null

static func f_Clear(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_Values"), "splice"), [0, R.get_value((c).fields.get("m_Values"), "length")])
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [0, R.get_value((c).fields.get("m_HatValues"), "length")])
	return null

static func f_AddValue(c: Variant, a: Array) -> Variant:
	var v_newValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.invoke(R.get_value((c).fields.get("m_Values"), "push"), [v_newValue])
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [0, R.get_value((c).fields.get("m_HatValues"), "length")])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Values"), "length"))):
		pass
		R.invoke(R.get_value((c).fields.get("m_HatValues"), "push"), [R.get_value((c).fields.get("m_Values"), v_i)])
		v_i = R.signed32(v_i + 1)
	return null

static func f_GetRandomValue(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iValueIndex: Variant = 0
	var v_randomValue: Variant = null
	v_i = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_HatValues"), "length"), 0)):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bAutoRefills"))):
			pass
			return null
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Values"), "length"))):
			pass
			R.invoke(R.get_value((c).fields.get("m_HatValues"), "push"), [R.get_value((c).fields.get("m_Values"), v_i)])
			v_i = R.signed32(v_i + 1)
	v_iValueIndex = R.coerce(floorf(float((float(randf()) * R.num(R.get_value((c).fields.get("m_HatValues"), "length"))))), "int")
	v_randomValue = R.coerce(R.get_value((c).fields.get("m_HatValues"), v_iValueIndex), "Object")
	R.invoke(R.get_value((c).fields.get("m_HatValues"), "splice"), [v_iValueIndex, 1])
	return v_randomValue
	return null

static func f_IsEmpty(c: Variant, a: Array) -> Variant:
	return R.binary("==", R.get_value((c).fields.get("m_HatValues"), "length"), 0)
	return null

static func f_GetTotalNbValues(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("m_Values"), "length")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bAutoRefills"] = false
	(c).fields["m_Values"] = R.coerce(null, "Array")
	(c).fields["m_HatValues"] = R.coerce(null, "Array")
	return null
