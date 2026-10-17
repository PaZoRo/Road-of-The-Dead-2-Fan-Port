extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponPistol(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeaponPistol"), [v_player])
	c.fields["m_szWeaponName"] = R.coerce("Pistol", "String")
	c.fields["m_szAnimName"] = R.coerce("berreta", "String")
	c.fields["m_fShakeStrength"] = float(0.03)
	c.fields["m_fShakeDuration"] = float(0.1)
	c.fields["m_AimingSpeedMin"] = float(5)
	c.fields["m_AimingSpeedMax"] = float(30)
	c.fields["m_BaseBulletSpreadMin"] = float(250)
	c.fields["m_BaseBulletSpreadMax"] = float(150)
	c.fields["m_BulletSpreadMin"] = float(40)
	c.fields["m_BulletSpreadMax"] = float(16)
	c.fields["m_MaxBulletSpreadMin"] = float(350)
	c.fields["m_MaxBulletSpreadMax"] = float(200)
	c.fields["m_SpreadRecoveryMin"] = float(1.5)
	c.fields["m_SpreadRecoveryMax"] = float(15)
	c.fields["m_HandlingInfluenceMin"] = float(86)
	c.fields["m_HandlingInfluenceMax"] = float(37)
	c.fields["m_HandlinginfluenceRecoverySpeedMin"] = float(7)
	c.fields["m_HandlinginfluenceRecoverySpeedMax"] = float(25)
	c.fields["m_DamageMin"] = float(12)
	c.fields["m_DamageMax"] = float(18)
	c.fields["m_MaxAmmoMin"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_MaxAmmoMax"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_MagSizeMin"] = float(10)
	c.fields["m_MagSizeMax"] = float(16)
	c.fields["m_fFireDelayMin"] = float(0.23)
	c.fields["m_fFireDelayMax"] = float(0.1)
	R.call_member(c, "FixWeaponStats", [])
	c.fields["m_fHandlingPointsPerShot"] = float(8)
	c.fields["m_iAimingPointsPerHit"] = R.coerce(5, "int")
	c.fields["m_iReloadingPointsPerReload"] = R.coerce(48, "int")
	c.fields["m_FireSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolFire"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound1"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolReload1"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound2"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolReload2"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound3"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolReload3"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound4"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolReload4"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_ReloadSound5"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolReload5"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_NoAmmoSound"] = R.coerce(R.call_member(c.fields.get("m_Player"), "CreateEntitySpacialSound", [R.klass("SND_PistolEmpty"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Description", "The pistol offers a great aiming speed but low damage and hard handling on collisions.  However, in dire situations, you can always count on this hand weapon.", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
