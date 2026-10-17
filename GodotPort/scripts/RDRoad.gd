extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDRoad(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_j: Variant = 0
	var v_positions: Variant = null
	v_i = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_positions = R.coerce(null, "Array")
	(c).fields["m_RoadSlices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_LavaRoadSlices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_RoadSliceEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_RoadSliceGroundEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_RoadBulletPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_PavementHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ConcreteHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_GrassHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_DirtHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SnowHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_LavaHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ConcreteWallHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_GrassWallHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SnowWallHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_LavaWallHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_PavementHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ConcreteHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_GrassHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_DirtHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SnowHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_LavaHitSounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_vBulletPos"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vCamDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vQuadPos1"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vQuadPos2"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vQuadPos3"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vQuadPos4"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vHitLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_mRot"] = R.coerce(R.construct(R.klass("Matrix3D"), []), "Matrix3D")
	(c).fields["m_vAxis"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_vTempDir"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_BackwardAreaRoadSlices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ForwardAreaRoadSlices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.super_ref(c, "RDRoad"), [R.klass("MovieClip")])
	(c).fields["m_iMode"] = R.coerce(R.static_value("RDRoad", "Mode_Normal"), "int")
	c.fields["m_bSelectableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Road"), "int")
	(c).fields["m_vRenderVec3D1"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRenderVec3D2"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRenderVec3D3"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRenderVec3D4"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRenderVec2D1"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vRenderVec2D2"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vRenderVec2D3"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vRenderVec2D4"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_RenderColor"] = R.coerce(R.construct(R.klass("RGBA"), []), "RGBA")
	(c).fields["m_iCurrentRoadSlice"] = R.coerce(0, "int")
	(c).fields["m_Rendered3DVectors"] = R.coerce(R.construct(R.klass("Array"), [R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))]), R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))]), R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))])]), "Array")
	(c).fields["m_Rendered2DVectors"] = R.coerce(R.construct(R.klass("Array"), [R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))]), R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))]), R.construct(R.klass("Array"), [(float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))])]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))))):
		pass
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector3D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Main")), v_i, v_positions, "=")
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector3D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i, v_positions, "=")
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector3D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i, v_positions, "=")
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector2D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Main")), v_i, v_positions, "=")
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector2D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i, v_positions, "=")
		v_positions = R.coerce(R.construct(R.klass("Array"), [8]), "Array")
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(8))):
			pass
			R.set_value(v_positions, v_j, R.construct(R.klass("DTVector2D"), []), "=")
			v_j = R.signed32(v_j + 1)
		R.set_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i, v_positions, "=")
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_PavementHitEffects"), "push"), [R.klass("MC_BulletImpactPavementFast")])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitEffects"), "push"), [R.klass("MC_BulletImpactConcreteFast")])
	R.invoke(R.get_value((c).fields.get("m_GrassHitEffects"), "push"), [R.klass("MC_BulletImpactGrassFast")])
	R.invoke(R.get_value((c).fields.get("m_DirtHitEffects"), "push"), [R.klass("MC_BulletImpactDirt")])
	R.invoke(R.get_value((c).fields.get("m_SnowHitEffects"), "push"), [R.klass("MC_BulletImpactSnow")])
	R.invoke(R.get_value((c).fields.get("m_LavaHitEffects"), "push"), [R.klass("MC_BulletImpactBrick")])
	R.invoke(R.get_value((c).fields.get("m_ConcreteWallHitEffects"), "push"), [R.klass("MC_BulletImpactConcreteWall")])
	R.invoke(R.get_value((c).fields.get("m_GrassWallHitEffects"), "push"), [R.klass("MC_BulletImpactLeavesWall")])
	R.invoke(R.get_value((c).fields.get("m_SnowWallHitEffects"), "push"), [R.klass("MC_BulletImpactSnow")])
	R.invoke(R.get_value((c).fields.get("m_LavaWallHitEffects"), "push"), [R.klass("MC_BulletImpactBrick")])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_PavementHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss04"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss05"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss06"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss07"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_ConcreteHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletMiss08"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_GrassHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh01"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_GrassHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh02"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	R.invoke(R.get_value((c).fields.get("m_GrassHitSounds"), "push"), [R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_BulletHitFlesh03"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")])])
	(c).fields["m_DirtHitSounds"] = R.coerce((c).fields.get("m_GrassHitSounds"), "Array")
	(c).fields["m_SnowHitSounds"] = R.coerce((c).fields.get("m_GrassHitSounds"), "Array")
	(c).fields["m_LavaHitSounds"] = R.coerce((c).fields.get("m_GrassHitSounds"), "Array")
	c.fields["m_fBulletHitEffectScaleMin"] = float(0.1)
	c.fields["m_fBulletHitEffectScaleMax"] = float(0.2)
	c.fields["m_iPropertyValue"] = R.coerce(3, "int")
	R.call_member(c, "Reset", [])
	return null

static func f_GetLaneXPos(c: Variant, a: Array) -> Variant:
	var v_iLane: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var __t1 = v_iLane
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, 0):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, 2):
		__t2 = 1
	if __t2 == -1:
		__t2 = 2
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			return R.static_value("RDRoad", "Lane1PosX")
		if __t2 >= 0 and __t2 <= 1:
			pass
			return R.static_value("RDRoad", "Lane3PosX")
		if __t2 >= 0 and __t2 <= 2:
			pass
			return R.static_value("RDRoad", "Lane2PosX")
	return null

static func f_GetLaneFromXPos(c: Variant, a: Array) -> Variant:
	var v_fPosX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return floorf(float(R.binary("/", (float(v_fPosX) + float(R.static_value("RDRoad", "RoadLimit"))), (float(R.static_value("RDRoad", "LaneHalfWidth")) * float(2)))))
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoad"), "SetInitialState"), [])
	(c).fields["m_bAddSliceEntities"] = true
	R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [0])
	(c).fields["m_SliceEntity"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_SliceEntityGround"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_bLastSliceLava"] = false
	(c).fields["m_iAreaSliceIndex"] = R.coerce(0, "int")
	(c).fields["m_iMode"] = R.coerce(R.static_value("RDRoad", "Mode_Normal"), "int")
	R.call_member(c, "Reset", [])
	return null

