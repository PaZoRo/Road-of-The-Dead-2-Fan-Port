extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCivilian(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCivilian"), [R.klass("MC_Civilian"), R.static_value("RDSpawnType", "Civilian"), R.static_value("RDCivilian", "Scale")])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_Civilian"), "int")
	c.fields["m_fSurvivalGuideDistance"] = float(30)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Civilians"), "int")
	(c).fields["m_iHP"] = R.coerce(1, "int")
	(c).fields["m_fDirectionTimer"] = float(0)
	(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	if R.truth(R.binary("==", R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), null)):
		pass
		(c).fields["m_bPlayPleaSound"] = true
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
		pass
		(c).fields["m_bIsTurkey"] = (float(randf()) < float(0.5))
	(c).fields["m_bIsMale"] = ((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay"))) or (float(randf()) > float(0.5)))
	if R.truth((c).fields.get("m_bIsMale")):
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_MalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_MaleGruntSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "RandomHat")
	(c).fields["m_fSpeedZ"] = float((float(R.static_value("RDCivilian", "SpeedZ")) * float((float(0.9) + float((float(randf()) * float(0.2)))))))
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	var v_game: Variant = null
	R.assign(c, "m_MaleCharacterNames", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.assign(c, "m_FemaleCharacterNames", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay")))):
		pass
		R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Pico"])
		R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female1"])
		R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female3"])
		R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female4"])
	else:
		pass
		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MartinLutherKingDay")))):
			pass
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male3"])
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male5"])
			R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female3"])
		else:
			pass
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male1"])
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male2"])
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male3"])
			R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "AddValue", ["Male5"])
			R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female1"])
			R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female3"])
			R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "AddValue", ["Female4"])
	v_game = R.coerce(R.static_value("RDGame", "Instance"), "RDGame")
	R.assign(c, "m_HitSounds", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie01"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie02"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie03"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie04"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MalePleaSounds", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian01Plea02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian01Plea04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian01Plea05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea11"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea12"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea13"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea14"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea15"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea16"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea17"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea18"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea19"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Plea20"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_FemalePleaSounds", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea11"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea12"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea13"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea15"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea16"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea17"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea18"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemalePleaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianPlea19"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_MaleGruntSounds", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_MaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilian02Hit10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_FemaleGruntSounds", "RDCivilian", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianHit10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_TurkeyVoice", "RDCivilian", R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Turkey"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")]), "=")
	R.assign(c, "m_TurkeyGruntVoice", "RDCivilian", R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_TurkeyGrunt"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")]), "=")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "SetInitialState"), [])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bFleeFromPlayer"] = false
	(c).fields["m_bGoToPlayer"] = false
	R.call_member((c).fields.get("m_vDir"), "SetZero", [])
	(c).fields["m_bGotInCar"] = false
	R.call_member((c).fields.get("m_vMoveTarget"), "SetZero", [])
	R.call_member((c).fields.get("m_vMoveToDelta"), "SetZero", [])
	(c).fields["m_iHP"] = R.coerce(1, "int")
	(c).fields["m_fDirectionTimer"] = float(0)
	(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	(c).fields["m_bPlayPleaSound"] = false
	if R.truth(R.binary("==", R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue")), null)):
		pass
		(c).fields["m_bPlayPleaSound"] = true
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
		pass
		(c).fields["m_bIsTurkey"] = (float(randf()) < float(0.5))
	(c).fields["m_bIsMale"] = ((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_PicoDay"))) or (float(randf()) > float(0.5)))
	if R.truth((c).fields.get("m_bIsMale")):
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_MaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_MalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_MaleGruntSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_szCharacterName"] = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_FemaleCharacterNames"), "GetRandomValue", []), R.klass("String")), "String")
		(c).fields["m_PleaSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemalePleaSounds"), "RandomHat")
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDCivilian", "m_FemaleGruntSounds"), "RandomHat")
	(c).fields["m_fSpeedZ"] = float((float(R.static_value("RDCivilian", "SpeedZ")) * float((float(0.9) + float((float(randf()) * float(0.2)))))))
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bGoingRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bGoingRight"] = v_bGoingRight
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", true, "=")
		return null
	if R.truth((((c).fields.get("m_bHitFinished") and (float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Shot")))) or (c).fields.get("m_bGotInCar"))):
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasSoundPlaying", []))):
			pass
			c.fields["m_bDestroyMe"] = true
		return null
	R.call_member(c, "UpdateState", [v_fDeltaTime])
	return null

static func f_UpdateState(c: Variant, a: Array) -> Variant:
	var v_fPleaDistance: Variant = NAN
	var v_pleaSound: Variant = null
	var v_gameplayMode: Variant = null
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPleaDistance = float(NAN)
	v_pleaSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or (c).fields.get("m_bGotInCar"))):
		pass
		return null
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
	if R.truth((c).fields.get("m_bPlayPleaSound")):
		pass
		v_fPleaDistance = R.coerce((R.static_value("RDCivilian", "PleaDistanceTurkey") if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))) else R.static_value("RDCivilian", "PleaDistance")), "Number")
		if R.truth((float(v_fDistance) < float(v_fPleaDistance))):
			pass
			if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDCivilian"), [])) - float(R.static_value("RDCivilian", "m_iLastPleaTime")))) > float(1000))):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyVoice")])
				else:
					pass
					v_pleaSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_PleaSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_pleaSound])
				R.assign(c, "m_iLastPleaTime", "RDCivilian", R.invoke(R.resolve(c, "getTimer", "RDCivilian"), []), "=")
			(c).fields["m_bPlayPleaSound"] = false
	if R.truth(((((c).fields.get("m_Player")).fields.get("m_bHorning") and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) and (float(v_fDistance) < float(R.static_value("RDCivilian", "HornDetectDistance"))))):
		pass
		if R.truth((R.unary("!", (c).fields.get("m_bFleeFromPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDCivilian", "GoToPlayerSpeed"))))):
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
		else:
			pass
			if R.truth(R.logical_and((R.unary("!", (c).fields.get("m_bGoToPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))), func(): return R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", []))):
				pass
				R.call_member(c, "StartGoToPlayer", [])
				R.call_member((c).fields.get("m_Player"), "OnCivComing", [])
	if R.truth((c).fields.get("m_bGoToPlayer")):
		pass
		if R.truth(((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDCivilian", "GoToPlayerSpeed"))) or R.unary("!", R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", [])))):
			pass
			(c).fields["m_bGoToPlayer"] = false
		else:
			pass
			if R.truth((float(v_fDistance) <= float(R.static_value("RDCivilian", "GetInCarDistance")))):
				pass
				R.call_member((c).fields.get("m_Player"), "OnCivGetInCar", [c])
				R.call_member(v_gameplayMode, "OnCivGetInCar", [c])
				(c).fields["m_bGotInCar"] = true
				R.call_member(c, "UpdateAnimation", [true])
	else:
		pass
		(c).fields["m_fDirectionTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDirectionTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fDirectionTimer")) >= float((c).fields.get("m_fDirectionDelay")))):
			pass
			(c).fields["m_bGoingRight"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
		if R.truth((((R.unary("!", (c).fields.get("m_bFleeFromPlayer")) and (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))) and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) and (float(v_fDistance) < float(R.static_value("RDCivilian", "FleeSlowPlayerDistance"))))):
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	return null

