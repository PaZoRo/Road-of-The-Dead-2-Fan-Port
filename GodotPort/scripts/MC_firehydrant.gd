extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_firehydrant(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_firehydrant"), [])
	R.invoke(R.resolve(c, "addFrameScript", "MC_firehydrant"), [1, R.get_value(c, "frame2"), 18, R.get_value(c, "frame19"), 19, R.get_value(c, "frame20"), 47, R.get_value(c, "frame48"), 48, R.get_value(c, "frame49"), 49, R.get_value(c, "frame50"), 65, R.get_value(c, "frame66")])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Water"), "gotoAndPlay"), [1])
	return null

static func f_frame19(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_frame20(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Water"), "gotoAndPlay"), [1])
	return null

static func f_frame48(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "MC_firehydrant"), [])
	return null

static func f_frame49(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Water"), "gotoAndPlay"), [1])
	return null

static func f_frame50(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("Water"), "gotoAndPlay"), [1])
	return null

static func f_frame66(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(c, "m_owner"), "OnAnimEvent"), ["Destroy"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Water"] = R.coerce(null, "MovieClip")
	return null