static func f_InitRoadSliceEntities(c: Variant, a: Array) -> Variant:
	var v_sliceEntity: Variant = null
	var v_i: Variant = 0
	var v_roadSlice: Variant = null
	var v_roadSliceGround: Variant = null
	var v_fStartPos: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_sliceEntity = R.coerce(null, "RDRoadSlice")
	v_i = R.coerce(0, "int")
	v_roadSlice = R.coerce(null, "RDRoadSlice")
	v_roadSliceGround = R.coerce(null, "RDRoadSlice")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSliceEntities"), "length"), 0)):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))))):
			pass
			v_roadSlice = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSlice")]), R.klass("RDRoadSlice")), "RDRoadSlice")
			(v_roadSlice).fields["m_iIndex"] = R.coerce(v_i, "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "push"), [v_roadSlice])
			v_roadSliceGround = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoadSlice")]), R.klass("RDRoadSlice")), "RDRoadSlice")
			(v_roadSliceGround).fields["m_iIndex"] = R.coerce(v_i, "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "push"), [v_roadSliceGround])
			v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_RoadSliceEntities"), "length"))):
		pass
		v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), v_i), "RDRoadSlice")
		((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPos) + float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize"))))))
		R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
		v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), v_i), "RDRoadSlice")
		((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPos) + float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize"))))))
		R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
		v_i = R.signed32(v_i + 1)
	(c).fields["m_iCurrentRoadSlice"] = R.coerce(floorf(float(R.binary("/", v_fStartPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	return null

static func f_Project3DTo2DQuick(c: Variant, a: Array) -> Variant:
	var v_viewport: Variant = null
	var v_fLocX: Variant = NAN
	var v_fLocY: Variant = NAN
	var v_fInvZ: Variant = NAN
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_camera: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDCamera")
	var v_vProj: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector2D")
	v_viewport = R.coerce((R.static_value("BasicGame", "Instance")).fields.get("m_Viewport"), "Viewport")
	v_fLocX = float((v_vLocation).fields.get("X"))
	v_fLocY = float((v_vLocation).fields.get("Y"))
	R.set_value(c.fields.get("m_vTransformedLocation"), "x", (float(v_fLocX) - float(((v_camera).fields.get("m_vLocation")).fields.get("X"))), "=")
	R.set_value(c.fields.get("m_vTransformedLocation"), "y", (float((float(v_fLocY) - float(((v_camera).fields.get("m_vLocation")).fields.get("Y")))) + float((float(R.binary("/", (v_vLocation).fields.get("Z"), (v_camera).fields.get("m_fRampDistance"))) * float((v_camera).fields.get("m_fRampFactor"))))), "=")
	R.set_value(c.fields.get("m_vTransformedLocation"), "z", (v_vLocation).fields.get("Z"), "=")
	c.fields["m_vTransformedLocation"] = R.coerce(R.invoke(R.get_value((v_camera).fields.get("m_RotationMatrix"), "transformVector"), [c.fields.get("m_vTransformedLocation")]), "Vector3D")
	R.set_value(c.fields.get("m_vTransformedLocation"), "z", maxf(R.num(R.get_value(c.fields.get("m_vTransformedLocation"), "z")), float(0.1)), "=")
	v_fInvZ = float(R.binary("/", 1, R.get_value(c.fields.get("m_vTransformedLocation"), "z")))
	(v_vProj).fields["X"] = float((float((float((R.num(R.get_value(c.fields.get("m_vTransformedLocation"), "x")) * float((v_camera).fields.get("m_fRenderDistX")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfWidth"))))
	(v_vProj).fields["Y"] = float((float((float((R.num(R.unary("-", R.get_value(c.fields.get("m_vTransformedLocation"), "y"))) * float((v_camera).fields.get("m_fRenderDistY")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfHeight"))))
	return null

static func f_PrecomputePositions(c: Variant, a: Array) -> Variant:
	var v_v3D: Variant = null
	var v_positions2D1: Variant = null
	var v_positions2D2: Variant = null
	var v_positions2D3: Variant = null
	var v_positions3D1: Variant = null
	var v_positions3D2: Variant = null
	var v_positions3D3: Variant = null
	var v_fCamPos: Variant = NAN
	var v_fLoopedCamPos: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_bIsHighway: Variant = false
	var v_iType: Variant = 0
	var v_iPreviousType: Variant = 0
	var v_iNextType: Variant = 0
	var v_bIsStreet: Variant = false
	var v_bIsAlleyway: Variant = false
	var v_i: Variant = 0
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_v3D = R.coerce(null, "DTVector3D")
	v_positions2D1 = R.coerce(null, "Array")
	v_positions2D2 = R.coerce(null, "Array")
	v_positions2D3 = R.coerce(null, "Array")
	v_positions3D1 = R.coerce(null, "Array")
	v_positions3D2 = R.coerce(null, "Array")
	v_positions3D3 = R.coerce(null, "Array")
	v_fCamPos = float(NAN)
	v_fLoopedCamPos = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinX = float(NAN)
	v_fPerlinY = float(NAN)
	v_bIsHighway = false
	v_iType = R.coerce(0, "int")
	v_iPreviousType = R.coerce(0, "int")
	v_iNextType = R.coerce(0, "int")
	v_bIsStreet = false
	v_bIsAlleyway = false
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))))):
		pass
		v_positions2D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Main")), v_i), R.klass("Array")), "Array")
		v_positions2D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i), R.klass("Array")), "Array")
		v_positions2D3 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i), R.klass("Array")), "Array")
		v_positions3D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Main")), v_i), R.klass("Array")), "Array")
		v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i), R.klass("Array")), "Array")
		v_positions3D3 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i), R.klass("Array")), "Array")
		v_fCamPos = R.coerce((((v_camera).fields.get("m_vLocation")).fields.get("Z") if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))) else maxf(float(((v_camera).fields.get("m_vLocation")).fields.get("Z")), float(0))), "Number")
		v_fLoopedCamPos = R.coerce((v_fCamPos if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))) else R.binary("%", v_fCamPos, R.static_value("RDRoad", "RenderStepSize"))), "Number")
		v_fPosZ = R.coerce(R.call_static("Maths", "Clamp", [(float((float(v_i) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos)), R.static_value("RDRoad", "NearPos"), R.static_value("RDRoad", "FarPos")]), "Number")
		v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(v_fPosZ))]), "Number")
		v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float(v_fPosZ))]), "Number")
		v_bIsHighway = true
		if R.truth(R.binary(">", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
			pass
			v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_iPreviousType = R.coerce(R.static_value("RDRoad", "SliceType_None"), "int")
			if R.truth((float(v_i) > float(0))):
				pass
				v_iPreviousType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_i) - float(1))), "int"), "int")
			v_iNextType = R.coerce(R.static_value("RDRoad", "SliceType_None"), "int")
			if R.truth((float(v_i) < float((R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1))))):
				pass
				v_iNextType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_i) + float(1))), "int"), "int")
			v_bIsHighway = ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway"))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Highway"))))
			v_bIsStreet = (((((((((((((((((((((((((((((((((((((((((((((((((((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Town"))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Park")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Cemetery")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Parking")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_ForestPath")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Dirt")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Sand")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Concrete")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Snow")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Ice")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Mud")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Town")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Park")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Cemetery")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Parking")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_ForestPath")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Dirt")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Sand")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Concrete")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Snow")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Ice")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Mud")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow")))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath")))) or ((float(v_iType) != float(R.static_value("RDRoad", "SliceType_Highway"))) and (float(v_iNextType) == float(R.static_value("RDRoad", "SliceType_Highway")))))
			v_bIsAlleyway = ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))) or (float(v_iPreviousType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))))
			if R.truth(v_bIsStreet):
				pass
				v_v3D = R.coerce(R.get_value(v_positions3D1, 0), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "FarWallPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 0)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 1), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "FarWallPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 1)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 2), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "SideWalkPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 2)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 3), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "StreetPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 3)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 4), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "StreetPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 4)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 5), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "SideWalkPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 5)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 6), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "FarWallPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 6)])
				v_v3D = R.coerce(R.get_value(v_positions3D1, 7), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "FarWallPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D1, 7)])
			if R.truth(v_bIsAlleyway):
				pass
				v_v3D = R.coerce(R.get_value(v_positions3D2, 0), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "FarWallPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 0)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 1), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "FarWallPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 1)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 2), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "AlleywayPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 2)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 3), "DTVector3D")
				(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "AlleywayPosX")), v_fPerlinX), "Number")
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 3)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 4), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "AlleywayPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 4)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 5), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "AlleywayPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 5)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 6), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "FarWallPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float(v_fPerlinY)
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 6)])
				v_v3D = R.coerce(R.get_value(v_positions3D2, 7), "DTVector3D")
				(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "FarWallPosX")) + float(v_fPerlinX)))
				(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
				(v_v3D).fields["Z"] = float(v_fPosZ)
				R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D2, 7)])
		if R.truth(v_bIsHighway):
			pass
			v_v3D = R.coerce(R.get_value(v_positions3D3, 0), "DTVector3D")
			(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "SideRoadPosX")), v_fPerlinX), "Number")
			(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 0)])
			v_v3D = R.coerce(R.get_value(v_positions3D3, 1), "DTVector3D")
			(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "SideRoadPosX")), v_fPerlinX), "Number")
			(v_v3D).fields["Y"] = float(v_fPerlinY)
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 1)])
			v_v3D = R.coerce(R.get_value(v_positions3D3, 2), "DTVector3D")
			(v_v3D).fields["X"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDRoad", "RoadPosX")), v_fPerlinX), "Number")
			(v_v3D).fields["Y"] = float(v_fPerlinY)
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 2)])
			v_v3D = R.coerce(R.get_value(v_positions3D3, 3), "DTVector3D")
			(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "RoadPosX")) + float(v_fPerlinX)))
			(v_v3D).fields["Y"] = float(v_fPerlinY)
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 3)])
			v_v3D = R.coerce(R.get_value(v_positions3D3, 4), "DTVector3D")
			(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(v_fPerlinX)))
			(v_v3D).fields["Y"] = float(v_fPerlinY)
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 4)])
			v_v3D = R.coerce(R.get_value(v_positions3D3, 5), "DTVector3D")
			(v_v3D).fields["X"] = float((float(R.static_value("RDRoad", "SideRoadPosX")) + float(v_fPerlinX)))
			(v_v3D).fields["Y"] = float((float(R.static_value("RDRoad", "WallHeight")) + float(v_fPerlinY)))
			(v_v3D).fields["Z"] = float(v_fPosZ)
			R.call_member(c, "Project3DTo2DQuick", [v_v3D, v_camera, R.get_value(v_positions2D3, 5)])
		v_i = R.signed32(v_i + 1)
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_fDistanceRatio: Variant = NAN
	var v_bOffColor: Variant = false
	var v_iNbSlices: Variant = 0
	var v_iType: Variant = 0
	var v_iNextType: Variant = 0
	var v_bLava: Variant = false
	var v_fCamPos: Variant = NAN
	var v_fLoopedCamPos: Variant = NAN
	var v_iCamSlide: Variant = 0
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_i = R.coerce(0, "int")
	v_fDistanceRatio = float(NAN)
	v_bOffColor = false
	v_iNbSlices = R.coerce(0, "int")
	v_iType = R.coerce(0, "int")
	v_iNextType = R.coerce(0, "int")
	v_bLava = false
	v_fCamPos = R.coerce((((v_camera).fields.get("m_vLocation")).fields.get("Z") if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))) else maxf(float(((v_camera).fields.get("m_vLocation")).fields.get("Z")), float(0))), "Number")
	v_fLoopedCamPos = R.coerce((v_fCamPos if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))) else R.binary("%", v_fCamPos, R.static_value("RDRoad", "RenderStepSize"))), "Number")
	v_iCamSlide = R.coerce((0 if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))) else R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")), "int")
	R.invoke(R.get_value(R.get_value(c.fields.get("m_MC"), "graphics"), "clear"), [])
	R.call_member(c, "UpdateRoadSlice", [v_camera])
	R.call_member(c, "PrecomputePositions", [v_camera])
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))):
			pass
			v_iNbSlices = R.coerce(5, "int")
		else:
			pass
			v_iNbSlices = R.coerce(minf(R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")), float(R.static_value("RDRoad", "NbRenderSteps"))), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbSlices))):
			pass
			v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_iNextType = R.coerce(R.static_value("RDRoad", "SliceType_None"), "int")
			if R.truth((float(v_i) < float((R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1))))):
				pass
				v_iNextType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_i) + float(1))), "int"), "int")
			v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), v_i))
			(c).fields["m_fRenderNearPosX"] = float(maxf(float((float((float(v_i) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "NearPos"))))
			(c).fields["m_fRenderFarPosX"] = float((float(minf(float((float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "FarPos")))) + float(0.1)))
			v_bOffColor = (float(R.binary("%", (float(v_iCamSlide) + float(v_i)), 2)) == float(0))
			v_fDistanceRatio = float(R.binary("/", (c).fields.get("m_fRenderNearPosX"), R.static_value("RDRoad", "FarPos")))
			(c).fields["m_SliceEntity"] = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), v_i), "RDRoadSlice")
			((c).fields.get("m_SliceEntity")).fields["m_iType"] = R.coerce(v_iType, "int")
			((c).fields.get("m_SliceEntity")).fields["m_iNextType"] = R.coerce(v_iNextType, "int")
			(c).fields["m_SliceEntityGround"] = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), v_i), "RDRoadSlice")
			((c).fields.get("m_SliceEntityGround")).fields["m_iType"] = R.coerce(v_iType, "int")
			((c).fields.get("m_SliceEntityGround")).fields["m_iNextType"] = R.coerce(v_iNextType, "int")
			R.invoke(R.get_value(R.get_value(((c).fields.get("m_SliceEntity")).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value(R.get_value(((c).fields.get("m_SliceEntityGround")).fields.get("m_MC"), "graphics"), "clear"), [])
			if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Town")))):
				pass
				if R.truth(v_bLava):
					pass
					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
					R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
					R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
					R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
					R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
				else:
					pass
					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
					R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
					R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
					R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
					R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
				R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
				(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
				R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
				R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
				R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
				(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
				R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Park")))):
					pass
					if R.truth(v_bLava):
						pass
						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
						R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
						R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
						R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
					else:
						pass
						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
						R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
						R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
						R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassPathNearColor")), (R.static_value("RDRoad", "GrassPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
					R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Cemetery")))):
						pass
						if R.truth(v_bLava):
							pass
							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
							R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
							R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
							R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
							R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						else:
							pass
							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
							R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
							R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
							R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
							R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
						R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "AlleywayGroundNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "AlleywayGroundNearColor")), (R.static_value("RDRoad", "AlleywayGroundFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "AlleywayGroundFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
						R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
					else:
						pass
						if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
							pass
							if R.truth(v_bLava):
								pass
								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
								R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
								R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
								R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
							else:
								pass
								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
								R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
								R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
								R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
							R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
						else:
							pass
							if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))):
								pass
								if R.truth(v_bLava):
									pass
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
									R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
									R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								else:
									pass
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
								R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
								R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
							else:
								pass
								if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt")))):
									pass
									if R.truth(v_bLava):
										pass
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
										R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
										R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									else:
										pass
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
									R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
								else:
									pass
									if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))):
										pass
										if R.truth(v_bLava):
											pass
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
											R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
											R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										else:
											pass
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
										R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
									else:
										pass
										if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow")))):
											pass
											if R.truth(v_bLava):
												pass
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
												R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
												R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											else:
												pass
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
											R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
										else:
											pass
											if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))):
												pass
												if R.truth(v_bLava):
													pass
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
													R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
													R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												else:
													pass
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
												R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
											else:
												pass
												if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement")))):
													pass
													if R.truth(v_bLava):
														pass
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
														R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
														R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													else:
														pass
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
													R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
												else:
													pass
													if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement")))):
														pass
														if R.truth(v_bLava):
															pass
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
															R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
															R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														else:
															pass
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
														R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
													else:
														pass
														if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))):
															pass
															if R.truth(v_bLava):
																pass
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															else:
																pass
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudNearColor")), (R.static_value("RDRoad", "MudFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathNearColor")), (R.static_value("RDRoad", "DirtPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
															R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
														else:
															pass
															if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))):
																pass
																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
															else:
																pass
																if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))):
																	pass
																	R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																	(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																	R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																	R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																	R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathNearColor")), (R.static_value("RDRoad", "DirtPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																	(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																	R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																else:
																	pass
																	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
																		pass
																		R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																		(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																		R.call_member(c, "RenderSideWall", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Alleyway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																		R.call_member(c, "RenderSideWall", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Alleyway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																		R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "AlleywayGroundNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "AlleywayGroundNearColor")), (R.static_value("RDRoad", "AlleywayGroundFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "AlleywayGroundFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																		(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																		R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Alleyway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																	else:
																		pass
																		if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
																			pass
																			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "WallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "WallNearColor")), (R.static_value("RDRoad", "WallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "WallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																			R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																			R.call_member(c, "RenderSideWall", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																			R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																			R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																			R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																		else:
																			pass
																			if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_ForestPath")))):
																				pass
																				if R.truth(v_bLava):
																					pass
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																					R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																					R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																				else:
																					pass
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																					R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																				R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudNearColor")), (R.static_value("RDRoad", "MudFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																				(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																				R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																				R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																				R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																				(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																				R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																			else:
																				pass
																				if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))):
																					pass
																					if R.truth(v_bLava):
																						pass
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																						R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																						R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					else:
																						pass
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudNearColor")), (R.static_value("RDRoad", "MudFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathNearColor")), (R.static_value("RDRoad", "DirtPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																					(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																					R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																				else:
																					pass
																					if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad")))):
																						pass
																						if R.truth(v_bLava):
																							pass
																							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																							R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																							R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																							R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						else:
																							pass
																							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																							R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																							R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																							R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																						(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																						R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																					else:
																						pass
																						if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad")))):
																							pass
																							if R.truth(v_bLava):
																								pass
																								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																								R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																								R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																								R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							else:
																								pass
																								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																								R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																								R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																								R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																							R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																							(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																							R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																						else:
																							pass
																							if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath")))):
																								pass
																								if R.truth(v_bLava):
																									pass
																									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																									R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																									R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																									R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								else:
																									pass
																									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																									R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																									R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																									R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudNearColor")), (R.static_value("RDRoad", "MudFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																								R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																								(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																								R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																							else:
																								pass
																								if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad")))):
																									pass
																									if R.truth(v_bLava):
																										pass
																										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																										R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																										R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																										R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																										R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									else:
																										pass
																										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																										R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "HedgeNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeNearColor")), (R.static_value("RDRoad", "HedgeFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "HedgeFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																										R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "GrassNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassNearColor")), (R.static_value("RDRoad", "GrassFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "GrassFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																										R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																										R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideWalkNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkNearColor")), (R.static_value("RDRoad", "RoadSideWalkFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideWalkFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																									R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									R.call_member(c, "RenderGround", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																									(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																									R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																								else:
																									pass
																									if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Dirt")))):
																										pass
																										if R.truth(v_bLava):
																											pass
																											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																											R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																											R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																											R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																											R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																										else:
																											pass
																											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																											R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																											R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtNearColor")), (R.static_value("RDRoad", "DirtFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																											R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																											R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																										R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "DirtPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathNearColor")), (R.static_value("RDRoad", "DirtPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "DirtPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																										(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																										R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																									else:
																										pass
																										if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Mud")))):
																											pass
																											if R.truth(v_bLava):
																												pass
																												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																												R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																												R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																												R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																												R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																											else:
																												pass
																												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																												R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																												R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudNearColor")), (R.static_value("RDRoad", "MudFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																												R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																												R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																											R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "MudPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudPathNearColor")), (R.static_value("RDRoad", "MudPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "MudPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																											(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																											R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																										else:
																											pass
																											if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Sand")))):
																												pass
																												if R.truth(v_bLava):
																													pass
																													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																													R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																													R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																													R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																													R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																												else:
																													pass
																													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																													R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																													R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SandNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SandNearColor")), (R.static_value("RDRoad", "SandFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SandFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																													R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																													R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																												R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SandPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SandPathNearColor")), (R.static_value("RDRoad", "SandPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SandPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																												(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																												R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																											else:
																												pass
																												if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Concrete")))):
																													pass
																													if R.truth(v_bLava):
																														pass
																														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																														R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																														R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																														R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																														R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																													else:
																														pass
																														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																														R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																														R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "ConcreteNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "ConcreteNearColor")), (R.static_value("RDRoad", "ConcreteFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "ConcreteFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																														R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																														R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																													R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "ConcretePathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "ConcretePathNearColor")), (R.static_value("RDRoad", "ConcretePathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "ConcretePathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																													(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																													R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																												else:
																													pass
																													if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Snow")))):
																														pass
																														if R.truth(v_bLava):
																															pass
																															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																															R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																															R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																															R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																															R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																														else:
																															pass
																															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																															R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																															R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowNearColor")), (R.static_value("RDRoad", "SnowFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																															R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																															R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																														R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "SnowPathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowPathNearColor")), (R.static_value("RDRoad", "SnowPathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "SnowPathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																														(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																														R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																													else:
																														pass
																														if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Ice")))):
																															pass
																															if R.truth(v_bLava):
																																pass
																																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "LavaNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaNearColor")), (R.static_value("RDRoad", "LavaFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "LavaFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																																R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																																R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																																R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																																R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																															else:
																																pass
																																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																																R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																																R.call_member(c, "RenderSideWall", [v_i, 6, 7, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
																																R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "IceNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "IceNearColor")), (R.static_value("RDRoad", "IceFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "IceFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																																(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																																R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																																R.call_member(c, "RenderGround", [v_i, 5, 6, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
																															R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "IcePathNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "IcePathNearColor")), (R.static_value("RDRoad", "IcePathFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "IcePathFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
																															(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
																															R.call_member(c, "RenderGround", [v_i, 2, 5, R.static_value("RDRoad", "Layer_Main"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
			if R.truth((float(v_iNextType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
				pass
				R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "StreetWallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallNearColor")), (R.static_value("RDRoad", "StreetWallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "StreetWallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
				(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
				R.call_member(c, "RenderFrontWall", [(float(v_i) + float(1)), 1, 0, 3, 2, R.static_value("RDRoad", "Layer_Alleyway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
				R.call_member(c, "RenderFrontWall", [(float(v_i) + float(1)), 4, 5, 6, 7, R.static_value("RDRoad", "Layer_Alleyway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
			v_i = R.signed32(v_i + 1)
	else:
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(R.static_value("RDRoad", "NbRenderSteps")))):
			pass
			(c).fields["m_fRenderNearPosX"] = float(maxf(float((float((float(v_i) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "NearPos"))))
			(c).fields["m_fRenderFarPosX"] = float((float(minf(float((float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "FarPos")))) + float(0.1)))
			v_bOffColor = (float(R.binary("%", (float(v_iCamSlide) + float(v_i)), 2)) == float(0))
			v_fDistanceRatio = float(R.binary("/", (c).fields.get("m_fRenderNearPosX"), R.static_value("RDRoad", "FarPos")))
			(c).fields["m_SliceEntity"] = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), v_i), "RDRoadSlice")
			((c).fields.get("m_SliceEntity")).fields["m_iType"] = R.coerce(R.static_value("RDRoad", "SliceType_Highway"), "int")
			R.invoke(R.get_value(R.get_value(((c).fields.get("m_SliceEntity")).fields.get("m_MC"), "graphics"), "clear"), [])
			(c).fields["m_SliceEntityGround"] = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), v_i), "RDRoadSlice")
			((c).fields.get("m_SliceEntityGround")).fields["m_iType"] = R.coerce(R.static_value("RDRoad", "SliceType_Highway"), "int")
			R.invoke(R.get_value(R.get_value(((c).fields.get("m_SliceEntityGround")).fields.get("m_MC"), "graphics"), "clear"), [])
			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "WallNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "WallNearColor")), (R.static_value("RDRoad", "WallFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "WallFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
			R.call_member(c, "RenderSideWall", [v_i, 0, 1, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
			R.call_member(c, "RenderSideWall", [v_i, 4, 5, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntity")).fields.get("m_MC")])
			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadSideNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideNearColor")), (R.static_value("RDRoad", "RoadSideFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadSideFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
			R.call_member(c, "RenderGround", [v_i, 1, 2, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
			R.call_member(c, "RenderGround", [v_i, 3, 4, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
			R.call_static("RGBA", "Lerp", [(R.static_value("RDRoad", "RoadNearColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadNearColor")), (R.static_value("RDRoad", "RoadFarColorOff") if R.truth(v_bOffColor) else R.static_value("RDRoad", "RoadFarColor")), v_fDistanceRatio, (c).fields.get("m_RenderColor")])
			(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
			R.call_member(c, "RenderGround", [v_i, 2, 3, R.static_value("RDRoad", "Layer_Highway"), v_camera, ((c).fields.get("m_SliceEntityGround")).fields.get("m_MC")])
			v_i = R.signed32(v_i + 1)
	return null

static func f_RenderGround(c: Variant, a: Array) -> Variant:
	var v_positions3D: Variant = null
	var v_fFogRatio: Variant = NAN
	var v_positions1: Variant = null
	var v_positions2: Variant = null
	var v_iIndexZ: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iIndexX1: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iIndexX2: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iLayer: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_camera: Variant = R.coerce((a[4] if a.size() > 4 else null), "RDCamera")
	var v_mc: Variant = R.coerce((a[5] if a.size() > 5 else null), "MovieClip")
	v_positions3D = R.coerce(null, "Array")
	v_fFogRatio = float(NAN)
	if R.truth((float((v_camera).fields.get("m_fFogDistance")) < float((v_camera).fields.get("m_fMaxViewDistance")))):
		pass
		v_positions3D = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), v_iLayer), v_iIndexZ), "Array")
		v_fFogRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (R.num(R.get_value(R.get_value(v_positions3D, 0), "Z")) - float((float((v_camera).fields.get("m_fFogDistance")) - float(R.static_value("RDRoad", "RenderStepSize"))))), R.static_value("RDRoad", "RenderStepSize")), 0, 1]), "Number")
		R.call_static("RGBA", "Lerp", [(c).fields.get("m_RenderColor"), R.static_value("RDRoad", "FogColor"), v_fFogRatio, (c).fields.get("m_RenderColor")])
		(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
	v_positions1 = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), v_iLayer), v_iIndexZ), "Array")
	v_positions2 = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), v_iLayer), (float(v_iIndexZ) + float(1))), "Array")
	(c).fields["m_vRenderVec2D1"] = R.coerce(R.get_value(v_positions1, v_iIndexX1), "DTVector2D")
	(c).fields["m_vRenderVec2D2"] = R.coerce(R.get_value(v_positions2, v_iIndexX1), "DTVector2D")
	(c).fields["m_vRenderVec2D3"] = R.coerce(R.get_value(v_positions1, v_iIndexX2), "DTVector2D")
	(c).fields["m_vRenderVec2D4"] = R.coerce(R.get_value(v_positions2, v_iIndexX2), "DTVector2D")
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "beginFill"), [(c).fields.get("m_iRenderColor"), 1])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "moveTo"), [((c).fields.get("m_vRenderVec2D1")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D1")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D2")).fields.get("X"), ((c).fields.get("m_vRenderVec2D2")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D4")).fields.get("X"), ((c).fields.get("m_vRenderVec2D4")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D3")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D3")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "endFill"), [])
	return null

static func f_RenderSideWall(c: Variant, a: Array) -> Variant:
	var v_positions3D: Variant = null
	var v_fFogRatio: Variant = NAN
	var v_positions1: Variant = null
	var v_positions2: Variant = null
	var v_iIndexZ: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iIndexX1: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iIndexX2: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iLayer: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_camera: Variant = R.coerce((a[4] if a.size() > 4 else null), "RDCamera")
	var v_mc: Variant = R.coerce((a[5] if a.size() > 5 else null), "MovieClip")
	v_positions3D = R.coerce(null, "Array")
	v_fFogRatio = float(NAN)
	if R.truth((float((v_camera).fields.get("m_fFogDistance")) < float((v_camera).fields.get("m_fMaxViewDistance")))):
		pass
		v_positions3D = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), v_iLayer), v_iIndexZ), "Array")
		v_fFogRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (R.num(R.get_value(R.get_value(v_positions3D, 0), "Z")) - float((float((v_camera).fields.get("m_fFogDistance")) - float(R.static_value("RDRoad", "RenderStepSize"))))), R.static_value("RDRoad", "RenderStepSize")), 0, 1]), "Number")
		R.call_static("RGBA", "Lerp", [(c).fields.get("m_RenderColor"), R.static_value("RDRoad", "FogColor"), v_fFogRatio, (c).fields.get("m_RenderColor")])
		(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
	v_positions1 = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), v_iLayer), v_iIndexZ), "Array")
	v_positions2 = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), v_iLayer), (float(v_iIndexZ) + float(1))), "Array")
	if R.truth((float(v_iIndexX1) < float(2))):
		pass
		(c).fields["m_vRenderVec2D1"] = R.coerce(R.get_value(v_positions1, v_iIndexX1), "DTVector2D")
		(c).fields["m_vRenderVec2D2"] = R.coerce(R.get_value(v_positions2, v_iIndexX1), "DTVector2D")
		(c).fields["m_vRenderVec2D3"] = R.coerce(R.get_value(v_positions1, v_iIndexX2), "DTVector2D")
		(c).fields["m_vRenderVec2D4"] = R.coerce(R.get_value(v_positions2, v_iIndexX2), "DTVector2D")
	else:
		pass
		(c).fields["m_vRenderVec2D1"] = R.coerce(R.get_value(v_positions1, v_iIndexX2), "DTVector2D")
		(c).fields["m_vRenderVec2D2"] = R.coerce(R.get_value(v_positions2, v_iIndexX2), "DTVector2D")
		(c).fields["m_vRenderVec2D3"] = R.coerce(R.get_value(v_positions1, v_iIndexX1), "DTVector2D")
		(c).fields["m_vRenderVec2D4"] = R.coerce(R.get_value(v_positions2, v_iIndexX1), "DTVector2D")
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "beginFill"), [(c).fields.get("m_iRenderColor"), 1])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "moveTo"), [((c).fields.get("m_vRenderVec2D1")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D1")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D2")).fields.get("X"), ((c).fields.get("m_vRenderVec2D2")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D4")).fields.get("X"), ((c).fields.get("m_vRenderVec2D4")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D3")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D3")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "endFill"), [])
	return null

