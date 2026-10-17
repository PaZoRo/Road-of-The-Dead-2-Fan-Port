extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ScoreBoard(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else 0), "uint")
	R.invoke(R.super_ref(c, "com.newgrounds.ScoreBoard"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_name"] = R.coerce(v_param2, "String")
	(c).fields["_id"] = R.coerce(v_param3, "uint")
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_get_scores(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_scores")
	return null

static func f_get_period(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_period")
	return null

static func f_set_period(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_period"] = R.coerce(v_param1, "String")
	return null

static func f_get_firstResult(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_firstResult")
	return null

static func f_set_firstResult(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_firstResult"] = R.coerce(maxf(float(1), float(v_param1)), "uint")
	return null

static func f_get_numResults(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_numResults")
	return null

static func f_set_numResults(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	(c).fields["_numResults"] = R.coerce(v_param1, "uint")
	return null

static func f_get_tag(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_tag")
	return null

static func f_set_tag(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["_tag"] = R.coerce(v_param1, "String")
	return null

static func f_get_page(c: Variant, a: Array) -> Variant:
	return (float(ceilf(float(R.binary("/", (float((c).fields.get("_firstResult")) - float(1)), (c).fields.get("_numResults"))))) + float(1))
	return null

static func f_prevPage(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value(c, "firstResult"), (c).fields.get("_numResults"))):
		pass
		R.set_value(c, "firstResult", (c).fields.get("_numResults"), "-=")
	return null

static func f_nextPage(c: Variant, a: Array) -> Variant:
	R.set_value(c, "firstResult", (c).fields.get("_numResults"), "+=")
	return null

static func f_loadScores(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["loadScores", R.get_value(c, "onScoresLoaded"), {"publisher_id": ((c).fields.get("_connection")).fields.get("publisherId"), "board": (c).fields.get("_id"), "page": (float(R.binary("/", (float((c).fields.get("_firstResult")) - float(1)), (c).fields.get("_numResults"))) + float(1)), "num_results": (c).fields.get("_numResults"), "period": (c).fields.get("_period"), "tag": (c).fields.get("_tag")}])
	return null

static func f_postScore(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	if R.truth(R.invoke(R.resolve(c, "isNaN", "com.newgrounds.ScoreBoard"), [v_param1])):
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Cannot post invalid score: ", v_param1)])
		R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), null, R.static_value("com.newgrounds.APIEvent", "ERROR_INVALID_ARGUMENT")])])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Posting a score of ", v_param1), " by "), ((c).fields.get("_connection")).fields.get("username")), " to scoreboard \""), (c).fields.get("_name")), "\"...")])
	R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["postScore", R.get_value(c, "onScorePosted"), null, {"user_name": ((c).fields.get("_connection")).fields.get("username"), "board": (c).fields.get("_id"), "value": v_param1, "tag": v_param2}])
	return null

static func f_onScoresLoaded(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = 0
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc2_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc3_ = R.coerce(0, "uint")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(null, "Object")
	v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
	(c).fields["_scores"] = R.coerce([], "Array")
	if R.truth(R.get_value(v__loc2_, "first_result")):
		pass
		v__loc3_ = R.coerce(R.coerce(R.get_value(v__loc2_, "first_result"), "uint"), "uint")
	else:
		pass
		v__loc3_ = R.coerce((c).fields.get("_firstResult"), "uint")
	if R.truth(R.get_value(v__loc2_, "scores")):
		pass
		v__loc4_ = R.coerce(0, "uint")
		while R.truth(R.binary("<", v__loc4_, R.get_value(R.get_value(v__loc2_, "scores"), "length"))):
			pass
			v__loc5_ = R.coerce(R.get_value(R.get_value(v__loc2_, "scores"), v__loc4_), "Object")
			if R.truth(v__loc5_):
				pass
				R.set_value((c).fields.get("_scores"), v__loc4_, R.construct(R.klass("com.newgrounds.Score"), [v__loc3_, R.get_value(v__loc5_, "username"), R.get_value(v__loc5_, "value"), R.get_value(v__loc5_, "numeric_value"), R.get_value(v__loc5_, "tag")]), "=")
			v__loc4_ = ((v__loc4_ + 1) & 4294967295)
			v__loc3_ = ((v__loc3_ + 1) & 4294967295)
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORES_LOADED"), c])])
	return null

static func f_onScorePosted(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = null
	var v__loc3_: Variant = null
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v__loc2_ = R.coerce(null, "Object")
	v__loc3_ = R.coerce(null, "Object")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", ["Score posted!"])
		v__loc2_ = R.coerce(R.get_value(v_param1, "data"), "Object")
		v__loc3_ = R.coerce({}, "Object")
		R.set_value(v__loc3_, "score", R.get_value(v__loc2_, "value"), "=")
		R.set_value(v__loc3_, "scoreBoard", c, "=")
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", "Error posting score: ", R.get_value(v_param1, "error"))])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "SCORE_POSTED"), v__loc3_, R.get_value(v_param1, "error")])])
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", "Scoreboard: ", (c).fields.get("_name"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "TODAY", "Today", "=")
	R.set_value(c, "THIS_WEEK", "This Week", "=")
	R.set_value(c, "THIS_MONTH", "This Month", "=")
	R.set_value(c, "THIS_YEAR", "This Year", "=")
	R.set_value(c, "ALL_TIME", "All-Time", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_connection"] = R.coerce(null, "APIConnection")
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_period"] = R.coerce("All-Time", "String")
	(c).fields["_firstResult"] = R.coerce(1, "uint")
	(c).fields["_numResults"] = R.coerce(10, "uint")
	(c).fields["_tag"] = R.coerce(null, "String")
	(c).fields["_scores"] = R.coerce(null, "Array")
	return null
