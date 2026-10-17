extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeEditor(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeEditor"), [v_theGame])
	c.fields["m_Camera"] = R.coerce(R.construct(R.klass("RDCameraEditor"), []), "RDCamera")
	(c).fields["m_Interface"] = R.coerce(R.construct(R.klass("RDEditorInterface"), [c]), "RDEditorInterface")
	c.fields["m_bHasHud"] = false
	(c).fields["m_iLastInterfaceMode"] = R.coerce(R.static_value("RDEditorInterface", "Mode_Pattern"), "int")
	(c).fields["m_ChopperSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingChopper"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNuke"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNukeWave"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	return null

static func f_EncodeData(c: Variant, a: Array) -> Variant:
	var v_origPos: Variant = 0
	var v_result: Variant = null
	var v_szData: Variant = null
	var v_i: Variant = 0
	var v_ba: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	R.set_value(v_ba, "position", 0, "=")
	v_origPos = R.coerce(R.get_value(v_ba, "position"), "uint")
	v_result = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(v_ba, "position", 0, "=")
	while R.truth(R.binary("<", R.get_value(v_ba, "position"), (R.num(R.get_value(v_ba, "length")) - float(1)))):
		pass
		R.invoke(R.get_value(v_result, "push"), [R.invoke(R.get_value(v_ba, "readShort"), [])])
	if R.truth(R.binary("!=", R.get_value(v_ba, "position"), R.get_value(v_ba, "length"))):
		pass
		R.invoke(R.get_value(v_result, "push"), [R.binary("<<", R.invoke(R.get_value(v_ba, "readByte"), []), 8)])
	R.set_value(v_ba, "position", v_origPos, "=")
	v_szData = R.coerce("", "String")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_result, "length"))):
		pass
		v_szData = R.coerce(R.binary("+", v_szData, R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(v_result, v_i)])), "String")
		v_i = R.signed32(v_i + 1)
	return v_szData
	return null

static func f_DecodeData(c: Variant, a: Array) -> Variant:
	var v_result: Variant = null
	var v_i: Variant = 0
	var v_str: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_result = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_str, "length"))):
		pass
		R.invoke(R.get_value(v_result, "writeShort"), [R.invoke(R.get_value(v_str, "charCodeAt"), [v_i])])
		v_i = R.signed32(v_i + 1)
	R.set_value(v_result, "position", 0, "=")
	return v_result
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "BeginGameMode"), [])
	R.set_value(R.klass("RDWorld"), "m_bDestroyOutOfWorldEntities", false, "=")
	R.set_value(R.klass("RDWorld"), "m_bCurvyRoads", false, "=")
	(c.fields.get("m_Game")).fields["m_bPlayFromEditor"] = false
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Show", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	(c).fields["m_bMusicEnabled"] = ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMusic"] = true
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	(c).fields["m_iMusic"] = R.coerce(0, "int")
	R.call_member(c, "PlayEditorMusic", [])
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) and R.truth((c).fields.get("m_SavedPatternData")))):
		pass
		R.call_member(c, "LoadSavedPattern", [])
	else:
		pass
		if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) and R.truth((c).fields.get("m_SavedAreaData")))):
			pass
			R.call_member(c, "LoadSavedArea", [])
		else:
			pass
			if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.truth((c).fields.get("m_SavedCampaignData")))):
				pass
				R.call_member(c, "LoadSavedCampaign", [])
			else:
				pass
				if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
					pass
					R.call_member(c, "NewPattern", [R.static_value("RDPatternInfo", "Type_Regular")])
				else:
					pass
					if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
						pass
						R.call_member(c, "NewArea", [])
					else:
						pass
						if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
							pass
							R.call_member(c, "NewCampaign", [R.static_value("RDCampaignInfo", "Type_Unset")])
	R.call_member((c).fields.get("m_Interface"), "Show", [(c).fields.get("m_iLastInterfaceMode")])
	(c).fields["m_fFastCamRamp"] = float(1)
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SetSelectedEntity", [null])
	R.call_member(c, "StopEndingSounds", [])
	R.call_member(c, "SaveData", [])
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMusic"] = (c).fields.get("m_bMusicEnabled")
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_Interface"), "Hide", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Hide", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	return null

static func f_SaveData(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.call_member(c, "SaveCurrentPatternData", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.call_member(c, "SaveCurrentAreaData", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
				pass
				R.call_member(c, "SaveCurrentCampaignData", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "Update"), [v_fDeltaTime])
	if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) > float(0))):
		pass
		(c).fields["m_fAPITimeoutTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fAPITimeoutTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) <= float(0))):
			pass
			R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
			R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Update", [v_fDeltaTime, c.fields.get("m_Camera")])
	R.call_member(c.fields.get("m_Camera"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateGameplay", [v_fDeltaTime])
	R.call_member((c).fields.get("m_Interface"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateBGBuildingDepthPos", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Render", [c.fields.get("m_Camera")])
	return null

static func f_SpawnBGBuildings(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_bRight: Variant = false
	var v_szSpawnClass: Variant = null
	var v_entity: Variant = null
	var v_fNextBuildingSpawnPosition: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_leftBuilding: Variant = null
	var v_rightBuilding: Variant = null
	var v_iPatternType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_fStartPosition: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_i = R.coerce(0, "int")
	v_bRight = false
	v_szSpawnClass = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_fNextBuildingSpawnPosition = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinX = float(NAN)
	v_fPerlinY = float(NAN)
	v_leftBuilding = R.coerce(null, "RDBuilding")
	v_rightBuilding = R.coerce(null, "RDBuilding")
	if R.truth(((((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential"))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed"))))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(10))):
			pass
			v_bRight = (float(R.binary("%", v_i, 2)) == float(0))
			if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential")))):
				pass
				v_szSpawnClass = R.coerce("BGBuildingResidentialRandom", "String")
			else:
				pass
				if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))):
					pass
					v_szSpawnClass = R.coerce("BGBuildingTownRandom", "String")
				else:
					pass
					if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))):
						pass
						v_szSpawnClass = R.coerce("BGBuildingIndustrialRandom", "String")
					else:
						pass
						if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed")))):
							pass
							v_szSpawnClass = R.coerce("BGBuildingMixedRandom", "String")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szSpawnClass]), "RDEntity")
			R.call_member(v_entity, "SetEditorMode", [])
			((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce((10 if R.truth(v_bRight) else R.unary("-", 10)), "Number")
			((v_entity).fields.get("m_vLocation")).fields["Y"] = float(0)
			((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(R.binary("/", (float((float(v_i) + float(1))) * float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))), 11))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			R.call_member(v_entity, "UpdateFlip", [])
			R.call_member(c, "OnEntityAddedToWorld", [v_entity])
			v_i = R.signed32(v_i + 1)
	else:
		pass
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			v_fNextBuildingSpawnPosition = float(0)
			while R.truth((float(v_fNextBuildingSpawnPosition) < float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))):
				pass
				v_fPosZ = float((float(v_fNextBuildingSpawnPosition) + float((float(randf()) * float(20)))))
				v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
				v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
				v_leftBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
				R.call_member(v_leftBuilding, "Init", [false, 0])
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_leftBuilding, (float((float(v_fPerlinX) - float(R.static_value("RDRoad", "BuildingPosX")))) - float((float(randf()) * float(15)))), v_fPerlinY, (float(v_fStartPosition) + float(v_fPosZ))])
				R.call_member(v_leftBuilding, "UpdateFlip", [])
				R.call_member(c, "OnEntityAddedToWorld", [v_leftBuilding])
				v_fPosZ = float((float((float(v_fNextBuildingSpawnPosition) + float(R.binary("/", R.static_value("RDGameModeGameplay", "BuildingSpacing"), 2)))) + float((float(randf()) * float(20)))))
				if R.truth((float(v_fPosZ) < float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))):
					pass
					v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
					v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
					v_rightBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
					R.call_member(v_rightBuilding, "Init", [true, 0])
					R.call_member(c.fields.get("m_Game"), "AddEntity", [v_rightBuilding, (float((float(v_fPerlinX) + float(R.static_value("RDRoad", "BuildingPosX")))) + float((float(randf()) * float(15)))), v_fPerlinY, (float(v_fStartPosition) + float(v_fPosZ))])
					R.call_member(v_rightBuilding, "UpdateFlip", [])
					R.call_member(c, "OnEntityAddedToWorld", [v_rightBuilding])
				v_fNextBuildingSpawnPosition = R.coerce(R.binary("+", v_fNextBuildingSpawnPosition, R.static_value("RDGameModeGameplay", "BuildingSpacing")), "Number")
	return null

static func f_PopulateBuildings(c: Variant, a: Array) -> Variant:
	var v_bRight: Variant = false
	var v_szSpawnClass: Variant = null
	var v_entity: Variant = null
	var v_iRandom: Variant = 0
	var v_i: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bRight = false
	v_szSpawnClass = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_iRandom = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(10))):
		pass
		v_bRight = (float(R.binary("%", v_i, 2)) == float(0))
		if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Residential")))):
			pass
			v_szSpawnClass = R.coerce("BuildingResidentialRandom", "String")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Town")))):
				pass
				v_szSpawnClass = R.coerce("BuildingTownRandom", "String")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Industrial")))):
					pass
					v_szSpawnClass = R.coerce("BuildingIndustrialRandom", "String")
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Mixed")))):
						pass
						v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [3]), "int")
						if R.truth((float(v_iRandom) == float(0))):
							pass
							v_szSpawnClass = R.coerce("BuildingResidentialRandom", "String")
						else:
							pass
							if R.truth((float(v_iRandom) == float(1))):
								pass
								v_szSpawnClass = R.coerce("BuildingTownRandom", "String")
							else:
								pass
								if R.truth((float(v_iRandom) == float(2))):
									pass
									v_szSpawnClass = R.coerce("BuildingIndustrialRandom", "String")
		v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szSpawnClass]), "RDEntity")
		R.call_member(v_entity, "SetEditorMode", [])
		((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce((10 if R.truth(v_bRight) else R.unary("-", 10)), "Number")
		((v_entity).fields.get("m_vLocation")).fields["Y"] = float(0)
		((v_entity).fields.get("m_vLocation")).fields["Z"] = float(R.binary("/", (float((float(v_i) + float(1))) * float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))), 11))
		R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
		R.call_member(v_entity, "UpdateFlip", [])
		R.call_member(c, "OnEntityAddedToWorld", [v_entity])
		v_i = R.signed32(v_i + 1)
	return null

static func f_LoadPatternData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iPatternType: Variant = 0
	var v_iNbEntities: Variant = 0
	var v_iStartSliceIndex: Variant = 0
	var v_szName: Variant = null
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_entity: Variant = null
	var v_iNbProperties: Variant = 0
	var v_p: Variant = 0
	var v_szPropertyName: Variant = null
	var v_iPropertyType: Variant = 0
	var v_propValue: Variant = null
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bPatternMode: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	var v_fStartPosition: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	v_i = R.coerce(0, "int")
	v_iPatternType = R.coerce(0, "int")
	v_iNbEntities = R.coerce(0, "int")
	v_iStartSliceIndex = R.coerce(0, "int")
	v_szName = R.coerce(null, "String")
	v_fX = float(NAN)
	v_fY = float(NAN)
	v_fZ = float(NAN)
	v_entity = R.coerce(null, "RDEntity")
	v_iNbProperties = R.coerce(0, "int")
	v_p = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_iPropertyType = R.coerce(0, "int")
	v_propValue = R.coerce(null, "*")
	R.set_value(v_savedData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iPatternType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth(v_bPatternMode):
			pass
			R.call_member(c, "NewPattern", [v_iPatternType])
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			R.call_member(c, "SpawnBGBuildings", [v_iPatternType, v_fStartPosition])
		if R.truth(v_bPatternMode):
			pass
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 0])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 1])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 2])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 3])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 4])
		else:
			pass
			if R.truth((float(v_fStartPosition) < float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))):
				pass
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
			else:
				pass
				v_iStartSliceIndex = R.coerce((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((c).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(0))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(1))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(2))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(3))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(4))])
		v_iNbEntities = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbEntities))):
			pass
			v_szName = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
			v_fX = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fY = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fZ = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fZ = R.coerce(R.binary("+", v_fZ, v_fStartPosition), "Number")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szName]), "RDEntity")
			R.call_member(v_entity, "SetEditorMode", [])
			v_iNbProperties = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_p = R.coerce(0, "int")
			while R.truth((float(v_p) < float(v_iNbProperties))):
				pass
				v_szPropertyName = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				v_iPropertyType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Number")))):
					pass
					v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "*")
				else:
					pass
					if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Boolean")))):
						pass
						v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "*")
					else:
						pass
						if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_String")))):
							pass
							v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "*")
				R.call_member(v_entity, "SetProperty", [v_szPropertyName, v_propValue])
				v_p = R.signed32(v_p + 1)
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, v_fX, v_fY, v_fZ])
			R.call_member(v_entity, "UpdateFlip", [])
			R.call_member(c, "OnEntityAddedToWorld", [v_entity])
			v_i = R.signed32(v_i + 1)
	return null

