extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDExplosive(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDExplosive"), [null, R.static_value("RDExplosive", "Scale")])
	(c).fields["m_ExplodeSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_Explosion"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup"), (R.static_value("RDGame", "Instance")).fields.get("m_SoundParamsSuperLoud")]), "DTSpacialSound")
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDExplosive"), "SetInitialState"), [])
	(c).fields["m_bDetonated"] = false
	(c).fields["m_bExploded"] = false
	(c).fields["m_Instigator"] = R.coerce(null, "RDEntity")
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_bPerceivable: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_fRangeX: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fRangeZ: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [R.get_value(c.fields.get("m_MC"), "totalFrames")])
	(c).fields["m_fRangeX"] = float(v_fRangeX)
	(c).fields["m_fRangeZ"] = float(v_fRangeZ)
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDExplosive"), "Update"), [v_fDeltaTime])
	if R.truth(R.unary("!", (c).fields.get("m_bExploded"))):
		pass
		if R.truth((c).fields.get("m_bDetonated")):
			pass
			(c).fields["m_fTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fTimer"), v_fDeltaTime), "Number")
			if R.truth((float((c).fields.get("m_fTimer")) >= float((c).fields.get("m_fDelay")))):
				pass
				R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), [1])
				R.call_member(c, "PlaySoundOnActor", [(c).fields.get("m_ExplodeSound")])
				R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["Explosive", 0.05, 0, 0, 0.4])
				R.call_member(c, "DealRadialDamage", [c, R.static_value("RDExplosive", "ExplosionRangeX"), R.static_value("RDExplosive", "ExplosionRangeZ"), (c).fields.get("m_fExplosionDamage"), R.static_value("RDDamageType", "Missile")])
				(c).fields["m_bExploded"] = true
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return R.binary("<", (float((c.fields.get("m_vLocation")).fields.get("Z")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))), R.unary("-", 100))
	return null

static func f_Detonate(c: Variant, a: Array) -> Variant:
	var v_fDelay: Variant = R.coerce((a[0] if a.size() > 0 else 0), "Number")
	(c).fields["m_fDelay"] = float(v_fDelay)
	(c).fields["m_fTimer"] = float(0)
	(c).fields["m_bDetonated"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Event_PlayerHit", "Event_PlayerHit", "=")
	R.set_value(c, "Scale", 1, "=")
	R.set_value(c, "ExplosionRangeX", 5, "=")
	R.set_value(c, "ExplosionRangeZ", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fExplosionDamage"] = float(2000)
	(c).fields["m_bDetonated"] = false
	(c).fields["m_fDelay"] = float(NAN)
	(c).fields["m_fTimer"] = float(NAN)
	(c).fields["m_bExploded"] = false
	(c).fields["m_ExplodeSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_Instigator"] = R.coerce(null, "RDEntity")
	(c).fields["m_fRangeX"] = float(NAN)
	(c).fields["m_fRangeZ"] = float(NAN)
	return null