static func f_RenderFrontWall(c: Variant, a: Array) -> Variant:
	var v_positions3D: Variant = null
	var v_fFogRatio: Variant = NAN
	var v_positions1: Variant = null
	var v_iIndexZ: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iIndex1: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iIndex2: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iIndex3: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_iIndex4: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_iLayer: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_camera: Variant = R.coerce((a[6] if a.size() > 6 else null), "RDCamera")
	var v_mc: Variant = R.coerce((a[7] if a.size() > 7 else null), "MovieClip")
	v_positions3D = R.coerce(null, "Array")
	v_fFogRatio = float(NAN)
	if R.truth((float((v_camera).fields.get("m_fFogDistance")) < float((v_camera).fields.get("m_fMaxViewDistance")))):
		pass
		v_positions3D = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), v_iLayer), v_iIndexZ), "Array")
		v_fFogRatio = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (R.num(R.get_value(R.get_value(v_positions3D, 0), "Z")) - float((float((v_camera).fields.get("m_fFogDistance")) - float(R.static_value("RDRoad", "RenderStepSize"))))), R.static_value("RDRoad", "RenderStepSize")), 0, 1]), "Number")
		R.call_static("RGBA", "Lerp", [(c).fields.get("m_RenderColor"), R.static_value("RDRoad", "FogColor"), v_fFogRatio, (c).fields.get("m_RenderColor")])
		(c).fields["m_iRenderColor"] = R.coerce(R.call_member((c).fields.get("m_RenderColor"), "ToInteger", []), "int")
	v_positions1 = R.coerce(R.get_value(R.get_value((c).fields.get("m_Rendered2DVectors"), v_iLayer), v_iIndexZ), "Array")
	(c).fields["m_vRenderVec2D1"] = R.coerce(R.get_value(v_positions1, v_iIndex1), "DTVector2D")
	(c).fields["m_vRenderVec2D2"] = R.coerce(R.get_value(v_positions1, v_iIndex2), "DTVector2D")
	(c).fields["m_vRenderVec2D3"] = R.coerce(R.get_value(v_positions1, v_iIndex3), "DTVector2D")
	(c).fields["m_vRenderVec2D4"] = R.coerce(R.get_value(v_positions1, v_iIndex4), "DTVector2D")
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "beginFill"), [(c).fields.get("m_iRenderColor"), 1])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "moveTo"), [((c).fields.get("m_vRenderVec2D1")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D1")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D2")).fields.get("X"), ((c).fields.get("m_vRenderVec2D2")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D4")).fields.get("X"), ((c).fields.get("m_vRenderVec2D4")).fields.get("Y")])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "lineTo"), [((c).fields.get("m_vRenderVec2D3")).fields.get("X"), (float(((c).fields.get("m_vRenderVec2D3")).fields.get("Y")) + float(1))])
	R.invoke(R.get_value(R.get_value(v_mc, "graphics"), "endFill"), [])
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return false
	return null

static func f_TestBulletHit(c: Variant, a: Array) -> Variant:
	var v_bHit: Variant = false
	var v_bHitWall: Variant = false
	var v_effectClasses: Variant = null
	var v_effectSounds: Variant = null
	var v_positions3D1: Variant = null
	var v_positions3D2: Variant = null
	var v_fPerlinX: Variant = NAN
	var v_fPerlinX1: Variant = NAN
	var v_fPerlinX2: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_fPerlinY1: Variant = NAN
	var v_fPerlinY2: Variant = NAN
	var v_fHalfWall: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPosZ1: Variant = NAN
	var v_fPosZ2: Variant = NAN
	var v_fWallPos: Variant = NAN
	var v_iType: Variant = 0
	var v_iPreviousType: Variant = 0
	var v_bHasFrontWall: Variant = false
	var v_effectClass: Variant = null
	var v_impactEffect: Variant = null
	var v_effectSound: Variant = null
	var v_iMaterial: Variant = 0
	var v_camera: Variant = null
	var v_gameplayMode: Variant = null
	var v_fAxisAngle: Variant = NAN
	var v_fAngle: Variant = NAN
	var v_i: Variant = 0
	var v_bulletInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDBulletInfo")
	var v_weapon: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDWeapon")
	v_bHit = false
	v_bHitWall = false
	v_effectClasses = R.coerce(null, "Array")
	v_effectSounds = R.coerce(null, "Array")
	v_positions3D1 = R.coerce(null, "Array")
	v_positions3D2 = R.coerce(null, "Array")
	v_fPerlinX = float(NAN)
	v_fPerlinX1 = float(NAN)
	v_fPerlinX2 = float(NAN)
	v_fPerlinY = float(NAN)
	v_fPerlinY1 = float(NAN)
	v_fPerlinY2 = float(NAN)
	v_fHalfWall = float(NAN)
	v_fPosZ = float(NAN)
	v_fPosZ1 = float(NAN)
	v_fPosZ2 = float(NAN)
	v_fWallPos = float(NAN)
	v_iType = R.coerce(0, "int")
	v_iPreviousType = R.coerce(0, "int")
	v_bHasFrontWall = false
	v_effectClass = R.coerce(null, "Class")
	v_impactEffect = R.coerce(null, "RDImpactEffect")
	v_effectSound = R.coerce(null, "DTSpacialSound")
	v_iMaterial = R.coerce(R.static_value("RDRoad", "Material_Pavement"), "int")
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	v_gameplayMode = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	((c).fields.get("m_vBulletPos")).fields["X"] = float((v_bulletInfo).fields.get("m_fPosX"))
	((c).fields.get("m_vBulletPos")).fields["Y"] = float((v_bulletInfo).fields.get("m_fPosY"))
	R.call_member(v_camera, "Unproject2DToDir3D", [(c).fields.get("m_vBulletPos"), (c).fields.get("m_vCamDir")])
	R.invoke(R.get_value((c).fields.get("m_mRot"), "identity"), [])
	R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [((v_camera).fields.get("m_vRotation")).fields.get("Y"), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
	v_fAxisAngle = float((float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)))
	R.set_value((c).fields.get("m_vAxis"), "z", cos(float(v_fAxisAngle)), "=")
	v_fAngle = float((float(randf()) * R.num(R.call_member(v_weapon, "GetBulletSpreadAngle", []))))
	R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [v_fAngle, (c).fields.get("m_vAxis")])
	R.set_value((c).fields.get("m_vTempDir"), "x", ((c).fields.get("m_vCamDir")).fields.get("X"), "=")
	R.set_value((c).fields.get("m_vTempDir"), "y", ((c).fields.get("m_vCamDir")).fields.get("Y"), "=")
	R.set_value((c).fields.get("m_vTempDir"), "z", ((c).fields.get("m_vCamDir")).fields.get("Z"), "=")
	(c).fields["m_vTempDir"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_mRot"), "transformVector"), [(c).fields.get("m_vTempDir")]), "Vector3D")
	((c).fields.get("m_vCamDir")).fields["X"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "x"), "Number")
	((c).fields.get("m_vCamDir")).fields["Y"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "y"), "Number")
	((c).fields.get("m_vCamDir")).fields["Z"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "z"), "Number")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(4))):
		pass
		if R.truth(R.binary(">", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
			pass
			v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_iPreviousType = R.coerce((c).fields.get("m_iLastSliceType"), "int")
			if R.truth((float(v_i) > float(0))):
				pass
				v_iPreviousType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_i) - float(1))), "int"), "int")
			v_bHasFrontWall = ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))) and (float(v_iPreviousType) != float(R.static_value("RDRoad", "SliceType_Alleyway"))))
			if R.truth(v_bHasFrontWall):
				pass
				v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Alleyway")), v_i), R.klass("Array")), "Array")
				v_fPosZ = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 5), "Z")), "Number")
				v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), "Number")
				v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), "Number")
				R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "AlleywayPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "FarWallPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "AlleywayPosX"))), v_fPerlinY, v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX) + float(R.static_value("RDRoad", "FarWallPosX"))), v_fPerlinY, v_fPosZ])
				v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
				if R.truth(v_bHitWall):
					pass
					v_bHit = true
					break
				R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "FarWallPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "AlleywayPosX"))), (float(v_fPerlinY) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "FarWallPosX"))), v_fPerlinY, v_fPosZ])
				R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX) - float(R.static_value("RDRoad", "AlleywayPosX"))), v_fPerlinY, v_fPosZ])
				v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
				if R.truth(v_bHitWall):
					pass
					v_bHit = true
					break
			v_positions3D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), (R.static_value("RDRoad", "Layer_Highway") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "Layer_Main"))), v_i), R.klass("Array")), "Array")
			v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), (R.static_value("RDRoad", "Layer_Highway") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "Layer_Main"))), (float(v_i) + float(1))), R.klass("Array")), "Array")
			v_fWallPos = R.coerce((R.static_value("RDRoad", "AlleywayPosX") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))) else (R.static_value("RDRoad", "SideRoadPosX") if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))) else R.static_value("RDRoad", "FarWallPosX"))), "Number")
			v_fPosZ1 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D1, 0), "Z")), "Number")
			v_fPosZ2 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 0), "Z")), "Number")
			v_fPerlinX1 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ1]), "Number")
			v_fPerlinX2 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ2]), "Number")
			v_fPerlinY1 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ1]), "Number")
			v_fPerlinY2 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ2]), "Number")
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
		else:
			pass
			v_positions3D1 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), v_i), R.klass("Array")), "Array")
			v_positions3D2 = R.coerce(R.binary("as", R.get_value(R.get_value((c).fields.get("m_Rendered3DVectors"), R.static_value("RDRoad", "Layer_Highway")), (float(v_i) + float(1))), R.klass("Array")), "Array")
			v_fWallPos = float(R.static_value("RDRoad", "SideRoadPosX"))
			v_fPosZ1 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D1, 0), "Z")), "Number")
			v_fPosZ2 = R.coerce(R.binary("+", ((v_camera).fields.get("m_vLocation")).fields.get("Z"), R.get_value(R.get_value(v_positions3D2, 0), "Z")), "Number")
			v_fPerlinX1 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ1]), "Number")
			v_fPerlinX2 = R.coerce(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ2]), "Number")
			v_fPerlinY1 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ1]), "Number")
			v_fPerlinY2 = R.coerce(R.call_static("RDWorld", "GetPerlinY", [v_fPosZ2]), "Number")
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), (float(v_fPerlinY1) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), (float(v_fPerlinY2) + float(R.static_value("RDRoad", "WallHeight"))), v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
			R.call_member((c).fields.get("m_vQuadPos1"), "SetValues", [(float(v_fPerlinX2) - float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos2"), "SetValues", [(float(v_fPerlinX2) + float(v_fWallPos)), v_fPerlinY2, v_fPosZ2])
			R.call_member((c).fields.get("m_vQuadPos3"), "SetValues", [(float(v_fPerlinX1) - float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			R.call_member((c).fields.get("m_vQuadPos4"), "SetValues", [(float(v_fPerlinX1) + float(v_fWallPos)), v_fPerlinY1, v_fPosZ1])
			v_bHitWall = R.coerce(R.call_static("Maths", "RayQuadIntersection", [(v_camera).fields.get("m_vLocation"), (c).fields.get("m_vCamDir"), (c).fields.get("m_vQuadPos1"), (c).fields.get("m_vQuadPos2"), (c).fields.get("m_vQuadPos3"), (c).fields.get("m_vQuadPos4"), (c).fields.get("m_vHitLocation")]), "Boolean")
			if R.truth(v_bHitWall):
				pass
				v_bHit = true
				break
		v_i = R.signed32(v_i + 1)
	if R.truth(v_bHit):
		pass
		v_iMaterial = R.coerce(R.call_member(c, "GetGroundMaterialAt", [(c).fields.get("m_vHitLocation")]), "int")
		if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Pavement")))):
			pass
			v_effectClasses = R.coerce((c).fields.get("m_PavementHitEffects"), "Array")
			v_effectSounds = R.coerce((c).fields.get("m_PavementHitSounds"), "Array")
		else:
			pass
			if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Concrete")))):
				pass
				v_effectClasses = R.coerce(((c).fields.get("m_ConcreteWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_ConcreteHitEffects")), "Array")
				v_effectSounds = R.coerce((c).fields.get("m_ConcreteHitSounds"), "Array")
			else:
				pass
				if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Grass")))):
					pass
					v_effectClasses = R.coerce(((c).fields.get("m_GrassWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_GrassHitEffects")), "Array")
					v_effectSounds = R.coerce((c).fields.get("m_GrassHitSounds"), "Array")
				else:
					pass
					if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Dirt")))):
						pass
						v_effectClasses = R.coerce((c).fields.get("m_DirtHitEffects"), "Array")
						v_effectSounds = R.coerce((c).fields.get("m_DirtHitSounds"), "Array")
					else:
						pass
						if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Snow")))):
							pass
							v_effectClasses = R.coerce(((c).fields.get("m_SnowWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_SnowHitEffects")), "Array")
							v_effectSounds = R.coerce((c).fields.get("m_SnowHitSounds"), "Array")
						else:
							pass
							if R.truth((float(v_iMaterial) == float(R.static_value("RDRoad", "Material_Lava")))):
								pass
								v_effectClasses = R.coerce(((c).fields.get("m_LavaWallHitEffects") if R.truth(v_bHitWall) else (c).fields.get("m_LavaHitEffects")), "Array")
								v_effectSounds = R.coerce((c).fields.get("m_LavaHitSounds"), "Array")
		if R.truth((R.truth(v_effectClasses) and R.truth(v_effectSounds))):
			pass
			v_effectClass = R.coerce(R.get_value(v_effectClasses, R.call_static("Maths", "RandomInt", [R.get_value(v_effectClasses, "length")])), "Class")
			v_impactEffect = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDImpactEffect")]), R.klass("RDImpactEffect")), "RDImpactEffect")
			R.call_member(v_impactEffect, "Init", [v_effectClass])
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_impactEffect, ((c).fields.get("m_vHitLocation")).fields.get("X"), ((c).fields.get("m_vHitLocation")).fields.get("Y"), ((c).fields.get("m_vHitLocation")).fields.get("Z")])
			v_effectSound = R.coerce(R.binary("as", R.get_value(v_effectSounds, R.call_static("Maths", "RandomInt", [R.get_value(v_effectSounds, "length")])), R.klass("DTSpacialSound")), "DTSpacialSound")
			R.call_member(v_impactEffect, "PlaySoundOnActor", [v_effectSound])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_iPropertyDamage"] = R.coerce(R.binary("+", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iPropertyDamage"), R.binary("+", c.fields.get("m_iPropertyValue"), R.binary("+", R.unary("-", 1), R.call_static("Maths", "RandomInt", [3])))), "int")
	return null

static func f_SetRoadSlice(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		(c).fields["m_iLastSliceType"] = R.coerce(v_iType, "int")
	while R.truth(R.binary(">=", v_iIndex, R.get_value((c).fields.get("m_RoadSlices"), "length"))):
		pass
		R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "push"), [0])
	R.set_value((c).fields.get("m_RoadSlices"), v_iIndex, v_iType, "=")
	return null

