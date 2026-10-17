extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeChopperRescueSandbox(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeChopperRescueSandbox"), [v_theGame])
	c.fields["m_iStationarySoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iAlignSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iSpikeSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iHiddenSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iBombSoldierLevel"] = R.coerce(0, "int")
	c.fields["m_iHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iVeryHardZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iFeedersLevel"] = R.coerce(0, "int")
	c.fields["m_iSpikesLevel"] = R.coerce(0, "int")
	c.fields["m_iNewMaleZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iNewFemaleZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iSoldierZombieLevel"] = R.coerce(0, "int")
	c.fields["m_iExplodingCarLevel"] = R.coerce(0, "int")
	c.fields["m_iMineLevel"] = R.coerce(0, "int")
	c.fields["m_iFuelTruckLevel"] = R.coerce(0, "int")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
