extends "res://runtime/native_hotpaths.gd"
const Canonical = preload("res://runtime/native_hotpaths.gd")
static var clock: Node
static var active: Dictionary = {}
static var pending: Dictionary = {}
static var starts: int = 0
static var finishes: int = 0
static var cancelled: int = 0

static func RDGameModeStory_UpdateGameplay(c: R.Value, a: Array) -> Variant:
	if clock == null: return Canonical.RDGameModeStory_UpdateGameplay(c, a)
	clock.queued_time = pending
	var id: int = c.get_instance_id()
	if active.has(id):
		if clock.valid_context(active[id]):
			pending[id] = float(pending.get(id, 0)) + R.num(a[0]);return null
		active.erase(id);pending.erase(id)
	var context: Dictionary = clock.create_context(c)
	if context.is_empty(): return Canonical.RDGameModeStory_UpdateGameplay(c, a)
	active[id] = context;starts += 1
	var args: Array = a.duplicate();args[0] = R.num(a[0]) + float(pending.get(id, 0));pending.erase(id)
	var previous: Dictionary = R.section_publication;R.section_publication = context
	run_story(c, args, context)
	R.section_publication = previous
	return null

static func run_story(c: R.Value, a: Array, context: Dictionary) -> void :
	await update_story(c, a, context)
	clock.publish_section(context)
	var id: int = c.get_instance_id()
	if active.get(id) == context:
		active.erase(id)
		if not clock.valid_context(context): pending.erase(id)
	if clock.valid_context(context): finishes += 1
	else: cancelled += 1

