extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWorld(c: Variant, a: Array) -> Variant:
	var v_nodes: Variant = null
	var v_i: Variant = 0
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	v_nodes = R.coerce(null, "Array")
	(c).fields["m_EntityNodesPool"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_SpawnerInfosPool"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.super_ref(c, "RDWorld"), [])
	(c).fields["m_Game"] = R.coerce(v_theGame, "RDGame")
	(c).fields["m_Entities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_LayerBG"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	(c).fields["m_LayerSideBG"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	(c).fields["m_LayerRoad"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	(c).fields["m_LayerOverRoad"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	(c).fields["m_LayerDynamic"] = R.coerce(R.construct(R.klass("MovieClip"), []), "MovieClip")
	R.set_value((c).fields.get("m_LayerBG"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_LayerSideBG"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_LayerRoad"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_LayerOverRoad"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_LayerDynamic"), "mouseChildren", false, "=")
	R.set_value((c).fields.get("m_LayerBG"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_LayerSideBG"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_LayerRoad"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_LayerOverRoad"), "mouseEnabled", false, "=")
	R.set_value((c).fields.get("m_LayerDynamic"), "mouseEnabled", false, "=")
	(c).fields["m_SafeZones"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Garages"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_WeaponCrates"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_AmmoPoints"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Fences"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ZombieSpawners"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_BGBuildings"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_NavMesh"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDWorld", "NavMeshSteps")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDWorld", "NavMeshSteps")))):
		pass
		v_nodes = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDWorld", "NavMeshNodes")]), "Array")
		R.set_value((c).fields.get("m_NavMesh"), v_i, v_nodes, "=")
		v_i = R.signed32(v_i + 1)
	return null

static func f_CompareDepth(c: Variant, a: Array) -> Variant:
	var v_fPosA: Variant = NAN
	var v_fPosB: Variant = NAN
	var v_entityA: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_entityB: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	v_fPosA = float((v_entityA).fields.get("m_fDepthPosition"))
	v_fPosB = float((v_entityB).fields.get("m_fDepthPosition"))
	if R.truth((float(v_fPosA) == float(v_fPosB))):
		pass
		return (float((v_entityA).fields.get("m_iEntityIndex")) < float((v_entityB).fields.get("m_iEntityIndex")))
	return (float(v_fPosA) > float(v_fPosB))
	return null

static func f_EntityOverlapsInX(c: Variant, a: Array) -> Variant:
	var v_boundsA: Variant = null
	var v_boundsB: Variant = null
	var v_vLocationA: Variant = null
	var v_vLocationB: Variant = null
	var v_entityA: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_entityB: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	v_boundsA = R.coerce((v_entityA).fields.get("m_CollisionBounds"), "Box")
	v_boundsB = R.coerce((v_entityB).fields.get("m_CollisionBounds"), "Box")
	v_vLocationA = R.coerce((v_entityA).fields.get("m_vLocation"), "DTVector3D")
	v_vLocationB = R.coerce((v_entityB).fields.get("m_vLocation"), "DTVector3D")
	if R.truth((float((v_boundsB).fields.get("W")) == float(0))):
		pass
		return false
	return ((((float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) >= float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X"))))) and (float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) <= float((float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X")))) + float((v_boundsB).fields.get("W")))))) or ((float((float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) + float((v_boundsA).fields.get("W")))) >= float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X"))))) and (float((float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) + float((v_boundsA).fields.get("W")))) <= float((float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X")))) + float((v_boundsB).fields.get("W"))))))) or ((float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) <= float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X"))))) and (float((float((float((v_vLocationA).fields.get("X")) + float((v_boundsA).fields.get("X")))) + float((v_boundsA).fields.get("W")))) >= float((float((float((v_vLocationB).fields.get("X")) + float((v_boundsB).fields.get("X")))) + float((v_boundsB).fields.get("W")))))))
	return null

static func f_EntityOverlapsInY(c: Variant, a: Array) -> Variant:
	var v_boundsA: Variant = null
	var v_boundsB: Variant = null
	var v_vLocationA: Variant = null
	var v_vLocationB: Variant = null
	var v_entityA: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_entityB: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	v_boundsA = R.coerce((v_entityA).fields.get("m_CollisionBounds"), "Box")
	v_boundsB = R.coerce((v_entityB).fields.get("m_CollisionBounds"), "Box")
	v_vLocationA = R.coerce((v_entityA).fields.get("m_vLocation"), "DTVector3D")
	v_vLocationB = R.coerce((v_entityB).fields.get("m_vLocation"), "DTVector3D")
	if R.truth((float((v_boundsB).fields.get("H")) == float(0))):
		pass
		return false
	return ((((float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) >= float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y"))))) and (float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) <= float((float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y")))) + float((v_boundsB).fields.get("H")))))) or ((float((float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) + float((v_boundsA).fields.get("H")))) >= float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y"))))) and (float((float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) + float((v_boundsA).fields.get("H")))) <= float((float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y")))) + float((v_boundsB).fields.get("H"))))))) or ((float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) <= float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y"))))) and (float((float((float((v_vLocationA).fields.get("Y")) + float((v_boundsA).fields.get("Y")))) + float((v_boundsA).fields.get("H")))) >= float((float((float((v_vLocationB).fields.get("Y")) + float((v_boundsB).fields.get("Y")))) + float((v_boundsB).fields.get("H")))))))
	return null

static func f_GetPerlinX(c: Variant, a: Array) -> Variant:
	var v_fValue: Variant = NAN
	var v_iIndex: Variant = 0
	var v_iIndex2: Variant = 0
	var v_fPerlin: Variant = NAN
	var v_fPerlin2: Variant = NAN
	var v_fZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", R.static_value("RDWorld", "m_bCurvyRoads"))):
		pass
		return 0
	v_fValue = float(floorf(float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition"))))))
	v_iIndex = R.coerce((R.coerce(v_fValue, "int") if R.truth((float(v_fValue) > float(0))) else 0), "int")
	v_iIndex2 = R.coerce((float(v_iIndex) + float(1)), "int")
	v_fPerlin = R.coerce((0 if R.truth(R.binary("==", R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length"), 0)) else R.num(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), (v_iIndex if R.truth(R.binary("<", v_iIndex, R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length"))) else (R.num(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length")) - float(1)))))), "Number")
	v_fPerlin2 = R.coerce((0 if R.truth(R.binary("==", R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length"), 0)) else R.num(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), (v_iIndex2 if R.truth(R.binary("<", v_iIndex2, R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length"))) else (R.num(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length")) - float(1)))))), "Number")
	return R.call_static("Maths", "Lerp", [v_fPerlin, v_fPerlin2, (float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition")))) - float(floorf(float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition")))))))])
	return null

static func f_GetPerlinY(c: Variant, a: Array) -> Variant:
	var v_fValue: Variant = NAN
	var v_iIndex: Variant = 0
	var v_iIndex2: Variant = 0
	var v_fPerlin: Variant = NAN
	var v_fPerlin2: Variant = NAN
	var v_fZ: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(R.unary("!", R.static_value("RDWorld", "m_bCurvyRoads"))):
		pass
		return 0
	v_fValue = float(floorf(float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition"))))))
	v_iIndex = R.coerce((R.coerce(v_fValue, "int") if R.truth((float(v_fValue) > float(0))) else 0), "int")
	v_iIndex2 = R.coerce((float(v_iIndex) + float(1)), "int")
	v_fPerlin = R.coerce((0 if R.truth(R.binary("==", R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length"), 0)) else R.num(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), (v_iIndex if R.truth(R.binary("<", v_iIndex, R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length"))) else (R.num(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length")) - float(1)))))), "Number")
	v_fPerlin2 = R.coerce((0 if R.truth(R.binary("==", R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length"), 0)) else R.num(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), (v_iIndex2 if R.truth(R.binary("<", v_iIndex2, R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length"))) else (R.num(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "length")) - float(1)))))), "Number")
	return R.call_static("Maths", "Lerp", [v_fPerlin, v_fPerlin2, (float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition")))) - float(floorf(float((float(v_fZ) - float(R.static_value("RDWorld", "m_iPerlinTrackPosition")))))))])
	return null

static func f_ResetPerlinTrack(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "splice"), [0])
	R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "splice"), [0])
	R.assign(c, "m_fPerlinX", "RDWorld", 0, "=")
	R.assign(c, "m_fPerlinY", "RDWorld", 0, "=")
	R.assign(c, "m_fSpeedX", "RDWorld", 0, "=")
	R.assign(c, "m_fSpeedY", "RDWorld", 0, "=")
	R.assign(c, "m_iPerlinTrackPosition", "RDWorld", 0, "=")
	return null

static func f_AddPerlinTrackPoint(c: Variant, a: Array) -> Variant:
	var v_fSpeedX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fSpeedY: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	R.assign(c, "m_fSpeedX", "RDWorld", R.binary("/", (float(v_fSpeedX) - float(R.static_value("RDWorld", "m_fSpeedX"))), 20), "+=")
	R.assign(c, "m_fSpeedY", "RDWorld", R.binary("/", (float(v_fSpeedY) - float(R.static_value("RDWorld", "m_fSpeedY"))), 20), "+=")
	R.assign(c, "m_fPerlinX", "RDWorld", R.static_value("RDWorld", "m_fSpeedX"), "+=")
	R.assign(c, "m_fPerlinY", "RDWorld", R.static_value("RDWorld", "m_fSpeedY"), "+=")
	R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "push"), [(R.num(R.call_static("Perlin", "noise", [R.static_value("RDWorld", "m_fPerlinX")])) * float(200))])
	R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "push"), [(R.num(R.call_static("Perlin", "noise", [(float(R.static_value("RDWorld", "m_fPerlinY")) + float(123.123))])) * float(100))])
	if R.truth(R.binary(">", R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "length"), 500)):
		pass
		R.assign(c, "m_iPerlinTrackPosition", "RDWorld", 1, "+=")
		R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinXTrack"), "shift"), [])
		R.invoke(R.get_value(R.static_value("RDWorld", "m_PerlinYTrack"), "shift"), [])
	return null

