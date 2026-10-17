extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSoldier(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSoldier"), [R.klass("MC_Soldier"), R.static_value("RDSpawnType", "Soldier"), R.static_value("RDSoldier", "Scale")])
	(c).fields["m_SuppressZone"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MC_SoldierSuppressZone")]), "MovieClip")
	R.set_value((c).fields.get("m_SuppressZone"), "alpha", 0, "=")
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_SuppressZone")])
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_Soldier"), "int")
	(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_None"), "int")
	(c).fields["m_fClingFireTimer"] = float(0)
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_MachineGunFireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierMachineGunFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsMilitaryGun")]), "DTSpacialSound")
	R.call_member((c).fields.get("m_MachineGunFireSound"), "SetMaxVolume", [0.9])
	(c).fields["m_PistolFireSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPistolFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsMilitaryGun")]), "DTSpacialSound")
	(c).fields["m_HeadshotHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HeadshotHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_GibHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_GibHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_bInitBehavior"] = true
	(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = (float(randf()) < float(0.25))
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_fClingHP"] = float(30)
	c.fields["m_fBodyHP"] = float(10)
	c.fields["m_fHeadHP"] = float(10)
	(c).fields["m_BlockedHeadHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	(c).fields["m_BlockedHeadHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	c.fields["m_fClingChanceMultiplier"] = float(0.6)
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	var v_game: Variant = null
	v_game = R.coerce(R.static_value("RDGame", "Instance"), "RDGame")
	R.assign(c, "m_HitSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie01"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie02"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie03"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie04"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_BulletMissSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss01"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss02"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss03"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss04"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss05"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss06"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss07"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss08"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_BulletHitCarsSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit01"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit02"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit03"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit04"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit05"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit06"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit07"), (v_game).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_Male1GruntSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierHardGrunt10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1GetOnHoodSounds", "RDSoldier", R.static_value("RDSoldier", "m_Male1GruntSounds"), "=")
	R.assign(c, "m_Male1ThreatSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierThreat08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1CollisionSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierLightGrunt08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1GetOffSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SoldierGetOff06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1StationaryCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1StationaryCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachStationarySoldier02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1StationaryCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachStationarySoldier04"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1AlignAndShootCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1AlignAndShootCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachAlignSoldier01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1AlignAndShootCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachAlignSoldier04"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1HiddenCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1HiddenCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachHiddenSoldier02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1HiddenCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachHiddenSoldier04"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1SpikesCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1SpikesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachSpikeSoldier02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1SpikesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachSpikeSoldier04"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male1ExplosivesCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male1ExplosivesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachBombSoldier02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male1ExplosivesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachBombSoldier04"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2GruntSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GruntSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierHardGrunt06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2GetOnHoodSounds", "RDSoldier", R.static_value("RDSoldier", "m_Male2GruntSounds"), "=")
	R.assign(c, "m_Male2ThreatSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat09"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierThreat10"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2CollisionSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt05"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt06"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt07"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierLightGrunt08"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2GetOffSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierGetOff01"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierGetOff02"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierGetOff03"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JohnSoldierGetOff04"), (v_game).fields.get("m_GameSFXSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2StationaryCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2StationaryCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachStationarySoldier01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2StationaryCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachStationarySoldier03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2StationaryCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachStationarySoldier05"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2AlignAndShootCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2AlignAndShootCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachAlignSoldier02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2AlignAndShootCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachAlignSoldier03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2HiddenCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2HiddenCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachHiddenSoldier01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2HiddenCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachHiddenSoldier03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2SpikesCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2SpikesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachSpikeSoldier01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2SpikesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachSpikeSoldier03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "m_Male2ExplosivesCueSounds", "RDSoldier", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDSoldier", "m_Male2ExplosivesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachBombSoldier01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDSoldier", "m_Male2ExplosivesCueSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ApproachBombSoldier03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "SetInitialState"), [])
	(c).fields["m_SuppressZone"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MC_SoldierSuppressZone")]), "MovieClip")
	R.set_value((c).fields.get("m_SuppressZone"), "alpha", 0, "=")
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_SuppressZone")])
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Spikes"] = R.coerce(null, "RDSpikeStrip")
	(c).fields["m_bSlideRight"] = false
	(c).fields["m_bAdjusted"] = false
	(c).fields["m_bAdjusting"] = false
	(c).fields["m_bDonateExplosiveRight"] = false
	(c).fields["m_bHasCorrectedAim"] = false
	(c).fields["m_bInitBehavior"] = false
	(c).fields["m_bSpawnGoLeft"] = false
	(c).fields["m_bHasGunOut"] = false
	(c).fields["m_fIsFiringTimer"] = float(0)
	(c).fields["m_fIsFiringDuration"] = float(0)
	(c).fields["m_bIsFiring"] = false
	(c).fields["m_fSuppressValue"] = float(0)
	(c).fields["m_fSlideOutTimer"] = float(0)
	(c).fields["m_fSlideOutDelay"] = float(0)
	(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_bCanBeHitForBlood"] = false
	(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	(c).fields["m_bHitForBlood"] = false
	(c).fields["m_fDissapearTimer"] = float(0)
	(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_None"), "int")
	(c).fields["m_fClingFireTimer"] = float(0)
	(c).fields["m_fFireBulletTimer"] = float(0)
	(c).fields["m_bInitBehavior"] = true
	(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = (float(randf()) < float(0.25))
	c.fields["m_fClingHP"] = float(30)
	c.fields["m_fBodyHP"] = float(10)
	c.fields["m_fHeadHP"] = float(10)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bIsVoice2: Variant = false
	var v_iBehavior: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bIsVoice2 = false
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iBehavior"] = R.coerce(v_iBehavior, "int")
	if R.truth((((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer"))) or (float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))) or (float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot"))))):
		pass
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_EnemySoldiers"), "int")
	else:
		pass
		if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
			pass
			c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_SpikeSoldiers"), "int")
		else:
			pass
			if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
				pass
				c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_BombSquad"), "int")
	if R.truth((c).fields.get("m_bGiveCue")):
		pass
		if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			v_bIsVoice2 = R.static_value("RDSoldier", "m_bShootPlayerVoiceMale2")
			R.assign(c, "m_bShootPlayerVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bShootPlayerVoiceMale2")), "=")
		else:
			pass
			if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				v_bIsVoice2 = R.static_value("RDSoldier", "m_bAdjustAndShootPlayerVoiceMale2")
				R.assign(c, "m_bAdjustAndShootPlayerVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bAdjustAndShootPlayerVoiceMale2")), "=")
			else:
				pass
				if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
					pass
					v_bIsVoice2 = R.static_value("RDSoldier", "m_bSliderOutAndShootVoiceMale2")
					R.assign(c, "m_bSliderOutAndShootVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bSliderOutAndShootVoiceMale2")), "=")
				else:
					pass
					if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
						pass
						v_bIsVoice2 = R.static_value("RDSoldier", "m_bPullSpikeStripVoiceMale2")
						R.assign(c, "m_bPullSpikeStripVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bPullSpikeStripVoiceMale2")), "=")
					else:
						pass
						if R.truth((float(v_iBehavior) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
							pass
							v_bIsVoice2 = R.static_value("RDSoldier", "m_bTriggerExplosionVoiceMale2")
							R.assign(c, "m_bTriggerExplosionVoiceMale2", "RDSoldier", R.unary("!", R.static_value("RDSoldier", "m_bTriggerExplosionVoiceMale2")), "=")
	else:
		pass
		v_bIsVoice2 = (float(randf()) < float(0.5))
	if R.truth(v_bIsVoice2):
		pass
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GruntSounds"), "RandomHat")
		(c).fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GetOnHoodSounds"), "RandomHat")
		(c).fields["m_ThreatSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2ThreatSounds"), "RandomHat")
		(c).fields["m_CollisionSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2CollisionSounds"), "RandomHat")
		(c).fields["m_GetOffSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2GetOffSounds"), "RandomHat")
		(c).fields["m_StationaryCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2StationaryCueSounds"), "RandomHat")
		(c).fields["m_AlignAndShootCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2AlignAndShootCueSounds"), "RandomHat")
		(c).fields["m_HiddenCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2HiddenCueSounds"), "RandomHat")
		(c).fields["m_SpikesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2SpikesCueSounds"), "RandomHat")
		(c).fields["m_ExplosivesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male2ExplosivesCueSounds"), "RandomHat")
	else:
		pass
		(c).fields["m_GruntSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GruntSounds"), "RandomHat")
		(c).fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GetOnHoodSounds"), "RandomHat")
		(c).fields["m_ThreatSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1ThreatSounds"), "RandomHat")
		(c).fields["m_CollisionSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1CollisionSounds"), "RandomHat")
		(c).fields["m_GetOffSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1GetOffSounds"), "RandomHat")
		(c).fields["m_StationaryCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1StationaryCueSounds"), "RandomHat")
		(c).fields["m_AlignAndShootCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1AlignAndShootCueSounds"), "RandomHat")
		(c).fields["m_HiddenCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1HiddenCueSounds"), "RandomHat")
		(c).fields["m_SpikesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1SpikesCueSounds"), "RandomHat")
		(c).fields["m_ExplosivesCueSounds"] = R.coerce(R.static_value("RDSoldier", "m_Male1ExplosivesCueSounds"), "RandomHat")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_cueSounds: Variant = null
	var v_cueSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_cueSounds = R.coerce(null, "RandomHat")
	v_cueSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["Run"])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["EditorSpikes"])
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["EditorBombs"])
		return null
	if R.truth((c).fields.get("m_bGiveCue")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			v_cueSounds = R.coerce((c).fields.get("m_StationaryCueSounds"), "RandomHat")
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				v_cueSounds = R.coerce((c).fields.get("m_AlignAndShootCueSounds"), "RandomHat")
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
					pass
					v_cueSounds = R.coerce((c).fields.get("m_HiddenCueSounds"), "RandomHat")
				else:
					pass
					if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
						pass
						v_cueSounds = R.coerce((c).fields.get("m_SpikesCueSounds"), "RandomHat")
					else:
						pass
						if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
							pass
							v_cueSounds = R.coerce((c).fields.get("m_ExplosivesCueSounds"), "RandomHat")
		if R.truth(v_cueSounds):
			pass
			v_cueSound = R.coerce(R.binary("as", R.call_member(v_cueSounds, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_cueSound])
		(c).fields["m_bGiveCue"] = false
	if R.truth((c).fields.get("m_bHitFinished")):
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasSoundPlaying", []))):
			pass
			(c).fields["m_fDissapearTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDissapearTimer"), v_fDeltaTime), "Number")
			if R.truth(((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Shot"))) or (float((c).fields.get("m_fDissapearTimer")) > float(10)))):
				pass
				c.fields["m_bDestroyMe"] = true
		return null
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.call_member(c, "UpdateClingState", [v_fDeltaTime])
	else:
		pass
		R.call_member(c, "UpdateState", [v_fDeltaTime])
	return null

static func f_UpdateState(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	var v_fDistance: Variant = NAN
	var v_fLimit: Variant = NAN
	var v_bPull: Variant = false
	var v_iPlayerLane: Variant = 0
	var v_fDamage: Variant = NAN
	var v_bHitPlayer: Variant = false
	var v_hitEntity: Variant = null
	var v_bulletHitCarSound: Variant = null
	var v_bulletMissSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeedRatio = float(NAN)
	v_fDistance = float(NAN)
	v_fLimit = float(NAN)
	v_bPull = false
	v_iPlayerLane = R.coerce(0, "int")
	v_fDamage = float(NAN)
	v_bHitPlayer = false
	v_hitEntity = R.coerce(null, "RDEntity")
	v_bulletHitCarSound = R.coerce(null, "DTSpacialSound")
	v_bulletMissSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (c).fields.get("m_bExploded"))):
		pass
		return null
	if R.truth((c).fields.get("m_bInitBehavior")):
		pass
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion")))):
			pass
			R.call_member(c, "SetupExplosives", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				R.call_member(c, "SetupSpikes", [])
		(c).fields["m_bInitBehavior"] = false
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Hidden"), "int")
		else:
			pass
			if R.truth(((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip"))) or (float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion"))))):
				pass
				(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStripIdle"), "int")
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_Spawning")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Spawning"), "int")
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
	if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle")))):
		pass
		if R.truth((((float((c.fields.get("m_vLocation")).fields.get("Z")) >= float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))):
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
				pass
				v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
				if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "FireDistance")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_IdleToFire"), "int")
					R.call_member(c, "UpdateAnimation", [true])
			else:
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
					pass
					if R.truth(R.unary("!", (c).fields.get("m_bAdjusting"))):
						pass
						v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
						if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "AdjustDistance")))):
							pass
							v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
							(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(5))) + float((float(randf()) * float(5)))), R.unary("-", v_fLimit), v_fLimit]), "Number")
							(c).fields["m_bAdjusting"] = true
	else:
		pass
		if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Hidden")))):
			pass
			v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
			v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
			if R.truth((float(v_fDistance) < float(maxf(float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "SlideOutDistance")))), float(10))))):
				pass
				(c).fields["m_fSlideOutTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSlideOutTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fSlideOutTimer")) >= float((c).fields.get("m_fSlideOutDelay")))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideOut"), "int")
					R.call_member(c, "UpdateAnimation", [true])
		else:
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStripIdle")))):
				pass
				if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
					pass
					v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
					v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
					if R.truth((float(v_fDistance) < float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "PullSpikesDistance")))))):
						pass
						v_bPull = false
						v_iPlayerLane = R.coerce(R.call_static("RDRoad", "GetLaneFromXPos", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])))]), "int")
						if R.truth((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) == float(v_iPlayerLane))):
							pass
							v_bPull = (float(randf()) < float(0.25))
						else:
							pass
							v_bPull = (float(randf()) < float(0.75))
						if R.truth(v_bPull):
							pass
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStrip"), "int")
							R.call_member(c, "UpdateAnimation", [true])
				else:
					pass
					v_fSpeedRatio = float(R.binary("/", (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"), ((c).fields.get("m_Player")).fields.get("m_fMaxSpeed")))
					v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
					if R.truth((float(v_fDistance) < float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "TriggerExplosionDistance")))))):
						pass
						(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_PullSpikeStrip"), "int")
						R.call_member(c, "UpdateAnimation", [true])
			else:
				pass
				if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire"))))):
					pass
					if R.truth((((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))) or ((c).fields.get("m_Player")).fields.get("m_bFailed")) or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
						pass
						(c).fields["m_bIsFiring"] = false
						R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
						R.call_member(c, "UpdateAnimation", [true])
					else:
						pass
						(c).fields["m_fIsFiringTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fIsFiringTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fIsFiringTimer")) > float((c).fields.get("m_fIsFiringDuration")))):
							pass
							(c).fields["m_bIsFiring"] = R.unary("!", (c).fields.get("m_bIsFiring"))
							(c).fields["m_fIsFiringTimer"] = float(0)
							(c).fields["m_fIsFiringDuration"] = R.coerce(((float(R.static_value("RDSoldier", "FiringDurationMin")) + float((float(randf()) * float((float(R.static_value("RDSoldier", "FiringDurationMax")) - float(R.static_value("RDSoldier", "FiringDurationMin"))))))) if R.truth((c).fields.get("m_bIsFiring")) else (float(R.static_value("RDSoldier", "NotFiringDurationMin")) + float((float(randf()) * float((float(R.static_value("RDSoldier", "NotFiringDurationMax")) - float(R.static_value("RDSoldier", "NotFiringDurationMin")))))))), "Number")
							if R.truth((c).fields.get("m_bIsFiring")):
								pass
								if R.truth(R.unary("!", R.call_member((c).fields.get("m_MachineGunFireSound"), "IsPlaying", []))):
									pass
									R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
							else:
								pass
								R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
							R.call_member(c, "UpdateAnimation", [true])
						if R.truth((c).fields.get("m_bIsFiring")):
							pass
							(c).fields["m_fFireBulletTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fFireBulletTimer"), v_fDeltaTime), "Number")
							if R.truth((float((c).fields.get("m_fFireBulletTimer")) >= float(R.static_value("RDSoldier", "FireBulletDelay")))):
								pass
								(c).fields["m_fFireBulletTimer"] = float(0)
								v_fDamage = R.coerce((R.static_value("RDSoldier", "HiddenBodyFireDamage") if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")))) else R.static_value("RDSoldier", "BodyFireDamage")), "Number")
								v_bHitPlayer = ((c).fields.get("m_bHasCorrectedAim") or R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDSoldier", "FireWidth")))
								v_hitEntity = R.coerce(R.call_member(c, "TestLineOfFire", [v_bHitPlayer]), "RDEntity")
								if R.truth(v_hitEntity):
									pass
									if R.truth(R.binary("==", R.binary("as", v_hitEntity, R.klass("RDZombie")), null)):
										pass
										R.call_member(c, "AddSuppressValue", [0.3])
									R.call_member(v_hitEntity, "OnSoldierBulletHit", [v_fDamage, R.static_value("RDDamageType", "SoldierMachineGunBullet")])
								else:
									pass
									if R.truth(v_bHitPlayer):
										pass
										if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDSoldier", "m_iPlayerDamageTime")))) > float(3))):
											pass
											R.call_member((c).fields.get("m_Player"), "TakeDamage", [v_fDamage, c, R.static_value("RDDamageType", "SoldierMachineGunBullet")])
											R.assign(c, "m_iPlayerDamageTime", "RDSoldier", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
									else:
										pass
										if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDSoldier", "MissWidth"))):
											pass
											v_bulletHitCarSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_BulletHitCarsSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
											R.call_member(c, "PlaySoundOnActor", [v_bulletHitCarSound])
										else:
											pass
											v_bulletMissSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_BulletMissSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
											R.call_member(c, "PlaySoundOnActor", [v_bulletMissSound])
						if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))):
							pass
							if R.truth((c).fields.get("m_bHasCorrectedAim")):
								pass
								if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDSoldier", "IdleAimCorrectionMaxSpeed")))):
									pass
									(c).fields["m_bHasCorrectedAim"] = false
							else:
								pass
								if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) <= float(R.static_value("RDSoldier", "IdleAimCorrectionMinSpeed")))):
									pass
									(c).fields["m_fIdleAimCorrectionTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fIdleAimCorrectionTimer"), v_fDeltaTime), "Number")
									if R.truth((float((c).fields.get("m_fIdleAimCorrectionTimer")) >= float(R.static_value("RDSoldier", "IdleAimCorrectionDelay")))):
										pass
										(c).fields["m_bHasCorrectedAim"] = true
				else:
					pass
					if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Spawning")))):
						pass
						if R.truth((((((c).fields.get("m_bSpawnGoLeft") and (float((c).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fSpawnWalkTarget")))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float((c).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fSpawnWalkTarget"))))) or ((c).fields.get("m_bSpawnGoLeft") and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fRelativeLocationX"))))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fRelativeLocationX")))))):
							pass
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
							(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
	return null

static func f_UpdateClingState(c: Variant, a: Array) -> Variant:
	var v_threatSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_threatSound = R.coerce(null, "DTSpacialSound")
	if R.truth((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))):
		pass
		(c).fields["m_fClingFireTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fClingFireTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fClingFireTimer")) >= float(R.static_value("RDSoldier", "ClingFireDelay")))):
			pass
			(c).fields["m_fClingFireTimer"] = float(0)
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Attack"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
	if R.truth(((((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))) and R.unary("!", R.call_member(c, "HasVoicePlaying", [])))):
		pass
		(c).fields["m_fThreatTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fThreatTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fThreatTimer")) <= float(0))):
			pass
			(c).fields["m_fThreatTimer"] = float((float(R.static_value("RDSoldier", "ThreatDelayMin")) + float((float(randf()) * float(R.static_value("RDSoldier", "ThreatDelayRandom"))))))
			v_threatSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_ThreatSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_threatSound])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_vDir: Variant = null
	var v_fDistance: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_vDir = R.coerce(null, "DTVector3D")
	v_fDistance = float(NAN)
	if R.truth((c.fields.get("m_bEditorMode") or (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None"))))):
		pass
		return null
	v_fDeltaX = float(0)
	v_fDeltaY = float(0)
	v_fDeltaZ = float(0)
	if R.truth((c).fields.get("m_bExploded")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		v_fDeltaZ = float(0)
		v_fDeltaX = float(0)
	else:
		pass
		if R.truth(R.unary("!", c.fields.get("m_bHit"))):
			pass
			if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle")))):
				pass
				if R.truth((c).fields.get("m_bAdjusting")):
					pass
					if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float((c).fields.get("m_fAdjustPosX")))]), 0.1)):
						pass
						v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
						if R.truth((float(v_fDistance) < float(R.static_value("RDSoldier", "FireDistance")))):
							pass
							(c).fields["m_bAdjusting"] = false
							(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
							(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Fire"), "int")
							R.call_member(c, "UpdateAnimation", [true])
						(c.fields.get("m_vVelocity")).fields["X"] = float(0)
					else:
						pass
						if R.truth((float((c).fields.get("m_fAdjustPosX")) < float((c).fields.get("m_fRelativeLocationX")))):
							pass
							v_fDeltaX = float(maxf(float((float((c).fields.get("m_fAdjustPosX")) - float((c).fields.get("m_fRelativeLocationX")))), float((R.num(R.unary("-", R.static_value("RDSoldier", "SpeedX"))) * float(v_fDeltaTime)))))
							(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDSoldier", "SpeedX")), "Number")
						else:
							pass
							if R.truth((float((c).fields.get("m_fAdjustPosX")) > float((c).fields.get("m_fRelativeLocationX")))):
								pass
								v_fDeltaX = float(minf(float((float((c).fields.get("m_fAdjustPosX")) - float((c).fields.get("m_fRelativeLocationX")))), float((float(R.static_value("RDSoldier", "SpeedX")) * float(v_fDeltaTime)))))
								(c.fields.get("m_vVelocity")).fields["X"] = float(R.static_value("RDSoldier", "SpeedX"))
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Spawning")))):
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = R.coerce((R.unary("-", (c).fields.get("m_fSpawnSpeedX")) if R.truth((c).fields.get("m_bSpawnGoLeft")) else (c).fields.get("m_fSpawnSpeedX")), "Number")
					v_fDeltaX = float((float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)))
			if R.truth((float(v_fDeltaX) != float(0))):
				pass
				c.fields["m_bFlippedX"] = (float(v_fDeltaX) < float(0))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ, (c).fields.get("m_Player")])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_explosive: Variant = null
	var v_iNewSpikeLane: Variant = 0
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_i = R.coerce(0, "int")
	v_explosive = R.coerce(null, "RDExplosive")
	v_iNewSpikeLane = R.coerce(0, "int")
	if R.truth(R.binary("==", v_szEvent, "EndHitForBlood")):
		pass
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "TriggerPulled")):
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip")))):
				pass
				v_iNewSpikeLane = R.coerce((R.coerce((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) - float(1)), "int") if R.truth(c.fields.get("m_bFlippedX")) else R.coerce((float(((c).fields.get("m_Spikes")).fields.get("m_iLane")) + float(1)), "int")), "int")
				R.call_member((c).fields.get("m_Spikes"), "SlideTo", [R.binary("+", R.call_static("RDRoad", "GetLaneXPos", [v_iNewSpikeLane]), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))])
			else:
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(R.static_value("RDSoldier", "NbExplosives")))):
					pass
					v_explosive = R.coerce(R.invoke(R.klass("RDExplosive"), [R.get_value((c).fields.get("m_Explosives"), v_i)]), "RDExplosive")
					R.call_member(v_explosive, "Detonate", [(float(v_i) * float(R.static_value("RDSoldier", "ExplosiveDelay")))])
					v_i = R.signed32(v_i + 1)
		else:
			pass
			R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth((((((R.binary("==", c.fields.get("m_szAnim"), "SideHit") or R.binary("==", c.fields.get("m_szAnim"), "FrontHit")) or R.binary("==", c.fields.get("m_szAnim"), "HeadlessHit")) or R.binary("==", c.fields.get("m_szAnim"), "RollOverHit")) or R.binary("==", c.fields.get("m_szAnim"), "GibHit")) or R.binary("==", c.fields.get("m_szAnim"), "Shot"))):
		pass
		(c).fields["m_bCanBeHitForBlood"] = false
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
		(c).fields["m_bHitFinished"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(((((R.binary("==", c.fields.get("m_szAnim"), "Idle") or R.binary("==", c.fields.get("m_szAnim"), "SlideOutIdle")) or R.binary("==", c.fields.get("m_szAnim"), "PullSpikeStripIdle")) or R.binary("==", c.fields.get("m_szAnim"), "PullSpikeStrip")) or R.binary("==", c.fields.get("m_szAnim"), "Hidden"))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "SlideOut")):
		pass
		if R.truth(((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding")) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideOutIdle"), "int")
		else:
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideFire"), "int")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
	else:
		pass
		if R.truth(R.binary("==", c.fields.get("m_szAnim"), "SlideIn")):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Hidden"), "int")
		else:
			pass
			if R.truth(R.binary("==", c.fields.get("m_szAnim"), "IdleToFire")):
				pass
				if R.truth(((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding")) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
					(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_ShootPlayer"), "int")
				else:
					pass
					(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Fire"), "int")
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MachineGunFireSound"), true])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnEndAnim"), [])
	return null

static func f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_szNewAnim: Variant = null
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_szNewAnim = R.coerce("", "String")
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		v_szNewAnim = R.coerce("Clinging", "String")
	else:
		pass
		if R.truth((c).fields.get("m_bExploded")):
			pass
			v_szNewAnim = R.coerce("GibHit", "String")
		else:
			pass
			if R.truth(c.fields.get("m_bHit")):
				pass
				if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
					pass
					v_szNewAnim = R.coerce("Shot", "String")
				else:
					pass
					if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
						pass
						v_szNewAnim = R.coerce("GibHit", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Front")))):
							pass
							v_szNewAnim = R.coerce("FrontHit", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Headless")))):
								pass
								v_szNewAnim = R.coerce("HeadlessHit", "String")
							else:
								pass
								if R.truth(((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_RollOver"))) or (float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_SlowRollOver"))))):
									pass
									v_szNewAnim = R.coerce("RollOverHit", "String")
								else:
									pass
									v_szNewAnim = R.coerce("SideHit", "String")
			else:
				pass
				if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_IdleToFire")))):
					pass
					v_szNewAnim = R.coerce("IdleToFire", "String")
				else:
					pass
					if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))):
						pass
						v_szNewAnim = R.coerce(("Fire" if R.truth((c).fields.get("m_bIsFiring")) else "NoFire"), "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Hidden")))):
							pass
							v_szNewAnim = R.coerce("Hidden", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideOut")))):
								pass
								v_szNewAnim = R.coerce("SlideOut", "String")
							else:
								pass
								if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideIn")))):
									pass
									v_szNewAnim = R.coerce("SlideIn", "String")
								else:
									pass
									if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideOutIdle")))):
										pass
										v_szNewAnim = R.coerce("SlideOutIdle", "String")
									else:
										pass
										if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire")))):
											pass
											v_szNewAnim = R.coerce(("SlideFire" if R.truth((c).fields.get("m_bIsFiring")) else "SlideNoFire"), "String")
										else:
											pass
											if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStripIdle")))):
												pass
												v_szNewAnim = R.coerce("PullSpikeStripIdle", "String")
											else:
												pass
												if R.truth((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_PullSpikeStrip")))):
													pass
													v_szNewAnim = R.coerce("PullSpikeStrip", "String")
												else:
													pass
													if R.truth((float((c.fields.get("m_vVelocity")).fields.get("X")) != float(0))):
														pass
														v_szNewAnim = R.coerce("Run", "String")
													else:
														pass
														v_szNewAnim = R.coerce("Idle", "String")
	R.call_member(c, "PlayAnim", [v_szNewAnim, v_bForce])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (((R.unary("!", c.fields.get("m_bHit")) or ((c).fields.get("m_bCanBeHitForBlood") and R.binary("==", v_entity, (c).fields.get("m_Player")))) and R.unary("!", (c).fields.get("m_bExploded"))) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null

static func f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_fClingChance: Variant = NAN
	var v_bCling: Variant = false
	var v_clingSound: Variant = null
	var v_getOnHoodSound: Variant = null
	var v_fSpeed: Variant = NAN
	var v_hitSound: Variant = null
	var v_iHitAlign: Variant = 0
	var v_gruntSound: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_fClingChance = float(NAN)
	v_bCling = false
	v_clingSound = R.coerce(null, "DTSpacialSound")
	v_getOnHoodSound = R.coerce(null, "DTSpacialSound")
	v_fSpeed = float(NAN)
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_iHitAlign = R.coerce(0, "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bCanBeHitForBlood")):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bHitForBlood"))):
			pass
			R.call_member((c).fields.get("m_Player"), "OnHitSoldierForBlood", [c])
			(c).fields["m_bHitForBlood"] = true
			v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [v_hitSound])
			if R.truth((c).fields.get("m_bCanBeHitForBloodWithAnim")):
				pass
				c.fields["m_bFlippedX"] = (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float((c).fields.get("m_fRelativeLocationX")))
				(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
				R.call_member(c, "UpdateDepthPosition", [])
				(c.fields.get("m_vVelocity")).fields["X"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
				c.fields["m_bUseCurvyCamera"] = false
				R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
				(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Headless"), "int")
				R.call_member(c, "UpdateAnimation", [true])
	else:
		pass
		v_fClingChance = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingChance", [(float((c.fields.get("m_vLocation")).fields.get("X")) < float(((v_entity).fields.get("m_vLocation")).fields.get("X"))), c]), "Number")
		v_bCling = R.coerce(((float(randf()) < float(v_fClingChance)) if R.truth((float(v_fClingChance) > float(0))) else false), "Boolean")
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		if R.truth(v_bCling):
			pass
			c.fields["m_bClingLeft"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(((v_entity).fields.get("m_vLocation")).fields.get("X")))
			R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
			R.call_member((c).fields.get("m_Player"), "SetClinger", [c, c.fields.get("m_bClingLeft"), false])
			c.fields["m_ClingMC"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [c]), "MovieClip")
			R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "addChild"), [c.fields.get("m_ClingMC")])
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Start"), "int")
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "UpdateClingAnimation", [])
			(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
			R.call_member(c, "UpdateDepthPosition", [])
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			c.fields["m_bUseCurvyCamera"] = false
			R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
			v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlaySoundOnActor", [v_clingSound])
			v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
			return true
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		v_fSpeed = float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))
		if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinMultiHitSpeed")))):
			pass
			v_iHitAlign = R.coerce(R.call_member((c).fields.get("m_Player"), "GetHitAlign", [c]), "int")
			if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
				pass
				if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinGibSpeed")))):
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
					R.call_member((c).fields.get("m_Player"), "OnGibSoldier", [c])
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
		c.fields["m_bFlippedX"] = (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float((c).fields.get("m_fRelativeLocationX")))
		(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
		R.call_member(c, "UpdateDepthPosition", [])
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		c.fields["m_bUseCurvyCamera"] = false
		R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
		else:
			pass
			R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "UpdateAnimation", [true])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierKilled", [c, (c).fields.get("m_iHitType")])
	return false
	return null

