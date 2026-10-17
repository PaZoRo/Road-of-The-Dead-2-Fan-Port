extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieMutantClingHeadAnimated(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieMutantClingHeadAnimated"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantClingHeadAnimated"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantClingHeadAnimated"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "AddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_AddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_szAnim"] = R.coerce("", "String")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = null
	var v_szAnim: Variant = null
	v_clinger = R.coerce(null, "RDZombieVeryHard")
	v_szAnim = R.coerce(null, "String")
	if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")))):
		pass
		v_clinger = R.coerce(R.binary("as", R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieMutantClingHeadAnimated"), R.klass("MovieClip"))]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
		if R.truth(v_clinger):
			pass
			v_szAnim = R.coerce(("Alpha" if R.truth((v_clinger).fields.get("m_bIsAlphaMutant")) else "Normal"), "String")
			if R.truth(R.binary("!=", v_szAnim, (c).fields.get("m_szAnim"))):
				pass
				R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieMutantClingHeadAnimated"), [v_szAnim])
				(c).fields["m_szAnim"] = R.coerce(v_szAnim, "String")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["BulletCollision"] = R.coerce(null, "MovieClip")
	(c).fields["m_szAnim"] = R.coerce("", "String")
	return null
