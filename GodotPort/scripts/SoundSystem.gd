extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_SoundSystem(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SoundSystem"), [])
	return null

static func f_AddSoundGroup(c: Variant, a: Array) -> Variant:
	var v_soundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	R.invoke(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "push"), [v_soundGroup])
	return null

static func f_RemoveSoundGroup(c: Variant, a: Array) -> Variant:
	var v_iLength: Variant = 0
	var v_i: Variant = 0
	var v_soundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	v_iLength = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iLength))):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), v_i), v_soundGroup)):
			pass
			R.invoke(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "splice"), [v_i, 1])
			break
		v_i = R.signed32(v_i + 1)
	return null

static func f_AddSoundGroupMixing(c: Variant, a: Array) -> Variant:
	var v_newMixing: Variant = null
	var v_mixedSoundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	var v_mixingSoundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_fVolume: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	v_newMixing = R.coerce(R.construct(R.klass("DTSoundGroupMix"), []), "DTSoundGroupMix")
	(v_newMixing).fields["m_SoundGroupA"] = R.coerce(v_mixedSoundGroup, "DTSoundGroup")
	(v_newMixing).fields["m_SoundGroupB"] = R.coerce(v_mixingSoundGroup, "DTSoundGroup")
	(v_newMixing).fields["m_fVolume"] = float(v_fVolume)
	R.invoke(R.get_value(R.static_value("SoundSystem", "m_SoundGroupMixings"), "push"), [v_newMixing])
	return v_newMixing
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_s: Variant = 0
	var v_mixing: Variant = null
	var v_soundGroup: Variant = null
	var v_currentSound: Variant = null
	var v_fOldVolume: Variant = NAN
	var v_fNewVolume: Variant = NAN
	var v_iNbSoundGroups: Variant = 0
	var v_g: Variant = 0
	var v_iNbSounds: Variant = null
	var v_i: Variant = null
	var v_iNbMix: Variant = 0
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_s = R.coerce(0, "int")
	v_mixing = R.coerce(null, "DTSoundGroupMix")
	v_soundGroup = R.coerce(null, "DTSoundGroup")
	v_currentSound = R.coerce(null, "DTSound")
	v_fOldVolume = float(NAN)
	v_fNewVolume = float(NAN)
	v_iNbSoundGroups = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), "length"), "int"), "int")
	v_g = R.coerce(0, "int")
	while R.truth((float(v_g) < float(v_iNbSoundGroups))):
		pass
		v_soundGroup = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_SoundGroups"), v_g), R.klass("DTSoundGroup")), "DTSoundGroup")
		R.call_member(v_soundGroup, "Update", [v_fDeltaTime])
		(v_soundGroup).fields["m_bMixingActive"] = false
		(v_soundGroup).fields["m_fTargetMixVolume"] = float(1)
		v_g = R.signed32(v_g + 1)
	v_iNbSounds = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "length"), "int"), "*")
	v_i = R.coerce(0, "*")
	while R.truth(R.binary("<", v_i, v_iNbSounds)):
		pass
		v_currentSound = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), v_i), R.klass("DTSound")), "DTSound")
		if R.truth(v_currentSound):
			pass
			R.call_member(v_currentSound, "Update", [v_fDeltaTime])
			if R.truth(R.binary("!=", (v_currentSound).fields.get("m_SoundChannel"), null)):
				pass
				if R.truth((R.truth((v_currentSound).fields.get("m_SoundGroup")) and (float(((v_currentSound).fields.get("m_SoundGroup")).fields.get("m_fMaxVolume")) > float(0)))):
					pass
					((v_currentSound).fields.get("m_SoundGroup")).fields["m_bMixingActive"] = true
			else:
				pass
				R.invoke(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "splice"), [v_i, 1])
				v_i = R.coerce(R.num(v_i) - 1, "*")
				v_iNbSounds = R.coerce(R.num(v_iNbSounds) - 1, "*")
		v_i = R.coerce(R.num(v_i) + 1, "*")
	v_iNbMix = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_SoundGroupMixings"), "length"), "int"), "int")
	v_s = R.coerce(0, "int")
	while R.truth((float(v_s) < float(v_iNbMix))):
		pass
		v_mixing = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_SoundGroupMixings"), v_s), R.klass("DTSoundGroupMix")), "DTSoundGroupMix")
		if R.truth(((v_mixing).fields.get("m_SoundGroupB")).fields.get("m_bMixingActive")):
			pass
			((v_mixing).fields.get("m_SoundGroupA")).fields["m_fTargetMixVolume"] = float((v_mixing).fields.get("m_fVolume"))
		v_s = R.signed32(v_s + 1)
	v_s = R.coerce(0, "int")
	while R.truth((float(v_s) < float(v_iNbMix))):
		pass
		v_mixing = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_SoundGroupMixings"), v_s), R.klass("DTSoundGroupMix")), "DTSoundGroupMix")
		v_fOldVolume = float(((v_mixing).fields.get("m_SoundGroupA")).fields.get("m_fMixVolume"))
		v_fNewVolume = R.coerce(R.call_static("Maths", "InterpolateNumber", [((v_mixing).fields.get("m_SoundGroupA")).fields.get("m_fMixVolume"), ((v_mixing).fields.get("m_SoundGroupA")).fields.get("m_fTargetMixVolume"), 2, v_fDeltaTime]), "Number")
		((v_mixing).fields.get("m_SoundGroupA")).fields["m_fMixVolume"] = float(v_fNewVolume)
		if R.truth((float(v_fNewVolume) != float(v_fOldVolume))):
			pass
			R.invoke(R.resolve(c, "OnSoundGroupModified", "SoundSystem"), [(v_mixing).fields.get("m_SoundGroupA")])
		v_s = R.signed32(v_s + 1)
	return null