static func f_OnClingAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "ClingAnimDoAttack")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PistolFireSound")])
		R.call_member((c).fields.get("m_Player"), "TakeDamage", [R.static_value("RDSoldier", "ClingBodyFireDamage"), c, R.static_value("RDDamageType", "SoldierPistolBullet")])
		(c).fields["m_bHasGunOut"] = false
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "ClingAnimDoFakeAttack")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PistolFireSound")])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "ClingAnimDrawGun")):
				pass
				(c).fields["m_bHasGunOut"] = true
			else:
				pass
				R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnClingAnimEvent"), [v_szEvent])
	return null

static func f_OnClingAnimationEnded(c: Variant, a: Array) -> Variant:
	if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Attack"))))):
		pass
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
	else:
		pass
		if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideLeft"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideRight"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
		else:
			pass
			if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot"))))):
				pass
				R.call_member((c).fields.get("m_Player"), "SetClinger", [null, (float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))), false])
				R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
				R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
				(c).fields["m_bHitFinished"] = true
				R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
				return null
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnClingAnimationEnded"), [])
	return null

static func f_UpdateClingAnimation(c: Variant, a: Array) -> Variant:
	var v_szClingAnimation: Variant = null
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		return null
	v_szClingAnimation = R.coerce("", "String")
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start")))):
		pass
		v_szClingAnimation = R.coerce("Start", "String")
	else:
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))):
			pass
			v_szClingAnimation = R.coerce("Idle", "String")
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideLeft")))):
				pass
				v_szClingAnimation = R.coerce("CollideLeft", "String")
			else:
				pass
				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideRight")))):
					pass
					v_szClingAnimation = R.coerce("CollideRight", "String")
				else:
					pass
					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Attack")))):
						pass
						v_szClingAnimation = R.coerce("Attack", "String")
					else:
						pass
						if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))):
							pass
							v_szClingAnimation = R.coerce("GetOff", "String")
						else:
							pass
							if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))):
								pass
								v_szClingAnimation = R.coerce(("ShotLeft" if R.truth(c.fields.get("m_bClingLeft")) else "Shot"), "String")
	if R.truth(R.binary("!=", v_szClingAnimation, "")):
		pass
		R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndPlay"), [v_szClingAnimation])
	return null

