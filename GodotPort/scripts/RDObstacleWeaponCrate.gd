extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDObstacleWeaponCrate(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDObstacleWeaponCrate"), [R.klass("MC_WeaponCrate"), R.static_value("RDObstacleWeaponCrate", "Scale")])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	c.fields["m_fSurvivalGuideDistance"] = float(40)
	c.fields["m_iSurvivalGuideItem"] = R.coerce(R.static_value("RDUnlockData", "Survival_WeaponCaches"), "int")
	c.fields["m_bCanBeRunThrough"] = false
	c.fields["m_fMinRenderScale"] = float(0.0001)
	c.fields["m_fHitDamage"] = float(20)
	c.fields["m_fMinHitHP"] = float(0)
	c.fields["m_fHitSpeedLoss"] = float(0.5)
	c.fields["m_fHitShakeIntensity"] = float(0.2)
	c.fields["m_fHitShakeDuration"] = float(1)
	c.fields["m_fFadeDistance"] = float(140)
	c.fields["m_fFadeRange"] = float(10)
	c.fields["m_iLocationType"] = R.coerce(R.static_value("RDEntity", "Location_WeaponCrate"), "int")
	c.fields["m_BulletHitEffects"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.get_value(c.fields.get("m_BulletHitEffects"), "push"), [R.klass("MC_BulletImpactMetal")])
	c.fields["m_iBulletHitSoundMaterial"] = R.coerce(R.static_value("RDEntity", "BulletHitSoundMaterial_Metal"), "int")
	c.fields["m_bFillNavMesh"] = true
	c.fields["m_fExtraNavMeshSpacing"] = float(0.5)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleWeaponCrate"), "SetInitialState"), [])
	c.fields["m_bFlippedX"] = (float(randf()) > float(0.5))
	return null

static func f_OnAddedToWorld(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleWeaponCrate"), "OnAddedToWorld"), [])
	R.call_member(c.fields.get("m_World"), "AddWeaponCrate", [c])
	return null

static func f_Destroy(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_World"), "RemoveWeaponCrate", [c])
	R.invoke(R.get_value(R.super_ref(c, "RDObstacleWeaponCrate"), "Destroy"), [])
	return null

static func f_GetLocationName(c: Variant, a: Array) -> Variant:
	return "Weapon Crates"
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Scale", 1.5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
