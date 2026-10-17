extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleCar(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleCar"), [null, R.static_value("RDObstacleCar", "Scale")])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "SetInitialState"), [])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_Obstacle"), "int")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_fWidth: Variant = NAN
	var v_fHeight: Variant = NAN
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_iMCFrame: Variant = R.coerce((a[1] if a.size() > 1 else 1), "int")
	var v_soundClass: Variant = R.coerce((a[2] if a.size() > 2 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [v_iMCFrame])
	c.fields["m_fMinRenderScale"] = float(0.02)
	if R.truth(v_soundClass):
		pass
		(c).fields["m_AmbientSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [v_soundClass, (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsCarSound")]), "DTSpacialSound")
		R.call_member((c).fields.get("m_AmbientSound"), "SetMaxVolume", [0.75])
	c.fields["m_fBackSoundDistanceMultiplier"] = float(4)
	c.fields["m_bExplode"] = true
	c.fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_CarExplosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	(c).fields["m_MetalExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MetalExplosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_bFlipOnCollision"] = false
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.3)
	c.fields["m_fHitShakeIntensity"] = float(0.2)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	v_fWidth = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("W")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDObstacleCar", "Scale")))
	v_fHeight = float(R.binary("/", (float((c.fields.get("m_Bounds")).fields.get("H")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), R.static_value("RDObstacleCar", "Scale")))
	(c.fields.get("m_CollisionBounds")).fields["X"] = float(R.binary("/", R.unary("-", v_fWidth), 2))
	(c.fields.get("m_CollisionBounds")).fields["W"] = float(v_fWidth)
	(c.fields.get("m_CollisionBounds")).fields["Y"] = float(0)
	(c.fields.get("m_CollisionBounds")).fields["H"] = float(v_fHeight)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	(c).fields["m_bPlayAmbientSound"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Fire")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Fire"), "visible", false, "=")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Smoke")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_iHitPropertyValue"] = R.coerce(250, "int")
	c.fields["m_iExplodePropertyValue"] = R.coerce(1000, "int")
	(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.call_member(c, "UpdateBreakableParts", [])
	c.fields["m_bCanBeShotByHelicopter"] = true
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		c.fields["m_bCanBeShotByHelicopter"] = false
		c.fields["m_bCanBeHitByExplosion"] = false
	(c).fields["m_ExplosionClass"] = R.coerce(R.klass("MC_EngineExplosion"), "Class")
	(c).fields["m_iDefaultHP"] = R.coerce(R.static_value("RDObstacleCar", "SmallCarHP"), "int")
	return null

static func f_SetHP(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_fHP: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fFill: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth(v_gameplayMode):
		pass
		v_fHP = R.coerce(R.binary("*", v_fHP, (v_gameplayMode).fields.get("m_fVehicleHPFactor")), "Number")
	(c).fields["m_fMaxHP"] = float(v_fHP)
	c.fields["m_fHP"] = float((float(v_fHP) * float(v_fFill)))
	(c).fields["m_fEngineHP"] = float((float(R.binary("/", v_fHP, 3)) * float(v_fFill)))
	(c).fields["m_fCenterHP"] = float(R.binary("/", v_fHP, 3))
	(c).fields["m_fBackPartHP"] = float(R.binary("/", v_fHP, 3))
	if R.truth((float(v_fFill) < float(1))):
		pass
		(c).fields["m_bWaitForPlayerToExplode"] = true
		(c).fields["m_bCanExplode"] = false
	(c).fields["m_fHPDegen"] = float((float((float(c.fields.get("m_fHP")) * float(0.25))) * float(0.3)))
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		(c).fields["m_EngineDamagePoint"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCarDamagePoint")]), R.klass("RDCarDamagePoint")), "RDCarDamagePoint")
		R.call_member((c).fields.get("m_EngineDamagePoint"), "Init", [c, R.static_value("RDCarDamagePoint", "Type_Engine"), (c).fields.get("m_fEngineHP")])
		(c).fields["m_BackDamagePoint"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCarDamagePoint")]), R.klass("RDCarDamagePoint")), "RDCarDamagePoint")
		R.call_member((c).fields.get("m_BackDamagePoint"), "Init", [c, R.static_value("RDCarDamagePoint", "Type_Back"), (c).fields.get("m_fBackPartHP")])
		if R.truth(R.get_value(c.fields.get("m_MC"), "Center")):
			pass
			(c).fields["m_CenterDamagePoint"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCarDamagePoint")]), R.klass("RDCarDamagePoint")), "RDCarDamagePoint")
			R.call_member((c).fields.get("m_CenterDamagePoint"), "Init", [c, R.static_value("RDCarDamagePoint", "Type_Center"), (c).fields.get("m_fCenterHP")])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fPlayerDist: Variant = NAN
	var v_fHP: Variant = NAN
	var v_fMaxHP: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fPlayerDist = float(NAN)
	v_fHP = R.coerce(((c).fields.get("m_fEngineHP") if R.truth(R.binary("!=", R.get_value(c.fields.get("m_MC"), "Engine"), null)) else c.fields.get("m_fHP")), "Number")
	v_fMaxHP = R.coerce((R.binary("/", (c).fields.get("m_fMaxHP"), 3) if R.truth(R.binary("!=", R.get_value(c.fields.get("m_MC"), "Engine"), null)) else (c).fields.get("m_fMaxHP")), "Number")
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		if R.truth(R.get_value(c.fields.get("m_MC"), "Fire")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "Fire"), "visible", ((float(v_fHP) > float(0)) and (float(v_fHP) <= float(R.binary("/", v_fMaxHP, 4)))), "=")
		if R.truth(R.get_value(c.fields.get("m_MC"), "Smoke")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", ((float(v_fHP) > float(0)) and (float(v_fHP) <= float(R.binary("/", v_fMaxHP, 2)))), "=")
		if R.truth((c).fields.get("m_bShowEditorRandomIcon")):
			pass
			if R.truth(R.binary("!=", R.invoke(R.get_value(c.fields.get("m_szFactoryName"), "indexOf"), ["Random"]), R.unary("-", 1))):
				pass
				(c).fields["m_RandomIcon"] = R.coerce(R.construct(R.klass("MC_CarRandomIcon"), []), "MovieClip")
				R.invoke(R.get_value(c.fields.get("m_MC"), "addChild"), [(c).fields.get("m_RandomIcon")])
			(c).fields["m_bShowEditorRandomIcon"] = false
		return null
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "Update"), [v_fDeltaTime])
	if R.truth((float(v_fHP) > float(0))):
		pass
		v_fPlayerDist = R.coerce(R.call_static("Maths", "AbsNumber", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		if R.truth(((R.truth(R.logical_and(R.logical_and((c).fields.get("m_bPlayAmbientSound"), func(): return (c).fields.get("m_AmbientSound")), func(): return R.unary("!", R.call_member((c).fields.get("m_AmbientSound"), "IsPlaying", [])))) and R.truth((float(v_fPlayerDist) < float(R.static_value("RDObstacleCar", "AmbientSoundDistance"))))) and R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "IsChopperMode", [])))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_AmbientSound"), true])
			(c).fields["m_bPlayAmbientSound"] = false
		if R.truth(R.get_value(c.fields.get("m_MC"), "Fire")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "Fire"), "visible", (float(v_fHP) <= float(R.binary("/", v_fMaxHP, 4))), "=")
		if R.truth(R.get_value(c.fields.get("m_MC"), "Smoke")):
			pass
			R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", (float(v_fHP) <= float(R.binary("/", v_fMaxHP, 2))), "=")
		if R.truth(((c).fields.get("m_bWaitForPlayerToExplode") and (float(v_fPlayerDist) < float(R.static_value("RDObstacleCar", "ExplodePlayerDistance"))))):
			pass
			(c).fields["m_bCanExplode"] = true
			(c).fields["m_bWaitForPlayerToExplode"] = false
		if R.truth((((c).fields.get("m_bCanExplode") and (float(v_fHP) <= float(R.binary("/", v_fMaxHP, 4)))) and (float((R.num(R.invoke(R.resolve(c, "getTimer", "RDObstacleCar"), [])) - float((c).fields.get("m_iLastDamageTime")))) > float(500)))):
			pass
			v_fHP = float(maxf(float((float(v_fHP) - float((float((float((c).fields.get("m_fHPDegen")) * float(maxf(R.num(R.call_member((c).fields.get("m_Player"), "GetSpeedRatio", [])), float(0.1))))) * float(v_fDeltaTime))))), float(0)))
			if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
				pass
				(c).fields["m_fEngineHP"] = float(v_fHP)
			else:
				pass
				c.fields["m_fHP"] = float(v_fHP)
			if R.truth((float(v_fHP) == float(0))):
				pass
				c.fields["m_fExplosionDamage"] = float(1000)
				R.call_member(c, "Explode", [c.fields.get("m_LastDamageInstigator")])
	return null

static func f_Explode(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_child: Variant = null
	var v_explosion: Variant = null
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	v_child = R.coerce(null, "DisplayObject")
	v_explosion = R.coerce(null, "RDObject")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "Explode"), [v_instigator])
	if R.truth(R.get_value(c.fields.get("m_MC"), "Fire")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Fire"), "visible", false, "=")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Smoke")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Smoke"), "visible", false, "=")
	if R.truth(R.logical_and(R.truth((c).fields.get("m_AmbientSound")), func(): return R.call_member((c).fields.get("m_AmbientSound"), "IsPlaying", []))):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_AmbientSound")])
	if R.truth(R.unary("!", R.get_value(c.fields.get("m_MC"), "Engine"))):
		pass
		if R.truth(R.binary("==", c.fields.get("m_szExplodeAnim"), "")):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value(c.fields.get("m_MC"), "numChildren"))):
				pass
				v_child = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "getChildAt"), [v_i]), "DisplayObject")
				R.set_value(v_child, "visible", false, "=")
				v_i = R.signed32(v_i + 1)
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		v_explosion = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectEngineExplosion")]), R.klass("RDObject")), "RDObject")
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosion, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fEnginePartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		R.call_member(c, "SplitCar", [])
	else:
		pass
		if R.truth((c).fields.get("m_ExplosionClass")):
			pass
			(c).fields["m_ExplosionMC"] = R.coerce(R.call_static("RDGame", "GetMC", [(c).fields.get("m_ExplosionClass")]), "MovieClip")
			if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
				pass
				R.set_value((c).fields.get("m_ExplosionMC"), "x", R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "x"), "=")
			R.invoke(R.get_value((c).fields.get("m_ExplosionMC"), "play"), [])
			R.invoke(R.get_value(c.fields.get("m_MC"), "addChild"), [(c).fields.get("m_ExplosionMC")])
	c.fields["m_bCanBeShotByHelicopter"] = false
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCarsExploded", 1, "+=")
	return null

