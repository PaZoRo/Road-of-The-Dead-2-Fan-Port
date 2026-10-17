extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleBush3(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleBush3"), [R.klass("MC_Bush3"), (float(R.static_value("RDObstacleBush3", "Scale")) * float((float(0.9) + float((float(randf()) * float(0.2))))))])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
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
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleBush3"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(1)
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	if R.truth((float(randf()) < float(0.8))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDObstacleBush3"), "CanBeHitByBullet"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
