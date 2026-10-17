extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ZombieVeryHardHoodInside_936(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), [0, R.get_value(c, "frame1"), 2, R.get_value(c, "frame3"), 5, R.get_value(c, "frame6"), 8, R.get_value(c, "frame9"), 11, R.get_value(c, "frame12")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), [])
	return null

static func f_frame3(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEatFlash"])
	return null

static func f_frame6(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame9(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEatFlash"])
	return null

static func f_frame12(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieVeryHardHoodInside_936"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
