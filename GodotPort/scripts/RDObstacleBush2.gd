extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleBush2(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleBush2"), [R.klass("MC_Bush2"), R.static_value("RDObstacleBush2", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 1.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(3)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Z"] = R.coerce(R.unary("-", 0.5), "Number")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HitLeaves"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fHitDamage"] = float(0)
	c.fields["m_fHitShakeIntensity"] = float(0.01)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactLeaves")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Vegetation"), "int")
	c.fields["m_fHP"] = float(1)
	c.fields["m_szExplodeHitAnim"] = R.coerce("Explode", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleBush2"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(1)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
