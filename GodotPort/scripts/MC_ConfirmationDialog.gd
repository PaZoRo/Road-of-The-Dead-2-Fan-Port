extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_ConfirmationDialog(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_ConfirmationDialog"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["NoButton"] = R.coerce(null, "SimpleButton")
	(c).fields["ResumeButton"] = R.coerce(null, "SimpleButton")
	(c).fields["NewButton"] = R.coerce(null, "SimpleButton")
	(c).fields["ConfirmationMessage"] = R.coerce(null, "TextField")
	(c).fields["YesButton"] = R.coerce(null, "SimpleButton")
	return null
