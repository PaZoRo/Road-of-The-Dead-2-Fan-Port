extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieNormalMale(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieNormalMale"), [R.klass("MC_ZombieNormalMale"), R.static_value("RDZombieNormalMale", "Scale")])
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieNormalMale"), "int")
	c.fields["m_fClingHP"] = float(50)
	c.fields["m_fBodyHP"] = float(200)
	c.fields["m_fHeadHP"] = float(50)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fClingPunchDelay"] = float(5)
	c.fields["m_fClingPunchDamage"] = float(10)
	c.fields["m_fSpeedFactorX"] = float(1)
	c.fields["m_fSpeedFactorZ"] = float(1)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanNormalMaleSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntNormalMaleSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodNormalMaleSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionNormalMaleSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatNormalMaleSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackNormalMaleSounds"), "RandomHat")
	c.fields["m_fClingChanceMultiplier"] = float(0.8)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalMale"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(50)
	c.fields["m_fBodyHP"] = float(200)
	c.fields["m_fHeadHP"] = float(50)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fSpeedFactorX"] = float(1)
	c.fields["m_fSpeedFactorZ"] = float(1)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
