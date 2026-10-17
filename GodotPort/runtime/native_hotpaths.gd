extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func RDPlayer_Update(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDPlayer")
	var f: Dictionary = c.fields
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	if R.truth(f.get("m_bDoFirstUpdateInit")):
		pass
		R.call_member(c, "FirstUpdateInit", [])
	R.call_member(c, "UpdatePlayerState", [v_fDeltaTime])
	R.call_member(c, "UpdateTask", [v_fDeltaTime])
	R.call_member(c, "UpdateCarState", [v_fDeltaTime])
	R.call_member(c, "UpdateEngineTime", [v_fDeltaTime, f.get("m_iOldEngineState")])
	R.call_member(c, "UpdateSound", [])
	R.call_member(c, "UpdateVelocity", [v_fDeltaTime])
	R.call_member(c, "UpdateEffects", [v_fDeltaTime])
	R.call_member(c, "UpdateHealth", [v_fDeltaTime])
	R.call_member(c, "UpdateAchievements", [])
	R.call_member(c, "UpdateAiming", [v_fDeltaTime])
	R.call_member(c, "UpdateLocation", [])
	R.call_member(c, "UpdateFiring", [])
	R.call_member(c, "UpdateDeathWeaponSounds", [v_fDeltaTime])
	R.call_member(c, "UpdateMedShield", [v_fDeltaTime])
	R.call_member(c, "UpdateVoiceSpeakerPanning", [false, v_fDeltaTime])
	R.call_member(c, "UpdateVoices", [v_fDeltaTime])
	if (float(f.get("m_fPlayHitCivilianVoiceTime")) > float(0)):
		pass
		f["m_fPlayHitCivilianVoiceTime"] = R.num(R.binary("-", f.get("m_fPlayHitCivilianVoiceTime"), v_fDeltaTime))
		if (float(f.get("m_fPlayHitCivilianVoiceTime")) <= float(0)):
			pass
			if ( not R.truth(R.call_member(c, "HasVoicePlaying", []))):
				pass
				R.call_member(c, "PlayQuadDialog", [R.statics["RDPlayer"].get("m_MaleDriverHitCivilianVoices"), R.statics["RDPlayer"].get("m_MaleGunnerHitCivilianVoices"), R.statics["RDPlayer"].get("m_FemaleDriverHitCivilianVoices"), R.statics["RDPlayer"].get("m_FemaleGunnerHitCivilianVoices"), 0.25, R.statics["RDPlayer"].get("VoicePriority_Extra")])
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "Update"), [v_fDeltaTime])
	return null


static func RDPlayer_UpdateEffects(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGame")
	R.ensure_statics("RDPlayer")
	R.ensure_statics("RDPlayerInfo")
	var f: Dictionary = c.fields
	var v_blood: R.Value = null
	var v_fSpeedRatio: float = NAN
	var v_fRotation: float = NAN
	var v_camera: R.Value = null
	var v_fCurveVariance: float = NAN
	var v_fCurveRot: float = NAN
	var v_i: int = 0
	var v_bIsOnGrass: bool = false
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_blood = null
	if R.truth((((float(f.get("m_iFailType")) == float(R.statics["RDPlayer"].get("FailType_Explosion"))) or (float(f.get("m_iFailType")) == float(R.statics["RDPlayer"].get("FailType_BodyKill")))) or f.get("m_bChopperMode"))):
		pass
		return null
	v_fSpeedRatio = float(minf(float((float(R.binary("/", (f.get("m_vVelocity") as R.Value).fields.get("Z"), f.get("m_fMaxSpeed"))) * float(f.get("m_fMaxSpeedFactor")))), float(1)))
	if (float(f.get("m_iNbBlownTires")) > float(0)):
		pass
		(f.get("m_TireScrapingShake") as R.Value).fields["m_fShakeIntensity"] = float((v_fSpeedRatio * float(f.get("m_fMaxBlownTireShake"))))
		R.call_member(f.get("m_TireScrapingSound"), "SetMaxVolume", [(v_fSpeedRatio * float(f.get("m_fMaxBlownTireVolume")))])
	v_fRotation = float((float(R.binary("/", f.get("m_fDesiredSpeedX"), f.get("m_fXMaxSpeedHandBrake"))) * float(R.statics["RDPlayer"].get("MaxSteeringWheelRotation"))))
	v_camera = ((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera")
	v_fCurveVariance = float((float((v_camera).fields.get("m_fCurveRotation")) - float(f.get("m_fLastCurveRotation"))))
	f["m_fLastCurveRotation"] = float((v_camera).fields.get("m_fCurveRotation"))
	v_fCurveRot = float((float(R.binary("/", v_fCurveVariance, v_fDeltaTime)) * float(R.statics["RDPlayer"].get("MaxSteeringWheelRotationRatioForCurve"))))
	v_fRotation = R.num(R.binary("+", v_fRotation, v_fCurveRot))
	f["m_fVerticalCurve"] = float((R.num(R.call_static("RDWorld", "GetPerlinY", [(float((f.get("m_vLocation") as R.Value).fields.get("Z")) + float(10))])) - R.num(R.call_static("RDWorld", "GetPerlinY", [(f.get("m_vLocation") as R.Value).fields.get("Z")]))))
	R.set_value(f.get("m_MCCarInterior"), "y", (R.num((-60)) - float((float(f.get("m_fVerticalCurve")) * float(20)))), "=")
	R.set_value(R.get_value(f.get("m_MCCarInterior"), "LeftArm"), "rotation", (v_fRotation if (float(f.get("m_iLeftHandState")) == float(R.statics["RDPlayer"].get("HandState_OnWheel"))) else 0), "=")
	R.set_value(R.get_value(f.get("m_MCCarInterior"), "SteeringWheel"), "rotation", v_fRotation, "=")
	R.set_value(R.get_value(f.get("m_MCCarInterior"), "SteeringWheelCar"), "rotation", v_fRotation, "=")
	R.set_value(R.get_value(f.get("m_MCCarInterior"), "RightArm"), "rotation", (v_fRotation if (float(f.get("m_iLeftHandState")) == float(R.statics["RDPlayer"].get("HandState_OnWheel"))) else 0), "=")
	if R.truth(R.get_value(R.get_value(f.get("m_MCCarInterior"), "Smoke"), "visible")):
		pass
		R.call_member(c, "SkewMC", [R.get_value(f.get("m_MCCarInterior"), "Smoke"), (float((f.get("m_vVelocity") as R.Value).fields.get("X")) * float(R.statics["RDPlayer"].get("SmokeSpeedToSkewFactor"))), 0])
	if R.truth(R.get_value(R.get_value(f.get("m_MCCarInterior"), "Fire"), "visible")):
		pass
		R.call_member(c, "SkewMC", [R.get_value(f.get("m_MCCarInterior"), "Fire"), (float((f.get("m_vVelocity") as R.Value).fields.get("X")) * float(R.statics["RDPlayer"].get("FireSpeedToSkewFactor"))), 0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, (f.get("m_AllDashboardBloods")).size())):
		pass
		v_blood = R.native_array_item(f.get("m_AllDashboardBloods"), int(v_i))
		R.set_value(v_blood, "m_fAlpha", (float(0.1) * v_fDeltaTime), "-=")
		R.set_value(v_blood, "alpha", minf(R.num(R.get_value(v_blood, "m_fAlpha")), float(1)), "=")
		v_i = R.signed32(v_i + 1)
	if R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bIsFemale")):
		pass
		f["m_fFemaleArmBloodLevel"] = float(maxf(float((float(f.get("m_fFemaleArmBloodLevel")) - float((float(R.statics["RDPlayer"].get("ArmBloodFadeRate")) * v_fDeltaTime)))), float(0)))
	else:
		pass
		f["m_fMaleArmBloodLevel"] = float(maxf(float((float(f.get("m_fMaleArmBloodLevel")) - float((float(R.statics["RDPlayer"].get("ArmBloodFadeRate")) * v_fDeltaTime)))), float(0)))
	v_bIsOnGrass = R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "IsOnRoughSurface", [f.get("m_fRelativeLocationX"), (f.get("m_vLocation") as R.Value).fields.get("Z")]))
	if R.truth(R.binary("!=", v_bIsOnGrass, f.get("m_bWasOnGrass"))):
		pass
		if v_bIsOnGrass:
			pass
			f["m_GrassShake"] = R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "AddShake", ["GrassShake", 0.002, 0, (-1), 0])
			R.call_member(c, "PlaySoundOnActor", [f.get("m_GrassSound"), true])
		else:
			pass
			R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "StopShake", ["GrassShake", 0.1])
			R.call_member(c, "StopSoundOnActor", [f.get("m_GrassSound")])
	f["m_bWasOnGrass"] = v_bIsOnGrass
	if (( not R.truth(f.get("m_bFailed"))) and R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "IsOnLava", [f.get("m_fRelativeLocationX"), (f.get("m_vLocation") as R.Value).fields.get("Z")]))):
		pass
		if R.truth(R.call_member(f.get("m_GameModeGameplay"), "IsLavaInstantDeathEnabled", [])):
			pass
			R.call_member(c, "Explode", [])
		else:
			pass
			f["m_fLavaTimer"] = R.num(R.binary("+", f.get("m_fLavaTimer"), v_fDeltaTime))
			if (float(f.get("m_fLavaTimer")) > float(R.statics["RDPlayer"].get("LavaDelay"))):
				pass
				if (float((R.statics["RDPlayerInfo"].get("Instance") as R.Value).fields.get("m_fNbBlownTires")) < float(4)):
					pass
					R.call_member(c, "DealTireDamage", [2])
					R.call_member(c, "StartTireBias", [])
				else:
					pass
					R.call_member(c, "DealBumperDamage", [null, 30, false, 0])
				f["m_fLavaTimer"] = float(0)
		if ( not R.truth(R.call_member(f.get("m_LavaSound"), "IsPlaying", []))):
			pass
			R.call_member(c, "PlaySoundOnActor", [f.get("m_LavaSound"), true])
	else:
		pass
		if R.truth(R.call_member(f.get("m_LavaSound"), "IsPlaying", [])):
			pass
			R.call_member(c, "StopSoundOnActor", [f.get("m_LavaSound")])
	if R.truth(f.get("m_GrassShake")):
		pass
		(f.get("m_GrassShake") as R.Value).fields["m_fShakeIntensity"] = float((v_fSpeedRatio * float(0.002)))
	R.call_member(f.get("m_GrassSound"), "SetMaxVolume", [v_fSpeedRatio])
	return null