static func f_OnSideCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_getOffSound: Variant = null
	var v_bRightSide: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(R.static_value("RDSoldier", "SideCollisionClingDamage")))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
			pass
			v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		else:
			pass
			v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOffSound])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, true])
		(c).fields["m_bHasGunOut"] = false
		R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_OnDirectCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_getOffSound: Variant = null
	var v_fSpeedRatio: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bRightSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float((float(v_fSpeedRatio) * float(R.static_value("RDSoldier", "DirectCollisionClingDamage")))))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
			pass
			v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		else:
			pass
			v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_getOffSound])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, false])
		(c).fields["m_bHasGunOut"] = false
		R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_OnForceGetOff(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	c.fields["m_fClingHP"] = float(0)
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
	(c).fields["m_bHasGunOut"] = false
	v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlayVoiceSound", [v_getOffSound])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierGotOff", [c, false])
	R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_ForceRemove(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), false])
	R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
	R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
	(c).fields["m_bHitFinished"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	return null

static func f_GetBlockedHeadShotChance(c: Variant, a: Array) -> Variant:
	return 0.5
	return null

static func f_GetBlockedTorsoShotChance(c: Variant, a: Array) -> Variant:
	return 0.5
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
		pass
		c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
		if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
			pass
			c.fields["m_bHit"] = true
			if R.truth((c).fields.get("m_bRegisteredAsKillable")):
				pass
				R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
				(c).fields["m_bRegisteredAsKillable"] = false
			(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
			R.call_member((c).fields.get("m_Player"), "OnGibSoldier", [c])
			if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
			else:
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "AddGroundBlood", [5])
		else:
			pass
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			R.call_member(c, "AddGroundBlood", [1])
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_bHead: Variant = false
	var v_fLimit: Variant = NAN
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	v_bHead = false
	v_fLimit = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	if R.truth((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded")))):
		pass
		c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "globalToLocal"), [v_hitPos]), "Point")
		v_bHead = R.binary("<", R.get_value(c.fields.get("m_BulletHitPos"), "y"), R.unary("-", 220))
		if R.truth(v_bHead):
			pass
			if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedHeadShotChance", []))):
				pass
				(c).fields["m_bBlockedHeadShot"] = true
			else:
				pass
				if R.truth((float(c.fields.get("m_fHeadHP")) > float(0))):
					pass
					c.fields["m_fHeadHP"] = R.coerce(R.binary("-", c.fields.get("m_fHeadHP"), v_iDamage), "Number")
					if R.truth((float(c.fields.get("m_fHeadHP")) <= float(0))):
						pass
						c.fields["m_bHit"] = true
						if R.truth((c).fields.get("m_bRegisteredAsKillable")):
							pass
							R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
							(c).fields["m_bRegisteredAsKillable"] = false
						(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
						(c).fields["m_bCanBeHitForBlood"] = true
						(c).fields["m_bCanBeHitForBloodWithAnim"] = true
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
						(c.fields.get("m_vVelocity")).fields["X"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
						R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
						R.call_member(c, "UpdateAnimation", [true])
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotDown", [c, (c).fields.get("m_iHitType")])
						R.call_member(c, "AddGroundBlood", [5])
					else:
						pass
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
						R.call_member(c, "AddGroundBlood", [1])
		else:
			pass
			if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
				pass
				c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
				if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
					pass
					c.fields["m_bHit"] = true
					if R.truth((c).fields.get("m_bRegisteredAsKillable")):
						pass
						R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
						(c).fields["m_bRegisteredAsKillable"] = false
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
					(c).fields["m_bCanBeHitForBlood"] = true
					(c).fields["m_bCanBeHitForBloodWithAnim"] = true
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
					(c.fields.get("m_vVelocity")).fields["X"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
					v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_gruntSound])
					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
					R.call_member(c, "UpdateAnimation", [true])
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotDown", [c, (c).fields.get("m_iHitType")])
					R.call_member(c, "AddGroundBlood", [5])
				else:
					pass
					if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
						pass
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
					R.call_member(c, "AddGroundBlood", [1])
		R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
		if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_ShootPlayer")))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_IdleToFire"), "int")
			R.call_member(c, "UpdateAnimation", [true])
		else:
			pass
			if R.truth((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer")))):
				pass
				if R.truth(R.unary("!", (c).fields.get("m_bAdjusting"))):
					pass
					v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
					(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(3))) + float((float(randf()) * float(3)))), R.unary("-", v_fLimit), v_fLimit]), "Number")
					(c).fields["m_bAdjusting"] = true
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	(c).fields["m_bBlockedHeadShot"] = false
	return null

