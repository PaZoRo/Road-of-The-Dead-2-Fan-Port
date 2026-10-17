extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleSmallHillTop(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleSmallHillTop"), [null, R.static_value("RDObstacleSmallHillTop", "Scale")])
	R.call_member(c, "InitMCs", [(R.klass("MC_smallhilltop") if R.truth((float(randf()) < float(0.5))) else R.klass("MC_smallhilltop2"))])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HitLeaves"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactGrass")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Flesh"), "int")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_bCausesImpactShards"] = false
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.3)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleSmallHillTop"), "SetInitialState"), [])
	R.call_member(c, "InitMCs", [(R.klass("MC_smallhilltop") if R.truth((float(randf()) < float(0.5))) else R.klass("MC_smallhilltop2"))])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
