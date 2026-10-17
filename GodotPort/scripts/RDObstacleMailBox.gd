extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleMailBox(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleMailBox"), [R.klass("MC_mailbox"), R.static_value("RDObstacleMailBox", "Scale")])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ShoppingCartHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactWeak")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood"), "int")
	c.fields["m_fHP"] = float(20)
	c.fields["m_szBulletHitAnim"] = R.coerce("Shot", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Shot", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleMailBox"), "SetInitialState"), [])
	c.fields["m_fHP"] = float(20)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bFlip: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	c.fields["m_bFlippedX"] = v_bFlip
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	c.fields["m_bFlippedX"] = R.binary("<", (c.fields.get("m_vLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
