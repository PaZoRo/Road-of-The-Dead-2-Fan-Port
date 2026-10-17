extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_AchievementItem(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_AchievementItem"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["Hint"] = R.coerce(null, "TextField")
	(c).fields["Reward"] = R.coerce(null, "TextField")
	(c).fields["AchievementName"] = R.coerce(null, "TextField")
	return null
