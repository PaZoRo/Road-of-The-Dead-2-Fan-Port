extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ZombieNormalFemaleNewHoodInside_934(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ZombieNormalFemaleNewHoodInside_934"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ZombieNormalFemaleNewHoodInside_934"), [0, R.get_value(c, "frame1"), 1, R.get_value(c, "frame2"), 4, R.get_value(c, "frame5")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieNormalFemaleNewHoodInside_934"), [])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalFemaleNewHoodInside_934"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEatFlash"])
	return null

static func f_frame5(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalFemaleNewHoodInside_934"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
