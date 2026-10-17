extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_DriverSelectionScreen(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_DriverSelectionScreen"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["DianeWeaponStats"] = R.coerce(null, "MovieClip")
	(c).fields["CochetaStats"] = R.coerce(null, "MovieClip")
	(c).fields["DrivingLabel"] = R.coerce(null, "MovieClip")
	(c).fields["BackButton"] = R.coerce(null, "SimpleButton")
	(c).fields["DianeWeaponStatsButton"] = R.coerce(null, "SimpleButton")
	(c).fields["CochetaButton"] = R.coerce(null, "SimpleButton")
	(c).fields["GunnerLabel"] = R.coerce(null, "MovieClip")
	(c).fields["CochetaWeaponStats"] = R.coerce(null, "MovieClip")
	(c).fields["SwitchVehicle"] = R.coerce(null, "SimpleButton")
	(c).fields["StoryProgress"] = R.coerce(null, "MovieClip")
	(c).fields["DianeStats"] = R.coerce(null, "MovieClip")
	(c).fields["DianeButton"] = R.coerce(null, "SimpleButton")
	(c).fields["Content"] = R.coerce(null, "MovieClip")
	(c).fields["MenuButton"] = R.coerce(null, "SimpleButton")
	(c).fields["CochetaWeaponStatsButton"] = R.coerce(null, "SimpleButton")
	(c).fields["JohnCarUnlocked"] = R.coerce(null, "MovieClip")
	return null
