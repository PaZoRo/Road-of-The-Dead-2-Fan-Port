extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTSoundGroup(c: Variant, a: Array) -> Variant:
	var v_parentSoundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	R.invoke(R.super_ref(c, "DTSoundGroup"), [])
	(c).fields["m_fVolume"] = float(1)
	(c).fields["m_fMaxVolume"] = float(1)
	(c).fields["m_fMixVolume"] = float(1)
	(c).fields["m_fTargetMixVolume"] = float(1)
	(c).fields["m_fPan"] = float(0)
	(c).fields["m_SoundGroup"] = R.coerce(v_parentSoundGroup, "DTSoundGroup")
	R.call_static("SoundSystem", "AddSoundGroup", [c])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_static("SoundSystem", "RemoveSoundGroup", [c])
	(c).fields["m_SoundGroup"] = R.coerce(null, "DTSoundGroup")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fFadeRatio: Variant = NAN
	var v_fVolume: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fFadeRatio = float(NAN)
	v_fVolume = float(NAN)
	if R.truth((c).fields.get("m_bFading")):
		pass
		(c).fields["m_fFadeTimer"] = float(minf(float((float((c).fields.get("m_fFadeTimer")) + float(v_fDeltaTime))), float((c).fields.get("m_fFadeDuration"))))
		v_fFadeRatio = float(R.binary("/", (c).fields.get("m_fFadeTimer"), (c).fields.get("m_fFadeDuration")))
		v_fVolume = float((float((float((float(1) - float(v_fFadeRatio))) * float((c).fields.get("m_fFadeVolumeStart")))) + float((float(v_fFadeRatio) * float((c).fields.get("m_fFadeVolumeEnd"))))))
		R.call_member(c, "SetVolume", [v_fVolume])
		if R.truth((float(v_fFadeRatio) == float(1))):
			pass
			(c).fields["m_bFading"] = false
	return null

static func f_SetVolume(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fNewVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fVolume"))
	(c).fields["m_fVolume"] = float(v_fNewVolume)
	if R.truth((float((c).fields.get("m_fVolume")) != float(v_fOldVolume))):
		pass
		R.call_static("SoundSystem", "OnSoundGroupModified", [c])
	return null

static func f_SetMaxVolume(c: Variant, a: Array) -> Variant:
	var v_fOldVolume: Variant = NAN
	var v_fNewVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldVolume = float((c).fields.get("m_fMaxVolume"))
	(c).fields["m_fMaxVolume"] = float(v_fNewVolume)
	(c).fields["m_bFading"] = false
	if R.truth((float((c).fields.get("m_fMaxVolume")) != float(v_fOldVolume))):
		pass
		R.call_static("SoundSystem", "OnSoundGroupModified", [c])
	return null

static func f_GetVolume(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SoundGroup")):
		pass
		return (float((float((float((c).fields.get("m_fVolume")) * float((c).fields.get("m_fMaxVolume")))) * float((c).fields.get("m_fMixVolume")))) * R.num(R.call_member((c).fields.get("m_SoundGroup"), "GetVolume", [])))
	return (float((float((c).fields.get("m_fVolume")) * float((c).fields.get("m_fMaxVolume")))) * float((c).fields.get("m_fMixVolume")))
	return null

static func f_SetPan(c: Variant, a: Array) -> Variant:
	var v_fOldPan: Variant = NAN
	var v_fNewPan: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldPan = float((c).fields.get("m_fPan"))
	(c).fields["m_fPan"] = float(v_fNewPan)
	if R.truth((float((c).fields.get("m_fPan")) != float(v_fOldPan))):
		pass
		R.call_static("SoundSystem", "OnSoundGroupModified", [c])
	return null

static func f_GetPan(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SoundGroup")):
		pass
		return maxf(R.num(R.unary("-", 1)), float(minf(R.num(R.binary("+", (c).fields.get("m_fPan"), R.call_member((c).fields.get("m_SoundGroup"), "GetPan", []))), float(1))))
	return (c).fields.get("m_fPan")
	return null

static func f_StartFade(c: Variant, a: Array) -> Variant:
	var v_fVolume: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fFadeDuration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	if R.truth((float(v_fFadeDuration) > float(0))):
		pass
		(c).fields["m_bFading"] = true
		(c).fields["m_fFadeVolumeStart"] = float((c).fields.get("m_fVolume"))
		(c).fields["m_fFadeVolumeEnd"] = float(v_fVolume)
		(c).fields["m_fFadeDuration"] = float(v_fFadeDuration)
		(c).fields["m_fFadeTimer"] = float(0)
	else:
		pass
		(c).fields["m_bFading"] = false
		R.call_member(c, "SetVolume", [v_fVolume])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_SoundGroup"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_fMaxVolume"] = float(NAN)
	(c).fields["m_fVolume"] = float(NAN)
	(c).fields["m_fMixVolume"] = float(NAN)
	(c).fields["m_fTargetMixVolume"] = float(NAN)
	(c).fields["m_fPan"] = float(NAN)
	(c).fields["m_bFading"] = false
	(c).fields["m_fFadeVolumeStart"] = float(NAN)
	(c).fields["m_fFadeVolumeEnd"] = float(NAN)
	(c).fields["m_fFadeDuration"] = float(NAN)
	(c).fields["m_fFadeTimer"] = float(NAN)
	(c).fields["m_bMixingActive"] = false
	return null