static func f_StartGoToPlayer(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	(c).fields["m_bGoToPlayer"] = true
	(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) >= float((c.fields.get("m_vLocation")).fields.get("X")))
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fSpeedX: Variant = NAN
	var v_fSpeedZ: Variant = NAN
	var v_gameplayMode: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedX = float(NAN)
	v_fSpeedZ = float(NAN)
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or c.fields.get("m_bEditorMode"))):
		pass
		return null
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fRoadLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth((c).fields.get("m_bGoToPlayer")):
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (R.unary("-", 0.6) if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) >= float((c.fields.get("m_vLocation")).fields.get("X")))) else 0.6)), "Number")
		((c).fields.get("m_vMoveTarget")).fields["Z"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
		v_fSpeedX = float((float(R.static_value("RDCivilian", "SpeedX")) * float(3)))
		v_fSpeedZ = float((float((c).fields.get("m_fSpeedZ")) * float(3)))
	else:
		pass
		((c).fields.get("m_vMoveTarget")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), (R.static_value("RDCivilian", "SpeedX") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", R.static_value("RDCivilian", "SpeedX")))), "Number")
		((c).fields.get("m_vMoveTarget")).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fSpeedZ"))))
		v_fSpeedX = float(R.static_value("RDCivilian", "SpeedX"))
		v_fSpeedZ = float((c).fields.get("m_fSpeedZ"))
	R.call_member(c, "GetRelativeMoveToDelta", [(c).fields.get("m_fRelativeLocationX"), (c).fields.get("m_vMoveTarget"), v_fSpeedX, v_fSpeedZ, v_fDeltaTime, (c).fields.get("m_vMoveToDelta")])
	if R.truth(((float(((c).fields.get("m_vMoveToDelta")).fields.get("X")) != float(0)) or (float(((c).fields.get("m_vMoveToDelta")).fields.get("Z")) != float(0)))):
		pass
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, ((c).fields.get("m_vMoveToDelta")).fields.get("X"), 0, ((c).fields.get("m_vMoveToDelta")).fields.get("Z"), (c).fields.get("m_Player")])
	(c).fields["m_fRelativeLocationX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), ((c).fields.get("m_vMoveToDelta")).fields.get("X")), "Number")
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c).fields.get("m_fRelativeLocationX")), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	if R.truth(R.unary("!", (c).fields.get("m_bGoToPlayer"))):
		pass
		if R.truth(((R.unary("!", (c).fields.get("m_bGoingRight")) and R.binary("<", (c).fields.get("m_fRelativeLocationX"), R.binary("+", R.unary("-", v_fRoadLimit), 1))) or ((c).fields.get("m_bGoingRight") and (float((c).fields.get("m_fRelativeLocationX")) > float((float(v_fRoadLimit) - float(1))))))):
			pass
			(c).fields["m_bGoingRight"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c.fields.get("m_vVelocity")).fields["X"] = R.coerce((R.static_value("RDCivilian", "SpeedX") if R.truth((c).fields.get("m_bGoingRight")) else R.unary("-", R.static_value("RDCivilian", "SpeedX"))), "Number")
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
	(c).fields["m_bGoingRight"] = (float((c.fields.get("m_vVelocity")).fields.get("X")) > float(0))
	c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
	return null

