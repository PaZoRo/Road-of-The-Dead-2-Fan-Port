extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDCamera(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDCamera"), [])
	(c).fields["m_vLocation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRotation"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vRotationPreCurve"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	R.call_member(c, "SetFOV", [60])
	(c).fields["m_fTargetOffsetY"] = float(1.4)
	(c).fields["m_fRenderScale"] = float(0.0034959)
	(c).fields["m_fAimingOffsetX"] = float(0.08)
	(c).fields["m_fAimingOffsetY"] = float(0.04)
	(c).fields["m_Shakes"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "Reset", [])
	R.call_member(c, "SetHighwayMode", [false])
	return null

static func f_InitUnprojectDirections(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_UnprojectDirections", "RDCamera", R.construct(R.klass("Array"), []), "=")
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.455), 0.417, 0.787])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.245), 0.454, 0.857])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0, 0.469, 0.883])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.25, 0.454, 0.855])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.455, 0.417, 0.787])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.489), 0.209, 0.847])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.267), 0.231, 0.936])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0, 0.24, 0.971])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.273, 0.23, 0.934])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.489, 0.209, 0.847])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.5), R.unary("-", 0.034), 0.865])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.275), R.unary("-", 0.037), 0.961])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0, R.unary("-", 0.039), 0.999])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.28, R.unary("-", 0.037), 0.959])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.5, R.unary("-", 0.034), 0.865])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.482), R.unary("-", 0.271), 0.834])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.262), R.unary("-", 0.298), 0.918])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0, R.unary("-", 0.309), 0.951])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.268, R.unary("-", 0.298), 0.916])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.482, R.unary("-", 0.271), 0.834])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.439), R.unary("-", 0.47), 0.766])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [R.unary("-", 0.237), R.unary("-", 0.508), 0.828])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0, R.unary("-", 0.523), 0.852])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.243, R.unary("-", 0.507), 0.827])])
	R.invoke(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), "push"), [R.construct(R.klass("DTVector3D"), [0.439, R.unary("-", 0.47), 0.766])])
	return null

static func f_SetHighwayMode(c: Variant, a: Array) -> Variant:
	var v_bHighway: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["m_fMaxViewDistance"] = float(150)
	(c).fields["m_fRampDistance"] = float(300)
	(c).fields["m_fRampFactor"] = float(R.binary("/", 3500, (c).fields.get("m_fRampDistance")))
	return null

