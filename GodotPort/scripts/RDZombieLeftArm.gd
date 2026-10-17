extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieLeftArm(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieLeftArm"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieLeftArm"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieLeftArm"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "OnAddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnAddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_Clinger"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_player: Variant = null
	var v_iFrame: Variant = 0
	v_player = R.coerce(null, "RDPlayer")
	if R.truth(R.unary("!", (c).fields.get("m_Clinger"))):
		pass
		if R.truth((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")))):
			pass
			v_player = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
			(c).fields["m_Clinger"] = R.coerce((R.call_member(v_player, "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieLeftArm"), R.klass("MovieClip"))]) if R.truth(v_player) else null), "RDHumanoid")
	v_iFrame = R.coerce(1, "int")
	if R.truth((c).fields.get("m_Clinger")):
		pass
		v_iFrame = R.coerce((1 if R.truth((float(((c).fields.get("m_Clinger")).fields.get("m_fLeftArmHP")) > float(0))) else 2), "int")
	if R.truth((float(v_iFrame) != float((c).fields.get("m_iFrame")))):
		pass
		(c).fields["m_iFrame"] = R.coerce(v_iFrame, "int")
		R.invoke(R.resolve(c, "gotoAndStop", "RDZombieLeftArm"), [v_iFrame])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Clinger"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null
