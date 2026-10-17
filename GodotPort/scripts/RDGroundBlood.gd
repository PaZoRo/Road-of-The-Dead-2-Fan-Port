extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGroundBlood(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDGroundBlood"), [null, R.static_value("RDEntity", "Layer_Dynamic"), 1.5])
	R.call_member(c, "SetRandomMC", [])
	c.fields["m_fFadeDistance"] = float(30)
	c.fields["m_fFadeRange"] = float(20)
	c.fields["m_fMinRenderScale"] = float(0.01)
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGroundBlood"), "SetInitialState"), [])
	R.call_member(c, "SetRandomMC", [])
	return null

static func f_SetRandomMC(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = null
	var v_iRandomClass: Variant = 0
	v_mcClass = R.coerce(null, "Class")
	v_iRandomClass = R.coerce(R.call_static("Maths", "RandomInt", [6]), "int")
	if R.truth((float(v_iRandomClass) == float(0))):
		pass
		v_mcClass = R.coerce(R.klass("MC_GroundBlood1"), "Class")
	else:
		pass
		if R.truth((float(v_iRandomClass) == float(1))):
			pass
			v_mcClass = R.coerce(R.klass("MC_GroundBlood2"), "Class")
		else:
			pass
			if R.truth((float(v_iRandomClass) == float(2))):
				pass
				v_mcClass = R.coerce(R.klass("MC_GroundBlood3"), "Class")
			else:
				pass
				if R.truth((float(v_iRandomClass) == float(3))):
					pass
					v_mcClass = R.coerce(R.klass("MC_GroundBlood4"), "Class")
				else:
					pass
					if R.truth((float(v_iRandomClass) == float(4))):
						pass
						v_mcClass = R.coerce(R.klass("MC_GroundBlood5"), "Class")
					else:
						pass
						if R.truth((float(v_iRandomClass) == float(5))):
							pass
							v_mcClass = R.coerce(R.klass("MC_GroundBlood6"), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
