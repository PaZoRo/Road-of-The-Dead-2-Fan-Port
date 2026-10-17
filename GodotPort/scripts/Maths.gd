extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Maths(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "Maths"), [])
	return null

static func f_QuickSort(c: Variant, a: Array) -> Variant:
	var v_pivot: Variant = null
	var v_l_hold: Variant = 0
	var v_r_hold: Variant = 0
	var v_pivotIndex: Variant = 0
	var v_array: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_left: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_right: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_CmpFunc: Variant = R.coerce((a[3] if a.size() > 3 else null), "Function")
	v_pivot = R.coerce(null, "Object")
	v_l_hold = R.coerce(0, "int")
	v_r_hold = R.coerce(0, "int")
	if R.truth(R.binary("==", R.get_value(v_array, "length"), 0)):
		pass
		return null
	v_l_hold = R.coerce(v_left, "int")
	v_r_hold = R.coerce(v_right, "int")
	v_pivot = R.coerce(R.get_value(v_array, v_left), "Object")
	while R.truth((float(v_left) < float(v_right))):
		pass
		while R.truth((R.truth(R.invoke(v_CmpFunc, [R.get_value(v_array, v_right), v_pivot])) and (float(v_left) < float(v_right)))):
			pass
			v_right = R.signed32(v_right - 1)
		if R.truth((float(v_left) != float(v_right))):
			pass
			R.set_value(v_array, v_left, R.get_value(v_array, v_right), "=")
			v_left = R.signed32(v_left + 1)
		while R.truth((R.truth(R.invoke(v_CmpFunc, [v_pivot, R.get_value(v_array, v_left)])) and (float(v_left) < float(v_right)))):
			pass
			v_left = R.signed32(v_left + 1)
		if R.truth((float(v_left) != float(v_right))):
			pass
			R.set_value(v_array, v_right, R.get_value(v_array, v_left), "=")
			v_right = R.signed32(v_right - 1)
	R.set_value(v_array, v_left, v_pivot, "=")
	v_pivotIndex = R.coerce(v_left, "int")
	v_left = R.coerce(v_l_hold, "int")
	v_right = R.coerce(v_r_hold, "int")
	if R.truth((float(v_left) < float(v_pivotIndex))):
		pass
		R.invoke(R.resolve(c, "QuickSort", "Maths"), [v_array, v_left, (float(v_pivotIndex) - float(1)), v_CmpFunc])
	if R.truth((float(v_right) > float(v_pivotIndex))):
		pass
		R.invoke(R.resolve(c, "QuickSort", "Maths"), [v_array, (float(v_pivotIndex) + float(1)), v_right, v_CmpFunc])
	return null

static func f_Lerp(c: Variant, a: Array) -> Variant:
	var v_fValueA: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fValueB: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fAlpha: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	return (float((float((float(1) - float(v_fAlpha))) * float(v_fValueA))) + float((float(v_fAlpha) * float(v_fValueB))))
	return null

static func f_InterpolateNumber(c: Variant, a: Array) -> Variant:
	var v_fActualValue: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fTargetValue: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fSpeed: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fDeltaTime: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	if R.truth((float(v_fTargetValue) > float(v_fActualValue))):
		pass
		return minf(float((float(v_fActualValue) + float((float(v_fSpeed) * float(v_fDeltaTime))))), float(v_fTargetValue))
	if R.truth((float(v_fTargetValue) < float(v_fActualValue))):
		pass
		return maxf(float((float(v_fActualValue) - float((float(v_fSpeed) * float(v_fDeltaTime))))), float(v_fTargetValue))
	return v_fTargetValue
	return null

static func f_InterpolateVector(c: Variant, a: Array) -> Variant:
	var v_fInterpDist: Variant = NAN
	var v_fDist: Variant = NAN
	var v_vActualValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vTargetValue: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_fSpeed: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fDeltaTime: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	v_fInterpDist = float(NAN)
	R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Set", [v_vTargetValue])
	R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Subtract", [v_vActualValue])
	v_fDist = R.coerce(R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "GetLength", []), "Number")
	if R.truth((float(v_fDist) > float(0))):
		pass
		v_fInterpDist = float((float(v_fSpeed) * float(v_fDeltaTime)))
		if R.truth((float(v_fInterpDist) > float(v_fDist))):
			pass
			v_fInterpDist = float(v_fDist)
		R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Normalize", [])
		R.call_member(R.static_value("Maths", "m_vInterpolateVectorDiff"), "Multiply", [v_fInterpDist])
		R.call_member(v_vActualValue, "Add", [R.static_value("Maths", "m_vInterpolateVectorDiff")])
	return null