static func f_ResetNavMesh(c: Variant, a: Array) -> Variant:
	var v_j: Variant = 0
	var v_i: Variant = 0
	v_j = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDWorld", "NavMeshSteps")))):
		pass
		v_j = R.coerce(0, "int")
		while R.truth((float(v_j) < float(R.static_value("RDWorld", "NavMeshNodes")))):
			pass
			R.set_value(R.get_value((c).fields.get("m_NavMesh"), v_i), v_j, false, "=")
			v_j = R.signed32(v_j + 1)
		v_i = R.signed32(v_i + 1)
	(c).fields["m_iCurrentNavMeshStep"] = R.coerce(0, "int")
	(c).fields["m_fCameraNavMeshPos"] = float(0)
	return null

static func f_Show(c: Variant, a: Array) -> Variant:
	var v_worldLayer: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.invoke(R.get_value(v_worldLayer, "addChild"), [(c).fields.get("m_LayerBG")])
	R.invoke(R.get_value(v_worldLayer, "addChild"), [(c).fields.get("m_LayerSideBG")])
	R.invoke(R.get_value(v_worldLayer, "addChild"), [(c).fields.get("m_LayerRoad")])
	R.invoke(R.get_value(v_worldLayer, "addChild"), [(c).fields.get("m_LayerOverRoad")])
	R.invoke(R.get_value(v_worldLayer, "addChild"), [(c).fields.get("m_LayerDynamic")])
	return null

