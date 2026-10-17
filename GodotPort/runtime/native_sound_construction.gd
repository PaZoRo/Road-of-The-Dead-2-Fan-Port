extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func sound_constructor(c: R.Value, a: Array) -> Variant:
	var sound_class: Variant = R.coerce(R.arg(a, 0), "Class")
	var sound_group: Variant = R.coerce(R.arg(a, 1), "DTSoundGroup")
	var handle_pitch: bool = R.truth(R.arg(a, 2, false))
	R.invoke(R.super_ref(c, "DTSound"), [])
	c.fields["m_fVolume"] = 0.0;c.fields["m_fMaxVolume"] = 1.0;c.fields["m_fPan"] = 0.0
	c.fields["m_bLooping"] = false;c.fields["m_SoundClass"] = sound_class
	if handle_pitch:
		c.fields["m_TargetBytes"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
		c.fields["m_fPosition"] = 0.0;c.fields["m_fRate"] = 1.0
		c.fields["m_PitchSound"] = R.coerce(R.construct(c.fields.get("m_SoundClass"), []), "Sound")
		c.fields["m_Sound"] = R.coerce(R.construct(R.klass("Sound"), []), "Sound")
		R.invoke(R.get_value(c.fields.get("m_Sound"), "addEventListener"), [R.get_value(R.resolve(c, "SampleDataEvent", "DTSound"), "SAMPLE_DATA"), R.get_value(c, "OnSamplePitchData")])
	else:
		c.fields["m_Sound"] = R.coerce(R.construct(c.fields.get("m_SoundClass"), []), "Sound")

	c.fields["m_SoundGroup"] = sound_group;c.fields["m_SoundCompleteCallback"] = null
	c.fields["m_bFading"] = false;c.fields["m_fFadeVolumeStart"] = 0.0;c.fields["m_fFadeVolumeEnd"] = 0.0
	c.fields["m_fFadeDuration"] = 0.0;c.fields["m_fFadeTimer"] = 0.0;c.fields["m_fDataVolume"] = 0.0
	return null

static func spatial_constructor(c: R.Value, a: Array) -> Variant:
	var sound_class: Variant = R.coerce(R.arg(a, 0), "Class")
	var volume_falloff: float = R.num(R.arg(a, 1, NAN))
	var volume_max: float = R.num(R.arg(a, 2, NAN))
	var pan_falloff: float = R.num(R.arg(a, 3, NAN))
	var pan_max: float = R.num(R.arg(a, 4, NAN))
	var sound_group: Variant = R.coerce(R.arg(a, 5), "DTSoundGroup")
	var handle_pitch: bool = R.truth(R.arg(a, 6, false))
	R.invoke(R.super_ref(c, "DTSpacialSound"), [sound_class, sound_group, handle_pitch])
	c.fields["m_fVolumeFallOffDistance"] = volume_falloff;c.fields["m_fVolumeMaxDistance"] = volume_max
	c.fields["m_fPanFallOffDistance"] = pan_falloff;c.fields["m_fPanMaxDistance"] = pan_max
	return null
