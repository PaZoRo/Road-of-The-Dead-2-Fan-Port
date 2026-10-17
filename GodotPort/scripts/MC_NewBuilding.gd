extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_NewBuilding(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_NewBuilding"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Side"] = R.coerce(null, "MovieClip")
	(c).fields["HiddenSoldierIcon"] = R.coerce(null, "MC_HiddenSoldierIcon")
	(c).fields["RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["Inside"] = R.coerce(null, "MovieClip")
	(c).fields["Front"] = R.coerce(null, "MovieClip")
	return null