static func f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth((((((R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "SideHit", (c).fields.get("m_szCharacterName"))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "FrontHit", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "RollOverHit", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), R.binary("+", "Shot", (c).fields.get("m_szCharacterName")))) or R.binary("==", c.fields.get("m_szAnim"), "HitTurkey")) or R.binary("==", c.fields.get("m_szAnim"), "GibHit"))):
		pass
		(c).fields["m_bHitFinished"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		if R.truth(c.fields.get("m_Base")):
			pass
			R.call_member(c.fields.get("m_Base"), "DetachEntity", [c])
		return null
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "InCar")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnEndAnim"), [])
	return null

static func f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_szNewAnim: Variant = null
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_szNewAnim = R.coerce("", "String")
	if R.truth((c).fields.get("m_bGotInCar")):
		pass
		v_szNewAnim = R.coerce("InCar", "String")
	else:
		pass
		if R.truth((float((c).fields.get("m_iHP")) <= float(0))):
			pass
			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
				pass
				v_szNewAnim = R.coerce("HitTurkey", "String")
			else:
				pass
				v_szNewAnim = R.coerce(R.binary("+", "Shot", (c).fields.get("m_szCharacterName")), "String")
		else:
			pass
			if R.truth((c).fields.get("m_bExploded")):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					v_szNewAnim = R.coerce("HitTurkey", "String")
				else:
					pass
					v_szNewAnim = R.coerce("GibHit", "String")
			else:
				pass
				if R.truth(c.fields.get("m_bHit")):
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
						pass
						v_szNewAnim = R.coerce("HitTurkey", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
							pass
							v_szNewAnim = R.coerce("GibHit", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Front")))):
								pass
								v_szNewAnim = R.coerce(R.binary("+", "FrontHit", (c).fields.get("m_szCharacterName")), "String")
							else:
								pass
								if R.truth(((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_RollOver"))) or (float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_SlowRollOver"))))):
									pass
									v_szNewAnim = R.coerce(R.binary("+", "RollOverHit", (c).fields.get("m_szCharacterName")), "String")
								else:
									pass
									v_szNewAnim = R.coerce(R.binary("+", "SideHit", (c).fields.get("m_szCharacterName")), "String")
				else:
					pass
					if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
						pass
						v_szNewAnim = R.coerce(R.binary("+", ("Sprint" if R.truth((c).fields.get("m_bGoToPlayer")) else "Run"), "Turkey"), "String")
					else:
						pass
						v_szNewAnim = R.coerce(R.binary("+", ("Sprint" if R.truth((c).fields.get("m_bGoToPlayer")) else "Run"), (c).fields.get("m_szCharacterName")), "String")
	R.call_member(c, "PlayAnim", [v_szNewAnim, v_bForce])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", c.fields.get("m_bHit")) and ((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))))
	return null

