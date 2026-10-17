extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPlayerArmForClinger(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDPlayerArmForClinger"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDPlayerArmForClinger"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.call_member(c, "Update", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "Update", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	v_iFrame = R.coerce(1, "int")
	if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
		pass
		if R.truth(R.binary("==", R.get_value(c, "parent"), R.get_value((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")).fields.get("m_MCCarInterior"), "SideGrapplerLeft"))):
			pass
			v_iFrame = R.coerce((2 if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else 1), "int")
		else:
			pass
			v_iFrame = R.coerce((1 if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else 2), "int")
	if R.truth((float(v_iFrame) != float((c).fields.get("m_iFrame")))):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "RDPlayerArmForClinger"), [v_iFrame])
		(c).fields["m_iFrame"] = R.coerce(v_iFrame, "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null
