extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func entity_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDEntity"), [])
	c.fields.m_iEntityIndex = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	c.fields.m_fScale = scale
	c.fields.m_ConstructorMCClass = clip_class
	if R.truth(c.fields.get("m_ConstructorMCClass")): R.call_member(c, "InitMCs", [c.fields.get("m_ConstructorMCClass")])
	c.fields.m_CollisionBounds = R.construct(R.klass("Box"), [])
	c.fields.m_iCollisionGroup = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	c.fields.m_vLocation = R.construct(R.klass("DTVector3D"), [])
	c.fields.m_vVelocity = R.construct(R.klass("DTVector3D"), [])
	c.fields.m_iLayer = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	c.fields.merge({"m_fBackSoundDistanceMultiplier": 2.0, "m_fMinRenderScale": 0.0, "m_fFadeDistance": 100.0, "m_fFadeRange": 50.0, "m_fHitDamage": 0.0, "m_fMinHitHP": 0.0, "m_fHitSpeedLoss": 0.0, "m_fHitShakeIntensity": 0.015, "m_fHitShakeDuration": 0.3}, true)
	c.fields.m_iLocationType = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
	c.fields.merge({"m_fBulletHitEffectScaleMin": 0.5, "m_fBulletHitEffectScaleMax": 1.0, "m_fMaxBulletHitEffectRotation": 0.0}, true)
	return null

static func entity_reset(c: R.Value, _a: Array) -> Variant:
	c.fields.m_iEntityIndex = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	if R.truth(c.fields.get("m_ConstructorMCClass")): R.call_member(c, "InitMCs", [c.fields.get("m_ConstructorMCClass")])
	c.fields.merge({"m_Properties": null, "m_PropertiesHash": null, "m_bEditorMode": false, "m_szAnim": ""}, true)
	R.call_member(c.fields.get("m_vLocation"), "SetZero", [])
	R.call_member(c.fields.get("m_vVelocity"), "SetZero", [])
	c.fields.merge({"m_bDestroyMe": false, "m_bFlippedX": false, "m_bLocationUsed": false}, true)
	R.call_member(c.fields.get("m_vMoveDir"), "SetZero", [])
	if not R.truth(c.fields.get("m_bHasCustomDepthPosition")): c.fields.m_fDepthPosition = 9999999999.0
	c.fields.merge({"m_iLastFinalNodeStep": -1, "m_iLastTestStep": -1, "m_iLastStartStep": -1, "m_bUseCurvyCamera": true, "m_bUnlockSurvivalGuide": true}, true)
	return null

static func obstacle_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDObstacle"), [clip_class, scale])
	c.fields.m_fMinRenderScale = 0.003
	if R.truth(c.fields.get("m_MC")): R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	c.fields.m_iCollisionGroup = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	(c.fields.get("m_CollisionBounds") as R.Value).fields.merge({"X": -0.5, "W": 1.0, "Y": 0.0, "H": 1.0, "Z": -0.5}, true)
	c.fields.merge({"m_bFlipOnCollision": true, "m_bCanBeRunThrough": false, "m_bDoHitAnim": true, "m_bCanBeHitByExplosion": true, "m_fMinHitHP": 1.0, "m_fFadeDistance": 50.0, "m_fFadeRange": 10.0, "m_bCanBeHitByBullet": true, "m_iPropertyValue": 5}, true)
	return null

static func obstacle_reset(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "SetInitialState"), [])
	c.fields.merge({"m_fHP": -1.0, "m_bHit": false, "m_bCanBeDestroyed": false, "m_ExplodeInstigator": null, "m_LastDamageInstigator": null}, true)
	return null

static func voiced_entity_constructor(c: R.Value, a: Array) -> Variant:
	var clip_class: Variant = R.arg(a, 0)
	var scale: float = R.num(R.arg(a, 1, 1))
	R.invoke(R.super_ref(c, "RDEntityWithVoice"), [clip_class, scale])
	c.fields.m_iVoicePriority = -1
	return null

static func voiced_entity_reset(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEntityWithVoice"), "SetInitialState"), [])
	c.fields.m_iVoicePriority = -1
	return null
