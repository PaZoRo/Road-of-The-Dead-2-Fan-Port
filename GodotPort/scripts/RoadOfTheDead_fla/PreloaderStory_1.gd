extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_PreloaderStory_1(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.PreloaderStory_1"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.PreloaderStory_1"), [0, R.get_value(c, "frame1"), 15, R.get_value(c, "frame16"), 47, R.get_value(c, "frame48"), 79, R.get_value(c, "frame80"), 111, R.get_value(c, "frame112"), 143, R.get_value(c, "frame144"), 175, R.get_value(c, "frame176"), 208, R.get_value(c, "frame209")])
	return null

static func f_OnContinueReading(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "play", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_frame16(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame48(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame80(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame112(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame144(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame176(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("ContinueReading"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "OnContinueReading")])
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_frame209(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.PreloaderStory_1"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["ContinueReading"] = R.coerce(null, "SimpleButton")
	return null