static func f_DamageHead(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedHeadShotChance", []))):
		pass
		return true
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "HeadDamageKillDelay")))), float(0)))
	c.fields["m_fHeadHP"] = float(maxf(float((float(c.fields.get("m_fHeadHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fHeadHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Shot"), "int")
		if R.truth(((c).fields.get("m_bHasGunOut") and R.unary("!", R.get_value(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "QuickDraw"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "QuickDraw")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member(c, "StopVoiceSound", [])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null

static func f_DamageTorso(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedTorsoShotChance", []))):
		pass
		return true
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "BodyDamageKillDelay")))), float(0)))
	c.fields["m_fBodyHP"] = float(maxf(float((float(c.fields.get("m_fBodyHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fBodyHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_getOffSound])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null

static func f_DamageBody(c: Variant, a: Array) -> Variant:
	var v_getOffSound: Variant = null
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_getOffSound = R.coerce(null, "DTSpacialSound")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_fClingHP")) == float(0)))):
		pass
		return null
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.5))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fClingFireTimer"] = float(maxf(float((float((c).fields.get("m_fClingFireTimer")) - float(R.static_value("RDSoldier", "BodyDamageKillDelay")))), float(0)))
	c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_getOffSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOffSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_getOffSound])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnSoldierShotOffHood", [c, c.fields.get("m_iClingState")])
	else:
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("X")]))))
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "+=")
	R.invoke(R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "push"), [c])
	R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "+=")
	(c).fields["m_bRegisteredAsKillable"] = true
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "-=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("RDSoldier", "AllSoldiers"), v_i), c)):
			pass
			R.invoke(R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	if R.truth((c).fields.get("m_Explosives")):
		pass
		R.invoke(R.get_value((c).fields.get("m_Explosives"), "splice"), [0])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "Destroy"), [])
	return null

