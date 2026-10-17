extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleTomb(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleTomb"), [null, R.static_value("RDObstacleTomb", "Scale")])
	c.fields["m_HitSound"] = R.coerce(R.call_member(c, "CreateEntitySpacialSound", [R.klass("SND_ConcreteDestroy"), (R.static_value("RDGame", "Instance")).fields.get("m_GameSFXSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanBeRunThrough"] = true
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(10)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.15)
	c.fields["m_fHitShakeIntensity"] = float(0.15)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactConcrete")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Concrete"), "int")
	c.fields["m_szExplodeHitAnim"] = R.coerce("Blown", "String")
	c.fields["m_szBulletShredAnim"] = R.coerce("Blown", "String")
	c.fields["m_bCanBeShotByHelicopter"] = true
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleTomb"), "SetInitialState"), [])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = null
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else R.unary("-", 1)), "int")
	v_mcClass = R.coerce(null, "Class")
	c.fields["m_bFillNavMesh"] = false
	(c).fields["m_iSpawnType"] = R.coerce(v_iType, "int")
	v_iType = R.coerce((R.call_static("Maths", "RandomInt", [3]) if R.truth(R.binary("==", v_iType, R.unary("-", 1))) else v_iType), "int")
	if R.truth((float(v_iType) == float(0))):
		pass
		v_mcClass = R.coerce(R.klass("MC_tomb1"), "Class")
	else:
		pass
		if R.truth((float(v_iType) == float(1))):
			pass
			v_mcClass = R.coerce(R.klass("MC_tomb2"), "Class")
		else:
			pass
			if R.truth((float(v_iType) == float(2))):
				pass
				v_mcClass = R.coerce(R.klass("MC_tomb3"), "Class")
				c.fields["m_bFillNavMesh"] = true
	R.call_member(c, "InitMCs", [v_mcClass])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fHP"] = R.coerce((100 if R.truth((float(v_iType) != float(2))) else 200), "Number")
	if R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", false, "=")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((c.fields.get("m_bEditorMode") and R.truth(R.get_value(c.fields.get("m_MC"), "RandomIcon")))):
		pass
		R.set_value(R.get_value(c.fields.get("m_MC"), "RandomIcon"), "visible", R.binary("==", (c).fields.get("m_iSpawnType"), R.unary("-", 1)), "=")
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleTomb"), "Update"), [v_fDeltaTime])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 3, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_iSpawnType"] = R.coerce(0, "int")
	return null
