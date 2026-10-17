extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDWeapon(c: Variant, a: Array) -> Variant:
	var v_player: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDPlayer")
	R.invoke(R.super_ref(c, "RDWeapon"), [])
	(c).fields["m_Player"] = R.coerce(v_player, "RDPlayer")
	(c).fields["m_GunMC"] = R.coerce(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "MovieClip")
	((c).fields.get("m_CenterPos")).fields["X"] = float(288.1)
	((c).fields.get("m_CenterPos")).fields["Y"] = R.coerce(R.unary("-", 52.6), "Number")
	((c).fields.get("m_CenterPos")).fields["Z"] = R.coerce(R.unary("-", 3.4953308), "Number")
	((c).fields.get("m_TopPos")).fields["X"] = float(272.65)
	((c).fields.get("m_TopPos")).fields["Y"] = R.coerce(R.unary("-", 65.7), "Number")
	((c).fields.get("m_TopPos")).fields["Z"] = float(7.4389954)
	((c).fields.get("m_BottomPos")).fields["X"] = float(367.05)
	((c).fields.get("m_BottomPos")).fields["Y"] = R.coerce(R.unary("-", 2.45), "Number")
	((c).fields.get("m_BottomPos")).fields["Z"] = R.coerce(R.unary("-", 24.621155), "Number")
	((c).fields.get("m_LeftPos")).fields["X"] = float(239.55)
	((c).fields.get("m_LeftPos")).fields["Y"] = R.coerce(R.unary("-", 91.15), "Number")
	((c).fields.get("m_LeftPos")).fields["Z"] = R.coerce(R.unary("-", 19.515137), "Number")
	((c).fields.get("m_RightPos")).fields["X"] = float(489.55)
	((c).fields.get("m_RightPos")).fields["Y"] = float(9.55)
	((c).fields.get("m_RightPos")).fields["Z"] = float(2.071106)
	((c).fields.get("m_TopLeftPos")).fields["X"] = float(208.2)
	((c).fields.get("m_TopLeftPos")).fields["Y"] = R.coerce(R.unary("-", 98.65), "Number")
	((c).fields.get("m_TopLeftPos")).fields["Z"] = R.coerce(R.unary("-", 5.432083), "Number")
	((c).fields.get("m_TopRightPos")).fields["X"] = float(380.25)
	((c).fields.get("m_TopRightPos")).fields["Y"] = R.coerce(R.unary("-", 47.85), "Number")
	((c).fields.get("m_TopRightPos")).fields["Z"] = float(20.273453)
	((c).fields.get("m_BottomLeftPos")).fields["X"] = float(261.5)
	((c).fields.get("m_BottomLeftPos")).fields["Y"] = R.coerce(R.unary("-", 72.4), "Number")
	((c).fields.get("m_BottomLeftPos")).fields["Z"] = R.coerce(R.unary("-", 31.22879), "Number")
	((c).fields.get("m_BottomRightPos")).fields["X"] = float(470.6)
	((c).fields.get("m_BottomRightPos")).fields["Y"] = float(118.85)
	((c).fields.get("m_BottomRightPos")).fields["Z"] = float(7.8168945)
	(c).fields["m_fShakeStrength"] = float(0.03)
	(c).fields["m_fShakeDuration"] = float(0.1)
	(c).fields["m_bDisplayAmmoInMag"] = true
	(c).fields["m_fAmmoDisplaySpacing"] = float(10)
	(c).fields["m_iAmmoDisplayFrame"] = R.coerce(1, "int")
	(c).fields["m_BulletCaseClass"] = R.coerce(R.klass("MC_casingdrop"), "Class")
	(c).fields["m_iBulletsShotAtOnce"] = R.coerce(1, "int")
	(c).fields["m_iNbFireAnims"] = R.coerce(1, "int")
	(c).fields["m_iDamageType"] = R.coerce(R.static_value("RDDamageType", "GenericBullet"), "int")
	return null

static func f_InitStaticVariables(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.assign(c, "m_BulletInfos", "RDWeapon", R.construct(R.klass("Array"), []), "=")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(R.static_value("RDWeapon", "NbBulletInfos")))):
		pass
		R.invoke(R.get_value(R.static_value("RDWeapon", "m_BulletInfos"), "push"), [R.construct(R.klass("RDBulletInfo"), [])])
		v_i = R.signed32(v_i + 1)
	return null

static func f_SetSaveData(c: Variant, a: Array) -> Variant:
	var v_saveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDWeaponSaveData")
	(c).fields["m_Data"] = R.coerce(v_saveData, "RDWeaponSaveData")
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fSpeed: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.call_member(c, "UpdateBulletShots", [])
	v_fSpeed = float((float((c).fields.get("m_SpreadRecoveryMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_SpreadRecoveryMax")) - float((c).fields.get("m_SpreadRecoveryMin"))))), 5))))
	(c).fields["m_fBulletSpread"] = R.coerce(R.call_static("Maths", "DeltaInterpolateTo", [(c).fields.get("m_fBulletSpread"), 0, v_fDeltaTime, v_fSpeed]), "Number")
	if R.truth(R.call_member(c, "IsReloading", [])):
		pass
		(c).fields["m_fReloadingTime"] = R.coerce(R.binary("+", (c).fields.get("m_fReloadingTime"), v_fDeltaTime), "Number")
	if R.truth((float((c).fields.get("m_fFireDelayTimer")) > float(0))):
		pass
		(c).fields["m_fFireDelayTimer"] = float(maxf(float((float((c).fields.get("m_fFireDelayTimer")) - float(v_fDeltaTime))), float(0)))
		if R.truth((((c).fields.get("m_bTimeBasedAutoFire") and (c).fields.get("m_bFiringAmmo")) and (float((c).fields.get("m_fFireDelayTimer")) == float(0)))):
			pass
			R.call_member(c, "EndFiringAmmo", [])
	return null

