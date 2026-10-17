extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EditorLoadPanelSlot(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EditorLoadPanelSlot"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Highlight"] = R.coerce(null, "MovieClip")
	(c).fields["BG"] = R.coerce(null, "MovieClip")
	(c).fields["Loading"] = R.coerce(null, "MovieClip")
	return null
