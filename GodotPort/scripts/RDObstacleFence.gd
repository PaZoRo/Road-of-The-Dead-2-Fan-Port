extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleFence(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleFence"), [R.klass("MC_Fence"), R.static_value("RDObstacleFence", "Scale")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_SecurityFences"), "int")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FenceHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Z"] = R.coerce(R.unary("-", 0.5), "Number")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_szExplodeHitAnim"] = R.coerce("PushedDown", "String")
	c.fields["m_fHP"] = float(300)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFence"), "SetInitialState"), [])
	(c).fields["m_fBashHP"] = float(1)
	c.fields["m_fHP"] = float(300)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bCleanClingers: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bCleanClingers"] = v_bCleanClingers
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFence"), "TouchedBy"), [v_entity])
	if R.truth(((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) and (c).fields.get("m_bCleanClingers"))):
		pass
		R.call_member(R.binary("as", v_entity, R.klass("RDPlayer")), "OnHitCleanerFence", [])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and (float((c).fields.get("m_fBashHP")) > float(0))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) < float(0.8))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDObstacleFence"), "CanBeHitByBullet"), [])
	return null

static func f_DamageFence(c: Variant, a: Array) -> Variant:
	var v_fDamage: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fBashHP")) > float(0))):
		pass
		(c).fields["m_fBashHP"] = float(maxf(float((float((c).fields.get("m_fBashHP")) - float(v_fDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fBashHP")) == float(0))):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["PushedDown"])
			R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_HitSound")])
			c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	return null

static func f_IsDown(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_fBashHP")) == float(0))
	return null

static func f_CanBeBashed(c: Variant, a: Array) -> Variant:
	return (((float((c).fields.get("m_fBashHP")) > float(0)) and R.unary("!", c.fields.get("m_bCanBeDestroyed"))) and R.unary("!", c.fields.get("m_bHit")))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFence"), "OnAddedToWorld"), [])
	R.call_member(c.fields.get("m_World"), "AddFence", [c])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_World"), "RemoveFence", [c])
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFence"), "Destroy"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fBashHP"] = float(1)
	(c).fields["m_bCleanClingers"] = false
	return null
