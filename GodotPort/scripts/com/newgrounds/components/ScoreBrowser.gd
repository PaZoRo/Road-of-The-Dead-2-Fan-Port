extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_ScoreBrowser(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.components.ScoreBrowser"), [])
	R.invoke(R.resolve(c, "addFrameScript", "com.newgrounds.components.ScoreBrowser"), [0, R.get_value(c, "frame1"), 1, R.get_value(c, "frame2"), 10, R.get_value(c, "frame11"), 20, R.get_value(c, "frame21"), 29, R.get_value(c, "frame30")])
	return null

static func f_loadScores(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_scoreBoard")):
		pass
		R.call_member((c).fields.get("_scoreBoard"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORES_LOADED"), R.get_value(c, "_onScoresLoaded")])
	(c).fields["_scoreBoard"] = R.coerce(R.call_static("com.newgrounds.API", "getScoreBoard", [(c).fields.get("scoreBoardName")]), "ScoreBoard")
	if R.truth(R.unary("!", (c).fields.get("_scoreBoard"))):
		pass
		if R.truth(R.unary("!", R.get_value(R.get_value(R.klass("com.newgrounds.API"), "scoreBoards"), 0))):
			pass
			R.call_static("com.newgrounds.Logger", "logError", ["No scoreboards created for this movie. You can create scoreboards on your API Settings page at http://www.newgrounds.com/account/flashapi"])
			R.invoke(R.resolve(c, "gotoAndPlay", "com.newgrounds.components.ScoreBrowser"), ["error"])
			return null
		(c).fields["_scoreBoard"] = R.coerce(R.get_value(R.get_value(R.klass("com.newgrounds.API"), "scoreBoards"), 0), "ScoreBoard")
		(c).fields["scoreBoardName"] = R.coerce(R.get_value((c).fields.get("_scoreBoard"), "name"), "String")
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", "No scoreboard name set in the Score Browser component. Defaulting to scoreboard \"", R.get_value((c).fields.get("_scoreBoard"), "name")), "\".")])
	R.call_member((c).fields.get("_scoreBoard"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "SCORES_LOADED"), R.get_value(c, "_onScoresLoaded")])
	R.set_value((c).fields.get("_scoreBoard"), "numResults", (c).fields.get("_numScores"), "=")
	R.set_value((c).fields.get("_scoreBoard"), "period", (c).fields.get("period"), "=")
	if R.truth((c).fields.get("pageText")):
		pass
		R.set_value((c).fields.get("pageText"), "text", R.binary("+", "Page ", R.get_value((c).fields.get("_scoreBoard"), "page")), "=")
	(c).fields["_loading"] = true
	if R.truth((c).fields.get("listBox")):
		pass
		R.set_value((c).fields.get("listBox"), "mouseChildren", false, "=")
		R.invoke(R.get_value((c).fields.get("listBox"), "hideList"), [])
	R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.ScoreBrowser"), ["loading"])
	R.call_member((c).fields.get("_scoreBoard"), "loadScores", [])
	return null

static func f__onScoresLoaded(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["_loading"] = false
	if R.truth((c).fields.get("listBox")):
		pass
		R.set_value((c).fields.get("listBox"), "mouseChildren", true, "=")
	if R.truth(R.get_value(v_event, "success")):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "com.newgrounds.components.ScoreBrowser"), ["scores"])
	else:
		pass
		R.invoke(R.resolve(c, "gotoAndPlay", "com.newgrounds.components.ScoreBrowser"), ["error"])
	return null

static func f__onPageClick(c: Variant, a: Array) -> Variant:
	var v_clip: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_clip = R.coerce(R.get_value(v_event, "currentTarget"), "*")
	if R.truth((R.truth((c).fields.get("_scoreBoard")) and R.unary("!", (c).fields.get("_loading")))):
		pass
		if R.truth(R.binary("==", v_clip, (c).fields.get("prevButton"))):
			pass
			R.call_member((c).fields.get("_scoreBoard"), "prevPage", [])
		else:
			pass
			R.call_member((c).fields.get("_scoreBoard"), "nextPage", [])
		R.call_member(c, "loadScores", [])
	return null

static func f__onListChange(c: Variant, a: Array) -> Variant:
	var v_selection: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	(c).fields["period"] = R.coerce(R.get_value(v_selection, "data"), "String")
	R.call_member(c, "loadScores", [])
	return null

