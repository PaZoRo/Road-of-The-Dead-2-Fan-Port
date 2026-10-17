extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponSPAS12(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponSPAS12"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Auto Shotgun", "String")
	c.fields["m_szAnimName"] = R.coerce("franchispas12", "String")
	c.fields["m_iDamageType"] = R.coerce(R.static_value("RDDamageType", "BlastingBullet"), "int")
	c.fields["m_bTimeBasedAutoFire"] = true
	c.fields["m_fShakeStrength"] = float(0.05)
	c.fields["m_fShakeDuration"] = float(0.2)
	c.fields["m_fAmmoDisplaySpacing"] = float(10)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(3, "int")
	c.fields["m_bCanCancelReload"] = true
	c.fields["m_BulletCaseClass"] = R.coerce(R.klass("MC_casingdropshotgun"), "Class")
	c.fields["m_iBulletsShotAtOnce"] = R.coerce(5, "int")
	c.fields["m_AimingSpeedMin"] = float(4.25)
	c.fields["m_AimingSpeedMax"] = float(25)
	c.fields["m_BaseBulletSpreadMin"] = float(450)
	c.fields["m_BaseBulletSpreadMax"] = float(250)
	c.fields["m_BulletSpreadMin"] = float(35)
	c.fields["m_BulletSpreadMax"] = float(13)
	c.fields["m_MaxBulletSpreadMin"] = float(250)
	c.fields["m_MaxBulletSpreadMax"] = float(180)
	c.fields["m_SpreadRecoveryMin"] = float(0.8)
	c.fields["m_SpreadRecoveryMax"] = float(8)
	c.fields["m_HandlingInfluenceMin"] = float(51)
	c.fields["m_HandlingInfluenceMax"] = float(17)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(5)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(19)
	c.fields["m_DamageMin"] = float(R.binary("/", 30, c.fields.get("m_iBulletsShotAtOnce")))
	c.fields["m_DamageMax"] = float(R.binary("/", 60, c.fields.get("m_iBulletsShotAtOnce")))
	c.fields["m_MaxAmmoMin"] = float(70)
	c.fields["m_MaxAmmoMax"] = float(100)
	c.fields["m_MagSizeMin"] = float(8)
	c.fields["m_MagSizeMax"] = float(13)
	c.fields["m_fKickBackMin"] = float(0.4)
	c.fields["m_fKickBackMax"] = float(0.1)
	c.fields["m_fFireDelayMin"] = float(0.4)
	c.fields["m_fFireDelayMax"] = float(0.2)
	R.call_member(c, "FixWeaponStats", [])
	c.fields["m_fHandlingPointsPerShot"] = float(12)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(4, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(25, "int")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_SPAS12Fire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound1"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_ShotgunReload1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound2"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_ShotgunReload2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound3"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_ShotgunReload3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_SPAS12Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "WeaponEndReloadShell")):
		pass
		if R.truth((((float((c.fields.get("m_Data")).fields.get("m_iAmmoInMag")) < float(c.fields.get("m_iMagSize"))) and R.unary("!", c.fields.get("m_bCancelReload"))) and (float((c.fields.get("m_Data")).fields.get("m_iAmmoInBag")) > float(0)))):
			pass
			R.invoke(R.get_value(c.fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", c.fields.get("m_szAnimName"), "_reloadloop"), (float((c.fields.get("m_Data")).fields.get("m_iReloadingLevel")) + float(1)))])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDWeaponSPAS12"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Description", "The auto shotgun delivers quick and powerful shots at short range. Very inaccurate at long range. Torso shots have a chance to splatter the zombie.", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
