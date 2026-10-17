extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEventBlood(c: Variant, a: Array) -> Variant:
	var v_iNbBloods: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bDoFlash: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.invoke(R.super_ref(c, "RDEventBlood"), ["RDEventBlood"])
	(c).fields["m_iNbBloods"] = R.coerce(v_iNbBloods, "int")
	(c).fields["m_bDoFlash"] = v_bDoFlash
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iNbBloods"] = R.coerce(0, "int")
	(c).fields["m_bDoFlash"] = false
	return null
