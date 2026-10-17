extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDHighwayRamp(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDHighwayRamp"), [null, R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDHighwayRamp", "Scale")])
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactConcrete")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.25)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.5)
	(c).fields["m_bWarnPlayer"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = true
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_bWithCollision: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	R.call_member(c, "InitMCs", [v_mcClass])
	(c).fields["m_bSpawnCollision"] = v_bWithCollision
	c.fields["m_bCanBeHitByBullet"] = R.binary("!=", v_mcClass, R.klass("MovieClip"))
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_gameplayMode: Variant = null
	var v_collision: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_collision = R.coerce(null, "RDHighwayRampCollision")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDHighwayRamp", "WarnDistance")))) > float((c.fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
		if R.truth(v_gameplayMode):
			pass
			R.call_member(v_gameplayMode, "OnSeeRamp", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth((c).fields.get("m_bSpawnCollision")):
		pass
		v_collision = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHighwayRampCollision")]), R.klass("RDHighwayRampCollision")), "RDHighwayRampCollision")
		R.call_member(v_collision, "Init", [c])
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_collision, R.call_static("RDWorld", "GetPerlinX", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))]), R.call_static("RDWorld", "GetPerlinY", [(float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))]), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))])
		(c).fields["m_bSpawnCollision"] = false
	return null

static func f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")):
		pass
		return R.get_value(c.fields.get("m_MC"), "BulletCollision")
	return R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "GetBulletHitMC"), [])
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "OnAddedToWorld"), [])
	R.assign(c, "m_bRampPresent", "RDHighwayRamp", true, "=")
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_bRampPresent", "RDHighwayRamp", false, "=")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "Destroy"), [])
	return null

static func f_InitProperties(c: Variant, a: Array) -> Variant:
	R.call_member(c, "AddProperty", ["Going Left", R.static_value("RDProperty", "Type_Boolean"), false])
	return null

static func f_SetProperty(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	R.invoke(R.get_value(R.super_ref(c, "RDHighwayRamp"), "SetProperty"), [v_szName, v_value])
	if R.truth(R.binary("==", v_szName, "Going Left")):
		pass
		c.fields["m_bFlippedX"] = R.binary("as", v_value, R.klass("Boolean"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_bRampPresent", false, "=")
	R.set_value(c, "Scale", 8, "=")
	R.set_value(c, "WarnDistance", 100, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_bSpawnCollision"] = false
	return null