static func load_section(c: R.Value, a: Array, context: Dictionary) -> Variant:
	context.section_open = true;context.publication = []
	context.waiting = true;context.next_position = context.mode.fields.m_fNextPatternSpawnPosition
	await clock.wait_slice(context)
	if not clock.valid_context(context): return NAN
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_iNbChild: int = 0
	var v_i: int = 0
	var v_childMC: R.Value = null
	var v_spawnInfo: R.Value = null
	var v_iGroundIndex: int = 0
	var v_gameplayMode: R.Value = null
	var v_rescueMode: R.Value = null
	var v_fPatternSpace: float = NAN
	var v_bFlip: bool = false
	var v_gameMode: R.Value = (a[0] if a.size() > 0 else null)
	var v_iLevel: int = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: float = R.num((a[2] if a.size() > 2 else NAN))
	var v_fStartPosition: float = R.num((a[3] if a.size() > 3 else NAN))
	var v_fSpawnRatio: float = R.num((a[4] if a.size() > 4 else NAN))
	var v_fStretch: float = R.num((a[5] if a.size() > 5 else NAN))
	v_iNbChild = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_childMC = null
	v_spawnInfo = null
	v_iGroundIndex = R.coerce(0, "int")
	v_gameplayMode = R.binary("as", v_gameMode, R.klass("RDGameModeGameplay"))
	v_rescueMode = R.binary("as", v_gameMode, R.klass("RDGameModeChopperRescue"))
	f["m_fStartPosition"] = v_fStartPosition
	v_fPatternSpace = float(0)
	v_bFlip = (float(randf()) < float(0.5))
	if R.truth(f.get("m_MCOverride")):
		pass
		f["m_MC"] = f.get("m_MCOverride")
	else:
		pass
		f["m_MC"] = R.construct_pattern(f.get("m_MCClass"))
		await clock.next_budget(context)
		if not clock.valid_context(context): return NAN
	R.invoke(R.get_value(f.get("m_Grounds"), "splice"), [0])
	R.invoke(R.get_value(f.get("m_Generics"), "splice"), [0])
	R.call_member(f.get("m_Hazards"), "Clear", [])
	R.call_member(f.get("m_CriticalHazards"), "Clear", [])
	R.call_member(f.get("m_SideHazards"), "Clear", [])
	R.call_member(f.get("m_Zombies"), "Clear", [])
	R.call_member(f.get("m_Soldiers"), "Clear", [])
	v_iNbChild = R.coerce(R.get_value(f.get("m_MC"), "numChildren"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.invoke(R.get_value(f.get("m_MC"), "getChildAt"), [v_i]), R.klass("MovieClip"))
		if R.truth(R.call_member(c, "CanSpawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty])):
			pass
			if R.truth(R.call_member(c, "IsGround", [v_childMC])):
				pass
				v_iGroundIndex = R.coerce(R.invoke(R.get_value(R.klass("Math"), "round"), [R.binary("/", R.binary("/", maxf(R.num(R.unary("-", R.get_value(v_childMC, "y"))), float(0)), 50), R.statics["RDRoad"].get("RenderStepSize"))]), "int")
				while (float(v_iGroundIndex) > float((R.num(R.get_value(f.get("m_Grounds"), "length")) - float(1)))):
					pass
					R.invoke(R.get_value(f.get("m_Grounds"), "push"), [null])
				R.set_value(f.get("m_Grounds"), v_iGroundIndex, v_childMC, "=")
			else:
				pass
				if R.truth(R.call_member(c, "IsGeneric", [v_childMC])):
					pass
					R.invoke(R.get_value(f.get("m_Generics"), "push"), [v_childMC])
				else:
					pass
					if R.truth(R.call_member(c, "IsHazard", [v_childMC, v_gameplayMode])):
						pass
						if R.truth(R.binary("<=", absf(R.num(R.get_value(v_childMC, "x"))), 500)):
							pass
							R.call_member(f.get("m_Hazards"), "AddValue", [v_childMC])
						else:
							pass
							R.call_member(f.get("m_SideHazards"), "AddValue", [v_childMC])
					else:
						pass
						if R.truth(R.call_member(c, "IsCriticalHazard", [v_childMC, v_gameplayMode])):
							pass
							R.call_member(f.get("m_CriticalHazards"), "AddValue", [v_childMC])
						else:
							pass
							if R.truth(R.call_member(c, "IsZombie", [v_childMC, v_gameplayMode])):
								pass
								R.call_member(f.get("m_Zombies"), "AddValue", [v_childMC])
							else:
								pass
								if R.truth(R.call_member(c, "IsSoldier", [v_childMC])):
									pass
									R.call_member(f.get("m_Soldiers"), "AddValue", [v_childMC])
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value(f.get("m_Grounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.get_value(f.get("m_Grounds"), v_i), R.klass("MovieClip"))
		v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
		v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
		await clock.next_budget(context)
		if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(R.coerce(R.get_value(f.get("m_Generics"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.get_value(f.get("m_Generics"), v_i), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-750)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Hazards") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Hazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((float((R.num(R.get_value((f.get("m_CriticalHazards") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio)) * float(0.7)))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_CriticalHazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_SideHazards") as R.Value).fields.get("m_Values"), "length")) * float(minf(float((v_fSpawnRatio * float(1.5))), float(1)))))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_SideHazards"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Zombies") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Zombies"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	v_iNbChild = R.coerce(ceilf(float((R.num(R.get_value((f.get("m_Soldiers") as R.Value).fields.get("m_Values"), "length")) * v_fSpawnRatio))), "int")
	v_i = R.coerce(0, "int")
	while (float(v_i) < float(v_iNbChild)):
		pass
		v_childMC = R.binary("as", R.call_member(f.get("m_Soldiers"), "GetRandomValue", []), R.klass("MovieClip"))
		if R.truth(((( not R.truth(R.call_member(v_gameplayMode, "DoEmptyLevelEntrance", []))) or (v_fStartPosition > float(0))) or R.binary("<", R.get_value(v_childMC, "y"), (-1500)))):
			pass
			v_spawnInfo = R.call_member(c, "Spawn", [v_childMC, v_gameplayMode, v_rescueMode, v_iLevel, v_fDifficulty, v_fStartPosition, v_fStretch, v_bFlip])
			v_fPatternSpace = float(maxf(v_fPatternSpace, float((float((v_spawnInfo).fields.get("m_fObjectPosZ")) + float((v_spawnInfo).fields.get("m_fObjectLength"))))))
			await clock.next_budget(context)
			if not clock.valid_context(context): return NAN
		v_i = R.signed32(v_i + 1)
	f["m_MC"] = null
	context.waiting = false
	clock.publish_section(context)
	return v_fPatternSpace
	return null

static func update_story(c: R.Value, a: Array, context: Dictionary) -> Variant:
	R.ensure_statics("RDAchievement")
	R.ensure_statics("RDGame")
	R.ensure_statics("RDGameModeGameplay")
	R.ensure_statics("RDGameModeStory")
	R.ensure_statics("RDPlayer")
	R.ensure_statics("RDPlayerInfo")
	R.ensure_statics("RDRoad")
	var f: Dictionary = c.fields
	var v_szLevelName: Variant = null
	var v_levelPatterns: R.Value = null
	var v_levelPattern: R.Value = null
	var v_fSpawnLevelLength: float = NAN
	var v_fNextSpawnLevelStartPosition: float = NAN
	var v_fPatternSpace: float = NAN
	var v_waterJug: R.Value = null
	var v_fPosZ: float = NAN
	var v_storyDialog: Variant = null
	var v_fStretch: float = NAN
	var v_fPatternSpacing: float = NAN
	var v_fSpawnRatio: float = NAN
	var v_iRandom: int = 0
	var v_voice: R.Value = null
	var v_bDisplayNewArea: bool = false
	var v_fLevelLength: float = NAN
	var v_fNextLevelStartPosition: float = NAN
	var v_fDeltaTime: float = R.num((a[0] if a.size() > 0 else NAN))
	v_szLevelName = R.coerce(null, "String")
	v_levelPatterns = null
	v_levelPattern = null
	v_fSpawnLevelLength = float(NAN)
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = null
	v_fPosZ = float(NAN)
	v_storyDialog = null
	v_fStretch = float(NAN)
	v_fPatternSpacing = float(NAN)
	v_fSpawnRatio = float(NAN)
	v_iRandom = R.coerce(0, "int")
	v_voice = null
	f["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(f.get("m_fPlayerStartPosition")) + float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z"))), f.get("m_fTotalLevelLength"))), float(1)))
	((f.get("m_Game") as R.Value).fields.get("m_VoiceOverSFXMix") as R.Value).fields["m_fVolume"] = float((float(R.statics["RDGame"].get("MinVoiceOverSFXMix")) + float((float(f.get("m_fLevelDifficulty")) * float((float(R.statics["RDGame"].get("MaxVoiceOverSFXMix")) - float(R.statics["RDGame"].get("MinVoiceOverSFXMix"))))))))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(f.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	v_bDisplayNewArea = false
	v_fLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(2)))))
	v_fNextLevelStartPosition = float((float(f.get("m_fLevelStartPosition")) + v_fLevelLength))
	if (float(((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) >= v_fNextLevelStartPosition):
		pass
		R.call_member(c, "OnPreChangeLevel", [])
		R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		f["m_iLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(1))), "int")
		R.call_member(c, "OnNewLevelArea", [])
		f["m_iLevelTag"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(5))), "int")
		f["m_iLevelTag2"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(6))), "int")
		f["m_fLevelStartPosition"] = v_fNextLevelStartPosition
		v_fLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(2)))))
		v_fNextLevelStartPosition = float((float(f.get("m_fLevelStartPosition")) + v_fLevelLength))
		R.call_member(c, "UpdateNextLevel", [])
		f["m_bPlayStoryDialog"] = true
		if ( not R.truth((f.get("m_Player") as R.Value).fields.get("m_bFailed"))):
			pass
			v_szLevelName = R.coerce(R.get_value(f.get("LevelInfos"), (float(f.get("m_iLevel")) * float(7))), "String")
			if R.truth(R.binary("!=", v_szLevelName, "")):
				pass
				R.call_member(c, "SetSavedLevel", [f.get("m_iLevel")])
				v_bDisplayNewArea = true
		R.call_member(c, "OnPreLoadLevelTagEvents", [])
		R.call_member(c, "OnLevelTagEvents", [])
	if v_bDisplayNewArea:
		pass
		R.call_member(f.get("m_Game"), "ShowMessageBox", [("" if R.truth(f.get("m_bIsHardcore")) else "Progress Saved..."), v_szLevelName])
	if R.truth((f.get("m_bPlayStoryDialog") and R.binary(">=", ((f.get("m_Player") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z"), R.binary("+", f.get("m_fLevelStartPosition"), R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(4))))))):
		pass
		v_storyDialog = R.binary("as", R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iLevel")) * float(7))) + float(3))), R.klass("Array"))
		if R.truth(v_storyDialog):
			pass
			f["m_StoryDialog"] = v_storyDialog
			R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		f["m_bPlayStoryDialog"] = false
		if R.truth((R.binary("!=", R.binary("&", f.get("m_iLevelTag"), R.statics["RDGameModeStory"].get("LevelTag_ChopperLeave")), 0) and R.truth(f.get("m_HelicopterAlly")))):
			pass
			R.call_member(f.get("m_HelicopterAlly"), "StartRetreat", [])
	if R.truth(f.get("m_bPlayJetsComingBackDialog")):
		pass
		R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Cocheta"), f.get("m_JetsComingVoice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
		f["m_bPlayJetsComingBackDialog"] = false
	while float(f.m_Camera.fields.m_vLocation.fields.Z) + maxf(float(R.statics.RDGameModeGameplay.PatternViewDistance), float(f.m_Camera.fields.m_fMaxViewDistance) + 80.0) >= float(f.m_fNextPatternSpawnPosition):
		pass
		if R.truth(f.get("m_bIsHighwayLevel")):
			pass
			if R.truth((f.get("m_bSpawnRamp") and (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = f.get("m_LevelRampExitPatterns")
				f["m_bSpawnRamp"] = false
			else:
				pass
				f["m_bSpawnWeapons"] = false
				f["m_bSpawnCheckpoint"] = false
				if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fCheckpointPatternPosition"))):
					pass
					f["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth(((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpecialPatternPosition"))) and ( not R.truth(R.call_member(c, "HasActiveStoryDialog", []))))):
						pass
						f["m_bSpawnWeapons"] = true
						if (float(f.get("m_iSpecialLocation")) == float(2)):
							pass
							f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth(((float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_JohnHighway"))) and (float(f.get("m_iJohnPatterns")) > float(0)))):
					pass
					v_levelPatterns = f.get("m_LevelJohnHighwayPatterns")
					R.set_value(c, "m_iJohnPatterns", 1, "-=")
				else:
					pass
					if R.truth(f.get("m_bSpawnCheckpoint")):
						pass
						v_levelPatterns = f.get("m_LevelCheckpointHighwayPatterns")
						f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(f.get("m_bSpawnWeapons")):
							pass
							v_levelPatterns = f.get("m_LevelWeaponsHighwayPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("HighwaySpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HighwaySpecialPatternSpacingRandom"))))))
						else:
							pass
							if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fNextHardPatternSpawnPosition"))):
								pass
								v_levelPatterns = f.get("m_LevelHardHighwayPatterns")
								f["m_fNextHardPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextHardPatternSpawnPosition"), (float(R.statics["RDGameModeGameplay"].get("HighwayHardPatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HighwayHardPatternSpacingRandom")))))))
							else:
								pass
								v_levelPatterns = f.get("m_LevelNormalHighwayPatterns")
			v_levelPattern = R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew"))
			v_fStretch = float((float(1) + float((float(randf()) * float((float(0.25) + float((float((float(1) - float(f.get("m_fLevelDifficulty")))) * float(0.25)))))))))
			f["m_bIsZombieCheckpoint"] = f.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.num( await load_section(v_levelPattern, [c, f.get("m_iLevel"), f.get("m_fLevelDifficulty"), f.get("m_fNextPatternSpawnPosition"), 1, v_fStretch], context))
			if not clock.valid_context(context): return null
			f["m_bIsZombieCheckpoint"] = false
			f["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [f.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			v_fPatternSpacing = float((float(R.statics["RDGameModeGameplay"].get("PatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("PatternSpacingRandom"))))))
			if R.truth(((f.get("m_Player") as R.Value).fields.get("m_bIsOnFire") and (float(randf()) < float(R.statics["RDGameModeGameplay"].get("WaterJugChance"))))):
				pass
				v_waterJug = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug"))
				v_fPosZ = float((float(f.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(f.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.statics["RDRoad"].get("RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.statics["RDRoad"].get("RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			f["m_fNextPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextPatternSpawnPosition"), (v_fPatternSpace + v_fPatternSpacing)))
			v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
			while (float(f.get("m_fNextPatternSpawnPosition")) >= v_fNextSpawnLevelStartPosition):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				f["m_bSpawnWeaponCrate"] = true
				f["m_iSpawnLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				f["m_fSpawnLevelStartPosition"] = v_fNextSpawnLevelStartPosition
				R.call_member(c, "OnNewSpawnLevelArea", [f.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
		else:
			pass
			if R.truth((f.get("m_bSpawnRamp") and (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = f.get("m_LevelRampPatterns")
				f["m_bSpawnRamp"] = false
			else:
				pass
				f["m_bSpawnChurch"] = false
				f["m_bSpawnPoliceStation"] = false
				f["m_bSpawnWeapons"] = false
				f["m_bSpawnGarage"] = false
				f["m_bSpawnCheckpoint"] = false
				if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fCheckpointPatternPosition"))):
					pass
					f["m_bSpawnCheckpoint"] = true
				else:
					pass
					if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fSpecialPatternPosition"))):
						pass
						if R.truth(((float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Park"))) or (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Cemetery"))))):
							pass
							f["m_bSpawnWeapons"] = true
							if (float(f.get("m_iSpecialLocation")) == float(2)):
								pass
								f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
						else:
							pass
							v_iRandom = R.coerce(f.get("m_iSpecialLocation"), "int")
							f["m_bSpawnChurch"] = (float(v_iRandom) == float(0))
							f["m_bSpawnPoliceStation"] = (float(v_iRandom) == float(1))
							f["m_bSpawnWeapons"] = (float(v_iRandom) == float(2))
							f["m_bSpawnGarage"] = (float(v_iRandom) == float(3))
							f["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(f.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Residential"))):
					pass
					if R.truth(f.get("m_bSpawnChurch")):
						pass
						v_levelPatterns = f.get("m_LevelResidentialChurchPatterns")
						f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(f.get("m_bSpawnPoliceStation")):
							pass
							v_levelPatterns = f.get("m_LevelResidentialPoliceStationPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(f.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = f.get("m_LevelResidentialWeaponsPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = f.get("m_LevelResidentialGaragePatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = f.get("m_LevelResidentialCheckpointPatterns")
										f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelResidentialPatterns")
				else:
					pass
					if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Town"))):
						pass
						if R.truth(f.get("m_bSpawnChurch")):
							pass
							v_levelPatterns = f.get("m_LevelTownChurchPatterns")
							f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(f.get("m_bSpawnPoliceStation")):
								pass
								v_levelPatterns = f.get("m_LevelTownPoliceStationPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = f.get("m_LevelTownWeaponsPatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnGarage")):
										pass
										v_levelPatterns = f.get("m_LevelTownGaragePatterns")
										f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
									else:
										pass
										if R.truth(f.get("m_bSpawnCheckpoint")):
											pass
											v_levelPatterns = f.get("m_LevelTownCheckpointPatterns")
											f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
										else:
											pass
											v_levelPatterns = f.get("m_LevelTownPatterns")
					else:
						pass
						if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Industrial"))):
							pass
							if R.truth(f.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = f.get("m_LevelIndustrialWeaponsPatterns")
								f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(f.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = f.get("m_LevelIndustrialGaragePatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(f.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = f.get("m_LevelIndustrialCheckpointPatterns")
										f["m_fCheckpointPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelIndustrialPatterns")
						else:
							pass
							if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Park"))):
								pass
								if R.truth(f.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = f.get("m_LevelParkWeaponsPatterns")
									f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
								else:
									pass
									v_levelPatterns = f.get("m_LevelParkPatterns")
							else:
								pass
								if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Cemetery"))):
									pass
									if R.truth(f.get("m_bSpawnWeapons")):
										pass
										v_levelPatterns = f.get("m_LevelCemeteryWeaponsPatterns")
										f["m_fSpecialPatternPosition"] = float((float((float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) + float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("SpecialPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = f.get("m_LevelCemeteryPatterns")
								else:
									pass
									if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Parking"))):
										pass
										if R.truth(R.binary("!=", R.binary("&", f.get("m_iLevelTag"), R.statics["RDGameModeStory"].get("LevelTag_ChopperShooting")), 0)):
											pass
											v_levelPatterns = f.get("m_LevelChopperShootingPatterns")
										else:
											pass
											v_levelPatterns = f.get("m_LevelParkingPatterns")
									else:
										pass
										if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Alleyway"))):
											pass
											v_levelPatterns = f.get("m_LevelAlleywayPatterns")
										else:
											pass
											if (float(f.get("m_iSpawnLevelArea")) == float(R.statics["RDGameModeGameplay"].get("Area_Checkpoint"))):
												pass
												v_levelPatterns = f.get("m_LevelTownCheckpointPatterns")
			v_fSpawnRatio = float((float(f.get("m_fSpawnRatioBaseNormal")) + float((float(f.get("m_fLevelDifficulty")) * float(f.get("m_fSpawnRatioIncrementNormal"))))))
			if (float((float(((f.get("m_Camera") as R.Value).fields.get("m_vLocation") as R.Value).fields.get("Z")) + float(R.statics["RDGameModeGameplay"].get("PatternViewDistance")))) >= float(f.get("m_fNextHardPatternSpawnPosition"))):
				pass
				v_fSpawnRatio = float((float(f.get("m_fSpawnRatioBaseHard")) + float((float(f.get("m_fLevelDifficulty")) * float(f.get("m_fSpawnRatioIncrementHard"))))))
				f["m_fNextHardPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextHardPatternSpawnPosition"), (float(R.statics["RDGameModeGameplay"].get("HardPatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("HardPatternSpacingRandom")))))))
			if R.truth(((R.truth(((float(f.get("m_iSpawnLevel")) >= float(f.get("m_iChopperSupportStartLevel"))) and (float(f.get("m_iSpawnLevel")) <= float(f.get("m_iChopperSupportEndLevel"))))) and R.truth(f.get("m_HelicopterAlly"))) and (f.get("m_HelicopterAlly") as R.Value).fields.get("m_bShootingMode"))):
				pass
				v_fSpawnRatio = float(minf(float((v_fSpawnRatio * float(1.5))), float(1)))
			v_levelPattern = R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew"))
			if R.truth(((((R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_ChopperShooting")))):
				pass
				v_fSpawnRatio = float(1)
			f["m_bIsZombieCheckpoint"] = f.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.num( await load_section(v_levelPattern, [c, f.get("m_iLevel"), f.get("m_fLevelDifficulty"), f.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1], context))
			if not clock.valid_context(context): return null
			f["m_bIsZombieCheckpoint"] = false
			f["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [f.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			if R.truth(((f.get("m_Player") as R.Value).fields.get("m_bIsOnFire") and (float(randf()) < float(R.statics["RDGameModeGameplay"].get("WaterJugChance"))))):
				pass
				v_fPatternSpacing = float((float(R.statics["RDGameModeGameplay"].get("PatternSpacingMin")) + float((float(randf()) * float(R.statics["RDGameModeGameplay"].get("PatternSpacingRandom"))))))
				v_waterJug = R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug"))
				v_fPosZ = float((float(f.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(f.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.statics["RDRoad"].get("RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.statics["RDRoad"].get("RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			f["m_fNextPatternSpawnPosition"] = R.num(R.binary("+", f.get("m_fNextPatternSpawnPosition"), v_fPatternSpace))
			v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
			while (float(f.get("m_fNextPatternSpawnPosition")) >= v_fNextSpawnLevelStartPosition):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				f["m_bSpawnWeaponCrate"] = true
				f["m_iSpawnLevelArea"] = R.coerce(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				f["m_fSpawnLevelStartPosition"] = v_fNextSpawnLevelStartPosition
				R.call_member(c, "OnNewSpawnLevelArea", [f.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value(f.get("LevelInfos"), (float((float(f.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(f.get("m_fSpawnLevelStartPosition")) + v_fSpawnLevelLength))
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth((f.get("m_bRadioRepair") and (float((f.get("m_Player") as R.Value).fields.get("m_iCurrentTask")) == float(R.statics["RDPlayer"].get("Task_None"))))):
		pass
		f["m_fRadioRepairTime"] = R.num(R.binary("-", f.get("m_fRadioRepairTime"), v_fDeltaTime))
		if (float(f.get("m_fRadioRepairTime")) <= float(0)):
			pass
			f["m_fRadioRepairTime"] = float(10)
			R.set_value(c, "m_iRadioRepairAttempt", 1, "+=")
			if (float(f.get("m_iRadioRepairAttempt")) == float(1)):
				pass
				R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 0) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 0)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			else:
				pass
				if (float(f.get("m_iRadioRepairAttempt")) == float(2)):
					pass
					R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 1) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 1)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
				else:
					pass
					if (float(f.get("m_iRadioRepairAttempt")) == float(3)):
						pass
						R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [(R.statics["RDPlayer"].get("Speaker_Cocheta") if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.statics["RDPlayer"].get("Speaker_Diane")), (R.get_value(f.get("m_MaleRadioRepairVoices"), 2) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 2)), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
						(f.get("m_Player") as R.Value).fields["m_bForceBrake"] = true
		v_voice = (R.get_value(f.get("m_MaleRadioRepairVoices"), 0) if R.truth((f.get("m_Game") as R.Value).fields.get("m_bIsFemale")) else R.get_value(f.get("m_FemaleRadioRepairVoices"), 0))
		if ((R.truth(((f.get("m_bRadioRepair") and ( not R.truth((f.get("m_Game") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(v_voice, "IsPlaying", []))))) and R.truth(R.call_member(f.get("m_Player"), "CanStartTask", []))) and (float((f.get("m_Player") as R.Value).fields.get("m_iLeftHandState")) == float(R.statics["RDPlayer"].get("HandState_OnWheel")))):
			pass
			f["m_bRadioRepair"] = false
			R.call_member(f.get("m_Player"), "StartTask", [R.statics["RDPlayer"].get("Task_RepairRadio"), false, 0])
	if R.truth(((R.truth(f.get("m_RadioRepairedVoice")) and ( not R.truth((f.get("m_Game") as R.Value).fields.get("m_bPaused")))) and ( not R.truth(R.call_member(f.get("m_RadioRepairedVoice"), "IsPlaying", []))))):
		pass
		f["m_StoryDialog"] = f.get("m_RadioRepairVoice")
		R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
		R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		f["m_RadioRepairedVoice"] = null
	if R.truth(f.get("m_bIsChopperShootingLevel")):
		pass
		f["m_fChopperShootingTimer"] = R.num(R.binary("+", f.get("m_fChopperShootingTimer"), v_fDeltaTime))
		if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice1Time"))) and f.get("m_bPlayChopperShootingVoice1"))):
			pass
			f["m_bPlayChopperShootingVoice1"] = false
			f["m_StoryDialog"] = f.get("m_ChopperShooting1Voice")
			R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		else:
			pass
			if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice2Time"))) and f.get("m_bPlayChopperShootingVoice2"))):
				pass
				f["m_bPlayChopperShootingVoice2"] = false
				R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting2Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
			else:
				pass
				if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice2BTime"))) and f.get("m_bPlayChopperShootingVoice2B"))):
					pass
					f["m_bPlayChopperShootingVoice2B"] = false
					f["m_StoryDialog"] = f.get("m_ChopperShooting2BVoice")
					R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
					R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
				else:
					pass
					if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice3Time"))) and f.get("m_bPlayChopperShootingVoice3"))):
						pass
						f["m_bPlayChopperShootingVoice3"] = false
						R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting3Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
					else:
						pass
						if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice3BTime"))) and f.get("m_bPlayChopperShootingVoice3B"))):
							pass
							f["m_bPlayChopperShootingVoice3B"] = false
							f["m_StoryDialog"] = f.get("m_ChopperShooting3BVoice")
							R.call_member(f.get("m_Player"), "PlayDialog", [f.get("m_StoryDialog"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
							R.call_member(f.get("m_Player"), "addEventListener", [R.statics["RDPlayer"].get("Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
						else:
							pass
							if R.truth(((float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingVoice4Time"))) and f.get("m_bPlayChopperShootingVoice4"))):
								pass
								f["m_bPlayChopperShootingVoice4"] = false
								R.call_member(f.get("m_Player"), "PlayPlayerVoiceSound", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_ChopperShooting4Voice"), R.statics["RDPlayer"].get("VoicePriority_Crucial")])
							else:
								pass
								if (float(f.get("m_fChopperShootingTimer")) >= float(R.statics["RDGameModeStory"].get("ChopperShootingTime"))):
									pass
									R.call_member(c, "CompleteStoryMode", [])
									if R.truth(((float((R.statics["RDPlayerInfo"].get("Instance") as R.Value).fields.get("m_iCivsInCar")) > float(0)) and ( not R.truth(R.get_value(((f.get("m_Game") as R.Value).fields.get("m_PlayerInfo") as R.Value).fields.get("m_completedAchievements"), R.statics["RDAchievement"].get("FreeRide")))))):
										pass
										R.call_member(f.get("m_Game"), "CompleteAchievement", [R.statics["RDAchievement"].get("FreeRide")])
										R.call_member(f.get("m_Game"), "SavePlayerInfo", [])
									(f.get("m_Game") as R.Value).fields["m_CinematicTransitionGameMode"] = c
									R.call_member(R.statics["RDGame"].get("Instance"), "StartCinematic", ["GameEnding", false])
		R.call_member((f.get("m_Game") as R.Value).fields.get("m_Hud"), "ShowTime", [(float(R.statics["RDGameModeStory"].get("ChopperShootingTime")) - float(f.get("m_fChopperShootingTimer")))])
		if R.truth(R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "ShouldReplenishAmmo", [])):
			pass
			R.call_member(f.get("m_Player"), "PlayPlayerRandomVoice", [R.statics["RDPlayer"].get("Speaker_Center"), f.get("m_AmmoVoices"), 1, R.statics["RDPlayer"].get("VoicePriority_Extra")])
			R.call_member(f.get("m_AmmoSound"), "Play", [])
			R.call_member((f.get("m_Player") as R.Value).fields.get("m_Weapon"), "ReplenishAmmo", [true, 1])
	if R.truth(f.get("m_bFirstUpdate")):
		pass
		R.call_member(c, "OnLevelTagEvents", [])
		f["m_bFirstUpdate"] = false
	return null