static func f_SetFOV(c: Variant, a: Array) -> Variant:
	var v_fHalfAngle: Variant = NAN
	var v_fFOV: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	(c).fields["m_fFOV"] = float(v_fFOV)
	v_fHalfAngle = R.coerce(R.call_static("Maths", "DegToRad", [R.binary("/", (c).fields.get("m_fFOV"), 2)]), "Number")
	(c).fields["m_fRenderCotFOV"] = float(R.binary("/", cos(float(v_fHalfAngle)), sin(float(v_fHalfAngle))))
	(c).fields["m_fRenderDistX"] = float((float((c).fields.get("m_fRenderCotFOV")) * float(((R.static_value("BasicGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHalfWidth"))))
	(c).fields["m_fRenderDistY"] = float((float((c).fields.get("m_fRenderCotFOV")) * float(((R.static_value("BasicGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHalfHeight"))))
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	((c).fields.get("m_vLocation")).fields["X"] = float(0)
	((c).fields.get("m_vLocation")).fields["Y"] = float(0)
	((c).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_fRelativeLocationX"] = float(0)
	((c).fields.get("m_vRotation")).fields["Y"] = float(0)
	((c).fields.get("m_vRotationPreCurve")).fields["Y"] = float(0)
	(c).fields["m_fCurveRotation"] = float(0)
	(c).fields["m_fShakeTimer"] = float(0)
	(c).fields["m_fShakeDuration"] = float(0)
	(c).fields["m_fShakeFadeInDuration"] = float(0)
	(c).fields["m_fShakeFadeOutDuration"] = float(0)
	(c).fields["m_fSideScrapingOffset"] = float(0)
	(c).fields["m_fPlayerFailOffset"] = float(4)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Shakes"), "length"))):
		pass
		R.call_member(c, "ReturnShake", [R.get_value((c).fields.get("m_Shakes"), v_i)])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_Shakes"), "splice"), [0])
	return null

static func f_GetShake(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary(">", R.get_value((c).fields.get("m_ShakePool"), "length"), 0)):
		pass
		return R.binary("as", R.invoke(R.get_value((c).fields.get("m_ShakePool"), "pop"), []), R.klass("RDCameraShake"))
	return R.construct(R.klass("RDCameraShake"), [])
	return null

static func f_ReturnShake(c: Variant, a: Array) -> Variant:
	var v_shake: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDCameraShake")
	R.invoke(R.get_value((c).fields.get("m_ShakePool"), "push"), [v_shake])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fTargetRotation: Variant = NAN
	var v_fTargetSideScrapingOffset: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fTargetRotation = float(NAN)
	v_fTargetSideScrapingOffset = float(NAN)
	if R.truth((float(((c).fields.get("m_Player")).fields.get("m_iFailType")) == float(R.static_value("RDPlayer", "FailType_Explosion")))):
		pass
		(c).fields["m_fPlayerFailOffset"] = R.coerce(R.binary("+", (c).fields.get("m_fPlayerFailOffset"), (float((c).fields.get("m_fPlayerFailBackSpeed")) * float(v_fDeltaTime))), "Number")
		(c).fields["m_fPlayerFailBackSpeed"] = float(maxf(float((float((c).fields.get("m_fPlayerFailBackSpeed")) - float((float(R.static_value("RDCamera", "PlayerFailBackSpeedDeccel")) * float(v_fDeltaTime))))), float(0)))
		((c).fields.get("m_vLocation")).fields["X"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"))
		((c).fields.get("m_vLocation")).fields["Y"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float(1.6)))
		((c).fields.get("m_vLocation")).fields["Z"] = float((float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(1))) - float((c).fields.get("m_fPlayerFailOffset"))))
	else:
		pass
		if R.truth(((float(v_fDeltaTime) > float(0)) and R.unary("!", ((c).fields.get("m_Player")).fields.get("m_bInEnding")))):
			pass
			(c).fields["m_fPlayerFailBackSpeed"] = float(R.static_value("RDCamera", "PlayerFailBackSpeed"))
			((c).fields.get("m_vLocation")).fields["X"] = float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"))
			((c).fields.get("m_vLocation")).fields["Y"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float((c).fields.get("m_fTargetOffsetY"))))
			((c).fields.get("m_vLocation")).fields["Z"] = float((float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(1)))
			((c).fields.get("m_vRotation")).fields["Y"] = float(((c).fields.get("m_vRotationPreCurve")).fields.get("Y"))
			v_fTargetRotation = float((float(R.binary("/", ((c).fields.get("m_Player")).fields.get("m_fDesiredSpeedX"), ((c).fields.get("m_Player")).fields.get("m_fXMaxSpeedHandBrake"))) * float(R.static_value("RDCamera", "MaxSteerRotationAngle"))))
			((c).fields.get("m_vRotation")).fields["Y"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [((c).fields.get("m_vRotation")).fields.get("Y"), v_fTargetRotation, v_fDeltaTime, R.static_value("RDCamera", "MaxSteerRotationAngleSpeed")]), "Number")
			((c).fields.get("m_vRotation")).fields["Y"] = R.coerce(R.binary("+", ((c).fields.get("m_vRotation")).fields.get("Y"), (float(((c).fields.get("m_Player")).fields.get("m_fAimingRatioX")) * R.num((R.static_value("RDCamera", "MaxAimingRotationAngleChopper") if R.truth(((c).fields.get("m_Player")).fields.get("m_bChopperMode")) else R.static_value("RDCamera", "MaxAimingRotationAngle"))))), "Number")
			((c).fields.get("m_vRotationPreCurve")).fields["Y"] = float(((c).fields.get("m_vRotation")).fields.get("Y"))
			R.invoke(R.get_value((c).fields.get("m_RotationMatrixPreCurve"), "identity"), [])
			R.invoke(R.get_value((c).fields.get("m_RotationMatrixPreCurve"), "appendRotation"), [R.unary("-", ((c).fields.get("m_vRotation")).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
			(c).fields["m_fCurveRotation"] = float((float((R.num(R.call_static("RDWorld", "GetPerlinX", [(float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(10))])) - R.num(R.call_static("RDWorld", "GetPerlinX", [(((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])))) * float(R.static_value("RDCamera", "CurveAngle"))))
			((c).fields.get("m_vRotation")).fields["Y"] = R.coerce(R.binary("+", ((c).fields.get("m_vRotation")).fields.get("Y"), (c).fields.get("m_fCurveRotation")), "Number")
			R.invoke(R.get_value((c).fields.get("m_RotationMatrix"), "identity"), [])
			R.invoke(R.get_value((c).fields.get("m_RotationMatrix"), "appendRotation"), [R.unary("-", ((c).fields.get("m_vRotation")).fields.get("Y")), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
			v_fTargetSideScrapingOffset = float(0)
			if R.truth(((c).fields.get("m_Player")).fields.get("m_bIsSideScraping")):
				pass
				v_fTargetSideScrapingOffset = R.coerce((R.static_value("RDCamera", "SideScrapingRightOffsetX") if R.truth(((c).fields.get("m_Player")).fields.get("m_bIsSideScrapingRight")) else R.static_value("RDCamera", "SideScrapingLeftOffsetX")), "Number")
			(c).fields["m_fSideScrapingOffset"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fSideScrapingOffset"), v_fTargetSideScrapingOffset, v_fDeltaTime, R.static_value("RDCamera", "SideScrappingInterpSpeed")]), "Number")
			((c).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_vLocation")).fields.get("X"), (c).fields.get("m_fSideScrapingOffset")), "Number")
			((c).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_vLocation")).fields.get("X"), (float(((c).fields.get("m_Player")).fields.get("m_fAimingRatioX")) * float((c).fields.get("m_fAimingOffsetX")))), "Number")
			((c).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((c).fields.get("m_vLocation")).fields.get("Y"), (float(((c).fields.get("m_Player")).fields.get("m_fAimingRatioY")) * R.num(R.unary("-", (c).fields.get("m_fAimingOffsetY"))))), "Number")
	R.call_member(c, "UpdateShake", [v_fDeltaTime])
	(c).fields["m_fRelativeLocationX"] = float((float(((c).fields.get("m_vLocation")).fields.get("X")) - R.num(R.call_static("RDWorld", "GetPerlinX", [((c).fields.get("m_vLocation")).fields.get("Z")]))))
	return null

static func f_UpdateShake(c: Variant, a: Array) -> Variant:
	var v_shake: Variant = null
	var v_fShakeIntensity: Variant = NAN
	var v_fMaxCameraShakeIntensity: Variant = NAN
	var v_i: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_shake = R.coerce(null, "RDCameraShake")
	v_fShakeIntensity = float(NAN)
	v_fMaxCameraShakeIntensity = float(0)
	v_i = R.coerce(0, "*")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Shakes"), "length"))):
		pass
		v_shake = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Shakes"), v_i), R.klass("RDCameraShake")), "RDCameraShake")
		v_fShakeIntensity = float(0)
		if R.truth(R.binary("==", (v_shake).fields.get("m_fShakeDuration"), R.unary("-", 1))):
			pass
			v_fShakeIntensity = float((v_shake).fields.get("m_fShakeIntensity"))
		else:
			pass
			if R.truth((float((v_shake).fields.get("m_fShakeTimer")) < float((float((float((v_shake).fields.get("m_fShakeFadeInDuration")) + float((v_shake).fields.get("m_fShakeDuration")))) + float((v_shake).fields.get("m_fShakeFadeOutDuration")))))):
				pass
				if R.truth((float((v_shake).fields.get("m_fShakeTimer")) < float((v_shake).fields.get("m_fShakeFadeInDuration")))):
					pass
					v_fShakeIntensity = float((float(R.binary("/", (v_shake).fields.get("m_fShakeTimer"), (v_shake).fields.get("m_fShakeFadeInDuration"))) * float((v_shake).fields.get("m_fShakeIntensity"))))
				else:
					pass
					if R.truth((float((v_shake).fields.get("m_fShakeTimer")) > float((float((v_shake).fields.get("m_fShakeFadeInDuration")) + float((v_shake).fields.get("m_fShakeDuration")))))):
						pass
						v_fShakeIntensity = float((float((float(1) - float(R.binary("/", (float((float((v_shake).fields.get("m_fShakeTimer")) - float((v_shake).fields.get("m_fShakeDuration")))) - float((v_shake).fields.get("m_fShakeFadeInDuration"))), (v_shake).fields.get("m_fShakeFadeOutDuration"))))) * float((v_shake).fields.get("m_fShakeIntensity"))))
					else:
						pass
						v_fShakeIntensity = float((v_shake).fields.get("m_fShakeIntensity"))
				(v_shake).fields["m_fShakeTimer"] = R.coerce(R.binary("+", (v_shake).fields.get("m_fShakeTimer"), v_fDeltaTime), "Number")
			else:
				pass
				R.call_member(c, "ReturnShake", [v_shake])
				R.invoke(R.get_value((c).fields.get("m_Shakes"), "splice"), [v_i, 1])
				v_i = R.coerce(R.num(v_i) - 1, "*")
		if R.truth((float(v_fShakeIntensity) > float(v_fMaxCameraShakeIntensity))):
			pass
			v_fMaxCameraShakeIntensity = float(v_fShakeIntensity)
		v_i = R.coerce(R.num(v_i) + 1, "*")
	if R.truth((float(v_fMaxCameraShakeIntensity) > float(0))):
		pass
		((c).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c).fields.get("m_vLocation")).fields.get("X"), (float((float((float(randf()) * float(2))) - float(1))) * float(v_fMaxCameraShakeIntensity))), "Number")
		((c).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.binary("+", ((c).fields.get("m_vLocation")).fields.get("Y"), (float((float((float(randf()) * float(2))) - float(1))) * float(v_fMaxCameraShakeIntensity))), "Number")
	return null

static func f_AddShake(c: Variant, a: Array) -> Variant:
	var v_newShake: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_fIntensity: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v_fFadeInDuration: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fDuration: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fFadeOutDuration: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	v_newShake = R.coerce(R.call_member(c, "GetShake", []), "RDCameraShake")
	(v_newShake).fields["m_szShakeName"] = R.coerce(v_szName, "String")
	(v_newShake).fields["m_fShakeIntensity"] = float(v_fIntensity)
	(v_newShake).fields["m_fShakeDuration"] = float(v_fDuration)
	(v_newShake).fields["m_fShakeFadeInDuration"] = float(v_fFadeInDuration)
	(v_newShake).fields["m_fShakeFadeOutDuration"] = float(v_fFadeOutDuration)
	(v_newShake).fields["m_fShakeTimer"] = float(0)
	R.invoke(R.get_value((c).fields.get("m_Shakes"), "push"), [v_newShake])
	return v_newShake
	return null

static func f_StopShake(c: Variant, a: Array) -> Variant:
	var v_shake: Variant = null
	var v_i: Variant = 0
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_fFadeOutDuration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_shake = R.coerce(null, "RDCameraShake")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_Shakes"), "length"))):
		pass
		v_shake = R.coerce(R.binary("as", R.get_value((c).fields.get("m_Shakes"), v_i), R.klass("RDCameraShake")), "RDCameraShake")
		if R.truth(R.binary("==", (v_shake).fields.get("m_szShakeName"), v_szName)):
			pass
			(v_shake).fields["m_fShakeDuration"] = float(0)
			(v_shake).fields["m_fShakeFadeInDuration"] = float(0)
			(v_shake).fields["m_fShakeFadeOutDuration"] = float(v_fFadeOutDuration)
			(v_shake).fields["m_fShakeTimer"] = float(0)
		v_i = R.signed32(v_i + 1)
	return null

static func f_Project3DTo2D(c: Variant, a: Array) -> Variant:
	var v_viewport: Variant = null
	var v_fLocX: Variant = NAN
	var v_fLocY: Variant = NAN
	var v_fZDistance: Variant = NAN
	var v_fInvZ: Variant = NAN
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	var v_vOut: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector2D")
	var v_bCurvy: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v_viewport = R.coerce((R.static_value("BasicGame", "Instance")).fields.get("m_Viewport"), "Viewport")
	v_fLocX = float((v_vLocation).fields.get("X"))
	v_fLocY = float((v_vLocation).fields.get("Y"))
	v_fZDistance = float((float((v_vLocation).fields.get("Z")) - float(((c).fields.get("m_vLocation")).fields.get("Z"))))
	R.set_value((c).fields.get("m_vTransformedLocation"), "x", (float(v_fLocX) - float(((c).fields.get("m_vLocation")).fields.get("X"))), "=")
	R.set_value((c).fields.get("m_vTransformedLocation"), "y", (float((float(v_fLocY) - float(((c).fields.get("m_vLocation")).fields.get("Y")))) + float((float(R.binary("/", v_fZDistance, (c).fields.get("m_fRampDistance"))) * float((c).fields.get("m_fRampFactor"))))), "=")
	R.set_value((c).fields.get("m_vTransformedLocation"), "z", v_fZDistance, "=")
	(c).fields["m_vTransformedLocation"] = R.coerce(R.invoke(R.get_value(((c).fields.get("m_RotationMatrix") if R.truth(v_bCurvy) else (c).fields.get("m_RotationMatrixPreCurve")), "transformVector"), [(c).fields.get("m_vTransformedLocation")]), "Vector3D")
	v_fInvZ = float(R.binary("/", 1, R.get_value((c).fields.get("m_vTransformedLocation"), "z")))
	(v_vOut).fields["X"] = float((float((float((R.num(R.get_value((c).fields.get("m_vTransformedLocation"), "x")) * float((c).fields.get("m_fRenderDistX")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfWidth"))))
	(v_vOut).fields["Y"] = float((float((float((R.num(R.unary("-", R.get_value((c).fields.get("m_vTransformedLocation"), "y"))) * float((c).fields.get("m_fRenderDistY")))) * float(v_fInvZ))) + float((v_viewport).fields.get("m_iHalfHeight"))))
	return null

static func f_Unproject2DToDir3D(c: Variant, a: Array) -> Variant:
	var v_fStepX: Variant = NAN
	var v_fStepY: Variant = NAN
	var v_iX: Variant = 0
	var v_iY: Variant = 0
	var v_fRatioX: Variant = NAN
	var v_fRatioY: Variant = NAN
	var v_vTopLeft: Variant = null
	var v_vTopRight: Variant = null
	var v_vBottomLeft: Variant = null
	var v_vBottomRight: Variant = null
	var v_vLocation: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector2D")
	var v_vOut: Variant = R.coerce((a[1] if a.size() > 1 else null), "DTVector3D")
	(v_vLocation).fields["X"] = R.coerce(R.call_static("Maths", "Clamp", [(v_vLocation).fields.get("X"), 0, (float(((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(1))]), "Number")
	(v_vLocation).fields["Y"] = R.coerce(R.call_static("Maths", "Clamp", [(v_vLocation).fields.get("Y"), 0, (float(((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHeight")) - float(1))]), "Number")
	v_fStepX = float(R.binary("/", ((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iWidth"), (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))))
	v_fStepY = float(R.binary("/", ((R.static_value("RDGame", "Instance")).fields.get("m_Viewport")).fields.get("m_iHeight"), (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))))
	v_iX = R.coerce(R.call_static("Maths", "Clamp", [floorf(float(R.binary("/", (v_vLocation).fields.get("X"), v_fStepX))), 0, (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))]), "int")
	v_iY = R.coerce(R.call_static("Maths", "Clamp", [floorf(float(R.binary("/", (v_vLocation).fields.get("Y"), v_fStepY))), 0, (float(R.static_value("RDCamera", "UnprojectGridSize")) - float(1))]), "int")
	v_fRatioX = float(R.binary("/", (float((v_vLocation).fields.get("X")) - float((float(v_iX) * float(v_fStepX)))), v_fStepX))
	v_fRatioY = float(R.binary("/", (float((v_vLocation).fields.get("Y")) - float((float(v_iY) * float(v_fStepY)))), v_fStepY))
	v_vTopLeft = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float(v_iY) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float(v_iX))), "DTVector3D")
	v_vTopRight = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float(v_iY) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float((float(v_iX) + float(1))))), "DTVector3D")
	v_vBottomLeft = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float((float(v_iY) + float(1))) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float(v_iX))), "DTVector3D")
	v_vBottomRight = R.coerce(R.get_value(R.static_value("RDCamera", "m_UnprojectDirections"), (float((float((float(v_iY) + float(1))) * float(R.static_value("RDCamera", "UnprojectGridSize")))) + float((float(v_iX) + float(1))))), "DTVector3D")
	((c).fields.get("m_vTopBlend")).fields["X"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("X")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("X"))))))
	((c).fields.get("m_vTopBlend")).fields["Y"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("Y")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("Y"))))))
	((c).fields.get("m_vTopBlend")).fields["Z"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vTopLeft).fields.get("Z")))) + float((float(v_fRatioX) * float((v_vTopRight).fields.get("Z"))))))
	((c).fields.get("m_vBottomBlend")).fields["X"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("X")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("X"))))))
	((c).fields.get("m_vBottomBlend")).fields["Y"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("Y")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("Y"))))))
	((c).fields.get("m_vBottomBlend")).fields["Z"] = float((float((float((float(1) - float(v_fRatioX))) * float((v_vBottomLeft).fields.get("Z")))) + float((float(v_fRatioX) * float((v_vBottomRight).fields.get("Z"))))))
	(v_vOut).fields["X"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("X")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("X"))))))
	(v_vOut).fields["Y"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("Y")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("Y"))))))
	(v_vOut).fields["Z"] = float((float((float((float(1) - float(v_fRatioY))) * float(((c).fields.get("m_vTopBlend")).fields.get("Z")))) + float((float(v_fRatioY) * float(((c).fields.get("m_vBottomBlend")).fields.get("Z"))))))
	R.call_member(v_vOut, "Normalize", [])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_UnprojectDirections", null, "=")
	R.set_value(c, "SideScrapingLeftOffsetX", R.unary("-", 0.05), "=")
	R.set_value(c, "SideScrapingRightOffsetX", 0.05, "=")
	R.set_value(c, "SideScrappingInterpSpeed", 5, "=")
	R.set_value(c, "MaxSteerRotationAngle", (float(R.binary("/", 2, 180)) * R.num(R.get_value(R.klass("Math"), "PI"))), "=")
	R.set_value(c, "MaxSteerRotationAngleSpeed", 10, "=")
	R.set_value(c, "MaxAimingRotationAngle", (float(R.binary("/", 180, 180)) * R.num(R.get_value(R.klass("Math"), "PI"))), "=")
	R.set_value(c, "MaxAimingRotationAngleChopper", (float(R.binary("/", 180, 180)) * R.num(R.get_value(R.klass("Math"), "PI"))), "=")
	R.set_value(c, "CurveAngle", 3.5, "=")
	R.set_value(c, "NoFogDistance", 151, "=")
	R.set_value(c, "NoFogRange", 30, "=")
	R.set_value(c, "FogDistance", 20, "=")
	R.set_value(c, "FogRange", 10, "=")
	R.set_value(c, "PlayerFailBackSpeed", 0.7, "=")
	R.set_value(c, "PlayerFailBackSpeedDeccel", R.binary("/", 0.7, 10), "=")
	R.set_value(c, "UnprojectGridSize", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_vLocation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRotation"] = R.coerce(null, "DTVector3D")
	(c).fields["m_vRotationPreCurve"] = R.coerce(null, "DTVector3D")
	(c).fields["m_fCurveRotation"] = float(NAN)
	(c).fields["m_RotationMatrix"] = R.coerce(R.construct(R.klass("Matrix3D"), []), "Matrix3D")
	(c).fields["m_RotationMatrixPreCurve"] = R.coerce(R.construct(R.klass("Matrix3D"), []), "Matrix3D")
	(c).fields["m_vTransformedLocation"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_fFOV"] = float(NAN)
	(c).fields["m_fRenderCotFOV"] = float(NAN)
	(c).fields["m_fRenderDistX"] = float(NAN)
	(c).fields["m_fRenderDistY"] = float(NAN)
	(c).fields["m_fRenderScale"] = float(NAN)
	(c).fields["m_fTargetOffsetY"] = float(NAN)
	(c).fields["m_fSideScrapingOffset"] = float(NAN)
	(c).fields["m_Shakes"] = R.coerce(null, "Array")
	(c).fields["m_fShakeIntensity"] = float(NAN)
	(c).fields["m_fShakeDuration"] = float(NAN)
	(c).fields["m_fShakeFadeInDuration"] = float(NAN)
	(c).fields["m_fShakeFadeOutDuration"] = float(NAN)
	(c).fields["m_fShakeTimer"] = float(NAN)
	(c).fields["m_fPlayerFailOffset"] = float(NAN)
	(c).fields["m_fPlayerFailBackSpeed"] = float(NAN)
	(c).fields["m_fAimingOffsetX"] = float(NAN)
	(c).fields["m_fAimingOffsetY"] = float(NAN)
	(c).fields["m_fMaxViewDistance"] = float(NAN)
	(c).fields["m_fRampDistance"] = float(NAN)
	(c).fields["m_fRampFactor"] = float(NAN)
	(c).fields["m_vProj2D"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vTopBlend"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vBottomBlend"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_vProjDirTemp"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_fFogDistance"] = float(R.static_value("RDCamera", "NoFogDistance"))
	(c).fields["m_fFogRange"] = float(R.static_value("RDCamera", "NoFogRange"))
	(c).fields["m_fRelativeLocationX"] = float(0)
	(c).fields["m_ShakePool"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null
