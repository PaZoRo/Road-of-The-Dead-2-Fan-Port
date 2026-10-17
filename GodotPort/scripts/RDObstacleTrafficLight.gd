extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleTrafficLight(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleTrafficLight"), [R.klass("MC_trafficlight"), R.static_value("RDObstacleTrafficLight", "Scale")])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ElectronicSignHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	c.fields["m_szHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleTrafficLight"), "SetInitialState"), [])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Idle"])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bFlip: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	c.fields["m_bFlippedX"] = v_bFlip
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