static func RDPlayer_UpdatePlayerState(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGame")
	R.ensure_statics("RDHighwayRamp")
	R.ensure_statics("RDPlayer")
	R.ensure_statics("RDPlayerInfo")
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_iArea: int = 0
	var v_bIsMale: bool = false
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_iArea = R.coerce(0, "int")
	v_bIsMale = false
	R.call_member(f.get("m_Weapon"), "Update", [v_fDeltaTime])
	R.call_member(f.get("m_WeaponMountedMG"), "UpdateOverheat", [v_fDeltaTime])
	if R.truth(f.get("m_bSwitchingDriver")):
		pass
		f["m_fSwitchDriverTime"] = R.num(R.binary("+", f.get("m_fSwitchDriverTime"), v_fDeltaTime))
		if R.truth(R.binary(">", f.get("m_fSwitchDriverTime"), R.get_value(R.statics["RDPlayer"].get("SwitchDriverDuration"), (R.statics["RDPlayerInfo"].get("Instance") as R.Value).fields.get("m_iDriverSwitchLevel")))):
			pass
			R.call_member(c, "EndSwitchDriver", [])
	if R.truth(f.get("m_bSwitchingWeapon")):
		pass
		f["m_fSwitchWeaponTime"] = R.num(R.binary("+", f.get("m_fSwitchWeaponTime"), v_fDeltaTime))
		if (float(f.get("m_fSwitchWeaponTime")) > float(f.get("m_fSwitchWeaponDuration"))):
			pass
			R.call_member(c, "EndSwitchWeapon", [])
	if ( not R.truth(f.get("m_bChopperMode"))):
		pass
		if ((((((R.truth(((float((f.get("m_vVelocity") as R.Value).fields.get("Z")) == float(0)) and (float(f.get("m_iCurrentTask")) == float(R.statics["RDPlayer"].get("Task_None"))))) and R.truth(R.call_member(f.get("m_GameModeGameplay"), "CanPlayNotMovingDialog", []))) and ( not R.truth(f.get("m_bForceBrake")))) and ( not R.truth(f.get("m_ClingerLeft")))) and ( not R.truth(f.get("m_ClingerRight")))) and ( not R.truth(f.get("m_ClingerSideLeft")))) and ( not R.truth(f.get("m_ClingerSideRight")))):
			pass
			if (float(f.get("m_fNotMovingTimer")) < float(R.statics["RDPlayer"].get("NotMovingVoiceDelay"))):
				pass
				f["m_fNotMovingTimer"] = R.num(R.binary("+", f.get("m_fNotMovingTimer"), v_fDeltaTime))
				if (float(f.get("m_fNotMovingTimer")) >= float(R.statics["RDPlayer"].get("NotMovingVoiceDelay"))):
					pass
					if R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bIsFemale")):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Cocheta"), R.statics["RDPlayer"].get("m_MaleNotMovingVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Diane"), R.statics["RDPlayer"].get("m_FemaleNotMovingVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
		else:
			pass
			f["m_fNotMovingTimer"] = float(0)
		if R.truth((f.get("m_bPlayCivGetInVoice") and ( not R.truth(R.call_member(c, "HasVoicePlaying", []))))):
			pass
			if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_ThanksGiving"))):
				pass
				R.call_member(c, "PlayVoiceSound", [R.statics["RDPlayer"].get("m_TurkeyGetInVocie"), R.statics["RDPlayer"].get("VoicePriority_Generic")])
			else:
				pass
				v_bIsMale = R.truth(R.call_member(c, "IsLastCivMale", []))
				if v_bIsMale:
					pass
					R.call_member(c, "PlayRandomVoice", [R.statics["RDPlayer"].get("m_MaleCivGetInVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayRandomVoice", [R.statics["RDPlayer"].get("m_FemaleCivGetInVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
			R.assign(c, "m_iCivGetInVoiceTime", "RDPlayer", R.invoke(R.resolve(c, "getTimer", "RDPlayer"), []), "=")
			f["m_bPlayCivGetInVoice"] = false
		if R.truth((f.get("m_bPlayFullCivVoice") and ( not R.truth(R.call_member(c, "HasVoicePlaying", []))))):
			pass
			if (float(randf()) > float(0.5)):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Cocheta"), R.statics["RDPlayer"].get("m_MaleCivFullVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Diane"), R.statics["RDPlayer"].get("m_FemaleCivFullVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
			f["m_bPlayFullCivVoice"] = false
		if R.truth(R.binary(">", absf(R.num((f.get("m_vVelocity") as R.Value).fields.get("X"))), 0)):
			pass
			R.call_member(c, "AddDrivingPoints", [(float(ceilf(R.num(absf(R.num((f.get("m_vVelocity") as R.Value).fields.get("X")))))) * float(R.statics["RDPlayer"].get("DrivingPointsPerTurning")))])
		v_iArea = R.coerce(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "GetNearbySlice", []), "int")
		if (float(v_iArea) != float(f.get("m_iLastArea"))):
			pass
			if R.truth(((float(v_iArea) == float(R.statics["RDRoad"].get("SliceType_Alleyway"))) and ( not R.truth(R.statics["RDHighwayRamp"].get("m_bRampPresent"))))):
				pass
				R.call_member(c, "PlayQuadDialog", [R.statics["RDPlayer"].get("m_MaleDriverAlleywayVoices"), R.statics["RDPlayer"].get("m_MaleGunnerAlleywayVoices"), R.statics["RDPlayer"].get("m_FemaleDriverAlleywayVoices"), R.statics["RDPlayer"].get("m_FemaleGunnerAlleywayVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Extra")])
			f["m_iLastArea"] = R.coerce(v_iArea, "int")
	if R.truth((((R.truth(f.get("m_ClingerLeft")) and ( not R.truth(R.get_value((f.get("m_ClingerLeft") as R.Value).fields.get("m_ClingMC"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerLeft") as R.Value).fields.get("m_ClingMCInside"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerLeft") as R.Value).fields.get("m_ClingMCUnder"), "parent"))))):
		pass
		R.call_member(f.get("m_ClingerLeft"), "ForceRemove", [])
		f["m_ClingerLeft"] = null
	if R.truth((((R.truth(f.get("m_ClingerRight")) and ( not R.truth(R.get_value((f.get("m_ClingerRight") as R.Value).fields.get("m_ClingMC"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerRight") as R.Value).fields.get("m_ClingMCInside"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerRight") as R.Value).fields.get("m_ClingMCUnder"), "parent"))))):
		pass
		R.call_member(f.get("m_ClingerRight"), "ForceRemove", [])
		f["m_ClingerRight"] = null
	if R.truth((((R.truth(f.get("m_ClingerSideLeft")) and ( not R.truth(R.get_value((f.get("m_ClingerSideLeft") as R.Value).fields.get("m_ClingMC"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerSideLeft") as R.Value).fields.get("m_ClingMCInside"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerSideLeft") as R.Value).fields.get("m_ClingMCUnder"), "parent"))))):
		pass
		R.call_member(f.get("m_ClingerSideLeft"), "ForceRemove", [])
		f["m_ClingerSideLeft"] = null
	if R.truth((((R.truth(f.get("m_ClingerSideRight")) and ( not R.truth(R.get_value((f.get("m_ClingerSideRight") as R.Value).fields.get("m_ClingMC"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerSideRight") as R.Value).fields.get("m_ClingMCInside"), "parent")))) and ( not R.truth(R.get_value((f.get("m_ClingerSideRight") as R.Value).fields.get("m_ClingMCUnder"), "parent"))))):
		pass
		R.call_member(f.get("m_ClingerSideRight"), "ForceRemove", [])
		f["m_ClingerSideRight"] = null
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalMaleLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalFemaleLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalMaleNewLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalFemaleNewLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieHardLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieGrubLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieSoldierLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieVeryHardLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerSoldierLeft"), R.binary("!=", f.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalMaleRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalFemaleRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalMaleNewRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieNormalFemaleNewRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieHardRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieGrubRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieSoldierRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerZombieVeryHardRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [f.get("m_ClingerSoldierRight"), R.binary("!=", f.get("m_ClingerRight"), null)])
	return null


static func RDPlayer_UpdateAiming(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGame")
	var f: Dictionary = c.fields
	var v_fDownRatio: float = NAN
	var v_viewport: R.Value = null
	var v_fActualAimingSpeed: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fDownRatio = float(NAN)
	v_viewport = (R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_Viewport")
	v_fActualAimingSpeed = R.num(R.call_member(f.get("m_Weapon"), "GetAimingSpeed", []))
	f["m_fTargetAimingX"] = R.num(R.get_value((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_RootMC"), "mouseX"))
	f["m_fTargetAimingY"] = R.num(R.get_value((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_RootMC"), "mouseY"))
	f["m_fAimingX"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fAimingX"), f.get("m_fTargetAimingX"), v_fDeltaTime, v_fActualAimingSpeed]))
	f["m_fAimingY"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fAimingY"), f.get("m_fTargetAimingY"), v_fDeltaTime, v_fActualAimingSpeed]))
	f["m_fHandlingInfluenceX"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fHandlingInfluenceX"), 0, v_fDeltaTime, R.call_member(f.get("m_Weapon"), "GetHandlingInfluenceRecoverySpeed", [])]))
	f["m_fHandlingInfluenceY"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fHandlingInfluenceY"), 0, v_fDeltaTime, R.call_member(f.get("m_Weapon"), "GetHandlingInfluenceRecoverySpeed", [])]))
	f["m_fAimingX"] = R.num(R.binary("+", f.get("m_fAimingX"), f.get("m_fHandlingInfluenceX")))
	f["m_fAimingY"] = R.num(R.binary("+", f.get("m_fAimingY"), f.get("m_fHandlingInfluenceY")))
	f["m_fAimingRatioX"] = float(R.binary("/", (float((float(R.binary("/", f.get("m_fAimingX"), (v_viewport).fields.get("m_iWidth"))) * float(R.statics["RDGame"].get("ReferenceResX")))) - float(R.binary("/", R.statics["RDGame"].get("ReferenceResX"), 2))), R.binary("/", R.statics["RDGame"].get("ReferenceResX"), 2)))
	f["m_fAimingRatioY"] = float(R.binary("/", (float((float(R.binary("/", f.get("m_fAimingY"), (v_viewport).fields.get("m_iHeight"))) * float(R.statics["RDGame"].get("ReferenceResY")))) - float(R.binary("/", R.statics["RDGame"].get("ReferenceResY"), 2))), R.binary("/", R.statics["RDGame"].get("ReferenceResY"), 2)))
	if (float(f.get("m_fAimingRatioX")) < float(0)):
		pass
		if (float(f.get("m_fAimingRatioY")) < float(0)):
			pass
			R.call_member(c, "SetBlendedWeaponPos", [(f.get("m_Weapon") as R.Value).fields.get("m_TopLeftPos"), (f.get("m_Weapon") as R.Value).fields.get("m_TopPos"), (f.get("m_Weapon") as R.Value).fields.get("m_LeftPos"), (f.get("m_Weapon") as R.Value).fields.get("m_CenterPos"), (float(1) - R.num(absf(R.num(f.get("m_fAimingRatioX"))))), (float(1) - R.num(absf(R.num(f.get("m_fAimingRatioY")))))])
		else:
			pass
			R.call_member(c, "SetBlendedWeaponPos", [(f.get("m_Weapon") as R.Value).fields.get("m_LeftPos"), (f.get("m_Weapon") as R.Value).fields.get("m_CenterPos"), (f.get("m_Weapon") as R.Value).fields.get("m_BottomLeftPos"), (f.get("m_Weapon") as R.Value).fields.get("m_BottomPos"), (float(1) - R.num(absf(R.num(f.get("m_fAimingRatioX"))))), f.get("m_fAimingRatioY")])
	else:
		pass
		if (float(f.get("m_fAimingRatioY")) < float(0)):
			pass
			R.call_member(c, "SetBlendedWeaponPos", [(f.get("m_Weapon") as R.Value).fields.get("m_TopPos"), (f.get("m_Weapon") as R.Value).fields.get("m_TopRightPos"), (f.get("m_Weapon") as R.Value).fields.get("m_CenterPos"), (f.get("m_Weapon") as R.Value).fields.get("m_RightPos"), f.get("m_fAimingRatioX"), (float(1) - R.num(absf(R.num(f.get("m_fAimingRatioY")))))])
		else:
			pass
			R.call_member(c, "SetBlendedWeaponPos", [(f.get("m_Weapon") as R.Value).fields.get("m_CenterPos"), (f.get("m_Weapon") as R.Value).fields.get("m_RightPos"), (f.get("m_Weapon") as R.Value).fields.get("m_BottomPos"), (f.get("m_Weapon") as R.Value).fields.get("m_BottomRightPos"), f.get("m_fAimingRatioX"), f.get("m_fAimingRatioY")])
	if R.truth(f.get("m_bGunRaising")):
		pass
		f["m_fGunRaiseTimer"] = float(minf(float((float(f.get("m_fGunRaiseTimer")) + v_fDeltaTime)), float(f.get("m_fGunRaiseDuration"))))
		v_fDownRatio = float((float(1) - float(R.binary("/", f.get("m_fGunRaiseTimer"), f.get("m_fGunRaiseDuration")))))
		R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "x", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("X"), 330, v_fDownRatio]), "=")
		R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "y", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("Y"), 135, v_fDownRatio]), "=")
		R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "rotation", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("Z"), (-40), v_fDownRatio]), "=")
		if (v_fDownRatio == float(0)):
			pass
			R.call_member(c, "OnFiringArmRaised", [])
	else:
		pass
		if R.truth(f.get("m_bGunDown")):
			pass
			f["m_fGunDownTimer"] = float(minf(float((float(f.get("m_fGunDownTimer")) + v_fDeltaTime)), float(f.get("m_fGunDownDuration"))))
			v_fDownRatio = float(R.binary("/", f.get("m_fGunDownTimer"), f.get("m_fGunDownDuration")))
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "x", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("X"), 330, v_fDownRatio]), "=")
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "y", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("Y"), 135, v_fDownRatio]), "=")
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "rotation", R.call_static("Maths", "Lerp", [(f.get("m_WeaponPos") as R.Value).fields.get("Z"), (-40), v_fDownRatio]), "=")
		else:
			pass
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "x", (f.get("m_WeaponPos") as R.Value).fields.get("X"), "=")
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "y", (f.get("m_WeaponPos") as R.Value).fields.get("Y"), "=")
			R.set_value(R.get_value(f.get("m_MCCarInterior"), "FiringArm"), "rotation", (f.get("m_WeaponPos") as R.Value).fields.get("Z"), "=")
	return null


static func RDPlayer_UpdateVelocity(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fSpeedRatio: float = NAN
	var v_bHandBraking: bool = false
	var v_fXMaxSpeed: float = NAN
	var v_fXAccel: Variant = null
	var v_fXDeccel: Variant = null
	var v_fSlipperyFactor: float = NAN
	var v_fSlipperyControlFactor: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fSpeedRatio = R.num(NAN)
	v_bHandBraking = false
	v_fXMaxSpeed = R.num(NAN)
	v_fXAccel = null
	v_fXDeccel = null
	v_fSlipperyFactor = R.num(NAN)
	v_fSlipperyControlFactor = R.num(NAN)
	if R.truth(f.get("m_bChopperMode")):
		pass
		return null
	f["m_fTargetMaxSpeedFactor"] = R.num(R.call_member(f.get("m_GameModeGameplay"), "GetPlayerSpeedFactor", []))
	if (float(f.get("m_fTargetMaxSpeedFactor")) > float(f.get("m_fMaxSpeedFactor"))):
		pass
		f["m_fMaxSpeedFactor"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fMaxSpeedFactor"), f.get("m_fTargetMaxSpeedFactor"), v_fDeltaTime, 2]))
	else:
		pass
		f["m_fMaxSpeedFactor"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fMaxSpeedFactor"), f.get("m_fTargetMaxSpeedFactor"), v_fDeltaTime, 1]))
	(f.get("m_vVelocity") as R.Value).fields["Z"] = float((float((R.num(R.call_member(c, "GetCurrentSpeedRatio", [])) * float(f.get("m_fMaxSpeed")))) * float(f.get("m_fMaxSpeedFactor"))))
	(f.get("m_vVelocity") as R.Value).fields["X"] = float(f.get("m_fPreEffectVelocityX"))
	if (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0)):
		pass
		v_fSpeedRatio = R.num(minf(float(R.binary("/", (f.get("m_vVelocity") as R.Value).fields.get("Z"), (float((float(f.get("m_fMaxSpeed")) * float(f.get("m_fMaxSpeedFactor")))) * float(0.75)))), float(1)))
		v_fSpeedRatio = R.num((float(1) - float(pow(float((float(1) - v_fSpeedRatio)), float(2)))))
		v_bHandBraking = (((R.truth(f.get("m_bHandBraking")) and R.truth(R.call_member(c, "CanHandBrake", []))) and (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0))) and ( not R.truth(f.get("m_bFullSpeedMode"))))
		v_fXMaxSpeed = R.num((v_fSpeedRatio * R.num((f.get("m_fXMaxSpeedHandBrake") if v_bHandBraking else f.get("m_fXMaxSpeed")))))
		v_fXAccel = (f.get("m_fXAccelHandBrake") if v_bHandBraking else f.get("m_fXAccel"))
		v_fXDeccel = (f.get("m_fXDeccelHandBrake") if v_bHandBraking else f.get("m_fXDeccel"))
		if (float(f.get("m_iNbBlownTires")) > float(0)):
			pass
			v_fXAccel = R.binary("*", v_fXAccel, f.get("m_fBlownTireControlFactor"))
			v_fXDeccel = R.binary("*", v_fXDeccel, f.get("m_fBlownTireControlFactor"))
		v_fSlipperyFactor = R.num(f.get("m_fOilFactor"))
		v_fSlipperyControlFactor = R.num(f.get("m_fOilControlFactor"))
		if R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "IsOnSnow", [f.get("m_fRelativeLocationX"), (f.get("m_vLocation") as R.Value).fields.get("Z")])):
			pass
			v_fSlipperyFactor = R.num(1)
			v_fSlipperyControlFactor = R.num(0.6)
		else:
			pass
			if R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "IsOnMud", [f.get("m_fRelativeLocationX"), (f.get("m_vLocation") as R.Value).fields.get("Z")])):
				pass
				v_fSlipperyFactor = R.num(1)
				v_fSlipperyControlFactor = R.num(0.8)
			else:
				pass
				if R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "IsOnIce", [f.get("m_fRelativeLocationX"), (f.get("m_vLocation") as R.Value).fields.get("Z")])):
					pass
					v_fSlipperyFactor = R.num(1)
					v_fSlipperyControlFactor = R.num(0.2)
		if (v_fSlipperyFactor > float(0)):
			pass
			v_fXAccel = (float((v_fSlipperyFactor * float((R.num(v_fXAccel) * v_fSlipperyControlFactor)))) + float((float((float(1) - v_fSlipperyFactor)) * R.num(v_fXAccel))))
			v_fXDeccel = (float((v_fSlipperyFactor * float((R.num(v_fXDeccel) * v_fSlipperyControlFactor)))) + float((float((float(1) - v_fSlipperyFactor)) * R.num(v_fXDeccel))))
		if (float(f.get("m_fWheelDirection")) < float(0)):
			pass
			if R.truth(R.binary(">", (f.get("m_vVelocity") as R.Value).fields.get("X"), R.unary("-", v_fXMaxSpeed))):
				pass
				(f.get("m_vVelocity") as R.Value).fields["X"] = float(maxf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) - float((R.num(v_fXAccel) * v_fDeltaTime)))), R.num(R.unary("-", v_fXMaxSpeed))))
			else:
				pass
				(f.get("m_vVelocity") as R.Value).fields["X"] = float(minf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) + float((R.num(v_fXDeccel) * v_fDeltaTime)))), R.num(R.unary("-", v_fXMaxSpeed))))
		else:
			pass
			if (float(f.get("m_fWheelDirection")) > float(0)):
				pass
				if (float((f.get("m_vVelocity") as R.Value).fields.get("X")) < v_fXMaxSpeed):
					pass
					(f.get("m_vVelocity") as R.Value).fields["X"] = float(minf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) + float((R.num(v_fXAccel) * v_fDeltaTime)))), v_fXMaxSpeed))
				else:
					pass
					(f.get("m_vVelocity") as R.Value).fields["X"] = float(maxf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) - float((R.num(v_fXDeccel) * v_fDeltaTime)))), v_fXMaxSpeed))
			else:
				pass
				if (float((f.get("m_vVelocity") as R.Value).fields.get("X")) > float(0)):
					pass
					(f.get("m_vVelocity") as R.Value).fields["X"] = float(maxf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) - float((R.num(v_fXDeccel) * v_fDeltaTime)))), float(0)))
				else:
					pass
					(f.get("m_vVelocity") as R.Value).fields["X"] = float(minf(float((float((f.get("m_vVelocity") as R.Value).fields.get("X")) + float((R.num(v_fXDeccel) * v_fDeltaTime)))), float(0)))
	else:
		pass
		(f.get("m_vVelocity") as R.Value).fields["X"] = float(0)
	f["m_fPreEffectVelocityX"] = float((f.get("m_vVelocity") as R.Value).fields.get("X"))
	if R.truth(((float((f.get("m_vVelocity") as R.Value).fields.get("Z")) != float(0)) and (float(f.get("m_iNbBlownTires")) > float(0)))):
		pass
		f["m_fTireBiasStrength"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fTireBiasStrength"), f.get("m_fTargetTireBiasStrength"), v_fDeltaTime, 1]))
		(f.get("m_vVelocity") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_vVelocity") as R.Value).fields.get("X"), (float(minf(float((float(R.binary("/", (f.get("m_vVelocity") as R.Value).fields.get("Z"), f.get("m_fMaxSpeed"))) * float(f.get("m_fMaxSpeedFactor")))), float(1))) * float(f.get("m_fTireBiasStrength")))))
	(f.get("m_vVelocity") as R.Value).fields["X"] = float((float((float(f.get("m_fBumpStrength")) * float(f.get("m_fBumpSpeed")))) + float((float((float(1) - float(f.get("m_fBumpStrength")))) * float((f.get("m_vVelocity") as R.Value).fields.get("X"))))))
	if (float(f.get("m_fBumpStrength")) > float(0)):
		pass
		f["m_fBumpStrength"] = float(maxf(R.num(R.set_value(c, "m_fBumpStrength", (float(f.get("m_fBumpStrength")) - float((float(f.get("m_fBumpDeccel")) * v_fDeltaTime))), "=")), float(0)))
	f["m_fClingPatrolDistance"] = float(0)
	return null


static func RDPlayer_SafeHideClingerMC(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_mc: R.Value = (a[0] if a.size() > 0 else null)
	var v_bValid: bool = R.truth((a[1] if a.size() > 1 else false))
	if R.truth((R.truth(R.get_value(v_mc, "parent")) and ( not v_bValid))):
		pass
		R.invoke(R.get_value(R.get_value(v_mc, "parent"), "removeChild"), [v_mc])
		R.set_value(v_mc, "visible", false, "=")
	return null


static func RDPlayer_GetSpeedRatio(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	return minf(float((float(R.binary("/", (f.get("m_vVelocity") as R.Value).fields.get("Z"), f.get("m_fMaxSpeed"))) * float(f.get("m_fMaxSpeedFactor")))), float(1))
	return null


static func RDPlayer_UpdateVoices(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGame")
	R.ensure_statics("RDPlayer")
	var f: Dictionary = c.fields
	var v_bSideClingLeft: bool = false
	var v_bPlayed: bool = false
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_bSideClingLeft = false
	v_bPlayed = false
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "UpdateVoices"), [v_fDeltaTime])
	if R.truth((((f.get("m_bPlayChopperSupportAcknowledgeVoice") and R.binary("==", f.get("m_VoiceSound"), f.get("m_CallChopperSupportVoice"))) and ( not R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(f.get("m_VoiceSound"), "IsPlaying", []))))):
		pass
		R.call_member(c, "PlayChopperSupportAcknowledgeVoice", [])
		f["m_bPlayChopperSupportAcknowledgeVoice"] = false
	if R.truth(((( not R.truth(f.get("m_VoiceSound"))) or ( not R.truth(R.call_member(f.get("m_VoiceSound"), "IsPlaying", [])))) and ((R.truth(f.get("m_ClingerSideLeft")) and ( not R.truth((f.get("m_ClingerSideLeft") as R.Value).fields.get("m_bHit")))) or (R.truth(f.get("m_ClingerSideRight")) and ( not R.truth((f.get("m_ClingerSideRight") as R.Value).fields.get("m_bHit"))))))):
		pass
		if R.truth((R.truth(f.get("m_ClingerSideLeft")) and R.truth(f.get("m_ClingerSideRight")))):
			pass
			v_bSideClingLeft = f.get("m_bLastSideClingerSide")
		else:
			pass
			if R.truth(f.get("m_ClingerSideLeft")):
				pass
				v_bSideClingLeft = true
			else:
				pass
				v_bSideClingLeft = false
		v_bPlayed = false
		if R.truth(R.binary("==", v_bSideClingLeft, (R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bIsFemale"))):
			pass
			v_bPlayed = R.truth(R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Diane"), R.statics["RDPlayer"].get("m_FemaleSideClingLoopVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_CrucialGameplay")]))
		else:
			pass
			v_bPlayed = R.truth(R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Cocheta"), R.statics["RDPlayer"].get("m_MaleSideClingLoopVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_CrucialGameplay")]))
		if v_bPlayed:
			pass
			f["m_ClingLoopVoice"] = f.get("m_VoiceSound")
	if R.truth((((R.truth(f.get("m_ClingLoopVoice")) and R.truth(R.call_member(f.get("m_ClingLoopVoice"), "IsPlaying", []))) and ( not R.truth(f.get("m_ClingerSideLeft")))) and ( not R.truth(f.get("m_ClingerSideRight"))))):
		pass
		R.call_member(c, "StopSoundOnActor", [f.get("m_ClingLoopVoice")])
		f["m_ClingLoopVoice"] = null
	if R.truth(((f.get("m_bPlayDriverDeathVoice") and (( not R.truth(f.get("m_VoiceSound"))) or ( not R.truth(R.call_member(f.get("m_VoiceSound"), "IsPlaying", []))))) and ( not R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bPaused"))))):
		pass
		R.call_member(c, "PlayDriverDeathVoice", [])
		f["m_bPlayDriverDeathVoice"] = false
	if R.truth(((R.truth(f.get("m_Dialog")) and ( not R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(f.get("m_DialogLine"), "IsPlaying", []))))):
		pass
		R.set_value(c, "m_iDialogIndex", 1, "+=")
		if (float(f.get("m_iDialogIndex")) >= float(R.binary("/", R.get_value(f.get("m_Dialog"), "length"), 2))):
			pass
			R.call_member(c, "DispatchEvent", [R.statics["RDPlayer"].get("Event_DialogFinished")])
			f["m_Dialog"] = null
		else:
			pass
			f["m_DialogLine"] = R.get_value(f.get("m_Dialog"), (float((float(f.get("m_iDialogIndex")) * float(2))) + float(1)))
			R.call_member(c, "PlayDialogVoiceSound", [R.get_value(f.get("m_Dialog"), (float(f.get("m_iDialogIndex")) * float(2))), f.get("m_DialogLine"), f.get("m_iDialogPriority")])
	return null


static func RDPlayer_UpdateCarState(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDAchievement")
	R.ensure_statics("RDGame")
	R.ensure_statics("RDPlayer")
	R.ensure_statics("RDPlayerInfo")
	var f: Dictionary = c.fields
	var v_iNewEngineState: int = 0
	var v_bHandBraking: bool = false
	var v_fSpeedRatio: float = NAN
	var v_fXMaxSpeed: float = NAN
	var v_fXAccel: Variant = null
	var v_fXDeccel: Variant = null
	var v_fRoadLimit: float = NAN
	var v_bIsSideScraping: bool = false
	var v_collisionSound: R.Value = null
	var v_fSpeedXRatio: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_iNewEngineState = R.coerce(0, "int")
	v_bHandBraking = false
	v_fSpeedRatio = float(NAN)
	v_fXMaxSpeed = float(NAN)
	v_fXAccel = null
	v_fXDeccel = null
	v_fRoadLimit = float(NAN)
	v_bIsSideScraping = false
	v_collisionSound = null
	v_fSpeedXRatio = float(NAN)
	if R.truth(((( not R.truth(f.get("m_bChopperMode"))) and ( not R.truth((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_bPaused")))) and (float(f.get("m_iEngineState")) != float(R.statics["RDPlayer"].get("EngineState_Exploded"))))):
		pass
		f["m_iOldEngineState"] = R.coerce(f.get("m_iEngineState"), "int")
		v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_Idle"), "int")
		if (R.truth(((f.get("m_bGoBackward") or f.get("m_bForceBrake")) and (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0)))) and R.truth(R.call_member(c, "CanBrake", []))):
			pass
			v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_DeccelBrake"), "int")
		else:
			pass
			if (((R.truth(f.get("m_bHandBraking")) and R.truth(R.call_member(c, "CanHandBrake", []))) and (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0))) and ( not R.truth(f.get("m_bFullSpeedMode")))):
				pass
				v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_DeccelHandBrake"), "int")
			else:
				pass
				if (R.truth((f.get("m_bGoForward") or f.get("m_bFullSpeedMode"))) and R.truth(R.call_member(c, "CanGoForward", []))):
					pass
					if (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) >= float((float(f.get("m_fMaxSpeed")) * float(f.get("m_fMaxSpeedFactor"))))):
						pass
						v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_MaxSpeed"), "int")
					else:
						pass
						v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_Accel"), "int")
				else:
					pass
					if (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0)):
						pass
						v_iNewEngineState = R.coerce(R.statics["RDPlayer"].get("EngineState_DeccelNoBrake"), "int")
		f["m_iEngineState"] = R.coerce(v_iNewEngineState, "int")
	if ( not R.truth(f.get("m_bChopperMode"))):
		pass
		if (float(f.get("m_iLeftHandState")) != float(R.statics["RDPlayer"].get("HandState_OnWheel"))):
			pass
			f["m_fWheelDirection"] = float(0)
		else:
			pass
			if (R.truth(f.get("m_bSteeringRight")) and R.truth(R.call_member(c, "CanSteer", []))):
				pass
				f["m_fWheelDirection"] = float(1)
			else:
				pass
				if (R.truth(f.get("m_bSteeringLeft")) and R.truth(R.call_member(c, "CanSteer", []))):
					pass
					f["m_fWheelDirection"] = R.num((-1))
				else:
					pass
					f["m_fWheelDirection"] = float(0)
		v_bHandBraking = (((R.truth(f.get("m_bHandBraking")) and R.truth(R.call_member(c, "CanHandBrake", []))) and (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0))) and ( not R.truth(f.get("m_bFullSpeedMode"))))
		v_fSpeedRatio = float(minf(float(R.binary("/", (f.get("m_vVelocity") as R.Value).fields.get("Z"), (float((float(f.get("m_fMaxSpeed")) * float(f.get("m_fMaxSpeedFactor")))) * float(0.75)))), float(1)))
		v_fSpeedRatio = float((float(1) - float(pow(float((float(1) - v_fSpeedRatio)), float(3)))))
		v_fXMaxSpeed = float((v_fSpeedRatio * R.num((f.get("m_fXMaxSpeedHandBrake") if v_bHandBraking else f.get("m_fXMaxSpeed")))))
		v_fXAccel = (f.get("m_fXAccelHandBrake") if v_bHandBraking else f.get("m_fXAccel"))
		v_fXDeccel = (f.get("m_fXDeccelHandBrake") if v_bHandBraking else f.get("m_fXDeccel"))
		if (float(f.get("m_fWheelDirection")) < float(0)):
			pass
			if R.truth(R.binary(">", f.get("m_fDesiredSpeedX"), R.unary("-", v_fXMaxSpeed))):
				pass
				f["m_fDesiredSpeedX"] = float(maxf(float((float(f.get("m_fDesiredSpeedX")) - float((R.num(v_fXAccel) * v_fDeltaTime)))), R.num(R.unary("-", v_fXMaxSpeed))))
			else:
				pass
				f["m_fDesiredSpeedX"] = float(minf(float((float(f.get("m_fDesiredSpeedX")) + float((R.num(v_fXDeccel) * v_fDeltaTime)))), R.num(R.unary("-", v_fXMaxSpeed))))
		else:
			pass
			if (float(f.get("m_fWheelDirection")) > float(0)):
				pass
				if (float(f.get("m_fDesiredSpeedX")) < v_fXMaxSpeed):
					pass
					f["m_fDesiredSpeedX"] = float(minf(float((float(f.get("m_fDesiredSpeedX")) + float((R.num(v_fXAccel) * v_fDeltaTime)))), v_fXMaxSpeed))
				else:
					pass
					f["m_fDesiredSpeedX"] = float(maxf(float((float(f.get("m_fDesiredSpeedX")) - float((R.num(v_fXDeccel) * v_fDeltaTime)))), v_fXMaxSpeed))
			else:
				pass
				if (float(f.get("m_fDesiredSpeedX")) > float(0)):
					pass
					f["m_fDesiredSpeedX"] = float(maxf(float((float(f.get("m_fDesiredSpeedX")) - float((R.num(v_fXDeccel) * v_fDeltaTime)))), float(0)))
				else:
					pass
					f["m_fDesiredSpeedX"] = float(minf(float((float(f.get("m_fDesiredSpeedX")) + float((R.num(v_fXDeccel) * v_fDeltaTime)))), float(0)))
		v_fRoadLimit = R.num(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "GetSideLimit", []))
		v_bIsSideScraping = ((R.truth(R.call_member((f.get("m_GameModeGameplay") as R.Value).fields.get("m_Road"), "CanSideScrape", [])) and (float((f.get("m_vVelocity") as R.Value).fields.get("Z")) > float(0))) and R.truth(((R.binary("==", f.get("m_fRelativeLocationX"), R.unary("-", v_fRoadLimit)) and (float((f.get("m_vVelocity") as R.Value).fields.get("X")) < float(0))) or ((float(f.get("m_fRelativeLocationX")) == v_fRoadLimit) and (float((f.get("m_vVelocity") as R.Value).fields.get("X")) > float(0))))))
		if R.truth(R.binary("!=", v_bIsSideScraping, f.get("m_bIsSideScraping"))):
			pass
			f["m_bIsSideScraping"] = v_bIsSideScraping
			if R.truth(f.get("m_bIsSideScraping")):
				pass
				f["m_bIsSideScrapingRight"] = (float(f.get("m_fRelativeLocationX")) == v_fRoadLimit)
				v_fSpeedXRatio = float(R.binary("/", absf(R.num((f.get("m_vVelocity") as R.Value).fields.get("X"))), f.get("m_fXMaxSpeedHandBrake")))
				if (v_fSpeedXRatio == float(1)):
					pass
					v_collisionSound = R.binary("as", R.call_member(f.get("m_HardCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))
					R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "AddShake", ["SideCollisionHard", 0.04, 0, 0, 0.5])
					if (float(randf()) > float(0.5)):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Cocheta"), R.statics["RDPlayer"].get("m_MaleHardCollisionGruntVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Diane"), R.statics["RDPlayer"].get("m_FemaleHardCollisionGruntVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
				else:
					pass
					if (v_fSpeedXRatio > float(0.5)):
						pass
						v_collisionSound = R.binary("as", R.call_member(f.get("m_MediumCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))
						R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "AddShake", ["SideCollisionMedium", 0.03, 0, 0, 0.5])
						if (float(randf()) > float(0.5)):
							pass
							R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Cocheta"), R.statics["RDPlayer"].get("m_MaleMediumCollisionGruntVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
						else:
							pass
							R.call_member(c, "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Diane"), R.statics["RDPlayer"].get("m_FemaleMediumCollisionGruntVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Generic")])
					else:
						pass
						v_collisionSound = R.binary("as", R.call_member(f.get("m_LightCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))
						R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "AddShake", ["SideCollisionLight", 0.02, 0, 0, 0.5])
				R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
				if R.truth((R.truth(f.get("m_ClingerLeft")) and (v_fSpeedXRatio > float(0.8)))):
					pass
					R.call_member(f.get("m_ClingerLeft"), "OnSideCollision", [(float(f.get("m_fRelativeLocationX")) == v_fRoadLimit)])
				if R.truth((R.truth(f.get("m_ClingerRight")) and (v_fSpeedXRatio > float(0.8)))):
					pass
					R.call_member(f.get("m_ClingerRight"), "OnSideCollision", [(float(f.get("m_fRelativeLocationX")) == v_fRoadLimit)])
				R.call_member(c, "PlaySoundOnActor", [f.get("m_SideScrapingSound"), true])
				R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "AddShake", ["SideScraping", 0.005, 0.25, (-1), 0])
				if R.truth(f.get("m_bIsSideScrapingRight")):
					pass
					R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "play"), [])
					R.set_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "stop"), [])
					R.set_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
				else:
					pass
					R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "play"), [])
					R.set_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "stop"), [])
					R.set_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
			else:
				pass
				R.call_member(c, "StopSoundOnActor", [f.get("m_SideScrapingSound")])
				R.call_member(((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera"), "StopShake", ["SideScraping", 0.25])
				R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "stop"), [])
				R.set_value(R.get_value(f.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
				R.invoke(R.get_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "stop"), [])
				R.set_value(R.get_value(f.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
		if R.truth(f.get("m_bIsSideScraping")):
			pass
			if R.truth((R.truth(f.get("m_ClingerSideLeft")) and ( not R.truth(f.get("m_bIsSideScrapingRight"))))):
				pass
				R.call_member(f.get("m_ClingerSideLeft"), "OnSideScraping", [])
				R.call_member(c, "AddSideGrindingBlood", [])
			if R.truth((R.truth(f.get("m_ClingerSideRight")) and f.get("m_bIsSideScrapingRight"))):
				pass
				R.call_member(f.get("m_ClingerSideRight"), "OnSideScraping", [])
				R.call_member(c, "AddSideGrindingBlood", [])
		if (float(f.get("m_fOilTime")) > float(0)):
			pass
			f["m_fOilTime"] = float(maxf(float((float(f.get("m_fOilTime")) - v_fDeltaTime)), float(0)))
			f["m_fOilFactor"] = float((float(1) - float(pow(float((float(1) - float(R.binary("/", f.get("m_fOilTime"), f.get("m_fOilDuration"))))), float(R.statics["RDPlayer"].get("OilFactorPower"))))))
			if R.truth(((f.get("m_bDoingSlipAndSlide") and (float(f.get("m_fOilTime")) == float(0))) and ( not R.truth(R.get_value((R.statics["RDPlayerInfo"].get("Instance") as R.Value).fields.get("m_completedAchievements"), R.statics["RDAchievement"].get("SlipAndSlide")))))):
				pass
				R.call_member(R.statics["RDGame"].get("Instance"), "CompleteAchievement", [R.statics["RDAchievement"].get("SlipAndSlide")])
				R.call_member(R.statics["RDGame"].get("Instance"), "SavePlayerInfo", [])
		if (float(f.get("m_iNbBlownTires")) > float(0)):
			pass
			f["m_fTireBiasTimer"] = R.num(R.binary("+", f.get("m_fTireBiasTimer"), v_fDeltaTime))
			if (float(f.get("m_fTireBiasTimer")) >= float(f.get("m_fTireBiasDuration"))):
				pass
				f["m_bTireBiasRight"] = ( not R.truth(f.get("m_bTireBiasRight")))
				f["m_fTireBiasTimer"] = float(0)
				f["m_fTireBiasDuration"] = float((float(f.get("m_fTireBiasDurationMin")) + float((float(randf()) * float(f.get("m_fTireBiasDurationRandom"))))))
				f["m_fTargetTireBiasStrength"] = float((float((float(f.get("m_fTireBiasStrengthMin")) + float((float(randf()) * float(f.get("m_fTireBiasStrengthRandom")))))) * R.num((1 if R.truth(f.get("m_bTireBiasRight")) else (-1)))))
	return null


static func RDPlayer_SetBlendedWeaponPos(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fTopBlendX: float = NAN
	var v_fTopBlendY: float = NAN
	var v_fTopBlendZ: float = NAN
	var v_fBottomBlendX: float = NAN
	var v_fBottomBlendY: float = NAN
	var v_fBottomBlendZ: float = NAN
	var v_topLeft: R.Value = (a[0] if a.size() > 0 else null)
	var v_topRight: R.Value = (a[1] if a.size() > 1 else null)
	var v_bottomLeft: R.Value = (a[2] if a.size() > 2 else null)
	var v_bottomRight: R.Value = (a[3] if a.size() > 3 else null)
	var v_fX: float = R.num((a[4] if a.size() > 4 else NAN))
	var v_fY: float = R.num((a[5] if a.size() > 5 else NAN))
	v_fTopBlendX = R.num(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("X"), (v_topRight).fields.get("X"), v_fX]))
	v_fTopBlendY = R.num(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("Y"), (v_topRight).fields.get("Y"), v_fX]))
	v_fTopBlendZ = R.num(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("Z"), (v_topRight).fields.get("Z"), v_fX]))
	v_fBottomBlendX = R.num(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("X"), (v_bottomRight).fields.get("X"), v_fX]))
	v_fBottomBlendY = R.num(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("Y"), (v_bottomRight).fields.get("Y"), v_fX]))
	v_fBottomBlendZ = R.num(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("Z"), (v_bottomRight).fields.get("Z"), v_fX]))
	(f.get("m_WeaponPos") as R.Value).fields["X"] = R.num(R.call_static("Maths", "Lerp", [v_fTopBlendX, v_fBottomBlendX, v_fY]))
	(f.get("m_WeaponPos") as R.Value).fields["Y"] = R.num(R.call_static("Maths", "Lerp", [v_fTopBlendY, v_fBottomBlendY, v_fY]))
	(f.get("m_WeaponPos") as R.Value).fields["Z"] = R.num(R.call_static("Maths", "Lerp", [v_fTopBlendZ, v_fBottomBlendZ, v_fY]))
	return null


