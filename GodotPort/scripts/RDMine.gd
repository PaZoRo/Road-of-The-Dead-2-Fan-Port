extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDMine(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDMine"), [R.klass("MC_mine"), R.static_value("RDMine", "Scale")])
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_Mines"), "int")
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_FenceHit"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	(c).fields["m_BeepSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_MineBeep"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsFarQuiet")]), "DTSpacialSound")
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
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "SetInitialState"), [])
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", false, "=")
	c.fields["m_fHP"] = float(1)
	(c).fields["m_fBeepTimer"] = float(0)
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDistance: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fDistance = float(NAN)
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "Update"), [v_fDeltaTime])
	if R.truth(((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) > float(0))) and R.unary("!", c.fields.get("m_bEditorMode")))):
		pass
		v_fDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))]), "Number")
		(c).fields["m_fBeepDelay"] = R.coerce(R.call_static("Maths", "Clamp", [(float(0.1) + float(R.binary("/", (float(v_fDistance) * float(0.9)), 50))), 0, 1]), "Number")
		(c).fields["m_fBeepTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fBeepTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fBeepTimer")) >= float((c).fields.get("m_fBeepDelay")))):
			pass
			(c).fields["m_fBeepTimer"] = float(0)
			R.set_value(R.get_value(c.fields.get("m_MC"), "Light"), "visible", true, "=")
			R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "Light"), "gotoAndPlay"), [1])
			if R.truth(((float((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) - float(R.static_value("RDMine", "m_iBeepTick")))) > float(5)) or (float(v_fDistance) < float(R.static_value("RDMine", "m_fBeepDistance"))))):
				pass
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_BeepSound")])
				R.assign(c, "m_iBeepTick", "RDMine", (R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "=")
				R.assign(c, "m_fBeepDistance", "RDMine", v_fDistance, "=")
	return null

static func f_OnExplodeFromBulletHit(c: Variant, a: Array) -> Variant:
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((R.binary("==", v_instigator, (c).fields.get("m_Player")) and R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor")))):
		pass
		R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iMinesShot", 1, "+=")
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return ((R.unary("!", c.fields.get("m_bHit")) and (float(c.fields.get("m_fHP")) != float(0))) and (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Missile")))) or (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Humanoid")))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDMine"), "TouchedBy"), [v_entity])
	R.call_member(c, "Explode", [v_entity])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3.5, "=")
	R.set_value(c, "m_iBeepTick", 0, "=")
	R.set_value(c, "m_fBeepDistance", 99999999, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_fBeepTimer"] = float(0)
	(c).fields["m_fBeepDelay"] = float(NAN)
	(c).fields["m_BeepSound"] = R.coerce(null, "DTSpacialSound")
	return null
