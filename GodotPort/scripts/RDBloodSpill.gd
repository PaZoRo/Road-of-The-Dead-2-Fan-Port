extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBloodSpill(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = null
	R.invoke(R.super_ref(c, "RDBloodSpill"), [null, R.static_value("RDEntity", "Layer_Dynamic")])
	v_mcClass = R.coerce(R.binary("as", R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "GetRandomValue", []), R.resolve(c, "Class", "RDBloodSpill")), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	c.fields["m_iCollisionGroup"] = R.coerce(R.static_value("RDEntity", "CollisionGroup_None"), "int")
	c.fields["m_fFadeDistance"] = float(100)
	c.fields["m_fFadeRange"] = float(10)
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	R.assign(c, "MCClasses", "RDBloodSpill", R.construct(R.klass("RandomHat"), []), "=")
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill4")])
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill5")])
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill6")])
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill7")])
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill8")])
	R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "AddValue", [R.klass("MC_roadkill9")])
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = null
	R.invoke(R.get_value(R.super_ref(c, "RDBloodSpill"), "SetInitialState"), [])
	v_mcClass = R.coerce(R.binary("as", R.call_member(R.static_value("RDBloodSpill", "MCClasses"), "GetRandomValue", []), R.resolve(c, "Class", "RDBloodSpill")), "Class")
	R.call_member(c, "InitMCs", [v_mcClass])
	(c).fields["m_bTriggered"] = false
	return null

static func f_CanCollideWith(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	return (R.unary("!", (c).fields.get("m_bTriggered")) and (float((v_entity).fields.get("m_iCollisionGroup")) == float(R.static_value("RDEntity", "CollisionGroup_Player"))))
	return null

static func f_TouchedBy(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDBloodSpill"), "TouchedBy"), [v_entity])
	(c).fields["m_bTriggered"] = true
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "MCClasses", null, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_bTriggered"] = false
	return null
