extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieNormalFemale(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieNormalFemale"), [R.klass("MC_ZombieNormalFemale"), R.static_value("RDZombieNormalFemale", "Scale")])
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieNormalFemale"), "int")
	c.fields["m_fClingHP"] = float(50)
	c.fields["m_fBodyHP"] = float(200)
	c.fields["m_fHeadHP"] = float(50)
	c.fields["m_fRightArmHP"] = float(30)
	c.fields["m_fLeftArmHP"] = float(30)
	c.fields["m_fClingPunchDelay"] = float(5)
	c.fields["m_fClingPunchDamage"] = float(10)
	c.fields["m_fSpeedFactorX"] = float(1)
	c.fields["m_fSpeedFactorZ"] = float(1)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanNormalFemaleSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntNormalFemaleSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodNormalFemaleSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionNormalFemaleSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatNormalFemaleSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackNormalFemaleSounds"), "RandomHat")
	c.fields["m_fClingChanceMultiplier"] = float(0.8)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieNormalFemale"), "SetInitialState"), [])
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
