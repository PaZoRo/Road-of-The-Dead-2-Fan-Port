extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleFuelTruck(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleFuelTruck"), [])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_FuelTrucks"), "int")
	c.fields["m_fExplosionRangeX"] = float(12)
	c.fields["m_fExplosionRangeZ"] = float(12)
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "FuelTruckHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFuelTruck"), "SetInitialState"), [])
	c.fields["m_bCanBeRunThrough"] = false
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iMCFrame: Variant = R.coerce((a[1] if a.size() > 1 else 1), "int")
	var v_soundClass: Variant = R.coerce((a[2] if a.size() > 2 else null), "Class")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFuelTruck"), "Init"), [v_mcClass, v_iMCFrame, v_soundClass])
	R.call_member(c, "SetHP", [R.static_value("RDObstacleCar", "FuelTruckHP"), 1])
	return null

static func f_OnPlayerHit(c: Variant, a: Array) -> Variant:
	var v_explosionClass: Variant = null
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	v_explosionClass = R.coerce(null, "Class")
	if R.truth((float(((v_player).fields.get("m_vVelocity")).fields.get("Z")) > float(R.static_value("RDObstacleFuelTruck", "ExplodePlayerVelocity")))):
		pass
		c.fields["m_bCanBeRunThrough"] = true
		v_explosionClass = R.coerce(c.fields.get("m_ExplosionClass"), "Class")
		c.fields["m_ExplosionClass"] = R.coerce(R.klass("MC_EngineExplosionNoFire"), "Class")
		c.fields["m_fHP"] = float(0)
		R.call_member(c, "Explode", [v_player])
		c.fields["m_ExplosionClass"] = R.coerce(v_explosionClass, "Class")
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFuelTruck"), "Explode"), [v_instigator])
	if R.truth((R.binary("==", v_instigator, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iFuelTruckShot", 1, "+=")
	return null

static func f_CanHaveBurningProperty(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "ExplodePlayerVelocity", R.binary("/", R.binary("/", (float(15) * float(1000)), 60), 60), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