static func f_UpdateOverheat(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth(((float((c).fields.get("m_fOverheat")) > float(0)) and R.unary("!", (c).fields.get("m_bFiring")))):
		pass
		(c).fields["m_fOverheat"] = float(maxf(float((float((c).fields.get("m_fOverheat")) - float((float(R.static_value("RDWeapon", "OverheatDeccel")) * float(v_fDeltaTime))))), float(0)))
		if R.truth((float((c).fields.get("m_fOverheat")) == float(0))):
			pass
			(c).fields["m_bOverheated"] = false
	return null

static func f_OnEquip(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndStop"), [R.binary("+", (c).fields.get("m_szAnimName"), "_idle")])
	(c).fields["m_fBulletSpread"] = float(0)
	(c).fields["m_bEquiped"] = true
	(c).fields["m_fFireDelayTimer"] = float(0)
	return null

static func f_OnUnequip(c: Variant, a: Array) -> Variant:
	R.call_member(c, "StopFiring", [])
	(c).fields["m_bReloading"] = false
	(c).fields["m_bCancelReload"] = false
	(c).fields["m_bFiringAmmo"] = false
	(c).fields["m_bEquiped"] = false
	return null

static func f_StartFiring(c: Variant, a: Array) -> Variant:
	R.call_member(c, "FireAmmo", [])
	(c).fields["m_bFiring"] = true
	if R.truth((c).fields.get("m_bAutoFire")):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound"), true])
	return null

static func f_FireAmmo(c: Variant, a: Array) -> Variant:
	var v_projectile: Variant = null
	var v_camera: Variant = null
	var v_fSpeed: Variant = NAN
	var v_i: Variant = 0
	var v_bulletInfo: Variant = null
	var v_fMaxSpread: Variant = NAN
	v_projectile = R.coerce(null, "RDProjectile")
	v_camera = R.coerce(null, "RDCamera")
	v_fSpeed = float(NAN)
	v_i = R.coerce(0, "int")
	v_bulletInfo = R.coerce(null, "RDBulletInfo")
	(c).fields["m_bFiringAmmo"] = true
	R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", (c).fields.get("m_szAnimName"), "_fire"), R.binary("+", R.call_static("Maths", "RandomInt", [(c).fields.get("m_iNbFireAnims")]), 1))])
	if R.truth(R.unary("!", (c).fields.get("m_bAutoFire"))):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound")])
	R.call_member(((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera"), "AddShake", ["ShootShake", (c).fields.get("m_fShakeStrength"), 0, 0, (c).fields.get("m_fShakeDuration")])
	if R.truth((R.unary("!", (c).fields.get("m_bMountedWeapon")) or R.unary("!", R.call_member(c, "HasInfiniteAmmo", [])))):
		pass
		R.set_value((c).fields.get("m_Data"), "m_iAmmoInMag", 1, "-=")
	R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
	R.call_member((c).fields.get("m_Player"), "OnWeaponShot", [])
	if R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) == float(0)) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) == float(0)))):
		pass
		R.call_member((c).fields.get("m_Player"), "OnWeaponEmpty", [])
	if R.truth((c).fields.get("m_bFireProjectile")):
		pass
		v_projectile = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [(c).fields.get("m_ProjectileClass")]), R.klass("RDProjectile")), "RDProjectile")
		(v_projectile).fields["m_Instigator"] = R.coerce((c).fields.get("m_Player"), "RDEntity")
		v_camera = R.coerce((((c).fields.get("m_Player")).fields.get("m_GameModeGameplay")).fields.get("m_Camera"), "RDCamera")
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["X"] = float(((v_camera).fields.get("m_vLocation")).fields.get("X"))
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["Y"] = float(((v_camera).fields.get("m_vLocation")).fields.get("Y"))
		((v_projectile).fields.get("m_vTrajectoryStart")).fields["Z"] = float(((v_camera).fields.get("m_vLocation")).fields.get("Z"))
		((c).fields.get("m_vAimingPos")).fields["X"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingX"))
		((c).fields.get("m_vAimingPos")).fields["Y"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingY"))
		R.call_member(v_camera, "Unproject2DToDir3D", [(c).fields.get("m_vAimingPos"), (c).fields.get("m_vProjDir")])
		R.invoke(R.get_value((c).fields.get("m_mRot"), "identity"), [])
		R.invoke(R.get_value((c).fields.get("m_mRot"), "appendRotation"), [((v_camera).fields.get("m_vRotation")).fields.get("Y"), R.get_value(R.klass("Vector3D"), "Y_AXIS")])
		R.set_value((c).fields.get("m_vTempDir"), "x", ((c).fields.get("m_vProjDir")).fields.get("X"), "=")
		R.set_value((c).fields.get("m_vTempDir"), "y", ((c).fields.get("m_vProjDir")).fields.get("Y"), "=")
		R.set_value((c).fields.get("m_vTempDir"), "z", ((c).fields.get("m_vProjDir")).fields.get("Z"), "=")
		(c).fields["m_vTempDir"] = R.coerce(R.invoke(R.get_value((c).fields.get("m_mRot"), "transformVector"), [(c).fields.get("m_vTempDir")]), "Vector3D")
		((c).fields.get("m_vProjDir")).fields["X"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "x"), "Number")
		((c).fields.get("m_vProjDir")).fields["Y"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "y"), "Number")
		((c).fields.get("m_vProjDir")).fields["Z"] = R.coerce(R.get_value((c).fields.get("m_vTempDir"), "z"), "Number")
		v_fSpeed = float(R.binary("/", R.binary("/", (float((c).fields.get("m_fProjectileSpeed")) * float(1500)), 60), 60))
		((v_projectile).fields.get("m_vVelocity")).fields["X"] = float((float(((c).fields.get("m_vProjDir")).fields.get("X")) * float(v_fSpeed)))
		((v_projectile).fields.get("m_vVelocity")).fields["Y"] = float((float(((c).fields.get("m_vProjDir")).fields.get("Y")) * float(v_fSpeed)))
		((v_projectile).fields.get("m_vVelocity")).fields["Z"] = float((float(((c).fields.get("m_vProjDir")).fields.get("Z")) * float(v_fSpeed)))
		R.call_member((((c).fields.get("m_Player")).fields.get("m_World")).fields.get("m_Game"), "AddEntity", [v_projectile, (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("X"), (float((((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Y")) + float(3)), (((c).fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iRocketsShot", 1, "+=")
	else:
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float((c).fields.get("m_iBulletsShotAtOnce")))):
			pass
			v_bulletInfo = R.coerce(R.get_value(R.static_value("RDWeapon", "m_BulletInfos"), R.static_value("RDWeapon", "m_iBulletInfoIndex")), "RDBulletInfo")
			R.assign(c, "m_iBulletInfoIndex", "RDWeapon", R.binary("%", (float(R.static_value("RDWeapon", "m_iBulletInfoIndex")) + float(1)), R.static_value("RDWeapon", "NbBulletInfos")), "=")
			(v_bulletInfo).fields["m_fPosX"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingX"))
			(v_bulletInfo).fields["m_fPosY"] = float(((c).fields.get("m_Player")).fields.get("m_fAimingY"))
			(v_bulletInfo).fields["m_fSpreadAngle"] = float((float((float(randf()) * R.num(R.get_value(R.klass("Math"), "PI")))) * float(2)))
			(v_bulletInfo).fields["m_fSpreadAmplitude"] = float(R.binary("/", (float(randf()) * R.num(R.call_member(c, "GetBulletSpread", []))), 100))
			R.invoke(R.get_value((c).fields.get("m_BulletsToShoot"), "push"), [v_bulletInfo])
			v_i = R.signed32(v_i + 1)
		R.call_member(c, "UpdateBulletShots", [])
		if R.truth(R.unary("!", (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
			pass
			R.set_value(R.static_value("RDPlayerInfo", "Instance"), "m_iBulletsShot", 1, "+=")
	if R.truth((float((c).fields.get("m_iBulletsShotAtOnce")) > float(1))):
		pass
		R.call_member((c).fields.get("m_Player"), "AddHandlingInfluence", [(float(randf()) > float(0.5)), (float((c).fields.get("m_fKickBackMin")) + float((float(R.binary("/", ((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel"), 5)) * float((float((c).fields.get("m_fKickBackMax")) - float((c).fields.get("m_fKickBackMin")))))))])
	v_fMaxSpread = float((float((c).fields.get("m_MaxBulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_MaxBulletSpreadMax")) - float((c).fields.get("m_MaxBulletSpreadMin"))))), 5))))
	(c).fields["m_fBulletSpread"] = float(minf(float((float((c).fields.get("m_fBulletSpread")) + float((float((c).fields.get("m_BulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_BulletSpreadMax")) - float((c).fields.get("m_BulletSpreadMin"))))), 5)))))), float(v_fMaxSpread)))
	R.call_member(c, "AddHandlingPoints", [(c).fields.get("m_fHandlingPointsPerShot")])
	(c).fields["m_fOverheat"] = float(minf(float((float((c).fields.get("m_fOverheat")) + float((c).fields.get("m_fOverheatSpeed")))), float(1)))
	if R.truth((float((c).fields.get("m_fOverheat")) == float(1))):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [((c).fields.get("m_Player")).fields.get("m_SmokingEngineSound")])
		R.call_member(c, "StopFiring", [])
		(c).fields["m_bOverheated"] = true
	if R.truth(R.unary("!", (c).fields.get("m_bAutoFire"))):
		pass
		(c).fields["m_fFireDelayTimer"] = float((float((c).fields.get("m_fFireDelayMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float((c).fields.get("m_fFireDelayMax")) - float((c).fields.get("m_fFireDelayMin"))))), 9))))
	return null

static func f_StopFiring(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bFiring")):
		pass
		(c).fields["m_bFiring"] = false
		if R.truth((c).fields.get("m_bAutoFire")):
			pass
			R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_FireSound")])
			R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireEndSound")])
	(c).fields["m_bFiringAmmo"] = false
	return null

static func f_IsIdle(c: Variant, a: Array) -> Variant:
	return (((R.unary("!", (c).fields.get("m_bFiringAmmo")) and R.unary("!", (c).fields.get("m_bReloading"))) and (c).fields.get("m_bEquiped")) and (float((c).fields.get("m_fFireDelayTimer")) == float(0)))
	return null

static func f_EndFiringAmmo(c: Variant, a: Array) -> Variant:
	(c).fields["m_bFiringAmmo"] = false
	if R.truth((((R.unary("!", (c).fields.get("m_bFiring")) or (R.unary("!", (c).fields.get("m_bAutoFire")) and R.unary("!", (c).fields.get("m_bTimeBasedAutoFire")))) or R.unary("!", R.call_member(c, "IsIdle", []))) or R.unary("!", R.call_member(c, "HasAmmoInMag", [])))):
		pass
		R.call_member(c, "StopFiring", [])
		R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndStop"), [R.binary("+", (c).fields.get("m_szAnimName"), "_idle")])
	else:
		pass
		R.call_member(c, "FireAmmo", [])
	return null

static func f_OnAnimEvent(c: Variant, a: Array) -> Variant:
	var v_iAmmo: Variant = 0
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_iAmmo = R.coerce(0, "int")
	if R.truth(R.binary("==", v_szEvent, "WeaponEndFire")):
		pass
		R.call_member(c, "EndFiringAmmo", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "WeaponEndReload")):
			pass
			R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndStop"), [R.binary("+", (c).fields.get("m_szAnimName"), "_idle")])
			(c).fields["m_bReloading"] = false
			(c).fields["m_bCancelReload"] = false
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "WeaponReloadMag")):
				pass
				if R.truth(R.logical_or(R.binary("==", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.unary("-", 1)), func(): return R.call_member(c, "HasInfiniteAmmo", []))):
					pass
					((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAmmoInMag"), (float((c).fields.get("m_iMagSize")) - float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")))), "int")
				else:
					pass
					v_iAmmo = R.coerce(minf(float((float((c).fields.get("m_iMagSize")) - float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")))), float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"))), "int")
					((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAmmoInMag"), v_iAmmo), "int")
					((c).fields.get("m_Data")).fields["m_iAmmoInBag"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), v_iAmmo), "int")
				R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
				R.call_member(c, "AddReloadingPoints", [(c).fields.get("m_iReloadingPointsPerReload")])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "WeaponReloadOneBullet")):
					pass
					R.set_value((c).fields.get("m_Data"), "m_iAmmoInMag", 1, "+=")
					if R.truth(R.unary("!", R.call_member(c, "HasInfiniteAmmo", []))):
						pass
						R.set_value((c).fields.get("m_Data"), "m_iAmmoInBag", 1, "-=")
					R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
					R.call_member(c, "AddReloadingPoints", [(c).fields.get("m_iReloadingPointsPerReload")])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "SpawnBulletCase")):
						pass
						if R.truth(R.unary("!", (c).fields.get("m_bMountedWeapon"))):
							pass
							R.call_member(c, "SpawnBulletCase", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "ReloadSound1")):
							pass
							if R.truth((c).fields.get("m_ReloadSound1")):
								pass
								R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound1")])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "ReloadSound2")):
								pass
								if R.truth((c).fields.get("m_ReloadSound2")):
									pass
									R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound2")])
							else:
								pass
								if R.truth(R.binary("==", v_szEvent, "ReloadSound3")):
									pass
									if R.truth((c).fields.get("m_ReloadSound3")):
										pass
										R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound3")])
								else:
									pass
									if R.truth(R.binary("==", v_szEvent, "ReloadSound4")):
										pass
										if R.truth((c).fields.get("m_ReloadSound4")):
											pass
											R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound4")])
									else:
										pass
										if R.truth(R.binary("==", v_szEvent, "ReloadSound5")):
											pass
											if R.truth((c).fields.get("m_ReloadSound5")):
												pass
												R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_ReloadSound5")])
	return null

static func f_CanReload(c: Variant, a: Array) -> Variant:
	return ((((c).fields.get("m_bEquiped") and R.unary("!", (c).fields.get("m_bReloading"))) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) < float((c).fields.get("m_iMagSize")))) and (R.binary("==", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.unary("-", 1)) or (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) > float(0))))
	return null

