extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Timeline_74(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Timeline_74"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Timeline_74"), [0, R.get_value(c, "frame1")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Timeline_74"), [])
	R.assign(c, "buttonMode", "RoadOfTheDead_fla.Timeline_74", true, "=")
	R.assign(c, "mouseChildren", "RoadOfTheDead_fla.Timeline_74", false, "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["usernameText"] = R.coerce(null, "TextField")
	(c).fields["scoreText"] = R.coerce(null, "TextField")
	(c).fields["rankText"] = R.coerce(null, "TextField")
	return null
