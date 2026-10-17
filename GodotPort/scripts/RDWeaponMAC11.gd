extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponMAC11(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponMAC11"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Compact SMG", "String")
	c.fields["m_szAnimName"] = R.coerce("mac11", "String")
	c.fields["m_bAutoFire"] = true
	c.fields["m_fShakeStrength"] = float(0.01)
	c.fields["m_fShakeDuration"] = float(0.05)
	c.fields["m_fAmmoDisplaySpacing"] = float(5)
	c.fields["m_iAmmoDisplayFrame"] = R.coerce(2, "int")
	c.fields["m_iNbFireAnims"] = R.coerce(2, "int")
	c.fields["m_AimingSpeedMin"] = float(4.25)
	c.fields["m_AimingSpeedMax"] = float(25)
	c.fields["m_BaseBulletSpreadMin"] = float(160)
	c.fields["m_BaseBulletSpreadMax"] = float(60)
	c.fields["m_BulletSpreadMin"] = float(50)
	c.fields["m_BulletSpreadMax"] = float(30)
	c.fields["m_MaxBulletSpreadMin"] = float(400)
	c.fields["m_MaxBulletSpreadMax"] = float(150)
	c.fields["m_SpreadRecoveryMin"] = float(1.8)
	c.fields["m_SpreadRecoveryMax"] = float(3)
	c.fields["m_HandlingInfluenceMin"] = float(79)
	c.fields["m_HandlingInfluenceMax"] = float(33)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(6)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(22)
	c.fields["m_DamageMin"] = float(14)
	c.fields["m_DamageMax"] = float(20)
	c.fields["m_MaxAmmoMin"] = float(150)
	c.fields["m_MaxAmmoMax"] = float(350)
	c.fields["m_MagSizeMin"] = float(25)
	c.fields["m_MagSizeMax"] = float(50)
	R.call_member(c, "FixWeaponStats", [])
	c.fields["m_fHandlingPointsPerShot"] = float(8)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(5, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(70, "int")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Fire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_FireEndSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11FireEnd"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound1"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Reload1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound2"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Reload2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound3"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Reload3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound5"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Reload5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_MAC11Empty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Description", "The Compact SMG is a light weight weapon that is easy to handle but doesn't have the best accuracy, it works best with small bursts.", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
