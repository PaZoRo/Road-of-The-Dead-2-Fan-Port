extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameMode(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameMode"), [])
	(c).fields["m_Game"] = R.coerce(v_theGame, "RDGame")
	(c).fields["m_fVehicleDamageMultiplier"] = float(1)
	(c).fields["m_fBodyDamageMultiplier"] = float(1)
	(c).fields["m_bHasHud"] = true
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bDoStartGameMode")):
		pass
		R.call_member(c, "StartGameMode", [])
		(c).fields["m_bDoStartGameMode"] = false
	R.call_member(c, "Reset", [])
	R.call_member(((c).fields.get("m_Game")).fields.get("m_FocusManager"), "setFocus", [null])
	R.call_member((c).fields.get("m_Game"), "DoFlash", [1, 0.5])
	R.call_member((c).fields.get("m_Game"), "ApplyOptions", [])
	return null

static func f_EndGameMode(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	pass
	return null

static func f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	pass
	return null

static func f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	pass
	return null

static func f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	pass
	return null

static func f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	pass
	return null

static func f_OnMouseWheel(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	pass
	return null

static func f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	pass
	return null

static func f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	pass
	return null

static func f_Restart(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_GoToMainMenu(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
	return null

static func f_ToggleQuality(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "ToggleQuality", [])
	return null

static func f_OnNewAchievementCompleted(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnRampReached(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnZombieKilled(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnZombieShotDown(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnZombieShotByHelicopter(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnZombieShotOffHood(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnZombieArmShot(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	pass
	return null

static func f_OnZombieGotOff(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	pass
	return null

static func f_OnZombieExploded(c: Variant, a: Array) -> Variant:
	var v_zombie: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDZombie")
	pass
	return null

static func f_OnSoldierKilled(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnSoldierShotDown(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iHitType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnSoldierShotOffHood(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_iClingerState: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	pass
	return null

static func f_OnSoldierGotOff(c: Variant, a: Array) -> Variant:
	var v_soldier: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDSoldier")
	var v_bFromSideCollision: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	pass
	return null

static func f_OnCivilianHit(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnCivilianShot(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnCivilianExploded(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnHelicopterDefeated(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnJetBombDodged(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnFeedersHit(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_HasNextLevel(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return ""
	return null

static func f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return 0
	return null

static func f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return ""
	return null

static func f_HasActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_GetSavedLevel(c: Variant, a: Array) -> Variant:
	return 0
	return null

static func f_IsInCinematic(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_EndCinematic(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnLostFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_OnEntityAdded(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	pass
	return null

static func f_OnPause(c: Variant, a: Array) -> Variant:
	var v_bPause: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_bForAbort: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	pass
	return null

static func f_CanPause(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_GetUnlimitedSpawning(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_CanCallChopperSupport(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_CallChopperSupport(c: Variant, a: Array) -> Variant:
	var v_bCallRadio: Variant = R.coerce((a[0] if a.size() > 0 else true), "Boolean")
	pass
	return null

static func f_CanShowHud(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_IsChopperMode(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_SuppressSoldiers(c: Variant, a: Array) -> Variant:
	var v_vPos: Variant = R.coerce((a[0] if a.size() > 0 else null), "DTVector3D")
	pass
	return null

static func f_CanHaveExplodingCars(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_CanSpawnHiddenSoldier(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_CanSpawnMilitary(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_OnAreaDialogEnded(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_AreWeaponsEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_AreAmmoPointsEnabled(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_UsesValidFileVersion(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_InfiniteAmmoEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_InvincibleHellfireEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_ArcadeAmmoPickupEnabled(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_OnStartDriverSelection(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_HasRocketLauncher(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_HasMountedMG(c: Variant, a: Array) -> Variant:
	return false
	return null

static func f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	pass
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_Game"] = R.coerce(null, "RDGame")
	(c).fields["m_Player"] = R.coerce(null, "RDPlayer")
	(c).fields["m_Camera"] = R.coerce(null, "RDCamera")
	(c).fields["m_bAchievementsDirty"] = false
	(c).fields["m_fVehicleDamageMultiplier"] = float(NAN)
	(c).fields["m_fBodyDamageMultiplier"] = float(NAN)
	(c).fields["m_bHasHud"] = false
	(c).fields["m_bDoStartGameMode"] = false
	return null