static func f_RandomizePattern(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SaveData", [])
	R.call_member(c, "LoadPatternData", [(c).fields.get("m_SavedPatternData")])
	return null

static func f_UpdateBGBuildingDepthPos(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_fFarthestAlleywayPos: Variant = NAN
	var v_fFarthestAlleywayPos2: Variant = NAN
	var v_fFarthestAlleywayPos3: Variant = NAN
	var v_fFarthestAlleywayPos4: Variant = NAN
	var v_fFarthestAlleywayPos5: Variant = NAN
	var v_fTransitionPos: Variant = NAN
	var v_fTransitionPos2: Variant = NAN
	var v_fTransitionPos3: Variant = NAN
	var v_fTransitionPos4: Variant = NAN
	var v_iSlice: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_fLoopedCamPos: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_building: Variant = null
	var v_world: Variant = null
	var v_iNbBuildings: Variant = 0
	var v_iNbSlices: Variant = 0
	var v_bFoundAlleyway: Variant = false
	var v_bCheckForAlleyway2: Variant = false
	var v_bCheckForAlleyway3: Variant = false
	var v_bCheckForAlleyway4: Variant = false
	var v_bCheckForAlleyway5: Variant = false
	var v_bFoundAlleyway2: Variant = false
	var v_bFoundAlleyway3: Variant = false
	var v_bFoundAlleyway4: Variant = false
	var v_bFoundAlleyway5: Variant = false
	var v_sliceEntity: Variant = null
	v_i = R.coerce(0, "int")
	v_fFarthestAlleywayPos = float(NAN)
	v_fFarthestAlleywayPos2 = float(NAN)
	v_fFarthestAlleywayPos3 = float(NAN)
	v_fFarthestAlleywayPos4 = float(NAN)
	v_fFarthestAlleywayPos5 = float(NAN)
	v_fTransitionPos = float(NAN)
	v_fTransitionPos2 = float(NAN)
	v_fTransitionPos3 = float(NAN)
	v_fTransitionPos4 = float(NAN)
	v_iSlice = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_fLoopedCamPos = float(NAN)
	v_fPosZ = float(NAN)
	v_building = R.coerce(null, "RDBuildingNewBG")
	v_world = R.coerce((c.fields.get("m_Game")).fields.get("m_World"), "RDWorld")
	v_iNbBuildings = R.coerce(R.coerce(R.get_value((v_world).fields.get("m_BGBuildings"), "length"), "int"), "int")
	v_iNbSlices = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), "length"), "int"), "int")
	v_bFoundAlleyway = false
	v_bCheckForAlleyway2 = false
	v_bCheckForAlleyway3 = false
	v_bCheckForAlleyway4 = false
	v_bCheckForAlleyway5 = false
	v_bFoundAlleyway2 = false
	v_bFoundAlleyway3 = false
	v_bFoundAlleyway4 = false
	v_bFoundAlleyway5 = false
	v_sliceEntity = R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSliceEntities"), 0), "RDRoadSlice")
	if R.truth((((float(v_iNbBuildings) > float(0)) and (float(v_iNbSlices) > float(0))) and R.truth(v_sliceEntity))):
		pass
		v_fFarthestAlleywayPos = float(0)
		v_fFarthestAlleywayPos2 = float(0)
		v_fFarthestAlleywayPos3 = float(0)
		v_fFarthestAlleywayPos4 = float(0)
		v_fFarthestAlleywayPos5 = float(0)
		v_fTransitionPos = float(0)
		v_fTransitionPos2 = float(0)
		v_fTransitionPos3 = float(0)
		v_fTransitionPos4 = float(0)
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbSlices))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_fCamPos = float(maxf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), float(0)))
			v_fLoopedCamPos = float(R.binary("%", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))
			v_fPosZ = float(maxf(float((float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "NearPos"))))
			if R.truth((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
				pass
				if R.truth(v_bCheckForAlleyway5):
					pass
					v_bFoundAlleyway5 = true
				else:
					pass
					if R.truth(v_bCheckForAlleyway4):
						pass
						v_bFoundAlleyway4 = true
					else:
						pass
						if R.truth(v_bCheckForAlleyway3):
							pass
							v_bFoundAlleyway3 = true
						else:
							pass
							if R.truth(v_bCheckForAlleyway2):
								pass
								v_bFoundAlleyway2 = true
							else:
								pass
								v_bFoundAlleyway = true
				if R.truth((v_bCheckForAlleyway5 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos5)))):
					pass
					v_fFarthestAlleywayPos5 = float(v_fPosZ)
				else:
					pass
					if R.truth((v_bCheckForAlleyway4 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos4)))):
						pass
						v_fFarthestAlleywayPos4 = float(v_fPosZ)
					else:
						pass
						if R.truth((v_bCheckForAlleyway3 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos3)))):
							pass
							v_fFarthestAlleywayPos3 = float(v_fPosZ)
						else:
							pass
							if R.truth((v_bCheckForAlleyway2 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos2)))):
								pass
								v_fFarthestAlleywayPos2 = float(v_fPosZ)
							else:
								pass
								if R.truth((float(v_fPosZ) > float(v_fFarthestAlleywayPos))):
									pass
									v_fFarthestAlleywayPos = float(v_fPosZ)
			else:
				pass
				if R.truth(v_bFoundAlleyway5):
					pass
					break
				if R.truth(v_bFoundAlleyway4):
					pass
					v_bCheckForAlleyway5 = true
					v_fTransitionPos4 = float(v_fFarthestAlleywayPos4)
				else:
					pass
					if R.truth(v_bFoundAlleyway3):
						pass
						v_bCheckForAlleyway4 = true
						v_fTransitionPos3 = float(v_fFarthestAlleywayPos3)
					else:
						pass
						if R.truth(v_bFoundAlleyway2):
							pass
							v_bCheckForAlleyway3 = true
							v_fTransitionPos2 = float(v_fFarthestAlleywayPos2)
						else:
							pass
							if R.truth(v_bFoundAlleyway):
								pass
								v_bCheckForAlleyway2 = true
								v_fTransitionPos = float(v_fFarthestAlleywayPos)
			v_i = R.signed32(v_i + 1)
		if R.truth((float(v_fFarthestAlleywayPos) > float(0))):
			pass
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbBuildings))):
				pass
				v_building = R.coerce(R.binary("as", R.get_value((v_world).fields.get("m_BGBuildings"), v_i), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
				if R.truth((R.unary("!", v_bFoundAlleyway2) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos)))))):
					pass
					(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				else:
					pass
					if R.truth((R.unary("!", v_bFoundAlleyway3) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos2)))))):
						pass
						(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos2))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
					else:
						pass
						if R.truth((R.unary("!", v_bFoundAlleyway4) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos3)))))):
							pass
							(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos3))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
						else:
							pass
							if R.truth((R.unary("!", v_bFoundAlleyway5) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos4)))))):
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos4))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
							else:
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos5))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				R.call_member(v_building, "UpdateDepthPosition", [])
				v_i = R.signed32(v_i + 1)
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fOldZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldZ = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))
	if R.truth(R.unary("!", R.get_value((c.fields.get("m_Game")).fields.get("m_ConfirmationDialog"), "visible"))):
		pass
		if R.truth((c).fields.get("m_bGoFast")):
			pass
			(c).fields["m_fFastCamRamp"] = R.coerce(R.binary("*", (c).fields.get("m_fFastCamRamp"), R.static_value("RDGameModeEditor", "CamFastBaseRamp")), "Number")
			(c).fields["m_fCamFastFactor"] = float((float(R.static_value("RDGameModeEditor", "CamFastFactor")) + float((float((float(1) - float((c).fields.get("m_fFastCamRamp")))) * float(R.static_value("RDGameModeEditor", "CamFastFactorRamp"))))))
		else:
			pass
			(c).fields["m_fFastCamRamp"] = float(1)
		if R.truth((c).fields.get("m_bGoLeft")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("-", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedX")) * float(v_fDeltaTime))) * R.num((R.static_value("RDGameModeEditor", "CamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
		if R.truth((c).fields.get("m_bGoRight")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedX")) * float(v_fDeltaTime))) * R.num((R.static_value("RDGameModeEditor", "CamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
		if R.truth((c).fields.get("m_bGoForward")):
			pass
			if R.truth(R.call_member(c, "CanGoForward", [])):
				pass
				((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedZ")) * float(v_fDeltaTime))) * R.num(((c).fields.get("m_fCamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
				if R.truth((((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))) or ((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))))):
					pass
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(minf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), R.num(R.call_member(c, "GetCameraPosLimit", []))))
		if R.truth((c).fields.get("m_bGoBackward")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedZ")) * float(v_fDeltaTime))) * R.num(((c).fields.get("m_fCamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) != float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
				pass
				((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(maxf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), float(0)))
	(c).fields["m_bGoingForward"] = (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float(v_fOldZ))
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_SelectedEntity"), func(): return ((c).fields.get("m_SelectedEntity")).fields.get("m_bMovableInEditor"))) and R.truth((c).fields.get("m_bMouseDown"))) and (R.binary(">", R.call_static("Maths", "AbsNumber", [(R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX")) - float((c).fields.get("m_fMouseDownX")))]), 5) or R.binary(">", R.call_static("Maths", "AbsNumber", [(R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY")) - float((c).fields.get("m_fMouseDownY")))]), 5)))):
		pass
		(c).fields["m_bDraggingEntity"] = true
	R.call_member(c, "UpdateDraggedEntityPosition", [])
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))))):
		pass
		R.call_member(c, "UpdateAreaSpawning", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
			pass
			R.call_member(c, "UpdateCampaignSpawning", [v_fDeltaTime])
	return null

static func f_CanGoForward(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_iPatternPosition: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPatternPosition = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.unary("!", (c).fields.get("m_bPreview")))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
			pass
			v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			if R.truth((float(v_iPatternPosition) >= float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) - float(1))))):
				pass
				return false
	return true
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnKeyDown"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnKeyDown", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
			pass
			(c).fields["m_bGoLeft"] = true
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
				pass
				(c).fields["m_bGoRight"] = true
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
					pass
					(c).fields["m_bGoForward"] = true
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
						pass
						(c).fields["m_bGoBackward"] = true
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
							pass
							(c).fields["m_bGoFast"] = true
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_Delete"))):
								pass
								R.call_member(c, "DeleteSelectedEntity", [])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_C"))):
									pass
									R.call_member(c, "CopySelectedEntity", [])
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnKeyUp"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnKeyUp", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
			pass
			(c).fields["m_bGoLeft"] = false
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
				pass
				(c).fields["m_bGoRight"] = false
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
					pass
					(c).fields["m_bGoForward"] = false
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
						pass
						(c).fields["m_bGoBackward"] = false
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
							pass
							(c).fields["m_bGoFast"] = false
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_bCanBePlaced: Variant = false
	var v_selectedEntity: Variant = null
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_bCanBePlaced = false
	v_selectedEntity = R.coerce(null, "RDEntity")
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseDown"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseDown", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
			pass
			if R.truth((c).fields.get("m_PlacedEntity")):
				pass
				v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
				if R.truth(v_bCanBePlaced):
					pass
					(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
					(c).fields["m_bDraggingEntity"] = false
				else:
					pass
					R.call_member(c.fields.get("m_Game"), "PlayErrorSound", [])
					(c).fields["m_bAllowCannotPlaceSound"] = false
			else:
				pass
				v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
				while R.truth(v_entityNode):
					pass
					v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
					if R.truth(R.unary("!", R.call_member(c, "CanEntityBeSelected", [v_entity]))):
						pass
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
					else:
						pass
						if R.truth(R.logical_or(R.invoke(R.get_value(R.call_member(v_entity, "GetBulletHitMC", []), "hitTestPoint"), [R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), true]), func(): return (R.truth(R.call_member(v_entity, "GetSecondaryBulletHitMC", [])) and R.truth(R.invoke(R.get_value(R.call_member(v_entity, "GetSecondaryBulletHitMC", []), "hitTestPoint"), [R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), true]))))):
							pass
							v_selectedEntity = R.coerce(v_entity, "RDEntity")
							((c).fields.get("m_vDragOffset")).fields["X"] = float((R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX")) - R.num(R.get_value((v_selectedEntity).fields.get("m_MainMC"), "x"))))
							((c).fields.get("m_vDragOffset")).fields["Y"] = float((R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY")) - R.num(R.get_value((v_selectedEntity).fields.get("m_MainMC"), "y"))))
							(c).fields["m_fMouseDownX"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "Number")
							(c).fields["m_fMouseDownY"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "Number")
							break
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
				R.call_member(c, "SetSelectedEntity", [v_selectedEntity])
		(c).fields["m_bMouseDown"] = true
	return null

static func f_CanEntityBeSelected(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth(((R.truth(R.binary("as", v_entity, R.klass("RDRoadSlice"))) and R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))) and (float((c).fields.get("m_iPatternType")) != float(R.static_value("RDPatternInfo", "Type_Regular"))))):
		pass
		return false
	if R.truth((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		return false
	return (R.unary("!", (v_entity).fields.get("m_bDestroyMe")) and (v_entity).fields.get("m_bSelectableInEditor"))
	return null

static func f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_bCanBePlaced: Variant = false
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_bCanBePlaced = false
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseUp"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseUp", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		(c).fields["m_bMouseDown"] = false
		if R.truth((c).fields.get("m_PlacedEntity")):
			pass
			v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_PlacedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
			if R.truth((R.unary("!", v_bCanBePlaced) and (c).fields.get("m_bAllowCannotPlaceSound"))):
				pass
				R.call_member(c.fields.get("m_Game"), "PlayErrorSound", [])
		else:
			pass
			(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_bAllowCannotPlaceSound"] = true
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseOver"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseOver", [v_event]), "Boolean")
	if R.truth(v_bProcessed):
		pass
		pass
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseOut"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseOut", [v_event]), "Boolean")
	if R.truth(v_bProcessed):
		pass
		pass
	return null

static func f_OnInterfaceObjectSelected(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce(v_szName, "String")
	(c).fields["m_PlacedEntity"] = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [(c).fields.get("m_szCurrentSelectedObjectClass")]), "RDEntity")
	R.call_member((c).fields.get("m_PlacedEntity"), "SetEditorMode", [])
	R.call_member(c, "SetSelectedEntity", [(c).fields.get("m_PlacedEntity")])
	(c).fields["m_bDraggingEntity"] = true
	((c).fields.get("m_vDragOffset")).fields["X"] = float(0)
	((c).fields.get("m_vDragOffset")).fields["Y"] = float(0)
	R.call_member(c, "UpdateDraggedEntityPosition", [])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_PlacedEntity"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Y"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")])
	R.call_member((c).fields.get("m_PlacedEntity"), "UpdateFlip", [])
	(c).fields["m_bAllowCannotPlaceSound"] = false
	return null

static func f_UpdateDraggedEntityPosition(c: Variant, a: Array) -> Variant:
	var v_fNewZ: Variant = NAN
	var v_fRoadLimit: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_bCanBePlaced: Variant = false
	v_fNewZ = float(NAN)
	v_fRoadLimit = float(NAN)
	v_fNewX = float(NAN)
	v_fNewY = float(NAN)
	v_bCanBePlaced = false
	if R.truth((c).fields.get("m_bDraggingEntity")):
		pass
		R.call_member(c, "UpdateMouseWorldPos", [])
		v_fNewZ = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("Z"), 0.1, (float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))]), "Number")
		v_fRoadLimit = R.coerce(R.call_member((c).fields.get("m_Road"), "GetRoadLimitAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		if R.truth(((c).fields.get("m_SelectedEntity")).fields.get("m_bUseCollisionInEditor")):
			pass
			v_fNewX = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("X"), (R.num(R.unary("-", v_fRoadLimit)) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("X"))), (float(v_fRoadLimit) - float((float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("X")) + float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("W")))))]), "Number")
		else:
			pass
			v_fNewX = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("X"), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
		v_fNewY = float(0)
		v_fNewX = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "GetEditorAdjustedPosX", [v_fNewX]), "Number")
		R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "MoveEntity", [(c).fields.get("m_SelectedEntity"), (float(v_fNewX) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"))), (float(v_fNewY) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Y"))), (float(v_fNewZ) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z"))), null, null, false])
		R.call_member((c).fields.get("m_SelectedEntity"), "UpdateFlip", [])
		v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
		R.set_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "CannotPlaceIcon"), "visible", R.unary("!", v_bCanBePlaced), "=")
		if R.truth(R.unary("!", v_bCanBePlaced)):
			pass
			(c).fields["m_PlacedEntity"] = R.coerce((c).fields.get("m_SelectedEntity"), "RDEntity")
	return null

