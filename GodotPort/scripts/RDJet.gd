extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDJet(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDJet"), [R.klass("MC_Jet"), R.static_value("RDJet", "Scale")])
	c.fields["m_bUpdateOutOfView"] = true
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_BomberJets"), "int")
	(c).fields["m_FlySound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_JetPassBy"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	c.fields["m_fBackSoundDistanceMultiplier"] = float(1)
	(c).fields["m_fReturnTimer"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(R.static_value("RDJet", "PassBySpeed"))
	(c).fields["m_bPlayPassBySound"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [2])
	(c).fields["m_bPlayDispatchSound"] = true
	(c).fields["m_Explosives"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_fDropResultTimer"] = float(0)
	(c).fields["m_fWaitNextDropTimer"] = float(0)
	(c).fields["m_iNbDrops"] = R.coerce(0, "int")
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_GameplayMode"] = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	var v_game: Variant = null
	v_game = R.coerce(R.static_value("RDGame", "Instance"), "RDGame")
	R.assign(c, "DispatchSounds", "RDJet", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDJet", "DispatchSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetDispatch01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDJet", "DispatchSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetDispatch02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "MissedAndRepeatSounds", "RDJet", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDJet", "MissedAndRepeatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetMissAndRepeat01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDJet", "MissedAndRepeatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetMissAndRepeat02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDJet", "MissedAndRepeatSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetMissAndRepeat03"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "MissedAndLeaveSounds", "RDJet", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDJet", "MissedAndLeaveSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetMissAndLeave01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDJet", "MissedAndLeaveSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetMissAndLeave02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.assign(c, "HitSounds", "RDJet", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDJet", "HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetHit01"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	R.call_member(R.static_value("RDJet", "HitSounds"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_JetHit02"), (v_game).fields.get("m_VoiceSoundGroup"), (v_game).fields.get("m_SoundParamsVoice")])])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDJet"), "SetInitialState"), [])
	R.invoke(R.get_value((c).fields.get("m_Explosives"), "splice"), [0])
	(c).fields["m_bPlayReturnSound"] = false
	(c).fields["m_bDropBombs"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bDoneBombing"] = false
	(c).fields["m_bBombsDropped"] = false
	(c).fields["m_bPlayerHit"] = false
	(c).fields["m_bWaitingForNextDrop"] = false
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_bPassWarning"] = true
	(c).fields["m_bStoryPassBy"] = false
	(c).fields["m_bPlayDialogs"] = false
	(c).fields["m_fReturnPos"] = float(0)
	(c).fields["m_fReturnTimer"] = float(0)
	(c.fields.get("m_vVelocity")).fields["Z"] = float(R.static_value("RDJet", "PassBySpeed"))
	(c).fields["m_bPlayPassBySound"] = true
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [2])
	(c).fields["m_bPlayDispatchSound"] = true
	(c).fields["m_fDropResultTimer"] = float(0)
	(c).fields["m_fWaitNextDropTimer"] = float(0)
	(c).fields["m_iNbDrops"] = R.coerce(0, "int")
	(c).fields["m_bWarnPlayer"] = true
	(c).fields["m_GameplayMode"] = R.coerce(R.binary("as", (R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay")), "RDGameModeGameplay")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 1), "int")
	(c).fields["m_iNbTotalDrops"] = R.coerce(v_iLevel, "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_dispatchSound: Variant = null
	var v_fRoadLimit: Variant = NAN
	var v_i: Variant = 0
	var v_explosive: Variant = null
	var v_fPosZ: Variant = NAN
	var v_hitSound: Variant = null
	var v_missLeaveSound: Variant = null
	var v_missRepeatSound: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_dispatchSound = R.coerce(null, "DTSpacialSound")
	v_fRoadLimit = float(NAN)
	v_i = R.coerce(0, "int")
	v_explosive = R.coerce(null, "RDExplosive")
	v_fPosZ = float(NAN)
	v_hitSound = R.coerce(null, "DTSpacialSound")
	v_missLeaveSound = R.coerce(null, "DTSpacialSound")
	v_missRepeatSound = R.coerce(null, "DTSpacialSound")
	if R.truth(R.unary("!", (c).fields.get("m_Player"))):
		pass
		(c).fields["m_Player"] = R.coerce(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Player"), "RDPlayer")
	R.invoke(R.get_value(R.super_ref(c, "RDJet"), "Update"), [v_fDeltaTime])
	if R.truth(R.logical_and(R.logical_and(R.call_member((c).fields.get("m_GameplayMode"), "CanDoJetVoices", []), func(): return (c).fields.get("m_bPlayDialogs")), func(): return (c).fields.get("m_bPlayDispatchSound"))):
		pass
		v_dispatchSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDJet", "DispatchSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_dispatchSound, R.static_value("RDPlayer", "RadioPriority_AirSupport")])
		(c).fields["m_bPlayDispatchSound"] = false
	if R.truth(((c).fields.get("m_bPlayPassBySound") and (float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((c.fields.get("m_vLocation")).fields.get("Z")))) < float(R.static_value("RDJet", "SoundDistance"))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["JetPassBy", 0.02, 2, 0, 1])
		(c).fields["m_bPlayPassBySound"] = false
	if R.truth(((c).fields.get("m_bPlayReturnSound") and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) < float(R.static_value("RDJet", "SoundDistance"))))):
		pass
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_FlySound")])
		R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["JetPassBy", 0.02, 2, 0, 1])
		(c).fields["m_bPlayReturnSound"] = false
	if R.truth((R.unary("!", (c).fields.get("m_bStoryPassBy")) and (float((c.fields.get("m_vLocation")).fields.get("Z")) > float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))))):
		pass
		if R.truth((float((c).fields.get("m_fReturnTimer")) < float(R.static_value("RDJet", "ReturnDelay")))):
			pass
			(c).fields["m_fReturnTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fReturnTimer"), v_fDeltaTime), "Number")
			if R.truth(((float((c).fields.get("m_fReturnTimer")) >= float(R.static_value("RDJet", "WarnDelay"))) and (c).fields.get("m_bPassWarning"))):
				pass
				R.call_member((c).fields.get("m_Player"), "OnJetPassed", [])
				(c).fields["m_bPassWarning"] = false
			if R.truth((float((c).fields.get("m_fReturnTimer")) >= float(R.static_value("RDJet", "ReturnDelay")))):
				pass
				R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
				(c).fields["m_bPlayReturnSound"] = true
				(c).fields["m_bDropBombs"] = true
				v_fRoadLimit = R.coerce(R.call_member(((c).fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
				if R.truth((float(v_fRoadLimit) < float(R.static_value("RDRoad", "AlleywayLimit")))):
					pass
					(c).fields["m_fReturnPos"] = R.coerce((R.binary("+", R.unary("-", R.static_value("RDRoad", "AlleywayLimit")), 1) if R.truth((float(randf()) > float(0.5))) else (float(R.static_value("RDRoad", "AlleywayLimit")) - float(1))), "Number")
				else:
					pass
					(c).fields["m_fReturnPos"] = R.coerce(R.binary("+", R.unary("-", v_fRoadLimit), (float((float(randf()) * float(2))) * float(v_fRoadLimit))), "Number")
				(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fReturnPos"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
				if R.truth((c).fields.get("m_bWarnPlayer")):
					pass
					R.call_member((c).fields.get("m_Player"), "OnJetComing", [])
					(c).fields["m_bWarnPlayer"] = false
	if R.truth(((c).fields.get("m_bDropBombs") and (float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")))) < float(R.static_value("RDJet", "BombDistance"))))):
		pass
		(c).fields["m_bPlayerHit"] = false
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(R.static_value("RDJet", "NbBombs")))):
			pass
			v_explosive = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDExplosive")]), R.klass("RDExplosive")), "RDExplosive")
			R.call_member(v_explosive, "Init", [(R.klass("MC_Explosion") if R.truth((float(randf()) > float(0.5))) else R.klass("MC_Explosion2")), false, 12, 15])
			v_fPosZ = float((float((c.fields.get("m_vLocation")).fields.get("Z")) - float((float(v_i) * float(R.static_value("RDJet", "BombSpacing"))))))
			R.call_member((c.fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_explosive, R.binary("+", (c).fields.get("m_fReturnPos"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			R.invoke(R.get_value((c).fields.get("m_Explosives"), "push"), [v_explosive])
			R.call_member(v_explosive, "addEventListener", [R.static_value("RDExplosive", "Event_PlayerHit"), R.get_value(c, "OnExplosiveHitPlayer"), false, 0, true])
			R.call_member(v_explosive, "Detonate", [(float(v_i) * float(R.static_value("RDJet", "BombDelay")))])
			v_i = R.signed32(v_i + 1)
		(c).fields["m_bDropBombs"] = false
		(c).fields["m_bBombsDropped"] = true
		R.set_value(c, "m_iNbDrops", 1, "+=")
	if R.truth((c).fields.get("m_bWaitingForNextDrop")):
		pass
		(c).fields["m_fWaitNextDropTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fWaitNextDropTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fWaitNextDropTimer")) >= float(R.static_value("RDJet", "WaitNextDropDelay")))):
			pass
			(c).fields["m_fReturnTimer"] = float(0)
			(c.fields.get("m_vVelocity")).fields["Z"] = float(R.static_value("RDJet", "PassBySpeed"))
			(c).fields["m_bPlayPassBySound"] = true
			R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [2])
			(c).fields["m_bBombsDropped"] = false
			(c).fields["m_fDropResultTimer"] = float(0)
			(c).fields["m_bWaitingForNextDrop"] = false
			(c).fields["m_fWaitNextDropTimer"] = float(0)
			(c.fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDJet", "SpawnDistance"))))
			R.call_member(c, "UpdateDepthPosition", [])
	else:
		pass
		if R.truth((c).fields.get("m_bBombsDropped")):
			pass
			if R.truth((float((c).fields.get("m_fDropResultTimer")) < float(R.static_value("RDJet", "DropResultDelay")))):
				pass
				(c).fields["m_fDropResultTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fDropResultTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDropResultTimer")) >= float(R.static_value("RDJet", "DropResultDelay")))):
					pass
					if R.truth((c).fields.get("m_bPlayerHit")):
						pass
						if R.truth(R.logical_and((c).fields.get("m_bPlayDialogs"), func(): return R.call_member((c).fields.get("m_GameplayMode"), "CanDoJetVoices", []))):
							pass
							v_hitSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDJet", "HitSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
							R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_hitSound, R.static_value("RDPlayer", "RadioPriority_AirSupport")])
						(c).fields["m_bDoneBombing"] = true
					else:
						pass
						if R.truth((float((c).fields.get("m_iNbDrops")) == float((c).fields.get("m_iNbTotalDrops")))):
							pass
							if R.truth(R.logical_and((c).fields.get("m_bPlayDialogs"), func(): return R.call_member((c).fields.get("m_GameplayMode"), "CanDoJetVoices", []))):
								pass
								v_missLeaveSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDJet", "MissedAndLeaveSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
								R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_missLeaveSound, R.static_value("RDPlayer", "RadioPriority_AirSupport")])
							(c).fields["m_bDoneBombing"] = true
						else:
							pass
							if R.truth(R.logical_and((c).fields.get("m_bPlayDialogs"), func(): return R.call_member((c).fields.get("m_GameplayMode"), "CanDoJetVoices", []))):
								pass
								v_missRepeatSound = R.coerce(R.binary("as", R.call_member(R.static_value("RDJet", "MissedAndRepeatSounds"), "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
								R.call_member((c).fields.get("m_Player"), "PlayRadioComm", [v_missRepeatSound, R.static_value("RDPlayer", "RadioPriority_AirSupport")])
							(c).fields["m_bWaitingForNextDrop"] = true
						R.call_member((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode"), "OnJetBombDodged", [])
					R.call_member(c, "ClearExplosives", [])
	return null

static func f_ClearExplosives(c: Variant, a: Array) -> Variant:
	var v_explosive: Variant = null
	var v_iNbExplosives: Variant = 0
	var v_i: Variant = 0
	v_explosive = R.coerce(null, "RDExplosive")
	v_iNbExplosives = R.coerce(R.coerce(R.get_value((c).fields.get("m_Explosives"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbExplosives))):
		pass
		v_explosive = R.coerce(R.invoke(R.klass("RDExplosive"), [R.get_value((c).fields.get("m_Explosives"), v_i)]), "RDExplosive")
		R.call_member(v_explosive, "removeEventListener", [R.static_value("RDExplosive", "Event_PlayerHit"), R.get_value(c, "OnExplosiveHitPlayer")])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_Explosives"), "splice"), [0])
	return null

static func f_OnExplosiveHitPlayer(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["m_bPlayerHit"] = true
	return null

static func f_UpdateMovement(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fReturnTimer")) >= float(R.static_value("RDJet", "ReturnDelay")))):
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = R.coerce(R.binary("+", R.unary("-", R.static_value("RDJet", "ReturnSpeed")), (((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z")), "Number")
	else:
		pass
		(c.fields.get("m_vVelocity")).fields["Z"] = float((float(R.static_value("RDJet", "PassBySpeed")) + float((((c).fields.get("m_Player")).fields.get("m_vVelocity")).fields.get("Z"))))
	R.call_member(c.fields.get("m_World"), "MoveEntity", [c, 0, 0, (float((c.fields.get("m_vVelocity")).fields.get("Z")) * float(v_fDeltaTime))])
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fReturnPos"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	(c.fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", R.static_value("RDJet", "FlyHeight"), R.call_static("RDWorld", "GetPerlinY", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return ((c).fields.get("m_bDoneBombing") and R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 200)))
	return null

static func f_StartStoryPassBy(c: Variant, a: Array) -> Variant:
	var v_fOffset: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fPos: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	(c).fields["m_fStoryOffset"] = float(v_fOffset)
	(c).fields["m_bStoryPassBy"] = true
	(c).fields["m_fReturnPos"] = float(v_fPos)
	return null

static func f_StartStoryComeBack(c: Variant, a: Array) -> Variant:
	var v_fRoadLimit: Variant = NAN
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	(c).fields["m_bPlayReturnSound"] = true
	(c).fields["m_bDropBombs"] = true
	(c.fields.get("m_vLocation")).fields["Z"] = float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_fMaxViewDistance")))) + float((c).fields.get("m_fStoryOffset"))))
	R.call_member(c, "UpdateDepthPosition", [])
	v_fRoadLimit = R.coerce(R.call_member(((c).fields.get("m_GameplayMode")).fields.get("m_Road"), "GetRoadAreaAt", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
	(c).fields["m_fReturnPos"] = R.coerce(R.binary("+", R.unary("-", v_fRoadLimit), (float((float(randf()) * float(2))) * float(v_fRoadLimit))), "Number")
	(c.fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", (c).fields.get("m_fReturnPos"), R.call_static("RDWorld", "GetPerlinX", [(c.fields.get("m_vLocation")).fields.get("Z")])), "Number")
	(c).fields["m_fReturnTimer"] = float(R.static_value("RDJet", "ReturnDelay"))
	return null

static func f_SetPlayDialogs(c: Variant, a: Array) -> Variant:
	var v_bPlayDialogs: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bPlayDialogs"] = v_bPlayDialogs
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "DispatchSounds", null, "=")
	R.set_value(c, "MissedAndRepeatSounds", null, "=")
	R.set_value(c, "MissedAndLeaveSounds", null, "=")
	R.set_value(c, "HitSounds", null, "=")
	R.set_value(c, "Scale", 4, "=")
	R.set_value(c, "FlyHeight", 9, "=")
	R.set_value(c, "PassBySpeed", R.binary("/", R.binary("/", (float(300) * float(1000)), 60), 60), "=")
	R.set_value(c, "ReturnSpeed", R.binary("/", R.binary("/", (float(300) * float(1000)), 60), 60), "=")
	R.set_value(c, "SoundDistance", 150, "=")
	R.set_value(c, "SpawnDistance", 160, "=")
	R.set_value(c, "BombDistance", 60, "=")
	R.set_value(c, "NbBombs", 8, "=")
	R.set_value(c, "BombDelay", 0.3, "=")
	R.set_value(c, "BombSpacing", 9, "=")
	R.set_value(c, "DistanceOffset", 100, "=")
	R.set_value(c, "DropResultDelay", (float((float(R.static_value("RDJet", "NbBombs")) * float(R.static_value("RDJet", "BombDelay")))) + float(2)), "=")
	R.set_value(c, "WarnDelay", 0.2, "=")
	R.set_value(c, "ReturnDelay", 3, "=")
	R.set_value(c, "WaitNextDropDelay", 8, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_FlySound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_bPlayPassBySound"] = false
	(c).fields["m_bPlayReturnSound"] = false
	(c).fields["m_fReturnTimer"] = float(NAN)
	(c).fields["m_bDropBombs"] = false
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_bDoneBombing"] = false
	(c).fields["m_bPlayDispatchSound"] = false
	(c).fields["m_Explosives"] = R.coerce(null, "Array")
	(c).fields["m_bBombsDropped"] = false
	(c).fields["m_fDropResultTimer"] = float(NAN)
	(c).fields["m_iNbDrops"] = R.coerce(0, "int")
	(c).fields["m_iNbTotalDrops"] = R.coerce(0, "int")
	(c).fields["m_bPlayerHit"] = false
	(c).fields["m_bWaitingForNextDrop"] = false
	(c).fields["m_fWaitNextDropTimer"] = float(NAN)
	(c).fields["m_bWarnPlayer"] = false
	(c).fields["m_bPassWarning"] = true
	(c).fields["m_fStoryOffset"] = float(NAN)
	(c).fields["m_bStoryPassBy"] = false
	(c).fields["m_bPlayDialogs"] = false
	(c).fields["m_fReturnPos"] = float(0)
	(c).fields["m_GameplayMode"] = R.coerce(null, "RDGameModeGameplay")
	return null
