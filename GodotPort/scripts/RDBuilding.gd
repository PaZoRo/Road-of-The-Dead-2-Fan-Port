extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBuilding(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBuilding"), [R.klass("MC_Buildings"), R.static_value("RDBuilding", "Scale")])
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_SideBackground"), "int")
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Building"), "int")
	(c).fields["m_bInitCollision"] = true
	c.fields["m_fFadeDistance"] = float(130)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.03)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.1)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactConcrete")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_bSelectableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDBuilding"), "SetInitialState"), [])
	(c).fields["m_bInitCollision"] = true
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bRight: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fDestructionLevel: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	c.fields["m_bFlippedX"] = R.unary("!", v_bRight)
	if R.truth((float(randf()) < float((float(v_fDestructionLevel) * float(2))))):
		pass
		(c).fields["m_iFrame"] = R.coerce(R.binary("+", 1, R.call_static("Maths", "RandomInt", [R.get_value(c.fields.get("m_MC"), "totalFrames")])), "int")
	else:
		pass
		(c).fields["m_iFrame"] = R.coerce(R.binary("+", 1, R.call_static("Maths", "RandomInt", [12])), "int")
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [(c).fields.get("m_iFrame")])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDBuilding"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bInitCollision") and R.binary("==", R.get_value(c.fields.get("m_MC"), "currentFrame"), (c).fields.get("m_iFrame")))):
		pass
		(c.fields.get("m_CollisionBounds")).fields["X"] = float(0)
		(c.fields.get("m_CollisionBounds")).fields["W"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("W")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDBuilding", "Scale")))
		(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
		(c.fields.get("m_CollisionBounds")).fields["H"] = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("H")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDBuilding", "Scale")))
		(c).fields["m_bInitCollision"] = false
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 40, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iFrame"] = R.coerce(0, "int")
	(c).fields["m_bInitCollision"] = false
	return null
