extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleElectronicSign(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleElectronicSign"), [R.klass("MC_electronicsign")])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ElectronicSignHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bFlipOnCollision"] = false
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fHitDamage"] = float(4)
	c.fields["m_fHitSpeedLoss"] = float(0.2)
	c.fields["m_fHitShakeIntensity"] = float(0.03)
	c.fields["m_fFadeDistance"] = float(80)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactWeak")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_fHP"] = float(20)
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_szBulletHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Hit", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleElectronicSign"), "SetInitialState"), [])
	c.fields["m_fHP"] = float(20)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
