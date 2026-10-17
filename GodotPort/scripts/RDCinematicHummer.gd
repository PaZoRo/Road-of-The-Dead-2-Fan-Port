extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCinematicHummer(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_gameMode: Variant = null
	var v_iBumperFrame: Variant = 0
	var v_iBumperAddonFrame: Variant = 0
	R.invoke(R.super_ref(c, "RDCinematicHummer"), [])
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_gameMode = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_CinematicTransitionGameMode"), "RDGameMode")
	if R.truth(R.get_value(c, "HummerRocketLauncher")):
		pass
		R.set_value(R.get_value(c, "HummerRocketLauncher"), "visible", R.logical_and(R.logical_and((v_info).fields.get("m_bUsingHummer"), func(): return v_gameMode), func(): return R.call_member(v_gameMode, "HasRocketLauncher", [])), "=")
	if R.truth(R.get_value(c, "HummerLMG")):
		pass
		R.set_value(R.get_value(c, "HummerLMG"), "visible", R.logical_and(R.logical_and((v_info).fields.get("m_bUsingHummer"), func(): return v_gameMode), func(): return R.call_member(v_gameMode, "HasMountedMG", [])), "=")
	if R.truth((c).fields.get("HummerIntact")):
		pass
		R.set_value((c).fields.get("HummerIntact"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperHP")) >= float(50))), "=")
	if R.truth((c).fields.get("HummerDamaged")):
		pass
		R.set_value((c).fields.get("HummerDamaged"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperHP")) < float(50))), "=")
	if R.truth(R.get_value(c, "HummerBumper")):
		pass
		R.set_value(R.get_value(c, "HummerBumper"), "visible", ((v_info).fields.get("m_bUsingHummer") and (float((v_info).fields.get("m_fBumperAddonHP")) > float(0))), "=")
	if R.truth((c).fields.get("Hummer")):
		pass
		R.set_value((c).fields.get("Hummer"), "visible", (v_info).fields.get("m_bUsingHummer"), "=")
	if R.truth((c).fields.get("CarRocketLauncher")):
		pass
		R.set_value((c).fields.get("CarRocketLauncher"), "visible", R.logical_and((R.unary("!", (v_info).fields.get("m_bUsingHummer")) and R.truth(v_gameMode)), func(): return R.call_member(v_gameMode, "HasRocketLauncher", [])), "=")
	if R.truth((c).fields.get("CarLMG")):
		pass
		R.set_value((c).fields.get("CarLMG"), "visible", R.logical_and((R.unary("!", (v_info).fields.get("m_bUsingHummer")) and R.truth(v_gameMode)), func(): return R.call_member(v_gameMode, "HasMountedMG", [])), "=")
	if R.truth((c).fields.get("CarIntact")):
		pass
		R.set_value((c).fields.get("CarIntact"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperHP")) >= float(50))), "=")
	if R.truth((c).fields.get("CarDamaged")):
		pass
		R.set_value((c).fields.get("CarDamaged"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperHP")) < float(50))), "=")
	if R.truth((c).fields.get("CarBumper")):
		pass
		R.set_value((c).fields.get("CarBumper"), "visible", (R.unary("!", (v_info).fields.get("m_bUsingHummer")) and (float((v_info).fields.get("m_fBumperAddonHP")) > float(0))), "=")
	if R.truth((c).fields.get("Car")):
		pass
		R.set_value((c).fields.get("Car"), "visible", R.unary("!", (v_info).fields.get("m_bUsingHummer")), "=")
	v_iBumperFrame = R.coerce(0, "int")
	if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(84))):
		pass
		v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Fine"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken1MinHP")))):
			pass
			v_iBumperFrame = R.coerce(R.static_value("RDPlayer", "BumperStage_Broken1"), "int")
		else:
			pass
			if R.truth((float((v_info).fields.get("m_fBumperHP")) >= float(R.static_value("RDPlayer", "BumperBroken2MinHP")))):
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
	if R.truth(R.get_value(c, "Smoke")):
		pass
		R.set_value(R.get_value(c, "Smoke"), "visible", ((float((v_info).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Smoke")))), "=")
	if R.truth(R.get_value(c, "Fire")):
		pass
		R.set_value(R.get_value(c, "Fire"), "visible", ((float((v_info).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Fire")))), "=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["CarIntact"] = R.coerce(null, "MovieClip")
	(c).fields["CarLMG"] = R.coerce(null, "MovieClip")
	(c).fields["CarRocketLauncher"] = R.coerce(null, "MovieClip")
	(c).fields["HummerIntact"] = R.coerce(null, "MovieClip")
	(c).fields["Hummer"] = R.coerce(null, "MovieClip")
	(c).fields["CarDamaged"] = R.coerce(null, "MovieClip")
	(c).fields["CarBumper"] = R.coerce(null, "MovieClip")
	(c).fields["Car"] = R.coerce(null, "MovieClip")
	(c).fields["HummerDamaged"] = R.coerce(null, "MovieClip")
	return null
