extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDBulletCase(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDBulletCase"), [])
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVelX"] = float((float(150) + float((float(randf()) * float(150)))))
	(c).fields["m_fVelY"] = R.coerce(R.binary("+", R.unary("-", 200), (float(randf()) * R.num(R.unary("-", 150)))), "Number")
	(c).fields["m_fVelRot"] = float((float(10) + float((float(randf()) * float(400)))))
	(c).fields["m_fLifeTime"] = float(1)
	R.invoke(R.resolve(c, "addEventListener", "RDBulletCase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame"), false, 0, true])
	return null

static func f_OnEnterFrame(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c, "Update", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVelY"] = R.coerce(R.binary("+", (c).fields.get("m_fVelY"), (float(800) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta")))), "Number")
	R.assign(c, "rotation", "RDBulletCase", (float((c).fields.get("m_fVelRot")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	R.assign(c, "x", "RDBulletCase", (float((c).fields.get("m_fVelX")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	R.assign(c, "y", "RDBulletCase", (float((c).fields.get("m_fVelY")) * float((R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta"))), "+=")
	(c).fields["m_fLifeTime"] = R.coerce(R.binary("-", (c).fields.get("m_fLifeTime"), (R.static_value("RDGame", "Instance")).fields.get("m_fFrameDelta")), "Number")
	if R.truth((float((c).fields.get("m_fLifeTime")) < float(0))):
		pass
		R.invoke(R.resolve(c, "removeEventListener", "RDBulletCase"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.get_value(c, "OnEnterFrame")])
		R.invoke(R.get_value(R.get_value(c, "parent"), "removeChild"), [c])
		R.call_static("RDGame", "ReturnMC", [c])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fVelX"] = float(NAN)
	(c).fields["m_fVelY"] = float(NAN)
	(c).fields["m_fVelRot"] = float(NAN)
	(c).fields["m_fLifeTime"] = float(NAN)
	return null