static func f_TakeEngineDamage(c: Variant, a: Array) -> Variant:
	var v_fCenterHP: Variant = NAN
	var v_fBackPartHP: Variant = NAN
	var v_explosion: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_fCenterHP = float(NAN)
	v_fBackPartHP = float(NAN)
	v_explosion = R.coerce(null, "RDObject")
	if R.truth((float((c).fields.get("m_fEngineHP")) > float(0))):
		pass
		(c).fields["m_fEngineHP"] = float(maxf(float((float((c).fields.get("m_fEngineHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fEngineHP")) == float(0))):
			pass
			if R.truth(c.fields.get("m_ExplodeSound")):
				pass
				R.call_member(c, "PlaySoundOnActor", [c.fields.get("m_ExplodeSound")])
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
			v_fCenterHP = float((c).fields.get("m_fCenterHP"))
			v_fBackPartHP = float((c).fields.get("m_fBackPartHP"))
			(c).fields["m_fCenterHP"] = float(0)
			(c).fields["m_fBackPartHP"] = float(0)
			R.call_member(c, "DealRadialDamage", [(c).fields.get("m_Player"), c.fields.get("m_fExplosionRangeX"), c.fields.get("m_fExplosionRangeZ"), c.fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Explosive")])
			(c).fields["m_fCenterHP"] = float(v_fCenterHP)
			(c).fields["m_fBackPartHP"] = float(v_fBackPartHP)
			if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and (((R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponMountedMG")) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"))))):
				pass
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCarsBlownUpByMountedWeapon", 1, "+=")
				R.call_member(c, "HandleUnstoppableForceAchievement", [])
			R.call_member(c, "SplitCar", [])
			v_explosion = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectEngineExplosion")]), R.klass("RDObject")), "RDObject")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosion, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fEnginePartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iExplodePropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	return null

static func f_TakeCenterDamage(c: Variant, a: Array) -> Variant:
	var v_explosion: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_explosion = R.coerce(null, "RDObject")
	if R.truth((float((c).fields.get("m_fCenterHP")) > float(0))):
		pass
		(c).fields["m_fCenterHP"] = float(maxf(float((float((c).fields.get("m_fCenterHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fCenterHP")) == float(0))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MetalExplodeSound")])
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
			v_explosion = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectMetalExplosion")]), R.klass("RDObjectMetalExplosion")), "RDObject")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosion, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fCenterPartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
			if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and (((R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponMountedMG")) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"))))):
				pass
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCarsBlownUpByMountedWeapon", 1, "+=")
				R.call_member(c, "HandleUnstoppableForceAchievement", [])
			R.call_member(c, "SplitCar", [])
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iExplodePropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	return null

static func f_TakeBackDamage(c: Variant, a: Array) -> Variant:
	var v_explosion: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_explosion = R.coerce(null, "RDObject")
	if R.truth((float((c).fields.get("m_fBackPartHP")) > float(0))):
		pass
		(c).fields["m_fBackPartHP"] = float(maxf(float((float((c).fields.get("m_fBackPartHP")) - float(v_iDamage))), float(0)))
		if R.truth((float((c).fields.get("m_fBackPartHP")) == float(0))):
			pass
			R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_MetalExplodeSound")])
			R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.1, 0, 0, 0.5])
			v_explosion = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObjectMetalExplosion")]), R.klass("RDObject")), "RDObject")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosion, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fBackPartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
			if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and (((R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponMountedMG")) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"))))):
				pass
				if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
					pass
					R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCarsBlownUpByMountedWeapon", 1, "+=")
				R.call_member(c, "HandleUnstoppableForceAchievement", [])
			R.call_member(c, "SplitCar", [])
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iExplodePropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_bHit: Variant = false
	var v_effectClasses: Variant = null
	var v_bulletHitSounds: Variant = null
	var v_effectClass: Variant = null
	var v_hitEffect: Variant = null
	var v_fScale: Variant = NAN
	var v_bulletEffectContainer: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_bHit = false
	v_effectClasses = R.coerce(null, "Array")
	v_bulletHitSounds = R.coerce(null, "Array")
	v_effectClass = R.coerce(null, "Class")
	v_hitEffect = R.coerce(null, "MovieClip")
	v_fScale = float(NAN)
	v_bulletEffectContainer = R.coerce(null, "MovieClip")
	(c).fields["m_iLastDamageTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "RDObstacleCar"), []), "int")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		v_bHit = false
		if R.truth((float((c).fields.get("m_fEngineHP")) > float(0))):
			pass
			v_bHit = R.truth(R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "hitTestPoint"), [R.get_value(v_hitPos, "x"), R.get_value(v_hitPos, "y"), true]))
			if R.truth(v_bHit):
				pass
				R.call_member(c, "TakeEngineDamage", [v_iDamage, (c).fields.get("m_Player"), v_iDamageType])
		if R.truth((R.unary("!", v_bHit) and (float((c).fields.get("m_fBackPartHP")) > float(0)))):
			pass
			v_bHit = R.truth(R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "hitTestPoint"), [R.get_value(v_hitPos, "x"), R.get_value(v_hitPos, "y"), true]))
			if R.truth(v_bHit):
				pass
				R.call_member(c, "TakeBackDamage", [v_iDamage, (c).fields.get("m_Player"), v_iDamageType])
		if R.truth(((R.truth(R.unary("!", v_bHit)) and R.truth(R.get_value(c.fields.get("m_MC"), "Center"))) and (float((c).fields.get("m_fCenterHP")) > float(0)))):
			pass
			v_bHit = R.truth(R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "hitTestPoint"), [R.get_value(v_hitPos, "x"), R.get_value(v_hitPos, "y"), true]))
			if R.truth(v_bHit):
				pass
				R.call_member(c, "TakeCenterDamage", [v_iDamage, (c).fields.get("m_Player"), v_iDamageType])
		if R.truth(v_bHit):
			pass
			v_effectClasses = R.coerce(R.call_member(c, "GetBulletHitEffects", []), "Array")
			if R.truth(v_effectClasses):
				pass
				R.set_value(c.fields.get("m_BulletHitPos"), "x", R.get_value(v_hitPos, "x"), "=")
				R.set_value(c.fields.get("m_BulletHitPos"), "y", R.get_value(v_hitPos, "y"), "=")
				c.fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "globalToLocal"), [c.fields.get("m_BulletHitPos")]), "Point")
				v_effectClass = R.coerce(R.get_value(v_effectClasses, R.call_static("Maths", "RandomInt", [R.get_value(v_effectClasses, "length")])), "Class")
				v_hitEffect = R.coerce(R.call_static("RDGame", "GetMC", [v_effectClass]), "MovieClip")
				R.set_value(v_hitEffect, "m_owner", c, "=")
				R.set_value(v_hitEffect, "x", R.get_value(c.fields.get("m_BulletHitPos"), "x"), "=")
				R.set_value(v_hitEffect, "y", R.get_value(c.fields.get("m_BulletHitPos"), "y"), "=")
				R.set_value(v_hitEffect, "rotation", R.binary("+", R.unary("-", c.fields.get("m_fMaxBulletHitEffectRotation")), (float((float(randf()) * float(2))) * float(c.fields.get("m_fMaxBulletHitEffectRotation")))), "=")
				v_fScale = float((float(c.fields.get("m_fBulletHitEffectScaleMin")) + float((float(randf()) * float((float(c.fields.get("m_fBulletHitEffectScaleMax")) - float(c.fields.get("m_fBulletHitEffectScaleMin"))))))))
				R.set_value(v_hitEffect, "scaleX", v_fScale, "=")
				R.set_value(v_hitEffect, "scaleY", v_fScale, "=")
				v_bulletEffectContainer = R.coerce(R.call_member(c, "GetBulletHitEffectContainer", []), "MovieClip")
				R.invoke(R.get_value(v_hitEffect, "play"), [])
				R.invoke(R.get_value(v_bulletEffectContainer, "addChild"), [v_hitEffect])
			v_bulletHitSounds = R.coerce(R.call_member(c, "GetBulletHitSounds", []), "Array")
			if R.truth(v_bulletHitSounds):
				pass
				R.call_member(c, "PlaySoundOnActor", [R.get_value(v_bulletHitSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_bulletHitSounds, "length")]))])
			if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
				pass
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	else:
		pass
		R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "OnBulletHit"), [v_iDamage, v_iDamageType, v_hitPos])
	return null

