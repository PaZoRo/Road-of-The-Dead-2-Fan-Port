extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDLevelPatternCustomData(c: Variant, a: Array) -> Variant:
	var v_customData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	R.invoke(R.super_ref(c, "RDLevelPatternCustomData"), [])
	(c).fields["m_CustomData"] = R.coerce(v_customData, "ByteArray")
	return null

static func f_Load(c: Variant, a: Array) -> Variant:
	var v_iNbChild: Variant = 0
	var v_i: Variant = 0
	var v_gameplayMode: Variant = null
	var v_spawnInfo: Variant = null
	var v_iNbEntities: Variant = 0
	var v_szName: Variant = null
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_entityInfo: Variant = null
	var v_entityProperties: Variant = null
	var v_iNbProperties: Variant = 0
	var v_p: Variant = 0
	var v_szPropertyName: Variant = null
	var v_iPropertyType: Variant = 0
	var v_propValue: Variant = null
	var v_iSlideIndex: Variant = 0
	var v_iRandom: Variant = 0
	var v_szClassName: Variant = null
	var v_entity: Variant = null
	var v_fPatternSpace: Variant = NAN
	var v_bFlip: Variant = false
	var v_iFileVersion: Variant = 0
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	var v_iLevel: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSpawnRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	v_iNbChild = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_gameplayMode = R.coerce(null, "RDGameModeGameplay")
	v_spawnInfo = R.coerce(null, "RDPatternSpawnInfo")
	v_iNbEntities = R.coerce(0, "int")
	v_szName = R.coerce(null, "String")
	v_fX = float(NAN)
	v_fY = float(NAN)
	v_fZ = float(NAN)
	v_entityInfo = R.coerce(null, "RDEntitySpawnInfo")
	v_entityProperties = R.coerce(null, "Array")
	v_iNbProperties = R.coerce(0, "int")
	v_p = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_iPropertyType = R.coerce(0, "int")
	v_propValue = R.coerce(null, "*")
	v_iSlideIndex = R.coerce(0, "int")
	v_iRandom = R.coerce(0, "int")
	v_szClassName = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_gameplayMode = R.coerce(R.binary("as", v_gameMode, R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	v_fPatternSpace = float(0)
	v_bFlip = ((c).fields.get("m_bAllowFlip") and (float(randf()) < float(0.5)))
	R.invoke(R.get_value((c).fields.get("m_Grounds"), "splice"), [0])
	R.invoke(R.get_value((c).fields.get("m_Generics"), "splice"), [0])
	R.call_member((c).fields.get("m_Hazards"), "Clear", [])
	R.call_member((c).fields.get("m_SideHazards"), "Clear", [])
	R.call_member((c).fields.get("m_Zombies"), "Clear", [])
	R.call_member((c).fields.get("m_Soldiers"), "Clear", [])
	R.set_value((c).fields.get("m_CustomData"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(c).fields["m_iPatternType"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		R.invoke(R.get_value((c).fields.get("m_Grounds"), "push"), [R.call_member(c, "GetFlippedGround", [R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), v_bFlip])])
		v_iNbEntities = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbEntities))):
			pass
			v_szName = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "String")
			v_fX = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_fY = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_fZ = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "Number")
			v_iNbProperties = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
			if R.truth((float(v_iNbProperties) > float(0))):
				pass
				v_entityProperties = R.coerce(R.construct(R.klass("Array"), []), "Array")
				v_p = R.coerce(0, "int")
				while R.truth((float(v_p) < float(v_iNbProperties))):
					pass
					v_szPropertyName = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "String")
					v_iPropertyType = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readInt"), []), "int")
					if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Number")))):
						pass
						v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readFloat"), []), "*")
					else:
						pass
						if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Boolean")))):
							pass
							v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readBoolean"), []), "*")
						else:
							pass
							if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_String")))):
								pass
								v_propValue = R.coerce(R.invoke(R.get_value((c).fields.get("m_CustomData"), "readUTF"), []), "*")
					R.invoke(R.get_value(v_entityProperties, "push"), [v_szPropertyName])
					R.invoke(R.get_value(v_entityProperties, "push"), [v_propValue])
					v_p = R.signed32(v_p + 1)
			if R.truth(R.call_member(c, "CanSpawn", [v_szName, v_fX, v_fY, v_fZ, v_gameplayMode, v_iLevel, v_fDifficulty])):
				pass
				v_entityInfo = R.coerce(R.call_member(c, "GetEntitySpawnInfo", []), "RDEntitySpawnInfo")
				(v_entityInfo).fields["m_szName"] = R.coerce(v_szName, "String")
				(v_entityInfo).fields["m_fX"] = float(v_fX)
				(v_entityInfo).fields["m_fY"] = float(v_fY)
				(v_entityInfo).fields["m_fZ"] = float(v_fZ)
				(v_entityInfo).fields["m_Properties"] = R.coerce(v_entityProperties, "Array")
				if R.truth(R.call_member(c, "IsGeneric", [v_szName])):
					pass
					R.invoke(R.get_value((c).fields.get("m_Generics"), "push"), [v_entityInfo])
				else:
					pass
					if R.truth(R.call_member(c, "IsHazard", [v_szName, v_gameplayMode])):
						pass
						if R.truth(R.binary("<=", R.call_static("Maths", "AbsNumber", [v_fX]), 10)):
							pass
							R.call_member((c).fields.get("m_Hazards"), "AddValue", [v_entityInfo])
						else:
							pass
							R.call_member((c).fields.get("m_SideHazards"), "AddValue", [v_entityInfo])
					else:
						pass
						if R.truth(R.call_member(c, "IsZombie", [v_szName])):
							pass
							R.call_member((c).fields.get("m_Zombies"), "AddValue", [v_entityInfo])
						else:
							pass
							if R.truth(R.call_member(c, "IsSoldier", [v_szName])):
								pass
								R.call_member((c).fields.get("m_Soldiers"), "AddValue", [v_entityInfo])
			v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Grounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_iSlideIndex = R.coerce((float((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((v_gameplayMode).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice")))) + float(v_i)), "int")
		R.call_member(c, "SpawnGround", [v_iSlideIndex, v_i, R.get_value((c).fields.get("m_Grounds"), v_i), v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bLavaMode")):
		pass
		v_iSlideIndex = R.coerce((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((v_gameplayMode).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(0))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(1))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(2))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(3))])
		R.call_member((v_gameplayMode).fields.get("m_Road"), "SetLavaSlice", [true, (float(v_iSlideIndex) + float(4))])
	v_iNbChild = R.coerce(R.coerce(R.get_value((c).fields.get("m_Generics"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Generics"), v_i), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
		v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Hazards")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Hazards"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(10)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_SideHazards")).fields.get("m_Values"), "length")) * float(minf(float((float(v_fSpawnRatio) * float(1.5))), float(1)))))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_SideHazards"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Zombies")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Zombies"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			if R.truth(R.logical_and(R.binary("==", (v_entityInfo).fields.get("m_szName"), "ZombieSoldier"), func(): return R.call_member(v_gameplayMode, "NoSoldierZombieEnabled", []))):
				pass
				v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [5]), "int")
				if R.truth((float(v_iRandom) == float(0))):
					pass
					(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNormalMale", "String")
				else:
					pass
					if R.truth((float(v_iRandom) == float(1))):
						pass
						(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNormalFemale", "String")
					else:
						pass
						if R.truth((float(v_iRandom) == float(2))):
							pass
							(v_entityInfo).fields["m_szName"] = R.coerce("ZombieHard", "String")
						else:
							pass
							if R.truth((float(v_iRandom) == float(3))):
								pass
								(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNewFemale", "String")
							else:
								pass
								if R.truth((float(v_iRandom) == float(4))):
									pass
									(v_entityInfo).fields["m_szName"] = R.coerce("ZombieNewMale", "String")
			else:
				pass
				if R.truth(R.logical_and(R.binary("!=", (v_entityInfo).fields.get("m_szName"), "ZombieSoldier"), func(): return R.call_member(v_gameplayMode, "AllSoldierZombieEnabled", []))):
					pass
					(v_entityInfo).fields["m_szName"] = R.coerce("ZombieSoldier", "String")
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value(((c).fields.get("m_Soldiers")).fields.get("m_Values"), "length")) * float(v_fSpawnRatio)))), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbChild))):
		pass
		v_entityInfo = R.coerce(R.binary("as", R.call_member((c).fields.get("m_Soldiers"), "GetRandomValue", []), R.klass("RDEntitySpawnInfo")), "RDEntitySpawnInfo")
		if R.truth(((R.unary("!", R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", [])) or (float(v_fStartPosition) > float(0))) or (float((v_entityInfo).fields.get("m_fZ")) > float(30)))):
			pass
			v_spawnInfo = R.coerce(R.call_member(c, "Spawn", [v_entityInfo, v_gameplayMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip]), "RDPatternSpawnInfo")
			v_fPatternSpace = float(maxf(float(v_fPatternSpace), float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		R.call_member(c, "ReturnEntitySpawnInfo", [v_entityInfo])
		v_i = R.signed32(v_i + 1)
	if R.truth((c).fields.get("m_bLavaMode")):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(16))):
			pass
			v_fX = R.coerce(((R.num(R.unary("-", R.static_value("RDRoad", "SideWalkPosX"))) - float((float(randf()) * float(10)))) if R.truth((float(v_i) < float(8))) else (float(R.static_value("RDRoad", "SideWalkPosX")) + float((float(randf()) * float(10))))), "Number")
			v_fZ = float((float(1) + float((float(randf()) * float((float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(2)))))))
			v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [20]), "int")
			if R.truth((float(v_iRandom) < float(8))):
				pass
				v_szClassName = R.coerce("Smoke", "String")
			else:
				pass
				if R.truth((float(v_iRandom) < float(16))):
					pass
					v_szClassName = R.coerce("Fire", "String")
				else:
					pass
					if R.truth((float(v_iRandom) < float(18))):
						pass
						v_szClassName = R.coerce("BurningCar01", "String")
					else:
						pass
						if R.truth((float(v_iRandom) < float(20))):
							pass
							v_szClassName = R.coerce("BurningCar02", "String")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szClassName]), "RDEntity")
			((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(v_fZ)))
			((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", v_fX, R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation")).fields.get("Z")])), "Number")
			((v_entity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Number")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			v_i = R.signed32(v_i + 1)
	return (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))
	return null

static func f_CanSpawn(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_fX: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fY: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_gameplayMode: Variant = R.coerce((a[4] if a.size() > 4 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[5] if a.size() > 5 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[6] if a.size() > 6 else NAN), "Number")
	if R.truth(((c).fields.get("m_bLavaMode") and R.binary(">", R.call_static("Maths", "AbsNumber", [v_fX]), R.static_value("RDRoad", "SideWalkPosX")))):
		pass
		return false
	if R.truth(((((((((((R.binary("==", v_szName, "ZombieRandom") or R.binary("==", v_szName, "ZombieNormalMale")) or R.binary("==", v_szName, "ZombieNormalFemale")) or R.binary("==", v_szName, "ZombieHard")) or R.binary("==", v_szName, "ZombieNewFemale")) or R.binary("==", v_szName, "ZombieNewMale")) or R.binary("==", v_szName, "ZombieSoldier")) or R.binary("==", v_szName, "ZombieRandomFeed")) or R.binary("==", v_szName, "ZombieNormalMaleFeed")) or R.binary("==", v_szName, "ZombieNormalFemaleFeed")) or R.binary("==", v_szName, "ZombieHardFeed"))):
		pass
		if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iHardZombieLevel")))):
			pass
			return false
	else:
		pass
		if R.truth((R.binary("==", v_szName, "ZombieMutant") or R.binary("==", v_szName, "ZombieMutantAlpha"))):
			pass
			if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iHardZombieLevel")))):
				pass
				return false
		else:
			pass
			if R.truth(R.binary("==", v_szName, "ZombieGrub")):
				pass
				if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iGrubLevel")))):
					pass
					return false
			else:
				pass
				if R.truth((R.binary("==", v_szName, "SoldierStationary") or R.binary("==", v_szName, "SoldierAlign"))):
					pass
					if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iAlignSoldierLevel")))):
						pass
						return false
				else:
					pass
					if R.truth(R.binary("==", v_szName, "SoldierSpikes")):
						pass
						if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikeSoldierLevel")))):
							pass
							return false
					else:
						pass
						if R.truth(R.binary("==", v_szName, "SoldierBomb")):
							pass
							if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iBombSoldierLevel")))):
								pass
								return false
						else:
							pass
							if R.truth((R.binary("==", v_szName, "Mine") or R.binary("==", v_szName, "MotionMine"))):
								pass
								if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iMineLevel")))):
									pass
									return false
							else:
								pass
								if R.truth(R.binary("==", v_szName, "Spikes")):
									pass
									if R.truth((float(v_iLevel) < float((v_gameplayMode).fields.get("m_iSpikesLevel")))):
										pass
										return false
	return true
	return null

static func f_IsGeneric(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", v_szName, "BuildingResidentialRandom") or R.binary("==", v_szName, "BuildingTownRandom")) or R.binary("==", v_szName, "BuildingIndustrialRandom")) or R.binary("==", v_szName, "BuildingGarage")) or R.binary("==", v_szName, "BuildingPoliceStation1")) or R.binary("==", v_szName, "BuildingPoliceStation2")) or R.binary("==", v_szName, "BuildingChurch1")) or R.binary("==", v_szName, "BuildingChurch2")) or R.binary("==", v_szName, "BuildingResidential1")) or R.binary("==", v_szName, "BuildingResidential2")) or R.binary("==", v_szName, "BuildingResidential3")) or R.binary("==", v_szName, "BuildingResidential4")) or R.binary("==", v_szName, "BuildingResidential5")) or R.binary("==", v_szName, "BuildingResidential6")) or R.binary("==", v_szName, "BuildingResidential7")) or R.binary("==", v_szName, "BuildingResidential8")) or R.binary("==", v_szName, "BuildingResidential1Damage")) or R.binary("==", v_szName, "BuildingResidential3Damage")) or R.binary("==", v_szName, "BuildingTown1")) or R.binary("==", v_szName, "BuildingTown2")) or R.binary("==", v_szName, "BuildingTown3")) or R.binary("==", v_szName, "BuildingTown4")) or R.binary("==", v_szName, "BuildingTown5")) or R.binary("==", v_szName, "BuildingTown6")) or R.binary("==", v_szName, "BuildingTown7")) or R.binary("==", v_szName, "BuildingTown8")) or R.binary("==", v_szName, "BuildingTown9")) or R.binary("==", v_szName, "BuildingTown10")) or R.binary("==", v_szName, "BuildingTown11")) or R.binary("==", v_szName, "BuildingTown12")) or R.binary("==", v_szName, "BuildingTown3Damage")) or R.binary("==", v_szName, "BuildingTown7Damage")) or R.binary("==", v_szName, "BuildingTown11Damage")) or R.binary("==", v_szName, "BuildingTown12Damage")) or R.binary("==", v_szName, "BuildingIndustrial1")) or R.binary("==", v_szName, "BuildingIndustrial2")) or R.binary("==", v_szName, "BuildingIndustrial3")) or R.binary("==", v_szName, "BuildingIndustrial4")) or R.binary("==", v_szName, "BuildingIndustrial1Damage")) or R.binary("==", v_szName, "BuildingIndustrial4Damage")) or R.binary("==", v_szName, "BGBuildingResidentialRandom")) or R.binary("==", v_szName, "BGBuildingTownRandom")) or R.binary("==", v_szName, "BGBuildingIndustrialRandom")) or R.binary("==", v_szName, "BGBuildingMixedRandom")) or R.binary("==", v_szName, "CivilianLeft")) or R.binary("==", v_szName, "CivilianRight")) or R.binary("==", v_szName, "Bush1")) or R.binary("==", v_szName, "Bush2")) or R.binary("==", v_szName, "Bush3")) or R.binary("==", v_szName, "Bush3")) or R.binary("==", v_szName, "SmallHillTop")) or R.binary("==", v_szName, "GrassTop")) or R.binary("==", v_szName, "FireHydrant")) or R.binary("==", v_szName, "FireHydrantFlowing")) or R.binary("==", v_szName, "RoadBlood")) or R.binary("==", v_szName, "WaterJug")) or R.binary("==", v_szName, "HighwayRamp")) or R.binary("==", v_szName, "Box")) or R.binary("==", v_szName, "ConstructionSign")) or R.binary("==", v_szName, "ElectronicSign")) or R.binary("==", v_szName, "GardenGnome")) or R.binary("==", v_szName, "LawnFlamingo")) or R.binary("==", v_szName, "MailBox")) or R.binary("==", v_szName, "RoadKill")) or R.binary("==", v_szName, "ShoppingCart")) or R.binary("==", v_szName, "Table")) or R.binary("==", v_szName, "TrafficBarrel")) or R.binary("==", v_szName, "TrafficCone")) or R.binary("==", v_szName, "TrafficLight")) or R.binary("==", v_szName, "TrashCan")) or R.binary("==", v_szName, "BeerKeg")) or R.binary("==", v_szName, "Cherub")) or R.binary("==", v_szName, "Pumpkin")) or R.binary("==", v_szName, "Snowman")) or R.binary("==", v_szName, "ValentineTable")) or R.binary("==", v_szName, "WaterMelon")) or R.binary("==", v_szName, "Chopper")) or R.binary("==", v_szName, "WeaponCrate"))):
		pass
		return true
	return false
	return null

static func f_IsHazard(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	if R.truth((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((R.binary("==", v_szName, "BurningCar01") or R.binary("==", v_szName, "BurningCar02")) or R.binary("==", v_szName, "SmallCarNarrowRandom")) or R.binary("==", v_szName, "SmallCarWideRandom")) or R.binary("==", v_szName, "SmallCar01")) or R.binary("==", v_szName, "SmallCar02")) or R.binary("==", v_szName, "SmallCar03")) or R.binary("==", v_szName, "SmallCar04")) or R.binary("==", v_szName, "SmallCar05")) or R.binary("==", v_szName, "SmallCar06")) or R.binary("==", v_szName, "SmallCar07")) or R.binary("==", v_szName, "SmallCar08")) or R.binary("==", v_szName, "SmallCar09")) or R.binary("==", v_szName, "SmallCar10")) or R.binary("==", v_szName, "SmallCar12")) or R.binary("==", v_szName, "SmallCar13")) or R.binary("==", v_szName, "MediumCarNarrowRandom")) or R.binary("==", v_szName, "MediumCarWideRandom")) or R.binary("==", v_szName, "MediumCar01")) or R.binary("==", v_szName, "MediumCar02")) or R.binary("==", v_szName, "MediumCar03")) or R.binary("==", v_szName, "MediumCar04")) or R.binary("==", v_szName, "MediumCar05")) or R.binary("==", v_szName, "MediumCar06")) or R.binary("==", v_szName, "MediumCar07")) or R.binary("==", v_szName, "MediumCar08")) or R.binary("==", v_szName, "MediumCar09")) or R.binary("==", v_szName, "MediumCar10")) or R.binary("==", v_szName, "MediumCar11")) or R.binary("==", v_szName, "MediumCar13")) or R.binary("==", v_szName, "MediumCar14")) or R.binary("==", v_szName, "MediumCar15")) or R.binary("==", v_szName, "LargeCarNarrowRandom")) or R.binary("==", v_szName, "LargeCarWideRandom")) or R.binary("==", v_szName, "LargeCar01")) or R.binary("==", v_szName, "LargeCar02")) or R.binary("==", v_szName, "LargeCar03")) or R.binary("==", v_szName, "LargeCar04")) or R.binary("==", v_szName, "LargeCar05")) or R.binary("==", v_szName, "LargeCar06")) or R.binary("==", v_szName, "LargeCar07")) or R.binary("==", v_szName, "LargeCar08")) or R.binary("==", v_szName, "LargeCar09")) or R.binary("==", v_szName, "LargeCar10")) or R.binary("==", v_szName, "LargeCar11")) or R.binary("==", v_szName, "LargeCar12")) or R.binary("==", v_szName, "LargeCar13")) or R.binary("==", v_szName, "LargeCar14")) or R.binary("==", v_szName, "LargeCar15")) or R.binary("==", v_szName, "LargeCar16")) or R.binary("==", v_szName, "LargeCar17")) or R.binary("==", v_szName, "Ambulance")) or R.binary("==", v_szName, "HummerWide")) or R.binary("==", v_szName, "HummerWideDamaged")) or R.binary("==", v_szName, "HummerNarrow")) or R.binary("==", v_szName, "HummerNarrowDamaged")) or R.binary("==", v_szName, "ArmyTruck")) or R.binary("==", v_szName, "FuelTruck")) or R.binary("==", v_szName, "FireTruck")) or R.binary("==", v_szName, "Bus")) or R.binary("==", v_szName, "Semi")) or R.binary("==", v_szName, "RandomTree")) or R.binary("==", v_szName, "MapleTree")) or R.binary("==", v_szName, "AltTree")) or R.binary("==", v_szName, "PineTree")) or R.binary("==", v_szName, "DeadTree")) or R.binary("==", v_szName, "Barracade")) or R.binary("==", v_szName, "Dumpster")) or R.binary("==", v_szName, "Fence")) or R.binary("==", v_szName, "Mine")) or R.binary("==", v_szName, "MotionMine")) or R.binary("==", v_szName, "Oil")) or R.binary("==", v_szName, "SandBags")) or R.binary("==", v_szName, "SandBagsBloody")) or R.binary("==", v_szName, "Spikes")) or R.binary("==", v_szName, "TombRandom")) or R.binary("==", v_szName, "Tomb1")) or R.binary("==", v_szName, "Tomb2")) or R.binary("==", v_szName, "Tomb3")) or R.binary("==", v_szName, "PassingCar"))):
		pass
		return true
	return false
	return null

