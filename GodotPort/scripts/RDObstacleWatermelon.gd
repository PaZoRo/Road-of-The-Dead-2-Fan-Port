extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleWatermelon(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleWatermelon"), [R.klass("MC_watermelon")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HitZombie04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fHitDamage"] = float(0)
	c.fields["m_fHitShakeIntensity"] = float(0.01)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood")])
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactBlood2")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Flesh"), "int")
	c.fields["m_fHP"] = float(5)
	c.fields["m_szBulletHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Hit", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleWatermelon"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(5)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
