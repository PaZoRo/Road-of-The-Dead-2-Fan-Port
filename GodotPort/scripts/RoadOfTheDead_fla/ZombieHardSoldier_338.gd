extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ZombieHardSoldier_338(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ZombieHardSoldier_338"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ZombieHardSoldier_338"), [0, R.get_value(c, "frame1"), 16, R.get_value(c, "frame17"), 95, R.get_value(c, "frame96"), 118, R.get_value(c, "frame119"), 134, R.get_value(c, "frame135"), 161, R.get_value(c, "frame162"), 211, R.get_value(c, "frame212"), 226, R.get_value(c, "frame227"), 251, R.get_value(c, "frame252"), 271, R.get_value(c, "frame272"), 348, R.get_value(c, "frame349"), 408, R.get_value(c, "frame409"), 466, R.get_value(c, "frame467")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieHardSoldier_338"), [])
	return null

static func f_frame17(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame96(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame119(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame135(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame162(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame212(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame227(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingGetInside"])
	return null

static func f_frame252(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame272(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame349(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieHardSoldier_338"), [])
	if R.truth(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c])):
		pass
		R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame409(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame467(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieHardSoldier_338"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RightArm"] = R.coerce(null, "MC_soldier80")
	(c).fields["LeftArm"] = R.coerce(null, "MC_soldier83")
	(c).fields["RightHand"] = R.coerce(null, "MC_soldier82")
	(c).fields["Torso"] = R.coerce(null, "MovieClip")
	(c).fields["RightForearm"] = R.coerce(null, "MC_soldier81")
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	(c).fields["LeftHand"] = R.coerce(null, "MC_soldier85")
	(c).fields["LeftForearm"] = R.coerce(null, "MC_soldier84")
	return null
