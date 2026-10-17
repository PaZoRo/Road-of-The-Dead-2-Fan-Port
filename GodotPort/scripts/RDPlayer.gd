extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDPlayer(c: Variant, a: Array) -> Variant:
	var v_mcBounds: Variant = null
	R.invoke(R.super_ref(c, "RDPlayer"), [R.klass("MovieClip")])
	(c).fields["m_MCCarInterior"] = R.coerce(R.construct(R.klass("MC_PlayerCar"), []), "MovieClip")
	R.set_value((c).fields.get("m_MCCarInterior"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_MCCarInterior"), "y", R.unary("-", 60), "=")
	(c).fields["m_MCCarBack"] = R.coerce(R.construct(R.klass("MC_PlayerCarBack"), []), "MovieClip")
	R.set_value((c).fields.get("m_MCCarBack"), "m_owner", c, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionLeft"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionRight"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionLeft"), "stop"), [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionRight"), "stop"), [])
	c.fields["m_bUseCurvyCamera"] = false
	R.call_member(c, "CacheAsBitmap", [])
	v_mcBounds = R.coerce(R.invoke(R.get_value((c).fields.get("m_MCCarInterior"), "getBounds"), [(c).fields.get("m_MCCarInterior")]), "Rectangle")
	R.call_member(c.fields.get("m_Bounds"), "Set", [R.get_value(v_mcBounds, "left"), R.unary("-", R.get_value(v_mcBounds, "bottom")), 0, R.get_value(v_mcBounds, "width"), R.get_value(v_mcBounds, "height"), 0])
	c.fields["m_fHeight"] = R.coerce(R.unary("-", R.get_value(v_mcBounds, "top")), "Number")
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	R.call_member(c, "InitSounds", [])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Player"), "int")
	c.fields["m_bIsPlayer"] = true
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.9), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1.8)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_bCanBeHitByExplosion"] = true
	((c).fields.get("m_vFiringArmPos")).fields["X"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "x"), "Number")
	((c).fields.get("m_vFiringArmPos")).fields["Y"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "y"), "Number")
	(c).fields["m_fFiringArmRot"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "rotation"), "Number")
	R.call_member(c, "InitWeapons", [])
	(c).fields["m_BulletHitInteriorEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	(c).fields["m_BulletHitInteriorSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_BulletHitClingerEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerEffects"), "push"), [R.klass("MC_BulletImpactBlood")])
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerEffects"), "push"), [R.klass("MC_BulletImpactBlood2")])
	(c).fields["m_BulletHitClingerSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_BulletHitClingerEffectsAprilsFool"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitClingerEffectsAprilsFool"), "push"), [R.klass("MC_aprilfoolsbloodimpact")])
	(c).fields["m_BlockedHeadBulletHitClingerEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadBulletHitClingerEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	(c).fields["m_BlockedHeadBulletHitClingerSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedHeadBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_BlockedTorsoBulletHitClingerEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedTorsoBulletHitClingerEffects"), "push"), [R.klass("MC_BulletImpactWeak")])
	(c).fields["m_BlockedTorsoBulletHitClingerSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BlockedTorsoBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedTorsoBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedTorsoBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BlockedTorsoBulletHitClingerSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitRubber04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_fMountedMGMuzzlePos"] = R.coerce(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "MountedMG"), "x"), "Number")
	(c).fields["m_EquipWeaponSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EquipWeapon"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_UnequipWeaponSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_UnequipWeapon"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	R.call_member(c, "InitClingerMCs", [])
	R.call_member(c, "Reset", [])
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_MaleMediumCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaLightCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaLightCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaLightCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaLightCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaLightCollision5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MaleHardCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMediumCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMediumCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMediumCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMediumCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMediumCollision5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MaleHugeCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHardCollision7"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_MaleGunnerHugeCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHardCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHardCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHardCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleNotMovingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaNotMoving1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaNotMoving2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaNotMoving3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleCivFullVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCivFullVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaCivFull1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivFullVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaCivFull2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleCivGetInVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn6"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn8"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn9"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleCivSafeVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianSafe1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianSafe2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianSafe3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianSafe4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianSafe5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleCivGetInChopperVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn6"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn8"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_MaleCivilianGetIn9"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleTakeInCivVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaTakeCiv1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaTakeCiv2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaTakeCiv3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverDeathScreamVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverDeathScreamVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverDeath"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")])])
	R.assign(c, "m_MaleGunnerDeathScreamVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerDeathScreamVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerDeath"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")])])
	R.assign(c, "m_MaleDriverHoodEnemyOffVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombieOff2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombieOff3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverReactToHoodEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHoodZombie3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerHoodEnemyOffVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombieOff2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombieOff3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerHoodEnemyOffTaskVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombieOff3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerReactToHoodEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHoodZombie3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverShootZombieVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverShootZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverShootZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerShootZombieVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerShootZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerShootZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleBlownTiresVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleBlownTiresVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaTiresBlown1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBlownTiresVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaTiresBlown2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleCarOnFireVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCarOnFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOnFire1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCarOnFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOnFire2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleExtinguishFireVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleExtinguishFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaFireOut1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleExtinguishFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaFireOut2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverHitCivilianVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitCivilian1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitCivilian2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitCivilian3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitCivilian4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerHitCivilianVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHitCivilian1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHitCivilian2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHitCivilian3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverHitEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverHitZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerHitEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHitZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerHitZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MalePrecisionHitVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGibHit1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGibHit2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGibHit3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGibHit4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGibHit5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverSwitchSeatVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverSwitchSeatVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverSwitchSeat"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerSwitchSeatVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerSwitchSeatVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerSwitchSeat"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleChopperSwitchVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleChopperSwitchVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaChopperSwitch"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverAlleywayVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverAlleywayVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverAlleyway1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerAlleywayVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerAlleywayVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerAlleyway1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverTaskCancelVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverTaskCancel1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverTaskCancel2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerTaskCancelVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerTaskCancel1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerTaskCancel2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverTaskInProgressVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverTaskInProgress1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverTaskInProgress2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverTaskInProgress3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerTaskInProgressVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerTaskInProgress1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerTaskInProgress2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaGunnerTaskInProgress3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleOutOfAmmoVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOutOfAmmo1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOutOfAmmo2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOutOfAmmo3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaOutOfAmmo4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleReloadVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload6"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReload7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleReloadMagVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadMag1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadMag2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadMag3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleReloadWithClingerVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadWithClinger01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadWithClinger02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaReloadWithClinger03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleHeavyBreathingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleHeavyBreathingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHeavyBreathing01"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHeavyBreathingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHeavyBreathing02"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverLowHealthVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverLowHealthVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverLowHealth01"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverLowHealthVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverLowHealth01"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.assign(c, "m_MaleCallChopperSupportVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleCallChopperSupportVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaCallChopperSupport01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleCallChopperSupportVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaCallChopperSupport02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleSideClingStartVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingStart01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingStart02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingStart03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleSideClingLoopVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingLoop01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingLoop02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaSideClingLoop03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleClingerComingBackVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaClingerComingBack01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaClingerComingBack02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaClingerComingBack03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaClingerComingBack04"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaRamp02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaRamp01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverExitRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverExitRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaExitRamp02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleGunnerExitRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleGunnerExitRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaExitRamp01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleJetComingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaJetComing01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaJetComing02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaJetComing03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleJetPassedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignCochetaWoah_Surprised"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignCochetaYouHaveGotToBeKiddingMe_Assertive"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignCochetaShit_Exclamation"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleHelicopterVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHelicopter01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHelicopter02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaHelicopter03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleMutantArrivedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMutantArrived01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMutantArrived02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMutantArrived03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleProtectTaskVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaProtectTask01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaProtectTask02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaProtectTask03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleBulletHitVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit04"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit08"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit09"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBulletHit10"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleDriverDiedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverDied01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverDied02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaDriverDied03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleMedShotVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleMedShotVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaMedShot01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_MaleBashClingerVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_MaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBashClinger01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBashClinger02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_MaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaBashClinger03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleMediumCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision7"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeLightCollision8"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_FemaleHardCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision7"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision8"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision9"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMediumCollision10"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_FemaleHugeCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHardCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHardCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHardCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHardCollision4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_FemaleGunnerHugeCollisionGruntVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHardCollision1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHardCollision2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHardCollision3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleNotMovingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeNotMoving1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeNotMoving2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleNotMovingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeNotMoving3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCivFullVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivFullVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeCivFull1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivFullVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeCivFull2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCivGetInVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn6"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn8"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCivSafeVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianSafe1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianSafe2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianSafe3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivSafeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianSafe4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCivGetInVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCivGetInChopperVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FemaleCivilianGetIn8"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleTakeInCivVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeTakeCiv1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeTakeCiv2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleTakeInCivVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeTakeCiv3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleCarOnFireVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCarOnFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOnFire1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCarOnFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOnFire2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleExtinguishFireVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleExtinguishFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeFireOut1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleExtinguishFireVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeFireOut2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverDeathScreamVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverDeathScreamVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverDeath"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")])])
	R.assign(c, "m_FemaleGunnerDeathScreamVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerDeathScreamVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerDeath"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")])])
	R.assign(c, "m_FemaleDriverHitCivilianVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHitCivilian1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHitCivilian2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHitCivilian3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerHitCivilianVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHitCivilian1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHitCivilian2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHitCivilianVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHitCivilian3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverHitEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHitZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHitZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerHitEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHitZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHitEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHitZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverHoodEnemyOffVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombieOff2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombieOff3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverReactToHoodEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverHoodZombie3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerHoodEnemyOffVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombieOff2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombieOff3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerHoodEnemyOffTaskVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombieOff1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombieOff2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerReactToHoodEnemyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerReactToHoodEnemyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerHoodZombie3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverShootZombieVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverShootZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverShootZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerShootZombieVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerShootZombie1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerShootZombieVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerShootZombie2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverSwitchSeatVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverSwitchSeatVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverSwitchSeat"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerSwitchSeatVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerSwitchSeatVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerSwitchSeat"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleChopperSwitchVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleChopperSwitchVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeChopperSwitch"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverAlleywayVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverAlleywayVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverAlleyway1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerAlleywayVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerAlleywayVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerAlleyway1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverTaskCancelVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverTaskCancel1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverTaskCancel2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerTaskCancelVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerTaskCancel1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerTaskCancelVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerTaskCancel2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverTaskInProgressVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverTaskInProgress1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverTaskInProgress2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverTaskInProgress3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerTaskInProgressVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerTaskInProgress1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerTaskInProgress2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerTaskInProgressVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGunnerTaskInProgress3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemalePrecisionHitVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGibHit1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGibHit2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemalePrecisionHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeGibHit3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleOutOfAmmoVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOutOfAmmo1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOutOfAmmo2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOutOfAmmo3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleOutOfAmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeOutOfAmmo4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleReloadVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload4"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload5"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload6"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload7"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload8"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload9"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload10"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReload11"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleReloadMagVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadMag1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadMag2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadMagVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadMag3"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleReloadWithClingerVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadWithClinger01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadWithClinger02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleReloadWithClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeReloadWithClinger03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleBlownTiresVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleBlownTiresVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeTiresBlown1"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBlownTiresVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeTiresBlown2"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleHeavyBreathingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleHeavyBreathingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHeavyBreathing01"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHeavyBreathingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHeavyBreathing02"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverLowHealthVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverLowHealthVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverLowHealth01"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverLowHealthVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverLowHealth02"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialVoiceSoundGroup")])])
	R.assign(c, "m_FemaleCallChopperSupportVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleCallChopperSupportVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeCallChopperSupport01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleCallChopperSupportVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeCallChopperSupport02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleSideClingStartVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingStart01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingStart02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingStartVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingStart03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleSideClingLoopVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingLoop01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingLoop02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleSideClingLoopVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSideClingLoop03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleClingerComingBackVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeClingerComingBack01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeClingerComingBack02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeClingerComingBack03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeClingerComingBack04"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeRamp02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeRamp01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverExitRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverExitRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeExitRamp02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleGunnerExitRampVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleGunnerExitRampVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeExitRamp01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleJetComingVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeJetComing01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeJetComing02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetComingVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeJetComing03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleJetPassedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignDianeNoWay_Assertive"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignDianeYouHaveGotToBeKiddingMe_Assertive"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleJetPassedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CampaignDianeShit_Exclamation"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleHelicopterVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHelicopter01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHelicopter02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleHelicopterVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeHelicopter03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleMutantArrivedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMutantArrived01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMutantArrived02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleMutantArrivedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMutantArrived03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleProtectTaskVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeProtectTask01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeProtectTask02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleProtectTaskVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeProtectTask03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleBulletHitVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit04"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit08"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit09"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBulletHit10"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleDriverDiedVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverDied01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverDied02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleDriverDiedVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeDriverDied03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleMedShotVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleMedShotVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeMedShot01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_FemaleBashClingerVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBashClinger01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBashClinger02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeBashClinger03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_ChopperSupportReadyVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportReadyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportReady01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportReadyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportReady02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportReadyVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportReady03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_ChopperSupportLeavesVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportLeavesVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportLeaves01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportLeavesVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportLeaves02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportLeavesVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportLeaves03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_ChopperSupportAcknowledgeVoices", "RDPlayer", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportAcknowledgeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportAcknowledge01"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportAcknowledgeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportAcknowledge02"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.call_member(R.static_value("RDPlayer", "m_ChopperSupportAcknowledgeVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ChopperSupportAcknowledge03"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])])
	R.assign(c, "m_TurkeyGetInVocie", "RDPlayer", R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Turkey"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), "=")
	R.assign(c, "m_HeadShotDialog", "RDPlayer", R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FirstHeadShot_1D"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FirstHeadShot_2C"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_FirstHeadShot_3D"), (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")])]), "=")
	return null

static func f_InitClingerMCs(c: Variant, a: Array) -> Variant:
	var v_clingerMC: Variant = null
	var v_i: Variant = 0
	v_clingerMC = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerContainerHood"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerContainerHood"), "MovieClip")
	(c).fields["m_ClingerContainerInside"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerContainerInside"), "MovieClip")
	(c).fields["m_ClingerContainerUnder"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerContainerUnder"), "MovieClip")
	(c).fields["m_ClingerContainerSide"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerContainerSide"), "MovieClip")
	R.set_value((c).fields.get("m_ClingerContainerHood"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_ClingerContainerInside"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_ClingerContainerUnder"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_ClingerContainerSide"), "m_owner", c, "=")
	(c).fields["m_ClingerZombieNormalMaleLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleNewLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleNewLeft"), "MovieClip")
	(c).fields["m_ClingerZombieHardLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieHardLeft"), "MovieClip")
	(c).fields["m_ClingerZombieGrubLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubLeft"), "MovieClip")
	(c).fields["m_ClingerZombieGrubLeftUnder"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubLeftUnder"), "MovieClip")
	(c).fields["m_ClingerZombieSoldierLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieSoldierLeft"), "MovieClip")
	(c).fields["m_ClingerZombieVeryHardLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieVeryHardLeft"), "MovieClip")
	(c).fields["m_ClingerSoldierLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerSoldierLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleNewInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleNewInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieHardInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieHardInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieGrubInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieSoldierInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieSoldierInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieVeryHardInsideLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieVeryHardInsideLeft"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleNewRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleNewRight"), "MovieClip")
	(c).fields["m_ClingerZombieHardRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieHardRight"), "MovieClip")
	(c).fields["m_ClingerZombieGrubRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubRight"), "MovieClip")
	(c).fields["m_ClingerZombieGrubRightUnder"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubRightUnder"), "MovieClip")
	(c).fields["m_ClingerZombieSoldierRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieSoldierRight"), "MovieClip")
	(c).fields["m_ClingerZombieVeryHardRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieVeryHardRight"), "MovieClip")
	(c).fields["m_ClingerSoldierRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerSoldierRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalMaleNewInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieNormalFemaleNewInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieHardInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieHardInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieGrubInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieGrubInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieSoldierInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieSoldierInsideRight"), "MovieClip")
	(c).fields["m_ClingerZombieVeryHardInsideRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerZombieVeryHardInsideRight"), "MovieClip")
	(c).fields["m_SideGrapplerLeft"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "SideGrapplerLeft"), "MovieClip")
	(c).fields["m_SideGrapplerRight"] = R.coerce(R.get_value((c).fields.get("m_MCCarInterior"), "SideGrapplerRight"), "MovieClip")
	(c).fields["m_AllClingerMCs"] = R.coerce(R.construct(R.klass("Array"), [(c).fields.get("m_ClingerZombieNormalMaleLeft"), (c).fields.get("m_ClingerZombieNormalFemaleLeft"), (c).fields.get("m_ClingerZombieNormalMaleNewLeft"), (c).fields.get("m_ClingerZombieNormalFemaleNewLeft"), (c).fields.get("m_ClingerZombieHardLeft"), (c).fields.get("m_ClingerZombieGrubLeft"), (c).fields.get("m_ClingerZombieGrubLeftUnder"), (c).fields.get("m_ClingerZombieSoldierLeft"), (c).fields.get("m_ClingerZombieVeryHardLeft"), (c).fields.get("m_ClingerSoldierLeft"), (c).fields.get("m_ClingerZombieNormalMaleInsideLeft"), (c).fields.get("m_ClingerZombieNormalFemaleInsideLeft"), (c).fields.get("m_ClingerZombieNormalMaleNewInsideLeft"), (c).fields.get("m_ClingerZombieNormalFemaleNewInsideLeft"), (c).fields.get("m_ClingerZombieHardInsideLeft"), (c).fields.get("m_ClingerZombieGrubInsideLeft"), (c).fields.get("m_ClingerZombieSoldierInsideLeft"), (c).fields.get("m_ClingerZombieVeryHardInsideLeft"), (c).fields.get("m_ClingerZombieNormalMaleRight"), (c).fields.get("m_ClingerZombieNormalFemaleRight"), (c).fields.get("m_ClingerZombieNormalMaleNewRight"), (c).fields.get("m_ClingerZombieNormalFemaleNewRight"), (c).fields.get("m_ClingerZombieHardRight"), (c).fields.get("m_ClingerZombieGrubRight"), (c).fields.get("m_ClingerZombieGrubRightUnder"), (c).fields.get("m_ClingerZombieSoldierRight"), (c).fields.get("m_ClingerZombieVeryHardRight"), (c).fields.get("m_ClingerSoldierRight"), (c).fields.get("m_ClingerZombieNormalMaleInsideRight"), (c).fields.get("m_ClingerZombieNormalFemaleInsideRight"), (c).fields.get("m_ClingerZombieNormalMaleNewInsideRight"), (c).fields.get("m_ClingerZombieNormalFemaleNewInsideRight"), (c).fields.get("m_ClingerZombieHardInsideRight"), (c).fields.get("m_ClingerZombieGrubInsideRight"), (c).fields.get("m_ClingerZombieSoldierInsideRight"), (c).fields.get("m_ClingerZombieVeryHardInsideRight"), (c).fields.get("m_SideGrapplerLeft"), (c).fields.get("m_SideGrapplerRight")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AllClingerMCs"), "length"))):
		pass
		v_clingerMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AllClingerMCs"), v_i), R.klass("MovieClip")), "MovieClip")
		R.invoke(R.get_value(R.get_value(v_clingerMC, "parent"), "removeChild"), [v_clingerMC])
		v_i = R.signed32(v_i + 1)
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_blood: Variant = null
	var v_clingerMC: Variant = null
	v_i = R.coerce(0, "int")
	v_blood = R.coerce(null, "MovieClip")
	v_clingerMC = R.coerce(null, "MovieClip")
	(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
	(c.fields.get("m_vLocation")).fields["Y"] = float(0)
	(c).fields["m_bStartedPerfectDefense"] = false
	(c).fields["m_bCallMutantArrived"] = true
	(c).fields["m_fLavaTimer"] = float(0)
	(c).fields["m_bPaused"] = false
	(c).fields["m_bPauseForAbort"] = false
	(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "visible", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer"), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "visible", R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")), "=")
	if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")):
		pass
		(c).fields["m_AllDashboardBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood1"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood2"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood3"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood5"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood7"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood8"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood9"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood10"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood11"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood12"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood13")]), "Array")
		(c).fields["m_DashboardCenterBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood5"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood7"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood8"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood9")]), "Array")
		(c).fields["m_DashboardFrontSideLeftBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood3"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood5")]), "Array")
		(c).fields["m_DashboardFrontSideRightBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood9"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood10"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood11"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood12")]), "Array")
		(c).fields["m_DashboardSideLeftBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood1"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood2"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood3"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4")]), "Array")
		(c).fields["m_DashboardSideRightBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood10"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood11"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood12"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood13")]), "Array")
	else:
		pass
		(c).fields["m_AllDashboardBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood1"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood2"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood3"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood5"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood7"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood8"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood9"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood10"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood11"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood12"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood13"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood14"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood15"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood16"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood17"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood18"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood19"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood20"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood21"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood22")]), "Array")
		(c).fields["m_DashboardCenterBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood7"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood8"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood9"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood10"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood11"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood12"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood13")]), "Array")
		(c).fields["m_DashboardFrontSideLeftBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood5"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood7"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood8"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood9")]), "Array")
		(c).fields["m_DashboardFrontSideRightBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood13"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood14"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood15"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood16"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood17"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood18")]), "Array")
		(c).fields["m_DashboardSideLeftBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood1"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood2"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood3"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood4"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood5"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood6"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood7")]), "Array")
		(c).fields["m_DashboardSideRightBloods"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood17"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood18"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood19"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood20"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood21"), R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "Blood22")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AllDashboardBloods"), "length"))):
		pass
		v_blood = R.coerce(R.get_value((c).fields.get("m_AllDashboardBloods"), v_i), "MovieClip")
		R.set_value(v_blood, "m_fAlpha", 0, "=")
		R.set_value(v_blood, "alpha", 0, "=")
		v_i = R.signed32(v_i + 1)
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [0]), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [0]), "Number")
	(c).fields["m_fRelativeLocationX"] = float(0)
	(c).fields["m_bFailed"] = false
	(c).fields["m_iFailType"] = R.coerce(R.static_value("RDPlayer", "FailType_None"), "int")
	(c).fields["m_bForceBrake"] = false
	c.fields["m_fDepthPosition"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_bHasCustomDepthPosition"] = true
	(c).fields["m_bGoForward"] = false
	(c).fields["m_bGoBackward"] = false
	(c).fields["m_bSteeringLeft"] = false
	(c).fields["m_bSteeringRight"] = false
	(c).fields["m_bHandBraking"] = false
	(c).fields["m_fWheelDirection"] = float(0)
	R.call_member(c, "UpdateEngineValues", [])
	R.call_member(c, "UpdateDrivingValues", [])
	(c).fields["m_fDesiredSpeedX"] = float(0)
	(c).fields["m_fPreEffectVelocityX"] = float(0)
	(c).fields["m_fEngineScale"] = float(0.70711)
	(c).fields["m_iBumperLevel"] = R.coerce(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBumperLevel") if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0))) else 0), "int")
	R.call_member(c, "UpdateBumperValues", [])
	(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Idle"), "int")
	(c).fields["m_iOldEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Unset"), "int")
	(c).fields["m_fEngineTime"] = float(0)
	(c).fields["m_iGear"] = R.coerce(0, "int")
	(c).fields["m_fGearRatio"] = float(0)
	(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
	(c).fields["m_bIsSideScraping"] = false
	(c).fields["m_bHorning"] = false
	R.call_member(c, "HideAllDashboardBloods", [])
	(c).fields["m_bStartMutantSandwich"] = false
	(c).fields["m_bStartWhenOurPowersCombine"] = false
	(c).fields["m_iWhenOurPowersCombineSwitches"] = R.coerce(0, "int")
	R.call_member(c, "SetClinger", [null, false, false])
	R.call_member(c, "SetClinger", [null, false, true])
	R.call_member(c, "SetClinger", [null, true, false])
	R.call_member(c, "SetClinger", [null, true, true])
	(c).fields["m_fBodyHP"] = float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBodyHP"))
	(c).fields["m_fBumpStrength"] = float(0)
	(c).fields["m_fBumpSpeed"] = float(0)
	(c).fields["m_fBumpDeccel"] = float(0)
	(c).fields["m_fTireBiasStrength"] = float(0)
	(c).fields["m_fMaleArmBloodLevel"] = float(0)
	(c).fields["m_fFemaleArmBloodLevel"] = float(0)
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndStop"), [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "totalFrames")])
	if R.truth(R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarBack")])):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_MCCarBack")])
	if R.truth(R.unary("!", R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarInterior")]))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "addChild"), [(c).fields.get("m_MCCarInterior")])
	(c).fields["m_currentEngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_currentTireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fOilDuration"] = float(0)
	(c).fields["m_fOilTime"] = float(0)
	(c).fields["m_fOilFactor"] = float(0)
	(c).fields["m_fOilControlFactor"] = float(0)
	(c).fields["m_iNbBlownTires"] = R.coerce(floorf(float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires"))), "int")
	R.call_member(c, "UpdateTireValues", [])
	R.call_member(c, "UpdateBumperVisual", [])
	(c).fields["m_bIsOnSmoke"] = false
	(c).fields["m_bIsOnFire"] = false
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "stop"), [])
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "stop"), [])
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible", false, "=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AllClingerMCs"), "length"))):
		pass
		v_clingerMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AllClingerMCs"), v_i), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.get_value(v_clingerMC, "parent")):
			pass
			R.invoke(R.get_value(R.get_value(v_clingerMC, "parent"), "removeChild"), [v_clingerMC])
		R.invoke(R.get_value(v_clingerMC, "gotoAndStop"), [1])
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "rotation", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheel"), "rotation", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheelCar"), "rotation", 0, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "rotation", 0, "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
	(c).fields["m_bReactedToHoodEnemy"] = false
	(c).fields["m_RadioCommSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iRadioCommPriority"] = R.coerce(0, "int")
	(c).fields["m_bDeathRaceStarted"] = false
	(c).fields["m_fDeathRaceStartPos"] = float(0)
	(c).fields["m_bFuckWheelsStarted"] = false
	(c).fields["m_fFuckWheelsStartPos"] = float(0)
	R.call_member(c, "InitWeapons", [])
	if R.truth(((float((c).fields.get("m_iWeaponCocheta")) == float(4)) and R.unary("!", R.call_member(c, "HasWeapon", [4])))):
		pass
		(c).fields["m_iWeaponCocheta"] = R.coerce(0, "int")
	if R.truth(((float((c).fields.get("m_iWeaponDiane")) == float(4)) and R.unary("!", R.call_member(c, "HasWeapon", [4])))):
		pass
		(c).fields["m_iWeaponDiane"] = R.coerce(0, "int")
	R.call_member(c, "SetWeapon", [((c).fields.get("m_iWeaponCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_iWeaponDiane"))])
	(c).fields["m_fNotMovingTimer"] = float(0)
	(c).fields["m_bPlayFullCivVoice"] = false
	(c).fields["m_bPlayCivGetInVoice"] = false
	(c).fields["m_bPlayDriverDeathVoice"] = false
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "MountedMG"), "visible", false, "=")
	(c).fields["m_fHandlingInfluenceX"] = float(0)
	(c).fields["m_fHandlingInfluenceY"] = float(0)
	(c).fields["m_bDoFirstUpdateInit"] = true
	(c).fields["m_iCurrentTask"] = R.coerce(R.static_value("RDPlayer", "Task_None"), "int")
	R.call_member(c, "StopVoiceSound", [])
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	(c).fields["m_fDeathWeaponSoundTime"] = float(0)
	(c).fields["m_fMedShieldTimer"] = float(0)
	(c).fields["m_fSideGrindingBlood"] = float(0)
	(c).fields["m_fShootingBlood"] = float(0)
	(c).fields["m_fClingPatrolDistance"] = float(0)
	(c).fields["m_fLastCurveRotation"] = float(0)
	(c).fields["m_bPlayChopperSupportAcknowledgeVoice"] = false
	(c).fields["m_fCummulativeBodyDamage"] = float(0)
	(c).fields["m_fLowHealthTimer"] = float(0)
	(c).fields["m_bInEnding"] = false
	(c).fields["m_bFullSpeedMode"] = false
	(c).fields["m_fMaxSpeedFactor"] = float(1)
	(c).fields["m_fTargetMaxSpeedFactor"] = float(1)
	return null

static func f_UpdateBumperValues(c: Variant, a: Array) -> Variant:
	(c).fields["m_fBumperSpeedLossFactor"] = R.coerce(R.get_value(R.static_value("RDPlayer", "BumperSpeedLossFactors"), (c).fields.get("m_iBumperLevel")), "Number")
	(c).fields["m_fBumperDamageCutOff"] = R.coerce(R.get_value(R.static_value("RDPlayer", "BumperDamageCutOffs"), (c).fields.get("m_iBumperLevel")), "Number")
	(c).fields["m_fBumperDamageAbsorbtion"] = R.coerce(R.get_value(R.static_value("RDPlayer", "BumperDamageAbsorbtions"), (c).fields.get("m_iBumperLevel")), "Number")
	(c).fields["m_fEngineDamageAbsorbtion"] = R.coerce(R.get_value(R.static_value("RDPlayer", "EngineDamageAbsorbtions"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iEngineLevel")), "Number")
	return null

static func f_UpdateDrivingValues(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		(c).fields["m_fXMaxSpeed"] = float((float((float(R.static_value("RDPlayer", "XMaxSpeedMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XMaxSpeedMax")) - float(R.static_value("RDPlayer", "XMaxSpeedMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XMaxSpeedBonus"))))))
		(c).fields["m_fXAccel"] = float((float((float(R.static_value("RDPlayer", "XAccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XAccelMax")) - float(R.static_value("RDPlayer", "XAccelMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XAccelBonus"))))))
		(c).fields["m_fXDeccel"] = float((float((float(R.static_value("RDPlayer", "XDeccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XDeccelMax")) - float(R.static_value("RDPlayer", "XDeccelMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XDeccelBonus"))))))
		(c).fields["m_fXMaxSpeedHandBrake"] = float((float((float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMax")) - float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeBonus"))))))
		(c).fields["m_fXAccelHandBrake"] = float((float((float(R.static_value("RDPlayer", "XAccelHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XAccelHandBrakeMax")) - float(R.static_value("RDPlayer", "XAccelHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XAccelHandBrakeBonus"))))))
		(c).fields["m_fXDeccelHandBrake"] = float((float((float(R.static_value("RDPlayer", "XDeccelHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeDrivingLevel")) * float((float(R.static_value("RDPlayer", "XDeccelHandBrakeMax")) - float(R.static_value("RDPlayer", "XDeccelHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XDeccelHandBrakeBonus"))))))
	else:
		pass
		(c).fields["m_fXMaxSpeed"] = float((float((float(R.static_value("RDPlayer", "XMaxSpeedMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XMaxSpeedMax")) - float(R.static_value("RDPlayer", "XMaxSpeedMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XMaxSpeedBonus"))))))
		(c).fields["m_fXAccel"] = float((float((float(R.static_value("RDPlayer", "XAccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XAccelMax")) - float(R.static_value("RDPlayer", "XAccelMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XAccelBonus"))))))
		(c).fields["m_fXDeccel"] = float((float((float(R.static_value("RDPlayer", "XDeccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XDeccelMax")) - float(R.static_value("RDPlayer", "XDeccelMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XDeccelBonus"))))))
		(c).fields["m_fXMaxSpeedHandBrake"] = float((float((float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMax")) - float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XMaxSpeedHandBrakeBonus"))))))
		(c).fields["m_fXAccelHandBrake"] = float((float((float(R.static_value("RDPlayer", "XAccelHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XAccelHandBrakeMax")) - float(R.static_value("RDPlayer", "XAccelHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XAccelHandBrakeBonus"))))))
		(c).fields["m_fXDeccelHandBrake"] = float((float((float(R.static_value("RDPlayer", "XDeccelHandBrakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaDrivingLevel")) * float((float(R.static_value("RDPlayer", "XDeccelHandBrakeMax")) - float(R.static_value("RDPlayer", "XDeccelHandBrakeMin"))))), 9)))) + float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")) * float(R.static_value("RDPlayer", "XDeccelHandBrakeBonus"))))))
	if R.truth(R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))):
		pass
		(c).fields["m_fXMaxSpeed"] = R.coerce(R.binary("*", (c).fields.get("m_fXMaxSpeed"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
		(c).fields["m_fXAccel"] = R.coerce(R.binary("*", (c).fields.get("m_fXAccel"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
		(c).fields["m_fXDeccel"] = R.coerce(R.binary("*", (c).fields.get("m_fXDeccel"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
		(c).fields["m_fXMaxSpeedHandBrake"] = R.coerce(R.binary("*", (c).fields.get("m_fXMaxSpeedHandBrake"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
		(c).fields["m_fXAccelHandBrake"] = R.coerce(R.binary("*", (c).fields.get("m_fXAccelHandBrake"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
		(c).fields["m_fXDeccelHandBrake"] = R.coerce(R.binary("*", (c).fields.get("m_fXDeccelHandBrake"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
	return null

static func f_UpdateEngineValues(c: Variant, a: Array) -> Variant:
	(c).fields["m_fMaxSpeed"] = R.coerce(R.get_value(R.static_value("RDPlayer", "EngineSpeeds"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iEngineLevel")), "Number")
	if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer"))):
		pass
		(c).fields["m_fMaxSpeed"] = R.coerce(R.binary("*", (c).fields.get("m_fMaxSpeed"), R.static_value("RDPlayer", "JohnCarEngineFactor")), "Number")
	return null

static func f_InitSounds(c: Variant, a: Array) -> Variant:
	(c).fields["m_IdleSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarIdle"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_DeccelNoBrakeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelNoBrake"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_MaxSpeedSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarMaxSpeed"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_AccelSounds"] = R.coerce(R.construct(R.klass("Array"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarAccel6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])]), "Array")
	(c).fields["m_DeccelBrakeSounds"] = R.coerce(R.construct(R.klass("Array"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TankCarDeccelBrake6"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])]), "Array")
	(c).fields["m_BrakeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TireBrake"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_GrassSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TireBrakeGrass"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_LavaSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Lava"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_HornSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Horn3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_HornCarSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Horn2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_SideScrapingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SideScraping"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_SmokingEngineSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SmokingEngine"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BurningEngineSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BurningEngine"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_TireBlowSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TireBlow"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_TireAlreadyBlownSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TireAlreadyBlown"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_TireScrapingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TireBlownScraping"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_OilSlickSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_OilSlick"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_DoorOpenSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DoorOpen"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_DoorCloseSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_DoorClose"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_MedSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MedStab"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_EarRingingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_EarRinging"), (R.static_value("RDGame", "Instance")).fields.get("m_CrucialSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BulletHitFleshSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_BulletHitFleshSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitFleshSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_BulletHitFleshSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_iBulletHitFleshIndex"] = R.coerce(0, "int")
	(c).fields["m_LightCollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_LightCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_LightCollision06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_MediumCollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_MediumCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MediumCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MediumCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MediumCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MediumCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MediumCollision03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MediumCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MediumCollision04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_MediumCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MediumCollision05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_HardCollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_HardCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HardCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_HardCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HardCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_HardCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HardCollision03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_HardCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HardCollision04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_HardCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HardCollision05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_HugeCollisionSounds"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_HugeCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.call_member((c).fields.get("m_HugeCollisionSounds"), "AddValue", [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HugeCollision02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	return null

static func f_StopAnimations(c: Variant, a: Array) -> Variant:
	var v_clingerMC: Variant = null
	var v_i: Variant = 0
	v_clingerMC = R.coerce(null, "MovieClip")
	R.invoke(R.get_value((c).fields.get("m_MCCarInterior"), "stop"), [])
	R.invoke(R.get_value((c).fields.get("m_MCCarBack"), "stop"), [])
	R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "stop"), [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "stop"), [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheel"), "stop"), [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheelCar"), "stop"), [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "stop"), [])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AllClingerMCs"), "length"))):
		pass
		v_clingerMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AllClingerMCs"), v_i), R.klass("MovieClip")), "MovieClip")
		R.invoke(R.get_value(v_clingerMC, "gotoAndStop"), [1])
		v_i = R.signed32(v_i + 1)
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), "StartFade", [1, 0])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), "StartFade", [1, 0])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_MusicSoundGroup"), "StartFade", [1, 0])
	return null

static func f_StopAllSoundsOnActor(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "StopAllSoundsOnActor"), [])
	if R.truth((c).fields.get("m_TaskSound")):
		pass
		R.call_member((c).fields.get("m_TaskSound"), "Stop", [])
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_FirstUpdateInit(c: Variant, a: Array) -> Variant:
	(c).fields["m_bChopperMode"] = R.coerce(R.call_member((c).fields.get("m_GameModeGameplay"), "IsChopperMode", []), "Boolean")
	R.call_member(c, "InitWeapons", [])
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ChopperInside"), "visible", (c).fields.get("m_bChopperMode"), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ChopperInsideBulletCollision"), "visible", (c).fields.get("m_bChopperMode"), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "visible", R.unary("!", (c).fields.get("m_bChopperMode")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "visible", R.unary("!", (c).fields.get("m_bChopperMode")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheel"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Interior"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "InteriorBulletCollision"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Bumper"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheelCar"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "InteriorCar"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "InteriorBulletCollisionCar"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "BumperCar"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloodsCar"), "visible", (R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))), "=")
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
		if R.truth(R.unary("!", R.call_member((c).fields.get("m_FlySound"), "IsPlaying", []))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound"), true])
	else:
		pass
		if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
			pass
			(c).fields["m_TireScrapingShake"] = R.coerce(R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["TireScraping", 1, 0, R.unary("-", 1), 0]), "RDCameraShake")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_TireScrapingSound"), true])
			R.call_member(c, "StartTireBias", [])
		R.call_member(c, "UpdateBumperVisual", [false])
	(c).fields["m_bDoFirstUpdateInit"] = false
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bDoFirstUpdateInit")):
		pass
		R.call_member(c, "FirstUpdateInit", [])
	R.call_member(c, "UpdatePlayerState", [v_fDeltaTime])
	R.call_member(c, "UpdateTask", [v_fDeltaTime])
	R.call_member(c, "UpdateCarState", [v_fDeltaTime])
	R.call_member(c, "UpdateEngineTime", [v_fDeltaTime, (c).fields.get("m_iOldEngineState")])
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
	if R.truth((float((c).fields.get("m_fPlayHitCivilianVoiceTime")) > float(0))):
		pass
		(c).fields["m_fPlayHitCivilianVoiceTime"] = R.coerce(R.binary("-", (c).fields.get("m_fPlayHitCivilianVoiceTime"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fPlayHitCivilianVoiceTime")) <= float(0))):
			pass
			if R.truth(R.unary("!", R.call_member(c, "HasVoicePlaying", []))):
				pass
				R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverHitCivilianVoices"), R.static_value("RDPlayer", "m_MaleGunnerHitCivilianVoices"), R.static_value("RDPlayer", "m_FemaleDriverHitCivilianVoices"), R.static_value("RDPlayer", "m_FemaleGunnerHitCivilianVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Extra")])
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "Update"), [v_fDeltaTime])
	return null

static func f_UpdateAiming(c: Variant, a: Array) -> Variant:
	var v_fDownRatio: Variant = NAN
	var v_viewport: Variant = null
	var v_fActualAimingSpeed: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDownRatio = float(NAN)
	v_viewport = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_Viewport"), "Viewport")
	v_fActualAimingSpeed = R.coerce(R.call_member((c).fields.get("m_Weapon"), "GetAimingSpeed", []), "Number")
	(c).fields["m_fTargetAimingX"] = R.coerce(R.get_value((R.static_value("RDGame", "Instance")).fields.get("m_RootMC"), "mouseX"), "Number")
	(c).fields["m_fTargetAimingY"] = R.coerce(R.get_value((R.static_value("RDGame", "Instance")).fields.get("m_RootMC"), "mouseY"), "Number")
	(c).fields["m_fAimingX"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fAimingX"), (c).fields.get("m_fTargetAimingX"), v_fDeltaTime, v_fActualAimingSpeed]), "Number")
	(c).fields["m_fAimingY"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fAimingY"), (c).fields.get("m_fTargetAimingY"), v_fDeltaTime, v_fActualAimingSpeed]), "Number")
	(c).fields["m_fHandlingInfluenceX"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fHandlingInfluenceX"), 0, v_fDeltaTime, R.call_member((c).fields.get("m_Weapon"), "GetHandlingInfluenceRecoverySpeed", [])]), "Number")
	(c).fields["m_fHandlingInfluenceY"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fHandlingInfluenceY"), 0, v_fDeltaTime, R.call_member((c).fields.get("m_Weapon"), "GetHandlingInfluenceRecoverySpeed", [])]), "Number")
	(c).fields["m_fAimingX"] = R.coerce(R.binary("+", (c).fields.get("m_fAimingX"), (c).fields.get("m_fHandlingInfluenceX")), "Number")
	(c).fields["m_fAimingY"] = R.coerce(R.binary("+", (c).fields.get("m_fAimingY"), (c).fields.get("m_fHandlingInfluenceY")), "Number")
	(c).fields["m_fAimingRatioX"] = float(R.binary("/", (float((float(R.binary("/", (c).fields.get("m_fAimingX"), (v_viewport).fields.get("m_iWidth"))) * float(R.static_value("RDGame", "ReferenceResX")))) - float(R.binary("/", R.static_value("RDGame", "ReferenceResX"), 2))), R.binary("/", R.static_value("RDGame", "ReferenceResX"), 2)))
	(c).fields["m_fAimingRatioY"] = float(R.binary("/", (float((float(R.binary("/", (c).fields.get("m_fAimingY"), (v_viewport).fields.get("m_iHeight"))) * float(R.static_value("RDGame", "ReferenceResY")))) - float(R.binary("/", R.static_value("RDGame", "ReferenceResY"), 2))), R.binary("/", R.static_value("RDGame", "ReferenceResY"), 2)))
	if R.truth((float((c).fields.get("m_fAimingRatioX")) < float(0))):
		pass
		if R.truth((float((c).fields.get("m_fAimingRatioY")) < float(0))):
			pass
			R.call_member(c, "SetBlendedWeaponPos", [((c).fields.get("m_Weapon")).fields.get("m_TopLeftPos"), ((c).fields.get("m_Weapon")).fields.get("m_TopPos"), ((c).fields.get("m_Weapon")).fields.get("m_LeftPos"), ((c).fields.get("m_Weapon")).fields.get("m_CenterPos"), (float(1) - R.num(R.call_static("Maths", "AbsNumber", [(c).fields.get("m_fAimingRatioX")]))), (float(1) - R.num(R.call_static("Maths", "AbsNumber", [(c).fields.get("m_fAimingRatioY")])))])
		else:
			pass
			R.call_member(c, "SetBlendedWeaponPos", [((c).fields.get("m_Weapon")).fields.get("m_LeftPos"), ((c).fields.get("m_Weapon")).fields.get("m_CenterPos"), ((c).fields.get("m_Weapon")).fields.get("m_BottomLeftPos"), ((c).fields.get("m_Weapon")).fields.get("m_BottomPos"), (float(1) - R.num(R.call_static("Maths", "AbsNumber", [(c).fields.get("m_fAimingRatioX")]))), (c).fields.get("m_fAimingRatioY")])
	else:
		pass
		if R.truth((float((c).fields.get("m_fAimingRatioY")) < float(0))):
			pass
			R.call_member(c, "SetBlendedWeaponPos", [((c).fields.get("m_Weapon")).fields.get("m_TopPos"), ((c).fields.get("m_Weapon")).fields.get("m_TopRightPos"), ((c).fields.get("m_Weapon")).fields.get("m_CenterPos"), ((c).fields.get("m_Weapon")).fields.get("m_RightPos"), (c).fields.get("m_fAimingRatioX"), (float(1) - R.num(R.call_static("Maths", "AbsNumber", [(c).fields.get("m_fAimingRatioY")])))])
		else:
			pass
			R.call_member(c, "SetBlendedWeaponPos", [((c).fields.get("m_Weapon")).fields.get("m_CenterPos"), ((c).fields.get("m_Weapon")).fields.get("m_RightPos"), ((c).fields.get("m_Weapon")).fields.get("m_BottomPos"), ((c).fields.get("m_Weapon")).fields.get("m_BottomRightPos"), (c).fields.get("m_fAimingRatioX"), (c).fields.get("m_fAimingRatioY")])
	if R.truth((c).fields.get("m_bGunRaising")):
		pass
		(c).fields["m_fGunRaiseTimer"] = float(minf(float((float((c).fields.get("m_fGunRaiseTimer")) + float(v_fDeltaTime))), float((c).fields.get("m_fGunRaiseDuration"))))
		v_fDownRatio = float((float(1) - float(R.binary("/", (c).fields.get("m_fGunRaiseTimer"), (c).fields.get("m_fGunRaiseDuration")))))
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "x", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("X"), 330, v_fDownRatio]), "=")
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "y", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("Y"), 135, v_fDownRatio]), "=")
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "rotation", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("Z"), R.unary("-", 40), v_fDownRatio]), "=")
		if R.truth((float(v_fDownRatio) == float(0))):
			pass
			R.call_member(c, "OnFiringArmRaised", [])
	else:
		pass
		if R.truth((c).fields.get("m_bGunDown")):
			pass
			(c).fields["m_fGunDownTimer"] = float(minf(float((float((c).fields.get("m_fGunDownTimer")) + float(v_fDeltaTime))), float((c).fields.get("m_fGunDownDuration"))))
			v_fDownRatio = float(R.binary("/", (c).fields.get("m_fGunDownTimer"), (c).fields.get("m_fGunDownDuration")))
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "x", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("X"), 330, v_fDownRatio]), "=")
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "y", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("Y"), 135, v_fDownRatio]), "=")
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "rotation", R.call_static("Maths", "Lerp", [((c).fields.get("m_WeaponPos")).fields.get("Z"), R.unary("-", 40), v_fDownRatio]), "=")
		else:
			pass
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "x", ((c).fields.get("m_WeaponPos")).fields.get("X"), "=")
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "y", ((c).fields.get("m_WeaponPos")).fields.get("Y"), "=")
			R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "rotation", ((c).fields.get("m_WeaponPos")).fields.get("Z"), "=")
	return null

static func f_SetBlendedWeaponPos(c: Variant, a: Array) -> Variant:
	var v_fTopBlendX: Variant = NAN
	var v_fTopBlendY: Variant = NAN
	var v_fTopBlendZ: Variant = NAN
	var v_fBottomBlendX: Variant = NAN
	var v_fBottomBlendY: Variant = NAN
	var v_fBottomBlendZ: Variant = NAN
	var v_topLeft: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_topRight: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_bottomLeft: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_bottomRight: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_fX: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	v_fTopBlendX = R.coerce(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("X"), (v_topRight).fields.get("X"), v_fX]), "Number")
	v_fTopBlendY = R.coerce(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("Y"), (v_topRight).fields.get("Y"), v_fX]), "Number")
	v_fTopBlendZ = R.coerce(R.call_static("Maths", "Lerp", [(v_topLeft).fields.get("Z"), (v_topRight).fields.get("Z"), v_fX]), "Number")
	v_fBottomBlendX = R.coerce(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("X"), (v_bottomRight).fields.get("X"), v_fX]), "Number")
	v_fBottomBlendY = R.coerce(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("Y"), (v_bottomRight).fields.get("Y"), v_fX]), "Number")
	v_fBottomBlendZ = R.coerce(R.call_static("Maths", "Lerp", [(v_bottomLeft).fields.get("Z"), (v_bottomRight).fields.get("Z"), v_fX]), "Number")
	((c).fields.get("m_WeaponPos")).fields["X"] = R.coerce(R.call_static("Maths", "Lerp", [v_fTopBlendX, v_fBottomBlendX, v_fY]), "Number")
	((c).fields.get("m_WeaponPos")).fields["Y"] = R.coerce(R.call_static("Maths", "Lerp", [v_fTopBlendY, v_fBottomBlendY, v_fY]), "Number")
	((c).fields.get("m_WeaponPos")).fields["Z"] = R.coerce(R.call_static("Maths", "Lerp", [v_fTopBlendZ, v_fBottomBlendZ, v_fY]), "Number")
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_currentEntity: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_fDeltaY: Variant = NAN
	var v_fDeltaZ: Variant = NAN
	var v_fOldX: Variant = NAN
	var v_fOldY: Variant = NAN
	var v_iNbAttachedEntities: Variant = 0
	var v_i: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_currentEntity = R.coerce(null, "RDEntity")
	if R.truth((((float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_Explosion"))) or (float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_ZombieKill")))) or (float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_BodyKill"))))):
		pass
		return null
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		if R.truth(R.unary("!", R.call_member((c).fields.get("m_GameModeGameplay"), "HasIndependantPlayerControl", []))):
			pass
			(c).fields["m_fRelativeLocationX"] = float(0)
			(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
			(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), 1.5), "Number")
		return null
	v_fRoadLimit = R.coerce(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "GetSideLimit", []), "Number")
	if R.truth(R.binary(">", R.call_static("Maths", "AbsNumber", [(c).fields.get("m_fRelativeLocationX")]), v_fRoadLimit)):
		pass
		R.call_member(c, "HandleOutofStreetCollision", [])
	v_fNewX = R.coerce(R.call_static("Maths", "Clamp", [(float((c).fields.get("m_fRelativeLocationX")) + float((float((c.fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime)))), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
	v_fDeltaX = float((float(v_fNewX) - float((c).fields.get("m_fRelativeLocationX"))))
	v_fDeltaY = float((float((c.fields.get("m_vVelocity")).fields.get("Y")) * float(v_fDeltaTime)))
	v_fDeltaZ = float((float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime)))
	(c).fields["m_fRelativeLocationX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), v_fDeltaX), "Number")
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, v_fDeltaX, v_fDeltaY, v_fDeltaZ])
	v_fOldX = float((c.fields.get("m_vLocation")).fields.get("X"))
	v_fOldY = float((c.fields.get("m_vLocation")).fields.get("Y"))
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c).fields.get("m_fRelativeLocationX")), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fDeltaX = float((float((c.fields.get("m_vLocation")).fields.get("X")) - float(v_fOldX)))
	v_fDeltaY = float((float((c.fields.get("m_vLocation")).fields.get("Y")) - float(v_fOldY)))
	v_iNbAttachedEntities = R.coerce(R.coerce(R.get_value(c.fields.get("m_AttachedEntities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbAttachedEntities))):
		pass
		v_currentEntity = R.coerce(R.invoke(R.klass("RDEntity"), [R.get_value(c.fields.get("m_AttachedEntities"), v_i)]), "RDEntity")
		((v_currentEntity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((v_currentEntity).fields.get("m_vLocation")).fields.get("X"), v_fDeltaX), "Number")
		((v_currentEntity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((v_currentEntity).fields.get("m_vLocation")).fields.get("Y"), v_fDeltaY), "Number")
		v_i = R.signed32(v_i + 1)
	if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_fTotalDistance"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fTotalDistance"), v_fDeltaZ), "Number")
		if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_fDianeDistance"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fDianeDistance"), v_fDeltaZ), "Number")
		else:
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_fCochetaDistance"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fCochetaDistance"), v_fDeltaZ), "Number")
	return null

static func f_UpdateEffects(c: Variant, a: Array) -> Variant:
	var v_blood: Variant = null
	var v_fSpeedRatio: Variant = NAN
	var v_fRotation: Variant = NAN
	var v_camera: Variant = null
	var v_fCurveVariance: Variant = NAN
	var v_fCurveRot: Variant = NAN
	var v_i: Variant = 0
	var v_bIsOnGrass: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_blood = R.coerce(null, "MovieClip")
	if R.truth((((float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_Explosion"))) or (float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_BodyKill")))) or (c).fields.get("m_bChopperMode"))):
		pass
		return null
	v_fSpeedRatio = float(minf(float((float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1)))
	if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
		pass
		((c).fields.get("m_TireScrapingShake")).fields["m_fShakeIntensity"] = float((float(v_fSpeedRatio) * float((c).fields.get("m_fMaxBlownTireShake"))))
		R.call_member((c).fields.get("m_TireScrapingSound"), "SetMaxVolume", [(float(v_fSpeedRatio) * float((c).fields.get("m_fMaxBlownTireVolume")))])
	v_fRotation = float((float(R.binary("/", (c).fields.get("m_fDesiredSpeedX"), (c).fields.get("m_fXMaxSpeedHandBrake"))) * float(R.static_value("RDPlayer", "MaxSteeringWheelRotation"))))
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	v_fCurveVariance = float((float((v_camera).fields.get("m_fCurveRotation")) - float((c).fields.get("m_fLastCurveRotation"))))
	(c).fields["m_fLastCurveRotation"] = float((v_camera).fields.get("m_fCurveRotation"))
	v_fCurveRot = float((float(R.binary("/", v_fCurveVariance, v_fDeltaTime)) * float(R.static_value("RDPlayer", "MaxSteeringWheelRotationRatioForCurve"))))
	v_fRotation = R.coerce(R.binary("+", v_fRotation, v_fCurveRot), "Number")
	(c).fields["m_fVerticalCurve"] = float((R.num(R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(10))])) - R.num(R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]))))
	R.set_value((c).fields.get("m_MCCarInterior"), "y", (R.num(R.unary("-", 60)) - float((float((c).fields.get("m_fVerticalCurve")) * float(20)))), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "rotation", (v_fRotation if R.truth((float((c).fields.get("m_iLeftHandState")) == float(R.static_value("RDPlayer", "HandState_OnWheel")))) else 0), "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheel"), "rotation", v_fRotation, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "SteeringWheelCar"), "rotation", v_fRotation, "=")
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "rotation", (v_fRotation if R.truth((float((c).fields.get("m_iLeftHandState")) == float(R.static_value("RDPlayer", "HandState_OnWheel")))) else 0), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible")):
		pass
		R.call_member(c, "SkewMC", [R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(R.static_value("RDPlayer", "SmokeSpeedToSkewFactor"))), 0])
	if R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible")):
		pass
		R.call_member(c, "SkewMC", [R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), (float((c.fields.get("m_vVelocity")).fields.get("X")) * float(R.static_value("RDPlayer", "FireSpeedToSkewFactor"))), 0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AllDashboardBloods"), "length"))):
		pass
		v_blood = R.coerce(R.get_value((c).fields.get("m_AllDashboardBloods"), v_i), "MovieClip")
		R.set_value(v_blood, "m_fAlpha", (float(0.1) * float(v_fDeltaTime)), "-=")
		R.set_value(v_blood, "alpha", minf(R.num(R.get_value(v_blood, "m_fAlpha")), float(1)), "=")
		v_i = R.signed32(v_i + 1)
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		(c).fields["m_fFemaleArmBloodLevel"] = float(maxf(float((float((c).fields.get("m_fFemaleArmBloodLevel")) - float((float(R.static_value("RDPlayer", "ArmBloodFadeRate")) * float(v_fDeltaTime))))), float(0)))
	else:
		pass
		(c).fields["m_fMaleArmBloodLevel"] = float(maxf(float((float((c).fields.get("m_fMaleArmBloodLevel")) - float((float(R.static_value("RDPlayer", "ArmBloodFadeRate")) * float(v_fDeltaTime))))), float(0)))
	v_bIsOnGrass = R.coerce(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "IsOnRoughSurface", [(c).fields.get("m_fRelativeLocationX"), (c.fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
	if R.truth(R.binary("!=", v_bIsOnGrass, (c).fields.get("m_bWasOnGrass"))):
		pass
		if R.truth(v_bIsOnGrass):
			pass
			(c).fields["m_GrassShake"] = R.coerce(R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["GrassShake", 0.002, 0, R.unary("-", 1), 0]), "RDCameraShake")
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_GrassSound"), true])
		else:
			pass
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "StopShake", ["GrassShake", 0.1])
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_GrassSound")])
	(c).fields["m_bWasOnGrass"] = v_bIsOnGrass
	if R.truth(R.logical_and(R.unary("!", (c).fields.get("m_bFailed")), func(): return R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "IsOnLava", [(c).fields.get("m_fRelativeLocationX"), (c.fields.get("m_vLocation")).fields.get("Z")]))):
		pass
		if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "IsLavaInstantDeathEnabled", [])):
			pass
			R.call_member(c, "Explode", [])
		else:
			pass
			(c).fields["m_fLavaTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fLavaTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fLavaTimer")) > float(R.static_value("RDPlayer", "LavaDelay")))):
				pass
				if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires")) < float(4))):
					pass
					R.call_member(c, "DealTireDamage", [2])
					R.call_member(c, "StartTireBias", [])
				else:
					pass
					R.call_member(c, "DealBumperDamage", [null, 30, false, 0])
				(c).fields["m_fLavaTimer"] = float(0)
		if R.truth(R.unary("!", R.call_member((c).fields.get("m_LavaSound"), "IsPlaying", []))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_LavaSound"), true])
	else:
		pass
		if R.truth(R.call_member((c).fields.get("m_LavaSound"), "IsPlaying", [])):
			pass
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_LavaSound")])
	if R.truth((c).fields.get("m_GrassShake")):
		pass
		((c).fields.get("m_GrassShake")).fields["m_fShakeIntensity"] = float((float(v_fSpeedRatio) * float(0.002)))
	R.call_member((c).fields.get("m_GrassSound"), "SetMaxVolume", [v_fSpeedRatio])
	return null

static func f_UpdateHealth(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		return null
	(c).fields["m_fCummulativeBodyDamage"] = float(maxf(float((float((c).fields.get("m_fCummulativeBodyDamage")) - float((float(R.static_value("RDPlayer", "CummulativeBodyDamageDrain")) * float(v_fDeltaTime))))), float(0)))
	if R.truth((float((c).fields.get("m_fLowHealthTimer")) > float(0))):
		pass
		(c).fields["m_fLowHealthTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fLowHealthTimer"), v_fDeltaTime), "Number")
		if R.truth(((float((c).fields.get("m_fLowHealthTimer")) <= float(0)) or R.binary(">", R.call_member((c).fields.get("m_EarRingingSound"), "GetPosition", []), 5.5))):
			pass
			(c).fields["m_fLowHealthTimer"] = float(0)
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), "StartFade", [1, 0.3])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), "StartFade", [1, 0.3])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_MusicSoundGroup"), "StartFade", [1, 0.3])
	if R.truth(((R.truth((c).fields.get("m_DriverHasLowHealthVoice")) and R.truth(R.unary("!", R.call_member((c).fields.get("m_DriverHasLowHealthVoice"), "IsPlaying", [])))) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused")))):
		pass
		(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_SkewMC(c: Variant, a: Array) -> Variant:
	var v_mtx: Variant = null
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v_mtx = R.coerce(R.get_value(R.get_value(v_target, "transform"), "matrix"), "Matrix")
	R.set_value(v_mtx, "b", v_fY, "=")
	R.set_value(v_mtx, "c", v_fX, "=")
	R.set_value(R.get_value(v_target, "transform"), "matrix", v_mtx, "=")
	return null

static func f_UpdatePlayerState(c: Variant, a: Array) -> Variant:
	var v_iArea: Variant = 0
	var v_bIsMale: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iArea = R.coerce(0, "int")
	v_bIsMale = false
	R.call_member((c).fields.get("m_Weapon"), "Update", [v_fDeltaTime])
	R.call_member((c).fields.get("m_WeaponMountedMG"), "UpdateOverheat", [v_fDeltaTime])
	if R.truth((c).fields.get("m_bSwitchingDriver")):
		pass
		(c).fields["m_fSwitchDriverTime"] = R.coerce(R.binary("+", (c).fields.get("m_fSwitchDriverTime"), v_fDeltaTime), "Number")
		if R.truth(R.binary(">", (c).fields.get("m_fSwitchDriverTime"), R.get_value(R.static_value("RDPlayer", "SwitchDriverDuration"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDriverSwitchLevel")))):
			pass
			R.call_member(c, "EndSwitchDriver", [])
	if R.truth((c).fields.get("m_bSwitchingWeapon")):
		pass
		(c).fields["m_fSwitchWeaponTime"] = R.coerce(R.binary("+", (c).fields.get("m_fSwitchWeaponTime"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fSwitchWeaponTime")) > float((c).fields.get("m_fSwitchWeaponDuration")))):
			pass
			R.call_member(c, "EndSwitchWeapon", [])
	if R.truth(R.unary("!", (c).fields.get("m_bChopperMode"))):
		pass
		if R.truth(R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(((float((c.fields.get("m_vVelocity")).fields.get("Z")) == float(0)) and (float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None")))), func(): return R.call_member((c).fields.get("m_GameModeGameplay"), "CanPlayNotMovingDialog", [])), func(): return R.unary("!", (c).fields.get("m_bForceBrake"))), func(): return R.unary("!", (c).fields.get("m_ClingerLeft"))), func(): return R.unary("!", (c).fields.get("m_ClingerRight"))), func(): return R.unary("!", (c).fields.get("m_ClingerSideLeft"))), func(): return R.unary("!", (c).fields.get("m_ClingerSideRight")))):
			pass
			if R.truth((float((c).fields.get("m_fNotMovingTimer")) < float(R.static_value("RDPlayer", "NotMovingVoiceDelay")))):
				pass
				(c).fields["m_fNotMovingTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fNotMovingTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fNotMovingTimer")) >= float(R.static_value("RDPlayer", "NotMovingVoiceDelay")))):
					pass
					if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleNotMovingVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleNotMovingVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			(c).fields["m_fNotMovingTimer"] = float(0)
		if R.truth(((c).fields.get("m_bPlayCivGetInVoice") and R.unary("!", R.call_member(c, "HasVoicePlaying", [])))):
			pass
			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_ThanksGiving")))):
				pass
				R.call_member(c, "PlayVoiceSound", [R.static_value("RDPlayer", "m_TurkeyGetInVocie"), R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				v_bIsMale = R.coerce(R.call_member(c, "IsLastCivMale", []), "Boolean")
				if R.truth(v_bIsMale):
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleCivGetInVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleCivGetInVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			R.assign(c, "m_iCivGetInVoiceTime", "RDPlayer", R.invoke(R.resolve(c, "getTimer", "RDPlayer"), []), "=")
			(c).fields["m_bPlayCivGetInVoice"] = false
		if R.truth(((c).fields.get("m_bPlayFullCivVoice") and R.unary("!", R.call_member(c, "HasVoicePlaying", [])))):
			pass
			if R.truth((float(randf()) > float(0.5))):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleCivFullVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleCivFullVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			(c).fields["m_bPlayFullCivVoice"] = false
		if R.truth(R.binary(">", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("X")]), 0)):
			pass
			R.call_member(c, "AddDrivingPoints", [(float(ceilf(R.num(R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("X")])))) * float(R.static_value("RDPlayer", "DrivingPointsPerTurning")))])
		v_iArea = R.coerce(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "GetNearbySlice", []), "int")
		if R.truth((float(v_iArea) != float((c).fields.get("m_iLastArea")))):
			pass
			if R.truth(((float(v_iArea) == float(R.static_value("RDRoad", "SliceType_Alleyway"))) and R.unary("!", R.static_value("RDHighwayRamp", "m_bRampPresent")))):
				pass
				R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverAlleywayVoices"), R.static_value("RDPlayer", "m_MaleGunnerAlleywayVoices"), R.static_value("RDPlayer", "m_FemaleDriverAlleywayVoices"), R.static_value("RDPlayer", "m_FemaleGunnerAlleywayVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			(c).fields["m_iLastArea"] = R.coerce(v_iArea, "int")
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_ClingerLeft"), func(): return R.unary("!", R.get_value(((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMC"), "parent")))) and R.truth(R.unary("!", R.get_value(((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMCInside"), "parent")))) and R.unary("!", R.get_value(((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMCUnder"), "parent")))):
		pass
		R.call_member((c).fields.get("m_ClingerLeft"), "ForceRemove", [])
		(c).fields["m_ClingerLeft"] = R.coerce(null, "RDHumanoid")
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_ClingerRight"), func(): return R.unary("!", R.get_value(((c).fields.get("m_ClingerRight")).fields.get("m_ClingMC"), "parent")))) and R.truth(R.unary("!", R.get_value(((c).fields.get("m_ClingerRight")).fields.get("m_ClingMCInside"), "parent")))) and R.unary("!", R.get_value(((c).fields.get("m_ClingerRight")).fields.get("m_ClingMCUnder"), "parent")))):
		pass
		R.call_member((c).fields.get("m_ClingerRight"), "ForceRemove", [])
		(c).fields["m_ClingerRight"] = R.coerce(null, "RDHumanoid")
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_ClingerSideLeft"), func(): return R.unary("!", R.get_value(((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMC"), "parent")))) and R.truth(R.unary("!", R.get_value(((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMCInside"), "parent")))) and R.unary("!", R.get_value(((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMCUnder"), "parent")))):
		pass
		R.call_member((c).fields.get("m_ClingerSideLeft"), "ForceRemove", [])
		(c).fields["m_ClingerSideLeft"] = R.coerce(null, "RDHumanoid")
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_ClingerSideRight"), func(): return R.unary("!", R.get_value(((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMC"), "parent")))) and R.truth(R.unary("!", R.get_value(((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMCInside"), "parent")))) and R.unary("!", R.get_value(((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMCUnder"), "parent")))):
		pass
		R.call_member((c).fields.get("m_ClingerSideRight"), "ForceRemove", [])
		(c).fields["m_ClingerSideRight"] = R.coerce(null, "RDHumanoid")
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalMaleLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalFemaleLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalMaleNewLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalFemaleNewLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieHardLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieGrubLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieSoldierLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieVeryHardLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerSoldierLeft"), R.binary("!=", (c).fields.get("m_ClingerLeft"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalMaleRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalFemaleRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalMaleNewRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieNormalFemaleNewRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieHardRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieGrubRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieSoldierRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerZombieVeryHardRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	R.call_member(c, "SafeHideClingerMC", [(c).fields.get("m_ClingerSoldierRight"), R.binary("!=", (c).fields.get("m_ClingerRight"), null)])
	return null

static func f_SafeHideClingerMC(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bValid: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth((R.truth(R.get_value(v_mc, "parent")) and R.unary("!", v_bValid))):
		pass
		R.invoke(R.get_value(R.get_value(v_mc, "parent"), "removeChild"), [v_mc])
		R.set_value(v_mc, "visible", false, "=")
	return null

static func f_AddDrivingPoints(c: Variant, a: Array) -> Variant:
	var v_iDianeLevelPoints: Variant = 0
	var v_iCochetaLevelPoints: Variant = 0
	var v_info: Variant = null
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iDianeLevelPoints = R.coerce(0, "int")
	v_iCochetaLevelPoints = R.coerce(0, "int")
	if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor") or (R.static_value("RDGame", "Instance")).fields.get("m_bPaused"))):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (v_info).fields.get("m_iLevelUpLevel"))), "Number")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		if R.truth((float((v_info).fields.get("m_iDianeDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
			pass
			(v_info).fields["m_iDianeDrivingPoints"] = R.coerce(R.binary("+", (v_info).fields.get("m_iDianeDrivingPoints"), v_iPoint), "Number")
			v_iDianeLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "DrivingLevelPoints"), (v_info).fields.get("m_iDianeDrivingLevel")), "int"), "int")
			while R.truth(((float((v_info).fields.get("m_iDianeDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iDianeDrivingPoints")) >= float(v_iDianeLevelPoints)))):
				pass
				R.set_value(v_info, "m_iDianeDrivingLevel", 1, "+=")
				R.call_member(c, "OnDrivingLevelUp", [])
				(v_info).fields["m_iDianeDrivingPoints"] = R.coerce(R.binary("-", (v_info).fields.get("m_iDianeDrivingPoints"), v_iDianeLevelPoints), "Number")
				if R.truth((float((v_info).fields.get("m_iDianeDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
					pass
					v_iDianeLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "DrivingLevelPoints"), (v_info).fields.get("m_iDianeDrivingLevel")), "int"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_iCochetaDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
			pass
			(v_info).fields["m_iCochetaDrivingPoints"] = R.coerce(R.binary("+", (v_info).fields.get("m_iCochetaDrivingPoints"), v_iPoint), "Number")
			v_iCochetaLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "DrivingLevelPoints"), (v_info).fields.get("m_iCochetaDrivingLevel")), "int"), "int")
			while R.truth(((float((v_info).fields.get("m_iCochetaDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iCochetaDrivingPoints")) >= float(v_iCochetaLevelPoints)))):
				pass
				R.set_value(v_info, "m_iCochetaDrivingLevel", 1, "+=")
				R.call_member(c, "OnDrivingLevelUp", [])
				(v_info).fields["m_iCochetaDrivingPoints"] = R.coerce(R.binary("-", (v_info).fields.get("m_iCochetaDrivingPoints"), v_iCochetaLevelPoints), "Number")
				if R.truth((float((v_info).fields.get("m_iCochetaDrivingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
					pass
					v_iCochetaLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "DrivingLevelPoints"), (v_info).fields.get("m_iCochetaDrivingLevel")), "int"), "int")
	return null

static func f_AddToughnessPoints(c: Variant, a: Array) -> Variant:
	var v_iDianeLevelPoints: Variant = 0
	var v_iCochetaLevelPoints: Variant = 0
	var v_info: Variant = null
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_bFemale: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_iDianeLevelPoints = R.coerce(0, "int")
	v_iCochetaLevelPoints = R.coerce(0, "int")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (v_info).fields.get("m_iLevelUpLevel"))), "Number")
	if R.truth(v_bFemale):
		pass
		if R.truth((float((v_info).fields.get("m_iDianeToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
			pass
			(v_info).fields["m_iDianeToughnessPoints"] = R.coerce(R.binary("+", (v_info).fields.get("m_iDianeToughnessPoints"), v_iPoint), "Number")
			v_iDianeLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "ToughnessLevelPoints"), (v_info).fields.get("m_iDianeToughnessLevel")), "int"), "int")
			while R.truth(((float((v_info).fields.get("m_iDianeToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iDianeToughnessPoints")) >= float(v_iDianeLevelPoints)))):
				pass
				R.set_value(v_info, "m_iDianeToughnessLevel", 1, "+=")
				R.call_member(c, "OnToughnessLevelUp", [])
				(v_info).fields["m_iDianeToughnessPoints"] = R.coerce(R.binary("-", (v_info).fields.get("m_iDianeToughnessPoints"), v_iDianeLevelPoints), "Number")
				if R.truth((float((v_info).fields.get("m_iDianeToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
					pass
					v_iDianeLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "ToughnessLevelPoints"), (v_info).fields.get("m_iDianeToughnessLevel")), "int"), "int")
	else:
		pass
		if R.truth((float((v_info).fields.get("m_iCochetaToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
			pass
			(v_info).fields["m_iCochetaToughnessPoints"] = R.coerce(R.binary("+", (v_info).fields.get("m_iCochetaToughnessPoints"), v_iPoint), "Number")
			v_iCochetaLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "ToughnessLevelPoints"), (v_info).fields.get("m_iCochetaToughnessLevel")), "int"), "int")
			while R.truth(((float((v_info).fields.get("m_iCochetaToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iCochetaToughnessPoints")) >= float(v_iCochetaLevelPoints)))):
				pass
				R.set_value(v_info, "m_iCochetaToughnessLevel", 1, "+=")
				R.call_member(c, "OnToughnessLevelUp", [])
				(v_info).fields["m_iCochetaToughnessPoints"] = R.coerce(R.binary("-", (v_info).fields.get("m_iCochetaToughnessPoints"), v_iCochetaLevelPoints), "Number")
				if R.truth((float((v_info).fields.get("m_iCochetaToughnessLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
					pass
					v_iCochetaLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDPlayer", "ToughnessLevelPoints"), (v_info).fields.get("m_iCochetaToughnessLevel")), "int"), "int")
	return null

static func f_IsClingerSpotTaken(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	return ((c).fields.get("m_ClingerLeft") if R.truth(v_bLeft) else (c).fields.get("m_ClingerRight"))
	return null

static func f_IsSideClingerSpotTaken(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	return ((c).fields.get("m_ClingerSideLeft") if R.truth(v_bLeft) else (c).fields.get("m_ClingerSideRight"))
	return null

static func f_CanStartTask(c: Variant, a: Array) -> Variant:
	return ((((((float((c.fields.get("m_vVelocity")).fields.get("Z")) == float(0)) and R.unary("!", R.call_member(c, "IsClingerSpotTaken", [true]))) and R.unary("!", R.call_member(c, "IsClingerSpotTaken", [false]))) and R.unary("!", R.call_member(c, "IsSideClingerSpotTaken", [true]))) and R.unary("!", R.call_member(c, "IsSideClingerSpotTaken", [false]))) and (float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None"))))
	return null

static func f_CanStartLocationInteraction(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.logical_and(R.logical_and(R.logical_and((R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", (c).fields.get("m_bSwitchingDriver"))), func(): return (c).fields.get("m_ClosestLocation")), func(): return (float((c).fields.get("m_fClosestLocationDistance")) < float(R.static_value("RDPlayer", "PickupPointDistance")))), func(): return R.call_member(c, "CanStartTask", [])), func(): return R.call_member((c).fields.get("m_ClosestLocation"), "CanHaveInteraction", []))
	return null

static func f_StartLocationInteraction(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(R.call_member((c).fields.get("m_ClosestLocation"), "GetLocationType", []), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_Church")))):
		pass
		if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0))):
			pass
			R.call_member(c, "StartTask", [R.static_value("RDPlayer", "Task_SecureCivilian"), true, 0])
		else:
			pass
			R.call_member((c).fields.get("m_GameModeGameplay"), "ShowUpgradeScreen", [R.static_value("RDUpgradeScreen", "UpgradeType_Church")])
	else:
		pass
		if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_PoliceStation")))):
			pass
			if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0))):
				pass
				R.call_member(c, "StartTask", [R.static_value("RDPlayer", "Task_SecureCivilian"), true, 0])
			else:
				pass
				R.call_member((c).fields.get("m_GameModeGameplay"), "ShowUpgradeScreen", [R.static_value("RDUpgradeScreen", "UpgradeType_PoliceStation")])
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_Garage")))):
				pass
				R.call_member((c).fields.get("m_GameModeGameplay"), "ShowUpgradeScreen", [R.static_value("RDUpgradeScreen", "UpgradeType_Garage")])
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_WeaponCrate")))):
					pass
					R.call_member((c).fields.get("m_GameModeGameplay"), "ShowUpgradeScreen", [R.static_value("RDUpgradeScreen", "UpgradeType_WeaponCrate")])
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_AmmoPoint")))):
						pass
						R.call_member(c, "StartTask", [R.static_value("RDPlayer", "Task_AmmoPoint"), true, 0])
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_bStoppedAtLocation"] = true
	return null

static func f_GetStartLocationInteractionName(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(R.call_member((c).fields.get("m_ClosestLocation"), "GetLocationType", []), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_Church")))):
		pass
		if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0))):
			pass
			return R.binary("+", "Secure civilian", ("s" if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(1))) else ""))
		return "Check church"
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_PoliceStation")))):
		pass
		if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0))):
			pass
			return R.binary("+", "Secure civilian", ("s" if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(1))) else ""))
		return "Check police station"
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_Garage")))):
		pass
		return "Check garage"
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_WeaponCrate")))):
		pass
		return "Check weapon crate"
	if R.truth((float(v_iType) == float(R.static_value("RDEntity", "Location_AmmoPoint")))):
		pass
		return "Gather ammo"
	return ""
	return null

static func f_DoWeaponUpgradeTask(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_weapon: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDWeapon")
	var v_iCost: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	(c).fields["m_UpgradedWeapon"] = R.coerce(v_weapon, "RDWeapon")
	R.call_member(c, "DoTask", [v_iTask, v_iCost])
	return null

static func f_DoTask(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iCost: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	(c).fields["m_iCurrentTask"] = R.coerce(v_iTask, "int")
	(c).fields["m_iTaskCost"] = R.coerce(v_iCost, "int")
	if R.truth((float((c).fields.get("m_iTaskCost")) != float(0))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		R.call_member(v_gameplayMode, "AddRP", [R.unary("-", (c).fields.get("m_iTaskCost")), true, false])
	R.call_member(c, "CompleteDoTask", [v_iTask])
	return null

static func f_StartWeaponUpgradeTask(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_weapon: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDWeapon")
	var v_iCost: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	(c).fields["m_UpgradedWeapon"] = R.coerce(v_weapon, "RDWeapon")
	R.call_member(c, "StartTask", [v_iTask, true, v_iCost])
	return null

static func f_StartTask(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_bIsMale: Variant = false
	var v_soundClass: Variant = null
	var v_voiceClass: Variant = null
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bCanBeInterrupted: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iCost: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_bIsMale = false
	R.call_member(c, "StopHorning", [])
	(c).fields["m_iCurrentTask"] = R.coerce(v_iTask, "int")
	(c).fields["m_fTaskDuration"] = R.coerce(R.call_member(c, "GetTaskDuration", [(c).fields.get("m_iCurrentTask")]), "Number")
	(c).fields["m_fTaskTime"] = float(0)
	(c).fields["m_iTaskCost"] = R.coerce(v_iCost, "int")
	if R.truth((float((c).fields.get("m_iTaskCost")) != float(0))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		R.call_member(v_gameplayMode, "AddRP", [R.unary("-", (c).fields.get("m_iTaskCost")), true])
	(c).fields["m_TaskLocation"] = R.coerce((c).fields.get("m_ClosestLocation"), "RDEntity")
	if R.truth((c).fields.get("m_TaskLocation")):
		pass
		R.call_member((c).fields.get("m_TaskLocation"), "addEventListener", [R.static_value("RDEntity", "Event_Exploded"), R.get_value(c, "OnTaskLocationExploded"), false, 0, true])
	if R.truth((float((c).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_SecureCivilian")))):
		pass
		(c).fields["m_bDoTaskVoice"] = true
		(c).fields["m_bDoProtectTaskVoice"] = true
	else:
		pass
		(c).fields["m_bDoTaskVoice"] = false
		(c).fields["m_bDoProtectTaskVoice"] = false
		v_bIsMale = R.coerce(R.call_member(c, "IsLastCivMale", []), "Boolean")
		if R.truth(v_bIsMale):
			pass
			R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleCivSafeVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleCivSafeVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	(c).fields["m_bTaskCanBeInterrupted"] = v_bCanBeInterrupted
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_TaskStarted")])
	if R.truth((float((c).fields.get("m_iLeftHandState")) != float(R.static_value("RDPlayer", "HandState_Down")))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorOpenSound")])
		(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
	(c).fields["m_fTaskSoundTimer"] = float(0.5)
	v_soundClass = R.coerce(R.call_member(c, "GetTaskSound", [v_iTask]), "Class")
	if R.truth(v_soundClass):
		pass
		(c).fields["m_TaskSound"] = R.coerce(R.construct(R.klass("DTSound"), [v_soundClass, (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	else:
		pass
		(c).fields["m_TaskSound"] = R.coerce(null, "DTSound")
	v_voiceClass = R.coerce(R.call_member(c, "GetTaskVoice", [v_iTask]), "Class")
	if R.truth(v_voiceClass):
		pass
		(c).fields["m_TaskVoice"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [v_voiceClass, (R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
		R.call_member(c, "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Diane") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Cocheta")), (c).fields.get("m_TaskVoice"), R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		(c).fields["m_TaskVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bStartedPerfectDefense"] = (float(v_iTask) != float(R.static_value("RDPlayer", "Task_RepairRadio")))
	return null

static func f_GetTaskSound(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairRadio")))):
		pass
		return R.klass("SND_TaskRepairRadio")
	if R.truth((((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"))))):
		pass
		return R.klass("SND_TaskUpgradeGun")
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ReplenishAmmo"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPoint"))))):
		pass
		return R.klass("SND_TaskAmmo")
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher"))))):
		pass
		return R.klass("SND_TaskMount")
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairTire"))))):
		pass
		return R.klass("SND_TaskTires")
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairEngine"))))):
		pass
		return R.klass("SND_TaskEngine")
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairBumper"))))):
		pass
		return R.klass("SND_TaskBumper")
	return null
	return null

static func f_GetTaskVoice(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairRadio")))):
		pass
		return (R.klass("SND_DianeTaskRepairRadio") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskRepairRadio"))
	if R.truth((((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity"))))):
		pass
		return (R.klass("SND_DianeTaskUpgradeWeapon") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskUpgradeWeapon"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ReplenishAmmo")))):
		pass
		return (R.klass("SND_DianeTaskReplenishWeapon") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskReplenishWeapon"))
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher"))))):
		pass
		return (R.klass("SND_DianeTaskMountedWeapon") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskMountedWeapon"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire")))):
		pass
		return (R.klass("SND_DianeTaskUpgradeTire") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskUpgradeTire"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine")))):
		pass
		return (R.klass("SND_DianeTaskUpgradeEngine") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskUpgradeEngine"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper")))):
		pass
		return (R.klass("SND_DianeTaskUpgradeBumper") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskUpgradeBumper"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UnlockWeapon")))):
		pass
		return (R.klass("SND_DianeTaskUnlockWeapon") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskUnlockWeapon"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPoint")))):
		pass
		return (R.klass("SND_DianeTaskAmmoPoint") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskAmmoPoint"))
	if R.truth(((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedShield"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedHeal"))))):
		pass
		return (R.klass("SND_DianeTaskMeds") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskMeds"))
	if R.truth(((((((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ChopperSupport"))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPickup")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_LowerCost")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_DriverSwitch")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_TaskSpeed")))) or (float(v_iTask) == float(R.static_value("RDPlayer", "Task_LevelUp"))))):
		pass
		return (R.klass("SND_DianeTaskPerk") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskPerk"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairTire")))):
		pass
		return (R.klass("SND_DianeTaskRepairTire") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskRepairTire"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairEngine")))):
		pass
		return (R.klass("SND_DianeTaskRepairEngine") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskRepairEngine"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairBumper")))):
		pass
		return (R.klass("SND_DianeTaskRepairBumper") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.klass("SND_CochetaTaskRepairBumper"))
	return null
	return null

static func f_GetTaskDuration(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairRadio")))):
		pass
		return 10
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_SecureCivilian")))):
		pass
		return 2.5
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ReplenishAmmo")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG")))):
		pass
		return 25
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher")))):
		pass
		return 25
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire")))):
		pass
		return 20
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine")))):
		pass
		return 20
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper")))):
		pass
		return 20
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairTire")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairEngine")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairBumper")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UnlockWeapon")))):
		pass
		return 25
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPoint")))):
		pass
		return 10
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedShield")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedHeal")))):
		pass
		return 15
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ChopperSupport")))):
		pass
		return 30
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPickup")))):
		pass
		return 20
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LowerCost")))):
		pass
		return 25
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_DriverSwitch")))):
		pass
		return 20
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_TaskSpeed")))):
		pass
		return 25
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LevelUp")))):
		pass
		return 25
	return 0
	return null

static func f_CancelTask(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_bDoVoice: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	if R.truth((float((c).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_None")))):
		pass
		(c).fields["m_iCurrentTask"] = R.coerce(R.static_value("RDPlayer", "Task_None"), "int")
		(c).fields["m_fTaskTime"] = float(0)
		(c).fields["m_fTaskDuration"] = float(0)
		if R.truth((c).fields.get("m_TaskLocation")):
			pass
			R.call_member((c).fields.get("m_TaskLocation"), "removeEventListener", [R.static_value("RDEntity", "Event_Exploded"), R.get_value(c, "OnTaskLocationExploded")])
			(c).fields["m_TaskLocation"] = R.coerce(null, "RDEntity")
		if R.truth((float((c).fields.get("m_iTaskCost")) != float(0))):
			pass
			v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
			R.call_member(v_gameplayMode, "AddRP", [(c).fields.get("m_iTaskCost"), true])
		if R.truth(v_bDoVoice):
			pass
			R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverTaskCancelVoices"), R.static_value("RDPlayer", "m_MaleGunnerTaskCancelVoices"), R.static_value("RDPlayer", "m_FemaleDriverTaskCancelVoices"), R.static_value("RDPlayer", "m_FemaleGunnerTaskCancelVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorCloseSound")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
		if R.truth((c).fields.get("m_TaskSound")):
			pass
			R.call_member((c).fields.get("m_TaskSound"), "Stop", [])
	return null

static func f_CompleteTask(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_weapon: Variant = null
	var v_bFemaleWeapon: Variant = false
	var v_iWeapon: Variant = 0
	var v_bDone: Variant = false
	var v_info: Variant = null
	var v_gameplayMode: Variant = null
	var v_storyMode: Variant = null
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_i = R.coerce(0, "int")
	v_weapon = R.coerce(null, "RDWeapon")
	v_bFemaleWeapon = false
	v_iWeapon = R.coerce(0, "int")
	v_bDone = true
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
	if R.truth((c).fields.get("m_TaskLocation")):
		pass
		R.call_member((c).fields.get("m_TaskLocation"), "removeEventListener", [R.static_value("RDEntity", "Event_Exploded"), R.get_value(c, "OnTaskLocationExploded")])
		(c).fields["m_TaskLocation"] = R.coerce(null, "RDEntity")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairRadio")))):
		pass
		R.call_member(v_storyMode, "OnRadioRepaired", [])
		R.call_member(((v_storyMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Radio", "Repaired", 0, 0])
	else:
		pass
		if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_SecureCivilian")))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCivsInCar", 1, "-=")
			R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_CivCountUpdated")])
			R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_CivilianDropped")])
			R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Civilian", "Secured", 0, 0])
			if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0))):
				pass
				v_bDone = false
				R.call_member(c, "StartTask", [R.static_value("RDPlayer", "Task_SecureCivilian"), true, 0])
		else:
			pass
			if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage")))):
				pass
				R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iDamageLevel", 1, "+=")
				R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName"), "Damage", (((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data")).fields.get("m_iDamageLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
				R.call_member(c, "HandleLockedAndLoadedAchievement", [])
				R.call_member(c, "HandlePerfectSoldiersAchievement", [])
			else:
				pass
				if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))):
					pass
					R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iAccuracyLevel", 1, "+=")
					R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName"), "Accuracy", (((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data")).fields.get("m_iAccuracyLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
					R.call_member(c, "HandleLockedAndLoadedAchievement", [])
					R.call_member(c, "HandlePerfectSoldiersAchievement", [])
				else:
					pass
					if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity")))):
						pass
						R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iCapacityLevel", 1, "+=")
						R.call_member((c).fields.get("m_UpgradedWeapon"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_UpgradedWeapon")), 1])
						R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "UpdateWeaponDisplay", [])
						R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "UpdateAmmoDisplay", [])
						R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName"), "Capacity", (((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data")).fields.get("m_iCapacityLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
						R.call_member(c, "HandleLockedAndLoadedAchievement", [])
						R.call_member(c, "HandlePerfectSoldiersAchievement", [])
					else:
						pass
						if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UnlockWeapon")))):
							pass
							(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data")).fields["m_bUnlocked"] = true
							R.call_member(c, "InitWeaponsArray", [])
							R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", [((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName"), "Acquired", 0, 0])
							v_bFemaleWeapon = R.coerce(R.call_member(c, "IsFemaleWeapon", [(c).fields.get("m_UpgradedWeapon")]), "Boolean")
							if R.truth((((c).fields.get("m_UpgradedWeapon")).fields.get("m_bMountedWeapon") or R.binary("!=", v_bFemaleWeapon, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")))):
								pass
								v_iWeapon = R.coerce(R.call_member(c, "GetWeaponIndex", [(c).fields.get("m_UpgradedWeapon")]), "int")
								if R.truth(R.binary("==", v_iWeapon, ((c).fields.get("m_iWeaponCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_iWeaponDiane")))):
									pass
									R.call_member(c, "EquipWeapon", [v_iWeapon])
							R.call_member(c, "HandleArmedToTheTeethAchievement", [])
						else:
							pass
							if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ReplenishAmmo")))):
								pass
								R.call_member((c).fields.get("m_WeaponPistolCocheta"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponPistolCocheta")), 1])
								R.call_member((c).fields.get("m_WeaponPistolDiane"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponPistolDiane")), 1])
								R.call_member((c).fields.get("m_WeaponMAC11"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMAC11")), 1])
								R.call_member((c).fields.get("m_WeaponSPAS12"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponSPAS12")), 1])
								R.call_member((c).fields.get("m_WeaponMP5"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMP5")), 1])
								R.call_member((c).fields.get("m_WeaponShotgun"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponShotgun")), 1])
								R.call_member((c).fields.get("m_WeaponM16"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponM16")), 1])
								R.call_member((c).fields.get("m_WeaponM60"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponM60")), 1])
								R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Ammo", "Replenished", 0, 0])
							else:
								pass
								if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPoint")))):
									pass
									R.call_member(c, "DoAmmoPointTask", [(c).fields.get("m_ClosestLocation"), false])
								else:
									pass
									if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedShield")))):
										pass
										if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
											pass
											R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedShields", 1, "+=")
										else:
											pass
											R.set_value(v_info, "m_iMedShields", 1, "+=")
										R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Steroids", "Acquired", 0, 0])
									else:
										pass
										if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedHeal")))):
											pass
											if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
												pass
												R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedHeals", 1, "+=")
											else:
												pass
												R.set_value(v_info, "m_iMedHeals", 1, "+=")
											R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Med Patch", "Acquired", 0, 0])
										else:
											pass
											if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ChopperSupport")))):
												pass
												R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_SupportChoppers")])
												R.set_value(v_info, "m_iChopperSupportLevel", 1, "+=")
												R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Chopper Assist", ("Acquired" if R.truth((float((v_info).fields.get("m_iChopperSupportLevel")) == float(1))) else "Improved"), (v_info).fields.get("m_iChopperSupportLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
												R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
												R.call_member(c, "HandlePerfectSoldiersAchievement", [])
											else:
												pass
												if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPickup")))):
													pass
													R.set_value(v_info, "m_iAmmoPickupLevel", 1, "+=")
													R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Ammo Points", "Improved", (v_info).fields.get("m_iAmmoPickupLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
													R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
													R.call_member(c, "HandlePerfectSoldiersAchievement", [])
												else:
													pass
													if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LowerCost")))):
														pass
														R.set_value(v_info, "m_iLowerCostLevel", 1, "+=")
														R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["RP Costs", "Lowered", (v_info).fields.get("m_iLowerCostLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
														R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
														R.call_member(c, "HandlePerfectSoldiersAchievement", [])
													else:
														pass
														if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_DriverSwitch")))):
															pass
															R.set_value(v_info, "m_iDriverSwitchLevel", 1, "+=")
															R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Driver Switch Speed", "Increased", (v_info).fields.get("m_iDriverSwitchLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
															R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
															R.call_member(c, "HandlePerfectSoldiersAchievement", [])
														else:
															pass
															if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_TaskSpeed")))):
																pass
																R.set_value(v_info, "m_iTaskSpeedLevel", 1, "+=")
																R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Task Speed", "Increased", (v_info).fields.get("m_iTaskSpeedLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
																R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
																R.call_member(c, "HandlePerfectSoldiersAchievement", [])
															else:
																pass
																if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LevelUp")))):
																	pass
																	R.set_value(v_info, "m_iLevelUpLevel", 1, "+=")
																	R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Leveling Speed", "Increased", (v_info).fields.get("m_iLevelUpLevel"), R.static_value("RDPlayer", "MaxUpgradeLevel")])
																	R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
																	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
																else:
																	pass
																	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG")))):
																		pass
																		((v_info).fields.get("m_MountedMG")).fields["m_bUnlocked"] = true
																		((v_info).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = false
																		((v_info).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
																		((v_info).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
																		R.call_member((c).fields.get("m_WeaponMountedMG"), "ReplenishAmmo", [false, 1])
																		R.call_member(c, "InitWeaponsArray", [])
																		if R.truth(R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponRocketLauncher"))):
																			pass
																			R.call_member(c, "SetWeapon", [4])
																		R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Mounted MG", "Installed", 0, 0])
																	else:
																		pass
																		if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher")))):
																			pass
																			((v_info).fields.get("m_MountedMG")).fields["m_bUnlocked"] = false
																			((v_info).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = true
																			((v_info).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
																			((v_info).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
																			R.call_member((c).fields.get("m_WeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
																			R.call_member(c, "InitWeaponsArray", [])
																			if R.truth(R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMountedMG"))):
																				pass
																				R.call_member(c, "SetWeapon", [4])
																			R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Rocket Launcher", "Installed", 0, 0])
																		else:
																			pass
																			if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire")))):
																				pass
																				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iTiresLevel", 1, "+=")
																				if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
																					pass
																					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "StopShake", ["TireScraping", 0])
																					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_TireScrapingSound")])
																				(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = float(0)
																				(c).fields["m_iNbBlownTires"] = R.coerce(0, "int")
																				R.call_member(c, "UpdateTireValues", [])
																				R.call_member(c, "UpdateDrivingValues", [])
																				R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Tires", "Upgraded", 0, 0])
																				R.call_member(c, "HandlePerfectSoldiersAchievement", [])
																			else:
																				pass
																				if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine")))):
																					pass
																					R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iEngineLevel", 1, "+=")
																					(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperHP"] = float(100)
																					R.call_member(c, "UpdateEngineValues", [])
																					R.call_member(c, "UpdateBumperValues", [])
																					R.call_member(c, "UpdateBumperVisual", [])
																					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BurningEngineSound")])
																					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
																					R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Engine", "Upgraded", 0, 0])
																					R.call_member(c, "HandlePerfectSoldiersAchievement", [])
																				else:
																					pass
																					if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper")))):
																						pass
																						R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iBumperLevel", 1, "+=")
																						(c).fields["m_iBumperLevel"] = R.coerce((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBumperLevel"), "int")
																						(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperAddonHP"] = float(100)
																						R.call_member(c, "UpdateBumperValues", [])
																						R.call_member(c, "UpdateBumperVisual", [])
																						R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Armor", "Upgraded", 0, 0])
																						R.call_member(c, "HandlePerfectSoldiersAchievement", [])
																					else:
																						pass
																						if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairTire")))):
																							pass
																							if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
																								pass
																								R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "StopShake", ["TireScraping", 0])
																								R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_TireScrapingSound")])
																							(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = float(0)
																							(c).fields["m_iNbBlownTires"] = R.coerce(0, "int")
																							R.call_member(c, "UpdateTireValues", [])
																							R.call_member(c, "UpdateDrivingValues", [])
																							R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Tires", "Repaired", 0, 0])
																						else:
																							pass
																							if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairEngine")))):
																								pass
																								(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperHP"] = float(100)
																								R.call_member(c, "UpdateBumperVisual", [])
																								R.call_member(c, "UpdateBumperValues", [])
																								R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BurningEngineSound")])
																								R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
																								R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Engine", "Repaired", 0, 0])
																							else:
																								pass
																								if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairBumper")))):
																									pass
																									(c).fields["m_iBumperLevel"] = R.coerce((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBumperLevel"), "int")
																									(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperAddonHP"] = float(100)
																									R.call_member(c, "UpdateBumperValues", [])
																									R.call_member(c, "UpdateBumperVisual", [])
																									R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Armor", "Repaired", 0, 0])
	if R.truth(v_bDone):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorCloseSound")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
		if R.truth(((c).fields.get("m_bStartedPerfectDefense") and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "PerfectDefense"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "PerfectDefense")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
			(c).fields["m_bStartedPerfectDefense"] = false
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iSuccessfulStops", 1, "+=")
		if R.truth((c).fields.get("m_TaskSound")):
			pass
			R.call_member((c).fields.get("m_TaskSound"), "Stop", [])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_CompleteDoTask(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_weapon: Variant = null
	var v_bFemaleWeapon: Variant = false
	var v_iWeapon: Variant = 0
	var v_bDone: Variant = false
	var v_info: Variant = null
	var v_gameplayMode: Variant = null
	var v_storyMode: Variant = null
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_i = R.coerce(0, "int")
	v_weapon = R.coerce(null, "RDWeapon")
	v_bFemaleWeapon = false
	v_iWeapon = R.coerce(0, "int")
	v_bDone = true
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage")))):
		pass
		R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iDamageLevel", 1, "+=")
	else:
		pass
		if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))):
			pass
			R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iAccuracyLevel", 1, "+=")
		else:
			pass
			if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity")))):
				pass
				R.set_value(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data"), "m_iCapacityLevel", 1, "+=")
				R.call_member((c).fields.get("m_UpgradedWeapon"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_UpgradedWeapon")), 1])
				R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "UpdateWeaponDisplay", [])
				R.call_member(((v_gameplayMode).fields.get("m_Game")).fields.get("m_Hud"), "UpdateAmmoDisplay", [])
			else:
				pass
				if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UnlockWeapon")))):
					pass
					(((c).fields.get("m_UpgradedWeapon")).fields.get("m_Data")).fields["m_bUnlocked"] = true
					R.call_member(c, "InitWeaponsArray", [])
					v_bFemaleWeapon = R.coerce(R.call_member(c, "IsFemaleWeapon", [(c).fields.get("m_UpgradedWeapon")]), "Boolean")
					if R.truth((((c).fields.get("m_UpgradedWeapon")).fields.get("m_bMountedWeapon") or R.binary("!=", v_bFemaleWeapon, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")))):
						pass
						v_iWeapon = R.coerce(R.call_member(c, "GetWeaponIndex", [(c).fields.get("m_UpgradedWeapon")]), "int")
						if R.truth(R.binary("==", v_iWeapon, ((c).fields.get("m_iWeaponCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_iWeaponDiane")))):
							pass
							R.call_member(c, "EquipWeapon", [v_iWeapon])
				else:
					pass
					if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedShield")))):
						pass
						if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
							pass
							R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedShields", 1, "+=")
						else:
							pass
							R.set_value(v_info, "m_iMedShields", 1, "+=")
					else:
						pass
						if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedHeal")))):
							pass
							if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
								pass
								R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedHeals", 1, "+=")
							else:
								pass
								R.set_value(v_info, "m_iMedHeals", 1, "+=")
						else:
							pass
							if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ChopperSupport")))):
								pass
								R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_SupportChoppers")])
								R.set_value(v_info, "m_iChopperSupportLevel", 1, "+=")
							else:
								pass
								if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPickup")))):
									pass
									R.set_value(v_info, "m_iAmmoPickupLevel", 1, "+=")
								else:
									pass
									if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LowerCost")))):
										pass
										R.set_value(v_info, "m_iLowerCostLevel", 1, "+=")
									else:
										pass
										if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_DriverSwitch")))):
											pass
											R.set_value(v_info, "m_iDriverSwitchLevel", 1, "+=")
										else:
											pass
											if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_TaskSpeed")))):
												pass
												R.set_value(v_info, "m_iTaskSpeedLevel", 1, "+=")
											else:
												pass
												if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LevelUp")))):
													pass
													R.set_value(v_info, "m_iLevelUpLevel", 1, "+=")
												else:
													pass
													if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG")))):
														pass
														((v_info).fields.get("m_MountedMG")).fields["m_bUnlocked"] = true
														((v_info).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = false
														((v_info).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
														((v_info).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
														R.call_member((c).fields.get("m_WeaponMountedMG"), "ReplenishAmmo", [false, 1])
														R.call_member(c, "InitWeaponsArray", [])
														if R.truth(R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponRocketLauncher"))):
															pass
															R.call_member(c, "SetWeapon", [4])
													else:
														pass
														if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher")))):
															pass
															((v_info).fields.get("m_MountedMG")).fields["m_bUnlocked"] = false
															((v_info).fields.get("m_RocketLauncher")).fields["m_bUnlocked"] = true
															((v_info).fields.get("m_CustomMountedMG")).fields["m_bUnlocked"] = false
															((v_info).fields.get("m_CustomRocketLauncher")).fields["m_bUnlocked"] = false
															R.call_member((c).fields.get("m_WeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
															R.call_member(c, "InitWeaponsArray", [])
															if R.truth(R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMountedMG"))):
																pass
																R.call_member(c, "SetWeapon", [4])
														else:
															pass
															if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire")))):
																pass
																R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iTiresLevel", 1, "+=")
																if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
																	pass
																	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "StopShake", ["TireScraping", 0])
																	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_TireScrapingSound")])
																(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = float(0)
																(c).fields["m_iNbBlownTires"] = R.coerce(0, "int")
																R.call_member(c, "UpdateTireValues", [])
																R.call_member(c, "UpdateDrivingValues", [])
															else:
																pass
																if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine")))):
																	pass
																	R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iEngineLevel", 1, "+=")
																	(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperHP"] = float(100)
																	R.call_member(c, "UpdateEngineValues", [])
																	R.call_member(c, "UpdateBumperValues", [])
																	R.call_member(c, "UpdateBumperVisual", [])
																	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BurningEngineSound")])
																	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
																else:
																	pass
																	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper")))):
																		pass
																		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iBumperLevel", 1, "+=")
																		(c).fields["m_iBumperLevel"] = R.coerce((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBumperLevel"), "int")
																		(R.static_value("RDPlayerInfo", "Instance")).fields["m_fBumperAddonHP"] = float(100)
																		R.call_member(c, "UpdateBumperValues", [])
																		R.call_member(c, "UpdateBumperVisual", [])
	(c).fields["m_iCurrentTask"] = R.coerce(R.static_value("RDPlayer", "Task_None"), "int")
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_Hud")).fields.get("m_LevelUpSound"), "Play", [])
	R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_CheckPostUpgradeAchievements(c: Variant, a: Array) -> Variant:
	R.call_member(c, "HandleLockedAndLoadedAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	R.call_member(c, "HandleArmedToTheTeethAchievement", [])
	R.call_member(c, "HandleStateOfTheBadassArtAchievement", [])
	return null

static func f_ReplenishForGameMode(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_WeaponPistolCocheta"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponPistolDiane"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponMAC11"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponSPAS12"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponMP5"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponShotgun"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponM16"), "ReplenishAmmoTo", [0.5])
	R.call_member((c).fields.get("m_WeaponM60"), "ReplenishAmmoTo", [0.5])
	return null

static func f_FullReplenish(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_WeaponPistolCocheta"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponPistolDiane"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponMAC11"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponSPAS12"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponMP5"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponShotgun"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponM16"), "ReplenishAmmoTo", [1])
	R.call_member((c).fields.get("m_WeaponM60"), "ReplenishAmmoTo", [1])
	return null

static func f_GetActiveTaskName(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairRadio")))):
		pass
		return "Repairing Radio"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_SecureCivilian")))):
		pass
		return "Securing Civilian"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponDamage")))):
		pass
		return R.binary("+", R.binary("+", "Upgrading ", ((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName")), " Damage")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponAccuracy")))):
		pass
		return R.binary("+", R.binary("+", "Upgrading ", ((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName")), " Accuracy")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UpgradeWeaponCapacity")))):
		pass
		return R.binary("+", R.binary("+", "Upgrading ", ((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName")), " Capacity")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ReplenishAmmo")))):
		pass
		return "Replenishing Ammo"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MountedMG")))):
		pass
		return "Installing Mounted MG"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RocketLauncher")))):
		pass
		return "Installing Rocket Launcher"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Tire")))):
		pass
		return "Upgrading Tires"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Engine")))):
		pass
		return "Upgrading Engine"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_Bumper")))):
		pass
		return "Upgrading Bumper"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairTire")))):
		pass
		return "Repairing Tires"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairEngine")))):
		pass
		return "Repairing Engine"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_RepairBumper")))):
		pass
		return "Repairing Bumper"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_UnlockWeapon")))):
		pass
		return R.binary("+", "Acquiring ", ((c).fields.get("m_UpgradedWeapon")).fields.get("m_szWeaponName"))
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPoint")))):
		pass
		return "Gathering Ammo"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedShield")))):
		pass
		return "Getting Steroids"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_MedHeal")))):
		pass
		return "Getting Med Patch"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_ChopperSupport")))):
		pass
		return ("Acquiring Chopper Support" if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iChopperSupportLevel")) == float(0))) else "Improving Chopper Support")
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_AmmoPickup")))):
		pass
		return "Improving Ammo Pickups"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LowerCost")))):
		pass
		return "Lowering Costs"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_DriverSwitch")))):
		pass
		return "Increasing Driver Switch Speed"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_TaskSpeed")))):
		pass
		return "Increasing Task Speed"
	if R.truth((float(v_iTask) == float(R.static_value("RDPlayer", "Task_LevelUp")))):
		pass
		return "Increasing Level Up Speed"
	return ""
	return null

static func f_UpdateTask(c: Variant, a: Array) -> Variant:
	var v_iTask: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iTask = R.coerce(0, "int")
	if R.truth(((float((c).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_None"))) and (float((c).fields.get("m_fTaskTime")) < float((c).fields.get("m_fTaskDuration"))))):
		pass
		if R.truth((R.truth((c).fields.get("m_TaskSound")) and (float((c).fields.get("m_fTaskSoundTimer")) > float(0)))):
			pass
			(c).fields["m_fTaskSoundTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fTaskSoundTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fTaskSoundTimer")) <= float(0))):
				pass
				R.call_member((c).fields.get("m_TaskSound"), "Play", [true])
		if R.truth(((R.truth(R.logical_and((c).fields.get("m_bDoProtectTaskVoice"), func(): return (c).fields.get("m_TaskVoice"))) and R.truth(R.unary("!", R.call_member((c).fields.get("m_TaskVoice"), "IsPlaying", [])))) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused")))):
			pass
			if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleProtectTaskVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleProtectTaskVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			(c).fields["m_bDoProtectTaskVoice"] = false
		(c).fields["m_fTaskTime"] = float(minf(float((float((c).fields.get("m_fTaskTime")) + float((R.num(R.get_value(R.static_value("RDPlayer", "TaskSpeedMultiplier"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTaskSpeedLevel"))) * float(v_fDeltaTime))))), float((c).fields.get("m_fTaskDuration"))))
		if R.truth(((c).fields.get("m_bDoTaskVoice") and (float((c).fields.get("m_fTaskTime")) >= float(R.binary("/", (c).fields.get("m_fTaskDuration"), 2))))):
			pass
			R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverTaskInProgressVoices"), R.static_value("RDPlayer", "m_MaleGunnerTaskInProgressVoices"), R.static_value("RDPlayer", "m_FemaleDriverTaskInProgressVoices"), R.static_value("RDPlayer", "m_FemaleGunnerTaskInProgressVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			(c).fields["m_bDoTaskVoice"] = false
		if R.truth((float((c).fields.get("m_fTaskTime")) == float((c).fields.get("m_fTaskDuration")))):
			pass
			v_iTask = R.coerce((c).fields.get("m_iCurrentTask"), "int")
			(c).fields["m_iCurrentTask"] = R.coerce(R.static_value("RDPlayer", "Task_None"), "int")
			R.call_member(c, "CompleteTask", [v_iTask])
		if R.truth(((float((c).fields.get("m_iCurrentTask")) != float(R.static_value("RDPlayer", "Task_None"))) and (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0)))):
			pass
			R.call_member(c, "CancelTask", [true])
			R.call_member((((c).fields.get("m_GameModeGameplay")).fields.get("m_Game")).fields.get("m_Hud"), "OnTaskCanceled", [])
	return null

static func f_CanSteer(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.logical_and(R.unary("!", (c).fields.get("m_bSwitchingDriver")), func(): return R.call_member((c).fields.get("m_GameModeGameplay"), "SteeringEnabled", [])), func(): return R.unary("!", (c).fields.get("m_ClingerSideLeft")))
	return null

static func f_UpdateCarState(c: Variant, a: Array) -> Variant:
	var v_iNewEngineState: Variant = 0
	var v_bHandBraking: Variant = false
	var v_fSpeedRatio: Variant = NAN
	var v_fXMaxSpeed: Variant = NAN
	var v_fXAccel: Variant = null
	var v_fXDeccel: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_bIsSideScraping: Variant = false
	var v_collisionSound: Variant = null
	var v_fSpeedXRatio: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iNewEngineState = R.coerce(0, "int")
	v_bHandBraking = false
	v_fSpeedRatio = float(NAN)
	v_fXMaxSpeed = float(NAN)
	v_fXAccel = R.coerce(null, "*")
	v_fXDeccel = R.coerce(null, "*")
	v_fRoadLimit = float(NAN)
	v_bIsSideScraping = false
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_fSpeedXRatio = float(NAN)
	if R.truth(((R.unary("!", (c).fields.get("m_bChopperMode")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused"))) and (float((c).fields.get("m_iEngineState")) != float(R.static_value("RDPlayer", "EngineState_Exploded"))))):
		pass
		(c).fields["m_iOldEngineState"] = R.coerce((c).fields.get("m_iEngineState"), "int")
		v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_Idle"), "int")
		if R.truth(R.logical_and((((c).fields.get("m_bGoBackward") or (c).fields.get("m_bForceBrake")) and (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))), func(): return R.call_member(c, "CanBrake", []))):
			pass
			v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_DeccelBrake"), "int")
		else:
			pass
			if R.truth(R.logical_and(R.logical_and(R.logical_and((c).fields.get("m_bHandBraking"), func(): return R.call_member(c, "CanHandBrake", [])), func(): return (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))), func(): return R.unary("!", (c).fields.get("m_bFullSpeedMode")))):
				pass
				v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_DeccelHandBrake"), "int")
			else:
				pass
				if R.truth(R.logical_and(((c).fields.get("m_bGoForward") or (c).fields.get("m_bFullSpeedMode")), func(): return R.call_member(c, "CanGoForward", []))):
					pass
					if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float((float((c).fields.get("m_fMaxSpeed")) * float((c).fields.get("m_fMaxSpeedFactor")))))):
						pass
						v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_MaxSpeed"), "int")
					else:
						pass
						v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_Accel"), "int")
				else:
					pass
					if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))):
						pass
						v_iNewEngineState = R.coerce(R.static_value("RDPlayer", "EngineState_DeccelNoBrake"), "int")
		(c).fields["m_iEngineState"] = R.coerce(v_iNewEngineState, "int")
	if R.truth(R.unary("!", (c).fields.get("m_bChopperMode"))):
		pass
		if R.truth((float((c).fields.get("m_iLeftHandState")) != float(R.static_value("RDPlayer", "HandState_OnWheel")))):
			pass
			(c).fields["m_fWheelDirection"] = float(0)
		else:
			pass
			if R.truth(R.logical_and((c).fields.get("m_bSteeringRight"), func(): return R.call_member(c, "CanSteer", []))):
				pass
				(c).fields["m_fWheelDirection"] = float(1)
			else:
				pass
				if R.truth(R.logical_and((c).fields.get("m_bSteeringLeft"), func(): return R.call_member(c, "CanSteer", []))):
					pass
					(c).fields["m_fWheelDirection"] = R.coerce(R.unary("-", 1), "Number")
				else:
					pass
					(c).fields["m_fWheelDirection"] = float(0)
		v_bHandBraking = R.coerce(R.logical_and(R.logical_and(R.logical_and((c).fields.get("m_bHandBraking"), func(): return R.call_member(c, "CanHandBrake", [])), func(): return (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))), func(): return R.unary("!", (c).fields.get("m_bFullSpeedMode"))), "Boolean")
		v_fSpeedRatio = float(minf(float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (float((float((c).fields.get("m_fMaxSpeed")) * float((c).fields.get("m_fMaxSpeedFactor")))) * float(0.75)))), float(1)))
		v_fSpeedRatio = float((float(1) - float(pow(float((float(1) - float(v_fSpeedRatio))), float(3)))))
		v_fXMaxSpeed = float((float(v_fSpeedRatio) * R.num(((c).fields.get("m_fXMaxSpeedHandBrake") if R.truth(v_bHandBraking) else (c).fields.get("m_fXMaxSpeed")))))
		v_fXAccel = R.coerce(((c).fields.get("m_fXAccelHandBrake") if R.truth(v_bHandBraking) else (c).fields.get("m_fXAccel")), "*")
		v_fXDeccel = R.coerce(((c).fields.get("m_fXDeccelHandBrake") if R.truth(v_bHandBraking) else (c).fields.get("m_fXDeccel")), "*")
		if R.truth((float((c).fields.get("m_fWheelDirection")) < float(0))):
			pass
			if R.truth(R.binary(">", (c).fields.get("m_fDesiredSpeedX"), R.unary("-", v_fXMaxSpeed))):
				pass
				(c).fields["m_fDesiredSpeedX"] = float(maxf(float((float((c).fields.get("m_fDesiredSpeedX")) - float((R.num(v_fXAccel) * float(v_fDeltaTime))))), R.num(R.unary("-", v_fXMaxSpeed))))
			else:
				pass
				(c).fields["m_fDesiredSpeedX"] = float(minf(float((float((c).fields.get("m_fDesiredSpeedX")) + float((R.num(v_fXDeccel) * float(v_fDeltaTime))))), R.num(R.unary("-", v_fXMaxSpeed))))
		else:
			pass
			if R.truth((float((c).fields.get("m_fWheelDirection")) > float(0))):
				pass
				if R.truth((float((c).fields.get("m_fDesiredSpeedX")) < float(v_fXMaxSpeed))):
					pass
					(c).fields["m_fDesiredSpeedX"] = float(minf(float((float((c).fields.get("m_fDesiredSpeedX")) + float((R.num(v_fXAccel) * float(v_fDeltaTime))))), float(v_fXMaxSpeed)))
				else:
					pass
					(c).fields["m_fDesiredSpeedX"] = float(maxf(float((float((c).fields.get("m_fDesiredSpeedX")) - float((R.num(v_fXDeccel) * float(v_fDeltaTime))))), float(v_fXMaxSpeed)))
			else:
				pass
				if R.truth((float((c).fields.get("m_fDesiredSpeedX")) > float(0))):
					pass
					(c).fields["m_fDesiredSpeedX"] = float(maxf(float((float((c).fields.get("m_fDesiredSpeedX")) - float((R.num(v_fXDeccel) * float(v_fDeltaTime))))), float(0)))
				else:
					pass
					(c).fields["m_fDesiredSpeedX"] = float(minf(float((float((c).fields.get("m_fDesiredSpeedX")) + float((R.num(v_fXDeccel) * float(v_fDeltaTime))))), float(0)))
		v_fRoadLimit = R.coerce(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "GetSideLimit", []), "Number")
		v_bIsSideScraping = R.coerce(R.logical_and(R.logical_and(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "CanSideScrape", []), func(): return (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))), func(): return ((R.binary("==", (c).fields.get("m_fRelativeLocationX"), R.unary("-", v_fRoadLimit)) and (float((c.fields.get("m_vVelocity")).fields.get("X")) < float(0))) or ((float((c).fields.get("m_fRelativeLocationX")) == float(v_fRoadLimit)) and (float((c.fields.get("m_vVelocity")).fields.get("X")) > float(0))))), "Boolean")
		if R.truth(R.binary("!=", v_bIsSideScraping, (c).fields.get("m_bIsSideScraping"))):
			pass
			(c).fields["m_bIsSideScraping"] = v_bIsSideScraping
			if R.truth((c).fields.get("m_bIsSideScraping")):
				pass
				(c).fields["m_bIsSideScrapingRight"] = (float((c).fields.get("m_fRelativeLocationX")) == float(v_fRoadLimit))
				v_fSpeedXRatio = float(R.binary("/", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("X")]), (c).fields.get("m_fXMaxSpeedHandBrake")))
				if R.truth((float(v_fSpeedXRatio) == float(1))):
					pass
					v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_HardCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
					R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["SideCollisionHard", 0.04, 0, 0, 0.5])
					if R.truth((float(randf()) > float(0.5))):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					if R.truth((float(v_fSpeedXRatio) > float(0.5))):
						pass
						v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_MediumCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["SideCollisionMedium", 0.03, 0, 0, 0.5])
						if R.truth((float(randf()) > float(0.5))):
							pass
							R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
						else:
							pass
							R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_LightCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
						R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["SideCollisionLight", 0.02, 0, 0, 0.5])
				R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
				if R.truth((R.truth((c).fields.get("m_ClingerLeft")) and (float(v_fSpeedXRatio) > float(0.8)))):
					pass
					R.call_member((c).fields.get("m_ClingerLeft"), "OnSideCollision", [(float((c).fields.get("m_fRelativeLocationX")) == float(v_fRoadLimit))])
				if R.truth((R.truth((c).fields.get("m_ClingerRight")) and (float(v_fSpeedXRatio) > float(0.8)))):
					pass
					R.call_member((c).fields.get("m_ClingerRight"), "OnSideCollision", [(float((c).fields.get("m_fRelativeLocationX")) == float(v_fRoadLimit))])
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SideScrapingSound"), true])
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["SideScraping", 0.005, 0.25, R.unary("-", 1), 0])
				if R.truth((c).fields.get("m_bIsSideScrapingRight")):
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "play"), [])
					R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "stop"), [])
					R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
				else:
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "play"), [])
					R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "visible", true, "=")
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "stop"), [])
					R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
			else:
				pass
				R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SideScrapingSound")])
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "StopShake", ["SideScraping", 0.25])
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "stop"), [])
				R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftSideSparks"), "visible", false, "=")
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "stop"), [])
				R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightSideSparks"), "visible", false, "=")
		if R.truth((c).fields.get("m_bIsSideScraping")):
			pass
			if R.truth((R.truth((c).fields.get("m_ClingerSideLeft")) and R.unary("!", (c).fields.get("m_bIsSideScrapingRight")))):
				pass
				R.call_member((c).fields.get("m_ClingerSideLeft"), "OnSideScraping", [])
				R.call_member(c, "AddSideGrindingBlood", [])
			if R.truth((R.truth((c).fields.get("m_ClingerSideRight")) and (c).fields.get("m_bIsSideScrapingRight"))):
				pass
				R.call_member((c).fields.get("m_ClingerSideRight"), "OnSideScraping", [])
				R.call_member(c, "AddSideGrindingBlood", [])
		if R.truth((float((c).fields.get("m_fOilTime")) > float(0))):
			pass
			(c).fields["m_fOilTime"] = float(maxf(float((float((c).fields.get("m_fOilTime")) - float(v_fDeltaTime))), float(0)))
			(c).fields["m_fOilFactor"] = float((float(1) - float(pow(float((float(1) - float(R.binary("/", (c).fields.get("m_fOilTime"), (c).fields.get("m_fOilDuration"))))), float(R.static_value("RDPlayer", "OilFactorPower"))))))
			if R.truth((((c).fields.get("m_bDoingSlipAndSlide") and (float((c).fields.get("m_fOilTime")) == float(0))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "SlipAndSlide"))))):
				pass
				R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "SlipAndSlide")])
				R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
		if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
			pass
			(c).fields["m_fTireBiasTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fTireBiasTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fTireBiasTimer")) >= float((c).fields.get("m_fTireBiasDuration")))):
				pass
				(c).fields["m_bTireBiasRight"] = R.unary("!", (c).fields.get("m_bTireBiasRight"))
				(c).fields["m_fTireBiasTimer"] = float(0)
				(c).fields["m_fTireBiasDuration"] = float((float((c).fields.get("m_fTireBiasDurationMin")) + float((float(randf()) * float((c).fields.get("m_fTireBiasDurationRandom"))))))
				(c).fields["m_fTargetTireBiasStrength"] = float((float((float((c).fields.get("m_fTireBiasStrengthMin")) + float((float(randf()) * float((c).fields.get("m_fTireBiasStrengthRandom")))))) * R.num((1 if R.truth((c).fields.get("m_bTireBiasRight")) else R.unary("-", 1)))))
	return null

static func f_CanGoForward(c: Variant, a: Array) -> Variant:
	return ((R.unary("!", (c).fields.get("m_bSwitchingDriver")) and ((float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None"))) or (c).fields.get("m_bTaskCanBeInterrupted"))) and R.unary("!", (c).fields.get("m_bForceBrake")))
	return null

static func f_GetMaxAccelTime(c: Variant, a: Array) -> Variant:
	var v_fMaxAccelTime: Variant = NAN
	v_fMaxAccelTime = float(0)
	if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed"))))):
		pass
		v_fMaxAccelTime = float(R.static_value("RDPlayer", "MaxAccelTimeAccel"))
	else:
		pass
		if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelNoBrake"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelHandBrake"))))):
			pass
			v_fMaxAccelTime = float(R.static_value("RDPlayer", "MaxAccelTimeDeccelNoBrake"))
		else:
			pass
			if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelBrake")))):
				pass
				v_fMaxAccelTime = float(R.static_value("RDPlayer", "MaxAccelTimeDeccelBrake"))
	return v_fMaxAccelTime
	return null

static func f_UpdateGear(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		return null
	if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Idle"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Exploded"))))):
		pass
		(c).fields["m_fGearRatio"] = float(0)
	else:
		pass
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))):
			pass
			(c).fields["m_iGear"] = R.coerce(3, "int")
			(c).fields["m_fGearRatio"] = float(1)
		else:
			pass
			if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel")))):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(4))):
					pass
					if R.truth(R.binary("<=", (c).fields.get("m_fEngineTime"), R.get_value(R.static_value("RDPlayer", "AccelTimes"), (float(v_i) + float(1))))):
						pass
						(c).fields["m_iGear"] = R.coerce(v_i, "int")
						break
					v_i = R.signed32(v_i + 1)
				(c).fields["m_fGearRatio"] = float(R.binary("/", (float((c).fields.get("m_fEngineTime")) - R.num(R.get_value(R.static_value("RDPlayer", "AccelTimes"), (c).fields.get("m_iGear")))), (R.num(R.get_value(R.static_value("RDPlayer", "AccelTimes"), (float((c).fields.get("m_iGear")) + float(1)))) - R.num(R.get_value(R.static_value("RDPlayer", "AccelTimes"), (c).fields.get("m_iGear"))))))
			else:
				pass
				if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelNoBrake"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelHandBrake"))))):
					pass
					v_i = R.coerce(0, "int")
					while R.truth((float(v_i) < float(4))):
						pass
						if R.truth(R.binary(">=", (c).fields.get("m_fEngineTime"), R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (float(v_i) + float(1))))):
							pass
							(c).fields["m_iGear"] = R.coerce(v_i, "int")
							break
						v_i = R.signed32(v_i + 1)
					(c).fields["m_fGearRatio"] = float((float(1) - float(R.binary("/", (float((c).fields.get("m_fEngineTime")) - R.num(R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1))))), (R.num(R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (c).fields.get("m_iGear"))) - R.num(R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1)))))))))
				else:
					pass
					v_i = R.coerce(0, "int")
					while R.truth((float(v_i) < float(4))):
						pass
						if R.truth(R.binary(">=", (c).fields.get("m_fEngineTime"), R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (float(v_i) + float(1))))):
							pass
							(c).fields["m_iGear"] = R.coerce(v_i, "int")
							break
						v_i = R.signed32(v_i + 1)
					(c).fields["m_fGearRatio"] = float((float(1) - float(R.binary("/", (float((c).fields.get("m_fEngineTime")) - R.num(R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1))))), (R.num(R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (c).fields.get("m_iGear"))) - R.num(R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1)))))))))
	return null

static func f_UpdateEngineTime(c: Variant, a: Array) -> Variant:
	var v_fNewTime: Variant = NAN
	var v_fMaxAccelTime: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_iOldEngineState: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fNewTime = float(NAN)
	v_fMaxAccelTime = float(NAN)
	if R.truth(((c).fields.get("m_bChopperMode") or (R.static_value("RDGame", "Instance")).fields.get("m_bPaused"))):
		pass
		return null
	if R.truth((((float((c).fields.get("m_iEngineState")) != float(v_iOldEngineState)) and (float((c).fields.get("m_iEngineState")) != float(R.static_value("RDPlayer", "EngineState_Idle")))) and (float((c).fields.get("m_iEngineState")) != float(R.static_value("RDPlayer", "EngineState_Exploded"))))):
		pass
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel")))):
			pass
			(c).fields["m_fEngineTime"] = float((float((R.num(R.get_value(R.static_value("RDPlayer", "AccelTimes"), (c).fields.get("m_iGear"))) * float((float(1) - float((c).fields.get("m_fGearRatio")))))) + float((R.num(R.get_value(R.static_value("RDPlayer", "AccelTimes"), (float((c).fields.get("m_iGear")) + float(1)))) * float((c).fields.get("m_fGearRatio"))))))
		else:
			pass
			if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelNoBrake"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelHandBrake"))))):
				pass
				(c).fields["m_fEngineTime"] = float((float((R.num(R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (c).fields.get("m_iGear"))) * float((float(1) - float((c).fields.get("m_fGearRatio")))))) + float((R.num(R.get_value(R.static_value("RDPlayer", "DeccelNoBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1)))) * float((c).fields.get("m_fGearRatio"))))))
			else:
				pass
				(c).fields["m_fEngineTime"] = float((float((R.num(R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (c).fields.get("m_iGear"))) * float((float(1) - float((c).fields.get("m_fGearRatio")))))) + float((R.num(R.get_value(R.static_value("RDPlayer", "DeccelBrakeTimes"), (float((c).fields.get("m_iGear")) + float(1)))) * float((c).fields.get("m_fGearRatio"))))))
	else:
		pass
		if R.truth((c).fields.get("m_currentEngineSound")):
			pass
			v_fNewTime = float((float((R.num(R.call_member((c).fields.get("m_currentEngineSound"), "GetPosition", [])) * float((c).fields.get("m_fEngineScale")))) * R.num(R.call_member(c, "GetEngineRatio", []))))
			if R.truth(((float((c).fields.get("m_fEngineTime")) < float(R.binary("/", R.call_member((c).fields.get("m_currentEngineSound"), "GetDuration", []), 2))) or (float(v_fNewTime) > float(0)))):
				pass
				(c).fields["m_fEngineTime"] = float(v_fNewTime)
			else:
				pass
				v_fMaxAccelTime = R.coerce(R.call_member(c, "GetMaxAccelTime", []), "Number")
				(c).fields["m_fEngineTime"] = float(v_fMaxAccelTime)
	R.call_member(c, "UpdateGear", [])
	return null

static func f_GetEngineRatio(c: Variant, a: Array) -> Variant:
	var v_fEngineRatio: Variant = NAN
	v_fEngineRatio = float(1)
	if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel")))):
		pass
		v_fEngineRatio = float(R.num(R.get_value(R.static_value("RDPlayer", "AccelDeccelTimeFactors"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iEngineLevel"))))
	else:
		pass
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelBrake")))):
			pass
			v_fEngineRatio = float(R.num(R.get_value(R.static_value("RDPlayer", "AccelDeccelTimeFactors"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel"))))
	return R.binary("/", 1, v_fEngineRatio)
	return null

static func f_UpdateSound(c: Variant, a: Array) -> Variant:
	var v_newEngineSound: Variant = null
	var v_newTireSound: Variant = null
	var v_bLooped: Variant = false
	var v_fOffset: Variant = NAN
	var v_bForceUpdate: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(((c).fields.get("m_bChopperMode") or (R.static_value("RDGame", "Instance")).fields.get("m_bPaused"))):
		pass
		return null
	v_newEngineSound = R.coerce(null, "DTSpacialSound")
	v_newTireSound = R.coerce(null, "DTSpacialSound")
	v_bLooped = false
	v_fOffset = float(0)
	if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Exploded")))):
		pass
		v_newEngineSound = R.coerce(null, "DTSpacialSound")
	else:
		pass
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Idle")))):
			pass
			v_newEngineSound = R.coerce((c).fields.get("m_IdleSound"), "DTSpacialSound")
			v_bLooped = true
		else:
			pass
			if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))):
				pass
				v_newEngineSound = R.coerce((c).fields.get("m_MaxSpeedSound"), "DTSpacialSound")
				v_bLooped = true
			else:
				pass
				v_fOffset = float(R.binary("/", (c).fields.get("m_fEngineTime"), (float((c).fields.get("m_fEngineScale")) * R.num(R.call_member(c, "GetEngineRatio", [])))))
				if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel")))):
					pass
					v_newEngineSound = R.coerce(R.get_value((c).fields.get("m_AccelSounds"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iEngineLevel")), "DTSpacialSound")
				else:
					pass
					if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelNoBrake")))):
						pass
						v_newEngineSound = R.coerce((c).fields.get("m_DeccelNoBrakeSound"), "DTSpacialSound")
					else:
						pass
						if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelHandBrake")))):
							pass
							v_newEngineSound = R.coerce((c).fields.get("m_DeccelNoBrakeSound"), "DTSpacialSound")
							v_newTireSound = R.coerce((c).fields.get("m_BrakeSound"), "DTSpacialSound")
						else:
							pass
							v_newEngineSound = R.coerce(R.get_value((c).fields.get("m_DeccelBrakeSounds"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")), "DTSpacialSound")
							v_newTireSound = R.coerce((c).fields.get("m_BrakeSound"), "DTSpacialSound")
	if R.truth(((float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0)) and (float((c).fields.get("m_fOilTime")) > float(0)))):
		pass
		v_newTireSound = R.coerce((c).fields.get("m_BrakeSound"), "DTSpacialSound")
	if R.truth((v_bForceUpdate or R.binary("!=", v_newEngineSound, (c).fields.get("m_currentEngineSound")))):
		pass
		if R.truth((c).fields.get("m_currentEngineSound")):
			pass
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_currentEngineSound")])
		(c).fields["m_currentEngineSound"] = R.coerce(v_newEngineSound, "DTSpacialSound")
		if R.truth((c).fields.get("m_currentEngineSound")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_currentEngineSound"), v_bLooped, v_fOffset])
	if R.truth(R.binary("!=", v_newTireSound, (c).fields.get("m_currentTireSound"))):
		pass
		if R.truth((c).fields.get("m_currentTireSound")):
			pass
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_currentTireSound")])
		(c).fields["m_currentTireSound"] = R.coerce(v_newTireSound, "DTSpacialSound")
		if R.truth((c).fields.get("m_currentTireSound")):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_currentTireSound"), true])
	return null

static func f_SetMaxSpeed(c: Variant, a: Array) -> Variant:
	(c.fields.get("m_vVelocity")).fields["Z"] = float((float((c).fields.get("m_fMaxSpeed")) * float((c).fields.get("m_fMaxSpeedFactor"))))
	(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_MaxSpeed"), "int")
	(c).fields["m_iGear"] = R.coerce(3, "int")
	(c).fields["m_fGearRatio"] = float(1)
	return null

static func f_GetCurrentSpeedRatio(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	v_fSpeedRatio = float(0)
	if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Idle"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Exploded"))))):
		pass
		v_fSpeedRatio = float(0)
	else:
		pass
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))):
			pass
			v_fSpeedRatio = float(1)
		else:
			pass
			v_fSpeedRatio = float((float((R.num(R.get_value(R.static_value("RDPlayer", "SpeedRatios"), (c).fields.get("m_iGear"))) * float((float(1) - float((c).fields.get("m_fGearRatio")))))) + float((R.num(R.get_value(R.static_value("RDPlayer", "SpeedRatios"), (float((c).fields.get("m_iGear")) + float(1)))) * float((c).fields.get("m_fGearRatio"))))))
	return v_fSpeedRatio
	return null

static func f_UpdateVelocity(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"fSpeedRatio": "Number", "bHandBraking": "Boolean", "fXMaxSpeed": "Number", "fXAccel": "*", "fXDeccel": "*", "fSlipperyFactor": "Number", "fSlipperyControlFactor": "Number", "fDeltaTime": "Number"}
	l["fSpeedRatio"] = NAN
	l["bHandBraking"] = false
	l["fXMaxSpeed"] = NAN
	l["fXAccel"] = null
	l["fXDeccel"] = null
	l["fSlipperyFactor"] = NAN
	l["fSlipperyControlFactor"] = NAN
	l["fDeltaTime"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.lset(l, "fSpeedRatio", NAN)
	R.lset(l, "bHandBraking", false)
	R.lset(l, "fXMaxSpeed", NAN)
	R.lset(l, "fXAccel", null)
	R.lset(l, "fXDeccel", null)
	R.lset(l, "fSlipperyFactor", NAN)
	R.lset(l, "fSlipperyControlFactor", NAN)
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		return null
	(c).fields["m_fTargetMaxSpeedFactor"] = R.coerce(R.call_member((c).fields.get("m_GameModeGameplay"), "GetPlayerSpeedFactor", []), "Number")
	if R.truth((float((c).fields.get("m_fTargetMaxSpeedFactor")) > float((c).fields.get("m_fMaxSpeedFactor")))):
		pass
		(c).fields["m_fMaxSpeedFactor"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fMaxSpeedFactor"), (c).fields.get("m_fTargetMaxSpeedFactor"), R.lget(l, "fDeltaTime"), 2]), "Number")
	else:
		pass
		(c).fields["m_fMaxSpeedFactor"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fMaxSpeedFactor"), (c).fields.get("m_fTargetMaxSpeedFactor"), R.lget(l, "fDeltaTime"), 1]), "Number")
	(c.fields.get("m_vVelocity")).fields["Z"] = float((float((R.num(R.call_member(c, "GetCurrentSpeedRatio", [])) * float((c).fields.get("m_fMaxSpeed")))) * float((c).fields.get("m_fMaxSpeedFactor"))))
	(c.fields.get("m_vVelocity")).fields["X"] = float((c).fields.get("m_fPreEffectVelocityX"))
	if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))):
		pass
		R.lset(l, "fSpeedRatio", minf(float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (float((float((c).fields.get("m_fMaxSpeed")) * float((c).fields.get("m_fMaxSpeedFactor")))) * float(0.75)))), float(1)), "=")
		R.lset(l, "fSpeedRatio", (float(1) - float(pow(float((float(1) - float(R.lget(l, "fSpeedRatio")))), float(2)))), "=")
		R.lset(l, "bHandBraking", R.logical_and(R.logical_and(R.logical_and((c).fields.get("m_bHandBraking"), func(): return R.call_member(c, "CanHandBrake", [])), func(): return (float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))), func(): return R.unary("!", (c).fields.get("m_bFullSpeedMode"))), "=")
		R.lset(l, "fXMaxSpeed", (float(R.lget(l, "fSpeedRatio")) * R.num(((c).fields.get("m_fXMaxSpeedHandBrake") if R.truth(R.lget(l, "bHandBraking")) else (c).fields.get("m_fXMaxSpeed")))), "=")
		R.lset(l, "fXAccel", ((c).fields.get("m_fXAccelHandBrake") if R.truth(R.lget(l, "bHandBraking")) else (c).fields.get("m_fXAccel")), "=")
		R.lset(l, "fXDeccel", ((c).fields.get("m_fXDeccelHandBrake") if R.truth(R.lget(l, "bHandBraking")) else (c).fields.get("m_fXDeccel")), "=")
		if R.truth((float((c).fields.get("m_iNbBlownTires")) > float(0))):
			pass
			R.lset(l, "fXAccel", (c).fields.get("m_fBlownTireControlFactor"), "*=")
			R.lset(l, "fXDeccel", (c).fields.get("m_fBlownTireControlFactor"), "*=")
		R.lset(l, "fSlipperyFactor", (c).fields.get("m_fOilFactor"), "=")
		R.lset(l, "fSlipperyControlFactor", (c).fields.get("m_fOilControlFactor"), "=")
		if R.truth(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "IsOnSnow", [(c).fields.get("m_fRelativeLocationX"), (c.fields.get("m_vLocation")).fields.get("Z")])):
			pass
			R.lset(l, "fSlipperyFactor", 1, "=")
			R.lset(l, "fSlipperyControlFactor", 0.6, "=")
		else:
			pass
			if R.truth(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "IsOnMud", [(c).fields.get("m_fRelativeLocationX"), (c.fields.get("m_vLocation")).fields.get("Z")])):
				pass
				R.lset(l, "fSlipperyFactor", 1, "=")
				R.lset(l, "fSlipperyControlFactor", 0.8, "=")
			else:
				pass
				if R.truth(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "IsOnIce", [(c).fields.get("m_fRelativeLocationX"), (c.fields.get("m_vLocation")).fields.get("Z")])):
					pass
					R.lset(l, "fSlipperyFactor", 1, "=")
					R.lset(l, "fSlipperyControlFactor", 0.2, "=")
		if R.truth((float(R.lget(l, "fSlipperyFactor")) > float(0))):
			pass
			R.lset(l, "fXAccel", (float((float(R.lget(l, "fSlipperyFactor")) * float((R.num(R.lget(l, "fXAccel")) * float(R.lget(l, "fSlipperyControlFactor")))))) + float((float((float(1) - float(R.lget(l, "fSlipperyFactor")))) * R.num(R.lget(l, "fXAccel"))))), "=")
			R.lset(l, "fXDeccel", (float((float(R.lget(l, "fSlipperyFactor")) * float((R.num(R.lget(l, "fXDeccel")) * float(R.lget(l, "fSlipperyControlFactor")))))) + float((float((float(1) - float(R.lget(l, "fSlipperyFactor")))) * R.num(R.lget(l, "fXDeccel"))))), "=")
		if R.truth((float((c).fields.get("m_fWheelDirection")) < float(0))):
			pass
			if R.truth(R.binary(">", (c.fields.get("m_vVelocity")).fields.get("X"), R.unary("-", R.lget(l, "fXMaxSpeed")))):
				pass
				(c.fields.get("m_vVelocity")).fields["X"] = float(maxf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) - float((R.num(R.lget(l, "fXAccel")) * float(R.lget(l, "fDeltaTime")))))), R.num(R.unary("-", R.lget(l, "fXMaxSpeed")))))
			else:
				pass
				(c.fields.get("m_vVelocity")).fields["X"] = float(minf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) + float((R.num(R.lget(l, "fXDeccel")) * float(R.lget(l, "fDeltaTime")))))), R.num(R.unary("-", R.lget(l, "fXMaxSpeed")))))
		else:
			pass
			if R.truth((float((c).fields.get("m_fWheelDirection")) > float(0))):
				pass
				if R.truth((float((c.fields.get("m_vVelocity")).fields.get("X")) < float(R.lget(l, "fXMaxSpeed")))):
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = float(minf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) + float((R.num(R.lget(l, "fXAccel")) * float(R.lget(l, "fDeltaTime")))))), float(R.lget(l, "fXMaxSpeed"))))
				else:
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = float(maxf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) - float((R.num(R.lget(l, "fXDeccel")) * float(R.lget(l, "fDeltaTime")))))), float(R.lget(l, "fXMaxSpeed"))))
			else:
				pass
				if R.truth((float((c.fields.get("m_vVelocity")).fields.get("X")) > float(0))):
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = float(maxf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) - float((R.num(R.lget(l, "fXDeccel")) * float(R.lget(l, "fDeltaTime")))))), float(0)))
				else:
					pass
					(c.fields.get("m_vVelocity")).fields["X"] = float(minf(float((float((c.fields.get("m_vVelocity")).fields.get("X")) + float((R.num(R.lget(l, "fXDeccel")) * float(R.lget(l, "fDeltaTime")))))), float(0)))
	else:
		pass
		(c.fields.get("m_vVelocity")).fields["X"] = float(0)
	(c).fields["m_fPreEffectVelocityX"] = float((c.fields.get("m_vVelocity")).fields.get("X"))
	if R.truth(((float((c.fields.get("m_vVelocity")).fields.get("Z")) != float(0)) and (float((c).fields.get("m_iNbBlownTires")) > float(0)))):
		pass
		(c).fields["m_fTireBiasStrength"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fTireBiasStrength"), (c).fields.get("m_fTargetTireBiasStrength"), R.lget(l, "fDeltaTime"), 1]), "Number")
		(c.fields.get("m_vVelocity")).fields["X"] = R.coerce(R.binary("+", (c.fields.get("m_vVelocity")).fields.get("X"), (float(minf(float((float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1))) * float((c).fields.get("m_fTireBiasStrength")))), "Number")
	(c.fields.get("m_vVelocity")).fields["X"] = float((float((float((c).fields.get("m_fBumpStrength")) * float((c).fields.get("m_fBumpSpeed")))) + float((float((float(1) - float((c).fields.get("m_fBumpStrength")))) * float((c.fields.get("m_vVelocity")).fields.get("X"))))))
	if R.truth((float((c).fields.get("m_fBumpStrength")) > float(0))):
		pass
		(c).fields["m_fBumpStrength"] = float(maxf(R.num(R.set_value(c, "m_fBumpStrength", (float((c).fields.get("m_fBumpStrength")) - float((float((c).fields.get("m_fBumpDeccel")) * float(R.lget(l, "fDeltaTime"))))), "=")), float(0)))
	(c).fields["m_fClingPatrolDistance"] = float(0)
	return null

static func f_GetBumpSpeedRatioFromSpeed(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	v_fSpeedRatio = R.coerce(R.call_static("Maths", "Clamp", [(float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor"))), 0.2, 1]), "Number")
	return (float(1) - float((float((float(1) - float(v_fSpeedRatio))) * float((float(1) - float(v_fSpeedRatio))))))
	return null

static func f_GetBumpStrengthRatioFromSpeed(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [(float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor"))), 0.5, 1])
	return null

static func f_GetMaxSpeedRatio(c: Variant, a: Array) -> Variant:
	return minf(float((float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1))
	return null

static func f_CanHorn(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_bChopperMode")) and (float((c).fields.get("m_iLeftHandState")) == float(R.static_value("RDPlayer", "HandState_OnWheel"))))
	return null

static func f_StartHorning(c: Variant, a: Array) -> Variant:
	(c).fields["m_bHorning"] = true
	R.call_member(c, "PlaySoundOnActor", [((c).fields.get("m_HornSound") if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")) else (c).fields.get("m_HornCarSound")), true])
	return null

static func f_StopHorning(c: Variant, a: Array) -> Variant:
	(c).fields["m_bHorning"] = false
	R.call_member(c, "StopSoundOnActor", [((c).fields.get("m_HornSound") if R.truth((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bUsingHummer")) else (c).fields.get("m_HornCarSound"))])
	return null

static func f_StartFiring(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bGunDown")):
		pass
		return null
	if R.truth(R.call_member((c).fields.get("m_Weapon"), "IsIdle", [])):
		pass
		if R.truth(((c).fields.get("m_Weapon")).fields.get("m_bOverheated")):
			pass
			R.call_member((c).fields.get("m_Weapon"), "OnNoAmmo", [])
		else:
			pass
			if R.truth(R.call_member((c).fields.get("m_Weapon"), "HasAmmoInMag", [])):
				pass
				R.call_member((c).fields.get("m_Weapon"), "StartFiring", [])
			else:
				pass
				if R.truth(R.call_member((c).fields.get("m_Weapon"), "CanReload", [])):
					pass
					R.call_member((c).fields.get("m_Weapon"), "Reload", [])
				else:
					pass
					R.call_member((c).fields.get("m_Weapon"), "OnNoAmmo", [])
	else:
		pass
		if R.truth(R.logical_and(R.call_member((c).fields.get("m_Weapon"), "IsReloading", []), func(): return R.call_member((c).fields.get("m_Weapon"), "CanCancelReload", []))):
			pass
			R.call_member((c).fields.get("m_Weapon"), "CancelReload", [])
		else:
			pass
			if R.truth((((c).fields.get("m_Weapon")).fields.get("m_bAutoFire") or ((c).fields.get("m_Weapon")).fields.get("m_bTimeBasedAutoFire"))):
				pass
				(c).fields["m_bWantsToFire"] = true
				R.call_member(c, "UpdateFiring", [])
	return null

static func f_UpdateFiring(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.logical_and(R.logical_and((c).fields.get("m_bWantsToFire"), func(): return R.call_member((c).fields.get("m_Weapon"), "IsIdle", [])), func(): return R.unary("!", (c).fields.get("m_bGunDown"))), func(): return R.unary("!", ((c).fields.get("m_Weapon")).fields.get("m_bOverheated")))):
		pass
		if R.truth(R.call_member((c).fields.get("m_Weapon"), "HasAmmoInMag", [])):
			pass
			R.call_member((c).fields.get("m_Weapon"), "StartFiring", [])
		else:
			pass
			if R.truth(R.call_member((c).fields.get("m_Weapon"), "CanReload", [])):
				pass
				R.call_member((c).fields.get("m_Weapon"), "Reload", [])
			else:
				pass
				R.call_member((c).fields.get("m_Weapon"), "OnNoAmmo", [])
		(c).fields["m_bWantsToFire"] = false
	return null

static func f_StopFiring(c: Variant, a: Array) -> Variant:
	(c).fields["m_bWantsToFire"] = false
	R.call_member((c).fields.get("m_Weapon"), "StopFiring", [])
	return null

static func f_CanReloadWeapon(c: Variant, a: Array) -> Variant:
	return R.call_member((c).fields.get("m_Weapon"), "CanReload", [])
	return null

static func f_OnCouldNotReload(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.call_member((c).fields.get("m_Weapon"), "IsWeaponEmpty", []), func(): return R.unary("!", R.call_member(c, "HasVoicePlaying", [])))):
		pass
		R.call_member(c, "OnWeaponEmpty", [])
	return null

static func f_IsClingerInDangerousStateForReload(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	return R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(R.logical_and(v_clinger, func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_GetOff")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_Shot")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_Gib")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDHumanoid", "ClingState_FrontGib")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDZombie", "ClingState_SideGrindOff")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDZombie", "ClingState_SideShot")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDZombie", "ClingState_SideElbow")))), func(): return (float((v_clinger).fields.get("m_iClingState")) != float(R.static_value("RDZombie", "ClingState_SidePunch"))))
	return null

static func f_ReloadWeapon(c: Variant, a: Array) -> Variant:
	var v_bSpoke: Variant = false
	v_bSpoke = false
	if R.truth((float(randf()) < float(0.5))):
		pass
		v_bSpoke = false
		if R.truth(((((R.truth((c).fields.get("m_ClingerLeft")) and R.truth(R.call_member(c, "IsClingerInDangerousStateForReload", [(c).fields.get("m_ClingerLeft")]))) or (R.truth((c).fields.get("m_ClingerRight")) and R.truth(R.call_member(c, "IsClingerInDangerousStateForReload", [(c).fields.get("m_ClingerRight")])))) or (R.truth((c).fields.get("m_ClingerSideLeft")) and R.truth(R.call_member(c, "IsClingerInDangerousStateForReload", [(c).fields.get("m_ClingerSideLeft")])))) or (R.truth((c).fields.get("m_ClingerSideRight")) and R.truth(R.call_member(c, "IsClingerInDangerousStateForReload", [(c).fields.get("m_ClingerSideRight")]))))):
			pass
			if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
				pass
				v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleReloadWithClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")]), "Boolean")
			else:
				pass
				v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleReloadWithClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")]), "Boolean")
		if R.truth((R.unary("!", v_bSpoke) and ((c).fields.get("m_Weapon")).fields.get("m_bAutoFire"))):
			pass
			if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
				pass
				v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleReloadMagVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Generic")]), "Boolean")
			else:
				pass
				v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleReloadMagVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Generic")]), "Boolean")
		if R.truth(R.unary("!", v_bSpoke)):
			pass
			if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleReloadVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleReloadVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Generic")])
	R.call_member((c).fields.get("m_Weapon"), "Reload", [])
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "HandsUp")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndStop"), [("OnWheelFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "OnWheelMale")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndStop"), [("OnWheelFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "OnWheelMale")])
		(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_OnWheel"), "int")
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "HandsDown")):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "stop"), [])
			R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "stop"), [])
		else:
			pass
			if R.truth(((((((((((R.binary("==", v_szEvent, "WeaponEndFire") or R.binary("==", v_szEvent, "WeaponEndReload")) or R.binary("==", v_szEvent, "WeaponEndReloadShell")) or R.binary("==", v_szEvent, "WeaponReloadMag")) or R.binary("==", v_szEvent, "WeaponReloadOneBullet")) or R.binary("==", v_szEvent, "SpawnBulletCase")) or R.binary("==", v_szEvent, "ReloadSound1")) or R.binary("==", v_szEvent, "ReloadSound2")) or R.binary("==", v_szEvent, "ReloadSound3")) or R.binary("==", v_szEvent, "ReloadSound4")) or R.binary("==", v_szEvent, "ReloadSound5"))):
				pass
				R.call_member((c).fields.get("m_Weapon"), "OnAnimEvent", [v_szEvent])
			else:
				pass
				R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_IsFemaleWeapon(c: Variant, a: Array) -> Variant:
	var v_weapon: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDWeapon")
	return (((R.binary("==", v_weapon, (c).fields.get("m_WeaponPistolDiane")) or R.binary("==", v_weapon, (c).fields.get("m_WeaponShotgun"))) or R.binary("==", v_weapon, (c).fields.get("m_WeaponMAC11"))) or R.binary("==", v_weapon, (c).fields.get("m_WeaponM16")))
	return null

static func f_GetWeaponIndex(c: Variant, a: Array) -> Variant:
	var v_weapons: Variant = null
	var v_i: Variant = 0
	var v_weapon: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDWeapon")
	v_weapons = R.coerce(((c).fields.get("m_WeaponsCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_WeaponsDiane")), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_weapons, "length"))):
		pass
		if R.truth(R.binary("==", v_weapon, R.get_value(v_weapons, v_i))):
			pass
			return v_i
		v_i = R.signed32(v_i + 1)
	return R.unary("-", 1)
	return null

static func f_HasWeapon(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_iWeapon: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		if R.truth((((float(v_iWeapon) == float(2)) and R.unary("!", ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked"))) or ((float(v_iWeapon) == float(3)) and R.unary("!", ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked"))))):
			pass
			return false
	else:
		pass
		if R.truth((((float(v_iWeapon) == float(2)) and R.unary("!", ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked"))) or ((float(v_iWeapon) == float(3)) and R.unary("!", ((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked"))))):
			pass
			return false
	if R.truth(((float(v_iWeapon) == float(4)) and (((((R.unary("!", ((v_info).fields.get("m_MountedMG")).fields.get("m_bUnlocked")) or R.binary("==", R.call_member((c).fields.get("m_WeaponMountedMG"), "GetAmmoInMag", []), 0)) and (R.unary("!", ((v_info).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked")) or R.binary("==", R.call_member((c).fields.get("m_WeaponRocketLauncher"), "GetAmmoInMag", []), 0))) and (R.unary("!", ((v_info).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked")) or R.binary("==", R.call_member((c).fields.get("m_CustomWeaponMountedMG"), "GetAmmoInMag", []), 0))) and (R.unary("!", ((v_info).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked")) or R.binary("==", R.call_member((c).fields.get("m_CustomWeaponRocketLauncher"), "GetAmmoInMag", []), 0))) or (c).fields.get("m_bChopperMode")))):
		pass
		return false
	return true
	return null

static func f_EquipWeapon(c: Variant, a: Array) -> Variant:
	var v_iWeapon: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iWeapon) != float((c).fields.get("m_iDesiredWeapon")))):
		pass
		(c).fields["m_iDesiredWeapon"] = R.coerce(v_iWeapon, "int")
		R.call_member(c, "SwitchWeapon", [])
	return null

static func f_SetWeapon(c: Variant, a: Array) -> Variant:
	var v_iWeapon: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_PreWeaponChanged")])
	(c).fields["m_iDesiredWeapon"] = R.coerce(v_iWeapon, "int")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		(c).fields["m_Weapon"] = R.coerce(R.get_value((c).fields.get("m_WeaponsCocheta"), v_iWeapon), "RDWeapon")
		(c).fields["m_iWeapon"] = R.coerce(v_iWeapon, "int")
		(c).fields["m_iWeaponCocheta"] = R.coerce(v_iWeapon, "int")
	else:
		pass
		(c).fields["m_Weapon"] = R.coerce(R.get_value((c).fields.get("m_WeaponsDiane"), v_iWeapon), "RDWeapon")
		(c).fields["m_iWeapon"] = R.coerce(v_iWeapon, "int")
		(c).fields["m_iWeaponDiane"] = R.coerce(v_iWeapon, "int")
	R.call_member((c).fields.get("m_Weapon"), "OnEquip", [])
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_WeaponChanged")])
	return null

static func f_NextWeapon(c: Variant, a: Array) -> Variant:
	var __t1 = true
	while __t1 or R.truth((R.binary("==", R.get_value((c).fields.get("m_WeaponsCocheta"), (c).fields.get("m_iDesiredWeapon")), null) if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.binary("==", R.get_value((c).fields.get("m_WeaponsDiane"), (c).fields.get("m_iDesiredWeapon")), null))):
		pass
		__t1 = false
		(c).fields["m_iDesiredWeapon"] = R.coerce(R.binary("%", (float((c).fields.get("m_iDesiredWeapon")) + float(1)), (R.get_value((c).fields.get("m_WeaponsCocheta"), "length") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_WeaponsDiane"), "length"))), "int")
	R.call_member(c, "SwitchWeapon", [])
	return null

static func f_PrevWeapon(c: Variant, a: Array) -> Variant:
	var __t2 = true
	while __t2 or R.truth((R.binary("==", R.get_value((c).fields.get("m_WeaponsCocheta"), (c).fields.get("m_iDesiredWeapon")), null) if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.binary("==", R.get_value((c).fields.get("m_WeaponsDiane"), (c).fields.get("m_iDesiredWeapon")), null))):
		pass
		__t2 = false
		R.set_value(c, "m_iDesiredWeapon", 1, "-=")
		if R.truth(R.binary("==", (c).fields.get("m_iDesiredWeapon"), R.unary("-", 1))):
			pass
			(c).fields["m_iDesiredWeapon"] = R.coerce((R.num((R.get_value((c).fields.get("m_WeaponsCocheta"), "length") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_WeaponsDiane"), "length"))) - float(1)), "int")
	R.call_member(c, "SwitchWeapon", [])
	return null

static func f_CanSwitchWeapon(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_bSwitchingDriver")) and R.unary("!", (c).fields.get("m_ClingerSideRight")))
	return null

static func f_SwitchWeapon(c: Variant, a: Array) -> Variant:
	var v_fSwitchWeaponDuration: Variant = NAN
	R.call_member(c, "StopFiring", [])
	R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
	R.call_member((c).fields.get("m_Weapon"), "OnUnequip", [])
	(c).fields["m_bSwitchingWeapon"] = true
	(c).fields["m_fSwitchWeaponTime"] = float(0)
	v_fSwitchWeaponDuration = float((float(R.static_value("RDPlayer", "SwitchWeaponDurationMin")) + float(R.binary("/", (float((((c).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float(R.static_value("RDPlayer", "SwitchWeaponDurationMax")) - float(R.static_value("RDPlayer", "SwitchWeaponDurationMin"))))), 9))))
	(c).fields["m_fSwitchWeaponDuration"] = float(R.binary("/", v_fSwitchWeaponDuration, 2))
	R.call_member((c).fields.get("m_UnequipWeaponSound"), "Play", [])
	R.call_member(c, "LowerGun", [R.binary("/", v_fSwitchWeaponDuration, 3)])
	(c).fields["m_bGunRaising"] = false
	return null

static func f_LowerGun(c: Variant, a: Array) -> Variant:
	var v_fDuration: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_bGunDown"] = true
	(c).fields["m_fGunDownTimer"] = float(0)
	(c).fields["m_fGunDownDuration"] = float(v_fDuration)
	return null

static func f_EndSwitchWeapon(c: Variant, a: Array) -> Variant:
	(c).fields["m_bSwitchingWeapon"] = false
	R.call_member(c, "SetWeapon", [(c).fields.get("m_iDesiredWeapon")])
	R.call_member((c).fields.get("m_EquipWeaponSound"), "Play", [])
	R.call_member(c, "RaiseFiringArm", [])
	R.call_member(c, "UpdateDrivingValues", [])
	return null

static func f_DealBodyDamage(c: Variant, a: Array) -> Variant:
	var v_iToughnessLevel: Variant = 0
	var v_fDamageAbsorbtion: Variant = NAN
	var v_bWasHigh: Variant = false
	var v_fDamage: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fMinHP: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	if R.truth((float((c).fields.get("m_fMedShieldTimer")) > float(0))):
		pass
		v_fDamage = float(0)
		if R.truth(R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "PillsHere")))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "PillsHere")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	v_iToughnessLevel = R.coerce(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")), "int")
	v_fDamageAbsorbtion = float((float(R.static_value("RDPlayer", "BodyDamageAbsorbtionMin")) + float(R.binary("/", (float(v_iToughnessLevel) * float((float(R.static_value("RDPlayer", "BodyDamageAbsorbtionMax")) - float(R.static_value("RDPlayer", "BodyDamageAbsorbtionMin"))))), 9))))
	v_fDamage = R.coerce(R.binary("-", v_fDamage, (float(v_fDamage) * float(v_fDamageAbsorbtion))), "Number")
	v_bWasHigh = (float((c).fields.get("m_fBodyHP")) > float(R.static_value("RDPlayer", "LowHealth")))
	(c).fields["m_fBodyHP"] = float(maxf(float((float((c).fields.get("m_fBodyHP")) - float((float(v_fDamage) * float(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_fBodyDamageMultiplier")))))), float(v_fMinHP)))
	if R.truth((float((c).fields.get("m_fBodyHP")) == float(0))):
		pass
		R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_Shot"), R.static_value("RDPlayer", "DeathType_Crash")])
	if R.truth(((float(v_iDamageType) == float(R.static_value("RDDamageType", "Explosive"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "Missile"))))):
		pass
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "DoExplosionEffect", [])
		(c).fields["m_fCummulativeBodyDamage"] = R.coerce(R.binary("+", (c).fields.get("m_fCummulativeBodyDamage"), v_fDamage), "Number")
		if R.truth(((((float((c).fields.get("m_fCummulativeBodyDamage")) > float(R.static_value("RDPlayer", "LowHealthEffectDamage"))) and (float((c).fields.get("m_fBodyHP")) > float(0))) and R.unary("!", (c).fields.get("m_bFailed"))) and R.unary("!", R.call_member((c).fields.get("m_GameModeGameplay"), "HasActiveStoryDialog", [])))):
			pass
			R.call_member(c, "DoLowHealthEffect", [])
	return null

static func f_UpdateMedShield(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_fMedShieldTimer"] = float(maxf(float((float((c).fields.get("m_fMedShieldTimer")) - float(v_fDeltaTime))), float(0)))
	return null

static func f_ActivateMedShield(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
		pass
		R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedShields", 1, "-=")
	else:
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMedShields", 1, "-=")
	(c).fields["m_fMedShieldTimer"] = float(R.static_value("RDPlayer", "MedShieldDuration"))
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MedSound")])
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleMedShotVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleMedShotVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_ActivateMedHeal(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])):
		pass
		R.set_value((c).fields.get("m_GameModeGameplay"), "m_iCustomMedHeals", 1, "-=")
	else:
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMedHeals", 1, "-=")
	(c).fields["m_fBodyHP"] = float(100)
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "DoHealEffect", [])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MedSound")])
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleMedShotVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleMedShotVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_PlayAnimationSound(c: Variant, a: Array) -> Variant:
	var v_szSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", (c).fields.get("m_bChopperMode")) or (float((c.fields.get("m_vVelocity")).fields.get("Z")) == float(0))) and (((((((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_SpikeStrip")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_OilSlick")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Obstacle")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Ramp")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Building")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Volume")))))
	return null

static func f_Touched(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "HandleTouchSomething", [v_entity])
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) > float(0))):
		pass
		R.call_member(c, "HandleTouchSomething", [v_entity])
	return null

static func f_HandleTouchSomething(c: Variant, a: Array) -> Variant:
	var v_humanoid: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_humanoid = R.coerce(null, "RDHumanoid")
	v_humanoid = R.coerce(R.binary("as", v_entity, R.klass("RDHumanoid")), "RDHumanoid")
	if R.truth(v_humanoid):
		pass
		R.call_member(c, "OnHitHumanoid", [v_humanoid])
		(c).fields["m_bDoingSlipAndSlide"] = false
	else:
		pass
		if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_SpikeStrip")))):
			pass
			R.call_member(c, "OnHitSpikeStrip", [R.binary("as", v_entity, R.klass("RDSpikeStrip"))])
			(c).fields["m_bDoingSlipAndSlide"] = false
		else:
			pass
			if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_OilSlick")))):
				pass
				R.call_member(c, "OnHitOilSlick", [R.binary("as", v_entity, R.klass("RDOilSlick"))])
			else:
				pass
				if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Obstacle")))):
					pass
					R.call_member(c, "OnHitObstacle", [R.binary("as", v_entity, R.klass("RDObstacle"))])
					(c).fields["m_bDoingSlipAndSlide"] = false
	return null

static func f_OnHitHumanoid(c: Variant, a: Array) -> Variant:
	var v_bCling: Variant = false
	var v_bSpoke: Variant = false
	var v_iHitAlign: Variant = 0
	var v_bloodEvent: Variant = null
	var v_humanoid: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	v_bCling = false
	v_bSpoke = false
	v_iHitAlign = R.coerce(0, "int")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	v_bCling = R.coerce(R.call_member(v_humanoid, "HandleCarCollision", [c]), "Boolean")
	if R.truth(v_bCling):
		pass
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitHumanoidCling", 0.1, 0, 0, 0.5])
		(c).fields["m_bReactedToHoodEnemy"] = (float(randf()) < float(0.5))
		if R.truth((c).fields.get("m_bReactedToHoodEnemy")):
			pass
			v_bSpoke = R.coerce(R.call_member(c, "PlayQuadDialog", [(R.static_value("RDPlayer", "m_MaleDriverReactToHoodEnemyVoices") if R.truth((float((v_humanoid).fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_Soldier")))) else null), R.static_value("RDPlayer", "m_MaleGunnerReactToHoodEnemyVoices"), (R.static_value("RDPlayer", "m_FemaleDriverReactToHoodEnemyVoices") if R.truth((float((v_humanoid).fields.get("m_iType")) != float(R.static_value("RDHumanoid", "Type_Soldier")))) else null), R.static_value("RDPlayer", "m_FemaleGunnerReactToHoodEnemyVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")]), "Boolean")
			if R.truth(R.unary("!", v_bSpoke)):
				pass
				(c).fields["m_bReactedToHoodEnemy"] = false
	else:
		pass
		v_iHitAlign = R.coerce(R.call_member(c, "GetHitAlign", [v_humanoid]), "int")
		R.call_member(c, "SpawnDashboardBlood", [v_humanoid, v_iHitAlign])
		v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [R.call_member(c, "GetNbBloodsForAlign", [R.static_value("RDPlayer", "HitAlign_DeadCenter")]), false]), "RDEventBlood")
		R.call_member(c, "DispatchEventObject", [v_bloodEvent])
		R.call_member(c, "HandleBumperHit", [v_humanoid])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitHumanoid", 0.03, 0, 0, 0.5])
		R.call_member(c, "HandleSpeedLoss", [(v_humanoid).fields.get("m_fHitSpeedLoss")])
		if R.truth((float((v_humanoid).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_Civilian")))):
			pass
			(c).fields["m_fPlayHitCivilianVoiceTime"] = float(0.5)
		else:
			pass
			R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverHitEnemyVoices"), R.static_value("RDPlayer", "m_MaleGunnerHitEnemyVoices"), R.static_value("RDPlayer", "m_FemaleDriverHitEnemyVoices"), R.static_value("RDPlayer", "m_FemaleGunnerHitEnemyVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_GetNbBloodsForAlign(c: Variant, a: Array) -> Variant:
	var v_iHitAlign: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center")))):
		pass
		return 3
	if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter")))):
		pass
		return 6
	return 1
	return null

static func f_GetHitAlign(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_bRightSide: Variant = false
	var v_iHitAlign: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_fDistance = float(NAN)
	v_bRightSide = false
	v_iHitAlign = R.coerce(0, "int")
	v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float(((v_entity).fields.get("m_vLocation")).fields.get("X")) - float((c.fields.get("m_vLocation")).fields.get("X")))]), "Number")
	v_bRightSide = (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
	if R.truth((float(v_fDistance) < float(R.static_value("RDPlayer", "DeadCenterHitRange")))):
		pass
		v_iHitAlign = R.coerce(R.static_value("RDPlayer", "HitAlign_DeadCenter"), "int")
	else:
		pass
		if R.truth((float(v_fDistance) < float(R.static_value("RDPlayer", "CenterHitRange")))):
			pass
			v_iHitAlign = R.coerce(R.static_value("RDPlayer", "HitAlign_Center"), "int")
		else:
			pass
			if R.truth((float(v_fDistance) < float(R.static_value("RDPlayer", "FrontSideHitRange")))):
				pass
				v_iHitAlign = R.coerce((R.static_value("RDPlayer", "HitAlign_FrontSideRight") if R.truth(v_bRightSide) else R.static_value("RDPlayer", "HitAlign_FrontSideLeft")), "int")
			else:
				pass
				v_iHitAlign = R.coerce((R.static_value("RDPlayer", "HitAlign_SideRight") if R.truth(v_bRightSide) else R.static_value("RDPlayer", "HitAlign_SideLeft")), "int")
	return v_iHitAlign
	return null

static func f_HandleBumperHit(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_fSpeedRatio = float(NAN)
	if R.truth(((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(0)) or (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0)))):
		pass
		v_fSpeedRatio = float(minf(float((float(R.binary("/", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("Z")]), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1)))
		R.call_member(c, "DealBumperDamage", [v_entity, (float(v_fSpeedRatio) * float((v_entity).fields.get("m_fHitDamage"))), true, (v_entity).fields.get("m_fMinHitHP")])
	return null

static func f_DealBumperDamage(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bDamageEngine: Variant = false
	var v_fBumperHP: Variant = NAN
	var v_waterJug: Variant = null
	var v_beerKeg: Variant = null
	var v_snowman: Variant = null
	var v_fireHydrant: Variant = null
	var v_bumperBreakMC: Variant = null
	var v_iDeathType: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fDamage: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_bFromCollision: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_fMinHP: Variant = R.coerce((a[3] if a.size() > 3 else 0), "Number")
	v_info = R.coerce(null, "RDPlayerInfo")
	v_bDamageEngine = false
	v_fBumperHP = float(NAN)
	v_waterJug = R.coerce(null, "RDObstacleWaterJug")
	v_beerKeg = R.coerce(null, "RDObstacleBeerKeg")
	v_snowman = R.coerce(null, "RDObstacleSnowman")
	v_fireHydrant = R.coerce(null, "RDObstacleFireHydrant")
	v_bumperBreakMC = R.coerce(null, "MovieClip")
	v_iDeathType = R.coerce(0, "int")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bDamageEngine = (float((v_info).fields.get("m_fBumperAddonHP")) == float(0))
	if R.truth(v_bDamageEngine):
		pass
		v_fDamage = R.coerce(R.binary("-", v_fDamage, (float(v_fDamage) * float((c).fields.get("m_fEngineDamageAbsorbtion")))), "Number")
	else:
		pass
		if R.truth((float(v_fDamage) <= float((c).fields.get("m_fBumperDamageCutOff")))):
			pass
			v_fDamage = float(0)
		else:
			pass
			v_fDamage = R.coerce(R.binary("-", v_fDamage, (float(v_fDamage) * float((c).fields.get("m_fBumperDamageAbsorbtion")))), "Number")
	v_fDamage = R.coerce(R.binary("*", v_fDamage, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_fVehicleDamageMultiplier")), "Number")
	if R.truth(R.unary("!", ((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer"))):
		pass
		v_fDamage = R.coerce(R.binary("*", v_fDamage, 1.2), "Number")
	v_fBumperHP = R.coerce(((v_info).fields.get("m_fBumperHP") if R.truth(v_bDamageEngine) else (v_info).fields.get("m_fBumperAddonHP")), "Number")
	if R.truth(((float(v_fMinHP) > float(0)) and (float((float(v_fBumperHP) - float(v_fDamage))) < float(v_fMinHP)))):
		pass
		v_fDamage = float(maxf(float((float(v_fBumperHP) - float(v_fMinHP))), float(0)))
	v_fBumperHP = float(maxf(float((float(v_fBumperHP) - float(v_fDamage))), float(0)))
	if R.truth((v_bDamageEngine and R.truth(v_entity))):
		pass
		v_waterJug = R.coerce(R.binary("as", v_entity, R.klass("RDObstacleWaterJug")), "RDObstacleWaterJug")
		v_beerKeg = R.coerce(R.binary("as", v_entity, R.klass("RDObstacleBeerKeg")), "RDObstacleBeerKeg")
		v_snowman = R.coerce(R.binary("as", v_entity, R.klass("RDObstacleSnowman")), "RDObstacleSnowman")
		v_fireHydrant = R.coerce(R.binary("as", v_entity, R.klass("RDObstacleFireHydrant")), "RDObstacleFireHydrant")
		if R.truth(((R.truth(R.logical_or(v_waterJug, func(): return v_beerKeg)) or R.truth(v_snowman)) or (R.truth(v_fireHydrant) and R.truth((v_fireHydrant).fields.get("m_bFlowing"))))):
			pass
			if R.truth((c).fields.get("m_bIsOnFire")):
				pass
				(c).fields["m_bIsOnFire"] = false
				R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BurningEngineSound")])
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
				if R.truth((float(randf()) > float(0.5))):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleExtinguishFireVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleExtinguishFireVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
				v_fBumperHP = float(maxf(float(v_fBumperHP), float((float(R.static_value("RDPlayer", "BumperBroken3MinHP")) + float(1)))))
				if R.truth(R.unary("!", (c).fields.get("m_bFailed"))):
					pass
					if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
						pass
						R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iFiresPutOut", 1, "+=")
					if R.truth(((R.truth(R.logical_and(v_fireHydrant, func(): return (v_fireHydrant).fields.get("m_bFlowing"))) and R.truth((v_fireHydrant).fields.get("m_bManualFlow"))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "HydroficiallyEvolved"))))):
						pass
						R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "HydroficiallyEvolved")])
						R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
			else:
				pass
				if R.truth((c).fields.get("m_bIsOnSmoke")):
					pass
					(c).fields["m_bIsOnSmoke"] = false
					R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
					v_fBumperHP = float(maxf(float(v_fBumperHP), float((float(R.static_value("RDPlayer", "BumperBroken2MinHP")) - float(1)))))
			R.call_member(c, "HideAllDashboardBloods", [])
			R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_Hud"), "HideEyeBloods", [])
	if R.truth((float(v_fBumperHP) == float(0))):
		pass
		if R.truth((float((c).fields.get("m_iBumperLevel")) > float(0))):
			pass
			v_bumperBreakMC = R.coerce((R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Bumper"), "BreakAddon") if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")) else R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "BumperCar"), "BreakAddon")), "MovieClip")
			R.set_value(v_bumperBreakMC, "visible", true, "=")
			R.invoke(R.get_value(v_bumperBreakMC, "gotoAndPlay"), [1])
			(c).fields["m_iBumperLevel"] = R.coerce(0, "int")
			R.call_member(c, "UpdateBumperValues", [])
		else:
			pass
			if R.truth(v_bFromCollision):
				pass
				if R.truth(v_entity):
					pass
					R.call_member(c, "MoveBeforeEntity", [v_entity])
				else:
					pass
					R.set_value(c.fields.get("m_vLocation"), "Z", 1, "-=")
			v_iDeathType = R.coerce(R.static_value("RDPlayer", "DeathType_Crash"), "int")
			R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_Explosion"), v_iDeathType])
	if R.truth(v_bDamageEngine):
		pass
		(v_info).fields["m_fBumperHP"] = float(v_fBumperHP)
	else:
		pass
		(v_info).fields["m_fBumperAddonHP"] = float(v_fBumperHP)
	R.call_member(c, "UpdateBumperVisual", [])
	return null

static func f_UpdateBumperVisual(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_iBumperFrame: Variant = 0
	var v_iBumperAddonFrame: Variant = 0
	var v_bWasSmoking: Variant = false
	var v_bWasBurning: Variant = false
	var v_bPlaySounds: Variant = R.coerce((a[0] if a.size() > 0 else true), "Boolean")
	v_info = R.coerce(null, "RDPlayerInfo")
	v_iBumperFrame = R.coerce(0, "int")
	v_iBumperAddonFrame = R.coerce(0, "int")
	v_bWasSmoking = false
	v_bWasBurning = false
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
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
	if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Bumper"), "gotoAndStop"), [(float(v_iBumperFrame) + float(1))])
	else:
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "BumperCar"), "gotoAndStop"), [(float(v_iBumperFrame) + float(1))])
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
	if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Bumper"), "Addon"), "gotoAndStop"), [(float(v_iBumperAddonFrame) + float(1))])
	else:
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "BumperCar"), "Addon"), "gotoAndStop"), [(float(v_iBumperAddonFrame) + float(1))])
	v_bWasSmoking = R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible"))
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible", ((float((c).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Smoke")))), "=")
	if R.truth((R.unary("!", v_bWasSmoking) and R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Smoke"), "visible")))):
		pass
		(c).fields["m_bIsOnSmoke"] = true
		if R.truth(v_bPlaySounds):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
	v_bWasBurning = R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible"))
	R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible", ((float((c).fields.get("m_iBumperLevel")) == float(0)) and (float(v_iBumperFrame) >= float(R.static_value("RDPlayer", "BumperStage_Fire")))), "=")
	if R.truth((R.unary("!", v_bWasBurning) and R.truth(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "Fire"), "visible")))):
		pass
		(c).fields["m_bIsOnFire"] = true
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BurningEngineSound"), true])
		if R.truth(v_bPlaySounds):
			pass
			if R.truth((float(randf()) > float(0.5))):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleCarOnFireVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Gameplay")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleCarOnFireVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Gameplay")])
	return null

static func f_HideAllDashboardBloods(c: Variant, a: Array) -> Variant:
	var v_iNbBloods: Variant = 0
	var v_i: Variant = 0
	var v_bloodMC: Variant = null
	v_iNbBloods = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_bloodMC = R.coerce(null, "MovieClip")
	v_iNbBloods = R.coerce(R.coerce(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "numChildren"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbBloods))):
		pass
		v_bloodMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		R.set_value(v_bloodMC, "m_fAlpha", 0, "=")
		R.set_value(v_bloodMC, "alpha", 0, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_SpawnDashboardBlood(c: Variant, a: Array) -> Variant:
	var v_bloods: Variant = null
	var v_iBlood: Variant = 0
	var v_bloodMC: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iHitAlign: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_bloods = R.coerce(null, "Array")
	v_iBlood = R.coerce(0, "int")
	v_bloodMC = R.coerce(null, "MovieClip")
	v_bloods = R.coerce(null, "Array")
	if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center"))))):
		pass
		v_bloods = R.coerce((c).fields.get("m_DashboardCenterBloods"), "Array")
	else:
		pass
		if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft")))):
			pass
			v_bloods = R.coerce((c).fields.get("m_DashboardFrontSideLeftBloods"), "Array")
		else:
			pass
			if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight")))):
				pass
				v_bloods = R.coerce((c).fields.get("m_DashboardFrontSideRightBloods"), "Array")
			else:
				pass
				if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideLeft")))):
					pass
					v_bloods = R.coerce((c).fields.get("m_DashboardSideLeftBloods"), "Array")
				else:
					pass
					if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideRight")))):
						pass
						v_bloods = R.coerce((c).fields.get("m_DashboardSideRightBloods"), "Array")
	v_iBlood = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value(v_bloods, "length")]), "int")
	v_bloodMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value(v_bloods, v_iBlood)]), "MovieClip")
	if R.truth(R.binary("!=", R.get_value(v_bloodMC, "alpha"), 1)):
		pass
		R.set_value(v_bloodMC, "m_fAlpha", 2, "=")
		R.set_value(v_bloodMC, "alpha", 1, "=")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		(c).fields["m_fFemaleArmBloodLevel"] = float(minf(float((float((c).fields.get("m_fFemaleArmBloodLevel")) + float(R.static_value("RDPlayer", "ArmBloodRate")))), float(100)))
	else:
		pass
		(c).fields["m_fMaleArmBloodLevel"] = float(minf(float((float((c).fields.get("m_fMaleArmBloodLevel")) + float(R.static_value("RDPlayer", "ArmBloodRate")))), float(100)))
	return null

static func f_GetClingChance(c: Variant, a: Array) -> Variant:
	var v_fBaseEngineSpeeds: Variant = NAN
	var v_fSpeedRatio: Variant = NAN
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_clinger: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDHumanoid")
	v_fBaseEngineSpeeds = float(NAN)
	v_fSpeedRatio = float(NAN)
	if R.truth(((R.truth(v_bLeft) and R.truth(R.call_member(c, "IsClingerSpotTaken", [true]))) or (R.truth(R.unary("!", v_bLeft)) and R.truth(R.call_member(c, "IsClingerSpotTaken", [false]))))):
		pass
		return 0
	if R.truth(((c).fields.get("m_GameModeGameplay")).fields.get("m_bAlwaysCling")):
		pass
		return 1
	v_fBaseEngineSpeeds = float(R.num(R.get_value(R.static_value("RDPlayer", "EngineSpeeds"), 3)))
	v_fSpeedRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((c.fields.get("m_vVelocity")).fields.get("Z")) - float(R.static_value("RDPlayer", "MinClingSpeed"))), (float(v_fBaseEngineSpeeds) - float(R.static_value("RDPlayer", "MinClingSpeed")))), 0, 1]), "Number")
	return (float((float(1) - float(v_fSpeedRatio))) * float((v_clinger).fields.get("m_fClingChanceMultiplier")))
	return null

static func f_DoClingerBump(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_fBumpStrength"] = float(0.5)
	(c).fields["m_fBumpSpeed"] = R.coerce((R.static_value("RDPlayer", "XBumpSpeedMax") if R.truth(v_bLeft) else R.unary("-", R.static_value("RDPlayer", "XBumpSpeedMax"))), "Number")
	(c).fields["m_fBumpDeccel"] = float(R.static_value("RDPlayer", "XBumpDeccelMax"))
	(c).fields["m_fBumpDeccel"] = R.coerce(R.binary("-", (c).fields.get("m_fBumpDeccel"), (float((float((c).fields.get("m_fBumpDeccel")) * float(0.9))) * float(R.binary("/", (R.num(R.call_member((c).fields.get("m_GameModeGameplay"), "GetBounceFactor", [])) - float(1)), 9)))), "Number")
	return null

static func f_SetClinger(c: Variant, a: Array) -> Variant:
	var v_bHadTwoSideClinger: Variant = false
	var v_bHasTwoSideClinger: Variant = false
	var v_bHasNoSideClinger: Variant = false
	var v_bHadTwoClingers: Variant = false
	var v_bHasTwoClingers: Variant = null
	var v_bHasNoClinger: Variant = false
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	var v_bLeft: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bSide: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	v_bHadTwoSideClinger = false
	v_bHasTwoSideClinger = false
	v_bHasNoSideClinger = false
	v_bHadTwoClingers = false
	v_bHasTwoClingers = R.coerce(null, "*")
	v_bHasNoClinger = false
	if R.truth(v_bSide):
		pass
		v_bHadTwoSideClinger = (R.binary("!=", (c).fields.get("m_ClingerSideLeft"), null) and R.binary("!=", (c).fields.get("m_ClingerSideRight"), null))
		if R.truth(v_bLeft):
			pass
			if R.truth((R.truth((c).fields.get("m_ClingerSideLeft")) and R.truth(((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMC")))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMC"), "stop"), [])
			(c).fields["m_ClingerSideLeft"] = R.coerce(v_clinger, "RDHumanoid")
			if R.truth(v_clinger):
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
				R.call_member(c, "StopHorning", [])
				(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
				R.call_member(c, "PlaySideClingVoice", [true])
			else:
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
		else:
			pass
			if R.truth((R.truth((c).fields.get("m_ClingerSideRight")) and R.truth(((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMC")))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMC"), "stop"), [])
			(c).fields["m_ClingerSideRight"] = R.coerce(v_clinger, "RDHumanoid")
			if R.truth(v_clinger):
				pass
				(c).fields["m_bSwitchingWeapon"] = false
				R.call_member(c, "StopFiring", [])
				R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
				R.call_member(c, "LowerGun", [0.25])
				(c).fields["m_bGunRaising"] = false
				R.call_member(c, "PlaySideClingVoice", [false])
			else:
				pass
				R.call_member(c, "RaiseFiringArm", [])
		v_bHasTwoSideClinger = (R.binary("!=", (c).fields.get("m_ClingerSideLeft"), null) and R.binary("!=", (c).fields.get("m_ClingerSideRight"), null))
		v_bHasNoSideClinger = (R.binary("==", (c).fields.get("m_ClingerSideLeft"), null) and R.binary("==", (c).fields.get("m_ClingerSideRight"), null))
		if R.truth((v_bHasTwoSideClinger and R.unary("!", v_bHadTwoSideClinger))):
			pass
			(c).fields["m_bStartMutantSandwich"] = true
		else:
			pass
			if R.truth(((c).fields.get("m_bStartMutantSandwich") and v_bHasNoSideClinger)):
				pass
				(c).fields["m_bStartMutantSandwich"] = false
				if R.truth(R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "MutantSandwich")))):
					pass
					R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "MutantSandwich")])
					R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	else:
		pass
		if R.truth(v_clinger):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_UndeadTactics")])
		v_bHadTwoClingers = (R.binary("!=", (c).fields.get("m_ClingerLeft"), null) and R.binary("!=", (c).fields.get("m_ClingerRight"), null))
		if R.truth(v_bLeft):
			pass
			if R.truth((R.truth((c).fields.get("m_ClingerLeft")) and R.truth(((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMC")))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMC"), "stop"), [])
			(c).fields["m_ClingerLeft"] = R.coerce(v_clinger, "RDHumanoid")
		else:
			pass
			if R.truth((R.truth((c).fields.get("m_ClingerRight")) and R.truth(((c).fields.get("m_ClingerRight")).fields.get("m_ClingMC")))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_ClingerRight")).fields.get("m_ClingMC"), "stop"), [])
			(c).fields["m_ClingerRight"] = R.coerce(v_clinger, "RDHumanoid")
		v_bHasTwoClingers = R.coerce((R.binary("!=", (c).fields.get("m_ClingerLeft"), null) and R.binary("!=", (c).fields.get("m_ClingerRight"), null)), "*")
		v_bHasNoClinger = (R.binary("==", (c).fields.get("m_ClingerLeft"), null) and R.binary("==", (c).fields.get("m_ClingerRight"), null))
		if R.truth((R.truth(v_bHasTwoClingers) and R.unary("!", v_bHadTwoClingers))):
			pass
			(c).fields["m_bStartWhenOurPowersCombine"] = true
			(c).fields["m_iWhenOurPowersCombineSwitches"] = R.coerce(0, "int")
		else:
			pass
			if R.truth(((c).fields.get("m_bStartWhenOurPowersCombine") and v_bHasNoClinger)):
				pass
				(c).fields["m_bStartWhenOurPowersCombine"] = false
				if R.truth(((float((c).fields.get("m_iWhenOurPowersCombineSwitches")) == float(1)) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "WhenOurPowersCombine"))))):
					pass
					R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "WhenOurPowersCombine")])
					R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	if R.truth(v_clinger):
		pass
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iTotalClingers", 1, "+=")
		(c).fields["m_bStartedPerfectDefense"] = false
	return null

static func f_GetClingerMC(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	if R.truth((v_clinger).fields.get("m_bClingLeft")):
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleNewLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleNewLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieHard")))):
			pass
			return (c).fields.get("m_ClingerZombieHardLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieSoldier")))):
			pass
			return (c).fields.get("m_ClingerZombieSoldierLeft")
		if R.truth((v_clinger).fields.get("m_bSideCling")):
			pass
			return (c).fields.get("m_SideGrapplerLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			return (c).fields.get("m_ClingerZombieVeryHardLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_Soldier")))):
			pass
			return (c).fields.get("m_ClingerSoldierLeft")
	else:
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleNewRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleNewRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieHard")))):
			pass
			return (c).fields.get("m_ClingerZombieHardRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieSoldier")))):
			pass
			return (c).fields.get("m_ClingerZombieSoldierRight")
		if R.truth((v_clinger).fields.get("m_bSideCling")):
			pass
			return (c).fields.get("m_SideGrapplerRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			return (c).fields.get("m_ClingerZombieVeryHardRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_Soldier")))):
			pass
			return (c).fields.get("m_ClingerSoldierRight")
	return null
	return null

static func f_GetClingerMCInside(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	if R.truth((v_clinger).fields.get("m_bClingLeft")):
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleNewInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleNewInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieHard")))):
			pass
			return (c).fields.get("m_ClingerZombieHardInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieSoldier")))):
			pass
			return (c).fields.get("m_ClingerZombieSoldierInsideLeft")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			return ((c).fields.get("m_SideGrapplerLeft") if R.truth((v_clinger).fields.get("m_bSideCling")) else (c).fields.get("m_ClingerZombieVeryHardInsideLeft"))
	else:
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemale")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalMaleNewInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew")))):
			pass
			return (c).fields.get("m_ClingerZombieNormalFemaleNewInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieHard")))):
			pass
			return (c).fields.get("m_ClingerZombieHardInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieSoldier")))):
			pass
			return (c).fields.get("m_ClingerZombieSoldierInsideRight")
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))):
			pass
			return ((c).fields.get("m_SideGrapplerRight") if R.truth((v_clinger).fields.get("m_bSideCling")) else (c).fields.get("m_ClingerZombieVeryHardInsideRight"))
	return null
	return null

static func f_GetClingerMCUnder(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	if R.truth((v_clinger).fields.get("m_bClingLeft")):
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubLeftUnder")
	else:
		pass
		if R.truth((float((v_clinger).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieGrub")))):
			pass
			return (c).fields.get("m_ClingerZombieGrubRightUnder")
	return null
	return null

static func f_StartFailSequence(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDeathType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c).fields.get("m_bFailed")):
		pass
		return null
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_iCivsInCar"] = R.coerce(0, "int")
	if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iTotalDeaths", 1, "+=")
	(c).fields["m_bFailed"] = true
	(c).fields["m_iFailType"] = R.coerce(v_iType, "int")
	c.fields["m_fDepthPosition"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	c.fields["m_bHasCustomDepthPosition"] = false
	R.call_member(c, "UpdateDepthPosition", [])
	(c).fields["m_bGoForward"] = false
	(c).fields["m_bGoBackward"] = false
	(c).fields["m_bSteeringLeft"] = false
	(c).fields["m_bSteeringRight"] = false
	(c).fields["m_bHandBraking"] = false
	R.call_member(c, "CancelTask", [false])
	(c).fields["m_bStartMutantSandwich"] = false
	R.call_member(c, "StopHorning", [])
	R.call_member(c, "StopVoiceSound", [])
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	if R.truth((c).fields.get("m_DriverHasLowHealthVoice")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DriverHasLowHealthVoice")])
		(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth((float(v_iType) == float(R.static_value("RDPlayer", "FailType_Explosion")))):
		pass
		if R.truth(R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarInterior")])):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_MCCarInterior")])
		if R.truth(R.unary("!", R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarBack")]))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "addChild"), [(c).fields.get("m_MCCarBack")])
		R.call_member(c, "StopFiring", [])
		R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
		(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Exploded"), "int")
		R.call_member(c.fields.get("m_vVelocity"), "SetZero", [])
		(c).fields["m_fBumpStrength"] = float(0)
		R.invoke(R.get_value((c).fields.get("m_MCCarBack"), "gotoAndPlay"), [("Explosion" if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")) else "ExplosionCar")])
		R.call_member(c, "StopRadioComm", [])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_GrassSound")])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_LavaSound")])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_TireScrapingSound")])
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_SmokingEngineSound")])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BurningEngineSound"), true])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["ExplosionFailure", 0.2, 0, 0, 1])
		R.call_member(c, "RemoveClinger", [true, false])
		R.call_member(c, "RemoveClinger", [false, false])
		R.call_member(c, "RemoveClinger", [true, true])
		R.call_member(c, "RemoveClinger", [false, true])
		if R.truth((float(v_iDeathType) != float(R.static_value("RDPlayer", "DeathType_MissingEnding")))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iDeathsByExplosion", 1, "+=")
	else:
		pass
		if R.truth((float(randf()) < float(0.5))):
			pass
			(c).fields["m_bSteeringLeft"] = true
		else:
			pass
			(c).fields["m_bSteeringRight"] = true
		R.call_member(R.static_value("RDGame", "Instance"), "DoFlash", [1, 0.25])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
		R.call_member(c, "StopRadioComm", [])
		if R.truth((float(v_iType) == float(R.static_value("RDPlayer", "FailType_ZombieKill")))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iDeathsByZombie", 1, "+=")
			if R.truth((c).fields.get("m_bZombieKilledDriver")):
				pass
				if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleDriverDeathScreamVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
				else:
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleDriverDeathScreamVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
			else:
				pass
				if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleGunnerDeathScreamVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
				else:
					pass
					R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleGunnerDeathScreamVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
			(c).fields["m_DeathWeapon"] = R.coerce((c).fields.get("m_Weapon"), "RDWeapon")
			if R.truth((((R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponRocketLauncher")) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMountedMG"))) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_CustomWeaponRocketLauncher"))) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_CustomWeaponMountedMG")))):
				pass
				(c).fields["m_DeathWeapon"] = R.coerce(((c).fields.get("m_WeaponPistolCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_WeaponPistolDiane")), "RDWeapon")
			R.call_member(c, "ResetDeathWeaponSoundDelay", [])
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDPlayer", "FailType_Shot")))):
				pass
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iDeathsByGunShot", 1, "+=")
				R.call_member(c, "StopFiring", [])
				R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
				(c).fields["m_bHandBraking"] = false
				R.call_member(c, "StopHorning", [])
				R.call_member(c, "LowerGun", [0.5])
				(c).fields["m_bGunRaising"] = false
				(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
				if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
				(c).fields["m_bPlayDriverDeathVoice"] = true
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDPlayer", "FailType_BodyKill")))):
					pass
					R.call_member(c, "StopFiring", [])
					R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
					(c).fields["m_bHandBraking"] = false
					R.call_member(c, "StopHorning", [])
					R.call_member(c, "LowerGun", [0.5])
					(c).fields["m_bGunRaising"] = false
					(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
					if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
					(c).fields["m_bPlayDriverDeathVoice"] = true
	(R.static_value("RDGame", "Instance")).fields["m_iLastDeathType"] = R.coerce(v_iDeathType, "int")
	R.call_member(R.static_value("RDGame", "Instance"), "PlayCustomMusic", [(R.static_value("RDGame", "Instance")).fields.get("m_TenseMusic"), 0, true])
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_Failed")])
	return null

static func f_RemoveClinger(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bSide: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(v_bSide):
		pass
		if R.truth((v_bLeft and R.truth((c).fields.get("m_ClingerSideLeft")))):
			pass
			R.call_member((c).fields.get("m_ClingerSideLeft"), "ForceRemove", [])
		else:
			pass
			if R.truth((R.unary("!", v_bLeft) and R.truth((c).fields.get("m_ClingerSideRight")))):
				pass
				R.call_member((c).fields.get("m_ClingerSideRight"), "ForceRemove", [])
	else:
		pass
		if R.truth((v_bLeft and R.truth((c).fields.get("m_ClingerLeft")))):
			pass
			R.call_member((c).fields.get("m_ClingerLeft"), "ForceRemove", [])
		else:
			pass
			if R.truth((R.unary("!", v_bLeft) and R.truth((c).fields.get("m_ClingerRight")))):
				pass
				R.call_member((c).fields.get("m_ClingerRight"), "ForceRemove", [])
	return null

static func f_OnHitSpikeStrip(c: Variant, a: Array) -> Variant:
	var v_spikeStrip: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSpikeStrip")
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitSpikeStrip", 0.05, 0, 0, 0.5])
	if R.truth((float((c).fields.get("m_iNbBlownTires")) == float(4))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_TireAlreadyBlownSound")])
	else:
		pass
		R.call_member(c, "DealTireDamage", [R.get_value(R.static_value("RDPlayer", "TireSpikeDamages"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel"))])
	R.call_member(c, "StartTireBias", [])
	return null

static func f_DealTireDamage(c: Variant, a: Array) -> Variant:
	var v_iPreviousBlownTires: Variant = 0
	var v_fSpeedRatio: Variant = NAN
	var v_fTireDamage: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iPreviousBlownTires = R.coerce(0, "int")
	v_fSpeedRatio = float(NAN)
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_TireBlowSound")])
	if R.truth(R.unary("!", R.call_member((c).fields.get("m_TireScrapingSound"), "IsPlaying", []))):
		pass
		(c).fields["m_TireScrapingShake"] = R.coerce(R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["TireScraping", 1, 0, R.unary("-", 1), 0]), "RDCameraShake")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_TireScrapingSound"), true])
	v_iPreviousBlownTires = R.coerce((c).fields.get("m_iNbBlownTires"), "int")
	(R.static_value("RDPlayerInfo", "Instance")).fields["m_fNbBlownTires"] = float(minf(float((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires")) + float(v_fTireDamage))), float(4)))
	(c).fields["m_iNbBlownTires"] = R.coerce(floorf(float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fNbBlownTires"))), "int")
	if R.truth((float((c).fields.get("m_iNbBlownTires")) != float(v_iPreviousBlownTires))):
		pass
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_iTiresBlown"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresBlown"), (float((c).fields.get("m_iNbBlownTires")) - float(v_iPreviousBlownTires))), "int")
	R.call_member(c, "UpdateTireValues", [])
	v_fSpeedRatio = float(minf(float((float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1)))
	((c).fields.get("m_TireScrapingShake")).fields["m_fShakeIntensity"] = float((float(v_fSpeedRatio) * float((c).fields.get("m_fMaxBlownTireShake"))))
	R.call_member((c).fields.get("m_TireScrapingSound"), "SetMaxVolume", [(float(v_fSpeedRatio) * float((c).fields.get("m_fMaxBlownTireVolume")))])
	if R.truth((float((c).fields.get("m_iNbBlownTires")) == float(4))):
		pass
		if R.truth((float(randf()) > float(0.5))):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleBlownTiresVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Gameplay")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleBlownTiresVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Gameplay")])
	return null

static func f_StartTireBias(c: Variant, a: Array) -> Variant:
	(c).fields["m_bTireBiasRight"] = (float(randf()) > float(0.5))
	(c).fields["m_fTireBiasTimer"] = float(0)
	(c).fields["m_fTireBiasDuration"] = float((float((c).fields.get("m_fTireBiasDurationMin")) + float((float(randf()) * float((c).fields.get("m_fTireBiasDurationRandom"))))))
	(c).fields["m_fTargetTireBiasStrength"] = float((float((float((c).fields.get("m_fTireBiasStrengthMin")) + float((float(randf()) * float((c).fields.get("m_fTireBiasStrengthRandom")))))) * R.num((1 if R.truth((c).fields.get("m_bTireBiasRight")) else R.unary("-", 1)))))
	return null

static func f_UpdateTireValues(c: Variant, a: Array) -> Variant:
	(c).fields["m_fMaxBlownTireVolume"] = float((float(0.7) + float((float((float((c).fields.get("m_iNbBlownTires")) - float(1))) * float(0.1)))))
	(c).fields["m_fMaxBlownTireShake"] = float((float(0.002) + float((float((float((c).fields.get("m_iNbBlownTires")) - float(1))) * float(0.001)))))
	(c).fields["m_fTireBiasDurationMin"] = R.coerce(R.get_value(R.static_value("RDPlayer", "TireBiasDurationMins"), (float((c).fields.get("m_iNbBlownTires")) - float(1))), "Number")
	(c).fields["m_fTireBiasDurationRandom"] = R.coerce(R.get_value(R.static_value("RDPlayer", "TireBiasDurationRandoms"), (float((c).fields.get("m_iNbBlownTires")) - float(1))), "Number")
	(c).fields["m_fTireBiasStrengthMin"] = R.coerce(R.get_value(R.static_value("RDPlayer", "TireBiasStrengthMins"), (float((c).fields.get("m_iNbBlownTires")) - float(1))), "Number")
	(c).fields["m_fTireBiasStrengthRandom"] = R.coerce(R.get_value(R.static_value("RDPlayer", "TireBiasStrengthRandoms"), (float((c).fields.get("m_iNbBlownTires")) - float(1))), "Number")
	(c).fields["m_fBlownTireControlFactor"] = R.coerce(R.get_value(R.static_value("RDPlayer", "BlownTireControlFactors"), (float((c).fields.get("m_iNbBlownTires")) - float(1))), "Number")
	return null

static func f_OnHitOilSlick(c: Variant, a: Array) -> Variant:
	var v_oilSlick: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDOilSlick")
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_OilSlickSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitOilSlick", 0.03, 0, 0, 0.5])
	(c).fields["m_fOilDuration"] = float((R.num(R.get_value(R.static_value("RDPlayer", "OilDurations"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel"))) * float(maxf(float(R.binary("/", ((c).fields.get("m_GameModeGameplay")).fields.get("m_fOilSlipperinessFactor"), 2)), float(1)))))
	(c).fields["m_fOilTime"] = float((c).fields.get("m_fOilDuration"))
	(c).fields["m_fOilFactor"] = float((float(1) - float(pow(float((float(1) - float(R.binary("/", (c).fields.get("m_fOilTime"), (c).fields.get("m_fOilDuration"))))), float(R.static_value("RDPlayer", "OilFactorPower"))))))
	(c).fields["m_fOilControlFactor"] = R.coerce(R.get_value(R.static_value("RDPlayer", "OilControlFactor"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iTiresLevel")), "Number")
	(c).fields["m_fOilControlFactor"] = R.coerce(R.binary("-", (c).fields.get("m_fOilControlFactor"), (float((c).fields.get("m_fOilControlFactor")) * float(R.binary("/", (float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fOilSlipperinessFactor")) - float(1)), 10)))), "Number")
	(c).fields["m_bDoingSlipAndSlide"] = true
	return null

static func f_OnHitObstacle(c: Variant, a: Array) -> Variant:
	var v_fSpeedRatio: Variant = NAN
	var v_fShakeStrength: Variant = NAN
	var v_iToughnessPoints: Variant = 0
	var v_fShake: Variant = NAN
	var v_collisionSounds: Variant = null
	var v_iHitAlign: Variant = 0
	var v_collisionSound: Variant = null
	var v_fMaxBumpSpeed: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fDeltaX: Variant = NAN
	var v_obstacle: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacle")
	v_fSpeedRatio = float(NAN)
	v_fShakeStrength = float(NAN)
	v_iToughnessPoints = R.coerce(0, "int")
	v_fShake = float(NAN)
	v_collisionSounds = R.coerce(null, "RandomHat")
	v_iHitAlign = R.coerce(0, "int")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_fMaxBumpSpeed = float(NAN)
	v_fNewX = float(NAN)
	v_fDeltaX = float(NAN)
	v_fSpeedRatio = float(minf(float((float(R.binary("/", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("Z")]), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1)))
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	else:
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitObstacle", (float((float((v_obstacle).fields.get("m_fHitShakeIntensity")) * float(v_fSpeedRatio))) * float(v_fShakeStrength)), 0, 0, (float((float((v_obstacle).fields.get("m_fHitShakeDuration")) * float(v_fSpeedRatio))) * float(v_fShakeStrength))])
	R.call_member(v_obstacle, "OnPlayerHit", [c])
	if R.truth((R.unary("!", (v_obstacle).fields.get("m_bCanBeRunThrough")) or (v_obstacle).fields.get("m_bDoGoThroughBump"))):
		pass
		v_fShake = float(0)
		if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "HugeCollisionSpeed")))):
			pass
			v_collisionSounds = R.coerce((c).fields.get("m_HugeCollisionSounds"), "RandomHat")
			if R.truth((float(randf()) < float(0.25))):
				pass
				if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				if R.truth((float(randf()) > float(0.5))):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			R.call_member(c, "AddHandlingInfluence", [(float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X"))), 1])
			v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForHugeCollision"), "int")
		else:
			pass
			if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "HardCollisionSpeed")))):
				pass
				v_collisionSounds = R.coerce((c).fields.get("m_HardCollisionSounds"), "RandomHat")
				if R.truth((float(randf()) < float(0.2))):
					pass
					if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					if R.truth((float(randf()) > float(0.5))):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				R.call_member(c, "AddHandlingInfluence", [(float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X"))), 0.75])
				v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForHardCollision"), "int")
			else:
				pass
				if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "MediumCollisionSpeed")))):
					pass
					v_collisionSounds = R.coerce((c).fields.get("m_MediumCollisionSounds"), "RandomHat")
					if R.truth((float(randf()) > float(0.5))):
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					else:
						pass
						R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
					R.call_member(c, "AddHandlingInfluence", [(float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X"))), 0.5])
					v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForMediumCollision"), "int")
				else:
					pass
					v_collisionSounds = R.coerce((c).fields.get("m_LightCollisionSounds"), "RandomHat")
					R.call_member(c, "AddHandlingInfluence", [(float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X"))), 0.25])
					v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForLightCollision"), "int")
		v_iHitAlign = R.coerce(R.call_member(c, "GetHitAlign", [v_obstacle]), "int")
		if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center"))))):
			pass
			R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, true])
			R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, false])
		else:
			pass
			if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideLeft"))))):
				pass
				R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")])
			else:
				pass
				if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideRight"))))):
					pass
					R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))])
		v_collisionSound = R.coerce(R.binary("as", R.call_member(v_collisionSounds, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
		if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
			pass
			v_fMaxBumpSpeed = float((float(R.static_value("RDPlayer", "XBumpSpeedMin")) + float(R.binary("/", (R.num(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth((v_obstacle).fields.get("m_bAllowBumpReduction")) else R.binary("/", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), 2))) * float((float(R.static_value("RDPlayer", "XBumpSpeedMax")) - float(R.static_value("RDPlayer", "XBumpSpeedMin"))))), 9))))
			(c).fields["m_fBumpDeccel"] = float((float(R.static_value("RDPlayer", "XBumpDeccelMin")) + float(R.binary("/", (R.num(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth((v_obstacle).fields.get("m_bAllowBumpReduction")) else R.binary("/", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), 2))) * float((float(R.static_value("RDPlayer", "XBumpDeccelMax")) - float(R.static_value("RDPlayer", "XBumpDeccelMin"))))), 9))))
		else:
			pass
			v_fMaxBumpSpeed = float((float(R.static_value("RDPlayer", "XBumpSpeedMin")) + float(R.binary("/", (R.num(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel") if R.truth((v_obstacle).fields.get("m_bAllowBumpReduction")) else R.binary("/", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), 2))) * float((float(R.static_value("RDPlayer", "XBumpSpeedMax")) - float(R.static_value("RDPlayer", "XBumpSpeedMin"))))), 9))))
			(c).fields["m_fBumpDeccel"] = float((float(R.static_value("RDPlayer", "XBumpDeccelMin")) + float(R.binary("/", (R.num(((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel") if R.truth((v_obstacle).fields.get("m_bAllowBumpReduction")) else R.binary("/", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"), 2))) * float((float(R.static_value("RDPlayer", "XBumpDeccelMax")) - float(R.static_value("RDPlayer", "XBumpDeccelMin"))))), 9))))
		(c).fields["m_fBumpDeccel"] = R.coerce(R.binary("-", (c).fields.get("m_fBumpDeccel"), (float((float((c).fields.get("m_fBumpDeccel")) * float(0.9))) * float(R.binary("/", (R.num(R.call_member((c).fields.get("m_GameModeGameplay"), "GetBounceFactor", [])) - float(1)), 9)))), "Number")
		(c).fields["m_fBumpStrength"] = float((float(1) * R.num(R.call_member(c, "GetBumpStrengthRatioFromSpeed", []))))
		(c).fields["m_fBumpSpeed"] = float((float((R.num(R.call_member(v_obstacle, "GetBumpDirection", [c])) * float(v_fMaxBumpSpeed))) * R.num(R.call_member(c, "GetBumpSpeedRatioFromSpeed", []))))
		if R.truth((v_obstacle).fields.get("m_bForceFullBump")):
			pass
			if R.truth(R.binary("<", ((v_obstacle).fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [((v_obstacle).fields.get("m_vLocation")).fields.get("Z")]))):
				pass
				v_fNewX = float((float((float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) + float(((v_obstacle).fields.get("m_CollisionBounds")).fields.get("X")))) + float(((v_obstacle).fields.get("m_CollisionBounds")).fields.get("W"))))
			else:
				pass
				v_fNewX = float((float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) + float(((v_obstacle).fields.get("m_CollisionBounds")).fields.get("X"))))
			v_fDeltaX = float((float(v_fNewX) - float((c.fields.get("m_vLocation")).fields.get("X"))))
			(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c.fields.get("m_vLocation")).fields.get("X"), v_fDeltaX), "Number")
			(c).fields["m_fRelativeLocationX"] = R.coerce(R.binary("+", (c).fields.get("m_fRelativeLocationX"), v_fDeltaX), "Number")
		if R.truth((v_obstacle).fields.get("m_bCausesImpactShards")):
			pass
			if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center"))))):
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactCenter"])
			else:
				pass
				if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft")))):
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactFrontLeft"])
				else:
					pass
					if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight")))):
						pass
						R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactFrontRight"])
					else:
						pass
						if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideLeft")))):
							pass
							R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactSideLeft"])
						else:
							pass
							if R.truth((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideRight")))):
								pass
								R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactSideRight"])
	R.call_member(c, "HandleSpeedLoss", [(v_obstacle).fields.get("m_fHitSpeedLoss")])
	R.call_member(c, "HandleBumperHit", [v_obstacle])
	if R.truth((R.unary("!", (v_obstacle).fields.get("m_bCanBeRunThrough")) and ((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(0)) or (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0))))):
		pass
		if R.truth((c).fields.get("m_ClingerLeft")):
			pass
			R.call_member((c).fields.get("m_ClingerLeft"), "OnDirectCollision", [v_fSpeedRatio, (float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))])
		if R.truth((c).fields.get("m_ClingerRight")):
			pass
			R.call_member((c).fields.get("m_ClingerRight"), "OnDirectCollision", [v_fSpeedRatio, (float(((v_obstacle).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))])
	return null

static func f_HandleOutofStreetCollision(c: Variant, a: Array) -> Variant:
	var v_fRoadLimit: Variant = NAN
	var v_fSpeedRatio: Variant = NAN
	var v_fShakeStrength: Variant = NAN
	var v_iToughnessPoints: Variant = 0
	var v_collisionSounds: Variant = null
	var v_collisionSound: Variant = null
	var v_fShake: Variant = NAN
	v_fRoadLimit = float(NAN)
	v_fSpeedRatio = float(NAN)
	v_fShakeStrength = float(NAN)
	v_iToughnessPoints = R.coerce(0, "int")
	v_collisionSounds = R.coerce(null, "RandomHat")
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_fRoadLimit = R.coerce(R.call_member(((c).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "GetSideLimit", []), "Number")
	v_fSpeedRatio = float(minf(float((float(R.binary("/", R.call_static("Maths", "AbsNumber", [(c.fields.get("m_vVelocity")).fields.get("Z")]), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1)))
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	else:
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["HitObstacle", (float((float(0.2) * float(v_fSpeedRatio))) * float(v_fShakeStrength)), 0, 0, (float((float(1) * float(v_fSpeedRatio))) * float(v_fShakeStrength))])
	v_fShake = float(0)
	if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "HugeCollisionSpeed")))):
		pass
		v_collisionSounds = R.coerce((c).fields.get("m_HugeCollisionSounds"), "RandomHat")
		if R.truth((float(randf()) < float(0.25))):
			pass
			if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			if R.truth((float(randf()) > float(0.5))):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		R.call_member(c, "AddHandlingInfluence", [(float((c.fields.get("m_vLocation")).fields.get("X")) > float(v_fRoadLimit)), 1])
		v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForHugeCollision"), "int")
	else:
		pass
		if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "HardCollisionSpeed")))):
			pass
			v_collisionSounds = R.coerce((c).fields.get("m_HardCollisionSounds"), "RandomHat")
			if R.truth((float(randf()) < float(0.2))):
				pass
				if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleGunnerHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				if R.truth((float(randf()) > float(0.5))):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			R.call_member(c, "AddHandlingInfluence", [(float((c.fields.get("m_vLocation")).fields.get("X")) > float(v_fRoadLimit)), 0.75])
			v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForHardCollision"), "int")
		else:
			pass
			if R.truth((float((c.fields.get("m_vVelocity")).fields.get("Z")) >= float(R.static_value("RDPlayer", "MediumCollisionSpeed")))):
				pass
				v_collisionSounds = R.coerce((c).fields.get("m_MediumCollisionSounds"), "RandomHat")
				if R.truth((float(randf()) > float(0.5))):
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				else:
					pass
					R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
				R.call_member(c, "AddHandlingInfluence", [(float((c.fields.get("m_vLocation")).fields.get("X")) > float(v_fRoadLimit)), 0.5])
				v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForMediumCollision"), "int")
			else:
				pass
				v_collisionSounds = R.coerce((c).fields.get("m_LightCollisionSounds"), "RandomHat")
				R.call_member(c, "AddHandlingInfluence", [(float((c.fields.get("m_vLocation")).fields.get("X")) > float(v_fRoadLimit)), 0.25])
				v_iToughnessPoints = R.coerce(R.static_value("RDPlayer", "ToughnessPointsForLightCollision"), "int")
	R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, true])
	R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, false])
	v_collisionSound = R.coerce(R.binary("as", R.call_member(v_collisionSounds, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
	(c).fields["m_fBumpDeccel"] = float(R.static_value("RDPlayer", "XBumpDeccelMax"))
	(c).fields["m_fBumpDeccel"] = R.coerce(R.binary("-", (c).fields.get("m_fBumpDeccel"), (float((float((c).fields.get("m_fBumpDeccel")) * float(0.9))) * float(R.binary("/", (R.num(R.call_member((c).fields.get("m_GameModeGameplay"), "GetBounceFactor", [])) - float(1)), 9)))), "Number")
	(c).fields["m_fBumpStrength"] = float((float(1) * R.num(R.call_member(c, "GetBumpStrengthRatioFromSpeed", []))))
	(c).fields["m_fBumpSpeed"] = float((float((R.num((R.unary("-", 1) if R.truth((float((c).fields.get("m_fRelativeLocationX")) > float(v_fRoadLimit))) else 1)) * float(R.static_value("RDPlayer", "XBumpSpeedMax")))) * R.num(R.call_member(c, "GetBumpSpeedRatioFromSpeed", []))))
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ImpactShards"), "gotoAndPlay"), ["ImpactCenter"])
	R.call_member(c, "HandleSpeedLoss", [0.3])
	if R.truth(((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(0)) or (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0)))):
		pass
		R.call_member(c, "DealBumperDamage", [null, (float(v_fSpeedRatio) * float(20)), true, 0])
	if R.truth(((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(0)) or (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperAddonHP")) > float(0)))):
		pass
		if R.truth((c).fields.get("m_ClingerLeft")):
			pass
			R.call_member((c).fields.get("m_ClingerLeft"), "OnDirectCollision", [v_fSpeedRatio, (float((c).fields.get("m_fRelativeLocationX")) > float(v_fRoadLimit))])
		if R.truth((c).fields.get("m_ClingerRight")):
			pass
			R.call_member((c).fields.get("m_ClingerRight"), "OnDirectCollision", [v_fSpeedRatio, (float((c).fields.get("m_fRelativeLocationX")) > float(v_fRoadLimit))])
	return null

static func f_AddHandlingInfluence(c: Variant, a: Array) -> Variant:
	var v_fWeaponInfluence: Variant = NAN
	var v_fInfluenceX: Variant = NAN
	var v_fInfluenceY: Variant = NAN
	var v_bRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fStrength: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fWeaponInfluence = float(NAN)
	v_fInfluenceX = float(NAN)
	v_fInfluenceY = float(NAN)
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_fWeaponInfluence = float((R.num(R.call_member((c).fields.get("m_Weapon"), "GetHandlingInfluence", [])) * float(v_fStrength)))
	v_fInfluenceX = R.coerce((v_fWeaponInfluence if R.truth(v_bRight) else R.unary("-", v_fWeaponInfluence)), "Number")
	v_fInfluenceY = float((R.num((v_fWeaponInfluence if R.truth((float(randf()) > float(0.5))) else R.unary("-", v_fWeaponInfluence))) * float(0.5)))
	(c).fields["m_fHandlingInfluenceX"] = R.coerce(R.binary("+", (c).fields.get("m_fHandlingInfluenceX"), v_fInfluenceX), "Number")
	(c).fields["m_fHandlingInfluenceY"] = R.coerce(R.binary("+", (c).fields.get("m_fHandlingInfluenceY"), v_fInfluenceY), "Number")
	return null

static func f_SetFullSpeedMode(c: Variant, a: Array) -> Variant:
	var v_bFullSpeed: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("!=", v_bFullSpeed, (c).fields.get("m_bFullSpeedMode"))):
		pass
		(c).fields["m_bFullSpeedMode"] = v_bFullSpeed
		if R.truth((c).fields.get("m_bFullSpeedMode")):
			pass
			if R.truth((float((c).fields.get("m_iEngineState")) != float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))):
				pass
				(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Accel"), "int")
				(c).fields["m_fEngineTime"] = float(R.binary("/", R.static_value("RDPlayer", "MaxAccelTimeAccel"), (float((c).fields.get("m_fEngineScale")) * R.num(R.call_member(c, "GetEngineRatio", [])))))
				R.call_member(c, "UpdateGear", [])
				R.call_member(c, "UpdateSound", [true])
				(c.fields.get("m_vVelocity")).fields["Z"] = float((float((R.num(R.call_member(c, "GetCurrentSpeedRatio", [])) * float((c).fields.get("m_fMaxSpeed")))) * float((c).fields.get("m_fMaxSpeedFactor"))))
	return null

static func f_HandleSpeedLoss(c: Variant, a: Array) -> Variant:
	var v_fSpeedLoss: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bFullSpeedMode")):
		pass
		return null
	v_fSpeedLoss = float(minf(float((float(v_fSpeedLoss) * float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fImpactSpeedLossFactor")))), float(0.9)))
	if R.truth((float(v_fSpeedLoss) > float(0))):
		pass
		(c).fields["m_iOldEngineState"] = R.coerce((c).fields.get("m_iEngineState"), "int")
		if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_Accel")))):
			pass
			(c).fields["m_fEngineTime"] = float(maxf(float((float((c).fields.get("m_fEngineTime")) - float((float((float(v_fSpeedLoss) * float((c).fields.get("m_fBumperSpeedLossFactor")))) * float((c).fields.get("m_fEngineTime")))))), float(0)))
		else:
			pass
			if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))):
				pass
				(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Accel"), "int")
				(c).fields["m_fEngineTime"] = float(R.binary("/", R.static_value("RDPlayer", "MaxAccelTimeAccel"), (float((c).fields.get("m_fEngineScale")) * R.num(R.call_member(c, "GetEngineRatio", [])))))
				(c).fields["m_fEngineTime"] = float(maxf(float((float((c).fields.get("m_fEngineTime")) - float((float((float(v_fSpeedLoss) * float((c).fields.get("m_fBumperSpeedLossFactor")))) * float((c).fields.get("m_fEngineTime")))))), float(0)))
			else:
				pass
				if R.truth(((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelNoBrake"))) or (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelHandBrake"))))):
					pass
					(c).fields["m_fEngineTime"] = float(minf(float((float((c).fields.get("m_fEngineTime")) + float((float((float(v_fSpeedLoss) * float((c).fields.get("m_fBumperSpeedLossFactor")))) * float((float(R.static_value("RDPlayer", "MaxAccelTimeDeccelNoBrake")) - float((c).fields.get("m_fEngineTime")))))))), float(R.static_value("RDPlayer", "MaxAccelTimeDeccelNoBrake"))))
				else:
					pass
					if R.truth((float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_DeccelBrake")))):
						pass
						(c).fields["m_fEngineTime"] = float(minf(float((float((c).fields.get("m_fEngineTime")) + float((float((float(v_fSpeedLoss) * float((c).fields.get("m_fBumperSpeedLossFactor")))) * float((float(R.static_value("RDPlayer", "MaxAccelTimeDeccelBrake")) - float((c).fields.get("m_fEngineTime")))))))), float(R.static_value("RDPlayer", "MaxAccelTimeDeccelBrake"))))
		R.call_member(c, "UpdateGear", [])
		R.call_member(c, "UpdateSound", [true])
		(c.fields.get("m_vVelocity")).fields["Z"] = float((float((R.num(R.call_member(c, "GetCurrentSpeedRatio", [])) * float((c).fields.get("m_fMaxSpeed")))) * float((c).fields.get("m_fMaxSpeedFactor"))))
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_bulletHitFleshSound: Variant = null
	var v_bloodEvent: Variant = null
	var v_fDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_bulletHitFleshSound = R.coerce(null, "DTSpacialSound")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	if R.truth(((c).fields.get("m_bFailed") or (c).fields.get("m_bInEnding"))):
		pass
		return null
	v_bulletHitFleshSound = R.coerce(R.get_value((c).fields.get("m_BulletHitFleshSounds"), (c).fields.get("m_iBulletHitFleshIndex")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_bulletHitFleshSound])
	(c).fields["m_iBulletHitFleshIndex"] = R.coerce(R.binary("%", (float((c).fields.get("m_iBulletHitFleshIndex")) + float(1)), 3), "int")
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [R.call_member(c, "GetNbBloodsForAlign", [R.static_value("RDPlayer", "HitAlign_None")]), true]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleBulletHitVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleBulletHitVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	R.call_member(c, "DealBodyDamage", [v_fDamage, v_iDamageType])
	if R.truth((float((c).fields.get("m_fBodyHP")) == float(0))):
		pass
		if R.truth((float(v_iDamageType) == float(R.static_value("RDDamageType", "HelicopterBullet")))):
			pass
			R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_Shot"), R.static_value("RDPlayer", "DeathType_Helicopter")])
		else:
			pass
			R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_Shot"), R.static_value("RDPlayer", "DeathType_Military")])
	if R.truth(((float(v_iDamageType) == float(R.static_value("RDDamageType", "HelicopterBullet"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "SoldierMachineGunBullet"))))):
		pass
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["BulletHit", 0.01, 0, 0, 0.3])
	else:
		pass
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["BulletHardHit", 0.04, 0, 0, 0.3])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_fMaxBumpSpeed: Variant = NAN
	var v_fShakeStrength: Variant = NAN
	var v_fMinBumperHP: Variant = NAN
	var v_fMinHP: Variant = NAN
	var v_collisionSound: Variant = null
	var v_iToughnessPoints: Variant = 0
	var v_iHitAlign: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_fMaxBumpSpeed = float(NAN)
	v_fShakeStrength = float(NAN)
	v_fMinBumperHP = float(NAN)
	v_fMinHP = float(NAN)
	v_collisionSound = R.coerce(null, "DTSpacialSound")
	v_iToughnessPoints = R.coerce(0, "int")
	v_iHitAlign = R.coerce(0, "int")
	if R.truth((((c).fields.get("m_bFailed") or (c).fields.get("m_bInEnding")) or (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float((c).fields.get("m_iLastExplosionTick")))) < float(15)))):
		pass
		return null
	v_iDamage = R.coerce(R.binary("*", v_iDamage, R.static_value("RDPlayer", "ExplosionDamageFactor")), "int")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_iDamage = R.coerce(R.binary("-", v_iDamage, (float(v_iDamage) * R.num(R.get_value(R.static_value("RDPlayer", "ToughnessDamageReduction"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel"))))), "int")
	else:
		pass
		v_iDamage = R.coerce(R.binary("-", v_iDamage, (float(v_iDamage) * R.num(R.get_value(R.static_value("RDPlayer", "ToughnessDamageReduction"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel"))))), "int")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_fMaxBumpSpeed = float((float(R.static_value("RDPlayer", "XBumpExplosionSpeedMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpExplosionSpeedMax")) - float(R.static_value("RDPlayer", "XBumpExplosionSpeedMin"))))), 9))))
		(c).fields["m_fBumpDeccel"] = float((float(R.static_value("RDPlayer", "XBumpExplosionDeccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpExplosionDeccelMax")) - float(R.static_value("RDPlayer", "XBumpExplosionDeccelMin"))))), 9))))
	else:
		pass
		v_fMaxBumpSpeed = float((float(R.static_value("RDPlayer", "XBumpSpeedMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpSpeedMax")) - float(R.static_value("RDPlayer", "XBumpSpeedMin"))))), 9))))
		(c).fields["m_fBumpDeccel"] = float((float(R.static_value("RDPlayer", "XBumpDeccelMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpDeccelMax")) - float(R.static_value("RDPlayer", "XBumpDeccelMin"))))), 9))))
	(c).fields["m_fBumpDeccel"] = R.coerce(R.binary("-", (c).fields.get("m_fBumpDeccel"), (float((float((c).fields.get("m_fBumpDeccel")) * float(0.9))) * float(R.binary("/", (R.num(R.call_member((c).fields.get("m_GameModeGameplay"), "GetBounceFactor", [])) - float(1)), 9)))), "Number")
	(c).fields["m_fBumpStrength"] = float(1)
	(c).fields["m_fBumpSpeed"] = float((R.num((R.unary("-", v_fMaxBumpSpeed) if R.truth((float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))) else v_fMaxBumpSpeed)) * float(v_fDamageRatio)))
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	else:
		pass
		v_fShakeStrength = float((float(R.static_value("RDPlayer", "XBumpShakeMin")) + float(R.binary("/", (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")) * float((float(R.static_value("RDPlayer", "XBumpShakeMax")) - float(R.static_value("RDPlayer", "XBumpShakeMin"))))), 9))))
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosion", (float((float(0.2) * float(v_fShakeStrength))) * float(v_fDamageRatio)), 0, 0, 1])
	v_fMinBumperHP = R.coerce((5 if R.truth(((float((c).fields.get("m_iBumperLevel")) == float(0)) and (float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(5)))) else 0), "Number")
	R.call_member(c, "DealBumperDamage", [v_entity, (float(R.static_value("RDPlayer", "ExplosionBumperDamage")) * float(v_fDamageRatio)), false, v_fMinBumperHP])
	if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_fBumperHP")) > float(0))):
		pass
		if R.truth((c).fields.get("m_ClingerLeft")):
			pass
			R.call_member((c).fields.get("m_ClingerLeft"), "OnForceGetOff", [])
		if R.truth((c).fields.get("m_ClingerRight")):
			pass
			R.call_member((c).fields.get("m_ClingerRight"), "OnForceGetOff", [])
	v_fMinHP = R.coerce((0 if R.truth((float((c).fields.get("m_fBodyHP")) <= float(R.static_value("RDPlayer", "LowHealth")))) else R.static_value("RDPlayer", "MinExplosionBodyHP")), "Number")
	R.call_member(c, "DealBodyDamage", [v_iDamage, v_iDamageType, v_fMinHP])
	if R.truth((float(v_fDamageRatio) > float(0.7))):
		pass
		if R.truth((float(randf()) > float(0.5))):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHugeCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		if R.truth((float(v_fDamageRatio) > float(0.5))):
			pass
			if R.truth((float(randf()) > float(0.5))):
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
			else:
				pass
				R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHardCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	if R.truth((float(v_fDamageRatio) > float(0.2))):
		pass
		if R.truth((float(randf()) > float(0.5))):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleMediumCollisionGruntVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	v_collisionSound = R.coerce(R.binary("as", R.call_member((c).fields.get("m_HugeCollisionSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_collisionSound])
	v_iToughnessPoints = R.coerce((float(v_iDamage) * float(R.static_value("RDPlayer", "ToughnessPerExplosionDamage"))), "int")
	v_iHitAlign = R.coerce(R.call_member(c, "GetHitAlign", [v_entity]), "int")
	if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_DeadCenter"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_Center"))))):
		pass
		R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, true])
		R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, false])
	else:
		pass
		if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideLeft"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideLeft"))))):
			pass
			R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")])
		else:
			pass
			if R.truth(((float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_FrontSideRight"))) or (float(v_iHitAlign) == float(R.static_value("RDPlayer", "HitAlign_SideRight"))))):
				pass
				R.call_member(c, "AddToughnessPoints", [v_iToughnessPoints, R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))])
	(c).fields["m_iLastExplosionTick"] = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "int")
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_Explosion"), R.static_value("RDPlayer", "DeathType_None")])
	return null

static func f_OnHitFeeders(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_feeder: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacleCorpse")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_Center")])
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	R.call_member(c, "SpawnDashboardBlood", [v_feeder, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [10, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnFeedersHit", [])
	return null

static func f_OnRollOverGrub(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_zombie).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [5, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_OnHitZombieForBlood(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_zombie).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [2, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_OnHitSoldierForBlood(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_soldier).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [2, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_OnHitBody(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_body: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_body).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_body, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [2, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_OnKilledByZombie(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	(c).fields["m_bZombieKilledDriver"] = (float(((v_zombie).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))
	R.call_member(c, "StartFailSequence", [R.static_value("RDPlayer", "FailType_ZombieKill"), R.static_value("RDPlayer", "DeathType_Zombie")])
	return null

static func f_MoveBeforeEntity(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	(c.fields.get("m_vLocation")).fields["Z"] = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float(0.5)))
	R.call_member(c, "UpdateDepthPosition", [])
	return null

static func f_OnHelicopterArrived(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayHelicopterVoice", [])
	return null

static func f_OnHelicopterDefeated(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnJetPassed(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayJetPassedVoice", [])
	return null

static func f_OnJetComing(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayJetComingVoice", [])
	return null

static func f_OnPreciseZombieHit(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	if R.truth((float(randf()) > float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemalePrecisionHitVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_zombie).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_zombie, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [5, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_OnGibSoldier(c: Variant, a: Array) -> Variant:
	var v_bloodEvent: Variant = null
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	if R.truth((float(randf()) > float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemalePrecisionHitVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MalePrecisionHitVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_DeadCenter")])
	R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_Center")])
	if R.truth((float(((v_soldier).fields.get("m_vLocation")).fields.get("X")) < float((c.fields.get("m_vLocation")).fields.get("X")))):
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	else:
		pass
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
		R.call_member(c, "SpawnDashboardBlood", [v_soldier, R.static_value("RDPlayer", "HitAlign_SideRight")])
	v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [5, false]), "RDEventBlood")
	R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_PlayRadioComm(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	var v_iPriority: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((c).fields.get("m_Dialog")):
		pass
		return null
	if R.truth(((R.unary("!", (c).fields.get("m_RadioCommSound")) or R.unary("!", R.call_member((c).fields.get("m_RadioCommSound"), "IsPlaying", []))) or (float(v_iPriority) > float((c).fields.get("m_iRadioCommPriority"))))):
		pass
		R.call_member(c, "StopRadioComm", [])
		(c).fields["m_RadioCommSound"] = R.coerce(v_sound, "DTSpacialSound")
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_RadioCommSound")])
		(c).fields["m_iRadioCommPriority"] = R.coerce(v_iPriority, "int")
	return null

static func f_StopRadioComm(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_RadioCommSound")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_RadioCommSound")])
		(c).fields["m_RadioCommSound"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_HasRadioCommPlaying(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_RadioCommSound")), func(): return R.call_member((c).fields.get("m_RadioCommSound"), "IsPlaying", []))
	return null

static func f_UpdateAchievements(c: Variant, a: Array) -> Variant:
	var v_bInFuckWheels: Variant = false
	v_bInFuckWheels = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth((R.unary("!", (c).fields.get("m_bDeathRaceStarted")) and (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed"))))):
		pass
		(c).fields["m_fDeathRaceStartPos"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_bDeathRaceStarted"] = (float((c).fields.get("m_iEngineState")) == float(R.static_value("RDPlayer", "EngineState_MaxSpeed")))
	if R.truth((c).fields.get("m_bDeathRaceStarted")):
		pass
		if R.truth((R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "DeathRace"))) and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fDeathRaceStartPos")))) >= float(R.static_value("RDAchievement", "DeathRaceDistance"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "DeathRace")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	v_bInFuckWheels = ((R.unary("!", (c).fields.get("m_bFailed")) and R.unary("!", (c).fields.get("m_bInEnding"))) and (float((c).fields.get("m_iNbBlownTires")) == float(4)))
	if R.truth((R.unary("!", (c).fields.get("m_bFuckWheelsStarted")) and v_bInFuckWheels)):
		pass
		(c).fields["m_fFuckWheelsStartPos"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	(c).fields["m_bFuckWheelsStarted"] = v_bInFuckWheels
	if R.truth((c).fields.get("m_bFuckWheelsStarted")):
		pass
		if R.truth((R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "FuckWheels"))) and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((c).fields.get("m_fFuckWheelsStartPos")))) >= float(R.static_value("RDAchievement", "FuckWheelsDistance"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "FuckWheels")])
			R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_CacheAsBitmap(c: Variant, a: Array) -> Variant:
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value((c).fields.get("m_MCCarInterior"), "Interior")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ChopperInside"), "Doors")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood4")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood5")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood6")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood7")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood8")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood9")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood10")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood11")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood12")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "DashboardBloods"), "Blood13")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleClosed"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleClosed"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleClosed"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleOpen"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleOpen"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "MaleOpen"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleClosed"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleClosed"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleClosed"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleOpen"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleOpen"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "FemaleOpen"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleClosed"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleClosed"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleClosed"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleOpen"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleOpen"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "MaleOpen"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleClosed"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleClosed"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleClosed"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleOpen"), "Blood1")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleOpen"), "Blood2")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "FemaleOpen"), "Blood3")])
	R.call_static("DTGraphicUtils", "CacheAsBitmap", [R.get_value((c).fields.get("m_MCCarBack"), "Hummer")])
	return null

static func f_CanSwitchDriver(c: Variant, a: Array) -> Variant:
	return R.logical_and(((((R.unary("!", (c).fields.get("m_bSwitchingDriver")) and (float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None")))) and R.unary("!", (c).fields.get("m_ClingerSideLeft"))) and R.unary("!", (c).fields.get("m_ClingerSideRight"))) and (float((c).fields.get("m_fLowHealthTimer")) == float(0))), func(): return R.call_member((c).fields.get("m_GameModeGameplay"), "SwitchDriverEnabled", []))
	return null

static func f_SwitchDriver(c: Variant, a: Array) -> Variant:
	var v_fDuration: Variant = NAN
	v_fDuration = float(NAN)
	R.call_member(c, "StopFiring", [])
	R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
	(c).fields["m_bSwitchingWeapon"] = false
	R.call_member(c, "StopHorning", [])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsDownFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsDownMale")])
	v_fDuration = float(R.num(R.get_value(R.static_value("RDPlayer", "SwitchDriverDuration"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDriverSwitchLevel"))))
	R.call_member((c).fields.get("m_UnequipWeaponSound"), "Play", [])
	R.call_member(c, "LowerGun", [R.binary("/", v_fDuration, 2)])
	(c).fields["m_bGunRaising"] = false
	(c).fields["m_iLeftHandState"] = R.coerce(R.static_value("RDPlayer", "HandState_Down"), "int")
	(c).fields["m_bSwitchingDriver"] = true
	(c).fields["m_fSwitchDriverTime"] = float(0)
	(c).fields["m_bSwitchDriverPlayDoorSounds"] = ((float((c.fields.get("m_vVelocity")).fields.get("Z")) == float(0)) and R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "IsChopperMode", [])))
	if R.truth((c).fields.get("m_bSwitchDriverPlayDoorSounds")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorOpenSound")])
	if R.truth((c).fields.get("m_bChopperMode")):
		pass
		if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleChopperSwitchVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleChopperSwitchVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverSwitchSeatVoices"), R.static_value("RDPlayer", "m_MaleGunnerSwitchSeatVoices"), R.static_value("RDPlayer", "m_FemaleDriverSwitchSeatVoices"), R.static_value("RDPlayer", "m_FemaleGunnerSwitchSeatVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
	R.set_value(c, "m_iWhenOurPowersCombineSwitches", 1, "+=")
	return null

static func f_EndSwitchDriver(c: Variant, a: Array) -> Variant:
	(c).fields["m_fMaleArmBloodLevel"] = float(0)
	(c).fields["m_fFemaleArmBloodLevel"] = float(0)
	(R.static_value("RDGame", "Instance")).fields["m_bIsFemale"] = R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))
	(c).fields["m_bSwitchingDriver"] = false
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "RightArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
	R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "LeftArm"), "gotoAndPlay"), [("HandsUpFemale" if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else "HandsUpMale")])
	if R.truth((c).fields.get("m_bSwitchDriverPlayDoorSounds")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorCloseSound")])
	R.call_member(c, "SetWeapon", [((c).fields.get("m_iWeaponCocheta") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else (c).fields.get("m_iWeaponDiane"))])
	R.call_member((c).fields.get("m_EquipWeaponSound"), "Play", [])
	R.call_member(c, "RaiseFiringArm", [])
	return null

static func f_RaiseFiringArm(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_Weapon")):
		pass
		R.call_member((c).fields.get("m_Weapon"), "OnEquip", [])
	(c).fields["m_bGunRaising"] = true
	(c).fields["m_fGunRaiseTimer"] = float(0)
	(c).fields["m_fGunRaiseDuration"] = R.coerce((R.binary("/", (float(R.static_value("RDPlayer", "SwitchWeaponDurationMin")) + float(R.binary("/", (float((((c).fields.get("m_Weapon")).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float(R.static_value("RDPlayer", "SwitchWeaponDurationMax")) - float(R.static_value("RDPlayer", "SwitchWeaponDurationMin"))))), 9))), 3) if R.truth((c).fields.get("m_Weapon")) else 0.1), "Number")
	return null

static func f_OnFiringArmRaised(c: Variant, a: Array) -> Variant:
	(c).fields["m_bGunDown"] = false
	(c).fields["m_bGunRaising"] = false
	return null

static func f_OnBulletHitInterior(c: Variant, a: Array) -> Variant:
	var v_bulletCollisionMC: Variant = null
	var v_effectClass: Variant = null
	var v_hitEffect: Variant = null
	var v_fScale: Variant = NAN
	var v_effectSound: Variant = null
	var v_hitPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "Point")
	v_bulletCollisionMC = R.coerce(null, "MovieClip")
	v_effectClass = R.coerce(null, "Class")
	v_hitEffect = R.coerce(null, "MovieClip")
	v_fScale = float(NAN)
	v_effectSound = R.coerce(null, "DTSpacialSound")
	v_bulletCollisionMC = R.coerce(R.call_member(c, "GetInteriorBulletCollisionMC", []), "MovieClip")
	R.set_value(c.fields.get("m_BulletHitPos"), "x", R.get_value(v_hitPos, "x"), "=")
	R.set_value(c.fields.get("m_BulletHitPos"), "y", R.get_value(v_hitPos, "y"), "=")
	c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(v_bulletCollisionMC, "globalToLocal"), [c.fields.get("m_BulletHitPos")]), "Point")
	v_effectClass = R.coerce(R.get_value((c).fields.get("m_BulletHitInteriorEffects"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_BulletHitInteriorEffects"), "length")])), "Class")
	v_hitEffect = R.coerce(R.call_static("RDGame", "GetMC", [v_effectClass]), "MovieClip")
	R.set_value(v_hitEffect, "m_owner", c, "=")
	R.set_value(v_hitEffect, "x", R.get_value(c.fields.get("m_BulletHitPos"), "x"), "=")
	R.set_value(v_hitEffect, "y", R.get_value(c.fields.get("m_BulletHitPos"), "y"), "=")
	R.set_value(v_hitEffect, "rotation", (float(randf()) * float(360)), "=")
	v_fScale = float((float(0.7) + float((float(randf()) * float(0.6)))))
	R.set_value(v_hitEffect, "scaleX", v_fScale, "=")
	R.set_value(v_hitEffect, "scaleY", v_fScale, "=")
	R.invoke(R.get_value(v_hitEffect, "play"), [])
	R.invoke(R.get_value(v_bulletCollisionMC, "addChild"), [v_hitEffect])
	v_effectSound = R.coerce(R.get_value((c).fields.get("m_BulletHitInteriorSounds"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_BulletHitInteriorSounds"), "length")])), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_effectSound])
	return null

static func f_OnBulletHitClinger(c: Variant, a: Array) -> Variant:
	var v_bHit: Variant = false
	var v_clingerMC: Variant = null
	var v_bHeadShotBlocked: Variant = false
	var v_bTorsoShotBlocked: Variant = false
	var v_effects: Variant = null
	var v_sounds: Variant = null
	var v_effectClass: Variant = null
	var v_hitEffect: Variant = null
	var v_fScale: Variant = NAN
	var v_effectSound: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[1] if a.size() > 1 else null), "Point")
	var v_clinger: Variant = R.coerce((a[2] if a.size() > 2 else null), "RDHumanoid")
	v_bHit = false
	v_clingerMC = R.coerce(null, "MovieClip")
	v_bHeadShotBlocked = false
	v_bTorsoShotBlocked = false
	v_effects = R.coerce(null, "Array")
	v_sounds = R.coerce(null, "Array")
	v_effectClass = R.coerce(null, "Class")
	v_hitEffect = R.coerce(null, "MovieClip")
	v_fScale = float(NAN)
	v_effectSound = R.coerce(null, "DTSpacialSound")
	v_bHit = false
	R.set_value(c.fields.get("m_BulletHitPos"), "x", R.get_value(v_hitPos, "x"), "=")
	R.set_value(c.fields.get("m_BulletHitPos"), "y", R.get_value(v_hitPos, "y"), "=")
	v_clingerMC = R.coerce(R.call_member(c, "GetClingerMC", [v_clinger]), "MovieClip")
	v_bHeadShotBlocked = false
	v_bTorsoShotBlocked = false
	if R.truth((R.truth(R.get_value(v_clingerMC, "Head")) and R.truth(R.get_value(R.get_value(v_clingerMC, "Head"), "BulletCollision")))):
		pass
		v_bHit = R.truth(R.invoke(R.get_value(R.get_value(R.get_value(v_clingerMC, "Head"), "BulletCollision"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))
		if R.truth(v_bHit):
			pass
			v_bHeadShotBlocked = R.coerce(R.call_member(v_clinger, "DamageHead", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")]), "Boolean")
	else:
		pass
		if R.truth((R.truth(R.get_value(v_clingerMC, "Head2")) and R.truth(R.get_value(R.get_value(v_clingerMC, "Head2"), "BulletCollision")))):
			pass
			v_bHit = R.truth(R.invoke(R.get_value(R.get_value(R.get_value(v_clingerMC, "Head2"), "BulletCollision"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))
			if R.truth(v_bHit):
				pass
				v_bHeadShotBlocked = R.coerce(R.call_member(v_clinger, "DamageHead", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")]), "Boolean")
		else:
			pass
			if R.truth((R.truth(R.get_value(v_clingerMC, "Head3")) and R.truth(R.get_value(R.get_value(v_clingerMC, "Head3"), "BulletCollision")))):
				pass
				v_bHit = R.truth(R.invoke(R.get_value(R.get_value(R.get_value(v_clingerMC, "Head3"), "BulletCollision"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))
				if R.truth(v_bHit):
					pass
					v_bHeadShotBlocked = R.coerce(R.call_member(v_clinger, "DamageHead", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")]), "Boolean")
			else:
				pass
				if R.truth((R.truth(R.get_value(v_clingerMC, "Head4")) and R.truth(R.get_value(R.get_value(v_clingerMC, "Head4"), "BulletCollision")))):
					pass
					v_bHit = R.truth(R.invoke(R.get_value(R.get_value(R.get_value(v_clingerMC, "Head4"), "BulletCollision"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))
					if R.truth(v_bHit):
						pass
						v_bHeadShotBlocked = R.coerce(R.call_member(v_clinger, "DamageHead", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")]), "Boolean")
	if R.truth(R.unary("!", (v_clinger).fields.get("m_bSideCling"))):
		pass
		if R.truth(((R.truth(R.unary("!", v_bHit)) and R.truth(R.get_value(v_clingerMC, "Torso"))) and R.truth(R.get_value(R.get_value(v_clingerMC, "Torso"), "BulletCollision")))):
			pass
			v_bHit = R.truth(R.invoke(R.get_value(R.get_value(R.get_value(v_clingerMC, "Torso"), "BulletCollision"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))
			if R.truth(v_bHit):
				pass
				v_bTorsoShotBlocked = R.coerce(R.call_member(v_clinger, "DamageTorso", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")]), "Boolean")
		if R.truth(R.unary("!", v_bHit)):
			pass
			v_bHit = ((((R.truth(R.get_value(v_clingerMC, "LeftArm")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "LeftArm"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))) or (R.truth(R.get_value(v_clingerMC, "LeftForearm")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "LeftForearm"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true])))) or (R.truth(R.get_value(v_clingerMC, "LeftHand")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "LeftHand"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true])))) or (R.truth(R.get_value(v_clingerMC, "LeftForearm2")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "LeftForearm2"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))))
			if R.truth(v_bHit):
				pass
				R.call_member(v_clinger, "DamageLeftArm", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")])
			else:
				pass
				v_bHit = ((((R.truth(R.get_value(v_clingerMC, "RightArm")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "RightArm"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))) or (R.truth(R.get_value(v_clingerMC, "RightForearm")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "RightForearm"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true])))) or (R.truth(R.get_value(v_clingerMC, "RightHand")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "RightHand"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true])))) or (R.truth(R.get_value(v_clingerMC, "RightHand2")) and R.truth(R.invoke(R.get_value(R.get_value(v_clingerMC, "RightHand2"), "hitTestPoint"), [R.get_value(c.fields.get("m_BulletHitPos"), "x"), R.get_value(c.fields.get("m_BulletHitPos"), "y"), true]))))
				if R.truth(v_bHit):
					pass
					R.call_member(v_clinger, "DamageRightArm", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")])
		if R.truth(R.unary("!", v_bHit)):
			pass
			R.call_member(v_clinger, "DamageBody", [v_iDamage, ((c).fields.get("m_Weapon")).fields.get("m_iDamageType")])
	c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerBloodContainer"), "globalToLocal"), [c.fields.get("m_BulletHitPos")]), "Point")
	if R.truth(v_bHeadShotBlocked):
		pass
		v_effects = R.coerce((c).fields.get("m_BlockedHeadBulletHitClingerEffects"), "Array")
		v_sounds = R.coerce((c).fields.get("m_BlockedHeadBulletHitClingerSounds"), "Array")
	else:
		pass
		if R.truth(v_bTorsoShotBlocked):
			pass
			v_effects = R.coerce((c).fields.get("m_BlockedTorsoBulletHitClingerEffects"), "Array")
			v_sounds = R.coerce((c).fields.get("m_BlockedTorsoBulletHitClingerSounds"), "Array")
		else:
			pass
			if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) == float(R.static_value("RDGame", "SpecialDay_AprilsFool")))):
				pass
				v_effects = R.coerce((c).fields.get("m_BulletHitClingerEffectsAprilsFool"), "Array")
			else:
				pass
				v_effects = R.coerce((c).fields.get("m_BulletHitClingerEffects"), "Array")
			v_sounds = R.coerce((c).fields.get("m_BulletHitClingerSounds"), "Array")
	v_effectClass = R.coerce(R.get_value(v_effects, R.call_static("Maths", "RandomInt", [R.get_value(v_effects, "length")])), "Class")
	v_hitEffect = R.coerce(R.call_static("RDGame", "GetMC", [v_effectClass]), "MovieClip")
	R.set_value(v_hitEffect, "m_owner", c, "=")
	R.set_value(v_hitEffect, "x", R.get_value(c.fields.get("m_BulletHitPos"), "x"), "=")
	R.set_value(v_hitEffect, "y", R.get_value(c.fields.get("m_BulletHitPos"), "y"), "=")
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iSpecialDay")) != float(R.static_value("RDGame", "SpecialDay_AprilsFool")))):
		pass
		R.set_value(v_hitEffect, "rotation", (float(randf()) * float(360)), "=")
	v_fScale = float((float(0.7) + float((float(randf()) * float(0.6)))))
	R.set_value(v_hitEffect, "scaleX", v_fScale, "=")
	R.set_value(v_hitEffect, "scaleY", v_fScale, "=")
	R.invoke(R.get_value(v_hitEffect, "play"), [])
	if R.truth((R.binary("==", v_clinger, (c).fields.get("m_ClingerSideLeft")) or R.binary("==", v_clinger, (c).fields.get("m_ClingerSideRight")))):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerSideBloodContainer"), "addChild"), [v_hitEffect])
	else:
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ClingerBloodContainer"), "addChild"), [v_hitEffect])
	v_effectSound = R.coerce(R.get_value(v_sounds, R.call_static("Maths", "RandomInt", [R.get_value(v_sounds, "length")])), "DTSpacialSound")
	R.call_member(c, "PlaySoundOnActor", [v_effectSound])
	return null

static func f_CanTakeCivilian(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_bChopperMode") or (((((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) < float(R.static_value("RDPlayer", "MaxCivInCar"))) and R.unary("!", (c).fields.get("m_ClingerLeft"))) and R.unary("!", (c).fields.get("m_ClingerRight"))) and R.unary("!", (c).fields.get("m_ClingerSideLeft"))) and R.unary("!", (c).fields.get("m_ClingerSideRight"))))
	return null

static func f_OnCivGetInCar(c: Variant, a: Array) -> Variant:
	var v_civ: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCivilian")
	if R.truth(R.unary("!", (c).fields.get("m_bChopperMode"))):
		pass
		if R.truth(((R.unary("!", R.call_member(c, "HasVoicePlaying", [])) or (float(c.fields.get("m_iVoicePriority")) < float(R.static_value("RDPlayer", "VoicePriority_Crucial")))) and (float((R.num(R.invoke(R.resolve(c, "getTimer", "RDPlayer"), [])) - float(R.static_value("RDPlayer", "m_iCivGetInVoiceTime")))) > float(5000)))):
			pass
			(c).fields["m_bPlayCivGetInVoice"] = true
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCivsInCar", 1, "+=")
		R.call_member(c, "SetLastCiv", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar"), (v_civ).fields.get("m_bIsMale")])
		R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_CivilianTaken")])
		if R.truth((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) >= float(R.static_value("RDPlayer", "MaxCivInCar")))):
			pass
			if R.truth((R.unary("!", R.call_member(c, "HasVoicePlaying", [])) or (float(c.fields.get("m_iVoicePriority")) < float(R.static_value("RDPlayer", "VoicePriority_Crucial"))))):
				pass
				(c).fields["m_bPlayFullCivVoice"] = true
		R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_CivCountUpdated")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["CivGetInCar", 0.05, 0, 0, 0.2])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DoorCloseSound")])
	return null

static func f_OnLeaveLocation(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_ClosestLocation")):
		pass
		if R.truth((float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_WeaponCrate")))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_TurretAttachments")])
		if R.truth(((float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_WeaponCrate"))) or (float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_PoliceStation"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_CochetasWeapons")])
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_DianesWeapons")])
		if R.truth((((float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_Church"))) or (float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_PoliceStation")))) or (float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_Garage"))))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_Perks")])
		if R.truth((float(((c).fields.get("m_ClosestLocation")).fields.get("m_iLocationType")) == float(R.static_value("RDEntity", "Location_Church")))):
			pass
			R.call_member(R.static_value("RDGame", "Instance"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_MedicalShots")])
	return null

static func f_UpdateLocation(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_i: Variant = 0
	var v_fDistance: Variant = NAN
	v_entity = R.coerce(null, "RDEntity")
	v_i = R.coerce(0, "int")
	v_fDistance = float(NAN)
	(c).fields["m_ClosestLocation"] = R.coerce(null, "RDEntity")
	(c).fields["m_fClosestLocationDistance"] = float(9999999)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c.fields.get("m_World")).fields.get("m_SafeZones"), "length"))):
		pass
		v_entity = R.coerce(R.get_value((c.fields.get("m_World")).fields.get("m_SafeZones"), v_i), "RDEntity")
		if R.truth((R.unary("!", R.call_member(v_entity, "IsLocationUsed", [])) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.static_value("RDPlayer", "PickupPointDistance"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [v_fDistance]), (c).fields.get("m_fClosestLocationDistance")))):
				pass
				(c).fields["m_fClosestLocationDistance"] = R.coerce(R.call_static("Maths", "AbsNumber", [v_fDistance]), "Number")
				(c).fields["m_ClosestLocation"] = R.coerce(v_entity, "RDEntity")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c.fields.get("m_World")).fields.get("m_Garages"), "length"))):
		pass
		v_entity = R.coerce(R.get_value((c.fields.get("m_World")).fields.get("m_Garages"), v_i), "RDEntity")
		if R.truth((R.unary("!", R.call_member(v_entity, "IsLocationUsed", [])) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.static_value("RDPlayer", "PickupPointDistance"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [v_fDistance]), (c).fields.get("m_fClosestLocationDistance")))):
				pass
				(c).fields["m_fClosestLocationDistance"] = R.coerce(R.call_static("Maths", "AbsNumber", [v_fDistance]), "Number")
				(c).fields["m_ClosestLocation"] = R.coerce(v_entity, "RDEntity")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c.fields.get("m_World")).fields.get("m_WeaponCrates"), "length"))):
		pass
		v_entity = R.coerce(R.get_value((c.fields.get("m_World")).fields.get("m_WeaponCrates"), v_i), "RDEntity")
		if R.truth((R.unary("!", R.call_member(v_entity, "IsLocationUsed", [])) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.static_value("RDPlayer", "PickupPointDistance"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [v_fDistance]), (c).fields.get("m_fClosestLocationDistance")))):
				pass
				(c).fields["m_fClosestLocationDistance"] = R.coerce(R.call_static("Maths", "AbsNumber", [v_fDistance]), "Number")
				(c).fields["m_ClosestLocation"] = R.coerce(v_entity, "RDEntity")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c.fields.get("m_World")).fields.get("m_AmmoPoints"), "length"))):
		pass
		v_entity = R.coerce(R.get_value((c.fields.get("m_World")).fields.get("m_AmmoPoints"), v_i), "RDEntity")
		if R.truth((R.unary("!", R.call_member(v_entity, "IsLocationUsed", [])) and (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c).fields.get("m_GameModeGameplay")).fields.get("m_fSpawnRampPosition"))))):
			pass
			v_fDistance = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z"))))
			if R.truth((R.binary(">", v_fDistance, R.unary("-", R.static_value("RDPlayer", "PickupPointDistance"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [v_fDistance]), (c).fields.get("m_fClosestLocationDistance")))):
				pass
				(c).fields["m_fClosestLocationDistance"] = R.coerce(R.call_static("Maths", "AbsNumber", [v_fDistance]), "Number")
				(c).fields["m_ClosestLocation"] = R.coerce(v_entity, "RDEntity")
		v_i = R.signed32(v_i + 1)
	return null

static func f_InitWeapons(c: Variant, a: Array) -> Variant:
	(c).fields["m_WeaponPistolCocheta"] = R.coerce(R.construct(R.klass("RDWeaponPistol"), [c]), "RDWeaponPistol")
	(c).fields["m_WeaponPistolDiane"] = R.coerce(R.construct(R.klass("RDWeaponPistol"), [c]), "RDWeaponPistol")
	(c).fields["m_WeaponMAC11"] = R.coerce(R.construct(R.klass("RDWeaponMAC11"), [c]), "RDWeaponMAC11")
	(c).fields["m_WeaponSPAS12"] = R.coerce(R.construct(R.klass("RDWeaponSPAS12"), [c]), "RDWeaponSPAS12")
	(c).fields["m_WeaponMP5"] = R.coerce(R.construct(R.klass("RDWeaponMP5"), [c]), "RDWeaponMP5")
	(c).fields["m_WeaponShotgun"] = R.coerce(R.construct(R.klass("RDWeaponShotgun"), [c]), "RDWeaponShotgun")
	(c).fields["m_WeaponM16"] = R.coerce(R.construct(R.klass("RDWeaponM16"), [c]), "RDWeaponM16")
	(c).fields["m_WeaponM60"] = R.coerce(R.construct(R.klass("RDWeaponM60"), [c]), "RDWeaponM60")
	(c).fields["m_WeaponRocketLauncher"] = R.coerce(R.construct(R.klass("RDWeaponRocketLauncher"), [c]), "RDWeaponRocketLauncher")
	(c).fields["m_WeaponMountedMG"] = R.coerce(R.construct(R.klass("RDWeaponMountedMG"), [c]), "RDWeaponMountedMG")
	(c).fields["m_CustomWeaponRocketLauncher"] = R.coerce(R.construct(R.klass("RDWeaponRocketLauncher"), [c]), "RDWeaponRocketLauncher")
	(c).fields["m_CustomWeaponMountedMG"] = R.coerce(R.construct(R.klass("RDWeaponMountedMG"), [c]), "RDWeaponMountedMG")
	R.call_member((c).fields.get("m_WeaponPistolCocheta"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CochetaPistol")])
	R.call_member((c).fields.get("m_WeaponPistolDiane"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_DianePistol")])
	R.call_member((c).fields.get("m_WeaponMAC11"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_DianeMAC11")])
	R.call_member((c).fields.get("m_WeaponSPAS12"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CochetaSPAS12")])
	R.call_member((c).fields.get("m_WeaponMP5"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CochetaMP5")])
	R.call_member((c).fields.get("m_WeaponShotgun"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_DianeShotgun")])
	R.call_member((c).fields.get("m_WeaponM16"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_DianeM16")])
	R.call_member((c).fields.get("m_WeaponM60"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CochetaM60")])
	R.call_member((c).fields.get("m_WeaponRocketLauncher"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_RocketLauncher")])
	R.call_member((c).fields.get("m_WeaponMountedMG"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_MountedMG")])
	R.call_member((c).fields.get("m_CustomWeaponRocketLauncher"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomRocketLauncher")])
	R.call_member((c).fields.get("m_CustomWeaponMountedMG"), "SetSaveData", [(R.static_value("RDPlayerInfo", "Instance")).fields.get("m_CustomMountedMG")])
	if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSavedAmmo"))):
		pass
		R.call_member((c).fields.get("m_WeaponPistolCocheta"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponPistolDiane"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponMAC11"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponSPAS12"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponMP5"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponShotgun"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponM16"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponM60"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_WeaponMountedMG"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_CustomWeaponRocketLauncher"), "ReplenishAmmo", [false, 1])
		R.call_member((c).fields.get("m_CustomWeaponMountedMG"), "ReplenishAmmo", [false, 1])
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSavedAmmo"] = true
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	else:
		pass
		R.call_member((c).fields.get("m_WeaponPistolCocheta"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponPistolDiane"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponMAC11"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponSPAS12"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponMP5"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponShotgun"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponM16"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponM60"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponRocketLauncher"), "InitAmmo", [])
		R.call_member((c).fields.get("m_WeaponMountedMG"), "InitAmmo", [])
		R.call_member((c).fields.get("m_CustomWeaponRocketLauncher"), "InitAmmo", [])
		R.call_member((c).fields.get("m_CustomWeaponMountedMG"), "InitAmmo", [])
	R.call_member(c, "InitWeaponsArray", [])
	return null

static func f_InitWeaponsArray(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_activeMountedWeapon: Variant = null
	v_info = R.coerce(null, "RDPlayerInfo")
	v_activeMountedWeapon = R.coerce(null, "RDWeapon")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_activeMountedWeapon = R.coerce(null, "RDWeapon")
	if R.truth(R.unary("!", (c).fields.get("m_bChopperMode"))):
		pass
		if R.truth(R.logical_and(R.truth((c).fields.get("m_GameModeGameplay")), func(): return R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMountedWeapons", []))):
			pass
			if R.truth((((v_info).fields.get("m_CustomMountedMG")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c).fields.get("m_CustomWeaponMountedMG"), "GetAmmoInMag", []), 0))):
				pass
				v_activeMountedWeapon = R.coerce((c).fields.get("m_CustomWeaponMountedMG"), "RDWeapon")
			else:
				pass
				if R.truth((((v_info).fields.get("m_CustomRocketLauncher")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c).fields.get("m_CustomWeaponRocketLauncher"), "GetAmmoInMag", []), 0))):
					pass
					v_activeMountedWeapon = R.coerce((c).fields.get("m_CustomWeaponRocketLauncher"), "RDWeapon")
		else:
			pass
			if R.truth((((v_info).fields.get("m_MountedMG")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c).fields.get("m_WeaponMountedMG"), "GetAmmoInMag", []), 0))):
				pass
				v_activeMountedWeapon = R.coerce((c).fields.get("m_WeaponMountedMG"), "RDWeapon")
			else:
				pass
				if R.truth((((v_info).fields.get("m_RocketLauncher")).fields.get("m_bUnlocked") and R.binary(">", R.call_member((c).fields.get("m_WeaponRocketLauncher"), "GetAmmoInMag", []), 0))):
					pass
					v_activeMountedWeapon = R.coerce((c).fields.get("m_WeaponRocketLauncher"), "RDWeapon")
	R.set_value((c).fields.get("m_WeaponsCocheta"), 0, (c).fields.get("m_WeaponPistolCocheta"), "=")
	R.set_value((c).fields.get("m_WeaponsCocheta"), 1, (c).fields.get("m_WeaponMP5"), "=")
	R.set_value((c).fields.get("m_WeaponsCocheta"), 2, ((c).fields.get("m_WeaponSPAS12") if R.truth(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")) else null), "=")
	R.set_value((c).fields.get("m_WeaponsCocheta"), 3, ((c).fields.get("m_WeaponM60") if R.truth(((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")) else null), "=")
	R.set_value((c).fields.get("m_WeaponsCocheta"), 4, v_activeMountedWeapon, "=")
	R.set_value((c).fields.get("m_WeaponsDiane"), 0, (c).fields.get("m_WeaponPistolDiane"), "=")
	R.set_value((c).fields.get("m_WeaponsDiane"), 1, (c).fields.get("m_WeaponShotgun"), "=")
	R.set_value((c).fields.get("m_WeaponsDiane"), 2, ((c).fields.get("m_WeaponMAC11") if R.truth(((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")) else null), "=")
	R.set_value((c).fields.get("m_WeaponsDiane"), 3, ((c).fields.get("m_WeaponM16") if R.truth(((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked")) else null), "=")
	R.set_value((c).fields.get("m_WeaponsDiane"), 4, v_activeMountedWeapon, "=")
	return null

static func f_OnAimingLevelUp(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_AimingLevelUp")])
	R.call_member(c, "HandleIveSeenThingsAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	return null

static func f_OnHandlingLevelUp(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_HandlingLevelUp")])
	R.call_member(c, "HandleIveSeenThingsAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	return null

static func f_OnReloadingLevelUp(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_ReloadingLevelUp")])
	R.call_member(c, "HandleIveSeenThingsAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	return null

static func f_OnDrivingLevelUp(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_DrivingLevelUp")])
	R.call_member(c, "UpdateDrivingValues", [])
	R.call_member(c, "HandleIveSeenThingsAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	return null

static func f_OnToughnessLevelUp(c: Variant, a: Array) -> Variant:
	R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_ToughnessLevelUp")])
	R.call_member(c, "HandleIveSeenThingsAchievement", [])
	R.call_member(c, "HandlePerfectSoldiersAchievement", [])
	return null

static func f_OnClingerGetOff(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	if R.truth((float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None")))):
		pass
		R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverHoodEnemyOffVoices"), R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffVoices"), R.static_value("RDPlayer", "m_FemaleDriverHoodEnemyOffVoices"), R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	else:
		pass
		if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleGunnerHoodEnemyOffTaskVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleGunnerHoodEnemyOffTaskVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_OnClingerComingBack(c: Variant, a: Array) -> Variant:
	if R.truth(((R.truth(R.logical_or(R.logical_and((c).fields.get("m_ClingerLeft"), func(): return (float(((c).fields.get("m_ClingerLeft")).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))), func(): return R.logical_and((c).fields.get("m_ClingerRight"), func(): return (float(((c).fields.get("m_ClingerRight")).fields.get("m_iType")) == float(R.static_value("RDHumanoid", "Type_ZombieVeryHard")))))) or R.truth((c).fields.get("m_ClingerSideLeft"))) or R.truth((c).fields.get("m_ClingerSideRight")))):
		pass
		return null
	if R.truth((float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None")))):
		pass
		if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	else:
		pass
		if R.truth((float(randf()) < float(0.5))):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleClingerComingBackVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleClingerComingBackVoices"), 0.5, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_OnShotZombie(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverShootZombieVoices"), R.static_value("RDPlayer", "m_MaleGunnerShootZombieVoices"), R.static_value("RDPlayer", "m_FemaleDriverShootZombieVoices"), R.static_value("RDPlayer", "m_FemaleGunnerShootZombieVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_OnShotSoldier(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverShootZombieVoices"), R.static_value("RDPlayer", "m_MaleGunnerShootZombieVoices"), R.static_value("RDPlayer", "m_FemaleDriverShootZombieVoices"), R.static_value("RDPlayer", "m_FemaleGunnerShootZombieVoices"), 0.25, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_PlayQuadDialog(c: Variant, a: Array) -> Variant:
	var v_bSpoke: Variant = false
	var v_maleDriverVoices: Variant = R.coerce((a[0] if a.size() > 0 else null), "RandomHat")
	var v_maleGunnerVoices: Variant = R.coerce((a[1] if a.size() > 1 else null), "RandomHat")
	var v_femaleDriverVoices: Variant = R.coerce((a[2] if a.size() > 2 else null), "RandomHat")
	var v_femaleGunnerVoices: Variant = R.coerce((a[3] if a.size() > 3 else null), "RandomHat")
	var v_fChance: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_iPriority: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	v_bSpoke = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		if R.truth(((R.truth(v_femaleDriverVoices) and R.truth((float(randf()) > float(0.5)))) and (float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None"))))):
			pass
			v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), v_femaleDriverVoices, v_fChance, v_iPriority]), "Boolean")
		else:
			pass
			v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), v_maleGunnerVoices, v_fChance, v_iPriority]), "Boolean")
	else:
		pass
		if R.truth(((R.truth(v_maleDriverVoices) and R.truth((float(randf()) > float(0.5)))) and (float((c).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None"))))):
			pass
			v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), v_maleDriverVoices, v_fChance, v_iPriority]), "Boolean")
		else:
			pass
			v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), v_femaleGunnerVoices, v_fChance, v_iPriority]), "Boolean")
	return v_bSpoke
	return null

static func f_OnWeaponEmpty(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleOutOfAmmoVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleOutOfAmmoVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_OnCivComing(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) > float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleTakeInCivVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleTakeInCivVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_PlayChopperTakeCivVoice(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleTakeInCivVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleTakeInCivVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_GetClinger(c: Variant, a: Array) -> Variant:
	var v_clingerMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	if R.truth((R.truth((c).fields.get("m_ClingerLeft")) and (R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMC")) or R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerLeft")).fields.get("m_ClingMCInside"))))):
		pass
		return (c).fields.get("m_ClingerLeft")
	if R.truth((R.truth((c).fields.get("m_ClingerRight")) and (R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerRight")).fields.get("m_ClingMC")) or R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerRight")).fields.get("m_ClingMCInside"))))):
		pass
		return (c).fields.get("m_ClingerRight")
	if R.truth((R.truth((c).fields.get("m_ClingerSideLeft")) and (R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMC")) or R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerSideLeft")).fields.get("m_ClingMCInside"))))):
		pass
		return (c).fields.get("m_ClingerSideLeft")
	if R.truth((R.truth((c).fields.get("m_ClingerSideRight")) and (R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMC")) or R.binary("==", v_clingerMC, ((c).fields.get("m_ClingerSideRight")).fields.get("m_ClingMCInside"))))):
		pass
		return (c).fields.get("m_ClingerSideRight")
	return null
	return null

static func f_OnWeaponShot(c: Variant, a: Array) -> Variant:
	(c).fields["m_iShotFrame"] = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "int")
	if R.truth(((((R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMountedMG")) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponRocketLauncher"))) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_CustomWeaponMountedMG"))) or R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_CustomWeaponRocketLauncher"))) and R.binary("==", R.call_member((c).fields.get("m_Weapon"), "GetAmmoInMag", []), 0))):
		pass
		R.call_member(c, "InitWeaponsArray", [])
		R.call_member(c, "PrevWeapon", [])
	return null

static func f_HasJustShot(c: Variant, a: Array) -> Variant:
	return (float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float((c).fields.get("m_iShotFrame")))) < float(5))
	return null

static func f_IsDriverSideStruggling(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_ClingerSideLeft")) and (float(((c).fields.get("m_ClingerSideLeft")).fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle"))))
	return null

static func f_DriverSideStruggle(c: Variant, a: Array) -> Variant:
	var v_bFemale: Variant = false
	var v_fDamage: Variant = NAN
	var v_fKillDelay: Variant = NAN
	v_bFemale = false
	v_fDamage = float(NAN)
	v_fKillDelay = float(NAN)
	v_bFemale = (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")
	v_fDamage = float(R.num(R.get_value(R.static_value("RDPlayer", "ToughnessStruggleDamage"), ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth(v_bFemale) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")))))
	v_fKillDelay = float(R.num(R.get_value(R.static_value("RDPlayer", "ToughnessStruggleKillDelay"), ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth(v_bFemale) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")))))
	R.call_member((c).fields.get("m_ClingerSideLeft"), "OnStruggleDamage", [v_bFemale, v_fDamage, v_fKillDelay])
	return null

static func f_IsShooterSideStruggling(c: Variant, a: Array) -> Variant:
	return (R.truth((c).fields.get("m_ClingerSideRight")) and (float(((c).fields.get("m_ClingerSideRight")).fields.get("m_iClingState")) == float(R.static_value("RDZombie", "ClingState_SideIdle"))))
	return null

static func f_ShooterSideStruggle(c: Variant, a: Array) -> Variant:
	var v_bFemale: Variant = false
	var v_fDamage: Variant = NAN
	var v_fKillDelay: Variant = NAN
	v_bFemale = false
	v_fDamage = float(NAN)
	v_fKillDelay = float(NAN)
	v_bFemale = (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")
	v_fDamage = float(R.num(R.get_value(R.static_value("RDPlayer", "ToughnessStruggleDamage"), ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth(R.unary("!", v_bFemale)) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")))))
	v_fKillDelay = float(R.num(R.get_value(R.static_value("RDPlayer", "ToughnessStruggleKillDelay"), ((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iDianeToughnessLevel") if R.truth(R.unary("!", v_bFemale)) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCochetaToughnessLevel")))))
	R.call_member((c).fields.get("m_ClingerSideRight"), "OnStruggleDamage", [R.unary("!", v_bFemale), v_fDamage, v_fKillDelay])
	return null

static func f_GetInteriorBulletCollisionMC(c: Variant, a: Array) -> Variant:
	return (R.get_value((c).fields.get("m_MCCarInterior"), "ChopperInsideBulletCollision") if R.truth((c).fields.get("m_bChopperMode")) else (R.get_value((c).fields.get("m_MCCarInterior"), "InteriorBulletCollision") if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")) else R.get_value((c).fields.get("m_MCCarInterior"), "InteriorBulletCollisionCar")))
	return null

static func f_PlayCivSafeInChopperVoice(c: Variant, a: Array) -> Variant:
	var v_bMale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(v_bMale):
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_MaleCivGetInChopperVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	else:
		pass
		R.call_member(c, "PlayRandomVoice", [R.static_value("RDPlayer", "m_FemaleCivGetInChopperVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Generic")])
	return null

static func f_GetSpeedRatio(c: Variant, a: Array) -> Variant:
	return minf(float((float(R.binary("/", (c.fields.get("m_vVelocity")).fields.get("Z"), (c).fields.get("m_fMaxSpeed"))) * float((c).fields.get("m_fMaxSpeedFactor")))), float(1))
	return null

static func f_GetSpeedRatioX(c: Variant, a: Array) -> Variant:
	return R.call_static("Maths", "Clamp", [R.binary("/", (c.fields.get("m_vVelocity")).fields.get("X"), (c).fields.get("m_fXMaxSpeed")), R.unary("-", 1), 1])
	return null

static func f_UpdateDeathWeaponSounds(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((((c).fields.get("m_bFailed") and (float((c).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_ZombieKill")))) and ((c).fields.get("m_bDeathWeaponFiring") or (float((c).fields.get("m_fDeathWeaponSoundTime")) < float(4))))):
		pass
		(c).fields["m_fDeathWeaponSoundTime"] = R.coerce(R.binary("+", (c).fields.get("m_fDeathWeaponSoundTime"), v_fDeltaTime), "Number")
		(c).fields["m_fDeathWeaponSoundDelay"] = R.coerce(R.binary("-", (c).fields.get("m_fDeathWeaponSoundDelay"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fDeathWeaponSoundDelay")) <= float(0))):
			pass
			if R.truth((c).fields.get("m_bDeathWeaponFiring")):
				pass
				R.call_member((c).fields.get("m_DeathWeapon"), "StopFireSound", [])
			else:
				pass
				R.call_member((c).fields.get("m_DeathWeapon"), "StartFireSound", [])
			(c).fields["m_bDeathWeaponFiring"] = R.unary("!", (c).fields.get("m_bDeathWeaponFiring"))
			R.call_member(c, "ResetDeathWeaponSoundDelay", [])
	return null

static func f_ResetDeathWeaponSoundDelay(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bDeathWeaponFiring")):
		pass
		(c).fields["m_fDeathWeaponSoundDelay"] = float((float(0.3) + float((float(randf()) * float(0.3)))))
	else:
		pass
		(c).fields["m_fDeathWeaponSoundDelay"] = float((float(0.4) + float((float(randf()) * float(0.6)))))
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopVoiceSound", [])
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	(c).fields["m_ClosestLocation"] = R.coerce(null, "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "Destroy"), [])
	return null

static func f_OnHitCleanerFence(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_ClingerSideLeft")):
		pass
		R.call_member((c).fields.get("m_ClingerSideLeft"), "OnForceEndStruggle", [(R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")])
	if R.truth((c).fields.get("m_ClingerSideRight")):
		pass
		R.call_member((c).fields.get("m_ClingerSideRight"), "OnForceEndStruggle", [R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))])
	if R.truth((c).fields.get("m_ClingerLeft")):
		pass
		R.call_member((c).fields.get("m_ClingerLeft"), "OnForceGetOff", [])
	if R.truth((c).fields.get("m_ClingerRight")):
		pass
		R.call_member((c).fields.get("m_ClingerRight"), "OnForceGetOff", [])
	return null

static func f_AddSideGrindingBlood(c: Variant, a: Array) -> Variant:
	var v_iOldBlood: Variant = 0
	var v_iOldDashboardBlood: Variant = 0
	var v_iNewBlood: Variant = 0
	var v_iNewDashboardBlood: Variant = 0
	var v_bloodEvent: Variant = null
	v_iOldBlood = R.coerce(0, "int")
	v_iOldDashboardBlood = R.coerce(0, "int")
	v_iNewBlood = R.coerce(0, "int")
	v_iNewDashboardBlood = R.coerce(0, "int")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_iOldBlood = R.coerce(floorf(float((c).fields.get("m_fSideGrindingBlood"))), "int")
	v_iOldDashboardBlood = R.coerce(floorf(float(R.binary("/", (c).fields.get("m_fSideGrindingBlood"), 4))), "int")
	(c).fields["m_fSideGrindingBlood"] = R.coerce(R.binary("+", (c).fields.get("m_fSideGrindingBlood"), 0.2), "Number")
	v_iNewBlood = R.coerce(floorf(float((c).fields.get("m_fSideGrindingBlood"))), "int")
	v_iNewDashboardBlood = R.coerce(floorf(float(R.binary("/", (c).fields.get("m_fSideGrindingBlood"), 4))), "int")
	if R.truth((float(v_iNewBlood) != float(v_iOldBlood))):
		pass
		v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [1, false]), "RDEventBlood")
		R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	if R.truth((float(v_iNewDashboardBlood) != float(v_iOldDashboardBlood))):
		pass
		if R.truth((c).fields.get("m_bIsSideScrapingRight")):
			pass
			R.call_member(c, "SpawnDashboardBlood", [null, R.static_value("RDPlayer", "HitAlign_FrontSideRight")])
			R.call_member(c, "SpawnDashboardBlood", [null, R.static_value("RDPlayer", "HitAlign_SideRight")])
		else:
			pass
			R.call_member(c, "SpawnDashboardBlood", [null, R.static_value("RDPlayer", "HitAlign_FrontSideLeft")])
			R.call_member(c, "SpawnDashboardBlood", [null, R.static_value("RDPlayer", "HitAlign_SideLeft")])
	return null

static func f_AddShootingBlood(c: Variant, a: Array) -> Variant:
	var v_iOldBlood: Variant = 0
	var v_iNewBlood: Variant = 0
	var v_bloodEvent: Variant = null
	v_iOldBlood = R.coerce(0, "int")
	v_iNewBlood = R.coerce(0, "int")
	v_bloodEvent = R.coerce(null, "RDEventBlood")
	v_iOldBlood = R.coerce(floorf(float((c).fields.get("m_fShootingBlood"))), "int")
	(c).fields["m_fShootingBlood"] = R.coerce(R.binary("+", (c).fields.get("m_fShootingBlood"), 0.05), "Number")
	v_iNewBlood = R.coerce(floorf(float((c).fields.get("m_fShootingBlood"))), "int")
	if R.truth((float(v_iNewBlood) != float(v_iOldBlood))):
		pass
		v_bloodEvent = R.coerce(R.construct(R.klass("RDEventBlood"), [1, false]), "RDEventBlood")
		R.call_member(c, "DispatchEventObject", [v_bloodEvent])
	return null

static func f_DoLowHealthEffect(c: Variant, a: Array) -> Variant:
	var v_gunnerLines: Variant = null
	v_gunnerLines = R.coerce(null, "RandomHat")
	R.call_member(c, "PlayPlayerRandomVoice", [(R.static_value("RDPlayer", "Speaker_Diane") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Cocheta")), (R.static_value("RDPlayer", "m_FemaleHeavyBreathingVoices") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "m_MaleHeavyBreathingVoices")), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	if R.truth(R.unary("!", (c).fields.get("m_ClingerSideRight"))):
		pass
		v_gunnerLines = R.coerce((R.static_value("RDPlayer", "m_MaleDriverLowHealthVoices") if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "m_FemaleDriverLowHealthVoices")), "RandomHat")
		(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(R.binary("as", R.call_member(v_gunnerLines, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		((c).fields.get("m_DriverHasLowHealthVoice")).fields["m_bManualPan"] = true
		R.call_member((c).fields.get("m_DriverHasLowHealthVoice"), "SetPan", [0.5])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DriverHasLowHealthVoice")])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_EarRingingSound")])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), "StartFade", [0.1, 0.1])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_MusicSoundGroup"), "StartFade", [0.1, 0.1])
	R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_VoiceSoundGroup"), "StartFade", [0.25, 0.1])
	(c).fields["m_fLowHealthTimer"] = float(R.static_value("RDPlayer", "LowHealthDuration"))
	(c).fields["m_fCummulativeBodyDamage"] = float(0)
	return null

static func f_HandleStateOfTheBadassArtAchievement(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	v_info = R.coerce(null, "RDPlayerInfo")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	if R.truth((((((((float((v_info).fields.get("m_iChopperSupportLevel")) > float(0)) and (float((v_info).fields.get("m_iAmmoPickupLevel")) > float(0))) and (float((v_info).fields.get("m_iLowerCostLevel")) > float(0))) and (float((v_info).fields.get("m_iDriverSwitchLevel")) > float(0))) and (float((v_info).fields.get("m_iTaskSpeedLevel")) > float(0))) and (float((v_info).fields.get("m_iLevelUpLevel")) > float(0))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "StateOfTheBadassArt"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "StateOfTheBadassArt")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_HandleArmedToTheTeethAchievement(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	v_info = R.coerce(null, "RDPlayerInfo")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	if R.truth(((((((v_info).fields.get("m_DianeM16")).fields.get("m_bUnlocked") and ((v_info).fields.get("m_DianeMAC11")).fields.get("m_bUnlocked")) and ((v_info).fields.get("m_CochetaM60")).fields.get("m_bUnlocked")) and ((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_bUnlocked")) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "ArmedToTheTeeth"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "ArmedToTheTeeth")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_HandleIveSeenThingsAchievement(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bFullyUpgraded: Variant = false
	v_info = R.coerce(null, "RDPlayerInfo")
	v_bFullyUpgraded = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bFullyUpgraded = (((((((((((((((float((v_info).fields.get("m_iDianeDrivingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iDianeToughnessLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) or ((((((((((((((float((v_info).fields.get("m_iCochetaDrivingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iCochetaToughnessLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))))
	if R.truth((v_bFullyUpgraded and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "IveSeenThings"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "IveSeenThings")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_HandleLockedAndLoadedAchievement(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bFullyUpgraded: Variant = false
	v_info = R.coerce(null, "RDPlayerInfo")
	v_bFullyUpgraded = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bFullyUpgraded = ((((((((((float(((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) or (((float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) or (((float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))))
	if R.truth((v_bFullyUpgraded and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "LockedAndLoaded"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "LockedAndLoaded")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_HandlePerfectSoldiersAchievement(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_bFullyUpgraded: Variant = false
	v_info = R.coerce(null, "RDPlayerInfo")
	v_bFullyUpgraded = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_bFullyUpgraded = ((((((((((((((((((((((((((((((((float((v_info).fields.get("m_iDianeDrivingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iDianeToughnessLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and ((((((((((((((float((v_info).fields.get("m_iCochetaDrivingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float((v_info).fields.get("m_iCochetaToughnessLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iAimingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iHandlingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iReloadingLevel")) == float(R.static_value("RDPlayer", "MaxOrganicLevel"))))) and (((float(((v_info).fields.get("m_DianePistol")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianePistol")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeShotgun")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeMAC11")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_DianeM16")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_DianeM16")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaPistol")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaMP5")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaSPAS12")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (((float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iDamageLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iAccuracyLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float(((v_info).fields.get("m_CochetaM60")).fields.get("m_iCapacityLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))) and (float((v_info).fields.get("m_iBumperLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iEngineLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iTiresLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iChopperSupportLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iAmmoPickupLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iLevelUpLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iLowerCostLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iDriverSwitchLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel")))) and (float((v_info).fields.get("m_iTaskSpeedLevel")) == float(R.static_value("RDPlayer", "MaxUpgradeLevel"))))
	if R.truth((v_bFullyUpgraded and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "PerfectSoldiers"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "PerfectSoldiers")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_CanPause(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_Pause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bForAbort: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(v_bPause):
		pass
		(c).fields["m_bPauseForAbort"] = v_bForAbort
	if R.truth(R.binary("==", v_bPause, (c).fields.get("m_bPaused"))):
		pass
		return null
	if R.truth(v_bPause):
		pass
		if R.truth((c).fields.get("m_currentEngineSound")):
			pass
			(c).fields["m_fEngineSoundPosition"] = R.coerce(R.call_member((c).fields.get("m_currentEngineSound"), "GetPosition", []), "Number")
			(c).fields["m_bEngineSoundLooping"] = ((c).fields.get("m_currentEngineSound")).fields.get("m_bLooping")
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_currentEngineSound")])
		if R.truth((c).fields.get("m_ClingLoopVoice")):
			pass
			(c).fields["m_fClingLoopPosition"] = R.coerce(R.call_member((c).fields.get("m_ClingLoopVoice"), "GetPosition", []), "Number")
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_ClingLoopVoice")])
		if R.truth((c).fields.get("m_DriverHasLowHealthVoice")):
			pass
			(c).fields["m_fLowHealthVoicePosition"] = R.coerce(R.call_member((c).fields.get("m_DriverHasLowHealthVoice"), "GetPosition", []), "Number")
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DriverHasLowHealthVoice")])
		(c).fields["m_bEarRingingWasPlaying"] = R.coerce(R.call_member((c).fields.get("m_EarRingingSound"), "IsPlaying", []), "Boolean")
		if R.truth((c).fields.get("m_bEarRingingWasPlaying")):
			pass
			(c).fields["m_fEarRingingSoundPosition"] = R.coerce(R.call_member((c).fields.get("m_EarRingingSound"), "GetPosition", []), "Number")
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_EarRingingSound")])
		R.call_member(c, "PauseVoice", [v_bPause])
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "stop"), [])
		R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerLeft"), true])
		R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerRight"), true])
		R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerSideLeft"), true])
		R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerSideRight"), true])
	else:
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bPauseForAbort"))):
			pass
			if R.truth((c).fields.get("m_currentEngineSound")):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_currentEngineSound"), (c).fields.get("m_bEngineSoundLooping"), (c).fields.get("m_fEngineSoundPosition")])
			if R.truth((c).fields.get("m_ClingLoopVoice")):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ClingLoopVoice"), true, (c).fields.get("m_fClingLoopPosition")])
			if R.truth((c).fields.get("m_DriverHasLowHealthVoice")):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_DriverHasLowHealthVoice"), false, (c).fields.get("m_fLowHealthVoicePosition")])
			if R.truth((c).fields.get("m_bEarRingingWasPlaying")):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_EarRingingSound"), false, (c).fields.get("m_fEarRingingSoundPosition")])
			R.call_member(c, "PauseVoice", [v_bPause])
			R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "play"), [])
			R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerLeft"), false])
			R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerRight"), false])
			R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerSideLeft"), false])
			R.call_member(c, "PauseClinger", [(c).fields.get("m_ClingerSideRight"), false])
	(c).fields["m_bPaused"] = v_bPause
	return null

static func f_PauseClinger(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	var v_bPause: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(v_clinger):
		pass
		if R.truth(v_bPause):
			pass
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMC")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMC"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMC"), "stop"), [])
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMCInside")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMCInside"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMCInside"), "stop"), [])
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMCUnder")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMCUnder"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMCUnder"), "stop"), [])
		else:
			pass
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMC")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMC"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMC"), "play"), [])
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMCInside")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMCInside"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMCInside"), "play"), [])
			if R.truth((R.truth((v_clinger).fields.get("m_ClingMCUnder")) and R.truth(R.get_value((v_clinger).fields.get("m_ClingMCUnder"), "parent")))):
				pass
				R.invoke(R.get_value((v_clinger).fields.get("m_ClingMCUnder"), "play"), [])
	return null

static func f_PlayVoiceSound(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	var v_iPriority: Variant = R.coerce((a[1] if a.size() > 1 else R.unary("-", 1)), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "PlayVoiceSound"), [v_voice, v_iPriority])
	if R.truth(R.binary("==", c.fields.get("m_VoiceSound"), v_voice)):
		pass
		R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_DialogFinished")])
		(c).fields["m_Dialog"] = R.coerce(null, "Array")
		(v_voice).fields["m_bManualPan"] = false
		(c).fields["m_iVoiceSpeaker"] = R.coerce(R.static_value("RDPlayer", "Speaker_Center"), "int")
	return null

static func f_PlayRandomVoice(c: Variant, a: Array) -> Variant:
	var v_bSpoke: Variant = false
	var v_voices: Variant = R.coerce((a[0] if a.size() > 0 else null), "RandomHat")
	var v_fChance: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v_iPriority: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_bSpoke = false
	if R.truth(((float(v_iPriority) != float(R.static_value("RDPlayer", "VoicePriority_Crucial"))) and ((c).fields.get("m_bFailed") or (c).fields.get("m_bInEnding")))):
		pass
		return false
	if R.truth(((R.truth(((float(v_iPriority) != float(R.static_value("RDPlayer", "VoicePriority_Generic"))) and (float(v_iPriority) != float(R.static_value("RDPlayer", "VoicePriority_Crucial"))))) and R.truth(R.logical_and((c).fields.get("m_RadioCommSound"), func(): return R.call_member((c).fields.get("m_RadioCommSound"), "IsPlaying", [])))) or (R.truth((c).fields.get("m_DriverHasLowHealthVoice")) and R.truth(R.call_member((c).fields.get("m_DriverHasLowHealthVoice"), "IsPlaying", []))))):
		pass
		return false
	if R.truth((c).fields.get("m_DriverHasLowHealthVoice")):
		pass
		R.call_member((c).fields.get("m_DriverHasLowHealthVoice"), "Stop", [])
		(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	v_bSpoke = R.coerce(R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "PlayRandomVoice"), [v_voices, v_fChance, v_iPriority]), "Boolean")
	if R.truth(v_bSpoke):
		pass
		R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_DialogFinished")])
		(c).fields["m_Dialog"] = R.coerce(null, "Array")
	return v_bSpoke
	return null

static func f_PlayDialog(c: Variant, a: Array) -> Variant:
	var v_dialog: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_iPriority: Variant = R.coerce((a[1] if a.size() > 1 else R.unary("-", 1)), "int")
	if R.truth((((R.unary("!", c.fields.get("m_VoiceSound")) or R.unary("!", R.call_member(c.fields.get("m_VoiceSound"), "IsPlaying", []))) or R.binary("==", v_iPriority, R.unary("-", 1))) or (float(v_iPriority) > float(c.fields.get("m_iVoicePriority"))))):
		pass
		if R.truth((c).fields.get("m_Dialog")):
			pass
			R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_DialogFinished")])
		if R.truth((c).fields.get("m_ClingerSideLeft")):
			pass
			R.call_member((c).fields.get("m_ClingerSideLeft"), "OnForceEndStruggle", [(R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")])
		if R.truth((c).fields.get("m_ClingerSideRight")):
			pass
			R.call_member((c).fields.get("m_ClingerSideRight"), "OnForceEndStruggle", [R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))])
		(c).fields["m_iDialogPriority"] = R.coerce(v_iPriority, "int")
		(c).fields["m_iDialogIndex"] = R.coerce(0, "int")
		(c).fields["m_Dialog"] = R.coerce(v_dialog, "Array")
		(c).fields["m_DialogLine"] = R.coerce(R.get_value((c).fields.get("m_Dialog"), (float((float((c).fields.get("m_iDialogIndex")) * float(2))) + float(1))), "DTSpacialSound")
		R.call_member(c, "PlayDialogVoiceSound", [R.get_value((c).fields.get("m_Dialog"), (float((c).fields.get("m_iDialogIndex")) * float(2))), (c).fields.get("m_DialogLine"), v_iPriority])
	return null

static func f_PlayDialogVoiceSound(c: Variant, a: Array) -> Variant:
	var v_iSpeaker: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_voice: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSpacialSound")
	var v_iPriority: Variant = R.coerce((a[2] if a.size() > 2 else R.unary("-", 1)), "int")
	if R.truth((((R.unary("!", c.fields.get("m_VoiceSound")) or R.unary("!", R.call_member(c.fields.get("m_VoiceSound"), "IsPlaying", []))) or R.binary("==", v_iPriority, R.unary("-", 1))) or (float(v_iPriority) > float(c.fields.get("m_iVoicePriority"))))):
		pass
		if R.truth(c.fields.get("m_VoiceSound")):
			pass
			R.call_member(c, "StopSoundOnActor", [c.fields.get("m_VoiceSound")])
			R.call_member(c.fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [null])
		c.fields["m_VoiceSound"] = R.coerce(v_voice, "DTSpacialSound")
		c.fields["m_iVoicePriority"] = R.coerce(v_iPriority, "int")
		R.call_member(c.fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [R.resolve(c, "OnVoiceSoundEnded", "RDPlayer")])
		R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_VoiceSound")])
		c.fields["m_bVoicePaused"] = false
	if R.truth(R.binary("==", c.fields.get("m_VoiceSound"), v_voice)):
		pass
		(c).fields["m_iVoiceSpeaker"] = R.coerce(v_iSpeaker, "int")
		(c.fields.get("m_VoiceSound")).fields["m_bManualPan"] = true
		R.call_member(c, "UpdateVoiceSpeakerPanning", [true, 0])
	return null

static func f_PlayPlayerVoiceSound(c: Variant, a: Array) -> Variant:
	var v_iSpeaker: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_voice: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSpacialSound")
	var v_iPriority: Variant = R.coerce((a[2] if a.size() > 2 else R.unary("-", 1)), "int")
	R.call_member(c, "PlayVoiceSound", [v_voice, v_iPriority])
	if R.truth(R.binary("==", c.fields.get("m_VoiceSound"), v_voice)):
		pass
		(c).fields["m_iVoiceSpeaker"] = R.coerce(v_iSpeaker, "int")
		(c.fields.get("m_VoiceSound")).fields["m_bManualPan"] = true
		R.call_member(c, "UpdateVoiceSpeakerPanning", [true, 0])
	return null

static func f_PlayPlayerRandomVoice(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = null
	var v_iSpeaker: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_voices: Variant = R.coerce((a[1] if a.size() > 1 else null), "RandomHat")
	var v_fChance: Variant = R.coerce((a[2] if a.size() > 2 else 1), "Number")
	var v_iPriority: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	v_voice = R.coerce(null, "DTSpacialSound")
	if R.truth(((float(v_iPriority) != float(R.static_value("RDPlayer", "VoicePriority_Crucial"))) and ((c).fields.get("m_bFailed") or (c).fields.get("m_bInEnding")))):
		pass
		return false
	if R.truth((float(randf()) < float(v_fChance))):
		pass
		v_voice = R.coerce(R.binary("as", R.call_member(v_voices, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayPlayerVoiceSound", [v_iSpeaker, v_voice, v_iPriority])
		if R.truth(R.binary("==", c.fields.get("m_VoiceSound"), v_voice)):
			pass
			(c.fields.get("m_VoiceSound")).fields["m_bManualPan"] = true
		return true
	return false
	return null

static func f_UpdateVoiceSpeakerPanning(c: Variant, a: Array) -> Variant:
	var v_fTargetPan: Variant = NAN
	var v_fCurrentPan: Variant = NAN
	var v_fPan: Variant = NAN
	var v_bInstant: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fDeltaTime: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fTargetPan = float(NAN)
	v_fCurrentPan = float(NAN)
	v_fPan = float(NAN)
	if R.truth(c.fields.get("m_VoiceSound")):
		pass
		if R.truth((float((c).fields.get("m_iVoiceSpeaker")) == float(R.static_value("RDPlayer", "Speaker_Center")))):
			pass
			R.call_member(c.fields.get("m_VoiceSound"), "SetPan", [0])
		else:
			pass
			v_fTargetPan = float((R.num((R.unary("-", 0.5) if R.truth(R.binary("==", (float((c).fields.get("m_iVoiceSpeaker")) == float(R.static_value("RDPlayer", "Speaker_Diane"))), (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))) else 0.5)) * R.num((R.unary("-", 1) if R.truth((c).fields.get("m_bSwitchingDriver")) else 1))))
			if R.truth(v_bInstant):
				pass
				R.call_member(c.fields.get("m_VoiceSound"), "SetPan", [v_fTargetPan])
			else:
				pass
				v_fCurrentPan = R.coerce(R.call_member(c.fields.get("m_VoiceSound"), "GetPan", []), "Number")
				v_fPan = R.coerce(R.call_static("Maths", "InterpolateNumber", [v_fCurrentPan, v_fTargetPan, 2, v_fDeltaTime]), "Number")
				R.call_member(c.fields.get("m_VoiceSound"), "SetPan", [v_fPan])
	return null

static func f_PlayChopperSupportReadyVoice(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Center"), R.static_value("RDPlayer", "m_ChopperSupportReadyVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayChopperSupportLeavesVoice(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Center"), R.static_value("RDPlayer", "m_ChopperSupportLeavesVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayChopperSupportAcknowledgeVoice(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Center"), R.static_value("RDPlayer", "m_ChopperSupportAcknowledgeVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayChopperSupportVoice(c: Variant, a: Array) -> Variant:
	var v_bSpoke: Variant = false
	v_bSpoke = false
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleCallChopperSupportVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")]), "Boolean")
	else:
		pass
		v_bSpoke = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleCallChopperSupportVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")]), "Boolean")
	if R.truth(v_bSpoke):
		pass
		(c).fields["m_CallChopperSupportVoice"] = R.coerce(c.fields.get("m_VoiceSound"), "DTSpacialSound")
		(c).fields["m_bPlayChopperSupportAcknowledgeVoice"] = true
	return null

static func f_UpdateVoices(c: Variant, a: Array) -> Variant:
	var v_bSideClingLeft: Variant = false
	var v_bPlayed: Variant = false
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_bSideClingLeft = false
	v_bPlayed = false
	R.invoke(R.get_value(R.super_ref(c, "RDPlayer"), "UpdateVoices"), [v_fDeltaTime])
	if R.truth(((((c).fields.get("m_bPlayChopperSupportAcknowledgeVoice") and R.binary("==", c.fields.get("m_VoiceSound"), (c).fields.get("m_CallChopperSupportVoice"))) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused"))) and R.unary("!", R.call_member(c.fields.get("m_VoiceSound"), "IsPlaying", [])))):
		pass
		R.call_member(c, "PlayChopperSupportAcknowledgeVoice", [])
		(c).fields["m_bPlayChopperSupportAcknowledgeVoice"] = false
	if R.truth(((R.unary("!", c.fields.get("m_VoiceSound")) or R.unary("!", R.call_member(c.fields.get("m_VoiceSound"), "IsPlaying", []))) and ((R.truth((c).fields.get("m_ClingerSideLeft")) and R.truth(R.unary("!", ((c).fields.get("m_ClingerSideLeft")).fields.get("m_bHit")))) or (R.truth((c).fields.get("m_ClingerSideRight")) and R.truth(R.unary("!", ((c).fields.get("m_ClingerSideRight")).fields.get("m_bHit"))))))):
		pass
		if R.truth((R.truth((c).fields.get("m_ClingerSideLeft")) and R.truth((c).fields.get("m_ClingerSideRight")))):
			pass
			v_bSideClingLeft = (c).fields.get("m_bLastSideClingerSide")
		else:
			pass
			if R.truth((c).fields.get("m_ClingerSideLeft")):
				pass
				v_bSideClingLeft = true
			else:
				pass
				v_bSideClingLeft = false
		v_bPlayed = false
		if R.truth(R.binary("==", v_bSideClingLeft, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))):
			pass
			v_bPlayed = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleSideClingLoopVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")]), "Boolean")
		else:
			pass
			v_bPlayed = R.coerce(R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleSideClingLoopVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")]), "Boolean")
		if R.truth(v_bPlayed):
			pass
			(c).fields["m_ClingLoopVoice"] = R.coerce(c.fields.get("m_VoiceSound"), "DTSpacialSound")
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_ClingLoopVoice"), func(): return R.call_member((c).fields.get("m_ClingLoopVoice"), "IsPlaying", []))) and R.truth(R.unary("!", (c).fields.get("m_ClingerSideLeft")))) and R.unary("!", (c).fields.get("m_ClingerSideRight")))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_ClingLoopVoice")])
		(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth((((c).fields.get("m_bPlayDriverDeathVoice") and (R.unary("!", c.fields.get("m_VoiceSound")) or R.unary("!", R.call_member(c.fields.get("m_VoiceSound"), "IsPlaying", [])))) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused")))):
		pass
		R.call_member(c, "PlayDriverDeathVoice", [])
		(c).fields["m_bPlayDriverDeathVoice"] = false
	if R.truth(((R.truth((c).fields.get("m_Dialog")) and R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPaused")))) and R.unary("!", R.call_member((c).fields.get("m_DialogLine"), "IsPlaying", [])))):
		pass
		R.set_value(c, "m_iDialogIndex", 1, "+=")
		if R.truth((float((c).fields.get("m_iDialogIndex")) >= float(R.binary("/", R.get_value((c).fields.get("m_Dialog"), "length"), 2)))):
			pass
			R.call_member(c, "DispatchEvent", [R.static_value("RDPlayer", "Event_DialogFinished")])
			(c).fields["m_Dialog"] = R.coerce(null, "Array")
		else:
			pass
			(c).fields["m_DialogLine"] = R.coerce(R.get_value((c).fields.get("m_Dialog"), (float((float((c).fields.get("m_iDialogIndex")) * float(2))) + float(1))), "DTSpacialSound")
			R.call_member(c, "PlayDialogVoiceSound", [R.get_value((c).fields.get("m_Dialog"), (float((c).fields.get("m_iDialogIndex")) * float(2))), (c).fields.get("m_DialogLine"), (c).fields.get("m_iDialogPriority")])
	return null

static func f_PlaySideClingVoice(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.binary("==", v_bLeft, (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleSideClingStartVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleSideClingStartVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	(c).fields["m_bLastSideClingerSide"] = v_bLeft
	return null

static func f_PlayRampVoice(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverRampVoices"), R.static_value("RDPlayer", "m_MaleGunnerRampVoices"), R.static_value("RDPlayer", "m_FemaleDriverRampVoices"), R.static_value("RDPlayer", "m_FemaleGunnerRampVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayExitRampVoice(c: Variant, a: Array) -> Variant:
	R.call_member(c, "PlayQuadDialog", [R.static_value("RDPlayer", "m_MaleDriverExitRampVoices"), R.static_value("RDPlayer", "m_MaleGunnerExitRampVoices"), R.static_value("RDPlayer", "m_FemaleDriverExitRampVoices"), R.static_value("RDPlayer", "m_FemaleGunnerExitRampVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayJetComingVoice(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) < float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleJetComingVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleJetComingVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_PlayJetPassedVoice(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) < float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleJetPassedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleJetPassedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
	return null

static func f_PlayHelicopterVoice(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) < float(0.5))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleHelicopterVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleHelicopterVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_OnMutantArrived(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bCallMutantArrived")):
		pass
		if R.truth((float(randf()) < float(0.5))):
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleMutantArrivedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
		else:
			pass
			R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleMutantArrivedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
		(c).fields["m_bCallMutantArrived"] = false
	if R.truth((float((c.fields.get("m_World")).fields.get("m_iMutants")) == float(0))):
		pass
		(c).fields["m_bCallMutantArrived"] = true
	return null

static func f_OnZombieHeadShot(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bDidFirstHeadShot"))):
		pass
		R.call_member(c, "PlayDialog", [R.static_value("RDPlayer", "m_HeadShotDialog"), R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_bDidFirstHeadShot"] = true
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_PlayDriverDeathVoice(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleDriverDiedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleDriverDiedVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Crucial")])
	return null

static func f_OnPunchElbowClinger(c: Variant, a: Array) -> Variant:
	var v_bIsFemale: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.logical_and(R.truth((c).fields.get("m_ClingLoopVoice")), func(): return R.call_member((c).fields.get("m_ClingLoopVoice"), "IsPlaying", []))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_ClingLoopVoice")])
		(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth(v_bIsFemale):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_OnHeadShotClinger(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.truth((c).fields.get("m_ClingLoopVoice")), func(): return R.call_member((c).fields.get("m_ClingLoopVoice"), "IsPlaying", []))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_ClingLoopVoice")])
		(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale")):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_OnSideGrindedClinger(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.truth((c).fields.get("m_ClingLoopVoice")), func(): return R.call_member((c).fields.get("m_ClingLoopVoice"), "IsPlaying", []))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_ClingLoopVoice")])
		(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bIsFemale"))):
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Diane"), R.static_value("RDPlayer", "m_FemaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	else:
		pass
		R.call_member(c, "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Cocheta"), R.static_value("RDPlayer", "m_MaleBashClingerVoices"), 1, R.static_value("RDPlayer", "VoicePriority_CrucialGameplay")])
	return null

static func f_StartEnding(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bInEnding"] = true
	(c).fields["m_iEndingType"] = R.coerce(v_iType, "int")
	c.fields["m_fDepthPosition"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	c.fields["m_bHasCustomDepthPosition"] = false
	R.call_member(c, "UpdateDepthPosition", [])
	(c).fields["m_bGoForward"] = true
	(c).fields["m_bGoBackward"] = false
	(c).fields["m_bSteeringLeft"] = false
	(c).fields["m_bSteeringRight"] = false
	(c).fields["m_bHandBraking"] = false
	(c).fields["m_bStartMutantSandwich"] = false
	R.call_member(c, "CancelTask", [false])
	R.call_member(c, "StopHorning", [])
	R.call_member(c, "StopVoiceSound", [])
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	if R.truth((c).fields.get("m_DriverHasLowHealthVoice")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_DriverHasLowHealthVoice")])
		(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	R.call_member(c, "StopRadioComm", [])
	R.call_member(c, "StopFiring", [])
	R.call_member((c).fields.get("m_Weapon"), "InterruptReload", [])
	(c).fields["m_bHandBraking"] = false
	if R.truth((float(v_iType) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
		pass
		if R.truth(R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarInterior")])):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_MCCarInterior")])
		if R.truth(R.unary("!", R.invoke(R.get_value(c.fields.get("m_MC"), "contains"), [(c).fields.get("m_MCCarBack")]))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "addChild"), [(c).fields.get("m_MCCarBack")])
		R.invoke(R.get_value((c).fields.get("m_MCCarBack"), "gotoAndPlay"), [("Ending" if R.truth(((R.static_value("RDGame", "Instance")).fields.get("m_PlayerInfo")).fields.get("m_bUsingHummer")) else "EndingCar")])
		(c).fields["m_fBumpStrength"] = float(0)
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_TireScrapingSound")])
		R.call_member(c, "RemoveClinger", [true, false])
		R.call_member(c, "RemoveClinger", [false, false])
		R.call_member(c, "RemoveClinger", [true, true])
		R.call_member(c, "RemoveClinger", [false, true])
	else:
		pass
		(c).fields["m_iEngineState"] = R.coerce(R.static_value("RDPlayer", "EngineState_Exploded"), "int")
		R.call_member(c.fields.get("m_vVelocity"), "SetZero", [])
		(c).fields["m_fBumpStrength"] = float(0)
	R.call_member(R.static_value("RDGame", "Instance"), "PlayCustomMusic", [(R.static_value("RDGame", "Instance")).fields.get("m_TenseMusic"), 0, true])
	return null

static func f_OnSideClingerOff(c: Variant, a: Array) -> Variant:
	var v_bLeft: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.unary("!", v_bLeft)):
		pass
		R.call_member((c).fields.get("m_EquipWeaponSound"), "Play", [])
	return null

static func f_CanBrake(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_bSwitchingDriver")) and R.unary("!", (c).fields.get("m_bFullSpeedMode")))
	return null

static func f_DoAmmoPointTask(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_fAmmoPercentage: Variant = NAN
	var v_loc: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_bQuick: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_info = R.coerce(null, "RDPlayerInfo")
	v_fAmmoPercentage = float(NAN)
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	v_fAmmoPercentage = float(R.num(R.get_value(R.static_value("RDPlayer", "AmmoPickupRatios"), (v_info).fields.get("m_iAmmoPickupLevel"))))
	R.call_member((c).fields.get("m_WeaponPistolCocheta"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponPistolCocheta")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponPistolDiane"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponPistolDiane")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponMAC11"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMAC11")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponSPAS12"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponSPAS12")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponMP5"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponMP5")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponShotgun"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponShotgun")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponM16"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponM16")), v_fAmmoPercentage])
	R.call_member((c).fields.get("m_WeaponM60"), "ReplenishAmmo", [R.binary("==", (c).fields.get("m_Weapon"), (c).fields.get("m_WeaponM60")), v_fAmmoPercentage])
	R.call_member((((c).fields.get("m_GameModeGameplay")).fields.get("m_Game")).fields.get("m_Hud"), "ShowLevelUp", ["Ammo", "Gathered", 0, 0, (1 if R.truth(v_bQuick) else 4)])
	R.call_member(v_loc, "SetLocationUsed", [])
	return null

static func f_CanHandBrake(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.logical_and(R.unary("!", (c).fields.get("m_bSwitchingDriver")), func(): return R.call_member((c).fields.get("m_GameModeGameplay"), "SwervingEnabled", [])), func(): return R.unary("!", (c).fields.get("m_ClingerSideLeft")))
	return null

static func f_OnClingerExploded(c: Variant, a: Array) -> Variant:
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	if R.truth((v_clinger).fields.get("m_bClingLeft")):
		pass
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionLeft"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionLeft"), "gotoAndPlay"), [1])
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionRight"), "visible", true, "=")
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MCCarInterior"), "ExplosionRight"), "gotoAndPlay"), [1])
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return false
	return null

static func f_CanBeKilledInChopper(c: Variant, a: Array) -> Variant:
	var v_rescueMode: Variant = null
	v_rescueMode = R.coerce(null, "RDGameModeChopperRescue")
	v_rescueMode = R.coerce(R.binary("as", (c).fields.get("m_GameModeGameplay"), R.klass("RDGameModeChopperRescue")), "RDGameModeChopperRescue")
	return (R.unary("!", v_rescueMode) or (float((v_rescueMode).fields.get("m_iState")) == float(R.static_value("RDGameModeChopperRescue", "State_Shooting"))))
	return null

static func f_OnTaskLocationExploded(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "CancelTask", [false])
	return null

static func f_ResetStartWhenOurPowersCombine(c: Variant, a: Array) -> Variant:
	(c).fields["m_bStartWhenOurPowersCombine"] = false
	return null

static func f_IsLastCivMale(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	v_info = R.coerce(null, "RDPlayerInfo")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	if R.truth((float((v_info).fields.get("m_iCivsInCar")) == float(1))):
		pass
		return (v_info).fields.get("m_bCivIsMale1")
	if R.truth((float((v_info).fields.get("m_iCivsInCar")) == float(2))):
		pass
		return (v_info).fields.get("m_bCivIsMale2")
	if R.truth((float((v_info).fields.get("m_iCivsInCar")) == float(3))):
		pass
		return (v_info).fields.get("m_bCivIsMale3")
	if R.truth((float((v_info).fields.get("m_iCivsInCar")) == float(4))):
		pass
		return (v_info).fields.get("m_bCivIsMale4")
	return (v_info).fields.get("m_bCivIsMale5")
	return null

static func f_SetLastCiv(c: Variant, a: Array) -> Variant:
	var v_info: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bMale: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_info = R.coerce(null, "RDPlayerInfo")
	v_info = R.coerce(R.static_value("RDPlayerInfo", "Instance"), "RDPlayerInfo")
	if R.truth((float(v_iIndex) == float(1))):
		pass
		(v_info).fields["m_bCivIsMale1"] = v_bMale
	else:
		pass
		if R.truth((float(v_iIndex) == float(2))):
			pass
			(v_info).fields["m_bCivIsMale2"] = v_bMale
		else:
			pass
			if R.truth((float(v_iIndex) == float(3))):
				pass
				(v_info).fields["m_bCivIsMale3"] = v_bMale
			else:
				pass
				if R.truth((float(v_iIndex) == float(4))):
					pass
					(v_info).fields["m_bCivIsMale4"] = v_bMale
				else:
					pass
					if R.truth((float(v_iIndex) == float(5))):
						pass
						(v_info).fields["m_bCivIsMale5"] = v_bMale
	return null

static func f_GetNbMedShields(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_GameModeGameplay"))):
		pass
		return 0
	return (((c).fields.get("m_GameModeGameplay")).fields.get("m_iCustomMedShields") if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedShields"))
	return null

static func f_GetNbMedHeals(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_GameModeGameplay"))):
		pass
		return 0
	return (((c).fields.get("m_GameModeGameplay")).fields.get("m_iCustomMedHeals") if R.truth(R.call_member((c).fields.get("m_GameModeGameplay"), "UsingCustomMeds", [])) else (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iMedHeals"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_MaleMediumCollisionGruntVoices", null, "=")
	R.set_value(c, "m_MaleHardCollisionGruntVoices", null, "=")
	R.set_value(c, "m_MaleHugeCollisionGruntVoices", null, "=")
	R.set_value(c, "m_MaleGunnerHugeCollisionGruntVoices", null, "=")
	R.set_value(c, "m_MaleDriverDeathScreamVoices", null, "=")
	R.set_value(c, "m_MaleGunnerDeathScreamVoices", null, "=")
	R.set_value(c, "m_MaleDriverHoodEnemyOffVoices", null, "=")
	R.set_value(c, "m_MaleGunnerHoodEnemyOffVoices", null, "=")
	R.set_value(c, "m_MaleGunnerHoodEnemyOffTaskVoices", null, "=")
	R.set_value(c, "m_MaleDriverReactToHoodEnemyVoices", null, "=")
	R.set_value(c, "m_MaleGunnerReactToHoodEnemyVoices", null, "=")
	R.set_value(c, "m_MaleDriverShootZombieVoices", null, "=")
	R.set_value(c, "m_MaleGunnerShootZombieVoices", null, "=")
	R.set_value(c, "m_MaleBlownTiresVoices", null, "=")
	R.set_value(c, "m_MaleCarOnFireVoices", null, "=")
	R.set_value(c, "m_MaleExtinguishFireVoices", null, "=")
	R.set_value(c, "m_MaleDriverHitCivilianVoices", null, "=")
	R.set_value(c, "m_MaleGunnerHitCivilianVoices", null, "=")
	R.set_value(c, "m_MaleDriverHitEnemyVoices", null, "=")
	R.set_value(c, "m_MaleGunnerHitEnemyVoices", null, "=")
	R.set_value(c, "m_MalePrecisionHitVoices", null, "=")
	R.set_value(c, "m_MaleNotMovingVoices", null, "=")
	R.set_value(c, "m_MaleCivFullVoices", null, "=")
	R.set_value(c, "m_MaleCivGetInVoices", null, "=")
	R.set_value(c, "m_MaleCivGetInChopperVoices", null, "=")
	R.set_value(c, "m_MaleCivSafeVoices", null, "=")
	R.set_value(c, "m_MaleTakeInCivVoices", null, "=")
	R.set_value(c, "m_MaleDriverSwitchSeatVoices", null, "=")
	R.set_value(c, "m_MaleGunnerSwitchSeatVoices", null, "=")
	R.set_value(c, "m_MaleChopperSwitchVoices", null, "=")
	R.set_value(c, "m_MaleDriverAlleywayVoices", null, "=")
	R.set_value(c, "m_MaleGunnerAlleywayVoices", null, "=")
	R.set_value(c, "m_MaleDriverTaskCancelVoices", null, "=")
	R.set_value(c, "m_MaleGunnerTaskCancelVoices", null, "=")
	R.set_value(c, "m_MaleDriverTaskInProgressVoices", null, "=")
	R.set_value(c, "m_MaleGunnerTaskInProgressVoices", null, "=")
	R.set_value(c, "m_MaleOutOfAmmoVoices", null, "=")
	R.set_value(c, "m_MaleReloadVoices", null, "=")
	R.set_value(c, "m_MaleReloadMagVoices", null, "=")
	R.set_value(c, "m_MaleReloadWithClingerVoices", null, "=")
	R.set_value(c, "m_MaleHeavyBreathingVoices", null, "=")
	R.set_value(c, "m_MaleDriverLowHealthVoices", null, "=")
	R.set_value(c, "m_MaleCallChopperSupportVoices", null, "=")
	R.set_value(c, "m_MaleSideClingStartVoices", null, "=")
	R.set_value(c, "m_MaleSideClingLoopVoices", null, "=")
	R.set_value(c, "m_MaleClingerComingBackVoices", null, "=")
	R.set_value(c, "m_MaleDriverRampVoices", null, "=")
	R.set_value(c, "m_MaleGunnerRampVoices", null, "=")
	R.set_value(c, "m_MaleDriverExitRampVoices", null, "=")
	R.set_value(c, "m_MaleGunnerExitRampVoices", null, "=")
	R.set_value(c, "m_MaleJetComingVoices", null, "=")
	R.set_value(c, "m_MaleJetPassedVoices", null, "=")
	R.set_value(c, "m_MaleHelicopterVoices", null, "=")
	R.set_value(c, "m_MaleMutantArrivedVoices", null, "=")
	R.set_value(c, "m_MaleProtectTaskVoices", null, "=")
	R.set_value(c, "m_MaleBulletHitVoices", null, "=")
	R.set_value(c, "m_MaleDriverDiedVoices", null, "=")
	R.set_value(c, "m_MaleMedShotVoices", null, "=")
	R.set_value(c, "m_MaleBashClingerVoices", null, "=")
	R.set_value(c, "m_FemaleMediumCollisionGruntVoices", null, "=")
	R.set_value(c, "m_FemaleHardCollisionGruntVoices", null, "=")
	R.set_value(c, "m_FemaleHugeCollisionGruntVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerHugeCollisionGruntVoices", null, "=")
	R.set_value(c, "m_FemaleDriverDeathScreamVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerDeathScreamVoices", null, "=")
	R.set_value(c, "m_FemaleDriverHoodEnemyOffVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerHoodEnemyOffVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerHoodEnemyOffTaskVoices", null, "=")
	R.set_value(c, "m_FemaleDriverReactToHoodEnemyVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerReactToHoodEnemyVoices", null, "=")
	R.set_value(c, "m_FemaleDriverShootZombieVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerShootZombieVoices", null, "=")
	R.set_value(c, "m_FemaleBlownTiresVoices", null, "=")
	R.set_value(c, "m_FemaleCarOnFireVoices", null, "=")
	R.set_value(c, "m_FemaleExtinguishFireVoices", null, "=")
	R.set_value(c, "m_FemaleDriverHitCivilianVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerHitCivilianVoices", null, "=")
	R.set_value(c, "m_FemaleDriverHitEnemyVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerHitEnemyVoices", null, "=")
	R.set_value(c, "m_FemalePrecisionHitVoices", null, "=")
	R.set_value(c, "m_FemaleNotMovingVoices", null, "=")
	R.set_value(c, "m_FemaleCivFullVoices", null, "=")
	R.set_value(c, "m_FemaleCivGetInVoices", null, "=")
	R.set_value(c, "m_FemaleCivGetInChopperVoices", null, "=")
	R.set_value(c, "m_FemaleCivSafeVoices", null, "=")
	R.set_value(c, "m_FemaleTakeInCivVoices", null, "=")
	R.set_value(c, "m_FemaleDriverSwitchSeatVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerSwitchSeatVoices", null, "=")
	R.set_value(c, "m_FemaleChopperSwitchVoices", null, "=")
	R.set_value(c, "m_FemaleDriverAlleywayVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerAlleywayVoices", null, "=")
	R.set_value(c, "m_FemaleDriverTaskCancelVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerTaskCancelVoices", null, "=")
	R.set_value(c, "m_FemaleDriverTaskInProgressVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerTaskInProgressVoices", null, "=")
	R.set_value(c, "m_FemaleOutOfAmmoVoices", null, "=")
	R.set_value(c, "m_FemaleReloadVoices", null, "=")
	R.set_value(c, "m_FemaleReloadMagVoices", null, "=")
	R.set_value(c, "m_FemaleReloadWithClingerVoices", null, "=")
	R.set_value(c, "m_FemaleHeavyBreathingVoices", null, "=")
	R.set_value(c, "m_FemaleDriverLowHealthVoices", null, "=")
	R.set_value(c, "m_FemaleCallChopperSupportVoices", null, "=")
	R.set_value(c, "m_FemaleSideClingStartVoices", null, "=")
	R.set_value(c, "m_FemaleSideClingLoopVoices", null, "=")
	R.set_value(c, "m_FemaleClingerComingBackVoices", null, "=")
	R.set_value(c, "m_FemaleDriverRampVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerRampVoices", null, "=")
	R.set_value(c, "m_FemaleDriverExitRampVoices", null, "=")
	R.set_value(c, "m_FemaleGunnerExitRampVoices", null, "=")
	R.set_value(c, "m_FemaleJetComingVoices", null, "=")
	R.set_value(c, "m_FemaleJetPassedVoices", null, "=")
	R.set_value(c, "m_FemaleHelicopterVoices", null, "=")
	R.set_value(c, "m_FemaleMutantArrivedVoices", null, "=")
	R.set_value(c, "m_FemaleProtectTaskVoices", null, "=")
	R.set_value(c, "m_FemaleBulletHitVoices", null, "=")
	R.set_value(c, "m_FemaleDriverDiedVoices", null, "=")
	R.set_value(c, "m_FemaleMedShotVoices", null, "=")
	R.set_value(c, "m_FemaleBashClingerVoices", null, "=")
	R.set_value(c, "m_ChopperSupportReadyVoices", null, "=")
	R.set_value(c, "m_ChopperSupportLeavesVoices", null, "=")
	R.set_value(c, "m_ChopperSupportAcknowledgeVoices", null, "=")
	R.set_value(c, "m_TurkeyGetInVocie", null, "=")
	R.set_value(c, "m_HeadShotDialog", null, "=")
	R.set_value(c, "Event_Failed", "Event_Failed", "=")
	R.set_value(c, "Event_WeaponChanged", "Event_WeaponChanged", "=")
	R.set_value(c, "Event_PreWeaponChanged", "Event_PreWeaponChanged", "=")
	R.set_value(c, "Event_CivCountUpdated", "Event_CivCountUpdated", "=")
	R.set_value(c, "Event_CivilianDropped", "Event_CivilianDropped", "=")
	R.set_value(c, "Event_CivilianTaken", "Event_CivilianTaken", "=")
	R.set_value(c, "Event_AimingLevelUp", "Event_AimingLevelUp", "=")
	R.set_value(c, "Event_HandlingLevelUp", "Event_HandlingLevelUp", "=")
	R.set_value(c, "Event_ReloadingLevelUp", "Event_ReloadingLevelUp", "=")
	R.set_value(c, "Event_DrivingLevelUp", "Event_DrivingLevelUp", "=")
	R.set_value(c, "Event_ToughnessLevelUp", "Event_ToughnessLevelUp", "=")
	R.set_value(c, "Event_TaskStarted", "Event_TaskStarted", "=")
	R.set_value(c, "Event_DialogFinished", "Event_DialogFinished", "=")
	R.set_value(c, "Speaker_Diane", 0, "=")
	R.set_value(c, "Speaker_Cocheta", 1, "=")
	R.set_value(c, "Speaker_Center", 2, "=")
	R.set_value(c, "Task_None", 0, "=")
	R.set_value(c, "Task_RepairRadio", 1, "=")
	R.set_value(c, "Task_SecureCivilian", 2, "=")
	R.set_value(c, "Task_UpgradeWeaponDamage", 3, "=")
	R.set_value(c, "Task_UpgradeWeaponAccuracy", 4, "=")
	R.set_value(c, "Task_UpgradeWeaponCapacity", 5, "=")
	R.set_value(c, "Task_ReplenishAmmo", 6, "=")
	R.set_value(c, "Task_MountedMG", 7, "=")
	R.set_value(c, "Task_RocketLauncher", 8, "=")
	R.set_value(c, "Task_Tire", 9, "=")
	R.set_value(c, "Task_Obsolete", 10, "=")
	R.set_value(c, "Task_Engine", 11, "=")
	R.set_value(c, "Task_Bumper", 12, "=")
	R.set_value(c, "Task_UnlockWeapon", 13, "=")
	R.set_value(c, "Task_AmmoPoint", 14, "=")
	R.set_value(c, "Task_MedShield", 15, "=")
	R.set_value(c, "Task_MedHeal", 16, "=")
	R.set_value(c, "Task_ChopperSupport", 17, "=")
	R.set_value(c, "Task_AmmoPickup", 18, "=")
	R.set_value(c, "Task_LowerCost", 19, "=")
	R.set_value(c, "Task_DriverSwitch", 20, "=")
	R.set_value(c, "Task_TaskSpeed", 21, "=")
	R.set_value(c, "Task_LevelUp", 22, "=")
	R.set_value(c, "Task_RepairTire", 23, "=")
	R.set_value(c, "Task_RepairEngine", 24, "=")
	R.set_value(c, "Task_RepairBumper", 25, "=")
	R.set_value(c, "SwitchDriverDuration", R.construct(R.klass("Array"), [2, 1.7, 1.4, 1.1, 0.8, 0.5]), "=")
	R.set_value(c, "TaskSpeedMultiplier", R.construct(R.klass("Array"), [1.3, 1.6, 1.9, 2.2, 2.5, 2.8]), "=")
	R.set_value(c, "AmmoPickupRatios", R.construct(R.klass("Array"), [0.5, 0.6, 0.7, 0.8, 0.9, 1]), "=")
	R.set_value(c, "LevelUpMultipliers", R.construct(R.klass("Array"), [1, 1.1, 1.2, 1.3, 1.4, 1.5]), "=")
	R.set_value(c, "CostMultipliers", R.construct(R.klass("Array"), [1, 0.9, 0.8, 0.7, 0.6, 0.5]), "=")
	R.set_value(c, "ChopperSupportDistance", R.construct(R.klass("Array"), [1000, 2000, 3000, 4000]), "=")
	R.set_value(c, "ChopperSupportDuration", R.construct(R.klass("Array"), [0, 15, 20, 25, 30, 35]), "=")
	R.set_value(c, "JohnCarEngineFactor", 1.2, "=")
	R.set_value(c, "MountedWeaponSlot", 4, "=")
	R.set_value(c, "MaxOrganicLevel", 9, "=")
	R.set_value(c, "MaxUpgradeLevel", 5, "=")
	R.set_value(c, "DrivingLevelPoints", R.construct(R.klass("Array"), [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]), "=")
	R.set_value(c, "DrivingPointsPerTurning", 0.0075, "=")
	R.set_value(c, "ToughnessLevelPoints", R.construct(R.klass("Array"), [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]), "=")
	R.set_value(c, "ToughnessPerExplosionDamage", 0.1, "=")
	R.set_value(c, "ToughnessPointsForLightCollision", 1, "=")
	R.set_value(c, "ToughnessPointsForMediumCollision", 3, "=")
	R.set_value(c, "ToughnessPointsForHardCollision", 5, "=")
	R.set_value(c, "ToughnessPointsForHugeCollision", 10, "=")
	R.set_value(c, "ToughnessDamageReduction", R.construct(R.klass("Array"), [0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45]), "=")
	R.set_value(c, "ToughnessStruggleDamage", R.construct(R.klass("Array"), [20, 24, 28, 32, 36, 40, 44, 48, 52, 56]), "=")
	R.set_value(c, "ToughnessStruggleKillDelay", R.construct(R.klass("Array"), [0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06, 0.06]), "=")
	R.set_value(c, "SwitchWeaponDurationMin", 1, "=")
	R.set_value(c, "SwitchWeaponDurationMax", 0.3, "=")
	R.set_value(c, "ExplosionDamageFactor", 0.5, "=")
	R.set_value(c, "LowHealth", 25, "=")
	R.set_value(c, "LowHealthDuration", 4.5, "=")
	R.set_value(c, "EngineState_Unset", R.unary("-", 1), "=")
	R.set_value(c, "EngineState_Idle", 0, "=")
	R.set_value(c, "EngineState_Accel", 1, "=")
	R.set_value(c, "EngineState_MaxSpeed", 2, "=")
	R.set_value(c, "EngineState_DeccelNoBrake", 3, "=")
	R.set_value(c, "EngineState_DeccelBrake", 4, "=")
	R.set_value(c, "EngineState_DeccelHandBrake", 5, "=")
	R.set_value(c, "EngineState_Exploded", 6, "=")
	R.set_value(c, "AccelTimes", R.construct(R.klass("Array"), [0, 3.27, 6.1, 11.6, 24]), "=")
	R.set_value(c, "DeccelNoBrakeTimes", R.construct(R.klass("Array"), [20.485, 16.55, 14.3, 9.3, 0]), "=")
	R.set_value(c, "DeccelBrakeTimes", R.construct(R.klass("Array"), [4.002, 3.2, 2.25, 0.92, 0]), "=")
	R.set_value(c, "AccelDeccelTimeFactors", R.construct(R.klass("Array"), [0.8, 0.7, 0.6, 0.5, 0.4, 0.3]), "=")
	R.set_value(c, "MaxAccelTimeAccel", 24, "=")
	R.set_value(c, "MaxAccelTimeDeccelNoBrake", 20.485, "=")
	R.set_value(c, "MaxAccelTimeDeccelBrake", 4.002, "=")
	R.set_value(c, "HandState_OnWheel", 0, "=")
	R.set_value(c, "HandState_Down", 1, "=")
	R.set_value(c, "BumperStage_Fine", 0, "=")
	R.set_value(c, "BumperStage_Broken1", 1, "=")
	R.set_value(c, "BumperStage_Broken2", 2, "=")
	R.set_value(c, "BumperStage_Broken3", 3, "=")
	R.set_value(c, "BumperStage_Smoke", 4, "=")
	R.set_value(c, "BumperStage_Fire", 5, "=")
	R.set_value(c, "BumperStage_Explode", 6, "=")
	R.set_value(c, "MaxSteeringWheelRotation", 25, "=")
	R.set_value(c, "MaxSteeringWheelRotationRatioForCurve", 2, "=")
	R.set_value(c, "HitAlign_None", R.unary("-", 1), "=")
	R.set_value(c, "HitAlign_DeadCenter", 0, "=")
	R.set_value(c, "HitAlign_Center", 1, "=")
	R.set_value(c, "HitAlign_FrontSideLeft", 2, "=")
	R.set_value(c, "HitAlign_FrontSideRight", 3, "=")
	R.set_value(c, "HitAlign_SideLeft", 4, "=")
	R.set_value(c, "HitAlign_SideRight", 5, "=")
	R.set_value(c, "FailType_None", R.unary("-", 1), "=")
	R.set_value(c, "FailType_Explosion", 0, "=")
	R.set_value(c, "FailType_ZombieKill", 1, "=")
	R.set_value(c, "FailType_Shot", 2, "=")
	R.set_value(c, "FailType_BodyKill", 3, "=")
	R.set_value(c, "DeathType_None", 0, "=")
	R.set_value(c, "DeathType_Zombie", 1, "=")
	R.set_value(c, "DeathType_Military", 2, "=")
	R.set_value(c, "DeathType_Crash", 3, "=")
	R.set_value(c, "DeathType_Helicopter", 4, "=")
	R.set_value(c, "DeathType_Jet", 5, "=")
	R.set_value(c, "DeathType_MissingEnding", 6, "=")
	R.set_value(c, "VoicePriority_Generic", 0, "=")
	R.set_value(c, "VoicePriority_Extra", 1, "=")
	R.set_value(c, "VoicePriority_Gameplay", 2, "=")
	R.set_value(c, "VoicePriority_CrucialGameplay", 3, "=")
	R.set_value(c, "VoicePriority_Crucial", 4, "=")
	R.set_value(c, "DeadCenterHitRange", 0.1, "=")
	R.set_value(c, "CenterHitRange", 0.3, "=")
	R.set_value(c, "FrontSideHitRange", 0.6, "=")
	R.set_value(c, "HugeCollisionSpeed", R.binary("/", R.binary("/", (float(70) * float(1000)), 60), 60), "=")
	R.set_value(c, "HardCollisionSpeed", R.binary("/", R.binary("/", (float(40) * float(1000)), 60), 60), "=")
	R.set_value(c, "MediumCollisionSpeed", R.binary("/", R.binary("/", (float(15) * float(1000)), 60), 60), "=")
	R.set_value(c, "MinClingSpeed", R.binary("/", R.binary("/", (float(5) * float(1000)), 60), 60), "=")
	R.set_value(c, "ExplosionBumperDamage", 60, "=")
	R.set_value(c, "MinExplosionBodyHP", 10, "=")
	R.set_value(c, "BodyDamageAbsorbtionMin", 0, "=")
	R.set_value(c, "BodyDamageAbsorbtionMax", 0.75, "=")
	R.set_value(c, "BodyRecoveryMin", 1, "=")
	R.set_value(c, "BodyRecoveryMax", 2.5, "=")
	R.set_value(c, "SmokeSpeedToSkewFactor", 0.02, "=")
	R.set_value(c, "FireSpeedToSkewFactor", 0.01, "=")
	R.set_value(c, "SpeedRatios", R.construct(R.klass("Array"), [0, 0.4, 0.6, 0.75, 1]), "=")
	R.set_value(c, "EngineSpeeds", R.construct(R.klass("Array"), [R.binary("/", R.binary("/", (float(75) * float(1000)), 60), 60), R.binary("/", R.binary("/", (float(78) * float(1000)), 60), 60), R.binary("/", R.binary("/", (float(81) * float(1000)), 60), 60), R.binary("/", R.binary("/", (float(84) * float(1000)), 60), 60), R.binary("/", R.binary("/", (float(87) * float(1000)), 60), 60), R.binary("/", R.binary("/", (float(90) * float(1000)), 60), 60)]), "=")
	R.set_value(c, "BumperSpeedLossFactors", R.construct(R.klass("Array"), [1, 0.9, 0.8, 0.7, 0.6, 0.5]), "=")
	R.set_value(c, "BumperDamageAbsorbtions", R.construct(R.klass("Array"), [0, 0.1, 0.2, 0.3, 0.4, 0.5]), "=")
	R.set_value(c, "BumperDamageCutOffs", R.construct(R.klass("Array"), [0, 2, 4, 6, 8, 10]), "=")
	R.set_value(c, "EngineDamageAbsorbtions", R.construct(R.klass("Array"), [0, 0.1, 0.2, 0.3, 0.4, 0.5]), "=")
	R.set_value(c, "OilDurations", R.construct(R.klass("Array"), [4, 3.5, 3, 2.5, 2, 1.5]), "=")
	R.set_value(c, "OilControlFactor", R.construct(R.klass("Array"), [0.25, 0.3, 0.35, 0.4, 0.45, 0.5]), "=")
	R.set_value(c, "OilFactorPower", 2, "=")
	R.set_value(c, "OilSideMovementMins", R.construct(R.klass("Array"), [R.unary("-", 6), R.unary("-", 5), R.unary("-", 4), R.unary("-", 3), R.unary("-", 2), R.unary("-", 1)]), "=")
	R.set_value(c, "OilSideMovementRandoms", R.construct(R.klass("Array"), [12, 10, 8, 6, 4, 2]), "=")
	R.set_value(c, "TireSpikeDamages", R.construct(R.klass("Array"), [4, 3, 2, 1, 0.5, 0.25]), "=")
	R.set_value(c, "TireBiasDurationMins", R.construct(R.klass("Array"), [2, 1.5, 1.25, 1, 0.75, 0.5]), "=")
	R.set_value(c, "TireBiasDurationRandoms", R.construct(R.klass("Array"), [6, 5, 4, 3, 2, 1]), "=")
	R.set_value(c, "TireBiasStrengthMins", R.construct(R.klass("Array"), [1, 1.5, 2, 2.5, 3, 3.5]), "=")
	R.set_value(c, "TireBiasStrengthRandoms", R.construct(R.klass("Array"), [1, 2, 3, 4, 5, 6]), "=")
	R.set_value(c, "BlownTireControlFactors", R.construct(R.klass("Array"), [0.9, 0.8, 0.7, 0.6, 0.5, 0.4]), "=")
	R.set_value(c, "XMaxSpeedMin", 3, "=")
	R.set_value(c, "XMaxSpeedMax", 5, "=")
	R.set_value(c, "XMaxSpeedBonus", R.binary("/", 4, 5), "=")
	R.set_value(c, "XAccelMin", 15, "=")
	R.set_value(c, "XAccelMax", 25, "=")
	R.set_value(c, "XAccelBonus", R.binary("/", 15, 5), "=")
	R.set_value(c, "XDeccelMin", 15, "=")
	R.set_value(c, "XDeccelMax", 25, "=")
	R.set_value(c, "XDeccelBonus", R.binary("/", 15, 5), "=")
	R.set_value(c, "XMaxSpeedHandBrakeMin", 4, "=")
	R.set_value(c, "XMaxSpeedHandBrakeMax", 8, "=")
	R.set_value(c, "XMaxSpeedHandBrakeBonus", R.binary("/", 4, 5), "=")
	R.set_value(c, "XAccelHandBrakeMin", 20, "=")
	R.set_value(c, "XAccelHandBrakeMax", 35, "=")
	R.set_value(c, "XAccelHandBrakeBonus", R.binary("/", 15, 5), "=")
	R.set_value(c, "XDeccelHandBrakeMin", 20, "=")
	R.set_value(c, "XDeccelHandBrakeMax", 35, "=")
	R.set_value(c, "XDeccelHandBrakeBonus", R.binary("/", 15, 5), "=")
	R.set_value(c, "XBumpDeccelMin", 4, "=")
	R.set_value(c, "XBumpDeccelMax", 12, "=")
	R.set_value(c, "XBumpSpeedMin", 60, "=")
	R.set_value(c, "XBumpSpeedMax", 30, "=")
	R.set_value(c, "XBumpShakeMin", 1, "=")
	R.set_value(c, "XBumpShakeMax", 0.25, "=")
	R.set_value(c, "XBumpExplosionDeccelMin", 2, "=")
	R.set_value(c, "XBumpExplosionDeccelMax", 8, "=")
	R.set_value(c, "XBumpExplosionSpeedMin", 30, "=")
	R.set_value(c, "XBumpExplosionSpeedMax", 10, "=")
	R.set_value(c, "ArmBloodRate", 10, "=")
	R.set_value(c, "ArmBloodFadeRate", 1, "=")
	R.set_value(c, "BumperBroken1MinHP", 68, "=")
	R.set_value(c, "BumperBroken2MinHP", 52, "=")
	R.set_value(c, "BumperBroken3MinHP", 36, "=")
	R.set_value(c, "BumperSmokeMinHP", 20, "=")
	R.set_value(c, "BumperRepairHP", 80, "=")
	R.set_value(c, "MaxCivInCar", 5, "=")
	R.set_value(c, "PickupPointDistance", 10, "=")
	R.set_value(c, "NotMovingVoiceDelay", 2, "=")
	R.set_value(c, "LavaDelay", 0.25, "=")
	R.set_value(c, "RadioPriority_Generic", 0, "=")
	R.set_value(c, "RadioPriority_AirSupport", 1, "=")
	R.set_value(c, "RadioPriority_Story", 2, "=")
	R.set_value(c, "MedShieldDuration", 10, "=")
	R.set_value(c, "CummulativeBodyDamageDrain", 10, "=")
	R.set_value(c, "LowHealthEffectDamage", 30, "=")
	R.set_value(c, "m_iCivGetInVoiceTime", 0, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_IdleSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_AccelSounds"] = R.coerce(null, "Array")
	(c).fields["m_MaxSpeedSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DeccelNoBrakeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DeccelBrakeSounds"] = R.coerce(null, "Array")
	(c).fields["m_BrakeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_GrassSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_LavaSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HornSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HornCarSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_SideScrapingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_SmokingEngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_BulletHitFleshSounds"] = R.coerce(null, "Array")
	(c).fields["m_iBulletHitFleshIndex"] = R.coerce(0, "int")
	(c).fields["m_BurningEngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_LightCollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_MediumCollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_HardCollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_HugeCollisionSounds"] = R.coerce(null, "RandomHat")
	(c).fields["m_TireBlowSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_TireAlreadyBlownSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_TireScrapingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_OilSlickSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DoorOpenSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_DoorCloseSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_MedSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_EarRingingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fMaxSpeed"] = float(NAN)
	(c).fields["m_fXMaxSpeed"] = float(NAN)
	(c).fields["m_fXAccel"] = float(NAN)
	(c).fields["m_fXDeccel"] = float(NAN)
	(c).fields["m_fXMaxSpeedHandBrake"] = float(NAN)
	(c).fields["m_fXAccelHandBrake"] = float(NAN)
	(c).fields["m_fXDeccelHandBrake"] = float(NAN)
	(c).fields["m_fDesiredSpeedX"] = float(NAN)
	(c).fields["m_fPreEffectVelocityX"] = float(NAN)
	(c).fields["m_fEngineScale"] = float(NAN)
	(c).fields["m_bGoForward"] = false
	(c).fields["m_bGoBackward"] = false
	(c).fields["m_bSteeringLeft"] = false
	(c).fields["m_bSteeringRight"] = false
	(c).fields["m_bHandBraking"] = false
	(c).fields["m_bForceBrake"] = false
	(c).fields["m_fWheelDirection"] = float(NAN)
	(c).fields["m_iEngineState"] = R.coerce(0, "int")
	(c).fields["m_iOldEngineState"] = R.coerce(0, "int")
	(c).fields["m_fEngineTime"] = float(NAN)
	(c).fields["m_iGear"] = R.coerce(0, "int")
	(c).fields["m_fGearRatio"] = float(NAN)
	(c).fields["m_currentEngineSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_currentTireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iLeftHandState"] = R.coerce(0, "int")
	(c).fields["m_bIsSideScraping"] = false
	(c).fields["m_bIsSideScrapingRight"] = false
	(c).fields["m_bHorning"] = false
	(c).fields["m_AllDashboardBloods"] = R.coerce(null, "Array")
	(c).fields["m_DashboardCenterBloods"] = R.coerce(null, "Array")
	(c).fields["m_DashboardFrontSideLeftBloods"] = R.coerce(null, "Array")
	(c).fields["m_DashboardFrontSideRightBloods"] = R.coerce(null, "Array")
	(c).fields["m_DashboardSideLeftBloods"] = R.coerce(null, "Array")
	(c).fields["m_DashboardSideRightBloods"] = R.coerce(null, "Array")
	(c).fields["m_fBodyHP"] = float(NAN)
	(c).fields["m_fBumpStrength"] = float(NAN)
	(c).fields["m_fBumpSpeed"] = float(NAN)
	(c).fields["m_fBumpDeccel"] = float(NAN)
	(c).fields["m_fBumperSpeedLossFactor"] = float(NAN)
	(c).fields["m_fBumperDamageCutOff"] = float(NAN)
	(c).fields["m_fBumperDamageAbsorbtion"] = float(NAN)
	(c).fields["m_fEngineDamageAbsorbtion"] = float(NAN)
	(c).fields["m_ClingerLeft"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_ClingerRight"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_ClingerSideLeft"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_ClingerSideRight"] = R.coerce(null, "RDHumanoid")
	(c).fields["m_bFailed"] = false
	(c).fields["m_iFailType"] = R.coerce(0, "int")
	(c).fields["m_fOilDuration"] = float(NAN)
	(c).fields["m_fOilTime"] = float(NAN)
	(c).fields["m_fOilFactor"] = float(NAN)
	(c).fields["m_fOilControlFactor"] = float(NAN)
	(c).fields["m_iNbBlownTires"] = R.coerce(0, "int")
	(c).fields["m_fTireBiasDurationMin"] = float(NAN)
	(c).fields["m_fTireBiasDurationRandom"] = float(NAN)
	(c).fields["m_fTireBiasStrengthMin"] = float(NAN)
	(c).fields["m_fTireBiasStrengthRandom"] = float(NAN)
	(c).fields["m_bTireBiasRight"] = false
	(c).fields["m_fTireBiasTimer"] = float(NAN)
	(c).fields["m_fTireBiasDuration"] = float(NAN)
	(c).fields["m_fTireBiasStrength"] = float(NAN)
	(c).fields["m_fTargetTireBiasStrength"] = float(NAN)
	(c).fields["m_fBlownTireControlFactor"] = float(NAN)
	(c).fields["m_TireScrapingShake"] = R.coerce(null, "RDCameraShake")
	(c).fields["m_fMaxBlownTireShake"] = float(NAN)
	(c).fields["m_fMaxBlownTireVolume"] = float(NAN)
	(c).fields["m_iBumperLevel"] = R.coerce(0, "int")
	(c).fields["m_fMaleArmBloodLevel"] = float(NAN)
	(c).fields["m_fFemaleArmBloodLevel"] = float(NAN)
	(c).fields["m_MCCarInterior"] = R.coerce(null, "MovieClip")
	(c).fields["m_MCCarBack"] = R.coerce(null, "MovieClip")
	(c).fields["m_bReactedToHoodEnemy"] = false
	(c).fields["m_RadioCommSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iRadioCommPriority"] = R.coerce(0, "int")
	(c).fields["m_bIsOnSmoke"] = false
	(c).fields["m_bIsOnFire"] = false
	(c).fields["m_bEnteredRamp"] = false
	(c).fields["m_bDeathRaceStarted"] = false
	(c).fields["m_fDeathRaceStartPos"] = float(NAN)
	(c).fields["m_bFuckWheelsStarted"] = false
	(c).fields["m_fFuckWheelsStartPos"] = float(NAN)
	(c).fields["m_bDoingSlipAndSlide"] = false
	(c).fields["m_vFiringArmPos"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_fFiringArmRot"] = float(NAN)
	(c).fields["m_fTargetAimingX"] = float(NAN)
	(c).fields["m_fTargetAimingY"] = float(NAN)
	(c).fields["m_fAimingX"] = float(NAN)
	(c).fields["m_fAimingY"] = float(NAN)
	(c).fields["m_fAimingRatioX"] = float(NAN)
	(c).fields["m_fAimingRatioY"] = float(NAN)
	(c).fields["m_fHandlingInfluenceX"] = float(NAN)
	(c).fields["m_fHandlingInfluenceY"] = float(NAN)
	(c).fields["m_WeaponPistolCocheta"] = R.coerce(null, "RDWeaponPistol")
	(c).fields["m_WeaponPistolDiane"] = R.coerce(null, "RDWeaponPistol")
	(c).fields["m_WeaponMAC11"] = R.coerce(null, "RDWeaponMAC11")
	(c).fields["m_WeaponSPAS12"] = R.coerce(null, "RDWeaponSPAS12")
	(c).fields["m_WeaponMP5"] = R.coerce(null, "RDWeaponMP5")
	(c).fields["m_WeaponShotgun"] = R.coerce(null, "RDWeaponShotgun")
	(c).fields["m_WeaponM16"] = R.coerce(null, "RDWeaponM16")
	(c).fields["m_WeaponM60"] = R.coerce(null, "RDWeaponM60")
	(c).fields["m_WeaponRocketLauncher"] = R.coerce(null, "RDWeaponRocketLauncher")
	(c).fields["m_WeaponMountedMG"] = R.coerce(null, "RDWeaponMountedMG")
	(c).fields["m_CustomWeaponRocketLauncher"] = R.coerce(null, "RDWeaponRocketLauncher")
	(c).fields["m_CustomWeaponMountedMG"] = R.coerce(null, "RDWeaponMountedMG")
	(c).fields["m_WeaponsCocheta"] = R.coerce(R.construct(R.klass("Array"), [5]), "Array")
	(c).fields["m_WeaponsDiane"] = R.coerce(R.construct(R.klass("Array"), [5]), "Array")
	(c).fields["m_Weapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_iWeapon"] = R.coerce(0, "int")
	(c).fields["m_iWeaponCocheta"] = R.coerce(0, "int")
	(c).fields["m_iWeaponDiane"] = R.coerce(0, "int")
	(c).fields["m_bGunDown"] = false
	(c).fields["m_bGunRaising"] = false
	(c).fields["m_fGunRaiseTimer"] = float(NAN)
	(c).fields["m_fGunRaiseDuration"] = float(NAN)
	(c).fields["m_fGunDownTimer"] = float(NAN)
	(c).fields["m_fGunDownDuration"] = float(NAN)
	(c).fields["m_WeaponPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_iDesiredWeapon"] = R.coerce(0, "int")
	(c).fields["m_bSwitchingWeapon"] = false
	(c).fields["m_fSwitchWeaponTime"] = float(NAN)
	(c).fields["m_fSwitchWeaponDuration"] = float(NAN)
	(c).fields["m_bWantsToFire"] = false
	(c).fields["m_bSwitchingDriver"] = false
	(c).fields["m_fSwitchDriverTime"] = float(NAN)
	(c).fields["m_bSwitchDriverPlayDoorSounds"] = false
	(c).fields["m_BulletHitInteriorEffects"] = R.coerce(null, "Array")
	(c).fields["m_BulletHitClingerEffects"] = R.coerce(null, "Array")
	(c).fields["m_BulletHitClingerEffectsAprilsFool"] = R.coerce(null, "Array")
	(c).fields["m_BulletHitInteriorSounds"] = R.coerce(null, "Array")
	(c).fields["m_BulletHitClingerSounds"] = R.coerce(null, "Array")
	(c).fields["m_BlockedHeadBulletHitClingerEffects"] = R.coerce(null, "Array")
	(c).fields["m_BlockedHeadBulletHitClingerSounds"] = R.coerce(null, "Array")
	(c).fields["m_BlockedTorsoBulletHitClingerEffects"] = R.coerce(null, "Array")
	(c).fields["m_BlockedTorsoBulletHitClingerSounds"] = R.coerce(null, "Array")
	(c).fields["m_ClosestLocation"] = R.coerce(null, "RDEntity")
	(c).fields["m_fClosestLocationDistance"] = float(NAN)
	(c).fields["m_iCurrentTask"] = R.coerce(0, "int")
	(c).fields["m_fTaskDuration"] = float(NAN)
	(c).fields["m_fTaskTime"] = float(NAN)
	(c).fields["m_iTaskCost"] = R.coerce(0, "int")
	(c).fields["m_TaskLocation"] = R.coerce(null, "RDEntity")
	(c).fields["m_bDoTaskVoice"] = false
	(c).fields["m_bDoProtectTaskVoice"] = false
	(c).fields["m_bTaskCanBeInterrupted"] = false
	(c).fields["m_fTaskSoundTimer"] = float(NAN)
	(c).fields["m_TaskSound"] = R.coerce(null, "DTSound")
	(c).fields["m_TaskVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_EquipWeaponSound"] = R.coerce(null, "DTSound")
	(c).fields["m_UnequipWeaponSound"] = R.coerce(null, "DTSound")
	(c).fields["m_ClingLoopVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fNotMovingTimer"] = float(NAN)
	(c).fields["m_bPlayFullCivVoice"] = false
	(c).fields["m_bPlayCivGetInVoice"] = false
	(c).fields["m_bZombieKilledDriver"] = false
	(c).fields["m_UpgradedWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_iLastArea"] = R.coerce(0, "int")
	(c).fields["m_fMountedMGMuzzlePos"] = float(NAN)
	(c).fields["m_bPlayDriverDeathVoice"] = false
	(c).fields["m_bChopperMode"] = false
	(c).fields["m_bDoFirstUpdateInit"] = false
	(c).fields["m_GameModeGameplay"] = R.coerce(null, "RDGameModeGameplay")
	(c).fields["m_iShotFrame"] = R.coerce(0, "int")
	(c).fields["m_fPlayHitCivilianVoiceTime"] = float(NAN)
	(c).fields["m_FlySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iLastExplosionTick"] = R.coerce(0, "int")
	(c).fields["m_bWasOnGrass"] = false
	(c).fields["m_fDeathWeaponSoundDelay"] = float(0)
	(c).fields["m_fDeathWeaponSoundTime"] = float(0)
	(c).fields["m_DeathWeapon"] = R.coerce(null, "RDWeapon")
	(c).fields["m_bDeathWeaponFiring"] = false
	(c).fields["m_GrassShake"] = R.coerce(null, "RDCameraShake")
	(c).fields["m_fMedShieldTimer"] = float(NAN)
	(c).fields["m_fSideGrindingBlood"] = float(NAN)
	(c).fields["m_fShootingBlood"] = float(NAN)
	(c).fields["m_fLowHealthTimer"] = float(NAN)
	(c).fields["m_bStartMutantSandwich"] = false
	(c).fields["m_bStartedPerfectDefense"] = false
	(c).fields["m_bStartWhenOurPowersCombine"] = false
	(c).fields["m_iWhenOurPowersCombineSwitches"] = R.coerce(0, "int")
	(c).fields["m_fClingPatrolDistance"] = float(NAN)
	(c).fields["m_fEngineSoundPosition"] = float(NAN)
	(c).fields["m_bEngineSoundLooping"] = false
	(c).fields["m_fLowHealthVoicePosition"] = float(NAN)
	(c).fields["m_bEarRingingWasPlaying"] = false
	(c).fields["m_fEarRingingSoundPosition"] = float(NAN)
	(c).fields["m_fClingLoopPosition"] = float(NAN)
	(c).fields["m_fRelativeLocationX"] = float(NAN)
	(c).fields["m_fLastCurveRotation"] = float(NAN)
	(c).fields["m_iVoiceSpeaker"] = R.coerce(0, "int")
	(c).fields["m_CallChopperSupportVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlayChopperSupportAcknowledgeVoice"] = false
	(c).fields["m_bLastSideClingerSide"] = false
	(c).fields["m_Dialog"] = R.coerce(null, "Array")
	(c).fields["m_DialogLine"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_iDialogPriority"] = R.coerce(0, "int")
	(c).fields["m_fCummulativeBodyDamage"] = float(0)
	(c).fields["m_DriverHasLowHealthVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bInEnding"] = false
	(c).fields["m_iEndingType"] = R.coerce(0, "int")
	(c).fields["m_fVerticalCurve"] = float(NAN)
	(c).fields["m_bFullSpeedMode"] = false
	(c).fields["m_fMaxSpeedFactor"] = float(NAN)
	(c).fields["m_fTargetMaxSpeedFactor"] = float(NAN)
	(c).fields["m_bCallMutantArrived"] = false
	(c).fields["m_fLavaTimer"] = float(NAN)
	(c).fields["m_bPaused"] = false
	(c).fields["m_bPauseForAbort"] = false
	(c).fields["m_ClingerZombieNormalMaleLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieHardLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubLeftUnder"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieSoldierLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieVeryHardLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerSoldierLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieHardInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieSoldierInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieVeryHardInsideLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieHardRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubRightUnder"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieSoldierRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieVeryHardRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerSoldierRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalMaleNewInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieNormalFemaleNewInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieHardInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieGrubInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieSoldierInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerZombieVeryHardInsideRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_SideGrapplerLeft"] = R.coerce(null, "MovieClip")
	(c).fields["m_SideGrapplerRight"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerContainerHood"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerContainerInside"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerContainerUnder"] = R.coerce(null, "MovieClip")
	(c).fields["m_ClingerContainerSide"] = R.coerce(null, "MovieClip")
	(c).fields["m_AllClingerMCs"] = R.coerce(null, "Array")
	return null