static func f_SetLavaSlice(c: Variant, a: Array) -> Variant:
	var v_bLava: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_LavaRoadSlices"), "length"), 0)):
		pass
		(c).fields["m_bLastSliceLava"] = v_bLava
	while R.truth(R.binary(">=", v_iIndex, R.get_value((c).fields.get("m_LavaRoadSlices"), "length"))):
		pass
		R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "push"), [false])
	R.set_value((c).fields.get("m_LavaRoadSlices"), v_iIndex, v_bLava, "=")
	return null

static func f_AddBackwardRoadSlice(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "unshift"), [v_iType])
	return null

static func f_ClearBackwardAreaRoadSlices(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "splice"), [0])
	return null

static func f_ClearForwardAreaRoadSlices(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_ForwardAreaRoadSlices"), "splice"), [0])
	return null

static func f_UpdateRoadSlice(c: Variant, a: Array) -> Variant:
	var v_sliceEntity: Variant = null
	var v_iSlice: Variant = 0
	var v_bLava: Variant = false
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_sliceEntity = R.coerce(null, "RDRoadSlice")
	v_iSlice = R.coerce(0, "int")
	v_bLava = false
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Pattern")))):
		pass
		return null
	v_fCamPos = float(maxf(float(((v_camera).fields.get("m_vLocation")).fields.get("Z")), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeChopperRescue"))):
		pass
		while R.truth((float(v_iRoadSlice) > float((c).fields.get("m_iCurrentRoadSlice")))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "push"), [v_iSlice])
			v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), 0))
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "push"), [v_bLava])
			R.set_value(c, "m_iCurrentRoadSlice", 1, "+=")
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), 0), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "push"), [v_sliceEntity])
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), 0), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "push"), [v_sliceEntity])
		while R.truth((float(v_iRoadSlice) < float((c).fields.get("m_iCurrentRoadSlice")))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1))), "int"), "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "unshift"), [v_iSlice])
			v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), (R.num(R.get_value((c).fields.get("m_LavaRoadSlices"), "length")) - float(1))))
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [(R.num(R.get_value((c).fields.get("m_LavaRoadSlices"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "unshift"), [v_bLava])
			R.set_value(c, "m_iCurrentRoadSlice", 1, "-=")
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), (R.num(R.get_value((c).fields.get("m_RoadSliceEntities"), "length")) - float(1))), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSliceEntities"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "unshift"), [v_sliceEntity])
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), (R.num(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "length")) - float(1))), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "unshift"), [v_sliceEntity])
	else:
		pass
		while R.truth((float(v_iRoadSlice) > float((c).fields.get("m_iCurrentRoadSlice")))):
			pass
			(c).fields["m_iLastSliceType"] = R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int")
			v_iSlice = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [0, 1])
			(c).fields["m_bLastSliceLava"] = R.coerce(R.get_value((c).fields.get("m_LavaRoadSlices"), 0), "Boolean")
			v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), 0))
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [0, 1])
			if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Area")))):
				pass
				R.invoke(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "push"), [v_iSlice])
				if R.truth(R.binary(">", R.get_value((c).fields.get("m_ForwardAreaRoadSlices"), "length"), 0)):
					pass
					R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "push"), [R.get_value((c).fields.get("m_ForwardAreaRoadSlices"), 0)])
					R.invoke(R.get_value((c).fields.get("m_ForwardAreaRoadSlices"), "splice"), [0, 1])
			R.set_value(c, "m_iCurrentRoadSlice", 1, "+=")
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), 0), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "push"), [v_sliceEntity])
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), 0), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [0, 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "push"), [v_sliceEntity])
		while R.truth((float(v_iRoadSlice) < float((c).fields.get("m_iCurrentRoadSlice")))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1))), "int"), "int")
			R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSlices"), "length")) - float(1)), 1])
			v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), (R.num(R.get_value((c).fields.get("m_LavaRoadSlices"), "length")) - float(1))))
			R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "splice"), [(R.num(R.get_value((c).fields.get("m_LavaRoadSlices"), "length")) - float(1)), 1])
			if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDRoad", "Mode_Area")))):
				pass
				R.invoke(R.get_value((c).fields.get("m_ForwardAreaRoadSlices"), "unshift"), [v_iSlice])
				if R.truth(R.binary(">", R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "length"), 0)):
					pass
					R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "unshift"), [R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), (R.num(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "length")) - float(1)))])
					R.invoke(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "splice"), [(R.num(R.get_value((c).fields.get("m_BackwardAreaRoadSlices"), "length")) - float(1)), 1])
			else:
				pass
				R.invoke(R.get_value((c).fields.get("m_RoadSlices"), "unshift"), [(c).fields.get("m_iLastSliceType")])
				R.invoke(R.get_value((c).fields.get("m_LavaRoadSlices"), "unshift"), [(c).fields.get("m_bLastSliceLava")])
			R.set_value(c, "m_iCurrentRoadSlice", 1, "-=")
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), (R.num(R.get_value((c).fields.get("m_RoadSliceEntities"), "length")) - float(1))), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSliceEntities"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceEntities"), "unshift"), [v_sliceEntity])
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), (R.num(R.get_value((c).fields.get("m_RoadSliceEntities"), "length")) - float(1))), "RDRoadSlice")
			((v_sliceEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDRoad", "NbRenderSteps")) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))), "Number")
			R.call_member(v_sliceEntity, "UpdateDepthPosition", [])
			R.invoke(R.get_value(R.get_value((v_sliceEntity).fields.get("m_MC"), "graphics"), "clear"), [])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "length")) - float(1)), 1])
			R.invoke(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), "unshift"), [v_sliceEntity])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_sliceEntity: Variant = null
	var v_i: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_sliceEntity = R.coerce(null, "RDRoadSlice")
	v_i = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDRoad"), "Update"), [v_fDeltaTime])
	if R.truth((c).fields.get("m_bAddSliceEntities")):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_RoadSliceEntities"), "length"))):
			pass
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceEntities"), v_i), "RDRoadSlice")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_sliceEntity, ((v_sliceEntity).fields.get("m_vLocation")).fields.get("X"), ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Y"), ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z")])
			v_sliceEntity = R.coerce(R.get_value((c).fields.get("m_RoadSliceGroundEntities"), v_i), "RDRoadSlice")
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_sliceEntity, ((v_sliceEntity).fields.get("m_vLocation")).fields.get("X"), ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Y"), ((v_sliceEntity).fields.get("m_vLocation")).fields.get("Z")])
			v_i = R.signed32(v_i + 1)
		(c).fields["m_bAddSliceEntities"] = false
	return null

