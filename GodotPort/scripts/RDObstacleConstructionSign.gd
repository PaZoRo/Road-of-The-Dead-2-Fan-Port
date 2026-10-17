extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleConstructionSign(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleConstructionSign"), [R.klass("MC_constructionsign")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TrafficBarrelHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fHitDamage"] = float(0.5)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactWeak")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"), "int")
	c.fields["m_fHP"] = float(50)
	c.fields["m_szBulletHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Hit", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleConstructionSign"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(50)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
