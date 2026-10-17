extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDEntityWithVoice(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fScale: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	R.invoke(R.super_ref(c, "RDEntityWithVoice"), [v_mcClass, v_fScale])
	(c).fields["m_iVoicePriority"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEntityWithVoice"), "SetInitialState"), [])
	(c).fields["m_iVoicePriority"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "UpdateVoices", [v_fDeltaTime])
	R.invoke(R.get_value(R.super_ref(c, "RDEntityWithVoice"), "Update"), [v_fDeltaTime])
	return null

static func f_UpdateVoices(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	pass
	return null

static func f_StopVoiceSound(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_VoiceSound")):
		pass
		R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_VoiceSound")])
		R.call_member((c).fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [null])
		(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_PlayRandomVoice(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = null
	var v_voices: Variant = R.coerce((a[0] if a.size() > 0 else null), "RandomHat")
	var v_fChance: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	var v_iPriority: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_voice = R.coerce(null, "DTSpacialSound")
	if R.truth((float(randf()) < float(v_fChance))):
		pass
		v_voice = R.coerce(R.binary("as", R.call_member(v_voices, "GetRandomValue", []), R.klass("DTSpacialSound")), "DTSpacialSound")
		R.call_member(c, "PlayVoiceSound", [v_voice, v_iPriority])
		return true
	return false
	return null

static func f_PlayVoiceSound(c: Variant, a: Array) -> Variant:
	var v_voice: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSpacialSound")
	var v_iPriority: Variant = R.coerce((a[1] if a.size() > 1 else R.unary("-", 1)), "int")
	if R.truth((((R.unary("!", (c).fields.get("m_VoiceSound")) or R.unary("!", R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", []))) or R.binary("==", v_iPriority, R.unary("-", 1))) or (float(v_iPriority) > float((c).fields.get("m_iVoicePriority"))))):
		pass
		if R.truth((c).fields.get("m_VoiceSound")):
			pass
			R.call_member(c, "StopSoundOnActor", [(c).fields.get("m_VoiceSound")])
			R.call_member((c).fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [null])
		(c).fields["m_VoiceSound"] = R.coerce(v_voice, "DTSpacialSound")
		(c).fields["m_iVoicePriority"] = R.coerce(v_iPriority, "int")
		R.call_member((c).fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [R.get_value(c, "OnVoiceSoundEnded")])
		R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_VoiceSound")])
		(c).fields["m_bVoicePaused"] = false
	return null

static func f_PauseVoice(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.logical_and(v_bPause, func(): return R.call_member(c, "HasVoicePlaying", []))):
		pass
		(c).fields["m_fVoicePausePosition"] = R.coerce(R.call_member((c).fields.get("m_VoiceSound"), "GetPosition", []), "Number")
		R.call_member((c).fields.get("m_VoiceSound"), "Stop", [])
		(c).fields["m_bVoicePaused"] = true
	else:
		pass
		if R.truth((c).fields.get("m_bVoicePaused")):
			pass
			if R.truth((c).fields.get("m_VoiceSound")):
				pass
				R.call_member((c).fields.get("m_VoiceSound"), "Play", [false, 0, (c).fields.get("m_fVoicePausePosition")])
			(c).fields["m_bVoicePaused"] = false
	return null

static func f_OnVoiceSoundEnded(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth((c).fields.get("m_VoiceSound")):
		pass
		R.call_member((c).fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [null])
		(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
		(c).fields["m_iVoicePriority"] = R.coerce(R.unary("-", 1), "int")
	return null

static func f_HasVoicePlaying(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_VoiceSound")), func(): return R.call_member((c).fields.get("m_VoiceSound"), "IsPlaying", []))
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDEntityWithVoice"), "Destroy"), [])
	if R.truth((c).fields.get("m_VoiceSound")):
		pass
		R.call_member((c).fields.get("m_VoiceSound"), "SetSoundCompleteCallback", [null])
		(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iVoicePriority"] = R.coerce(0, "int")
	(c).fields["m_VoiceSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fVoicePausePosition"] = float(NAN)
	(c).fields["m_bVoicePaused"] = false
	return null