static func f_GetSideLimit(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_iNextType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	v_iType = R.coerce(0, "int")
	v_iNextType = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_iRoadSlice = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "RoadLimit")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_iNextType = R.coerce(R.static_value("RDRoad", "SliceType_None"), "int")
	v_fCamPos = float(maxf(float((float(((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(0.5))), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iNextType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 1), "int"), "int")
	if R.truth(((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))) or (float(v_iNextType) == float(R.static_value("RDRoad", "SliceType_Alleyway"))))):
		pass
		return R.static_value("RDRoad", "AlleywayLimit")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return R.static_value("RDRoad", "RoadLimit")
	return R.static_value("RDRoad", "StreetLimit")
	return null

static func f_GetRoadLimit(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return R.static_value("RDRoad", "AlleywayPosX")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	return R.static_value("RDRoad", "FarWallPosX")
	return null

static func f_GetRoadLimitAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iType = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_iRoadSlice = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return R.static_value("RDRoad", "AlleywayPosX")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return R.static_value("RDRoad", "SideRoadPosX")
	return R.static_value("RDRoad", "FarWallPosX")
	return null

static func f_GetRoadAreaAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iType = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_iRoadSlice = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return (float(R.static_value("RDRoad", "SideRoadPosX")) - float(1))
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return (float(R.static_value("RDRoad", "AlleywayLimit")) - float(1))
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
		pass
		return (float(R.static_value("RDRoad", "ParkingLimit")) - float(1))
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return (float(R.static_value("RDRoad", "RoadLimit")) - float(1))
	return (float(R.static_value("RDRoad", "SideWalkPosX")) - float(1))
	return null

static func f_CanSideScrape(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return true
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
		pass
		return true
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Highway")))):
		pass
		return true
	return false
	return null

static func f_GetNearbySlice(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(0, "int")
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_RoadSlices"), "length"), 3)):
		pass
		return R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 2), "int")
	return R.static_value("RDRoad", "SliceType_None")
	return null

static func f_GetRoadSliceType(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SliceType_Highway")
	return R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int")
	return null

static func f_GetRoadSliceTypeAt(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_RoadSlices"), "length"), 0)):
		pass
		return R.static_value("RDRoad", "SliceType_Highway")
	v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), 0), "int"), "int")
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_iType = R.coerce(R.coerce(R.get_value((c).fields.get("m_RoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))), "int"), "int")
	return v_iType
	return null

static func f_IsLavaAt(c: Variant, a: Array) -> Variant:
	var v_bLava: Variant = false
	var v_fCamPos: Variant = NAN
	var v_iRoadSlice: Variant = 0
	var v_fPosZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_LavaRoadSlices"), "length"), 0)):
		pass
		return false
	v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), 0))
	v_fCamPos = float(maxf(float(v_fPosZ), float(0)))
	v_iRoadSlice = R.coerce(floorf(float(R.binary("/", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))), "int")
	if R.truth((float(v_iRoadSlice) != float((c).fields.get("m_iCurrentRoadSlice")))):
		pass
		v_bLava = R.truth(R.get_value((c).fields.get("m_LavaRoadSlices"), (float(v_iRoadSlice) - float((c).fields.get("m_iCurrentRoadSlice")))))
	return v_bLava
	return null

static func f_GetGroundMaterialAt(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = null
	var v_iSlice: Variant = 0
	var v_bLava: Variant = false
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_camera = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "RDCamera")
	v_iSlice = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [(v_vPos).fields.get("Z")]), "int")
	v_bLava = R.coerce(R.call_member(c, "IsLavaAt", [(v_vPos).fields.get("Z")]), "Boolean")
	v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(v_vPos).fields.get("Z")]), "Number")
	v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(v_vPos).fields.get("Z")]), "Number")
	if R.truth((float((float((v_vPos).fields.get("Y")) - float(v_fPerlinY))) > float(0.01))):
		pass
		if R.truth((v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))):
			pass
			return R.static_value("RDRoad", "Material_Lava")
		if R.truth((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Park"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
			pass
			return R.static_value("RDRoad", "Material_Grass")
		if R.truth(((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Snow"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Ice")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
			pass
			return R.static_value("RDRoad", "Material_Snow")
		return R.static_value("RDRoad", "Material_Concrete")
	if R.truth((v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))):
		pass
		return R.static_value("RDRoad", "Material_Lava")
	if R.truth((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Town"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "StreetPosX"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Highway"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "RoadPosX")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Concrete")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway"))))):
		pass
		return R.static_value("RDRoad", "Material_Concrete")
	if R.truth(((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Snow"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Ice")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX")))))):
		pass
		return R.static_value("RDRoad", "Material_Snow")
	if R.truth(((((((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary("<=", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary("<", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Dirt")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Mud")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Sand"))))):
		pass
		return R.static_value("RDRoad", "Material_Dirt")
	if R.truth((((((((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Park"))) or (float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Cemetery")))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float((float((v_vPos).fields.get("X")) - float(v_fPerlinX))) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", (float((v_vPos).fields.get("X")) - float(v_fPerlinX)), R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [(float((v_vPos).fields.get("X")) - float(v_fPerlinX))]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return R.static_value("RDRoad", "Material_Grass")
	return R.static_value("RDRoad", "Material_Pavement")
	return null

static func f_SetMode(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iMode"] = R.coerce(v_iMode, "int")
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	(c).fields["m_iCurrentRoadSlice"] = R.coerce(0, "int")
	R.call_member(c, "ClearBackwardAreaRoadSlices", [])
	R.call_member(c, "ClearForwardAreaRoadSlices", [])
	return null

static func f_IsOnGrass(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	if R.truth((((((((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Park"))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_ForestPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return true
	return false
	return null

static func f_IsOnRoughSurface(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_bLava: Variant = false
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	v_bLava = R.coerce(R.call_member(c, "IsLavaAt", [v_fZ]), "Boolean")
	if R.truth((((((((((((((((((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Park"))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_CrossingDirtRoad")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_ForestPath")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_Mud")))) or (float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_GrassAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_DirtAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or (v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return true
	return false
	return null

static func f_IsOnLava(c: Variant, a: Array) -> Variant:
	var v_bLava: Variant = false
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_bLava = R.coerce(R.call_member(c, "IsLavaAt", [v_fZ]), "Boolean")
	if R.truth((v_bLava and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))):
		pass
		return true
	return false
	return null

static func f_IsOnSnow(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	if R.truth((((((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Snow"))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow"))) and (float(v_fX) > float(R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement"))) and R.binary("<", v_fX, R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndRoad"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))) or ((float(v_iType) == float(R.static_value("RDRoad", "SliceType_SnowAndDirtPath"))) and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX"))))):
		pass
		return true
	return false
	return null

static func f_IsOnMud(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Mud")))):
		pass
		return true
	return false
	return null

static func f_IsOnIce(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_iType = R.coerce(R.call_member(c, "GetRoadSliceTypeAt", [v_fZ]), "int")
	if R.truth((float(v_iType) == float(R.static_value("RDRoad", "SliceType_Ice")))):
		pass
		return true
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Mode_Normal", 0, "=")
	R.set_value(c, "Mode_Pattern", 1, "=")
	R.set_value(c, "Mode_Area", 2, "=")
	R.set_value(c, "SliceType_None", R.unary("-", 1), "=")
	R.set_value(c, "SliceType_Town", 0, "=")
	R.set_value(c, "SliceType_Park", 1, "=")
	R.set_value(c, "SliceType_Alleyway", 2, "=")
	R.set_value(c, "SliceType_CrossingStreet", 3, "=")
	R.set_value(c, "SliceType_PavementAndGrass", 4, "=")
	R.set_value(c, "SliceType_GrassAndPavement", 5, "=")
	R.set_value(c, "SliceType_Parking", 6, "=")
	R.set_value(c, "SliceType_Highway", 7, "=")
	R.set_value(c, "SliceType_Cemetery", 8, "=")
	R.set_value(c, "SliceType_CrossingDirtRoad", 9, "=")
	R.set_value(c, "SliceType_Dirt", 10, "=")
	R.set_value(c, "SliceType_Sand", 11, "=")
	R.set_value(c, "SliceType_Concrete", 12, "=")
	R.set_value(c, "SliceType_Snow", 13, "=")
	R.set_value(c, "SliceType_Ice", 14, "=")
	R.set_value(c, "SliceType_DirtAndGrass", 15, "=")
	R.set_value(c, "SliceType_GrassAndDirt", 16, "=")
	R.set_value(c, "SliceType_GrassAndRoad", 17, "=")
	R.set_value(c, "SliceType_DirtAndRoad", 18, "=")
	R.set_value(c, "SliceType_DirtAndPavement", 19, "=")
	R.set_value(c, "SliceType_PavementAndDirt", 20, "=")
	R.set_value(c, "SliceType_Mud", 21, "=")
	R.set_value(c, "SliceType_SnowAndRoad", 22, "=")
	R.set_value(c, "SliceType_SnowAndPavement", 23, "=")
	R.set_value(c, "SliceType_PavementAndSnow", 24, "=")
	R.set_value(c, "SliceType_SnowAndDirtPath", 25, "=")
	R.set_value(c, "SliceType_ForestPath", 26, "=")
	R.set_value(c, "Material_Pavement", 0, "=")
	R.set_value(c, "Material_Concrete", 1, "=")
	R.set_value(c, "Material_Grass", 2, "=")
	R.set_value(c, "Material_Dirt", 3, "=")
	R.set_value(c, "Material_Snow", 3, "=")
	R.set_value(c, "Material_Lava", 4, "=")
	R.set_value(c, "Layer_Main", 0, "=")
	R.set_value(c, "Layer_Alleyway", 1, "=")
	R.set_value(c, "Layer_Highway", 2, "=")
	R.set_value(c, "QuadType_Ground", 0, "=")
	R.set_value(c, "QuadType_SideWall", 1, "=")
	R.set_value(c, "QuadType_FrontWall", 2, "=")
	R.set_value(c, "RoadPosX", 7.5, "=")
	R.set_value(c, "SideRoadPosX", 10, "=")
	R.set_value(c, "BuildingPosX", 12, "=")
	R.set_value(c, "StreetPosX", 6, "=")
	R.set_value(c, "SideWalkPosX", 8, "=")
	R.set_value(c, "FarWallPosX", 25, "=")
	R.set_value(c, "AlleywayPosX", 4, "=")
	R.set_value(c, "WallHeight", 2, "=")
	R.set_value(c, "NearPos", 0.1, "=")
	R.set_value(c, "FarPos", 150, "=")
	R.set_value(c, "LaneHalfWidth", R.binary("/", R.static_value("RDRoad", "RoadPosX"), 3), "=")
	R.set_value(c, "Lane1PosX", R.binary("+", R.unary("-", R.static_value("RDRoad", "RoadPosX")), R.static_value("RDRoad", "LaneHalfWidth")), "=")
	R.set_value(c, "Lane2PosX", 0, "=")
	R.set_value(c, "Lane3PosX", (float(R.static_value("RDRoad", "RoadPosX")) - float(R.static_value("RDRoad", "LaneHalfWidth"))), "=")
	R.set_value(c, "RoadLimit", 9.1, "=")
	R.set_value(c, "StreetLimit", 17, "=")
	R.set_value(c, "AlleywayLimit", 3.1, "=")
	R.set_value(c, "ParkingLimit", 15, "=")
	R.set_value(c, "NbRenderSteps", 8, "=")
	R.set_value(c, "RenderStepSize", 18, "=")
	R.set_value(c, "WallNearColor", R.construct(R.klass("RGBA"), [118, 121, 125]), "=")
	R.set_value(c, "WallFarColor", R.construct(R.klass("RGBA"), [94, 96, 99]), "=")
	R.set_value(c, "WallNearColorOff", R.construct(R.klass("RGBA"), [108, 111, 115]), "=")
	R.set_value(c, "WallFarColorOff", R.construct(R.klass("RGBA"), [84, 86, 89]), "=")
	R.set_value(c, "StreetWallNearColor", R.construct(R.klass("RGBA"), [108, 111, 115]), "=")
	R.set_value(c, "StreetWallFarColor", R.construct(R.klass("RGBA"), [84, 86, 89]), "=")
	R.set_value(c, "StreetWallNearColorOff", R.construct(R.klass("RGBA"), [98, 101, 105]), "=")
	R.set_value(c, "StreetWallFarColorOff", R.construct(R.klass("RGBA"), [74, 76, 79]), "=")
	R.set_value(c, "AlleywayGroundNearColor", R.construct(R.klass("RGBA"), [85, 83, 72]), "=")
	R.set_value(c, "AlleywayGroundFarColor", R.construct(R.klass("RGBA"), [65, 73, 52]), "=")
	R.set_value(c, "AlleywayGroundNearColorOff", R.construct(R.klass("RGBA"), [75, 73, 62]), "=")
	R.set_value(c, "AlleywayGroundFarColorOff", R.construct(R.klass("RGBA"), [55, 53, 42]), "=")
	R.set_value(c, "HedgeNearColor", R.construct(R.klass("RGBA"), [58, 101, 65]), "=")
	R.set_value(c, "HedgeFarColor", R.construct(R.klass("RGBA"), [34, 76, 39]), "=")
	R.set_value(c, "HedgeNearColorOff", R.construct(R.klass("RGBA"), [48, 91, 55]), "=")
	R.set_value(c, "HedgeFarColorOff", R.construct(R.klass("RGBA"), [24, 66, 29]), "=")
	R.set_value(c, "RoadSideNearColor", R.construct(R.klass("RGBA"), [110, 107, 101]), "=")
	R.set_value(c, "RoadSideFarColor", R.construct(R.klass("RGBA"), [95, 91, 81]), "=")
	R.set_value(c, "RoadSideNearColorOff", R.construct(R.klass("RGBA"), [100, 97, 91]), "=")
	R.set_value(c, "RoadSideFarColorOff", R.construct(R.klass("RGBA"), [85, 81, 71]), "=")
	R.set_value(c, "RoadSideWalkNearColor", R.construct(R.klass("RGBA"), [130, 137, 131]), "=")
	R.set_value(c, "RoadSideWalkFarColor", R.construct(R.klass("RGBA"), [115, 111, 111]), "=")
	R.set_value(c, "RoadSideWalkNearColorOff", R.construct(R.klass("RGBA"), [140, 142, 141]), "=")
	R.set_value(c, "RoadSideWalkFarColorOff", R.construct(R.klass("RGBA"), [125, 121, 121]), "=")
	R.set_value(c, "RoadNearColor", R.construct(R.klass("RGBA"), [58, 57, 63]), "=")
	R.set_value(c, "RoadFarColor", R.construct(R.klass("RGBA"), [43, 42, 46]), "=")
	R.set_value(c, "RoadNearColorOff", R.construct(R.klass("RGBA"), [48, 47, 53]), "=")
	R.set_value(c, "RoadFarColorOff", R.construct(R.klass("RGBA"), [33, 32, 36]), "=")
	R.set_value(c, "FogColor", R.construct(R.klass("RGBA"), [180, 180, 180]), "=")
	R.set_value(c, "GrassNearColor", R.construct(R.klass("RGBA"), [57, 92, 54]), "=")
	R.set_value(c, "GrassFarColor", R.construct(R.klass("RGBA"), [47, 82, 44]), "=")
	R.set_value(c, "GrassNearColorOff", R.construct(R.klass("RGBA"), [47, 82, 44]), "=")
	R.set_value(c, "GrassFarColorOff", R.construct(R.klass("RGBA"), [37, 72, 34]), "=")
	R.set_value(c, "GrassPathNearColor", R.construct(R.klass("RGBA"), [62, 97, 59]), "=")
	R.set_value(c, "GrassPathFarColor", R.construct(R.klass("RGBA"), [52, 87, 49]), "=")
	R.set_value(c, "GrassPathNearColorOff", R.construct(R.klass("RGBA"), [52, 87, 49]), "=")
	R.set_value(c, "GrassPathFarColorOff", R.construct(R.klass("RGBA"), [42, 77, 39]), "=")
	R.set_value(c, "DirtNearColor", R.construct(R.klass("RGBA"), [146, 141, 116]), "=")
	R.set_value(c, "DirtFarColor", R.construct(R.klass("RGBA"), [136, 131, 106]), "=")
	R.set_value(c, "DirtNearColorOff", R.construct(R.klass("RGBA"), [136, 131, 106]), "=")
	R.set_value(c, "DirtFarColorOff", R.construct(R.klass("RGBA"), [126, 121, 96]), "=")
	R.set_value(c, "MudNearColor", R.construct(R.klass("RGBA"), [106, 101, 76]), "=")
	R.set_value(c, "MudFarColor", R.construct(R.klass("RGBA"), [96, 91, 66]), "=")
	R.set_value(c, "MudNearColorOff", R.construct(R.klass("RGBA"), [96, 91, 66]), "=")
	R.set_value(c, "MudFarColorOff", R.construct(R.klass("RGBA"), [86, 81, 56]), "=")
	R.set_value(c, "MudPathNearColor", R.construct(R.klass("RGBA"), [86, 81, 56]), "=")
	R.set_value(c, "MudPathFarColor", R.construct(R.klass("RGBA"), [76, 71, 46]), "=")
	R.set_value(c, "MudPathNearColorOff", R.construct(R.klass("RGBA"), [76, 71, 46]), "=")
	R.set_value(c, "MudPathFarColorOff", R.construct(R.klass("RGBA"), [66, 61, 36]), "=")
	R.set_value(c, "SandNearColor", R.construct(R.klass("RGBA"), [195, 195, 136]), "=")
	R.set_value(c, "SandFarColor", R.construct(R.klass("RGBA"), [185, 185, 126]), "=")
	R.set_value(c, "SandNearColorOff", R.construct(R.klass("RGBA"), [185, 185, 126]), "=")
	R.set_value(c, "SandFarColorOff", R.construct(R.klass("RGBA"), [175, 175, 116]), "=")
	R.set_value(c, "ConcreteNearColor", R.construct(R.klass("RGBA"), [154, 153, 148]), "=")
	R.set_value(c, "ConcreteFarColor", R.construct(R.klass("RGBA"), [144, 143, 138]), "=")
	R.set_value(c, "ConcreteNearColorOff", R.construct(R.klass("RGBA"), [144, 143, 138]), "=")
	R.set_value(c, "ConcreteFarColorOff", R.construct(R.klass("RGBA"), [134, 133, 128]), "=")
	R.set_value(c, "SnowNearColor", R.construct(R.klass("RGBA"), [236, 241, 255]), "=")
	R.set_value(c, "SnowFarColor", R.construct(R.klass("RGBA"), [226, 231, 245]), "=")
	R.set_value(c, "SnowNearColorOff", R.construct(R.klass("RGBA"), [226, 231, 245]), "=")
	R.set_value(c, "SnowFarColorOff", R.construct(R.klass("RGBA"), [216, 221, 235]), "=")
	R.set_value(c, "IceNearColor", R.construct(R.klass("RGBA"), [205, 218, 255]), "=")
	R.set_value(c, "IceFarColor", R.construct(R.klass("RGBA"), [195, 208, 245]), "=")
	R.set_value(c, "IceNearColorOff", R.construct(R.klass("RGBA"), [195, 208, 245]), "=")
	R.set_value(c, "IceFarColorOff", R.construct(R.klass("RGBA"), [185, 198, 235]), "=")
	R.set_value(c, "DirtPathNearColor", R.construct(R.klass("RGBA"), [136, 131, 106]), "=")
	R.set_value(c, "DirtPathFarColor", R.construct(R.klass("RGBA"), [126, 121, 96]), "=")
	R.set_value(c, "DirtPathNearColorOff", R.construct(R.klass("RGBA"), [126, 121, 96]), "=")
	R.set_value(c, "DirtPathFarColorOff", R.construct(R.klass("RGBA"), [116, 111, 86]), "=")
	R.set_value(c, "SandPathNearColor", R.construct(R.klass("RGBA"), [185, 185, 126]), "=")
	R.set_value(c, "SandPathFarColor", R.construct(R.klass("RGBA"), [175, 175, 116]), "=")
	R.set_value(c, "SandPathNearColorOff", R.construct(R.klass("RGBA"), [175, 175, 116]), "=")
	R.set_value(c, "SandPathFarColorOff", R.construct(R.klass("RGBA"), [165, 165, 106]), "=")
	R.set_value(c, "ConcretePathNearColor", R.construct(R.klass("RGBA"), [144, 143, 138]), "=")
	R.set_value(c, "ConcretePathFarColor", R.construct(R.klass("RGBA"), [134, 133, 128]), "=")
	R.set_value(c, "ConcretePathNearColorOff", R.construct(R.klass("RGBA"), [134, 133, 128]), "=")
	R.set_value(c, "ConcretePathFarColorOff", R.construct(R.klass("RGBA"), [124, 123, 118]), "=")
	R.set_value(c, "SnowPathNearColor", R.construct(R.klass("RGBA"), [226, 231, 245]), "=")
	R.set_value(c, "SnowPathFarColor", R.construct(R.klass("RGBA"), [216, 221, 235]), "=")
	R.set_value(c, "SnowPathNearColorOff", R.construct(R.klass("RGBA"), [216, 221, 235]), "=")
	R.set_value(c, "SnowPathFarColorOff", R.construct(R.klass("RGBA"), [206, 211, 225]), "=")
	R.set_value(c, "IcePathNearColor", R.construct(R.klass("RGBA"), [195, 208, 245]), "=")
	R.set_value(c, "IcePathFarColor", R.construct(R.klass("RGBA"), [185, 198, 235]), "=")
	R.set_value(c, "IcePathNearColorOff", R.construct(R.klass("RGBA"), [185, 198, 235]), "=")
	R.set_value(c, "IcePathFarColorOff", R.construct(R.klass("RGBA"), [175, 188, 225]), "=")
	R.set_value(c, "LavaNearColor", R.construct(R.klass("RGBA"), [195, 50, 50]), "=")
	R.set_value(c, "LavaFarColor", R.construct(R.klass("RGBA"), [185, 40, 50]), "=")
	R.set_value(c, "LavaNearColorOff", R.construct(R.klass("RGBA"), [185, 90, 50]), "=")
	R.set_value(c, "LavaFarColorOff", R.construct(R.klass("RGBA"), [175, 80, 50]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fRenderNearPosX"] = float(NAN)
	(c).fields["m_fRenderFarPosX"] = float(NAN)
	(c).fields["m_vRenderVec3D1"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRenderVec3D2"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRenderVec3D3"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRenderVec3D4"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRenderVec2D1"] = R.coerce(null, "DTVector2D")
	(c).fields["m_vRenderVec2D2"] = R.coerce(null, "DTVector2D")
	(c).fields["m_vRenderVec2D3"] = R.coerce(null, "DTVector2D")
	(c).fields["m_vRenderVec2D4"] = R.coerce(null, "DTVector2D")
	(c).fields["m_iRenderColor"] = R.coerce(0, "int")
	(c).fields["m_RenderColor"] = R.coerce(null, "RGBA")
	(c).fields["m_RoadSlices"] = R.coerce(null, "Array")
	(c).fields["m_LavaRoadSlices"] = R.coerce(null, "Array")
	(c).fields["m_RoadSliceEntities"] = R.coerce(null, "Array")
	(c).fields["m_RoadSliceGroundEntities"] = R.coerce(null, "Array")
	(c).fields["m_iCurrentRoadSlice"] = R.coerce(0, "int")
	(c).fields["m_Rendered3DVectors"] = R.coerce(null, "Array")
	(c).fields["m_Rendered2DVectors"] = R.coerce(null, "Array")
	(c).fields["m_RoadBulletPos"] = R.coerce(null, "DTVector3D")
	(c).fields["m_PavementHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_ConcreteHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_GrassHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_DirtHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_SnowHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_LavaHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_ConcreteWallHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_GrassWallHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_SnowWallHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_LavaWallHitEffects"] = R.coerce(null, "Array")
	(c).fields["m_PavementHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_ConcreteHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_GrassHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_DirtHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_SnowHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_LavaHitSounds"] = R.coerce(null, "Array")
	(c).fields["m_SliceEntity"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_SliceEntityGround"] = R.coerce(null, "RDRoadSlice")
	(c).fields["m_bAddSliceEntities"] = true
	(c).fields["m_iLastSliceType"] = R.coerce(0, "int")
	(c).fields["m_bLastSliceLava"] = false
	(c).fields["m_vBulletPos"] = R.coerce(null, "DTVector2D")
	(c).fields["m_vCamDir"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vQuadPos1"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vQuadPos2"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vQuadPos3"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vQuadPos4"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vHitLocation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_mRot"] = R.coerce(null, "Matrix3D")
	(c).fields["m_vAxis"] = R.coerce(null, "Vector3D")
	(c).fields["m_vTempDir"] = R.coerce(null, "Vector3D")
	(c).fields["m_iMode"] = R.coerce(0, "int")
	(c).fields["m_iAreaSliceIndex"] = R.coerce(0, "int")
	(c).fields["m_BackwardAreaRoadSlices"] = R.coerce(null, "Array")
	(c).fields["m_ForwardAreaRoadSlices"] = R.coerce(null, "Array")
	return null