static func f_IsWeaponEmpty(c: Variant, a: Array) -> Variant:
	return ((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) == float(0)) and (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) == float(0)))
	return null

static func f_Reload(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value((c).fields.get("m_GunMC"), "gotoAndPlay"), [R.binary("+", R.binary("+", (c).fields.get("m_szAnimName"), "_reload"), (float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) + float(1)))])
	(c).fields["m_bReloading"] = true
	(c).fields["m_bFiringAmmo"] = false
	(c).fields["m_fReloadingTime"] = float(0)
	R.call_member(c, "StopFiring", [])
	return null

static func f_CanCancelReload(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_bCanCancelReload") and (float((c).fields.get("m_fReloadingTime")) > float(0.3)))
	return null

static func f_CancelReload(c: Variant, a: Array) -> Variant:
	(c).fields["m_bCancelReload"] = true
	return null

static func f_InterruptReload(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bReloading")):
		pass
		(c).fields["m_bReloading"] = false
		R.invoke(R.get_value((c).fields.get("m_GunMC"), "stop"), [])
	return null

static func f_IsReloading(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bReloading")
	return null

static func f_GetAmmoInMag(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")
	return null

static func f_GetAmmoInBag(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")
	return null

static func f_HasAmmoInMag(c: Variant, a: Array) -> Variant:
	return (float(((c).fields.get("m_Data")).fields.get("m_iAmmoInMag")) > float(0))
	return null

static func f_ShouldReplenishAmmo(c: Variant, a: Array) -> Variant:
	var v_iMaxSize: Variant = 0
	v_iMaxSize = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", (c).fields.get("m_MaxAmmoMin"), R.unary("-", 1))) else R.coerce((float((float((c).fields.get("m_MaxAmmoMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MaxAmmoMax")) - float((c).fields.get("m_MaxAmmoMin"))))), 5)))) - float((c).fields.get("m_iMagSize"))), "int")), "int")
	if R.truth(R.binary("==", v_iMaxSize, R.unary("-", 1))):
		pass
		return false
	return (float(R.binary("/", ((c).fields.get("m_Data")).fields.get("m_iAmmoInBag"), R.num(v_iMaxSize))) < float(0.1))
	return null

static func f_ReplenishAmmo(c: Variant, a: Array) -> Variant:
	var v_iMaxSize: Variant = 0
	var v_bActive: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_fPercentage: Variant = R.coerce((a[1] if a.size() > 1 else 1), "Number")
	(c).fields["m_iMagSize"] = R.coerce((float((c).fields.get("m_MagSizeMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MagSizeMax")) - float((c).fields.get("m_MagSizeMin"))))), 5))), "int")
	if R.truth(R.unary("!", v_bActive)):
		pass
		((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce((c).fields.get("m_iMagSize"), "int")
	v_iMaxSize = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", (c).fields.get("m_MaxAmmoMin"), R.unary("-", 1))) else R.coerce((float((float((c).fields.get("m_MaxAmmoMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MaxAmmoMax")) - float((c).fields.get("m_MaxAmmoMin"))))), 5)))) - float((c).fields.get("m_iMagSize"))), "int")), "int")
	((c).fields.get("m_Data")).fields["m_iAmmoInBag"] = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", v_iMaxSize, R.unary("-", 1))) else R.coerce(minf(float((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) + float((float(v_iMaxSize) * float(v_fPercentage))))), float(v_iMaxSize)), "int")), "int")
	R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
	return null

static func f_ReplenishAmmoTo(c: Variant, a: Array) -> Variant:
	var v_iMaxSize: Variant = 0
	var v_iAmmoInBag: Variant = 0
	var v_fPercentage: Variant = R.coerce((a[0] if a.size() > 0 else 1), "Number")
	(c).fields["m_iMagSize"] = R.coerce((float((c).fields.get("m_MagSizeMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MagSizeMax")) - float((c).fields.get("m_MagSizeMin"))))), 5))), "int")
	((c).fields.get("m_Data")).fields["m_iAmmoInMag"] = R.coerce((c).fields.get("m_iMagSize"), "int")
	v_iMaxSize = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", (c).fields.get("m_MaxAmmoMin"), R.unary("-", 1))) else R.coerce((float((float((c).fields.get("m_MaxAmmoMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MaxAmmoMax")) - float((c).fields.get("m_MaxAmmoMin"))))), 5)))) - float((c).fields.get("m_iMagSize"))), "int")), "int")
	v_iAmmoInBag = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", v_iMaxSize, R.unary("-", 1))) else R.coerce((float(((c).fields.get("m_Data")).fields.get("m_iAmmoInBag")) - float((c).fields.get("m_iMagSize"))), "int")), "int")
	((c).fields.get("m_Data")).fields["m_iAmmoInBag"] = R.coerce((R.unary("-", 1) if R.truth(R.binary("==", v_iMaxSize, R.unary("-", 1))) else R.coerce(maxf(float(v_iAmmoInBag), float((float(v_iMaxSize) * float(v_fPercentage)))), "int")), "int")
	R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
	return null