static func f_UpdateMouseWorldPos(c: Variant, a: Array) -> Variant:
	var v_bIntersect: Variant = false
	((c).fields.get("m_vMouseScreenPos")).fields["X"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "Number")
	((c).fields.get("m_vMouseScreenPos")).fields["Y"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "Number")
	if R.truth((c).fields.get("m_bDraggingEntity")):
		pass
		((c).fields.get("m_vMouseScreenPos")).fields["X"] = R.coerce(R.binary("-", ((c).fields.get("m_vMouseScreenPos")).fields.get("X"), ((c).fields.get("m_vDragOffset")).fields.get("X")), "Number")
		((c).fields.get("m_vMouseScreenPos")).fields["Y"] = R.coerce(R.binary("-", ((c).fields.get("m_vMouseScreenPos")).fields.get("Y"), ((c).fields.get("m_vDragOffset")).fields.get("Y")), "Number")
	R.call_member(c.fields.get("m_Camera"), "Unproject2DToDir3D", [(c).fields.get("m_vMouseScreenPos"), (c).fields.get("m_vMouseWorldDir")])
	v_bIntersect = R.coerce(R.call_static("Maths", "RayPlaneIntersection", [(c.fields.get("m_Camera")).fields.get("m_vLocation"), (c).fields.get("m_vMouseWorldDir"), R.static_value("DTVector3D", "Zero"), R.static_value("DTVector3D", "Up"), (c).fields.get("m_vMouseWorldPos")]), "Boolean")
	return null

static func f_DeleteSelectedEntity(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce("", "String")
	if R.truth((R.truth((c).fields.get("m_SelectedEntity")) and ((c).fields.get("m_SelectedEntity")).fields.get("m_bDeletableInEditor"))):
		pass
		((c).fields.get("m_SelectedEntity")).fields["m_bDestroyMe"] = true
		R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
	return null

static func f_CopySelectedEntity(c: Variant, a: Array) -> Variant:
	if R.truth(((R.truth((c).fields.get("m_SelectedEntity")) and R.truth(((c).fields.get("m_SelectedEntity")).fields.get("m_bDeletableInEditor"))) and R.unary("!", (c).fields.get("m_bDraggingEntity")))):
		pass
		(c).fields["m_PlacedEntity"] = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [((c).fields.get("m_SelectedEntity")).fields.get("m_szFactoryName")]), "RDEntity")
		R.call_member((c).fields.get("m_PlacedEntity"), "SetEditorMode", [])
		R.call_member(c, "SetSelectedEntity", [(c).fields.get("m_PlacedEntity")])
		(c).fields["m_bDraggingEntity"] = true
		((c).fields.get("m_vDragOffset")).fields["X"] = float(0)
		((c).fields.get("m_vDragOffset")).fields["Y"] = float(0)
		R.call_member(c, "UpdateDraggedEntityPosition", [])
		R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_PlacedEntity"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Y"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")])
		R.call_member((c).fields.get("m_PlacedEntity"), "UpdateFlip", [])
		(c).fields["m_bAllowCannotPlaceSound"] = false
	return null

