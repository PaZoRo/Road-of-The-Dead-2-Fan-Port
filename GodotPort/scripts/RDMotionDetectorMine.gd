extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDMotionDetectorMine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMotionDetectorMine"), [R.klass("MC_minemotion"), R.static_value("RDMotionDetectorMine", "Scale")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_MotionDetectorMines"), "int")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FenceHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BeepSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ProximityMine"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsFarQuiet")]), "DTSpacialSound")
	c.fields["m_bExplode"] = true
	c.fields["m_szExplodeAnim"] = R.coerce("Explode", "String")
	c.fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(5)
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.1), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(0.2)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fHP"] = float(1)
	c.fields["m_fExplosionRangeX"] = float(4)
	c.fields["m_fExplosionRangeZ"] = float(8)
	c.fields["m_fExplosionDamage"] = float(500)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "SetInitialState"), [])
	(c).fields["m_fBeepTimer"] = float(0)
	(c).fields["m_bPlayBeep"] = true
	(c).fields["m_bWaitToExplode"] = false
	(c).fields["m_bDetectPlayer"] = false
	(c).fields["m_bMineExploded"] = false
	(c).fields["m_fDelayedExplosionTimer"] = float(0)
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_fHP"] = float(1)
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_NextMine"] = R.coerce(null, "RDMotionDetectorMine")
	(c).fields["m_PreviousMine"] = R.coerce(null, "RDMotionDetectorMine")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_bDetectPlayer: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bDetectPlayer"] = v_bDetectPlayer
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "Update"), [v_fDeltaTime])
	if R.truth((((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) > float(0))) and R.unary("!", (c).fields.get("m_bMineExploded"))) and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		(c).fields["m_fBeepDelay"] = R.coerce(R.call_static("Maths", "Clamp", [(float(0.1) + float(R.binary("/", (float(v_fDistance) * float(0.9)), 50))), 0, 1]), "Number")
		(c).fields["m_fBeepTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fBeepTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fBeepTimer")) >= float((c).fields.get("m_fBeepDelay")))):
			pass
			(c).fields["m_fBeepTimer"] = float(0)
			R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", true, "=")
			R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Light"), "gotoAndPlay"), [1])
		if R.truth((c).fields.get("m_bDetectPlayer")):
			pass
			if R.truth(((c).fields.get("m_bPlayBeep") and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), R.call_member(c, "GetDetectDistance", [])))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BeepSound")])
				(c).fields["m_bPlayBeep"] = false
				(c).fields["m_bWaitToExplode"] = true
			if R.truth(((c).fields.get("m_bWaitToExplode") and R.unary("!", R.call_member((c).fields.get("m_BeepSound"), "IsPlaying", [])))):
				pass
				(c).fields["m_bMineExploded"] = true
				R.call_member(c, "Explode", [c])
				(c).fields["m_bWaitToExplode"] = false
		if R.truth((float((c).fields.get("m_fDelayedExplosionTimer")) > float(0))):
			pass
			(c).fields["m_fDelayedExplosionTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDelayedExplosionTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fDelayedExplosionTimer")) <= float(0))):
				pass
				(c).fields["m_bMineExploded"] = true
				R.call_member(c, "Explode", [c])
	return null

static func f_StartDelayedExplosion(c: Variant, a: Array) -> Variant:
	(c).fields["m_fDelayedExplosionTimer"] = float(R.static_value("RDMotionDetectorMine", "ExplosionDelay"))
	return null

static func f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMinesShot", 1, "+=")
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and R.unary("!", (c).fields.get("m_bMineExploded"))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "TouchedBy"), [v_entity])
	(c).fields["m_bMineExploded"] = true
	R.call_member(c, "Explode", [v_entity])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "TakeExplosionDamage"), [v_entity, v_instigator, v_iDamage, v_iDamageType, v_fDamageRatio])
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMotionDetectorMine"), "Explode"), [v_instigator])
	R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_BeepSound")])
	if R.truth((c).fields.get("m_NextMine")):
		pass
		R.call_member((c).fields.get("m_NextMine"), "StartDelayedExplosion", [])
	if R.truth((c).fields.get("m_PreviousMine")):
		pass
		R.call_member((c).fields.get("m_PreviousMine"), "StartDelayedExplosion", [])
	return null

static func f_GetDetectDistance(c: Variant, a: Array) -> Variant:
	return (float(R.static_value("RDMotionDetectorMine", "MinDetectDistance")) + float((R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])) * float((float(R.static_value("RDMotionDetectorMine", "MaxDetectDistance")) - float(R.static_value("RDMotionDetectorMine", "MinDetectDistance")))))))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	R.set_value(c, "MinDetectDistance", 5, "=")
	R.set_value(c, "MaxDetectDistance", 30, "=")
	R.set_value(c, "ExplosionDelay", 0.3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_fBeepTimer"] = float(0)
	(c).fields["m_fBeepDelay"] = float(NAN)
	(c).fields["m_bPlayBeep"] = true
	(c).fields["m_bWaitToExplode"] = false
	(c).fields["m_bDetectPlayer"] = false
	(c).fields["m_bMineExploded"] = false
	(c).fields["m_BeepSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_NextMine"] = R.coerce(null, "RDMotionDetectorMine")
	(c).fields["m_PreviousMine"] = R.coerce(null, "RDMotionDetectorMine")
	(c).fields["m_fDelayedExplosionTimer"] = float(0)
	return null
