extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEndChopper(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDEndChopper"), [R.klass("MC_EndChopper"), R.static_value("RDEntity", "Layer_Dynamic"), R.static_value("RDEndChopper", "Scale")])
	(c).fields["m_bWarnPlayer"] = true
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass"), "int")
	(c).fields["m_bSpawnCollision"] = true
	(c).fields["m_ChopperSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_HelicopterLoop"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_bSpawnCollision"] = true
	(c).fields["m_bPlaySound"] = true
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_storyMode: Variant = null
	var v_collision: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_storyMode = R.coerce(null, "RDGameModeStory")
	v_collision = R.coerce(null, "RDEndChopperCollision")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "Update"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bEditorMode")):
		pass
		return null
	if R.truth((c).fields.get("m_bPlaySound")):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ChopperSound"), true])
		(c).fields["m_bPlaySound"] = false
	if R.truth(((c).fields.get("m_bWarnPlayer") and (float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDEndChopper", "WarnDistance")))) > float((c.fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		v_storyMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeStory")), "RDGameModeStory")
		if R.truth(v_storyMode):
			pass
			R.call_member(v_storyMode, "OnSeeEndChopper", [])
		(c).fields["m_bWarnPlayer"] = false
	if R.truth(((c).fields.get("m_bSpawnCollision") and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_collision = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDEndChopperCollision")]), R.klass("RDEndChopperCollision")), "RDEndChopperCollision")
		R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_collision, R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")]), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")]), (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(10))])
		(c).fields["m_bSpawnCollision"] = false
	return null

static func f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	if R.truth(R.get_value(c.fields.get("m_MC"), "BulletCollision")):
		pass
		return R.get_value(c.fields.get("m_MC"), "BulletCollision")
	return R.invoke(R.get_value(R.super_ref(c, "RDEndChopper"), "GetBulletHitMC"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 7, "=")
	R.set_value(c, "WarnDistance", 100, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_bSpawnCollision"] = false
	(c).fields["m_ChopperSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlaySound"] = true
	return null
