extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombie(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	R.invoke(R.super_ref(c, "RDZombie"), [v_mcClass, R.static_value("RDSpawnType", "Zombie"), v_fScale])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "stop"), [])
	(c).fields["m_iClingSurvivalItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_UndeadTactics"), "int")
	(c).fields["m_IdleClingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_IdleCling"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_HeadshotHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HeadshotHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_GibHitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_GibHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_PunchSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_PunchZombie"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ElbowSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ElbowZombie"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_DoorBashingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DoorBashing"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsLoud")]), "DTSpacialSound")
	(c).fields["m_PunchHoodSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_PunchHood"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_SideGrindingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SideGrinding"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ClingerSlideSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ClingerSlide"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	(c).fields["m_iPatrolStep"] = R.coerce(R.static_value("RDZombie", "PatrolStep_Moving"), "int")
	(c).fields["m_bGoingRight"] = R.binary("==", R.call_static("Maths", "RandomInt", [2]), 0)
	(c).fields["m_fPatrolRange"] = float(2)
	(c).fields["m_fPatrolWaitTimer"] = float(0)
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	(c).fields["m_fClingPunchDelay"] = float(5)
	(c).fields["m_fClingPunchDamage"] = float(10)
	(c).fields["m_fClingSpazDelay"] = float(R.static_value("RDZombie", "SpazDelay"))
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = true
	(c).fields["m_BlockedHeadHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	(c).fields["m_fMoanTimer"] = float((float(R.static_value("RDZombie", "MoanDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoanDelayMax")) - float(R.static_value("RDZombie", "MoanDelayMin"))))))))
	(c).fields["m_iCivilianEatCount"] = R.coerce(1, "int")
	(c).fields["m_iKillSoldierTick"] = R.coerce(R.static_value("RDZombie", "m_iGlobalKillSoldierTick"), "int")
	R.assign(c, "m_iGlobalKillSoldierTick", "RDZombie", R.binary("%", (float(R.static_value("RDZombie", "m_iGlobalKillSoldierTick")) + float(1)), R.static_value("RDZombie", "MaxGlobalKillSoldierTick")), "=")
	(c).fields["m_fPredictPlayerRatio"] = float((float(0.8) + float((float(randf()) * float(0.2)))))
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_HitSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_HitZombie04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MoanNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieMoan09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MoanNormalFemaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan10"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan11"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieMoan12"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MoanHardSounds", "RDZombie", R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "=")
	R.assign(c, "m_MoanVeryHardSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_MoanVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieMoan01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieMoan02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieMoan03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieMoan04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MoanAlphaSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_MoanAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieMoan01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieMoan02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieMoan03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_MoanAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieMoan04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_GruntNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieHit10"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_GruntNormalFemaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt10"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt11"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt12"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt13"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt14"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieGrunt15"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_GruntHardSounds", "RDZombie", R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "=")
	R.assign(c, "m_GruntVeryHardSounds", "RDZombie", R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "=")
	R.assign(c, "m_GruntAlphaSounds", "RDZombie", R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "=")
	R.assign(c, "m_GetOnHoodNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieGetOnHood07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_GetOnHoodNormalFemaleSounds", "RDZombie", R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "=")
	R.assign(c, "m_GetOnHoodHardSounds", "RDZombie", R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "=")
	R.assign(c, "m_GetOnHoodVeryHardSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieGetOnHood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_GetOnHoodAlphaSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_GetOnHoodAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieGetOnHood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_CollisionNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieLightGrunt01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieLightGrunt02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieLightGrunt03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieLightGrunt04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieLightGrunt05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_CollisionNormalFemaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieCollision03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieCollision04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_CollisionHardSounds", "RDZombie", R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "=")
	R.assign(c, "m_CollisionVeryHardSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_CollisionVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieLightGrunt01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieLightGrunt02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_CollisionAlphaSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_CollisionAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieLightGrunt01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_CollisionAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieLightGrunt02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_ThreatNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieThreat09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_ThreatNormalFemaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieThreat01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieThreat02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieThreat03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_ThreatHardSounds", "RDZombie", R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "=")
	R.assign(c, "m_ThreatVeryHardSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_ThreatVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieThreat01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieThreat02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieThreat03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_ThreatAlphaSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_ThreatAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieThreat01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieThreat02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_ThreatAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieThreat03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_AttackNormalMaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack09"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack10"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack11"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack12"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleZombieAttack13"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_AttackNormalFemaleSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleZombieAttack06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_AttackHardSounds", "RDZombie", R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "=")
	R.assign(c, "m_AttackVeryHardSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackVeryHardSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_SuperZombieAttack06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_AttackAlphaSounds", "RDZombie", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDZombie", "m_AttackAlphaSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_AlphaZombieAttack06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "SetInitialState"), [])
	(c).fields["m_bStartPosXSet"] = false
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_fKillDelayTimeStamp"] = float(0)
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bSpawnFeedCorpse"] = false
	(c).fields["m_bSpecialZombie"] = false
	R.call_member((c).fields.get("m_vMoveTarget"), "SetZero", [])
	(c).fields["m_bSpawnGetUp"] = false
	(c).fields["m_bSpawnGoLeft"] = false
	(c).fields["m_bDoWaitForCling"] = false
	(c).fields["m_bStartingJump"] = false
	(c).fields["m_bInJump"] = false
	(c).fields["m_bEndingJump"] = false
	(c).fields["m_bJumpFront"] = false
	(c).fields["m_bJumpOnPlayerLeft"] = false
	(c).fields["m_bCanJumpOnPlayer"] = false
	(c).fields["m_SpawnBuilding"] = R.coerce(null, "RDEntity")
	(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_Building"] = R.coerce(null, "RDBuildingNew")
	(c).fields["m_bFindBuilding"] = false
	(c).fields["m_bGoToRescuePosition"] = false
	(c).fields["m_bTrackingAndSideCling"] = false
	(c).fields["m_bJumpFromBuilding"] = false
	(c).fields["m_bSwitchedToDynamicLayer"] = true
	(c).fields["m_bFirstInit"] = true
	(c).fields["m_bUsingColor"] = false
	(c).fields["m_FenceToBash"] = R.coerce(null, "RDObstacleFence")
	(c).fields["m_fGibHP"] = R.coerce(R.unary("-", 1), "Number")
	(c).fields["m_bWaitToEnterBuilding"] = false
	(c).fields["m_fWaitToEnterBuildingTimer"] = float(0)
	(c).fields["m_bCheckForChopperCollision"] = false
	(c).fields["m_iSideMoveFrames"] = R.coerce(0, "int")
	(c).fields["m_fDissapearTimer"] = float(0)
	(c).fields["m_bAllowGrubFrontGib"] = false
	(c).fields["m_GunSlingerFirstWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_GunSlingerSecondWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_bCanBeHitForBlood"] = false
	(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	(c).fields["m_bHitForBlood"] = false
	(c).fields["m_Corpse"] = R.coerce(null, "RDObstacleCorpse")
	R.call_member((c).fields.get("m_vVelocityDir"), "SetZero", [])
	R.call_member((c).fields.get("m_vMoveToDelta"), "SetZero", [])
	(c).fields["m_fExplosionDelay"] = float(0)
	(c).fields["m_ExplodeInstigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_bDoCharge"] = true
	(c).fields["m_bTrackingPlayerRight"] = false
	(c).fields["m_fGetBackToPlayerTimer"] = float(0)
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "stop"), [])
	(c).fields["m_iPatrolStep"] = R.coerce(R.static_value("RDZombie", "PatrolStep_Moving"), "int")
	(c).fields["m_bGoingRight"] = R.binary("==", R.call_static("Maths", "RandomInt", [2]), 0)
	(c).fields["m_fPatrolRange"] = float(2)
	(c).fields["m_fPatrolWaitTimer"] = float(0)
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	(c).fields["m_fClingPunchDelay"] = float(5)
	(c).fields["m_fClingPunchDamage"] = float(10)
	(c).fields["m_fClingSpazDelay"] = float(R.static_value("RDZombie", "SpazDelay"))
	(c).fields["m_fThreatTimer"] = float(0)
	(c).fields["m_bGiveCue"] = true
	(c).fields["m_fMoanTimer"] = float((float(R.static_value("RDZombie", "MoanDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoanDelayMax")) - float(R.static_value("RDZombie", "MoanDelayMin"))))))))
	(c).fields["m_iKillSoldierTick"] = R.coerce(R.static_value("RDZombie", "m_iGlobalKillSoldierTick"), "int")
	R.assign(c, "m_iGlobalKillSoldierTick", "RDZombie", R.binary("%", (float(R.static_value("RDZombie", "m_iGlobalKillSoldierTick")) + float(1)), R.static_value("RDZombie", "MaxGlobalKillSoldierTick")), "=")
	(c).fields["m_fPredictPlayerRatio"] = float((float(0.8) + float((float(randf()) * float(0.2)))))
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(((float(v_iMovementType) != float(R.static_value("RDZombie", "MovementType_Feed"))) and (float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_None"))))):
		pass
		if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_MadnessDay")))):
			pass
			(c).fields["m_bSpecialZombie"] = true
		else:
			pass
			(c).fields["m_bSpecialZombie"] = (float(randf()) < float(0.3))
		(c).fields["m_iSpecialZombieType"] = R.coerce(R.call_static("Maths", "RandomInt", [2]), "int")
	(c).fields["m_iMovementType"] = R.coerce(v_iMovementType, "int")
	c.fields["m_bCanBeShotByHelicopter"] = true
	if R.truth((float(v_iMovementType) == float(R.static_value("RDZombie", "MovementType_Feed")))):
		pass
		(c).fields["m_bSpawnFeedCorpse"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		c.fields["m_fSurvivalGuideDistance"] = float(40)
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Feeders"), "int")
	if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RescueMode")))):
		pass
		(c).fields["m_bFindBuilding"] = (float(randf()) < float(0.5))
		(c).fields["m_vRescuePosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
		(c).fields["m_bGoToRescuePosition"] = (c).fields.get("m_bFindBuilding")
	if R.truth(R.call_member(c, "CanHaveTint", [])):
		pass
		R.call_member(c, "SetRandomTint", [])
	return null

static func f_CanHaveTint(c: Variant, a: Array) -> Variant:
	return (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bZombieTints")
	return null

static func f_SetRandomTint(c: Variant, a: Array) -> Variant:
	var v_color: Variant = null
	(c).fields["m_bUsingColor"] = (float(randf()) < float(0.9))
	(c).fields["m_fColorRedMultiplier"] = float((float(1) - float((float(randf()) * float(0.05)))))
	(c).fields["m_fColorGreenMultiplier"] = float((float(1) - float((float(randf()) * float(0.05)))))
	(c).fields["m_fColorBlueMultiplier"] = float((float(1) - float((float(randf()) * float(0.05)))))
	(c).fields["m_iColorRedOffset"] = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.unary("-", 5), (float(randf()) * float(10)))]), "int")
	(c).fields["m_iColorGreenOffset"] = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.unary("-", 5), (float(randf()) * float(10)))]), "int")
	(c).fields["m_iColorBlueOffset"] = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("+", R.unary("-", 5), (float(randf()) * float(10)))]), "int")
	v_color = R.coerce(R.construct(R.klass("ColorTransform"), []), "ColorTransform")
	R.set_value(v_color, "redMultiplier", (c).fields.get("m_fColorRedMultiplier"), "=")
	R.set_value(v_color, "greenMultiplier", (c).fields.get("m_fColorGreenMultiplier"), "=")
	R.set_value(v_color, "blueMultiplier", (c).fields.get("m_fColorBlueMultiplier"), "=")
	R.set_value(v_color, "alphaMultiplier", 1, "=")
	R.set_value(v_color, "redOffset", (c).fields.get("m_iColorRedOffset"), "=")
	R.set_value(v_color, "greenOffset", (c).fields.get("m_iColorGreenOffset"), "=")
	R.set_value(v_color, "blueOffset", (c).fields.get("m_iColorBlueOffset"), "=")
	R.set_value(v_color, "alphaOffset", 0, "=")
	R.set_value(R.get_value(c.fields.get("m_MC"), "transform"), "colorTransform", v_color, "=")
	return null

