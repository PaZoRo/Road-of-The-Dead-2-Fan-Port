extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieSoldier(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieSoldier"), [R.klass("MC_ZombieSoldier"), R.static_value("RDZombieSoldier", "Scale")])
	c.fields["m_bSpecialZombie"] = false
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieSoldier"), "int")
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_UndeadSoldier"), "int")
	c.fields["m_fClingHP"] = float(100)
	c.fields["m_fBodyHP"] = float(400)
	c.fields["m_fHeadHP"] = float(80)
	c.fields["m_fRightArmHP"] = float(40)
	c.fields["m_fLeftArmHP"] = float(40)
	c.fields["m_fClingPunchDelay"] = float(4)
	c.fields["m_fClingPunchDamage"] = float(15)
	c.fields["m_fSpeedFactorX"] = float(1.3)
	c.fields["m_fSpeedFactorZ"] = float(1.3)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanHardSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntHardSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodHardSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionHardSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatHardSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackHardSounds"), "RandomHat")
	c.fields["m_iCivilianEatCount"] = R.coerce(3, "int")
	c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 1.3), "Number")
	c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 1.3), "Number")
	c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 1.3), "Number")
	c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 1.3), "Number")
	c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 1.3), "Number")
	c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 1.3), "Number")
	c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 1.3), "Number")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieSoldier"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(200)
	c.fields["m_fBodyHP"] = float(400)
	c.fields["m_fHeadHP"] = float(80)
	c.fields["m_fRightArmHP"] = float(40)
	c.fields["m_fLeftArmHP"] = float(40)
	c.fields["m_fSpeedFactorX"] = float(1.3)
	c.fields["m_fSpeedFactorZ"] = float(1.3)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieSoldier"), "Init"), [v_iMovementType])
	c.fields["m_bSpecialZombie"] = false
	return null

static func f_GetBlockedHeadShotChance(c: Variant, a: Array) -> Variant:
	return 0.4
	return null

static func f_GetBlockedTorsoShotChance(c: Variant, a: Array) -> Variant:
	return 0.25
	return null

static func f_CanHaveTint(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