static func f_Unload(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_spawnerInfo: Variant = null
	var v_iNbEntities: Variant = 0
	v_i = R.coerce(0, "int")
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	v_spawnerInfo = R.coerce(null, "RDSpawnerInfo")
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_Entities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_entityNode = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Entities"), v_i), R.klass("RDEntityNode")), "RDEntityNode")
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		R.invoke(R.get_value((v_entity).fields.get("m_ContainerMC"), "removeChild"), [(v_entity).fields.get("m_MainMC")])
		R.call_member(v_entity, "Destroy", [])
		(v_entityNode).fields["m_Entity"] = R.coerce(null, "RDEntity")
		(v_entityNode).fields["m_Next"] = R.coerce(null, "RDEntityNode")
		(v_entityNode).fields["m_Previous"] = R.coerce(null, "RDEntityNode")
		R.call_member(c, "ReturnEntityNode", [v_entityNode])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_Entities"), "splice"), [0])
	(c).fields["m_FirstEntity"] = R.coerce(null, "RDEntityNode")
	R.invoke(R.get_value((c).fields.get("m_SafeZones"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Garages"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_WeaponCrates"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_AmmoPoints"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Fences"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_ZombieSpawners"), "length"))):
		pass
		v_spawnerInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_ZombieSpawners"), v_i), R.klass("RDSpawnerInfo")), "RDSpawnerInfo")
		R.call_member(c, "ReturnSpawnerInfo", [v_spawnerInfo])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_ZombieSpawners"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [0])
	return null

static func f_Hide(c: Variant, a: Array) -> Variant:
	var v_worldLayer: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerBG")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerSideBG")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerRoad")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerOverRoad")])
	R.invoke(R.get_value(v_worldLayer, "removeChild"), [(c).fields.get("m_LayerDynamic")])
	return null

static func f_UpdateNavMesh(c: Variant, a: Array) -> Variant:
	var v_navmeshNodes: Variant = null
	var v_i: Variant = 0
	var v_iStep: Variant = 0
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_navmeshNodes = R.coerce(null, "Array")
	v_i = R.coerce(0, "int")
	(c).fields["m_fCameraNavMeshPos"] = R.coerce((((v_camera).fields.get("m_vLocation")).fields.get("Z") if R.truth((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) > float(0))) else 0), "Number")
	v_iStep = R.coerce(floorf(float(R.binary("/", (c).fields.get("m_fCameraNavMeshPos"), R.static_value("RDWorld", "NavMeshStepSize")))), "int")
	while R.truth((float(v_iStep) > float((c).fields.get("m_iCurrentNavMeshStep")))):
		pass
		R.set_value(c, "m_iCurrentNavMeshStep", 1, "+=")
		v_navmeshNodes = R.coerce(R.get_value((c).fields.get("m_NavMesh"), 0), "Array")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(R.static_value("RDWorld", "NavMeshNodes")))):
			pass
			R.set_value(v_navmeshNodes, v_i, false, "=")
			v_i = R.signed32(v_i + 1)
		R.invoke(R.get_value((c).fields.get("m_NavMesh"), "splice"), [0, 1])
		R.invoke(R.get_value((c).fields.get("m_NavMesh"), "push"), [v_navmeshNodes])
	return null

