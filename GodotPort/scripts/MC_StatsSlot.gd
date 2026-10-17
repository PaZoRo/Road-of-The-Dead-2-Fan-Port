extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_StatsSlot(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_StatsSlot"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["StatsCount"] = R.coerce(null, "TextField")
	(c).fields["StatsName"] = R.coerce(null, "TextField")
	return null
