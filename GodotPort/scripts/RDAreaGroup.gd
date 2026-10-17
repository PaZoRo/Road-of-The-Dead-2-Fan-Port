extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDAreaGroup(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDAreaGroup"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce("", "String")
	(c).fields["m_iMinLength"] = R.coerce(20, "int")
	(c).fields["m_iMaxLength"] = R.coerce(30, "int")
	(c).fields["m_bCanBeFirst"] = true
	(c).fields["m_bRandomized"] = true
	(c).fields["m_LinkedGroups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Areas"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iLength"] = R.coerce(0, "int")
	(c).fields["m_AreaIndices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_RandomAreaIndices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null