static func f_IsZombie(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((((((((((((R.binary("==", v_szName, "ZombieRandom") or R.binary("==", v_szName, "ZombieRandomFeed")) or R.binary("==", v_szName, "ZombieNormalMale")) or R.binary("==", v_szName, "ZombieNormalFemale")) or R.binary("==", v_szName, "ZombieHard")) or R.binary("==", v_szName, "ZombieNewFemale")) or R.binary("==", v_szName, "ZombieNewMale")) or R.binary("==", v_szName, "ZombieSoldier")) or R.binary("==", v_szName, "ZombieMutant")) or R.binary("==", v_szName, "ZombieMutantAlpha")) or R.binary("==", v_szName, "ZombieNormalMaleFeed")) or R.binary("==", v_szName, "ZombieNormalFemaleFeed")) or R.binary("==", v_szName, "ZombieHardFeed")) or R.binary("==", v_szName, "ZombieGrub"))):
		pass
		return true
	return false
	return null

static func f_IsSoldier(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((((R.binary("==", v_szName, "SoldierAlign") or R.binary("==", v_szName, "SoldierBomb")) or R.binary("==", v_szName, "SoldierSpikes")) or R.binary("==", v_szName, "SoldierStationary"))):
		pass
		return true
	return false
	return null

static func f_SpawnYellowDots(c: Variant, a: Array) -> Variant:
	var v_yellowDot: Variant = null
	var v_iNbDots: Variant = 0
	var v_i: Variant = 0
	var v_fStartPosition: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_iSlicePos: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_iSliceType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: Variant = R.coerce((a[3] if a.size() > 3 else null), "RDGameModeGameplay")
	v_yellowDot = R.coerce(null, "RDObject")
	v_iNbDots = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	if R.truth((((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Town"))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))) or (float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass"))))):
		pass
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
		v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
	else:
		pass
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_Parking")))):
			pass
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.unary("-", 3), R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))])
			v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDYellowLine")]), R.klass("RDObject")), "RDObject")
			R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", 3, R.call_static("RDWorld", "GetPerlinX", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float((float(v_fStartPosition) + float(v_iSlicePos))) + float(1))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
		else:
			pass
			if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_CrossingStreet")))):
				pass
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(14))):
					pass
					v_yellowDot = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDWhiteLine")]), R.klass("RDObject")), "RDObject")
					R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_yellowDot, R.binary("+", R.binary("+", R.unary("-", 20), R.binary("/", (float(v_i) * float((float(20) * float(2)))), 14)), R.call_static("RDWorld", "GetPerlinX", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])), R.call_static("RDWorld", "GetPerlinY", [(float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))]), (float((float(v_fStartPosition) + float(v_iSlicePos))) + float(R.binary("/", R.static_value("RDRoad", "RenderStepSize"), 2)))])
					v_i = R.signed32(v_i + 1)
	return null

