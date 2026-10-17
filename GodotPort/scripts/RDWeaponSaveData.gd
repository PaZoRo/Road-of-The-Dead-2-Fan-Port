extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeaponSaveData(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.super_ref(c, "RDWeaponSaveData"), [])
	(c).fields["m_szName"] = R.coerce(v_szName, "String")
	R.call_member(c, "Reset", [])
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	(c).fields["m_bUnlocked"] = false
	(c).fields["m_iAimingPoints"] = float(0)
	(c).fields["m_iHandlingPoints"] = float(0)
	(c).fields["m_iReloadingPoints"] = float(0)
	(c).fields["m_iAimingLevel"] = R.coerce(0, "int")
	(c).fields["m_iHandlingLevel"] = R.coerce(0, "int")
	(c).fields["m_iReloadingLevel"] = R.coerce(0, "int")
	(c).fields["m_iDamageLevel"] = R.coerce(0, "int")
	(c).fields["m_iAccuracyLevel"] = R.coerce(0, "int")
	(c).fields["m_iCapacityLevel"] = R.coerce(0, "int")
	(c).fields["m_iAmmoInMag"] = R.coerce(0, "int")
	(c).fields["m_iAmmoInBag"] = R.coerce(0, "int")
	(c).fields["m_iKills"] = R.coerce(0, "int")
	return null

static func f_Save(c: Variant, a: Array) -> Variant:
	var v_gameSaveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "SharedObject")
	R.set_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName"), R.construct(R.resolve(c, "Object", "RDWeaponSaveData"), []), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_bUnlocked", (c).fields.get("m_bUnlocked"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAimingPoints", (c).fields.get("m_iAimingPoints"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iHandlingPoints", (c).fields.get("m_iHandlingPoints"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iReloadingPoints", (c).fields.get("m_iReloadingPoints"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAimingLevel", (c).fields.get("m_iAimingLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iHandlingLevel", (c).fields.get("m_iHandlingLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iReloadingLevel", (c).fields.get("m_iReloadingLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iDamageLevel", (c).fields.get("m_iDamageLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAccuracyLevel", (c).fields.get("m_iAccuracyLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iCapacityLevel", (c).fields.get("m_iCapacityLevel"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAmmoInMag", (c).fields.get("m_iAmmoInMag"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAmmoInBag", (c).fields.get("m_iAmmoInBag"), "=")
	R.set_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iKills", (c).fields.get("m_iKills"), "=")
	return null

static func f_Load(c: Variant, a: Array) -> Variant:
	var v_gameSaveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "SharedObject")
	if R.truth(R.unary("!", R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")))):
		pass
		return null
	(c).fields["m_bUnlocked"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_bUnlocked"), "Boolean")
	(c).fields["m_iAimingPoints"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAimingPoints"), "Number")
	(c).fields["m_iHandlingPoints"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iHandlingPoints"), "Number")
	(c).fields["m_iReloadingPoints"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iReloadingPoints"), "Number")
	(c).fields["m_iAimingLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAimingLevel"), "int")
	(c).fields["m_iHandlingLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iHandlingLevel"), "int")
	(c).fields["m_iReloadingLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iReloadingLevel"), "int")
	(c).fields["m_iDamageLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iDamageLevel"), "int")
	(c).fields["m_iAccuracyLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAccuracyLevel"), "int")
	(c).fields["m_iCapacityLevel"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iCapacityLevel"), "int")
	(c).fields["m_iAmmoInMag"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAmmoInMag"), "int")
	(c).fields["m_iAmmoInBag"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iAmmoInBag"), "int")
	(c).fields["m_iKills"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value(v_gameSaveData, "data"), "m_Weapons"), (c).fields.get("m_szName")), "m_iKills"), "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce(null, "String")
	(c).fields["m_bUnlocked"] = false
	(c).fields["m_iAimingPoints"] = float(NAN)
	(c).fields["m_iHandlingPoints"] = float(NAN)
	(c).fields["m_iReloadingPoints"] = float(NAN)
	(c).fields["m_iAimingLevel"] = R.coerce(0, "int")
	(c).fields["m_iHandlingLevel"] = R.coerce(0, "int")
	(c).fields["m_iReloadingLevel"] = R.coerce(0, "int")
	(c).fields["m_iDamageLevel"] = R.coerce(0, "int")
	(c).fields["m_iAccuracyLevel"] = R.coerce(0, "int")
	(c).fields["m_iCapacityLevel"] = R.coerce(0, "int")
	(c).fields["m_iAmmoInMag"] = R.coerce(0, "int")
	(c).fields["m_iAmmoInBag"] = R.coerce(0, "int")
	(c).fields["m_iKills"] = R.coerce(0, "int")
	return null
