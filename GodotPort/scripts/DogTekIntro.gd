extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DogTekIntro(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DogTekIntro"), [])
	(c).fields["m_bRunning"] = false
	(c).fields["m_fShake"] = float(0)
	(c).fields["m_fPosX"] = R.coerce(R.resolve(c, "x", "DogTekIntro"), "Number")
	(c).fields["m_fPosY"] = R.coerce(R.resolve(c, "y", "DogTekIntro"), "Number")
	return null

static func f_StartEffect(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_newLine: Variant = null
	var v_iColor: Variant = null
	v_i = R.coerce(0, "int")
	v_newLine = R.coerce(null, "MovieClip")
	v_iColor = R.coerce(null, "*")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("DogTekIntro", "kNbLines")))):
		pass
		v_newLine = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
		R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "addChild"), [v_newLine])
		R.set_value(v_newLine, "x", 0, "=")
		R.set_value(v_newLine, "y", 0, "=")
		R.set_value(v_newLine, "fX", 0, "=")
		R.set_value(v_newLine, "fY", 0, "=")
		R.set_value(v_newLine, "fAngle", (float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)), "=")
		R.set_value(v_newLine, "fSpeed", (float(2) + float((float(randf()) * float(20)))), "=")
		R.set_value(v_newLine, "fThickness", (float((float(1) - float(R.binary("/", v_i, R.static_value("DogTekIntro", "kNbLines"))))) * float(5)), "=")
		v_iColor = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [(float(20) + float((float(R.binary("/", v_i, R.static_value("DogTekIntro", "kNbLines"))) * float(205))))]), "*")
		R.set_value(v_newLine, "lineColor", R.binary("|", R.binary("|", R.binary("<<", v_iColor, 16), R.binary("<<", v_iColor, 8)), v_iColor), "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_bRunning"] = true
	R.invoke(R.resolve(c, "addEventListener", "DogTekIntro"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrameHandler")])
	return null

static func f_StopEffect(c: Variant, a: Array) -> Variant:
	(c).fields["m_bRunning"] = false
	R.invoke(R.resolve(c, "removeEventListener", "DogTekIntro"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrameHandler")])
	while R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "removeChildAt"), [0])
	return null

static func f_OnEnterFrameHandler(c: Variant, a: Array) -> Variant:
	var v_lineMC: Variant = null
	var v_fOldX: Variant = NAN
	var v_fOldY: Variant = NAN
	var v_i: Variant = 0
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_lineMC = R.coerce(null, "MovieClip")
	v_fOldX = float(NAN)
	v_fOldY = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_bRunning"))):
		pass
		return null
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "numChildren"))):
		pass
		v_lineMC = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("logoEffect"), "lineContainer"), "getChildAt"), [v_i]), "MovieClip")
		R.set_value(v_lineMC, "fAngle", (float((float(randf()) * float(R.binary("/", R.get_value(R.klass("Math"), "PI"), 4.3)))) - float(R.binary("/", R.binary("/", R.get_value(R.klass("Math"), "PI"), 4.3), 2))), "+=")
		v_fOldX = float(R.num(R.get_value(v_lineMC, "fX")))
		v_fOldY = float(R.num(R.get_value(v_lineMC, "fY")))
		R.set_value(v_lineMC, "fX", (float(cos(R.num(R.get_value(v_lineMC, "fAngle")))) * R.num(R.get_value(v_lineMC, "fSpeed"))), "+=")
		R.set_value(v_lineMC, "fY", (float(sin(R.num(R.get_value(v_lineMC, "fAngle")))) * R.num(R.get_value(v_lineMC, "fSpeed"))), "+=")
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "lineStyle"), [R.get_value(v_lineMC, "fThickness"), R.get_value(v_lineMC, "lineColor"), 100])
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "moveTo"), [R.invoke(R.get_value(R.klass("Math"), "round"), [v_fOldX]), R.invoke(R.get_value(R.klass("Math"), "round"), [v_fOldY])])
		R.invoke(R.get_value(R.get_value(v_lineMC, "graphics"), "lineTo"), [R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(v_lineMC, "fX")]), R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(v_lineMC, "fY")])])
		v_i = R.signed32(v_i + 1)
	R.assign(c, "x", "DogTekIntro", (float((float((c).fields.get("m_fPosX")) + float((float(randf()) * float((c).fields.get("m_fShake")))))) - float(R.binary("/", (c).fields.get("m_fShake"), 2))), "=")
	R.assign(c, "y", "DogTekIntro", (float((float((c).fields.get("m_fPosY")) + float((float(randf()) * float((c).fields.get("m_fShake")))))) - float(R.binary("/", (c).fields.get("m_fShake"), 2))), "=")
	(c).fields["m_fShake"] = R.coerce(R.binary("+", (c).fields.get("m_fShake"), R.static_value("DogTekIntro", "kShakeSpeed")), "Number")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "kNbLines", 30, "=")
	R.set_value(c, "kShakeSpeed", 0.8, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["logoEffect"] = R.coerce(null, "MovieClip")
	(c).fields["m_bRunning"] = false
	(c).fields["m_fShake"] = float(NAN)
	(c).fields["m_fPosX"] = float(NAN)
	(c).fields["m_fPosY"] = float(NAN)
	return null
