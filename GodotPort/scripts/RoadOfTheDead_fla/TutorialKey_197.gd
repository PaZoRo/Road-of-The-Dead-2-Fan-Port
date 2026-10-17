extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_TutorialKey_197(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.TutorialKey_197"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.TutorialKey_197"), [16, R.get_value(c, "frame17"), 36, R.get_value(c, "frame37"), 46, R.get_value(c, "frame47"), 58, R.get_value(c, "frame59")])
	return null

static func f_frame17(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.TutorialKey_197"), ["LargeKeySlow"])
	return null

static func f_frame37(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.TutorialKey_197"), ["SmallKeySlow"])
	return null

static func f_frame47(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.TutorialKey_197"), ["LargeKeyFast"])
	return null

static func f_frame59(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.TutorialKey_197"), ["SmallKeyFast"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["LargeKeyUp"] = R.coerce(null, "MovieClip")
	(c).fields["SmallKeyUp"] = R.coerce(null, "MovieClip")
	(c).fields["LargeKeyDown"] = R.coerce(null, "MovieClip")
	(c).fields["KeyName"] = R.coerce(null, "TextField")
	(c).fields["SmallKeyDown"] = R.coerce(null, "MovieClip")
	return null