static func f_StopAnimations(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MainMC"), "removeChild"), [(c).fields.get("m_SuppressZone")])
	R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_SuppressZone")])
	R.invoke(R.get_value(R.super_ref(c, "RDSoldier"), "StopAnimations"), [])
	return null

static func f_StartSpawning(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	var v_fRoadLimit: Variant = NAN
	var v_spawnFrom: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_iRandom = R.coerce(0, "int")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_Spawning"), "int")
	(c).fields["m_bSpawnGoLeft"] = R.binary(">", ((v_spawnFrom).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]))
	v_fRoadLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_fSpawnWalkTarget"] = R.coerce(R.call_static("Maths", "Clamp", [(float((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) - float(3))) + float((float(randf()) * float(6)))), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
	(c).fields["m_fSpawnSpeedX"] = float((float((float(0.75) + float((float(randf()) * float(0.5))))) * float(R.static_value("RDSoldier", "SpeedX"))))
	R.call_member(c, "UpdateAnimation", [true])
	if R.truth(((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) == float(0)) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDSoldier", "m_iLastPlayerNotMovingTime")))) > float(500)))):
		pass
		v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [4]), "int")
		if R.truth((float(v_iRandom) == float(0))):
			pass
			(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
		else:
			pass
			if R.truth((float(v_iRandom) == float(1))):
				pass
				(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
			else:
				pass
				if R.truth((float(v_iRandom) == float(2))):
					pass
					(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
				else:
					pass
					if R.truth((float(v_iRandom) == float(3))):
						pass
						(c).fields["m_PlayerNotMovingVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SoldierPlayerNotMoving04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PlayerNotMovingVoice")])
		R.assign(c, "m_iLastPlayerNotMovingTime", "RDSoldier", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_missile: Variant = null
	var v_explosive: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_missile = R.coerce(null, "RDMissileAlly")
	v_explosive = R.coerce(R.binary("as", v_instigator, R.klass("RDExplosive")), "RDExplosive")
	if R.truth((R.truth(v_explosive) and R.binary("==", (v_explosive).fields.get("m_Instigator"), c))):
		pass
		return null
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDSoldier", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		(c).fields["m_bExploded"] = true
		R.call_member(c, "UpdateAnimation", [true])
		v_missile = R.coerce(R.binary("as", v_entity, R.klass("RDMissileAlly")), "RDMissileAlly")
		if R.truth((R.unary("!", v_missile) or R.binary("==", v_instigator, (c).fields.get("m_Player")))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCollateralKills", 1, "+=")
		R.call_member(c, "AddGroundBlood", [5, true])
	return null

static func f_SetupExplosives(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_explosive: Variant = null
	var v_fPosX: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_i: Variant = 0
	v_fLimit = float(NAN)
	v_explosive = R.coerce(null, "RDExplosive")
	v_fPosX = float(NAN)
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	c.fields["m_bFlippedX"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))
	(c).fields["m_bDonateExplosiveRight"] = (float(randf()) > float(0.5))
	(c).fields["m_Explosives"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDSoldier", "NbExplosives")))):
		pass
		v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
		v_explosive = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDExplosive")]), R.klass("RDExplosive")), "RDExplosive")
		R.call_member(v_explosive, "Init", [(R.klass("MC_Explosion") if R.truth((float(randf()) > float(0.5))) else R.klass("MC_Explosion2")), true, 5, 10])
		(v_explosive).fields["m_Instigator"] = R.coerce(c, "RDEntity")
		v_fPosX = float(0)
		if R.truth(c.fields.get("m_bFlippedX")):
			pass
			if R.truth((c).fields.get("m_bDonateExplosiveRight")):
				pass
				v_fPosX = float((float((float((float(v_fLimit) - float(R.static_value("RDSoldier", "ExplosiveMargin")))) - float((float((float(R.static_value("RDSoldier", "NbExplosives")) - float(1))) * float(R.static_value("RDSoldier", "ExplosiveSpacing")))))) + float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
			else:
				pass
				v_fPosX = float((float((float(v_fLimit) - float(R.static_value("RDSoldier", "ExplosiveMargin")))) - float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
		else:
			pass
			if R.truth((c).fields.get("m_bDonateExplosiveRight")):
				pass
				v_fPosX = R.coerce(R.binary("+", R.binary("+", R.unary("-", v_fLimit), R.static_value("RDSoldier", "ExplosiveMargin")), (float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing")))), "Number")
			else:
				pass
				v_fPosX = float((R.num(R.binary("+", R.binary("+", R.unary("-", v_fLimit), R.static_value("RDSoldier", "ExplosiveMargin")), (float((float(R.static_value("RDSoldier", "NbExplosives")) - float(1))) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))) - float((float(v_i) * float(R.static_value("RDSoldier", "ExplosiveSpacing"))))))
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosive, (float(v_fPosX) + float(v_fPerlinX)), v_fPerlinY, (c.fields.get("m_vLocation")).fields.get("Z")])
		R.invoke(R.get_value((c).fields.get("m_Explosives"), "push"), [v_explosive])
		v_i = R.signed32(v_i + 1)
	return null

static func f_SetupSpikes(c: Variant, a: Array) -> Variant:
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_iSpikesLane: Variant = 0
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_iSpikesLane = R.coerce((2 if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))) else 0), "int")
	(c).fields["m_Spikes"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSpikeStrip")]), R.klass("RDSpikeStrip")), "RDSpikeStrip")
	((c).fields.get("m_Spikes")).fields["m_iLane"] = R.coerce(v_iSpikesLane, "int")
	R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Spikes"), R.binary("+", R.call_static("RDRoad", "GetLaneXPos", [v_iSpikesLane]), v_fPerlinX), v_fPerlinY, (c.fields.get("m_vLocation")).fields.get("Z")])
	c.fields["m_bFlippedX"] = (float((c.fields.get("m_vLocation")).fields.get("X")) < float(v_fPerlinX))
	return null

static func f_TestLineOfFire(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_fHitX: Variant = NAN
	var v_fTargetX: Variant = NAN
	var v_fSlope: Variant = NAN
	var v_entityNode: Variant = null
	var v_bToPlayer: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_entity = R.coerce(null, "RDEntity")
	v_fHitX = float(NAN)
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) <= float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		return null
	v_fTargetX = R.coerce(((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float(1)) if R.truth(v_bToPlayer) else (c.fields.get("m_vLocation")).fields.get("X")), "Number")
	v_fSlope = float(R.binary("/", (float(v_fTargetX) - float((c.fields.get("m_vLocation")).fields.get("X"))), (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))))
	v_entityNode = R.coerce((c.fields.get("m_EntityNode")).fields.get("m_Previous"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
			pass
			return null
		if R.truth(R.call_member(v_entity, "CanBlockSoldierBullets", [])):
			pass
			v_fHitX = float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))) * float(v_fSlope)))))
			if R.truth(((float(v_fHitX) >= float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("X")))) - float(0.5)))) and (float(v_fHitX) <= float((float((float((float(((v_entity).fields.get("m_vLocation")).fields.get("X")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("X")))) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("W")))) + float(0.5)))))):
				pass
				return v_entity
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Previous"), "RDEntityNode")
	return null
	return null