static func f_GetBulletHitEffects(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_BlockedHeadHitEffects") if R.truth((c).fields.get("m_bBlockedHeadShot")) else c.fields.get("m_BulletHitEffects"))
	return null

static func f_GetBulletHitSoundMaterial(c: Variant, a: Array) -> Variant:
	return (R.static_value("RDEntity", "BulletHitSoundMaterial_Armor") if R.truth((c).fields.get("m_bBlockedHeadShot")) else c.fields.get("m_iBulletHitSoundMaterial"))
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "-=")
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	if R.truth((R.truth((c).fields.get("m_Corpse")) and c.fields.get("m_bEditorMode"))):
		pass
		((c).fields.get("m_Corpse")).fields["m_bDestroyMe"] = true
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "Destroy"), [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_i: Variant = 0
	var v_moanSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	v_i = R.coerce(0, "int")
	v_moanSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bEditorMode") and R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")))):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", R.binary("!=", R.invoke(R.get_value(c.fields.get("m_szFactoryName"), "indexOf"), ["Random"]), R.unary("-", 1)), "=")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	if R.truth((c).fields.get("m_bFirstInit")):
		pass
		(c).fields["m_fSpeedFactorX"] = float((float((float(0.9) + float((float(randf()) * float(0.2))))) * float((c).fields.get("m_fSpeedFactorX"))))
		(c).fields["m_fSpeedFactorZ"] = float((float((float(0.9) + float((float(randf()) * float(0.2))))) * float((c).fields.get("m_fSpeedFactorZ"))))
		if R.truth(c.fields.get("m_GameplayMode")):
			pass
			(c).fields["m_fSpeedFactorX"] = R.coerce(R.binary("*", (c).fields.get("m_fSpeedFactorX"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieSpeedFactor")), "Number")
			(c).fields["m_fSpeedFactorZ"] = R.coerce(R.binary("*", (c).fields.get("m_fSpeedFactorZ"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieSpeedFactor")), "Number")
			c.fields["m_fClingHP"] = R.coerce(R.binary("*", c.fields.get("m_fClingHP"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieHPFactor")), "Number")
			c.fields["m_fBodyHP"] = R.coerce(R.binary("*", c.fields.get("m_fBodyHP"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieHPFactor")), "Number")
			c.fields["m_fHeadHP"] = R.coerce(R.binary("*", c.fields.get("m_fHeadHP"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieHPFactor")), "Number")
			c.fields["m_fRightArmHP"] = R.coerce(R.binary("*", c.fields.get("m_fRightArmHP"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieHPFactor")), "Number")
			c.fields["m_fLeftArmHP"] = R.coerce(R.binary("*", c.fields.get("m_fLeftArmHP"), (c.fields.get("m_GameplayMode")).fields.get("m_fZombieHPFactor")), "Number")
			if R.truth((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
				pass
				c.fields["m_fHeadHP"] = R.coerce(R.binary("/", c.fields.get("m_fHeadHP"), (2 if R.truth(((R.truth(c.fields.get("m_GameplayMode")) and R.truth(R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) and R.binary("==", R.binary("as", c.fields.get("m_GameplayMode"), R.klass("RDGameModeChopperRescue")), null))) else 1)), "Number")
				c.fields["m_fBodyHP"] = R.coerce(R.binary("/", c.fields.get("m_fBodyHP"), (1.5 if R.truth(((R.truth(c.fields.get("m_GameplayMode")) and R.truth(R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))) and R.binary("==", R.binary("as", c.fields.get("m_GameplayMode"), R.klass("RDGameModeChopperRescue")), null))) else 1)), "Number")
		c.fields["m_fInitialClingHP"] = float(c.fields.get("m_fClingHP"))
		(c).fields["m_fGibHP"] = float(R.binary("/", c.fields.get("m_fBodyHP"), 5))
		(c).fields["m_bFirstInit"] = false
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "Update"), [v_fDeltaTime])
	if R.truth((c).fields.get("m_bSpawnFeedCorpse")):
		pass
		(c).fields["m_Corpse"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCorpse")]), R.klass("RDObstacleCorpse")), "RDObstacleCorpse")
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Corpse"), (c.fields.get("m_vLocation")).fields.get("X"), (c.fields.get("m_vLocation")).fields.get("Y"), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(0.1))])
		if R.truth(c.fields.get("m_bEditorMode")):
			pass
			R.call_member(c, "AttachEntity", [(c).fields.get("m_Corpse")])
		(c).fields["m_bSpawnFeedCorpse"] = false
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth((c).fields.get("m_bHitFinished")):
		pass
		if R.truth(R.unary("!", R.call_member(c, "HasSoundPlaying", []))):
			pass
			(c).fields["m_fDissapearTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDissapearTimer"), v_fDeltaTime), "Number")
			if R.truth(((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Shot"))) or (float((c).fields.get("m_fDissapearTimer")) > float(10)))):
				pass
				c.fields["m_bDestroyMe"] = true
		return null
	if R.truth(((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed"))) or (float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Down"))))):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		if R.truth((((c).fields.get("m_bGiveCue") and (float(v_fDistance) < float(R.static_value("RDZombie", "CueDistance")))) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iCueTick")))) > float(2000)))):
			pass
			if R.truth((c).fields.get("m_CueSound")):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_CueSound")])
				R.assign(c, "m_iCueTick", "RDZombie", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
			(c).fields["m_bGiveCue"] = false
	if R.truth(((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RescueMode"))) and (c).fields.get("m_bFindBuilding"))):
		pass
		v_i = R.coerce(0, "int")
		if R.truth(R.binary("<", v_i, R.get_value((c.fields.get("m_World")).fields.get("m_SafeZones"), "length"))):
			pass
			(c).fields["m_Building"] = R.coerce(R.binary("as", R.get_value((c.fields.get("m_World")).fields.get("m_SafeZones"), v_i), R.klass("RDBuildingNew")), "RDBuildingNew")
		(c).fields["m_bFindBuilding"] = false
		R.call_member((c).fields.get("m_Building"), "InitDoor", [])
		((c).fields.get("m_vRescuePosition")).fields["X"] = R.coerce((2 if R.truth(R.binary("<", (((c).fields.get("m_Building")).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Building")).fields.get("m_vLocation")).fields.get("Z")]))) else R.unary("-", 2)), "Number")
		((c).fields.get("m_vRescuePosition")).fields["Z"] = R.coerce(R.unary("-", 0.1), "Number")
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.call_member(c, "UpdateClingState", [v_fDeltaTime])
	else:
		pass
		if R.truth((((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded"))) and R.unary("!", R.call_member(c, "HasVoicePlaying", []))) and (float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Down"))))):
			pass
			(c).fields["m_fMoanTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fMoanTimer"), v_fDeltaTime), "Number")
			if R.truth((((float(v_fDistance) < float(R.static_value("RDZombie", "MoanDistance"))) and (float((c).fields.get("m_fMoanTimer")) < float(0))) and (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDZombie", "m_iMoanTick")))) > float(5)))):
				pass
				v_moanSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MoanSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_moanSound])
				R.assign(c, "m_iMoanTick", "RDZombie", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
				(c).fields["m_fMoanTimer"] = float((float(R.static_value("RDZombie", "MoanDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoanDelayMax")) - float(R.static_value("RDZombie", "MoanDelayMin"))))))))
		R.call_member(c, "UpdateZombie", [v_fDeltaTime])
	R.call_member(c, "UpdateBashingFence", [v_fDeltaTime])
	if R.truth((float((c).fields.get("m_fExplosionDelay")) > float(0))):
		pass
		(c).fields["m_fExplosionDelay"] = R.coerce(R.binary("-", (c).fields.get("m_fExplosionDelay"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fExplosionDelay")) <= float(0))):
			pass
			R.call_member(c, "Explode", [(c).fields.get("m_ExplodeInstigator")])
	R.call_member(c, "UpdateKillSoldier", [])
	return null

static func f_StartGetBackToPlayer(c: Variant, a: Array) -> Variant:
	var v_iRandom: Variant = 0
	(c).fields["m_bInJump"] = false
	v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [4]), "int")
	if R.truth((float(v_iRandom) == float(0))):
		pass
		(c).fields["m_fGetBackToPlayerTimer"] = float(2)
		R.call_member(c, "StartTrackingPlayer", [true])
	else:
		pass
		if R.truth(((float(v_iRandom) == float(1)) or (float(v_iRandom) == float(2)))):
			pass
			(c).fields["m_fGetBackToPlayerTimer"] = float(2)
			R.call_member(c, "StartRunAheadOfPlayer", [])
		else:
			pass
			if R.truth((float(v_iRandom) == float(3))):
				pass
				R.call_member(c, "StartJumpOnGroundAheadOfPlayer", [true])
	return null

static func f_UpdateZombie(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_fTimeFactor: Variant = NAN
	var v_fRoadArea: Variant = NAN
	var v_bSqueezed: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	v_fTimeFactor = float(NAN)
	v_fRoadArea = float(NAN)
	v_bSqueezed = false
	if R.truth(((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) or (float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Down")))) or c.fields.get("m_bHit")) or (c).fields.get("m_bExploded"))):
		pass
		return null
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			if R.truth(((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_TrackPlayer"))) and (float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Jump"))))):
				pass
				R.call_member(c, "StartGetBackToPlayer", [])
		else:
			pass
			if R.truth((c).fields.get("m_bRegisteredAsKillable")):
				pass
				R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
				(c).fields["m_bRegisteredAsKillable"] = false
			(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Straight"), "int")
	else:
		pass
		if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Straight")))):
			pass
			v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
			if R.truth((float(v_fDistance) < float(R.static_value("RDZombie", "VisionDetectDistance")))):
				pass
				(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_MoveToPlayer"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RescueMode")))):
				pass
				if R.truth((c).fields.get("m_Building")):
					pass
					if R.truth((c).fields.get("m_bWaitToEnterBuilding")):
						pass
						(c).fields["m_fWaitToEnterBuildingTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fWaitToEnterBuildingTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c).fields.get("m_fWaitToEnterBuildingTimer")) > float(2))):
							pass
							c.fields["m_bDestroyMe"] = true
							R.call_member(c.fields.get("m_GameplayMode"), "OnBuildingReachedByZombie", [(c).fields.get("m_Building"), c])
							R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
							R.call_member((c).fields.get("m_Building"), "BashDoor", [])
					else:
						pass
						if R.truth(R.binary("<", R.call_member(c.fields.get("m_vLocation"), "DistanceFrom", [((c).fields.get("m_Building")).fields.get("m_vLocation")]), 1)):
							pass
							(c).fields["m_bWaitToEnterBuilding"] = true
							R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorBashingSound"), true])
				else:
					pass
					if R.truth((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
						pass
						(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Stationary"), "int")
					else:
						pass
						v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
						if R.truth((float(v_fDistance) <= float(R.static_value("RDZombie", "ChopperKillDistance")))):
							pass
							if R.truth(R.call_member((c).fields.get("m_Player"), "CanBeKilledInChopper", [])):
								pass
								R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
								R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
								R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
					if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RescueMode")))):
						pass
						R.call_member(c, "UpdateMoveJumping", [v_fDeltaTime])
			else:
				pass
				if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RunAheadOfPlayer")))):
					pass
					(c).fields["m_fGetBackToPlayerTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fGetBackToPlayerTimer"), v_fDeltaTime), "Number")
					if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(5))))):
						pass
						v_fTimeFactor = float((float(1) + float((float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))) * float(2)))))
						(c).fields["m_fRunAheadTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fRunAheadTimer"), (float(v_fTimeFactor) * float(v_fDeltaTime))), "Number")
					if R.truth(((float((c).fields.get("m_fRunAheadTimer")) > float((c).fields.get("m_fRunAheadDuration"))) and (float((c).fields.get("m_fGetBackToPlayerTimer")) <= float(0)))):
						pass
						R.call_member(c, "PlayVoiceSound", [R.binary("as", R.call_member((c).fields.get("m_AttackSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))])
						R.call_member(c, "StartMoveToPlayer", [])
						(c).fields["m_bCanJumpOnPlayer"] = R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bChopperMode"))
					else:
						pass
						R.call_member(c, "UpdateMoveJumping", [v_fDeltaTime])
				else:
					pass
					if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_TrackPlayer")))):
						pass
						(c).fields["m_fGetBackToPlayerTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fGetBackToPlayerTimer"), v_fDeltaTime), "Number")
						if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(3))))):
							pass
							v_fTimeFactor = float((float(1) + float((float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))) * float(2)))))
							(c).fields["m_fRunAheadTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fRunAheadTimer"), v_fDeltaTime), "Number")
						v_fRoadArea = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
						v_bSqueezed = ((((float((c).fields.get("m_fRunAheadPosX")) < float(0)) and (float((float((c).fields.get("m_fRunAheadPosX")) + float(v_fRoadArea))) < float(1))) or ((float((c).fields.get("m_fRunAheadPosX")) > float(0)) and (float((float(v_fRoadArea) - float((c).fields.get("m_fRunAheadPosX")))) < float(1)))) and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRunAheadPosX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), 4))
						if R.truth((((float((c).fields.get("m_fRunAheadTimer")) > float((c).fields.get("m_fRunAheadDuration"))) or v_bSqueezed) and (float((c).fields.get("m_fGetBackToPlayerTimer")) <= float(0)))):
							pass
							if R.truth((((c).fields.get("m_bTrackingAndSideCling") and R.unary("!", R.call_member(c.fields.get("m_GameplayMode"), "HasActiveStoryDialog", []))) and (((float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))) and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [true]))) or ((float((c).fields.get("m_fRelativeLocationX")) >= float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))) and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [false])))))):
								pass
								R.call_member(c, "PlayVoiceSound", [R.binary("as", R.call_member((c).fields.get("m_AttackSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))])
								(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_MoveToPlayerSide"), "int")
							else:
								pass
								if R.truth((R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) or R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
									pass
									R.call_member(c, "StartJumpOnPlayer", [])
								else:
									pass
									R.call_member(c, "StartRunAheadOfPlayer", [])
						else:
							pass
							R.call_member(c, "UpdateMoveJumping", [v_fDeltaTime])
					else:
						pass
						if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Spawning")))):
							pass
							if R.truth((R.unary("!", (c).fields.get("m_bSpawnGetUp")) and (((((c).fields.get("m_bSpawnGoLeft") and (float((c).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fSpawnWalkTarget")))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float((c).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fSpawnWalkTarget"))))) or ((c).fields.get("m_bSpawnGoLeft") and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fRelativeLocationX"))))) or (R.unary("!", (c).fields.get("m_bSpawnGoLeft")) and (float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fRelativeLocationX"))))))):
								pass
								R.call_member(c, "StartMoveToPlayer", [])
						else:
							pass
							if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_ClingPatrol")))):
								pass
								if R.truth(((R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) or R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))) or (float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) > float(0)))):
									pass
									(c).fields["m_fStopClingPatrolTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fStopClingPatrolTimer"), v_fDeltaTime), "Number")
								else:
									pass
									(c).fields["m_fStopClingPatrolTimer"] = float(0)
								if R.truth((float((c).fields.get("m_fStopClingPatrolTimer")) > float((float((c).fields.get("m_fClingPatrolDistance")) * float(R.static_value("RDZombie", "StopClingPatrolDistanceToTimeRatio")))))):
									pass
									(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_MoveToPlayer"), "int")
								else:
									pass
									if R.truth((float((c).fields.get("m_iPatrolStep")) == float(R.static_value("RDZombie", "PatrolStep_Moving")))):
										pass
										if R.truth((((c).fields.get("m_bClingPatrolRight") and (float((c).fields.get("m_fRelativeLocationX")) >= float((c).fields.get("m_fClingPatrolPos")))) or (R.unary("!", (c).fields.get("m_bClingPatrolRight")) and (float((c).fields.get("m_fRelativeLocationX")) <= float((c).fields.get("m_fClingPatrolPos")))))):
											pass
											(c).fields["m_iPatrolStep"] = R.coerce(R.static_value("RDZombie", "PatrolStep_Waiting"), "int")
											(c).fields["m_fPatrolWaitTimer"] = float(0)
											(c).fields["m_fPatrolWaitDuration"] = float((float(R.static_value("RDZombie", "PatrolWaitDurationMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "PatrolWaitDurationMax")) - float(R.static_value("RDZombie", "PatrolWaitDurationMin"))))))))
									else:
										pass
										(c).fields["m_fPatrolWaitTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fPatrolWaitTimer"), v_fDeltaTime), "Number")
										if R.truth((float((c).fields.get("m_fPatrolWaitTimer")) > float((c).fields.get("m_fPatrolWaitDuration")))):
											pass
											R.call_member(c, "SetClingPatrolPosition", [])
											(c).fields["m_iPatrolStep"] = R.coerce(R.static_value("RDZombie", "PatrolStep_Moving"), "int")
							else:
								pass
								if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer")))):
									pass
									v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
									if R.truth((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
										pass
										(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Straight"), "int")
									else:
										pass
										if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) == float(0))):
											pass
											if R.truth(((R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))) and (float(v_fDistance) <= float((float(((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance")) + float(R.static_value("RDZombie", "ClingPatrolDistance"))))))):
												pass
												R.call_member(c, "StartClingPatrol", [((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance")])
												((c).fields.get("m_Player")).fields["m_fClingPatrolDistance"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance"), R.static_value("RDZombie", "ClingPatrolOffset")), "Number")
											else:
												pass
												if R.truth(R.binary("<=", v_fDistance, (R.static_value("RDZombie", "IdleClingDistance") if R.truth(R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", [])) else R.static_value("RDZombie", "IdleClingDistanceChopper")))):
													pass
													if R.truth(((c).fields.get("m_Player")).fields.get("m_bChopperMode")):
														pass
														if R.truth(R.call_member((c).fields.get("m_Player"), "CanBeKilledInChopper", [])):
															pass
															R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
													else:
														pass
														if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))):
															pass
															R.call_member(c, "StartCling", [R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))])
														else:
															pass
															R.call_member(c, "StartCling", [R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])])
														R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
														R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
										else:
											pass
											if R.truth(((((((c).fields.get("m_bDoCharge") and (float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))) and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) <= float((float(maxf(R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])), float(0.1))) * float(R.static_value("RDZombie", "ChargeDistance")))))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDZombie", "ChargeDistanceXMin"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))]), R.static_value("RDZombie", "ChargeDistanceXMax"))) and R.binary(">", R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", []), 0.15))):
												pass
												if R.truth((float(randf()) < float((float(0.1) + float((float(minf(float((float(0.5) + float((float((c.fields.get("m_GameplayMode")).fields.get("m_fLevelDifficulty")) * float(2))))), float(1))) * float(0.15))))))):
													pass
													R.call_member(c, "PlayVoiceSound", [R.binary("as", R.call_member((c).fields.get("m_ThreatSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))])
													(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Charge"), "int")
												(c).fields["m_bDoCharge"] = false
									if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
										pass
										if R.truth(((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer"))) and (c).fields.get("m_bCanJumpOnPlayer")) and (float(v_fDistance) < float(R.static_value("RDZombie", "JumpOnPlayerDistance")))) and (R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) or R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))))):
											pass
											if R.truth((float(randf()) < float(0.25))):
												pass
												R.call_member(c, "StartJumpOnPlayer", [])
											(c).fields["m_bCanJumpOnPlayer"] = false
										if R.truth(((R.truth(((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer"))) and (float(v_fDistance) < float(R.static_value("RDZombie", "JumpAheadWithNoClingSpotDistance"))))) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
											pass
											R.call_member(c, "StartJumpOnGroundAheadOfPlayer", [true])
										if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer")))):
											pass
											R.call_member(c, "UpdateMoveJumping", [v_fDeltaTime])
								else:
									pass
									if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Charge")))):
										pass
										v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
										if R.truth((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
											pass
											(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Straight"), "int")
										else:
											pass
											if R.truth((float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")) == float(0))):
												pass
												if R.truth(((R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))) and (float(v_fDistance) <= float((float(((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance")) + float(R.static_value("RDZombie", "ClingPatrolDistance"))))))):
													pass
													R.call_member(c, "StartClingPatrol", [((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance")])
													((c).fields.get("m_Player")).fields["m_fClingPatrolDistance"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fClingPatrolDistance"), R.static_value("RDZombie", "ClingPatrolOffset")), "Number")
												else:
													pass
													if R.truth(R.binary("<=", v_fDistance, (R.static_value("RDZombie", "IdleClingDistance") if R.truth(R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", [])) else R.static_value("RDZombie", "IdleClingDistanceChopper")))):
														pass
														if R.truth(((c).fields.get("m_Player")).fields.get("m_bChopperMode")):
															pass
															if R.truth(R.call_member((c).fields.get("m_Player"), "CanBeKilledInChopper", [])):
																pass
																R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
														else:
															pass
															if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))):
																pass
																R.call_member(c, "StartCling", [R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))])
															else:
																pass
																R.call_member(c, "StartCling", [R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])])
															R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
															R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
									else:
										pass
										if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayerSide")))):
											pass
											if R.truth(((R.truth(R.logical_or(R.logical_and((float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))), func(): return R.logical_or(R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [true]), func(): return (float(((c).fields.get("m_Player")).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_None"))))), func(): return R.logical_and((float((c).fields.get("m_fRelativeLocationX")) >= float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))), func(): return R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [false])))) or R.truth(R.call_member(c.fields.get("m_GameplayMode"), "HasActiveStoryDialog", []))) or ((c).fields.get("m_Player")).fields.get("m_bSwitchingDriver"))):
												pass
												R.call_member(c, "StartRunAheadOfPlayer", [])
											else:
												pass
												v_fDistance = R.coerce(R.call_member(c.fields.get("m_vLocation"), "DistanceFrom", [((c).fields.get("m_Player")).fields.get("m_vLocation")]), "Number")
												if R.truth((float(v_fDistance) < float(R.static_value("RDZombie", "SideClingDistance")))):
													pass
													R.call_member(c, "StartSideCling", [(float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))])
													R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
													R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
										else:
											pass
											if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_AlignWithPlayer")))):
												pass
												if R.truth((((c).fields.get("m_Player")).fields.get("m_bFailed") or ((c).fields.get("m_Player")).fields.get("m_bInEnding"))):
													pass
													(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Straight"), "int")
												else:
													pass
													v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float((c.fields.get("m_vLocation")).fields.get("X")))]), "Number")
													if R.truth((float(v_fDistance) < float(R.static_value("RDZombie", "NormalZombieLockInDistance")))):
														pass
														R.call_member(c, "StartMoveToPlayer", [])
	return null

static func f_StartMoveToPlayer(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_MoveToPlayer"), "int")
	(c).fields["m_fMoveJumpTimer"] = float(0)
	(c).fields["m_fMoveJumpDelay"] = float((float(R.static_value("RDZombie", "MoveJumpDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoveJumpDelayMax")) - float(R.static_value("RDZombie", "MoveJumpDelayMin"))))))))
	return null

static func f_StartAlignWithPlayer(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_AlignWithPlayer"), "int")
	(c).fields["m_fMoveJumpTimer"] = float(0)
	(c).fields["m_fMoveJumpDelay"] = float((float(R.static_value("RDZombie", "MoveJumpDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoveJumpDelayMax")) - float(R.static_value("RDZombie", "MoveJumpDelayMin"))))))))
	return null

static func f_StartTrackingPlayer(c: Variant, a: Array) -> Variant:
	var v_bTrackAndSideCling: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_TrackPlayer"), "int")
	(c).fields["m_fMoveJumpTimer"] = float(0)
	(c).fields["m_fMoveJumpDelay"] = float((float(R.static_value("RDZombie", "MoveJumpDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoveJumpDelayMax")) - float(R.static_value("RDZombie", "MoveJumpDelayMin"))))))))
	(c).fields["m_fRunAheadPosX"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (R.unary("-", 5) if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float(0))) else 5)), "Number")
	(c).fields["m_bTrackingPlayerRight"] = (float((c).fields.get("m_fRunAheadPosX")) > float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))
	(c).fields["m_fRunAheadTimer"] = float(0)
	(c).fields["m_fRunAheadDuration"] = float((float(R.static_value("RDZombie", "TrackPlayerDurationMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "TrackPlayerDurationMax")) - float(R.static_value("RDZombie", "TrackPlayerDurationMin"))))))))
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDZombie", "SpawnBehindDistance"))))
	R.call_member(c, "UpdateDepthPosition", [])
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_bTrackingAndSideCling"] = v_bTrackAndSideCling
	return null

static func f_StartRunAheadOfPlayer(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_RunAheadOfPlayer"), "int")
	(c).fields["m_fMoveJumpTimer"] = float(0)
	(c).fields["m_fMoveJumpDelay"] = float((float(R.static_value("RDZombie", "MoveJumpDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoveJumpDelayMax")) - float(R.static_value("RDZombie", "MoveJumpDelayMin"))))))))
	(c).fields["m_fRunAheadPosX"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (R.unary("-", 5) if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) > float(0))) else 5)), "Number")
	(c).fields["m_fRunAheadTimer"] = float(0)
	(c).fields["m_fRunAheadDuration"] = float((float(R.static_value("RDZombie", "RunAheadDurationMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "RunAheadDurationMax")) - float(R.static_value("RDZombie", "RunAheadDurationMin"))))))))
	return null

static func f_StartCling(c: Variant, a: Array) -> Variant:
	var v_color: Variant = null
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_color = R.coerce(null, "ColorTransform")
	(c).fields["m_bInJump"] = false
	(c).fields["m_bDoSpaz"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	c.fields["m_bSideCling"] = false
	c.fields["m_bClingLeft"] = v_bLeft
	if R.truth(((R.truth(v_bLeft) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))) or (R.truth(R.unary("!", v_bLeft)) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))))):
		pass
		R.invoke(R.resolve(c, "trace", "RDZombie"), ["FUCK: StartCling already taken"])
		c.fields["m_bDestroyMe"] = true
		return null
	R.call_member((c).fields.get("m_Player"), "SetClinger", [c, v_bLeft, c.fields.get("m_bSideCling")])
	if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		R.call_member((c).fields.get("m_Player"), "DoClingerBump", [v_bLeft])
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), (R.unary("-", 1) if R.truth(v_bLeft) else 1)), "Number")
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
	R.call_member(c, "UpdateDepthPosition", [])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	c.fields["m_bUseCurvyCamera"] = false
	R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
	c.fields["m_ClingMC"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [c]), "MovieClip")
	c.fields["m_ClingMCInside"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMCInside", [c]), "MovieClip")
	c.fields["m_ClingMCUnder"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMCUnder", [c]), "MovieClip")
	R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "addChild"), [c.fields.get("m_ClingMC")])
	if R.truth(c.fields.get("m_ClingMCUnder")):
		pass
		R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerUnder"), "addChild"), [c.fields.get("m_ClingMCUnder")])
	if R.truth((c).fields.get("m_bUsingColor")):
		pass
		v_color = R.coerce(R.construct(R.klass("ColorTransform"), []), "ColorTransform")
		R.set_value(v_color, "redMultiplier", (c).fields.get("m_fColorRedMultiplier"), "=")
		R.set_value(v_color, "greenMultiplier", (c).fields.get("m_fColorGreenMultiplier"), "=")
		R.set_value(v_color, "blueMultiplier", (c).fields.get("m_fColorBlueMultiplier"), "=")
		R.set_value(v_color, "alphaMultiplier", 1, "=")
		R.set_value(v_color, "redOffset", (c).fields.get("m_iColorRedOffset"), "=")
		R.set_value(v_color, "greenOffset", (c).fields.get("m_iColorGreenOffset"), "=")
		R.set_value(v_color, "blueOffset", (c).fields.get("m_iColorBlueOffset"), "=")
		R.set_value(v_color, "alphaOffset", 0, "=")
		R.set_value(R.get_value(c.fields.get("m_ClingMC"), "transform"), "colorTransform", v_color, "=")
		R.set_value(R.get_value(c.fields.get("m_ClingMCInside"), "transform"), "colorTransform", v_color, "=")
		if R.truth(c.fields.get("m_ClingMCUnder")):
			pass
			R.set_value(R.get_value(c.fields.get("m_ClingMCUnder"), "transform"), "colorTransform", v_color, "=")
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Start"), "int")
	R.call_member(c, "UpdateAnimation", [true])
	R.call_member(c, "UpdateClingAnimation", [])
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
		pass
		(c).fields["m_bCanJumpOnPlayer"] = false
	R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [(c).fields.get("m_iClingSurvivalItem")])
	(c).fields["m_fClingCummulativeDamage"] = float(0)
	return null

static func f_StartSideCling(c: Variant, a: Array) -> Variant:
	var v_color: Variant = null
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_color = R.coerce(null, "ColorTransform")
	(c).fields["m_bInJump"] = false
	R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	c.fields["m_bSideCling"] = true
	c.fields["m_bClingLeft"] = v_bLeft
	(c).fields["m_iSideGrindedTime"] = R.coerce(0, "int")
	R.call_member((c).fields.get("m_Player"), "SetClinger", [c, v_bLeft, c.fields.get("m_bSideCling")])
	R.call_member((c).fields.get("m_Player"), "DoClingerBump", [v_bLeft])
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), (R.unary("-", 1) if R.truth(v_bLeft) else 1)), "Number")
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
	R.call_member(c, "UpdateDepthPosition", [])
	(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
	c.fields["m_bUseCurvyCamera"] = false
	R.call_member((c).fields.get("m_Player"), "AttachEntity", [c])
	c.fields["m_ClingMC"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [c]), "MovieClip")
	c.fields["m_ClingMCInside"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMCInside", [c]), "MovieClip")
	c.fields["m_ClingMCUnder"] = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMCUnder", [c]), "MovieClip")
	R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerSide"), "addChild"), [c.fields.get("m_ClingMC")])
	if R.truth(c.fields.get("m_ClingMCUnder")):
		pass
		R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerUnder"), "addChild"), [c.fields.get("m_ClingMCUnder")])
	if R.truth((c).fields.get("m_bUsingColor")):
		pass
		v_color = R.coerce(R.construct(R.klass("ColorTransform"), []), "ColorTransform")
		R.set_value(v_color, "redMultiplier", (c).fields.get("m_fColorRedMultiplier"), "=")
		R.set_value(v_color, "greenMultiplier", (c).fields.get("m_fColorGreenMultiplier"), "=")
		R.set_value(v_color, "blueMultiplier", (c).fields.get("m_fColorBlueMultiplier"), "=")
		R.set_value(v_color, "alphaMultiplier", 1, "=")
		R.set_value(v_color, "redOffset", (c).fields.get("m_iColorRedOffset"), "=")
		R.set_value(v_color, "greenOffset", (c).fields.get("m_iColorGreenOffset"), "=")
		R.set_value(v_color, "blueOffset", (c).fields.get("m_iColorBlueOffset"), "=")
		R.set_value(v_color, "alphaOffset", 0, "=")
		R.set_value(R.get_value(c.fields.get("m_ClingMC"), "transform"), "colorTransform", v_color, "=")
		R.set_value(R.get_value(c.fields.get("m_ClingMCInside"), "transform"), "colorTransform", v_color, "=")
		if R.truth(c.fields.get("m_ClingMCUnder")):
			pass
			R.set_value(R.get_value(c.fields.get("m_ClingMCUnder"), "transform"), "colorTransform", v_color, "=")
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideStart"), "int")
	R.call_member(c, "UpdateAnimation", [true])
	R.call_member(c, "UpdateClingAnimation", [])
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [(c).fields.get("m_iClingSurvivalItem")])
	return null

static func f_UpdateClingState(c: Variant, a: Array) -> Variant:
	var v_threatSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_threatSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((((((c).fields.get("m_bCanSpaz") and (c).fields.get("m_bDoSpaz")) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed"))) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))) and (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))) and ((float(c.fields.get("m_fLeftArmHP")) > float(0)) or (float(c.fields.get("m_fRightArmHP")) > float(0))))):
		pass
		(c).fields["m_fSpazTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSpazTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fSpazTimer")) >= float((c).fields.get("m_fClingSpazDelay")))):
			pass
			(c).fields["m_fSpazTimer"] = float(0)
			R.call_member(c, "PlayVoiceSound", [R.binary("as", R.call_member((c).fields.get("m_AttackSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))])
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_Spaz"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
			(c).fields["m_bDoSpaz"] = false
			(c).fields["m_fClingSpazDelay"] = float(R.static_value("RDZombie", "SpazDelay"))
	if R.truth(((R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bFailed")) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding"))) and ((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle")))))):
		pass
		if R.truth((R.unary("!", c.fields.get("m_bSideCling")) and ((R.truth(c.fields.get("m_bClingLeft")) and R.truth(R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [true]))) or (R.truth(R.unary("!", c.fields.get("m_bClingLeft"))) and R.truth(R.call_member((c).fields.get("m_Player"), "IsSideClingerSpotTaken", [false])))))):
			pass
			(c).fields["m_fPunchTimer"] = float(0)
		else:
			pass
			(c).fields["m_fPunchTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fPunchTimer"), (float((float(v_fDeltaTime) * R.num((1 if R.truth((float(c.fields.get("m_fLeftArmHP")) > float(0))) else 0.75)))) * R.num((1 if R.truth((float(c.fields.get("m_fRightArmHP")) > float(0))) else 0.75)))), "Number")
			if R.truth((float((c).fields.get("m_fPunchTimer")) >= float((c).fields.get("m_fClingPunchDelay")))):
				pass
				R.call_member(c, "PlayVoiceSound", [R.binary("as", R.call_member((c).fields.get("m_ThreatSounds"), "GetRandomValue", []), R.klass("DTSpacialSound"))])
				c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_Kill") if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))) else R.static_value("RDZombie", "ClingState_SideKill")), "int")
				R.call_member(R.static_value("RDGame", "Instance"), "PlayCustomMusic", [(R.static_value("RDGame", "Instance")).fields.get("m_TenseMusic"), 0, true])
				R.call_member(c, "UpdateClingAnimation", [])
	if R.truth((R.unary("!", R.call_member(c, "HasVoicePlaying", [])) and R.unary("!", c.fields.get("m_bHit")))):
		pass
		(c).fields["m_fThreatTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fThreatTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fThreatTimer")) <= float(0))):
			pass
			(c).fields["m_fThreatTimer"] = float((float(R.static_value("RDZombie", "ThreatDelayMin")) + float((float(randf()) * float(R.static_value("RDZombie", "ThreatDelayRandom"))))))
			v_threatSound = R.coerce(R.binary("as", R.invoke(R.get_value(((c).fields.get("m_ThreatSounds") if R.truth((float(randf()) > float(0.5))) else (c).fields.get("m_AttackSounds")), "GetRandomValue"), []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_threatSound])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fAdjustRatio: Variant = NAN
	var v_fDistance: Variant = NAN
	var v_vMoveTarget: Variant = null
	var v_bRescueMode: Variant = false
	var v_bIsMutant: Variant = false
	var v_fDistanceRatio: Variant = NAN
	var v_fSpeedRatioX: Variant = NAN
	var v_fSpeedRatioZ: Variant = NAN
	var v_fSpeedZ: Variant = NAN
	var v_fSpeedX: Variant = NAN
	var v_storyMode: Variant = null
	var v_fPlayerPosX: Variant = NAN
	var v_fPredictRatio: Variant = NAN
	var v_fRoadArea: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fAdjustRatio = float(NAN)
	v_fDistance = float(NAN)
	v_vMoveTarget = R.coerce(null, "DTVector3D")
	v_bRescueMode = false
	v_bIsMutant = false
	v_fDistanceRatio = float(NAN)
	v_fSpeedRatioX = float(NAN)
	v_fSpeedRatioZ = float(NAN)
	v_fSpeedZ = float(NAN)
	v_fSpeedX = float(NAN)
	v_storyMode = R.coerce(null, "RDGameModeStory")
	v_fPlayerPosX = float(NAN)
	v_fPredictRatio = float(NAN)
	v_fRoadArea = float(NAN)
	if R.truth(((((((((c.fields.get("m_bEditorMode") or (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))) or c.fields.get("m_bHit")) or (c).fields.get("m_bExploded")) or (float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_BashingFence")))) or (float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed")))) or (float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Down")))) or ((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Spawning"))) and (c).fields.get("m_bSpawnGetUp"))) or ((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))) > float(150))))):
		pass
		return null
	if R.truth(R.unary("!", (c).fields.get("m_bStartPosXSet"))):
		pass
		(c).fields["m_fStartPosX"] = float((c.fields.get("m_vLocation")).fields.get("X"))
		(c).fields["m_bStartPosXSet"] = true
	if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Jump")))):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bEndingJump"))):
			pass
			((c).fields.get("m_vJumpAheadPlayerPosition")).fields["X"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"))
			((c).fields.get("m_vJumpAheadPlayerPosition")).fields["Y"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y"))
			((c).fields.get("m_vJumpAheadPlayerPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(4)))
			if R.truth((float((c).fields.get("m_iJumpType")) == float(R.static_value("RDZombie", "JumpType_OnHighway")))):
				pass
				((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((c).fields.get("m_fHighwayJumpStartDistance"))))
				((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((c).fields.get("m_fHighwayJumpDistance"))))
				((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), (c).fields.get("m_fHighwayJumpSideDistance")), "Number")
				((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
			else:
				pass
				if R.truth((float((c).fields.get("m_iJumpType")) == float(R.static_value("RDZombie", "JumpType_FromHood")))):
					pass
					((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(1)))
					((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float(4)))
			if R.truth((float((c).fields.get("m_iJumpTargetType")) == float(R.static_value("RDZombie", "JumpTarget_Player")))):
				pass
				if R.truth((R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
					pass
					R.call_member(c, "InterruptJumpToPlayer", [])
				else:
					pass
					v_fAdjustRatio = R.coerce((0.75 if R.truth((c).fields.get("m_bIsAlphaMutant")) else 0.5), "Number")
					((c).fields.get("m_vJumpOnPlayerEndPosition")).fields["X"] = float((float(((c).fields.get("m_vJumpOnPlayerStartPosition")).fields.get("X")) + float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float(((c).fields.get("m_vJumpOnPlayerStartPosition")).fields.get("X")))) * float(v_fAdjustRatio)))))
					((c).fields.get("m_vJumpOnPlayerEndPosition")).fields["Y"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y"))
					((c).fields.get("m_vJumpOnPlayerEndPosition")).fields["Z"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
			(c).fields["m_fJumpRatio"] = float(minf(float((float((c).fields.get("m_fJumpRatio")) + float((float((c).fields.get("m_fActualJumpTimeSpeed")) * float(v_fDeltaTime))))), float(1)))
			(c.fields.get("m_vLocation")).fields["X"] = float((float(((c).fields.get("m_vJumpStartLocation")).fields.get("X")) + float((float(R.binary("/", (float(cos(R.num(R.binary("+", R.get_value(R.klass("Math"), "PI"), (float((c).fields.get("m_fJumpRatio")) * R.num(R.get_value(R.klass("Math"), "PI"))))))) + float(1)), 2)) * float((float(((c).fields.get("m_vJumpEndLocation")).fields.get("X")) - float(((c).fields.get("m_vJumpStartLocation")).fields.get("X"))))))))
			(c.fields.get("m_vLocation")).fields["Z"] = float((float(((c).fields.get("m_vJumpStartLocation")).fields.get("Z")) + float((float(R.binary("/", (float(cos(R.num(R.binary("+", R.get_value(R.klass("Math"), "PI"), (float((c).fields.get("m_fJumpRatio")) * R.num(R.get_value(R.klass("Math"), "PI"))))))) + float(1)), 2)) * float((float(((c).fields.get("m_vJumpEndLocation")).fields.get("Z")) - float(((c).fields.get("m_vJumpStartLocation")).fields.get("Z"))))))))
			(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [(float(((c).fields.get("m_vJumpStartLocation")).fields.get("Y")) + float((float(sin(float((float((c).fields.get("m_fJumpRatio")) * R.num(R.get_value(R.klass("Math"), "PI")))))) * float((c).fields.get("m_fActualJumpHeight"))))), (float(((c).fields.get("m_vJumpEndLocation")).fields.get("Y")) + float((float(sin(float((float((c).fields.get("m_fJumpRatio")) * R.num(R.get_value(R.klass("Math"), "PI")))))) * float((c).fields.get("m_fActualJumpHeight"))))), (c).fields.get("m_fJumpRatio")]), "Number")
			R.call_member(c, "UpdateDepthPosition", [])
			if R.truth(((c).fields.get("m_bCheckForChopperCollision") and R.truth((c.fields.get("m_GameplayMode")).fields.get("m_HelicopterAlly")))):
				pass
				v_fDistance = R.coerce(R.call_member(c.fields.get("m_vLocation"), "DistanceFrom", [((c.fields.get("m_GameplayMode")).fields.get("m_HelicopterAlly")).fields.get("m_vLocation")]), "Number")
				if R.truth((float(v_fDistance) < float(1.5))):
					pass
					R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_HelicopterAlly"), "OnHitByJumpingMutant", [])
					(c).fields["m_bCheckForChopperCollision"] = false
			if R.truth((R.unary("!", (c).fields.get("m_bSwitchedToDynamicLayer")) and (float((c).fields.get("m_fJumpRatio")) > float(0.5)))):
				pass
				R.call_member(c.fields.get("m_World"), "RemoveEntityFromLayer", [c])
				R.call_member(c.fields.get("m_World"), "AddEntityToLayer", [c, R.static_value("RDEntity", "Layer_Dynamic")])
				(c).fields["m_bSwitchedToDynamicLayer"] = true
			if R.truth(R.binary(">=", (c).fields.get("m_fJumpRatio"), (0.85 if R.truth((float((c).fields.get("m_iJumpTargetType")) == float(R.static_value("RDZombie", "JumpTarget_Player")))) else 1))):
				pass
				R.call_member(c, "EndJump", [])
		(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	else:
		pass
		if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_SpawnOnBuilding")))):
			pass
			(c).fields["m_fBuildingSpawnTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fBuildingSpawnTimer"), v_fDeltaTime), "Number")
			if R.truth(((float((c).fields.get("m_fBuildingSpawnTimer")) >= float(4)) or (R.unary("!", R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", [])) and (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) > float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDZombie", "JumpOffBuildingDistance")))))))):
				pass
				R.call_member(c, "StartJumpOffBuilding", [])
		else:
			pass
			v_vMoveTarget = R.coerce((c).fields.get("m_vMoveTarget"), "DTVector3D")
			(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fRelativeLocationX"))
			(v_vMoveTarget).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
			v_bRescueMode = R.binary("!=", R.binary("as", c.fields.get("m_GameplayMode"), R.klass("RDGameModeChopperRescue")), null)
			v_bIsMutant = (float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))
			v_fDistanceRatio = R.coerce(R.call_member(c, "GetDistanceRatio", []), "Number")
			v_fSpeedRatioX = R.coerce((0 if R.truth((v_bRescueMode or v_bIsMutant)) else (float((float((float((float(1) - float(v_fDistanceRatio))) * float((float(1) - float(v_fDistanceRatio))))) * float((float(1) - float((float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))) * float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))))))))) * float(minf(float((float(0.5) + float((float((c.fields.get("m_GameplayMode")).fields.get("m_fLevelDifficulty")) * float(2))))), float(1))))), "Number")
			if R.truth((((c).fields.get("m_Player")).fields.get("m_bChopperMode") and R.unary("!", v_bRescueMode))):
				pass
				v_storyMode = R.coerce(R.binary("as", c.fields.get("m_GameplayMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
				v_fSpeedZ = float((float((float((c).fields.get("m_fSpeedFactorZ")) * R.num(R.static_value("RDZombie", "BaseSpeedZ")))) * R.num((1 if R.truth((R.truth(v_storyMode) and (v_storyMode).fields.get("m_bIsHardcore"))) else 0.75))))
			else:
				pass
				if R.truth(v_bIsMutant):
					pass
					v_fSpeedRatioZ = R.coerce(((float((float(v_fDistanceRatio) * float(v_fDistanceRatio))) * float(v_fDistanceRatio)) if R.truth(v_bRescueMode) else 0), "Number")
				else:
					pass
					v_fSpeedRatioZ = R.coerce((v_fDistanceRatio if R.truth(v_bRescueMode) else (float((float(v_fDistanceRatio) * float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))))) * float(minf(float((float(0.5) + float((float((c.fields.get("m_GameplayMode")).fields.get("m_fLevelDifficulty")) * float(2))))), float(1))))), "Number")
				v_fSpeedZ = float((float((float((c).fields.get("m_fSpeedFactorZ")) * R.num(R.static_value("RDZombie", "BaseSpeedZ")))) * float((float(1) + float((float((float(v_fSpeedRatioZ) * float(4))) * float(minf(float((float(0.5) + float((float((c.fields.get("m_GameplayMode")).fields.get("m_fLevelDifficulty")) * float(20))))), float(1)))))))))
			if R.truth(((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer"))))):
				pass
				v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float((float(1.5) + float((float((float(1) - R.num(R.call_member(c, "GetDistanceRatio", [])))) * float(1.5)))))))
			else:
				pass
				v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float((float(1) + float((float(v_fSpeedRatioX) * float(1.1)))))))
			if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Straight")))):
				pass
				(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fRelativeLocationX"))
				(v_vMoveTarget).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float(20)))
			else:
				pass
				if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayer")))):
					pass
					v_fPlayerPosX = float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))
					if R.truth((R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.truth(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
						pass
						(v_vMoveTarget).fields["X"] = float(v_fPlayerPosX)
					else:
						pass
						if R.truth((R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
							pass
							(v_vMoveTarget).fields["X"] = R.coerce(R.binary("+", v_fPlayerPosX, (R.unary("-", 0.5) if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))) else 0.5)), "Number")
						else:
							pass
							if R.truth(R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))):
								pass
								(v_vMoveTarget).fields["X"] = float((float(v_fPlayerPosX) - float(0.5)))
							else:
								pass
								if R.truth(R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))):
									pass
									(v_vMoveTarget).fields["X"] = float((float(v_fPlayerPosX) + float(0.5)))
					v_fPredictRatio = float((float(0.1) + float((float((float((float((float(1) - float(pow(float((float(1) - R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])))), float(2))))) * float(0.85))) * float((c).fields.get("m_fPredictPlayerRatio")))) * float(minf(float((float(0.5) + float((float((c.fields.get("m_GameplayMode")).fields.get("m_fLevelDifficulty")) * float(2))))), float(1)))))))
					(v_vMoveTarget).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((float(v_fPredictRatio) * float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))))))
				else:
					pass
					if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Charge")))):
						pass
						(v_vMoveTarget).fields["X"] = float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))
						(v_vMoveTarget).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
						v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float((float(1) + float((R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])) * float(1.5)))))))
					else:
						pass
						if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RescueMode")))):
							pass
							if R.truth(((c).fields.get("m_bGoToRescuePosition") and R.truth((c).fields.get("m_Building")))):
								pass
								(v_vMoveTarget).fields["X"] = float((float(((c).fields.get("m_Building")).fields.get("m_fRelativeLocationX")) + float(((c).fields.get("m_vRescuePosition")).fields.get("X"))))
								(v_vMoveTarget).fields["Z"] = float((float((((c).fields.get("m_Building")).fields.get("m_vLocation")).fields.get("Z")) + float(((c).fields.get("m_vRescuePosition")).fields.get("Z"))))
								if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) <= float((v_vMoveTarget).fields.get("Z")))):
									pass
									(c).fields["m_bGoToRescuePosition"] = false
							if R.truth(R.unary("!", (c).fields.get("m_bGoToRescuePosition"))):
								pass
								if R.truth((c).fields.get("m_Building")):
									pass
									(v_vMoveTarget).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_Building")).fields.get("m_fRelativeLocationX"), (0.5 if R.truth((float(((c).fields.get("m_Building")).fields.get("m_fRelativeLocationX")) < float(0))) else R.unary("-", 0.5))), "Number")
									(v_vMoveTarget).fields["Z"] = float(maxf(float((float((((c).fields.get("m_Building")).fields.get("m_vLocation")).fields.get("Z")) - float(0.1))), float(0)))
								else:
									pass
									(v_vMoveTarget).fields["X"] = float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))
									(v_vMoveTarget).fields["Z"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
						else:
							pass
							if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_MoveToPlayerSide")))):
								pass
								(v_vMoveTarget).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (R.unary("-", 1) if R.truth((float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))) else 1)), "Number")
								(v_vMoveTarget).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) * float(0.9)))))
								v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float(3)))
							else:
								pass
								if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_AlignWithPlayer")))):
									pass
									(v_vMoveTarget).fields["X"] = float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))
									(v_vMoveTarget).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) * float(0.75)))))
								else:
									pass
									if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_RunAheadOfPlayer")))):
										pass
										v_fSpeedZ = R.coerce(R.call_member(c, "GetRunAheadSpeed", [15]), "Number")
										v_fSpeedX = float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX"))))
										(v_vMoveTarget).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(10)))
										if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
											pass
											(c).fields["m_fRunAheadPosX"] = R.coerce((5 if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) < float(0))) else R.unary("-", 5)), "Number")
											v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float(4)))
										else:
											pass
											if R.truth(R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c).fields.get("m_fRelativeLocationX")) - float((c).fields.get("m_fRunAheadPosX")))]), 0.1)):
												pass
												v_fRoadArea = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
												(c).fields["m_fRunAheadPosX"] = R.coerce(R.call_static("Maths", "Clamp", [R.binary("+", R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), R.unary("-", 6)), (float(randf()) * float(12))), R.unary("-", v_fRoadArea), v_fRoadArea]), "Number")
										(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fRunAheadPosX"))
									else:
										pass
										if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_TrackPlayer")))):
											pass
											v_fSpeedZ = R.coerce(R.call_member(c, "GetRunAheadSpeed", [5]), "Number")
											v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float(2)))
											(v_vMoveTarget).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float(10)))
											if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
												pass
												(c).fields["m_fRunAheadPosX"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (5 if R.truth((float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")) < float(0))) else R.unary("-", 5))), "Number")
												(c).fields["m_bTrackingPlayerRight"] = (float((c).fields.get("m_fRunAheadPosX")) > float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))
												v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float(4)))
											else:
												pass
												(c).fields["m_fRunAheadPosX"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), (5 if R.truth((c).fields.get("m_bTrackingPlayerRight")) else R.unary("-", 5))), "Number")
												v_fRoadArea = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
												(c).fields["m_fRunAheadPosX"] = R.coerce(R.call_static("Maths", "Clamp", [(c).fields.get("m_fRunAheadPosX"), R.unary("-", v_fRoadArea), v_fRoadArea]), "Number")
											(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fRunAheadPosX"))
										else:
											pass
											if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Spawning")))):
												pass
												(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fSpawnWalkTarget"))
												(v_vMoveTarget).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
												if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
													pass
													v_fSpeedX = float((float((float((c).fields.get("m_fSpeedFactorX")) * R.num(R.static_value("RDZombie", "BaseSpeedX")))) * float(2)))
											else:
												pass
												if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_ClingPatrol")))):
													pass
													if R.truth((float((c).fields.get("m_iPatrolStep")) == float(R.static_value("RDZombie", "PatrolStep_Moving")))):
														pass
														(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fClingPatrolPos"))
														(v_vMoveTarget).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
													else:
														pass
														(v_vMoveTarget).fields["X"] = float((c).fields.get("m_fRelativeLocationX"))
														(v_vMoveTarget).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
														v_fSpeedX = float(0)
														v_fSpeedZ = float(0)
			R.call_member(c, "GetRelativeMoveToDelta", [(c).fields.get("m_fRelativeLocationX"), v_vMoveTarget, v_fSpeedX, v_fSpeedZ, v_fDeltaTime, (c).fields.get("m_vMoveToDelta")])
			if R.truth(((float(((c).fields.get("m_vMoveToDelta")).fields.get("X")) != float(0)) or (float(((c).fields.get("m_vMoveToDelta")).fields.get("Z")) != float(0)))):
				pass
				R.call_member(c.fields.get("m_World"), "MoveEntity", [c, ((c).fields.get("m_vMoveToDelta")).fields.get("X"), 0, ((c).fields.get("m_vMoveToDelta")).fields.get("Z"), (c).fields.get("m_Player"), (c.fields.get("m_World")).fields.get("m_Fences")])
			(c).fields["m_fRelativeLocationX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), ((c).fields.get("m_vMoveToDelta")).fields.get("X")), "Number")
			(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c).fields.get("m_fRelativeLocationX")), "Number")
			(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	return null

static func f_GetRunAheadSpeed(c: Variant, a: Array) -> Variant:
	var v_fSpeed: Variant = NAN
	var v_fRatio: Variant = NAN
	var v_fDistanceAhead: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fSpeed = float(((c).fields.get("m_Player")).fields.get("m_fMaxSpeed"))
	v_fRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fDistanceAhead)))), v_fDistanceAhead), R.unary("-", 1), 1]), "Number")
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fDistanceAhead))))):
		pass
		v_fSpeed = R.coerce(R.call_static("Maths", "Lerp", [v_fSpeed, (float(v_fSpeed) * float(0.6)), R.call_static("Maths", "AbsNumber", [v_fRatio])]), "Number")
	else:
		pass
		v_fSpeed = R.coerce(R.call_static("Maths", "Lerp", [v_fSpeed, (float(v_fSpeed) * float(1.4)), R.call_static("Maths", "AbsNumber", [v_fRatio])]), "Number")
	return v_fSpeed
	return null

