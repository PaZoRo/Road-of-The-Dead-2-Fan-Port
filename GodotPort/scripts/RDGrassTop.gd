extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGrassTop(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDGrassTop"), [R.klass("MC_grasstop"), R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDGrassTop", "Scale")])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [R.binary("+", R.call_static("Maths", "RandomInt", [3]), 1)])
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGrassTop"), "SetInitialState"), [])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [R.binary("+", R.call_static("Maths", "RandomInt", [3]), 1)])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
