extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDSpawnManager(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_gamemode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameModeGameplay")
	R.invoke(R.super_ref(c, "RDSpawnManager"), [])
	(c).fields["m_GameMode"] = R.coerce(v_gamemode, "RDGameModeGameplay")
	(c).fields["m_Game"] = R.coerce((v_gamemode).fields.get("m_Game"), "RDGame")
	(c).fields["m_SpawnerWeigthInfos"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDSpawnManager", "MaxSpawnerInfos")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDSpawnManager", "MaxSpawnerInfos")))):
		pass
		R.set_value((c).fields.get("m_SpawnerWeigthInfos"), v_i, R.construct(R.klass("RDSpawnerWeightInfo"), []), "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_fSpawnDelay"] = float((float(R.static_value("RDSpawnManager", "SpawnDelayMin")) + float((float(randf()) * float((float(R.static_value("RDSpawnManager", "SpawnDelayMax")) - float(R.static_value("RDSpawnManager", "SpawnDelayMin"))))))))
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	(c).fields["m_fSpawnTimer"] = float(0)
	(c).fields["m_iNbSpawns"] = R.coerce(0, "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "spawnerWeightInfo": "RDSpawnerWeightInfo", "iSpawner": "*", "fTotalWeigth": "Number", "fAccum": "Number", "fRandom": "Number", "spawner": "RDSpawnerInfo", "spawnerInfo": "RDSpawnerInfo", "fPerlinX": "Number", "soldier": "RDSoldier", "vSpawnLocation": "DTVector3D", "zombieClass": "Class", "zombie": "RDZombie", "iMaxEnemies": "int", "iMaxSpawn": "int", "fSpawnRatio": "Number", "iSpawnSide": "int", "fDeltaTime": "Number"}
	l["i"] = 0
	l["spawnerWeightInfo"] = null
	l["iSpawner"] = null
	l["fTotalWeigth"] = NAN
	l["fAccum"] = NAN
	l["fRandom"] = NAN
	l["spawner"] = null
	l["spawnerInfo"] = null
	l["fPerlinX"] = NAN
	l["soldier"] = null
	l["vSpawnLocation"] = null
	l["zombieClass"] = null
	l["zombie"] = null
	l["iMaxEnemies"] = 0
	l["iMaxSpawn"] = 0
	l["fSpawnRatio"] = NAN
	l["iSpawnSide"] = 0
	l["fDeltaTime"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.lset(l, "i", 0)
	R.lset(l, "spawnerWeightInfo", null)
	R.lset(l, "iSpawner", 0)
	R.lset(l, "fTotalWeigth", NAN)
	R.lset(l, "fAccum", NAN)
	R.lset(l, "fRandom", NAN)
	R.lset(l, "spawner", null)
	R.lset(l, "spawnerInfo", null)
	R.lset(l, "fPerlinX", NAN)
	R.lset(l, "soldier", null)
	R.lset(l, "vSpawnLocation", null)
	R.lset(l, "zombieClass", null)
	R.lset(l, "zombie", null)
	if R.truth(R.unary("!", (c).fields.get("m_bEnabled"))):
		pass
		return null
	if R.truth(R.logical_and(R.call_member((c).fields.get("m_GameMode"), "IsFUBARMode", []), func(): return R.unary("!", R.call_member((c).fields.get("m_GameMode"), "CanSpawnMilitary", [])))):
		pass
		return null
	if R.truth(R.logical_and(R.logical_or(R.call_member((c).fields.get("m_GameMode"), "SkipZombiesForTutorial", []), func(): return R.call_member(((c).fields.get("m_Game")).fields.get("m_Hud"), "IsTutorialShown", [])), func(): return (float(((((c).fields.get("m_GameMode")).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) < float(R.static_value("RDGameModeGameplay", "NoZombieMargin"))))):
		pass
		return null
	R.lset(l, "iMaxEnemies", R.call_member((c).fields.get("m_GameMode"), "GetSpawnMax", []))
	if R.truth(((((float((((c).fields.get("m_Game")).fields.get("m_World")).fields.get("m_iKillableEnemies")) >= float(R.lget(l, "iMaxEnemies"))) or R.unary("!", R.call_member((c).fields.get("m_GameMode"), "CanSpawnZombies", []))) or (((c).fields.get("m_GameMode")).fields.get("m_Player")).fields.get("m_bInEnding")) or (((c).fields.get("m_GameMode")).fields.get("m_Player")).fields.get("m_bFailed"))):
		pass
		return null
	R.lset(l, "iMaxSpawn", R.call_member((c).fields.get("m_GameMode"), "GetMaxSpawnZombies", []))
	if R.truth((R.binary(">", R.lget(l, "iMaxSpawn"), R.unary("-", 1)) and (float((c).fields.get("m_iNbSpawns")) >= float(R.lget(l, "iMaxSpawn"))))):
		pass
		return null
	R.lset(l, "fSpawnRatio", R.call_member((c).fields.get("m_GameMode"), "GetSpawnRate", []))
	R.lset(l, "iSpawnSide", R.call_member((c).fields.get("m_GameMode"), "GetSpawnZombiesSide", []))
	if R.truth((float(R.lget(l, "fSpawnRatio")) > float(0))):
		pass
		(c).fields["m_fSpawnTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fSpawnTimer"), (float(R.lget(l, "fSpawnRatio")) * float(R.lget(l, "fDeltaTime")))), "Number")
		if R.truth((float((c).fields.get("m_fSpawnTimer")) > float((c).fields.get("m_fSpawnDelay")))):
			pass
			(c).fields["m_fSpawnTimer"] = float(0)
			(c).fields["m_fSpawnDelay"] = float((float(R.static_value("RDSpawnManager", "SpawnDelayMin")) + float((float(randf()) * float((float(R.static_value("RDSpawnManager", "SpawnDelayMax")) - float(R.static_value("RDSpawnManager", "SpawnDelayMin"))))))))
			R.lset(l, "iSpawner", 0, "=")
			R.lset(l, "fTotalWeigth", 0, "=")
			R.lset(l, "i", 0, "=")
			while R.truth((R.binary("<", R.lget(l, "i"), R.get_value((((c).fields.get("m_Game")).fields.get("m_World")).fields.get("m_ZombieSpawners"), "length")) and R.binary("<", R.lget(l, "iSpawner"), R.static_value("RDSpawnManager", "MaxSpawnerInfos")))):
				pass
				R.lset(l, "spawnerInfo", R.binary("as", R.get_value((((c).fields.get("m_Game")).fields.get("m_World")).fields.get("m_ZombieSpawners"), R.lget(l, "i")), R.klass("RDSpawnerInfo")), "=")
				R.lset(l, "fPerlinX", R.call_static("RDWorld", "GetPerlinX", [(((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("Z")]), "=")
				if R.truth(R.unary("!", ((R.binary("==", R.lget(l, "iSpawnSide"), R.unary("-", 1)) and (float((float((((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("X")) - float(R.lget(l, "fPerlinX")))) < float(0))) or ((float(R.lget(l, "iSpawnSide")) == float(1)) and (float((float((((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("X")) - float(R.lget(l, "fPerlinX")))) > float(0)))))):
					pass
					if R.truth(R.logical_and(R.logical_and(R.call_member((R.lget(l, "spawnerInfo")).fields.get("m_Entity"), "CanSpawnZombie", [R.call_member((c).fields.get("m_GameMode"), "GetUnlimitedSpawning", [])]), func(): return (float((((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("Z")) > float((float(((((c).fields.get("m_GameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDSpawnManager", "MinSpawnDistance")))))), func(): return (float((((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("Z")) < float((float(((((c).fields.get("m_GameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDSpawnManager", "MaxSpawnDistance"))))))):
						pass
						R.lset(l, "spawnerWeightInfo", R.get_value((c).fields.get("m_SpawnerWeigthInfos"), R.binary("-", R.lset(l, "iSpawner", 1, "+="), 1)), "=")
						(R.lget(l, "spawnerWeightInfo")).fields["m_Spawner"] = R.coerce(R.lget(l, "spawnerInfo"), "RDSpawnerInfo")
						(R.lget(l, "spawnerWeightInfo")).fields["m_fWeight"] = float((float(1) - R.num(R.call_static("Maths", "Clamp", [R.binary("/", (float((((R.lget(l, "spawnerInfo")).fields.get("m_Entity")).fields.get("m_vLocation")).fields.get("Z")) - float((float(((((c).fields.get("m_GameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDSpawnManager", "MinSpawnDistance"))))), (float(R.static_value("RDSpawnManager", "MaxSpawnDistance")) - float(R.static_value("RDSpawnManager", "MinSpawnDistance")))), 0, 0.99]))))
						(R.lget(l, "spawnerWeightInfo")).fields["m_fWeight"] = R.coerce(R.binary("*", (R.lget(l, "spawnerWeightInfo")).fields.get("m_fWeight"), (R.lget(l, "spawnerWeightInfo")).fields.get("m_fWeight")), "Number")
						R.lset(l, "fTotalWeigth", (R.lget(l, "spawnerWeightInfo")).fields.get("m_fWeight"), "+=")
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			R.lset(l, "fAccum", 0, "=")
			R.lset(l, "fRandom", (float(randf()) * float(R.lget(l, "fTotalWeigth"))), "=")
			R.lset(l, "i", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "i"), R.lget(l, "iSpawner"))):
				pass
				R.lset(l, "spawnerWeightInfo", R.get_value((c).fields.get("m_SpawnerWeigthInfos"), R.lget(l, "i")), "=")
				R.lset(l, "fAccum", (R.lget(l, "spawnerWeightInfo")).fields.get("m_fWeight"), "+=")
				if R.truth((float(R.lget(l, "fRandom")) <= float(R.lget(l, "fAccum")))):
					pass
					R.lset(l, "spawner", (R.lget(l, "spawnerWeightInfo")).fields.get("m_Spawner"), "=")
					break
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			if R.truth(R.lget(l, "spawner")):
				pass
				if R.truth(R.call_member((c).fields.get("m_GameMode"), "IsFUBARMode", [])):
					pass
					R.lset(l, "soldier", R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDSoldier")]), R.klass("RDSoldier")), "=")
					R.call_member(R.lget(l, "soldier"), "Init", [R.static_value("RDSoldier", "Behavior_Spawning")])
					R.lset(l, "vSpawnLocation", R.call_member((R.lget(l, "spawner")).fields.get("m_Entity"), "GetZombieSpawnLocation", []), "=")
					R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Game"), "AddEntity", [R.lget(l, "soldier"), (R.lget(l, "vSpawnLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinY", [(float((R.lget(l, "vSpawnLocation")).fields.get("Z")) + float(1))]), (float((R.lget(l, "vSpawnLocation")).fields.get("Z")) + float(1))])
					R.call_member(R.lget(l, "soldier"), "StartSpawning", [(R.lget(l, "spawner")).fields.get("m_Entity")])
					R.set_value((R.lget(l, "spawner")).fields.get("m_Entity"), "m_iSpawnCapacity", 1, "-=")
				else:
					pass
					R.lset(l, "zombieClass", R.call_member((c).fields.get("m_GameMode"), "GetRandomZombieClass", []), "=")
					if R.truth(R.lget(l, "zombieClass")):
						pass
						R.lset(l, "zombie", R.binary("as", R.call_static("RDGame", "GetEntity", [R.lget(l, "zombieClass")]), R.klass("RDZombie")), "=")
						R.call_member(R.lget(l, "zombie"), "Init", [R.static_value("RDZombie", "MovementType_MoveToPlayer")])
						R.lset(l, "vSpawnLocation", R.call_member((R.lget(l, "spawner")).fields.get("m_Entity"), "GetZombieSpawnLocation", []), "=")
						R.call_member(((c).fields.get("m_GameMode")).fields.get("m_Game"), "AddEntity", [R.lget(l, "zombie"), (R.lget(l, "vSpawnLocation")).fields.get("X"), R.call_static("RDWorld", "GetPerlinY", [(float((R.lget(l, "vSpawnLocation")).fields.get("Z")) + float(1))]), (float((R.lget(l, "vSpawnLocation")).fields.get("Z")) + float(1))])
						R.call_member(R.lget(l, "zombie"), "StartSpawning", [(R.lget(l, "spawner")).fields.get("m_Entity")])
						R.set_value((R.lget(l, "spawner")).fields.get("m_Entity"), "m_iSpawnCapacity", 1, "-=")
				R.set_value(c, "m_iNbSpawns", 1, "+=")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "SpawnPlayerSpeed", R.binary("/", R.binary("/", (float(10) * float(1000)), 60), 60), "=")
	R.set_value(c, "MaxSpawnerInfos", 10, "=")
	R.set_value(c, "MinSpawnDistance", 20, "=")
	R.set_value(c, "MaxSpawnDistance", 80, "=")
	R.set_value(c, "SpawnDelayMin", 1, "=")
	R.set_value(c, "SpawnDelayMax", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Game"] = R.coerce(null, "RDGame")
	(c).fields["m_GameMode"] = R.coerce(null, "RDGameModeGameplay")
	(c).fields["m_SpawnerWeigthInfos"] = R.coerce(null, "Array")
	(c).fields["m_fSpawnTimer"] = float(0)
	(c).fields["m_fSpawnDelay"] = float(NAN)
	(c).fields["m_iNbSpawns"] = R.coerce(0, "int")
	(c).fields["m_bEnabled"] = true
	return null
