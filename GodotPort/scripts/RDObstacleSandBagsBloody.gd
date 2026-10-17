extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleSandBagsBloody(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleSandBagsBloody"), [R.klass("MC_bunkerbloody"), R.static_value("RDObstacleSandBagsBloody", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ConcreteDestroy"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.5)
	c.fields["m_fHitShakeIntensity"] = float(0.3)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.25), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.5)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactConcrete")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Flesh"), "int")
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fExtraNavMeshSpacing"] = float(0.5)
	c.fields["m_fHP"] = float(20)
	c.fields["m_szExplodeHitAnim"] = R.coerce("blowup", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleSandBagsBloody"), "SetInitialState"), [])
	c.fields["m_fHP"] = float(20)
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
