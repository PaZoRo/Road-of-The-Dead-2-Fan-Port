extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponMountedMG(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponMountedMG"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Mounted MG", "String")
	c.fields["m_szAnimName"] = R.coerce("mountedmg", "String")
	c.fields["m_bAutoFire"] = true
	c.fields["m_bMountedWeapon"] = true
	c.fields["m_fShakeStrength"] = float(0.04)
	c.fields["m_fShakeDuration"] = float(0.1)
	c.fields["m_bDisplayAmmoInMag"] = false
	c.fields["m_bDisplayMagAsBag"] = true
	c.fields["m_fAmmoDisplaySpacing"] = float(5)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(2, "int")
	c.fields["m_iNbFireAnims"] = R.coerce(1, "int")
	c.fields["m_AimingSpeedMin"] = float(5)
	c.fields["m_AimingSpeedMax"] = float(5)
	c.fields["m_BaseBulletSpreadMin"] = float(150)
	c.fields["m_BaseBulletSpreadMax"] = float(150)
	c.fields["m_BulletSpreadMin"] = float(25)
	c.fields["m_BulletSpreadMax"] = float(25)
	c.fields["m_MaxBulletSpreadMin"] = float(1000)
	c.fields["m_MaxBulletSpreadMax"] = float(1000)
	c.fields["m_SpreadRecoveryMin"] = float(5)
	c.fields["m_SpreadRecoveryMax"] = float(5)
	c.fields["m_HandlingInfluenceMin"] = float(37)
	c.fields["m_HandlingInfluenceMax"] = float(37)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(16)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(16)
	c.fields["m_DamageMin"] = float(100)
	c.fields["m_DamageMax"] = float(100)
	c.fields["m_MaxAmmoMin"] = float(1000)
	c.fields["m_MaxAmmoMax"] = float(1000)
	c.fields["m_MagSizeMin"] = float(1000)
	c.fields["m_MagSizeMax"] = float(1000)
	c.fields["m_fHandlingPointsPerShot"] = float(2)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(1, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(2, "int")
	c.fields["m_BulletCaseClass"] = R.coerce(R.klass("MC_casingdroplmg"), "Class")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MountedMGFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_FireEndSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MountedMGFireEnd"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M60Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_iDamageType"] = R.coerce(R.static_value("RDDamageType", "DevastatingBullet"), "int")
	c.fields["m_fOverheatSpeed"] = float(0.02)
	return null

static func f_FireAmmo(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDWeaponMountedMG"), "FireAmmo"), [])
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "x", (float((c.fields.get("m_Player")).fields.get("m_fMountedMGMuzzlePos")) + float((float((c.fields.get("m_Player")).fields.get("m_fAimingRatioX")) * float(200)))), "=")
	R.set_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "visible", true, "=")
	R.invoke(R.get_value(R.get_value((c.fields.get("m_Player")).fields.get("m_MCCarInterior"), "MountedMG"), "gotoAndPlay"), [R.binary("+", "Fire", R.binary("+", R.call_static("Maths", "RandomInt", [3]), 1))])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
