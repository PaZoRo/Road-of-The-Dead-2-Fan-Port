extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDOilSlick(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDOilSlick"), [R.klass("MC_OilSpill"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_OilSpills"), "int")
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_OilSlick"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 1.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(3)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDOilSlick"), "SetInitialState"), [])
	(c).fields["m_bTriggered"] = false
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDOilSlick"), "TouchedBy"), [v_entity])
	if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))):
		pass
		(c).fields["m_bTriggered"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bTriggered"] = false
	return null