static func f_DeltaInterpolateTo(c: Variant, a: Array) -> Variant:
	var v_fDelta: Variant = NAN
	var v_fAccel: Variant = NAN
	var v_fVel: Variant = NAN
	var v_fActualValue: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fTargetValue: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fDeltaTime: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fInterpSpeed: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	if R.truth((float(v_fDeltaTime) == float(0))):
		pass
		return v_fActualValue
	if R.truth((float(absf(float((float(v_fTargetValue) - float(v_fActualValue))))) < float(0.0001))):
		pass
		return v_fTargetValue
	v_fDelta = float((float(v_fTargetValue) - float(v_fActualValue)))
	v_fAccel = float((float(v_fInterpSpeed) * float(v_fDelta)))
	v_fVel = float((float(v_fAccel) * float(v_fDeltaTime)))
	if R.truth((float((float(v_fVel) * float(v_fVel))) > float((float(v_fDelta) * float(v_fDelta))))):
		pass
		v_fVel = float(v_fDelta)
	if R.truth((float(absf(float(v_fVel))) > float(0.0001))):
		pass
		return (float(v_fActualValue) + float(v_fVel))
	return v_fTargetValue
	return null

static func f_DegToRad(c: Variant, a: Array) -> Variant:
	var v_fDeg: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(v_fDeg) * R.num(R.get_value(R.klass("Math"), "PI"))), 180)
	return null

static func f_RadToDeg(c: Variant, a: Array) -> Variant:
	var v_fRad: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(v_fRad) * float(180)), R.get_value(R.klass("Math"), "PI"))
	return null

static func f_GetZAngleFromDir(c: Variant, a: Array) -> Variant:
	var v_fAngle: Variant = NAN
	var v_vDir: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	v_fAngle = R.coerce(R.call_static("Maths", "RadToDeg", [acos(float((v_vDir).fields.get("X")))]), "Number")
	if R.truth((float((v_vDir).fields.get("Y")) < float(0))):
		pass
		v_fAngle = float((float(360) - float(v_fAngle)))
	return v_fAngle
	return null

static func f_GetShortestAngleBetween(c: Variant, a: Array) -> Variant:
	var v_fAngleA: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fAngleB: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fAngleA = R.coerce(R.binary("%", v_fAngleA, 360), "Number")
	v_fAngleB = R.coerce(R.binary("%", v_fAngleB, 360), "Number")
	if R.truth(R.binary("<", (float(v_fAngleA) - float(v_fAngleB)), R.unary("-", 180))):
		pass
		v_fAngleA = R.coerce(R.binary("+", v_fAngleA, 360), "Number")
	else:
		pass
		if R.truth((float((float(v_fAngleA) - float(v_fAngleB))) > float(180))):
			pass
			v_fAngleA = R.coerce(R.binary("-", v_fAngleA, 360), "Number")
	return (float(v_fAngleB) - float(v_fAngleA))
	return null

static func f_RandomInt(c: Variant, a: Array) -> Variant:
	var v_iRange: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return floorf(float((float(randf()) * float(v_iRange))))
	return null

static func f_Sign(c: Variant, a: Array) -> Variant:
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return (R.unary("-", 1) if R.truth((float(v_fNumber) < float(0))) else 1)
	return null

static func f_Clamp(c: Variant, a: Array) -> Variant:
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fMin: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fMax: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	if R.truth((float(v_fNumber) < float(v_fMin))):
		pass
		return v_fMin
	if R.truth((float(v_fNumber) > float(v_fMax))):
		pass
		return v_fMax
	return v_fNumber
	return null

