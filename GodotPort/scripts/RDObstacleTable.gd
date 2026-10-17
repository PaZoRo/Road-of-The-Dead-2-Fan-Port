extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleTable(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleTable"), [R.klass("MC_table"), R.static_value("RDObstacleTable", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TableBreak"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactWood")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"), "int")
	c.fields["m_fHP"] = float(50)
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fExtraNavMeshSpacing"] = float(0.5)
	c.fields["m_szExplodeHitAnim"] = R.coerce("hit", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleTable"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(50)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