static func f_SplitCar(c: Variant, a: Array) -> Variant:
	var v_part: Variant = null
	var v_child: Variant = null
	var v_fFlip: Variant = NAN
	var v_i: Variant = 0
	v_part = R.coerce(null, "RDObstacleCar")
	v_child = R.coerce(null, "DisplayObject")
	c.fields["m_bCanBeDestroyed"] = true
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	v_fFlip = R.coerce((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1), "Number")
	if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Engine")) and ((float((c).fields.get("m_fEngineHP")) > float(0)) and ((float((c).fields.get("m_fCenterHP")) == float(0)) or (float((c).fields.get("m_fBackPartHP")) == float(0)))))):
		pass
		v_part = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
		R.call_member(v_part, "Init", [(c).fields.get("m_EnginePartClass")])
		R.call_member(v_part, "SetHP", [(c).fields.get("m_fEngineHP")])
		(v_part).fields["m_bFlippedX"] = c.fields.get("m_bFlippedX")
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_part, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fEnginePartPos")) * float(v_fFlip)))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		R.invoke(R.get_value((v_part).fields.get("m_MC"), "play"), [])
	if R.truth(((R.truth(R.get_value(c.fields.get("m_MC"), "BackPart")) and R.truth((float((c).fields.get("m_fBackPartHP")) > float(0)))) and ((float((c).fields.get("m_fCenterHP")) == float(0)) or (float((c).fields.get("m_fEngineHP")) == float(0))))):
		pass
		v_part = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
		R.call_member(v_part, "Init", [(c).fields.get("m_BackPartClass")])
		R.call_member(v_part, "SetHP", [(c).fields.get("m_fBackPartHP")])
		(v_part).fields["m_bFlippedX"] = c.fields.get("m_bFlippedX")
		(v_part).fields["m_ExplosionClass"] = R.coerce(R.klass("MC_MetalExplosion"), "Class")
		(v_part).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MetalExplosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		(v_part).fields["m_bCanExplode"] = false
		(v_part).fields["m_bDealRadialDamageOnExplode"] = false
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_part, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fBackPartPos")) * float(v_fFlip)))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		R.invoke(R.get_value((v_part).fields.get("m_MC"), "play"), [])
	if R.truth(((R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth((float((c).fields.get("m_fCenterHP")) > float(0)))) and ((float((c).fields.get("m_fEngineHP")) == float(0)) or (float((c).fields.get("m_fBackPartHP")) == float(0))))):
		pass
		v_part = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleCar")]), R.klass("RDObstacleCar")), "RDObstacleCar")
		R.call_member(v_part, "Init", [(c).fields.get("m_CenterPartClass")])
		R.call_member(v_part, "SetHP", [(c).fields.get("m_fCenterHP")])
		(v_part).fields["m_bFlippedX"] = c.fields.get("m_bFlippedX")
		(v_part).fields["m_ExplosionClass"] = R.coerce(R.klass("MC_MetalExplosion"), "Class")
		(v_part).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MetalExplosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
		(v_part).fields["m_bCanExplode"] = false
		(v_part).fields["m_bDealRadialDamageOnExplode"] = false
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_part, (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fCenterPartPos")) * float(v_fFlip)))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		R.invoke(R.get_value((v_part).fields.get("m_MC"), "play"), [])
	(c).fields["m_fEngineHP"] = float(0)
	(c).fields["m_fCenterHP"] = float(0)
	(c).fields["m_fBackPartHP"] = float(0)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(c.fields.get("m_MC"), "numChildren"))):
		pass
		v_child = R.coerce(R.invoke(R.get_value(c.fields.get("m_MC"), "getChildAt"), [v_i]), "DisplayObject")
		R.set_value(v_child, "visible", false, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateBreakableParts(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Engine"), "visible", ((float((c).fields.get("m_fEngineHP")) > float(0)) and ((float((c).fields.get("m_fCenterHP")) == float(0)) or (float((c).fields.get("m_fBackPartHP")) == float(0)))), "=")
	if R.truth(R.get_value(c.fields.get("m_MC"), "BackPart")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "visible", ((float((c).fields.get("m_fBackPartHP")) > float(0)) and ((float((c).fields.get("m_fCenterHP")) == float(0)) or (float((c).fields.get("m_fEngineHP")) == float(0)))), "=")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Center")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible", ((float((c).fields.get("m_fCenterHP")) > float(0)) and ((float((c).fields.get("m_fEngineHP")) == float(0)) or (float((c).fields.get("m_fBackPartHP")) == float(0)))), "=")
	if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Full")) and (((R.truth(R.get_value(c.fields.get("m_MC"), "Engine")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "visible"))) or (R.truth(R.get_value(c.fields.get("m_MC"), "BackPart")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "visible")))) or (R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible")))))):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "Full"), "visible", false, "=")
	return null