static func f_Round(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", R.invoke(R.get_value(R.klass("Math"), "round"), [(float(v_fNumber) * float(v_fRoundFactor))]), v_fRoundFactor)
	return null

static func f_Floor(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", floorf(float((float(v_fNumber) * float(v_fRoundFactor)))), v_fRoundFactor)
	return null

static func f_Ceil(c: Variant, a: Array) -> Variant:
	var v_fRoundFactor: Variant = NAN
	var v_fNumber: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v_fRoundPrecision: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_fRoundFactor = float(R.binary("/", 1, v_fRoundPrecision))
	return R.binary("/", ceilf(float((float(v_fNumber) * float(v_fRoundFactor)))), v_fRoundFactor)
	return null

static func f_sinh(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(pow(R.num(R.get_value(R.klass("Math"), "E")), float(v_fX))) - float(pow(R.num(R.get_value(R.klass("Math"), "E")), R.num(R.unary("-", v_fX))))), 2)
	return null

static func f_cosh(c: Variant, a: Array) -> Variant:
	var v_fX: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return R.binary("/", (float(pow(R.num(R.get_value(R.klass("Math"), "E")), float(v_fX))) + float(pow(R.num(R.get_value(R.klass("Math"), "E")), R.num(R.unary("-", v_fX))))), 2)
	return null

static func f_RayPlaneIntersection(c: Variant, a: Array) -> Variant:
	var v_fDot: Variant = NAN
	var v_fTolerance: Variant = NAN
	var v_fDist: Variant = NAN
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vPlanePos: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vPlaneNormal: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	v_fDot = R.coerce(R.call_member(v_vRayDir, "Dot", [v_vPlaneNormal]), "Number")
	v_fTolerance = float(1e-05)
	if R.truth(((float(v_fDot) < float(v_fTolerance)) and R.binary(">", v_fDot, R.unary("-", v_fTolerance)))):
		pass
		return false
	R.call_member(R.static_value("Maths", "m_vRayPlaneIntersectionDelta"), "Set", [v_vPlanePos])
	R.call_member(R.static_value("Maths", "m_vRayPlaneIntersectionDelta"), "Subtract", [v_vRayPos])
	v_fDist = float(R.binary("/", R.call_member(v_vPlaneNormal, "Dot", [R.static_value("Maths", "m_vRayPlaneIntersectionDelta")]), v_fDot))
	if R.truth(R.binary("<", v_fDist, R.unary("-", v_fTolerance))):
		pass
		return false
	(v_vOutIntersection).fields["X"] = float((float((v_vRayPos).fields.get("X")) + float((float((v_vRayDir).fields.get("X")) * float(v_fDist)))))
	(v_vOutIntersection).fields["Y"] = float((float((v_vRayPos).fields.get("Y")) + float((float((v_vRayDir).fields.get("Y")) * float(v_fDist)))))
	(v_vOutIntersection).fields["Z"] = float((float((v_vRayPos).fields.get("Z")) + float((float((v_vRayDir).fields.get("Z")) * float(v_fDist)))))
	return true
	return null

static func f_RayTriangleIntersection(c: Variant, a: Array) -> Variant:
	var v_r: Variant = NAN
	var v_a: Variant = NAN
	var v_b: Variant = NAN
	var v_uu: Variant = NAN
	var v_uv: Variant = NAN
	var v_vv: Variant = NAN
	var v_wu: Variant = NAN
	var v_wv: Variant = NAN
	var v_D: Variant = NAN
	var v_s: Variant = NAN
	var v_t: Variant = NAN
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vP1: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vP2: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vP3: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTVector3D")
	v_r = float(NAN)
	v_a = float(NAN)
	v_b = float(NAN)
	v_uu = float(NAN)
	v_uv = float(NAN)
	v_vv = float(NAN)
	v_wu = float(NAN)
	v_wv = float(NAN)
	v_D = float(NAN)
	v_s = float(NAN)
	v_t = float(NAN)
	R.call_member(R.static_value("Maths", "u"), "Set", [v_vP2])
	R.call_member(R.static_value("Maths", "u"), "Subtract", [v_vP1])
	R.call_member(R.static_value("Maths", "v"), "Set", [v_vP3])
	R.call_member(R.static_value("Maths", "v"), "Subtract", [v_vP1])
	R.call_member(R.static_value("Maths", "u"), "Cross", [R.static_value("Maths", "v"), R.static_value("Maths", "n")])
	if R.truth(R.call_member(R.static_value("Maths", "n"), "IsZero", [])):
		pass
		return false
	R.assign(c, "dir", "Maths", v_vRayDir, "=")
	R.call_member(R.static_value("Maths", "w0"), "Set", [v_vRayPos])
	R.call_member(R.static_value("Maths", "w0"), "Subtract", [v_vP1])
	v_a = R.coerce(R.unary("-", R.call_member(R.static_value("Maths", "n"), "Dot", [R.static_value("Maths", "w0")])), "Number")
	v_b = R.coerce(R.call_member(R.static_value("Maths", "n"), "Dot", [R.static_value("Maths", "dir")]), "Number")
	if R.truth((float(absf(float(v_b))) < float(1e-08))):
		pass
		if R.truth((float(v_a) == float(0))):
			pass
			return false
		return false
	v_r = float(R.binary("/", v_a, v_b))
	if R.truth((float(v_r) < float(0))):
		pass
		return false
	R.call_member(v_vOutIntersection, "Set", [R.static_value("Maths", "dir")])
	R.call_member(v_vOutIntersection, "Multiply", [v_r])
	R.call_member(v_vOutIntersection, "Add", [v_vRayPos])
	v_uu = R.coerce(R.call_member(R.static_value("Maths", "u"), "Dot", [R.static_value("Maths", "u")]), "Number")
	v_uv = R.coerce(R.call_member(R.static_value("Maths", "u"), "Dot", [R.static_value("Maths", "v")]), "Number")
	v_vv = R.coerce(R.call_member(R.static_value("Maths", "v"), "Dot", [R.static_value("Maths", "v")]), "Number")
	R.call_member(R.static_value("Maths", "w"), "Set", [v_vOutIntersection])
	R.call_member(R.static_value("Maths", "w"), "Subtract", [v_vP1])
	v_wu = R.coerce(R.call_member(R.static_value("Maths", "w"), "Dot", [R.static_value("Maths", "u")]), "Number")
	v_wv = R.coerce(R.call_member(R.static_value("Maths", "w"), "Dot", [R.static_value("Maths", "v")]), "Number")
	v_D = float((float((float(v_uv) * float(v_uv))) - float((float(v_uu) * float(v_vv)))))
	v_s = float(R.binary("/", (float((float(v_uv) * float(v_wv))) - float((float(v_vv) * float(v_wu)))), v_D))
	if R.truth(((float(v_s) < float(0)) or (float(v_s) > float(1)))):
		pass
		return false
	v_t = float(R.binary("/", (float((float(v_uv) * float(v_wu))) - float((float(v_uu) * float(v_wv)))), v_D))
	if R.truth(((float(v_t) < float(0)) or (float((float(v_s) + float(v_t))) > float(1)))):
		pass
		return false
	return true
	return null

static func f_RayQuadIntersection(c: Variant, a: Array) -> Variant:
	var v_vRayPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vRayDir: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	var v_vP1: Variant = R.coerce((a[2] if a.size() > 2 else null), "DTVector3D")
	var v_vP2: Variant = R.coerce((a[3] if a.size() > 3 else null), "DTVector3D")
	var v_vP3: Variant = R.coerce((a[4] if a.size() > 4 else null), "DTVector3D")
	var v_vP4: Variant = R.coerce((a[5] if a.size() > 5 else null), "DTVector3D")
	var v_vOutIntersection: Variant = R.coerce((a[6] if a.size() > 6 else null), "DTVector3D")
	return R.logical_or(R.invoke(R.resolve(c, "RayTriangleIntersection", "Maths"), [v_vRayPos, v_vRayDir, v_vP1, v_vP2, v_vP3, v_vOutIntersection]), func(): return R.invoke(R.resolve(c, "RayTriangleIntersection", "Maths"), [v_vRayPos, v_vRayDir, v_vP3, v_vP2, v_vP4, v_vOutIntersection]))
	return null

static func f_AbsInt(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	return (R.coerce(R.unary("-", v_value), "int") if R.truth((float(v_value) < float(0))) else v_value)
	return null

static func f_AbsNumber(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	return (R.unary("-", v_value) if R.truth((float(v_value) < float(0))) else v_value)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "EPSILON", 1e-05, "=")
	R.set_value(c, "PI_ON_180", 0.01745329252, "=")
	R.set_value(c, "TWO_PI", (float(2) * R.num(R.get_value(R.klass("Math"), "PI"))), "=")
	R.set_value(c, "BigNumber", 16777214, "=")
	R.set_value(c, "u", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "v", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "n", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "dir", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "w0", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "w", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "m_vRayPlaneIntersectionDelta", R.construct(R.klass("DTVector3D"), []), "=")
	R.set_value(c, "m_vInterpolateVectorDiff", R.construct(R.klass("DTVector3D"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