static func f_OnEndAnim(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(((((((((((R.binary("==", c.fields.get("m_szAnim"), "SideHit") or R.binary("==", c.fields.get("m_szAnim"), "PrecisionHit")) or R.binary("==", c.fields.get("m_szAnim"), "FrontHit")) or R.binary("==", c.fields.get("m_szAnim"), "HeadlessHit")) or R.binary("==", c.fields.get("m_szAnim"), "RollOverHit")) or R.binary("==", c.fields.get("m_szAnim"), "GibHit")) or R.binary("==", c.fields.get("m_szAnim"), "GibHitAir")) or R.binary("==", c.fields.get("m_szAnim"), "FeedKill")) or R.binary("==", c.fields.get("m_szAnim"), "HeadshotSide")) or R.binary("==", c.fields.get("m_szAnim"), "HeadshotFront")) or R.binary("==", c.fields.get("m_szAnim"), "HeadshotBack"))):
		pass
		(c).fields["m_bCanBeHitForBlood"] = false
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
		(c).fields["m_bHitFinished"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		if R.truth((c).fields.get("m_bRegisteredAsKillable")):
			pass
			R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
			(c).fields["m_bRegisteredAsKillable"] = false
		return null
	if R.truth((((R.binary("==", c.fields.get("m_szAnim"), "JumpFrontAir") or R.binary("==", c.fields.get("m_szAnim"), "JumpBackAir")) or R.binary("==", c.fields.get("m_szAnim"), "JumpBuildingWait")) or R.binary("==", c.fields.get("m_szAnim"), "FrontPose"))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
		return null
	if R.truth(R.binary("==", c.fields.get("m_szAnim"), "FeedStandUp")):
		pass
		(c).fields["m_bFeedStandingUp"] = false
		(c).fields["m_bSpawnGetUp"] = false
		if R.truth((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Spawning")))):
			pass
			R.call_member(c, "StartMoveToPlayer", [])
			return null
	else:
		pass
		if R.truth(((R.binary("==", c.fields.get("m_szAnim"), "JumpFrontStart") or R.binary("==", c.fields.get("m_szAnim"), "JumpBackStart")) or R.binary("==", c.fields.get("m_szAnim"), "JumpBuildingStart"))):
			pass
			(c).fields["m_bStartingJump"] = false
			(c).fields["m_bJumpFromBuilding"] = false
		else:
			pass
			if R.truth((R.binary("==", c.fields.get("m_szAnim"), "JumpFrontEnd") or R.binary("==", c.fields.get("m_szAnim"), "JumpBackEnd"))):
				pass
				(c).fields["m_bInJump"] = false
				(c).fields["m_bEndingJump"] = false
				(c).fields["m_iMovementType"] = R.coerce((c).fields.get("m_iPreJumpMovementType"), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnEndAnim"), [])
	return null

static func f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_szNewAnim: Variant = null
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_szNewAnim = R.coerce("FrontPose", "String")
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		v_szNewAnim = R.coerce("Clinging", "String")
	else:
		pass
		if R.truth((c).fields.get("m_bExploded")):
			pass
			if R.truth(((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and R.binary(">", (c.fields.get("m_vLocation")).fields.get("Y"), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), 0.2)))):
				pass
				v_szNewAnim = R.coerce("GibHitAir", "String")
			else:
				pass
				v_szNewAnim = R.coerce("GibHit", "String")
		else:
			pass
			if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Down")))):
				pass
				v_szNewAnim = R.coerce("Down", "String")
			else:
				pass
				if R.truth(c.fields.get("m_bHit")):
					pass
					if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
						pass
						if R.truth(((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp")))):
							pass
							v_szNewAnim = R.coerce("FeedKill", "String")
						else:
							pass
							if R.truth((c).fields.get("m_bShotSide")):
								pass
								v_szNewAnim = R.coerce("HeadshotSide", "String")
							else:
								pass
								if R.truth((c).fields.get("m_bShotBack")):
									pass
									v_szNewAnim = R.coerce("HeadshotBack", "String")
								else:
									pass
									v_szNewAnim = R.coerce("HeadshotFront", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Gib")))):
							pass
							v_szNewAnim = R.coerce(("GibHitAir" if R.truth(R.binary(">", (c.fields.get("m_vLocation")).fields.get("Y"), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), 0.2))) else "GibHit"), "String")
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
					if R.truth((c).fields.get("m_bWaitToEnterBuilding")):
						pass
						v_szNewAnim = R.coerce("WalkSide", "String")
					else:
						pass
						if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_SpawnOnBuilding")))):
							pass
							v_szNewAnim = R.coerce("JumpBuildingWait", "String")
						else:
							pass
							if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed")))):
								pass
								v_szNewAnim = R.coerce(("FeedStandUp" if R.truth((c).fields.get("m_bFeedStandingUp")) else "Feed"), "String")
							else:
								pass
								if R.truth(((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Spawning"))) and (c).fields.get("m_bSpawnGetUp"))):
									pass
									v_szNewAnim = R.coerce("FeedStandUp", "String")
								else:
									pass
									if R.truth((c).fields.get("m_bInJump")):
										pass
										if R.truth((c).fields.get("m_bStartingJump")):
											pass
											v_szNewAnim = R.coerce(("JumpBuildingStart" if R.truth((c).fields.get("m_bJumpFromBuilding")) else ("JumpFrontStart" if R.truth((c).fields.get("m_bJumpFront")) else "JumpBackStart")), "String")
										else:
											pass
											if R.truth((c).fields.get("m_bEndingJump")):
												pass
												v_szNewAnim = R.coerce(("JumpFrontEnd" if R.truth((c).fields.get("m_bJumpFront")) else "JumpBackEnd"), "String")
											else:
												pass
												v_szNewAnim = R.coerce(("JumpFrontAir" if R.truth((c).fields.get("m_bJumpFront")) else "JumpBackAir"), "String")
									else:
										pass
										if R.truth(R.unary("!", R.call_member(c.fields.get("m_vVelocity"), "IsZero", []))):
											pass
											((c).fields.get("m_vVelocityDir")).fields["X"] = float((c.fields.get("m_vVelocity")).fields.get("X"))
											((c).fields.get("m_vVelocityDir")).fields["Z"] = float((c.fields.get("m_vVelocity")).fields.get("Z"))
											R.call_member((c).fields.get("m_vVelocityDir"), "Normalize", [])
											if R.truth((R.binary(">", (R.num(R.call_static("Maths", "AbsNumber", [((c).fields.get("m_vVelocityDir")).fields.get("X")])) * float(1.5)), R.call_static("Maths", "AbsNumber", [((c).fields.get("m_vVelocityDir")).fields.get("Z")])) and R.unary("!", (c).fields.get("m_FenceToBash")))):
												pass
												R.set_value(c, "m_iSideMoveFrames", 1, "+=")
											else:
												pass
												(c).fields["m_iSideMoveFrames"] = R.coerce(0, "int")
											if R.truth((float((c).fields.get("m_iSideMoveFrames")) > float(2))):
												pass
												v_szNewAnim = R.coerce(("RunSide" if R.truth((c).fields.get("m_bRunning")) else "WalkSide"), "String")
												c.fields["m_bFlippedX"] = (float((c.fields.get("m_vVelocity")).fields.get("X")) <= float(0))
											else:
												pass
												if R.truth((float(((c).fields.get("m_vVelocityDir")).fields.get("Z")) > float(0))):
													pass
													v_szNewAnim = R.coerce(("RunBack" if R.truth((c).fields.get("m_bRunning")) else "WalkFront"), "String")
												else:
													pass
													v_szNewAnim = R.coerce(("RunFront" if R.truth((c).fields.get("m_bRunning")) else "WalkFront"), "String")
	if R.truth(R.binary("!=", v_szNewAnim, "")):
		pass
		R.call_member(c, "PlayAnim", [v_szNewAnim, v_bForce])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return R.logical_and((((R.unary("!", c.fields.get("m_bHit")) or ((c).fields.get("m_bCanBeHitForBlood") and R.binary("==", v_entity, (c).fields.get("m_Player")))) and R.unary("!", (c).fields.get("m_bExploded"))) and R.unary("!", (c).fields.get("m_bInJump"))), func(): return R.logical_or(R.logical_or(R.logical_and(R.logical_and(R.logical_and((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_TrackPlayer"))), func(): return (c).fields.get("m_iMovementType")), func(): return R.static_value("RDZombie", "MovementType_RunAheadOfPlayer")), func(): return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))), func(): return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))), func(): return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Obstacle")))))
	return null

static func f_HandleCarCollision(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_gruntSound: Variant = null
	var v_fSpeed: Variant = NAN
	var v_bCling: Variant = false
	var v_fClingChance: Variant = NAN
	var v_clingSound: Variant = null
	var v_getOnHoodSound: Variant = null
	var v_iHitAlign: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	v_fSpeed = float(NAN)
	v_bCling = false
	v_fClingChance = float(NAN)
	v_clingSound = R.coerce(null, "DTSpacialSound")
	v_getOnHoodSound = R.coerce(null, "DTSpacialSound")
	v_iHitAlign = R.coerce(0, "int")
	if R.truth(R.binary("==", v_entity, (c).fields.get("m_Player"))):
		pass
		if R.truth((c).fields.get("m_bCanBeHitForBlood")):
			pass
			if R.truth(R.unary("!", (c).fields.get("m_bHitForBlood"))):
				pass
				R.call_member((c).fields.get("m_Player"), "OnHitZombieForBlood", [c])
				(c).fields["m_bHitForBlood"] = true
				v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlaySoundOnActor", [v_hitSound])
				if R.truth((c).fields.get("m_bCanBeHitForBloodWithAnim")):
					pass
					c.fields["m_bFlippedX"] = (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
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
			v_fSpeed = float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))
			v_bCling = false
			if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
				pass
				if R.truth((float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))):
					pass
					v_bCling = R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))
				else:
					pass
					v_bCling = R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))
			else:
				pass
				if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
					pass
					if R.truth((float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))):
						pass
						v_bCling = R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]))
					else:
						pass
						v_bCling = R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))
				else:
					pass
					if R.truth((float(c.fields.get("m_fBodyHP")) >= float((c).fields.get("m_fGibHP")))):
						pass
						v_fClingChance = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingChance", [(float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"))), c]), "Number")
						v_bCling = (((float(v_fClingChance) > float(0)) and (float(randf()) < float(v_fClingChance))) and ((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed"))) or (c).fields.get("m_bFeedStandingUp")))
			if R.truth(v_bCling):
				pass
				if R.truth(((c).fields.get("m_Player")).fields.get("m_bChopperMode")):
					pass
					if R.truth(R.call_member((c).fields.get("m_Player"), "CanBeKilledInChopper", [])):
						pass
						R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
						v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlaySoundOnActor", [v_clingSound])
						v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
				else:
					pass
					R.call_member(c, "StartCling", [(float((c).fields.get("m_fRelativeLocationX")) < float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))])
					v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlaySoundOnActor", [v_clingSound])
					v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
				return true
			c.fields["m_bHit"] = true
			c.fields["m_bCanBeShotByHelicopter"] = false
			if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
				pass
				(c).fields["m_bHitFinished"] = true
				R.call_member((c).fields.get("m_Player"), "OnRollOverGrub", [c])
				R.call_member(c, "DoRollOverEffect", [])
				v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlaySoundOnActor", [v_hitSound])
				if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
					pass
					R.call_member(c, "Explode", [(c).fields.get("m_Player")])
			else:
				pass
				if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
				else:
					pass
					if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinMultiHitSpeed")))):
						pass
						if R.truth(((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp")))):
							pass
							(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_RollOver"), "int")
						else:
							pass
							if R.truth((float(c.fields.get("m_fBodyHP")) < float((c).fields.get("m_fGibHP")))):
								pass
								(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
								R.call_member((c).fields.get("m_Player"), "OnPreciseZombieHit", [c])
							else:
								pass
								v_iHitAlign = R.coerce(R.call_member((c).fields.get("m_Player"), "GetHitAlign", [c]), "int")
								if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
									pass
									if R.truth((float(v_fSpeed) >= float(R.static_value("RDHumanoid", "MinGibSpeed")))):
										pass
										(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
										R.call_member((c).fields.get("m_Player"), "OnPreciseZombieHit", [c])
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
				v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlaySoundOnActor", [v_hitSound])
				if R.truth((float((c).fields.get("m_iHitType")) != float(R.static_value("RDHumanoid", "HitType_Gib")))):
					pass
					v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_gruntSound])
				else:
					pass
					R.call_member(c, "StopVoiceSound", [])
				if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
					pass
					R.call_member(c, "Explode", [(c).fields.get("m_Player")])
				R.call_member(c, "UpdateAnimation", [true])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieKilled", [c, (c).fields.get("m_iHitType")])
	else:
		pass
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
		c.fields["m_bFlippedX"] = (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "UpdateAnimation", [true])
		if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
			pass
			R.call_member(c, "Explode", [v_entity])
	return false
	return null

static func f_OnClingAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("!=", v_szEvent, "ClingAnimEatFlash")):
		pass
		if R.truth(R.binary("==", v_szEvent, "PrepareForHoodJump")):
			pass
			R.call_member(c, "PrepareForHoodJump", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "ClingGetInside")):
				pass
				R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerInside"), "addChild"), [c.fields.get("m_ClingMCInside")])
				R.invoke(R.get_value(c.fields.get("m_ClingMCInside"), "gotoAndPlay"), [(("KillAlpha" if R.truth((c).fields.get("m_bIsAlphaMutant")) else "Kill") if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))) else 1)])
				R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
				if R.truth(R.get_value(c.fields.get("m_ClingMC"), "parent")):
					pass
					R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
				if R.truth(c.fields.get("m_ClingMCUnder")):
					pass
					if R.truth(R.get_value(c.fields.get("m_ClingMCUnder"), "parent")):
						pass
						R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerUnder"), "removeChild"), [c.fields.get("m_ClingMCUnder")])
					R.invoke(R.get_value(c.fields.get("m_ClingMCUnder"), "stop"), [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "PunchSound")):
					pass
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PunchSound")])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "ElbowSound")):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ElbowSound")])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PunchHoodRight")):
							pass
							if R.truth((float(c.fields.get("m_fRightArmHP")) > float(0))):
								pass
								R.call_member(c, "OnPunchHood", [])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "PunchHoodLeft")):
								pass
								if R.truth((float(c.fields.get("m_fLeftArmHP")) > float(0))):
									pass
									R.call_member(c, "OnPunchHood", [])
							else:
								pass
								if R.truth(R.binary("==", v_szEvent, "PlayClingSound")):
									pass
									R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
									R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
								else:
									pass
									if R.truth(R.binary("==", v_szEvent, "StartGrubFrontGib")):
										pass
										(c).fields["m_bAllowGrubFrontGib"] = true
									else:
										pass
										if R.truth(R.binary("==", v_szEvent, "EndGrubFrontGib")):
											pass
											(c).fields["m_bAllowGrubFrontGib"] = false
										else:
											pass
											R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnClingAnimEvent"), [v_szEvent])
	return null

