extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieMutantHead(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieMutantHead"), [])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantHead"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieMutantHead"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "OnAddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnAddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_Zombie"] = R.coerce(null, "RDZombieVeryHard")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_player: Variant = null
	v_player = R.coerce(null, "RDPlayer")
	if R.truth(R.unary("!", (c).fields.get("m_Zombie"))):
		pass
		if R.truth((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")))):
			pass
			if R.truth(R.resolve(c, "parent", "RDZombieMutantHead")):
				pass
				(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.get_value(R.binary("as", R.resolve(c, "parent", "RDZombieMutantHead"), R.klass("MovieClip")), "m_owner"), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
				if R.truth((R.unary("!", (c).fields.get("m_Zombie")) and R.truth(R.get_value(R.resolve(c, "parent", "RDZombieMutantHead"), "parent")))):
					pass
					(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.get_value(R.binary("as", R.get_value(R.resolve(c, "parent", "RDZombieMutantHead"), "parent"), R.klass("MovieClip")), "m_owner"), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
				if R.truth(R.unary("!", (c).fields.get("m_Zombie"))):
					pass
					v_player = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
					if R.truth(v_player):
						pass
						(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.call_member(v_player, "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieMutantHead"), R.klass("MovieClip"))]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
						if R.truth((R.unary("!", (c).fields.get("m_Zombie")) and R.truth(R.get_value(R.resolve(c, "parent", "RDZombieMutantHead"), "parent")))):
							pass
							(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.call_member(v_player, "GetClinger", [R.binary("as", R.get_value(R.resolve(c, "parent", "RDZombieMutantHead"), "parent"), R.klass("MovieClip"))]), R.klass("RDZombieVeryHard")), "RDZombieVeryHard")
			if R.truth((c).fields.get("m_Zombie")):
				pass
				R.invoke(R.resolve(c, "gotoAndStop", "RDZombieMutantHead"), [(2 if R.truth(((c).fields.get("m_Zombie")).fields.get("m_bIsAlphaMutant")) else 1)])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Zombie"] = R.coerce(null, "RDZombieVeryHard")
	return null
