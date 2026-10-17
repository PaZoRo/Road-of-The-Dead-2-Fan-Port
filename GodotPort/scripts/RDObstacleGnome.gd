extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleGnome(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleGnome"), [R.klass("MC_gardengnome"), R.static_value("RDObstacleGnome", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TrafficConeHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactWeak")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Weak"), "int")
	c.fields["m_fHP"] = float(1)
	c.fields["m_szBulletHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Hit", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleGnome"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(1)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 1, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
