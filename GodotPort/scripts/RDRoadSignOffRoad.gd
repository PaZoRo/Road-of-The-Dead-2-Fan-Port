extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDRoadSignOffRoad(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDRoadSignOffRoad"), [null, R.static_value("RDEntity", "Layer_SideBackground")])
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_bCanBeHitByBullet"] = true
	c.fields["m_fBulletHitEffectScaleMin"] = float(2)
	c.fields["m_fBulletHitEffectScaleMax"] = float(4)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDRoadSignOffRoad"), "SetInitialState"), [])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndStop"), [1])
	return null

static func f_Break(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(c.fields.get("m_MC"), "gotoAndPlay"), ["Break"])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
