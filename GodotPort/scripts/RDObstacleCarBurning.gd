extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarBurning(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarBurning"), [])
	c.fields["m_bCanBeShotByHelicopter"] = false
	c.fields["m_iDefaultHP"] = R.coerce(0, "int")
	c.fields["m_bAlwaysCanGetHit"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarBurning"), "SetInitialState"), [])
	return null

static func f_CanHaveBurningProperty(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_CanHaveHiddenSoldierProperty(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