static func f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_iHitAlign: Variant = 0
	var v_gruntSound: Variant = null
	var v_fSpeed: Variant = NAN
	var v_hitSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_iHitAlign = R.coerce(0, "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((c.fields.get("m_bHit") or (c).fields.get("m_bExploded")) or (c).fields.get("m_bGotInCar"))):
		pass
		return false
	c.fields["m_bHit"] = true
	v_fSpeed = float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))
	if R.truth(R.logical_and(((c).fields.get("m_bGoToPlayer") and (float(v_fSpeed) <= float(R.static_value("RDCivilian", "GoToPlayerSpeed")))), func(): return R.call_member((c).fields.get("m_Player"), "CanTakeCivilian", []))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnCivGetInCar", [c])
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		R.call_member(v_gameplayMode, "OnCivGetInCar", [c])
		(c).fields["m_bGotInCar"] = true
		R.call_member(c, "UpdateAnimation", [true])
		return false
	if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinMultiHitSpeed")))):
		pass
		v_iHitAlign = R.coerce(R.call_member((c).fields.get("m_Player"), "GetHitAlign", [c]), "int")
		if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
			pass
			if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinGibSpeed")))):
				pass
				(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
			else:
				pass
				(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
		else:
			pass
			if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center")))):
				pass
				(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
			else:
				pass
				if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight"))))):
					pass
					if R.truth((float(randf()) < float(0.4))):
						pass
						(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Front") if R.truth((float(randf()) < float(0.5))) else R.static_value("RDHumanoid", "HitType_RollOver")), "int")
					else:
						pass
						(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
				else:
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Side"), "int")
	else:
		pass
		(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_SlowRollOver"), "int")
		R.call_member(c, "DoRollOverEffect", [])
	c.fields["m_bFlippedX"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
	R.call_member(c, "UpdateDepthPosition", [])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	c.fields["m_bUseCurvyCamera"] = false
	R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
	v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_hitSound])
	if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
		pass
		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
			pass
			R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyGruntVoice")])
		else:
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	else:
		pass
		R.call_member(c, "StopVoiceSound", [])
	R.call_member(c, "UpdateAnimation", [true])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianHit", [])
	return false
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDCivilian", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		(c).fields["m_bExploded"] = true
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		R.call_member(c, "UpdateAnimation", [true])
		R.call_member(c, "AddGroundBlood", [5, true])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianExploded", [])
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bExploded")):
		pass
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	if R.truth((float((c).fields.get("m_iHP")) > float(0))):
		pass
		(c).fields["m_iHP"] = R.coerce(R.binary("-", (c).fields.get("m_iHP"), v_iDamage), "int")
		if R.truth((float((c).fields.get("m_iHP")) <= float(0))):
			pass
			c.fields["m_bHit"] = true
			(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
				pass
				if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
					pass
					R.call_member(c, "PlayVoiceSound", [R.static_value("RDCivilian", "m_TurkeyGruntVoice")])
				else:
					pass
					v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			else:
				pass
				R.call_member(c, "StopVoiceSound", [])
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "AddGroundBlood", [5])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnCivilianShot", [])
		else:
			pass
			(c).fields["m_bFleeFromPlayer"] = true
			(c).fields["m_bGoingRight"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
			c.fields["m_bFlippedX"] = R.unary("!", (c).fields.get("m_bGoingRight"))
			(c).fields["m_fDirectionTimer"] = float(0)
			(c).fields["m_fDirectionDelay"] = float((float(R.static_value("RDCivilian", "DirectionDelayMin")) + float((float(randf()) * float(R.static_value("RDCivilian", "DirectionDelayRandom"))))))
			R.call_member(c, "AddGroundBlood", [1])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCivilian"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_HitSounds", null, "=")
	R.set_value(c, "m_MalePleaSounds", null, "=")
	R.set_value(c, "m_FemalePleaSounds", null, "=")
	R.set_value(c, "m_MaleGruntSounds", null, "=")
	R.set_value(c, "m_FemaleGruntSounds", null, "=")
	R.set_value(c, "m_MaleCharacterNames", null, "=")
	R.set_value(c, "m_FemaleCharacterNames", null, "=")
	R.set_value(c, "m_TurkeyVoice", null, "=")
	R.set_value(c, "m_TurkeyGruntVoice", null, "=")
	R.set_value(c, "Scale", 2, "=")
	R.set_value(c, "DirectionDelayMin", 2, "=")
	R.set_value(c, "DirectionDelayRandom", 2, "=")
	R.set_value(c, "PleaDistance", 80, "=")
	R.set_value(c, "PleaDistanceTurkey", 50, "=")
	R.set_value(c, "HornDetectDistance", 25, "=")
	R.set_value(c, "GetInCarDistance", 1, "=")
	R.set_value(c, "FleeSlowPlayerDistance", 5, "=")
	R.set_value(c, "SpeedX", R.binary("/", R.binary("/", (float(12) * float(1000)), 60), 60), "=")
	R.set_value(c, "SpeedZ", R.binary("/", R.binary("/", (float(15) * float(1000)), 60), 60), "=")
	R.set_value(c, "GoToPlayerSpeed", R.binary("/", R.binary("/", (float(20) * float(1000)), 60), 60), "=")
	R.set_value(c, "m_iLastPleaTime", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bGoingRight"] = false
	(c).fields["m_fDirectionTimer"] = float(NAN)
	(c).fields["m_fDirectionDelay"] = float(NAN)
	(c).fields["m_bPlayPleaSound"] = false
	(c).fields["m_PleaSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_GruntSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_iHitType"] = R.coerce(0, "int")
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_szCharacterName"] = R.coerce(null, "String")
	(c).fields["m_bFleeFromPlayer"] = false
	(c).fields["m_bGoToPlayer"] = false
	(c).fields["m_iHP"] = R.coerce(0, "int")
	(c).fields["m_vDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_bGotInCar"] = false
	(c).fields["m_bIsMale"] = false
	(c).fields["m_bIsTurkey"] = false
	(c).fields["m_vMoveTarget"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_vMoveToDelta"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fSpeedZ"] = float(NAN)
	return null
