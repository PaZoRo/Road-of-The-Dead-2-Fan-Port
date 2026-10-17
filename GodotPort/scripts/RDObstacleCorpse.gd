extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCorpse(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCorpse"), [R.klass("MC_FeederCorpse"), R.static_value("RDObstacleCorpse", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FeedersHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fHitDamage"] = float(3)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fHitSpeedLoss"] = float(0.4)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood")])
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood2")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Flesh"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_bSelectableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCorpse"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCorpse"), "TouchedBy"), [v_entity])
	if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))):
		pass
		R.call_member(R.binary("as", v_entity, R.klass("RDPlayer")), "OnHitFeeders", [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
