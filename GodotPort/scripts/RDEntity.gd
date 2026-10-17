extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEntity(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mcClass": "Class", "fScale": "Number"}
	l["mcClass"] = R.coerce((a[0] if a.size() > 0 else null), "Class")
	l["fScale"] = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	R.invoke(R.super_ref(c, "RDEntity"), [])
	(c).fields["m_iEntityIndex"] = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	(c).fields["m_fScale"] = float(R.lget(l, "fScale"))
	(c).fields["m_ConstructorMCClass"] = R.coerce(R.lget(l, "mcClass"), "Class")
	if R.truth((c).fields.get("m_ConstructorMCClass")):
		pass
		R.call_member(c, "InitMCs", [(c).fields.get("m_ConstructorMCClass")])
	(c).fields["m_CollisionBounds"] = R.coerce(R.construct(R.klass("Box"), []), "Box")
	(c).fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	(c).fields["m_vLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vVelocity"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Dynamic"), "int")
	(c).fields["m_fBackSoundDistanceMultiplier"] = float(2)
	(c).fields["m_fMinRenderScale"] = float(0)
	(c).fields["m_fFadeDistance"] = float(100)
	(c).fields["m_fFadeRange"] = float(50)
	(c).fields["m_fHitDamage"] = float(0)
	(c).fields["m_fMinHitHP"] = float(0)
	(c).fields["m_fHitSpeedLoss"] = float(0)
	(c).fields["m_fHitShakeIntensity"] = float(0.015)
	(c).fields["m_fHitShakeDuration"] = float(0.3)
	(c).fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_None"), "int")
	(c).fields["m_fBulletHitEffectScaleMin"] = float(0.5)
	(c).fields["m_fBulletHitEffectScaleMax"] = float(1)
	(c).fields["m_fMaxBulletHitEffectRotation"] = float(0)
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.static_value("RDEntity", "m_FleshBulletHitSounds")
	R.invoke(R.get_value(R.static_value("RDEntity", "m_FleshBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitFlesh01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_FleshBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitFlesh02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_FleshBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitFlesh03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.static_value("RDEntity", "m_ArmorBulletHitSounds")
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ArmorBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitRubber01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ArmorBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitRubber02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ArmorBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitRubber03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ArmorBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitRubber04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds")
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_WoodBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitWood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_WoodBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitWood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_WoodBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitWood01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_ConcreteBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.static_value("RDEntity", "m_MetalBulletHitSounds")
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_MetalBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHit07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.assign(c, "m_WeakBulletHitSounds", "RDEntity", R.static_value("RDEntity", "m_ArmorBulletHitSounds"), "=")
	R.static_value("RDEntity", "m_VegetationBulletHitSounds")
	R.invoke(R.get_value(R.static_value("RDEntity", "m_VegetationBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitVegetation01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_VegetationBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitVegetation02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_VegetationBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitVegetation03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_VegetationBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitVegetation04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value(R.static_value("RDEntity", "m_VegetationBulletHitSounds"), "push"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_BulletHitVegetation05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	(c).fields["m_iEntityIndex"] = R.coerce(R.binary("-", R.assign(c, "GEntityIndex", "RDEntity", 1, "+="), 1), "int")
	if R.truth((c).fields.get("m_ConstructorMCClass")):
		pass
		R.call_member(c, "InitMCs", [(c).fields.get("m_ConstructorMCClass")])
	(c).fields["m_Properties"] = R.coerce(null, "Array")
	(c).fields["m_PropertiesHash"] = R.coerce(null, "Array")
	(c).fields["m_bEditorMode"] = false
	(c).fields["m_szAnim"] = R.coerce("", "String")
	R.call_member((c).fields.get("m_vLocation"), "SetZero", [])
	R.call_member((c).fields.get("m_vVelocity"), "SetZero", [])
	(c).fields["m_bDestroyMe"] = false
	(c).fields["m_bFlippedX"] = false
	(c).fields["m_bLocationUsed"] = false
	R.call_member((c).fields.get("m_vMoveDir"), "SetZero", [])
	if R.truth(R.unary("!", (c).fields.get("m_bHasCustomDepthPosition"))):
		pass
		(c).fields["m_fDepthPosition"] = float(9999999999)
	(c).fields["m_iLastFinalNodeStep"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iLastTestStep"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iLastStartStep"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_bUseCurvyCamera"] = true
	(c).fields["m_bUnlockSurvivalGuide"] = true
	return null

static func f_InitMCs(c: Variant, a: Array) -> Variant:
	var v_mcBounds: Variant = null
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	(c).fields["m_MC"] = R.coerce(R.call_static("RDGame", "GetMC", [v_mcClass]), "MovieClip")
	R.set_value((c).fields.get("m_MC"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_MC"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_MC"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_MC"), "enabled", false, "=")
	(c).fields["m_MainMC"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MovieClip")]), "MovieClip")
	R.set_value((c).fields.get("m_MainMC"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_MainMC"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_MainMC"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_MainMC"), "enabled", false, "=")
	R.invoke(R.get_value((c).fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_MC")])
	(c).fields["m_EffectMC"] = R.coerce(R.call_static("RDGame", "GetMC", [R.klass("MovieClip")]), "MovieClip")
	R.set_value((c).fields.get("m_EffectMC"), "m_owner", c, "=")
	R.set_value((c).fields.get("m_EffectMC"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_EffectMC"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_EffectMC"), "enabled", false, "=")
	R.invoke(R.get_value((c).fields.get("m_MainMC"), "addChild"), [(c).fields.get("m_EffectMC")])
	v_mcBounds = R.coerce(R.invoke(R.get_value((c).fields.get("m_MC"), "getBounds"), [(c).fields.get("m_MC")]), "Rectangle")
	(c).fields["m_Bounds"] = R.coerce(R.construct(R.klass("Box"), []), "Box")
	R.call_member((c).fields.get("m_Bounds"), "Set", [(R.num(R.get_value(v_mcBounds, "left")) * float((c).fields.get("m_fScale"))), (R.num(R.unary("-", R.get_value(v_mcBounds, "bottom"))) * float((c).fields.get("m_fScale"))), 0, (R.num(R.get_value(v_mcBounds, "width")) * float((c).fields.get("m_fScale"))), (R.num(R.get_value(v_mcBounds, "height")) * float((c).fields.get("m_fScale"))), 0])
	(c).fields["m_fHeight"] = float((R.num(R.unary("-", R.get_value(v_mcBounds, "top"))) * float((c).fields.get("m_fScale"))))
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_currentEntity: Variant = null
	var v_iNbEntities: Variant = 0
	v_i = R.coerce(0, "int")
	v_currentEntity = R.coerce(null, "RDEntity")
	R.call_member(c, "StopAnimations", [])
	R.call_member(c, "StopAllSoundsOnActor", [])
	if R.truth((c).fields.get("m_Base")):
		pass
		R.call_member((c).fields.get("m_Base"), "DetachEntity", [c])
		(c).fields["m_Base"] = R.coerce(null, "RDEntity")
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_AttachedEntities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_currentEntity = R.coerce(R.invoke(R.klass("RDEntity"), [R.get_value((c).fields.get("m_AttachedEntities"), v_i)]), "RDEntity")
		(v_currentEntity).fields["m_Base"] = R.coerce(null, "RDEntity")
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_AttachedEntities"), "splice"), [0])
	R.call_member(c, "DispatchEvent", [R.static_value("RDEntity", "Event_Destroyed")])
	if R.truth(R.unary("!", (c).fields.get("m_bDoNotDestroy"))):
		pass
		(c).fields["m_EntityNode"] = R.coerce(null, "RDEntityNode")
		R.call_static("RDGame", "ReturnEntity", [c])
	(c).fields["m_ContainerMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_World"] = R.coerce(null, "RDWorld")
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	(c).fields["m_szAnim"] = R.coerce("", "String")
	(c).fields["m_iLastFinalNodeStep"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iLastTestStep"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iLastStartStep"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((((R.binary("!=", (c).fields.get("m_iSurvivalGuideItem"), R.unary("-", 1)) and (c).fields.get("m_bUnlockSurvivalGuide")) and (float((c).fields.get("m_fSurvivalGuideDistance")) > float(0))) and R.unary("!", (c).fields.get("m_bEditorMode")))):
		pass
		if R.truth(((float(((c).fields.get("m_vLocation")).fields.get("Z")) > float(((((((c).fields.get("m_World")).fields.get("m_Game")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))) and (float((float(((c).fields.get("m_vLocation")).fields.get("Z")) - float(((((((c).fields.get("m_World")).fields.get("m_Game")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))) <= float((c).fields.get("m_fSurvivalGuideDistance"))))):
			pass
			R.call_member(((c).fields.get("m_World")).fields.get("m_Game"), "UnlockSurvivalItem", [(c).fields.get("m_iSurvivalGuideItem")])
			(c).fields["m_bUnlockSurvivalGuide"] = false
	R.call_member(c, "UpdateMovement", [v_fDeltaTime])
	R.call_member(c, "UpdateAnimation", [])
	R.call_member(c, "UpdateAttachedSounds", [])
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	pass
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	var v_fScale: Variant = NAN
	var v_fFadeDistance: Variant = NAN
	var v_fFadeRange: Variant = NAN
	var v_fFadeRatio: Variant = NAN
	var v_fTransformedZ: Variant = NAN
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_fScale = float(NAN)
	v_fFadeDistance = float(NAN)
	v_fFadeRange = float(NAN)
	v_fFadeRatio = float(NAN)
	v_fTransformedZ = float((float(((c).fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))))
	if R.truth(((((float(v_fTransformedZ) > float((v_camera).fields.get("m_fMaxViewDistance"))) or (float(v_fTransformedZ) > float((float((c).fields.get("m_fFadeDistance")) + float((c).fields.get("m_fFadeRange")))))) or ((c).fields.get("m_bIsPlayer") and (float(v_fTransformedZ) < float(1)))) or (R.unary("!", (c).fields.get("m_bIsPlayer")) and (float(v_fTransformedZ) <= float(1))))):
		pass
		R.set_value((c).fields.get("m_MainMC"), "visible", false, "=")
	else:
		pass
		R.set_value((c).fields.get("m_MainMC"), "visible", true, "=")
		R.call_member(v_camera, "Project3DTo2D", [(c).fields.get("m_vLocation"), (c).fields.get("m_vProjLocation"), (c).fields.get("m_bUseCurvyCamera")])
		((c).fields.get("m_vTopLocation")).fields["X"] = float(((c).fields.get("m_vLocation")).fields.get("X"))
		((c).fields.get("m_vTopLocation")).fields["Y"] = float((float(((c).fields.get("m_vLocation")).fields.get("Y")) + float((c).fields.get("m_fHeight"))))
		((c).fields.get("m_vTopLocation")).fields["Z"] = float(((c).fields.get("m_vLocation")).fields.get("Z"))
		R.call_member(v_camera, "Project3DTo2D", [(c).fields.get("m_vTopLocation"), (c).fields.get("m_vProjTopLocation"), (c).fields.get("m_bUseCurvyCamera")])
		v_fScale = float(R.binary("/", (float((c).fields.get("m_fScale")) * R.num(R.unary("-", (float(((c).fields.get("m_vProjTopLocation")).fields.get("Y")) - float(((c).fields.get("m_vProjLocation")).fields.get("Y")))))), (c).fields.get("m_fHeight")))
		v_fScale = float((float((c).fields.get("m_fMinRenderScale")) + float((float((float(v_fScale) * float((v_camera).fields.get("m_fRenderScale")))) * float((float(1) - float((c).fields.get("m_fMinRenderScale"))))))))
		R.set_value((c).fields.get("m_MainMC"), "x", ((c).fields.get("m_vProjLocation")).fields.get("X"), "=")
		R.set_value((c).fields.get("m_MainMC"), "y", ((c).fields.get("m_vProjLocation")).fields.get("Y"), "=")
		R.set_value((c).fields.get("m_MainMC"), "scaleX", (float(v_fScale) * R.num((R.unary("-", 1) if R.truth((c).fields.get("m_bFlippedX")) else 1))), "=")
		R.set_value((c).fields.get("m_MainMC"), "scaleY", v_fScale, "=")
		v_fFadeDistance = float(minf(float((float((v_camera).fields.get("m_fFogDistance")) - float((v_camera).fields.get("m_fFogRange")))), float((c).fields.get("m_fFadeDistance"))))
		v_fFadeRange = float(minf(float((v_camera).fields.get("m_fFogRange")), float((c).fields.get("m_fFadeRange"))))
		v_fFadeRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float(v_fTransformedZ) - float(v_fFadeDistance)), v_fFadeRange), 0, 1]), "Number")
		R.set_value((c).fields.get("m_MainMC"), "alpha", (float(1) - float(v_fFadeRatio)), "=")
	return null

static func f_PlayAnim(c: Variant, a: Array) -> Variant:
	var v_szAnim: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_bForce: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iFrame: Variant = R.coerce((a[2] if a.size() > 2 else R.unary("-", 1)), "int")
	if R.truth((R.binary("!=", v_szAnim, (c).fields.get("m_szAnim")) or v_bForce)):
		pass
		(c).fields["m_szAnim"] = R.coerce(v_szAnim, "String")
		R.invoke(R.get_value((c).fields.get("m_MC"), "gotoAndPlay"), [(v_iFrame if R.truth(R.binary("!=", v_iFrame, R.unary("-", 1))) else v_szAnim)])
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, R.static_value("RDEntity", "AnimEvent_Destroy"))):
		pass
		(c).fields["m_bDestroyMe"] = true
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "AnimEnded")):
			pass
			R.call_member(c, "OnEndAnim", [])
	return null

static func f_OnEndAnim(c: Variant, a: Array) -> Variant:
	R.call_member(c, "UpdateAnimation", [true])
	return null

static func f_UpdateAnimation(c: Variant, a: Array) -> Variant:
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	pass
	return null

static func f_GetTransitionFrame(c: Variant, a: Array) -> Variant:
	var v_szOldAnim: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szNewAnim: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	return R.unary("-", 1)
	return null

static func f_StopAnimations(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_MC")):
		pass
		R.invoke(R.get_value((c).fields.get("m_MC"), "stop"), [])
		if R.truth(R.unary("!", (c).fields.get("m_bDoNotDestroy"))):
			pass
			R.set_value((c).fields.get("m_MC"), "m_owner", R.static_value("RDGame", "DummyOwner"), "=")
			R.set_value((c).fields.get("m_MainMC"), "m_owner", R.static_value("RDGame", "DummyOwner"), "=")
			R.set_value((c).fields.get("m_EffectMC"), "m_owner", R.static_value("RDGame", "DummyOwner"), "=")
			R.invoke(R.get_value((c).fields.get("m_MainMC"), "removeChild"), [(c).fields.get("m_MC")])
			R.invoke(R.get_value((c).fields.get("m_MainMC"), "removeChild"), [(c).fields.get("m_EffectMC")])
			R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_MC")])
			R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_MainMC")])
			R.call_static("RDGame", "ReturnMC", [(c).fields.get("m_EffectMC")])
	return null

static func f_PlayAnimationSound(c: Variant, a: Array) -> Variant:
	var v_szSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	pass
	return null

static func f_CreateEntitySpacialSound(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_soundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_soundParams: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTSpacialSoundParams")
	var v_bHandlePitch: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	v_sound = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [v_soundClass, v_soundGroup, v_soundParams, v_bHandlePitch]), "DTSpacialSound")
	R.invoke(R.get_value((c).fields.get("m_EntitySounds"), "push"), [v_sound])
	return v_sound
	return null

static func f_DestroyEntitySpacialSounds(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	v_sound = R.coerce(null, "DTSpacialSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value((c).fields.get("m_EntitySounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_sound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_EntitySounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(v_sound, "Destroy", [])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_EntitySounds"), "splice"), [0])
	return null

static func f_DestroyEntitySpacialSound(c: Variant, a: Array) -> Variant:
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	var v_sound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value((c).fields.get("m_EntitySounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		if R.truth(R.binary("==", v_sound, R.get_value((c).fields.get("m_EntitySounds"), v_i))):
			pass
			R.call_member(v_sound, "Destroy", [])
			R.invoke(R.get_value((c).fields.get("m_EntitySounds"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_HasSoundPlaying(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	v_sound = R.coerce(null, "DTSpacialSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value((c).fields.get("m_AttachedSounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_sound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AttachedSounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
		if R.truth(R.call_member(v_sound, "IsPlaying", [])):
			pass
			return true
		v_i = R.signed32(v_i + 1)
	return false
	return null

static func f_AttachSound(c: Variant, a: Array) -> Variant:
	var v_spacialSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	if R.truth((v_spacialSound).fields.get("m_bAttached")):
		pass
		return null
	R.invoke(R.get_value((c).fields.get("m_AttachedSounds"), "push"), [v_spacialSound])
	(v_spacialSound).fields["m_bAttached"] = true
	return null

static func f_DetachSound(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_i: Variant = 0
	var v_spacialSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	v_sound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (v_spacialSound).fields.get("m_bAttached"))):
		pass
		return null
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AttachedSounds"), "length"))):
		pass
		v_sound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AttachedSounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
		if R.truth(R.binary("==", v_sound, v_spacialSound)):
			pass
			R.invoke(R.get_value((c).fields.get("m_AttachedSounds"), "splice"), [v_i, 1])
			(v_spacialSound).fields["m_bAttached"] = false
			return null
		v_i = R.signed32(v_i + 1)
	return null

static func f_PlaySoundOnActor(c: Variant, a: Array) -> Variant:
	var v_theSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	var v_bLooped: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_fOffset: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	if R.truth(R.unary("!", (v_theSound).fields.get("m_Sound"))):
		pass
		return null
	R.call_member(v_theSound, "Play", [v_bLooped, 0, v_fOffset])
	R.call_member(c, "AttachSound", [v_theSound])
	R.call_member(c, "UpdateAttachedSounds", [])
	return null

static func f_StopSoundOnActor(c: Variant, a: Array) -> Variant:
	var v_theSound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	R.call_member(v_theSound, "Stop", [])
	R.call_member(c, "DetachSound", [v_theSound])
	return null

static func f_StopAllSoundsOnActor(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	v_sound = R.coerce(null, "DTSpacialSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value((c).fields.get("m_AttachedSounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_sound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AttachedSounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(v_sound, "Stop", [])
		(v_sound).fields["m_bAttached"] = false
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_AttachedSounds"), "splice"), [0])
	return null

static func f_UpdateAttachedSounds(c: Variant, a: Array) -> Variant:
	var v_i: Variant = null
	var v_sound: Variant = null
	var v_vListenerLocation: Variant = null
	var v_fPosX: Variant = NAN
	var v_fListenerPosX: Variant = NAN
	var v_fDistance: Variant = NAN
	var v_iSoundDirection: Variant = 0
	var v_fSideDistance: Variant = NAN
	var v_theSound: Variant = null
	var v_fVolume: Variant = NAN
	var v_fPan: Variant = NAN
	var v_iNbSounds: Variant = null
	v_i = R.coerce(0, "*")
	v_sound = R.coerce(null, "DTSpacialSound")
	v_vListenerLocation = R.coerce(null, "DTVector3D")
	v_fPosX = float(NAN)
	v_fListenerPosX = float(NAN)
	v_fDistance = float(NAN)
	v_iSoundDirection = R.coerce(0, "int")
	v_fSideDistance = float(NAN)
	v_theSound = R.coerce(null, "DTSpacialSound")
	v_fVolume = float(NAN)
	v_fPan = float(NAN)
	v_iNbSounds = R.coerce(R.coerce(R.get_value((c).fields.get("m_AttachedSounds"), "length"), "int"), "*")
	if R.truth(R.binary("==", v_iNbSounds, 0)):
		pass
		return null
	v_i = R.coerce(0, "*")
	while R.truth(R.binary("<", v_i, v_iNbSounds)):
		pass
		v_sound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AttachedSounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
		if R.truth(R.unary("!", (v_sound).fields.get("m_SoundChannel"))):
			pass
			R.invoke(R.get_value((c).fields.get("m_AttachedSounds"), "splice"), [v_i, 1])
			(v_sound).fields["m_bAttached"] = false
			v_i = R.coerce(R.num(v_i) - 1, "*")
			v_iNbSounds = R.coerce(R.num(v_iNbSounds) - 1, "*")
		v_i = R.coerce(R.num(v_i) + 1, "*")
	if R.truth(R.binary(">", v_iNbSounds, 0)):
		pass
		v_vListenerLocation = R.coerce((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation"), "DTVector3D")
		v_fPosX = float((float(((c).fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vLocation")).fields.get("Z")]))))
		v_fListenerPosX = float((float((v_vListenerLocation).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [(v_vListenerLocation).fields.get("Z")]))))
		v_fDistance = float((float(((c).fields.get("m_vLocation")).fields.get("Z")) - float((v_vListenerLocation).fields.get("Z"))))
		if R.truth((float(v_fDistance) < float(0))):
			pass
			v_fDistance = float((R.num(R.unary("-", v_fDistance)) * float((c).fields.get("m_fBackSoundDistanceMultiplier"))))
		v_iSoundDirection = R.coerce((1 if R.truth((float(v_fPosX) >= float(v_fListenerPosX))) else R.unary("-", 1)), "int")
		v_fSideDistance = R.coerce(R.call_static("Maths", "AbsNumber", [(float(v_fPosX) - float(v_fListenerPosX))]), "Number")
		v_i = R.coerce(0, "*")
		while R.truth(R.binary("<", v_i, v_iNbSounds)):
			pass
			v_theSound = R.coerce(R.binary("as", R.get_value((c).fields.get("m_AttachedSounds"), v_i), R.klass("DTSpacialSound")), "DTSpacialSound")
			v_fPan = float((v_theSound).fields.get("m_fPan"))
			if R.truth((float(v_fDistance) < float((v_theSound).fields.get("m_fVolumeFallOffDistance")))):
				pass
				v_fVolume = float((v_theSound).fields.get("m_fMaxVolume"))
			else:
				pass
				if R.truth((float(v_fDistance) > float((v_theSound).fields.get("m_fVolumeMaxDistance")))):
					pass
					v_fVolume = float(0)
				else:
					pass
					v_fVolume = float((float((v_theSound).fields.get("m_fMaxVolume")) - float((float((v_theSound).fields.get("m_fMaxVolume")) * float(R.binary("/", (float(v_fDistance) - float((v_theSound).fields.get("m_fVolumeFallOffDistance"))), (float((v_theSound).fields.get("m_fVolumeMaxDistance")) - float((v_theSound).fields.get("m_fVolumeFallOffDistance")))))))))
			if R.truth(R.unary("!", (v_theSound).fields.get("m_bManualPan"))):
				pass
				if R.truth((float(v_fSideDistance) < float((v_theSound).fields.get("m_fPanFallOffDistance")))):
					pass
					v_fPan = float(0)
				else:
					pass
					if R.truth((float(v_fSideDistance) > float((v_theSound).fields.get("m_fPanMaxDistance")))):
						pass
						v_fPan = float(v_iSoundDirection)
					else:
						pass
						v_fPan = float(R.binary("/", (float(v_iSoundDirection) * float((float(v_fSideDistance) - float((v_theSound).fields.get("m_fPanFallOffDistance"))))), (float((v_theSound).fields.get("m_fPanMaxDistance")) - float((v_theSound).fields.get("m_fPanFallOffDistance")))))
			R.call_member(v_theSound, "SetVolumeAndPan", [v_fVolume, v_fPan])
			v_i = R.coerce(R.num(v_i) + 1, "*")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float(((c).fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 5))
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	pass
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return false
	return null

static func f_Touched(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	pass
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	pass
	return null

static func f_AttachEntity(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_AttachedEntities"), "push"), [v_entity])
	(v_entity).fields["m_Base"] = R.coerce(c, "RDEntity")
	return null

static func f_DetachEntity(c: Variant, a: Array) -> Variant:
	var v_currentEntity: Variant = null
	var v_iNbEntities: Variant = 0
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_currentEntity = R.coerce(null, "RDEntity")
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_AttachedEntities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_currentEntity = R.coerce(R.invoke(R.klass("RDEntity"), [R.get_value((c).fields.get("m_AttachedEntities"), v_i)]), "RDEntity")
		if R.truth(R.binary("==", v_currentEntity, v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_AttachedEntities"), "splice"), [v_i, 1])
			(v_entity).fields["m_Base"] = R.coerce(null, "RDEntity")
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	pass
	return null

static func f_OnBulletHit(c: Variant, a: Array) -> Variant:
	var v_effectClass: Variant = null
	var v_hitEffect: Variant = null
	var v_fScale: Variant = NAN
	var v_bulletEffectContainer: Variant = null
	var v_effectClasses: Variant = null
	var v_bulletHitSounds: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_hitPos: Variant = R.coerce((a[2] if a.size() > 2 else null), "Point")
	v_effectClass = R.coerce(null, "Class")
	v_hitEffect = R.coerce(null, "MovieClip")
	v_fScale = float(NAN)
	v_bulletEffectContainer = R.coerce(null, "MovieClip")
	v_effectClasses = R.coerce(R.call_member(c, "GetBulletHitEffects", []), "Array")
	if R.truth(v_effectClasses):
		pass
		R.set_value((c).fields.get("m_BulletHitPos"), "x", R.get_value(v_hitPos, "x"), "=")
		R.set_value((c).fields.get("m_BulletHitPos"), "y", R.get_value(v_hitPos, "y"), "=")
		(c).fields["m_BulletHitPos"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_MC"), "globalToLocal"), [(c).fields.get("m_BulletHitPos")]), "Point")
		v_effectClass = R.coerce(R.get_value(v_effectClasses, R.call_static("Maths", "RandomInt", [R.get_value(v_effectClasses, "length")])), "Class")
		v_hitEffect = R.coerce(R.call_static("RDGame", "GetMC", [v_effectClass]), "MovieClip")
		R.set_value(v_hitEffect, "m_owner", c, "=")
		R.set_value(v_hitEffect, "x", R.get_value((c).fields.get("m_BulletHitPos"), "x"), "=")
		R.set_value(v_hitEffect, "y", R.get_value((c).fields.get("m_BulletHitPos"), "y"), "=")
		R.set_value(v_hitEffect, "rotation", R.binary("+", R.unary("-", (c).fields.get("m_fMaxBulletHitEffectRotation")), (float((float(randf()) * float(2))) * float((c).fields.get("m_fMaxBulletHitEffectRotation")))), "=")
		v_fScale = float((float((c).fields.get("m_fBulletHitEffectScaleMin")) + float((float(randf()) * float((float((c).fields.get("m_fBulletHitEffectScaleMax")) - float((c).fields.get("m_fBulletHitEffectScaleMin"))))))))
		R.set_value(v_hitEffect, "scaleX", v_fScale, "=")
		R.set_value(v_hitEffect, "scaleY", v_fScale, "=")
		v_bulletEffectContainer = R.coerce(R.call_member(c, "GetBulletHitEffectContainer", []), "MovieClip")
		R.invoke(R.get_value(v_hitEffect, "play"), [])
		R.invoke(R.get_value(v_bulletEffectContainer, "addChild"), [v_hitEffect])
		((c).fields.get("m_vBulletHitWorldPos")).fields["X"] = float((float(((c).fields.get("m_vLocation")).fields.get("X")) + float((float(R.binary("/", (R.num(R.get_value((c).fields.get("m_BulletHitPos"), "x")) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), (c).fields.get("m_fScale"))) * R.num((R.unary("-", 1) if R.truth((c).fields.get("m_bFlippedX")) else 1))))))
		((c).fields.get("m_vBulletHitWorldPos")).fields["Y"] = float((float(((c).fields.get("m_vLocation")).fields.get("Y")) + float(R.binary("/", (R.num(R.unary("-", R.get_value((c).fields.get("m_BulletHitPos"), "y"))) * float(R.static_value("RDEntity", "GlobalMCWidthToWorldWidthFactor"))), (c).fields.get("m_fScale")))))
		((c).fields.get("m_vBulletHitWorldPos")).fields["Z"] = float(((c).fields.get("m_vLocation")).fields.get("Z"))
		R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "SuppressSoldiers", [(c).fields.get("m_vBulletHitWorldPos")])
	v_bulletHitSounds = R.coerce(R.call_member(c, "GetBulletHitSounds", []), "Array")
	if R.truth(v_bulletHitSounds):
		pass
		R.call_member(c, "PlaySoundOnActor", [R.get_value(v_bulletHitSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_bulletHitSounds, "length")]))])
	if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", (c).fields.get("m_iPropertyValue"), R.binary("+", R.unary("-", 2), R.call_static("Maths", "RandomInt", [5])))), "int")
	return null

static func f_OnSoldierBulletHit(c: Variant, a: Array) -> Variant:
	var v_bulletHitSounds: Variant = null
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_bulletHitSounds = R.coerce(R.call_member(c, "GetBulletHitSounds", []), "Array")
	if R.truth(v_bulletHitSounds):
		pass
		R.call_member(c, "PlaySoundOnActor", [R.get_value(v_bulletHitSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_bulletHitSounds, "length")]))])
	return null

static func f_GetBulletHitMC(c: Variant, a: Array) -> Variant:
	return (R.get_value((c).fields.get("m_MC"), "BulletCollision") if R.truth(R.get_value((c).fields.get("m_MC"), "BulletCollision")) else (c).fields.get("m_MC"))
	return null

static func f_GetSecondaryBulletHitMC(c: Variant, a: Array) -> Variant:
	return null
	return null

static func f_GetBulletHitEffects(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_BulletHitEffects")
	return null

static func f_GetBulletHitSounds(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Flesh")))):
		pass
		return R.static_value("RDEntity", "m_FleshBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Armor")))):
		pass
		return R.static_value("RDEntity", "m_ArmorBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_MetalAndGlass")))):
		pass
		return R.static_value("RDEntity", "m_MetalAndGlassBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Wood")))):
		pass
		return R.static_value("RDEntity", "m_WoodBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete")))):
		pass
		return R.static_value("RDEntity", "m_ConcreteBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal")))):
		pass
		return R.static_value("RDEntity", "m_MetalBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Weak")))):
		pass
		return R.static_value("RDEntity", "m_WeakBulletHitSounds")
	if R.truth((float((c).fields.get("m_iBulletHitSoundMaterial")) == float(R.static_value("RDEntity", "BulletHitSoundMaterial_Vegetation")))):
		pass
		return R.static_value("RDEntity", "m_VegetationBulletHitSounds")
	return null
	return null

static func f_GetBulletHitSoundMaterial(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_iBulletHitSoundMaterial")
	return null

static func f_GetBulletHitEffectContainer(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_EffectMC")
	return null

static func f_CanBeHitByBullet(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bCanBeHitByBullet")
	return null

static func f_SetWorld(c: Variant, a: Array) -> Variant:
	var v_world: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDWorld")
	(c).fields["m_World"] = R.coerce(v_world, "RDWorld")
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_GetLocationName(c: Variant, a: Array) -> Variant:
	return ""
	return null

static func f_IsLocationUsed(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bLocationUsed")
	return null

static func f_SetLocationUsed(c: Variant, a: Array) -> Variant:
	(c).fields["m_bLocationUsed"] = true
	return null

static func f_GetLocationType(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_iLocationType")
	return null

static func f_DealRadialDamage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_fDistX: Variant = NAN
	var v_fDistZ: Variant = NAN
	var v_fDamageX: Variant = NAN
	var v_fDamageZ: Variant = NAN
	var v_fDamageRatio: Variant = NAN
	var v_iFinalDamage: Variant = 0
	var v_entities: Variant = null
	var v_iNbEntities: Variant = 0
	var v_i: Variant = 0
	var v_instigator: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fRangeX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fRangeZ: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_iDamage: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	v_entity = R.coerce(null, "RDEntity")
	v_fDistX = float(NAN)
	v_fDistZ = float(NAN)
	v_fDamageX = float(NAN)
	v_fDamageZ = float(NAN)
	v_fDamageRatio = float(NAN)
	v_iFinalDamage = R.coerce(0, "int")
	v_entities = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_World")).fields.get("m_Entities"), "Array")
	v_iNbEntities = R.coerce(R.coerce(R.get_value(v_entities, "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_entity = R.coerce((R.binary("as", R.get_value(v_entities, v_i), R.klass("RDEntityNode"))).fields.get("m_Entity"), "RDEntity")
		if R.truth((v_entity).fields.get("m_bCanBeHitByExplosion")):
			pass
			v_fDistX = R.coerce(R.call_static("Maths", "AbsNumber", [(float(((c).fields.get("m_vLocation")).fields.get("X")) - float(((v_entity).fields.get("m_vLocation")).fields.get("X")))]), "Number")
			v_fDistZ = R.coerce(R.call_static("Maths", "AbsNumber", [(float(((c).fields.get("m_vLocation")).fields.get("Z")) - float(((v_entity).fields.get("m_vLocation")).fields.get("Z")))]), "Number")
			if R.truth(((float(v_fDistX) <= float(v_fRangeX)) and (float(v_fDistZ) <= float(v_fRangeZ)))):
				pass
				v_fDamageX = R.coerce((1 if R.truth((float(v_fDistX) < float(R.binary("/", v_fRangeX, 2)))) else (float(1) - float(R.binary("/", (float(v_fDistX) - float(R.binary("/", v_fRangeX, 2))), R.binary("/", v_fRangeX, 2))))), "Number")
				v_fDamageZ = R.coerce((1 if R.truth((float(v_fDistZ) < float(R.binary("/", v_fRangeZ, 2)))) else (float(1) - float(R.binary("/", (float(v_fDistZ) - float(R.binary("/", v_fRangeZ, 2))), R.binary("/", v_fRangeZ, 2))))), "Number")
				v_fDamageRatio = float(R.binary("/", (float(v_fDamageX) + float(v_fDamageZ)), 2))
				v_iFinalDamage = R.coerce((float(v_iDamage) * float(v_fDamageRatio)), "int")
				R.call_member(v_entity, "TakeExplosionDamage", [c, v_instigator, v_iFinalDamage, v_iDamageType, v_fDamageRatio])
		v_i = R.signed32(v_i + 1)
	return null

static func f_CanSpawnZombie(c: Variant, a: Array) -> Variant:
	var v_bUnlimited: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth((R.unary("!", v_bUnlimited) and (float((c).fields.get("m_iSpawnCapacity")) == float(0)))):
		pass
		return false
	return true
	return null

static func f_GetZombieSpawnLocation(c: Variant, a: Array) -> Variant:
	return null
	return null

static func f_GetNavMeshStep(c: Variant, a: Array) -> Variant:
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return (float(floorf(float(R.binary("/", v_fPosZ, R.static_value("RDWorld", "NavMeshStepSize"))))) - float(floorf(float(R.binary("/", ((c).fields.get("m_World")).fields.get("m_fCameraNavMeshPos"), R.static_value("RDWorld", "NavMeshStepSize"))))))
	return null

static func f_GetNavMeshStepPos(c: Variant, a: Array) -> Variant:
	var v_iStep: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return (float((float(((c).fields.get("m_World")).fields.get("m_fCameraNavMeshPos")) + float((float(v_iStep) * float(R.static_value("RDWorld", "NavMeshStepSize")))))) - float((float(((c).fields.get("m_World")).fields.get("m_fCameraNavMeshPos")) - float(floorf(float(R.binary("/", ((c).fields.get("m_World")).fields.get("m_fCameraNavMeshPos"), R.static_value("RDWorld", "NavMeshStepSize"))))))))
	return null

static func f_GetNavMeshNode(c: Variant, a: Array) -> Variant:
	var v_fPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return floorf(float(R.binary("/", (float(v_fPosX) + float(R.static_value("RDWorld", "NavMeshOffset"))), R.static_value("RDWorld", "NavMeshNodeSize"))))
	return null

static func f_GetNavMeshNodePos(c: Variant, a: Array) -> Variant:
	var v_iNode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return (float((float(v_iNode) * float(R.static_value("RDWorld", "NavMeshNodeSize")))) - float(R.static_value("RDWorld", "NavMeshOffset")))
	return null

static func f_GetRelativeMoveToDelta(c: Variant, a: Array) -> Variant:
	var v_fLimit: Variant = NAN
	var v_iOpenNode: Variant = 0
	var v_bFoundBlockingNode: Variant = false
	var v_iCheckStepIndex: Variant = 0
	var v_iTestStep: Variant = 0
	var v_fSlope: Variant = NAN
	var v_fNewPosX: Variant = NAN
	var v_fNewSlope: Variant = NAN
	var v_bGoingForward: Variant = false
	var v_iStartStep: Variant = 0
	var v_iStartNode: Variant = 0
	var v_iEndStep: Variant = 0
	var v_iSteps: Variant = 0
	var v_gameplayMode: Variant = null
	var v_fRightLimit: Variant = NAN
	var v_fLeftLimit: Variant = NAN
	var v_fFinalSpeed: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewZ: Variant = NAN
	var v_fStartPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_vMoveTarget: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_fSpeedX: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fSpeedZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fDeltaTime: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_vDeltaOut: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTVector3D")
	v_fLimit = float(NAN)
	v_iOpenNode = R.coerce(0, "int")
	v_bFoundBlockingNode = false
	v_iCheckStepIndex = R.coerce(0, "int")
	v_iTestStep = R.coerce(0, "int")
	v_fSlope = float(NAN)
	v_fNewPosX = float(NAN)
	v_fNewSlope = float(NAN)
	v_bGoingForward = (float((v_vMoveTarget).fields.get("Z")) > float(((c).fields.get("m_vLocation")).fields.get("Z")))
	v_iStartStep = R.coerce(R.call_member(c, "GetNavMeshStep", [((c).fields.get("m_vLocation")).fields.get("Z")]), "int")
	v_iStartNode = R.coerce(R.call_member(c, "GetNavMeshNode", [v_fStartPosX]), "int")
	v_iEndStep = R.coerce(R.call_member(c, "GetNavMeshStep", [(v_vMoveTarget).fields.get("Z")]), "int")
	v_iSteps = R.coerce(R.call_static("Maths", "AbsInt", [(float(v_iStartStep) - float(v_iEndStep))]), "int")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	if R.truth(R.unary("!", (((float(v_iStartStep) <= float(0)) and (float(v_iEndStep) <= float(0))) or (float(v_iSteps) <= float(1))))):
		pass
		v_iOpenNode = R.coerce(R.unary("-", 1), "int")
		v_bFoundBlockingNode = false
		v_iCheckStepIndex = R.coerce(0, "int")
		while R.truth(((R.unary("!", v_bFoundBlockingNode) and (float(v_iCheckStepIndex) < float((c).fields.get("m_iMaxNavMeshLookup")))) and (((v_bGoingForward and (float((float(v_iStartStep) + float(v_iCheckStepIndex))) < float((float(R.static_value("RDWorld", "NavMeshSteps")) - float(1))))) and (float((float(v_iStartStep) + float(v_iCheckStepIndex))) >= float(0))) or ((R.unary("!", v_bGoingForward) and (float((float(v_iStartStep) - float(v_iCheckStepIndex))) >= float(1))) and (float((float(v_iStartStep) - float(v_iCheckStepIndex))) < float(R.static_value("RDWorld", "NavMeshSteps"))))))):
			pass
			v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadLimitAt", [R.binary("+", ((c).fields.get("m_vLocation")).fields.get("Z"), (v_iCheckStepIndex if R.truth(v_bGoingForward) else R.unary("-", v_iCheckStepIndex)))]), "Number")
			if R.truth(R.binary(">=", R.call_static("Maths", "AbsNumber", [v_fStartPosX]), v_fLimit)):
				pass
				v_bFoundBlockingNode = true
			else:
				pass
				if R.truth(R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), R.binary("+", v_iStartStep, (v_iCheckStepIndex if R.truth(v_bGoingForward) else R.unary("-", v_iCheckStepIndex)))), v_iStartNode)):
					pass
					v_bFoundBlockingNode = true
				else:
					pass
					v_iCheckStepIndex = R.signed32(v_iCheckStepIndex + 1)
		if R.truth(v_bFoundBlockingNode):
			pass
			v_iTestStep = R.coerce(R.binary("+", v_iStartStep, (v_iCheckStepIndex if R.truth(v_bGoingForward) else R.unary("-", v_iCheckStepIndex))), "int")
			if R.truth(((float(v_iTestStep) != float((c).fields.get("m_iLastTestStep"))) or (float((float(v_iStartStep) - float(((c).fields.get("m_World")).fields.get("m_iCurrentNavMeshStep")))) != float((c).fields.get("m_iLastStartStep"))))):
				pass
				(c).fields["m_iLastFinalNodeStep"] = R.coerce(R.unary("-", 1), "int")
				(c).fields["m_iLastTestStep"] = R.coerce(v_iTestStep, "int")
				(c).fields["m_iLastStartStep"] = R.coerce((float(v_iStartStep) - float(((c).fields.get("m_World")).fields.get("m_iCurrentNavMeshStep"))), "int")
			v_iOpenNode = R.coerce(R.call_member(c, "GetFreeNavMeshNode", [((v_gameplayMode).fields.get("m_Player")).fields.get("m_fRelativeLocationX"), R.binary("+", ((c).fields.get("m_vLocation")).fields.get("Z"), (v_iCheckStepIndex if R.truth(v_bGoingForward) else R.unary("-", v_iCheckStepIndex))), v_iTestStep, v_iStartNode]), "int")
		if R.truth((R.binary("!=", v_iOpenNode, R.unary("-", 1)) and (float(v_iOpenNode) != float(v_iStartNode)))):
			pass
			v_fSlope = float(R.binary("/", (float((v_vMoveTarget).fields.get("X")) - float(v_fStartPosX)), (float((v_vMoveTarget).fields.get("Z")) - float(((c).fields.get("m_vLocation")).fields.get("Z")))))
			v_fNewPosX = R.coerce((R.binary("+", R.call_member(c, "GetNavMeshNodePos", [v_iOpenNode]), 0.001) if R.truth((float(v_iOpenNode) > float(v_iStartNode))) else (R.num(R.call_member(c, "GetNavMeshNodePos", [(float(v_iOpenNode) + float(1))])) - float(0.001))), "Number")
			v_fNewSlope = float(R.binary("/", (float(v_fNewPosX) - float(v_fStartPosX)), (float((v_vMoveTarget).fields.get("Z")) - float(((c).fields.get("m_vLocation")).fields.get("Z")))))
			if R.truth((R.binary("!=", (float(v_fSlope) >= float(0)), (float(v_fNewSlope) >= float(0))) or R.binary(">", R.call_static("Maths", "AbsNumber", [v_fNewSlope]), R.call_static("Maths", "AbsNumber", [v_fSlope])))):
				pass
				(v_vMoveTarget).fields["X"] = float(v_fNewPosX)
				if R.truth((float(v_iCheckStepIndex) == float(0))):
					pass
					(v_vMoveTarget).fields["Z"] = float(((c).fields.get("m_vLocation")).fields.get("Z"))
					v_iEndStep = R.coerce(v_iStartStep, "int")
				else:
					pass
					if R.truth(v_bGoingForward):
						pass
						(v_vMoveTarget).fields["Z"] = R.coerce(R.call_member(c, "GetNavMeshStepPos", [(float(v_iStartStep) + float(v_iCheckStepIndex))]), "Number")
						v_iEndStep = R.coerce((float(v_iStartStep) + float(v_iCheckStepIndex)), "int")
					else:
						pass
						(v_vMoveTarget).fields["Z"] = float((R.num(R.call_member(c, "GetNavMeshStepPos", [(float((float(v_iStartStep) - float(v_iCheckStepIndex))) + float(1))])) - float(0.01)))
						v_iEndStep = R.coerce((float(v_iStartStep) - float(v_iCheckStepIndex)), "int")
	v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadLimitAt", [((c).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	v_fRightLimit = float(v_fLimit)
	if R.truth((((((float((v_vMoveTarget).fields.get("X")) > float(v_fStartPosX)) and (float(v_iEndStep) != float(v_iStartStep))) and (float(v_iStartStep) >= float(0))) and (float(v_iStartNode) < float((float(R.static_value("RDWorld", "NavMeshNodes")) - float(1))))) and ((R.truth(R.binary("==", ((c).fields.get("m_vLocation")).fields.get("Z"), R.call_member(c, "GetNavMeshStepPos", [(float(v_iStartStep) + float(1))]))) and R.truth(R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), (float(v_iStartStep) + float(1))), (float(v_iStartNode) + float(1))))) or R.truth(R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), v_iStartStep), (float(v_iStartNode) + float(1))))))):
		pass
		v_fRightLimit = float((R.num(R.call_member(c, "GetNavMeshNodePos", [(float(v_iStartNode) + float(1))])) - float(0.001)))
	v_fLeftLimit = R.coerce(R.unary("-", v_fLimit), "Number")
	if R.truth((((((float((v_vMoveTarget).fields.get("X")) < float(v_fStartPosX)) and (float(v_iEndStep) != float(v_iStartStep))) and (float(v_iStartStep) >= float(0))) and (float(v_iStartNode) > float(0))) and ((R.truth(R.binary("==", ((c).fields.get("m_vLocation")).fields.get("Z"), R.call_member(c, "GetNavMeshStepPos", [(float(v_iStartStep) + float(1))]))) and R.truth(R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), (float(v_iStartStep) + float(1))), (float(v_iStartNode) - float(1))))) or R.truth(R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), v_iStartStep), (float(v_iStartNode) - float(1))))))):
		pass
		v_fLeftLimit = R.coerce(R.binary("+", R.call_member(c, "GetNavMeshNodePos", [v_iStartNode]), 0.001), "Number")
	(v_vMoveTarget).fields["X"] = R.coerce(R.call_static("Maths", "Clamp", [(v_vMoveTarget).fields.get("X"), v_fLeftLimit, v_fRightLimit]), "Number")
	((c).fields.get("m_vMoveDir")).fields["X"] = float((float((v_vMoveTarget).fields.get("X")) - float(v_fStartPosX)))
	((c).fields.get("m_vMoveDir")).fields["Y"] = float(0)
	((c).fields.get("m_vMoveDir")).fields["Z"] = float((float((v_vMoveTarget).fields.get("Z")) - float(((c).fields.get("m_vLocation")).fields.get("Z"))))
	R.call_member((c).fields.get("m_vMoveDir"), "Normalize", [])
	v_fFinalSpeed = R.coerce(R.call_static("Maths", "Lerp", [v_fSpeedX, v_fSpeedZ, (float(1) - R.num(R.call_static("Maths", "AbsNumber", [((c).fields.get("m_vMoveDir")).fields.get("X")])))]), "Number")
	((c).fields.get("m_vVelocity")).fields["X"] = float((float(((c).fields.get("m_vMoveDir")).fields.get("X")) * float(v_fFinalSpeed)))
	((c).fields.get("m_vVelocity")).fields["Z"] = float((float(((c).fields.get("m_vMoveDir")).fields.get("Z")) * float(v_fFinalSpeed)))
	v_fNewX = R.coerce((minf(float((float(v_fStartPosX) + float((float(((c).fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime))))), float((v_vMoveTarget).fields.get("X"))) if R.truth((float(((c).fields.get("m_vMoveDir")).fields.get("X")) > float(0))) else maxf(float((float(v_fStartPosX) + float((float(((c).fields.get("m_vVelocity")).fields.get("X")) * float(v_fDeltaTime))))), float((v_vMoveTarget).fields.get("X")))), "Number")
	v_fNewZ = R.coerce((minf(float((float(((c).fields.get("m_vLocation")).fields.get("Z")) + float((float(((c).fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float((v_vMoveTarget).fields.get("Z"))) if R.truth((float(((c).fields.get("m_vMoveDir")).fields.get("Z")) > float(0))) else maxf(float((float(((c).fields.get("m_vLocation")).fields.get("Z")) + float((float(((c).fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))))), float((v_vMoveTarget).fields.get("Z")))), "Number")
	(v_vDeltaOut).fields["X"] = float((float(v_fNewX) - float(v_fStartPosX)))
	(v_vDeltaOut).fields["Z"] = float((float(v_fNewZ) - float(((c).fields.get("m_vLocation")).fields.get("Z"))))
	return null

static func f_GetFreeNavMeshNode(c: Variant, a: Array) -> Variant:
	var v_iRightNodeFound: Variant = 0
	var v_iLeftNodeFound: Variant = 0
	var v_iTargetNode: Variant = 0
	var v_iFinalNode: Variant = 0
	var v_bFoundRight: Variant = false
	var v_bFoundLeft: Variant = false
	var v_gameplayMode: Variant = null
	var v_fLimit: Variant = NAN
	var v_j: Variant = 0
	var v_fTargetX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fTestZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_iNavMeshStep: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iNavMeshNode: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	v_iRightNodeFound = R.coerce(0, "int")
	v_iLeftNodeFound = R.coerce(0, "int")
	v_iTargetNode = R.coerce(0, "int")
	v_iFinalNode = R.coerce(v_iNavMeshNode, "int")
	v_bFoundRight = false
	v_bFoundLeft = false
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fLimit = R.coerce(R.call_member((v_gameplayMode).fields.get("m_Road"), "GetRoadLimitAt", [v_fTestZ]), "Number")
	v_j = R.coerce(1, "int")
	while R.truth((float(v_j) < float(R.static_value("RDWorld", "NavMeshNodes")))):
		pass
		if R.truth(((((R.unary("!", v_bFoundRight) and R.binary("<", R.call_member(c, "GetNavMeshNodePos", [(float((float(v_iNavMeshNode) + float(v_j))) + float(1))]), v_fLimit)) and R.binary(">", R.call_member(c, "GetNavMeshNodePos", [(float(v_iNavMeshNode) + float(v_j))]), R.unary("-", v_fLimit))) and (float((float(v_iNavMeshNode) + float(v_j))) < float((float(R.static_value("RDWorld", "NavMeshNodes")) - float(1))))) and R.unary("!", R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), v_iNavMeshStep), (float(v_iNavMeshNode) + float(v_j)))))):
			pass
			v_bFoundRight = true
			v_iRightNodeFound = R.coerce((float(v_iNavMeshNode) + float(v_j)), "int")
		if R.truth(((((R.unary("!", v_bFoundLeft) and R.binary(">", R.call_member(c, "GetNavMeshNodePos", [(float(v_iNavMeshNode) - float(v_j))]), R.unary("-", v_fLimit))) and R.binary("<", R.call_member(c, "GetNavMeshNodePos", [(float((float(v_iNavMeshNode) - float(v_j))) + float(1))]), v_fLimit)) and (float((float(v_iNavMeshNode) - float(v_j))) > float(0))) and R.unary("!", R.get_value(R.get_value(((c).fields.get("m_World")).fields.get("m_NavMesh"), v_iNavMeshStep), (float(v_iNavMeshNode) - float(v_j)))))):
			pass
			v_bFoundLeft = true
			v_iLeftNodeFound = R.coerce((float(v_iNavMeshNode) - float(v_j)), "int")
		v_j = R.signed32(v_j + 1)
	if R.truth((v_bFoundRight or v_bFoundLeft)):
		pass
		if R.truth((v_bFoundRight and v_bFoundLeft)):
			pass
			if R.truth((float((float(v_iNavMeshStep) - float(((c).fields.get("m_World")).fields.get("m_iCurrentNavMeshStep")))) != float((c).fields.get("m_iLastFinalNodeStep")))):
				pass
				v_iTargetNode = R.coerce(R.call_member(c, "GetNavMeshNode", [v_fTargetX]), "int")
				if R.truth(R.binary("<", R.call_static("Maths", "AbsInt", [(float(v_iTargetNode) - float(v_iRightNodeFound))]), R.call_static("Maths", "AbsInt", [(float(v_iTargetNode) - float(v_iLeftNodeFound))]))):
					pass
					v_iFinalNode = R.coerce(v_iRightNodeFound, "int")
				else:
					pass
					v_iFinalNode = R.coerce(v_iLeftNodeFound, "int")
				(c).fields["m_iLastFinalNode"] = R.coerce(v_iFinalNode, "int")
				(c).fields["m_iLastFinalNodeStep"] = R.coerce((float(v_iNavMeshStep) - float(((c).fields.get("m_World")).fields.get("m_iCurrentNavMeshStep"))), "int")
			else:
				pass
				v_iFinalNode = R.coerce((c).fields.get("m_iLastFinalNode"), "int")
		else:
			pass
			if R.truth(v_bFoundRight):
				pass
				v_iFinalNode = R.coerce(v_iRightNodeFound, "int")
			else:
				pass
				v_iFinalNode = R.coerce(v_iLeftNodeFound, "int")
	return v_iFinalNode
	return null

static func f_UpdateDepthPosition(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"entityNode": "RDEntityNode", "nextNode": "RDEntityNode", "previousNode": "RDEntityNode", "iIndex": "*", "nextEntity": "RDEntity", "previousEntity": "RDEntity", "bFarther": "Boolean", "bIndexChanged": "Boolean"}
	l["entityNode"] = null
	l["nextNode"] = null
	l["previousNode"] = null
	l["iIndex"] = null
	l["nextEntity"] = null
	l["previousEntity"] = null
	l["bFarther"] = false
	l["bIndexChanged"] = false
	R.lset(l, "entityNode", null)
	R.lset(l, "nextNode", null)
	R.lset(l, "previousNode", null)
	R.lset(l, "iIndex", 0)
	R.lset(l, "nextEntity", null)
	R.lset(l, "previousEntity", null)
	R.lset(l, "bFarther", false)
	R.lset(l, "bIndexChanged", false)
	if R.truth(R.unary("!", (c).fields.get("m_EntityNode"))):
		pass
		return null
	if R.truth(R.unary("!", (c).fields.get("m_bHasCustomDepthPosition"))):
		pass
		(c).fields["m_fDepthPosition"] = float(((c).fields.get("m_vLocation")).fields.get("Z"))
	R.lset(l, "entityNode", (c).fields.get("m_EntityNode"), "=")
	while R.truth(R.logical_and(R.truth((R.lget(l, "entityNode")).fields.get("m_Next")), func(): return R.call_static("RDWorld", "CompareDepth", [c, ((R.lget(l, "entityNode")).fields.get("m_Next")).fields.get("m_Entity")]))):
		pass
		R.lset(l, "nextNode", (R.lget(l, "entityNode")).fields.get("m_Next"), "=")
		R.lset(l, "previousNode", (R.lget(l, "entityNode")).fields.get("m_Previous"), "=")
		(R.lget(l, "entityNode")).fields["m_Next"] = R.coerce((R.lget(l, "nextNode")).fields.get("m_Next"), "RDEntityNode")
		(R.lget(l, "entityNode")).fields["m_Previous"] = R.coerce(R.lget(l, "nextNode"), "RDEntityNode")
		if R.truth((R.lget(l, "nextNode")).fields.get("m_Next")):
			pass
			((R.lget(l, "nextNode")).fields.get("m_Next")).fields["m_Previous"] = R.coerce(R.lget(l, "entityNode"), "RDEntityNode")
		(R.lget(l, "nextNode")).fields["m_Next"] = R.coerce(R.lget(l, "entityNode"), "RDEntityNode")
		(R.lget(l, "nextNode")).fields["m_Previous"] = R.coerce(R.lget(l, "previousNode"), "RDEntityNode")
		if R.truth(R.unary("!", (R.lget(l, "nextNode")).fields.get("m_Previous"))):
			pass
			((c).fields.get("m_World")).fields["m_FirstEntity"] = R.coerce(R.lget(l, "nextNode"), "RDEntityNode")
		if R.truth(R.lget(l, "previousNode")):
			pass
			(R.lget(l, "previousNode")).fields["m_Next"] = R.coerce(R.lget(l, "nextNode"), "RDEntityNode")
	R.lset(l, "entityNode", (c).fields.get("m_EntityNode"), "=")
	while R.truth((R.truth((R.lget(l, "entityNode")).fields.get("m_Previous")) and R.unary("!", R.call_static("RDWorld", "CompareDepth", [c, ((R.lget(l, "entityNode")).fields.get("m_Previous")).fields.get("m_Entity")])))):
		pass
		R.lset(l, "nextNode", (R.lget(l, "entityNode")).fields.get("m_Next"), "=")
		R.lset(l, "previousNode", (R.lget(l, "entityNode")).fields.get("m_Previous"), "=")
		(R.lget(l, "entityNode")).fields["m_Next"] = R.coerce(R.lget(l, "previousNode"), "RDEntityNode")
		(R.lget(l, "entityNode")).fields["m_Previous"] = R.coerce((R.lget(l, "previousNode")).fields.get("m_Previous"), "RDEntityNode")
		if R.truth(R.lget(l, "nextNode")):
			pass
			(R.lget(l, "nextNode")).fields["m_Previous"] = R.coerce(R.lget(l, "previousNode"), "RDEntityNode")
		if R.truth((R.lget(l, "previousNode")).fields.get("m_Previous")):
			pass
			((R.lget(l, "previousNode")).fields.get("m_Previous")).fields["m_Next"] = R.coerce(R.lget(l, "entityNode"), "RDEntityNode")
		(R.lget(l, "previousNode")).fields["m_Next"] = R.coerce(R.lget(l, "nextNode"), "RDEntityNode")
		(R.lget(l, "previousNode")).fields["m_Previous"] = R.coerce(R.lget(l, "entityNode"), "RDEntityNode")
	if R.truth(R.unary("!", (R.lget(l, "entityNode")).fields.get("m_Previous"))):
		pass
		((c).fields.get("m_World")).fields["m_FirstEntity"] = R.coerce(R.lget(l, "entityNode"), "RDEntityNode")
	if R.truth(R.logical_and(R.truth((c).fields.get("m_ContainerMC")), func(): return R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "contains"), [(c).fields.get("m_MainMC")]))):
		pass
		R.lset(l, "bIndexChanged", false, "=")
		R.lset(l, "iIndex", R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "getChildIndex"), [(c).fields.get("m_MainMC")]), "=")
		R.lset(l, "nextEntity", (R.get_value(R.binary("as", R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "getChildAt"), [(R.num(R.lget(l, "iIndex")) - float(1))]), R.klass("MovieClip")), "m_owner") if R.truth(R.binary(">", R.lget(l, "iIndex"), 0)) else null), "=")
		if R.truth(R.lget(l, "nextEntity")):
			pass
			R.lset(l, "bFarther", R.call_static("RDWorld", "CompareDepth", [c, R.lget(l, "nextEntity")]), "=")
			while R.truth((R.truth(R.lget(l, "nextEntity")) and R.lget(l, "bFarther"))):
				pass
				R.lset(l, "bIndexChanged", true, "=")
				R.binary("+", R.lset(l, "iIndex", 1, "-="), 1)
				R.lset(l, "nextEntity", (R.get_value(R.binary("as", R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "getChildAt"), [(R.num(R.lget(l, "iIndex")) - float(1))]), R.klass("MovieClip")), "m_owner") if R.truth(R.binary(">", R.lget(l, "iIndex"), 0)) else null), "=")
				if R.truth(R.lget(l, "nextEntity")):
					pass
					R.lset(l, "bFarther", R.call_static("RDWorld", "CompareDepth", [c, R.lget(l, "nextEntity")]), "=")
		if R.truth(R.lget(l, "bIndexChanged")):
			pass
			R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "setChildIndex"), [(c).fields.get("m_MainMC"), R.lget(l, "iIndex")])
		R.lset(l, "bIndexChanged", false, "=")
		R.lset(l, "previousEntity", (R.get_value(R.binary("as", R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "getChildAt"), [R.binary("+", R.lget(l, "iIndex"), 1)]), R.klass("MovieClip")), "m_owner") if R.truth(R.binary("<", R.lget(l, "iIndex"), (R.num(R.get_value((c).fields.get("m_ContainerMC"), "numChildren")) - float(1)))) else null), "=")
		if R.truth(R.lget(l, "previousEntity")):
			pass
			R.lset(l, "bFarther", R.call_static("RDWorld", "CompareDepth", [c, R.lget(l, "previousEntity")]), "=")
			while R.truth((R.truth(R.lget(l, "previousEntity")) and R.unary("!", R.lget(l, "bFarther")))):
				pass
				R.lset(l, "bIndexChanged", true, "=")
				R.lset(l, "previousEntity", (R.get_value(R.binary("as", R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "getChildAt"), [R.binary("+", R.lget(l, "iIndex"), 1)]), R.klass("MovieClip")), "m_owner") if R.truth(R.binary("<", R.lset(l, "iIndex", 1, "+="), (R.num(R.get_value((c).fields.get("m_ContainerMC"), "numChildren")) - float(1)))) else null), "=")
				if R.truth(R.lget(l, "previousEntity")):
					pass
					R.lset(l, "bFarther", R.call_static("RDWorld", "CompareDepth", [c, R.lget(l, "previousEntity")]), "=")
		if R.truth(R.lget(l, "bIndexChanged")):
			pass
			R.invoke(R.get_value((c).fields.get("m_ContainerMC"), "setChildIndex"), [(c).fields.get("m_MainMC"), R.lget(l, "iIndex")])
	return null