static func f_OnUnselect(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce("", "String")
	R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
	return null

static func f_ToggleMusic(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMusic"] = R.coerce(R.binary("%", (float((c).fields.get("m_iMusic")) + float(1)), 5), "int")
	R.call_member(c, "PlayEditorMusic", [])
	return null

static func f_PlayEditorMusic(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [null])
	if R.truth((float((c).fields.get("m_iMusic")) == float(1))):
		pass
		R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_MenuMusic"), 0])
	else:
		pass
		if R.truth((float((c).fields.get("m_iMusic")) == float(2))):
			pass
			R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
		else:
			pass
			if R.truth((float((c).fields.get("m_iMusic")) == float(3))):
				pass
				R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_GameMusic"), 0])
			else:
				pass
				if R.truth((float((c).fields.get("m_iMusic")) == float(4))):
					pass
					R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_HighwayMusic"), 0])
	return null

static func f_SetSelectedEntity(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((c).fields.get("m_SelectedEntity")):
		pass
		R.call_member(c, "HighlightEntity", [(c).fields.get("m_SelectedEntity"), false])
	(c).fields["m_SelectedEntity"] = R.coerce(v_entity, "RDEntity")
	if R.truth((c).fields.get("m_SelectedEntity")):
		pass
		R.call_member(c, "HighlightEntity", [(c).fields.get("m_SelectedEntity"), true])
	R.call_member((c).fields.get("m_Interface"), "OnEntitySelected", [(c).fields.get("m_SelectedEntity")])
	return null

static func f_HighlightEntity(c: Variant, a: Array) -> Variant:
	var v_newColor: Variant = null
	var v_newFilters: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_newColor = R.coerce(null, "Color")
	v_newFilters = R.coerce(null, "Array")
	if R.truth(R.unary("!", v_entity)):
		pass
		return null
	if R.truth(R.binary("as", v_entity, R.klass("RDRoadSlice"))):
		pass
		v_newColor = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
		if R.truth(v_bHighlight):
			pass
			R.set_value(v_newColor, "redMultiplier", 0.8, "=")
			R.set_value(v_newColor, "greenMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueOffset", 30, "=")
		R.set_value(R.get_value((v_entity).fields.get("m_MainMC"), "transform"), "colorTransform", v_newColor, "=")
	else:
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		if R.truth(v_bHighlight):
			pass
			R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeEditor"), [187, 0.7])])
		R.set_value((v_entity).fields.get("m_MainMC"), "filters", v_newFilters, "=")
	return null

static func f_OnRoadSelected(c: Variant, a: Array) -> Variant:
	var v_roadSlice: Variant = null
	var v_iSliceType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_roadSlice = R.coerce(R.binary("as", (c).fields.get("m_SelectedEntity"), R.klass("RDRoadSlice")), "RDRoadSlice")
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, (v_roadSlice).fields.get("m_iIndex")])
	R.call_member(c, "DeleteUnplacableEntities", [])
	return null

static func f_DeleteUnplacableEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_bCanBePlaced: Variant = false
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	v_bCanBePlaced = false
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bSelectableInEditor") and (v_entity).fields.get("m_bDeletableInEditor"))):
			pass
			v_bCanBePlaced = R.coerce(R.call_member(v_entity, "CanBePlacedInEditorAt", [((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
			if R.truth(R.unary("!", v_bCanBePlaced)):
				pass
				(v_entity).fields["m_bDestroyMe"] = true
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null

static func f_GetPatternData(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_iNbProperties: Variant = 0
	var v_i: Variant = 0
	var v_prop: Variant = null
	var v_savedData: Variant = null
	var v_iNbEntities: Variant = 0
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	v_iNbProperties = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_prop = R.coerce(null, "RDProperty")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [(c).fields.get("m_iPatternType")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 0)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 1)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 2)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 3)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 4)])
	v_iNbEntities = R.coerce(0, "int")
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bDestroyMe") or R.unary("!", (v_entity).fields.get("m_bExportableInEditor")))):
			pass
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
		else:
			pass
			v_iNbEntities = R.signed32(v_iNbEntities + 1)
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbEntities])
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bDestroyMe") or R.unary("!", (v_entity).fields.get("m_bExportableInEditor")))):
			pass
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
		else:
			pass
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_entity).fields.get("m_szFactoryName")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("X")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("Y")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			v_iNbProperties = R.coerce((R.coerce(R.get_value((v_entity).fields.get("m_Properties"), "length"), "int") if R.truth((v_entity).fields.get("m_Properties")) else 0), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbProperties])
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbProperties))):
				pass
				v_prop = R.coerce(R.get_value((v_entity).fields.get("m_Properties"), v_i), "RDProperty")
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_prop).fields.get("m_szName")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [(v_prop).fields.get("m_iType")])
				if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
					pass
					R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_prop).fields.get("m_fNumberValue")])
				else:
					pass
					if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
						pass
						R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_prop).fields.get("m_bBooleanValue")])
					else:
						pass
						if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
							pass
							R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_prop).fields.get("m_szStringValue")])
				v_i = R.signed32(v_i + 1)
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return v_savedData
	return null

static func f_SaveFile(c: Variant, a: Array) -> Variant:
	var v_savedData: Variant = null
	var v_szSavedData: Variant = null
	var v_iconData: Variant = null
	var v_matrix: Variant = null
	var v_kongIcon: Variant = null
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bAsPrivate: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_savedData = R.coerce(null, "ByteArray")
	v_szSavedData = R.coerce(null, "String")
	v_iconData = R.coerce(null, "BitmapData")
	v_matrix = R.coerce(null, "Matrix")
	v_kongIcon = R.coerce(null, "Bitmap")
	(c).fields["m_iDataType"] = R.coerce(v_iDataType, "int")
	(c).fields["m_bSavedAsPrivate"] = v_bAsPrivate
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["m_szFileCategory"] = R.coerce(("PrivatePatterns" if R.truth(v_bAsPrivate) else "Patterns"), "String")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["m_szFileCategory"] = R.coerce(("PrivateAreas" if R.truth(v_bAsPrivate) else "Areas"), "String")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["m_szFileCategory"] = R.coerce(("PrivateCampaigns" if R.truth(v_bAsPrivate) else "Campaigns"), "String")
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
		(c).fields["m_fAPITimeoutTimer"] = float(10)
		(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [(c).fields.get("m_szFileCategory")]), "SaveQuery")
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_NAME"), "=", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text")])
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_ID"), "=", R.get_value(R.klass("com.newgrounds.API"), "userId")])
		R.call_member((c).fields.get("_query"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnSaveFileQueryDone"), false, 0, true])
		R.call_member((c).fields.get("_query"), "execute", [])
	else:
		pass
		if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
				pass
				v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
			else:
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
					pass
					v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
				else:
					pass
					if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
						pass
						v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
			v_szSavedData = R.coerce(R.invoke(R.resolve(c, "EncodeData", "RDGameModeEditor"), [v_savedData]), "String")
			v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
			v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
			R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
			R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
			R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
			v_kongIcon = R.coerce(R.construct(R.klass("Bitmap"), [v_iconData]), "Bitmap")
			R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "sharedContent"), "save"), [(c).fields.get("m_szFileCategory"), v_szSavedData, R.get_value(c, "OnKongFileSaved"), v_kongIcon])
		else:
			pass
			if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
					pass
					v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
				else:
					pass
					if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
						pass
						v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
					else:
						pass
						if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
							pass
							v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
				v_szSavedData = R.coerce(R.invoke(R.resolve(c, "EncodeData", "RDGameModeEditor"), [v_savedData]), "String")
				v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
				v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
				R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
				R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
				R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
				R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "initAGUI"), [{"onClose": R.get_value(c, "OnArmorGamesSubmitClose")}])
				R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showGameShareSubmit"), [v_szSavedData, R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text"), v_iconData, R.get_value(c, "OnArmorGamesShareDataClicked"), (c.fields.get("m_Game")).fields.get("m_RootMC")])
	return null

static func f_OnArmorGamesSubmitClose(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnArmorGamesShareDataClicked(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_data, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "name")])
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "data")])
	else:
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "error")])
	return null

static func f_OnKongFileSaved(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_params, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.binary("+", R.binary("+", R.binary("+", "Content saved, id:", R.get_value(v_params, "id")), ", name:"), R.get_value(v_params, "name"))])
	return null

static func f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.call_member((c).fields.get("m_Interface"), "OnKongCampaignLoad", [v_params])
	return null

static func f_OnSaveFileQueryDone(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	if R.truth(R.binary(">", R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), "length"), 0)):
		pass
		(c).fields["m_SaveFile"] = R.coerce(R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), 0), "com.newgrounds.SaveFile")
		R.call_member(c.fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_OverwriteFile")])
	else:
		pass
		R.call_member(c.fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_ConfirmSave")])
	return null

static func f_AcceptSave(c: Variant, a: Array) -> Variant:
	(c).fields["m_SaveFile"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveFile", [(c).fields.get("m_szFileCategory")]), "com.newgrounds.SaveFile")
	R.set_value((c).fields.get("m_SaveFile"), "name", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text"), "=")
	R.set_value((c).fields.get("m_SaveFile"), "description", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "DescriptionValue"), "text"), "=")
	R.call_member(c, "FinalizeSaveFile", [])
	return null

static func f_AcceptOverwrite(c: Variant, a: Array) -> Variant:
	R.call_member(c, "FinalizeSaveFile", [])
	return null

static func f_FinalizeSaveFile(c: Variant, a: Array) -> Variant:
	var v_savedData: Variant = null
	var v_iconData: Variant = null
	var v_matrix: Variant = null
	v_savedData = R.coerce(null, "ByteArray")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
	R.set_value((c).fields.get("m_SaveFile"), "data", v_savedData, "=")
	v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
	v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
	R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
	R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
	R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
	R.call_member((c).fields.get("m_SaveFile"), "createIcon", [v_iconData])
	R.set_value(R.get_value((c).fields.get("m_SaveFile"), "keys"), "FileVersion", R.static_value("RDGame", "CurrentFileVersion"), "=")
	R.call_member((c).fields.get("m_SaveFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), R.get_value(c, "OnSaveDataDone"), false, 0, true])
	R.call_member((c).fields.get("m_SaveFile"), "save", [])
	return null

static func f_OnSaveDataDone(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member((c).fields.get("m_SaveFile"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), R.get_value(c, "OnSaveDataDone")])
	(c).fields["m_SaveFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.call_member((c).fields.get("m_Interface"), "OnPatternPosted", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member((c).fields.get("m_Interface"), "OnAreaPosted", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.call_member((c).fields.get("m_Interface"), "OnCampaignPosted", [])
	if R.truth((((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign"))) and R.unary("!", (c).fields.get("m_bSavedAsPrivate"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "Mastermind"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "Mastermind")])
	return null

static func f_CancelLoadFiles(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	if R.truth((R.truth((c).fields.get("m_LoadedFiles")) and R.binary("<", (c).fields.get("m_iLoadFileIndex"), R.get_value((c).fields.get("m_LoadedFiles"), "length")))):
		pass
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
		R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	return null

static func f_LoadFiles(c: Variant, a: Array) -> Variant:
	var v_bSortDescending: Variant = false
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bPrivate: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iSorting: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iPage: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	(c).fields["m_iLoadDataType"] = R.coerce(v_iDataType, "int")
	(c).fields["m_iLoadDataSorting"] = R.coerce(v_iSorting, "int")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	R.call_member((c).fields.get("m_Interface"), "ClearLoadPanelSlots", [])
	v_bSortDescending = (float(v_iSorting) != float(R.static_value("RDGameModeEditor", "Sorting_Worst")))
	if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivatePatterns" if R.truth(v_bPrivate) else "Patterns")]), "SaveQuery")
	else:
		pass
		if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivateAreas" if R.truth(v_bPrivate) else "Areas")]), "SaveQuery")
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivateCampaigns" if R.truth(v_bPrivate) else "Campaigns")]), "SaveQuery")
	R.set_value((c).fields.get("_query"), "resultsPerPage", 18, "=")
	R.set_value((c).fields.get("_query"), "page", (float(v_iPage) + float(1)), "=")
	R.call_member((c).fields.get("_query"), "addCondition", ["FileVersion", "<=", R.static_value("RDGame", "CurrentFileVersion")])
	if R.truth(v_bPrivate):
		pass
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), "=", R.get_value(R.klass("com.newgrounds.API"), "username")])
	else:
		pass
		if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Yours")))):
			pass
			R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
		else:
			pass
			if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Recent")))):
				pass
				R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
			else:
				pass
				if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Best")))):
					pass
					R.call_member((c).fields.get("_query"), "sortOn", ["Rating", true])
				else:
					pass
					if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Worst")))):
						pass
						R.call_member((c).fields.get("_query"), "sortOn", ["Rating", false])
					else:
						pass
						if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Unrated")))):
							pass
							R.call_member((c).fields.get("_query"), "addCondition", ["Rating.votes", "=", 0])
						else:
							pass
							if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Random")))):
								pass
								R.set_value((c).fields.get("_query"), "isRandomized", true, "=")
		if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
			pass
			R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), "=", R.get_value(R.klass("com.newgrounds.API"), "username")])
	R.call_member((c).fields.get("_query"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnLoadFilesDone"), false, 0, true])
	R.call_member((c).fields.get("_query"), "execute", [])
	return null

static func f_OnLoadFilesDone(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v_i = R.coerce(0, "int")
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	v_slotMC = R.coerce(null, "MovieClip")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	(c).fields["_queryResults"] = R.coerce(R.get_value(R.get_value(v_e, "data"), "files"), "Array")
	(c).fields["m_LoadedFiles"] = R.coerce(R.construct(R.klass("Array"), [R.get_value((c).fields.get("_queryResults"), "length")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_queryResults"), "length"))):
		pass
		v_file = R.coerce(R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), v_i), "com.newgrounds.SaveFile")
		R.set_value((c).fields.get("m_LoadedFiles"), v_i, v_file, "=")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), v_i)]), "MovieClip")
		R.set_value(R.get_value(v_slotMC, "Loading"), "visible", R.binary("<", v_i, R.get_value((c).fields.get("m_LoadedFiles"), "length")), "=")
		R.set_value(v_slotMC, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	R.call_member(c, "LoadFile", [0])
	return null

static func f_LoadFile(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	if R.truth(R.binary("<", v_iIndex, R.get_value((c).fields.get("m_LoadedFiles"), "length"))):
		pass
		(c).fields["m_iLoadFileIndex"] = R.coerce(v_iIndex, "int")
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
		R.call_member(v_file, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded"), false, 0, true])
		R.call_member(v_file, "load", [])
	return null

static func f_OnFileLoaded(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_iconBitmap: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
	R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), (c).fields.get("m_iLoadFileIndex"))]), "MovieClip")
	R.set_value(R.get_value(v_slotMC, "Loading"), "visible", false, "=")
	R.set_value(v_slotMC, "mouseEnabled", true, "=")
	v_iconBitmap = R.coerce(R.construct(R.klass("Bitmap"), [R.get_value(v_file, "icon")]), "Bitmap")
	R.invoke(R.get_value(v_slotMC, "addChild"), [v_iconBitmap])
	R.set_value(c, "m_iLoadFileIndex", 1, "+=")
	R.call_member(c, "LoadFile", [(c).fields.get("m_iLoadFileIndex")])
	return null

static func f_TestPattern(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c.fields.get("m_Game"), "PlayCustomPattern", [R.call_member(c, "GetPatternData", [])])
	return null

static func f_NewPattern(c: Variant, a: Array) -> Variant:
	var v_iSliceType: Variant = 0
	var v_iPatternType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iSliceType = R.coerce(0, "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_iPatternType"] = R.coerce(v_iPatternType, "int")
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Pattern")])
	if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Regular")))):
		pass
		v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Town"), "int")
	else:
		pass
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Highway"), "int")
		else:
			pass
			v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Alleyway"), "int")
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 0])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 1])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 2])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 3])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 4])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	return null