static func f_HideClingMCs(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndStop"), [1])
	if R.truth(R.get_value(c.fields.get("m_ClingMC"), "parent")):
		pass
		if R.truth(c.fields.get("m_bSideCling")):
			pass
			R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerSide"), "removeChild"), [c.fields.get("m_ClingMC")])
		else:
			pass
			R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerHood"), "removeChild"), [c.fields.get("m_ClingMC")])
	if R.truth(c.fields.get("m_ClingMCUnder")):
		pass
		R.invoke(R.get_value(c.fields.get("m_ClingMCUnder"), "gotoAndStop"), [1])
		if R.truth(R.get_value(c.fields.get("m_ClingMCUnder"), "parent")):
			pass
			R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerUnder"), "removeChild"), [c.fields.get("m_ClingMCUnder")])
	R.invoke(R.get_value(c.fields.get("m_ClingMCInside"), "gotoAndStop"), [1])
	if R.truth(R.get_value(c.fields.get("m_ClingMCInside"), "parent")):
		pass
		R.invoke(R.get_value(((c).fields.get("m_Player")).fields.get("m_ClingerContainerInside"), "addChild"), [c.fields.get("m_ClingMCInside")])
	return null

static func f_OnClingAnimationEnded(c: Variant, a: Array) -> Variant:
	if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Attack")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_Land")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_Spaz"))))):
		pass
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
	else:
		pass
		if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideLeft"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_CollideRight"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
				pass
				c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
				c.fields["m_bClingRightArmLost"] = true
			else:
				pass
				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
					pass
					c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Idle"), "int")
					c.fields["m_bClingLeftArmLost"] = true
				else:
					pass
					if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Gib")))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_FrontGib"))))):
						pass
						if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff"))) and (float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))) and (float(c.fields.get("m_fLeftArmHP")) > float(0))) and (float(c.fields.get("m_fRightArmHP")) > float(0)))):
							pass
							R.call_member((c).fields.get("m_Player"), "ResetStartWhenOurPowersCombine", [])
						R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
						R.call_member(c, "HideClingMCs", [])
						if R.truth(((((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_GetOff"))) and (float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))) and (float(c.fields.get("m_fLeftArmHP")) > float(0))) and (float(c.fields.get("m_fRightArmHP")) > float(0)))):
							pass
							c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
							c.fields["m_bHit"] = false
							c.fields["m_fClingHP"] = float(c.fields.get("m_fInitialClingHP"))
							c.fields["m_bUseCurvyCamera"] = true
							R.call_member((c).fields.get("m_Player"), "DetachEntity", [c])
							R.call_member(c, "StartGetBackToPlayer", [])
							R.call_member((c).fields.get("m_Player"), "OnClingerComingBack", [])
						else:
							pass
							(c).fields["m_bHitFinished"] = true
							R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
							if R.truth((c).fields.get("m_bRegisteredAsKillable")):
								pass
								R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
								(c).fields["m_bRegisteredAsKillable"] = false
						return null
					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill")))):
						pass
						R.call_member((c).fields.get("m_Player"), "ResetStartWhenOurPowersCombine", [])
						R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
						R.call_member(c, "HideClingMCs", [])
						R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
						if R.truth((c).fields.get("m_bRegisteredAsKillable")):
							pass
							R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
							(c).fields["m_bRegisteredAsKillable"] = false
						return null
					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))):
						pass
						if R.truth((c).fields.get("m_bHasShakyIdle")):
							pass
							(c).fields["m_bShakyIdle"] = (float(randf()) < float(0.25))
					else:
						pass
						if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_JumpOff")))):
							pass
							R.call_member((c).fields.get("m_Player"), "ResetStartWhenOurPowersCombine", [])
							R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
							R.call_member(c, "HideClingMCs", [])
							R.call_member(c, "StartJumpOffHood", [])
						else:
							pass
							if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideStart"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle"))))):
								pass
								c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideIdle"), "int")
							else:
								pass
								if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideGrinding")))):
									pass
									if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float((c).fields.get("m_iSideGrindedTime")))) < float(5))):
										pass
										c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideGrinding"), "int")
									else:
										pass
										c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideIdle"), "int")
										R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SideGrindingSound")])
								else:
									pass
									if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideShot")))):
										pass
										R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
										R.call_member(c, "HideClingMCs", [])
										(c).fields["m_bHitFinished"] = true
										R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
										if R.truth((c).fields.get("m_bRegisteredAsKillable")):
											pass
											R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
											(c).fields["m_bRegisteredAsKillable"] = false
										return null
									if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideKill")))):
										pass
										R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
										R.call_member(c, "HideClingMCs", [])
										R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
										if R.truth((c).fields.get("m_bRegisteredAsKillable")):
											pass
											R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
											(c).fields["m_bRegisteredAsKillable"] = false
										return null
									if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideGrindOff")))):
										pass
										c.fields["m_bHit"] = false
										c.fields["m_fClingHP"] = float(c.fields.get("m_fInitialClingHP"))
										R.call_member((c).fields.get("m_Player"), "OnSideClingerOff", [c.fields.get("m_bClingLeft")])
										R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
										R.call_member(c, "HideClingMCs", [])
										c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
										c.fields["m_bUseCurvyCamera"] = true
										R.call_member((c).fields.get("m_Player"), "DetachEntity", [c])
										R.call_member(c, "StartGetBackToPlayer", [])
										R.call_member((c).fields.get("m_Player"), "OnClingerComingBack", [])
									else:
										pass
										if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideElbow"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SidePunch"))))):
											pass
											c.fields["m_bHit"] = false
											c.fields["m_fClingHP"] = float(c.fields.get("m_fInitialClingHP"))
											R.call_member((c).fields.get("m_Player"), "OnSideClingerOff", [c.fields.get("m_bClingLeft")])
											R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
											R.call_member(c, "HideClingMCs", [])
											c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
											c.fields["m_bUseCurvyCamera"] = true
											R.call_member((c).fields.get("m_Player"), "DetachEntity", [c])
											R.call_member(c, "StartGetBackToPlayer", [])
											R.call_member((c).fields.get("m_Player"), "OnClingerComingBack", [])
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnClingAnimationEnded"), [])
	return null

