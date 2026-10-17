extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_mutantsidegrapples_911(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.mutantsidegrapples_911"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.mutantsidegrapples_911"), [0, R.get_value(c, "frame1"), 18, R.get_value(c, "frame19"), 75, R.get_value(c, "frame76"), 94, R.get_value(c, "frame95"), 138, R.get_value(c, "frame139"), 143, R.get_value(c, "frame144"), 166, R.get_value(c, "frame167"), 180, R.get_value(c, "frame181"), 206, R.get_value(c, "frame207"), 229, R.get_value(c, "frame230"), 247, R.get_value(c, "frame248")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.mutantsidegrapples_911"), [])
	return null

static func f_frame19(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame76(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame95(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame139(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame144(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame167(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame181(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["PunchSound"])
	return null

static func f_frame207(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_frame230(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ElbowSound"])
	return null

static func f_frame248(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "parent", "RoadOfTheDead_fla.mutantsidegrapples_911"), R.klass("MovieClip")), "m_owner"), "GetClinger"), [c]), "OnClingAnimEvent"), ["ClingAnimEnd"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Head"] = R.coerce(null, "zombie4hoodgrapple24")
	return null
