extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_fireworks_2779(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.fireworks_2779"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.fireworks_2779"), [1, R.get_value(c, "frame2"), 71, R.get_value(c, "frame72"), 77, R.get_value(c, "frame78"), 87, R.get_value(c, "frame88"), 95, R.get_value(c, "frame96"), 102, R.get_value(c, "frame103"), 113, R.get_value(c, "frame114"), 123, R.get_value(c, "frame124"), 134, R.get_value(c, "frame135")])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.fireworks_2779"), [(float(floorf(float((float(randf()) * float(50))))) + float(5))])
	return null

static func f_frame72(c: Variant, a: Array) -> Variant:
	(c).fields["iRandom"] = R.coerce((float(floorf(float((float(randf()) * float(3))))) + float(1)), "int")
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.fireworks_2779"), [R.binary("+", "Firework", (c).fields.get("iRandom"))])
	return null

static func f_frame78(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "root", "RoadOfTheDead_fla.fireworks_2779"), R.klass("MovieClip")), "m_Game"), "PlayMenuExplosionSound"), [])
	return null

static func f_frame88(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.fireworks_2779"), [1])
	return null

static func f_frame96(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "root", "RoadOfTheDead_fla.fireworks_2779"), R.klass("MovieClip")), "m_Game"), "PlayMenuExplosionSound"), [])
	return null

static func f_frame103(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "root", "RoadOfTheDead_fla.fireworks_2779"), R.klass("MovieClip")), "m_Game"), "PlayMenuExplosionSound"), [])
	return null

static func f_frame114(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.fireworks_2779"), [1])
	return null

static func f_frame124(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.get_value(R.binary("as", R.resolve(c, "root", "RoadOfTheDead_fla.fireworks_2779"), R.klass("MovieClip")), "m_Game"), "PlayMenuExplosionSound"), [])
	return null

static func f_frame135(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "gotoAndPlay", "RoadOfTheDead_fla.fireworks_2779"), [1])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["iRandom"] = R.coerce(0, "int")
	return null
