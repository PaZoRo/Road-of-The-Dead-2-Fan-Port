extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieNormalFemaleNew(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieNormalFemaleNew"), [R.klass("MC_ZombieNormalFemaleNew"), R.static_value("RDZombieNormalFemaleNew", "Scale")])
	c.fields["m_bSpecialZombie"] = false
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieNormalFemaleNew"), "int")
	c.fields["m_fClingHP"] = float(75)
	c.fields["m_fBodyHP"] = float(250)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fClingPunchDelay"] = float(3)
	c.fields["m_fClingPunchDamage"] = float(10)
	c.fields["m_fSpeedFactorX"] = float(1.5)
	c.fields["m_fSpeedFactorZ"] = float(1.5)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodNormalFemaleSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatNormalFemaleSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "RandomHat")
	c.fields["m_iCivilianEatCount"] = R.coerce(2, "int")
	c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 1.25), "Number")
	c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 1.25), "Number")
	c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 1.25), "Number")
	c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 1.25), "Number")
	c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 1.25), "Number")
	c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 1.25), "Number")
	c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 1.25), "Number")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalFemaleNew"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(100)
	c.fields["m_fBodyHP"] = float(250)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fSpeedFactorX"] = float(1.5)
	c.fields["m_fSpeedFactorZ"] = float(1.5)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalFemaleNew"), "Init"), [v_iMovementType])
	c.fields["m_bSpecialZombie"] = false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
