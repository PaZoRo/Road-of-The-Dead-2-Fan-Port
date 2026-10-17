extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPlayerCarEnding(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_game: Variant = null
	var v_gameMode: Variant = null
	var v_iBumperFrame: Variant = 0
	var v_iBumperAddonFrame: Variant = 0
	v_info = R.coerce(null, "RDPlayerInfo")
	R.invoke(R.super_ref(c, "RDPlayerCarEnding"), [])
	v_game = R.coerce(R.static_value("RDGame", "Instance"), "RDGame")
	v_info = R.coerce((v_game).fields.get("m_PlayerInfo"), "RDPlayerInfo")
	v_gameMode = R.coerce(R.binary("as", (v_game).fields.get("m_CinematicTransitionGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth(R.unary("!", v_gameMode)):
		pass
		return null
	R.set_value((c).fields.get("DashboardBloods"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	R.set_value((c).fields.get("DashboardBloodsCar"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	if R.truth((v_info).fields.get("m_bUsingHummer")):
		pass
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood1"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood1")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood2"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood2")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood3"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood3")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood4"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood5"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood5")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood6"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood6")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood7"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood7")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood8"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood8")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood9"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood9")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood10"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood10")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood11"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood11")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood12"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood12")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloods"), "Blood13"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood13")])
	else:
		pass
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood1"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood1")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood2"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood2")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood3"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood3")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood4"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood4")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood5"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood5")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood6"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood6")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood7"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood7")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood8"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood8")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood9"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood9")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood10"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood10")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood11"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood11")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood12"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood12")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood13"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood13")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood14"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood14")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood15"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood15")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood16"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood16")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood17"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood17")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood18"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood18")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood19"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood19")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood20"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood20")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood21"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood21")])
		R.call_member(c, "MatchBlood", [R.get_value((c).fields.get("DashboardBloodsCar"), "Blood22"), R.get_value(R.get_value(((v_gameMode).fields.get("m_Player")).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood22")])
	R.set_value((c).fields.get("SteeringWheel"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	R.set_value((c).fields.get("Interior"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	R.set_value((c).fields.get("Bumper"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	R.set_value((c).fields.get("DashboardBloods"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	R.set_value(R.get_value((c).fields.get("Bumper"), "BreakAddon"), "visible", false, "=")
	R.set_value((c).fields.get("SteeringWheelCar"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	R.set_value((c).fields.get("InteriorCar"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	R.set_value((c).fields.get("BumperCar"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	R.set_value((c).fields.get("DashboardBloodsCar"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("BumperCar"), "BreakAddon"), "visible", false, "=")
	v_iBumperFrame = R.coerce(0, "int")
	if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(84))):
		pass
		v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fine"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(68))):
			pass
			v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken1"), "int")
		else:
			pass
			if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(52))):
				pass
				v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken2"), "int")
			else:
				pass
				if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken3MinHP")))):
					pass
					v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken3"), "int")
				else:
					pass
					if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperSmokeMinHP")))):
						pass
						v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Smoke"), "int")
					else:
						pass
						if R.truth((float((v_info).fields.get("m_fBumperHP")) > float(0))):
							pass
							v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fire"), "int")
	if R.truth((v_info).fields.get("m_bUsingHummer")):
		pass
		R.invoke(R.get_value((c).fields.get("Bumper"), "gotoAndStop"), [(float(v_iBumperFrame) + float(1))])
	else:
		pass
		R.invoke(R.get_value((c).fields.get("BumperCar"), "gotoAndStop"), [(float(v_iBumperFrame) + float(1))])
	v_iBumperAddonFrame = R.coerce(4, "int")
	if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(75))):
		pass
		v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fine"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(50))):
			pass
			v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken1"), "int")
		else:
			pass
			if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) >= float(25))):
				pass
				v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken2"), "int")
			else:
				pass
				if R.truth((float((v_info).fields.get("m_fBumperAddonHP")) > float(0))):
					pass
					v_iBumperAddonFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken3"), "int")
	if R.truth((v_info).fields.get("m_bUsingHummer")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("Bumper"), "Addon"), "gotoAndStop"), [(float(v_iBumperAddonFrame) + float(1))])
	else:
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("BumperCar"), "Addon"), "gotoAndStop"), [(float(v_iBumperAddonFrame) + float(1))])
	return null

static func f_MatchBlood(c: Variant, a: Array) -> Variant:
	var v_blood: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_otherBlood: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	R.set_value(v_blood, "visible", R.get_value(v_otherBlood, "visible"), "=")
	R.set_value(v_blood, "alpha", R.get_value(v_otherBlood, "alpha"), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["DashboardBloodsCar"] = R.coerce(null, "MovieClip")
	(c).fields["Interior"] = R.coerce(null, "MovieClip")
	(c).fields["SteeringWheel"] = R.coerce(null, "MovieClip")
	(c).fields["BumperCar"] = R.coerce(null, "MovieClip")
	(c).fields["DashboardBloods"] = R.coerce(null, "MovieClip")
	(c).fields["SteeringWheelCar"] = R.coerce(null, "MovieClip")
	(c).fields["Bumper"] = R.coerce(null, "MovieClip")
	(c).fields["InteriorCar"] = R.coerce(null, "MovieClip")
	return null