static func f_Suppress(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fDistance = float(NAN)
	if R.truth((c.fields.get("m_bHit") or (c).fields.get("m_bExploded"))):
		pass
		return null
	if R.truth((((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire")))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_SlideFire"))))):
		pass
		v_fDistance = R.coerce(R.call_member(v_vPos, "DistanceFrom", [c.fields.get("m_vLocation")]), "Number")
		R.call_member(c, "AddSuppressValue", [(float(1) - float(minf(float(R.binary("/", v_fDistance, R.static_value("RDSoldier", "MaxSuppressDistance"))), float(1))))])
	return null

static func f_AddSuppressValue(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_fValue: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fLimit = float(NAN)
	(c).fields["m_fSuppressValue"] = R.coerce(R.binary("+", (c).fields.get("m_fSuppressValue"), v_fValue), "Number")
	if R.truth((float((c).fields.get("m_fSuppressValue")) >= float(R.static_value("RDSoldier", "SuppressThreshold")))):
		pass
		(c).fields["m_fSuppressValue"] = float(0)
		(c).fields["m_bIsFiring"] = false
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
		if R.truth(((float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Fire"))) or (float((c).fields.get("m_iState")) == float(R.static_value("RDSoldier", "State_Idle"))))):
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_Idle"), "int")
			(c).fields["m_iBehavior"] = R.coerce(R.static_value("RDSoldier", "Behavior_AdjustAndShootPlayer"), "int")
			v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
			(c).fields["m_fAdjustPosX"] = R.coerce(R.call_static("Maths", "Clamp", [R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), ((R.num(R.unary("-", 1)) - float((float(randf()) * float(2)))) if R.truth((float(randf()) > float(0.5))) else (float(1) + float((float(randf()) * float(2)))))), R.unary("-", v_fLimit), v_fLimit]), "Number")
			(c).fields["m_bAdjusting"] = true
		else:
			pass
			(c).fields["m_iState"] = R.coerce(R.static_value("RDSoldier", "State_SlideIn"), "int")
			(c).fields["m_fSlideOutTimer"] = float(0)
			(c).fields["m_fSlideOutDelay"] = float((float(0.5) + float((float(randf()) * float(1.5)))))
		(c).fields["m_fIdleAimCorrectionTimer"] = float(0)
		R.call_member(c, "UpdateAnimation", [true])
	return null

static func f_GetEditorAdjustedPosX(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(((float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_TriggerExplosion"))) or (float((c).fields.get("m_iBehavior")) == float(R.static_value("RDSoldier", "Behavior_PullSpikeStrip"))))):
		pass
		return (8 if R.truth((float(v_fX) > float(0))) else R.unary("-", 8))
	return v_fX
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	return null

static func f_GetSuppressZoneMC(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_SuppressZone")
	return null

static func f_OnKilledByZombie(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	c.fields["m_bHit"] = true
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
	(c).fields["m_bCanBeHitForBlood"] = true
	(c).fields["m_bCanBeHitForBloodWithAnim"] = true
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_MachineGunFireSound")])
	R.call_member(c, "UpdateAnimation", [true])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_HitSounds", null, "=")
	R.set_value(c, "m_BulletMissSounds", null, "=")
	R.set_value(c, "m_BulletHitCarsSounds", null, "=")
	R.set_value(c, "m_Male1GruntSounds", null, "=")
	R.set_value(c, "m_Male1GetOnHoodSounds", null, "=")
	R.set_value(c, "m_Male1ThreatSounds", null, "=")
	R.set_value(c, "m_Male1CollisionSounds", null, "=")
	R.set_value(c, "m_Male1GetOffSounds", null, "=")
	R.set_value(c, "m_Male1StationaryCueSounds", null, "=")
	R.set_value(c, "m_Male1AlignAndShootCueSounds", null, "=")
	R.set_value(c, "m_Male1HiddenCueSounds", null, "=")
	R.set_value(c, "m_Male1SpikesCueSounds", null, "=")
	R.set_value(c, "m_Male1ExplosivesCueSounds", null, "=")
	R.set_value(c, "m_Male2GruntSounds", null, "=")
	R.set_value(c, "m_Male2GetOnHoodSounds", null, "=")
	R.set_value(c, "m_Male2ThreatSounds", null, "=")
	R.set_value(c, "m_Male2CollisionSounds", null, "=")
	R.set_value(c, "m_Male2GetOffSounds", null, "=")
	R.set_value(c, "m_Male2StationaryCueSounds", null, "=")
	R.set_value(c, "m_Male2AlignAndShootCueSounds", null, "=")
	R.set_value(c, "m_Male2HiddenCueSounds", null, "=")
	R.set_value(c, "m_Male2SpikesCueSounds", null, "=")
	R.set_value(c, "m_Male2ExplosivesCueSounds", null, "=")
	R.set_value(c, "m_bShootPlayerVoiceMale2", false, "=")
	R.set_value(c, "m_bAdjustAndShootPlayerVoiceMale2", false, "=")
	R.set_value(c, "m_bSliderOutAndShootVoiceMale2", false, "=")
	R.set_value(c, "m_bPullSpikeStripVoiceMale2", false, "=")
	R.set_value(c, "m_bTriggerExplosionVoiceMale2", false, "=")
	R.set_value(c, "Scale", 2.2, "=")
	R.set_value(c, "Behavior_ShootPlayer", 0, "=")
	R.set_value(c, "Behavior_AdjustAndShootPlayer", 1, "=")
	R.set_value(c, "Behavior_SliderOutAndShoot", 2, "=")
	R.set_value(c, "Behavior_PullSpikeStrip", 3, "=")
	R.set_value(c, "Behavior_TriggerExplosion", 4, "=")
	R.set_value(c, "Behavior_Spawning", 5, "=")
	R.set_value(c, "Behavior_Max", 6, "=")
	R.set_value(c, "State_None", 0, "=")
	R.set_value(c, "State_Idle", 1, "=")
	R.set_value(c, "State_IdleToFire", 2, "=")
	R.set_value(c, "State_Fire", 3, "=")
	R.set_value(c, "State_SlideIn", 4, "=")
	R.set_value(c, "State_Hidden", 5, "=")
	R.set_value(c, "State_SlideOut", 6, "=")
	R.set_value(c, "State_SlideFire", 7, "=")
	R.set_value(c, "State_PullSpikeStripIdle", 8, "=")
	R.set_value(c, "State_PullSpikeStrip", 9, "=")
	R.set_value(c, "State_SlideOutIdle", 10, "=")
	R.set_value(c, "State_Spawning", 11, "=")
	R.set_value(c, "Voice_Male1", 0, "=")
	R.set_value(c, "Voice_Male2", 1, "=")
	R.set_value(c, "SpeedX", R.binary("/", R.binary("/", (float(20) * float(1000)), 60), 60), "=")
	R.set_value(c, "IdleAimCorrectionMinSpeed", R.binary("/", R.binary("/", (float(20) * float(1000)), 60), 60), "=")
	R.set_value(c, "IdleAimCorrectionMaxSpeed", R.binary("/", R.binary("/", (float(40) * float(1000)), 60), 60), "=")
	R.set_value(c, "IdleAimCorrectionDelay", 1, "=")
	R.set_value(c, "FireWidth", 2, "=")
	R.set_value(c, "MissWidth", 4, "=")
	R.set_value(c, "FireDistance", 40, "=")
	R.set_value(c, "BodyFireDamage", 5, "=")
	R.set_value(c, "HiddenBodyFireDamage", 10, "=")
	R.set_value(c, "AdjustDistance", 70, "=")
	R.set_value(c, "SlideOutDistance", 25, "=")
	R.set_value(c, "PullSpikesDistance", 40, "=")
	R.set_value(c, "TriggerExplosionDistance", 60, "=")
	R.set_value(c, "FireBulletDelay", 0.1, "=")
	R.set_value(c, "ClingFireDelay", 2, "=")
	R.set_value(c, "ClingBodyFireDamage", 35, "=")
	R.set_value(c, "SideCollisionClingDamage", 20, "=")
	R.set_value(c, "DirectCollisionClingDamage", 120, "=")
	R.set_value(c, "MinSpaceToSlideOut", 3, "=")
	R.set_value(c, "SlideOutHideOffset", 1, "=")
	R.set_value(c, "NbExplosives", 7, "=")
	R.set_value(c, "ExplosiveMargin", 2, "=")
	R.set_value(c, "ExplosiveSpacing", 2, "=")
	R.set_value(c, "ExplosiveDelay", 0.3, "=")
	R.set_value(c, "ThreatDelayMin", 1, "=")
	R.set_value(c, "ThreatDelayRandom", 1, "=")
	R.set_value(c, "HeadDamageKillDelay", 0.3, "=")
	R.set_value(c, "BodyDamageKillDelay", 0.25, "=")
	R.set_value(c, "FiringDurationMin", 0.8, "=")
	R.set_value(c, "FiringDurationMax", 1.5, "=")
	R.set_value(c, "NotFiringDurationMin", 0.3, "=")
	R.set_value(c, "NotFiringDurationMax", 0.8, "=")
	R.set_value(c, "MaxSuppressDistance", 3, "=")
	R.set_value(c, "SuppressThreshold", 5, "=")
	R.set_value(c, "AllSoldiers", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_iPlayerDamageTime", 0, "=")
	R.set_value(c, "m_iLastPlayerNotMovingTime", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_MachineGunFireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_PistolFireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iBehavior"] = R.coerce(0, "int")
	(c).fields["m_iState"] = R.coerce(0, "int")
	(c).fields["m_HeadshotHitSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_GibHitSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iHitType"] = R.coerce(0, "int")
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_fClingFireTimer"] = float(NAN)
	(c).fields["m_fFireBulletTimer"] = float(NAN)
	(c).fields["m_fKillDelayTimeStamp"] = float(NAN)
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Spikes"] = R.coerce(null, "RDSpikeStrip")
	(c).fields["m_bSlideRight"] = false
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_fAdjustPosX"] = float(NAN)
	(c).fields["m_bAdjusted"] = false
	(c).fields["m_bAdjusting"] = false
	(c).fields["m_bDonateExplosiveRight"] = false
	(c).fields["m_Explosives"] = R.coerce(null, "Array")
	(c).fields["m_bHasCorrectedAim"] = false
	(c).fields["m_fIdleAimCorrectionTimer"] = float(NAN)
	(c).fields["m_bInitBehavior"] = false
	(c).fields["m_fThreatTimer"] = float(NAN)
	(c).fields["m_bSpawnGoLeft"] = false
	(c).fields["m_fSpawnWalkTarget"] = float(NAN)
	(c).fields["m_fSpawnSpeedX"] = float(NAN)
	(c).fields["m_bHasGunOut"] = false
	(c).fields["m_bGiveCue"] = false
	(c).fields["m_GruntSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_GetOnHoodSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_ThreatSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_CollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_GetOffSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_StationaryCueSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_AlignAndShootCueSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_HiddenCueSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_SpikesCueSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_ExplosivesCueSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_bBlockedHeadShot"] = false
	(c).fields["m_BlockedHeadHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_BlockedHeadHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_fIsFiringTimer"] = float(0)
	(c).fields["m_fIsFiringDuration"] = float(0)
	(c).fields["m_bIsFiring"] = false
	(c).fields["m_fSuppressValue"] = float(0)
	(c).fields["m_fSlideOutTimer"] = float(0)
	(c).fields["m_fSlideOutDelay"] = float(0)
	(c).fields["m_PlayerNotMovingVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_SuppressZone"] = R.coerce(null, "MovieClip")
	(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_bCanBeHitForBlood"] = false
	(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	(c).fields["m_bHitForBlood"] = false
	(c).fields["m_fDissapearTimer"] = float(0)
	return null
