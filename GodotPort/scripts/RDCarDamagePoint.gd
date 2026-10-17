extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCarDamagePoint(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCarDamagePoint"), [R.klass("MovieClip"), R.static_value("RDEntity", "Layer_Dynamic")])
	c.fields["m_bCanBeShotByHelicopter"] = true
	c.fields["m_bCanBeHitByExplosion"] = true
	c.fields["m_bCanBeHitByBullet"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDCarDamagePoint"), "SetInitialState"), [])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_car: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDObstacleCar")
	var v_iType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fHP: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	(c).fields["m_Car"] = R.coerce(v_car, "RDObstacleCar")
	(c).fields["m_iType"] = R.coerce(v_iType, "int")
	(c).fields["m_fHP"] = float(v_fHP)
	return null

static func f_TakeDamage(c: Variant, a: Array) -> Variant:
	var v_fOldHP: Variant = NAN
	var v_fFinalDamage: Variant = NAN
	var v_iDamage: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamageType: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_fOldHP = float(NAN)
	v_fFinalDamage = float(NAN)
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		v_fOldHP = float((c).fields.get("m_fHP"))
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		v_fFinalDamage = float((float(v_fOldHP) - float((c).fields.get("m_fHP"))))
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Engine")))):
			pass
			R.call_member((c).fields.get("m_Car"), "TakeEngineDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
		else:
			pass
			if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Center")))):
				pass
				R.call_member((c).fields.get("m_Car"), "TakeCenterDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
			else:
				pass
				if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Back")))):
					pass
					R.call_member((c).fields.get("m_Car"), "TakeBackDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
	return null

static func f_TakeExplosionDamage(c: Variant, a: Array) -> Variant:
	var v_fOldHP: Variant = NAN
	var v_fFinalDamage: Variant = NAN
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_instigator: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDEntity")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iDamageType: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	var v_fDamageRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_fOldHP = float(NAN)
	v_fFinalDamage = float(NAN)
	if R.truth((float((c).fields.get("m_fHP")) > float(0))):
		pass
		v_fOldHP = float((c).fields.get("m_fHP"))
		(c).fields["m_fHP"] = float(maxf(float((float((c).fields.get("m_fHP")) - float(v_iDamage))), float(0)))
		v_fFinalDamage = float((float(v_fOldHP) - float((c).fields.get("m_fHP"))))
		if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Engine")))):
			pass
			R.call_member((c).fields.get("m_Car"), "TakeEngineDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
		else:
			pass
			if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Center")))):
				pass
				R.call_member((c).fields.get("m_Car"), "TakeCenterDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
			else:
				pass
				if R.truth((float((c).fields.get("m_iType")) == float(R.static_value("RDCarDamagePoint", "Type_Back")))):
					pass
					R.call_member((c).fields.get("m_Car"), "TakeBackDamage", [v_fFinalDamage, v_instigator, v_iDamageType])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "Type_Engine", 0, "=")
	R.set_value(c, "Type_Center", 1, "=")
	R.set_value(c, "Type_Back", 2, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Car"] = R.coerce(null, "RDObstacleCar")
	(c).fields["m_fHP"] = float(NAN)
	(c).fields["m_iType"] = R.coerce(0, "int")
	return null