static func f_SpawnGround(c: Variant, a: Array) -> Variant:
	var v_p: Variant = 0
	var v_fPerlinSpeedX: Variant = NAN
	var v_fPerlinSpeedY: Variant = NAN
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPosIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_gameplayMode: Variant = R.coerce((a[3] if a.size() > 3 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[4] if a.size() > 4 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[6] if a.size() > 6 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[7] if a.size() > 7 else NAN), "Number")
	var v_bFlip: Variant = R.coerce((a[8] if a.size() > 8 else false), "Boolean")
	v_p = R.coerce(0, "int")
	v_fPerlinSpeedX = float(NAN)
	v_fPerlinSpeedY = float(NAN)
	v_fPerlinSpeedX = float(0.001)
	v_fPerlinSpeedY = float(0.0008)
	if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
		pass
		v_fPerlinSpeedX = float(0.0005)
		v_fPerlinSpeedY = float(0.0001)
	else:
		pass
		if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
			pass
			v_fPerlinSpeedX = float(0)
			v_fPerlinSpeedY = float(0.0012)
		else:
			pass
			if R.truth((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
				pass
				v_fPerlinSpeedX = float(0)
				v_fPerlinSpeedY = float(0.0008)
			else:
				pass
				if R.truth(((float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking"))) or (float((v_gameplayMode).fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_ChopperShooting"))))):
					pass
					v_fPerlinSpeedX = float(0)
					v_fPerlinSpeedY = float(0)
	R.call_member((v_gameplayMode).fields.get("m_Road"), "SetRoadSlice", [v_iType, v_iIndex])
	((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(R.static_value("RDRoad", "RenderStepSize"))
	v_p = R.coerce(0, "int")
	while R.truth((float(v_p) < float(R.static_value("RDRoad", "RenderStepSize")))):
		pass
		R.call_static("RDWorld", "AddPerlinTrackPoint", [v_fPerlinSpeedX, v_fPerlinSpeedY])
		v_p = R.signed32(v_p + 1)
	R.call_member(c, "SpawnYellowDots", [v_fStartPosition, R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_iPosIndex) * float(R.static_value("RDRoad", "RenderStepSize")))]), v_iType, v_gameplayMode])
	return null

