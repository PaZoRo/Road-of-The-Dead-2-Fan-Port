extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieHard(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieHard"), [R.klass("MC_ZombieHard"), R.static_value("RDZombieHard", "Scale")])
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieHard"), "int")
	c.fields["m_fClingHP"] = float(60)
	c.fields["m_fBodyHP"] = float(400)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fClingPunchDelay"] = float(4)
	c.fields["m_fClingPunchDamage"] = float(15)
	c.fields["m_fSpeedFactorX"] = float(1.25)
	c.fields["m_fSpeedFactorZ"] = float(1.25)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanHardSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntHardSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodHardSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionHardSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatHardSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackHardSounds"), "RandomHat")
	c.fields["m_bHasShakyIdle"] = true
	c.fields["m_iCivilianEatCount"] = R.coerce(2, "int")
	c.fields["m_iPointsPerZombieKilled"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilled"), 1.1), "Number")
	c.fields["m_iPointsPerZombieShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieShot"), 1.1), "Number")
	c.fields["m_iPointsPerHoodKillFromCollision"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodKillFromCollision"), 1.1), "Number")
	c.fields["m_iPointsPerHoodHeadShot"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodHeadShot"), 1.1), "Number")
	c.fields["m_iPointsPerHoodGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerHoodGib"), 1.1), "Number")
	c.fields["m_iPointsPerZombieKilledWithGib"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieKilledWithGib"), 1.1), "Number")
	c.fields["m_iPointsPerZombieArmShotOff"] = R.coerce(R.binary("*", c.fields.get("m_iPointsPerZombieArmShotOff"), 1.1), "Number")
	c.fields["m_fClingChanceMultiplier"] = float(0.9)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieHard"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(100)
	c.fields["m_fBodyHP"] = float(400)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fSpeedFactorX"] = float(1.25)
	c.fields["m_fSpeedFactorZ"] = float(1.25)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieHard"), "Init"), [v_iMovementType])
	if R.truth((float(c.fields.get("m_iMovementType")) != float(R.static_value("RDZombie", "MovementType_Feed")))):
		pass
		c.fields["m_fSurvivalGuideDistance"] = float(40)
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Ravager"), "int")
	else:
		pass
		c.fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2.2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