static func f_LoadPatternFileData(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_LoadedPatternFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedPatternFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedPatternFileRated"] = false
	v_patternData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedPatternFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null

static func f_LoadPatternFileDataString(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["m_bLoadedPatternFileOwned"] = false
	(c).fields["m_bLoadedPatternFileRated"] = false
	v_patternData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null

static func f_GetAreaData(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_savedData: Variant = null
	var v_i: Variant = 0
	var v_areaInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDAreaInfo")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"))):
		pass
		v_patternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_i), R.klass("RDPatternInfo")), "RDPatternInfo")
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szName")])
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szDescription")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_patternInfo).fields.get("m_iID")])
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szAuthorName")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Data"), "length")])
		R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Data")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Icon"), "length")])
		R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Icon")])
		v_i = R.signed32(v_i + 1)
	return v_savedData
	return null

static func f_LoadAreaData(c: Variant, a: Array) -> Variant:
	var v_iFileVersion: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bNewArea: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	v_iFileVersion = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	if R.truth(v_bNewArea):
		pass
		R.call_member(c, "NewArea", [])
	if R.truth(v_savedData):
		pass
		R.set_value(v_savedData, "position", 0, "=")
		v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
			pass
			v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbPatterns))):
				pass
				v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
				(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
				v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
				R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
				R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
				(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
				R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
				R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
				v_i = R.signed32(v_i + 1)
	R.call_member(c, "ResetAreaSpawning", [])
	return null

static func f_UpdateAreaSpawning(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = 0
	var v_patternInfo: Variant = null
	var v_iPatternPosition: Variant = 0
	v_iIndex = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	if R.truth((c).fields.get("m_bGoingForward")):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
	while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
		pass
		if R.truth(R.binary(">", R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)):
			pass
			v_iIndex = R.coerce(R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), R.binary("%", (c).fields.get("m_iCurrentPatternPosition"), R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
			v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
			(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
			R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
			if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
				pass
				R.call_member(c, "RemoveAreaPatternEntities", [0])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
				R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
		R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
	while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
		pass
		if R.truth(R.binary(">", R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)):
			pass
			R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
			R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
			v_iIndex = R.coerce(R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), R.binary("%", v_iPatternPosition, R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
			v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
			(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
			R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
		R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
	if R.truth(R.unary("!", (c).fields.get("m_bGoingForward"))):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	return null

static func f_RemoveAreaPatternEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_patternEntities: Variant = null
	var v_j: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_entity = R.coerce(null, "RDEntity")
	v_patternEntities = R.coerce(R.get_value((c).fields.get("m_AreaPatternEntities"), v_iIndex), "Array")
	v_j = R.coerce(0, "int")
	while R.truth(R.binary("<", v_j, R.get_value(v_patternEntities, "length"))):
		pass
		v_entity = R.coerce(R.get_value(v_patternEntities, v_j), "RDEntity")
		(v_entity).fields["m_bDestroyMe"] = true
		v_j = R.signed32(v_j + 1)
	return null

static func f_ResetAreaSpawning(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_iCurrentPatternPosition"] = R.coerce(0, "int")
	(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AreaPatternEntities"), "length"))):
		pass
		R.call_member(c, "RemoveAreaPatternEntities", [v_i])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float((R.num(R.get_value((((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "length")) * float(10))))):
		pass
		R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "push"), [R.binary("as", R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "Reset", [])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	return null

static func f_ResetAreaPatternIndices(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.invoke(R.get_value((((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
		pass
		R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [v_i])
		v_i = R.signed32(v_i + 1)
	return null

static func f_ResetGroupAreaIndices(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_group: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDAreaGroup")
	R.invoke(R.get_value(((v_group).fields.get("m_AreaIndices")).fields.get("m_Values"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((v_group).fields.get("m_Areas"), "length"))):
		pass
		R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [v_i])
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnEntityAddedToWorld(c: Variant, a: Array) -> Variant:
	var v_patternEntities: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_patternEntities = R.coerce(null, "Array")
	if R.truth((((c).fields.get("m_bPreview") and ((float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))) or (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign"))))) or (R.unary("!", (c).fields.get("m_bPreview")) and ((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) or (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))))))):
		pass
		v_patternEntities = R.coerce(R.get_value((c).fields.get("m_AreaPatternEntities"), (c).fields.get("m_iLoadPatternIndex")), "Array")
		R.invoke(R.get_value(v_patternEntities, "push"), [v_entity])
	return null

static func f_TestArea(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomArea", [R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")])])
	return null

static func f_NewArea(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(12))):
		pass
		R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_Town"), v_i])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Area")])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "splice"), [0])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "Clear", [])
	(c).fields["m_AreaPatternEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null

static func f_LoadAreaFileData(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member(c, "NewArea", [])
	(c).fields["m_LoadedAreaFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedAreaFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedAreaFileRated"] = false
	v_areaData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedAreaFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	return null

static func f_LoadAreaFileDataString(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(c, "NewArea", [])
	(c).fields["m_bLoadedAreaFileOwned"] = false
	(c).fields["m_bLoadedAreaFileRated"] = false
	v_areaData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	return null

static func f_GetCampaignData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_t: Variant = 0
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_savedData: Variant = null
	var v_iNbDialogs: Variant = 0
	var v_g: Variant = 0
	v_i = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iType")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAirStrikes")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iOilLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode")])
	v_iNbDialogs = R.coerce(R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "length"), "int"), "int")
	R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbDialogs])
	v_t = R.coerce(0, "int")
	while R.truth((float(v_t) < float(v_iNbDialogs))):
		pass
		R.invoke(R.get_value(v_savedData, "writeUTF"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), v_t)])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), v_t)])
		v_t = R.signed32(v_t + 1)
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")])
	v_g = R.coerce(0, "int")
	while R.truth(R.binary("<", v_g, R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
		pass
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_g), "RDAreaGroup")
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_group).fields.get("m_szName")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_group).fields.get("m_iMinLength")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_group).fields.get("m_iMaxLength")])
		R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_group).fields.get("m_bCanBeFirst")])
		R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_group).fields.get("m_bRandomized")])
		v_iNbLinkedGroups = R.coerce(R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), "length"), "int"), "int")
		R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbLinkedGroups])
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
			pass
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_group).fields.get("m_LinkedGroups"), v_i)])
			v_i = R.signed32(v_i + 1)
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_group).fields.get("m_Areas"), "length")])
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((v_group).fields.get("m_Areas"), "length"))):
			pass
			v_areaInfo = R.coerce(R.binary("as", R.get_value((v_group).fields.get("m_Areas"), v_i), R.klass("RDAreaInfo")), "RDAreaInfo")
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szName")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szDescription")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iID")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szAuthorName")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iType")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szAreaName")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iAreaLength")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bAllowFlip")])
			v_iNbDialogs = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "length"), "int"), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbDialogs])
			v_t = R.coerce(0, "int")
			while R.truth((float(v_t) < float(v_iNbDialogs))):
				pass
				R.invoke(R.get_value(v_savedData, "writeUTF"), [R.get_value((v_areaInfo).fields.get("m_DialogTexts"), v_t)])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_DialogCues"), v_t)])
				v_t = R.signed32(v_t + 1)
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOverrideSpawning")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fHellfireDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iHellfireLevel")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fJetDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iJetDrops")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fMutantDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iMutantCount")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bRandomizeSpawningValues")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fPlayerSpeedFactor")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFullSpeedMode")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bLavaMode")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bLavaInstantKill")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFog")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fForcedStopDuration")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOverrideDifficulty")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fPatternRatio")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fSpawnRate")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bSpikeSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bBombSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOil")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bSpike")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bMine")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bExplodingCar")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bGrub")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bBaseSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bNoSoldierZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bAllSoldierZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFUBARMode")])
			v_iDataSize = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_Data"), "length"), "int"), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iDataSize])
			R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")])
			v_j = R.coerce(0, "int")
			while R.truth(R.binary("<", v_j, R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"))):
				pass
				v_patternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_j), R.klass("RDPatternInfo")), "RDPatternInfo")
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szName")])
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szDescription")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [(v_patternInfo).fields.get("m_iID")])
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szAuthorName")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Data"), "length")])
				R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
				R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Data")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Icon"), "length")])
				R.set_value((v_patternInfo).fields.get("m_Icon"), "position", 0, "=")
				R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Icon")])
				v_j = R.signed32(v_j + 1)
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Icon"), "length")])
			R.set_value((v_areaInfo).fields.get("m_Icon"), "position", 0, "=")
			R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_areaInfo).fields.get("m_Icon")])
			v_i = R.signed32(v_i + 1)
		v_g = R.signed32(v_g + 1)
	return v_savedData
	return null

