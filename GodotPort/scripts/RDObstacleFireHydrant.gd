extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleFireHydrant(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleFireHydrant"), [R.klass("MC_firehydrant"), R.static_value("RDObstacleFireHydrant", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_FireHydrants"), "int")
	(c).fields["m_FlowingSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FireHydrantFlowing"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsVeryQuiet")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(1)
	c.fields["m_fHitSpeedLoss"] = float(0.1)
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_fBackSoundDistanceMultiplier"] = float(4)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.2), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.4)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	c.fields["m_fHP"] = float(50)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_szBulletHitAnim"] = R.coerce("shot", "String")
	c.fields["m_szExplodeHitAnim"] = R.coerce("shot", "String")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = float(50)
	(c).fields["m_bFlowing"] = false
	(c).fields["m_bPlayFlowingSound"] = false
	(c).fields["m_bManualFlow"] = false
	c.fields["m_szHitAnim"] = R.coerce("", "String")
	c.fields["m_fHitShakeIntensity"] = float(0.1)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bFlowing: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value(c.fields.get("m_MC"), "Water"), "visible", v_bFlowing, "=")
	if R.truth(v_bFlowing):
		pass
		(c).fields["m_bFlowing"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), ["flowing"])
		(c).fields["m_bPlayFlowingSound"] = true
		c.fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
		c.fields["m_fHitShakeIntensity"] = float(0.05)
		c.fields["m_fHitShakeDuration"] = float(0.5)
		c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FireHydrantWaterImpact"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
		c.fields["m_szHitAnim"] = R.coerce("Hit", "String")
	else:
		pass
		c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_WaterJugCollision"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "Update"), [v_fDeltaTime])
	if R.truth((c).fields.get("m_bPlayFlowingSound")):
		pass
		if R.truth(R.unary("!", c.fields.get("m_bEditorMode"))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlowingSound"), true, (float(randf()) * float(2))])
		(c).fields["m_bPlayFlowingSound"] = false
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "TouchedBy"), [v_entity])
	if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_FlowingSound")])
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	return ((R.unary("!", R.get_value(c.fields.get("m_MC"), "Water")) or R.unary("!", R.get_value(R.get_value(c.fields.get("m_MC"), "Water"), "visible"))) and R.truth(R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "CanBeHitByBullet"), [])))
	return null

static func f_OnShotDown(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "OnShotDown"), [v_instigator, v_iDamageType])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Water"), "visible", true, "=")
	(c).fields["m_bFlowing"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["shot"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlowingSound"), true])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FireHydrantWaterImpact"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_szHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_fHitShakeIntensity"] = float(0.05)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	(c).fields["m_bManualFlow"] = true
	return null

static func f_OnExploded(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleFireHydrant"), "OnExploded"), [v_instigator])
	R.set_value(R.get_value(c.fields.get("m_MC"), "Water"), "visible", true, "=")
	(c).fields["m_bFlowing"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["shot"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlowingSound"), true])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FireHydrantWaterImpact"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_szHitAnim"] = R.coerce("Hit", "String")
	c.fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_fHitShakeIntensity"] = float(0.05)
	c.fields["m_fHitShakeDuration"] = float(0.5)
	(c).fields["m_bManualFlow"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFlowing"] = false
	(c).fields["m_FlowingSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlayFlowingSound"] = false
	(c).fields["m_bManualFlow"] = false
	return null