static func f_onScoreClick(c: Variant, a: Array) -> Variant:
	var v_scoreClip: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_scoreClip = R.coerce(R.binary("as", R.get_value(v_event, "currentTarget"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.get_value(v_scoreClip, "usernameText")):
		pass
		R.invoke(R.resolve(c, "navigateToURL", "com.newgrounds.components.ScoreBrowser"), [R.construct(R.resolve(c, "URLRequest", "com.newgrounds.components.ScoreBrowser"), [R.binary("+", R.binary("+", "http://", R.get_value(R.get_value(v_scoreClip, "usernameText"), "text")), ".newgrounds.com")]), "_blank"])
	return null

static func f_onReloadClick(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.call_member(c, "loadScores", [])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("title"))):
		pass
		(c).fields["title"] = R.coerce("High Scores", "String")
	if R.truth(R.unary("!", (c).fields.get("period"))):
		pass
		(c).fields["period"] = R.coerce(R.static_value("com.newgrounds.ScoreBoard", "ALL_TIME"), "String")
	(c).fields["_numScores"] = R.coerce(10, "uint")
	(c).fields["_listItems"] = R.coerce([R.static_value("com.newgrounds.ScoreBoard", "TODAY"), R.static_value("com.newgrounds.ScoreBoard", "THIS_WEEK"), R.static_value("com.newgrounds.ScoreBoard", "THIS_MONTH"), R.static_value("com.newgrounds.ScoreBoard", "THIS_YEAR"), R.static_value("com.newgrounds.ScoreBoard", "ALL_TIME")], "Array")
	R.assign(c, "x", "com.newgrounds.components.ScoreBrowser", R.coerce(R.resolve(c, "x", "com.newgrounds.components.ScoreBrowser"), "int"), "=")
	R.assign(c, "y", "com.newgrounds.components.ScoreBrowser", R.coerce(R.resolve(c, "y", "com.newgrounds.components.ScoreBrowser"), "int"), "=")
	if R.truth((c).fields.get("titleText")):
		pass
		R.set_value((c).fields.get("titleText"), "text", (c).fields.get("title"), "=")
	if R.truth((c).fields.get("prevButton")):
		pass
		R.invoke(R.get_value((c).fields.get("prevButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onPageClick")])
	if R.truth((c).fields.get("nextButton")):
		pass
		R.invoke(R.get_value((c).fields.get("nextButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onPageClick")])
	R.invoke(R.resolve(c, "gotoAndPlay", "com.newgrounds.components.ScoreBrowser"), ["error"])
	R.call_member(c, "loadScores", [])
	return null

static func f_frame2(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("listBox")):
		pass
		R.invoke(R.get_value((c).fields.get("listBox"), "setListItems"), [(c).fields.get("_listItems")])
		R.invoke(R.get_value((c).fields.get("listBox"), "setSelectedItem"), [(c).fields.get("period")])
	return null

static func f_frame11(c: Variant, a: Array) -> Variant:
	(c).fields["i"] = R.coerce(0, "uint")
	(c).fields["scoreClip"] = R.coerce(R.get_value((c).fields.get("scoreContainer"), "score0"), "MovieClip")
	while R.truth((c).fields.get("scoreClip")):
		pass
		(c).fields["score"] = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("_scoreBoard"), "scores"), (c).fields.get("i")), R.klass("com.newgrounds.Score")), "Score")
		if R.truth((c).fields.get("score")):
			pass
			if R.truth(R.get_value((c).fields.get("scoreClip"), "rankText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "rankText"), "text", R.invoke(R.get_value(R.get_value((c).fields.get("score"), "rank"), "toString"), []), "=")
			if R.truth(R.get_value((c).fields.get("scoreClip"), "usernameText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "usernameText"), "text", R.get_value((c).fields.get("score"), "username"), "=")
			if R.truth(R.get_value((c).fields.get("scoreClip"), "scoreText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "scoreText"), "text", R.get_value((c).fields.get("score"), "score"), "=")
			R.invoke(R.get_value((c).fields.get("scoreClip"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "onScoreClick")])
		else:
			pass
			if R.truth(R.get_value((c).fields.get("scoreClip"), "rankText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "rankText"), "text", "", "=")
			if R.truth(R.get_value((c).fields.get("scoreClip"), "usernameText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "usernameText"), "text", "", "=")
			if R.truth(R.get_value((c).fields.get("scoreClip"), "scoreText")):
				pass
				R.set_value(R.get_value((c).fields.get("scoreClip"), "scoreText"), "text", "", "=")
			R.set_value((c).fields.get("scoreClip"), "mouseEnabled", false, "=")
		R.set_value(c, "i", 1, "+=")
		(c).fields["scoreClip"] = R.coerce(R.get_value((c).fields.get("scoreContainer"), R.binary("+", "score", (c).fields.get("i"))), "MovieClip")
	return null

static func f_frame21(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("reloadButton")):
		pass
		R.invoke(R.get_value((c).fields.get("reloadButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "onReloadClick")])
	return null

static func f_frame30(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "com.newgrounds.components.ScoreBrowser"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["reloadButton"] = R.coerce(null, "SimpleButton")
	(c).fields["pageText"] = R.coerce(null, "TextField")
	(c).fields["nextButton"] = R.coerce(null, "SimpleButton")
	(c).fields["titleText"] = R.coerce(null, "TextField")
	(c).fields["prevButton"] = R.coerce(null, "SimpleButton")
	(c).fields["listBox"] = R.coerce(null, "MovieClip")
	(c).fields["scoreContainer"] = R.coerce(null, "MovieClip")
	(c).fields["title"] = R.coerce(null, "String")
	(c).fields["scoreBoardName"] = R.coerce(null, "String")
	(c).fields["period"] = R.coerce(null, "String")
	(c).fields["_scoreBoard"] = R.coerce(null, "ScoreBoard")
	(c).fields["_loading"] = false
	(c).fields["_numScores"] = R.coerce(0, "uint")
	(c).fields["_listItems"] = R.coerce(null, "Array")
	(c).fields["i"] = R.coerce(0, "uint")
	(c).fields["scoreClip"] = R.coerce(null, "MovieClip")
	(c).fields["score"] = R.coerce(null, "Score")
	return null
