extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_MC_DistanceStatsScreen(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "MC_DistanceStatsScreen"), [])
	R.call_member(c, "__setProp_ScoreBoard_DistanceStatsScreen_Layer1_0", [])
	return null

static func f___setProp_ScoreBoard_DistanceStatsScreen_Layer1_0(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error"}
	l["e"] = null
	R.last_error = null
	R.set_value((c).fields.get("ScoreBoard"), "componentInspectorSetting", true, "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	((c).fields.get("ScoreBoard")).fields["scoreBoardName"] = R.coerce("Out Of Time Distance", "String")
	((c).fields.get("ScoreBoard")).fields["period"] = R.coerce("All-Time", "String")
	((c).fields.get("ScoreBoard")).fields["title"] = R.coerce("High Scores", "String")
	R.last_error = null
	R.set_value((c).fields.get("ScoreBoard"), "componentInspectorSetting", false, "=")
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BestPointsTitle"] = R.coerce(null, "MovieClip")
	(c).fields["Points"] = R.coerce(null, "MovieClip")
	(c).fields["PointsTitle"] = R.coerce(null, "MovieClip")
	(c).fields["RatePanel"] = R.coerce(null, "MovieClip")
	(c).fields["PassportPanel"] = R.coerce(null, "MovieClip")
	(c).fields["BestPoints"] = R.coerce(null, "MovieClip")
	(c).fields["ScoreBoard"] = R.coerce(null, "ScoreBrowser")
	(c).fields["Message"] = R.coerce(null, "SimpleButton")
	return null
