extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCarMilitary(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCarMilitary"), [])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_ArmyVehicles"), "int")
	if R.truth(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreAmmoPointsEnabled", [])):
		pass
		c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_AmmoPoint"), "int")
		c.fields["m_bCanBeShotByHelicopter"] = false
	c.fields["m_iHitPropertyValue"] = R.coerce(350, "int")
	c.fields["m_iExplodePropertyValue"] = R.coerce(1500, "int")
	c.fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "HugeCarHP"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarMilitary"), "SetInitialState"), [])
	if R.truth(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreAmmoPointsEnabled", [])):
		pass
		c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_AmmoPoint"), "int")
		c.fields["m_bCanBeShotByHelicopter"] = false
	else:
		pass
		c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
		c.fields["m_bCanBeShotByHelicopter"] = true
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarMilitary"), "OnAddedToWorld"), [])
	if R.truth(R.logical_and(R.unary("!", c.fields.get("m_bEditorMode")), func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreAmmoPointsEnabled", []))):
		pass
		R.call_member(c.fields.get("m_World"), "AddAmmoPoint", [c])
		if R.truth(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "ArcadeAmmoPickupEnabled", [])):
			pass
			(c).fields["m_ArcadeAmmoPickup"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDArcadeAmmoPickup")]), R.klass("RDArcadeAmmoPickup")), "RDArcadeAmmoPickup")
			R.call_member((c).fields.get("m_ArcadeAmmoPickup"), "Init", [c])
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_ArcadeAmmoPickup"), (c.fields.get("m_vLocation")).fields.get("X"), (c.fields.get("m_vLocation")).fields.get("Y"), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(0.2))])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	if R.truth(R.logical_and(R.truth((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")), func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "AreAmmoPointsEnabled", []))):
		pass
		R.call_member(c.fields.get("m_World"), "RemoveAmmoPoint", [c])
		if R.truth((c).fields.get("m_ArcadeAmmoPickup")):
			pass
			((c).fields.get("m_ArcadeAmmoPickup")).fields["m_bDestroyMe"] = true
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarMilitary"), "Destroy"), [])
	(c).fields["m_ArcadeAmmoPickup"] = R.coerce(null, "RDArcadeAmmoPickup")
	return null

static func f_GetLocationName(c: Variant, a: Array) -> Variant:
	return "Ammo Point"
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "DispatchEvent", [R.static_value("RDEntity", "Event_Exploded")])
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCarMilitary"), "Explode"), [v_instigator])
	c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
	R.call_member(c.fields.get("m_World"), "RemoveAmmoPoint", [c])
	if R.truth((c).fields.get("m_ArcadeAmmoPickup")):
		pass
		((c).fields.get("m_ArcadeAmmoPickup")).fields["m_bDestroyMe"] = true
	return null

static func f_CanHaveInteraction(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "ArcadeAmmoPickupEnabled", [])):
		pass
		return false
	return true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_ArcadeAmmoPickup"] = R.coerce(null, "RDArcadeAmmoPickup")
	return null
