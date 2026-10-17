extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieMutantClingHead(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieMutantClingHead"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantClingHead"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantClingHead"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "AddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_AddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_Clinger"] = R.coerce(null, "RDZombieVeryHard")
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_iFrame: Variant = 0
	if R.truth(R.unary("!", (c).fields.get("m_Clinger"))):
		pass
		if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
			pass
			(c).fields["m_Clinger"] = R.coerce(R.binary("as", R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieMutantClingHead"), R.klass("MovieClip"))]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
	v_iFrame = R.coerce(1, "int")
	if R.truth((c).fields.get("m_Clinger")):
		pass
		v_iFrame = R.coerce((2 if R.truth(((c).fields.get("m_Clinger")).fields.get("m_bIsAlphaMutant")) else 1), "int")
	if R.truth((float(v_iFrame) != float((c).fields.get("m_iFrame")))):
		pass
		(c).fields["m_iFrame"] = R.coerce(v_iFrame, "int")
		R.invoke(R.resolve(c, "gotoAndStop", "RDZombieMutantClingHead"), [v_iFrame])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Clinger"] = R.coerce(null, "RDZombieVeryHard")
	(c).fields["m_iFrame"] = R.coerce(R.unary("-", 1), "int")
	return null
