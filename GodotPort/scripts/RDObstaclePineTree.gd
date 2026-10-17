extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstaclePineTree(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstaclePineTree"), [R.klass("MC_pinetree"), (float(R.static_value("RDObstaclePineTree", "Scale")) * float((float(0.8) + float((float(randf()) * float(0.4))))))])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_TableBreak"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = false
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.3)
	c.fields["m_fHitShakeIntensity"] = float(0.2)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.25), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.5)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c).fields["m_TrunkBulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_TrunkBulletHitEffects"), "push"), [R.klass("MC_BulletImpactWood")])
	(c).fields["m_FoliageBulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value((c).fields.get("m_FoliageBulletHitEffects"), "push"), [R.klass("MC_BulletImpactPine")])
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fHP"] = float(200)
	c.fields["m_szExplodeHitAnim"] = R.coerce("blownup", "String")
	c.fields["m_szBulletShredAnim"] = R.coerce("mowdown", "String")
	c.fields["m_bCanBeShotByHelicopter"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstaclePineTree"), "SetInitialState"), [])
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(200)
	c.fields["m_bCanBeRunThrough"] = false
	return null

static func f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	return R.get_value(c.fields.get("m_MC"), "BulletCollision")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c.fields.get("m_bEditorMode") and R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")))):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", R.binary("!=", R.invoke(R.get_value(c.fields.get("m_szFactoryName"), "indexOf"), ["Random"]), R.unary("-", 1)), "=")
	R.invoke(R.get_value(R.super_ref(c, "RDObstaclePineTree"), "Update"), [v_fDeltaTime])
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "globalToLocal"), [v_hitPos]), "Point")
	(c).fields["m_bFoliageHit"] = R.binary("<", R.get_value(c.fields.get("m_BulletHitPos"), "y"), R.unary("-", 150))
	R.invoke(R.get_value(R.super_ref(c, "RDObstaclePineTree"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	(c).fields["m_bFoliageHit"] = false
	return null

static func f_GetBulletHitEffects(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_FoliageBulletHitEffects") if R.truth((c).fields.get("m_bFoliageHit")) else (c).fields.get("m_TrunkBulletHitEffects"))
	return null

static func f_GetBulletHitSoundMaterial(c: Variant, a: Array) -> Variant:
	return (R.static_value("RDEntity", "BulletHitSoundMaterial_Vegetation") if R.truth((c).fields.get("m_bFoliageHit")) else R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"))
	return null

static func f_OnShotDown(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDObstaclePineTree"), "OnShotDown"), [v_instigator, v_iDamageType])
	if R.truth(((float(v_iDamageType) == float(R.static_value("RDDamageType", "ShreddingBullet"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "DevastatingBullet"))))):
		pass
		c.fields["m_bCanBeRunThrough"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_TrunkBulletHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_FoliageBulletHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_bFoliageHit"] = false
	return null
