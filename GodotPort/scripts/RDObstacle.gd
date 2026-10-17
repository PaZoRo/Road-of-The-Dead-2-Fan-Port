extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacle(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	R.invoke(R.super_ref(c, "RDObstacle"), [v_mcClass, v_fScale])
	c.fields["m_fMinRenderScale"] = float(0.003)
	if R.truth(c.fields.get("m_MC")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	(c.fields.get("m_CollisionBounds")).fields["X"] = R.coerce(R.unary("-", 0.5), "Number")
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(1)
	(c.fields.get("m_CollisionBounds")).fields["Z"] = R.coerce(R.unary("-", 0.5), "Number")
	(c).fields["m_bFlipOnCollision"] = true
	(c).fields["m_bCanBeRunThrough"] = false
	(c).fields["m_bDoHitAnim"] = true
	c.fields["m_bCanBeHitByExplosion"] = true
	c.fields["m_fMinHitHP"] = float(1)
	c.fields["m_fFadeDistance"] = float(50)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_iPropertyValue"] = R.coerce(5, "int")
	return null

static func f_InitMCs(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "InitMCs"), [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "SetInitialState"), [])
	(c).fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	(c).fields["m_bHit"] = false
	(c).fields["m_bCanBeDestroyed"] = false
	(c).fields["m_ExplodeInstigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_LastDamageInstigator"] = R.coerce(null, "RDEntity")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "Update"), [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bCanBeDestroyed") and R.unary("!", R.call_member(c, "HasSoundPlaying", [])))):
		pass
		c.fields["m_bDestroyMe"] = true
	if R.truth((float((c).fields.get("m_fExplosionDelay")) > float(0))):
		pass
		(c).fields["m_fExplosionDelay"] = R.coerce(R.binary("-", (c).fields.get("m_fExplosionDelay"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fExplosionDelay")) <= float(0))):
			pass
			R.call_member(c, "Explode", [(c).fields.get("m_ExplodeInstigator")])
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) and R.unary("!", (c).fields.get("m_bHit"))) and ((float((c).fields.get("m_fHP")) != float(0)) or (c).fields.get("m_bAlwaysCanGetHit")))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "TouchedBy"), [v_entity])
	if R.truth((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player")))):
		pass
		if R.truth((c).fields.get("m_bCanBeRunThrough")):
			pass
			if R.truth((c).fields.get("m_bDoHitAnim")):
				pass
				if R.truth((c).fields.get("m_bFlipOnCollision")):
					pass
					c.fields["m_bFlippedX"] = (float(((v_entity).fields.get("m_vLocation")).fields.get("X")) > float((c.fields.get("m_vLocation")).fields.get("X")))
				(c.fields.get("m_vLocation")).fields["Z"] = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(0.1)))
				R.call_member(c, "UpdateDepthPosition", [])
				(c.fields.get("m_vVelocity")).fields["X"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Y"] = float(0)
				(c.fields.get("m_vVelocity")).fields["Z"] = float(0)
				c.fields["m_bUseCurvyCamera"] = false
				R.call_member(v_entity, "AttachEntity", [c])
				if R.truth(R.binary("!=", (c).fields.get("m_szHitAnim"), "")):
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [(c).fields.get("m_szHitAnim")])
				else:
					pass
					R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [2])
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", (c).fields.get("m_iHitPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
				if R.truth((c).fields.get("m_HitSound")):
					pass
					R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_HitSound")])
		(c).fields["m_bHit"] = true
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 25))
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, R.static_value("RDEntity", "AnimEvent_Destroy"))):
		pass
		(c).fields["m_bCanBeDestroyed"] = true
		R.invoke(R.get_value(c.fields.get("m_MC"), "stop"), [])
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "OnAnimEvent"), [v_szEvent])
	return null

