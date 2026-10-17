extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieSpecialHeadPiece(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieSpecialHeadPiece"), [])
	R.assign(c, "visible", "RDZombieSpecialHeadPiece", false, "=")
	R.invoke(R.resolve(c, "addEventListener", "RDZombieSpecialHeadPiece"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	R.invoke(R.resolve(c, "addEventListener", "RDZombieSpecialHeadPiece"), [R.get_value(R.klass("Event"), "ADDED_TO_STAGE"), R.get_value(c, "OnAddedToStage"), false, 0, true])
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_OnAddedToStage(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_Zombie"] = R.coerce(null, "RDZombie")
	R.assign(c, "visible", "RDZombieSpecialHeadPiece", false, "=")
	R.call_member(c, "UpdateVisibility", [])
	return null

static func f_UpdateVisibility(c: Variant, a: Array) -> Variant:
	var v_bVisible: Variant = false
	var v_player: Variant = null
	v_bVisible = false
	v_player = R.coerce(null, "RDPlayer")
	if R.truth(R.unary("!", (c).fields.get("m_Zombie"))):
		pass
		v_bVisible = false
		if R.truth(((R.truth(R.static_value("RDGame", "Instance")) and R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"))) and (((((((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Friday13th"))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MardiGras")))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_SaintPatricksDay")))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Easter")))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Christmas")))) or (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MadnessDay")))))):
			pass
			if R.truth(R.resolve(c, "parent", "RDZombieSpecialHeadPiece")):
				pass
				(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.get_value(R.binary("as", R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), R.klass("MovieClip")), "m_owner"), R.klass("RDZombie")), "RDZombie")
				if R.truth((R.unary("!", (c).fields.get("m_Zombie")) and R.truth(R.get_value(R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), "parent")))):
					pass
					(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.get_value(R.binary("as", R.get_value(R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), "parent"), R.klass("MovieClip")), "m_owner"), R.klass("RDZombie")), "RDZombie")
				if R.truth(R.unary("!", (c).fields.get("m_Zombie"))):
					pass
					v_player = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
					if R.truth(v_player):
						pass
						(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.call_member(v_player, "GetClinger", [R.binary("as", R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), R.klass("MovieClip"))]), R.klass("RDZombie")), "RDZombie")
						if R.truth((R.unary("!", (c).fields.get("m_Zombie")) and R.truth(R.get_value(R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), "parent")))):
							pass
							(c).fields["m_Zombie"] = R.coerce(R.binary("as", R.call_member(v_player, "GetClinger", [R.binary("as", R.get_value(R.resolve(c, "parent", "RDZombieSpecialHeadPiece"), "parent"), R.klass("MovieClip"))]), R.klass("RDZombie")), "RDZombie")
			if R.truth((R.truth((c).fields.get("m_Zombie")) and ((c).fields.get("m_Zombie")).fields.get("m_bSpecialZombie"))):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Friday13th")))):
					pass
					R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["FridayMask"])
				else:
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MardiGras")))):
						pass
						R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["MardiGrasMask"])
					else:
						pass
						if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_SaintPatricksDay")))):
							pass
							R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["SaintPatrickHat"])
						else:
							pass
							if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Easter")))):
								pass
								R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["BunnyEars"])
							else:
								pass
								if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
									pass
									R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), [("WitchHat" if R.truth((float(((c).fields.get("m_Zombie")).fields.get("m_iSpecialZombieType")) == float(0))) else "FridayMask")])
								else:
									pass
									if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Christmas")))):
										pass
										R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["SantaHat"])
									else:
										pass
										if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MadnessDay")))):
											pass
											R.invoke(R.resolve(c, "gotoAndStop", "RDZombieSpecialHeadPiece"), ["Madness"])
				R.assign(c, "visible", "RDZombieSpecialHeadPiece", true, "=")
	if R.truth(((R.truth((c).fields.get("m_Zombie")) and R.truth((((c).fields.get("m_Zombie")).fields.get("m_bHit") or ((c).fields.get("m_Zombie")).fields.get("m_bExploded")))) and ((c).fields.get("m_Zombie")).fields.get("m_bSpecialZombie"))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "RDZombieSpecialHeadPiece"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame")])
		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Friday13th")))):
			pass
			R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["FridayMaskBreak"])
		else:
			pass
			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MardiGras")))):
				pass
				R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["MardiGrasMaskBreak"])
			else:
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_SaintPatricksDay")))):
					pass
					R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["SaintPatrickHatBreak"])
				else:
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Easter")))):
						pass
						R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["BunnyEarsBreak"])
					else:
						pass
						if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween")))):
							pass
							R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), [("WitchHatBreak" if R.truth((float(((c).fields.get("m_Zombie")).fields.get("m_iSpecialZombieType")) == float(0))) else "FridayMaskBreak")])
						else:
							pass
							if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Christmas")))):
								pass
								R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["SantaHatBreak"])
							else:
								pass
								if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MadnessDay")))):
									pass
									R.invoke(R.resolve(c, "gotoAndPlay", "RDZombieSpecialHeadPiece"), ["MadnessBreak"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Zombie"] = R.coerce(null, "RDZombie")
	return null
