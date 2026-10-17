extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponM60(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponM60"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("LMG", "String")
	c.fields["m_szAnimName"] = R.coerce("m60", "String")
	c.fields["m_iDamageType"] = R.coerce(R.static_value("RDDamageType", "ShreddingBullet"), "int")
	c.fields["m_bAutoFire"] = true
	c.fields["m_fShakeStrength"] = float(0.02)
	c.fields["m_fShakeDuration"] = float(0.05)
	c.fields["m_fAmmoDisplaySpacing"] = float(5)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(2, "int")
	c.fields["m_iNbFireAnims"] = R.coerce(2, "int")
	c.fields["m_AimingSpeedMin"] = float(2.5)
	c.fields["m_AimingSpeedMax"] = float(15)
	c.fields["m_BaseBulletSpreadMin"] = float(140)
	c.fields["m_BaseBulletSpreadMax"] = float(80)
	c.fields["m_BulletSpreadMin"] = float(60)
	c.fields["m_BulletSpreadMax"] = float(40)
	c.fields["m_MaxBulletSpreadMin"] = float(1000)
	c.fields["m_MaxBulletSpreadMax"] = float(500)
	c.fields["m_SpreadRecoveryMin"] = float(0.6)
	c.fields["m_SpreadRecoveryMax"] = float(1.5)
	c.fields["m_HandlingInfluenceMin"] = float(44)
	c.fields["m_HandlingInfluenceMax"] = float(13)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(1)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(7)
	c.fields["m_DamageMin"] = float(18)
	c.fields["m_DamageMax"] = float(36)
	c.fields["m_MaxAmmoMin"] = float(250)
	c.fields["m_MaxAmmoMax"] = float(500)
	c.fields["m_MagSizeMin"] = float(50)
	c.fields["m_MagSizeMax"] = float(100)
	R.call_member(c, "FixWeaponStats", [])
	c.fields["m_fHandlingPointsPerShot"] = float(8)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(9, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(230, "int")
	c.fields["m_BulletCaseClass"] = R.coerce(R.klass("MC_casingdroplmg"), "Class")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Fire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_FireEndSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60FireEnd"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound1"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Reload1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound2"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Reload2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound3"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Reload3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound4"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Reload4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Description", "The Large Machine Gun (LMG) doesn't have good accuracy but makes up for it in fire power and magazine size. Reloading is slow so be careful.", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