static func f_GetStartClingAnim(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
		pass
		if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")):
			pass
			return (("StartHummerUpgradeLeft" if R.truth(c.fields.get("m_bClingLeft")) else "StartHummerUpgradeRight") if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0))) else "StartHummer")
		return (("StartCarUpgradeLeft" if R.truth(c.fields.get("m_bClingLeft")) else "StartCarUpgradeRight") if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0))) else ("StartCarLeft" if R.truth(c.fields.get("m_bClingLeft")) else "StartCarRight"))
	return R.binary("+", "Start", ("Alpha" if R.truth((c).fields.get("m_bIsAlphaMutant")) else ""))
	return null

static func f_UpdateClingAnimation(c: Variant, a: Array) -> Variant:
	var v_szClingAnimation: Variant = null
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		return null
	v_szClingAnimation = R.coerce("", "String")
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Start")))):
		pass
		v_szClingAnimation = R.coerce(R.call_member(c, "GetStartClingAnim", []), "String")
	else:
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Idle")))):
			pass
			v_szClingAnimation = R.coerce(("ShakyIdle" if R.truth((c).fields.get("m_bShakyIdle")) else "Idle"), "String")
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
								v_szClingAnimation = R.coerce(R.call_member(c, "GetClingShotAnimation", []), "String")
							else:
								pass
								if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Kill")))):
									pass
									v_szClingAnimation = R.coerce(("KillAlpha" if R.truth((c).fields.get("m_bIsAlphaMutant")) else "Kill"), "String")
								else:
									pass
									if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
										pass
										v_szClingAnimation = R.coerce("LoseLeftArm", "String")
									else:
										pass
										if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
											pass
											v_szClingAnimation = R.coerce("LoseRightArm", "String")
										else:
											pass
											if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Gib")))):
												pass
												v_szClingAnimation = R.coerce(R.call_member(c, "GetClingGibAnimation", []), "String")
											else:
												pass
												if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_FrontGib")))):
													pass
													v_szClingAnimation = R.coerce("FrontGib", "String")
												else:
													pass
													if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_JumpOff")))):
														pass
														v_szClingAnimation = R.coerce("JumpOff", "String")
													else:
														pass
														if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_Land")))):
															pass
															v_szClingAnimation = R.coerce("Land", "String")
														else:
															pass
															if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideStart")))):
																pass
																v_szClingAnimation = R.coerce("start", "String")
															else:
																pass
																if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle")))):
																	pass
																	v_szClingAnimation = R.coerce("struggle", "String")
																else:
																	pass
																	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideGrinding")))):
																		pass
																		v_szClingAnimation = R.coerce("grinding", "String")
																	else:
																		pass
																		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideGrindOff")))):
																			pass
																			v_szClingAnimation = R.coerce("grindoff", "String")
																		else:
																			pass
																			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideShot")))):
																				pass
																				v_szClingAnimation = R.coerce("headshot", "String")
																			else:
																				pass
																				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideKill")))):
																					pass
																					v_szClingAnimation = R.coerce("kill", "String")
																				else:
																					pass
																					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideElbow")))):
																						pass
																						v_szClingAnimation = R.coerce("diane_elbow", "String")
																					else:
																						pass
																						if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SidePunch")))):
																							pass
																							v_szClingAnimation = R.coerce("cocheta_punch", "String")
																						else:
																							pass
																							if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_Spaz")))):
																								pass
																								v_szClingAnimation = R.coerce("PunchHood", "String")
	if R.truth(R.binary("!=", v_szClingAnimation, "")):
		pass
		R.invoke(R.get_value(c.fields.get("m_ClingMC"), "gotoAndPlay"), [v_szClingAnimation])
		if R.truth(c.fields.get("m_ClingMCUnder")):
			pass
			R.invoke(R.get_value(c.fields.get("m_ClingMCUnder"), "gotoAndPlay"), [v_szClingAnimation])
	return null

static func f_GetClingShotAnimation(c: Variant, a: Array) -> Variant:
	return ("ShotLeft" if R.truth(c.fields.get("m_bClingLeft")) else "Shot")
	return null

static func f_GetClingGibAnimation(c: Variant, a: Array) -> Variant:
	return "Gib"
	return null

