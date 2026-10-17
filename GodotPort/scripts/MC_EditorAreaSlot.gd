extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EditorAreaSlot(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EditorAreaSlot"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BG"] = R.coerce(null, "MovieClip")
	return null
