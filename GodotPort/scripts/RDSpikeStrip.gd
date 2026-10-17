extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSpikeStrip(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDSpikeStrip"), [R.klass("MC_SpikeStrip"), R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDSpikeStrip", "Scale")])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_SpikeStrips"), "int")
	(c).fields["m_fHP"] = float(300)
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_SpikeStrip"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", R.static_value("RDRoad", "LaneHalfWidth")), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float((float(2) * float(R.static_value("RDRoad", "LaneHalfWidth"))))
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c).fields["m_SlideSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SpikeSlide"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_SpikeExplode"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_fFadeDistance"] = float(130)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_bCanBeHitByExplosion"] = true
	c.fields["m_bCanBeShotByHelicopter"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "SetInitialState"), [])
	(c).fields["m_fHP"] = float(300)
	(c).fields["m_bTriggered"] = false
	(c).fields["m_bSliding"] = false
	(c).fields["m_bDestroyed"] = false
	(c).fields["m_bCanBeDestroyed"] = false
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))) and R.unary("!", (c).fields.get("m_bDestroyed")))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "TouchedBy"), [v_entity])
	(c).fields["m_bTriggered"] = true
	return null

static func f_SlideTo(c: Variant, a: Array) -> Variant:
	var v_fPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_bSliding"] = true
	(c).fields["m_fSlideToPosX"] = float(v_fPosX)
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_SlideSound")])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bCanBeDestroyed") and R.unary("!", R.call_member(c, "HasSoundPlaying", [])))):
		pass
		c.fields["m_bDestroyMe"] = true
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c).fields.get("m_bSliding")):
		pass
		(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c.fields.get("m_vLocation")).fields.get("X"), (c).fields.get("m_fSlideToPosX"), v_fDeltaTime, R.static_value("RDSpikeStrip", "SlideInterpSpeed")]), "Number")
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, R.static_value("RDEntity", "AnimEvent_Destroy"))):
		pass
		(c).fields["m_bCanBeDestroyed"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_fHP")) != float(0))
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDSpikeStrip"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			R.call_member(c, "Explode", [])
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["blownup"])
	R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
	(c).fields["m_bDestroyed"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 6, "=")
	R.set_value(c, "SlideInterpSpeed", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fHP"] = float(NAN)
	(c).fields["m_bTriggered"] = false
	(c).fields["m_iLane"] = R.coerce(0, "int")
	(c).fields["m_bDestroyed"] = false
	(c).fields["m_bCanBeDestroyed"] = false
	(c).fields["m_bSliding"] = false
	(c).fields["m_fSlideToPosX"] = float(NAN)
	(c).fields["m_SlideSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	return null
