extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Tutorials_195(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Tutorials_195"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Tutorials_195"), [11, R.get_value(c, "frame12"), 25, R.get_value(c, "frame26"), 39, R.get_value(c, "frame40"), 54, R.get_value(c, "frame55"), 70, R.get_value(c, "frame71"), 83, R.get_value(c, "frame84"), 239, R.get_value(c, "frame240"), 395, R.get_value(c, "frame396"), 555, R.get_value(c, "frame556"), 715, R.get_value(c, "frame716")])
	return null

static func f_frame12(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["VerticalKeys"])
	return null

static func f_frame26(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["HorizontalKeys"])
	return null

static func f_frame40(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["SingleKey"])
	return null

static func f_frame55(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["Mouse"])
	return null

static func f_frame71(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["SideGrappleDriver"])
	return null

static func f_frame84(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.Tutorials_195"), ["SideGrappleGunner"])
	return null

static func f_frame240(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Tutorials_195"), [])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "OnSimpleMessageTutorialDone", [])
	return null

static func f_frame396(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Tutorials_195"), [])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "OnSimpleMessageTutorialDone", [])
	return null

static func f_frame556(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Tutorials_195"), [])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "OnSimpleMessageTutorialDone", [])
	return null

static func f_frame716(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Tutorials_195"), [])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "OnSimpleMessageTutorialDone", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["SideGrappleDriver"] = R.coerce(null, "MovieClip")
	(c).fields["Mouse"] = R.coerce(null, "MovieClip")
	(c).fields["SingleKey"] = R.coerce(null, "MovieClip")
	(c).fields["HorizontalKeys"] = R.coerce(null, "MovieClip")
	(c).fields["SideGrappleGunner"] = R.coerce(null, "MovieClip")
	(c).fields["VerticalKeys"] = R.coerce(null, "MovieClip")
	(c).fields["Med"] = R.coerce(null, "MovieClip")
	(c).fields["Interact"] = R.coerce(null, "MovieClip")
	(c).fields["Chopper"] = R.coerce(null, "MovieClip")
	(c).fields["SimpleMessage"] = R.coerce(null, "MovieClip")
	return null