static func f_GetBumpDirection(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	return (R.unary("-", 1) if R.truth((float((c.fields.get("m_vLocation")).fields.get("X")) > float(((v_player).fields.get("m_vLocation")).fields.get("X")))) else 1)
	return null

static func f_OnPlayerHit(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	pass
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth((R.binary("==", v_entity, c) or (c).fields.get("m_bHit"))):
		pass
		return null
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		(c).fields["m_LastDamageInstigator"] = R.coerce(v_instigator, "RDEntity")
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			if R.truth((c).fields.get("m_bExplode")):
				pass
				(c).fields["m_ExplodeInstigator"] = R.coerce(v_instigator, "RDEntity")
				(c).fields["m_fExplosionDelay"] = float(0.15)
			else:
				pass
				R.call_member(c, "OnExploded", [v_instigator])
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	return (R.unary("!", (c).fields.get("m_bHit")) and ((float((c).fields.get("m_fHP")) != float(0)) or (c).fields.get("m_bAlwaysCanGetHit")))
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		(c).fields["m_LastDamageInstigator"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDEntity")
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			if R.truth((c).fields.get("m_bExplode")):
				pass
				R.call_member(c, "OnExplodeFromBulletHit", [((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")])
				R.call_member(c, "Explode", [((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player")])
			else:
				pass
				R.call_member(c, "OnShotDown", [((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), v_iDamageType])
	return null

static func f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	pass
	return null

static func f_OnShotDown(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth((((float(v_iDamageType) == float(R.static_value("RDDamageType", "ShreddingBullet"))) or (float(v_iDamageType) == float(R.static_value("RDDamageType", "DevastatingBullet")))) and R.binary("!=", (c).fields.get("m_szBulletShredAnim"), ""))):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [(c).fields.get("m_szBulletShredAnim")])
		if R.truth(R.binary("==", v_instigator, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), (R.num(R.binary("+", (c).fields.get("m_iHitPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))) * float(1.5))), "int")
	else:
		pass
		if R.truth(R.binary("!=", (c).fields.get("m_szBulletHitAnim"), "")):
			pass
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [(c).fields.get("m_szBulletHitAnim")])
			if R.truth(R.binary("==", v_instigator, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"))):
				pass
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", (c).fields.get("m_iHitPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
		else:
			pass
			(c).fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_bCanBeShotByHelicopter"] = false
	return null

static func f_OnExploded(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth(R.binary("!=", (c).fields.get("m_szExplodeHitAnim"), "")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [(c).fields.get("m_szExplodeHitAnim")])
		if R.truth(R.binary("==", v_instigator, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"))):
			pass
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", (c).fields.get("m_iHitPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	else:
		pass
		(c).fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	c.fields["m_bCanBeShotByHelicopter"] = false
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth(R.binary("!=", (c).fields.get("m_szExplodeAnim"), "")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [(c).fields.get("m_szExplodeAnim")])
	if R.truth((c).fields.get("m_ExplodeSound")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
	if R.truth((c).fields.get("m_bDealRadialDamageOnExplode")):
		pass
		R.call_member(c, "DealRadialDamage", [v_instigator, (c).fields.get("m_fExplosionRangeX"), (c).fields.get("m_fExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Explosive")])
	if R.truth(R.binary("==", v_instigator, ((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"))):
		pass
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", (c).fields.get("m_iExplodePropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacle"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		(c).fields["m_LastDamageInstigator"] = R.coerce(v_instigator, "RDEntity")
		if R.truth((float((c).fields.get("m_fHP")) == float(0))):
			pass
			if R.truth((c).fields.get("m_bExplode")):
				pass
				R.call_member(c, "OnExplodeFromBulletHit", [v_instigator])
				R.call_member(c, "Explode", [v_instigator])
			else:
				pass
				R.call_member(c, "OnShotDown", [v_instigator, v_iDamageType])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bHit"] = false
	(c).fields["m_HitSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bFlipOnCollision"] = false
	(c).fields["m_bCanBeRunThrough"] = false
	(c).fields["m_bDoGoThroughBump"] = false
	(c).fields["m_bCausesImpactShards"] = true
	(c).fields["m_bForceFullBump"] = false
	(c).fields["m_bCanBeDestroyed"] = false
	(c).fields["m_szHitAnim"] = R.coerce("", "String")
	(c).fields["m_szBulletHitAnim"] = R.coerce("", "String")
	(c).fields["m_szBulletShredAnim"] = R.coerce("", "String")
	(c).fields["m_szExplodeHitAnim"] = R.coerce("", "String")
	(c).fields["m_bDoHitAnim"] = false
	(c).fields["m_fHP"] = R.coerce(R.unary("-", 1), "Number")
	(c).fields["m_bExplode"] = false
	(c).fields["m_szExplodeAnim"] = R.coerce("", "String")
	(c).fields["m_fExplosionRangeX"] = float(8)
	(c).fields["m_fExplosionRangeZ"] = float(8)
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fExplosionDamage"] = float(1000)
	(c).fields["m_fExplosionDelay"] = float(0)
	(c).fields["m_iHitPropertyValue"] = R.coerce(10, "int")
	(c).fields["m_iExplodePropertyValue"] = R.coerce(20, "int")
	(c).fields["m_ExplodeInstigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_LastDamageInstigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_bDealRadialDamageOnExplode"] = true
	(c).fields["m_bAllowBumpReduction"] = true
	(c).fields["m_bAlwaysCanGetHit"] = false
	return null
