extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponM16(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponM16"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Assault Rifle", "String")
	c.fields["m_szAnimName"] = R.coerce("m16a2", "String")
	c.fields["m_bAutoFire"] = true
	c.fields["m_fShakeStrength"] = float(0.02)
	c.fields["m_fShakeDuration"] = float(0.05)
	c.fields["m_fAmmoDisplaySpacing"] = float(5)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(2, "int")
	c.fields["m_iNbFireAnims"] = R.coerce(2, "int")
	c.fields["m_AimingSpeedMin"] = float(3.5)
	c.fields["m_AimingSpeedMax"] = float(20)
	c.fields["m_BaseBulletSpreadMin"] = float(140)
	c.fields["m_BaseBulletSpreadMax"] = float(40)
	c.fields["m_BulletSpreadMin"] = float(80)
	c.fields["m_BulletSpreadMax"] = float(50)
	c.fields["m_MaxBulletSpreadMin"] = float(600)
	c.fields["m_MaxBulletSpreadMax"] = float(400)
	c.fields["m_SpreadRecoveryMin"] = float(1.1)
	c.fields["m_SpreadRecoveryMax"] = float(4)
	c.fields["m_HandlingInfluenceMin"] = float(51)
	c.fields["m_HandlingInfluenceMax"] = float(17)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(4)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(16)
	c.fields["m_DamageMin"] = float(16)
	c.fields["m_DamageMax"] = float(26)
	c.fields["m_MaxAmmoMin"] = float(140)
	c.fields["m_MaxAmmoMax"] = float(280)
	c.fields["m_MagSizeMin"] = float(20)
	c.fields["m_MagSizeMax"] = float(40)
	R.call_member(c, "FixWeaponStats", [])
	c.fields["m_fHandlingPointsPerShot"] = float(8)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(5, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(70, "int")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16Fire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_FireEndSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16FireEnd"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound1"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16Reload1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound2"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16Reload2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound3"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16Reload3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_M16Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Description", "The Assault Rifle is a well rounded military issued weapon.  It offers good precision on medium bursts but isn't the most easy to handle weapon.", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
