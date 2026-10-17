extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_HighScoreDeadOnTime_2559(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.HighScoreDeadOnTime_2559"), [])
	R.call_member(c, "__setProp_HighScoreBoard_HighScoreDeadOnTime_HighScoreBoard_0", [])
	return null

static func f___setProp_HighScoreBoard_HighScoreDeadOnTime_HighScoreBoard_0(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error"}
	l["e"] = null
	R.last_error = null
	R.set_value((c).fields.get("HighScoreBoard"), "componentInspectorSetting", true, "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	((c).fields.get("HighScoreBoard")).fields["scoreBoardName"] = R.coerce("Out Of Time Distance", "String")
	((c).fields.get("HighScoreBoard")).fields["period"] = R.coerce("All-Time", "String")
	((c).fields.get("HighScoreBoard")).fields["title"] = R.coerce("High Scores", "String")
	R.last_error = null
	R.set_value((c).fields.get("HighScoreBoard"), "componentInspectorSetting", false, "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["KM"] = R.coerce(null, "MovieClip")
	(c).fields["HighScoreBoard"] = R.coerce(null, "ScoreBrowser")
	(c).fields["MilitaryMode"] = R.coerce(null, "SimpleButton")
	(c).fields["DistanceMode"] = R.coerce(null, "SimpleButton")
	(c).fields["KongMessage"] = R.coerce(null, "MovieClip")
	(c).fields["HighScore"] = R.coerce(null, "TextField")
	(c).fields["MutantMode"] = R.coerce(null, "SimpleButton")
	(c).fields["RescueMode"] = R.coerce(null, "SimpleButton")
	(c).fields["TimeMode"] = R.coerce(null, "SimpleButton")
	return null
