extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDParallaxBackground(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDParallaxBackground"), [null])
	c.fields["m_iLayer"] = R.coerce(R.static_value("RDEntity", "Layer_Background"), "int")
	c.fields["m_bSelectableInEditor"] = false
	c.fields["m_bExportableInEditor"] = false
	return null

static func f_SetInitialState(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDParallaxBackground"), "SetInitialState"), [])
	(c).fields["m_bUseFog"] = false
	(c).fields["m_bHidden"] = false
	return null

static func f_Init(c: Variant, a: Array) -> Variant:
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_fDistance: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fDropRate: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	R.call_member(c, "InitMCs", [v_mcClass])
	(c).fields["m_fDistance"] = float(v_fDistance)
	(c).fields["m_fDropRate"] = float(v_fDropRate)
	return null

static func f_Project3DTo2D(c: Variant, a: Array) -> Variant:
	var v_viewport: Variant = null
	var v_fInvZ: Variant = NAN
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_camera: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDCamera")
	v_viewport = R.coerce(null, "Viewport")
	v_viewport = R.coerce((R.static_value("BasicGame", "Instance")).fields.get("m_Viewport"), "Viewport")
	R.set_value(c.fields.get("m_vTransformedLocation"), "x", (float((v_vLocation).fields.get("X")) - float(((v_camera).fields.get("m_vLocation")).fields.get("X"))), "=")
	R.set_value(c.fields.get("m_vTransformedLocation"), "y", (float((v_vLocation).fields.get("Y")) - float(((v_camera).fields.get("m_vLocation")).fields.get("Y"))), "=")
	R.set_value(c.fields.get("m_vTransformedLocation"), "z", (c).fields.get("m_fDistance"), "=")
	c.fields["m_vTransformedLocation"] = R.coerce(R.invoke(R.get_value((v_camera).fields.get("m_RotationMatrix"), "transformVector"), [c.fields.get("m_vTransformedLocation")]), "Vector3D")
	v_fInvZ = float(R.binary("/", 1, R.get_value(c.fields.get("m_vTransformedLocation"), "z")))
	(c.fields.get("m_vProjLocation")).fields["X"] = float((float((float((R.num(R.get_value(c.fields.get("m_vTransformedLocation"), "x")) * float((v_camera).fields.get("m_fRenderDistX")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfWidth"))))
	(c.fields.get("m_vProjLocation")).fields["Y"] = float((float((float((R.num(R.unary("-", R.get_value(c.fields.get("m_vTransformedLocation"), "y"))) * float((v_camera).fields.get("m_fRenderDistY")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfHeight"))))
	return c.fields.get("m_vProjLocation")
	return null

static func f_Render(c: Variant, a: Array) -> Variant:
	var v_fAlpha: Variant = NAN
	var v_vProjectedLoc: Variant = null
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	v_fAlpha = float(NAN)
	v_vProjectedLoc = R.coerce(R.call_member(c, "Project3DTo2D", [c.fields.get("m_vLocation"), v_camera]), "DTVector2D")
	R.set_value(c.fields.get("m_MC"), "x", (v_vProjectedLoc).fields.get("X"), "=")
	R.set_value(c.fields.get("m_MC"), "y", (v_vProjectedLoc).fields.get("Y"), "=")
	R.set_value(c.fields.get("m_MC"), "y", (float(((v_camera).fields.get("m_vLocation")).fields.get("Z")) * float((c).fields.get("m_fDropRate"))), "+=")
	if R.truth((c).fields.get("m_bUseFog")):
		pass
		if R.truth((c).fields.get("m_bHidden")):
			pass
			R.set_value(c.fields.get("m_MC"), "alpha", 0, "=")
		else:
			pass
			v_fAlpha = R.coerce(R.call_static("Maths", "Clamp", [R.binary("/", (float((v_camera).fields.get("m_fFogDistance")) - float(R.static_value("RDCamera", "FogDistance"))), (float((v_camera).fields.get("m_fMaxViewDistance")) - float(R.static_value("RDCamera", "FogDistance")))), 0, 1]), "Number")
			R.set_value(c.fields.get("m_MC"), "alpha", (float((float(v_fAlpha) * float(v_fAlpha))) * float(v_fAlpha)), "=")
	return null

static func f_SetHidden(c: Variant, a: Array) -> Variant:
	var v_bHidden: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_bHidden"] = v_bHidden
	if R.truth((c).fields.get("m_bHidden")):
		pass
		R.set_value(c.fields.get("m_MC"), "alpha", 0, "=")
	else:
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bUseFog"))):
			pass
			R.set_value(c.fields.get("m_MC"), "alpha", 1, "=")
	return null

static func f_IsOutOfLevel(c: Variant, a: Array) -> Variant:
	var v_camera: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCamera")
	return false
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_fDistance"] = float(NAN)
	(c).fields["m_fDropRate"] = float(NAN)
	(c).fields["m_bUseFog"] = false
	(c).fields["m_bHidden"] = false
	return null