static func f_CanSpawnZombie(c: Variant, a: Array) -> Variant:
	var v_bUnlimited: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		return ((R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "visible")) or R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "visible"))) or (R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible"))))
	return (float(c.fields.get("m_fHP")) > float(0))
	return null

static func f_GetZombieSpawnLocation(c: Variant, a: Array) -> Variant:
	var v_iSpawnPosition: Variant = 0
	var v_fDistFromLeft: Variant = NAN
	var v_fDistFromRight: Variant = NAN
	var v_bEngineRight: Variant = false
	v_iSpawnPosition = R.coerce(0, "int")
	v_fDistFromLeft = float(NAN)
	v_fDistFromRight = float(NAN)
	v_bEngineRight = false
	v_fDistFromLeft = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))))]), "Number")
	v_fDistFromRight = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X")) - float((float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))) + float((c.fields.get("m_CollisionBounds")).fields.get("W")))))]), "Number")
	if R.truth(R.get_value(c.fields.get("m_MC"), "Engine")):
		pass
		v_bEngineRight = (R.binary(">", R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "x"), R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "x")) and R.unary("!", c.fields.get("m_bFlippedX")))
		if R.truth((float(v_fDistFromLeft) < float(v_fDistFromRight))):
			pass
			if R.truth(v_bEngineRight):
				pass
				v_iSpawnPosition = R.coerce((R.unary("-", 1) if R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "visible")) else (0 if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible")))) else 1)), "int")
			else:
				pass
				v_iSpawnPosition = R.coerce((R.unary("-", 1) if R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "visible")) else (0 if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible")))) else 1)), "int")
		else:
			pass
			if R.truth(v_bEngineRight):
				pass
				v_iSpawnPosition = R.coerce((1 if R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Engine"), "visible")) else (0 if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible")))) else R.unary("-", 1))), "int")
			else:
				pass
				v_iSpawnPosition = R.coerce((1 if R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "BackPart"), "visible")) else (0 if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Center")) and R.truth(R.get_value(R.get_value(c.fields.get("m_MC"), "Center"), "visible")))) else R.unary("-", 1))), "int")
	else:
		pass
		v_iSpawnPosition = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", (float(v_fDistFromLeft) < float(v_fDistFromRight)), c.fields.get("m_bFlippedX"))) else 1), "int")
	((c).fields.get("m_vZombieSpawnLocation")).fields["Z"] = float((c.fields.get("m_vLocation")).fields.get("Z"))
	if R.truth(R.binary("==", v_iSpawnPosition, R.unary("-", 1))):
		pass
		((c).fields.get("m_vZombieSpawnLocation")).fields["X"] = float((float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))) + float(1.5)))
	else:
		pass
		if R.truth((float(v_iSpawnPosition) == float(1))):
			pass
			((c).fields.get("m_vZombieSpawnLocation")).fields["X"] = float((float((float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))) + float((c.fields.get("m_CollisionBounds")).fields.get("W")))) - float(1.5)))
		else:
			pass
			((c).fields.get("m_vZombieSpawnLocation")).fields["X"] = float((c.fields.get("m_vLocation")).fields.get("X"))
	return (c).fields.get("m_vZombieSpawnLocation")
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	var v_hiddenSoldier: Variant = null
	v_hiddenSoldier = R.coerce(null, "RDSoldier")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "OnAddedToWorld"), [])
	if R.truth((R.truth(R.get_value(c.fields.get("m_MC"), "Engine")) and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_EngineDamagePoint"), (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fEnginePartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_BackDamagePoint"), (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fBackPartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
		if R.truth(R.get_value(c.fields.get("m_MC"), "Center")):
			pass
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CenterDamagePoint"), (float((c.fields.get("m_vLocation")).fields.get("X")) + float((float((c).fields.get("m_fCenterPartPos")) * R.num((R.unary("-", 1) if R.truth(c.fields.get("m_bFlippedX")) else 1))))), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (c.fields.get("m_vLocation")).fields.get("Z")])
	if R.truth((c).fields.get("m_bWithHiddenSoldierLeft")):
		pass
		if R.truth(R.logical_and(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnMilitary", []), func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
			pass
			v_hiddenSoldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
			R.call_member(v_hiddenSoldier, "Init", [R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")])
			(v_hiddenSoldier).fields["m_bFlippedX"] = true
			R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_hiddenSoldier, (float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))) - float(R.static_value("RDSoldier", "SlideOutHideOffset"))), R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))]), (float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])
	if R.truth((c).fields.get("m_bWithHiddenSoldierRight")):
		pass
		if R.truth(R.logical_and(R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnMilitary", []), func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
			pass
			v_hiddenSoldier = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "RDSoldier")
			R.call_member(v_hiddenSoldier, "Init", [R.static_value("RDSoldier", "Behavior_SliderOutAndShoot")])
			(v_hiddenSoldier).fields["m_bFlippedX"] = false
			R.call_member(R.static_value("RDGame", "Instance"), "AddEntity", [v_hiddenSoldier, (float((float((float((c.fields.get("m_vLocation")).fields.get("X")) + float((c.fields.get("m_CollisionBounds")).fields.get("X")))) + float((c.fields.get("m_CollisionBounds")).fields.get("W")))) + float(R.static_value("RDSoldier", "SlideOutHideOffset"))), R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))]), (float((c.fields.get("m_vLocation")).fields.get("Z")) + float(0.1))])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_EngineDamagePoint")):
		pass
		((c).fields.get("m_EngineDamagePoint")).fields["m_bDestroyMe"] = true
		((c).fields.get("m_BackDamagePoint")).fields["m_bDestroyMe"] = true
		if R.truth((c).fields.get("m_CenterDamagePoint")):
			pass
			((c).fields.get("m_CenterDamagePoint")).fields["m_bDestroyMe"] = true
	if R.truth((c).fields.get("m_RandomIcon")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_RandomIcon")])
		(c).fields["m_RandomIcon"] = R.coerce(null, "MovieClip")
	if R.truth((c).fields.get("m_LeftHiddenSoldierIcon")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_LeftHiddenSoldierIcon")])
		(c).fields["m_LeftHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
	if R.truth((c).fields.get("m_RightHiddenSoldierIcon")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_RightHiddenSoldierIcon")])
		(c).fields["m_RightHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
	if R.truth((c).fields.get("m_ExplosionMC")):
		pass
		R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_ExplosionMC")])
		R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_ExplosionMC")])
		(c).fields["m_ExplosionMC"] = R.coerce(null, "MovieClip")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "Destroy"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_EngineDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	(c).fields["m_CenterDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	(c).fields["m_BackDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	R.call_member(c, "DestroyEntitySpacialSound", [(c).fields.get("m_AmbientSound")])
	return null

static func f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and (((R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponMountedMG")) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_WeaponRocketLauncher"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponMountedMG"))) or R.binary("==", ((c).fields.get("m_Player")).fields.get("m_Weapon"), ((c).fields.get("m_Player")).fields.get("m_CustomWeaponRocketLauncher"))))):
		pass
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iCarsBlownUpByMountedWeapon", 1, "+=")
		R.call_member(c, "HandleUnstoppableForceAchievement", [])
	return null

static func f_HandleUnstoppableForceAchievement(c: Variant, a: Array) -> Variant:
	if R.truth((R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")):
		pass
		return null
	if R.truth(((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCarsBlownUpByMountedWeapon")) >= float(R.static_value("RDAchievement", "UnstoppableForceCount"))) and R.unary("!", R.get_value((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "UnstoppableForce"))))):
		pass
		R.call_member(R.static_value("RDGame", "Instance"), "CompleteAchievement", [R.static_value("RDAchievement", "UnstoppableForce")])
		R.call_member(R.static_value("RDGame", "Instance"), "SavePlayerInfo", [])
	return null

static func f_CanHaveBurningProperty(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_CanHaveHiddenSoldierProperty(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_InitProperties(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "CanHaveBurningProperty", [])):
		pass
		R.call_member(c, "AddProperty", ["Burning", R.static_value("RDProperty", "Type_Boolean"), false])
	if R.truth(R.call_member(c, "CanHaveHiddenSoldierProperty", [])):
		pass
		R.call_member(c, "AddProperty", ["Hidden Soldier Left", R.static_value("RDProperty", "Type_Boolean"), false])
		R.call_member(c, "AddProperty", ["Hidden Soldier Right", R.static_value("RDProperty", "Type_Boolean"), false])
	return null

static func f_SetProperty(c: Variant, a: Array) -> Variant:
	var v_bounds: Variant = null
	var v_bBurning: Variant = false
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	v_bounds = R.coerce(null, "Rectangle")
	v_bBurning = false
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "SetProperty"), [v_szName, v_value])
	if R.truth(R.binary("==", v_szName, "Burning")):
		pass
		v_bBurning = R.binary("as", v_value, R.klass("Boolean"))
		if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanHaveExplodingCars", []))):
			pass
			v_bBurning = false
		R.call_member(c, "SetHP", [(c).fields.get("m_iDefaultHP"), (R.static_value("RDObstacleCar", "ExplodeHPFill") if R.truth(R.logical_and(v_bBurning, func(): return R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanHaveExplodingCars", []))) else 1)])
	else:
		pass
		if R.truth(R.binary("==", v_szName, "Hidden Soldier Left")):
			pass
			(c).fields["m_bWithHiddenSoldierLeft"] = R.binary("as", v_value, R.klass("Boolean"))
			if R.truth(c.fields.get("m_bEditorMode")):
				pass
				if R.truth((c).fields.get("m_bWithHiddenSoldierLeft")):
					pass
					v_bounds = R.coerce((R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "BulletCollision"), "getBounds"), [c.fields.get("m_MC")]) if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")) else R.invoke(R.get_value(c.fields.get("m_MC"), "getBounds"), [c.fields.get("m_MC")])), "Rectangle")
					(c).fields["m_LeftHiddenSoldierIcon"] = R.coerce(R.construct(R.klass("MC_HiddenSoldierIcon"), []), "MovieClip")
					R.set_value((c).fields.get("m_LeftHiddenSoldierIcon"), "scaleX", 0.3, "=")
					R.set_value((c).fields.get("m_LeftHiddenSoldierIcon"), "scaleY", 0.3, "=")
					R.invoke(R.get_value(c.fields.get("m_MC"), "addChildAt"), [(c).fields.get("m_LeftHiddenSoldierIcon"), 0])
					R.set_value((c).fields.get("m_LeftHiddenSoldierIcon"), "x", (R.get_value(v_bounds, "right") if R.truth(c.fields.get("m_bFlippedX")) else R.get_value(v_bounds, "left")), "=")
				else:
					pass
					if R.truth((c).fields.get("m_LeftHiddenSoldierIcon")):
						pass
						R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_LeftHiddenSoldierIcon")])
						(c).fields["m_LeftHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
			if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
				pass
				(c).fields["m_bWithHiddenSoldierLeft"] = false
		else:
			pass
			if R.truth(R.binary("==", v_szName, "Hidden Soldier Right")):
				pass
				(c).fields["m_bWithHiddenSoldierRight"] = R.binary("as", v_value, R.klass("Boolean"))
				if R.truth(c.fields.get("m_bEditorMode")):
					pass
					if R.truth((c).fields.get("m_bWithHiddenSoldierRight")):
						pass
						v_bounds = R.coerce((R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "BulletCollision"), "getBounds"), [c.fields.get("m_MC")]) if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")) else R.invoke(R.get_value(c.fields.get("m_MC"), "getBounds"), [c.fields.get("m_MC")])), "Rectangle")
						(c).fields["m_RightHiddenSoldierIcon"] = R.coerce(R.construct(R.klass("MC_HiddenSoldierIcon"), []), "MovieClip")
						R.set_value((c).fields.get("m_RightHiddenSoldierIcon"), "scaleX", 0.3, "=")
						R.set_value((c).fields.get("m_RightHiddenSoldierIcon"), "scaleY", 0.3, "=")
						R.invoke(R.get_value(c.fields.get("m_MC"), "addChildAt"), [(c).fields.get("m_RightHiddenSoldierIcon"), 0])
						R.set_value((c).fields.get("m_RightHiddenSoldierIcon"), "x", (R.get_value(v_bounds, "left") if R.truth(c.fields.get("m_bFlippedX")) else R.get_value(v_bounds, "right")), "=")
					else:
						pass
						if R.truth((c).fields.get("m_RightHiddenSoldierIcon")):
							pass
							R.invoke(R.get_value(c.fields.get("m_MC"), "removeChild"), [(c).fields.get("m_RightHiddenSoldierIcon")])
							(c).fields["m_RightHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
				if R.truth(R.unary("!", R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "CanSpawnHiddenSoldier", []))):
					pass
					(c).fields["m_bWithHiddenSoldierRight"] = false
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	(c).fields["m_iLastDamageTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "RDObstacleCar"), []), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "TakeDamage"), [v_iDamage, v_instigator, v_iDamageType])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	if R.truth(R.binary("as", v_entity, R.klass("RDObstacleCar"))):
		pass
		v_iDamage = R.coerce(R.binary("*", v_iDamage, 0.5), "int")
		c.fields["m_fExplosionDamage"] = float(v_iDamage)
	(c).fields["m_iLastDamageTime"] = R.coerce(R.invoke(R.resolve(c, "getTimer", "RDObstacleCar"), []), "int")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleCar"), "TakeExplosionDamage"), [v_entity, v_instigator, v_iDamage, v_iDamageType, v_fDamageRatio])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 6, "=")
	R.set_value(c, "AmbientSoundDistance", 100, "=")
	R.set_value(c, "HugeCarHP", 1500, "=")
	R.set_value(c, "LargeCarHP", 1200, "=")
	R.set_value(c, "MediumCarHP", 700, "=")
	R.set_value(c, "SmallCarHP", 500, "=")
	R.set_value(c, "FuelTruckHP", 20, "=")
	R.set_value(c, "ExplodePlayerDistance", 100, "=")
	R.set_value(c, "ExplodeHPFill", 0.25, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_AmbientSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_MetalExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlayAmbientSound"] = false
	(c).fields["m_fMaxHP"] = float(0)
	(c).fields["m_fHPDegen"] = float(10)
	(c).fields["m_iDefaultHP"] = R.coerce(0, "int")
	(c).fields["m_fEngineHP"] = float(NAN)
	(c).fields["m_fCenterHP"] = float(NAN)
	(c).fields["m_fBackPartHP"] = float(NAN)
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_vZombieSpawnLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_bWaitForPlayerToExplode"] = false
	(c).fields["m_bCanExplode"] = true
	(c).fields["m_EnginePartClass"] = R.coerce(null, "Class")
	(c).fields["m_CenterPartClass"] = R.coerce(null, "Class")
	(c).fields["m_BackPartClass"] = R.coerce(null, "Class")
	(c).fields["m_fEnginePartPos"] = float(0)
	(c).fields["m_fCenterPartPos"] = float(0)
	(c).fields["m_fBackPartPos"] = float(0)
	(c).fields["m_EngineDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	(c).fields["m_CenterDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	(c).fields["m_BackDamagePoint"] = R.coerce(null, "RDCarDamagePoint")
	(c).fields["m_ExplosionClass"] = R.coerce(null, "Class")
	(c).fields["m_ExplosionMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_bWithHiddenSoldierLeft"] = false
	(c).fields["m_bWithHiddenSoldierRight"] = false
	(c).fields["m_LeftHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
	(c).fields["m_RightHiddenSoldierIcon"] = R.coerce(null, "MovieClip")
	(c).fields["m_bShowEditorRandomIcon"] = true
	(c).fields["m_RandomIcon"] = R.coerce(null, "MovieClip")
	(c).fields["m_iLastDamageTime"] = R.coerce(0, "int")
	return null
