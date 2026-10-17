extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EditorCampaignAreaSlot(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EditorCampaignAreaSlot"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Highlight"] = R.coerce(null, "MovieClip")
	(c).fields["BG"] = R.coerce(null, "MovieClip")
	(c).fields["MoveLeft"] = R.coerce(null, "MC_EditorDialogScroll")
	(c).fields["MoveRight"] = R.coerce(null, "MC_EditorDialogScroll")
	return null