static func f_InitAmmo(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMagSize"] = R.coerce((float((c).fields.get("m_MagSizeMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iCapacityLevel")) * float((float((c).fields.get("m_MagSizeMax")) - float((c).fields.get("m_MagSizeMin"))))), 5))), "int")
	R.call_member(c, "DispatchEvent", [R.static_value("RDWeapon", "Event_AmmoUpdated")])
	return null

static func f_OnNoAmmo(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_NoAmmoSound")])
	return null

static func f_SpawnBulletCase(c: Variant, a: Array) -> Variant:
	var v_newBulletCase: Variant = null
	R.set_value((c).fields.get("m_BulletCasePoint"), "x", R.get_value(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "BulletCasePos"), "x"), "=")
	R.set_value((c).fields.get("m_BulletCasePoint"), "y", R.get_value(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "BulletCasePos"), "y"), "=")
	(c).fields["m_BulletCasePoint"] = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "FiringArm"), "Guns"), "localToGlobal"), [(c).fields.get("m_BulletCasePoint")]), "Point")
	(c).fields["m_BulletCasePoint"] = R.coerce(R.invoke(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "BulletCaseContainer"), "globalToLocal"), [(c).fields.get("m_BulletCasePoint")]), "Point")
	v_newBulletCase = R.coerce(R.call_static("RDGame", "GetMC", [(c).fields.get("m_BulletCaseClass")]), "MovieClip")
	R.set_value(v_newBulletCase, "x", R.get_value((c).fields.get("m_BulletCasePoint"), "x"), "=")
	R.set_value(v_newBulletCase, "y", R.get_value((c).fields.get("m_BulletCasePoint"), "y"), "=")
	R.invoke(R.get_value(v_newBulletCase, "Init"), [])
	R.invoke(R.get_value(R.get_value(((c).fields.get("m_Player")).fields.get("m_MCCarInterior"), "BulletCaseContainer"), "addChild"), [v_newBulletCase])
	return null