static func f_OnSideCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_bRightSide: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	if R.truth((((((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_Idle"))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_CollideLeft")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_CollideRight")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
			pass
			c.fields["m_bClingLeftArmLost"] = true
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
				pass
				c.fields["m_bClingRightArmLost"] = true
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(R.static_value("RDZombie", "SideCollisionClingDamage")))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_CollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
			pass
			if R.truth((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
				pass
				R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieGotOff", [c, true])
	return null

static func f_OnDirectCollision(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	var v_fSpeedRatio: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bRightSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bAllowGrubFrontGib")):
		pass
		c.fields["m_fClingHP"] = float(0)
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_FrontGib"), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieGotOff", [c, false])
		(c).fields["m_bAllowGrubFrontGib"] = false
		return null
	if R.truth((((((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_Idle"))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_CollideLeft")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_CollideRight")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))) and (float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))):
		pass
		return null
	if R.truth((float(c.fields.get("m_fClingHP")) > float(0))):
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
			pass
			c.fields["m_bClingLeftArmLost"] = true
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
				pass
				c.fields["m_bClingRightArmLost"] = true
		c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float((float(v_fSpeedRatio) * float(R.static_value("RDZombie", "DirectCollisionClingDamage")))))), float(0)))
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDHumanoid", "ClingState_GetOff") if R.truth((float(c.fields.get("m_fClingHP")) == float(0))) else (R.static_value("RDHumanoid", "ClingState_CollideRight") if R.truth(v_bRightSide) else R.static_value("RDHumanoid", "ClingState_CollideLeft"))), "int")
		R.call_member(c, "UpdateClingAnimation", [])
		v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_collisionSound])
		if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
			pass
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieGotOff", [c, false])
	return null

static func f_OnForceGetOff(c: Variant, a: Array) -> Variant:
	var v_collisionSound: Variant = null
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	c.fields["m_bHit"] = true
	c.fields["m_bCanBeShotByHelicopter"] = false
	c.fields["m_fClingHP"] = float(0)
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
	R.call_member(c, "UpdateClingAnimation", [])
	v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlayVoiceSound", [v_collisionSound])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieGotOff", [c, false])
	return null

static func f_OnForceEndStruggle(c: Variant, a: Array) -> Variant:
	var v_bFemale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	c.fields["m_fClingHP"] = float(0)
	c.fields["m_bHit"] = true
	c.fields["m_bCanBeShotByHelicopter"] = false
	c.fields["m_iClingState"] = R.coerce((R.static_value("RDZombie", "ClingState_SideElbow") if R.truth(v_bFemale) else R.static_value("RDZombie", "ClingState_SidePunch")), "int")
	R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_ForceRemove(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "ResetStartWhenOurPowersCombine", [])
	R.call_member((c).fields.get("m_Player"), "SetClinger", [null, c.fields.get("m_bClingLeft"), c.fields.get("m_bSideCling")])
	R.call_member(c, "HideClingMCs", [])
	(c).fields["m_bHitFinished"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	if R.truth((c).fields.get("m_bRegisteredAsKillable")):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "-=")
		(c).fields["m_bRegisteredAsKillable"] = false
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_hitSound: Variant = null
	var v_missile: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_missile = R.coerce(null, "RDMissileAlly")
	if R.truth((R.unary("!", (c).fields.get("m_bExploded")) and R.unary("!", c.fields.get("m_bHit")))):
		pass
		v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_hitSound])
		(c).fields["m_bExploded"] = true
		(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
		R.call_member(c, "UpdateAnimation", [true])
		R.call_member(c, "StopVoiceSound", [])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
		if R.truth(R.binary("as", v_instigator, R.klass("RDPlayer"))):
			pass
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieExploded", [c])
		v_missile = R.coerce(R.binary("as", v_entity, R.klass("RDMissileAlly")), "RDMissileAlly")
		if R.truth((R.unary("!", v_missile) or R.binary("==", v_instigator, (c).fields.get("m_Player")))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCollateralKills", 1, "+=")
			if R.truth((float((R.num(R.invoke(R.resolve(c, "getTimer", "RDZombie"), [])) - float(R.static_value("RDZombie", "m_iExplosionComboTime")))) < float(5))):
				pass
				R.assign(c, "m_iExplosionCombo", "RDZombie", 1, "+=")
			else:
				pass
				R.assign(c, "m_iExplosionCombo", "RDZombie", 0, "=")
			R.assign(c, "m_iExplosionComboTime", "RDZombie", R.invoke(R.resolve(c, "getTimer", "RDZombie"), []), "=")
			if R.truth(((R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")) and (float(R.static_value("RDZombie", "m_iExplosionCombo")) >= float(1))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "Demolitionist"))))):
				pass
				R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "Demolitionist")])
				R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		R.call_member(c, "AddGroundBlood", [5, true])
		if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
			pass
			(c).fields["m_ExplodeInstigator"] = R.coerce(v_instigator, "RDEntity")
			(c).fields["m_fExplosionDelay"] = float(0.1)
	return null

static func f_GetBlockedHeadShotChance(c: Variant, a: Array) -> Variant:
	return (0.75 if R.truth((((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Friday13th"))) or ((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_Halloween"))) and (float((c).fields.get("m_iSpecialZombieType")) == float(1)))) and (c).fields.get("m_bSpecialZombie"))) else 0)
	return null

static func f_GetBlockedTorsoShotChance(c: Variant, a: Array) -> Variant:
	return 0
	return null

static func f_GetDamageMultiplayer(c: Variant, a: Array) -> Variant:
	return (2 if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed")))) else 1)
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
		pass
		c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
		if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
			pass
			c.fields["m_bHit"] = true
			c.fields["m_bCanBeShotByHelicopter"] = false
			(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Shot") if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed")))) else R.static_value("RDHumanoid", "HitType_Gib")), "int")
			if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
			else:
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
			c.fields["m_bCanBeShotByHelicopter"] = false
			(c.fields.get("m_vVelocity")).fields["X"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
			R.call_member(c, "StopVoiceSound", [])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotByHelicopter", [c, (c).fields.get("m_iHitType")])
			R.call_member(c, "UpdateAnimation", [true])
			R.call_member(c, "AddGroundBlood", [5])
			if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
				pass
				R.call_member(c, "Explode", [v_instigator])
		else:
			pass
			if R.truth((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp"))) and (float(randf()) > float(0.9)))):
				pass
				(c).fields["m_bFeedStandingUp"] = true
				c.fields["m_bCanBeShotByHelicopter"] = true
				R.call_member(c, "UpdateAnimation", [true])
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
			R.call_member(c, "AddGroundBlood", [0.5])
	return null

static func f_OnSoldierBulletHit(c: Variant, a: Array) -> Variant:
	var v_bulletHitSounds: Variant = null
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_bulletHitSounds = R.coerce(null, "Array")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", c.fields.get("m_bHit"))):
		pass
		v_bulletHitSounds = R.coerce(R.call_member(c, "GetBulletHitSounds", []), "Array")
		if R.truth(v_bulletHitSounds):
			pass
			R.call_member(c, "PlaySoundOnActor", [R.get_value(v_bulletHitSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_bulletHitSounds, "length")]))])
		if R.truth((float(c.fields.get("m_fHeadHP")) > float(0))):
			pass
			c.fields["m_fHeadHP"] = R.coerce(R.binary("-", c.fields.get("m_fHeadHP"), v_iDamage), "Number")
			if R.truth((float(c.fields.get("m_fHeadHP")) <= float(0))):
				pass
				c.fields["m_bHit"] = true
				c.fields["m_bCanBeShotByHelicopter"] = false
				if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
				else:
					pass
					(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
					(c).fields["m_bCanBeHitForBlood"] = true
					(c).fields["m_bCanBeHitForBloodWithAnim"] = true
				(c).fields["m_bShotSide"] = R.binary("==", c.fields.get("m_szAnim"), "WalkSide")
				(c).fields["m_bShotBack"] = (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))
				c.fields["m_bFlippedX"] = R.unary("!", c.fields.get("m_bFlippedX"))
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
				(c.fields.get("m_vVelocity")).fields["X"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
				R.call_member(c, "StopVoiceSound", [])
				R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
				R.call_member(c, "UpdateAnimation", [true])
				if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
					pass
					R.call_member(c, "Explode", [(c).fields.get("m_Player")])
			else:
				pass
				if R.truth((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp"))) and (float(randf()) > float(0.9)))):
					pass
					(c).fields["m_bFeedStandingUp"] = true
					R.call_member(c, "UpdateAnimation", [true])
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_bHead: Variant = false
	var v_fPerlinY: Variant = NAN
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	v_bHead = false
	v_fPerlinY = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	if R.truth(R.unary("!", c.fields.get("m_bHit"))):
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
						c.fields["m_bCanBeShotByHelicopter"] = false
						v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
						if R.truth(((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies") or (float((c.fields.get("m_vLocation")).fields.get("Y")) > float((float(v_fPerlinY) + float(0.5)))))):
							pass
							(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Gib"), "int")
						else:
							pass
							(c).fields["m_iHitType"] = R.coerce(R.static_value("RDHumanoid", "HitType_Shot"), "int")
							(c).fields["m_bCanBeHitForBlood"] = true
							(c).fields["m_bCanBeHitForBloodWithAnim"] = true
							(c.fields.get("m_vLocation")).fields["Y"] = float(v_fPerlinY)
						(c).fields["m_bShotSide"] = R.binary("==", c.fields.get("m_szAnim"), "WalkSide")
						(c).fields["m_bShotBack"] = (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))
						c.fields["m_bFlippedX"] = R.unary("!", c.fields.get("m_bFlippedX"))
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
						(c.fields.get("m_vVelocity")).fields["X"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
						(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
						R.call_member(c, "StopVoiceSound", [])
						R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
						R.call_member(c, "UpdateAnimation", [true])
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotDown", [c, (c).fields.get("m_iHitType")])
						R.call_member(c, "HandleImTheAlphaAchievement", [])
						R.call_member(c, "AddGroundBlood", [5])
						if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
							pass
							R.call_member(c, "Explode", [(c).fields.get("m_Player")])
					else:
						pass
						if R.truth((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp"))) and (float(randf()) > float(0.9)))):
							pass
							(c).fields["m_bFeedStandingUp"] = true
							R.call_member(c, "UpdateAnimation", [true])
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
						R.call_member(c, "AddGroundBlood", [0.5])
		else:
			pass
			if R.truth((float(c.fields.get("m_fBodyHP")) > float(0))):
				pass
				if R.truth((((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float(v_iDamageType) == float(R.static_value("RDDamageType", "BlastingBullet")))) and (float(randf()) < float(0.05)))):
					pass
					v_iDamage = R.coerce(c.fields.get("m_fBodyHP"), "int")
				c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), v_iDamage), "Number")
				if R.truth((float(c.fields.get("m_fBodyHP")) <= float(0))):
					pass
					c.fields["m_bHit"] = true
					(c).fields["m_iHitType"] = R.coerce((R.static_value("RDHumanoid", "HitType_Shot") if R.truth((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed")))) else R.static_value("RDHumanoid", "HitType_Gib")), "int")
					c.fields["m_bCanBeShotByHelicopter"] = false
					if R.truth((float((c).fields.get("m_iHitType")) == float(R.static_value("RDHumanoid", "HitType_Shot")))):
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
					else:
						pass
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
					(c.fields.get("m_vVelocity")).fields["X"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
					(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
					R.call_member(c, "StopVoiceSound", [])
					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DoorBashingSound")])
					R.call_member(c, "UpdateAnimation", [true])
					R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotDown", [c, (c).fields.get("m_iHitType")])
					R.call_member(c, "HandleImTheAlphaAchievement", [])
					R.call_member(c, "AddGroundBlood", [5])
					if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
						pass
						R.call_member(c, "Explode", [(c).fields.get("m_Player")])
				else:
					pass
					if R.truth((((float((c).fields.get("m_iMovementType")) == float(R.static_value("RDZombie", "MovementType_Feed"))) and R.unary("!", (c).fields.get("m_bFeedStandingUp"))) and (float(randf()) > float(0.9)))):
						pass
						(c).fields["m_bFeedStandingUp"] = true
						R.call_member(c, "UpdateAnimation", [true])
					if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
						pass
						v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_gruntSound])
					R.call_member(c, "AddGroundBlood", [0.5])
		R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	(c).fields["m_bBlockedHeadShot"] = false
	return null

static func f_DamageHead(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iMinHP: Variant = 0
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_JumpOff"))))):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedHeadShotChance", []))):
		pass
		return true
	R.call_member((c).fields.get("m_Player"), "AddShootingBlood", [])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.05))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fPunchTimer"] = float(maxf(float((float((c).fields.get("m_fPunchTimer")) - float(R.static_value("RDZombie", "HeadDamageKillDelay")))), float(0)))
		(c).fields["m_fSpazTimer"] = float(maxf(float((float((c).fields.get("m_fSpazTimer")) - float(R.static_value("RDZombie", "HeadDamageKillDelay")))), float(0)))
	(c).fields["m_fClingCummulativeDamage"] = R.coerce(R.binary("+", (c).fields.get("m_fClingCummulativeDamage"), (float(v_iDamage) * float(2.5))), "Number")
	v_iMinHP = R.coerce((1 if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))) else 0), "int")
	c.fields["m_fHeadHP"] = float(maxf(float((float(c.fields.get("m_fHeadHP")) - float((float(v_iDamage) * R.num((4 if R.truth(c.fields.get("m_bSideCling")) else 1.5)))))), float(v_iMinHP)))
	if R.truth((float(c.fields.get("m_fHeadHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
			pass
			c.fields["m_bClingLeftArmLost"] = true
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
				pass
				c.fields["m_bClingRightArmLost"] = true
		if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Gib"), "int")
			R.call_member(c, "Explode", [(c).fields.get("m_Player")])
		else:
			pass
			c.fields["m_iClingState"] = R.coerce((R.static_value("RDZombie", "ClingState_SideShot") if R.truth(c.fields.get("m_bSideCling")) else R.static_value("RDHumanoid", "ClingState_Shot")), "int")
			if R.truth(c.fields.get("m_bSideCling")):
				pass
				R.call_member((c).fields.get("m_Player"), "OnHeadShotClinger", [])
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_Shot")))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ClingerSlideSound")])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member(c, "StopVoiceSound", [])
		R.call_member((c).fields.get("m_Player"), "OnZombieHeadShot", [])
		R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotOffHood", [c, c.fields.get("m_iClingState")])
		if R.truth((((R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")) and (float(c.fields.get("m_fLeftArmHP")) == float(0))) and (float(c.fields.get("m_fRightArmHP")) == float(0))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "PieceByPiece"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "PieceByPiece")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		R.call_member(c, "HandleImTheAlphaAchievement", [])
		R.call_member(c, "HandleGunSlingerAchievementKill", [])
	else:
		pass
		if R.truth((((((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and R.unary("!", c.fields.get("m_bSideCling"))) and (float(c.fields.get("m_fLeftArmHP")) > float(0))) and (float(c.fields.get("m_fRightArmHP")) > float(0))) and (float((c).fields.get("m_fClingCummulativeDamage")) >= float((c).fields.get("m_fCummulativeDamageToJumpOff"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_JumpOff"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
		R.call_member(c, "HandleGunSlingerAchievementDamage", [])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null

static func f_DamageTorso(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iMinHP: Variant = 0
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_JumpOff"))))):
		pass
		return false
	if R.truth(R.binary("<", randf(), R.call_member(c, "GetBlockedTorsoShotChance", []))):
		pass
		return true
	R.call_member((c).fields.get("m_Player"), "AddShootingBlood", [])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	if R.truth((((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float(v_iDamageType) == float(R.static_value("RDDamageType", "BlastingBullet")))) and (float(randf()) < float(0.05)))):
		pass
		v_iDamage = R.coerce(c.fields.get("m_fBodyHP"), "int")
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.05))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fPunchTimer"] = float(maxf(float((float((c).fields.get("m_fPunchTimer")) - float(R.static_value("RDZombie", "BodyDamageKillDelay")))), float(0)))
		(c).fields["m_fSpazTimer"] = float(maxf(float((float((c).fields.get("m_fSpazTimer")) - float(R.static_value("RDZombie", "BodyDamageKillDelay")))), float(0)))
	(c).fields["m_fClingCummulativeDamage"] = R.coerce(R.binary("+", (c).fields.get("m_fClingCummulativeDamage"), v_iDamage), "Number")
	v_iMinHP = R.coerce((1 if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))) else 0), "int")
	c.fields["m_fBodyHP"] = float(maxf(float((float(c.fields.get("m_fBodyHP")) - float(v_iDamage))), float(v_iMinHP)))
	if R.truth((float(c.fields.get("m_fBodyHP")) == float(0))):
		pass
		if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
			pass
			c.fields["m_bClingLeftArmLost"] = true
		else:
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
				pass
				c.fields["m_bClingRightArmLost"] = true
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Gib"), "int")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
			R.call_member(c, "StopVoiceSound", [])
			R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
			R.call_member(c, "Explode", [(c).fields.get("m_Player")])
		else:
			pass
			if R.truth((((float(v_iDamageType) == float(R.static_value("RDDamageType", "ShreddingBullet"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "BlastingBullet")))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "DevastatingBullet"))))):
				pass
				c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Gib"), "int")
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
				R.call_member(c, "StopVoiceSound", [])
				R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
			else:
				pass
				c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
				if R.truth((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
					pass
					R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotOffHood", [c, c.fields.get("m_iClingState")])
		R.call_member(c, "HandleImTheAlphaAchievement", [])
		R.call_member(c, "HandleGunSlingerAchievementKill", [])
	else:
		pass
		if R.truth(((((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float(c.fields.get("m_fLeftArmHP")) > float(0))) and (float(c.fields.get("m_fRightArmHP")) > float(0))) and (float((c).fields.get("m_fClingCummulativeDamage")) >= float((c).fields.get("m_fCummulativeDamageToJumpOff"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_JumpOff"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
		R.call_member(c, "HandleGunSlingerAchievementDamage", [])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return false
	return null

static func f_DamageLeftArm(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iMinHP: Variant = 0
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_fLeftArmHP")) == float(0)))):
		pass
		return null
	R.call_member((c).fields.get("m_Player"), "AddShootingBlood", [])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	v_iMinHP = R.coerce((1 if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))) else 0), "int")
	if R.truth((float(c.fields.get("m_fLeftArmHP")) > float(v_iMinHP))):
		pass
		c.fields["m_fLeftArmHP"] = float(maxf(float((float(c.fields.get("m_fLeftArmHP")) - float(v_iDamage))), float(v_iMinHP)))
		if R.truth((float(c.fields.get("m_fLeftArmHP")) == float(v_iMinHP))):
			pass
			if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
				pass
				c.fields["m_bClingLeftArmLost"] = true
			else:
				pass
				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
					pass
					c.fields["m_bClingRightArmLost"] = true
			c.fields["m_fClingHP"] = R.coerce(R.binary("/", c.fields.get("m_fClingHP"), 2), "Number")
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_LoseLeftArm"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieArmShot", [c])
		else:
			pass
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return null

static func f_DamageRightArm(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iMinHP: Variant = 0
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth((c.fields.get("m_bHit") or (float(c.fields.get("m_fRightArmHP")) == float(0)))):
		pass
		return null
	R.call_member((c).fields.get("m_Player"), "AddShootingBlood", [])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	(c).fields["m_fPunchTimer"] = float(0)
	(c).fields["m_fSpazTimer"] = float(0)
	v_iMinHP = R.coerce((1 if R.truth(((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm"))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm"))))) else 0), "int")
	if R.truth((float(c.fields.get("m_fRightArmHP")) > float(v_iMinHP))):
		pass
		c.fields["m_fRightArmHP"] = float(maxf(float((float(c.fields.get("m_fRightArmHP")) - float(v_iDamage))), float(v_iMinHP)))
		if R.truth((float(c.fields.get("m_fRightArmHP")) == float(v_iMinHP))):
			pass
			c.fields["m_fClingHP"] = R.coerce(R.binary("/", c.fields.get("m_fClingHP"), 2), "Number")
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_LoseRightArm"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HeadshotHitSound")])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieArmShot", [c])
		else:
			pass
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
				R.call_member(c, "PlayVoiceSound", [v_gruntSound])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return null

static func f_DamageBody(c: Variant, a: Array) -> Variant:
	var v_gruntSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gruntSound = R.coerce(null, "DTSpacialSound")
	if R.truth(((c.fields.get("m_bHit") or (float(c.fields.get("m_fClingHP")) == float(0))) or (float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_JumpOff"))))):
		pass
		return null
	R.call_member((c).fields.get("m_Player"), "AddShootingBlood", [])
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.call_member(c, "GetDamageMultiplayer", [])), "int")
	if R.truth((((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float(v_iDamageType) == float(R.static_value("RDDamageType", "BlastingBullet")))) and (float(randf()) < float(0.05)))):
		pass
		v_iDamage = R.coerce(c.fields.get("m_fBodyHP"), "int")
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.05))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fPunchTimer"] = float(maxf(float((float((c).fields.get("m_fPunchTimer")) - float(R.static_value("RDZombie", "BodyDamageKillDelay")))), float(0)))
		(c).fields["m_fSpazTimer"] = float(maxf(float((float((c).fields.get("m_fSpazTimer")) - float(R.static_value("RDZombie", "BodyDamageKillDelay")))), float(0)))
	(c).fields["m_fClingCummulativeDamage"] = R.coerce(R.binary("+", (c).fields.get("m_fClingCummulativeDamage"), v_iDamage), "Number")
	c.fields["m_fBodyHP"] = float(maxf(float((float(c.fields.get("m_fBodyHP")) - float(v_iDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fBodyHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		if R.truth((c.fields.get("m_GameplayMode")).fields.get("m_bExplodingZombies")):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Gib"), "int")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
			R.call_member(c, "StopVoiceSound", [])
			R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
			R.call_member(c, "Explode", [(c).fields.get("m_Player")])
		else:
			pass
			if R.truth((((float(v_iDamageType) == float(R.static_value("RDDamageType", "ShreddingBullet"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "BlastingBullet")))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "DevastatingBullet"))))):
				pass
				if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseLeftArm")))):
					pass
					c.fields["m_bClingLeftArmLost"] = true
				else:
					pass
					if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_LoseRightArm")))):
						pass
						c.fields["m_bClingRightArmLost"] = true
				c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_Gib"), "int")
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
				R.call_member(c, "StopVoiceSound", [])
				R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
			else:
				pass
				c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_GetOff"), "int")
				if R.truth((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
					pass
					R.call_member((c).fields.get("m_Player"), "OnClingerGetOff", [c])
		R.call_member(c, "UpdateClingAnimation", [])
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnZombieShotOffHood", [c, c.fields.get("m_iClingState")])
		R.call_member(c, "HandleImTheAlphaAchievement", [])
		R.call_member(c, "HandleGunSlingerAchievementKill", [])
	else:
		pass
		if R.truth(((((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and (float(c.fields.get("m_fLeftArmHP")) > float(0))) and (float(c.fields.get("m_fRightArmHP")) > float(0))) and (float((c).fields.get("m_fClingCummulativeDamage")) >= float((c).fields.get("m_fCummulativeDamageToJumpOff"))))):
			pass
			c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_JumpOff"), "int")
			R.call_member(c, "UpdateClingAnimation", [])
		if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
			pass
			v_gruntSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GruntSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(c, "PlayVoiceSound", [v_gruntSound])
		R.call_member(c, "HandleGunSlingerAchievementDamage", [])
	R.call_member(((c).fields.get("m_Player")).fields.get("m_Weapon"), "AddAimingPoints", [(((c).fields.get("m_Player")).fields.get("m_Weapon")).fields.get("m_iAimingPointsPerHit")])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnAddedToWorld"), [])
	(c).fields["m_fRelativeLocationX"] = float((float((c.fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	R.set_value(c.fields.get("m_World"), "m_iEnemies", 1, "+=")
	if R.truth((float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))):
		pass
		R.set_value(c.fields.get("m_World"), "m_iKillableEnemies", 1, "+=")
		(c).fields["m_bRegisteredAsKillable"] = true
	return null

static func f_StartSpawning(c: Variant, a: Array) -> Variant:
	var v_fPerlin: Variant = NAN
	var v_spawnFrom: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Spawning"), "int")
	(c).fields["m_bSpawnGetUp"] = (float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))
	v_fPerlin = R.coerce(R.call_static("RDWorld", "GetPerlinX", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_bSpawnGoLeft"] = (float(((v_spawnFrom).fields.get("m_vLocation")).fields.get("X")) > float(v_fPerlin))
	(c).fields["m_fSpawnWalkTarget"] = R.coerce(((float(randf()) * R.num(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]))) if R.truth((c).fields.get("m_bSpawnGoLeft")) else R.binary("+", R.unary("-", R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")])), (float(randf()) * R.num(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((v_spawnFrom).fields.get("m_vLocation")).fields.get("Z")]))))), "Number")
	R.call_member(c, "UpdateAnimation", [true])
	return null

static func f_StartJumpOffHood(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	c.fields["m_iClingState"] = R.coerce(R.static_value("RDHumanoid", "ClingState_None"), "int")
	c.fields["m_bUseCurvyCamera"] = true
	R.call_member((c).fields.get("m_Player"), "DetachEntity", [c])
	((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(1)))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float(4)))
	R.call_member(c, "PrepareForHoodJump", [])
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "JumpDistanceMin")))) + float((float(randf()) * float((float(R.static_value("RDZombie", "JumpDistanceMax")) - float(R.static_value("RDZombie", "JumpDistanceMin"))))))))
	v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")])) - float(v_fLimit))) + float((float((float(randf()) * float(v_fLimit))) * float(2)))))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	R.call_member(c, "StartRunAheadOfPlayer", [])
	R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_FromHood"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpStaticEndPosition"), R.static_value("RDZombie", "JumpTarget_Ground"), (c).fields.get("m_fJumpHeight")])
	return null

static func f_StartJumpOnPlayer(c: Variant, a: Array) -> Variant:
	if R.truth((((R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])) and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))) and (float(randf()) > float(0.5))) or R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])))):
		pass
		(c).fields["m_bJumpOnPlayerLeft"] = true
	else:
		pass
		(c).fields["m_bJumpOnPlayerLeft"] = false
	((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
	(c).fields["m_bCheckForChopperCollision"] = true
	R.call_member((c).fields.get("m_vJumpOnPlayerStartPosition"), "Set", [((c).fields.get("m_Player")).fields.get("m_vLocation")])
	R.call_member((c).fields.get("m_vJumpOnPlayerEndPosition"), "Set", [((c).fields.get("m_Player")).fields.get("m_vLocation")])
	R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_Generic"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpOnPlayerEndPosition"), R.static_value("RDZombie", "JumpTarget_Player"), (c).fields.get("m_fJumpHeight")])
	return null

static func f_InterruptJumpToPlayer(c: Variant, a: Array) -> Variant:
	(c).fields["m_vJumpEndLocation"] = R.coerce((c).fields.get("m_vJumpAheadPlayerPosition"), "DTVector3D")
	(c).fields["m_iJumpTargetType"] = R.coerce(R.static_value("RDZombie", "JumpTarget_Ground"), "int")
	return null

static func f_StartJumpOnGroundAheadOfPlayer(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_bRunAhead: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "JumpDistanceMin")))) + float((float(randf()) * float((float(R.static_value("RDZombie", "JumpDistanceMax")) - float(R.static_value("RDZombie", "JumpDistanceMin"))))))))
	v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")])) - float(v_fLimit))) + float((float((float(randf()) * float(v_fLimit))) * float(2)))))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	if R.truth(v_bRunAhead):
		pass
		R.call_member(c, "StartRunAheadOfPlayer", [])
	else:
		pass
		R.call_member(c, "StartMoveToPlayer", [])
	R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_Generic"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpStaticEndPosition"), R.static_value("RDZombie", "JumpTarget_Ground"), (c).fields.get("m_fJumpHeight")])
	return null

static func f_StartJumpOnGroundAheadOfPlayerFromBuilding(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "JumpDistanceMin")))) + float((float(randf()) * float((float(R.static_value("RDZombie", "JumpDistanceMax")) - float(R.static_value("RDZombie", "JumpDistanceMin"))))))))
	v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), (R.binary("+", R.unary("-", v_fLimit), (float(randf()) * float(v_fLimit))) if R.truth(R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))) else (float(randf()) * float(v_fLimit)))), "Number")
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	R.call_member(c, "StartMoveToPlayer", [])
	R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_Generic"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpStaticEndPosition"), R.static_value("RDZombie", "JumpTarget_Ground"), (c).fields.get("m_fJumpHeight")])
	return null

static func f_StartJumpOnHighway(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	(c).fields["m_bSwitchedToDynamicLayer"] = false
	R.call_member(c.fields.get("m_World"), "RemoveEntityFromLayer", [c])
	R.call_member(c.fields.get("m_World"), "AddEntityToLayer", [c, R.static_value("RDEntity", "Layer_SideBackground")])
	(c).fields["m_fHighwayJumpStartDistance"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
	(c).fields["m_fHighwayJumpDistance"] = float((float(R.static_value("RDZombie", "JumpHighwayDistanceMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "JumpHighwayDistanceMax")) - float(R.static_value("RDZombie", "JumpHighwayDistanceMin"))))))))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((c).fields.get("m_fHighwayJumpDistance"))))
	v_fLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	(c).fields["m_fHighwayJumpSideDistance"] = float((float((float((float(0.5) + float((float(randf()) * float(0.25))))) * float(v_fLimit))) * R.num((1 if R.truth(R.binary(">", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))) else R.unary("-", 1)))))
	((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), (c).fields.get("m_fHighwayJumpSideDistance")), "Number")
	((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
	if R.truth((float(randf()) < float(0.5))):
		pass
		R.call_member(c, "StartRunAheadOfPlayer", [])
	else:
		pass
		R.call_member(c, "StartMoveToPlayer", [])
	R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_OnHighway"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpStaticEndPosition"), R.static_value("RDZombie", "JumpTarget_Ground"), R.static_value("RDZombie", "HighwayJumpHeight"), R.static_value("RDZombie", "HighwayJumpSpeed")])
	return null

static func f_StartJumpOffBuilding(c: Variant, a: Array) -> Variant:
	(c).fields["m_bJumpFromBuilding"] = true
	if R.truth(R.logical_or((R.truth(R.logical_and(R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true]), func(): return R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false]))) or R.truth((float(randf()) < float(0.5)))), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))):
		pass
		R.call_member(c, "StartJumpOnGroundAheadOfPlayerFromBuilding", [])
	else:
		pass
		R.call_member(c, "StartJumpOnPlayer", [])
	return null

