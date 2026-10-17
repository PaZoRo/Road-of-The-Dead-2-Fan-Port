extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTSound(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_soundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_bHandlePitch: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.invoke(R.super_ref(c, "DTSound"), [])
	(c).fields["m_fVolume"] = float(0)
	(c).fields["m_fMaxVolume"] = float(1)
	(c).fields["m_fPan"] = float(0)
	(c).fields["m_bLooping"] = false
	(c).fields["m_SoundClass"] = R.coerce(v_soundClass, "Class")
	if R.truth(v_bHandlePitch):
		pass
		(c).fields["m_TargetBytes"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
		(c).fields["m_fPosition"] = float(0)
		(c).fields["m_fRate"] = float(1)
		(c).fields["m_PitchSound"] = R.coerce(R.construct((c).fields.get("m_SoundClass"), []), "Sound")
		(c).fields["m_Sound"] = R.coerce(R.construct(R.klass("Sound"), []), "Sound")
		R.invoke(R.get_value((c).fields.get("m_Sound"), "addEventListener"), [R.get_value(R.resolve(c, "SampleDataEvent", "DTSound"), "SAMPLE_DATA"), R.get_value(c, "OnSamplePitchData")])
	else:
		pass
		(c).fields["m_Sound"] = R.coerce(R.construct((c).fields.get("m_SoundClass"), []), "Sound")
	(c).fields["m_SoundGroup"] = R.coerce(v_soundGroup, "DTSoundGroup")
	(c).fields["m_SoundCompleteCallback"] = R.coerce(null, "Function")
	(c).fields["m_bFading"] = false
	(c).fields["m_fFadeVolumeStart"] = float(0)
	(c).fields["m_fFadeVolumeEnd"] = float(0)
	(c).fields["m_fFadeDuration"] = float(0)
	(c).fields["m_fFadeTimer"] = float(0)
	(c).fields["m_fDataVolume"] = float(0)
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c, "Stop", [])
	(c).fields["m_SoundClass"] = R.coerce(null, "Class")
	(c).fields["m_Sound"] = R.coerce(null, "Sound")
	(c).fields["m_SoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_SoundCompleteCallback"] = R.coerce(null, "Function")
	return null

static func f_Play(c: Variant, a: Array) -> Variant:
	var v_bWasPlaying: Variant = false
	var v_bLooping: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fFadeDuration: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	var v_fPosition: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	v_bWasPlaying = R.binary("!=", (c).fields.get("m_SoundChannel"), null)
	R.call_member(c, "Stop", [])
	if R.truth(R.unary("!", v_bWasPlaying)):
		pass
		R.call_static("SoundSystem", "AddActiveSound", [c])
	(c).fields["m_bMuted"] = false
	if R.truth((float(v_fFadeDuration) > float(0))):
		pass
		(c).fields["m_bFading"] = true
		(c).fields["m_fFadeVolumeStart"] = float((c).fields.get("m_fVolume"))
		(c).fields["m_fFadeVolumeEnd"] = float(1)
		(c).fields["m_fFadeDuration"] = float(v_fFadeDuration)
		(c).fields["m_fFadeTimer"] = float(0)
	else:
		pass
		(c).fields["m_bFading"] = false
		(c).fields["m_fVolume"] = float(1)
	(c).fields["m_bPitchSoundDone"] = false
	(c).fields["m_fPosition"] = float(0)
	(c).fields["m_fPitchSoundPosition"] = float(0)
	(c).fields["m_SoundChannel"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_Sound"), "play"), [(float(v_fPosition) * float(1000)), (99999999 if R.truth(v_bLooping) else 0)]), "SoundChannel")
	(c).fields["m_bLooping"] = v_bLooping
	if R.truth((c).fields.get("m_SoundChannel")):
		pass
		R.call_member(c, "UpdateVolume", [])
		if R.truth(R.unary("!", (c).fields.get("m_bLooping"))):
			pass
			R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "addEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), R.get_value(c, "OnSoundComplete")])
		if R.truth(R.truth((c).fields.get("m_SoundCompleteCallback"))):
			pass
			R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "addEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), (c).fields.get("m_SoundCompleteCallback")])
	return null

static func f_OnSoundComplete(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "removeEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), R.get_value(c, "OnSoundComplete")])
	(c).fields["m_SoundChannel"] = R.coerce(null, "SoundChannel")
	return null

static func f_Stop(c: Variant, a: Array) -> Variant:
	var v_fFadeDuration: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	if R.truth((c).fields.get("m_SoundChannel")):
		pass
		(c).fields["m_bMuted"] = false
		if R.truth((float(v_fFadeDuration) > float(0))):
			pass
			(c).fields["m_bFading"] = true
			(c).fields["m_fFadeVolumeStart"] = float((c).fields.get("m_fVolume"))
			(c).fields["m_fFadeVolumeEnd"] = float(0)
			(c).fields["m_fFadeDuration"] = float(v_fFadeDuration)
			(c).fields["m_fFadeTimer"] = float(0)
		else:
			pass
			(c).fields["m_bPitchSoundDone"] = false
			(c).fields["m_fPosition"] = float(0)
			R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "stop"), [])
			if R.truth(R.truth((c).fields.get("m_SoundCompleteCallback"))):
				pass
				R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "removeEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), (c).fields.get("m_SoundCompleteCallback")])
			(c).fields["m_SoundChannel"] = R.coerce(null, "SoundChannel")
	return null

static func f_Mute(c: Variant, a: Array) -> Variant:
	var v_bMute: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fFadeDuration: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	(c).fields["m_bMuted"] = v_bMute
	if R.truth((float(v_fFadeDuration) > float(0))):
		pass
		(c).fields["m_bFading"] = true
		(c).fields["m_fFadeVolumeStart"] = float((c).fields.get("m_fVolume"))
		(c).fields["m_fFadeVolumeEnd"] = R.coerce((0 if R.truth(v_bMute) else 1), "Number")
		(c).fields["m_fFadeDuration"] = float(v_fFadeDuration)
		(c).fields["m_fFadeTimer"] = float(0)
	else:
		pass
		(c).fields["m_bFading"] = false
		R.call_member(c, "SetVolume", [(0 if R.truth(v_bMute) else 1)])
	return null

static func f_SetMaxVolume(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fMaxVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fMaxVolume"))
	(c).fields["m_fMaxVolume"] = float(v_fMaxVolume)
	if R.truth((float((c).fields.get("m_fMaxVolume")) != float(v_fOldVolume))):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null

static func f_SetVolume(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fNewVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fVolume"))
	(c).fields["m_fVolume"] = float(v_fNewVolume)
	if R.truth((float((c).fields.get("m_fVolume")) != float(v_fOldVolume))):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null

static func f_SetPan(c: Variant, a: Array) -> Variant:
	var v_fOldPan: Variant = NAN
	var v_fNewPan: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldPan = float((c).fields.get("m_fPan"))
	(c).fields["m_fPan"] = float(v_fNewPan)
	if R.truth((float((c).fields.get("m_fPan")) != float(v_fOldPan))):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null

static func f_SetVolumeAndPan(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fOldPan: Variant = NAN
	var v_fNewVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fNewPan: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fVolume"))
	v_fOldPan = float((c).fields.get("m_fPan"))
	(c).fields["m_fVolume"] = float(v_fNewVolume)
	(c).fields["m_fPan"] = float(v_fNewPan)
	if R.truth(((float((c).fields.get("m_fVolume")) != float(v_fOldVolume)) or (float((c).fields.get("m_fPan")) != float(v_fOldPan)))):
		pass
		R.call_member(c, "UpdateVolume", [])
	return null

static func f_GetVolume(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SoundGroup")):
		pass
		return (float((float((c).fields.get("m_fVolume")) * float((c).fields.get("m_fMaxVolume")))) * R.num(R.call_member((c).fields.get("m_SoundGroup"), "GetVolume", [])))
	return (float((c).fields.get("m_fVolume")) * float((c).fields.get("m_fMaxVolume")))
	return null

static func f_UpdateVolume(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SoundChannel")):
		pass
		R.set_value((c).fields.get("m_SoundTransform"), "volume", R.call_member(c, "GetVolume", []), "=")
		R.set_value((c).fields.get("m_SoundTransform"), "pan", R.call_member(c, "GetPan", []), "=")
		R.set_value((c).fields.get("m_SoundChannel"), "soundTransform", (c).fields.get("m_SoundTransform"), "=")
	return null

static func f_GetPan(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SoundGroup")):
		pass
		return maxf(R.num(R.unary("-", 1)), float(minf(R.num(R.binary("+", (c).fields.get("m_fPan"), R.call_member((c).fields.get("m_SoundGroup"), "GetPan", []))), float(1))))
	return (c).fields.get("m_fPan")
	return null

static func f_SetSoundCompleteCallback(c: Variant, a: Array) -> Variant:
	var v_callback: Variant = R.coerce((a[0] if a.size() > 0 else null), "Function")
	if R.truth((R.truth((c).fields.get("m_SoundChannel")) and R.truth((c).fields.get("m_SoundCompleteCallback")))):
		pass
		R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "removeEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), (c).fields.get("m_SoundCompleteCallback")])
	(c).fields["m_SoundCompleteCallback"] = R.coerce(v_callback, "Function")
	if R.truth((R.truth((c).fields.get("m_SoundCompleteCallback")) and R.truth((c).fields.get("m_SoundChannel")))):
		pass
		R.invoke(R.get_value((c).fields.get("m_SoundChannel"), "addEventListener"), [R.get_value(R.klass("Event"), "SOUND_COMPLETE"), (c).fields.get("m_SoundCompleteCallback")])
	return null

static func f_IsPlaying(c: Variant, a: Array) -> Variant:
	return R.binary("!=", (c).fields.get("m_SoundChannel"), null)
	return null

static func f_GetPosition(c: Variant, a: Array) -> Variant:
	if R.truth(R.unary("!", (c).fields.get("m_SoundChannel"))):
		pass
		return 0
	if R.truth((c).fields.get("m_PitchSound")):
		pass
		return (c).fields.get("m_fPitchSoundPosition")
	return R.binary("/", R.get_value((c).fields.get("m_SoundChannel"), "position"), 1000)
	return null

static func f_GetDuration(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PitchSound")):
		pass
		return R.binary("/", R.get_value((c).fields.get("m_PitchSound"), "length"), 1000)
	return R.binary("/", R.get_value((c).fields.get("m_Sound"), "length"), 1000)
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fFadeRatio: Variant = NAN
	var v_fVolume: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fFadeRatio = float(NAN)
	v_fVolume = float(NAN)
	if R.truth((c).fields.get("m_PitchSound")):
		pass
		(c).fields["m_fPitchSoundPosition"] = float(minf(float((float((c).fields.get("m_fPitchSoundPosition")) + float(v_fDeltaTime))), float(R.binary("/", R.get_value((c).fields.get("m_PitchSound"), "length"), 1000))))
		if R.truth((c).fields.get("m_bPitchSoundDone")):
			pass
			R.call_member(c, "Stop", [])
	if R.truth((c).fields.get("m_bFading")):
		pass
		(c).fields["m_fFadeTimer"] = float(minf(float((float((c).fields.get("m_fFadeTimer")) + float(v_fDeltaTime))), float((c).fields.get("m_fFadeDuration"))))
		v_fFadeRatio = float(R.binary("/", (c).fields.get("m_fFadeTimer"), (c).fields.get("m_fFadeDuration")))
		v_fVolume = float((float((float((float(1) - float(v_fFadeRatio))) * float((c).fields.get("m_fFadeVolumeStart")))) + float((float(v_fFadeRatio) * float((c).fields.get("m_fFadeVolumeEnd"))))))
		R.call_member(c, "SetVolume", [v_fVolume])
		if R.truth((float(v_fFadeRatio) == float(1))):
			pass
			(c).fields["m_bFading"] = false
			if R.truth((R.unary("!", (c).fields.get("m_bMuted")) and (float((c).fields.get("m_fFadeVolumeEnd")) == float(0)))):
				pass
				R.call_member(c, "Stop", [])
	return null

static func f_SetPitch(c: Variant, a: Array) -> Variant:
	var v_fRate: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float(v_fRate) < float(0))):
		pass
		v_fRate = float(0)
	(c).fields["m_fRate"] = float(v_fRate)
	return null

static func f_SetPitchCallback(c: Variant, a: Array) -> Variant:
	var v_setPitchFunction: Variant = R.coerce((a[0] if a.size() > 0 else null), "Function")
	(c).fields["m_GetPitchCallback"] = R.coerce(v_setPitchFunction, "Function")
	return null

static func f_OnSamplePitchData(c: Variant, a: Array) -> Variant:
	var v_l0: Variant = NAN
	var v_r0: Variant = NAN
	var v_l1: Variant = NAN
	var v_r1: Variant = NAN
	var v_fF1: Variant = NAN
	var v_fF2: Variant = NAN
	var v_fRate: Variant = NAN
	var v_data: Variant = null
	var v_scaledBlockSize: Variant = NAN
	var v_positionInt: Variant = 0
	var v_fAlpha: Variant = NAN
	var v_positionTargetNum: Variant = NAN
	var v_positionTargetInt: Variant = 0
	var v_need: Variant = 0
	var v_read: Variant = 0
	var v_n: Variant = 0
	var v_iDataVolumes: Variant = 0
	var v_i: Variant = 0
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "SampleDataEvent")
	v_l0 = float(NAN)
	v_r0 = float(NAN)
	v_l1 = float(NAN)
	v_r1 = float(NAN)
	v_fF1 = float(NAN)
	v_fF2 = float(NAN)
	v_fRate = float((c).fields.get("m_fRate"))
	if R.truth(R.truth((c).fields.get("m_GetPitchCallback"))):
		pass
		v_fRate = R.coerce(R.call_member(c, "m_GetPitchCallback", []), "Number")
	R.set_value((c).fields.get("m_TargetBytes"), "position", 0, "=")
	v_data = R.coerce(R.get_value(v_event, "data"), "ByteArray")
	v_scaledBlockSize = float((float((c).fields.get("BLOCK_SIZE")) * float(v_fRate)))
	v_positionInt = R.coerce((c).fields.get("m_fPosition"), "int")
	v_fAlpha = float((float((c).fields.get("m_fPosition")) - float(v_positionInt)))
	v_positionTargetNum = float(v_fAlpha)
	v_positionTargetInt = R.coerce(R.unary("-", 1), "int")
	v_need = R.coerce((float(ceilf(float(v_scaledBlockSize))) + float(2)), "int")
	v_read = R.coerce(R.invoke(R.get_value((c).fields.get("m_PitchSound"), "extract"), [(c).fields.get("m_TargetBytes"), v_need, v_positionInt]), "int")
	v_n = R.coerce(((c).fields.get("BLOCK_SIZE") if R.truth((float(v_read) == float(v_need))) else R.coerce(R.binary("/", v_read, v_fRate), "int")), "int")
	(c).fields["m_fDataVolume"] = float(0)
	v_iDataVolumes = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_n))):
		pass
		if R.truth((float(R.coerce(v_positionTargetNum, "int")) != float(v_positionTargetInt))):
			pass
			v_positionTargetInt = R.coerce(v_positionTargetNum, "int")
			R.set_value((c).fields.get("m_TargetBytes"), "position", R.binary("<<", v_positionTargetInt, 3), "=")
			v_l0 = R.coerce(R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []), "Number")
			v_r0 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
			v_l1 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
			v_r1 = R.coerce((R.invoke(R.get_value((c).fields.get("m_TargetBytes"), "readFloat"), []) if R.truth(R.binary("<", R.get_value((c).fields.get("m_TargetBytes"), "position"), (R.num(R.get_value((c).fields.get("m_TargetBytes"), "length")) - float(1)))) else 0), "Number")
		v_fF1 = float((float(v_l0) + float((float(v_fAlpha) * float((float(v_l1) - float(v_l0)))))))
		v_fF2 = float((float(v_r0) + float((float(v_fAlpha) * float((float(v_r1) - float(v_r0)))))))
		R.invoke(R.get_value(v_data, "writeFloat"), [v_fF1])
		R.invoke(R.get_value(v_data, "writeFloat"), [v_fF2])
		(c).fields["m_fDataVolume"] = R.coerce(R.binary("+", (c).fields.get("m_fDataVolume"), (float(absf(float(v_fF1))) + float(absf(float(v_fF2))))), "Number")
		v_iDataVolumes = R.coerce(R.binary("+", v_iDataVolumes, 2), "int")
		v_positionTargetNum = R.coerce(R.binary("+", v_positionTargetNum, v_fRate), "Number")
		v_fAlpha = R.coerce(R.binary("+", v_fAlpha, v_fRate), "Number")
		while R.truth((float(v_fAlpha) >= float(1))):
			pass
			v_fAlpha = R.coerce(R.num(v_fAlpha) - 1, "Number")
		v_i = R.signed32(v_i + 1)
	if R.truth((float(v_i) < float((c).fields.get("BLOCK_SIZE")))):
		pass
		while R.truth((float(v_i) < float((c).fields.get("BLOCK_SIZE")))):
			pass
			R.invoke(R.get_value(v_data, "writeFloat"), [0])
			R.invoke(R.get_value(v_data, "writeFloat"), [0])
			v_iDataVolumes = R.coerce(R.binary("+", v_iDataVolumes, 2), "int")
			v_i = R.signed32(v_i + 1)
	(c).fields["m_fPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fPosition"), v_scaledBlockSize), "Number")
	if R.truth((float(v_read) == float(0))):
		pass
		(c).fields["m_bPitchSoundDone"] = true
	(c).fields["m_fDataVolume"] = R.coerce(R.binary("/", (c).fields.get("m_fDataVolume"), v_iDataVolumes), "Number")
	return null

