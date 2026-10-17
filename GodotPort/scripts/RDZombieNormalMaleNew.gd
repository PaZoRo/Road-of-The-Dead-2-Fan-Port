extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieNormalMaleNew(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieNormalMaleNew"), [R.klass("MC_ZombieNormalMaleNew"), R.static_value("RDZombieNormalMaleNew", "Scale")])
	c.fields["m_bSpecialZombie"] = false
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieNormalMaleNew"), "int")
	c.fields["m_fClingHP"] = float(80)
	c.fields["m_fBodyHP"] = float(450)
	c.fields["m_fHeadHP"] = float(125)
	c.fields["m_fRightArmHP"] = float(50)
	c.fields["m_fLeftArmHP"] = float(50)
	c.fields["m_fClingPunchDelay"] = float(5)
	c.fields["m_fClingPunchDamage"] = float(10)
	c.fields["m_fSpeedFactorX"] = float(1.3)
	c.fields["m_fSpeedFactorZ"] = float(1.3)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "RandomHat")
	c.fields["m_iCivilianEatCount"] = R.coerce(3, "int")
	c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 1.25), "Number")
	c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 1.25), "Number")
	c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 1.25), "Number")
	c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 1.25), "Number")
	c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 1.25), "Number")
	c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 1.25), "Number")
	c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 1.25), "Number")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalMaleNew"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(200)
	c.fields["m_fBodyHP"] = float(450)
	c.fields["m_fHeadHP"] = float(125)
	c.fields["m_fRightArmHP"] = float(50)
	c.fields["m_fLeftArmHP"] = float(50)
	c.fields["m_fSpeedFactorX"] = float(1.3)
	c.fields["m_fSpeedFactorZ"] = float(1.3)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalMaleNew"), "Init"), [v_iMovementType])
	if R.truth((float(c.fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))):
		pass
		c.fields["m_fSurvivalGuideDistance"] = float(40)
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Brute"), "int")
	else:
		pass
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	c.fields["m_bSpecialZombie"] = false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