static func f_LoadCampaignData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_iFileVersion: Variant = 0
	var v_iCampaignType: Variant = 0
	var v_iNbDialogs: Variant = 0
	var v_t: Variant = 0
	var v_iNbGroups: Variant = 0
	var v_g: Variant = 0
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_iNbAreas: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_i = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_iFileVersion = R.coerce(0, "int")
	v_iCampaignType = R.coerce(0, "int")
	v_iNbDialogs = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_iNbGroups = R.coerce(0, "int")
	v_g = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_iNbAreas = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	if R.truth(v_savedData):
		pass
		R.set_value(v_savedData, "position", 0, "=")
		v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
			pass
			v_iCampaignType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			R.call_member(c, "NewCampaign", [v_iCampaignType])
			((c).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iGoalTarget"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_bTiresBlown"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAirStrikes"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoWeapons"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoAmmoPoints"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoReplenish"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteAmmo"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInvincibleHellfire"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_fBounceFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bMountedMG"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bMountedRocketLauncher"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteMountedWeapon"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoDriverSwitch"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bArcadeAmmoPickup"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSteering"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoBraking"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSwerving"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerBodyHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fOilSlipperinessFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fImpactSpeedLossFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bExplodingZombies"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAlwaysCling"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoBackgroundCity"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoChopperSupport"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			R.call_member(c, "SetNoBackgroundCity", [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
			((c).fields.get("m_CampaignInfo")).fields["m_fStartingTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fMutantKilledTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fFeedersHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fCivilianShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fCivilianHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fHellfireDefeatedTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_iDifficultyLevelLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_fBasePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditivePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_iSpikeSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iBombSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iOilLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iSpikeLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iMineLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iExplodingCarLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iGrubLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iZombieLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iBaseSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_t = R.coerce(0, "int")
			while R.truth((float(v_t) < float(v_iNbDialogs))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				v_t = R.signed32(v_t + 1)
			((c).fields.get("m_CampaignInfo")).fields["m_Groups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
			v_iNbGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_g = R.coerce(0, "int")
			while R.truth((float(v_g) < float(v_iNbGroups))):
				pass
				v_group = R.coerce(R.construct(R.klass("RDAreaGroup"), []), "RDAreaGroup")
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "push"), [v_group])
				(v_group).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_group).fields["m_iMinLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_group).fields["m_iMaxLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_group).fields["m_bCanBeFirst"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_group).fields["m_bRandomized"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iNbLinkedGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
					pass
					R.invoke(R.get_value((v_group).fields.get("m_LinkedGroups"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
					v_i = R.signed32(v_i + 1)
				v_iNbAreas = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(v_iNbAreas))):
					pass
					v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
					(v_areaInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_szAreaName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iAreaLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_bAllowFlip"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					v_t = R.coerce(0, "int")
					while R.truth((float(v_t) < float(v_iNbDialogs))):
						pass
						R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
						R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
						v_t = R.signed32(v_t + 1)
					(v_areaInfo).fields["m_bOverrideSpawning"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_fJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_fMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bFullSpeedMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bLavaMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bLavaInstantKill"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fForcedStopDuration"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bOverrideDifficulty"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fPatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_fSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bSpikeSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bBombSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bOil"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bSpike"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bMine"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bExplodingCar"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bGrub"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bBaseSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					v_iDataSize = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
					v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					v_j = R.coerce(0, "int")
					while R.truth((float(v_j) < float(v_iNbPatterns))):
						pass
						v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
						(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
						R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
						v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
						R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
						R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
						R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
						(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
						R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
						R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
						v_j = R.signed32(v_j + 1)
					v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Icon"), 0, v_iIconBytes])
					R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
					R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
					v_i = R.signed32(v_i + 1)
				v_g = R.signed32(v_g + 1)
	else:
		pass
		R.call_member(c, "NewCampaign", [R.static_value("RDCampaignInfo", "Type_Unset")])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null

static func f_UpdateCampaignSpawning(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = 0
	var v_areaInfo: Variant = null
	var v_patternInfo: Variant = null
	var v_iAreaIndex: Variant = 0
	var v_group: Variant = null
	var v_iPatternPosition: Variant = 0
	var v_iSliceIndex: Variant = NAN
	var v_iPreviousAreaIndex: Variant = 0
	var v_iEnding: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iStartSliceIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_bAddingValues: Variant = false
	var v_iActualAreaIndex: Variant = 0
	var v_iActualPatternIndex: Variant = 0
	var v_iRandomLinkedGroup: Variant = 0
	var v_newGroup: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iIndex = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iAreaIndex = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPatternPosition = R.coerce(0, "int")
	v_iSliceIndex = float(NAN)
	v_iPreviousAreaIndex = R.coerce(0, "int")
	v_iEnding = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iStartSliceIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_bAddingValues = false
	v_iActualAreaIndex = R.coerce(0, "int")
	v_iActualPatternIndex = R.coerce(0, "int")
	v_iRandomLinkedGroup = R.coerce(0, "int")
	v_newGroup = R.coerce(null, "RDAreaGroup")
	if R.truth((c).fields.get("m_bGoingForward")):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
		if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
			pass
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
				pass
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
				(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
				if R.truth(R.binary("<", (c).fields.get("m_iCurrentPatternPosition"), R.get_value((c).fields.get("m_CampaignAreaIndices"), "length"))):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), (c).fields.get("m_iCurrentPatternPosition")), "int"), "int")
					v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), (c).fields.get("m_iCurrentPatternPosition")), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
					R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				else:
					pass
					v_iStartSliceIndex = R.coerce((float(floorf(float(R.binary("/", (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), R.static_value("RDRoad", "RenderStepSize"))))) - float(((c).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(0))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(1))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(2))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(3))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(4))])
				if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
					pass
					R.call_member(c, "RemoveAreaPatternEntities", [0])
					R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
					R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
			while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
				pass
				R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
				R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
				(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
				if R.truth(R.binary("<", v_iPatternPosition, R.get_value((c).fields.get("m_CampaignAreaIndices"), "length"))):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
					v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), v_iPatternPosition), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
					R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				else:
					pass
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
			v_iSliceIndex = float(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), R.static_value("RDRoad", "RenderStepSize")))))
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
			v_iPreviousAreaIndex = R.coerce((R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), (float(v_iPatternPosition) - float(1))), "int") if R.truth((float(v_iPatternPosition) > float(0))) else v_iAreaIndex), "int")
			if R.truth(((c).fields.get("m_bPlayAreaDialog") and ((float(v_iSliceIndex) == float(0)) or (float(v_iAreaIndex) != float(v_iPreviousAreaIndex))))):
				pass
				v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
				R.call_member(c, "PlayAreaDialog", [(v_areaInfo).fields.get("m_DialogCues"), (v_areaInfo).fields.get("m_DialogTexts"), 0])
				(c).fields["m_bPlayAreaDialog"] = false
				(c).fields["m_iPlayingAreaDialogAreaIndex"] = R.coerce(v_iAreaIndex, "int")
			if R.truth(((float(v_iSliceIndex) != float(0)) and (float(v_iAreaIndex) == float(v_iPreviousAreaIndex)))):
				pass
				(c).fields["m_bPlayAreaDialog"] = true
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
					R.call_member(c, "OnDialogBoxEnded", [])
			if R.truth(((R.truth(R.logical_and((c).fields.get("m_DialogCueSound"), func(): return R.call_member((c).fields.get("m_DialogCueSound"), "IsPlaying", []))) or R.truth(R.call_member(c, "HasEndingSoundPlaying", []))) and (float(v_iAreaIndex) < float((c).fields.get("m_iPlayingAreaDialogAreaIndex"))))):
				pass
				R.call_member(c, "StopAreaDialog", [])
				R.call_member(c, "StopEndingSounds", [])
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			v_iEnding = R.coerce(((v_areaInfo).fields.get("m_iType") if R.truth(((float((v_areaInfo).fields.get("m_iType")) != float(R.static_value("RDAreaInfo", "Type_Normal"))) and (float(v_iPatternPosition) >= float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) - float(1)))))) else R.static_value("RDAreaInfo", "Type_Normal")), "int")
			if R.truth((float(v_iEnding) != float((c).fields.get("m_iEndingType")))):
				pass
				(c).fields["m_iEndingType"] = R.coerce(v_iEnding, "int")
				R.call_member((c).fields.get("m_Interface"), "ShowEnding", [v_iEnding])
				if R.truth((float((c).fields.get("m_iEndingType")) != float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
					pass
					if R.truth((c).fields.get("m_CarDrivingAway")):
						pass
						((c).fields.get("m_CarDrivingAway")).fields["m_bDestroyMe"] = true
				else:
					pass
					R.call_member(c.fields.get("m_Game"), "DoFlash", [0.5, 0.5])
					(c).fields["m_CarDrivingAway"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCarDrivingAway")]), R.klass("RDCarDrivingAway")), "RDCarDrivingAway")
					R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CarDrivingAway"), 0, 0, ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")])
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	else:
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
				pass
				v_bAddingValues = R.binary(">=", (c).fields.get("m_iCurrentPatternPosition"), R.get_value((c).fields.get("m_ChallengeGroups"), "length"))
				v_iGroupIndex = R.coerce(((c).fields.get("m_iCurrentGroupIndex") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
				v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
				if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
					pass
					v_iActualAreaIndex = R.coerce(((c).fields.get("m_iCurrentAreaIndex") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
					v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					if R.truth(R.binary(">", R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"), 0)):
						pass
						v_iActualPatternIndex = R.coerce(((c).fields.get("m_iCurrentPatternPosition") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
						v_iPatternIndex = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_RandomPatternsIndices"), R.binary("%", v_iActualPatternIndex, R.get_value((v_areaInfo).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
						v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
						(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
						R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
						if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
							pass
							R.call_member(c, "RemoveAreaPatternEntities", [0])
							R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
							R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
				if R.truth(v_bAddingValues):
					pass
					R.set_value(c, "m_iChallengePatternCount", 1, "+=")
					R.set_value(c, "m_iChallengeAreaCount", 1, "+=")
					v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
					if R.truth((float((c).fields.get("m_iChallengeAreaCount")) == float((v_group).fields.get("m_iLength")))):
						pass
						v_iRandomLinkedGroup = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((v_group).fields.get("m_LinkedGroups"), "length")]), "int")
						(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), v_iRandomLinkedGroup), "int")
						v_newGroup = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
						(v_newGroup).fields["m_iLength"] = R.coerce(R.binary("+", (v_newGroup).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((v_newGroup).fields.get("m_iMaxLength")) - float((v_newGroup).fields.get("m_iMinLength")))])), "int")
						(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
						(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
						(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
					else:
						pass
						if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
							pass
							v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
							if R.truth((float((c).fields.get("m_iChallengePatternCount")) == float((v_areaInfo).fields.get("m_iAreaLength")))):
								pass
								R.set_value(c, "m_iCurrentAreaIndex", 1, "+=")
								(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
					R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "push"), [v_iGroupIndex])
					R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "push"), [v_iAreaIndex])
					R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "push"), [v_iPatternIndex])
			while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
				pass
				v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iPatternPosition), "int"), "int")
				v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
				if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iPatternPosition), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					if R.truth(R.binary(">", R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"), 0)):
						pass
						R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
						R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
						v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iPatternPosition), "int"), "int")
						v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
						(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
						R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
			if R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_fDialogOffset")))):
				pass
				if R.truth((c).fields.get("m_bPlayAreaDialog")):
					pass
					R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), ((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), 0])
					(c).fields["m_bPlayAreaDialog"] = false
			else:
				pass
				(c).fields["m_bPlayAreaDialog"] = true
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
					R.call_member(c, "OnDialogBoxEnded", [])
	if R.truth(R.unary("!", (c).fields.get("m_bGoingForward"))):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	return null

