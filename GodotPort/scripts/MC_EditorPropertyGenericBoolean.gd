extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EditorPropertyGenericBoolean(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EditorPropertyGenericBoolean"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BG"] = R.coerce(null, "MovieClip")
	(c).fields["Check"] = R.coerce(null, "MovieClip")
	(c).fields["Name"] = R.coerce(null, "TextField")
	return null