static func f_AddActiveSound(c: Variant, a: Array) -> Variant:
	var v_sound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSound")
	R.invoke(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "push"), [v_sound])
	return null

static func f_RemoveActiveSound(c: Variant, a: Array) -> Variant:
	var v_currentSound: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	var v_sound: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSound")
	v_currentSound = R.coerce(null, "DTSound")
	v_iNbSounds = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_currentSound = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), v_i), R.klass("DTSound")), "DTSound")
		if R.truth(R.binary("==", v_currentSound, v_sound)):
			pass
			R.invoke(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "splice"), [v_i, 1])
			return null
		v_i = R.signed32(v_i + 1)
	return null

static func f_OnSoundGroupModified(c: Variant, a: Array) -> Variant:
	var v_currentSound: Variant = null
	var v_bAffectedByGroup: Variant = false
	var v_parentGroup: Variant = null
	var v_iNbSounds: Variant = 0
	var v_i: Variant = 0
	var v_soundGroup: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTSoundGroup")
	v_currentSound = R.coerce(null, "DTSound")
	v_bAffectedByGroup = false
	v_parentGroup = R.coerce(null, "DTSoundGroup")
	v_iNbSounds = R.coerce(R.coerce(R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iNbSounds))):
		pass
		v_currentSound = R.coerce(R.binary("as", R.get_value(R.static_value("SoundSystem", "m_ActiveSounds"), v_i), R.klass("DTSound")), "DTSound")
		v_bAffectedByGroup = false
		v_parentGroup = R.coerce((v_currentSound).fields.get("m_SoundGroup"), "DTSoundGroup")
		while R.truth(v_parentGroup):
			pass
			if R.truth(R.binary("==", v_parentGroup, v_soundGroup)):
				pass
				v_bAffectedByGroup = true
				break
			v_parentGroup = R.coerce((v_parentGroup).fields.get("m_SoundGroup"), "DTSoundGroup")
		if R.truth(v_bAffectedByGroup):
			pass
			R.call_member(v_currentSound, "UpdateVolume", [])
		v_i = R.signed32(v_i + 1)
	return null

static func f_SetSpacialSoundParameters(c: Variant, a: Array) -> Variant:
	var v_fVolumeFallOffDistance: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fVolumeMaxDistance: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fPanFallOffDistance: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fPanMaxDistance: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.assign(c, "m_fVolumeFallOffDistance", "SoundSystem", v_fVolumeFallOffDistance, "=")
	R.assign(c, "m_fVolumeMaxDistance", "SoundSystem", v_fVolumeMaxDistance, "=")
	R.assign(c, "m_fPanFallOffDistance", "SoundSystem", v_fPanFallOffDistance, "=")
	R.assign(c, "m_fPanMaxDistance", "SoundSystem", v_fPanMaxDistance, "=")
	return null

static func f_CreateSpacialSound(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_soundGroup: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTSoundGroup")
	var v_soundParams: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTSpacialSoundParams")
	var v_bHandlePitch: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	if R.truth(v_soundParams):
		pass
		return R.construct(R.klass("DTSpacialSound"), [v_soundClass, (v_soundParams).fields.get("m_fVolumeFallOffDistance"), (v_soundParams).fields.get("m_fVolumeMaxDistance"), (v_soundParams).fields.get("m_fPanFallOffDistance"), (v_soundParams).fields.get("m_fPanMaxDistance"), v_soundGroup, v_bHandlePitch])
	return R.construct(R.klass("DTSpacialSound"), [v_soundClass, R.static_value("SoundSystem", "m_fVolumeFallOffDistance"), R.static_value("SoundSystem", "m_fVolumeMaxDistance"), R.static_value("SoundSystem", "m_fPanFallOffDistance"), R.static_value("SoundSystem", "m_fPanMaxDistance"), v_soundGroup, v_bHandlePitch])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_ActiveSounds", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_SoundGroups", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_SoundGroupMixings", R.construct(R.klass("Array"), []), "=")
	R.set_value(c, "m_fVolumeFallOffDistance", 200, "=")
	R.set_value(c, "m_fVolumeMaxDistance", 800, "=")
	R.set_value(c, "m_fPanFallOffDistance", 200, "=")
	R.set_value(c, "m_fPanMaxDistance", 400, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
