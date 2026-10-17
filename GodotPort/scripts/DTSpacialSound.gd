extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_DTSpacialSound(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fVolumeFallOffDistance: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fVolumeMaxDistance: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fPanFallOffDistance: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fPanMaxDistance: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_soundGroup: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTSoundGroup")
	var v_bHandlePitch: Variant = R.coerce((a[6] if a.size() > 6 else false), "Boolean")
	R.invoke(R.super_ref(c, "DTSpacialSound"), [v_soundClass, v_soundGroup, v_bHandlePitch])
	(c).fields["m_fVolumeFallOffDistance"] = float(v_fVolumeFallOffDistance)
	(c).fields["m_fVolumeMaxDistance"] = float(v_fVolumeMaxDistance)
	(c).fields["m_fPanFallOffDistance"] = float(v_fPanFallOffDistance)
	(c).fields["m_fPanMaxDistance"] = float(v_fPanMaxDistance)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVolumeFallOffDistance"] = float(NAN)
	(c).fields["m_fVolumeMaxDistance"] = float(NAN)
	(c).fields["m_fPanFallOffDistance"] = float(NAN)
	(c).fields["m_fPanMaxDistance"] = float(NAN)
	(c).fields["m_bAttached"] = false
	(c).fields["m_bManualPan"] = false
	return null