static func f_ResetCampaignSpawning(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "group": "RDAreaGroup", "iArea": "int", "areaInfo": "RDAreaInfo", "fPosition": "Number", "fNextAreaPos": "Number", "g": "int", "a": "int", "area": "RDAreaInfo"}
	l["i"] = 0
	l["group"] = null
	l["iArea"] = 0
	l["areaInfo"] = null
	l["fPosition"] = NAN
	l["fNextAreaPos"] = NAN
	l["g"] = 0
	l["a"] = 0
	l["area"] = null
	R.lset(l, "i", 0)
	R.lset(l, "group", null)
	R.lset(l, "iArea", 0)
	R.lset(l, "areaInfo", null)
	R.lset(l, "fPosition", NAN)
	R.lset(l, "fNextAreaPos", NAN)
	R.lset(l, "g", 0)
	R.lset(l, "a", 0)
	R.lset(l, "area", null)
	R.call_member(c, "StopAreaDialog", [])
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_iCurrentPatternPosition"] = R.coerce(0, "int")
	(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
	R.lset(l, "i", 0, "=")
	while R.truth(R.binary("<", R.lget(l, "i"), R.get_value((c).fields.get("m_AreaPatternEntities"), "length"))):
		pass
		R.call_member(c, "RemoveAreaPatternEntities", [R.lget(l, "i")])
		R.binary("-", R.lset(l, "i", 1, "+="), 1)
	R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0])
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "=")
		if R.truth(R.binary(">", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"), 0)):
			pass
			R.lset(l, "iArea", 0, "=")
			R.lset(l, "areaInfo", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "iArea")), "=")
			R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
			R.lset(l, "fPosition", 0, "=")
			R.lset(l, "fNextAreaPos", (float((float((R.lget(l, "areaInfo")).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), "=")
			R.invoke(R.get_value((c).fields.get("m_CampaignAreaIndices"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_CampaignPatternIndices"), "splice"), [0])
			while R.truth(R.binary("<", R.lget(l, "iArea"), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
				pass
				R.invoke(R.get_value((c).fields.get("m_CampaignAreaIndices"), "push"), [R.lget(l, "iArea")])
				R.invoke(R.get_value((c).fields.get("m_CampaignPatternIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
				R.lset(l, "fPosition", (float(5) * float(R.static_value("RDRoad", "RenderStepSize"))), "+=")
				if R.truth((float(R.lget(l, "fPosition")) >= float(R.lget(l, "fNextAreaPos")))):
					pass
					if R.truth(R.binary("<", R.lset(l, "iArea", 1, "+="), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
						pass
						R.lset(l, "areaInfo", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "iArea")), "=")
						R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
						R.lset(l, "fNextAreaPos", (float((float((R.lget(l, "areaInfo")).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), "+=")
	else:
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "splice"), [0])
			R.lset(l, "i", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "i"), R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
				pass
				R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), R.lget(l, "i")), "=")
				if R.truth((R.lget(l, "group")).fields.get("m_bCanBeFirst")):
					pass
					R.invoke(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "push"), [R.lget(l, "i")])
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			if R.truth(R.binary(">", R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "length"), 0)):
				pass
				(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "length")])), "int")
			else:
				pass
				(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
			(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
			R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "=")
			(R.lget(l, "group")).fields["m_iLength"] = R.coerce(R.binary("+", (R.lget(l, "group")).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((float((R.lget(l, "group")).fields.get("m_iMaxLength")) - float((R.lget(l, "group")).fields.get("m_iMinLength")))) + float(1))])), "int")
			(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
			(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
			R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "splice"), [0])
			R.lset(l, "g", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "g"), R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
				pass
				R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), R.lget(l, "g")), "=")
				if R.truth((R.lget(l, "group")).fields.get("m_bRandomized")):
					pass
					R.call_member((R.lget(l, "group")).fields.get("m_AreaIndices"), "Reset", [])
					R.invoke(R.get_value((R.lget(l, "group")).fields.get("m_RandomAreaIndices"), "splice"), [0])
					R.lset(l, "i", 0, "=")
					while R.truth((float(R.lget(l, "i")) < float((R.num(R.get_value(((R.lget(l, "group")).fields.get("m_AreaIndices")).fields.get("m_Values"), "length")) * float(10))))):
						pass
						R.invoke(R.get_value((R.lget(l, "group")).fields.get("m_RandomAreaIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "group")).fields.get("m_AreaIndices"), "GetRandomValue", []), R.klass("int"))])
						R.binary("-", R.lset(l, "i", 1, "+="), 1)
				R.lset(l, "a", 0, "=")
				while R.truth(R.binary("<", R.lget(l, "a"), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
					pass
					R.lset(l, "area", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "a")), "=")
					R.call_member((R.lget(l, "area")).fields.get("m_PatternsIndices"), "Reset", [])
					R.invoke(R.get_value((R.lget(l, "area")).fields.get("m_RandomPatternsIndices"), "splice"), [0])
					R.lset(l, "i", 0, "=")
					while R.truth((float(R.lget(l, "i")) < float((R.num(R.get_value(((R.lget(l, "area")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "length")) * float(10))))):
						pass
						R.invoke(R.get_value((R.lget(l, "area")).fields.get("m_RandomPatternsIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "area")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
						R.binary("-", R.lset(l, "i", 1, "+="), 1)
					R.binary("-", R.lset(l, "a", 1, "+="), 1)
				R.binary("-", R.lset(l, "g", 1, "+="), 1)
	R.call_member((c).fields.get("m_Road"), "Reset", [])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	return null

static func f_HasEndingSoundPlaying(c: Variant, a: Array) -> Variant:
	return R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.call_member((c).fields.get("m_ChopperSound"), "IsPlaying", []), func(): return R.call_member((c).fields.get("m_NukeSound"), "IsPlaying", [])), func(): return R.call_member((c).fields.get("m_NukeWaveSound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "IsPlaying", []))
	return null

static func f_IsOnHighway(c: Variant, a: Array) -> Variant:
	var v_iPatternPosition: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_patternInfo: Variant = null
	v_iPatternPosition = R.coerce(maxf(float((float(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))))) - float(1))), float(0)), "int")
	v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
	v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), v_iPatternPosition), "int"), "int")
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
	v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
	v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
	return (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
	return null

static func f_TestCampaign(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomCampaign", [R.call_member(c, "GetCampaignData", [])])
	return null

static func f_NewCampaign(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_CarDrivingAway"] = R.coerce(null, "RDCarDrivingAway")
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(12))):
		pass
		R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_Town"), v_i])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Area")])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	(c).fields["m_CampaignInfo"] = R.coerce(R.construct(R.klass("RDCampaignInfo"), []), "RDCampaignInfo")
	((c).fields.get("m_CampaignInfo")).fields["m_iType"] = R.coerce(v_iType, "int")
	R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [""])
	(c).fields["m_AreaPatternEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null

static func f_LoadCampaignFileData(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_SaveFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_campaignData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_SaveFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	return null

static func f_LoadCampaignFileDataString(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_campaignData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	return null

static func f_OnInterfaceModeSet(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	if R.truth((((float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or (float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Area")))) or (float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))))):
		pass
		(c).fields["m_iLastInterfaceMode"] = R.coerce(v_iMode, "int")
	return null

static func f_SaveCurrentPatternData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedPatternData"] = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	(c).fields["m_fSavedPatternCamX"] = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"))
	(c).fields["m_fSavedPatternCamZ"] = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))
	return null

static func f_SaveCurrentAreaData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedAreaData"] = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
	return null

static func f_SaveCurrentCampaignData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedCampaignData"] = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
	return null

static func f_AddPatternInArea(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_patternInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
	(v_patternInfo).fields["m_szName"] = R.coerce(R.get_value(v_file, "name"), "String")
	(v_patternInfo).fields["m_szDescription"] = R.coerce(R.get_value(v_file, "description"), "String")
	(v_patternInfo).fields["m_iID"] = R.coerce(R.get_value(v_file, "id"), "int")
	(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.get_value(v_file, "authorName"), "String")
	(v_patternInfo).fields["m_Icon"] = R.coerce(R.invoke(R.get_value(R.get_value(v_file, "icon"), "getPixels"), [R.construct(R.klass("Rectangle"), [0, 0, R.get_value(R.get_value(v_file, "icon"), "width"), R.get_value(R.get_value(v_file, "icon"), "height")])]), "ByteArray")
	(v_patternInfo).fields["m_Data"] = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
	R.call_member(c, "ResetAreaSpawning", [])
	return null

static func f_AddPatternInAreaFromString(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iID: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_szData: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
	(v_patternInfo).fields["m_szName"] = R.coerce(v_szName, "String")
	(v_patternInfo).fields["m_szDescription"] = R.coerce("", "String")
	(v_patternInfo).fields["m_iID"] = R.coerce(v_iID, "int")
	(v_patternInfo).fields["m_szAuthorName"] = R.coerce("", "String")
	(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	(v_patternInfo).fields["m_Data"] = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
	R.call_member(c, "ResetAreaSpawning", [])
	return null

static func f_GetLoadedPatternType(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_file: Variant = null
	var v_patternData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iType = R.coerce(0, "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_patternData = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value(v_patternData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iType = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	return v_iType
	return null

static func f_GetLoadedPatternTypeFromString(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_patternData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_iType = R.coerce(0, "int")
	v_patternData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value(v_patternData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iType = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	return v_iType
	return null

static func f_AddAreaInCampaign(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_file: Variant = null
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_group: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iGroupIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
	(v_areaInfo).fields["m_szName"] = R.coerce(R.get_value(v_file, "name"), "String")
	(v_areaInfo).fields["m_szDescription"] = R.coerce(R.get_value(v_file, "description"), "String")
	(v_areaInfo).fields["m_iID"] = R.coerce(R.get_value(v_file, "id"), "int")
	(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.get_value(v_file, "authorName"), "String")
	(v_areaInfo).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	(v_areaInfo).fields["m_Icon"] = R.coerce(R.invoke(R.get_value(R.get_value(v_file, "icon"), "getPixels"), [R.construct(R.klass("Rectangle"), [0, 0, R.get_value(R.get_value(v_file, "icon"), "width"), R.get_value(R.get_value(v_file, "icon"), "height")])]), "ByteArray")
	(v_areaInfo).fields["m_Data"] = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
			R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
			(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [""])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
	R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null

static func f_AddAreaInCampaignFromString(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_group: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iID: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_szData: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_iGroupIndex: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
	(v_areaInfo).fields["m_szName"] = R.coerce(v_szName, "String")
	(v_areaInfo).fields["m_szDescription"] = R.coerce("", "String")
	(v_areaInfo).fields["m_iID"] = R.coerce(v_iID, "int")
	(v_areaInfo).fields["m_szAuthorName"] = R.coerce("", "String")
	(v_areaInfo).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	(v_areaInfo).fields["m_Data"] = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
			R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
			(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [""])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
	R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null

static func f_PreviewPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Pattern"), "int")
	(c).fields["m_LoadedPatternPreviewFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternPreviewFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedPatternPreviewFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedPatternPreviewFileRated"] = false
	v_patternData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedPatternPreviewFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null

static func f_PreviewArea(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Area"), "int")
	(c).fields["m_LoadedAreaPreviewFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaPreviewFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedAreaPreviewFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedAreaPreviewFileRated"] = false
	v_areaData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedAreaPreviewFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	R.call_member(c, "ResetAreaSpawning", [])
	return null

static func f_PreviewCampaign(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_campaignData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Campaign"), "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_campaignData = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null

static func f_EndPreview(c: Variant, a: Array) -> Variant:
	(c).fields["m_bPreview"] = false
	if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.call_member(c, "LoadSavedPattern", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.call_member(c, "LoadSavedArea", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
				pass
				R.call_member(c, "LoadSavedCampaign", [])
	return null

static func f_LoadSavedPattern(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadPatternData", [(c).fields.get("m_SavedPatternData")])
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fSavedPatternCamX"))
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float((c).fields.get("m_fSavedPatternCamZ"))
	return null

static func f_LoadSavedArea(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadAreaData", [(c).fields.get("m_SavedAreaData")])
	return null

static func f_LoadSavedCampaign(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadCampaignData", [(c).fields.get("m_SavedCampaignData")])
	return null

static func f_GetCameraPosLimit(c: Variant, a: Array) -> Variant:
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))))):
		pass
		return (float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))
	return (float((float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))
	return null

static func f_OnDialogBoxEnded(c: Variant, a: Array) -> Variant:
	if R.truth((R.truth((c).fields.get("m_AreaDialogCues")) and (float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1)))))):
		pass
		R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
	return null

static func f_PlayAreaDialog(c: Variant, a: Array) -> Variant:
	var v_szDialog: Variant = null
	var v_cues: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_texts: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	var v_iIndex: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(v_iIndex, "int")
	(c).fields["m_AreaDialogCues"] = R.coerce(v_cues, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(v_texts, "Array")
	R.call_member(c, "PlayDialogCue", [R.get_value((c).fields.get("m_AreaDialogCues"), (c).fields.get("m_iAreaDialogIndex"))])
	v_szDialog = R.coerce(R.get_value((c).fields.get("m_AreaDialogTexts"), (c).fields.get("m_iAreaDialogIndex")), "String")
	R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [v_szDialog])
	(c).fields["m_fDialogTimer"] = R.coerce((2 if R.truth(R.binary("==", v_szDialog, "")) else maxf(float((R.num(R.get_value(v_szDialog, "length")) * float(R.static_value("RDCampaignDialogs", "DialogTimePerCharacter")))), float(R.static_value("RDCampaignDialogs", "MinDialogTime")))), "Number")
	return null

static func f_StopAreaDialog(c: Variant, a: Array) -> Variant:
	(c).fields["m_iPlayingAreaDialogAreaIndex"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_AreaDialogCues"] = R.coerce(null, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(null, "Array")
	R.call_member(c, "StopDialogCue", [])
	R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
	return null

static func f_PlayDialogCue(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", v_iIndex, R.unary("-", 1))):
		pass
		return null
	R.call_member(c, "StopDialogCue", [])
	v_soundClass = R.coerce(R.call_static("RDCampaignDialogs", "GetSound", [v_iIndex]), "Class")
	(c).fields["m_DialogCueSound"] = R.coerce(R.construct(R.klass("DTSound"), [v_soundClass, (R.static_value("RDGame", "Instance")).fields.get("m_MasterSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_DialogCueSound"), "Play", [])
	return null

static func f_StopDialogCue(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_DialogCueSound")):
		pass
		R.call_member((c).fields.get("m_DialogCueSound"), "Stop", [])
		(c).fields["m_DialogCueSound"] = R.coerce(null, "DTSound")
	return null

static func f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "PlayNukeSound")):
		pass
		R.call_member((c).fields.get("m_NukeSound"), "Play", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "PlayNukeWaveSound")):
			pass
			R.call_member((c).fields.get("m_NukeWaveSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "PlayChopperSound")):
				pass
				R.call_member((c).fields.get("m_ChopperSound"), "Play", [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "PlayEngineSound")):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Play", [])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "StopEngineSound")):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PlayPassBySound")):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Play", [])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "PlayTireSound")):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Play", [])
	return null

static func f_StopEndingSounds(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_NukeSound"), "Stop", [])
	R.call_member((c).fields.get("m_NukeWaveSound"), "Stop", [])
	R.call_member((c).fields.get("m_ChopperSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Stop", [])
	return null

static func f_ApplyPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_patternInfo: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_patternData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	R.call_member(c, "LoadAreaData", [(c).fields.get("m_SavedAreaData"), true])
	v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
	(v_patternInfo).fields["m_Data"] = R.coerce(v_patternData, "ByteArray")
	return null

static func f_ApplyArea(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_areaData: Variant = null
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iGroupIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_areaData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
	R.call_member(c, "LoadCampaignData", [(c).fields.get("m_SavedCampaignData")])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iIndex), "RDAreaInfo")
	(v_areaInfo).fields["m_Data"] = R.coerce(v_areaData, "ByteArray")
	R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "splice"), [0])
	R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "Clear", [])
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.call_member(c, "ResetCampaignSpawning", [])
	return null

static func f_IsCurrentLoadedFileRateable(c: Variant, a: Array) -> Variant:
	return R.logical_or(R.logical_or(R.logical_or(R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))), func(): return (c).fields.get("m_LoadedPatternPreviewFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternPreviewFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternPreviewFileRated"))), func(): return R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))), func(): return (c).fields.get("m_LoadedAreaPreviewFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaPreviewFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaPreviewFileRated")))), func(): return R.logical_and(R.logical_and(R.logical_and((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))), func(): return (c).fields.get("m_LoadedPatternFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternFileRated")))), func(): return R.logical_and(R.logical_and(R.logical_and((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))), func(): return (c).fields.get("m_LoadedAreaFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaFileRated"))))
	return null

