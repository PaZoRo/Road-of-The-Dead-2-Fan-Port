extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponRocketLauncher(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponRocketLauncher"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Rocket Launcher", "String")
	c.fields["m_szAnimName"] = R.coerce("rocketlauncher", "String")
	c.fields["m_bMountedWeapon"] = true
	c.fields["m_bFireProjectile"] = true
	c.fields["m_ProjectileClass"] = R.coerce(R.klass("RDMissileAlly"), "Class")
	c.fields["m_fShakeStrength"] = float(0.1)
	c.fields["m_fShakeDuration"] = float(0.5)
	c.fields["m_bDisplayAmmoInMag"] = false
	c.fields["m_bDisplayMagAsBag"] = true
	c.fields["m_fAmmoDisplaySpacing"] = float(5)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(2, "int")
	c.fields["m_iNbFireAnims"] = R.coerce(1, "int")
	c.fields["m_AimingSpeedMin"] = float(3)
	c.fields["m_AimingSpeedMax"] = float(3)
	c.fields["m_BaseBulletSpreadMin"] = float(300)
	c.fields["m_BaseBulletSpreadMax"] = float(300)
	c.fields["m_BulletSpreadMin"] = float(0)
	c.fields["m_BulletSpreadMax"] = float(0)
	c.fields["m_MaxBulletSpreadMin"] = float(300)
	c.fields["m_MaxBulletSpreadMax"] = float(300)
	c.fields["m_SpreadRecoveryMin"] = float(0)
	c.fields["m_SpreadRecoveryMax"] = float(0)
	c.fields["m_HandlingInfluenceMin"] = float(30)
	c.fields["m_HandlingInfluenceMax"] = float(30)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(5)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(19)
	c.fields["m_DamageMin"] = float(1000)
	c.fields["m_DamageMax"] = float(1000)
	c.fields["m_MaxAmmoMin"] = float(50)
	c.fields["m_MaxAmmoMax"] = float(50)
	c.fields["m_MagSizeMin"] = float(50)
	c.fields["m_MagSizeMax"] = float(50)
	c.fields["m_fFireDelayMin"] = float(1)
	c.fields["m_fFireDelayMax"] = float(1)
	c.fields["m_fHandlingPointsPerShot"] = float(2)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(1, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(2, "int")
	c.fields["m_BulletCaseClass"] = R.coerce(R.klass("MC_casingdroplmg"), "Class")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_RocketLaunch"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