static func RDPlayer_UpdateLocation(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDPlayer")
	var f: Dictionary = c.fields
	var v_entity: R.Value = null
	var v_i: int = 0
	var v_fDistance: float = NAN
	v_entity = null
	v_i = R.coerce(0, "int")
	v_fDistance = float(NAN)
	f["m_ClosestLocation"] = null
	f["m_fClosestLocationDistance"] = float(9999999)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((f.get("m_World") as R.Value).fields.get("m_SafeZones"), "length"))):
		pass
		v_entity = R.get_value((f.get("m_World") as R.Value).fields.get("m_SafeZones"), v_i)
		if R.truth((( not R.truth(R.call_member(v_entity, "IsLocationUsed", []))) and (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float((f.get("m_GameModeGameplay") as R.Value).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float((f.get("m_vLocation") as R.Value).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.statics["RDPlayer"].get("PickupPointDistance"))) and R.binary("<", absf(v_fDistance), f.get("m_fClosestLocationDistance")))):
				pass
				f["m_fClosestLocationDistance"] = R.num(absf(v_fDistance))
				f["m_ClosestLocation"] = v_entity
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((f.get("m_World") as R.Value).fields.get("m_Garages"), "length"))):
		pass
		v_entity = R.get_value((f.get("m_World") as R.Value).fields.get("m_Garages"), v_i)
		if R.truth((( not R.truth(R.call_member(v_entity, "IsLocationUsed", []))) and (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float((f.get("m_GameModeGameplay") as R.Value).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float((f.get("m_vLocation") as R.Value).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.statics["RDPlayer"].get("PickupPointDistance"))) and R.binary("<", absf(v_fDistance), f.get("m_fClosestLocationDistance")))):
				pass
				f["m_fClosestLocationDistance"] = R.num(absf(v_fDistance))
				f["m_ClosestLocation"] = v_entity
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((f.get("m_World") as R.Value).fields.get("m_WeaponCrates"), "length"))):
		pass
		v_entity = R.get_value((f.get("m_World") as R.Value).fields.get("m_WeaponCrates"), v_i)
		if R.truth((( not R.truth(R.call_member(v_entity, "IsLocationUsed", []))) and (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float((f.get("m_GameModeGameplay") as R.Value).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float((f.get("m_vLocation") as R.Value).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.statics["RDPlayer"].get("PickupPointDistance"))) and R.binary("<", absf(v_fDistance), f.get("m_fClosestLocationDistance")))):
				pass
				f["m_fClosestLocationDistance"] = R.num(absf(v_fDistance))
				f["m_ClosestLocation"] = v_entity
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((f.get("m_World") as R.Value).fields.get("m_AmmoPoints"), "length"))):
		pass
		v_entity = R.get_value((f.get("m_World") as R.Value).fields.get("m_AmmoPoints"), v_i)
		if R.truth((( not R.truth(R.call_member(v_entity, "IsLocationUsed", []))) and (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float((f.get("m_GameModeGameplay") as R.Value).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float((f.get("m_vLocation") as R.Value).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.statics["RDPlayer"].get("PickupPointDistance"))) and R.binary("<", absf(v_fDistance), f.get("m_fClosestLocationDistance")))):
				pass
				f["m_fClosestLocationDistance"] = R.num(absf(v_fDistance))
				f["m_ClosestLocation"] = v_entity
		v_i = R.signed32(v_i + 1)
	return null


static func RDHud_Update(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_rescueMode: R.Value = null
	var v_iNbMedShields: int = 0
	var v_iNbMedHeals: int = 0
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	R.call_member(c, "UpdateEyeBloods", [v_fDeltaTime])
	R.call_member(c, "UpdateHealthEffect", [v_fDeltaTime])
	R.call_member(c, "UpdateAiming", [])
	R.call_member(c, "UpdateOverheat", [])
	R.call_member(c, "UpdateLocation", [])
	R.call_member(c, "UpdateTask", [v_fDeltaTime])
	R.call_member(c, "UpdateRP", [true, false])
	R.call_member(c, "UpdateOptionsMenu", [])
	R.call_member(c, "UpdateTaskPrompt", [])
	R.call_member(c, "UpdateTiresDisplay", [])
	R.call_member(c, "UpdateLevelUps", [v_fDeltaTime])
	v_rescueMode = R.binary("as", (f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue"))
	v_iNbMedShields = R.coerce((R.call_member(f.get("m_Player"), "GetNbMedShields", []) if R.truth(f.get("m_Player")) else 0), "int")
	v_iNbMedHeals = R.coerce((R.call_member(f.get("m_Player"), "GetNbMedHeals", []) if R.truth(f.get("m_Player")) else 0), "int")
	R.set_value(R.get_value(f.get("m_HudMC"), "CallChopperSupport"), "visible", R.logical_and(R.logical_and((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), func(): return R.call_member((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return R.call_member((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), "CanCallChopperSupport", [])), "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedShield"), "visible", R.logical_and(R.logical_and(R.logical_and((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), func(): return R.call_member((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return ( not R.truth(v_rescueMode))), func(): return (float(v_iNbMedShields) > float(0))), "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedShieldCount"), "visible", R.get_value(R.get_value(f.get("m_HudMC"), "MedShield"), "visible"), "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedShieldCount"), "text", v_iNbMedShields, "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedHeal"), "visible", R.logical_and(R.logical_and(R.logical_and((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), func(): return R.call_member((f.get("m_Game") as R.Value).fields.get("m_CurrentGameMode"), "CanShowHud", [])), func(): return ( not R.truth(v_rescueMode))), func(): return (float(v_iNbMedHeals) > float(0))), "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedHealCount"), "visible", R.get_value(R.get_value(f.get("m_HudMC"), "MedHeal"), "visible"), "=")
	R.set_value(R.get_value(f.get("m_HudMC"), "MedHealCount"), "text", v_iNbMedHeals, "=")
	if (float(f.get("m_fComboDisplayTimer")) > float(0)):
		pass
		f["m_fComboDisplayTimer"] = R.num(R.binary("-", f.get("m_fComboDisplayTimer"), v_fDeltaTime))
		if (float(f.get("m_fComboDisplayTimer")) <= float(0)):
			pass
			R.set_value(R.get_value(f.get("m_HudMC"), "ComboDisplay"), "visible", false, "=")
			R.set_value(R.get_value(R.get_value(f.get("m_HudMC"), "ComboDisplay"), "ComboDisplay"), "text", "", "=")
	if R.truth(R.get_value(R.get_value(f.get("m_HudMC"), "PointsScreen"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value(f.get("m_HudMC"), "PointsScreen"), "Container"), "y", (float(60) * v_fDeltaTime), "-=")
		if R.truth(R.binary("<", R.get_value(R.get_value(R.get_value(f.get("m_HudMC"), "PointsScreen"), "Container"), "y"), (R.num(R.unary("-", R.get_value(R.get_value(R.get_value(f.get("m_HudMC"), "PointsScreen"), "Container"), "height"))) - float(20)))):
			pass
			R.set_value(R.get_value(R.get_value(f.get("m_HudMC"), "PointsScreen"), "Container"), "y", ((f.get("m_Game") as R.Value).fields.get("m_Viewport") as R.Value).fields.get("m_iHeight"), "=")
	return null


static func source_RDHud_UpdateAiming(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDHud")
	R.ensure_statics("RDWeapon")
	var f: Dictionary = c.fields
	var v_fScale: float = NAN
	var v_fFullscreenScale: float = NAN
	v_fScale = float(NAN)
	v_fFullscreenScale = float(NAN)
	if R.truth(((((R.truth(f.get("m_Player")) and ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bFailed")))) and ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bInEnding")))) and R.truth((f.get("m_Player") as R.Value).fields.get("m_Weapon"))) and R.binary("<=", R.get_value((f.get("m_Game") as R.Value).fields.get("m_RootMC"), "mouseY"), R.statics["RDHud"].get("OptionsMenuPosY")))):
		pass
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "visible", ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bGunDown"))), "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "visible", ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bGunDown"))), "=")
		v_fScale = float(1)
		if R.truth(R.binary("!=", R.get_value(R.get_value((f.get("m_Game") as R.Value).fields.get("m_RootMC"), "stage"), "displayState"), R.get_value(R.resolve(c, "StageDisplayState", "RDHud"), "NORMAL"))):
			pass
			v_fFullscreenScale = float(R.binary("/", 400, R.get_value(R.get_value((f.get("m_Game") as R.Value).fields.get("m_RootMC"), "stage"), "fullScreenHeight")))
			v_fScale = float(R.binary("/", (float((v_fScale + v_fFullscreenScale)) + v_fFullscreenScale), 3))
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "scaleX", v_fScale, "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "scaleY", v_fScale, "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "scaleX", v_fScale, "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "scaleY", v_fScale, "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "x", (f.get("m_Player") as R.Value).fields.get("m_fTargetAimingX"), "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "y", (f.get("m_Player") as R.Value).fields.get("m_fTargetAimingY"), "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "x", (f.get("m_Player") as R.Value).fields.get("m_fAimingX"), "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "y", (f.get("m_Player") as R.Value).fields.get("m_fAimingY"), "=")
		if R.truth(((f.get("m_Player") as R.Value).fields.get("m_Weapon") as R.Value).fields.get("m_bMountedWeapon")):
			pass
			R.invoke(R.get_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [(float(1002) + float(R.binary("/", (float(1000) * R.num(R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "GetBulletSpread", []))), R.statics["RDWeapon"].get("MaxBulletSpread"))))])])
		else:
			pass
			R.invoke(R.get_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [(float(1) + float(R.binary("/", (float(1000) * R.num(R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "GetBulletSpread", []))), R.statics["RDWeapon"].get("MaxBulletSpread"))))])])
	else:
		pass
		R.set_value(R.get_value(f.get("m_HudMC"), "TargetCrosshair"), "visible", false, "=")
		R.set_value(R.get_value(f.get("m_HudMC"), "ActualCrosshair"), "visible", false, "=")
	return null


