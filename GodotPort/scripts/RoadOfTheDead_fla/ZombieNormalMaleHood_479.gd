extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ZombieNormalMaleHood_479(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), [0, R.get_value(c, "frame1"), 21, R.get_value(c, "frame22"), 143, R.get_value(c, "frame144"), 168, R.get_value(c, "frame169"), 186, R.get_value(c, "frame187"), 212, R.get_value(c, "frame213"), 251, R.get_value(c, "frame252"), 268, R.get_value(c, "frame269"), 312, R.get_value(c, "frame313"), 332, R.get_value(c, "frame333"), 390, R.get_value(c, "frame391"), 450, R.get_value(c, "frame451"), 495, R.get_value(c, "frame496")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), [])
	return null

static func f_frame22(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame144(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame169(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame187(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame213(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame252(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame269(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingGetInside"])
	return null

static func f_frame313(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame333(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame391(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), [])
	if R.truth(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c])):
		pass
		R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame451(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame496(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.ZombieNormalMaleHood_479"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["RightArm"] = R.coerce(null, "MC_zombie2hoodgrapple21")
	(c).fields["RightHand"] = R.coerce(null, "zombie2hoodgrapple23")
	(c).fields["LeftArm"] = R.coerce(null, "MC_zombie2hoodgrapple12")
	(c).fields["RightForearm"] = R.coerce(null, "MC_zombie2hoodgrapple22")
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	(c).fields["LeftForearm"] = R.coerce(null, "MC_zombie2hoodgrapple13")
	return null
