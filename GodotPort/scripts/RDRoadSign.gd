extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDRoadSign(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDRoadSign"), [null, R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_RoadSign"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(2)
	c.fields["m_fFadeDistance"] = float(150)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fBulletHitEffectScaleMin"] = float(2)
	c.fields["m_fBulletHitEffectScaleMax"] = float(4)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "SetInitialState"), [])
	(c).fields["m_bCrashed"] = false
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bCrashed")):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float(maxf(float((float((c.fields.get("m_vVelocity")).fields.get("Z")) - float((float((c).fields.get("m_fHitDeccel")) * float(v_fDeltaTime))))), float(0)))
		R.call_member(c.fields.get("m_World"), "MoveEntity", [c, 0, 0, (float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bCrashed")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Helicopter"))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "TouchedBy"), [v_entity])
	(c.fields.get("m_vVelocity")).fields["Z"] = float((float(((v_entity).fields.get("m_vVelocity")).fields.get("Z")) * float(1.15)))
	(c).fields["m_fHitDeccel"] = float((float(((v_entity).fields.get("m_vVelocity")).fields.get("Z")) * float(0.4)))
	(c).fields["m_bCrashed"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Break"])
	if R.truth((c).fields.get("m_OffRoadPart")):
		pass
		R.call_member((c).fields.get("m_OffRoadPart"), "Break", [])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSign"), "Destroy"), [])
	(c).fields["m_OffRoadPart"] = R.coerce(null, "RDRoadSignOffRoad")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bCrashed"] = false
	(c).fields["m_OffRoadPart"] = R.coerce(null, "RDRoadSignOffRoad")
	(c).fields["m_fHitDeccel"] = float(NAN)
	return null
