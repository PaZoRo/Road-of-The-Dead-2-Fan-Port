extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleDumpster(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleDumpster"), [R.klass("MC_dumpster"), R.static_value("RDObstacleDumpster", "Scale")])
	c.fields["m_bCanBeRunThrough"] = false
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_bBlockSoldierBullets"] = true
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.3)
	c.fields["m_fHitShakeIntensity"] = float(0.2)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.8), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1.6)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fExtraNavMeshSpacing"] = float(0.5)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleDumpster"), "SetInitialState"), [])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bFlip: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	c.fields["m_bFlippedX"] = v_bFlip
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary(">", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2.8, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