static func f_Spawn(c: Variant, a: Array) -> Variant:
	var v_carSpawnInfo: Variant = null
	var v_fObjectPosX: Variant = NAN
	var v_fObjectPosZ: Variant = NAN
	var v_i: Variant = 0
	var v_szPropertyName: Variant = null
	var v_propertyValue: Variant = null
	var v_entity: Variant = null
	var v_entityInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntitySpawnInfo")
	var v_gameplayMode: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDGameModeGameplay")
	var v_iLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	var v_bFlip: Variant = R.coerce((a[6] if a.size() > 6 else false), "Boolean")
	v_carSpawnInfo = R.coerce(null, "RDCarSpawnInfo")
	v_fObjectPosX = float(NAN)
	v_fObjectPosZ = float(NAN)
	v_i = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_propertyValue = R.coerce(null, "*")
	v_entity = R.coerce(null, "RDEntity")
	((c).fields.get("m_SpawnInfo")).fields["m_fObjectLength"] = float(0)
	v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [(v_entityInfo).fields.get("m_szName")]), "RDEntity")
	if R.truth(v_entity):
		pass
		v_fObjectPosX = float((float((v_entityInfo).fields.get("m_fX")) * R.num((R.unary("-", 1) if R.truth(v_bFlip) else 1))))
		v_fObjectPosZ = float((float((v_entityInfo).fields.get("m_fZ")) * float(v_fStretch)))
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(v_fObjectPosX)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float(v_fObjectPosZ)
		((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosZ"))))
		((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_SpawnInfo")).fields.get("m_fObjectPosX"), R.call_static("RDWorld", "GetPerlinX", [((v_entity).fields.get("m_vLocation")).fields.get("Z")])), "Number")
		((v_entity).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		R.call_member(v_entity, "UpdateFlip", [])
		if R.truth((v_entityInfo).fields.get("m_Properties")):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value((v_entityInfo).fields.get("m_Properties"), "length"))):
				pass
				v_szPropertyName = R.coerce(R.get_value((v_entityInfo).fields.get("m_Properties"), v_i), "String")
				v_propertyValue = R.coerce(R.get_value((v_entityInfo).fields.get("m_Properties"), (float(v_i) + float(1))), "*")
				R.call_member(v_entity, "SetProperty", [v_szPropertyName, v_propertyValue])
				v_i = R.coerce(R.binary("+", v_i, 2), "int")
		R.call_member((v_gameplayMode).fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
	else:
		pass
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosX"] = float(0)
		((c).fields.get("m_SpawnInfo")).fields["m_fObjectPosZ"] = float((float((v_entityInfo).fields.get("m_fZ")) * float(v_fStretch)))
	return (c).fields.get("m_SpawnInfo")
	return null

static func f_GetFlippedGround(c: Variant, a: Array) -> Variant:
	var v_iSliceType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bFlip: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	if R.truth(v_bFlip):
		pass
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndGrass")))):
			pass
			return R.static_value("RDRoad", "SliceType_GrassAndPavement")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndGrass")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_DirtAndGrass")))):
			pass
			return R.static_value("RDRoad", "SliceType_GrassAndDirt")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_GrassAndDirt")))):
			pass
			return R.static_value("RDRoad", "SliceType_DirtAndGrass")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_DirtAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndDirt")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndDirt")))):
			pass
			return R.static_value("RDRoad", "SliceType_DirtAndPavement")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_SnowAndPavement")))):
			pass
			return R.static_value("RDRoad", "SliceType_PavementAndSnow")
		if R.truth((float(v_iSliceType) == float(R.static_value("RDRoad", "SliceType_PavementAndSnow")))):
			pass
			return R.static_value("RDRoad", "SliceType_SnowAndPavement")
	return v_iSliceType
	return null

static func f_GetEntitySpawnInfo(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "length"), 0)):
		pass
		return R.binary("as", R.invoke(R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "pop"), []), R.klass("RDEntitySpawnInfo"))
	return R.construct(R.klass("RDEntitySpawnInfo"), [])
	return null

static func f_ReturnEntitySpawnInfo(c: Variant, a: Array) -> Variant:
	var v_spawnInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntitySpawnInfo")
	R.invoke(R.get_value((c).fields.get("m_EntitySpawnInfosPool"), "push"), [v_spawnInfo])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_CustomData"] = R.coerce(null, "ByteArray")
	(c).fields["m_SpawnInfo"] = R.coerce(R.construct(R.klass("RDPatternSpawnInfo"), []), "RDPatternSpawnInfo")
	(c).fields["m_Grounds"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Generics"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_Hazards"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_SideHazards"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_Zombies"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_Soldiers"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	(c).fields["m_iPatternType"] = R.coerce(0, "int")
	(c).fields["m_bAllowFlip"] = true
	(c).fields["m_bLavaMode"] = false
	(c).fields["m_EntitySpawnInfosPool"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null
