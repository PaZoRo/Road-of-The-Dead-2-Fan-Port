extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDZombieGrub(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDZombieGrub"), [R.klass("MC_ZombieGrub"), R.static_value("RDZombieGrub", "Scale")])
	c.fields["m_bSpecialZombie"] = false
	c.fields["m_iType"] = R.coerce(R.static_value("RDHumanoid", "Type_ZombieGrub"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.75), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1.5)
	c.fields["m_iClingSurvivalItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Grub"), "int")
	c.fields["m_fClingHP"] = float(150)
	c.fields["m_fBodyHP"] = float(200)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(40)
	c.fields["m_fLeftArmHP"] = float(40)
	c.fields["m_fClingPunchDelay"] = float(4)
	c.fields["m_fClingPunchDamage"] = float(15)
	c.fields["m_MoanSounds"] = R.coerce(R.static_value("RDZombie", "m_MoanHardSounds"), "RandomHat")
	c.fields["m_GruntSounds"] = R.coerce(R.static_value("RDZombie", "m_GruntHardSounds"), "RandomHat")
	c.fields["m_GetOnHoodSounds"] = R.coerce(R.static_value("RDZombie", "m_GetOnHoodHardSounds"), "RandomHat")
	c.fields["m_CollisionSounds"] = R.coerce(R.static_value("RDZombie", "m_CollisionHardSounds"), "RandomHat")
	c.fields["m_ThreatSounds"] = R.coerce(R.static_value("RDZombie", "m_ThreatHardSounds"), "RandomHat")
	c.fields["m_AttackSounds"] = R.coerce(R.static_value("RDZombie", "m_AttackHardSounds"), "RandomHat")
	c.fields["m_bHasShakyIdle"] = false
	c.fields["m_iCivilianEatCount"] = R.coerce(2, "int")
	c.fields["m_bCanBeShotByHelicopter"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDZombieGrub"), "SetInitialState"), [])
	c.fields["m_fClingHP"] = float(100)
	c.fields["m_fBodyHP"] = float(200)
	c.fields["m_fHeadHP"] = float(100)
	c.fields["m_fRightArmHP"] = float(40)
	c.fields["m_fLeftArmHP"] = float(40)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iMovementType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDZombieGrub"), "Init"), [v_iMovementType])
	c.fields["m_bSpecialZombie"] = false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 1.6, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