static func f_StartJump(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_vStart: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vEnd: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_iTargetType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fHeight: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fSpeedOverride: Variant = R.coerce((a[5] if a.size() > 5 else R.unary("-", 1)), "Number")
	(c).fields["m_iJumpType"] = R.coerce(v_iType, "int")
	(c).fields["m_iPreJumpMovementType"] = R.coerce((c).fields.get("m_iMovementType"), "int")
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_Jump"), "int")
	(c).fields["m_vJumpStartLocation"] = R.coerce(v_vStart, "DTVector3D")
	(c).fields["m_vJumpEndLocation"] = R.coerce(v_vEnd, "DTVector3D")
	(c).fields["m_bStartingJump"] = (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(10))))
	(c).fields["m_fJumpRatio"] = R.coerce((0 if R.truth((c).fields.get("m_bStartingJump")) else 0.15), "Number")
	if R.truth(R.binary("!=", v_fSpeedOverride, R.unary("-", 1))):
		pass
		(c).fields["m_fActualJumpTimeSpeed"] = float(v_fSpeedOverride)
	else:
		pass
		(c).fields["m_fActualJumpTimeSpeed"] = float((c).fields.get("m_fJumpTimeSpeed"))
	(c).fields["m_fActualJumpHeight"] = float(v_fHeight)
	(c).fields["m_bInJump"] = true
	(c).fields["m_bJumpFront"] = (float((v_vEnd).fields.get("Z")) < float((v_vStart).fields.get("Z")))
	(c).fields["m_iJumpTargetType"] = R.coerce(v_iTargetType, "int")
	R.call_member(c, "UpdateAnimation", [true])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_JumpSound")])
	return null

static func f_EndJump(c: Variant, a: Array) -> Variant:
	var v_bCloseEnough: Variant = false
	var v_clingSound: Variant = null
	var v_getOnHoodSound: Variant = null
	v_bCloseEnough = false
	v_clingSound = R.coerce(null, "DTSpacialSound")
	v_getOnHoodSound = R.coerce(null, "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_LandSound")])
	if R.truth((float((c).fields.get("m_iJumpTargetType")) == float(R.static_value("RDZombie", "JumpTarget_Ground")))):
		pass
		(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
		(c).fields["m_bEndingJump"] = true
		R.call_member(c, "UpdateAnimation", [true])
	else:
		pass
		if R.truth((float((c).fields.get("m_iJumpTargetType")) == float(R.static_value("RDZombie", "JumpTarget_Player")))):
			pass
			if R.truth(((c).fields.get("m_Player")).fields.get("m_bChopperMode")):
				pass
				if R.truth(R.call_member((c).fields.get("m_Player"), "CanBeKilledInChopper", [])):
					pass
					R.call_member((c).fields.get("m_Player"), "OnKilledByZombie", [c])
			else:
				pass
				v_bCloseEnough = R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("X")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")))]), 2)
				if R.truth(((v_bCloseEnough and (c).fields.get("m_bJumpOnPlayerLeft")) and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [true])))):
					pass
					R.call_member(c, "StartCling", [true])
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
					c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_Land"), "int")
					R.call_member(c, "UpdateClingAnimation", [])
					v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlaySoundOnActor", [v_clingSound])
					v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
				else:
					pass
					if R.truth((v_bCloseEnough and R.unary("!", R.call_member((c).fields.get("m_Player"), "IsClingerSpotTaken", [false])))):
						pass
						R.call_member(c, "StartCling", [false])
						R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HumanoidIdleCling", 0.1, 0, 0, 0.5])
						R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_IdleClingSound")])
						c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_Land"), "int")
						R.call_member(c, "UpdateClingAnimation", [])
						v_clingSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDZombie", "m_HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlaySoundOnActor", [v_clingSound])
						v_getOnHoodSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_GetOnHoodSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(c, "PlayVoiceSound", [v_getOnHoodSound])
					else:
						pass
						(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
						(c).fields["m_bEndingJump"] = true
						R.call_member(c, "UpdateAnimation", [true])
						R.call_member(c, "PlayStepSound", [])
						R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["PunchHood", 0.1, 0, 0, 0.25])
						if R.truth((float(randf()) < float(0.5))):
							pass
							R.call_member(c, "StartJumpOnGroundAheadOfPlayer", [true])
						else:
							pass
							R.call_member(c, "StartRunAheadOfPlayer", [])
	return null