static func f_TryBulletOnClinger(c: Variant, a: Array) -> Variant:
	var v_fDistZ: Variant = NAN
	var v_hits: Variant = null
	var v_bHit: Variant = false
	var v_clingerMC: Variant = null
	var v_clinger: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDHumanoid")
	var v_bulletInfo: Variant = R.coerce((a[1] if a.size() > 1 else null), "RDBulletInfo")
	var v_iDamage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	v_fDistZ = float(NAN)
	v_hits = R.coerce(null, "Array")
	v_bHit = false
	v_clingerMC = R.coerce(R.call_member((c).fields.get("m_Player"), "GetClingerMC", [v_clinger]), "MovieClip")
	if R.truth(v_clingerMC):
		pass
		v_fDistZ = float(2)
		R.set_value((c).fields.get("m_BulletShotPos"), "x", (float((v_bulletInfo).fields.get("m_fPosX")) + float((float((float(cos(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
		R.set_value((c).fields.get("m_BulletShotPos"), "y", (float((v_bulletInfo).fields.get("m_fPosY")) + float((float((float(sin(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
		v_bHit = R.coerce(R.invoke(R.get_value(v_clingerMC, "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), true]), "Boolean")
		if R.truth(v_bHit):
			pass
			v_hits = R.coerce(R.invoke(R.get_value((R.static_value("RDGame", "Instance")).fields.get("m_WorldLayer"), "getObjectsUnderPoint"), [(c).fields.get("m_BulletShotPos")]), "Array")
			if R.truth(R.unary("!", R.call_member(c, "ValidateBulletTest", [v_clingerMC, v_hits]))):
				pass
				v_bHit = false
			if R.truth(v_bHit):
				pass
				R.call_member((c).fields.get("m_Player"), "OnBulletHitClinger", [v_iDamage, (c).fields.get("m_BulletShotPos"), v_clinger])
	return v_bHit
	return null

static func f_ValidateBulletTest(c: Variant, a: Array) -> Variant:
	var v_hit: Variant = null
	var v_parent: Variant = null
	var v_iCount: Variant = 0
	var v_i: Variant = 0
	var v_clingerMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_hits: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	v_hit = R.coerce(null, "DisplayObject")
	v_parent = R.coerce(null, "DisplayObject")
	v_iCount = R.coerce(R.coerce(R.get_value(v_hits, "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_iCount))):
		pass
		v_hit = R.coerce(R.binary("as", R.get_value(v_hits, v_i), R.resolve(c, "DisplayObject", "RDWeapon")), "DisplayObject")
		v_parent = R.coerce(R.get_value(v_hit, "parent"), "DisplayObject")
		while R.truth(v_parent):
			pass
			if R.truth(R.binary("==", v_parent, v_clingerMC)):
				pass
				return true
			v_parent = R.coerce(R.get_value(v_parent, "parent"), "DisplayObject")
		v_i = R.signed32(v_i + 1)
	return false
	return null

static func f_UpdateBulletShots(c: Variant, a: Array) -> Variant:
	var v_iDamage: Variant = 0
	var v_iBulletsShot: Variant = 0
	var v_bulletInfo: Variant = null
	var v_bHit: Variant = false
	var v_pos: Variant = null
	var v_hitEffect: Variant = null
	var v_fScale: Variant = NAN
	var v_fDistZ: Variant = NAN
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_secondaryBulletHitMC: Variant = null
	var v_bSuppress: Variant = false
	v_iDamage = R.coerce(0, "int")
	v_iBulletsShot = R.coerce(0, "int")
	v_bulletInfo = R.coerce(null, "RDBulletInfo")
	v_bHit = false
	v_pos = R.coerce(null, "Point")
	v_hitEffect = R.coerce(null, "MovieClip")
	v_fScale = float(NAN)
	v_fDistZ = float(NAN)
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	v_secondaryBulletHitMC = R.coerce(null, "MovieClip")
	v_bSuppress = false
	if R.truth((float((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick")) != float((c).fields.get("m_iLastUpdateBulletShotTick")))):
		pass
		v_iDamage = R.coerce((float((c).fields.get("m_DamageMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iDamageLevel")) * float((float((c).fields.get("m_DamageMax")) - float((c).fields.get("m_DamageMin"))))), 5))), "int")
		v_iBulletsShot = R.coerce(0, "int")
		while R.truth((R.binary(">", R.get_value((c).fields.get("m_BulletsToShoot"), "length"), 0) and (float(v_iBulletsShot) < float(2)))):
			pass
			v_bulletInfo = R.coerce(R.binary("as", R.get_value((c).fields.get("m_BulletsToShoot"), 0), R.klass("RDBulletInfo")), "RDBulletInfo")
			if R.truth(R.unary("!", (c).fields.get("m_bMountedWeapon"))):
				pass
				v_fDistZ = float(1)
				R.set_value((c).fields.get("m_BulletShotPos"), "x", (float((v_bulletInfo).fields.get("m_fPosX")) + float((float((float(cos(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
				R.set_value((c).fields.get("m_BulletShotPos"), "y", (float((v_bulletInfo).fields.get("m_fPosY")) + float((float((float(sin(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
				v_bHit = R.coerce(R.invoke(R.get_value(R.call_member((c).fields.get("m_Player"), "GetInteriorBulletCollisionMC", []), "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), true]), "Boolean")
				if R.truth(v_bHit):
					pass
					R.call_member((c).fields.get("m_Player"), "OnBulletHitInterior", [(c).fields.get("m_BulletShotPos")])
				if R.truth((R.unary("!", v_bHit) and R.truth(((c).fields.get("m_Player")).fields.get("m_ClingerSideLeft")))):
					pass
					v_bHit = R.coerce(R.call_member(c, "TryBulletOnClinger", [((c).fields.get("m_Player")).fields.get("m_ClingerSideLeft"), v_bulletInfo, v_iDamage]), "Boolean")
				if R.truth((R.unary("!", v_bHit) and R.truth(((c).fields.get("m_Player")).fields.get("m_ClingerSideRight")))):
					pass
					v_bHit = R.coerce(R.call_member(c, "TryBulletOnClinger", [((c).fields.get("m_Player")).fields.get("m_ClingerSideRight"), v_bulletInfo, v_iDamage]), "Boolean")
				if R.truth((R.unary("!", v_bHit) and R.truth(((c).fields.get("m_Player")).fields.get("m_ClingerLeft")))):
					pass
					v_bHit = R.coerce(R.call_member(c, "TryBulletOnClinger", [((c).fields.get("m_Player")).fields.get("m_ClingerLeft"), v_bulletInfo, v_iDamage]), "Boolean")
				if R.truth((R.unary("!", v_bHit) and R.truth(((c).fields.get("m_Player")).fields.get("m_ClingerRight")))):
					pass
					v_bHit = R.coerce(R.call_member(c, "TryBulletOnClinger", [((c).fields.get("m_Player")).fields.get("m_ClingerRight"), v_bulletInfo, v_iDamage]), "Boolean")
			if R.truth(R.unary("!", v_bHit)):
				pass
				v_entityNode = R.coerce((((c).fields.get("m_Player")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
				while R.truth(v_entityNode):
					pass
					v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
					if R.truth(R.logical_and((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) >= float(((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))), func(): return R.call_member(v_entity, "CanBeHitByBullet", []))):
						pass
						v_fDistZ = float((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) - float(((((R.static_value("RDGame", "Instance")).fields.get("m_CurrentGameMode")).fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))))
						if R.truth((float(v_fDistZ) > float(R.static_value("RDWeapon", "MaxBulletDistance")))):
							pass
							v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
							continue
						if R.truth(R.call_member(v_entity, "GetSuppressZoneMC", [])):
							pass
							v_bSuppress = R.coerce(R.invoke(R.get_value(R.call_member(v_entity, "GetSuppressZoneMC", []), "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), false]), "Boolean")
							if R.truth(v_bSuppress):
								pass
								R.call_member(v_entity, "Suppress", [(v_entity).fields.get("m_vLocation")])
						R.set_value((c).fields.get("m_BulletShotPos"), "x", (float((v_bulletInfo).fields.get("m_fPosX")) + float((float((float(cos(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
						R.set_value((c).fields.get("m_BulletShotPos"), "y", (float((v_bulletInfo).fields.get("m_fPosY")) + float((float((float(sin(float((v_bulletInfo).fields.get("m_fSpreadAngle")))) * float(v_fDistZ))) * float((v_bulletInfo).fields.get("m_fSpreadAmplitude"))))), "=")
						v_bHit = R.coerce(R.invoke(R.get_value(R.call_member(v_entity, "GetBulletHitMC", []), "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), true]), "Boolean")
						if R.truth(v_bHit):
							pass
							R.call_member(v_entity, "OnBulletHit", [v_iDamage, (c).fields.get("m_iDamageType"), (c).fields.get("m_BulletShotPos")])
							break
						v_secondaryBulletHitMC = R.coerce(R.call_member(v_entity, "GetSecondaryBulletHitMC", []), "MovieClip")
						if R.truth(v_secondaryBulletHitMC):
							pass
							v_bHit = R.coerce(R.invoke(R.get_value(v_secondaryBulletHitMC, "hitTestPoint"), [R.get_value((c).fields.get("m_BulletShotPos"), "x"), R.get_value((c).fields.get("m_BulletShotPos"), "y"), true]), "Boolean")
							if R.truth(v_bHit):
								pass
								R.call_member(v_entity, "OnBulletHit", [v_iDamage, (c).fields.get("m_iDamageType"), (c).fields.get("m_BulletShotPos")])
								break
					v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
			if R.truth(R.unary("!", v_bHit)):
				pass
				R.call_member((((c).fields.get("m_Player")).fields.get("m_GameModeGameplay")).fields.get("m_Road"), "TestBulletHit", [v_bulletInfo, c])
			R.invoke(R.get_value((c).fields.get("m_BulletsToShoot"), "splice"), [0, 1])
			v_iBulletsShot = R.signed32(v_iBulletsShot + 1)
		(c).fields["m_iLastUpdateBulletShotTick"] = R.coerce((R.static_value("RDGame", "Instance")).fields.get("m_iGameTick"), "int")
	return null

static func f_GetAimingSpeed(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_AimingSpeedMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) * float((float((c).fields.get("m_AimingSpeedMax")) - float((c).fields.get("m_AimingSpeedMin"))))), 9)))
	return null

static func f_GetBulletSpread(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iBulletsShotAtOnce")) > float(1))):
		pass
		return minf(float((float((c).fields.get("m_BaseBulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_BaseBulletSpreadMax")) - float((c).fields.get("m_BaseBulletSpreadMin"))))), 5)))), float(R.static_value("RDWeapon", "MaxBulletSpread")))
	return minf(float((float((float((c).fields.get("m_BaseBulletSpreadMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iAccuracyLevel")) * float((float((c).fields.get("m_BaseBulletSpreadMax")) - float((c).fields.get("m_BaseBulletSpreadMin"))))), 5)))) + float((c).fields.get("m_fBulletSpread")))), float(R.static_value("RDWeapon", "MaxBulletSpread")))
	return null

static func f_GetBulletSpreadAngle(c: Variant, a: Array) -> Variant:
	return (float(R.binary("/", R.call_member(c, "GetBulletSpread", []), 100)) * float(R.static_value("RDWeapon", "BulletSpreadAngleRatio")))
	return null

static func f_GetHandlingInfluence(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_HandlingInfluenceMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float((c).fields.get("m_HandlingInfluenceMax")) - float((c).fields.get("m_HandlingInfluenceMin"))))), 9)))
	return null

static func f_GetHandlingInfluenceRecoverySpeed(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_HandlinginfluenceRecoverySpeedMin")) + float(R.binary("/", (float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) * float((float((c).fields.get("m_HandlinginfluenceRecoverySpeedMax")) - float((c).fields.get("m_HandlinginfluenceRecoverySpeedMin"))))), 9)))
	return null

static func f_AddAimingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iAimingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iAimingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "AimingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iAimingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iAimingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iAimingLevel", 1, "+=")
			((c).fields.get("m_Data")).fields["m_iAimingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iAimingPoints"), v_iLevelPoints), "Number")
			R.call_member((c).fields.get("m_Player"), "OnAimingLevelUp", [])
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iAimingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "AimingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iAimingLevel")), "int"), "int")
	return null

static func f_AddHandlingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iHandlingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iHandlingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "HandlingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iHandlingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iHandlingLevel", 1, "+=")
			R.call_member((c).fields.get("m_Player"), "OnHandlingLevelUp", [])
			((c).fields.get("m_Data")).fields["m_iHandlingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iHandlingPoints"), v_iLevelPoints), "Number")
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "HandlingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iHandlingLevel")), "int"), "int")
	return null

static func f_AddReloadingPoints(c: Variant, a: Array) -> Variant:
	var v_iLevelPoints: Variant = 0
	var v_iPoint: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iLevelPoints = R.coerce(0, "int")
	if R.truth(((c).fields.get("m_bMountedWeapon") or (R.static_value("RDGame", "Instance")).fields.get("m_bPlayFromEditor"))):
		pass
		return null
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(0))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, 10), "Number")
	else:
		pass
		if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(1))):
			pass
			v_iPoint = R.coerce(R.binary("*", v_iPoint, 5), "Number")
		else:
			pass
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) == float(2))):
				pass
				v_iPoint = R.coerce(R.binary("*", v_iPoint, 2), "Number")
	if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
		pass
		v_iPoint = R.coerce(R.binary("*", v_iPoint, R.get_value(R.static_value("RDPlayer", "LevelUpMultipliers"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLevelUpLevel"))), "Number")
		((c).fields.get("m_Data")).fields["m_iReloadingPoints"] = R.coerce(R.binary("+", ((c).fields.get("m_Data")).fields.get("m_iReloadingPoints"), v_iPoint), "Number")
		v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "ReloadingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")), "int"), "int")
		while R.truth(((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel"))) and (float(((c).fields.get("m_Data")).fields.get("m_iReloadingPoints")) >= float(v_iLevelPoints)))):
			pass
			R.set_value((c).fields.get("m_Data"), "m_iReloadingLevel", 1, "+=")
			R.call_member((c).fields.get("m_Player"), "OnReloadingLevelUp", [])
			((c).fields.get("m_Data")).fields["m_iReloadingPoints"] = R.coerce(R.binary("-", ((c).fields.get("m_Data")).fields.get("m_iReloadingPoints"), v_iLevelPoints), "Number")
			if R.truth((float(((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")) < float(R.static_value("RDPlayer", "MaxOrganicLevel")))):
				pass
				v_iLevelPoints = R.coerce(R.coerce(R.get_value(R.static_value("RDWeapon", "ReloadingLevelPoints"), ((c).fields.get("m_Data")).fields.get("m_iReloadingLevel")), "int"), "int")
	return null

static func f_StartFireSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireSound"), (c).fields.get("m_bAutoFire")])
	return null

static func f_StopFireSound(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Player"), "StopSoundOnActor", [(c).fields.get("m_FireSound")])
	if R.truth((c).fields.get("m_bAutoFire")):
		pass
		R.call_member((c).fields.get("m_Player"), "PlaySoundOnActor", [(c).fields.get("m_FireEndSound")])
	return null

static func f_HasInfiniteAmmo(c: Variant, a: Array) -> Variant:
	if R.truth(((c).fields.get("m_Player")).fields.get("m_GameModeGameplay")):
		pass
		if R.truth((c).fields.get("m_bMountedWeapon")):
			pass
			return R.call_member(((c).fields.get("m_Player")).fields.get("m_GameModeGameplay"), "InfiniteMountedWeaponEnabled", [])
		return R.call_member(((c).fields.get("m_Player")).fields.get("m_GameModeGameplay"), "InfiniteAmmoEnabled", [])
	return false
	return null

static func f_FixWeaponStats(c: Variant, a: Array) -> Variant:
	(c).fields["m_AimingSpeedMin"] = R.coerce(R.binary("+", (c).fields.get("m_AimingSpeedMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_AimingSpeedMax")) - float((c).fields.get("m_AimingSpeedMin"))))), 10)), "Number")
	(c).fields["m_BaseBulletSpreadMin"] = R.coerce(R.binary("+", (c).fields.get("m_BaseBulletSpreadMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_BaseBulletSpreadMax")) - float((c).fields.get("m_BaseBulletSpreadMin"))))), 5)), "Number")
	(c).fields["m_BulletSpreadMin"] = R.coerce(R.binary("+", (c).fields.get("m_BulletSpreadMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_BulletSpreadMax")) - float((c).fields.get("m_BulletSpreadMin"))))), 5)), "Number")
	(c).fields["m_MaxBulletSpreadMin"] = R.coerce(R.binary("+", (c).fields.get("m_MaxBulletSpreadMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_MaxBulletSpreadMax")) - float((c).fields.get("m_MaxBulletSpreadMin"))))), 5)), "Number")
	(c).fields["m_SpreadRecoveryMin"] = R.coerce(R.binary("+", (c).fields.get("m_SpreadRecoveryMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_SpreadRecoveryMax")) - float((c).fields.get("m_SpreadRecoveryMin"))))), 5)), "Number")
	(c).fields["m_HandlingInfluenceMin"] = R.coerce(R.binary("+", (c).fields.get("m_HandlingInfluenceMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_HandlingInfluenceMax")) - float((c).fields.get("m_HandlingInfluenceMin"))))), 10)), "Number")
	(c).fields["m_HandlinginfluenceRecoverySpeedMin"] = R.coerce(R.binary("+", (c).fields.get("m_HandlinginfluenceRecoverySpeedMin"), R.binary("/", (float(2) * float((float((c).fields.get("m_HandlinginfluenceRecoverySpeedMax")) - float((c).fields.get("m_HandlinginfluenceRecoverySpeedMin"))))), 10)), "Number")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_BulletInfos", null, "=")
	R.set_value(c, "Event_AmmoUpdated", "Event_AmmoUpdated", "=")
	R.set_value(c, "AimingLevelPoints", R.construct(R.klass("Array"), [500, 1000, 2000, 3100, 4200, 5300, 6400, 7500, 8600, 9700]), "=")
	R.set_value(c, "HandlingLevelPoints", R.construct(R.klass("Array"), [500, 1000, 2000, 3100, 4200, 5300, 6400, 7500, 8600, 9700]), "=")
	R.set_value(c, "ReloadingLevelPoints", R.construct(R.klass("Array"), [500, 1000, 2000, 3100, 4200, 5300, 6400, 7500, 8600, 9700]), "=")
	R.set_value(c, "MaxBulletDistance", 150, "=")
	R.set_value(c, "OverheatDeccel", 0.3, "=")
	R.set_value(c, "MaxBulletSpread", 400, "=")
	R.set_value(c, "BulletSpreadAngleRatio", 10, "=")
	R.set_value(c, "m_iBulletInfoIndex", 0, "=")
	R.set_value(c, "NbBulletInfos", 20, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_GunMC"] = R.coerce(null, "MovieClip")
	(c).fields["m_szWeaponName"] = R.coerce(null, "String")
	(c).fields["m_szAnimName"] = R.coerce(null, "String")
	(c).fields["m_iMagSize"] = R.coerce(0, "int")
	(c).fields["m_bAutoFire"] = false
	(c).fields["m_bTimeBasedAutoFire"] = false
	(c).fields["m_fFireRate"] = float(NAN)
	(c).fields["m_bCanCancelReload"] = false
	(c).fields["m_FireSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_FireEndSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ReloadSound1"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ReloadSound2"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ReloadSound3"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ReloadSound4"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ReloadSound5"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_NoAmmoSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_CenterPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_TopPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_BottomPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_LeftPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_RightPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_TopLeftPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_TopRightPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_BottomLeftPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_BottomRightPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_fShakeStrength"] = float(NAN)
	(c).fields["m_fShakeDuration"] = float(NAN)
	(c).fields["m_bDisplayAmmoInMag"] = false
	(c).fields["m_fAmmoDisplaySpacing"] = float(NAN)
	(c).fields["m_iAmmoDisplayFrame"] = R.coerce(0, "int")
	(c).fields["m_bDisplayMagAsBag"] = false
	(c).fields["m_AimingSpeedMin"] = float(NAN)
	(c).fields["m_BaseBulletSpreadMin"] = float(NAN)
	(c).fields["m_BulletSpreadMin"] = float(NAN)
	(c).fields["m_HandlingInfluenceMin"] = float(NAN)
	(c).fields["m_HandlinginfluenceRecoverySpeedMin"] = float(NAN)
	(c).fields["m_DamageMin"] = float(NAN)
	(c).fields["m_MaxAmmoMin"] = float(NAN)
	(c).fields["m_MagSizeMin"] = float(NAN)
	(c).fields["m_SpreadRecoveryMin"] = float(NAN)
	(c).fields["m_MaxBulletSpreadMin"] = float(NAN)
	(c).fields["m_fKickBackMin"] = float(NAN)
	(c).fields["m_fFireDelayMin"] = float(NAN)
	(c).fields["m_AimingSpeedMax"] = float(NAN)
	(c).fields["m_BaseBulletSpreadMax"] = float(NAN)
	(c).fields["m_BulletSpreadMax"] = float(NAN)
	(c).fields["m_HandlingInfluenceMax"] = float(NAN)
	(c).fields["m_HandlinginfluenceRecoverySpeedMax"] = float(NAN)
	(c).fields["m_DamageMax"] = float(NAN)
	(c).fields["m_MaxAmmoMax"] = float(NAN)
	(c).fields["m_MagSizeMax"] = float(NAN)
	(c).fields["m_SpreadRecoveryMax"] = float(NAN)
	(c).fields["m_MaxBulletSpreadMax"] = float(NAN)
	(c).fields["m_fKickBackMax"] = float(NAN)
	(c).fields["m_fFireDelayMax"] = float(NAN)
	(c).fields["m_iDamageType"] = R.coerce(0, "int")
	(c).fields["m_fHandlingPointsPerShot"] = float(NAN)
	(c).fields["m_iAimingPointsPerHit"] = R.coerce(0, "int")
	(c).fields["m_iReloadingPointsPerReload"] = R.coerce(0, "int")
	(c).fields["m_bMountedWeapon"] = false
	(c).fields["m_bFireProjectile"] = false
	(c).fields["m_ProjectileClass"] = R.coerce(null, "Class")
	(c).fields["m_ProjectileSound"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_fProjectileSpeed"] = float(150)
	(c).fields["m_BulletCaseClass"] = R.coerce(null, "Class")
	(c).fields["m_iBulletsShotAtOnce"] = R.coerce(0, "int")
	(c).fields["m_iNbFireAnims"] = R.coerce(0, "int")
	(c).fields["m_bFiring"] = false
	(c).fields["m_bReloading"] = false
	(c).fields["m_bCancelReload"] = false
	(c).fields["m_bFiringAmmo"] = false
	(c).fields["m_BulletsToShoot"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	(c).fields["m_BulletShotPos"] = R.coerce(R.construct(R.klass("Point"), []), "Point")
	(c).fields["m_RoadBulletPos"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_iLastUpdateBulletShotTick"] = R.coerce(R.unary("-", 999), "int")
	(c).fields["m_Data"] = R.coerce(null, "RDWeaponSaveData")
	(c).fields["m_fBulletSpread"] = float(NAN)
	(c).fields["m_bEquiped"] = false
	(c).fields["m_fReloadingTime"] = float(NAN)
	(c).fields["m_fOverheatSpeed"] = float(0)
	(c).fields["m_fOverheat"] = float(0)
	(c).fields["m_bOverheated"] = false
	(c).fields["m_fFireDelayTimer"] = float(NAN)
	(c).fields["m_vAimingPos"] = R.coerce(R.construct(R.klass("DTVector2D"), []), "DTVector2D")
	(c).fields["m_vProjDir"] = R.coerce(R.construct(R.klass("DTVector3D"), []), "DTVector3D")
	(c).fields["m_mRot"] = R.coerce(R.construct(R.klass("Matrix3D"), []), "Matrix3D")
	(c).fields["m_vAxis"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_vTempDir"] = R.coerce(R.construct(R.klass("Vector3D"), []), "Vector3D")
	(c).fields["m_BulletCasePoint"] = R.coerce(R.construct(R.klass("Point"), []), "Point")
	return null