static func f_GetDataVolume(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_fDataVolume")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fMaxVolume"] = float(NAN)
	(c).fields["m_fVolume"] = float(NAN)
	(c).fields["m_fPan"] = float(NAN)
	(c).fields["m_bLooping"] = false
	(c).fields["m_SoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_SoundClass"] = R.coerce(null, "Class")
	(c).fields["m_Sound"] = R.coerce(null, "Sound")
	(c).fields["m_SoundChannel"] = R.coerce(null, "SoundChannel")
	(c).fields["m_SoundCompleteCallback"] = R.coerce(null, "Function")
	(c).fields["m_bMuted"] = false
	(c).fields["m_bFading"] = false
	(c).fields["m_fFadeVolumeStart"] = float(NAN)
	(c).fields["m_fFadeVolumeEnd"] = float(NAN)
	(c).fields["m_fFadeDuration"] = float(NAN)
	(c).fields["m_fFadeTimer"] = float(NAN)
	(c).fields["BLOCK_SIZE"] = R.coerce(3072, "int")
	(c).fields["m_PitchSound"] = R.coerce(null, "Sound")
	(c).fields["m_TargetBytes"] = R.coerce(null, "ByteArray")
	(c).fields["m_fPosition"] = float(NAN)
	(c).fields["m_fRate"] = float(NAN)
	(c).fields["m_GetPitchCallback"] = R.coerce(null, "Function")
	(c).fields["m_bPitchSoundDone"] = false
	(c).fields["m_fPitchSoundPosition"] = float(NAN)
	(c).fields["m_fDataVolume"] = float(NAN)
	(c).fields["m_SoundTransform"] = R.coerce(R.construct(R.klass("SoundTransform"), []), "SoundTransform")
	return null