static func f_AddEntityToNavMesh(c: Variant, a: Array) -> Variant:
	var v_iStep: Variant = 0
	var v_fPerlin: Variant = NAN
	var v_fExtraSpacing: Variant = NAN
	var v_iLeftNode: Variant = 0
	var v_iRightNode: Variant = 0
	var v_i: Variant = 0
	var v_entityToAdd: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_iStep = R.coerce(0, "int")
	v_fPerlin = float(NAN)
	v_fExtraSpacing = float(NAN)
	v_iLeftNode = R.coerce(0, "int")
	v_iRightNode = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	if R.truth(((v_entityToAdd).fields.get("m_bFillNavMesh") and (float(((v_entityToAdd).fields.get("m_vLocation")).fields.get("Z")) > float((c).fields.get("m_fCameraNavMeshPos"))))):
		pass
		v_iStep = R.coerce((float(floorf(float(R.binary("/", ((v_entityToAdd).fields.get("m_vLocation")).fields.get("Z"), R.static_value("RDWorld", "NavMeshStepSize"))))) - float(floorf(float(R.binary("/", (c).fields.get("m_fCameraNavMeshPos"), R.static_value("RDWorld", "NavMeshStepSize")))))), "int")
		v_fPerlin = R.coerce(R.invoke(R.resolve(c, "GetPerlinX", "RDWorld"), [((v_entityToAdd).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		v_fExtraSpacing = float((float(R.static_value("RDWorld", "NavMeshExtraSpacing")) + float((v_entityToAdd).fields.get("m_fExtraNavMeshSpacing"))))
		v_iLeftNode = R.coerce(R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (float((float((float((float(((v_entityToAdd).fields.get("m_vLocation")).fields.get("X")) - float(v_fPerlin))) + float(((v_entityToAdd).fields.get("m_CollisionBounds")).fields.get("X")))) + float(R.static_value("RDWorld", "NavMeshOffset")))) - float(R.static_value("RDWorld", "NavMeshExtraSpacing"))), R.static_value("RDWorld", "NavMeshNodeSize"))]), 0, (float(R.static_value("RDWorld", "NavMeshNodes")) - float(1))]), "int")
		v_iRightNode = R.coerce(R.call_static("Maths", "Clamp", [R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", (float((float((float((float((float(((v_entityToAdd).fields.get("m_vLocation")).fields.get("X")) - float(v_fPerlin))) + float(((v_entityToAdd).fields.get("m_CollisionBounds")).fields.get("X")))) + float(((v_entityToAdd).fields.get("m_CollisionBounds")).fields.get("W")))) + float(R.static_value("RDWorld", "NavMeshOffset")))) + float(R.static_value("RDWorld", "NavMeshExtraSpacing"))), R.static_value("RDWorld", "NavMeshNodeSize"))]), 0, (float(R.static_value("RDWorld", "NavMeshNodes")) - float(1))]), "int")
		v_i = R.coerce(v_iLeftNode, "int")
		while R.truth((float(v_i) <= float(v_iRightNode))):
			pass
			R.set_value(R.get_value((c).fields.get("m_NavMesh"), v_iStep), v_i, true, "=")
			v_i = R.signed32(v_i + 1)
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_entityNode: Variant = null
	var v_previousNode: Variant = null
	var v_nextNode: Variant = null
	var v_i: Variant = null
	var v_iNbEntities: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_camera: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDCamera")
	v_entity = R.coerce(null, "RDEntity")
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_previousNode = R.coerce(null, "RDEntityNode")
	v_nextNode = R.coerce(null, "RDEntityNode")
	v_i = R.coerce(0, "*")
	R.call_member(c, "UpdateNavMesh", [v_camera])
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_Entities"), "length"), "int"), "*")
	v_i = R.coerce(0, "*")
	while R.truth(R.binary("<", v_i, v_iNbEntities)):
		pass
		v_entity = R.coerce((R.binary("as", R.get_value((c).fields.get("m_Entities"), v_i), R.klass("RDEntityNode"))).fields.get("m_Entity"), "RDEntity")
		if R.truth((R.unary("!", (v_entity).fields.get("m_bDestroyMe")) and ((v_entity).fields.get("m_bUpdateOutOfView") or (float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) <= float((float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) + float((v_camera).fields.get("m_fMaxViewDistance")))))))):
			pass
			R.call_member(v_entity, "Update", [v_fDeltaTime])
		v_i = R.coerce(R.num(v_i) + 1, "*")
	v_i = R.coerce(0, "*")
	while R.truth(R.binary("<", v_i, v_iNbEntities)):
		pass
		v_entityNode = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Entities"), v_i), R.klass("RDEntityNode")), "RDEntityNode")
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(R.logical_or((v_entity).fields.get("m_bDestroyMe"), func(): return R.logical_and(R.static_value("RDWorld", "m_bDestroyOutOfWorldEntities"), func(): return R.call_member(v_entity, "IsOutOfLevel", [v_camera])))):
			pass
			R.invoke(R.get_value((v_entity).fields.get("m_ContainerMC"), "removeChild"), [(v_entity).fields.get("m_MainMC")])
			R.call_member(v_entity, "Destroy", [])
			v_previousNode = R.coerce((v_entityNode).fields.get("m_Previous"), "RDEntityNode")
			v_nextNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
			if R.truth(v_previousNode):
				pass
				(v_previousNode).fields["m_Next"] = R.coerce(v_nextNode, "RDEntityNode")
			if R.truth(v_nextNode):
				pass
				(v_nextNode).fields["m_Previous"] = R.coerce(v_previousNode, "RDEntityNode")
				if R.truth(R.unary("!", (v_nextNode).fields.get("m_Previous"))):
					pass
					(c).fields["m_FirstEntity"] = R.coerce(v_nextNode, "RDEntityNode")
			if R.truth((R.unary("!", v_previousNode) and R.unary("!", v_nextNode))):
				pass
				(c).fields["m_FirstEntity"] = R.coerce(null, "RDEntityNode")
			(v_entityNode).fields["m_Entity"] = R.coerce(null, "RDEntity")
			(v_entityNode).fields["m_Next"] = R.coerce(null, "RDEntityNode")
			(v_entityNode).fields["m_Previous"] = R.coerce(null, "RDEntityNode")
			R.call_member(c, "ReturnEntityNode", [v_entityNode])
			R.invoke(R.get_value((c).fields.get("m_Entities"), "splice"), [v_i, 1])
			v_iNbEntities = R.coerce(R.num(v_iNbEntities) - 1, "*")
			v_i = R.coerce(R.num(v_i) - 1, "*")
		v_i = R.coerce(R.num(v_i) + 1, "*")
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_iNbEntities: Variant = 0
	var v_i: Variant = 0
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_entity = R.coerce(null, "RDEntity")
	v_iNbEntities = R.coerce(R.coerce(R.get_value((c).fields.get("m_Entities"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbEntities))):
		pass
		v_entity = R.coerce((R.binary("as", R.get_value((c).fields.get("m_Entities"), v_i), R.klass("RDEntityNode"))).fields.get("m_Entity"), "RDEntity")
		R.call_member(v_entity, "Render", [v_camera])
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddEntity(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	var v_entityToAdd: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	((v_entityToAdd).fields.get("m_vLocation")).fields["X"] = float(v_fX)
	((v_entityToAdd).fields.get("m_vLocation")).fields["Y"] = float(v_fY)
	((v_entityToAdd).fields.get("m_vLocation")).fields["Z"] = float(v_fZ)
	v_entityNode = R.coerce(R.call_member(c, "GetEntityNode", []), "RDEntityNode")
	(v_entityNode).fields["m_Entity"] = R.coerce(v_entityToAdd, "RDEntity")
	(v_entityNode).fields["m_Next"] = R.coerce((c).fields.get("m_FirstEntity"), "RDEntityNode")
	if R.truth((c).fields.get("m_FirstEntity")):
		pass
		((c).fields.get("m_FirstEntity")).fields["m_Previous"] = R.coerce(v_entityNode, "RDEntityNode")
	(c).fields["m_FirstEntity"] = R.coerce(v_entityNode, "RDEntityNode")
	R.invoke(R.get_value((c).fields.get("m_Entities"), "push"), [v_entityNode])
	(v_entityToAdd).fields["m_EntityNode"] = R.coerce(v_entityNode, "RDEntityNode")
	R.call_member(v_entityToAdd, "SetWorld", [c])
	R.call_member(c, "AddEntityToLayer", [v_entityToAdd])
	R.call_member(v_entityToAdd, "UpdateDepthPosition", [])
	R.call_member(c, "AddEntityToNavMesh", [v_entityToAdd])
	R.call_member(v_entityToAdd, "OnAddedToWorld", [])
	return null

static func f_AddEntityToLayer(c: Variant, a: Array) -> Variant:
	var v_containerMC: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iLayer: Variant = R.coerce((a[1] if a.size() > 1 else R.unary("-", 1)), "int")
	if R.truth(R.binary("!=", v_iLayer, R.unary("-", 1))):
		pass
		(v_entity).fields["m_iLayer"] = R.coerce(v_iLayer, "int")
	v_containerMC = R.coerce(null, "MovieClip")
	var __t1 = (v_entity).fields.get("m_iLayer")
	var __t2 = -1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("RDEntity", "Layer_Dynamic")):
		__t2 = 0
	if __t2 == -1 and R.binary("===", __t1, R.static_value("RDEntity", "Layer_Background")):
		__t2 = 1
	if __t2 == -1 and R.binary("===", __t1, R.static_value("RDEntity", "Layer_SideBackground")):
		__t2 = 2
	if __t2 == -1 and R.binary("===", __t1, R.static_value("RDEntity", "Layer_Road")):
		__t2 = 3
	if __t2 == -1 and R.binary("===", __t1, R.static_value("RDEntity", "Layer_OverRoad")):
		__t2 = 4
	for __case__t2 in [0]:
		if __t2 >= 0 and __t2 <= 0:
			pass
			v_containerMC = R.coerce((c).fields.get("m_LayerDynamic"), "MovieClip")
			break
		if __t2 >= 0 and __t2 <= 1:
			pass
			v_containerMC = R.coerce((c).fields.get("m_LayerBG"), "MovieClip")
			break
		if __t2 >= 0 and __t2 <= 2:
			pass
			v_containerMC = R.coerce((c).fields.get("m_LayerSideBG"), "MovieClip")
			break
		if __t2 >= 0 and __t2 <= 3:
			pass
			v_containerMC = R.coerce((c).fields.get("m_LayerRoad"), "MovieClip")
			break
		if __t2 >= 0 and __t2 <= 4:
			pass
			v_containerMC = R.coerce((c).fields.get("m_LayerOverRoad"), "MovieClip")
	R.invoke(R.get_value(v_containerMC, "addChild"), [(v_entity).fields.get("m_MainMC")])
	(v_entity).fields["m_ContainerMC"] = R.coerce(v_containerMC, "MovieClip")
	return null

static func f_RemoveEntityFromLayer(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((v_entity).fields.get("m_ContainerMC"), "removeChild"), [(v_entity).fields.get("m_MainMC")])
	return null

static func f_MoveEntity(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_bOverlapX: Variant = false
	var v_bOverlapY: Variant = false
	var v_entity: Variant = null
	var v_bWasBefore: Variant = false
	var v_bIsBefore: Variant = false
	var v_bProcess: Variant = false
	var v_entityNode: Variant = null
	var v_iNbEntities: Variant = 0
	var v_fFinalDeltaX: Variant = NAN
	var v_fFinalDeltaY: Variant = NAN
	var v_fFinalDeltaZ: Variant = NAN
	var v_currentEntity: Variant = null
	var v_fOldX: Variant = NAN
	var v_fOldY: Variant = NAN
	var v_fOldZ: Variant = NAN
	var v_iNbAttachedEntities: Variant = 0
	var v_entityToMove: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_uniqueEntityToTest: Variant = R.coerce((a[4] if a.size() > 4 else null), "RDEntity")
	var v_entitiesToTest: Variant = R.coerce((a[5] if a.size() > 5 else null), "Array")
	var v_bDoCollision: Variant = R.coerce((a[6] if a.size() > 6 else true), "Boolean")
	v_i = R.coerce(0, "int")
	v_bOverlapX = false
	v_bOverlapY = false
	v_entity = R.coerce(null, "RDEntity")
	v_bWasBefore = false
	v_bIsBefore = false
	v_bProcess = false
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_iNbEntities = R.coerce(0, "int")
	v_fFinalDeltaX = float(NAN)
	v_fFinalDeltaY = float(NAN)
	v_fFinalDeltaZ = float(NAN)
	v_currentEntity = R.coerce(null, "RDEntity")
	v_fOldX = float(((v_entityToMove).fields.get("m_vLocation")).fields.get("X"))
	v_fOldY = float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Y"))
	v_fOldZ = float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Z"))
	if R.truth(((float((v_entityToMove).fields.get("m_iCollisionGroup")) != float(R.static_value("RDEntity", "CollisionGroup_None"))) and v_bDoCollision)):
		pass
		((v_entityToMove).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("X"), v_fX), "Number")
		((v_entityToMove).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("Y"), v_fY), "Number")
		((v_entityToMove).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("Z"), v_fZ), "Number")
		R.call_member(v_entityToMove, "UpdateDepthPosition", [])
		if R.truth(v_uniqueEntityToTest):
			pass
			v_entity = R.coerce(v_uniqueEntityToTest, "RDEntity")
			v_bProcess = true
			if R.truth(((R.binary("==", v_entity, v_entityToMove) or (v_entity).fields.get("m_bDestroyMe")) or R.binary("==", (v_entity).fields.get("m_Base"), v_entityToMove))):
				pass
				v_bProcess = false
			if R.truth((((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_None"))) or R.unary("!", R.call_member(v_entityToMove, "CanCollideWith", [v_entity]))) or R.unary("!", R.call_member(v_entity, "CanCollideWith", [v_entityToMove])))):
				pass
				v_bProcess = false
			if R.truth(v_bProcess):
				pass
				v_bOverlapX = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInX", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
				if R.truth(v_bOverlapX):
					pass
					v_bOverlapY = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInY", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
					if R.truth(v_bOverlapY):
						pass
						v_bWasBefore = (float((float((float(v_fOldZ) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
						v_bIsBefore = (float((float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
						if R.truth(R.binary("!=", v_bWasBefore, v_bIsBefore)):
							pass
							R.call_member(v_entityToMove, "Touched", [v_entity])
							R.call_member(v_entity, "TouchedBy", [v_entityToMove])
		else:
			pass
			v_entityNode = R.coerce((c).fields.get("m_FirstEntity"), "RDEntityNode")
			while R.truth(v_entityNode):
				pass
				v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
				if R.truth(((R.binary("==", v_entity, v_entityToMove) or (v_entity).fields.get("m_bDestroyMe")) or R.binary("==", (v_entity).fields.get("m_Base"), v_entityToMove))):
					pass
					v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
				else:
					pass
					if R.truth((((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_None"))) or R.unary("!", R.call_member(v_entityToMove, "CanCollideWith", [v_entity]))) or R.unary("!", R.call_member(v_entity, "CanCollideWith", [v_entityToMove])))):
						pass
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
					else:
						pass
						v_bOverlapX = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInX", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
						if R.truth(v_bOverlapX):
							pass
							v_bOverlapY = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInY", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
							if R.truth(v_bOverlapY):
								pass
								v_bWasBefore = (float((float((float(v_fOldZ) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
								v_bIsBefore = (float((float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
								if R.truth(R.binary("!=", v_bWasBefore, v_bIsBefore)):
									pass
									R.call_member(v_entityToMove, "Touched", [v_entity])
									R.call_member(v_entity, "TouchedBy", [v_entityToMove])
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
		if R.truth(v_entitiesToTest):
			pass
			v_iNbEntities = R.coerce(R.coerce(R.get_value(v_entitiesToTest, "length"), "int"), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbEntities))):
				pass
				v_entity = R.coerce(R.binary("as", R.get_value(v_entitiesToTest, v_i), R.klass("RDEntity")), "RDEntity")
				if R.truth(R.unary("!", ((R.binary("==", v_entity, v_entityToMove) or (v_entity).fields.get("m_bDestroyMe")) or R.binary("==", (v_entity).fields.get("m_Base"), v_entityToMove)))):
					pass
					if R.truth(R.unary("!", (((float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_None"))) or R.unary("!", R.call_member(v_entityToMove, "CanCollideWith", [v_entity]))) or R.unary("!", R.call_member(v_entity, "CanCollideWith", [v_entityToMove]))))):
						pass
						v_bOverlapX = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInX", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
						if R.truth(v_bOverlapX):
							pass
							v_bOverlapY = R.coerce(R.invoke(R.resolve(c, "EntityOverlapsInY", "RDWorld"), [v_entityToMove, v_entity]), "Boolean")
							if R.truth(v_bOverlapY):
								pass
								v_bWasBefore = (float((float((float(v_fOldZ) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
								v_bIsBefore = (float((float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("Z")))) + float(((v_entityToMove).fields.get("m_CollisionBounds")).fields.get("D")))) < float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) + float(((v_entity).fields.get("m_CollisionBounds")).fields.get("Z")))))
								if R.truth(R.binary("!=", v_bWasBefore, v_bIsBefore)):
									pass
									R.call_member(v_entityToMove, "Touched", [v_entity])
									R.call_member(v_entity, "TouchedBy", [v_entityToMove])
				v_i = R.signed32(v_i + 1)
	else:
		pass
		((v_entityToMove).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("X"), v_fX), "Number")
		((v_entityToMove).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("Y"), v_fY), "Number")
		((v_entityToMove).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_entityToMove).fields.get("m_vLocation")).fields.get("Z"), v_fZ), "Number")
		R.call_member(v_entityToMove, "UpdateDepthPosition", [])
	v_iNbAttachedEntities = R.coerce(R.coerce(R.get_value((v_entityToMove).fields.get("m_AttachedEntities"), "length"), "int"), "int")
	if R.truth((float(v_iNbAttachedEntities) > float(0))):
		pass
		v_fFinalDeltaX = float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("X")) - float(v_fOldX)))
		v_fFinalDeltaY = float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Y")) - float(v_fOldY)))
		v_fFinalDeltaZ = float((float(((v_entityToMove).fields.get("m_vLocation")).fields.get("Z")) - float(v_fOldZ)))
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbAttachedEntities))):
			pass
			v_currentEntity = R.coerce(R.invoke(R.klass("RDEntity"), [R.get_value((v_entityToMove).fields.get("m_AttachedEntities"), v_i)]), "RDEntity")
			((v_currentEntity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((v_currentEntity).fields.get("m_vLocation")).fields.get("X"), v_fFinalDeltaX), "Number")
			((v_currentEntity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((v_currentEntity).fields.get("m_vLocation")).fields.get("Y"), v_fFinalDeltaY), "Number")
			((v_currentEntity).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((v_currentEntity).fields.get("m_vLocation")).fields.get("Z"), v_fFinalDeltaZ), "Number")
			R.call_member(v_currentEntity, "UpdateDepthPosition", [])
			v_i = R.signed32(v_i + 1)
	return null

static func f_AddSafeZone(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_SafeZones"), "push"), [v_entity])
	return null

static func f_RemoveSafeZone(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_SafeZones"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_SafeZones"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_SafeZones"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddGarage(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_Garages"), "push"), [v_entity])
	return null

static func f_RemoveGarage(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Garages"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_Garages"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_Garages"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddWeaponCrate(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_WeaponCrates"), "push"), [v_entity])
	return null

static func f_RemoveWeaponCrate(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_WeaponCrates"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_WeaponCrates"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_WeaponCrates"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddAmmoPoint(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_AmmoPoints"), "push"), [v_entity])
	return null

static func f_RemoveAmmoPoint(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AmmoPoints"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_AmmoPoints"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_AmmoPoints"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddFence(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value((c).fields.get("m_Fences"), "push"), [v_entity])
	return null

static func f_RemoveFence(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Fences"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_Fences"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_Fences"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddZombieSpawner(c: Variant, a: Array) -> Variant:
	var v_spawnerInfo: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_iType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_spawnerInfo = R.coerce(R.call_member(c, "GetSpawnerInfo", []), "RDSpawnerInfo")
	(v_spawnerInfo).fields["m_Entity"] = R.coerce(v_entity, "RDEntity")
	(v_spawnerInfo).fields["m_iType"] = R.coerce(v_iType, "int")
	R.invoke(R.get_value((c).fields.get("m_ZombieSpawners"), "push"), [v_spawnerInfo])
	return null

static func f_RemoveZombieSpawner(c: Variant, a: Array) -> Variant:
	var v_spawnerInfo: Variant = null
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_spawnerInfo = R.coerce(null, "RDSpawnerInfo")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_ZombieSpawners"), "length"))):
		pass
		v_spawnerInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_ZombieSpawners"), v_i), R.klass("RDSpawnerInfo")), "RDSpawnerInfo")
		if R.truth(R.binary("==", (v_spawnerInfo).fields.get("m_Entity"), v_entity)):
			pass
			R.call_member(c, "ReturnSpawnerInfo", [v_spawnerInfo])
			R.invoke(R.get_value((c).fields.get("m_ZombieSpawners"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddBGBuilding(c: Variant, a: Array) -> Variant:
	var v_building: Variant = null
	var v_iNbBuildings: Variant = 0
	var v_i: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_building = R.coerce(null, "RDEntity")
	v_iNbBuildings = R.coerce(R.coerce(R.get_value((c).fields.get("m_BGBuildings"), "length"), "int"), "int")
	v_i = R.coerce(R.coerce((float(v_iNbBuildings) - float(1)), "int"), "*")
	while R.truth(R.binary(">=", v_i, 0)):
		pass
		v_building = R.coerce(R.get_value((c).fields.get("m_BGBuildings"), v_i), "RDEntity")
		if R.truth((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) > float(((v_building).fields.get("m_vLocation")).fields.get("Z")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [R.binary("+", v_i, 1), 0, v_entity])
			return null
		v_i = R.coerce(R.num(v_i) - 1, "*")
	R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "unshift"), [v_entity])
	return null

static func f_RemoveBGBuilding(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_BGBuildings"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("m_BGBuildings"), v_i), v_entity)):
			pass
			R.invoke(R.get_value((c).fields.get("m_BGBuildings"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_GetEntityNode(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	v_entityNode = R.coerce(null, "RDEntityNode")
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_EntityNodesPool"), "length"), 0)):
		pass
		v_entityNode = R.coerce(R.binary("as", R.invoke(R.get_value((c).fields.get("m_EntityNodesPool"), "pop"), []), R.klass("RDEntityNode")), "RDEntityNode")
		(v_entityNode).fields["m_Entity"] = R.coerce(null, "RDEntity")
		(v_entityNode).fields["m_Next"] = R.coerce(null, "RDEntityNode")
		(v_entityNode).fields["m_Previous"] = R.coerce(null, "RDEntityNode")
		return v_entityNode
	return R.construct(R.klass("RDEntityNode"), [])
	return null

static func f_ReturnEntityNode(c: Variant, a: Array) -> Variant:
	var v_node: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntityNode")
	R.invoke(R.get_value((c).fields.get("m_EntityNodesPool"), "push"), [v_node])
	return null

static func f_GetSpawnerInfo(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_SpawnerInfosPool"), "length"), 0)):
		pass
		return R.binary("as", R.invoke(R.get_value((c).fields.get("m_SpawnerInfosPool"), "pop"), []), R.klass("RDSpawnerInfo"))
	return R.construct(R.klass("RDSpawnerInfo"), [])
	return null

static func f_ReturnSpawnerInfo(c: Variant, a: Array) -> Variant:
	var v_spawner: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSpawnerInfo")
	R.invoke(R.get_value((c).fields.get("m_SpawnerInfosPool"), "push"), [v_spawner])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_iPerlinTrackPosition", 0, "=")
	R.set_value(c, "m_bCurvyRoads", false, "=")
	R.set_value(c, "NavMeshSteps", 600, "=")
	R.set_value(c, "NavMeshStepSize", 1, "=")
	R.set_value(c, "NavMeshNodes", 50, "=")
	R.set_value(c, "NavMeshNodeSize", 0.5, "=")
	R.set_value(c, "NavMeshOffset", (float(R.binary("/", R.static_value("RDWorld", "NavMeshNodes"), 2)) * float(R.static_value("RDWorld", "NavMeshNodeSize"))), "=")
	R.set_value(c, "NavMeshExtraSpacing", 0.5, "=")
	R.set_value(c, "m_PerlinXTrack", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_PerlinYTrack", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_fPerlinX", 0, "=")
	R.set_value(c, "m_fPerlinY", 0, "=")
	R.set_value(c, "m_fSpeedX", 0, "=")
	R.set_value(c, "m_fSpeedY", 0, "=")
	R.set_value(c, "m_bDestroyOutOfWorldEntities", true, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Game"] = R.coerce(null, "RDGame")
	(c).fields["m_Entities"] = R.coerce(null, "Array")
	(c).fields["m_FirstEntity"] = R.coerce(null, "RDEntityNode")
	(c).fields["m_LayerBG"] = R.coerce(null, "MovieClip")
	(c).fields["m_LayerSideBG"] = R.coerce(null, "MovieClip")
	(c).fields["m_LayerRoad"] = R.coerce(null, "MovieClip")
	(c).fields["m_LayerOverRoad"] = R.coerce(null, "MovieClip")
	(c).fields["m_LayerDynamic"] = R.coerce(null, "MovieClip")
	(c).fields["m_SafeZones"] = R.coerce(null, "Array")
	(c).fields["m_Garages"] = R.coerce(null, "Array")
	(c).fields["m_WeaponCrates"] = R.coerce(null, "Array")
	(c).fields["m_AmmoPoints"] = R.coerce(null, "Array")
	(c).fields["m_Fences"] = R.coerce(null, "Array")
	(c).fields["m_ZombieSpawners"] = R.coerce(null, "Array")
	(c).fields["m_BGBuildings"] = R.coerce(null, "Array")
	(c).fields["m_iEnemies"] = R.coerce(0, "int")
	(c).fields["m_iMutants"] = R.coerce(0, "int")
	(c).fields["m_iKillableEnemies"] = R.coerce(0, "int")
	(c).fields["m_NavMesh"] = R.coerce(null, "Array")
	(c).fields["m_iCurrentNavMeshStep"] = R.coerce(0, "int")
	(c).fields["m_fCameraNavMeshPos"] = float(NAN)
	(c).fields["m_EntityNodesPool"] = R.coerce(null, "Array")
	(c).fields["m_SpawnerInfosPool"] = R.coerce(null, "Array")
	return null
