extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTSoundGroupMix(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "DTSoundGroupMix"), [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_SoundGroupA"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_SoundGroupB"] = R.coerce(null, "DTSoundGroup")
	(c).fields["m_fVolume"] = float(NAN)
	return null
