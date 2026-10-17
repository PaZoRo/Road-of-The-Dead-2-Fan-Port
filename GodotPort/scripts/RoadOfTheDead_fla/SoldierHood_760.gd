extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SoldierHood_760(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.SoldierHood_760"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.SoldierHood_760"), [0, R.get_value(c, "frame1"), 18, R.get_value(c, "frame19"), 92, R.get_value(c, "frame93"), 111, R.get_value(c, "frame112"), 128, R.get_value(c, "frame129"), 150, R.get_value(c, "frame151"), 167, R.get_value(c, "frame168"), 186, R.get_value(c, "frame187"), 212, R.get_value(c, "frame213"), 255, R.get_value(c, "frame256"), 292, R.get_value(c, "frame293")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.SoldierHood_760"), [])
	return null

static func f_frame19(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame93(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame112(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame129(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame151(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimDrawGun"])
	return null

static func f_frame168(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimDoAttack"])
	return null

static func f_frame187(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame213(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame256(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame293(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.SoldierHood_760"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "MovieClip")
	return null
