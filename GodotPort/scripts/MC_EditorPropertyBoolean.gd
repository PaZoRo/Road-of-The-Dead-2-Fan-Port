extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_EditorPropertyBoolean(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_EditorPropertyBoolean"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_EditorPropertyBoolean"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.assign(c, "mouseChildren", "MC_EditorPropertyBoolean", false, "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BG"] = R.coerce(null, "MovieClip")
	(c).fields["Check"] = R.coerce(null, "MovieClip")
	(c).fields["Name"] = R.coerce(null, "TextField")
	return null
