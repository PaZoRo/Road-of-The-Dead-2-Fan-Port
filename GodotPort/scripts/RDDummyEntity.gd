extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDDummyEntity(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDDummyEntity"), [R.klass("MovieClip")])
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_PlayAnimationSound(c: Variant, a: Array) -> Variant:
	var v_szSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