static func f_UpdateMoveJumping(c: Variant, a: Array) -> Variant:
	var v_iStep: Variant = 0
	var v_fDirStep: Variant = NAN
	var v_iNextStep: Variant = 0
	var v_bCanJump: Variant = false
	var v_target: Variant = null
	var v_iTargetNode: Variant = 0
	var v_iNode: Variant = 0
	var v_iPlayerStep: Variant = 0
	var v_j: Variant = 0
	var v_bFoundRight: Variant = false
	var v_bFoundLeft: Variant = false
	var v_gameplayMode: Variant = null
	var v_fLimit: Variant = NAN
	var v_fRightNode: Variant = NAN
	var v_fLeftNode: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iStep = R.coerce(0, "int")
	v_fDirStep = float(NAN)
	v_iNextStep = R.coerce(0, "int")
	v_bCanJump = false
	v_target = R.coerce(null, "RDEntity")
	v_iTargetNode = R.coerce(0, "int")
	v_iNode = R.coerce(0, "int")
	v_iPlayerStep = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_bFoundRight = false
	v_bFoundLeft = false
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_fLimit = float(NAN)
	v_fRightNode = float(NAN)
	v_fLeftNode = float(NAN)
	if R.truth(R.logical_or((((float(c.fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((c.fields.get("m_World")).fields.get("m_fCameraNavMeshPos")))) or R.binary("<=", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("Z")]), 1)), func(): return R.call_member(c.fields.get("m_GameplayMode"), "IsChopperMode", []))):
		pass
		return null
	(c).fields["m_fMoveJumpTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fMoveJumpTimer"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fMoveJumpTimer")) > float((c).fields.get("m_fMoveJumpDelay")))):
		pass
		v_iStep = R.coerce(R.call_member(c, "GetNavMeshStep", [(c.fields.get("m_vLocation")).fields.get("Z")]), "int")
		v_fDirStep = R.coerce((R.static_value("RDWorld", "NavMeshStepSize") if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))) else R.unary("-", R.static_value("RDWorld", "NavMeshStepSize"))), "Number")
		v_iNextStep = R.coerce(floorf(float(R.binary("/", (float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float(v_fDirStep) * R.num(((10 if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")) else 7) if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) < float(0))) else ((c).fields.get("m_iJumpForwardDistance") if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")) else (float((c).fields.get("m_iJumpForwardDistance")) + float(2))))))))) - float((c.fields.get("m_World")).fields.get("m_fCameraNavMeshPos"))), R.static_value("RDWorld", "NavMeshStepSize")))), "int")
		v_bCanJump = true
		v_target = R.coerce(((c).fields.get("m_Building") if R.truth((c).fields.get("m_Building")) else (c).fields.get("m_Player")), "RDEntity")
		if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) < float(0))):
			pass
			v_iPlayerStep = R.coerce(R.call_member(c, "GetNavMeshStep", [((v_target).fields.get("m_vLocation")).fields.get("Z")]), "int")
			if R.truth(R.binary("<", R.call_static("Maths", "AbsInt", [(float(v_iPlayerStep) - float(v_iStep))]), (10 if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")) else 15))):
				pass
				v_bCanJump = false
		v_iTargetNode = R.coerce(R.unary("-", 1), "int")
		v_iNode = R.coerce(R.call_member(c, "GetNavMeshNode", [(c).fields.get("m_fRelativeLocationX")]), "int")
		if R.truth((float(v_iNextStep) > float(0))):
			pass
			v_j = R.coerce(0, "int")
			while R.truth((float(v_j) < float(R.static_value("RDWorld", "NavMeshNodes")))):
				pass
				v_bFoundRight = false
				v_bFoundLeft = false
				v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
				v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadAreaAt", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float(v_fDirStep) * float(2))))]), "Number")
				v_fRightNode = float(R.binary("/", R.binary("+", R.call_member(c, "GetNavMeshNodePos", [(float(v_iNode) + float(v_j))]), R.call_member(c, "GetNavMeshNodePos", [(float((float(v_iNode) + float(v_j))) + float(1))])), 2))
				v_fLeftNode = float(R.binary("/", R.binary("+", R.call_member(c, "GetNavMeshNodePos", [(float(v_iNode) - float(v_j))]), R.call_member(c, "GetNavMeshNodePos", [(float((float(v_iNode) - float(v_j))) + float(1))])), 2))
				if R.truth((((float(v_fRightNode) < float(v_fLimit)) and (float(v_j) < float((float(R.static_value("RDWorld", "NavMeshNodes")) - float(1))))) and R.unary("!", R.get_value(R.get_value((c.fields.get("m_World")).fields.get("m_NavMesh"), v_iNextStep), (float(v_iNode) + float(v_j)))))):
					pass
					v_bFoundRight = true
				if R.truth((((float(v_fLeftNode) < float(v_fLimit)) and (float(v_j) > float(0))) and R.unary("!", R.get_value(R.get_value((c.fields.get("m_World")).fields.get("m_NavMesh"), v_iNextStep), (float(v_iNode) - float(v_j)))))):
					pass
					v_bFoundLeft = true
				if R.truth((v_bFoundRight or v_bFoundLeft)):
					pass
					if R.truth((v_bFoundRight and v_bFoundLeft)):
						pass
						v_iTargetNode = R.coerce((R.coerce((float(v_iNode) + float(v_j)), "int") if R.truth((float(randf()) > float(0.5))) else R.coerce((float(v_iNode) - float(v_j)), "int")), "int")
					else:
						pass
						if R.truth(v_bFoundRight):
							pass
							v_iTargetNode = R.coerce((float(v_iNode) + float(v_j)), "int")
						else:
							pass
							v_iTargetNode = R.coerce((float(v_iNode) - float(v_j)), "int")
					break
				v_j = R.signed32(v_j + 1)
		if R.truth(R.binary("==", v_iTargetNode, R.unary("-", 1))):
			pass
			v_bCanJump = false
		if R.truth(v_bCanJump):
			pass
			((c).fields.get("m_vJumpStaticStartPosition")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
			((c).fields.get("m_vJumpStaticStartPosition")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
			((c).fields.get("m_vJumpStaticStartPosition")).fields["Y"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
			((c).fields.get("m_vJumpStaticEndPosition")).fields["Z"] = float((float((c.fields.get("m_vLocation")).fields.get("Z")) + float((float((float(v_iNextStep) - float(v_iStep))) * float(R.static_value("RDWorld", "NavMeshStepSize"))))))
			((c).fields.get("m_vJumpStaticEndPosition")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), R.binary("/", R.binary("+", R.call_member(c, "GetNavMeshNodePos", [v_iTargetNode]), R.call_member(c, "GetNavMeshNodePos", [(float(v_iTargetNode) + float(1))])), 2)), "Number")
			((c).fields.get("m_vJumpStaticEndPosition")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((c).fields.get("m_vJumpStaticEndPosition")).fields.get("Z")]), "Number")
			R.call_member(c, "StartJump", [R.static_value("RDZombie", "JumpType_Generic"), (c).fields.get("m_vJumpStaticStartPosition"), (c).fields.get("m_vJumpStaticEndPosition"), R.static_value("RDZombie", "JumpTarget_Ground"), (c).fields.get("m_fJumpHeight")])
		(c).fields["m_fMoveJumpTimer"] = float(0)
		(c).fields["m_fMoveJumpDelay"] = float((float(R.static_value("RDZombie", "MoveJumpDelayMin")) + float((float(randf()) * float((float(R.static_value("RDZombie", "MoveJumpDelayMax")) - float(R.static_value("RDZombie", "MoveJumpDelayMin"))))))))
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	if R.truth(((float(c.fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard"))) and R.unary("!", c.fields.get("m_bHit")))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "IsOutOfLevel"), [v_camera])
	return null

static func f_OnSideScraping(c: Variant, a: Array) -> Variant:
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.05))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fPunchTimer"] = float(maxf(float((float((c).fields.get("m_fPunchTimer")) - float(R.static_value("RDZombie", "SideGrindingDamageKillDelay")))), float(0)))
		(c).fields["m_fSpazTimer"] = float(maxf(float((float((c).fields.get("m_fSpazTimer")) - float(R.static_value("RDZombie", "SideGrindingDamageKillDelay")))), float(0)))
	(c).fields["m_iSideGrindedTime"] = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "int")
	if R.truth((float(c.fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle")))):
		pass
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideGrinding"), "int")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SideGrindingSound"), true])
		R.call_member(c, "UpdateClingAnimation", [])
	c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(R.static_value("RDZombie", "SideGrindingDamage")))), float(0)))
	if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		c.fields["m_iClingState"] = R.coerce(R.static_value("RDZombie", "ClingState_SideGrindOff"), "int")
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SideGrindingSound")])
		R.call_member(c, "UpdateClingAnimation", [])
		c.fields["m_fBodyHP"] = R.coerce(R.binary("-", c.fields.get("m_fBodyHP"), R.binary("/", c.fields.get("m_fBodyHP"), 2)), "Number")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GibHitSound")])
		R.call_member((c).fields.get("m_Player"), "OnSideGrindedClinger", [])
		if R.truth((R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "GroundBeef"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "GroundBeef")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_OnStruggleDamage(c: Variant, a: Array) -> Variant:
	var v_bIsFemale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fDamage: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fKillDelay: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	if R.truth(c.fields.get("m_bHit")):
		pass
		return false
	if R.truth((float((float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime")) - float((c).fields.get("m_fKillDelayTimeStamp")))) > float(0.05))):
		pass
		(c).fields["m_fKillDelayTimeStamp"] = float((R.static_value("RDGame", "Instance")).fields.get("m_fGameTime"))
		(c).fields["m_fPunchTimer"] = float(maxf(float((float((c).fields.get("m_fPunchTimer")) - float(v_fKillDelay))), float(0)))
		(c).fields["m_fSpazTimer"] = float(maxf(float((float((c).fields.get("m_fSpazTimer")) - float(v_fKillDelay))), float(0)))
	c.fields["m_fClingHP"] = float(maxf(float((float(c.fields.get("m_fClingHP")) - float(v_fDamage))), float(0)))
	if R.truth((float(c.fields.get("m_fClingHP")) == float(0))):
		pass
		c.fields["m_bHit"] = true
		c.fields["m_bCanBeShotByHelicopter"] = false
		c.fields["m_iClingState"] = R.coerce((R.static_value("RDZombie", "ClingState_SideElbow") if R.truth(v_bIsFemale) else R.static_value("RDZombie", "ClingState_SidePunch")), "int")
		c.fields["m_fHeadHP"] = R.coerce(R.binary("-", c.fields.get("m_fHeadHP"), R.binary("/", c.fields.get("m_fHeadHP"), 3)), "Number")
		R.call_member((c).fields.get("m_Player"), "OnPunchElbowClinger", [v_bIsFemale])
		if R.truth((R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "CloseEncounter"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "CloseEncounter")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		R.call_member(c, "UpdateClingAnimation", [])
	return null

static func f_StartBuildingSpawn(c: Variant, a: Array) -> Variant:
	(c).fields["m_fBuildingSpawnTimer"] = float(0)
	(c).fields["m_fBuildingSpawnPosY"] = float((c.fields.get("m_vLocation")).fields.get("Y"))
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_SpawnOnBuilding"), "int")
	return null

static func f_Touched(c: Variant, a: Array) -> Variant:
	var v_fence: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_fence = R.coerce(R.binary("as", v_entity, R.klass("RDObstacleFence")), "RDObstacleFence")
	if R.truth(v_fence):
		pass
		(c.fields.get("m_vLocation")).fields["Z"] = float((float(((v_fence).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
		R.call_member(c, "UpdateDepthPosition", [])
		R.call_member(c, "StartBashingFence", [v_fence])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "Touched"), [v_entity])
	return null

static func f_JumpOverFence(c: Variant, a: Array) -> Variant:
	(c).fields["m_fMoveJumpTimer"] = float((c).fields.get("m_fMoveJumpDelay"))
	return null

static func f_StartBashingFence(c: Variant, a: Array) -> Variant:
	var v_fence: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacleFence")
	if R.truth(R.unary("!", (c).fields.get("m_FenceToBash"))):
		pass
		(c).fields["m_iPreBashingFenceMovement"] = R.coerce((c).fields.get("m_iMovementType"), "int")
		(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_BashingFence"), "int")
		(c).fields["m_FenceToBash"] = R.coerce(v_fence, "RDObstacleFence")
		R.call_member((c).fields.get("m_FenceToBash"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnFenceDestroyed"), false, 0, true])
	return null

static func f_OnFenceDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c).fields.get("m_FenceToBash")):
		pass
		R.call_member((c).fields.get("m_FenceToBash"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnFenceDestroyed")])
		(c).fields["m_FenceToBash"] = R.coerce(null, "RDObstacleFence")
	(c).fields["m_iMovementType"] = R.coerce((c).fields.get("m_iPreBashingFenceMovement"), "int")
	return null

static func f_UpdateBashingFence(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((R.truth((c).fields.get("m_FenceToBash")) and R.unary("!", R.call_member((c).fields.get("m_FenceToBash"), "CanBeBashed", [])))):
		pass
		R.call_member((c).fields.get("m_FenceToBash"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnFenceDestroyed")])
		(c).fields["m_FenceToBash"] = R.coerce(null, "RDObstacleFence")
		(c).fields["m_iMovementType"] = R.coerce((c).fields.get("m_iPreBashingFenceMovement"), "int")
		return null
	if R.truth((R.truth((c).fields.get("m_FenceToBash")) and (R.binary("!=", R.binary("as", c.fields.get("m_GameplayMode"), R.klass("RDGameModeChopperRescue")), null) or (float((c.fields.get("m_vLocation")).fields.get("Z")) < float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDZombie", "FenceBashDistance")))))))):
		pass
		R.call_member((c).fields.get("m_FenceToBash"), "DamageFence", [(float((c).fields.get("m_fFenceDamage")) * float(v_fDeltaTime))])
		if R.truth(R.call_member((c).fields.get("m_FenceToBash"), "IsDown", [])):
			pass
			R.call_member((c).fields.get("m_FenceToBash"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnFenceDestroyed")])
			(c).fields["m_FenceToBash"] = R.coerce(null, "RDObstacleFence")
			(c).fields["m_iMovementType"] = R.coerce((c).fields.get("m_iPreBashingFenceMovement"), "int")
	return null

static func f_OnPunchHood(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_PunchHoodSound")])
	R.call_member((c).fields.get("m_Player"), "AddHandlingInfluence", [(float(randf()) > float(0.5)), (float(0.25) + float((float(randf()) * float(0.75))))])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["PunchHood", 0.1, 0, 0, 0.25])
	R.call_member((c).fields.get("m_Player"), "DealBumperDamage", [c, R.static_value("RDZombie", "PunchHoodDamage"), false, 1])
	return null

static func f_GetDistanceRatio(c: Variant, a: Array) -> Variant:
	if R.truth((float((c.fields.get("m_vLocation")).fields.get("Z")) < float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		return 0
	return minf(float(R.binary("/", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), 100)), float(1))
	return null

static func f_HandleImTheAlphaAchievement(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_HandleGunSlingerAchievementKill(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((R.truth(R.logical_and(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")), func(): return (c).fields.get("m_GunSlingerFirstWeapon"))) and R.truth(R.unary("!", (c).fields.get("m_GunSlingerSecondWeapon")))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "GunSlinger"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "GunSlinger")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_HandleGunSlingerAchievementDamage(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(R.unary("!", (c).fields.get("m_GunSlingerFirstWeapon"))):
		pass
		(c).fields["m_GunSlingerFirstWeapon"] = R.coerce(((c).fields.get("m_Player")).fields.get("m_Weapon"), "RDWeapon")
	else:
		pass
		if R.truth(R.binary("!=", ((c).fields.get("m_Player")).fields.get("m_Weapon"), (c).fields.get("m_GunSlingerFirstWeapon"))):
			pass
			(c).fields["m_GunSlingerSecondWeapon"] = R.coerce(((c).fields.get("m_Player")).fields.get("m_Weapon"), "RDWeapon")
	return null

static func f_StartClingPatrol(c: Variant, a: Array) -> Variant:
	var v_fDist: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_fStopClingPatrolTimer"] = float(0)
	(c).fields["m_fClingPatrolDistance"] = float(v_fDist)
	(c).fields["m_iMovementType"] = R.coerce(R.static_value("RDZombie", "MovementType_ClingPatrol"), "int")
	(c).fields["m_iPatrolStep"] = R.coerce(R.static_value("RDZombie", "PatrolStep_Moving"), "int")
	R.call_member(c, "SetClingPatrolPosition", [])
	return null

static func f_SetClingPatrolPosition(c: Variant, a: Array) -> Variant:
	var v_fRoadLimit: Variant = NAN
	v_fRoadLimit = R.coerce(R.call_member((c.fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadLimitAt", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_fClingPatrolPos"] = R.coerce(R.binary("+", ((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), R.binary("+", R.unary("-", 2), (float(randf()) * float(4)))), "Number")
	(c).fields["m_fClingPatrolPos"] = R.coerce(R.call_static("Maths", "Clamp", [(c).fields.get("m_fClingPatrolPos"), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
	(c).fields["m_bClingPatrolRight"] = (float((c).fields.get("m_fClingPatrolPos")) > float(((c).fields.get("m_Player")).fields.get("m_fRelativeLocationX")))
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
	R.call_member(c, "DealRadialDamage", [v_instigator, (c).fields.get("m_fExplosionRangeX"), (c).fields.get("m_fExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Explosive")])
	if R.truth((float(c.fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_None")))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnClingerExploded", [c])
	else:
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Explosion"), "gotoAndPlay"), [1])
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "EndHitForBlood")):
		pass
		(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDZombie"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_PrepareForHoodJump(c: Variant, a: Array) -> Variant:
	(c.fields.get("m_vLocation")).fields["Y"] = float(((c).fields.get("m_vJumpStaticStartPosition")).fields.get("Y"))
	(c.fields.get("m_vLocation")).fields["Z"] = float(((c).fields.get("m_vJumpStaticStartPosition")).fields.get("Z"))
	R.set_value(c.fields.get("m_MainMC"), "x", R.unary("-", 5000), "=")
	R.call_member(c, "UpdateDepthPosition", [])
	return null

static func f_UpdateKillSoldier(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_soldier: Variant = null
	v_i = R.coerce(0, "int")
	v_soldier = R.coerce(null, "RDSoldier")
	if R.truth((((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded"))) and (float((c).fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))) and (float(R.binary("%", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), R.static_value("RDZombie", "MaxGlobalKillSoldierTick"))) == float((c).fields.get("m_iKillSoldierTick"))))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(R.static_value("RDSoldier", "AllSoldiers"), "length"))):
			pass
			v_soldier = R.coerce(R.binary("as", R.get_value(R.static_value("RDSoldier", "AllSoldiers"), v_i), R.klass("RDSoldier")), "RDSoldier")
			if R.truth((R.unary("!", (v_soldier).fields.get("m_bHit")) and R.binary("<=", R.call_member((v_soldier).fields.get("m_vLocation"), "DistanceFrom", [c.fields.get("m_vLocation")]), 1))):
				pass
				R.call_member(v_soldier, "OnKilledByZombie", [])
			v_i = R.signed32(v_i + 1)
	return null

static func f_CanBlockSoldierBullets(c: Variant, a: Array) -> Variant:
	return ((R.unary("!", c.fields.get("m_bHit")) and R.unary("!", (c).fields.get("m_bExploded"))) and (float(c.fields.get("m_iClingState")) == float(R.static_value("RDHumanoid", "ClingState_None"))))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_MoanNormalMaleSounds", null, "=")
	R.set_value(c, "m_MoanNormalFemaleSounds", null, "=")
	R.set_value(c, "m_MoanHardSounds", null, "=")
	R.set_value(c, "m_MoanVeryHardSounds", null, "=")
	R.set_value(c, "m_MoanAlphaSounds", null, "=")
	R.set_value(c, "m_GruntNormalMaleSounds", null, "=")
	R.set_value(c, "m_GruntNormalFemaleSounds", null, "=")
	R.set_value(c, "m_GruntHardSounds", null, "=")
	R.set_value(c, "m_GruntVeryHardSounds", null, "=")
	R.set_value(c, "m_GruntAlphaSounds", null, "=")
	R.set_value(c, "m_GetOnHoodNormalMaleSounds", null, "=")
	R.set_value(c, "m_GetOnHoodNormalFemaleSounds", null, "=")
	R.set_value(c, "m_GetOnHoodHardSounds", null, "=")
	R.set_value(c, "m_GetOnHoodVeryHardSounds", null, "=")
	R.set_value(c, "m_GetOnHoodAlphaSounds", null, "=")
	R.set_value(c, "m_CollisionNormalMaleSounds", null, "=")
	R.set_value(c, "m_CollisionNormalFemaleSounds", null, "=")
	R.set_value(c, "m_CollisionHardSounds", null, "=")
	R.set_value(c, "m_CollisionVeryHardSounds", null, "=")
	R.set_value(c, "m_CollisionAlphaSounds", null, "=")
	R.set_value(c, "m_ThreatNormalMaleSounds", null, "=")
	R.set_value(c, "m_ThreatNormalFemaleSounds", null, "=")
	R.set_value(c, "m_ThreatHardSounds", null, "=")
	R.set_value(c, "m_ThreatVeryHardSounds", null, "=")
	R.set_value(c, "m_ThreatAlphaSounds", null, "=")
	R.set_value(c, "m_AttackNormalMaleSounds", null, "=")
	R.set_value(c, "m_AttackNormalFemaleSounds", null, "=")
	R.set_value(c, "m_AttackHardSounds", null, "=")
	R.set_value(c, "m_AttackVeryHardSounds", null, "=")
	R.set_value(c, "m_AttackAlphaSounds", null, "=")
	R.set_value(c, "m_HitSounds", null, "=")
	R.set_value(c, "MovementType_Patrol", 0, "=")
	R.set_value(c, "MovementType_Straight", 1, "=")
	R.set_value(c, "MovementType_MoveToPlayer", 2, "=")
	R.set_value(c, "MovementType_AlignWithPlayer", 3, "=")
	R.set_value(c, "MovementType_Stationary", 4, "=")
	R.set_value(c, "MovementType_Feed", 5, "=")
	R.set_value(c, "MovementType_Spawning", 6, "=")
	R.set_value(c, "MovementType_TrackPlayer", 7, "=")
	R.set_value(c, "MovementType_RunAheadOfPlayer", 8, "=")
	R.set_value(c, "MovementType_Jump", 9, "=")
	R.set_value(c, "MovementType_MoveToPlayerSide", 10, "=")
	R.set_value(c, "MovementType_RescueMode", 11, "=")
	R.set_value(c, "MovementType_SpawnOnBuilding", 12, "=")
	R.set_value(c, "MovementType_Down", 13, "=")
	R.set_value(c, "MovementType_BashingFence", 14, "=")
	R.set_value(c, "MovementType_ClingPatrol", 15, "=")
	R.set_value(c, "MovementType_Charge", 16, "=")
	R.set_value(c, "JumpType_Generic", 0, "=")
	R.set_value(c, "JumpType_FromHood", 1, "=")
	R.set_value(c, "JumpType_OnHighway", 2, "=")
	R.set_value(c, "JumpTarget_Ground", 0, "=")
	R.set_value(c, "JumpTarget_Player", 1, "=")
	R.set_value(c, "ClingState_JumpOff", 1012, "=")
	R.set_value(c, "ClingState_Land", 1013, "=")
	R.set_value(c, "ClingState_SideStart", 1014, "=")
	R.set_value(c, "ClingState_SideIdle", 1015, "=")
	R.set_value(c, "ClingState_SideGrinding", 1016, "=")
	R.set_value(c, "ClingState_SideGrindOff", 1017, "=")
	R.set_value(c, "ClingState_SideShot", 1018, "=")
	R.set_value(c, "ClingState_SideKill", 1019, "=")
	R.set_value(c, "ClingState_SideElbow", 1020, "=")
	R.set_value(c, "ClingState_SidePunch", 1021, "=")
	R.set_value(c, "ClingState_Spaz", 1022, "=")
	R.set_value(c, "PatrolStep_Moving", 0, "=")
	R.set_value(c, "PatrolStep_Waiting", 1, "=")
	R.set_value(c, "HornSoundDetectDistance", 70, "=")
	R.set_value(c, "VisionDetectDistance", 80, "=")
	R.set_value(c, "NormalZombieLockInDistance", 2, "=")
	R.set_value(c, "IdleClingDistance", 1, "=")
	R.set_value(c, "IdleClingDistanceChopper", 0.5, "=")
	R.set_value(c, "IdleClingCheckDistance", 3, "=")
	R.set_value(c, "ChopperKillDistance", 1, "=")
	R.set_value(c, "JumpAheadWithNoClingSpotDistance", 5, "=")
	R.set_value(c, "ChargeDistance", 10, "=")
	R.set_value(c, "ChargeDistanceXMin", 2, "=")
	R.set_value(c, "ChargeDistanceXMax", 6, "=")
	R.set_value(c, "SideCollisionClingDamage", 20, "=")
	R.set_value(c, "DirectCollisionClingDamage", 120, "=")
	R.set_value(c, "ThreatDelayMin", 0.25, "=")
	R.set_value(c, "ThreatDelayRandom", 0.25, "=")
	R.set_value(c, "MoanDistance", 80, "=")
	R.set_value(c, "CueDistance", 100, "=")
	R.set_value(c, "MoanDelayMin", 2, "=")
	R.set_value(c, "MoanDelayMax", 10, "=")
	R.set_value(c, "HeadDamageKillDelay", 0.2, "=")
	R.set_value(c, "BodyDamageKillDelay", 0.15, "=")
	R.set_value(c, "SideGrindingDamageKillDelay", 0.002, "=")
	R.set_value(c, "SideGrindingDamage", 13, "=")
	R.set_value(c, "JumpDistanceMin", 25, "=")
	R.set_value(c, "JumpDistanceMax", 40, "=")
	R.set_value(c, "RunAheadDurationMin", 4, "=")
	R.set_value(c, "RunAheadDurationMax", 8, "=")
	R.set_value(c, "TrackPlayerDurationMin", 3, "=")
	R.set_value(c, "TrackPlayerDurationMax", 5, "=")
	R.set_value(c, "JumpOnPlayerDistance", 15, "=")
	R.set_value(c, "SideClingDistance", 1.5, "=")
	R.set_value(c, "MoveJumpDelayMin", 1, "=")
	R.set_value(c, "MoveJumpDelayMax", 4, "=")
	R.set_value(c, "SpawnBehindDistance", 20, "=")
	R.set_value(c, "SpawnFrontDistance", 100, "=")
	R.set_value(c, "JumpOffBuildingDistance", 20, "=")
	R.set_value(c, "HighwayJumpSpeed", 1, "=")
	R.set_value(c, "HighwayJumpHeight", 6, "=")
	R.set_value(c, "SpawnHighwayDistanceMin", 25, "=")
	R.set_value(c, "SpawnHighwayDistanceMax", 28, "=")
	R.set_value(c, "JumpHighwayDistanceMin", 30, "=")
	R.set_value(c, "JumpHighwayDistanceMax", 35, "=")
	R.set_value(c, "FenceBashDistance", 40, "=")
	R.set_value(c, "SpazDelay", 1, "=")
	R.set_value(c, "PunchHoodDamage", 8, "=")
	R.set_value(c, "ClingPatrolOffset", 2, "=")
	R.set_value(c, "PatrolWaitDurationMin", 0.3, "=")
	R.set_value(c, "PatrolWaitDurationMax", 1, "=")
	R.set_value(c, "ClingPatrolDistance", 3, "=")
	R.set_value(c, "StopClingPatrolDistanceToTimeRatio", 0.3, "=")
	R.set_value(c, "m_iCueTick", 0, "=")
	R.set_value(c, "m_iMoanTick", 0, "=")
	R.set_value(c, "m_iExplosionComboTime", 0, "=")
	R.set_value(c, "m_iExplosionCombo", 0, "=")
	R.set_value(c, "BaseSpeedX", R.binary("/", R.binary("/", (float(7) * float(1000)), 60), 60), "=")
	R.set_value(c, "BaseSpeedZ", R.binary("/", R.binary("/", (float(8) * float(1000)), 60), 60), "=")
	R.set_value(c, "m_iGlobalKillSoldierTick", 0, "=")
	R.set_value(c, "MaxGlobalKillSoldierTick", 10, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMovementType"] = R.coerce(0, "int")
	(c).fields["m_iPatrolStep"] = R.coerce(0, "int")
	(c).fields["m_bGoingRight"] = false
	(c).fields["m_bStartPosXSet"] = false
	(c).fields["m_fStartPosX"] = float(NAN)
	(c).fields["m_fPatrolRange"] = float(NAN)
	(c).fields["m_fPatrolWaitTimer"] = float(NAN)
	(c).fields["m_fPatrolWaitDuration"] = float(NAN)
	(c).fields["m_fClingPatrolPos"] = float(NAN)
	(c).fields["m_bClingPatrolRight"] = false
	(c).fields["m_fStopClingPatrolTimer"] = float(NAN)
	(c).fields["m_fClingPatrolDistance"] = float(NAN)
	(c).fields["m_IdleClingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HeadshotHitSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_GibHitSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_PunchSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ElbowSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DoorBashingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_PunchHoodSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_SideGrindingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ClingerSlideSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iHitType"] = R.coerce(0, "int")
	(c).fields["m_bHitFinished"] = false
	(c).fields["m_fPunchTimer"] = float(NAN)
	(c).fields["m_fSpazTimer"] = float(NAN)
	(c).fields["m_fKillDelayTimeStamp"] = float(0)
	(c).fields["m_bExploded"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_fClingPunchDelay"] = float(NAN)
	(c).fields["m_fClingPunchDamage"] = float(NAN)
	(c).fields["m_fClingSpazDelay"] = float(NAN)
	(c).fields["m_fSpeedFactorX"] = float(NAN)
	(c).fields["m_fSpeedFactorZ"] = float(NAN)
	(c).fields["m_MoanSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_GruntSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_GetOnHoodSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_CollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_ThreatSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_AttackSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_fThreatTimer"] = float(NAN)
	(c).fields["m_bGiveCue"] = false
	(c).fields["m_CueSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bFeedStandingUp"] = false
	(c).fields["m_bShotSide"] = false
	(c).fields["m_bShotBack"] = false
	(c).fields["m_bSpawnFeedCorpse"] = false
	(c).fields["m_bBlockedHeadShot"] = false
	(c).fields["m_BlockedHeadHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_bShakyIdle"] = false
	(c).fields["m_bHasShakyIdle"] = false
	(c).fields["m_bSpecialZombie"] = false
	(c).fields["m_iSpecialZombieType"] = R.coerce(0, "int")
	(c).fields["m_vMoveTarget"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_bSpawnGetUp"] = false
	(c).fields["m_bSpawnGoLeft"] = false
	(c).fields["m_fSpawnWalkTarget"] = float(NAN)
	(c).fields["m_fMoanTimer"] = float(NAN)
	(c).fields["m_bDoWaitForCling"] = false
	(c).fields["m_fWaitForClingTimer"] = float(NAN)
	(c).fields["m_fClingCummulativeDamage"] = float(NAN)
	(c).fields["m_fCummulativeDamageToJumpOff"] = float(NAN)
	(c).fields["m_fJumpRatio"] = float(NAN)
	(c).fields["m_vJumpStaticStartPosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vJumpStaticEndPosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vJumpAheadPlayerPosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vJumpStartLocation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vJumpEndLocation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vJumpOnPlayerStartPosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vJumpOnPlayerEndPosition"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fJumpHeight"] = float(NAN)
	(c).fields["m_fJumpTimeSpeed"] = float(NAN)
	(c).fields["m_fActualJumpHeight"] = float(NAN)
	(c).fields["m_fActualJumpTimeSpeed"] = float(NAN)
	(c).fields["m_iJumpForwardDistance"] = R.coerce(15, "int")
	(c).fields["m_bStartingJump"] = false
	(c).fields["m_bInJump"] = false
	(c).fields["m_bEndingJump"] = false
	(c).fields["m_bJumpFront"] = false
	(c).fields["m_fHighwayJumpDistance"] = float(NAN)
	(c).fields["m_fHighwayJumpSideDistance"] = float(NAN)
	(c).fields["m_fHighwayJumpStartDistance"] = float(NAN)
	(c).fields["m_iJumpType"] = R.coerce(0, "int")
	(c).fields["m_bRunning"] = false
	(c).fields["m_bJumpOnPlayerLeft"] = false
	(c).fields["m_fRunAheadTimer"] = float(NAN)
	(c).fields["m_fRunAheadDuration"] = float(NAN)
	(c).fields["m_bCanJumpOnPlayer"] = false
	(c).fields["m_iJumpTargetType"] = R.coerce(0, "int")
	(c).fields["m_iSideGrindedTime"] = R.coerce(0, "int")
	(c).fields["m_iPreJumpMovementType"] = R.coerce(0, "int")
	(c).fields["m_fMoveJumpTimer"] = float(NAN)
	(c).fields["m_fMoveJumpDelay"] = float(NAN)
	(c).fields["m_SpawnBuilding"] = R.coerce(null, "RDEntity")
	(c).fields["m_bRegisteredAsKillable"] = false
	(c).fields["m_Building"] = R.coerce(null, "RDBuildingNew")
	(c).fields["m_bFindBuilding"] = false
	(c).fields["m_bGoToRescuePosition"] = false
	(c).fields["m_vRescuePosition"] = R.coerce(null, "DTVector3D")
	(c).fields["m_iCivilianEatCount"] = R.coerce(0, "int")
	(c).fields["m_bTrackingAndSideCling"] = false
	(c).fields["m_fRunAheadPosX"] = float(NAN)
	(c).fields["m_fBuildingSpawnTimer"] = float(NAN)
	(c).fields["m_fBuildingSpawnPosY"] = float(NAN)
	(c).fields["m_bJumpFromBuilding"] = false
	(c).fields["m_bSwitchedToDynamicLayer"] = true
	(c).fields["m_JumpSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_LandSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bFirstInit"] = true
	(c).fields["m_bUsingColor"] = false
	(c).fields["m_fColorRedMultiplier"] = float(NAN)
	(c).fields["m_fColorGreenMultiplier"] = float(NAN)
	(c).fields["m_fColorBlueMultiplier"] = float(NAN)
	(c).fields["m_iColorRedOffset"] = R.coerce(0, "int")
	(c).fields["m_iColorGreenOffset"] = R.coerce(0, "int")
	(c).fields["m_iColorBlueOffset"] = R.coerce(0, "int")
	(c).fields["m_iPreBashingFenceMovement"] = R.coerce(0, "int")
	(c).fields["m_FenceToBash"] = R.coerce(null, "RDObstacleFence")
	(c).fields["m_fGibHP"] = R.coerce(R.unary("-", 1), "Number")
	(c).fields["m_bWaitToEnterBuilding"] = false
	(c).fields["m_fWaitToEnterBuildingTimer"] = float(0)
	(c).fields["m_bCanSpaz"] = false
	(c).fields["m_bCheckForChopperCollision"] = false
	(c).fields["m_iSideMoveFrames"] = R.coerce(0, "int")
	(c).fields["m_fDissapearTimer"] = float(0)
	(c).fields["m_iClingSurvivalItem"] = R.coerce(0, "int")
	(c).fields["m_bAllowGrubFrontGib"] = false
	(c).fields["m_GunSlingerFirstWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_GunSlingerSecondWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_bCanBeHitForBlood"] = false
	(c).fields["m_bCanBeHitForBloodWithAnim"] = false
	(c).fields["m_bHitForBlood"] = false
	(c).fields["m_Corpse"] = R.coerce(null, "RDObstacleCorpse")
	(c).fields["m_bIsAlphaMutant"] = false
	(c).fields["m_vVelocityDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_vMoveToDelta"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fExplosionRangeX"] = float(8)
	(c).fields["m_fExplosionRangeZ"] = float(8)
	(c).fields["m_fExplosionDamage"] = float(1000)
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fExplosionDelay"] = float(0)
	(c).fields["m_ExplodeInstigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_bDoCharge"] = true
	(c).fields["m_bTrackingPlayerRight"] = false
	(c).fields["m_fFenceDamage"] = float(1)
	(c).fields["m_fGetBackToPlayerTimer"] = float(0)
	(c).fields["m_iKillSoldierTick"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_bDoSpaz"] = false
	(c).fields["m_fPredictPlayerRatio"] = float(NAN)
	return null