static func f_UpdateFlip(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_GetEditorAdjustedPosX(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return v_fX
	return null

static func f_CanBePlacedInEditorAt(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	return true
	return null

static func f_InitProperties(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_AddProperty(c: Variant, a: Array) -> Variant:
	var v_prop: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_value: Variant = R.coerce((a[2] if a.size() > 2 else null), "*")
	if R.truth(R.unary("!", (c).fields.get("m_Properties"))):
		pass
		(c).fields["m_Properties"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
		(c).fields["m_PropertiesHash"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	v_prop = R.coerce(R.construct(R.klass("RDProperty"), [v_szName, v_iType, v_value]), "RDProperty")
	R.invoke(R.get_value((c).fields.get("m_Properties"), "push"), [v_prop])
	R.set_value((c).fields.get("m_PropertiesHash"), (v_prop).fields.get("m_szName"), v_prop, "=")
	return null

static func f_GetProperty(c: Variant, a: Array) -> Variant:
	var v_prop: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.unary("!", (c).fields.get("m_Properties"))):
		pass
		return null
	v_prop = R.coerce(R.get_value((c).fields.get("m_PropertiesHash"), v_szName), "RDProperty")
	return R.call_member(v_prop, "GetValue", [])
	return null

static func f_SetProperty(c: Variant, a: Array) -> Variant:
	var v_prop: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_value: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	if R.truth(R.unary("!", (c).fields.get("m_Properties"))):
		pass
		return null
	v_prop = R.coerce(R.get_value((c).fields.get("m_PropertiesHash"), v_szName), "RDProperty")
	R.call_member(v_prop, "SetValue", [v_value])
	return null

static func f_CanHaveInteraction(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetSuppressZoneMC(c: Variant, a: Array) -> Variant:
	return null
	return null

static func f_Suppress(c: Variant, a: Array) -> Variant:
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	pass
	return null

static func f_OnEffectEnded(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.set_value(v_mc, "m_owner", R.static_value("RDGame", "DummyOwner"), "=")
	R.call_static("RDGame", "ReturnMC", [v_mc])
	return null

static func f_CanBlockSoldierBullets(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bBlockSoldierBullets")
	return null

static func f_SetEditorMode(c: Variant, a: Array) -> Variant:
	(c).fields["m_bEditorMode"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "GlobalMCWidthToWorldWidthFactor", 0.015, "=")
	R.set_value(c, "Event_Destroyed", "Event_Destroyed", "=")
	R.set_value(c, "Event_Exploded", "Event_Exploded", "=")
	R.set_value(c, "AnimEvent_Destroy", "Destroy", "=")
	R.set_value(c, "Layer_Background", 0, "=")
	R.set_value(c, "Layer_SideBackground", 1, "=")
	R.set_value(c, "Layer_OverRoad", 4, "=")
	R.set_value(c, "Layer_Road", 2, "=")
	R.set_value(c, "Layer_Dynamic", 3, "=")
	R.set_value(c, "CollisionGroup_None", 0, "=")
	R.set_value(c, "CollisionGroup_Player", 1, "=")
	R.set_value(c, "CollisionGroup_Humanoid", 2, "=")
	R.set_value(c, "CollisionGroup_Helicopter", 3, "=")
	R.set_value(c, "CollisionGroup_RoadSign", 4, "=")
	R.set_value(c, "CollisionGroup_SpikeStrip", 5, "=")
	R.set_value(c, "CollisionGroup_OilSlick", 6, "=")
	R.set_value(c, "CollisionGroup_Obstacle", 7, "=")
	R.set_value(c, "CollisionGroup_Ramp", 8, "=")
	R.set_value(c, "CollisionGroup_Missile", 9, "=")
	R.set_value(c, "CollisionGroup_Building", 10, "=")
	R.set_value(c, "CollisionGroup_Volume", 11, "=")
	R.set_value(c, "Location_None", 0, "=")
	R.set_value(c, "Location_Church", 1, "=")
	R.set_value(c, "Location_PoliceStation", 2, "=")
	R.set_value(c, "Location_Garage", 3, "=")
	R.set_value(c, "Location_WeaponCrate", 4, "=")
	R.set_value(c, "Location_AmmoPoint", 5, "=")
	R.set_value(c, "BulletHitSoundMaterial_Flesh", 0, "=")
	R.set_value(c, "BulletHitSoundMaterial_Armor", 1, "=")
	R.set_value(c, "BulletHitSoundMaterial_MetalAndGlass", 2, "=")
	R.set_value(c, "BulletHitSoundMaterial_Wood", 3, "=")
	R.set_value(c, "BulletHitSoundMaterial_Concrete", 4, "=")
	R.set_value(c, "BulletHitSoundMaterial_Metal", 5, "=")
	R.set_value(c, "BulletHitSoundMaterial_Weak", 6, "=")
	R.set_value(c, "BulletHitSoundMaterial_Vegetation", 7, "=")
	R.set_value(c, "GEntityIndex", 0, "=")
	R.set_value(c, "m_FleshBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_ArmorBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_MetalAndGlassBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_WoodBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_ConcreteBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_MetalBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_WeakBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_VegetationBulletHitSounds", R.construct(R.klass("Array"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szFactoryName"] = R.coerce(null, "String")
	(c).fields["m_bEditorMode"] = false
	(c).fields["m_bDoNotDestroy"] = false
	(c).fields["m_iEntityIndex"] = R.coerce(0, "int")
	(c).fields["m_MC"] = R.coerce(null, "MovieClip")
	(c).fields["m_MainMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_EffectMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_ContainerMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_ConstructorMCClass"] = R.coerce(null, "Class")
	(c).fields["m_szAnim"] = R.coerce("", "String")
	(c).fields["m_iLayer"] = R.coerce(0, "int")
	(c).fields["m_Bounds"] = R.coerce(null, "Box")
	(c).fields["m_CollisionBounds"] = R.coerce(null, "Box")
	(c).fields["m_fHeight"] = float(NAN)
	(c).fields["m_bFlippedX"] = false
	(c).fields["m_iCollisionGroup"] = R.coerce(0, "int")
	(c).fields["m_World"] = R.coerce(null, "RDWorld")
	(c).fields["m_EntityNode"] = R.coerce(null, "RDEntityNode")
	(c).fields["m_vLocation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vVelocity"] = R.coerce(null, "DTVector3D")
	(c).fields["m_AttachedSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_EntitySounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_fBackSoundDistanceMultiplier"] = float(NAN)
	(c).fields["m_bDestroyMe"] = false
	(c).fields["m_bIsPlayer"] = false
	(c).fields["m_fMinRenderScale"] = float(NAN)
	(c).fields["m_fScale"] = float(NAN)
	(c).fields["m_fFadeDistance"] = float(NAN)
	(c).fields["m_fFadeRange"] = float(NAN)
	(c).fields["m_fHitDamage"] = float(NAN)
	(c).fields["m_fMinHitHP"] = float(NAN)
	(c).fields["m_fHitSpeedLoss"] = float(NAN)
	(c).fields["m_fHitShakeIntensity"] = float(NAN)
	(c).fields["m_fHitShakeDuration"] = float(NAN)
	(c).fields["m_iLocationType"] = R.coerce(0, "int")
	(c).fields["m_AttachedEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Base"] = R.coerce(null, "RDEntity")
	(c).fields["m_bCanBeHitByExplosion"] = false
	(c).fields["m_BulletHitPos"] = R.coerce(R.construct(R.klass("Point"), []), "Point")
	(c).fields["m_fBulletHitEffectScaleMin"] = float(NAN)
	(c).fields["m_fBulletHitEffectScaleMax"] = float(NAN)
	(c).fields["m_fMaxBulletHitEffectRotation"] = float(NAN)
	(c).fields["m_BulletHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_BulletHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_bLocationUsed"] = false
	(c).fields["m_bFillNavMesh"] = false
	(c).fields["m_fExtraNavMeshSpacing"] = float(0)
	(c).fields["m_bCanBeHitByBullet"] = false
	(c).fields["m_iPropertyValue"] = R.coerce(10, "int")
	(c).fields["m_vMoveDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_bCanBeShotByHelicopter"] = false
	(c).fields["m_iSpawnCapacity"] = R.coerce(0, "int")
	(c).fields["m_fDepthPosition"] = float(9999999999)
	(c).fields["m_bHasCustomDepthPosition"] = false
	(c).fields["m_iLastFinalNode"] = R.coerce(0, "int")
	(c).fields["m_iLastFinalNodeStep"] = R.coerce(0, "int")
	(c).fields["m_iLastTestStep"] = R.coerce(0, "int")
	(c).fields["m_iLastStartStep"] = R.coerce(0, "int")
	(c).fields["m_iBulletHitSoundMaterial"] = R.coerce(0, "int")
	(c).fields["m_vTransformedLocation"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_bSelectableInEditor"] = true
	(c).fields["m_bMovableInEditor"] = true
	(c).fields["m_bDeletableInEditor"] = true
	(c).fields["m_bExportableInEditor"] = true
	(c).fields["m_bUseCollisionInEditor"] = true
	(c).fields["m_fSurvivalGuideDistance"] = float(0)
	(c).fields["m_iSurvivalGuideItem"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_bUnlockSurvivalGuide"] = true
	(c).fields["m_bBlockSoldierBullets"] = false
	(c).fields["m_bUseCurvyCamera"] = true
	(c).fields["m_Properties"] = R.coerce(null, "Array")
	(c).fields["m_PropertiesHash"] = R.coerce(null, "Array")
	(c).fields["m_vBulletHitWorldPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vTopLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vProjLocation"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vProjTopLocation"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_bUpdateOutOfView"] = false
	(c).fields["m_iMaxNavMeshLookup"] = R.coerce(6, "int")
	return null
