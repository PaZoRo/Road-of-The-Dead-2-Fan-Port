extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_LocationDisplay(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_LocationDisplay"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["LocationName"] = R.coerce(null, "TextField")
	(c).fields["LocationIcon"] = R.coerce(null, "MovieClip")
	(c).fields["LocationDistance"] = R.coerce(null, "TextField")
	(c).fields["CivCount"] = R.coerce(null, "MovieClip")
	return null