static func RDCamera_Update(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDCamera")
	R.ensure_statics("RDPlayer")
	var f: Dictionary = c.fields
	var v_fTargetRotation: float = NAN
	var v_fTargetSideScrapingOffset: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fTargetRotation = float(NAN)
	v_fTargetSideScrapingOffset = float(NAN)
	if (float((f.get("m_Player") as R.Value).fields.get("m_iFailType")) == float(R.statics["RDPlayer"].get("FailType_Explosion"))):
		pass
		f["m_fPlayerFailOffset"] = R.num(R.binary("+", f.get("m_fPlayerFailOffset"), (float(f.get("m_fPlayerFailBackSpeed")) * v_fDeltaTime)))
		f["m_fPlayerFailBackSpeed"] = float(maxf(float((float(f.get("m_fPlayerFailBackSpeed")) - float((float(R.statics["RDCamera"].get("PlayerFailBackSpeedDeccel")) * v_fDeltaTime)))), float(0)))
		(f.get("m_vLocation") as R.Value).fields["X"] = float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("X"))
		(f.get("m_vLocation") as R.Value).fields["Y"] = float((float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Y")) + float(1.6)))
		(f.get("m_vLocation") as R.Value).fields["Z"] = float((float((float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float(1))) - float(f.get("m_fPlayerFailOffset"))))
	else:
		pass
		if R.truth(((v_fDeltaTime > float(0)) and ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bInEnding"))))):
			pass
			f["m_fPlayerFailBackSpeed"] = float(R.statics["RDCamera"].get("PlayerFailBackSpeed"))
			(f.get("m_vLocation") as R.Value).fields["X"] = float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("X"))
			(f.get("m_vLocation") as R.Value).fields["Y"] = float((float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Y")) + float(f.get("m_fTargetOffsetY"))))
			(f.get("m_vLocation") as R.Value).fields["Z"] = float((float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float(1)))
			(f.get("m_vRotation") as R.Value).fields["Y"] = float((f.get("m_vRotationPreCurve") as R.Value).fields.get("Y"))
			v_fTargetRotation = float((float(R.binary("/", (f.get("m_Player") as R.Value).fields.get("m_fDesiredSpeedX"), (f.get("m_Player") as R.Value).fields.get("m_fXMaxSpeedHandBrake"))) * float(R.statics["RDCamera"].get("MaxSteerRotationAngle"))))
			(f.get("m_vRotation") as R.Value).fields["Y"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [(f.get("m_vRotation") as R.Value).fields.get("Y"), v_fTargetRotation, v_fDeltaTime, R.statics["RDCamera"].get("MaxSteerRotationAngleSpeed")]))
			(f.get("m_vRotation") as R.Value).fields["Y"] = R.num(R.binary("+", (f.get("m_vRotation") as R.Value).fields.get("Y"), (float((f.get("m_Player") as R.Value).fields.get("m_fAimingRatioX")) * R.num((R.statics["RDCamera"].get("MaxAimingRotationAngleChopper") if R.truth((f.get("m_Player") as R.Value).fields.get("m_bChopperMode")) else R.statics["RDCamera"].get("MaxAimingRotationAngle"))))))
			(f.get("m_vRotationPreCurve") as R.Value).fields["Y"] = float((f.get("m_vRotation") as R.Value).fields.get("Y"))
			R.invoke(R.get_value(f.get("m_RotationMatrixPreCurve"), "identity"), [])
			R.invoke(R.get_value(f.get("m_RotationMatrixPreCurve"), "appendRotation"), [R.unary("-", (f.get("m_vRotation") as R.Value).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
			f["m_fCurveRotation"] = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [(float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(10))])) - R.num(R.call_static("RDWorld", "GetPerlinX", [((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")])))) * float(R.statics["RDCamera"].get("CurveAngle"))))
			(f.get("m_vRotation") as R.Value).fields["Y"] = R.num(R.binary("+", (f.get("m_vRotation") as R.Value).fields.get("Y"), f.get("m_fCurveRotation")))
			R.invoke(R.get_value(f.get("m_RotationMatrix"), "identity"), [])
			R.invoke(R.get_value(f.get("m_RotationMatrix"), "appendRotation"), [R.unary("-", (f.get("m_vRotation") as R.Value).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
			v_fTargetSideScrapingOffset = float(0)
			if R.truth((f.get("m_Player") as R.Value).fields.get("m_bIsSideScraping")):
				pass
				v_fTargetSideScrapingOffset = R.num((R.statics["RDCamera"].get("SideScrapingRightOffsetX") if R.truth((f.get("m_Player") as R.Value).fields.get("m_bIsSideScrapingRight")) else R.statics["RDCamera"].get("SideScrapingLeftOffsetX")))
			f["m_fSideScrapingOffset"] = R.num(R.call_static("Maths", "DeltaInterpolateTo", [f.get("m_fSideScrapingOffset"), v_fTargetSideScrapingOffset, v_fDeltaTime, R.statics["RDCamera"].get("SideScrappingInterpSpeed")]))
			(f.get("m_vLocation") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_vLocation") as R.Value).fields.get("X"), f.get("m_fSideScrapingOffset")))
			(f.get("m_vLocation") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_vLocation") as R.Value).fields.get("X"), (float((f.get("m_Player") as R.Value).fields.get("m_fAimingRatioX")) * float(f.get("m_fAimingOffsetX")))))
			(f.get("m_vLocation") as R.Value).fields["Y"] = R.num(R.binary("+", (f.get("m_vLocation") as R.Value).fields.get("Y"), (float((f.get("m_Player") as R.Value).fields.get("m_fAimingRatioY")) * R.num(R.unary("-", f.get("m_fAimingOffsetY"))))))
	R.call_member(c, "UpdateShake", [v_fDeltaTime])
	f["m_fRelativeLocationX"] = float((float((f.get("m_vLocation") as R.Value).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(f.get("m_vLocation") as R.Value).fields.get("Z")]))))
	return null


static func RDCamera_UpdateShake(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_shake: R.Value = null
	var v_fShakeIntensity: float = NAN
	var v_fMaxCameraShakeIntensity: float = NAN
	var v_i: Variant = null
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_shake = null
	v_fShakeIntensity = float(NAN)
	v_fMaxCameraShakeIntensity = float(0)
	v_i = 0
	while R.truth(R.binary("<", v_i, (f.get("m_Shakes")).size())):
		pass
		v_shake = R.binary("as", R.native_array_item(f.get("m_Shakes"), int(v_i)), R.klass("RDCameraShake"))
		v_fShakeIntensity = float(0)
		if R.truth(R.binary("==", (v_shake).fields.get("m_fShakeDuration"), (-1))):
			pass
			v_fShakeIntensity = float((v_shake).fields.get("m_fShakeIntensity"))
		else:
			pass
			if (float((v_shake).fields.get("m_fShakeTimer")) < float((float((float((v_shake).fields.get("m_fShakeFadeInDuration")) + float((v_shake).fields.get("m_fShakeDuration")))) + float((v_shake).fields.get("m_fShakeFadeOutDuration"))))):
				pass
				if (float((v_shake).fields.get("m_fShakeTimer")) < float((v_shake).fields.get("m_fShakeFadeInDuration"))):
					pass
					v_fShakeIntensity = float((float(R.binary("/", (v_shake).fields.get("m_fShakeTimer"), (v_shake).fields.get("m_fShakeFadeInDuration"))) * float((v_shake).fields.get("m_fShakeIntensity"))))
				else:
					pass
					if (float((v_shake).fields.get("m_fShakeTimer")) > float((float((v_shake).fields.get("m_fShakeFadeInDuration")) + float((v_shake).fields.get("m_fShakeDuration"))))):
						pass
						v_fShakeIntensity = float((float((float(1) - float(R.binary("/", (float((float((v_shake).fields.get("m_fShakeTimer")) - float((v_shake).fields.get("m_fShakeDuration")))) - float((v_shake).fields.get("m_fShakeFadeInDuration"))), (v_shake).fields.get("m_fShakeFadeOutDuration"))))) * float((v_shake).fields.get("m_fShakeIntensity"))))
					else:
						pass
						v_fShakeIntensity = float((v_shake).fields.get("m_fShakeIntensity"))
				(v_shake).fields["m_fShakeTimer"] = R.num(R.binary("+", (v_shake).fields.get("m_fShakeTimer"), v_fDeltaTime))
			else:
				pass
				R.call_member(c, "ReturnShake", [v_shake])
				R.invoke(R.get_value(f.get("m_Shakes"), "splice"), [v_i, 1])
				v_i = R.num(v_i) - 1
		if (v_fShakeIntensity > v_fMaxCameraShakeIntensity):
			pass
			v_fMaxCameraShakeIntensity = v_fShakeIntensity
		v_i = R.num(v_i) + 1
	if (v_fMaxCameraShakeIntensity > float(0)):
		pass
		(f.get("m_vLocation") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_vLocation") as R.Value).fields.get("X"), (float((float((float(randf()) * float(2))) - float(1))) * v_fMaxCameraShakeIntensity)))
		(f.get("m_vLocation") as R.Value).fields["Y"] = R.num(R.binary("+", (f.get("m_vLocation") as R.Value).fields.get("Y"), (float((float((float(randf()) * float(2))) - float(1))) * v_fMaxCameraShakeIntensity)))
	return null


static func RDEntity_UpdateAttachedSounds(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGame")
	var f: Dictionary = c.fields
	var v_i: Variant = null
	var v_sound: R.Value = null
	var v_vListenerLocation: R.Value = null
	var v_fPosX: float = NAN
	var v_fListenerPosX: float = NAN
	var v_fDistance: float = NAN
	var v_iSoundDirection: int = 0
	var v_fSideDistance: float = NAN
	var v_theSound: R.Value = null
	var v_fVolume: float = NAN
	var v_fPan: float = NAN
	var v_iNbSounds: Variant = null
	v_i = 0
	v_sound = null
	v_vListenerLocation = null
	v_fPosX = float(NAN)
	v_fListenerPosX = float(NAN)
	v_fDistance = float(NAN)
	v_iSoundDirection = R.coerce(0, "int")
	v_fSideDistance = float(NAN)
	v_theSound = null
	v_fVolume = float(NAN)
	v_fPan = float(NAN)
	v_iNbSounds = R.coerce((f.get("m_AttachedSounds")).size(), "int")
	if R.truth(R.binary("==", v_iNbSounds, 0)):
		pass
		return null
	v_i = 0
	while R.truth(R.binary("<", v_i, v_iNbSounds)):
		pass
		v_sound = R.binary("as", R.native_array_item(f.get("m_AttachedSounds"), int(v_i)), R.klass("DTSpacialSound"))
		if ( not R.truth((v_sound).fields.get("m_SoundChannel"))):
			pass
			R.invoke(R.get_value(f.get("m_AttachedSounds"), "splice"), [v_i, 1])
			(v_sound).fields["m_bAttached"] = false
			v_i = R.num(v_i) - 1
			v_iNbSounds = R.num(v_iNbSounds) - 1
		v_i = R.num(v_i) + 1
	if R.truth(R.binary(">", v_iNbSounds, 0)):
		pass
		v_vListenerLocation = (((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_CurrentGameMode") as R.Value).fields.get("m_Camera") as R.Value).fields.get("m_vLocation")
		v_fPosX = float((float((f.get("m_vLocation") as R.Value).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(f.get("m_vLocation") as R.Value).fields.get("Z")]))))
		v_fListenerPosX = float((float((v_vListenerLocation).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(v_vListenerLocation).fields.get("Z")]))))
		v_fDistance = float((float((f.get("m_vLocation") as R.Value).fields.get("Z")) - float((v_vListenerLocation).fields.get("Z"))))
		if (v_fDistance < float(0)):
			pass
			v_fDistance = float((R.num(R.unary("-", v_fDistance)) * float(f.get("m_fBackSoundDistanceMultiplier"))))
		v_iSoundDirection = R.coerce((1 if (v_fPosX >= v_fListenerPosX) else (-1)), "int")
		v_fSideDistance = R.num(absf(R.num((v_fPosX - v_fListenerPosX))))
		v_i = 0
		while R.truth(R.binary("<", v_i, v_iNbSounds)):
			pass
			v_theSound = R.binary("as", R.native_array_item(f.get("m_AttachedSounds"), int(v_i)), R.klass("DTSpacialSound"))
			v_fPan = float((v_theSound).fields.get("m_fPan"))
			if (v_fDistance < float((v_theSound).fields.get("m_fVolumeFallOffDistance"))):
				pass
				v_fVolume = float((v_theSound).fields.get("m_fMaxVolume"))
			else:
				pass
				if (v_fDistance > float((v_theSound).fields.get("m_fVolumeMaxDistance"))):
					pass
					v_fVolume = float(0)
				else:
					pass
					v_fVolume = float((float((v_theSound).fields.get("m_fMaxVolume")) - float((float((v_theSound).fields.get("m_fMaxVolume")) * float(R.binary("/", (v_fDistance - float((v_theSound).fields.get("m_fVolumeFallOffDistance"))), (float((v_theSound).fields.get("m_fVolumeMaxDistance")) - float((v_theSound).fields.get("m_fVolumeFallOffDistance")))))))))
			if ( not R.truth((v_theSound).fields.get("m_bManualPan"))):
				pass
				if (v_fSideDistance < float((v_theSound).fields.get("m_fPanFallOffDistance"))):
					pass
					v_fPan = float(0)
				else:
					pass
					if (v_fSideDistance > float((v_theSound).fields.get("m_fPanMaxDistance"))):
						pass
						v_fPan = float(v_iSoundDirection)
					else:
						pass
						v_fPan = float(R.binary("/", (float(v_iSoundDirection) * float((v_fSideDistance - float((v_theSound).fields.get("m_fPanFallOffDistance"))))), (float((v_theSound).fields.get("m_fPanMaxDistance")) - float((v_theSound).fields.get("m_fPanFallOffDistance")))))
			R.call_member(v_theSound, "SetVolumeAndPan", [v_fVolume, v_fPan])
			v_i = R.num(v_i) + 1
	return null


static func SoundSystem_Update(c: Variant, a: Array) -> Variant:
	R.ensure_statics("SoundSystem")
	var v_s: int = 0
	var v_mixing: R.Value = null
	var v_soundGroup: R.Value = null
	var v_currentSound: R.Value = null
	var v_fOldVolume: float = NAN
	var v_fNewVolume: float = NAN
	var v_iNbSoundGroups: int = 0
	var v_g: int = 0
	var v_iNbSounds: Variant = null
	var v_i: Variant = null
	var v_iNbMix: int = 0
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_s = R.coerce(0, "int")
	v_mixing = null
	v_soundGroup = null
	v_currentSound = null
	v_fOldVolume = float(NAN)
	v_fNewVolume = float(NAN)
	v_iNbSoundGroups = R.coerce(R.coerce(R.get_value(R.statics["SoundSystem"].get("m_SoundGroups"), "length"), "int"), "int")
	v_g = R.coerce(0, "int")
	while (float(v_g) < float(v_iNbSoundGroups)):
		pass
		v_soundGroup = R.binary("as", R.native_array_item(R.statics["SoundSystem"].get("m_SoundGroups"), int(v_g)), R.klass("DTSoundGroup"))
		R.call_member(v_soundGroup, "Update", [v_fDeltaTime])
		(v_soundGroup).fields["m_bMixingActive"] = false
		(v_soundGroup).fields["m_fTargetMixVolume"] = float(1)
		v_g = R.signed32(v_g + 1)
	v_iNbSounds = R.coerce(R.get_value(R.statics["SoundSystem"].get("m_ActiveSounds"), "length"), "int")
	v_i = 0
	while R.truth(R.binary("<", v_i, v_iNbSounds)):
		pass
		v_currentSound = R.binary("as", R.native_array_item(R.statics["SoundSystem"].get("m_ActiveSounds"), int(v_i)), R.klass("DTSound"))
		if R.truth(v_currentSound):
			pass
			R.call_member(v_currentSound, "Update", [v_fDeltaTime])
			if R.truth(R.binary("!=", (v_currentSound).fields.get("m_SoundChannel"), null)):
				pass
				if R.truth((R.truth((v_currentSound).fields.get("m_SoundGroup")) and (float(((v_currentSound).fields.get("m_SoundGroup") as R.Value).fields.get("m_fMaxVolume")) > float(0)))):
					pass
					((v_currentSound).fields.get("m_SoundGroup") as R.Value).fields["m_bMixingActive"] = true
			else:
				pass
				R.invoke(R.get_value(R.statics["SoundSystem"].get("m_ActiveSounds"), "splice"), [v_i, 1])
				v_i = R.num(v_i) - 1
				v_iNbSounds = R.num(v_iNbSounds) - 1
		v_i = R.num(v_i) + 1
	v_iNbMix = R.coerce(R.coerce(R.get_value(R.statics["SoundSystem"].get("m_SoundGroupMixings"), "length"), "int"), "int")
	v_s = R.coerce(0, "int")
	while (float(v_s) < float(v_iNbMix)):
		pass
		v_mixing = R.binary("as", R.native_array_item(R.statics["SoundSystem"].get("m_SoundGroupMixings"), int(v_s)), R.klass("DTSoundGroupMix"))
		if R.truth(((v_mixing).fields.get("m_SoundGroupB") as R.Value).fields.get("m_bMixingActive")):
			pass
			((v_mixing).fields.get("m_SoundGroupA") as R.Value).fields["m_fTargetMixVolume"] = float((v_mixing).fields.get("m_fVolume"))
		v_s = R.signed32(v_s + 1)
	v_s = R.coerce(0, "int")
	while (float(v_s) < float(v_iNbMix)):
		pass
		v_mixing = R.binary("as", R.native_array_item(R.statics["SoundSystem"].get("m_SoundGroupMixings"), int(v_s)), R.klass("DTSoundGroupMix"))
		v_fOldVolume = float(((v_mixing).fields.get("m_SoundGroupA") as R.Value).fields.get("m_fMixVolume"))
		v_fNewVolume = R.num(R.call_static("Maths", "InterpolateNumber", [((v_mixing).fields.get("m_SoundGroupA") as R.Value).fields.get("m_fMixVolume"), ((v_mixing).fields.get("m_SoundGroupA") as R.Value).fields.get("m_fTargetMixVolume"), 2, v_fDeltaTime]))
		((v_mixing).fields.get("m_SoundGroupA") as R.Value).fields["m_fMixVolume"] = v_fNewVolume
		if (v_fNewVolume != v_fOldVolume):
			pass
			R.invoke(R.resolve(c, "OnSoundGroupModified", "SoundSystem"), [(v_mixing).fields.get("m_SoundGroupA")])
		v_s = R.signed32(v_s + 1)
	return null


static func DTSound_Update(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fFadeRatio: float = NAN
	var v_fVolume: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fFadeRatio = float(NAN)
	v_fVolume = float(NAN)
	if R.truth(f.get("m_PitchSound")):
		pass
		f["m_fPitchSoundPosition"] = float(minf(float((float(f.get("m_fPitchSoundPosition")) + v_fDeltaTime)), float(R.binary("/", R.get_value(f.get("m_PitchSound"), "length"), 1000))))
		if R.truth(f.get("m_bPitchSoundDone")):
			pass
			R.call_member(c, "Stop", [])
	if R.truth(f.get("m_bFading")):
		pass
		f["m_fFadeTimer"] = float(minf(float((float(f.get("m_fFadeTimer")) + v_fDeltaTime)), float(f.get("m_fFadeDuration"))))
		v_fFadeRatio = float(R.binary("/", f.get("m_fFadeTimer"), f.get("m_fFadeDuration")))
		v_fVolume = float((float((float((float(1) - v_fFadeRatio)) * float(f.get("m_fFadeVolumeStart")))) + float((v_fFadeRatio * float(f.get("m_fFadeVolumeEnd"))))))
		R.call_member(c, "SetVolume", [v_fVolume])
		if (v_fFadeRatio == float(1)):
			pass
			f["m_bFading"] = false
			if R.truth((( not R.truth(f.get("m_bMuted"))) and (float(f.get("m_fFadeVolumeEnd")) == float(0)))):
				pass
				R.call_member(c, "Stop", [])
	return null


static func DTSound_UpdateVolume(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	if R.truth(f.get("m_SoundChannel")):
		pass
		R.set_value(f.get("m_SoundTransform"), "volume", R.call_member(c, "GetVolume", []), "=")
		R.set_value(f.get("m_SoundTransform"), "pan", R.call_member(c, "GetPan", []), "=")
		R.set_value(f.get("m_SoundChannel"), "soundTransform", f.get("m_SoundTransform"), "=")
	return null


static func DTSound_GetVolume(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	if R.truth(f.get("m_SoundGroup")):
		pass
		return (float((float(f.get("m_fVolume")) * float(f.get("m_fMaxVolume")))) * R.num(R.call_member(f.get("m_SoundGroup"), "GetVolume", [])))
	return (float(f.get("m_fVolume")) * float(f.get("m_fMaxVolume")))
	return null


static func DTSound_GetPan(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	if R.truth(f.get("m_SoundGroup")):
		pass
		return maxf(R.num((-1)), float(minf(R.num(R.binary("+", f.get("m_fPan"), R.call_member(f.get("m_SoundGroup"), "GetPan", []))), float(1))))
	return f.get("m_fPan")
	return null


static func DTSound_SetVolume(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fOldVolume: float = NAN
	var v_fNewVolume: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fOldVolume = float(f.get("m_fVolume"))
	f["m_fVolume"] = v_fNewVolume
	if (float(f.get("m_fVolume")) != v_fOldVolume):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null


static func DTSound_SetPan(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fOldPan: float = NAN
	var v_fNewPan: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fOldPan = float(f.get("m_fPan"))
	f["m_fPan"] = v_fNewPan
	if (float(f.get("m_fPan")) != v_fOldPan):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null


static func DTSoundGroup_Update(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_fFadeRatio: float = NAN
	var v_fVolume: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_fFadeRatio = float(NAN)
	v_fVolume = float(NAN)
	if R.truth(f.get("m_bFading")):
		pass
		f["m_fFadeTimer"] = float(minf(float((float(f.get("m_fFadeTimer")) + v_fDeltaTime)), float(f.get("m_fFadeDuration"))))
		v_fFadeRatio = float(R.binary("/", f.get("m_fFadeTimer"), f.get("m_fFadeDuration")))
		v_fVolume = float((float((float((float(1) - v_fFadeRatio)) * float(f.get("m_fFadeVolumeStart")))) + float((v_fFadeRatio * float(f.get("m_fFadeVolumeEnd"))))))
		R.call_member(c, "SetVolume", [v_fVolume])
		if (v_fFadeRatio == float(1)):
			pass
			f["m_bFading"] = false
	return null


static func DTSoundGroup_GetVolume(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	if R.truth(f.get("m_SoundGroup")):
		pass
		return (float((float((float(f.get("m_fVolume")) * float(f.get("m_fMaxVolume")))) * float(f.get("m_fMixVolume")))) * R.num(R.call_member(f.get("m_SoundGroup"), "GetVolume", [])))
	return (float((float(f.get("m_fVolume")) * float(f.get("m_fMaxVolume")))) * float(f.get("m_fMixVolume")))
	return null


static func DTSoundGroup_GetPan(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	if R.truth(f.get("m_SoundGroup")):
		pass
		return maxf(R.num((-1)), float(minf(R.num(R.binary("+", f.get("m_fPan"), R.call_member(f.get("m_SoundGroup"), "GetPan", []))), float(1))))
	return f.get("m_fPan")
	return null


static func RDParallaxBackground_Project3DTo2D(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("BasicGame")
	var f: Dictionary = c.fields
	var v_viewport: R.Value = null
	var v_fInvZ: float = NAN
	var v_vLocation: R.Value = (a[0] if a.size() > 0 else null)
	var v_camera: R.Value = (a[1] if a.size() > 1 else null)
	v_viewport = null
	v_viewport = (R.statics["BasicGame"].get("Instance") as R.Value).fields.get("m_Viewport")
	R.set_value(f.get("m_vTransformedLocation"), "x", (float((v_vLocation).fields.get("X")) - float(((v_camera).fields.get("m_vLocation") as R.Value).fields.get("X"))), "=")
	R.set_value(f.get("m_vTransformedLocation"), "y", (float((v_vLocation).fields.get("Y")) - float(((v_camera).fields.get("m_vLocation") as R.Value).fields.get("Y"))), "=")
	R.set_value(f.get("m_vTransformedLocation"), "z", f.get("m_fDistance"), "=")
	f["m_vTransformedLocation"] = R.invoke(R.get_value((v_camera).fields.get("m_RotationMatrix"), "transformVector"), [f.get("m_vTransformedLocation")])
	v_fInvZ = float(R.binary("/", 1, R.get_value(f.get("m_vTransformedLocation"), "z")))
	(f.get("m_vProjLocation") as R.Value).fields["X"] = float((float((float((R.num(R.get_value(f.get("m_vTransformedLocation"), "x")) * float((v_camera).fields.get("m_fRenderDistX")))) * v_fInvZ)) + float((v_viewport).fields.get("m_iHalfWidth"))))
	(f.get("m_vProjLocation") as R.Value).fields["Y"] = float((float((float((R.num(R.unary("-", R.get_value(f.get("m_vTransformedLocation"), "y"))) * float((v_camera).fields.get("m_fRenderDistY")))) * v_fInvZ)) + float((v_viewport).fields.get("m_iHalfHeight"))))
	return f.get("m_vProjLocation")
	return null


static func RDParallaxBackground_Render(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDCamera")
	var f: Dictionary = c.fields
	var v_fAlpha: float = NAN
	var v_vProjectedLoc: R.Value = null
	var v_camera: R.Value = (a[0] if a.size() > 0 else null)
	v_fAlpha = float(NAN)
	v_vProjectedLoc = R.call_member(c, "Project3DTo2D", [f.get("m_vLocation"), v_camera])
	R.set_value(f.get("m_MC"), "x", (v_vProjectedLoc).fields.get("X"), "=")
	R.set_value(f.get("m_MC"), "y", (v_vProjectedLoc).fields.get("Y"), "=")
	R.set_value(f.get("m_MC"), "y", (float(((v_camera).fields.get("m_vLocation") as R.Value).fields.get("Z")) * float(f.get("m_fDropRate"))), "+=")
	if R.truth(f.get("m_bUseFog")):
		pass
		if R.truth(f.get("m_bHidden")):
			pass
			R.set_value(f.get("m_MC"), "alpha", 0, "=")
		else:
			pass
			v_fAlpha = R.num(clampf(R.num(R.binary("/", (float((v_camera).fields.get("m_fFogDistance")) - float(R.statics["RDCamera"].get("FogDistance"))), (float((v_camera).fields.get("m_fMaxViewDistance")) - float(R.statics["RDCamera"].get("FogDistance"))))), R.num(0), R.num(1)))
			R.set_value(f.get("m_MC"), "alpha", (float((v_fAlpha * v_fAlpha)) * v_fAlpha), "=")
	return null


static func RDGameModeGameplay_Update(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_bHideMouse: bool = false
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeGameplay"), "Update"), [v_fDeltaTime])
	R.call_member(c, "UpdateGameplay", [v_fDeltaTime])
	R.call_member(c, "UpdateFog", [v_fDeltaTime])
	R.call_member((f.get("m_Game") as R.Value).fields.get("m_World"), "Update", [v_fDeltaTime, f.get("m_Camera")])
	R.call_member(f.get("m_Camera"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateBGBuildingDepthPos", [])
	R.call_member((f.get("m_Game") as R.Value).fields.get("m_World"), "Render", [f.get("m_Camera")])
	R.call_member(c, "UpdateTutorials", [v_fDeltaTime])
	v_bHideMouse = R.truth(R.call_member(c, "ShouldHideMouse", []))
	if R.truth(R.binary("!=", v_bHideMouse, f.get("m_bHideMouse"))):
		pass
		f["m_bHideMouse"] = v_bHideMouse
		if R.truth(f.get("m_bHideMouse")):
			pass
			R.invoke(R.get_value(R.resolve(c, "Mouse", "RDGameModeGameplay"), "hide"), [])
		else:
			pass
			R.invoke(R.get_value(R.resolve(c, "Mouse", "RDGameModeGameplay"), "show"), [])
	f["m_bDidFirstUpdate"] = true
	return null


static func RDGameModeStory_UpdateGameplay(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDAchievement")
	R.ensure_statics("RDGame")
	R.ensure_statics("RDGameModeGameplay")
	R.ensure_statics("RDGameModeStory")
	R.ensure_statics("RDPlayer")
	R.ensure_statics("RDPlayerInfo")
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_szLevelName: Variant = null
	var v_levelPatterns: R.Value = null
	var v_levelPattern: R.Value = null
	var v_fSpawnLevelLength: float = NAN
	var v_fNextSpawnLevelStartPosition: float = NAN
	var v_fPatternSpace: float = NAN
	var v_waterJug: R.Value = null
	var v_fPosZ: float = NAN
	var v_storyDialog: Variant = null
	var v_fStretch: float = NAN
	var v_fPatternSpacing: float = NAN
	var v_fSpawnRatio: float = NAN
	var v_iRandom: int = 0
	var v_voice: R.Value = null
	var v_bDisplayNewArea: bool = false
	var v_fLevelLength: float = NAN
	var v_fNextLevelStartPosition: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_szLevelName = R.coerce(null, "String")
	v_levelPatterns = null
	v_levelPattern = null
	v_fSpawnLevelLength = float(NAN)
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = null
	v_fPosZ = float(NAN)
	v_storyDialog = null
	v_fStretch = float(NAN)
	v_fPatternSpacing = float(NAN)
	v_fSpawnRatio = float(NAN)
	v_iRandom = R.coerce(0, "int")
	v_voice = null
	f["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(f.get("m_fPlayerStartPosition")) + float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z"))), f.get("m_fTotalLevelLength"))), float(1)))
	((f.get("m_Game") as R.Value).fields.get("m_VoiceOverSFXMix") as R.Value).fields["m_fVolume"] = float((float(R.statics["RDGame"].get("MinVoiceOverSFXMix")) + float((float(f.get("m_fLevelDifficulty")) * float((float(R.statics["RDGame"].get("MaxVoiceOverSFXMix")) - float(R.statics["RDGame"].get("MinVoiceOverSFXMix"))))))))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(f.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	v_bDisplayNewArea = false
	v_fLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(2)))))
	v_fNextLevelStartPosition = float((float(f.get("m_fLevelStartPosition")) + v_fLevelLength))
	if (float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) >= v_fNextLevelStartPosition):
		pass
		R.call_member(c, "OnPreChangeLevel", [])
		R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		f["m_iLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(1))), "int")
		R.call_member(c, "OnNewLevelArea", [])
		f["m_iLevelTag"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(5))), "int")
		f["m_iLevelTag2"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(6))), "int")
		f["m_fLevelStartPosition"] = v_fNextLevelStartPosition
		v_fLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(2)))))
		v_fNextLevelStartPosition = float((float(f.get("m_fLevelStartPosition")) + v_fLevelLength))
		R.call_member(c, "UpdateNextLevel", [])
		f["m_bPlayStoryDialog"] = true
		if ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bFailed"))):
			pass
			v_szLevelName = R.coerce(R.get_value(f.get("LevelInfos"), (float(f.get("m_iLevel")) * float(7))), "String")
			if R.truth(R.binary("!=", v_szLevelName, "")):
				pass
				R.call_member(c, "SetSavedLevel", [f.get("m_iLevel")])
				v_bDisplayNewArea = true
		R.call_member(c, "OnPreLoadLevelTagEvents", [])
		R.call_member(c, "OnLevelTagEvents", [])
	if v_bDisplayNewArea:
		pass
		R.call_member(f.get("m_Game"), "ShowMessageBox", [("" if R.truth(f.get("m_bIsHardcore")) else "Progress Saved..."), v_szLevelName])
	if R.truth((f.get("m_bPlayStoryDialog") and R.binary(">=", ((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z"), R.binary("+", f.get("m_fLevelStartPosition"), R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(4))))))):
		pass
		v_storyDialog = R.binary("as", R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(3))), R.klass("Array"))
		if R.truth(v_storyDialog):
			pass
			f["m_StoryDialog"] = v_storyDialog
			R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		f["m_bPlayStoryDialog"] = false
		if R.truth((R.binary("!=", R.binary("&", f.get("m_iLevelTag"), R.statics["RDGameModeStory"].get("LevelTag_ChopperLeave")), 0) and R.truth(f.get("m_HelicopterAlly")))):
			pass
			R.call_member(f.get("m_HelicopterAlly"), "StartRetreat", [])
	if R.truth(f.get("m_bPlayJetsComingBackDialog")):
		pass
		R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Cocheta"), f.get("m_JetsComingVoice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
		f["m_bPlayJetsComingBackDialog"] = false
	while (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fNextPatternSpawnPosition"))):
		pass
		if R.truth(f.get("m_bIsHighwayLevel")):
			pass
			if R.truth((f.get("m_bSpawnRamp") and (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = f.get("m_LevelRampExitPatterns")
				f["m_bSpawnRamp"] = false
			else:
				pass
				f["m_bSpawnWeapons"] = false
				f["m_bSpawnCheckpoint"] = false
				if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fCheckpointPatternPosition"))):
					pass
					f["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth(((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpecialPatternPosition"))) and ( not R.truth(R.call_member(c, "HasActiveStoryDialog", []))))):
						pass
						f["m_bSpawnWeapons"] = true
						if (float(f.get("m_iSpecialLocation")) == float(2)):
							pass
							f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth(((float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_JohnHighway"))) and (float(f.get("m_iJohnPatterns")) > float(0)))):
					pass
					v_levelPatterns = f.get("m_LevelJohnHighwayPatterns")
					R.set_value(c, "m_iJohnPatterns", 1, "-=")
				else:
					pass
					if R.truth(f.get("m_bSpawnCheckpoint")):
						pass
						v_levelPatterns = f.get("m_LevelCheckpointHighwayPatterns")
						f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(f.get("m_bSpawnWeapons")):
							pass
							v_levelPatterns = f.get("m_LevelWeaponsHighwayPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("HighwaySpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HighwaySpecialPatternSpacingRandom"))))))
						else:
							pass
							if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fNextHardPatternSpawnPosition"))):
								pass
								v_levelPatterns = f.get("m_LevelHardHighwayPatterns")
								f["m_fNextHardPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextHardPatternSpawnPosition"), (float(R.statics["RDGameModeGameplay"].get("HighwayHardPatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HighwayHardPatternSpacingRandom")))))))
							else:
								pass
								v_levelPatterns = f.get("m_LevelNormalHighwayPatterns")
			v_levelPattern = R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew"))
			v_fStretch = float((float(1) + float((float(randf()) * float((float(0.25) + float((float((float(1) - float(f.get("m_fLevelDifficulty")))) * float(0.25)))))))))
			f["m_bIsZombieCheckpoint"] = f.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.num(R.call_member(v_levelPattern, "Load", [c, f.get("m_iLevel"), f.get("m_fLevelDifficulty"), f.get("m_fNextPatternSpawnPosition"), 1, v_fStretch]))
			f["m_bIsZombieCheckpoint"] = false
			f["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [f.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			v_fPatternSpacing = float((float(R.statics["RDGameModeGameplay"].get("PatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("PatternSpacingRandom"))))))
			if R.truth(((f.get("m_Player") as R.Value).fields.get("m_bIsOnFire") and (float(randf()) < float(R.statics["RDGameModeGameplay"].get("WaterJugChance"))))):
				pass
				v_waterJug = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug"))
				v_fPosZ = float((float(f.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(f.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.statics["RDRoad"].get("RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.statics["RDRoad"].get("RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			f["m_fNextPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextPatternSpawnPosition"), (v_fPatternSpace + v_fPatternSpacing)))
			v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
			while (float(f.get("m_fNextPatternSpawnPosition")) >= v_fNextSpawnLevelStartPosition):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				f["m_bSpawnWeaponCrate"] = true
				f["m_iSpawnLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				f["m_fSpawnLevelStartPosition"] = v_fNextSpawnLevelStartPosition
				R.call_member(c, "OnNewSpawnLevelArea", [f.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
		else:
			pass
			if R.truth((f.get("m_bSpawnRamp") and (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = f.get("m_LevelRampPatterns")
				f["m_bSpawnRamp"] = false
			else:
				pass
				f["m_bSpawnChurch"] = false
				f["m_bSpawnPoliceStation"] = false
				f["m_bSpawnWeapons"] = false
				f["m_bSpawnGarage"] = false
				f["m_bSpawnCheckpoint"] = false
				if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fCheckpointPatternPosition"))):
					pass
					f["m_bSpawnCheckpoint"] = true
				else:
					pass
					if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpecialPatternPosition"))):
						pass
						if R.truth(((float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Park"))) or (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Cemetery"))))):
							pass
							f["m_bSpawnWeapons"] = true
							if (float(f.get("m_iSpecialLocation")) == float(2)):
								pass
								f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
						else:
							pass
							v_iRandom = R.coerce(f.get("m_iSpecialLocation"), "int")
							f["m_bSpawnChurch"] = (float(v_iRandom) == float(0))
							f["m_bSpawnPoliceStation"] = (float(v_iRandom) == float(1))
							f["m_bSpawnWeapons"] = (float(v_iRandom) == float(2))
							f["m_bSpawnGarage"] = (float(v_iRandom) == float(3))
							f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Residential"))):
					pass
					if R.truth(f.get("m_bSpawnChurch")):
						pass
						v_levelPatterns = f.get("m_LevelResidentialChurchPatterns")
						f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(f.get("m_bSpawnPoliceStation")):
							pass
							v_levelPatterns = f.get("m_LevelResidentialPoliceStationPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(f.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = f.get("m_LevelResidentialWeaponsPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = f.get("m_LevelResidentialGaragePatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = f.get("m_LevelResidentialCheckpointPatterns")
										f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelResidentialPatterns")
				else:
					pass
					if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Town"))):
						pass
						if R.truth(f.get("m_bSpawnChurch")):
							pass
							v_levelPatterns = f.get("m_LevelTownChurchPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(f.get("m_bSpawnPoliceStation")):
								pass
								v_levelPatterns = f.get("m_LevelTownPoliceStationPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = f.get("m_LevelTownWeaponsPatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnGarage")):
										pass
										v_levelPatterns = f.get("m_LevelTownGaragePatterns")
										f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
									else:
										pass
										if R.truth(f.get("m_bSpawnCheckpoint")):
											pass
											v_levelPatterns = f.get("m_LevelTownCheckpointPatterns")
											f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
										else:
											pass
											v_levelPatterns = f.get("m_LevelTownPatterns")
					else:
						pass
						if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Industrial"))):
							pass
							if R.truth(f.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = f.get("m_LevelIndustrialWeaponsPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = f.get("m_LevelIndustrialGaragePatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = f.get("m_LevelIndustrialCheckpointPatterns")
										f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelIndustrialPatterns")
						else:
							pass
							if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Park"))):
								pass
								if R.truth(f.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = f.get("m_LevelParkWeaponsPatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									v_levelPatterns = f.get("m_LevelParkPatterns")
							else:
								pass
								if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Cemetery"))):
									pass
									if R.truth(f.get("m_bSpawnWeapons")):
										pass
										v_levelPatterns = f.get("m_LevelCemeteryWeaponsPatterns")
										f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelCemeteryPatterns")
								else:
									pass
									if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Parking"))):
										pass
										if R.truth(R.binary("!=", R.binary("&", f.get("m_iLevelTag"), R.statics["RDGameModeStory"].get("LevelTag_ChopperShooting")), 0)):
											pass
											v_levelPatterns = f.get("m_LevelChopperShootingPatterns")
										else:
											pass
											v_levelPatterns = f.get("m_LevelParkingPatterns")
									else:
										pass
										if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Alleyway"))):
											pass
											v_levelPatterns = f.get("m_LevelAlleywayPatterns")
										else:
											pass
											if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Checkpoint"))):
												pass
												v_levelPatterns = f.get("m_LevelTownCheckpointPatterns")
			v_fSpawnRatio = float((float(f.get("m_fSpawnRatioBaseNormal")) + float((float(f.get("m_fLevelDifficulty")) * float(f.get("m_fSpawnRatioIncrementNormal"))))))
			if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fNextHardPatternSpawnPosition"))):
				pass
				v_fSpawnRatio = float((float(f.get("m_fSpawnRatioBaseHard")) + float((float(f.get("m_fLevelDifficulty")) * float(f.get("m_fSpawnRatioIncrementHard"))))))
				f["m_fNextHardPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextHardPatternSpawnPosition"), (float(R.statics["RDGameModeGameplay"].get("HardPatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HardPatternSpacingRandom")))))))
			if R.truth(((R.truth(((float(f.get("m_iSpawnLevel")) >= float(f.get("m_iChopperSupportStartLevel"))) and (float(f.get("m_iSpawnLevel")) <= float(f.get("m_iChopperSupportEndLevel"))))) and R.truth(f.get("m_HelicopterAlly"))) and (f.get("m_HelicopterAlly") as R.Value).fields.get("m_bShootingMode"))):
				pass
				v_fSpawnRatio = float(minf(float((v_fSpawnRatio * float(1.5))), float(1)))
			v_levelPattern = R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew"))
			if R.truth(((((R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_ChopperShooting")))):
				pass
				v_fSpawnRatio = float(1)
			f["m_bIsZombieCheckpoint"] = f.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.num(R.call_member(v_levelPattern, "Load", [c, f.get("m_iLevel"), f.get("m_fLevelDifficulty"), f.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]))
			f["m_bIsZombieCheckpoint"] = false
			f["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [f.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			if R.truth(((f.get("m_Player") as R.Value).fields.get("m_bIsOnFire") and (float(randf()) < float(R.statics["RDGameModeGameplay"].get("WaterJugChance"))))):
				pass
				v_fPatternSpacing = float((float(R.statics["RDGameModeGameplay"].get("PatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("PatternSpacingRandom"))))))
				v_waterJug = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug"))
				v_fPosZ = float((float(f.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(f.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.statics["RDRoad"].get("RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.statics["RDRoad"].get("RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			f["m_fNextPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextPatternSpawnPosition"), v_fPatternSpace))
			v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
			while (float(f.get("m_fNextPatternSpawnPosition")) >= v_fNextSpawnLevelStartPosition):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				f["m_bSpawnWeaponCrate"] = true
				f["m_iSpawnLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				f["m_fSpawnLevelStartPosition"] = v_fNextSpawnLevelStartPosition
				R.call_member(c, "OnNewSpawnLevelArea", [f.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((f.get("m_bRadioRepair") and (float((f.get("m_Player") as R.Value).fields.get("m_iCurrentTask")) == float(R.statics["RDPlayer"].get("Task_None"))))):
		pass
		f["m_fRadioRepairTime"] = R.num(R.binary("-", f.get("m_fRadioRepairTime"), v_fDeltaTime))
		if (float(f.get("m_fRadioRepairTime")) <= float(0)):
			pass
			f["m_fRadioRepairTime"] = float(10)
			R.set_value(c, "m_iRadioRepairAttempt", 1, "+=")
			if (float(f.get("m_iRadioRepairAttempt")) == float(1)):
				pass
				R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 0) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 0)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			else:
				pass
				if (float(f.get("m_iRadioRepairAttempt")) == float(2)):
					pass
					R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 1) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 1)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
				else:
					pass
					if (float(f.get("m_iRadioRepairAttempt")) == float(3)):
						pass
						R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 2) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 2)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
						(f.get("m_Player") as R.Value).fields["m_bForceBrake"] = true
		v_voice = (R.get_value(f.get("m_MaleRadioRepairVoices"), 0) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 0))
		if ((R.truth(((f.get("m_bRadioRepair") and ( not R.truth((f.get("m_Game") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(v_voice, "IsPlaying", []))))) and R.truth(R.call_member(f.get("m_Player"), "CanStartTask", []))) and (float((f.get("m_Player") as R.Value).fields.get("m_iLeftHandState")) == float(R.statics["RDPlayer"].get("HandState_OnWheel")))):
			pass
			f["m_bRadioRepair"] = false
			R.call_member(f.get("m_Player"), "StartTask", [R.statics["RDPlayer"].get("Task_RepairRadio"), false, 0])
	if R.truth(((R.truth(f.get("m_RadioRepairedVoice")) and ( not R.truth((f.get("m_Game") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(f.get("m_RadioRepairedVoice"), "IsPlaying", []))))):
		pass
		f["m_StoryDialog"] = f.get("m_RadioRepairVoice")
		R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
		R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		f["m_RadioRepairedVoice"] = null
	if R.truth(f.get("m_bIsChopperShootingLevel")):
		pass
		f["m_fChopperShootingTimer"] = R.num(R.binary("+", f.get("m_fChopperShootingTimer"), v_fDeltaTime))
		if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice1Time"))) and f.get("m_bPlayChopperShootingVoice1"))):
			pass
			f["m_bPlayChopperShootingVoice1"] = false
			f["m_StoryDialog"] = f.get("m_ChopperShooting1Voice")
			R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		else:
			pass
			if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice2Time"))) and f.get("m_bPlayChopperShootingVoice2"))):
				pass
				f["m_bPlayChopperShootingVoice2"] = false
				R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting2Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			else:
				pass
				if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice2BTime"))) and f.get("m_bPlayChopperShootingVoice2B"))):
					pass
					f["m_bPlayChopperShootingVoice2B"] = false
					f["m_StoryDialog"] = f.get("m_ChopperShooting2BVoice")
					R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
					R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
				else:
					pass
					if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice3Time"))) and f.get("m_bPlayChopperShootingVoice3"))):
						pass
						f["m_bPlayChopperShootingVoice3"] = false
						R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting3Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
					else:
						pass
						if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice3BTime"))) and f.get("m_bPlayChopperShootingVoice3B"))):
							pass
							f["m_bPlayChopperShootingVoice3B"] = false
							f["m_StoryDialog"] = f.get("m_ChopperShooting3BVoice")
							R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
							R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
						else:
							pass
							if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice4Time"))) and f.get("m_bPlayChopperShootingVoice4"))):
								pass
								f["m_bPlayChopperShootingVoice4"] = false
								R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting4Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
							else:
								pass
								if (float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingTime"))):
									pass
									R.call_member(c, "CompleteStoryMode", [])
									if R.truth(((float((R.statics["RDPlayerInfo"].get("Instance") as R.Value).fields.get("m_iCivsInCar")) > float(0)) and ( not R.truth(R.get_value(((f.get("m_Game") as R.Value).fields.get("m_PlayerInfo") as R.Value).fields.get("m_completedAchievements"), R.statics["RDAchievement"].get("FreeRide")))))):
										pass
										R.call_member(f.get("m_Game"), "CompleteAchievement", [R.statics["RDAchievement"].get("FreeRide")])
										R.call_member(f.get("m_Game"), "SavePlayerInfo", [])
									(f.get("m_Game") as R.Value).fields["m_CinematicTransitionGameMode"] = c
									R.call_member(R.statics["RDGame"].get("Instance"), "StartCinematic", ["GameEnding", false])
		R.call_member((f.get("m_Game") as R.Value).fields.get("m_Hud"), "ShowTime", [(float(R.statics["RDGameModeStory"].get("ChopperShootingTime")) - float(f.get("m_fChopperShootingTimer")))])
		if R.truth(R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "ShouldReplenishAmmo", [])):
			pass
			R.call_member(f.get("m_Player"), "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_AmmoVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Extra")])
			R.call_member(f.get("m_AmmoSound"), "Play", [])
			R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "ReplenishAmmo", [true, 1])
	if R.truth(f.get("m_bFirstUpdate")):
		pass
		R.call_member(c, "OnLevelTagEvents", [])
		f["m_bFirstUpdate"] = false
	return null


static func RDSpawnManager_Update(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGameModeGameplay")
	R.ensure_statics("RDSoldier")
	R.ensure_statics("RDSpawnManager")
	R.ensure_statics("RDZombie")
	var f: Dictionary = c.fields
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "spawnerWeightInfo": "RDSpawnerWeightInfo", "iSpawner": "*", "fTotalWeigth": "Number", "fAccum": "Number", "fRandom": "Number", "spawner": "RDSpawnerInfo", "spawnerInfo": "RDSpawnerInfo", "fPerlinX": "Number", "soldier": "RDSoldier", "vSpawnLocation": "DTVector3D", "zombieClass": "Class", "zombie": "RDZombie", "iMaxEnemies": "int", "iMaxSpawn": "int", "fSpawnRatio": "Number", "iSpawnSide": "int", "fDeltaTime": "Number"}
	l["i"] = 0
	l["spawnerWeightInfo"] = null
	l["iSpawner"] = null
	l["fTotalWeigth"] = NAN
	l["fAccum"] = NAN
	l["fRandom"] = NAN
	l["spawner"] = null
	l["spawnerInfo"] = null
	l["fPerlinX"] = NAN
	l["soldier"] = null
	l["vSpawnLocation"] = null
	l["zombieClass"] = null
	l["zombie"] = null
	l["iMaxEnemies"] = 0
	l["iMaxSpawn"] = 0
	l["fSpawnRatio"] = NAN
	l["iSpawnSide"] = 0
	l["fDeltaTime"] = R.num((a[0] if a.size() > 0 else NAN))
	R.lset(l, "i", 0)
	R.lset(l, "spawnerWeightInfo", null)
	R.lset(l, "iSpawner", 0)
	R.lset(l, "fTotalWeigth", NAN)
	R.lset(l, "fAccum", NAN)
	R.lset(l, "fRandom", NAN)
	R.lset(l, "spawner", null)
	R.lset(l, "spawnerInfo", null)
	R.lset(l, "fPerlinX", NAN)
	R.lset(l, "soldier", null)
	R.lset(l, "vSpawnLocation", null)
	R.lset(l, "zombieClass", null)
	R.lset(l, "zombie", null)
	if ( not R.truth(f.get("m_bEnabled"))):
		pass
		return null
	if (R.truth(R.call_member(f.get("m_GameMode"), "IsFUBARMode", [])) and ( not R.truth(R.call_member(f.get("m_GameMode"), "CanSpawnMilitary", [])))):
		pass
		return null
	if ((R.truth(R.call_member(f.get("m_GameMode"), "SkipZombiesForTutorial", [])) or R.truth(R.call_member((f.get("m_Game") as R.Value).fields.get("m_Hud"), "IsTutorialShown", []))) and (float((((f.get("m_GameMode") as R.Value).fields.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float(R.statics["RDGameModeGameplay"].get("NoZombieMargin")))):
		pass
		return null
	R.lset(l, "iMaxEnemies", R.call_member(f.get("m_GameMode"), "GetSpawnMax", []))
	if R.truth(((((float(((f.get("m_Game") as R.Value).fields.get("m_World") as R.Value).fields.get("m_iKillableEnemies")) >= float(R.lget(l, "iMaxEnemies"))) or ( not R.truth(R.call_member(f.get("m_GameMode"), "CanSpawnZombies", [])))) or ((f.get("m_GameMode") as R.Value).fields.get("m_Player") as R.Value).fields.get("m_bInEnding")) or ((f.get("m_GameMode") as R.Value).fields.get("m_Player") as R.Value).fields.get("m_bFailed"))):
		pass
		return null
	R.lset(l, "iMaxSpawn", R.call_member(f.get("m_GameMode"), "GetMaxSpawnZombies", []))
	if R.truth((R.binary(">", R.lget(l, "iMaxSpawn"), (-1)) and (float(f.get("m_iNbSpawns")) >= float(R.lget(l, "iMaxSpawn"))))):
		pass
		return null
	R.lset(l, "fSpawnRatio", R.call_member(f.get("m_GameMode"), "GetSpawnRate", []))
	R.lset(l, "iSpawnSide", R.call_member(f.get("m_GameMode"), "GetSpawnZombiesSide", []))
	if (float(R.lget(l, "fSpawnRatio")) > float(0)):
		pass
		f["m_fSpawnTimer"] = R.num(R.binary("+", f.get("m_fSpawnTimer"), (float(R.lget(l, "fSpawnRatio")) * float(R.lget(l, "fDeltaTime")))))
		if (float(f.get("m_fSpawnTimer")) > float(f.get("m_fSpawnDelay"))):
			pass
			f["m_fSpawnTimer"] = float(0)
			f["m_fSpawnDelay"] = float((float(R.statics["RDSpawnManager"].get("SpawnDelayMin")) + float((float(randf()) * float((float(R.statics["RDSpawnManager"].get("SpawnDelayMax")) - float(R.statics["RDSpawnManager"].get("SpawnDelayMin"))))))))
			R.lset(l, "iSpawner", 0, "=")
			R.lset(l, "fTotalWeigth", 0, "=")
			R.lset(l, "i", 0, "=")
			while R.truth((R.binary("<", R.lget(l, "i"), R.get_value(((f.get("m_Game") as R.Value).fields.get("m_World") as R.Value).fields.get("m_ZombieSpawners"), "length")) and R.binary("<", R.lget(l, "iSpawner"), R.statics["RDSpawnManager"].get("MaxSpawnerInfos")))):
				pass
				R.lset(l, "spawnerInfo", R.binary("as", R.get_value(((f.get("m_Game") as R.Value).fields.get("m_World") as R.Value).fields.get("m_ZombieSpawners"), R.lget(l, "i")), R.klass("RDSpawnerInfo")), "=")
				R.lset(l, "fPerlinX", R.call_static("RDWorld", "GetPerlinX", [(((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")]), "=")
				if ( not R.truth(((R.binary("==", R.lget(l, "iSpawnSide"), (-1)) and (float((float((((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("X")) - float(R.lget(l, "fPerlinX")))) < float(0))) or ((float(R.lget(l, "iSpawnSide")) == float(1)) and (float((float((((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("X")) - float(R.lget(l, "fPerlinX")))) > float(0)))))):
					pass
					if ((R.truth(R.call_member((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity"), "CanSpawnZombie", [R.call_member(f.get("m_GameMode"), "GetUnlimitedSpawning", [])])) and (float((((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) > float((float((((f.get("m_GameMode") as R.Value).fields.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDSpawnManager"].get("MinSpawnDistance")))))) and (float((((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) < float((float((((f.get("m_GameMode") as R.Value).fields.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDSpawnManager"].get("MaxSpawnDistance")))))):
						pass
						R.lset(l, "spawnerWeightInfo", R.get_value(f.get("m_SpawnerWeigthInfos"), R.binary("-", R.lset(l, "iSpawner", 1, "+="), 1)), "=")
						(R.lget(l, "spawnerWeightInfo") as R.Value).fields["m_Spawner"] = R.lget(l, "spawnerInfo")
						(R.lget(l, "spawnerWeightInfo") as R.Value).fields["m_fWeight"] = float((float(1) - R.num(clampf(R.num(R.binary("/", (float((((R.lget(l, "spawnerInfo") as R.Value).fields.get("m_Entity") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) - float((float((((f.get("m_GameMode") as R.Value).fields.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDSpawnManager"].get("MinSpawnDistance"))))), (float(R.statics["RDSpawnManager"].get("MaxSpawnDistance")) - float(R.statics["RDSpawnManager"].get("MinSpawnDistance"))))), R.num(0), R.num(0.99)))))
						(R.lget(l, "spawnerWeightInfo") as R.Value).fields["m_fWeight"] = R.num(R.binary("*", (R.lget(l, "spawnerWeightInfo") as R.Value).fields.get("m_fWeight"), (R.lget(l, "spawnerWeightInfo") as R.Value).fields.get("m_fWeight")))
						R.lset(l, "fTotalWeigth", (R.lget(l, "spawnerWeightInfo") as R.Value).fields.get("m_fWeight"), "+=")
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			R.lset(l, "fAccum", 0, "=")
			R.lset(l, "fRandom", (float(randf()) * float(R.lget(l, "fTotalWeigth"))), "=")
			R.lset(l, "i", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "i"), R.lget(l, "iSpawner"))):
				pass
				R.lset(l, "spawnerWeightInfo", R.get_value(f.get("m_SpawnerWeigthInfos"), R.lget(l, "i")), "=")
				R.lset(l, "fAccum", (R.lget(l, "spawnerWeightInfo") as R.Value).fields.get("m_fWeight"), "+=")
				if (float(R.lget(l, "fRandom")) <= float(R.lget(l, "fAccum"))):
					pass
					R.lset(l, "spawner", (R.lget(l, "spawnerWeightInfo") as R.Value).fields.get("m_Spawner"), "=")
					break
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			if R.truth(R.lget(l, "spawner")):
				pass
				if R.truth(R.call_member(f.get("m_GameMode"), "IsFUBARMode", [])):
					pass
					R.lset(l, "soldier", R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "=")
					R.call_member(R.lget(l, "soldier"), "Init", [R.statics["RDSoldier"].get("Behavior_Spawning")])
					R.lset(l, "vSpawnLocation", R.call_member((R.lget(l, "spawner") as R.Value).fields.get("m_Entity"), "GetZombieSpawnLocation", []), "=")
					R.call_member((f.get("m_GameMode") as R.Value).fields.get("m_Game"), "AddEntity", [R.lget(l, "soldier"), (R.lget(l, "vSpawnLocation") as R.Value).fields.get("X"), R.call_static("RDWorld", "GetPerlinY", [(float((R.lget(l, "vSpawnLocation") as R.Value).fields.get("Z")) + float(1))]), (float((R.lget(l, "vSpawnLocation") as R.Value).fields.get("Z")) + float(1))])
					R.call_member(R.lget(l, "soldier"), "StartSpawning", [(R.lget(l, "spawner") as R.Value).fields.get("m_Entity")])
					R.set_value((R.lget(l, "spawner") as R.Value).fields.get("m_Entity"), "m_iSpawnCapacity", 1, "-=")
				else:
					pass
					R.lset(l, "zombieClass", R.call_member(f.get("m_GameMode"), "GetRandomZombieClass", []), "=")
					if R.truth(R.lget(l, "zombieClass")):
						pass
						R.lset(l, "zombie", R.binary("as", R.call_static("RDGame", "GetEntity", [R.lget(l, "zombieClass")]), R.klass("RDZombie")), "=")
						R.call_member(R.lget(l, "zombie"), "Init", [R.statics["RDZombie"].get("MovementType_MoveToPlayer")])
						R.lset(l, "vSpawnLocation", R.call_member((R.lget(l, "spawner") as R.Value).fields.get("m_Entity"), "GetZombieSpawnLocation", []), "=")
						R.call_member((f.get("m_GameMode") as R.Value).fields.get("m_Game"), "AddEntity", [R.lget(l, "zombie"), (R.lget(l, "vSpawnLocation") as R.Value).fields.get("X"), R.call_static("RDWorld", "GetPerlinY", [(float((R.lget(l, "vSpawnLocation") as R.Value).fields.get("Z")) + float(1))]), (float((R.lget(l, "vSpawnLocation") as R.Value).fields.get("Z")) + float(1))])
						R.call_member(R.lget(l, "zombie"), "StartSpawning", [(R.lget(l, "spawner") as R.Value).fields.get("m_Entity")])
						R.set_value((R.lget(l, "spawner") as R.Value).fields.get("m_Entity"), "m_iSpawnCapacity", 1, "-=")
				R.set_value(c, "m_iNbSpawns", 1, "+=")
	return null


static func RDLevelPatternCustomNew_Load(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_iNbChild: int = 0
	var v_i: int = 0
	var v_childMC: R.Value = null
	var v_spawnInfo: R.Value = null
	var v_iGroundIndex: int = 0
	var v_gameplayMode: R.Value = null
	var v_rescueMode: R.Value = null
	var v_fPatternSpace: float = NAN
	var v_bFlip: bool = false
	var v_gameMode: R.Value = (a[0] if a.size() > 0 else null)
	var v_iLevel: int = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: float = R.num((a[2] if a.size() > 2 else NAN))
	var v_fStartPosition: float = R.num((a[3] if a.size() > 3 else NAN))
	var v_fSpawnRatio: float = R.num((a[4] if a.size() > 4 else NAN))
	var v_fStretch: float = R.num((a[5] if a.size() > 5 else NAN))
	v_iNbChild = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_childMC = null
	v_spawnInfo = null
	v_iGroundIndex = R.coerce(0, "int")
	v_gameplayMode = R.binary("as", v_gameMode, R.klass("RDGameModeGameplay"))
	v_rescueMode = R.binary("as", v_gameMode, R.klass("RDGameModeChopperRescue"))
	f["m_fStartPosition"] = v_fStartPosition
	v_fPatternSpace = float(0)
	v_bFlip = (float(randf()) < float(0.5))
	if R.truth(f.get("m_MCOverride")):
		pass
		f["m_MC"] = f.get("m_MCOverride")
	else:
		pass
		f["m_MC"] = R.construct_pattern(f.get("m_MCClass"))
	R.invoke(R.get_value(f.get("m_Grounds"), "splice"), [0])
	R.invoke(R.get_value(f.get("m_Generics"), "splice"), [0])
	R.call_member(f.get("m_Hazards"), "Clear", [])
	R.call_member(f.get("m_CriticalHazards"), "Clear", [])
	R.call_member(f.get("m_SideHazards"), "Clear", [])
	R.call_member(f.get("m_Zombies"), "Clear", [])
	R.call_member(f.get("m_Soldiers"), "Clear", [])
	v_iNbChild = R.coerce(R.get_value(f.get("m_MC"), "numChildren"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.invoke(R.get_value(f.get("m_MC"), "getChildAt"), [v_i]), R.klass("MovieClip"))
		if R.truth(R.call_member(c, "CanSpawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty])):
			pass
			if R.truth(R.call_member(c, "IsGround", [v_childMC])):
				pass
				v_iGroundIndex = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.binary("/", maxf(R.num(R.unary("-", R.get_value(v_childMC, "y"))), float(0)), 50), R.statics["RDRoad"].get("RenderStepSize"))]), "int")
				while (float(v_iGroundIndex) > float((R.num(R.get_value(f.get("m_Grounds"), "length")) - float(1)))):
					pass
					R.invoke(R.get_value(f.get("m_Grounds"), "push"), [null])
				R.set_value(f.get("m_Grounds"), v_iGroundIndex, v_childMC, "=")
			else:
				pass
				if R.truth(R.call_member(c, "IsGeneric", [v_childMC])):
					pass
					R.invoke(R.get_value(f.get("m_Generics"), "push"), [v_childMC])
				else:
					pass
					if R.truth(R.call_member(c, "IsHazard", [v_childMC, v_gameplayMode])):
						pass
						if R.truth(R.binary("<=", absf(R.num(R.get_value(v_childMC, "x"))), 500)):
							pass
							R.call_member(f.get("m_Hazards"), "AddValue", [v_childMC])
						else:
							pass
							R.call_member(f.get("m_SideHazards"), "AddValue", [v_childMC])
					else:
						pass
						if R.truth(R.call_member(c, "IsCriticalHazard", [v_childMC, v_gameplayMode])):
							pass
							R.call_member(f.get("m_CriticalHazards"), "AddValue", [v_childMC])
						else:
							pass
							if R.truth(R.call_member(c, "IsZombie", [v_childMC, v_gameplayMode])):
								pass
								R.call_member(f.get("m_Zombies"), "AddValue", [v_childMC])
							else:
								pass
								if R.truth(R.call_member(c, "IsSoldier", [v_childMC])):
									pass
									R.call_member(f.get("m_Soldiers"), "AddValue", [v_childMC])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value(f.get("m_Grounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.get_value(f.get("m_Grounds"), v_i), R.klass("MovieClip"))
		v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
		v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value(f.get("m_Generics"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.get_value(f.get("m_Generics"), v_i), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-750)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Hazards") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Hazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((float((R.num(R.get_value((f.get("m_CriticalHazards") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio)) * float(0.7)))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_CriticalHazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_SideHazards") as R.Value).fields.get("m_Values"), "length")) * float(minf(float((v_fSpawnRatio * float(1.5))), float(1)))))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_SideHazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Zombies") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Zombies"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Soldiers") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Soldiers"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		v_i = R.signed32(v_i + 1)
	f["m_MC"] = null
	return v_fPatternSpace
	return null


static func RDLevelPatternCustomNew_CanSpawn(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDGameModeGameplay")
	var f: Dictionary = c.fields
	var v_colorTransform: Variant = null
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	var v_gameplayMode: R.Value = (a[1] if a.size() > 1 else null)
	var v_rescueMode: R.Value = (a[2] if a.size() > 2 else null)
	var v_iLevel: int = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDifficulty: float = R.num((a[4] if a.size() > 4 else NAN))
	v_colorTransform = R.get_value(R.get_value(v_childMC, "transform"), "colorTransform")
	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Civilian")):
		pass
		if ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnCivilian", []))):
			pass
			return false
	else:
		pass
		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierStationary")):
			pass
			if R.truth((( not R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []))) and (( not R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) or ( not R.truth(((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iStationarySoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iStationarySoldierLevel"))) and ( not R.truth(R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))))):
				pass
				return false
			if (R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", [])))))):
				pass
				return false
		else:
			pass
			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierAlign")):
				pass
				if R.truth((( not R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []))) and (( not R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) or ( not R.truth(((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iAlignSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iAlignSoldierLevel"))) and ( not R.truth(R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))))):
					pass
					return false
				if (R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", [])))))):
					pass
					return false
			else:
				pass
				if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierSpikes")):
					pass
					if R.truth((( not R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []))) and (( not R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) or ( not R.truth(((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel"))) and ( not R.truth(R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))))):
						pass
						return false
					if (R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", [])))))):
						pass
						return false
				else:
					pass
					if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierBomb")):
						pass
						if R.truth((( not R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", []))) and (( not R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) or ( not R.truth(((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iBombSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iBombSoldierLevel"))) and ( not R.truth(R.call_member(v_gameplayMode, "HasActiveStoryDialog", [])))))))))):
							pass
							return false
						if (R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", [])))))):
							pass
							return false
					else:
						pass
						if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierPatrol") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierStraight"))):
							pass
							if R.truth(((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSoldierZombieLevel"))) or ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))))):
								pass
								return false
						else:
							pass
							if R.truth(((((((((((R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardPatrol") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardFeed")) or R.constructor_is(v_childMC, "MC_LevelObject_Feeders")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalPatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalFeed"))):
								pass
								if (R.truth(R.call_member(v_gameplayMode, "SkipZombiesForTutorial", [])) and (float((float(f.get("m_fStartPosition")) + float(R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)))) < float(R.statics["RDGameModeGameplay"].get("NoZombieMargin")))):
									pass
									return false
								if ( not R.truth(R.call_member(v_gameplayMode, "CanSpawnNormalZombies", []))):
									pass
									return false
							else:
								pass
								if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FuelTruck")):
									pass
									if (float(v_iLevel) < float((v_gameplayMode).fields.get("m_iFuelTruckLevel"))):
										pass
										return false
								else:
									pass
									if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Mine")):
										pass
										if (float(v_iLevel) < float((v_gameplayMode).fields.get("m_iMineLevel"))):
											pass
											return false
									else:
										pass
										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Oil")):
											pass
											if (float(randf()) >= float((float(0.1) + float((v_fDifficulty * float(0.3)))))):
												pass
												return false
										else:
											pass
											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Spikes")):
												pass
												if (float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikesLevel"))):
													pass
													return false
											else:
												pass
												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ChopperSpot")):
													pass
													if R.truth(R.binary("==", R.binary("as", v_gameplayMode, R.klass("RDGameModeChopperRescue")), null)):
														pass
														return false
	return true
	return null


static func RDLevelPatternCustomNew_IsGround(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	if R.truth((((((((R.constructor_is(v_childMC, "MC_LevelGround_Pavement") or R.constructor_is(v_childMC, "MC_LevelGround_Park")) or R.constructor_is(v_childMC, "MC_LevelGround_Parking")) or R.constructor_is(v_childMC, "MC_LevelGround_GrassAndPavement")) or R.constructor_is(v_childMC, "MC_LevelGround_PavementAndGrass")) or R.constructor_is(v_childMC, "MC_LevelGround_CrossingStreet")) or R.constructor_is(v_childMC, "MC_LevelGround_Alleyway")) or R.constructor_is(v_childMC, "MC_LevelGround_ForestPath"))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_IsGeneric(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	if R.truth((((((((((((((((((((((((((((((((((((((((((R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialRight")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialRight")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchRight")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationRight")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageRight")) or R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageLeft")) or R.constructor_is(v_childMC, "MC_LevelObject_Civilian")) or R.constructor_is(v_childMC, "MC_LevelObject_RoadBlood")) or R.constructor_is(v_childMC, "MC_LevelObject_Bush1")) or R.constructor_is(v_childMC, "MC_LevelObject_Bush2")) or R.constructor_is(v_childMC, "MC_LevelObject_Bush3")) or R.constructor_is(v_childMC, "MC_LevelObject_WeaponCrate")) or R.constructor_is(v_childMC, "MC_LevelObject_FireHydrant")) or R.constructor_is(v_childMC, "MC_LevelObject_FireHydrantFlowing")) or R.constructor_is(v_childMC, "MC_LevelObject_WaterJug")) or R.constructor_is(v_childMC, "MC_LevelObject_HighwayRamp")) or R.constructor_is(v_childMC, "MC_LevelObject_HighwayRampExit")) or R.constructor_is(v_childMC, "MC_LevelObject_HighwayExitSign")) or R.constructor_is(v_childMC, "MC_LevelObject_EndChopper")) or R.constructor_is(v_childMC, "MC_LevelObject_ShoppingMall")) or R.constructor_is(v_childMC, "MC_LevelObject_GrassTop")) or R.constructor_is(v_childMC, "MC_LevelObject_SmallHillTop")) or R.constructor_is(v_childMC, "MC_LevelObject_ChopperSpot")) or R.constructor_is(v_childMC, "MC_LevelObject_ShoppingCart")) or R.constructor_is(v_childMC, "MC_LevelObject_ElectronicSign")) or R.constructor_is(v_childMC, "MC_LevelObject_Box")) or R.constructor_is(v_childMC, "MC_LevelObject_TrafficCone")) or R.constructor_is(v_childMC, "MC_LevelObject_TrafficBarrel")) or R.constructor_is(v_childMC, "MC_LevelObject_ConstructionSign")) or R.constructor_is(v_childMC, "MC_LevelObject_Table")) or R.constructor_is(v_childMC, "MC_LevelObject_LawnFlamingo")) or R.constructor_is(v_childMC, "MC_LevelObject_GardenGnome")) or R.constructor_is(v_childMC, "MC_LevelObject_TrafficLight")) or R.constructor_is(v_childMC, "MC_LevelObject_TrashCan")) or R.constructor_is(v_childMC, "MC_LevelObject_MailBox")) or R.constructor_is(v_childMC, "MC_LevelObject_RoadKill"))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_IsHazard(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	var v_gameplayMode: R.Value = (a[1] if a.size() > 1 else null)
	if (((((((((((((((((((((((((((((((((((R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Ambulance")) or (R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ArmyTruck")) and R.truth(R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", [])))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FuelTruck"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_BurningCar"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Bus"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FireTruck"))) or (R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerNarrow")) and R.truth(R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", [])))) or (R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerWide")) and R.truth(R.call_member(v_gameplayMode, "CanSpawnAmmoPoint", [])))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerNarrowDamaged"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerWideDamaged"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarNarrow"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarNarrowCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarWide"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarWideCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarNarrow"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarNarrowCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarWide"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarWideCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_PoliceCarNarrow"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_PoliceCarWide"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Semi"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarNarrow"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarNarrowCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarWide"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarWideCrashed"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MovingCar"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Oil"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SandBags"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SandBagsBloody"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MapleTree"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_DeadTree"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_PineTree"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Barracade"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Tomb"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Dumpster"))) or R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Fence"))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_IsCriticalHazard(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	var v_gameplayMode: R.Value = (a[1] if a.size() > 1 else null)
	if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_Mine") or R.constructor_is(v_childMC, "MC_LevelObject_Spikes"))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_IsZombie(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	var v_gameplayMode: R.Value = (a[1] if a.size() > 1 else null)
	if (R.truth(((((((((((((R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardPatrol") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardFeed")) or R.constructor_is(v_childMC, "MC_LevelObject_Feeders")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierPatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalPatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalFeed"))) or (R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])) and R.truth((((R.constructor_is(v_childMC, "MC_LevelObject_SoldierStationary") or R.constructor_is(v_childMC, "MC_LevelObject_SoldierAlign")) or R.constructor_is(v_childMC, "MC_LevelObject_SoldierSpikes")) or R.constructor_is(v_childMC, "MC_LevelObject_SoldierBomb"))))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_IsSoldier(c: R.Value, a: Array) -> Variant:
	var f: Dictionary = c.fields
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	if R.truth((((R.constructor_is(v_childMC, "MC_LevelObject_SoldierStationary") or R.constructor_is(v_childMC, "MC_LevelObject_SoldierAlign")) or R.constructor_is(v_childMC, "MC_LevelObject_SoldierSpikes")) or R.constructor_is(v_childMC, "MC_LevelObject_SoldierBomb"))):
		pass
		return true
	return false
	return null


static func RDLevelPatternCustomNew_SpawnYellowDots(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_yellowDot: R.Value = null
	var v_iNbDots: int = 0
	var v_i: int = 0
	var v_fStartPosition: float = R.num((a[0] if a.size() > 0 else NAN))
	var v_iSlicePos: float = R.num((a[1] if a.size() > 1 else NAN))
	var v_iSliceType: int = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: R.Value = (a[3] if a.size() > 3 else null)
	v_yellowDot = null
	v_iNbDots = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	if R.truth((((float(v_iSliceType) == float(R.statics["RDRoad"].get("SliceType_Town"))) or (float(v_iSliceType) == float(R.statics["RDRoad"].get("SliceType_GrassAndPavement")))) or (float(v_iSliceType) == float(R.statics["RDRoad"].get("SliceType_PavementAndGrass"))))):
		pass
		v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((v_fStartPosition + v_iSlicePos)) + float(1))]), R.call_static("RDWorld", "GetPerlinY", [(float((v_fStartPosition + v_iSlicePos)) + float(1))]), (float((v_fStartPosition + v_iSlicePos)) + float(1))])
		v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))]), R.call_static("RDWorld", "GetPerlinY", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))]), (float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])
	else:
		pass
		if (float(v_iSliceType) == float(R.statics["RDRoad"].get("SliceType_Parking"))):
			pass
			v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", (-3), R.call_static("RDWorld", "GetPerlinX", [(float((v_fStartPosition + v_iSlicePos)) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((v_fStartPosition + v_iSlicePos)) + float(1))]), (float((v_fStartPosition + v_iSlicePos)) + float(1))])
			v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", (-3), R.call_static("RDWorld", "GetPerlinX", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))]), (float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])
			v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((v_fStartPosition + v_iSlicePos)) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((v_fStartPosition + v_iSlicePos)) + float(1))]), (float((v_fStartPosition + v_iSlicePos)) + float(1))])
			v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject"))
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))]), (float((float((v_fStartPosition + v_iSlicePos)) + float(1))) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])
		else:
			pass
			if (float(v_iSliceType) == float(R.statics["RDRoad"].get("SliceType_CrossingStreet"))):
				pass
				v_i = R.coerce(0, "int")
				while (float(v_i) < float(14)):
					pass
					v_yellowDot = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDWhiteLine")]), R.klass("RDObject"))
					R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.binary("+", (-20), R.binary("/", (float(v_i) * float((float(20) * float(2)))), 14)), R.call_static("RDWorld", "GetPerlinX", [(float((v_fStartPosition + v_iSlicePos)) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((v_fStartPosition + v_iSlicePos)) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))]), (float((v_fStartPosition + v_iSlicePos)) + float(R.binary("/", R.statics["RDRoad"].get("RenderStepSize"), 2)))])
					v_i = R.signed32(v_i + 1)
	return null


static func RDLevelPatternCustomNew_Spawn(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDBuildingNew")
	R.ensure_statics("RDBuildingNewBG")
	R.ensure_statics("RDCarSpawnInfos")
	R.ensure_statics("RDGame")
	R.ensure_statics("RDGameModeGameplay")
	R.ensure_statics("RDObstacleCar")
	R.ensure_statics("RDRoad")
	R.ensure_statics("RDSoldier")
	R.ensure_statics("RDZombie")
	var f: Dictionary = c.fields
	var v_carSpawnInfo: R.Value = null
	var v_car: R.Value = null
	var v_buildingBG: R.Value = null
	var v_building: R.Value = null
	var v_soldier: R.Value = null
	var v_zombie: R.Value = null
	var v_zombieClass: Variant = null
	var v_p: int = 0
	var v_fPerlinSpeedX: float = NAN
	var v_fPerlinSpeedY: float = NAN
	var v_iSlideIndex: int = 0
	var v_iSliceType: int = 0
	var v_fRandomTree: float = NAN
	var v_bCleanClinger: bool = false
	var v_fMCPosY: float = NAN
	var v_fObjectPosX: float = NAN
	var v_fObjectPosZ: float = NAN
	var v_hiddenSoldier: R.Value = null
	var v_entity: R.Value = null
	var v_entity2: R.Value = null
	var v_colorTransform: Variant = null
	var v_childMC: R.Value = (a[0] if a.size() > 0 else null)
	var v_gameplayMode: R.Value = (a[1] if a.size() > 1 else null)
	var v_rescueMode: R.Value = (a[2] if a.size() > 2 else null)
	var v_iLevel: int = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDifficulty: float = R.num((a[4] if a.size() > 4 else NAN))
	var v_fStartPosition: float = R.num((a[5] if a.size() > 5 else NAN))
	var v_fStretch: float = R.num((a[6] if a.size() > 6 else NAN))
	var v_bFlip: bool = R.truth((a[7] if a.size() > 7 else false))
	v_carSpawnInfo = null
	v_car = null
	v_buildingBG = null
	v_building = null
	v_soldier = null
	v_zombie = null
	v_zombieClass = null
	v_p = R.coerce(0, "int")
	v_fPerlinSpeedX = float(NAN)
	v_fPerlinSpeedY = float(NAN)
	v_iSlideIndex = R.coerce(0, "int")
	v_iSliceType = R.coerce(0, "int")
	v_fRandomTree = float(NAN)
	v_bCleanClinger = false
	v_fMCPosY = float(NAN)
	v_fObjectPosX = float(NAN)
	v_fObjectPosZ = float(NAN)
	v_hiddenSoldier = null
	v_entity = null
	v_entity2 = null
	(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectLength"] = float(0)
	v_colorTransform = R.get_value(R.get_value(v_childMC, "transform"), "colorTransform")
	if R.truth(R.call_member(c, "IsGround", [v_childMC])):
		pass
		v_iSlideIndex = R.coerce(floorf(float(R.binary("/", (float((v_fStartPosition + float(R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)))) - float((((v_gameplayMode).fields.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z"))), R.statics["RDRoad"].get("RenderStepSize")))), "int")
		if (float((((v_gameplayMode).fields.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) > float(0)):
			pass
			v_iSlideIndex = R.signed32(v_iSlideIndex + 1)
		v_fPerlinSpeedX = float(0.001)
		v_fPerlinSpeedY = float(0.0008)
		if (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Alleyway"))):
			pass
			v_fPerlinSpeedX = float(0.0005)
			v_fPerlinSpeedY = float(0.0001)
		else:
			pass
			if (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Park"))):
				pass
				v_fPerlinSpeedX = float(0)
				v_fPerlinSpeedY = float(0.0012)
			else:
				pass
				if (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Cemetery"))):
					pass
					v_fPerlinSpeedX = float(0)
					v_fPerlinSpeedY = float(0.0008)
				else:
					pass
					if R.truth(((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Parking"))) or (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_ChopperShooting"))))):
						pass
						v_fPerlinSpeedX = float(0)
						v_fPerlinSpeedY = float(0)
		if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_Pavement")):
			pass
			v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_Town"), "int")
		else:
			pass
			if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_Park")):
				pass
				v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_Park"), "int")
			else:
				pass
				if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_Parking")):
					pass
					v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_Parking"), "int")
				else:
					pass
					if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_GrassAndPavement")):
						pass
						v_iSliceType = R.coerce((R.statics["RDRoad"].get("SliceType_PavementAndGrass") if v_bFlip else R.statics["RDRoad"].get("SliceType_GrassAndPavement")), "int")
					else:
						pass
						if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_PavementAndGrass")):
							pass
							v_iSliceType = R.coerce((R.statics["RDRoad"].get("SliceType_GrassAndPavement") if v_bFlip else R.statics["RDRoad"].get("SliceType_PavementAndGrass")), "int")
						else:
							pass
							if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_CrossingStreet")):
								pass
								v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_CrossingStreet"), "int")
							else:
								pass
								if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_Alleyway")):
									pass
									v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_Alleyway"), "int")
								else:
									pass
									if R.truth(R.constructor_is(v_childMC, "MC_LevelGround_ForestPath")):
										pass
										v_iSliceType = R.coerce(R.statics["RDRoad"].get("SliceType_ForestPath"), "int")
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, v_iSlideIndex])
		(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectLength"] = float(R.statics["RDRoad"].get("RenderStepSize"))
		v_p = R.coerce(0, "int")
		while (float(v_p) < float(R.statics["RDRoad"].get("RenderStepSize"))):
			pass
			R.call_static("RDWorld", "AddPerlinTrackPoint", [v_fPerlinSpeedX, v_fPerlinSpeedY])
			v_p = R.signed32(v_p + 1)
		R.call_member(c, "SpawnYellowDots", [v_fStartPosition, R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)]), v_iSliceType, v_gameplayMode])
	else:
		pass
		if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownLeft"))):
			pass
			if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
				pass
				v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
				R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_Town"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
				v_entity = v_buildingBG
			else:
				pass
				v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
				R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_Town"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingTownRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
				v_entity = v_building
		else:
			pass
			if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialLeft"))):
				pass
				if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
					pass
					v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
					R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_Industrial"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
					v_entity = v_buildingBG
					v_entity = v_buildingBG
				else:
					pass
					v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
					R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_Industrial"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingIndustrialRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
					v_entity = v_building
			else:
				pass
				if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialLeft"))):
					pass
					if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
						pass
						v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
						R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_Residential"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
						v_entity = v_buildingBG
					else:
						pass
						v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
						R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_Residential"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingResidentialRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
						v_entity = v_building
				else:
					pass
					if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchLeft"))):
						pass
						if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
							pass
							v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
							R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_Church"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
							v_entity = v_buildingBG
						else:
							pass
							v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
							R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_Church"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingChurchRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
							v_entity = v_building
					else:
						pass
						if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationLeft"))):
							pass
							if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
								pass
								v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
								R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_PoliceStation"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
								v_entity = v_buildingBG
							else:
								pass
								v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
								R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_PoliceStation"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingPoliceStationRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
								v_entity = v_building
						else:
							pass
							if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageRight") or R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageLeft"))):
								pass
								if R.truth(R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)):
									pass
									v_buildingBG = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNewBG")]), R.klass("RDBuildingNewBG"))
									R.call_member(v_buildingBG, "Init", [R.statics["RDBuildingNewBG"].get("Type_Garage"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
									v_entity = v_buildingBG
								else:
									pass
									v_building = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuildingNew")]), R.klass("RDBuildingNew"))
									R.call_member(v_building, "Init", [R.statics["RDBuildingNew"].get("Type_Garage"), R.statics["RDBuildingNew"].get("Variation_Random"), R.binary("==", R.constructor_is(v_childMC, "MC_LevelObject_BuildingGarageRight"), ( not v_bFlip)), (float(randf()) < v_fDifficulty)])
									v_entity = v_building
							else:
								pass
								if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Ambulance")):
									pass
									v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_AmbulanceClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
									v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge"))
									R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
									v_entity = v_car
									R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("LargeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
								else:
									pass
									if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ArmyTruck")):
										pass
										v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_ArmyTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
										v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarArmyTruck")]), R.klass("RDObstacleCarArmyTruck"))
										R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
										v_entity = v_car
										R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
									else:
										pass
										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FuelTruck")):
											pass
											v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_FuelTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
											v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFuelTruck")]), R.klass("RDObstacleFuelTruck"))
											R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
											v_entity = v_car
											R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("FuelTruckHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
										else:
											pass
											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_BurningCar")):
												pass
												v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_BurningCarClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
												v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarBurning")]), R.klass("RDObstacleCarBurning"))
												R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
												v_entity = v_car
											else:
												pass
												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Bus")):
													pass
													v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_BusClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
													v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarBus")]), R.klass("RDObstacleCarBus"))
													R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
													v_entity = v_car
													R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
												else:
													pass
													if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FireTruck")):
														pass
														v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_FireTruckClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
														v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarFireTruck")]), R.klass("RDObstacleCarFireTruck"))
														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
														v_entity = v_car
														R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
													else:
														pass
														if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerNarrow")):
															pass
															v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_HummerNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
															v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary"))
															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
															v_entity = v_car
															R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
														else:
															pass
															if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerWide")):
																pass
																v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_HummerWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitary")]), R.klass("RDObstacleCarMilitary"))
																R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																v_entity = v_car
																R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
															else:
																pass
																if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerNarrowDamaged")):
																	pass
																	v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_HummerNarrowDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																	v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitaryDamaged")]), R.klass("RDObstacleCarMilitaryDamaged"))
																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																	v_entity = v_car
																	R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), 1])
																else:
																	pass
																	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HummerWideDamaged")):
																		pass
																		v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_HummerWideDamagedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																		v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMilitaryDamaged")]), R.klass("RDObstacleCarMilitaryDamaged"))
																		R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																		v_entity = v_car
																		R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), 1])
																	else:
																		pass
																		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarNarrow")):
																			pass
																			if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																				pass
																				v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																			else:
																				pass
																				v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																			v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge"))
																			R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																			v_entity = v_car
																			R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("LargeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																		else:
																			pass
																			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarNarrowCrashed")):
																				pass
																				v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																				v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge"))
																				R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																				v_entity = v_car
																				R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("LargeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																			else:
																				pass
																				if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarWide")):
																					pass
																					if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																						pass
																						v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																					else:
																						pass
																						v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																					v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge"))
																					R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																					v_entity = v_car
																					R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("LargeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																				else:
																					pass
																					if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LargeCarWideCrashed")):
																						pass
																						v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_LargeCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																						v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarLarge")]), R.klass("RDObstacleCarLarge"))
																						R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																						v_entity = v_car
																						R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("LargeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																					else:
																						pass
																						if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarNarrow")):
																							pass
																							if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																								pass
																								v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																							else:
																								pass
																								v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																							v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																							R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																							v_entity = v_car
																							R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																						else:
																							pass
																							if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarNarrowCrashed")):
																								pass
																								v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																								v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																								R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																								v_entity = v_car
																								R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																							else:
																								pass
																								if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarWide")):
																									pass
																									if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																										pass
																										v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																									else:
																										pass
																										v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																									v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																									R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																									v_entity = v_car
																									R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																								else:
																									pass
																									if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MediumCarWideCrashed")):
																										pass
																										v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_MediumCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																										v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																										R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																										v_entity = v_car
																										R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																									else:
																										pass
																										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_PoliceCarNarrow")):
																											pass
																											if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																												pass
																												v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_PoliceCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																											else:
																												pass
																												v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_PoliceCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																											v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																											R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																											v_entity = v_car
																											R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																										else:
																											pass
																											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_PoliceCarWide")):
																												pass
																												if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																													pass
																													v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_PoliceCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																												else:
																													pass
																													v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_PoliceCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																												v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarMedium")]), R.klass("RDObstacleCarMedium"))
																												R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																												v_entity = v_car
																												R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("MediumCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																											else:
																												pass
																												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Semi")):
																													pass
																													v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SemiClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																													v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCarSemi")]), R.klass("RDObstacleCarSemi"))
																													R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																													v_entity = v_car
																													R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("HugeCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																												else:
																													pass
																													if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarNarrow")):
																														pass
																														if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																															pass
																															v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarNarrowClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																														else:
																															pass
																															v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarNarrowIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																														v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar"))
																														R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																														v_entity = v_car
																														R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("SmallCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																													else:
																														pass
																														if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarNarrowCrashed")):
																															pass
																															v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarNarrowCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																															v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar"))
																															R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																															v_entity = v_car
																															R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("SmallCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																														else:
																															pass
																															if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarWide")):
																																pass
																																if (float(randf()) < float((float(0.1) + float((v_fDifficulty * float(0.7)))))):
																																	pass
																																	v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarWideClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																																else:
																																	pass
																																	v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarWideIntactClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																																v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar"))
																																R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																v_entity = v_car
																																R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("SmallCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																															else:
																																pass
																																if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallCarWideCrashed")):
																																	pass
																																	v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_SmallCarWideCrashedClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																																	v_car = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar"))
																																	R.call_member(v_car, "Init", [(v_carSpawnInfo).fields.get("m_MCClass"), (v_carSpawnInfo).fields.get("m_iMCFrame"), (v_carSpawnInfo).fields.get("m_SoundClass")])
																																	v_entity = v_car
																																	R.call_member(v_car, "SetHP", [R.statics["RDObstacleCar"].get("SmallCarHP"), (R.statics["RDObstacleCar"].get("ExplodeHPFill") if R.truth((R.binary("!=", R.get_value(v_colorTransform, "greenOffset"), 0) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iExplodingCarLevel"))))) else 1)])
																																else:
																																	pass
																																	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MovingCar")):
																																		pass
																																		if R.truth(((float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_AprilsFool"))) and (float(randf()) < float(0.25)))):
																																			pass
																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDDudeBro")])
																																			R.call_member(R.binary("as", v_entity, R.klass("RDDudeBro")), "InitDudeBro", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), ( not v_bFlip))])
																																		else:
																																			pass
																																			v_carSpawnInfo = R.binary("as", R.call_member(R.statics["RDCarSpawnInfos"].get("m_CarMovingClasses"), "GetRandomValue", []), R.klass("RDCarSpawnInfo"))
																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDPassingCar")])
																																			R.call_member(R.binary("as", v_entity, R.klass("RDPassingCar")), "InitPassingCar", [(v_carSpawnInfo).fields.get("m_MCClass"), R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), ( not v_bFlip))])
																																	else:
																																		pass
																																		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Civilian")):
																																			pass
																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDCivilian")])
																																			R.call_member(R.binary("as", v_entity, R.klass("RDCivilian")), "Init", [(float(randf()) > float(0.5))])
																																		else:
																																			pass
																																			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierStationary")):
																																				pass
																																				if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																					pass
																																					v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																					R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																					v_entity = v_zombie
																																				else:
																																					pass
																																					v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																					R.call_member(v_soldier, "Init", [R.statics["RDSoldier"].get("Behavior_ShootPlayer")])
																																					v_entity = v_soldier
																																			else:
																																				pass
																																				if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierAlign")):
																																					pass
																																					if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																						pass
																																						v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																						R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																						v_entity = v_zombie
																																					else:
																																						pass
																																						v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																						R.call_member(v_soldier, "Init", [R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer")])
																																						v_entity = v_soldier
																																				else:
																																					pass
																																					if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierSpikes")):
																																						pass
																																						if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																							pass
																																							v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																							R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																							v_entity = v_zombie
																																						else:
																																							pass
																																							v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																							R.call_member(v_soldier, "Init", [R.statics["RDSoldier"].get("Behavior_PullSpikeStrip")])
																																							v_entity = v_soldier
																																					else:
																																						pass
																																						if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SoldierBomb")):
																																							pass
																																							if R.truth(R.call_member(v_gameplayMode, "IsZombieCheckpoint", [])):
																																								pass
																																								v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																								R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																								v_entity = v_zombie
																																							else:
																																								pass
																																								v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																								R.call_member(v_soldier, "Init", [R.statics["RDSoldier"].get("Behavior_TriggerExplosion")])
																																								v_entity = v_soldier
																																						else:
																																							pass
																																							if R.truth((((R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardPatrol") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemalePatrol")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalPatrol"))):
																																								pass
																																								if ((R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) and (float(randf()) < float(0.5))):
																																									pass
																																									v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																									R.call_member(v_soldier, "Init", [(R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer") if (float(randf()) < float(0.5)) else R.statics["RDSoldier"].get("Behavior_ShootPlayer"))])
																																									v_entity = v_soldier
																																								else:
																																									pass
																																									v_zombieClass = R.call_member(v_gameplayMode, "GetRandomZombieClass", [])
																																									v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie"))
																																									R.call_member(v_zombie, "Init", [R.statics["RDZombie"].get("MovementType_Straight")])
																																									v_entity = v_zombie
																																							else:
																																								pass
																																								if R.truth((((R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardStraight") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewMaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNewFemaleStraight")) or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalStraight"))):
																																									pass
																																									if ((R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) and (float(randf()) < float(0.5))):
																																										pass
																																										v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																										R.call_member(v_soldier, "Init", [(R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer") if (float(randf()) < float(0.5)) else R.statics["RDSoldier"].get("Behavior_ShootPlayer"))])
																																										v_entity = v_soldier
																																									else:
																																										pass
																																										v_zombieClass = R.call_member(v_gameplayMode, "GetRandomZombieClass", [])
																																										v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie"))
																																										R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																										v_entity = v_zombie
																																								else:
																																									pass
																																									if R.truth(((R.constructor_is(v_childMC, "MC_LevelObject_ZombieHardFeed") or R.constructor_is(v_childMC, "MC_LevelObject_ZombieNormalFeed")) or R.constructor_is(v_childMC, "MC_LevelObject_Feeders"))):
																																										pass
																																										if ((R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) and (float(randf()) < float(0.5))):
																																											pass
																																											v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																											R.call_member(v_soldier, "Init", [(R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer") if (float(randf()) < float(0.5)) else R.statics["RDSoldier"].get("Behavior_ShootPlayer"))])
																																											v_entity = v_soldier
																																										else:
																																											pass
																																											v_zombieClass = R.call_member(v_gameplayMode, "GetRandomFeedZombieClass", [])
																																											v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [v_zombieClass]), R.klass("RDZombie"))
																																											R.call_member(v_zombie, "Init", [R.statics["RDZombie"].get("MovementType_Feed")])
																																											v_entity = v_zombie
																																									else:
																																										pass
																																										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierPatrol")):
																																											pass
																																											if ((R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) and (float(randf()) < float(0.5))):
																																												pass
																																												v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																												R.call_member(v_soldier, "Init", [(R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer") if (float(randf()) < float(0.5)) else R.statics["RDSoldier"].get("Behavior_ShootPlayer"))])
																																												v_entity = v_soldier
																																											else:
																																												pass
																																												v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																												R.call_member(v_zombie, "Init", [R.statics["RDZombie"].get("MovementType_Straight")])
																																												v_entity = v_zombie
																																										else:
																																											pass
																																											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ZombieSoldierStraight")):
																																												pass
																																												if ((R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", [])) and R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", []))) and (float(randf()) < float(0.5))):
																																													pass
																																													v_soldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
																																													R.call_member(v_soldier, "Init", [(R.statics["RDSoldier"].get("Behavior_AdjustAndShootPlayer") if (float(randf()) < float(0.5)) else R.statics["RDSoldier"].get("Behavior_ShootPlayer"))])
																																													v_entity = v_soldier
																																												else:
																																													pass
																																													v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieSoldier")]), R.klass("RDZombieSoldier"))
																																													R.call_member(v_zombie, "Init", [(R.statics["RDZombie"].get("MovementType_RescueMode") if R.truth(v_rescueMode) else R.statics["RDZombie"].get("MovementType_Straight"))])
																																													v_entity = v_zombie
																																											else:
																																												pass
																																												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Oil")):
																																													pass
																																													v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDOilSlick")])
																																												else:
																																													pass
																																													if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_RoadKill")):
																																														pass
																																														if ((R.truth((( not R.truth(R.call_member(v_gameplayMode, "ShouldSpawnSoldierForZombie", []))) and (float(v_iLevel) >= float((v_gameplayMode).fields.get("m_iGrubLevel"))))) and R.truth(R.call_member(v_gameplayMode, "CanSpawnGrub", []))) and (float(randf()) < float((float(0.2) + float((v_fDifficulty * float(0.6))))))):
																																															pass
																																															v_zombie = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDZombieGrub")]), R.klass("RDZombieGrub"))
																																															R.call_member(v_zombie, "Init", [R.statics["RDZombie"].get("MovementType_Down")])
																																															v_entity = v_zombie
																																														else:
																																															pass
																																															v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBody")])
																																													else:
																																														pass
																																														if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_RoadBlood")):
																																															pass
																																															v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDBloodSpill")])
																																														else:
																																															pass
																																															if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SandBags")):
																																																pass
																																																v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBags")])
																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleSandBags")), "Init", [v_fDifficulty])
																																															else:
																																																pass
																																																if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SandBagsBloody")):
																																																	pass
																																																	v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSandBagsBloody")])
																																																else:
																																																	pass
																																																	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Bush1")):
																																																		pass
																																																		if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																			pass
																																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																		else:
																																																			pass
																																																			if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																				pass
																																																				if (float(randf()) < float(0.25)):
																																																					pass
																																																					v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																				else:
																																																					pass
																																																					v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush1")])
																																																			else:
																																																				pass
																																																				v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush1")])
																																																	else:
																																																		pass
																																																		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Bush2")):
																																																			pass
																																																			if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																				pass
																																																				v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																			else:
																																																				pass
																																																				if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																					pass
																																																					if (float(randf()) < float(0.25)):
																																																						pass
																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																					else:
																																																						pass
																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush2")])
																																																				else:
																																																					pass
																																																					v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush2")])
																																																		else:
																																																			pass
																																																			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Bush3")):
																																																				pass
																																																				if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																					pass
																																																					v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																				else:
																																																					pass
																																																					if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																						pass
																																																						if (float(randf()) < float(0.25)):
																																																							pass
																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																						else:
																																																							pass
																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush3")])
																																																					else:
																																																						pass
																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBush3")])
																																																			else:
																																																				pass
																																																				if R.truth((R.constructor_is(v_childMC, "MC_LevelObject_MapleTree") or R.constructor_is(v_childMC, "MC_LevelObject_PineTree"))):
																																																					pass
																																																					v_fRandomTree = float(randf())
																																																					if (v_fRandomTree < float(0.56)):
																																																						pass
																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMapleTree")])
																																																						R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMapleTree")), "Init", [(float(randf()) < float(0.5))])
																																																					else:
																																																						pass
																																																						if (v_fRandomTree < float(0.85)):
																																																							pass
																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePineTree")])
																																																						else:
																																																							pass
																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")])
																																																				else:
																																																					pass
																																																					if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_DeadTree")):
																																																						pass
																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDeadTree")])
																																																					else:
																																																						pass
																																																						if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_WeaponCrate")):
																																																							pass
																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWeaponCrate")])
																																																						else:
																																																							pass
																																																							if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Table")):
																																																								pass
																																																								v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTable")])
																																																							else:
																																																								pass
																																																								if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Barracade")):
																																																									pass
																																																									v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBarricade")])
																																																								else:
																																																									pass
																																																									if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Tomb")):
																																																										pass
																																																										v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTomb")])
																																																										R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTomb")), "Init", [])
																																																									else:
																																																										pass
																																																										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_LawnFlamingo")):
																																																											pass
																																																											if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																												pass
																																																												v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																											else:
																																																												pass
																																																												v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFlamingo")])
																																																										else:
																																																											pass
																																																											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_GardenGnome")):
																																																												pass
																																																												if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_ValentinesDay"))):
																																																													pass
																																																													v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnomeValentine")])
																																																												else:
																																																													pass
																																																													if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																														pass
																																																														v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																													else:
																																																														pass
																																																														v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleGnome")])
																																																											else:
																																																												pass
																																																												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_TrafficLight")):
																																																													pass
																																																													v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficLight")])
																																																													R.call_member(R.binary("as", v_entity, R.klass("RDObstacleTrafficLight")), "Init", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), ( not v_bFlip))])
																																																												else:
																																																													pass
																																																													if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_TrashCan")):
																																																														pass
																																																														if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_ValentinesDay"))):
																																																															pass
																																																															v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleValentineTable")])
																																																														else:
																																																															pass
																																																															if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Halloween"))):
																																																																pass
																																																																v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstaclePumpkin")])
																																																															else:
																																																																pass
																																																																v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrashCan")])
																																																													else:
																																																														pass
																																																														if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_MailBox")):
																																																															pass
																																																															v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleMailBox")])
																																																															R.call_member(R.binary("as", v_entity, R.klass("RDObstacleMailBox")), "Init", [R.binary("==", R.binary("<", R.get_value(v_childMC, "x"), 0), ( not v_bFlip))])
																																																														else:
																																																															pass
																																																															if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FireHydrant")):
																																																																pass
																																																																v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")])
																																																																R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [false])
																																																															else:
																																																																pass
																																																																if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_FireHydrantFlowing")):
																																																																	pass
																																																																	v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFireHydrant")])
																																																																	R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "Init", [true])
																																																																else:
																																																																	pass
																																																																	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Dumpster")):
																																																																		pass
																																																																		v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleDumpster")])
																																																																		R.call_member(R.binary("as", v_entity, R.klass("RDObstacleDumpster")), "Init", [R.binary("==", R.binary(">", R.get_value(v_childMC, "x"), 0), ( not v_bFlip))])
																																																																	else:
																																																																		pass
																																																																		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Mine")):
																																																																			pass
																																																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDMine")])
																																																																		else:
																																																																			pass
																																																																			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Fence")):
																																																																				pass
																																																																				v_bCleanClinger = (((R.binary("==", f.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", f.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", f.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", f.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking")))
																																																																				v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleFence")])
																																																																				R.call_member(R.binary("as", v_entity, R.klass("RDObstacleFence")), "Init", [v_bCleanClinger])
																																																																			else:
																																																																				pass
																																																																				if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Spikes")):
																																																																					pass
																																																																					v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDSpikeStrip")])
																																																																				else:
																																																																					pass
																																																																					if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ShoppingCart")):
																																																																						pass
																																																																						v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleShoppingCart")])
																																																																					else:
																																																																						pass
																																																																						if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ElectronicSign")):
																																																																							pass
																																																																							v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleElectronicSign")])
																																																																						else:
																																																																							pass
																																																																							if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_Box")):
																																																																								pass
																																																																								if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																																									pass
																																																																									v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																																								else:
																																																																									pass
																																																																									v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBox")])
																																																																							else:
																																																																								pass
																																																																								if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_TrafficCone")):
																																																																									pass
																																																																									if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																																										pass
																																																																										v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																																									else:
																																																																										pass
																																																																										v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficCone")])
																																																																								else:
																																																																									pass
																																																																									if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_TrafficBarrel")):
																																																																										pass
																																																																										if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_WatermelonDay"))):
																																																																											pass
																																																																											v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWatermelon")])
																																																																										else:
																																																																											pass
																																																																											v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleTrafficBarrel")])
																																																																									else:
																																																																										pass
																																																																										if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ConstructionSign")):
																																																																											pass
																																																																											v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleConstructionSign")])
																																																																										else:
																																																																											pass
																																																																											if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_WaterJug")):
																																																																												pass
																																																																												if R.truth(((float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_SaintPatricksDay"))) or (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_CincoDeMayo"))))):
																																																																													pass
																																																																													v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleBeerKeg")])
																																																																												else:
																																																																													pass
																																																																													if (float((R.statics["RDGame"].get("Instance") as R.Value).fields.get("m_iSpecialDay")) == float(R.statics["RDGame"].get("SpecialDay_Christmas"))):
																																																																														pass
																																																																														v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSnowman")])
																																																																													else:
																																																																														pass
																																																																														v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")])
																																																																											else:
																																																																												pass
																																																																												if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HighwayRamp")):
																																																																													pass
																																																																													v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")])
																																																																													R.call_member(R.binary("as", v_entity, R.klass("RDHighwayRamp")), "Init", [R.klass("MC_HighwayRamp")])
																																																																												else:
																																																																													pass
																																																																													if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HighwayRampExit")):
																																																																														pass
																																																																														v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRamp")])
																																																																														R.call_member(R.binary("as", v_entity, R.klass("RDHighwayRamp")), "Init", [R.klass("MovieClip")])
																																																																													else:
																																																																														pass
																																																																														if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_HighwayExitSign")):
																																																																															pass
																																																																															v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSign")])
																																																																															R.call_member(R.binary("as", v_entity, R.klass("RDRoadSign")), "Init", [(R.klass("MC_highwaysignrampexitflipped") if v_bFlip else R.klass("MC_highwaysignrampexit"))])
																																																																															v_entity2 = R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSignOffRoad")])
																																																																															R.call_member(R.binary("as", v_entity2, R.klass("RDRoadSignOffRoad")), "Init", [R.klass("MC_highwaysignoffroad")])
																																																																															(R.binary("as", v_entity, R.klass("RDRoadSign")) as R.Value).fields["m_OffRoadPart"] = R.binary("as", v_entity2, R.klass("RDRoadSignOffRoad"))
																																																																														else:
																																																																															pass
																																																																															if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_EndChopper")):
																																																																																pass
																																																																																v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopper")])
																																																																															else:
																																																																																pass
																																																																																if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ShoppingMall")):
																																																																																	pass
																																																																																	v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObjectShoppingMall")])
																																																																																else:
																																																																																	pass
																																																																																	if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_SmallHillTop")):
																																																																																		pass
																																																																																		v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleSmallHillTop")])
																																																																																	else:
																																																																																		pass
																																																																																		if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_GrassTop")):
																																																																																			pass
																																																																																			v_entity = R.call_static("RDGame", "GetEntity", [R.klass("RDGrassTop")])
																																																																																		else:
																																																																																			pass
																																																																																			if R.truth(R.constructor_is(v_childMC, "MC_LevelObject_ChopperSpot")):
																																																																																				pass
																																																																																				if R.truth(v_rescueMode):
																																																																																					pass
																																																																																					(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosX"] = float((float(R.binary("/", R.get_value(v_childMC, "x"), 50)) * R.num(((-1) if v_bFlip else 1))))
																																																																																					(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosZ"] = float((float(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)])) * v_fStretch))
																																																																																					R.call_member(v_rescueMode, "SetChopperSpot", [R.binary("+", (f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [(v_fStartPosition + float((f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosZ")))])), R.call_static("RDWorld", "GetPerlinY", [(v_fStartPosition + float((f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosZ")))]), (v_fStartPosition + float((f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosZ")))])
	if R.truth(v_entity):
		pass
		v_fMCPosY = float(minf(R.num(R.get_value(v_childMC, "y")), R.num((-0.1))))
		v_fObjectPosX = float((float(R.binary("/", R.get_value(v_childMC, "x"), 50)) * R.num(((-1) if v_bFlip else 1))))
		v_fObjectPosZ = float((float(R.binary("/", R.unary("-", v_fMCPosY), 50)) * v_fStretch))
		(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosX"] = v_fObjectPosX
		(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosZ"] = v_fObjectPosZ
		((v_entity).fields.get("m_vLocation") as R.Value).fields["Z"] = float((v_fStartPosition + float((f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosZ"))))
		((v_entity).fields.get("m_vLocation") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")])))
		((v_entity).fields.get("m_vLocation") as R.Value).fields["Y"] = R.num(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")]))
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation") as R.Value).fields.get("X"), ((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Y"), ((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")])
		if R.truth(v_entity2):
			pass
			((v_entity2).fields.get("m_vLocation") as R.Value).fields["Z"] = float((v_fStartPosition + float((f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosZ"))))
			((v_entity2).fields.get("m_vLocation") as R.Value).fields["X"] = R.num(R.binary("+", (f.get("m_SpawnInfo") as R.Value).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity2).fields.get("m_vLocation") as R.Value).fields.get("Z")])))
			((v_entity2).fields.get("m_vLocation") as R.Value).fields["Y"] = R.num(R.call_static("RDWorld", "GetPerlinY", [((v_entity2).fields.get("m_vLocation") as R.Value).fields.get("Z")]))
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity2, ((v_entity2).fields.get("m_vLocation") as R.Value).fields.get("X"), ((v_entity2).fields.get("m_vLocation") as R.Value).fields.get("Y"), ((v_entity2).fields.get("m_vLocation") as R.Value).fields.get("Z")])
	else:
		pass
		(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosX"] = float(0)
		(f.get("m_SpawnInfo") as R.Value).fields["m_fObjectPosZ"] = float((float(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.unary("-", R.get_value(v_childMC, "y")), 50)])) * v_fStretch))
	if ((R.truth(R.call_member(v_gameplayMode, "CanSpawnMilitary", [])) and R.truth((R.binary("!=", R.get_value(v_colorTransform, "redOffset"), 0) or R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0)))) and R.truth(((float(v_iLevel) > float((v_gameplayMode).fields.get("m_iHiddenSoldierLevel"))) or ((float(v_iLevel) == float((v_gameplayMode).fields.get("m_iHiddenSoldierLevel"))) and ( not R.truth(R.call_member(v_gameplayMode, "HasActiveStoryDialog", []))))))):
		pass
		v_hiddenSoldier = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier"))
		R.call_member(v_hiddenSoldier, "Init", [R.statics["RDSoldier"].get("Behavior_SliderOutAndShoot")])
		(v_hiddenSoldier).fields["m_bFlippedX"] = R.truth((R.binary("!=", R.get_value(v_colorTransform, "blueOffset"), 0) if v_bFlip else R.binary("!=", R.get_value(v_colorTransform, "redOffset"), 0)))
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_hiddenSoldier, R.binary("+", R.binary("+", (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds") as R.Value).fields.get("X"))), (R.unary("-", R.statics["RDSoldier"].get("SlideOutHideOffset")) if R.truth((v_hiddenSoldier).fields.get("m_bFlippedX")) else (float(((v_entity).fields.get("m_CollisionBounds") as R.Value).fields.get("W")) + float(R.statics["RDSoldier"].get("SlideOutHideOffset"))))), R.call_static("RDWorld", "GetPerlinX", [(float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(0.1))])), R.call_static("RDWorld", "GetPerlinY", [(float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(0.1))]), (float(((v_entity).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(0.1))])
	return f.get("m_SpawnInfo")
	return null





static func basic_constructor(c: R.Value, a: Array) -> Variant:

	if R.classes.has("Object") or R.classes.has("EventDispatcher") or R.base_of("BasicObject") not in ["Object", "EventDispatcher"] or c.fields.has("toString") or R.field_owner(c.class_id, "toString") != "" or R.method_owner(c.class_id, "toString") != "": return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var to_string: Variant = R.resolve(c, "toString", "BasicObject")
	if not to_string is Dictionary or to_string.get("@native") != "toString" or to_string.get("receiver") != c: return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var counts: Variant = R.static_value("BasicObject", "GObjectClassCount")
	if not counts is Dictionary or counts.has("@class"): return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var name: String = R.string(c)
	if R.equal(counts.get(name), null): counts[name] = 0
	c.fields["m_szName"] = R.coerce(R.binary("+", name + "_", counts.get(name)), "String")
	counts[name] = R.binary("+", counts.get(name), 1)
	c.fields["m_properties"] = []
	R.call_member(c, "RegisterProperties", [])
	return null

static func sound_constructor(c: R.Value, a: Array) -> Variant:
	var sound_class: Variant = R.coerce(R.arg(a, 0), "Class")
	var sound_group: Variant = R.coerce(R.arg(a, 1), "DTSoundGroup")
	var handle_pitch: bool = R.truth(R.arg(a, 2, false))
	R.invoke(R.super_ref(c, "DTSound"), [])
	c.fields["m_fVolume"] = 0.0;c.fields["m_fMaxVolume"] = 1.0;c.fields["m_fPan"] = 0.0
	c.fields["m_bLooping"] = false;c.fields["m_SoundClass"] = sound_class
	if handle_pitch:
		c.fields["m_TargetBytes"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
		c.fields["m_fPosition"] = 0.0;c.fields["m_fRate"] = 1.0
		c.fields["m_PitchSound"] = R.coerce(R.construct(c.fields.get("m_SoundClass"), []), "Sound")
		c.fields["m_Sound"] = R.coerce(R.construct(R.klass("Sound"), []), "Sound")
		R.invoke(R.get_value(c.fields.get("m_Sound"), "addEventListener"), [R.get_value(R.resolve(c, "SampleDataEvent", "DTSound"), "SAMPLE_DATA"), R.get_value(c, "OnSamplePitchData")])
	else:
		c.fields["m_Sound"] = R.coerce(R.construct(c.fields.get("m_SoundClass"), []), "Sound")

	c.fields["m_SoundGroup"] = sound_group;c.fields["m_SoundCompleteCallback"] = null
	c.fields["m_bFading"] = false;c.fields["m_fFadeVolumeStart"] = 0.0;c.fields["m_fFadeVolumeEnd"] = 0.0
	c.fields["m_fFadeDuration"] = 0.0;c.fields["m_fFadeTimer"] = 0.0;c.fields["m_fDataVolume"] = 0.0
	return null

static func spatial_constructor(c: R.Value, a: Array) -> Variant:
	var sound_class: Variant = R.coerce(R.arg(a, 0), "Class")
	var volume_falloff: float = R.num(R.arg(a, 1, NAN))
	var volume_max: float = R.num(R.arg(a, 2, NAN))
	var pan_falloff: float = R.num(R.arg(a, 3, NAN))
	var pan_max: float = R.num(R.arg(a, 4, NAN))
	var sound_group: Variant = R.coerce(R.arg(a, 5), "DTSoundGroup")
	var handle_pitch: bool = R.truth(R.arg(a, 6, false))
	R.invoke(R.super_ref(c, "DTSpacialSound"), [sound_class, sound_group, handle_pitch])
	c.fields["m_fVolumeFallOffDistance"] = volume_falloff;c.fields["m_fVolumeMaxDistance"] = volume_max
	c.fields["m_fPanFallOffDistance"] = pan_falloff;c.fields["m_fPanMaxDistance"] = pan_max
	return null

static func hat_constructor(c: R.Value, a: Array) -> Variant:
	var auto_refills: bool = R.truth(R.arg(a, 0, true))
	R.invoke(R.super_ref(c, "RandomHat"), [])
	c.fields.m_bAutoRefills = auto_refills;c.fields.m_Values = [];c.fields.m_HatValues = []
	return null

static func sequence_constructor(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SequentialArray"), [])
	c.fields.m_Values = [];c.fields.m_iIndex = 0
	return null

static func hat_clear(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "Clear", a)
	(c.fields.m_Values as Array).clear();(c.fields.m_HatValues as Array).clear()
	return null

static func hat_add(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "RandomHat", "AddValue", a)
	(c.fields.m_Values as Array).append(R.arg(a, 0))
	return null

static func hat_reset(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "Reset", a)
	var hat: Array = c.fields.m_HatValues;hat.clear()
	if not (c.fields.m_Values as Array).is_empty(): hat.append_array(c.fields.m_Values)
	return null

static func hat_get(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "GetRandomValue", a)
	var hat: Array = c.fields.m_HatValues
	if hat.is_empty():
		if not R.truth(c.fields.m_bAutoRefills): return null
		if not (c.fields.m_Values as Array).is_empty(): hat.append_array(c.fields.m_Values)

	var index: int = R.signed32(floorf(randf() * hat.size()))
	if index < 0 or index >= hat.size(): return null
	var value: Variant = hat[index];hat.remove_at(index)
	return value

static func hat_empty(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "IsEmpty", a)
	return (c.fields.m_HatValues as Array).is_empty()

static func hat_size(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "RandomHat", "GetTotalNbValues", a)
	return (c.fields.m_Values as Array).size()

static func sequence_add(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "AddValue", a)
	(c.fields.m_Values as Array).append(R.arg(a, 0))
	return null

static func sequence_get(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "GetValue", a)
	if R.equal(c.fields.m_iIndex, (c.fields.m_Values as Array).size()): c.fields.m_iIndex = 0

	var values: Array = c.fields.m_Values
	var index: Variant = R.binary("-", R.set_value(c, "m_iIndex", 1, "+="), 1)
	return R.get_value(values, index)

static func sequence_size(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "GetNbValues", a)
	return (c.fields.m_Values as Array).size()


static func entity_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDEntity"), [])
	c.fields.m_iEntityIndex = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	c.fields.m_fScale = scale
	c.fields.m_ConstructorMCClass = clip_class
	if R.truth(c.fields.get("m_ConstructorMCClass")): R.call_member(c, "InitMCs", [c.fields.get("m_ConstructorMCClass")])
	c.fields.m_CollisionBounds = R.construct(R.klass("Box"), [])
	c.fields.m_iCollisionGroup = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	c.fields.m_vLocation = R.construct(R.klass("DTVector3D"), [])
	c.fields.m_vVelocity = R.construct(R.klass("DTVector3D"), [])
	c.fields.m_iLayer = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	c.fields.merge({"m_fBackSoundDistanceMultiplier": 2.0, "m_fMinRenderScale": 0.0, "m_fFadeDistance": 100.0, "m_fFadeRange": 50.0, "m_fHitDamage": 0.0, "m_fMinHitHP": 0.0, "m_fHitSpeedLoss": 0.0, "m_fHitShakeIntensity": 0.015, "m_fHitShakeDuration": 0.3}, true)
	c.fields.m_iLocationType = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
	c.fields.merge({"m_fBulletHitEffectScaleMin": 0.5, "m_fBulletHitEffectScaleMax": 1.0, "m_fMaxBulletHitEffectRotation": 0.0}, true)
	return null

static func entity_reset(c: R.Value, _a: Array) -> Variant:
	c.fields.m_iEntityIndex = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	if R.truth(c.fields.get("m_ConstructorMCClass")): R.call_member(c, "InitMCs", [c.fields.get("m_ConstructorMCClass")])
	c.fields.merge({"m_Properties": null, "m_PropertiesHash": null, "m_bEditorMode": false, "m_szAnim": ""}, true)
	R.call_member(c.fields.get("m_vLocation"), "SetZero", [])
	R.call_member(c.fields.get("m_vVelocity"), "SetZero", [])
	c.fields.merge({"m_bDestroyMe": false, "m_bFlippedX": false, "m_bLocationUsed": false}, true)
	R.call_member(c.fields.get("m_vMoveDir"), "SetZero", [])
	if not R.truth(c.fields.get("m_bHasCustomDepthPosition")): c.fields.m_fDepthPosition = 9999999999.0
	c.fields.merge({"m_iLastFinalNodeStep": -1, "m_iLastTestStep": -1, "m_iLastStartStep": -1, "m_bUseCurvyCamera": true, "m_bUnlockSurvivalGuide": true}, true)
	return null

static func obstacle_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDObstacle"), [clip_class, scale])
	c.fields.m_fMinRenderScale = 0.003
	if R.truth(c.fields.get("m_MC")): R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	c.fields.m_iCollisionGroup = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	(c.fields.get("m_CollisionBounds") as R.Value).fields.merge({"X": -0.5, "W": 1.0, "Y": 0.0, "H": 1.0, "Z": -0.5}, true)
	c.fields.merge({"m_bFlipOnCollision": true, "m_bCanBeRunThrough": false, "m_bDoHitAnim": true, "m_bCanBeHitByExplosion": true, "m_fMinHitHP": 1.0, "m_fFadeDistance": 50.0, "m_fFadeRange": 10.0, "m_bCanBeHitByBullet": true, "m_iPropertyValue": 5}, true)
	return null

static func obstacle_reset(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "SetInitialState"), [])
	c.fields.merge({"m_fHP": -1.0, "m_bHit": false, "m_bCanBeDestroyed": false, "m_ExplodeInstigator": null, "m_LastDamageInstigator": null}, true)
	return null

static func voiced_entity_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDEntityWithVoice"), [clip_class, scale])
	c.fields.m_iVoicePriority = -1
	return null

static func voiced_entity_reset(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEntityWithVoice"), "SetInitialState"), [])
	c.fields.m_iVoicePriority = -1
	return null

static func RDWorld_UpdateNavMesh(c: R.Value, a: Array) -> Variant:

	R.ensure_statics("RDWorld")
	var f: Dictionary = c.fields; var settings: Dictionary = R.statics.RDWorld
	var camera: R.Value = a[0]; var position: float = camera.fields.m_vLocation.fields.Z
	f.m_fCameraNavMeshPos = position if position > 0.0 else 0.0
	var step: int = R.signed32(floorf(R.divide_number(f.m_fCameraNavMeshPos, settings.NavMeshStepSize)))
	var nodes: float = settings.NavMeshNodes
	while step > f.m_iCurrentNavMeshStep:
		f.m_iCurrentNavMeshStep = R.signed32(f.m_iCurrentNavMeshStep + 1)
		var mesh: Array = f.m_NavMesh; var row: Array = mesh[0]
		var i: int = 0
		while i < nodes:
			if i >= row.size(): row.resize(i + 1)
			row[i] = false;i += 1
		mesh.remove_at(0);mesh.append(row)
	return null

static func RDDriverArmMale_UpdateBlood(c: R.Value, _a: Array) -> Variant:
	return update_driver_blood(c, "m_fMaleArmBloodLevel")

static func RDDriverArmFemale_UpdateBlood(c: R.Value, _a: Array) -> Variant:
	return update_driver_blood(c, "m_fFemaleArmBloodLevel")

static func update_driver_blood(c: R.Value, key: String) -> Variant:
	R.ensure_statics("RDGame")
	var game: R.Value = R.statics.RDGame.get("Instance")
	if game == null: return null
	var mode: R.Value = game.fields.get("m_CurrentGameMode")
	if mode == null: return null
	var player: R.Value = mode.fields.get("m_Player")
	if player == null: return null
	var blood: float = player.fields[key]
	R.set_value(c.fields.Blood1, "alpha", 0.0 if blood > 66.0 else 1.0 if blood > 33.0 else blood / 33.0)
	R.set_value(c.fields.Blood2, "alpha", 1.0 if blood > 66.0 else (blood - 33.0) / 33.0 if blood > 33.0 else 0.0)
	R.set_value(c.fields.Blood3, "alpha", (blood - 66.0) / 33.0 if blood > 66.0 else 0.0)
	return null

static func RDGame_Start(c: R.Value, _a: Array) -> Variant:

	c.fields.m_PlayerInfo.fields.m_bSeenStorageNotice = true
	R.call_member(c, "SavePlayerInfo", [])
	c.fields.m_fWaitingForAPITimer = 0.0
	R.call_member(c, "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
	return null

static func RDGame_StartCinematic(c: R.Value, a: Array) -> Variant:
	var enabled: bool = not OS.get_cmdline_user_args().has("--no-presentation-interpolation")

	var root_clip: R.Value = c.fields.m_RootMC
	if root_clip != null: root_clip.fields["@presentation_motion"] = enabled
	R.implementation_source(c, "RDGame", "StartCinematic", a)
	if enabled and root_clip != null:
		for child: R.Value in root_clip.children: R.presentation_scope(child, true)
	return null

static func RDGame_ClearCinematic(c: R.Value, a: Array) -> Variant:
	if c.fields.m_RootMC != null: R.presentation_scope(c.fields.m_RootMC, false)
	R.implementation_source(c, "RDGame", "ClearCinematic", a)
	R.release_presentation_textures()
	return null

static func RDGameModeDriverSelection_BeginGameMode(c: R.Value, a: Array) -> Variant:
	R.implementation_source(c, "RDGameModeDriverSelection", "BeginGameMode", a)
	if not OS.get_cmdline_user_args().has("--no-presentation-interpolation"): R.presentation_scope(c.fields.m_MC, true)
	return null

static func RDGameModeDriverSelection_EndGameMode(c: R.Value, a: Array) -> Variant:
	if c.fields.m_MC != null: R.presentation_scope(c.fields.m_MC, false)
	R.implementation_source(c, "RDGameModeDriverSelection", "EndGameMode", a)
	R.release_presentation_textures()
	return null

static func RDZombie_StartCling(c: R.Value, a: Array) -> Variant:
	R.implementation_source(c, "RDZombie", "StartCling", a)
	if c.fields.get("m_bDestroyMe", false): return null

	if not c.fields.has("@fan_hood_delay"):
		c.fields["@fan_hood_delay"] = float(c.fields.m_fClingPunchDelay)
	c.fields.m_fClingPunchDelay = float(c.fields["@fan_hood_delay"]) * 1.6
	return null

static func RDWeapon_OnEquip(c: R.Value, a: Array) -> Variant:
	R.implementation_source(c, "RDWeapon", "OnEquip", a)
	var clip: R.Value = c.fields.m_GunMC
	if clip != null: clip.fields["@fan_fire_timing"] = true
	if not c.fields.has("@fan_fire_delay"):
		c.fields["@fan_fire_delay"] = true
		c.fields.m_fFireDelayMin = float(c.fields.m_fFireDelayMin) * 4.0 / 3.0
		c.fields.m_fFireDelayMax = float(c.fields.m_fFireDelayMax) * 4.0 / 3.0
	return null

static func RDHud_UpdateAiming(c: R.Value, a: Array) -> Variant:
	R.ensure_statics("RDHud")
	R.ensure_statics("RDWeapon")
	var hud: R.Value = c.fields.m_HudMC
	var target: R.Value = R.get_value(hud, "TargetCrosshair")
	var actual: R.Value = R.get_value(hud, "ActualCrosshair")
	if target != null: target.display.visible = false
	if actual == null: return null
	var player: R.Value = c.fields.get("m_Player")
	var eligible: bool = player != null and not player.fields.m_bFailed and not player.fields.m_bInEnding and player.fields.m_Weapon != null
	if eligible:
		eligible = R.num(R.get_value(c.fields.m_Game.fields.m_RootMC, "mouseY")) <= R.num(R.statics.RDHud.OptionsMenuPosY)
	actual.display.visible = eligible and not player.fields.m_bGunDown
	if not eligible: return null


	if not actual.fields.get("@fan_crosshair", false):
		actual.fields["@fan_crosshair"] = true
		actual.playing = false;R.refresh_active_clip(actual)
		for child: R.Value in actual.children: child.display.visible = false
	if target != null: target.display.position = Vector2(player.fields.m_fTargetAimingX, player.fields.m_fTargetAimingY)
	actual.display.position = Vector2(player.fields.m_fAimingX, player.fields.m_fAimingY)
	actual.display.scale = Vector2.ONE
	var gap: float = 3.0 + clampf(R.num(R.call_member(player.fields.m_Weapon, "GetBulletSpread", [])) / R.num(R.statics.RDWeapon.MaxBulletSpread), 0, 1) * 12.0
	if actual.fields.get("@fan_crosshair_gap", -1.0) != gap:
		actual.fields["@fan_crosshair_gap"] = gap
		actual.display.queue_redraw()
	return null