static func f_GetCurrentLoadedFile(c: Variant, a: Array) -> Variant:
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))):
		pass
		return (c).fields.get("m_LoadedPatternPreviewFile")
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))))):
		pass
		return (c).fields.get("m_LoadedAreaPreviewFile")
	if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))):
		pass
		return (c).fields.get("m_LoadedPatternFile")
	if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))))):
		pass
		return (c).fields.get("m_LoadedAreaFile")
	return null
	return null

static func f_SetCurrentLoadedFileAsRated(c: Variant, a: Array) -> Variant:
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))):
		pass
		(c).fields["m_bLoadedPatternPreviewFileRated"] = true
	else:
		pass
		if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))))):
			pass
			(c).fields["m_bLoadedAreaPreviewFileRated"] = true
		else:
			pass
			if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))):
				pass
				(c).fields["m_bLoadedPatternFileRated"] = true
			else:
				pass
				if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))))):
					pass
					(c).fields["m_bLoadedAreaFileRated"] = true
	return null

static func f_ClearEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	R.call_member(c, "DeleteSelectedEntity", [])
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bSelectableInEditor") and (v_entity).fields.get("m_bDeletableInEditor"))):
			pass
			(v_entity).fields["m_bDestroyMe"] = true
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null

static func f_DeleteFile(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	R.call_member(v_file, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), R.get_value(c, "OnFileDeleted"), false, 0, true])
	R.call_member(v_file, "deleteFile", [])
	return null

static func f_OnFileDeleted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	R.call_member((c).fields.get("m_Interface"), "OnFileDeleted", [])
	return null

static func f_SetNoBackgroundCity(c: Variant, a: Array) -> Variant:
	var v_bNoBackgroundCity: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_CampaignInfo")).fields["m_bNoBackgroundCity"] = v_bNoBackgroundCity
	R.call_member((c).fields.get("m_CityBG"), "SetHidden", [v_bNoBackgroundCity])
	return null

static func f_ResetEnding(c: Variant, a: Array) -> Variant:
	(c).fields["m_iEndingType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	R.call_member((c).fields.get("m_Interface"), "ShowEnding", [(c).fields.get("m_iEndingType")])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Sorting_Yours", 0, "=")
	R.set_value(c, "Sorting_Recent", 1, "=")
	R.set_value(c, "Sorting_Best", 2, "=")
	R.set_value(c, "Sorting_Worst", 3, "=")
	R.set_value(c, "Sorting_Unrated", 4, "=")
	R.set_value(c, "Sorting_Random", 5, "=")
	R.set_value(c, "DataType_Pattern", 0, "=")
	R.set_value(c, "DataType_Area", 1, "=")
	R.set_value(c, "DataType_Campaign", 2, "=")
	R.set_value(c, "BuildingsType_Residential", 0, "=")
	R.set_value(c, "BuildingsType_Town", 1, "=")
	R.set_value(c, "BuildingsType_Industrial", 2, "=")
	R.set_value(c, "BuildingsType_Mixed", 3, "=")
	R.set_value(c, "CamSpeedX", 8, "=")
	R.set_value(c, "CamSpeedZ", 8, "=")
	R.set_value(c, "CamFastFactor", 8, "=")
	R.set_value(c, "CamFastFactorRamp", 30, "=")
	R.set_value(c, "CamFastBaseRamp", 0.995, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Road"] = R.coerce(null, "RDRoad")
	(c).fields["m_SkyBG"] = R.coerce(null, "RDParallaxBackground")
	(c).fields["m_CityBG"] = R.coerce(null, "RDParallaxBackground")
	(c).fields["m_Interface"] = R.coerce(null, "RDEditorInterface")
	(c).fields["m_bGoLeft"] = false
	(c).fields["m_bGoRight"] = false
	(c).fields["m_bGoBackward"] = false
	(c).fields["m_bGoForward"] = false
	(c).fields["m_bGoFast"] = false
	(c).fields["m_fFastCamRamp"] = float(NAN)
	(c).fields["m_fCamFastFactor"] = float(NAN)
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce(null, "String")
	(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
	(c).fields["m_SelectedEntity"] = R.coerce(null, "RDEntity")
	(c).fields["m_vMouseScreenPos"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vMouseWorldPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vMouseWorldDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vDragOffset"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_fUnprojectNearMouseRange"] = float(3)
	(c).fields["m_fUnprojectFarMouseRange"] = float(15)
	(c).fields["m_fUnprojectHeightRatio"] = float(0.55)
	(c).fields["m_fUnprojectBaseCamOffset"] = float(4)
	(c).fields["m_SaveFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_LoadedFiles"] = R.coerce(null, "Array")
	(c).fields["_query"] = R.coerce(null, "SaveQuery")
	(c).fields["_queryResults"] = R.coerce([], "Array")
	(c).fields["m_iLoadFileIndex"] = R.coerce(0, "int")
	(c).fields["m_iMusic"] = R.coerce(0, "int")
	(c).fields["m_bMusicEnabled"] = false
	(c).fields["m_bMouseDown"] = false
	(c).fields["m_fMouseDownX"] = float(NAN)
	(c).fields["m_fMouseDownY"] = float(NAN)
	(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_SavedPatternData"] = R.coerce(null, "ByteArray")
	(c).fields["m_fSavedPatternCamZ"] = float(NAN)
	(c).fields["m_fSavedPatternCamX"] = float(NAN)
	(c).fields["m_SavedAreaData"] = R.coerce(null, "ByteArray")
	(c).fields["m_SavedCampaignData"] = R.coerce(null, "ByteArray")
	(c).fields["m_iPatternType"] = R.coerce(0, "int")
	(c).fields["m_iLastInterfaceMode"] = R.coerce(0, "int")
	(c).fields["m_AreaInfo"] = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
	(c).fields["m_AreaPatternEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iDataType"] = R.coerce(0, "int")
	(c).fields["m_iLoadDataType"] = R.coerce(0, "int")
	(c).fields["m_iLoadDataSorting"] = R.coerce(0, "int")
	(c).fields["m_szFileCategory"] = R.coerce(null, "String")
	(c).fields["m_iCurrentPatternPosition"] = R.coerce(0, "int")
	(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
	(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
	(c).fields["m_bGoingForward"] = false
	(c).fields["m_bPreview"] = false
	(c).fields["m_iPreviewDataType"] = R.coerce(0, "int")
	(c).fields["m_CampaignInfo"] = R.coerce(R.construct(R.klass("RDCampaignInfo"), []), "RDCampaignInfo")
	(c).fields["m_CampaignAreaIndices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_CampaignPatternIndices"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_DialogCueSound"] = R.coerce(null, "DTSound")
	(c).fields["m_AreaDialogCues"] = R.coerce(null, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(null, "Array")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_bSavedAsPrivate"] = false
	(c).fields["m_bPlayAreaDialog"] = false
	(c).fields["m_iPlayingAreaDialogAreaIndex"] = R.coerce(0, "int")
	(c).fields["m_iEndingType"] = R.coerce(0, "int")
	(c).fields["m_CarDrivingAway"] = R.coerce(null, "RDCarDrivingAway")
	(c).fields["m_fDialogTimer"] = float(0)
	(c).fields["m_bAllowCannotPlaceSound"] = false
	(c).fields["m_ChallengeGroups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ChallengeAreas"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ChallengePatterns"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
	(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
	(c).fields["m_GroupsThatCanBeFirst"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_ChopperSound"] = R.coerce(null, "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(null, "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(null, "DTSound")
	(c).fields["m_LoadedPatternFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternFileOwned"] = false
	(c).fields["m_bLoadedPatternFileRated"] = false
	(c).fields["m_LoadedAreaFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaFileOwned"] = false
	(c).fields["m_bLoadedAreaFileRated"] = false
	(c).fields["m_LoadedPatternPreviewFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternPreviewFileOwned"] = false
	(c).fields["m_bLoadedPatternPreviewFileRated"] = false
	(c).fields["m_LoadedAreaPreviewFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaPreviewFileOwned"] = false
	(c).fields["m_bLoadedAreaPreviewFileRated"] = false
	(c).fields["m_RatedFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	return null
