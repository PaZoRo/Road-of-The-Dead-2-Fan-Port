extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func c1053_f_RDEditorInterface(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_slotMC: Variant = null
	var v_dialogText: Variant = null
	var v_helpSlot: Variant = null
	var v_editorMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameModeEditor")
	v_i = R.coerce(0, "int")
	v_slotMC = R.coerce(null, "MovieClip")
	v_dialogText = R.coerce(null, "TextField")
	v_helpSlot = R.coerce(null, "MovieClip")
	(c).fields["m_ObjectItems"] = R.coerce(R.construct(R.resolve(c, "Object", "RDEditorInterface"), []), "Object")
	R.invoke(R.super_ref(c, "RDEditorInterface"), [])
	(c).fields["m_EditorMode"] = R.coerce(v_editorMode, "RDGameModeEditor")
	(c).fields["m_Game"] = R.coerce((v_editorMode).fields.get("m_Game"), "RDGame")
	(c).fields["m_MC"] = R.coerce(R.construct(R.klass("MC_EditorInterface"), []), "MovieClip")
	R.set_value((c).fields.get("m_MC"), "m_owner", c, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "mouseChildren", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "mouseChildren", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Selection"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "NameValue"), "text", "Enter save name...", "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "DescriptionValue"), "text", "", "=")
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"), false, "Override Campaign Spawning"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), true, "Hellfire Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), true, "Hellfire Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), true, "Jet Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), true, "Jet Bombings"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), true, "Mutant Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), true, "Mutant Count"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"), false, "Randomize Spawning Values"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"), false, "No Soldier Zombie"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"), false, "All Soldier Zombie"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"), false, "F.U.B.A.R. Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), true, "Player Speed Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"), false, "Full Speed Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaMode"), false, "Lava Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"), false, "Lava Instant Kill"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"), false, "Fog"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), true, "Forced Stop Duration"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"), false, "Override Campaign Difficulty"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), true, "Pattern Ratio"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), true, "Spawn Rate"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier"), false, "Spike Soldier"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"), false, "Bomb Soldier"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"), false, "Oil"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"), false, "Spike"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"), false, "Mine"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"), false, "Exploding Car"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"), false, "Grub"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"), false, "Zombie"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier"), false, "Base Soldier"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), true, "Min Length"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), true, "Max Length"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "Randomized"), false, "Randomized"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "CanBeFirst"), false, "Can Be First"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "SelectChainableGroups"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"), false])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"), false, "Tires Blown"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"), false, "No Weapons"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"), false, "No Ammo Points"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"), false, "No Ammo Replenish"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"), false, "Infinite Ammo"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"), false, "Invincible Hellfire"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), true, "Bounce Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), true, "Player Speed Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"), false, "Mounted MG"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"), false, "Mounted Rocket Launcher"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), false, "Infinite Mounted Weapon"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"), false, "No Driver Switch"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), false, "Arcade Ammo Pickups"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"), false, "No Steering"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"), false, "No Braking"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"), false, "No Swerving"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), true, "Player Car HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), true, "Player Body HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), true, "Zombie Speed Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), true, "Zombie HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), true, "Oil Slipperiness Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), true, "Speed Loss Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), true, "Vehicle HP Factor"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"), false, "Exploding Zombies"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"), false, "Enemies Always Cling"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"), false, "Fog Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"), false, "No Background City"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"), false, "No Chopper Support"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), true, "Starting Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), true, "Zombie Shot Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), true, "Zombie Hit Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), true, "Mutant Killed Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), true, "Clinger Off Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), true, "Feeders Hit Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), true, "Civilian Shot Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), true, "Civilian Hit Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), true, "Soldier Shot Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), true, "Soldier Hit Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), true, "Soldier Clinger Off Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), true, "Hellfire Defeated Time"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), true, "Difficulty Level Length"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), true, "Base Pattern Ratio"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), true, "Additive Pattern Ratio"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), true, "Base Spawn Rate"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), true, "Additive Spawn Rate"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), true, "Spike Soldier Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), true, "Bomb Soldier Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), true, "Oil Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), true, "Spike Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), true, "Mine Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), true, "Exploding Car Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), true, "Grub Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), true, "Zombie Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), true, "Base Soldier Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), true, "Base Hellfire Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), true, "Additive Hellfire Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), true, "Base Hellfire Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), true, "Additive Hellfire Level"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), true, "Base Jet Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), true, "Additive Jet Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), true, "Base Jet Bombings"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), true, "Additive Jet Bombings"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), true, "Base Mutant Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), true, "Additive Mutant Delay"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), true, "Base Mutant Count"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), true, "Additive Mutant Count"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"), false, "Randomize Spawning Values"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"), false, "No Soldier Zombie"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"), false, "All Soldier Zombie"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"), false, "F.U.B.A.R. Mode"])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), true])
	R.call_member(c, "SetupProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), false])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group1")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group2")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group3")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group4")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group5")])
	R.call_member(c, "SetupAreaGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group6")])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), "alpha", 0.75, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), "mouseChildren", false, "=")
	(c).fields["m_iMode"] = R.coerce(R.static_value("RDEditorInterface", "Mode_Unset"), "int")
	(c).fields["m_bLoadPatternPrivate"] = true
	(c).fields["m_bLoadAreaPrivate"] = true
	(c).fields["m_bLoadCampaignPrivate"] = true
	(c).fields["m_iLoadPatternSorting"] = R.coerce(R.static_value("RDGameModeEditor", "Sorting_Yours"), "int")
	(c).fields["m_iLoadAreaSorting"] = R.coerce(R.static_value("RDGameModeEditor", "Sorting_Yours"), "int")
	(c).fields["m_iLoadCampaignSorting"] = R.coerce(R.static_value("RDGameModeEditor", "Sorting_Yours"), "int")
	R.call_member(c, "ShowSortingMenu", [false])
	(c).fields["m_iDialogPickerSection"] = R.coerce(R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta"), "int")
	(c).fields["m_LoadPanelSlots"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot1"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot2"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot3"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot4"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot5"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot6"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot7"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot8"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot9"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot10"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot11"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot12"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot13"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot14"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot15"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot16"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot17"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Slot18")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_LoadPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.get_value((c).fields.get("m_LoadPanelSlots"), v_i), "MovieClip")
		R.set_value(v_slotMC, "mouseChildren", false, "=")
		R.set_value(v_slotMC, "buttonMode", true, "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_DialogPickerTexts"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText1"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText2"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText3"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText4"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText5"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText6"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText7"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText8"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText9"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogText10")]), "Array")
	(c).fields["m_DialogPickerSlots"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot1"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot2"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot3"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot4"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot5"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot6"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot7"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot8"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot9"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogSlot10")]), "Array")
	(c).fields["m_DialogPickerPreviews"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview1"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview2"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview3"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview4"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview5"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview6"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview7"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview8"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview9"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DialogPreview10")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_DialogPickerTexts"), "length"))):
		pass
		v_dialogText = R.coerce(R.get_value((c).fields.get("m_DialogPickerTexts"), v_i), "TextField")
		R.set_value(v_dialogText, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_HelpSlots"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help1"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help2"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help3"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help4"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help5"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help6"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help7"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help8"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help9"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help10"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help11"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help12"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help13"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help14"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Help15"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp1"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp2"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp3"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp4"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp5"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp6"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp7"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp8"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp9"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp10"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp11"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp12"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp13"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp14"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "RightHelp15")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_HelpSlots"), "length"))):
		pass
		v_helpSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_HelpSlots"), v_i), R.klass("MovieClip")), "MovieClip")
		R.set_value(v_helpSlot, "mouseChildren", false, "=")
		R.set_value(v_helpSlot, "buttonMode", true, "=")
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "PreviousTitle"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "NextTitle"), "mouseEnabled", false, "=")
	(c).fields["m_AreaGroupButtons"] = R.coerce(R.construct(R.klass("Array"), [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4")]), "Array")
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_ResidentialRandom"), "Buildings", "BuildingResidentialRandom", "Random Residential Building"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_TownRandom"), "Buildings", "BuildingTownRandom", "Random Town Building"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_IndustrialRandom"), "Buildings", "BuildingIndustrialRandom", "Random Industrial Building"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Garage"), "Buildings", "BuildingGarage", "Garage"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_PoliceStation1"), "Buildings", "BuildingPoliceStation1", "Police Station 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_PoliceStation2"), "Buildings", "BuildingPoliceStation2", "Police Station 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Church1"), "Buildings", "BuildingChurch1", "Church 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Church2"), "Buildings", "BuildingChurch2", "Church 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential1"), "Buildings", "BuildingResidential1", "Residential Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential2"), "Buildings", "BuildingResidential2", "Residential Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential3"), "Buildings", "BuildingResidential3", "Residential Building 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential4"), "Buildings", "BuildingResidential4", "Residential Building 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential5"), "Buildings", "BuildingResidential5", "Residential Building 5"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential6"), "Buildings", "BuildingResidential6", "Residential Building 6"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential7"), "Buildings", "BuildingResidential7", "Residential Building 7"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential8"), "Buildings", "BuildingResidential8", "Residential Building 8"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential1Damage"), "Buildings", "BuildingResidential1Damage", "Damaged Residential Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Residential3Damage"), "Buildings", "BuildingResidential3Damage", "Damaged Residential Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town1"), "Buildings", "BuildingTown1", "Town Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town2"), "Buildings", "BuildingTown2", "Town Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town3"), "Buildings", "BuildingTown3", "Town Building 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town4"), "Buildings", "BuildingTown4", "Town Building 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town5"), "Buildings", "BuildingTown5", "Town Building 5"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town6"), "Buildings", "BuildingTown6", "Town Building 6"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town7"), "Buildings", "BuildingTown7", "Town Building 7"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town8"), "Buildings", "BuildingTown8", "Town Building 8"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town9"), "Buildings", "BuildingTown9", "Town Building 9"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town10"), "Buildings", "BuildingTown10", "Town Building 10"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town11"), "Buildings", "BuildingTown11", "Town Building 11"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town12"), "Buildings", "BuildingTown12", "Town Building 12"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town3Damage"), "Buildings", "BuildingTown3Damage", "Damaged Town Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town7Damage"), "Buildings", "BuildingTown7Damage", "Damaged Town Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town11Damage"), "Buildings", "BuildingTown11Damage", "Damaged Town Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Town12Damage"), "Buildings", "BuildingTown12Damage", "Damaged Town Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial1"), "Buildings", "BuildingIndustrial1", "Industrial Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial2"), "Buildings", "BuildingIndustrial2", "Industrial Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial3"), "Buildings", "BuildingIndustrial3", "Industrial Building 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial4"), "Buildings", "BuildingIndustrial4", "Industrial Building 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial1Damage"), "Buildings", "BuildingIndustrial1Damage", "Damaged Industrial Building 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Industrial4Damage"), "Buildings", "BuildingIndustrial4Damage", "Damaged Industrial Building 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNormalMaleStraight"), "Humanoids", "ZombieNormalMale", "Normal Male Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNormalFemaleStraight"), "Humanoids", "ZombieNormalFemale", "Normal Female Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieHardStraight"), "Humanoids", "ZombieHard", "Hard Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNewFemaleStraight"), "Humanoids", "ZombieNewFemale", "Strong Female Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNewMaleStraight"), "Humanoids", "ZombieNewMale", "Strong Male Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieSoldierStraight"), "Humanoids", "ZombieSoldier", "Soldier Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_ZombieMutant"), "Humanoids", "ZombieMutant", "Mutant Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_ZombieMutantAlpha"), "Humanoids", "ZombieMutantAlpha", "Alpha Mutant Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieRandom"), "Humanoids", "ZombieRandom", "Random Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieRandomFeed"), "Humanoids", "ZombieRandomFeed", "Random Feeding Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNormalMaleFeed"), "Humanoids", "ZombieNormalMaleFeed", "Normal Male Feeding Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieNormalFemaleFeed"), "Humanoids", "ZombieNormalFemaleFeed", "Normal Female Feeding Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieHardFeed"), "Humanoids", "ZombieHardFeed", "Hard Feeding Zombie"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ZombieGrub"), "Humanoids", "ZombieGrub", "Grub"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_CivilianLeft"), "Humanoids", "CivilianLeft", "Civilian Going Left"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_CivilianRight"), "Humanoids", "CivilianRight", "Civilian Going Right"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SoldierStationary"), "Humanoids", "SoldierStationary", "Stationary Soldier"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SoldierAlign"), "Humanoids", "SoldierAlign", "Adjusting Soldier"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SoldierSpikes"), "Humanoids", "SoldierSpikes", "Spike Soldier"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SoldierBomb"), "Humanoids", "SoldierBomb", "Bomb Soldier"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleBurningCar01"), "Vehicles", "BurningCar01", "Burning Car 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleBurningCar02"), "Vehicles", "BurningCar02", "Burning Car 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_SmallCarNarrow"), "Vehicles", "SmallCarNarrowRandom", "Random Narrow Small Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_SmallCarWide"), "Vehicles", "SmallCarWideRandom", "Random Wide Small Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar01"), "Vehicles", "SmallCar01", "Small Car 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar02"), "Vehicles", "SmallCar02", "Small Car 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar03"), "Vehicles", "SmallCar03", "Small Car 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar04"), "Vehicles", "SmallCar04", "Small Car 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar05"), "Vehicles", "SmallCar05", "Small Car 5"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar06"), "Vehicles", "SmallCar06", "Small Car 6"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar07"), "Vehicles", "SmallCar07", "Small Car 7"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar08"), "Vehicles", "SmallCar08", "Small Car 8"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar09"), "Vehicles", "SmallCar09", "Small Car 9"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar10"), "Vehicles", "SmallCar10", "Small Car 10"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar12"), "Vehicles", "SmallCar12", "Small Car 12"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleSmallCar13"), "Vehicles", "SmallCar13", "Small Car 13"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_MediumCarNarrow"), "Vehicles", "MediumCarNarrowRandom", "Random Narrow Medium Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_MediumCarWide"), "Vehicles", "MediumCarWideRandom", "Random Wide Medium Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar01"), "Vehicles", "MediumCar01", "Medium Car 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar02"), "Vehicles", "MediumCar02", "Medium Car 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar03"), "Vehicles", "MediumCar03", "Medium Car 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar04"), "Vehicles", "MediumCar04", "Medium Car 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar05"), "Vehicles", "MediumCar05", "Medium Car 5"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar06"), "Vehicles", "MediumCar06", "Medium Car 6"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar07"), "Vehicles", "MediumCar07", "Medium Car 7"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar08"), "Vehicles", "MediumCar08", "Medium Car 8"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar09"), "Vehicles", "MediumCar09", "Medium Car 9"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar10"), "Vehicles", "MediumCar10", "Medium Car 10"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar11"), "Vehicles", "MediumCar11", "Medium Car 11"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar13"), "Vehicles", "MediumCar13", "Medium Car 13"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar14"), "Vehicles", "MediumCar14", "Medium Car 14"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleMediumCar15"), "Vehicles", "MediumCar15", "Medium Car 15"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_LargeCarNarrow"), "Vehicles", "LargeCarNarrowRandom", "Random Narrow Large Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_LargeCarWide"), "Vehicles", "LargeCarWideRandom", "Random Wide Large Car"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar01"), "Vehicles", "LargeCar01", "Large Car 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar02"), "Vehicles", "LargeCar02", "Large Car 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar03"), "Vehicles", "LargeCar03", "Large Car 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar04"), "Vehicles", "LargeCar04", "Large Car 4"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar05"), "Vehicles", "LargeCar05", "Large Car 5"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar06"), "Vehicles", "LargeCar06", "Large Car 6"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar07"), "Vehicles", "LargeCar07", "Large Car 7"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar08"), "Vehicles", "LargeCar08", "Large Car 8"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar09"), "Vehicles", "LargeCar09", "Large Car 9"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar10"), "Vehicles", "LargeCar10", "Large Car 10"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar11"), "Vehicles", "LargeCar11", "Large Car 11"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar12"), "Vehicles", "LargeCar12", "Large Car 12"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar13"), "Vehicles", "LargeCar13", "Large Car 13"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar14"), "Vehicles", "LargeCar14", "Large Car 14"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar15"), "Vehicles", "LargeCar15", "Large Car 15"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar16"), "Vehicles", "LargeCar16", "Large Car 16"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar17"), "Vehicles", "LargeCar17", "Large Car 17"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar23"), "Vehicles", "FireTruck", "Fire Truck"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar18"), "Vehicles", "Ambulance", "Ambulance"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar20"), "Vehicles", "HummerWide", "Wide Hummer"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar19"), "Vehicles", "HummerNarrow", "Narrow Hummer"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar20Damaged"), "Vehicles", "HummerWideDamaged", "Damaged Wide Hummer"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar19Damaged"), "Vehicles", "HummerNarrowDamaged", "Damaged Narrow Hummer"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar21"), "Vehicles", "ArmyTruck", "Army Truck"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar22"), "Vehicles", "Bus", "Bus"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleLargeCar24"), "Vehicles", "Semi", "Semi Truck"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_VehicleFuelTruck"), "Vehicles", "FuelTruck", "Fuel Truck"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObjectPassingCar"), "Vehicles", "PassingCar", "Passing Car (goes on crossing streets)"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_RandomTree"), "Vegetation", "RandomTree", "Random Tree"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_PineTree"), "Vegetation", "PineTree", "Pine Tree"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_MapleTree"), "Vegetation", "MapleTree", "Maple Tree"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_AltTree"), "Vegetation", "AltTree", "Alternate Tree"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_DeadTree"), "Vegetation", "DeadTree", "Dead Tree"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Bush1"), "Vegetation", "Bush1", "Bush 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Bush2"), "Vegetation", "Bush2", "Bush 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Bush3"), "Vegetation", "Bush3", "Bush 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_GrassTopRandom"), "Vegetation", "GrassTop", "Grass Top"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SmallHillTopRandom"), "Vegetation", "SmallHillTop", "Small Hill Top"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Barracade"), "Objects", "Barracade", "Barracade"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Box"), "Objects", "Box", "Box"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ConstructionSign"), "Objects", "ConstructionSign", "Construction Sign"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Dumpster"), "Objects", "Dumpster", "Dumpster"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ElectronicSign"), "Objects", "ElectronicSign", "Electronic Sign"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Fence"), "Objects", "Fence", "Fence"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_FireHydrant"), "Objects", "FireHydrant", "Fire Hydrant"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_FireHydrantFlowing"), "Objects", "FireHydrantFlowing", "Flowing Fire Hydrant"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_GardenGnome"), "Objects", "GardenGnome", "Garden Gnome"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_LawnFlamingo"), "Objects", "LawnFlamingo", "Lawn Flamingo"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_MailBox"), "Objects", "MailBox", "MailBox"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Mine"), "Objects", "Mine", "Mine"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_MotionMine"), "Objects", "MotionMine", "Motion Mine"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Oil"), "Objects", "Oil", "Oil"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_RoadBlood"), "Objects", "RoadBlood", "Road Blood"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_RoadKill"), "Objects", "RoadKill", "Road Kill"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SandBags"), "Objects", "SandBags", "Sand Bags"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_SandBagsBloody"), "Objects", "SandBagsBloody", "Bloody Sand Bags"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_ShoppingCart"), "Objects", "ShoppingCart", "Shopping Cart"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Spikes"), "Objects", "Spikes", "Spikes"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_TombRandom"), "Objects", "TombRandom", "Random Tomb"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Tomb1"), "Objects", "Tomb1", "Tomb 1"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Tomb2"), "Objects", "Tomb2", "Tomb 2"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Tomb3"), "Objects", "Tomb3", "Tomb 3"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_Table"), "Objects", "Table", "Table"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_TrafficBarrel"), "Objects", "TrafficBarrel", "Traffic Barrel"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_TrafficCone"), "Objects", "TrafficCone", "Traffic Cone"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_TrafficLight"), "Objects", "TrafficLight", "Traffic Light"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_TrashCan"), "Objects", "TrashCan", "Trash Can"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_WaterJug"), "Objects", "WaterJug", "Water Jug"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_LevelObject_WeaponCrate"), "Objects", "WeaponCrate", "Weapon Crate"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_BeerKeg"), "Objects", "BeerKeg", "Beer Keg"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Cherub"), "Objects", "Cherub", "Cherub"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Pumpkin"), "Objects", "Pumpkin", "Pumpkin"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_Snowman"), "Objects", "Snowman", "Snowman"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_ValentineTable"), "Objects", "ValentineTable", "Valentine Table"])
	R.call_member(c, "AddObjectItem", [R.klass("MC_EditorObject_WaterMelon"), "Objects", "WaterMelon", "Watermelon"])
	return null


static func c1053_f_AddObjectItem(c: Variant, a: Array) -> Variant:
	var v_objectInfo: Variant = null
	var v_mcClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_szCategory: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_szClassName: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_szName: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	v_objectInfo = R.coerce(R.construct(R.resolve(c, "Object", "RDEditorInterface"), []), "Object")
	R.set_value(v_objectInfo, "m_MCClass", v_mcClass, "=")
	R.set_value(v_objectInfo, "m_szClassName", v_szClassName, "=")
	R.set_value(v_objectInfo, "m_szName", v_szName, "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("m_ObjectItems"), v_szCategory), null)):
		pass
		R.set_value((c).fields.get("m_ObjectItems"), v_szCategory, R.construct(R.klass("Array"), []), "=")
	R.invoke(R.get_value(R.get_value((c).fields.get("m_ObjectItems"), v_szCategory), "push"), [v_objectInfo])
	return null


static func c1053_f_CanSpawnObject(c: Variant, a: Array) -> Variant:
	var v_iCategory: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_szClassName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	if R.truth((((((float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential"))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed")))) and ((((((float(v_iCategory) == float(R.static_value("RDEditorInterface", "Category_Buildings"))) or R.binary("==", v_szClassName, "Semi")) or R.binary("==", v_szClassName, "HighwayRamp")) or R.binary("==", v_szClassName, "Chopper")) or R.binary("==", v_szClassName, "SoldierSpikes")) or R.binary("==", v_szClassName, "SoldierBomb")))):
		pass
		return false
	return true
	return null


static func c1053_f_ShowObjectCategory(c: Variant, a: Array) -> Variant:
	var v_objectInfo: Variant = null
	var v_newObjectItem: Variant = null
	var v_newIcon: Variant = null
	var v_bounds: Variant = null
	var v_fMinScale: Variant = NAN
	var v_bEnabled: Variant = false
	var v_newColor: Variant = null
	var v_szCategory: Variant = null
	var v_objects: Variant = null
	var v_i: Variant = 0
	var v_iCategory: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_objectInfo = R.coerce(null, "Object")
	v_newObjectItem = R.coerce(null, "MovieClip")
	v_newIcon = R.coerce(null, "MovieClip")
	v_bounds = R.coerce(null, "Rectangle")
	v_fMinScale = float(NAN)
	v_bEnabled = false
	v_newColor = R.coerce(null, "Color")
	(c).fields["m_iCategory"] = R.coerce(v_iCategory, "int")
	(c).fields["m_iPage"] = R.coerce(0, "int")
	v_szCategory = R.coerce(R.get_value(R.static_value("RDEditorInterface", "CategoryNames"), v_iCategory), "String")
	v_objects = R.coerce(R.get_value((c).fields.get("m_ObjectItems"), v_szCategory), "Array")
	while R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "removeChildAt"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_objects, "length"))):
		pass
		v_objectInfo = R.coerce(R.get_value(v_objects, v_i), "Object")
		v_newObjectItem = R.coerce(R.construct(R.klass("MC_EditorObjectItem"), []), "MovieClip")
		R.set_value(v_newObjectItem, "buttonMode", true, "=")
		R.set_value(v_newObjectItem, "mouseChildren", false, "=")
		v_newIcon = R.coerce(R.construct(R.get_value(v_objectInfo, "m_MCClass"), []), "MovieClip")
		R.call_member(c, "FixIcon", [v_newIcon])
		v_bounds = R.coerce(R.invoke(R.get_value(v_newIcon, "getBounds"), [v_newIcon]), "Rectangle")
		v_fMinScale = float(minf(float(R.binary("/", (R.num(R.get_value(v_newObjectItem, "width")) * float(0.9)), R.get_value(v_newIcon, "width"))), float(R.binary("/", (R.num(R.get_value(v_newObjectItem, "height")) * float(0.9)), R.get_value(v_newIcon, "height")))))
		R.set_value(v_newIcon, "x", (float(R.binary("/", R.get_value(v_newObjectItem, "width"), 2)) - float(R.binary("/", (float((R.num(R.get_value(v_bounds, "right")) * float(v_fMinScale))) + float((R.num(R.get_value(v_bounds, "left")) * float(v_fMinScale)))), 2))), "=")
		R.set_value(v_newIcon, "y", (float((R.num(R.get_value(v_newObjectItem, "height")) * float(0.95))) - float((R.num(R.get_value(v_bounds, "bottom")) * float(v_fMinScale)))), "=")
		R.set_value(v_newIcon, "scaleX", v_fMinScale, "=")
		R.set_value(v_newIcon, "scaleY", v_fMinScale, "=")
		R.invoke(R.get_value(v_newObjectItem, "addChild"), [v_newIcon])
		v_bEnabled = R.coerce(R.call_member(c, "CanSpawnObject", [v_iCategory, R.get_value(v_objectInfo, "m_szClassName")]), "Boolean")
		v_newColor = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
		if R.truth(R.unary("!", v_bEnabled)):
			pass
			R.set_value(v_newColor, "redMultiplier", 0.8, "=")
			R.set_value(v_newColor, "greenMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueMultiplier", 0.8, "=")
			R.set_value(v_newColor, "redOffset", 50, "=")
		R.set_value(R.get_value(v_newObjectItem, "transform"), "colorTransform", v_newColor, "=")
		R.set_value(v_newObjectItem, "m_bEnabled", v_bEnabled, "=")
		R.set_value(v_newObjectItem, "x", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "numChildren")) * R.num(R.binary("+", R.get_value(v_newObjectItem, "width"), R.static_value("RDEditorInterface", "ObjectItemSpacing")))), "=")
		R.set_value(v_newObjectItem, "m_szClassName", R.get_value(v_objectInfo, "m_szClassName"), "=")
		R.set_value(v_newObjectItem, "m_szName", R.get_value(v_objectInfo, "m_szName"), "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "addChild"), [v_newObjectItem])
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "x", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollArea"), "x"), "=")
	(c).fields["m_fObjectScroll"] = float(0)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollLeft"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollRight"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "BuildingsUnderline"), "visible", (float((c).fields.get("m_iCategory")) == float(R.static_value("RDEditorInterface", "Category_Buildings"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "HumanoidsUnderline"), "visible", (float((c).fields.get("m_iCategory")) == float(R.static_value("RDEditorInterface", "Category_Humanoids"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "VehiclesUnderline"), "visible", (float((c).fields.get("m_iCategory")) == float(R.static_value("RDEditorInterface", "Category_Vehicles"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "VegetationUnderline"), "visible", (float((c).fields.get("m_iCategory")) == float(R.static_value("RDEditorInterface", "Category_Vegetation"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsUnderline"), "visible", (float((c).fields.get("m_iCategory")) == float(R.static_value("RDEditorInterface", "Category_Objects"))), "=")
	return null


static func c1053_f_UpdateObjectCategory(c: Variant, a: Array) -> Variant:
	var v_objectItem: Variant = null
	var v_bEnabled: Variant = false
	var v_newColor: Variant = null
	var v_i: Variant = 0
	v_objectItem = R.coerce(null, "MovieClip")
	v_bEnabled = false
	v_newColor = R.coerce(null, "Color")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_objectItem = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), "MovieClip")
		v_bEnabled = R.coerce(R.call_member(c, "CanSpawnObject", [(c).fields.get("m_iCategory"), R.get_value(v_objectItem, "m_szClassName")]), "Boolean")
		v_newColor = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
		if R.truth(R.unary("!", v_bEnabled)):
			pass
			R.set_value(v_newColor, "redMultiplier", 0.8, "=")
			R.set_value(v_newColor, "greenMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueMultiplier", 0.8, "=")
			R.set_value(v_newColor, "redOffset", 50, "=")
		R.set_value(R.get_value(v_objectItem, "transform"), "colorTransform", v_newColor, "=")
		R.set_value(v_objectItem, "m_bEnabled", v_bEnabled, "=")
		v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_FixIcon(c: Variant, a: Array) -> Variant:
	var v_childMC: Variant = null
	var v_iconMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	v_childMC = R.coerce(null, "MovieClip")
	if R.truth(R.get_value(v_iconMC, "Fire")):
		pass
		R.set_value(R.get_value(v_iconMC, "Fire"), "visible", false, "=")
	if R.truth(R.get_value(v_iconMC, "Smoke")):
		pass
		R.set_value(R.get_value(v_iconMC, "Smoke"), "visible", false, "=")
	if R.truth((R.unary("!", R.get_value(v_iconMC, "Fire")) and R.binary("==", R.get_value(v_iconMC, "numChildren"), 1))):
		pass
		v_childMC = R.coerce(R.binary("as", R.invoke(R.get_value(v_iconMC, "getChildAt"), [0]), R.klass("MovieClip")), "MovieClip")
		if R.truth(v_childMC):
			pass
			if R.truth(R.get_value(v_childMC, "Fire")):
				pass
				R.set_value(R.get_value(v_childMC, "Fire"), "visible", false, "=")
			if R.truth(R.get_value(v_childMC, "Smoke")):
				pass
				R.set_value(R.get_value(v_childMC, "Smoke"), "visible", false, "=")
	return null


static func c1053_f_Show(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [(c).fields.get("m_MC")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_MessageBox")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_ConfirmationDialog")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_ToolTip")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "addChild"), [((c).fields.get("m_Game")).fields.get("m_Flash")])
	R.call_member(c, "HideLoadScreen", [])
	R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Objects")])
	R.call_member(c, "ShowToolTip", [""])
	R.call_member(c, "ShowDialogBox", [""])
	R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "visible", false, "=")
	R.call_member(c, "ShowWarningMessage", [""])
	R.set_value(R.get_value((c).fields.get("m_MC"), "WarningMessage"), "mouseEnabled", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Endings"), "visible", false, "=")
	(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CannotPlaceIcon"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", false, "=")
	(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
	(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
	R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_None")])
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		if R.truth(R.get_value(R.klass("com.newgrounds.API"), "hasUserSession")):
			pass
			R.call_member(c, "SetMode", [v_iMode])
		else:
			pass
			(c).fields["m_iPendingPassportMode"] = R.coerce(v_iMode, "int")
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_PassportLogin")])
	else:
		pass
		R.call_member(c, "SetMode", [v_iMode])
	R.call_member(c, "UpdatePopulateBuildings", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "LoadCampaignHint"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "HelpTutorial"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ControlsTutorial"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ApplyTutorial"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "StoryCampaignHint"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChallengeCampaignHint"), "visible", false, "=")
	return null


static func c1053_f_Hide(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [(c).fields.get("m_MC")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_MessageBox")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_ConfirmationDialog")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_ToolTip")])
	R.invoke(R.get_value(((c).fields.get("m_Game")).fields.get("m_HudLayer"), "removeChild"), [((c).fields.get("m_Game")).fields.get("m_Flash")])
	return null


static func c1053_f_HideLoadScreen(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "LoadScreen"), "visible", false, "=")
	return null


static func c1053_f_ShowLoadScreen(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "LoadScreen"), "visible", true, "=")
	return null


static func c1053_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "x", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "y", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "=")
	R.call_member(c, "UpdateFileToolTip", [])
	R.call_member(c, "UpdateCannotPlaceIcon", [])
	R.call_member(c, "UpdateWarningMessage", [v_fDeltaTime])
	return null


static func c1053_f_UpdateWarningMessage(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	if R.truth((float((c).fields.get("m_fWarningTime")) > float(0))):
		pass
		(c).fields["m_fWarningTime"] = R.coerce(R.binary("-", (c).fields.get("m_fWarningTime"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fWarningTime")) <= float(0))):
			pass
			R.call_member(c, "ShowWarningMessage", [""])
	return null


static func c1053_f_GoToPreviousPage(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iPage")) > float(0))):
		pass
		R.set_value(c, "m_iPage", 1, "-=")
		(c).fields["m_fObjectScroll"] = float((float((float((c).fields.get("m_iPage")) * float(8))) * float((float(R.static_value("RDEditorInterface", "ItemWidth")) + float(R.static_value("RDEditorInterface", "ObjectItemSpacing"))))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "x", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollArea"), "x")) - float((c).fields.get("m_fObjectScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollLeft"), "visible", (float((c).fields.get("m_iPage")) > float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollRight"), "visible", true, "=")
	return null


static func c1053_f_GoToNextPage(c: Variant, a: Array) -> Variant:
	var v_iNbPages: Variant = 0
	v_iNbPages = R.coerce(ceilf(float(R.binary("/", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "width"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollArea"), "width")))), "int")
	if R.truth((float((c).fields.get("m_iPage")) < float((float(v_iNbPages) - float(1))))):
		pass
		R.set_value(c, "m_iPage", 1, "+=")
		(c).fields["m_fObjectScroll"] = float((float((float((c).fields.get("m_iPage")) * float(8))) * float((float(R.static_value("RDEditorInterface", "ItemWidth")) + float(R.static_value("RDEditorInterface", "ObjectItemSpacing"))))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "x", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollArea"), "x")) - float((c).fields.get("m_fObjectScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollLeft"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollRight"), "visible", (float((c).fields.get("m_iPage")) < float((float(v_iNbPages) - float(1)))), "=")
	return null


static func c1053_f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_focus: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	v_focus = R.coerce(R.call_member(((c).fields.get("m_Game")).fields.get("m_FocusManager"), "getFocus", []), "InteractiveObject")
	if R.truth(R.binary("as", v_focus, R.klass("TextField"))):
		pass
		return true
	if R.truth(((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) and R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_Delete")))):
		pass
		if R.truth(R.binary(">", R.call_member(c, "GetSelectedAreaPatterns", []), 0)):
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeletePatterns")])
		return true
	if R.truth(((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_Delete")))):
		pass
		if R.truth(R.binary(">", R.call_member(c, "GetSelectedCampaignAreas", []), 0)):
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteAreas")])
		return true
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save")))):
		pass
		return true
	return false
	return null


static func c1053_f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	return false
	return null


static func c1053_f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iPage: Variant = 0
	var v_helpSlot: Variant = null
	var v_propertySlot: Variant = null
	var v_prop: Variant = null
	var v_bClickedPattern: Variant = false
	var v_areaPanelSlot: Variant = null
	var v_iAreaPatternIndex: Variant = 0
	var v_iSelelectedPatterns: Variant = 0
	var v_campaignPanelSlot: Variant = null
	var v_bClickedSlot: Variant = false
	var v_iTargetSection: Variant = null
	var v_iTargetPage: Variant = 0
	var v_dialogPickerPreview: Variant = null
	var v_dialogPickerSlot: Variant = null
	var v_iSelelectedAreas: Variant = 0
	var v_slotMC: Variant = null
	var v_childMC: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_i = R.coerce(0, "int")
	v_iPage = R.coerce(0, "int")
	v_helpSlot = R.coerce(null, "MovieClip")
	v_propertySlot = R.coerce(null, "MovieClip")
	v_prop = R.coerce(null, "RDProperty")
	v_bClickedPattern = false
	v_areaPanelSlot = R.coerce(null, "MovieClip")
	v_iAreaPatternIndex = R.coerce(0, "int")
	v_iSelelectedPatterns = R.coerce(0, "int")
	v_campaignPanelSlot = R.coerce(null, "MovieClip")
	v_bClickedSlot = false
	v_iTargetSection = R.coerce(null, "*")
	v_iTargetPage = R.coerce(0, "int")
	v_dialogPickerPreview = R.coerce(null, "RDAudioCueButton")
	v_dialogPickerSlot = R.coerce(null, "RDAudioCueButton")
	v_iSelelectedAreas = R.coerce(0, "int")
	v_slotMC = R.coerce(null, "MovieClip")
	v_childMC = R.coerce(null, "MovieClip")
	R.call_member((c).fields.get("m_Game"), "ResetFocus", [])
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Quit"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Patterns"))):
		pass
		if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "ResetEnding", [])
			(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
			(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
			R.call_member((c).fields.get("m_EditorMode"), "LoadSavedPattern", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Areas"))):
		pass
		if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "ResetEnding", [])
			(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
			(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
			R.call_member((c).fields.get("m_EditorMode"), "LoadSavedArea", [])
			R.call_member(c, "UpdateAreaList", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Campaign"))):
		pass
		if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
			pass
			(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
			(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
			R.call_member((c).fields.get("m_EditorMode"), "LoadSavedCampaign", [])
			(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
			(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
			R.call_member(c, "UpdateCampaignList", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "Help"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPreHelpMode"] = R.coerce((c).fields.get("m_iMode"), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Help")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpTutorial"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "HelpTutorial"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_MC"), "ControlsTutorial"), "visible", true, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ControlsTutorial"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "ControlsTutorial"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "StoryCampaignHint"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "StoryCampaignHint"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChallengeCampaignHint"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "ChallengeCampaignHint"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ApplyTutorial"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "ApplyTutorial"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadCampaignHint"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "LoadCampaignHint"), "visible", false, "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PassportPanel"), "NoThanks"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetGameState", [R.static_value("BasicGame", "GameState_MainMenu")])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PassportPanel"), "Login"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "OnPassportLogin", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "NewPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_PatternType")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "TestPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "TestPattern", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "SavePattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowSavePanel", [R.static_value("RDGameModeEditor", "DataType_Pattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "LoadPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowLoadPanel", [R.static_value("RDGameModeEditor", "DataType_Pattern"), R.static_value("RDEditorInterface", "LoadType_Load")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "ApplyPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_ApplyPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "Unselect"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnUnselect", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "Delete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "DeleteSelectedEntity", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "Clear"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_ClearObjects")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "PopulateBuildings"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPrePopulateBuildingsMode"] = R.coerce((c).fields.get("m_iMode"), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_PopulateBuildingsType")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "Randomize"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "RandomizePattern", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "NewArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewArea")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "TestArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.unary("!", R.call_member(c, "DoesAreaHavePatterns", []))):
			pass
			R.call_member(c, "ShowWarningMessage", ["You need at least 1 pattern in your area."])
		else:
			pass
			R.call_member((c).fields.get("m_EditorMode"), "TestArea", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "SaveArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.unary("!", R.call_member(c, "DoesAreaHavePatterns", []))):
			pass
			R.call_member(c, "ShowWarningMessage", ["You need at least 1 pattern in your area."])
		else:
			pass
			R.call_member(c, "ShowSavePanel", [R.static_value("RDGameModeEditor", "DataType_Area")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "LoadArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowLoadPanel", [R.static_value("RDGameModeEditor", "DataType_Area"), R.static_value("RDEditorInterface", "LoadType_Load")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "ApplyArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.unary("!", R.call_member(c, "DoesAreaHavePatterns", []))):
			pass
			R.call_member(c, "ShowWarningMessage", ["You need at least 1 pattern in your area."])
		else:
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_ApplyArea")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "Randomize"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "ResetAreaSpawning", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "SelectAll"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAllAreaPatterns", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "DeleteSelected"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.binary(">", R.call_member(c, "GetSelectedAreaPatterns", []), 0)):
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeletePatterns")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "AddPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowLoadPanel", [R.static_value("RDGameModeEditor", "DataType_Pattern"), R.static_value("RDEditorInterface", "LoadType_Add")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iLoadType"] = R.coerce(R.static_value("RDEditorInterface", "LoadType_Edit"), "int")
		(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.get_value((c).fields.get("m_SelectedAreaPatternSlot"), "m_iIndex"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_LoadPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollLeft"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToPreviousAreaPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollRight"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToNextAreaPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "NewCampaign"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_CampaignType")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "TestCampaign"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))) and R.unary("!", R.call_member(c, "DoesAllGroupsHaveAreas", [])))):
			pass
			R.call_member(c, "ShowWarningMessage", ["You need at least 1 area in all your area groups."])
		else:
			pass
			if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))) and R.unary("!", R.call_member(c, "DoesAllGroupsHaveChainableGroups", [])))):
				pass
				R.call_member(c, "ShowWarningMessage", ["You need at least 1 chainable group for all area groups."])
			else:
				pass
				if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))) and R.unary("!", R.call_member(c, "DoesStoryHas2Areas", [])))):
					pass
					R.call_member(c, "ShowWarningMessage", ["You need at least 2 areas in a story campaign."])
				else:
					pass
					R.call_member((c).fields.get("m_EditorMode"), "TestCampaign", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "SaveCampaign"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))) and R.unary("!", R.call_member(c, "DoesCampaignHaveAreas", [])))):
			pass
			R.call_member(c, "ShowWarningMessage", ["You need at least 2 areas."])
		else:
			pass
			if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))) and R.unary("!", R.call_member(c, "DoesAllGroupsHaveAreas", [])))):
				pass
				R.call_member(c, "ShowWarningMessage", ["You need at least 1 area in all your area groups."])
			else:
				pass
				if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))) and R.unary("!", R.call_member(c, "DoesAllGroupsHaveChainableGroups", [])))):
					pass
					R.call_member(c, "ShowWarningMessage", ["You need at least 1 chainable group for all area groups."])
				else:
					pass
					if R.truth(((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))) and R.unary("!", R.call_member(c, "DoesStoryHas2Areas", [])))):
						pass
						R.call_member(c, "ShowWarningMessage", ["You need at least 2 areas in a story campaign."])
					else:
						pass
						R.call_member(c, "ShowSavePanel", [R.static_value("RDGameModeEditor", "DataType_Campaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "LoadCampaign"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowLoadPanel", [R.static_value("RDGameModeEditor", "DataType_Campaign"), R.static_value("RDEditorInterface", "LoadType_Load")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "Randomize"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "Properties"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowCampaignPropertyPanel", [true, (c).fields.get("m_iCampaignPropertyPage")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "SelectAll"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAllCampaignPatterns", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "DeleteSelected"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.binary(">", R.call_member(c, "GetSelectedCampaignAreas", []), 0)):
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteAreas")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AddArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowLoadPanel", [R.static_value("RDGameModeEditor", "DataType_Area"), R.static_value("RDEditorInterface", "LoadType_Add")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iLoadType"] = R.coerce(R.static_value("RDEditorInterface", "LoadType_Edit"), "int")
		(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.get_value((c).fields.get("m_SelectedCampaignAreaSlot"), "m_iIndex"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_LoadArea")])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ShowGroups")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "HideGroups")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_bShowAreaGroups"] = R.unary("!", (c).fields.get("m_bShowAreaGroups"))
		R.call_member(c, "ShowAreaGroups", [(c).fields.get("m_bShowAreaGroups"), (c).fields.get("m_iAreaGroupsPage")])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ShowGroups"), "visible", R.unary("!", (c).fields.get("m_bShowAreaGroups")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "HideGroups"), "visible", (c).fields.get("m_bShowAreaGroups"), "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollLeft"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToPreviousCampaignPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollRight"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToNextCampaignPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Previous"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iAreaGroupsPage")) > float(0))):
			pass
			R.call_member(c, "ShowAreaGroups", [true, (float((c).fields.get("m_iAreaGroupsPage")) - float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Next"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iAreaGroupsPage")) < float((float(ceilf(float(R.binary("/", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"), 4)))) - float(1))))):
			pass
			R.call_member(c, "ShowAreaGroups", [true, (float((c).fields.get("m_iAreaGroupsPage")) + float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Add"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.invoke(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "push"), [R.construct(R.klass("RDAreaGroup"), [])])
		v_iPage = R.coerce(floorf(float(R.binary("/", (R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")) - float(1)), 4))), "int")
		R.call_member(c, "ShowAreaGroups", [true, v_iPage])
		R.call_member(c, "SelectAreaGroup", [R.get_value((c).fields.get("m_AreaGroupButtons"), R.binary("%", (R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")) - float(1)), 4))])
		R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SelectAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1"), "Delete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_PendingDeleteAreaGroupSlot"] = R.coerce(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1"), "MovieClip")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteAreaGroup")])
		R.call_member(c, "DeleteAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2"), "Delete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "DeleteAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3"), "Delete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "DeleteAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4"), "Delete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "DeleteAreaGroup", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group1"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((c).fields.get("m_iChainableGroupsPage")) * float(6))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group2"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group3"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(2))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group4"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(3))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group5"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(4))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group6"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ToggleChainableGroup", [(float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(5))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Previous"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iChainableGroupsPage")) > float(0))):
			pass
			R.call_member(c, "ShowChainableGroups", [true, (float((c).fields.get("m_iChainableGroupsPage")) - float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Next"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iChainableGroupsPage")) < float(floorf(float(R.binary("/", (R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")) - float(1)), 6)))))):
			pass
			R.call_member(c, "ShowChainableGroups", [true, (float((c).fields.get("m_iChainableGroupsPage")) + float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "Cancel"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "RegularPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_Regular"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "AlleywayResidentialPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_AlleywayResidential"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "AlleywayTownPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_AlleywayTown"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "AlleywayIndustrialPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "AlleywayMixedPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_AlleywayMixed"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "Cancel"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignTypeDialog"), "Story"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingCampaignType"] = R.coerce(R.static_value("RDCampaignInfo", "Type_Story"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewCampaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignTypeDialog"), "Challenge"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingCampaignType"] = R.coerce(R.static_value("RDCampaignInfo", "Type_Challenge"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewCampaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignTypeDialog"), "Cancel"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "Residential"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "visible", false, "=")
		R.call_member((c).fields.get("m_EditorMode"), "PopulateBuildings", [R.static_value("RDGameModeEditor", "BuildingsType_Residential")])
		R.call_member(c, "SetMode", [(c).fields.get("m_iPrePopulateBuildingsMode")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "Town"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "visible", false, "=")
		R.call_member((c).fields.get("m_EditorMode"), "PopulateBuildings", [R.static_value("RDGameModeEditor", "BuildingsType_Town")])
		R.call_member(c, "SetMode", [(c).fields.get("m_iPrePopulateBuildingsMode")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "Industrial"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "visible", false, "=")
		R.call_member((c).fields.get("m_EditorMode"), "PopulateBuildings", [R.static_value("RDGameModeEditor", "BuildingsType_Industrial")])
		R.call_member(c, "SetMode", [(c).fields.get("m_iPrePopulateBuildingsMode")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "Mixed"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "visible", false, "=")
		R.call_member((c).fields.get("m_EditorMode"), "PopulateBuildings", [R.static_value("RDGameModeEditor", "BuildingsType_Mixed")])
		R.call_member(c, "SetMode", [(c).fields.get("m_iPrePopulateBuildingsMode")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "HighwayPattern"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_iPendingPatternType"] = R.coerce(R.static_value("RDPatternInfo", "Type_Highway"), "int")
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_NewPattern")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "Accept"))):
		pass
		R.call_member(c, "OnAcceptSave", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "NameValue"))):
		pass
		R.call_member(c, "HighlightTextField", [R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "NameValue")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "DescriptionValue"))):
		pass
		R.call_member(c, "HighlightTextField", [R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "DescriptionValue")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "Cancel"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
			pass
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
				pass
				R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
			else:
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
					pass
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "OK"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Save")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "SetThumbnail"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_SetThumbnail")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		(c).fields["m_bSavePrivate"] = R.unary("!", (c).fields.get("m_bSavePrivate"))
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"), "Check"), "visible", R.unary("!", (c).fields.get("m_bSavePrivate")), "=")
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "CategoryBuildings"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Buildings")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "CategoryHumanoids"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Humanoids")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "CategoryVehicles"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Vehicles")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "CategoryVegetation"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Vegetation")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "CategoryObjects"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowObjectCategory", [R.static_value("RDEditorInterface", "Category_Objects")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollLeft"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToPreviousPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ScrollRight"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "GoToNextPage", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Back"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
			pass
			if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
				pass
				R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
			else:
				pass
				if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Add")))):
					pass
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
				pass
				if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
					pass
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
				else:
					pass
					if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Add")))):
						pass
						R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
			else:
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
					pass
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Private"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetLoadCategory", [true])
		(c).fields["m_iLoadPage"] = R.coerce(0, "int")
		R.call_member(c, "UpdateLoadPanel", [])
		R.call_member(c, "RefreshLoadPanel", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Public"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "SetLoadCategory", [false])
		(c).fields["m_iLoadPage"] = R.coerce(0, "int")
		R.call_member(c, "UpdateLoadPanel", [])
		R.call_member(c, "RefreshLoadPanel", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "PreviewFile"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "OnPreviewFile", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "LoadFile"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "OnLoadFile", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "AddFile"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "OnAddFile", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "DeleteFile"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "OnDeleteFile", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopYours")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropYours")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropYours"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Yours")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRecent")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRecent")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRecent"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Recent")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopBest")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropBest")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropBest"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Best")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopWorst")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropWorst")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropWorst"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Worst")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopUnrated")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropUnrated")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropUnrated"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Unrated")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRandom")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRandom")))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRandom"), "visible")):
			pass
			R.call_member(c, "ShowSortingMenu", [false])
			R.call_member(c, "SetSorting", [R.static_value("RDGameModeEditor", "Sorting_Random")])
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		else:
			pass
			R.call_member(c, "ShowSortingMenu", [true])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "ScrollLeft"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iLoadPage")) > float(0))):
			pass
			R.set_value(c, "m_iLoadPage", 1, "-=")
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "ScrollRight"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		if R.truth((float((c).fields.get("m_iLoadPage")) < float(999))):
			pass
			R.set_value(c, "m_iLoadPage", 1, "+=")
			R.call_member(c, "UpdateLoadPanel", [])
			R.call_member(c, "RefreshLoadPanel", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value((c).fields.get("m_MC"), "ToggleMusic"))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "ToggleMusic", [])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Previous"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowRoadSelector", [true, (float((c).fields.get("m_iRoadSelectorPage")) - float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Next"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ShowRoadSelector", [true, (float((c).fields.get("m_iRoadSelectorPage")) + float(1))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Town"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Town")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndPavement"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_GrassAndPavement")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndGrass"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_PavementAndGrass")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Grass"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Park")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "CrossingStreet"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_CrossingStreet")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Pavement"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Parking")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "ForestPath"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_ForestPath")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Dirt"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Dirt")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Sand"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Sand")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Concrete"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Concrete")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Snow"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Snow")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Ice"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Ice")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndGrass"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_DirtAndGrass")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndDirt"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_GrassAndDirt")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "CrossingDirtRoad"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_CrossingDirtRoad")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndRoad"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_GrassAndRoad")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndRoad"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_DirtAndRoad")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndPavement"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_DirtAndPavement")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndDirt"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_PavementAndDirt")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Mud"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_Mud")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndRoad"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_SnowAndRoad")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndPavement"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_SnowAndPavement")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndSnow"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_PavementAndSnow")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndDirtPath"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member((c).fields.get("m_EditorMode"), "OnRoadSelected", [R.static_value("RDRoad", "SliceType_SnowAndDirtPath")])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "PreviewInterface"), "Back"))):
		pass
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		R.call_member(c, "ExitPreview", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate0")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate0")))):
		pass
		R.call_member(c, "RateFile", [0])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate1")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate1")))):
		pass
		R.call_member(c, "RateFile", [1])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate2")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate2")))):
		pass
		R.call_member(c, "RateFile", [2])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate3")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate3")))):
		pass
		R.call_member(c, "RateFile", [3])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate4")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate4")))):
		pass
		R.call_member(c, "RateFile", [4])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "Rate5")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "Rate5")))):
		pass
		R.call_member(c, "RateFile", [5])
		R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
		return true
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Help")))):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Exit"))):
			pass
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member(c, "SetMode", [(c).fields.get("m_iPreHelpMode")])
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Table"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowHelp", [R.unary("-", 1)])
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Previous"))):
					pass
					R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
					R.call_member(c, "ShowHelp", [(float((c).fields.get("m_iHelpPage")) - float(1))])
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Next"))):
						pass
						R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
						R.call_member(c, "ShowHelp", [(float((c).fields.get("m_iHelpPage")) + float(1))])
					else:
						pass
						v_i = R.coerce(0, "int")
						while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_HelpSlots"), "length"))):
							pass
							v_helpSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_HelpSlots"), v_i), R.klass("MovieClip")), "MovieClip")
							if R.truth(R.binary("==", R.get_value(v_event, "target"), v_helpSlot)):
								pass
								R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
								R.call_member(c, "ShowHelp", [v_i])
								break
							v_i = R.signed32(v_i + 1)
		return true
	if R.truth((((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_SetThumbnail")))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Preview"))))):
		pass
		return true
	v_i = R.coerce(1, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "numChildren"))):
		pass
		v_propertySlot = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "getChildAt"), [v_i]), "MovieClip")
		v_prop = R.coerce(R.get_value(v_propertySlot, "m_Property"), "RDProperty")
		if R.truth(((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean"))) and R.binary("==", R.get_value(v_event, "target"), v_propertySlot))):
			pass
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member(((c).fields.get("m_EditorMode")).fields.get("m_SelectedEntity"), "SetProperty", [(v_prop).fields.get("m_szName"), R.unary("!", (v_prop).fields.get("m_bBooleanValue"))])
			R.set_value(R.get_value(v_propertySlot, "Check"), "visible", (v_prop).fields.get("m_bBooleanValue"), "=")
			return true
		if R.truth(((R.truth(R.binary("==", R.get_value(v_event, "target"), v_propertySlot)) or R.truth(R.logical_and(R.get_value(v_propertySlot, "Name"), func(): return R.binary("==", R.get_value(v_event, "target"), R.get_value(v_propertySlot, "Name"))))) or (R.truth(R.get_value(v_propertySlot, "Value")) and R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(v_propertySlot, "Value")))))):
			pass
			R.call_member(c, "HighlightTextField", [R.get_value(v_propertySlot, "Value")])
			return true
		v_i = R.signed32(v_i + 1)
	if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Area")))):
		pass
		if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "General"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [true, R.static_value("RDEditorInterface", "AreaPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spawning"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [true, R.static_value("RDEditorInterface", "AreaPropertyPage_Spawning")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Difficulty"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [true, R.static_value("RDEditorInterface", "AreaPropertyPage_Difficulty")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Dialog"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [true, R.static_value("RDEditorInterface", "AreaPropertyPage_Dialog")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [false])
				v_iTargetSection = R.coerce(R.call_member(c, "GetDialogPickerSectionFromDialogIndex", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "m_iDialogCueIndex")]), "*")
				v_iTargetPage = R.coerce(R.call_member(c, "GetDialogPickerPageFromDialogIndex", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "m_iDialogCueIndex")]), "int")
				R.call_member(c, "ShowDialogPicker", [true, v_iTargetSection, v_iTargetPage, false])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bOverrideSpawning"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideSpawning"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideSpawning"), "=")
				return true
			if R.truth(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText")]), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor")]))):
				pass
				R.call_member(c, "HighlightTextField", [R.call_member(c, "GetTextPropertyTextField", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bRandomizeSpawningValues"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bRandomizeSpawningValues"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bRandomizeSpawningValues"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bFullSpeedMode"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bFullSpeedMode"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFullSpeedMode"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaMode"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bLavaMode"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaMode"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaMode"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bLavaInstantKill"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaInstantKill"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaInstantKill"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bFog"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bFog"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFog"), "=")
				return true
			if R.truth(R.logical_or(R.logical_or(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration")]), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate")]))):
				pass
				R.call_member(c, "HighlightTextField", [R.call_member(c, "GetTextPropertyTextField", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bAllowFlip"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllowFlip"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllowFlip"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bOverrideDifficulty"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideDifficulty"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideDifficulty"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bSpikeSoldier"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpikeSoldier"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpikeSoldier"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bBombSoldier"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bBombSoldier"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bBombSoldier"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bOil"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bOil"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOil"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bSpike"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpike"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpike"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bMine"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bMine"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bMine"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bExplodingCar"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bExplodingCar"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bExplodingCar"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bGrub"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bGrub"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bGrub"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bZombie"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bZombie"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bZombie"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bBaseSoldier"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bBaseSoldier"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bBaseSoldier"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bNoSoldierZombie"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bNoSoldierZombie"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bNoSoldierZombie"), "=")
				((c).fields.get("m_SelectedArea")).fields["m_bAllSoldierZombie"] = false
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllSoldierZombie"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bAllSoldierZombie"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllSoldierZombie"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllSoldierZombie"), "=")
				((c).fields.get("m_SelectedArea")).fields["m_bNoSoldierZombie"] = false
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bNoSoldierZombie"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_bFUBARMode"] = R.unary("!", ((c).fields.get("m_SelectedArea")).fields.get("m_bFUBARMode"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFUBARMode"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPreview"))):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "PlayDialogCue", [R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"))])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPrevious"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "GoToPreviousDialogPage", [])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogNext"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "GoToNextDialogPage", [])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogAdd"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "AddDialogPage", [])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaPropertyPanel", [false])
				R.call_member(c, "ShowAreaTypePanel", [true])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName"), "Value")])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value")])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "Randomized"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedAreaGroup")).fields["m_bRandomized"] = R.unary("!", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bRandomized"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "Randomized"), "Check"), "visible", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bRandomized"), "=")
				R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "CanBeFirst"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedAreaGroup")).fields["m_bCanBeFirst"] = R.unary("!", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bCanBeFirst"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "CanBeFirst"), "Check"), "visible", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bCanBeFirst"), "=")
				if R.truth((R.binary(">", R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_ChallengeGroups"), "length"), 0) and R.binary("==", R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_ChallengeGroups"), 0), R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "m_iIndex")))):
					pass
					R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "SelectChainableGroups"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowChainableGroups", [true, (c).fields.get("m_iChainableGroupsPage")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"))):
				pass
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "General"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Weapons"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Weapons")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Time"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Time")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Dialog"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Dialog")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Controls"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Controls")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Difficulty"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Difficulty")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Spawning"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Spawning")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowGoalTypePanel", [true])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bTiresBlown"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoWeapons"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoAmmoPoints"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoReplenish"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bInfiniteAmmo"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bInvincibleHellfire"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"), "=")
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value")])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bMountedMG"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"))
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bMountedRocketLauncher"] = false
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"), "=")
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "Check"), "visible", false, "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bMountedRocketLauncher"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"))
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bMountedMG"] = false
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"), "=")
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"), "Check"), "visible", false, "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bInfiniteMountedWeapon"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoDriverSwitch"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bArcadeAmmoPickup"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoSteering"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoBraking"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoSwerving"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving"), "=")
				return true
			if R.truth(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor")]), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount")]))):
				pass
				R.call_member(c, "HighlightTextField", [R.call_member(c, "GetTextPropertyTextField", [R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bRandomizeSpawningValues"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoSoldierZombie"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bAllSoldierZombie"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bFUBARMode"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bExplodingZombies"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bAlwaysCling"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bFog"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFog"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFog"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member((c).fields.get("m_EditorMode"), "SetNoBackgroundCity", [R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity"))])
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_bNoChopperSupport"] = R.unary("!", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"))
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"), "=")
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [false])
				v_iTargetSection = R.coerce(R.call_member(c, "GetDialogPickerSectionFromDialogIndex", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "m_iDialogCueIndex")]), "*")
				v_iTargetPage = R.coerce(R.call_member(c, "GetDialogPickerPageFromDialogIndex", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "m_iDialogCueIndex")]), "int")
				R.call_member(c, "ShowDialogPicker", [true, v_iTargetSection, v_iTargetPage, true])
				return true
			if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText")])):
				pass
				R.call_member(c, "HighlightTextField", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), "Value")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPreview"))):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "PlayDialogCue", [R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"))])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPrevious"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "GoToPreviousDialogPage", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogNext"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "GoToNextDialogPage", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogAdd"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "AddDialogPage", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "DistanceReached"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.static_value("RDCampaignInfo", "Goal_DistanceReached"), "int")
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "ZombiesKilled"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.static_value("RDCampaignInfo", "Goal_ZombiesKilled"), "int")
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "CiviliansKilled"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.static_value("RDCampaignInfo", "Goal_CiviliansKilled"), "int")
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "CiviliansSaved"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.static_value("RDCampaignInfo", "Goal_CiviliansSaved"), "int")
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "Close"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Cocheta"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowDialogPicker", [true, R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta"), 0, (c).fields.get("m_bDialogPickerForCampaign")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Diane"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowDialogPicker", [true, R.static_value("RDEditorInterface", "DialogPickerSection_Diane"), 0, (c).fields.get("m_bDialogPickerForCampaign")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Radio"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowDialogPicker", [true, R.static_value("RDEditorInterface", "DialogPickerSection_Radio"), 0, (c).fields.get("m_bDialogPickerForCampaign")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "None"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "SelectDialogCue", [R.unary("-", 1)])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Close"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowDialogPicker", [false])
				if R.truth((c).fields.get("m_bDialogPickerForCampaign")):
					pass
					R.call_member(c, "ShowCampaignPropertyPanel", [true, (c).fields.get("m_iCampaignPropertyPage"), false])
				else:
					pass
					R.call_member(c, "ShowAreaPropertyPanel", [true, (c).fields.get("m_iAreaPropertyPage"), false])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "ScrollLeft"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				if R.truth((float((c).fields.get("m_iDialogPickerPage")) > float(0))):
					pass
					R.set_value(c, "m_iDialogPickerPage", 1, "-=")
					R.call_member(c, "ShowDialogPicker", [true, (c).fields.get("m_iDialogPickerSection"), (c).fields.get("m_iDialogPickerPage"), (c).fields.get("m_bDialogPickerForCampaign")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "ScrollRight"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				if R.truth((float((c).fields.get("m_iDialogPickerPage")) < float((R.num(R.call_member(c, "GetNbDialogPickerPages", [])) - float(1))))):
					pass
					R.set_value(c, "m_iDialogPickerPage", 1, "+=")
					R.call_member(c, "ShowDialogPicker", [true, (c).fields.get("m_iDialogPickerSection"), (c).fields.get("m_iDialogPickerPage"), (c).fields.get("m_bDialogPickerForCampaign")])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "DriveAway"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingDriveAway"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "BlackScreen"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingBlackScreen"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "RedScreen"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingRedScreen"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "WhiteScreen"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingWhiteScreen"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "NukeBlast"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingNukeBlast"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "ChopperEscape"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingChopperEscape"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "HighwayTransition"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				((c).fields.get("m_SelectedArea")).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_EndingHighwayTransition"), "int")
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "Close"))):
				pass
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaPropertyPanel", [true])
				return true
			if R.truth(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "visible")):
				pass
				v_i = R.coerce(0, "int")
				while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_DialogPickerSlots"), "length"))):
					pass
					v_dialogPickerPreview = R.coerce(R.binary("as", R.get_value((c).fields.get("m_DialogPickerPreviews"), v_i), R.klass("RDAudioCueButton")), "RDAudioCueButton")
					if R.truth(R.binary("==", R.get_value(v_event, "target"), v_dialogPickerPreview)):
						pass
						R.call_member((c).fields.get("m_EditorMode"), "PlayDialogCue", [(v_dialogPickerPreview).fields.get("m_iDialogIndex")])
						return true
					v_dialogPickerSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_DialogPickerSlots"), v_i), R.klass("RDAudioCueButton")), "RDAudioCueButton")
					if R.truth(R.binary("==", R.get_value(v_event, "target"), v_dialogPickerSlot)):
						pass
						if R.truth((float((v_dialogPickerSlot).fields.get("m_iDialogIndex")) < float((v_dialogPickerSlot).fields.get("m_iMaxDialogIndex")))):
							pass
							R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
							R.call_member(c, "SelectDialogCue", [(v_dialogPickerSlot).fields.get("m_iDialogIndex")])
						return true
					v_i = R.signed32(v_i + 1)
			v_campaignPanelSlot = R.coerce(null, "MovieClip")
			v_bClickedSlot = false
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
				pass
				v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
				if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(v_campaignPanelSlot, "MoveLeft"))):
					pass
					if R.truth(R.binary(">", R.get_value(v_campaignPanelSlot, "m_iIndex"), 0)):
						pass
						R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
						R.call_member(c, "SwapCampaignAreaSlot", [(R.num(R.get_value(v_campaignPanelSlot, "m_iIndex")) - float(1)), R.get_value(v_campaignPanelSlot, "m_iIndex")])
						if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
							pass
							R.call_member(c, "UpdateStoryEnding", [])
						R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
					v_bClickedSlot = true
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(v_campaignPanelSlot, "MoveRight"))):
						pass
						if R.truth(R.binary("<", R.get_value(v_campaignPanelSlot, "m_iIndex"), (R.num(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length")) - float(1)))):
							pass
							R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
							R.call_member(c, "SwapCampaignAreaSlot", [R.get_value(v_campaignPanelSlot, "m_iIndex"), R.binary("+", R.get_value(v_campaignPanelSlot, "m_iIndex"), 1)])
							if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
								pass
								R.call_member(c, "UpdateStoryEnding", [])
							R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
						v_bClickedSlot = true
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "target"), v_campaignPanelSlot)):
							pass
							if R.truth(R.binary("<", R.get_value(v_campaignPanelSlot, "m_iIndex"), R.binary("+", R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"), 1))):
								pass
								v_bClickedSlot = true
								R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
								if R.truth(R.call_static("Input", "IsKeyDown", [R.static_value("Input", "Key_Shift")])):
									pass
									R.set_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible", R.unary("!", R.get_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible")), "=")
								else:
									pass
									R.call_member(c, "ClearCampaignPanelSelection", [])
									R.set_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible", true, "=")
				v_i = R.signed32(v_i + 1)
			if R.truth(v_bClickedSlot):
				pass
				v_iSelelectedAreas = R.coerce(0, "int")
				(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(null, "MovieClip")
				(c).fields["m_SelectedArea"] = R.coerce(null, "RDAreaInfo")
				v_i = R.coerce(0, "int")
				while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
					pass
					v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
					if R.truth(R.get_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible")):
						pass
						(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(v_campaignPanelSlot, "MovieClip")
						(c).fields["m_SelectedArea"] = R.coerce(R.get_value(R.get_value(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "m_Areas"), v_i), "RDAreaInfo")
						v_iSelelectedAreas = R.signed32(v_iSelelectedAreas + 1)
					v_i = R.signed32(v_i + 1)
				if R.truth((R.truth((c).fields.get("m_SelectedCampaignAreaSlot")) and (float(v_iSelelectedAreas) == float(1)))):
					pass
					R.call_member(c, "ShowAreaPropertyPanel", [true, (c).fields.get("m_iAreaPropertyPage")])
					R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "mouseEnabled", true, "=")
					R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "alpha", 1, "=")
				else:
					pass
					R.call_member(c, "ShowAreaPropertyPanel", [false])
					R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "mouseEnabled", false, "=")
					R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "alpha", 0.5, "=")
				R.call_member(c, "ShowDialogPicker", [false])
				R.call_member(c, "ShowAreaTypePanel", [false])
				R.call_member(c, "ShowAreaGroupPropertyPanel", [false])
				R.call_member(c, "ShowCampaignPropertyPanel", [false])
			else:
				pass
				R.call_member(c, "ResetCampaignAreaSelection", [])
				R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_None")])
			return true
		if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Load")))):
			pass
			v_bClickedSlot = false
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_LoadPanelSlots"), "length"))):
				pass
				v_slotMC = R.coerce(R.get_value((c).fields.get("m_LoadPanelSlots"), v_i), "MovieClip")
				if R.truth(R.binary("==", R.get_value(v_event, "target"), v_slotMC)):
					pass
					R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
					if R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_LoadedFiles"), "length"))):
						pass
						(c).fields["m_iPendingLoadIndex"] = R.coerce(v_i, "int")
						R.call_member(c, "ShowLoadFileMenu", [(c).fields.get("m_iPendingLoadIndex")])
						v_bClickedSlot = true
					break
				v_i = R.signed32(v_i + 1)
			if R.truth(R.unary("!", v_bClickedSlot)):
				pass
				R.call_member(c, "ShowLoadFileMenu", [R.unary("-", 1)])
			return true
		v_i = R.coerce(0, "int")
		while R.truth(true):
			pass
			if R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "numChildren"))):
				pass
				v_childMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
				if R.truth(R.binary("==", R.get_value(v_event, "target"), v_childMC)):
					pass
					break
				v_i = R.signed32(v_i + 1)
				continue
		if R.truth(R.get_value(v_childMC, "m_bEnabled")):
			pass
			R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
			R.call_member((c).fields.get("m_EditorMode"), "OnInterfaceObjectSelected", [R.get_value(v_childMC, "m_szClassName")])
		else:
			pass
			R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
		return true
	v_bClickedPattern = false
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.binary("==", R.get_value(v_event, "target"), v_areaPanelSlot)):
			pass
			v_iAreaPatternIndex = R.coerce(R.coerce(R.get_value(v_areaPanelSlot, "m_iIndex"), "int"), "int")
			if R.truth(R.binary("<", v_iAreaPatternIndex, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
				pass
				v_bClickedPattern = true
				R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
				if R.truth(R.call_static("Input", "IsKeyDown", [R.static_value("Input", "Key_Shift")])):
					pass
					R.set_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible", R.unary("!", R.get_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible")), "=")
				else:
					pass
					R.call_member(c, "ClearAreaPanelSelection", [])
					R.set_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible", true, "=")
		v_i = R.signed32(v_i + 1)
	if R.truth(v_bClickedPattern):
		pass
		v_iSelelectedPatterns = R.coerce(0, "int")
		(c).fields["m_SelectedAreaPatternSlot"] = R.coerce(null, "MovieClip")
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
			pass
			v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
			if R.truth(R.get_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible")):
				pass
				(c).fields["m_SelectedAreaPatternSlot"] = R.coerce(v_areaPanelSlot, "MovieClip")
				v_iSelelectedPatterns = R.signed32(v_iSelelectedPatterns + 1)
			v_i = R.signed32(v_i + 1)
		if R.truth((R.truth((c).fields.get("m_SelectedAreaPatternSlot")) and (float(v_iSelelectedPatterns) == float(1)))):
			pass
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "mouseEnabled", true, "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "alpha", 1, "=")
		else:
			pass
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "mouseEnabled", false, "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "alpha", 0.5, "=")
	else:
		pass
		R.call_member(c, "ClearAreaPanelSelection", [])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "mouseEnabled", false, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "alpha", 0.5, "=")
	R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_None")])
	return false
	return null


static func c1053_f_SetPanelMode(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_AreaProperty")))):
		pass
		R.call_member(c, "ShowAreaPropertyPanel", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_DialogPicker")))):
		pass
		R.call_member(c, "ShowDialogPicker", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_AreaType")))):
		pass
		R.call_member(c, "ShowAreaTypePanel", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_AreaGroupProperty")))):
		pass
		R.call_member(c, "ShowAreaGroupPropertyPanel", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_CampaignProperty")))):
		pass
		R.call_member(c, "ShowCampaignPropertyPanel", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_ChainableGroups")))):
		pass
		R.call_member(c, "ShowChainableGroups", [false])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Panel_GoalType")))):
		pass
		R.call_member(c, "ShowGoalTypePanel", [false])
	return null


static func c1053_f_SwapCampaignAreaSlot(c: Variant, a: Array) -> Variant:
	var v_areaInfo: Variant = null
	var v_otherAreaInfo: Variant = null
	var v_slot: Variant = null
	var v_otherSlot: Variant = null
	var v_iconBitmap: Variant = null
	var v_iIndex1: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iIndex2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_areaInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), v_iIndex1), "RDAreaInfo")
	v_otherAreaInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), v_iIndex2), "RDAreaInfo")
	R.set_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), v_iIndex1, v_otherAreaInfo, "=")
	R.set_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), v_iIndex2, v_areaInfo, "=")
	v_slot = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_iIndex1]), "MovieClip")
	v_otherSlot = R.coerce(R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_iIndex2]), "MovieClip")
	v_iconBitmap = R.coerce(R.get_value(v_slot, "m_IconBitmap"), "Bitmap")
	R.invoke(R.get_value(v_slot, "addChildAt"), [R.get_value(v_otherSlot, "m_IconBitmap"), 1])
	R.set_value(v_slot, "m_IconBitmap", R.get_value(v_otherSlot, "m_IconBitmap"), "=")
	R.invoke(R.get_value(v_otherSlot, "addChildAt"), [v_iconBitmap, 1])
	R.set_value(v_otherSlot, "m_IconBitmap", v_iconBitmap, "=")
	if R.truth(R.binary("==", (c).fields.get("m_SelectedCampaignAreaSlot"), v_slot)):
		pass
		(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(v_otherSlot, "MovieClip")
	else:
		pass
		if R.truth(R.binary("==", (c).fields.get("m_SelectedCampaignAreaSlot"), v_otherSlot)):
			pass
			(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(v_slot, "MovieClip")
	if R.truth((c).fields.get("m_SelectedCampaignAreaSlot")):
		pass
		(c).fields["m_SelectedArea"] = R.coerce(R.get_value(R.get_value(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "m_Areas"), R.get_value((c).fields.get("m_SelectedCampaignAreaSlot"), "m_iIndex")), "RDAreaInfo")
	return null


static func c1053_f_OnAcceptSave(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "PlayButtonSound", [])
	R.call_member(c, "AcceptSave", [])
	return null


static func c1053_f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	return false
	return null


static func c1053_f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_slotMC: Variant = null
	var v_areaSlot: Variant = null
	var v_patternInfo: Variant = null
	var v_campaignSlot: Variant = null
	var v_areaInfo: Variant = null
	var v_helpSlot: Variant = null
	var v_childMC: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_i = R.coerce(0, "int")
	v_slotMC = R.coerce(null, "MovieClip")
	v_areaSlot = R.coerce(null, "MovieClip")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_campaignSlot = R.coerce(null, "MovieClip")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_helpSlot = R.coerce(null, "MovieClip")
	v_childMC = R.coerce(null, "MovieClip")
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Saving as public means the file will available for other people to load and use in their own creations.  Saving as private will make the file only visible to you.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The goal type of the challenge determines how the player score will be determined.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines the goal target of the challenge.  This will be an indicator of what score to reach for the players.  Something to compare his own score with.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["With this option on, the player cannot steer and is doomed to driving in a straight line, at the mercy of all the obstacles in front of him.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Disable the brakes on the vehicle.  However, the player can still swerve, which slowly brakes.  See No Swerving below.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["With this option on, the player cannot swerve and is limited to using his regular brakes if they are enabled.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Prevent the player from switching the driver and the gunner, restraining him to his initial driver choice.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Makes the player start with all his four tires blown.  He can however fix them during the campaign if there is any garage.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Disable all ammo points.  Ammo points are army trucks and hummers.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Gives you infinite ammo for all your regular weapons.  Mounted weapons are unaffected by this option.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Disable the replenish option in special locations like the Weapon Crates and Police Stations.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["All weapons are disabled and the player can only rely his driving skills to survive.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Gives the player a mounted machine gun, installed by default on his vehicle.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Gives the player a mounted rocket launcher, installed by default on his vehicle.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Gives infinite ammo to mounted weapons, whether there are given by default or installed from a weapon crate while playing.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The enemy chopper cannot be destroyed.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Enables the fog mode for the whole campaign.  When on, this option overrides all the area's fog setting.  Fog mode greatly reduces your visibility.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The bounce factor affects how much bouncing you get from hitting obstacles.  The driver's toughness level also reduces the bouncing.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A multiplier for the player's speed where 0.5 means half speed, 1 means regular speed and 2 means double the speed.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Turns the ammo points into proximity pickups so all you need to do is drive nearby it to get the ammo instead of stopping and waiting for the ammo to be gathered.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global player vehicle HP multiplier where 0.5 means half HP, 1 means regular HP and 2 means double the HP.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global player body HP multiplier where 0.5 means half HP, 1 means regular HP and 2 means double the HP.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global zombie speed multiplier where 0.5 means half speed, 1 means regular speed and 2 means double the speed.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global zombie HP multiplier where 0.5 means half HP, 1 means regular HP and 2 means double the HP.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global oil slipperiness multiplier that affects how long the slipperiness lasts and how much control you lose.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A global impact speed loss multiplier that affects how much speed you lose when hitting objects. Be aware, this option is sensitive.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["a global vehicle HP multiplier where 0.5 is half the HP and 2 is twice the HP.  This option does not affect the player's HP.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["The starting time, in seconds, if you want to make your campaign a time trial. When set to 0, all the time values are unused.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how many patterns you must drive through to increase the difficulty level. It starts at 0 and is applied to all the additive properties.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base value of how much of the patterns' content is spawned. 0 means nothing is spawned, 0.5 means half the pattern's content and 1 means the full pattern.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive value of how much of the patterns's content is spawned. Additive values are added to the base values with each difficulty level.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base value of how much extra zombies are spawned from behind buildings and cars. 0 means no extra spawning and 2 means double the regular spawning.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive value of the extra spawning.  Additive values are added to the base values with each difficulty level.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel")]), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel")])), func(): return R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel")]))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines the difficulty level at which this will be allowed to spawn.  0 means it will spawn from the start while 4 means it will spawn at level 4 onward.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base delay, in seconds, before extra mutants are spawned.  They will spawn randomly from behind, front, sides, etc.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive delay, in seconds, before extra mutants are spawned.  Additive delays can be negative if you want to spawn mutants faster as the difficulty level increases.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base value of how many mutants, betwee 1 and 4, to spawn when the delay is reached.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive value of how many mutants to spawn when the delay is reached.  For exemple, 0.25 means 1 more mutant will be spawned at level 5 and so on.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base delay, in seconds, before Hellfire is dispatched to intercept and destroy the player.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive delay, in seconds, before Hellfire is dispatched. Additive delays can be negative if you want Hellfire to come more often as the difficulty level increases.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base Hellfire difficulty level. The level is from 1 to 10 and determines how much they're shooting, if they use missiles, etc.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive Hellfire difficulty level.  For exemple, 0.25 means Hellfire will be 1 level stronger every 5 difficulty levels.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base delay, in seconds, before a jet is dispatched to carpet bomb the player's location.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive delay, in seconds, before a jet is dispatched. Additive delays can be negative if you want to jets to come more often as the difficulty level increases.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Base value of how many bombings, between 1 and 3, the jet does before leaving.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Additive value of how many bombings the jet does before leaving.  For exemple, 0.1 means there will be 1 extra bombing every 10 difficulty levels.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Randomizes all the spawning values by adding +/- 10%.  So a total value of 20 will be randomized to a value between 18 and 22.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Spawns extra soldiers from the sides instead of zombies.  See Spawn Rate in the Difficulty tab.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Prevent any soldier zombie from spawning.  They will be replaced by random zombies or other types.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["With this option on, all zombies will spawn as soldier zombies.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["When a zombie or soldier collides with your vehicle, he or she will always cling to your hood.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Zombies will explode when destroyed or hit with the vehicle.  They will explode on the road and on your hood as well.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Disables the city background, leaving only the sky layer as background.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Disables the chopper support perk.  So the player will never be able to call in chopper support.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPrevious"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Go to the previous dialog line.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogNext"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Go to the next dialog line.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogAdd"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Add a new dialog line.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPreview"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Preview the selected audio cue for this dialog line.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Overrides the campaign's spawning parameters which are based on the difficulty progression.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Delay, in seconds, before extra mutants are spawned.  They will spawn randomly from behind, front, sides, etc.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how many mutants, between 1 and 4 to spawn when the delay is reached.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Delay, in seconds, before Hellfire is dispatched to intercept and destroy the player.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Hellfire difficulty level. The level is from 1 to 10 and determines how much they're shooting, if they use missiles, etc.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Delay, in seconds, before a jet is dispatched to carpet bomb the player's location.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how many bombings, between 1 and 3, the jet does before leaving.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Prevent any soldier zombie from spawning.  They will be replaced by random zombies or other types.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["With this option on, all zombies will spawn as soldier zombies.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how many patterns long the area is.  20 means the area will be 20 patterns long.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Allows you to select the ending type for the campaign.  Only the last area can specify the campaign's ending.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["A player speed multipier that is also applied in combination with the campaign's Player Speed Factor.  0.5 means half the speed and 2 means twice the speed.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Randomizes all the spawning values by adding +/- 10%.  So a total value of 20 will be randomized to a value between 18 and 22.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Forces the player into full speed without brakes or speed loss.  Can be combinaed nicely with the Player Speed Factor.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Enables the fog mode for the area.  Be aware than when the campaign's fog setting is on, this option has no effect.  Fog mode greatly reduces your visibility.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Lava"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Lava mode turns the side of the road into burning lava for the entire area.  When touching the lava, it will greatly damage your vehicle until you explode.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["This option makes the Lava mode even more deadly and kills you as soon as you touch the lava.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Forces the player to a complete stop for the amount of seconds specified.  When set to zero, there is no forced stop.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how much of the patterns' content is spawned. 0 means nothing is spawned, 0.5 means half the pattern's content and 1 means the full pattern.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines how much extra zombies are spawned from behind buildings and cars. 0 means no extra spawning and 2 means double the regular spawning.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Allows the area to use flipping to create more randomization.  That means patterns in the area will be flipped randomly.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Overrides the campaign's difficulty parameters which are based on the difficulty progression.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(((((((((R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier")) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"))) or R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier")))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines whether or not this can be spawned in this area.  Check Override Campaign Difficulty for this option to take effect.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Spawns extra soldiers from the sides instead of zombies.  See Spawn Rate in the Difficulty tab.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines the lower value of how many patterns long the group is.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.call_member(c, "TextPropertyIsTarget", [R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength")])):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines the upper value of how many patterns long the group is.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "Randomized"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines if the areas in the group will be randomized or in linear order.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "CanBeFirst"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Determines if this group can be spawned first in the campaign.  For exemple, you may not want to spawn in an alleyway.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(R.binary("==", R.get_value(v_event, "target"), R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "SelectChainableGroups"))):
		pass
		R.call_member((c).fields.get("m_Game"), "SetToolTip", ["Allows you to select which group can be spawned after this one.  This options allows you to create looping, structured and randomized challenge campaigns.", R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "DisplayObject", "RDEditorInterface"))])
		return true
	if R.truth(((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_SetThumbnail"))))):
		pass
		return true
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Load")))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_LoadPanelSlots"), "length"))):
			pass
			v_slotMC = R.coerce(R.get_value((c).fields.get("m_LoadPanelSlots"), v_i), "MovieClip")
			if R.truth(R.binary("==", R.get_value(v_event, "target"), v_slotMC)):
				pass
				if R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_LoadedFiles"), "length"))):
					pass
					R.call_member(c, "ShowLoadFileInfo", [v_i])
					return true
			v_i = R.signed32(v_i + 1)
	else:
		pass
		if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			v_i = R.coerce(0, "int")
			while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
				pass
				v_areaSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
				if R.truth((R.binary("==", R.get_value(v_event, "target"), v_areaSlot) and R.binary("<", R.get_value(v_areaSlot, "m_iIndex"), R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")))):
					pass
					v_patternInfo = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), R.get_value(v_areaSlot, "m_iIndex")), "RDPatternInfo")
					R.call_member(c, "ShowFileToolTip", [(v_patternInfo).fields.get("m_szName"), (v_patternInfo).fields.get("m_szAuthorName"), (v_patternInfo).fields.get("m_szDescription")])
					return true
				v_i = R.signed32(v_i + 1)
		else:
			pass
			if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
				pass
				v_i = R.coerce(0, "int")
				while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
					pass
					v_campaignSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
					if R.truth((R.binary("==", R.get_value(v_event, "target"), v_campaignSlot) and R.binary("<", R.get_value(v_campaignSlot, "m_iIndex"), R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length")))):
						pass
						v_areaInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), R.get_value(v_campaignSlot, "m_iIndex")), "RDAreaInfo")
						R.call_member(c, "ShowFileToolTip", [(v_areaInfo).fields.get("m_szName"), (v_areaInfo).fields.get("m_szAuthorName"), (v_areaInfo).fields.get("m_szDescription")])
						return true
					v_i = R.signed32(v_i + 1)
			else:
				pass
				if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Help")))):
					pass
					v_i = R.coerce(0, "int")
					while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_HelpSlots"), "length"))):
						pass
						v_helpSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_HelpSlots"), v_i), R.klass("MovieClip")), "MovieClip")
						if R.truth(R.binary("==", R.get_value(v_event, "target"), v_helpSlot)):
							pass
							R.call_member(c, "HighlightHelp", [v_helpSlot, true])
							return true
						v_i = R.signed32(v_i + 1)
				else:
					pass
					v_i = R.coerce(0, "int")
					while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "numChildren"))):
						pass
						v_childMC = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
						if R.truth(R.binary("==", R.get_value(v_event, "target"), v_childMC)):
							pass
							R.call_member(c, "ShowToolTip", [R.get_value(v_childMC, "m_szName")])
							return true
						v_i = R.signed32(v_i + 1)
	return false
	return null


static func c1053_f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_helpSlot: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_i = R.coerce(0, "int")
	v_helpSlot = R.coerce(null, "MovieClip")
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Help")))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_HelpSlots"), "length"))):
			pass
			v_helpSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_HelpSlots"), v_i), R.klass("MovieClip")), "MovieClip")
			if R.truth(R.binary("==", R.get_value(v_event, "target"), v_helpSlot)):
				pass
				R.call_member(c, "HighlightHelp", [v_helpSlot, false])
				return true
			v_i = R.signed32(v_i + 1)
	else:
		pass
		R.call_member(c, "ShowToolTip", [""])
		R.call_member(c, "ShowFileToolTip", ["", "", ""])
		R.call_member(c, "ShowLoadFileInfo", [R.unary("-", 1)])
	R.call_member((c).fields.get("m_Game"), "SetToolTip", [""])
	return false
	return null


static func c1053_f_ShowToolTip(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "visible", R.binary("!=", v_szText, ""), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "ToolTip"), "text", v_szText, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "BG"), "scaleX", R.binary("/", R.binary("+", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "ToolTip"), "textWidth"), 10), 10), "=")
	return null


static func c1053_f_ShowRoadSelector(c: Variant, a: Array) -> Variant:
	var v_bFirstPage: Variant = false
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_bFirstPage = false
	if R.truth(v_bShow):
		pass
		(c).fields["m_iRoadSelectorPage"] = R.coerce(v_iPage, "int")
		v_bFirstPage = (float((c).fields.get("m_iRoadSelectorPage")) == float(0))
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Town"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndPavement"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndGrass"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Grass"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "CrossingStreet"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Pavement"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "ForestPath"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Dirt"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndGrass"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndDirt"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "CrossingDirtRoad"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "GrassAndRoad"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Next"), "visible", v_bFirstPage, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Sand"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Concrete"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Snow"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Ice"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndRoad"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "DirtAndPavement"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndDirt"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Mud"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndRoad"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndPavement"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "PavementAndSnow"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "SnowAndDirtPath"), "visible", R.unary("!", v_bFirstPage), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "Previous"), "visible", R.unary("!", v_bFirstPage), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "RoadSelector"), "visible", v_bShow, "=")
	return null


static func c1053_f_OnEntitySelected(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	R.call_member(c, "ShowRoadSelector", [R.binary("!=", R.binary("as", v_entity, R.klass("RDRoadSlice")), null), (c).fields.get("m_iRoadSelectorPage")])
	R.call_member(c, "ShowPropertyPanel", [((v_entity).fields.get("m_Properties") if R.truth(v_entity) else null)])
	R.set_value(R.get_value((c).fields.get("m_MC"), "CannotPlaceIcon"), "visible", false, "=")
	return null


static func c1053_f_ShowPropertyPanel(c: Variant, a: Array) -> Variant:
	var v_propertySlot: Variant = null
	var v_i: Variant = 0
	var v_prop: Variant = null
	var v_props: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	v_propertySlot = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	v_prop = R.coerce(null, "RDProperty")
	while R.truth(R.binary(">", R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "numChildren"), 1)):
		pass
		v_propertySlot = R.coerce(R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "getChildAt"), [1]), "MovieClip")
		R.invoke(R.get_value(v_propertySlot, "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnPropertyMouseOver")])
		R.invoke(R.get_value(v_propertySlot, "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnPropertyMouseOut")])
		R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "removeChildAt"), [1])
	R.set_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "visible", false, "=")
	if R.truth(v_props):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "visible", true, "=")
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value(v_props, "length"))):
			pass
			v_prop = R.coerce(R.get_value(v_props, v_i), "RDProperty")
			if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
				pass
				v_propertySlot = R.coerce(R.construct(R.klass("MC_EditorPropertyValue"), []), "MovieClip")
				R.set_value(R.get_value(v_propertySlot, "Value"), "text", (v_prop).fields.get("m_fNumberValue"), "=")
			else:
				pass
				if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
					pass
					v_propertySlot = R.coerce(R.construct(R.klass("MC_EditorPropertyBoolean"), []), "MovieClip")
					R.set_value(R.get_value(v_propertySlot, "Check"), "visible", (v_prop).fields.get("m_bBooleanValue"), "=")
					R.set_value(v_propertySlot, "mouseChildren", false, "=")
				else:
					pass
					if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
						pass
						v_propertySlot = R.coerce(R.construct(R.klass("MC_EditorPropertyValue"), []), "MovieClip")
						R.set_value(R.get_value(v_propertySlot, "Value"), "text", (v_prop).fields.get("m_szStringValue"), "=")
			R.set_value(R.get_value(v_propertySlot, "Name"), "text", (v_prop).fields.get("m_szName"), "=")
			R.invoke(R.get_value(R.get_value(v_propertySlot, "BG"), "gotoAndStop"), [0])
			R.set_value(v_propertySlot, "m_Property", v_prop, "=")
			R.set_value(v_propertySlot, "buttonMode", true, "=")
			R.invoke(R.get_value(v_propertySlot, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnPropertyMouseOver"), false, 0, true])
			R.invoke(R.get_value(v_propertySlot, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnPropertyMouseOut"), false, 0, true])
			R.set_value(v_propertySlot, "y", (float((R.num(R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "numChildren")) - float(1))) * float(R.static_value("RDEditorInterface", "PropertySpacing"))), "=")
			R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "addChild"), [v_propertySlot])
			v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_OnPropertyMouseOver(c: Variant, a: Array) -> Variant:
	var v_propertySlot: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_propertySlot = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth((R.truth(v_propertySlot) and R.truth(R.get_value(v_propertySlot, "BG")))):
		pass
		R.invoke(R.get_value(R.get_value(v_propertySlot, "BG"), "gotoAndStop"), [2])
	else:
		pass
		v_propertySlot = R.coerce(R.binary("as", R.get_value(R.get_value(v_evt, "target"), "parent"), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.get_value(v_propertySlot, "BG")):
			pass
			R.invoke(R.get_value(R.get_value(v_propertySlot, "BG"), "gotoAndStop"), [2])
	return null


static func c1053_f_OnPropertyMouseOut(c: Variant, a: Array) -> Variant:
	var v_propertySlot: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_propertySlot = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth((R.truth(v_propertySlot) and R.truth(R.get_value(v_propertySlot, "BG")))):
		pass
		R.invoke(R.get_value(R.get_value(v_propertySlot, "BG"), "gotoAndStop"), [1])
	else:
		pass
		v_propertySlot = R.coerce(R.binary("as", R.get_value(R.get_value(v_evt, "target"), "parent"), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.get_value(v_propertySlot, "BG")):
			pass
			R.invoke(R.get_value(R.get_value(v_propertySlot, "BG"), "gotoAndStop"), [1])
	return null


static func c1053_f_FixNAN(c: Variant, a: Array) -> Variant:
	var v_fValue: Variant = NAN
	var v_szValue: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_fValue = float(R.num(v_szValue))
	if R.truth(R.invoke(R.resolve(c, "isNaN", "RDEditorInterface"), [v_fValue])):
		pass
		v_fValue = float(0)
	return v_fValue
	return null


static func c1053_f_OnPropertyTextChanged(c: Variant, a: Array) -> Variant:
	var v_iPreviousLength: Variant = 0
	var v_propertySlotText: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_iPreviousLength = R.coerce(0, "int")
	v_propertySlotText = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("TextField")), "TextField")
	if R.truth(v_propertySlotText):
		pass
		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), "Value"))):
			pass
			((c).fields.get("m_SelectedArea")).fields["m_szAreaName"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), "Value"), "text"), "String")
		else:
			pass
			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "Value"))):
				pass
				v_iPreviousLength = R.coerce(((c).fields.get("m_SelectedArea")).fields.get("m_iAreaLength"), "int")
				((c).fields.get("m_SelectedArea")).fields["m_iAreaLength"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "Value"), "text")])), float(1)), "int")
				if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iAreaLength")) != float(v_iPreviousLength))):
					pass
					R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
			else:
				pass
				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "Value"))):
					pass
					((c).fields.get("m_SelectedArea")).fields["m_fHellfireDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "Value"), "text")])), float(0)))
				else:
					pass
					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "Value"))):
						pass
						((c).fields.get("m_SelectedArea")).fields["m_iHellfireLevel"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "Value"), "text")]), 1, 10]), "int")
					else:
						pass
						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "Value"))):
							pass
							((c).fields.get("m_SelectedArea")).fields["m_fJetDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "Value"), "text")])), float(0)))
						else:
							pass
							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "Value"))):
								pass
								((c).fields.get("m_SelectedArea")).fields["m_iJetDrops"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "Value"), "text")]), 1, 3]), "int")
							else:
								pass
								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "Value"))):
									pass
									((c).fields.get("m_SelectedArea")).fields["m_fMutantDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "Value"), "text")])), float(0)))
								else:
									pass
									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "Value"))):
										pass
										((c).fields.get("m_SelectedArea")).fields["m_iMutantCount"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "Value"), "text")]), 1, 4]), "int")
									else:
										pass
										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "Value"))):
											pass
											((c).fields.get("m_SelectedArea")).fields["m_fPlayerSpeedFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text")])), float(0.1)))
										else:
											pass
											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "Value"))):
												pass
												((c).fields.get("m_SelectedArea")).fields["m_fForcedStopDuration"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "Value"), "text")])), float(0)))
											else:
												pass
												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "Value"))):
													pass
													((c).fields.get("m_SelectedArea")).fields["m_fPatternRatio"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "Value"), "text")]), 0, 1]), "Number")
												else:
													pass
													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "Value"))):
														pass
														((c).fields.get("m_SelectedArea")).fields["m_fSpawnRate"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "Value"), "text")]), 0, 2]), "Number")
													else:
														pass
														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText"), "Value"))):
															pass
															R.set_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogTexts"), (c).fields.get("m_iDialogPage"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText"), "Value"), "text"), "=")
														else:
															pass
															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName"), "Value"))):
																pass
																((c).fields.get("m_SelectedAreaGroup")).fields["m_szName"] = R.coerce(R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName"), "Value"), "text"), "String")
																R.set_value(R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "Name"), "text", (((c).fields.get("m_SelectedAreaGroup")).fields.get("m_szName") if R.truth(R.binary("!=", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_szName"), "")) else R.binary("+", "Group ", R.binary("+", R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "m_iIndex"), 1))), "=")
															else:
																pass
																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value"))):
																	pass
																	v_iPreviousLength = R.coerce(((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMinLength"), "int")
																	((c).fields.get("m_SelectedAreaGroup")).fields["m_iMinLength"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value"), "text")]), 1, ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMaxLength")]), "int")
																	if R.truth((float(((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMinLength")) != float(v_iPreviousLength))):
																		pass
																		R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
																else:
																	pass
																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value"))):
																		pass
																		v_iPreviousLength = R.coerce(((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMaxLength"), "int")
																		((c).fields.get("m_SelectedAreaGroup")).fields["m_iMaxLength"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value"), "text")])), float(((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMinLength"))), "int")
																		if R.truth((float(((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMaxLength")) != float(v_iPreviousLength))):
																			pass
																			R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
																	else:
																		pass
																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value"))):
																			pass
																			(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGoalTarget"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value"), "text")])), float(0)), "int")
																		else:
																			pass
																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value"))):
																				pass
																				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBounceFactor"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value"), "text")]), 0.1, 10]), "Number")
																			else:
																				pass
																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"))):
																					pass
																					(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fPlayerSpeedFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text")])), float(0.1)))
																				else:
																					pass
																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"))):
																						pass
																						(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fPlayerVehicleHPFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"), "text")])), float(0.1)))
																					else:
																						pass
																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"))):
																							pass
																							(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fPlayerBodyHPFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"), "text")])), float(0.1)))
																						else:
																							pass
																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"))):
																								pass
																								(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fZombieSpeedFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"), "text")])), float(0.1)))
																							else:
																								pass
																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"))):
																									pass
																									(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fZombieHPFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"), "text")])), float(0.1)))
																								else:
																									pass
																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"))):
																										pass
																										(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fOilSlipperinessFactor"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"), "text")]), 0.1, 10]), "Number")
																									else:
																										pass
																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"))):
																											pass
																											(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fImpactSpeedLossFactor"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"), "text")]), 0.1, 10]), "Number")
																										else:
																											pass
																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"))):
																												pass
																												(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fVehicleHPFactor"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"), "text")])), float(0.1)))
																											else:
																												pass
																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "Value"))):
																													pass
																													(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fStartingTime"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "Value"), "text")])), float(0)))
																												else:
																													pass
																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "Value"))):
																														pass
																														(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fZombieShotDownTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "Value"), "text")]), "Number")
																													else:
																														pass
																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "Value"))):
																															pass
																															(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fZombieHitTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "Value"), "text")]), "Number")
																														else:
																															pass
																															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "Value"))):
																																pass
																																(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fMutantKilledTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "Value"), "text")]), "Number")
																															else:
																																pass
																																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "Value"))):
																																	pass
																																	(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fClingerOffTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "Value"), "text")]), "Number")
																																else:
																																	pass
																																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "Value"))):
																																		pass
																																		(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fFeedersHitTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "Value"), "text")]), "Number")
																																	else:
																																		pass
																																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "Value"))):
																																			pass
																																			(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fCivilianShotDownTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "Value"), "text")]), "Number")
																																		else:
																																			pass
																																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "Value"))):
																																				pass
																																				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fCivilianHitTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "Value"), "text")]), "Number")
																																			else:
																																				pass
																																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "Value"))):
																																					pass
																																					(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fSoldierShotDownTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "Value"), "text")]), "Number")
																																				else:
																																					pass
																																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "Value"))):
																																						pass
																																						(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fSoldierHitTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "Value"), "text")]), "Number")
																																					else:
																																						pass
																																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "Value"))):
																																							pass
																																							(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fSoldierClingerOffTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "Value"), "text")]), "Number")
																																						else:
																																							pass
																																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "Value"))):
																																								pass
																																								(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fHellfireDefeatedTime"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "Value"), "text")]), "Number")
																																							else:
																																								pass
																																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), "Value"))):
																																									pass
																																									R.set_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), (c).fields.get("m_iDialogPage"), R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), "Value"), "text"), "=")
																																								else:
																																									pass
																																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "Value"))):
																																										pass
																																										(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iDifficultyLevelLength"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "Value"), "text")])), float(1)), "int")
																																									else:
																																										pass
																																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "Value"))):
																																											pass
																																											(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBasePatternRatio"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "Value"), "text")]), 0, 1]), "Number")
																																										else:
																																											pass
																																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "Value"))):
																																												pass
																																												(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditivePatternRatio"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "Value"), "text")]), "Number")
																																											else:
																																												pass
																																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "Value"))):
																																													pass
																																													(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseSpawnRate"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "Value"), "text")]), 0, 2]), "Number")
																																												else:
																																													pass
																																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "Value"))):
																																														pass
																																														(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveSpawnRate"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "Value"), "text")]), "Number")
																																													else:
																																														pass
																																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "Value"))):
																																															pass
																																															(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iSpikeSoldierLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "Value"), "text")])), float(0)), "int")
																																														else:
																																															pass
																																															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "Value"))):
																																																pass
																																																(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iBombSoldierLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "Value"), "text")])), float(0)), "int")
																																															else:
																																																pass
																																																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "Value"))):
																																																	pass
																																																	(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iOilLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "Value"), "text")])), float(0)), "int")
																																																else:
																																																	pass
																																																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "Value"))):
																																																		pass
																																																		(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iSpikeLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "Value"), "text")])), float(0)), "int")
																																																	else:
																																																		pass
																																																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "Value"))):
																																																			pass
																																																			(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iMineLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "Value"), "text")])), float(0)), "int")
																																																		else:
																																																			pass
																																																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "Value"))):
																																																				pass
																																																				(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iExplodingCarLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "Value"), "text")])), float(0)), "int")
																																																			else:
																																																				pass
																																																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "Value"))):
																																																					pass
																																																					(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iGrubLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "Value"), "text")])), float(0)), "int")
																																																				else:
																																																					pass
																																																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "Value"))):
																																																						pass
																																																						(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iZombieLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "Value"), "text")])), float(0)), "int")
																																																					else:
																																																						pass
																																																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "Value"))):
																																																							pass
																																																							(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_iBaseSoldierLevel"] = R.coerce(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "Value"), "text")])), float(0)), "int")
																																																						else:
																																																							pass
																																																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "Value"))):
																																																								pass
																																																								(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "Value"), "text")])), float(0)))
																																																							else:
																																																								pass
																																																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "Value"))):
																																																									pass
																																																									(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireDelay"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "Value"), "text")]), "Number")
																																																								else:
																																																									pass
																																																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "Value"))):
																																																										pass
																																																										(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireLevel"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "Value"), "text")]), 1, 10]), "Number")
																																																									else:
																																																										pass
																																																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "Value"))):
																																																											pass
																																																											(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireLevel"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "Value"), "text")]), "Number")
																																																										else:
																																																											pass
																																																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "Value"))):
																																																												pass
																																																												(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseJetDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "Value"), "text")])), float(0)))
																																																											else:
																																																												pass
																																																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "Value"))):
																																																													pass
																																																													(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDelay"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "Value"), "text")]), "Number")
																																																												else:
																																																													pass
																																																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "Value"))):
																																																														pass
																																																														(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseJetDrops"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "Value"), "text")]), 1, 3]), "Number")
																																																													else:
																																																														pass
																																																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "Value"))):
																																																															pass
																																																															(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDrops"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "Value"), "text")]), "Number")
																																																														else:
																																																															pass
																																																															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "Value"))):
																																																																pass
																																																																(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseMutantDelay"] = float(maxf(R.num(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "Value"), "text")])), float(0)))
																																																															else:
																																																																pass
																																																																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "Value"))):
																																																																	pass
																																																																	(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantDelay"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "Value"), "text")]), "Number")
																																																																else:
																																																																	pass
																																																																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "Value"))):
																																																																		pass
																																																																		(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fBaseMutantCount"] = R.coerce(R.call_static("Maths", "Clamp", [R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "Value"), "text")]), 1, 4]), "Number")
																																																																	else:
																																																																		pass
																																																																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "Value"))):
																																																																			pass
																																																																			(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantCount"] = R.coerce(R.call_member(c, "FixNAN", [R.get_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "Value"), "text")]), "Number")
	return null


static func c1053_f_OnPropertyTextLostFocus(c: Variant, a: Array) -> Variant:
	var v_propertySlotText: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_propertySlotText = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("TextField")), "TextField")
	if R.truth(v_propertySlotText):
		pass
		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "Value"))):
			pass
			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_iAreaLength"), "=")
		else:
			pass
			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "Value"))):
				pass
				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fHellfireDelay"), "=")
			else:
				pass
				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "Value"))):
					pass
					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_iHellfireLevel"), "=")
				else:
					pass
					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "Value"))):
						pass
						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fJetDelay"), "=")
					else:
						pass
						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "Value"))):
							pass
							R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_iJetDrops"), "=")
						else:
							pass
							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "Value"))):
								pass
								R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fMutantDelay"), "=")
							else:
								pass
								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "Value"))):
									pass
									R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_iMutantCount"), "=")
								else:
									pass
									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "Value"))):
										pass
										R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fPlayerSpeedFactor"), "=")
									else:
										pass
										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "Value"))):
											pass
											R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fForcedStopDuration"), "=")
										else:
											pass
											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "Value"))):
												pass
												R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fPatternRatio"), "=")
											else:
												pass
												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "Value"))):
													pass
													R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_fSpawnRate"), "=")
												else:
													pass
													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value"))):
														pass
														R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value"), "text", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMinLength"), "=")
													else:
														pass
														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value"))):
															pass
															R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value"), "text", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMaxLength"), "=")
														else:
															pass
															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value"))):
																pass
																R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget"), "=")
															else:
																pass
																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value"))):
																	pass
																	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor"), "=")
																else:
																	pass
																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"))):
																		pass
																		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor"), "=")
																	else:
																		pass
																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"))):
																			pass
																			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor"), "=")
																		else:
																			pass
																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"))):
																				pass
																				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor"), "=")
																			else:
																				pass
																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"))):
																					pass
																					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor"), "=")
																				else:
																					pass
																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"))):
																						pass
																						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor"), "=")
																					else:
																						pass
																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"))):
																							pass
																							R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor"), "=")
																						else:
																							pass
																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"))):
																								pass
																								R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor"), "=")
																							else:
																								pass
																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"))):
																									pass
																									R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor"), "=")
																								else:
																									pass
																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "Value"))):
																										pass
																										R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime"), "=")
																									else:
																										pass
																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "Value"))):
																											pass
																											R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime"), "=")
																										else:
																											pass
																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "Value"))):
																												pass
																												R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime"), "=")
																											else:
																												pass
																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "Value"))):
																													pass
																													R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime"), "=")
																												else:
																													pass
																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "Value"))):
																														pass
																														R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime"), "=")
																													else:
																														pass
																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "Value"))):
																															pass
																															R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime"), "=")
																														else:
																															pass
																															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "Value"))):
																																pass
																																R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime"), "=")
																															else:
																																pass
																																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "Value"))):
																																	pass
																																	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime"), "=")
																																else:
																																	pass
																																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "Value"))):
																																		pass
																																		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime"), "=")
																																	else:
																																		pass
																																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "Value"))):
																																			pass
																																			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime"), "=")
																																		else:
																																			pass
																																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "Value"))):
																																				pass
																																				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime"), "=")
																																			else:
																																				pass
																																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "Value"))):
																																					pass
																																					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime"), "=")
																																				else:
																																					pass
																																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "Value"))):
																																						pass
																																						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength"), "=")
																																					else:
																																						pass
																																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "Value"))):
																																							pass
																																							R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio"), "=")
																																						else:
																																							pass
																																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "Value"))):
																																								pass
																																								R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio"), "=")
																																							else:
																																								pass
																																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "Value"))):
																																									pass
																																									R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate"), "=")
																																								else:
																																									pass
																																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "Value"))):
																																										pass
																																										R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate"), "=")
																																									else:
																																										pass
																																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "Value"))):
																																											pass
																																											R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel"), "=")
																																										else:
																																											pass
																																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "Value"))):
																																												pass
																																												R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel"), "=")
																																											else:
																																												pass
																																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "Value"))):
																																													pass
																																													R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iOilLevel"), "=")
																																												else:
																																													pass
																																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "Value"))):
																																														pass
																																														R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel"), "=")
																																													else:
																																														pass
																																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "Value"))):
																																															pass
																																															R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel"), "=")
																																														else:
																																															pass
																																															if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "Value"))):
																																																pass
																																																R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel"), "=")
																																															else:
																																																pass
																																																if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "Value"))):
																																																	pass
																																																	R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel"), "=")
																																																else:
																																																	pass
																																																	if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "Value"))):
																																																		pass
																																																		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "=")
																																																	else:
																																																		pass
																																																		if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "Value"))):
																																																			pass
																																																			R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "=")
																																																		else:
																																																			pass
																																																			if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "Value"))):
																																																				pass
																																																				R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay"), "=")
																																																			else:
																																																				pass
																																																				if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "Value"))):
																																																					pass
																																																					R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay"), "=")
																																																				else:
																																																					pass
																																																					if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "Value"))):
																																																						pass
																																																						R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel"), "=")
																																																					else:
																																																						pass
																																																						if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "Value"))):
																																																							pass
																																																							R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel"), "=")
																																																						else:
																																																							pass
																																																							if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "Value"))):
																																																								pass
																																																								R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay"), "=")
																																																							else:
																																																								pass
																																																								if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "Value"))):
																																																									pass
																																																									R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay"), "=")
																																																								else:
																																																									pass
																																																									if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "Value"))):
																																																										pass
																																																										R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops"), "=")
																																																									else:
																																																										pass
																																																										if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "Value"))):
																																																											pass
																																																											R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops"), "=")
																																																										else:
																																																											pass
																																																											if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "Value"))):
																																																												pass
																																																												R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay"), "=")
																																																											else:
																																																												pass
																																																												if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "Value"))):
																																																													pass
																																																													R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay"), "=")
																																																												else:
																																																													pass
																																																													if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "Value"))):
																																																														pass
																																																														R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount"), "=")
																																																													else:
																																																														pass
																																																														if R.truth(R.binary("==", v_propertySlotText, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "Value"))):
																																																															pass
																																																															R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount"), "=")
	return null


static func c1053_f_OnAreaGroupMouseOver(c: Variant, a: Array) -> Variant:
	var v_groupButton: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_groupButton = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth(v_groupButton):
		pass
		R.invoke(R.get_value(v_groupButton, "gotoAndStop"), [(4 if R.truth(R.binary("==", v_groupButton, (c).fields.get("m_SelectedAreaGroupSlot"))) else 2)])
	return null


static func c1053_f_OnAreaGroupMouseOut(c: Variant, a: Array) -> Variant:
	var v_groupButton: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_groupButton = R.coerce(R.binary("as", R.get_value(v_evt, "target"), R.klass("MovieClip")), "MovieClip")
	if R.truth(v_groupButton):
		pass
		R.invoke(R.get_value(v_groupButton, "gotoAndStop"), [(3 if R.truth(R.binary("==", v_groupButton, (c).fields.get("m_SelectedAreaGroupSlot"))) else 1)])
	return null


static func c1053_f_SetMode(c: Variant, a: Array) -> Variant:
	var v_bShowTopMenu: Variant = false
	var v_bValidCampaign: Variant = false
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iMode"] = R.coerce(v_iMode, "int")
	v_bShowTopMenu = (((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))))
	R.set_value(R.get_value((c).fields.get("m_MC"), "Quit"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Patterns"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Areas"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Campaign"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToggleMusic"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Help"), "visible", v_bShowTopMenu, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ObjectsPanel"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ToolTip"), "visible", false, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PatternsUnderline"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PropertyPanel"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "ApplyPattern"), "visible", R.binary("!=", (c).fields.get("m_iPendingEditPatternIndex"), R.unary("-", 1)), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "visible", ((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))) or (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_SetThumbnail")))), "=")
	if R.truth(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "SetThumbnail"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "Cancel"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "Accept"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "NameTitle"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "NameValue"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "DescriptionTitle"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "DescriptionValue"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Save"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "SetThumbnailInterface"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_SetThumbnail"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "OK"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_SetThumbnail"))), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "SavePanel"), "PrivateOption"), "Check"), "visible", R.unary("!", (c).fields.get("m_bSavePrivate")), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Load"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PatternTypeDialog"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_PatternType"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreasUnderline"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "NoPatternMessage"), "visible", R.binary("==", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "EditPattern"), "alpha", 0.5, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaMenu"), "ApplyArea"), "visible", R.binary("!=", (c).fields.get("m_iPendingEditAreaIndex"), R.unary("-", 1)), "=")
	R.call_member(c, "ClearAreaPanelSelection", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
		pass
		R.call_member(c, "UpdateAreaList", [])
	v_bValidCampaign = (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) != float(R.static_value("RDCampaignInfo", "Type_Unset")))
	R.set_value(R.get_value((c).fields.get("m_MC"), "CampaignUnderline"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "visible", ((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and v_bValidCampaign), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "NoAreaMessage"), "visible", R.binary("==", R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"), 0), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "alpha", 0.5, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ShowGroups"), "visible", (R.unary("!", (c).fields.get("m_bShowAreaGroups")) and (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "HideGroups"), "visible", ((c).fields.get("m_bShowAreaGroups") and (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))), "=")
	R.call_member(c, "ShowAreaGroups", [((c).fields.get("m_bShowAreaGroups") and (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))), (c).fields.get("m_iAreaGroupsPage")])
	R.set_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "visible", false, "=")
	R.call_member(c, "ShowAreaPropertyPanel", [false])
	R.call_member(c, "ShowAreaGroupPropertyPanel", [false])
	R.call_member(c, "ShowCampaignPropertyPanel", [false])
	R.call_member(c, "ShowAreaTypePanel", [false])
	R.call_member(c, "ClearAreaPanelSelection", [])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "SaveCampaign"), "visible", v_bValidCampaign, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "TestCampaign"), "visible", v_bValidCampaign, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "Properties"), "visible", v_bValidCampaign, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignMenu"), "Randomize"), "visible", v_bValidCampaign, "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "NoCampaignHint"), "visible", ((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.unary("!", v_bValidCampaign)), "=")
	if R.truth(((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and v_bValidCampaign)):
		pass
		R.call_member(c, "UpdateCampaignList", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "CampaignTypeDialog"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_CampaignType"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PopulateBuildingsTypeDialog"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_PopulateBuildingsType"))), "=")
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Help")))):
		pass
		R.call_member(c, "ShowHelp", [R.unary("-", 1)])
	else:
		pass
		R.call_member(c, "HideHelp", [])
	R.set_value(R.get_value((c).fields.get("m_MC"), "PreviewInterface"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Preview"))), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "PassportPanel"), "visible", (float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_PassportLogin"))), "=")
	if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", false, "=")
	if R.truth((float((c).fields.get("m_iMode")) != float(R.static_value("RDEditorInterface", "Mode_Area")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", false, "=")
	R.call_member((c).fields.get("m_EditorMode"), "OnInterfaceModeSet", [v_iMode])
	if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
	else:
		pass
		if R.truth((float((c).fields.get("m_iMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
	R.call_member(c, "ShowWarningMessage", [""])
	if R.truth((float(v_iMode) != float(R.static_value("RDEditorInterface", "Mode_PassportLogin")))):
		pass
		if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenEditorTutorial"))):
			pass
			R.set_value(R.get_value((c).fields.get("m_MC"), "HelpTutorial"), "visible", true, "=")
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenEditorTutorial"] = true
			R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
	return null


static func c1053_f_OnPatternPosted(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
	return null


static func c1053_f_OnAreaPosted(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
	return null


static func c1053_f_OnCampaignPosted(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
	return null


static func c1053_f_LoadFiles(c: Variant, a: Array) -> Variant:
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bPrivate: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iSorting: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iPage: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	if R.truth((((R.binary("!=", (c).fields.get("m_iLastLoadDataType"), v_iDataType) or R.binary("!=", (c).fields.get("m_iLastLoadPrivate"), (1 if R.truth(v_bPrivate) else 0))) or R.binary("!=", (c).fields.get("m_iLastLoadSorting"), v_iSorting)) or R.binary("!=", (c).fields.get("m_iLastLoadPage"), v_iPage))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "LoadFiles", [v_iDataType, v_bPrivate, v_iSorting, v_iPage])
		(c).fields["m_iLastLoadDataType"] = R.coerce(v_iDataType, "*")
		(c).fields["m_iLastLoadPrivate"] = R.coerce((1 if R.truth(v_bPrivate) else 0), "*")
		(c).fields["m_iLastLoadSorting"] = R.coerce(v_iSorting, "*")
		(c).fields["m_iLastLoadPage"] = R.coerce(v_iPage, "*")
	return null


static func c1053_f_LoadPatterns(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bForce: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	(c).fields["m_iLoadPatternSorting"] = R.coerce(v_iSorting, "int")
	(c).fields["m_iLoadPage"] = R.coerce(v_iPage, "int")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PageNumber"), "text", R.binary("+", "Page ", (float(v_iPage) + float(1))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "visible", false, "=")
	if R.truth(v_bForce):
		pass
		(c).fields["m_iLastLoadPage"] = R.coerce(R.unary("-", 1), "*")
	R.call_member(c, "LoadFiles", [R.static_value("RDGameModeEditor", "DataType_Pattern"), (c).fields.get("m_bLoadPatternPrivate"), (c).fields.get("m_iLoadPatternSorting"), (c).fields.get("m_iLoadPage")])
	return null


static func c1053_f_LoadAreas(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bForce: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	(c).fields["m_iLoadAreaSorting"] = R.coerce(v_iSorting, "int")
	(c).fields["m_iLoadPage"] = R.coerce((R.unary("-", 1) if R.truth(v_bForce) else v_iPage), "int")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PageNumber"), "text", R.binary("+", "Page ", (float(v_iPage) + float(1))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "visible", false, "=")
	R.call_member(c, "LoadFiles", [R.static_value("RDGameModeEditor", "DataType_Area"), (c).fields.get("m_bLoadAreaPrivate"), (c).fields.get("m_iLoadAreaSorting"), v_iPage])
	return null


static func c1053_f_LoadCampaigns(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_bForce: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	(c).fields["m_iLoadCampaignSorting"] = R.coerce(v_iSorting, "int")
	(c).fields["m_iLoadPage"] = R.coerce((R.unary("-", 1) if R.truth(v_bForce) else v_iPage), "int")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PageNumber"), "text", R.binary("+", "Page ", (float(v_iPage) + float(1))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "visible", false, "=")
	R.call_member(c, "LoadFiles", [R.static_value("RDGameModeEditor", "DataType_Campaign"), (c).fields.get("m_bLoadCampaignPrivate"), (c).fields.get("m_iLoadCampaignSorting"), v_iPage])
	return null


static func c1053_f_SetLoadCategory(c: Variant, a: Array) -> Variant:
	var v_bSaved: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["m_bLoadPatternPrivate"] = v_bSaved
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["m_bLoadAreaPrivate"] = v_bSaved
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["m_bLoadCampaignPrivate"] = v_bSaved
	return null


static func c1053_f_SetSorting(c: Variant, a: Array) -> Variant:
	var v_iSorting: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["m_iLoadPatternSorting"] = R.coerce(v_iSorting, "int")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["m_iLoadAreaSorting"] = R.coerce(v_iSorting, "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["m_iLoadCampaignSorting"] = R.coerce(v_iSorting, "int")
	return null


static func c1053_f_ShowSortingMenu(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropYours"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRecent"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropBest"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropWorst"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropUnrated"), "visible", v_bShow, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "DropRandom"), "visible", v_bShow, "=")
	return null


static func c1053_f_ClearLoadPanelSlots(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = null
	var v_i: Variant = 0
	v_slotMC = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_LoadPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.get_value((c).fields.get("m_LoadPanelSlots"), v_i), "MovieClip")
		while R.truth(R.binary(">", R.get_value(v_slotMC, "numChildren"), 3)):
			pass
			R.invoke(R.get_value(v_slotMC, "removeChildAt"), [3])
		R.set_value(R.get_value(v_slotMC, "Highlight"), "visible", false, "=")
		R.set_value(R.get_value(v_slotMC, "Loading"), "visible", false, "=")
		R.set_value(v_slotMC, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_id: Variant = NAN
	var v_name: Variant = null
	var v_permalink: Variant = null
	var v_content: Variant = null
	var v_label: Variant = null
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_iType = R.coerce(0, "int")
	v_id = float(R.num(R.get_value(v_params, "id")))
	v_name = R.coerce(R.get_value(v_params, "name"), "String")
	v_permalink = R.coerce(R.get_value(v_params, "permalink"), "String")
	v_content = R.coerce(R.get_value(v_params, "content"), "String")
	v_label = R.coerce(R.get_value(v_params, "label"), "String")
	R.invoke(R.resolve(c, "trace", "RDEditorInterface"), [R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Campaign ", v_id), " ["), v_label), "] loaded: "), v_content)])
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
			R.call_member((c).fields.get("m_EditorMode"), "LoadPatternFileDataString", [v_content])
			R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Add")))):
				pass
				v_iType = R.coerce(R.call_member((c).fields.get("m_EditorMode"), "GetLoadedPatternTypeFromString", [v_content]), "int")
				if R.truth(R.call_member(c, "IsPatternTypeCompatibleWithArea", [v_iType])):
					pass
					R.call_member((c).fields.get("m_EditorMode"), "AddPatternInAreaFromString", [v_name, v_id, v_content])
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
					R.call_member(c, "UpdateAreaList", [true])
				else:
					pass
					R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
					R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
					R.call_member(c, "ShowWarningMessage", ["You cannot mix highway and non-highway patterns."])
		return true
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
		pass
		if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
			R.call_member((c).fields.get("m_EditorMode"), "LoadAreaFileDataString", [v_content])
			R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
			R.call_member(c, "UpdateAreaList", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Add")))):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "AddAreaInCampaignFromString", [v_name, v_id, v_content, (c).fields.get("m_iActiveAreaGroup")])
				if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
					pass
					R.call_member(c, "UpdateStoryEnding", [])
				R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
				R.call_member(c, "UpdateCampaignList", [true])
		return true
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "LoadCampaignFileDataString", [v_content])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
		(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
		R.call_member(c, "UpdateCampaignList", [])
		return true
	return null


static func c1053_f_OnConfirmationYes(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_areaInfo: Variant = null
	var v_iPendingEditPatternIndex: Variant = 0
	var v_iPendingEditAreaIndex: Variant = 0
	var v_iConfirmation: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iPendingEditPatternIndex = R.coerce(0, "int")
	v_iPendingEditAreaIndex = R.coerce(0, "int")
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_NewPattern")))):
		pass
		(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
		R.call_member((c).fields.get("m_EditorMode"), "NewPattern", [(c).fields.get("m_iPendingPatternType")])
		((c).fields.get("m_EditorMode")).fields["m_LoadedPatternFile"] = R.coerce(null, "com.newgrounds.SaveFile")
		R.call_member((c).fields.get("m_EditorMode"), "SpawnBGBuildings", [(c).fields.get("m_iPendingPatternType"), 0])
		R.call_member(c, "UpdateObjectCategory", [])
		R.call_member(c, "UpdatePopulateBuildings", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", false, "=")
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_LoadPattern")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Pattern")])
		if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "LoadPatternFileData", [(c).fields.get("m_iPendingLoadIndex")])
			R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Edit")))):
				pass
				v_patternInfo = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), (c).fields.get("m_iPendingEditPatternIndex")), "RDPatternInfo")
				R.call_member((c).fields.get("m_EditorMode"), "LoadPatternData", [(v_patternInfo).fields.get("m_Data")])
				if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenApplyTutorial"))):
					pass
					R.set_value(R.get_value((c).fields.get("m_MC"), "ApplyTutorial"), "visible", true, "=")
					(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenApplyTutorial"] = true
					R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_NewArea")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "NewArea", [])
		((c).fields.get("m_EditorMode")).fields["m_LoadedAreaFile"] = R.coerce(null, "com.newgrounds.SaveFile")
		(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
		R.call_member(c, "UpdateAreaList", [])
		R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", false, "=")
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_LoadArea")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
		if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Load")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "LoadAreaFileData", [(c).fields.get("m_iPendingLoadIndex")])
			R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadType")) == float(R.static_value("RDEditorInterface", "LoadType_Edit")))):
				pass
				v_areaInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), (c).fields.get("m_iPendingEditAreaIndex")), "RDAreaInfo")
				R.call_member((c).fields.get("m_EditorMode"), "LoadAreaData", [(v_areaInfo).fields.get("m_Data")])
				if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenApplyTutorial"))):
					pass
					R.set_value(R.get_value((c).fields.get("m_MC"), "ApplyTutorial"), "visible", true, "=")
					(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenApplyTutorial"] = true
					R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
		R.call_member(c, "UpdateAreaList", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_NewCampaign")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "NewCampaign", [(c).fields.get("m_iPendingCampaignType")])
		(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
		(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
		R.call_member(c, "UpdateCampaignList", [])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_General")])
		if R.truth(((float((c).fields.get("m_iPendingCampaignType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge"))) and R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenChallengeCampaignHint")))):
			pass
			R.set_value(R.get_value((c).fields.get("m_MC"), "ChallengeCampaignHint"), "visible", true, "=")
			(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenChallengeCampaignHint"] = true
			R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
		else:
			pass
			if R.truth(((float((c).fields.get("m_iPendingCampaignType")) == float(R.static_value("RDCampaignInfo", "Type_Story"))) and R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenStoryCampaignHint")))):
				pass
				R.set_value(R.get_value((c).fields.get("m_MC"), "StoryCampaignHint"), "visible", true, "=")
				(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenStoryCampaignHint"] = true
				R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_LoadCampaign")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "LoadCampaignFileData", [(c).fields.get("m_iPendingLoadIndex")])
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
		(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
		R.call_member(c, "UpdateCampaignList", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_OverwriteFile")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "AcceptOverwrite", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_ConfirmSave")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "AcceptSave", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_ApplyPattern")))):
		pass
		v_iPendingEditPatternIndex = R.coerce((c).fields.get("m_iPendingEditPatternIndex"), "int")
		(c).fields["m_iPendingEditPatternIndex"] = R.coerce(R.unary("-", 1), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
		R.call_member((c).fields.get("m_EditorMode"), "ApplyPattern", [v_iPendingEditPatternIndex])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_ApplyArea")))):
		pass
		v_iPendingEditAreaIndex = R.coerce((c).fields.get("m_iPendingEditAreaIndex"), "int")
		(c).fields["m_iPendingEditAreaIndex"] = R.coerce(R.unary("-", 1), "int")
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
		R.call_member((c).fields.get("m_EditorMode"), "ApplyArea", [v_iPendingEditAreaIndex, (c).fields.get("m_iActiveAreaGroup")])
		(c).fields["m_iActiveAreaGroup"] = R.coerce(0, "int")
		(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
		R.call_member(c, "UpdateCampaignList", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_DeletePatterns")))):
		pass
		R.call_member(c, "DeleteSelectedAreaPatterns", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_DeleteAreas")))):
		pass
		R.call_member(c, "DeleteSelectedCampaignAreas", [])
		return true
	if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_DeleteAreaGroup")))):
		pass
		R.call_member(c, "DeleteAreaGroup", [(c).fields.get("m_PendingDeleteAreaGroupSlot")])
	else:
		pass
		if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_ClearObjects")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "ClearEntities", [])
		else:
			pass
			if R.truth((float(v_iConfirmation) == float(R.static_value("RDGame", "Confirmation_DeleteFile")))):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "DeleteFile", [(c).fields.get("m_iPendingLoadIndex")])
	return false
	return null


static func c1053_f_ShowSavePanel(c: Variant, a: Array) -> Variant:
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iDataType"] = R.coerce(v_iDataType, "int")
	R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Save")])
	R.call_member(((c).fields.get("m_Game")).fields.get("m_FocusManager"), "setFocus", [null])
	return null


static func c1053_f_ShowLoadPanel(c: Variant, a: Array) -> Variant:
	var v_szFileCategory: Variant = null
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iLoadType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_szFileCategory = R.coerce(null, "String")
	(c).fields["m_iDataType"] = R.coerce(v_iDataType, "int")
	(c).fields["m_iLoadType"] = R.coerce(v_iLoadType, "int")
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Load")])
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "PreviewFile"), "visible", (float(v_iLoadType) == float(R.static_value("RDEditorInterface", "LoadType_Add"))), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "AddFile"), "visible", (float(v_iLoadType) == float(R.static_value("RDEditorInterface", "LoadType_Add"))), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "LoadFile"), "visible", (float(v_iLoadType) == float(R.static_value("RDEditorInterface", "LoadType_Load"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileName"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "AuthorName"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Description"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Rating"), "text", "", "=")
		if R.truth((float(v_iDataType) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
			pass
			R.call_member(c, "SetLoadCategory", [(c).fields.get("m_bLoadPatternPrivate")])
			R.call_member(c, "SetSorting", [(c).fields.get("m_iLoadPatternSorting")])
			R.call_member(c, "LoadPatterns", [(c).fields.get("m_iLoadPatternSorting")])
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "LoadTypeName"), "text", "Patterns", "=")
		else:
			pass
			if R.truth((float(v_iDataType) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
				pass
				R.call_member(c, "SetLoadCategory", [(c).fields.get("m_bLoadAreaPrivate")])
				R.call_member(c, "SetSorting", [(c).fields.get("m_iLoadAreaSorting")])
				R.call_member(c, "LoadAreas", [(c).fields.get("m_iLoadAreaSorting")])
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "LoadTypeName"), "text", "Areas", "=")
			else:
				pass
				if R.truth((float(v_iDataType) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
					pass
					R.call_member(c, "SetLoadCategory", [(c).fields.get("m_bLoadCampaignPrivate")])
					R.call_member(c, "SetSorting", [(c).fields.get("m_iLoadCampaignSorting")])
					R.call_member(c, "LoadCampaigns", [(c).fields.get("m_iLoadCampaignSorting")])
					R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "LoadTypeName"), "text", "Campaigns", "=")
					if R.truth(R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bSeenLoadCampaignHint"))):
						pass
						R.set_value(R.get_value((c).fields.get("m_MC"), "LoadCampaignHint"), "visible", true, "=")
						(R.static_value("RDPlayerInfo", "Instance")).fields["m_bSeenLoadCampaignHint"] = true
						R.call_member((c).fields.get("m_Game"), "SavePlayerInfo", [])
		R.call_member(c, "ShowSortingMenu", [false])
		R.call_member(c, "UpdateLoadPanel", [])
	else:
		pass
		if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
				pass
				v_szFileCategory = R.coerce("Patterns", "String")
			else:
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
					pass
					v_szFileCategory = R.coerce("Areas", "String")
				else:
					pass
					if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
						pass
						v_szFileCategory = R.coerce("Campaigns", "String")
			R.invoke(R.get_value(R.get_value(((c).fields.get("m_Game")).fields.get("m_KongregateAPI"), "sharedContent"), "browse"), [v_szFileCategory, "BY_OWN"])
		else:
			pass
			if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Load")])
	return null


static func c1053_f_RefreshLoadPanel(c: Variant, a: Array) -> Variant:
	var v_bForce: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.call_member((c).fields.get("m_EditorMode"), "CancelLoadFiles", [])
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.call_member(c, "LoadPatterns", [(c).fields.get("m_iLoadPatternSorting"), (c).fields.get("m_iLoadPage"), v_bForce])
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member(c, "LoadAreas", [(c).fields.get("m_iLoadAreaSorting"), (c).fields.get("m_iLoadPage"), v_bForce])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.call_member(c, "LoadCampaigns", [(c).fields.get("m_iLoadCampaignSorting"), (c).fields.get("m_iLoadPage"), v_bForce])
	return null


static func c1053_f_UpdateLoadPanel(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PrivateUnderline"), "visible", (c).fields.get("m_bLoadPatternPrivate"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PublicUnderline"), "visible", R.unary("!", (c).fields.get("m_bLoadPatternPrivate")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopYours"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Yours")))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRecent"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Recent")))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopBest"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Best")))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopWorst"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Worst")))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopUnrated"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Unrated")))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRandom"), "visible", (R.unary("!", (c).fields.get("m_bLoadPatternPrivate")) and (float((c).fields.get("m_iLoadPatternSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Random")))), "=")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PrivateUnderline"), "visible", (c).fields.get("m_bLoadAreaPrivate"), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PublicUnderline"), "visible", R.unary("!", (c).fields.get("m_bLoadAreaPrivate")), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopYours"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Yours")))), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRecent"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Recent")))), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopBest"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Best")))), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopWorst"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Worst")))), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopUnrated"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Unrated")))), "=")
			R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRandom"), "visible", (R.unary("!", (c).fields.get("m_bLoadAreaPrivate")) and (float((c).fields.get("m_iLoadAreaSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Random")))), "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PrivateUnderline"), "visible", (c).fields.get("m_bLoadCampaignPrivate"), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "PublicUnderline"), "visible", R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopYours"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Yours")))), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRecent"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Recent")))), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopBest"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Best")))), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopWorst"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Worst")))), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopUnrated"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Unrated")))), "=")
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "TopRandom"), "visible", (R.unary("!", (c).fields.get("m_bLoadCampaignPrivate")) and (float((c).fields.get("m_iLoadCampaignSorting")) == float(R.static_value("RDGameModeEditor", "Sorting_Random")))), "=")
	return null


static func c1053_f_AcceptSave(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_EditorMode"), "SaveFile", [(c).fields.get("m_iDataType"), (c).fields.get("m_bSavePrivate")])
	return null


static func c1053_f_ShowLoadFileMenu(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = null
	var v_file: Variant = null
	var v_iFileIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_slotMC = R.coerce(null, "MovieClip")
	v_file = R.coerce(null, "SaveFile")
	if R.truth(R.binary("==", v_iFileIndex, R.unary("-", 1))):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "visible", false, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "visible", false, "=")
	else:
		pass
		v_slotMC = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadPanelSlots"), v_iFileIndex), R.klass("MovieClip")), "MovieClip")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "visible", true, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "x", R.get_value(v_slotMC, "x"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Highlight"), "y", R.get_value(v_slotMC, "y"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "visible", true, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "x", R.get_value(v_slotMC, "x"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "y", R.get_value(v_slotMC, "y"), "=")
		v_file = R.coerce(R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_LoadedFiles"), v_iFileIndex), "SaveFile")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileMenu"), "DeleteFile"), "visible", R.binary("==", R.get_value(v_file, "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId")), "=")
	return null


static func c1053_f_ShowLoadFileInfo(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iFileIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(null, "SaveFile")
	if R.truth(R.binary("==", v_iFileIndex, R.unary("-", 1))):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileName"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "AuthorName"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Description"), "text", "", "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Rating"), "text", "", "=")
	else:
		pass
		v_file = R.coerce(R.get_value(((c).fields.get("m_EditorMode")).fields.get("m_LoadedFiles"), v_iFileIndex), "SaveFile")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "FileName"), "text", R.get_value(v_file, "name"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "AuthorName"), "text", R.binary("+", "by ", R.get_value(v_file, "authorName")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Description"), "text", R.get_value(v_file, "description"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "LoadPanel"), "Rating"), "text", R.binary("+", (R.get_value(R.get_value(v_file, "ratings"), "Rating") if R.truth(R.get_value(R.get_value(v_file, "ratings"), "Rating")) else "0.0"), "/5.0"), "=")
	return null


static func c1053_f_ShowFileToolTip(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_szAuthorName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	var v_szDescription: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	if R.truth(R.binary("!=", v_szName, "")):
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "visible", true, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "InfoBox"), "FileName"), "text", v_szName, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "InfoBox"), "AuthorName"), "text", R.binary("+", "by ", v_szAuthorName), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "InfoBox"), "Description"), "text", v_szDescription, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "InfoBox"), "Rating"), "text", "", "=")
	else:
		pass
		R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "visible", false, "=")
	return null


static func c1053_f_UpdateFileToolTip(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "x", R.call_static("Maths", "Clamp", [R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), R.binary("/", R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "width"), 2), (float((((c).fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(R.binary("/", R.get_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "width"), 2)))]), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "FileToolTip"), "y", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "=")
	return null


static func c1053_f_UpdateCannotPlaceIcon(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "CannotPlaceIcon"), "x", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "CannotPlaceIcon"), "y", R.get_value(((c).fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "=")
	return null


static func c1053_f_OnPreviewFile(c: Variant, a: Array) -> Variant:
	(c).fields["m_iPrePreviewMode"] = R.coerce((c).fields.get("m_iMode"), "int")
	R.call_member((c).fields.get("m_EditorMode"), "SaveData", [])
	R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Preview")])
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.call_member((c).fields.get("m_EditorMode"), "PreviewPattern", [(c).fields.get("m_iPendingLoadIndex")])
		R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "PreviewArea", [(c).fields.get("m_iPendingLoadIndex")])
			R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", R.call_member((c).fields.get("m_EditorMode"), "IsCurrentLoadedFileRateable", []), "=")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "PreviewCampaign", [(c).fields.get("m_iPendingLoadIndex")])
	return null


static func c1053_f_ExitPreview(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_EditorMode"), "EndPreview", [])
	R.call_member(c, "SetMode", [(c).fields.get("m_iPrePreviewMode")])
	return null


static func c1053_f_OnLoadFile(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_LoadPattern")])
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_LoadArea")])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_LoadCampaign")])
	return null


static func c1053_f_IsPatternTypeCompatibleWithArea(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_i: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
		pass
		v_patternInfo = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_i), "RDPatternInfo")
		if R.truth(R.binary("!=", (float(v_iType) == float(R.static_value("RDPatternInfo", "Type_Highway"))), (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway"))))):
			pass
			return false
		v_i = R.signed32(v_i + 1)
	return true
	return null


static func c1053_f_OnAddFile(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	v_iType = R.coerce(0, "int")
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		v_iType = R.coerce(R.call_member((c).fields.get("m_EditorMode"), "GetLoadedPatternType", [(c).fields.get("m_iPendingLoadIndex")]), "int")
		if R.truth(R.call_member(c, "IsPatternTypeCompatibleWithArea", [v_iType])):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "AddPatternInArea", [(c).fields.get("m_iPendingLoadIndex")])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
			R.call_member(c, "UpdateAreaList", [true])
		else:
			pass
			R.call_member((c).fields.get("m_Game"), "PlayErrorSound", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Area")])
			R.call_member(c, "ShowWarningMessage", ["You cannot mix highway and non-highway patterns."])
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member((c).fields.get("m_EditorMode"), "AddAreaInCampaign", [(c).fields.get("m_iPendingLoadIndex"), (c).fields.get("m_iActiveAreaGroup")])
			if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
				pass
				R.call_member(c, "UpdateStoryEnding", [])
			R.call_member(c, "SetMode", [R.static_value("RDEditorInterface", "Mode_Campaign")])
			R.call_member(c, "UpdateCampaignList", [true])
	return null


static func c1053_f_UpdateStoryEnding(c: Variant, a: Array) -> Variant:
	var v_area: Variant = null
	var v_lastArea: Variant = null
	var v_group: Variant = null
	v_area = R.coerce(null, "RDAreaInfo")
	v_lastArea = R.coerce(null, "RDAreaInfo")
	v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
	if R.truth(R.binary("==", R.get_value((v_group).fields.get("m_Areas"), "length"), 1)):
		pass
		v_area = R.coerce(R.get_value((v_group).fields.get("m_Areas"), 0), "RDAreaInfo")
		(v_area).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	else:
		pass
		if R.truth(R.binary(">=", R.get_value((v_group).fields.get("m_Areas"), "length"), 2)):
			pass
			v_lastArea = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))), "RDAreaInfo")
			if R.truth((float((v_lastArea).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_Normal")))):
				pass
				if R.truth((float((c).fields.get("m_iStoredStoryEnding")) != float(R.static_value("RDAreaInfo", "Type_Normal")))):
					pass
					(v_lastArea).fields["m_iType"] = R.coerce((c).fields.get("m_iStoredStoryEnding"), "int")
				else:
					pass
					v_area = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(2))), "RDAreaInfo")
					(v_lastArea).fields["m_iType"] = R.coerce(((v_area).fields.get("m_iType") if R.truth((float((v_area).fields.get("m_iType")) != float(R.static_value("RDAreaInfo", "Type_Normal")))) else R.static_value("RDAreaInfo", "Type_EndingBlackScreen")), "int")
					(v_area).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	(c).fields["m_iStoredStoryEnding"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	return null


static func c1053_f_StoreStoryEnding(c: Variant, a: Array) -> Variant:
	var v_area: Variant = null
	var v_group: Variant = null
	v_area = R.coerce(null, "RDAreaInfo")
	(c).fields["m_iStoredStoryEnding"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
	if R.truth(R.binary(">=", R.get_value((v_group).fields.get("m_Areas"), "length"), 1)):
		pass
		v_area = R.coerce(R.get_value((v_group).fields.get("m_Areas"), (R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))), "RDAreaInfo")
		(c).fields["m_iStoredStoryEnding"] = R.coerce((v_area).fields.get("m_iType"), "int")
	return null


static func c1053_f_ResetStoredStoryEnding(c: Variant, a: Array) -> Variant:
	(c).fields["m_iStoredStoryEnding"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	return null


static func c1053_f_OnDeleteFile(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_DeleteFile")])
	return null


static func c1053_f_UpdateAreaList(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_newPatternIcon: Variant = null
	var v_iconBitmapData: Variant = null
	var v_iconBitmap: Variant = null
	var v_i: Variant = 0
	var v_bGoToLastPage: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_newPatternIcon = R.coerce(null, "MovieClip")
	v_iconBitmapData = R.coerce(null, "BitmapData")
	v_iconBitmap = R.coerce(null, "Bitmap")
	(c).fields["m_iAreaPanelPage"] = R.coerce(0, "int")
	while R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "removeChildAt"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
		pass
		v_patternInfo = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_i), "RDPatternInfo")
		v_newPatternIcon = R.coerce(R.construct(R.klass("MC_EditorLoadPanelSlot"), []), "MovieClip")
		R.set_value(v_newPatternIcon, "buttonMode", true, "=")
		R.set_value(v_newPatternIcon, "mouseChildren", false, "=")
		R.set_value(R.get_value(v_newPatternIcon, "Highlight"), "visible", false, "=")
		R.set_value(R.get_value(v_newPatternIcon, "Loading"), "visible", false, "=")
		v_iconBitmapData = R.coerce(R.construct(R.klass("BitmapData"), [90, 90, false]), "BitmapData")
		R.set_value((v_patternInfo).fields.get("m_Icon"), "position", 0, "=")
		R.invoke(R.get_value(v_iconBitmapData, "setPixels"), [R.construct(R.klass("Rectangle"), [0, 0, 90, 90]), (v_patternInfo).fields.get("m_Icon")])
		v_iconBitmap = R.coerce(R.construct(R.klass("Bitmap"), [v_iconBitmapData]), "Bitmap")
		R.invoke(R.get_value(v_newPatternIcon, "addChildAt"), [v_iconBitmap, 1])
		R.set_value(v_newPatternIcon, "x", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren")) * float(R.static_value("RDEditorInterface", "AreaItemWidth"))), "=")
		R.set_value(v_newPatternIcon, "m_iIndex", v_i, "=")
		R.set_value(v_newPatternIcon, "scaleX", 0.95, "=")
		R.set_value(v_newPatternIcon, "scaleY", 0.95, "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "addChild"), [v_newPatternIcon])
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "x", R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollArea"), "x")), "=")
	(c).fields["m_fAreaPanelScroll"] = float(0)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollLeft"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollRight"), "visible", true, "=")
	if R.truth(v_bGoToLastPage):
		pass
		R.call_member(c, "GoToLastAreaPage", [])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "NoPatternMessage"), "visible", R.binary("==", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0), "=")
	return null


static func c1053_f_GoToPreviousAreaPage(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iAreaPanelPage")) > float(0))):
		pass
		R.set_value(c, "m_iAreaPanelPage", 1, "-=")
		(c).fields["m_fAreaPanelScroll"] = float((float((float((c).fields.get("m_iAreaPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "AreaItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fAreaPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollLeft"), "visible", (float((c).fields.get("m_iAreaPanelPage")) > float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollRight"), "visible", true, "=")
	return null


static func c1053_f_GoToNextAreaPage(c: Variant, a: Array) -> Variant:
	var v_iNbPages: Variant = 0
	v_iNbPages = R.coerce(ceilf(float(R.binary("/", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "width"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollArea"), "width")))), "int")
	if R.truth((float((c).fields.get("m_iAreaPanelPage")) < float((float(v_iNbPages) - float(1))))):
		pass
		R.set_value(c, "m_iAreaPanelPage", 1, "+=")
		(c).fields["m_fAreaPanelScroll"] = float((float((float((c).fields.get("m_iAreaPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "AreaItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fAreaPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollLeft"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollRight"), "visible", (float((c).fields.get("m_iAreaPanelPage")) < float((float(v_iNbPages) - float(1)))), "=")
	return null


static func c1053_f_GoToLastAreaPage(c: Variant, a: Array) -> Variant:
	var v_iLastPage: Variant = 0
	v_iLastPage = R.coerce(maxf(float(floorf(float(R.binary("/", (R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1)), 6)))), float(0)), "int")
	(c).fields["m_iAreaPanelPage"] = R.coerce(v_iLastPage, "int")
	(c).fields["m_fAreaPanelScroll"] = float((float((float((c).fields.get("m_iAreaPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "AreaItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fAreaPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollLeft"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ScrollRight"), "visible", false, "=")
	return null


static func c1053_f_ClearAreaPanelSelection(c: Variant, a: Array) -> Variant:
	var v_areaPanelSlot: Variant = null
	var v_i: Variant = 0
	v_areaPanelSlot = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		R.set_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible", false, "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_SelectedAreaPatternSlot"] = R.coerce(null, "MovieClip")
	return null


static func c1053_f_GetSelectedAreaPatterns(c: Variant, a: Array) -> Variant:
	var v_areaPanelSlot: Variant = null
	var v_iNbSelected: Variant = 0
	var v_i: Variant = 0
	v_areaPanelSlot = R.coerce(null, "MovieClip")
	v_iNbSelected = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.get_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible")):
			pass
			v_iNbSelected = R.signed32(v_iNbSelected + 1)
		v_i = R.signed32(v_i + 1)
	return v_iNbSelected
	return null


static func c1053_f_DeleteSelectedAreaPatterns(c: Variant, a: Array) -> Variant:
	var v_bDeleted: Variant = false
	var v_i: Variant = null
	var v_areaPanelSlot: Variant = null
	v_bDeleted = false
	v_i = R.coerce(0, "*")
	v_areaPanelSlot = R.coerce(null, "MovieClip")
	if R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"), 0)):
		pass
		v_bDeleted = false
		v_i = R.coerce(R.coerce((R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren")) - float(1)), "int"), "*")
		while R.truth(R.binary(">=", v_i, 0)):
			pass
			v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
			if R.truth(R.get_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible")):
				pass
				R.invoke(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "splice"), [v_i, 1])
				R.call_member((c).fields.get("m_EditorMode"), "ResetAreaPatternIndices", [])
				v_bDeleted = true
			v_i = R.coerce(R.num(v_i) - 1, "*")
		if R.truth(v_bDeleted):
			pass
			R.call_member(c, "UpdateAreaList", [(float((c).fields.get("m_iAreaPanelPage")) > float(maxf(float(floorf(float(R.binary("/", (R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1)), 6)))), float(0))))])
			if R.truth(R.binary("==", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)):
				pass
				R.call_member((c).fields.get("m_EditorMode"), "NewArea", [])
			R.call_member((c).fields.get("m_EditorMode"), "ResetAreaSpawning", [])
	return null


static func c1053_f_SelectAllAreaPatterns(c: Variant, a: Array) -> Variant:
	var v_areaPanelSlot: Variant = null
	var v_iIndex: Variant = 0
	var v_i: Variant = 0
	v_areaPanelSlot = R.coerce(null, "MovieClip")
	v_iIndex = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_areaPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		v_iIndex = R.coerce(R.coerce(R.get_value(v_areaPanelSlot, "m_iIndex"), "int"), "int")
		if R.truth(R.binary("<", v_iIndex, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
			pass
			R.set_value(R.get_value(v_areaPanelSlot, "Highlight"), "visible", true, "=")
		v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_UpdateCampaignList(c: Variant, a: Array) -> Variant:
	var v_areaInfo: Variant = null
	var v_newAreaIcon: Variant = null
	var v_c: Variant = 0
	var v_iconBitmapData: Variant = null
	var v_iconBitmap: Variant = null
	var v_interactive: Variant = null
	var v_i: Variant = 0
	var v_bGoToLastPage: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_newAreaIcon = R.coerce(null, "MovieClip")
	v_c = R.coerce(0, "int")
	v_iconBitmapData = R.coerce(null, "BitmapData")
	v_iconBitmap = R.coerce(null, "Bitmap")
	v_interactive = R.coerce(null, "InteractiveObject")
	(c).fields["m_iCampaignPanelPage"] = R.coerce(0, "int")
	while R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"), 0)):
		pass
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "removeChildAt"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"))):
		pass
		v_areaInfo = R.coerce(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), v_i), "RDAreaInfo")
		v_newAreaIcon = R.coerce(R.construct(R.klass("MC_EditorCampaignAreaSlot"), []), "MovieClip")
		R.set_value(v_newAreaIcon, "buttonMode", true, "=")
		v_c = R.coerce(0, "int")
		while R.truth(R.binary("<", v_c, R.get_value(v_newAreaIcon, "numChildren"))):
			pass
			v_interactive = R.coerce(R.binary("as", R.invoke(R.get_value(v_newAreaIcon, "getChildAt"), [v_c]), R.resolve(c, "InteractiveObject", "RDEditorInterface")), "InteractiveObject")
			if R.truth(((R.truth(v_interactive) and R.truth(R.binary("!=", v_interactive, R.get_value(v_newAreaIcon, "MoveLeft")))) and R.binary("!=", v_interactive, R.get_value(v_newAreaIcon, "MoveRight")))):
				pass
				R.set_value(v_interactive, "mouseEnabled", false, "=")
			v_c = R.signed32(v_c + 1)
		R.set_value(R.get_value(v_newAreaIcon, "Highlight"), "visible", false, "=")
		v_iconBitmapData = R.coerce(R.construct(R.klass("BitmapData"), [90, 90, false]), "BitmapData")
		R.set_value((v_areaInfo).fields.get("m_Icon"), "position", 0, "=")
		R.invoke(R.get_value(v_iconBitmapData, "setPixels"), [R.construct(R.klass("Rectangle"), [0, 0, 90, 90]), (v_areaInfo).fields.get("m_Icon")])
		v_iconBitmap = R.coerce(R.construct(R.klass("Bitmap"), [v_iconBitmapData]), "Bitmap")
		R.invoke(R.get_value(v_newAreaIcon, "addChildAt"), [v_iconBitmap, 1])
		R.set_value(v_newAreaIcon, "m_IconBitmap", v_iconBitmap, "=")
		R.set_value(v_newAreaIcon, "x", (R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren")) * float(R.static_value("RDEditorInterface", "CampaignItemWidth"))), "=")
		R.set_value(v_newAreaIcon, "m_iIndex", v_i, "=")
		R.set_value(v_newAreaIcon, "scaleX", 0.9, "=")
		R.set_value(v_newAreaIcon, "scaleY", 0.9, "=")
		R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "addChild"), [v_newAreaIcon])
		v_i = R.signed32(v_i + 1)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "x", R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollArea"), "x")), "=")
	(c).fields["m_fCampaignPanelScroll"] = float(0)
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollLeft"), "visible", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollRight"), "visible", true, "=")
	if R.truth(v_bGoToLastPage):
		pass
		R.call_member(c, "GoToLastCampaignPage", [])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "NoAreaMessage"), "visible", R.binary("==", R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"), 0), "=")
	return null


static func c1053_f_GoToPreviousCampaignPage(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iCampaignPanelPage")) > float(0))):
		pass
		R.set_value(c, "m_iCampaignPanelPage", 1, "-=")
		(c).fields["m_fCampaignPanelScroll"] = float((float((float((c).fields.get("m_iCampaignPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "CampaignItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fCampaignPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollLeft"), "visible", (float((c).fields.get("m_iCampaignPanelPage")) > float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollRight"), "visible", true, "=")
	return null


static func c1053_f_GoToNextCampaignPage(c: Variant, a: Array) -> Variant:
	var v_iNbPages: Variant = 0
	v_iNbPages = R.coerce(ceilf(float(R.binary("/", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "width"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollArea"), "width")))), "int")
	if R.truth((float((c).fields.get("m_iCampaignPanelPage")) < float((float(v_iNbPages) - float(1))))):
		pass
		R.set_value(c, "m_iCampaignPanelPage", 1, "+=")
		(c).fields["m_fCampaignPanelScroll"] = float((float((float((c).fields.get("m_iCampaignPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "CampaignItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fCampaignPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollLeft"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollRight"), "visible", (float((c).fields.get("m_iCampaignPanelPage")) < float((float(v_iNbPages) - float(1)))), "=")
	return null


static func c1053_f_GoToLastCampaignPage(c: Variant, a: Array) -> Variant:
	var v_iLastPage: Variant = 0
	v_iLastPage = R.coerce(maxf(float(floorf(float(R.binary("/", (R.num(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length")) - float(1)), 6)))), float(0)), "int")
	(c).fields["m_iCampaignPanelPage"] = R.coerce(v_iLastPage, "int")
	(c).fields["m_fCampaignPanelScroll"] = float((float((float((c).fields.get("m_iCampaignPanelPage")) * float(6))) * float(R.static_value("RDEditorInterface", "CampaignItemWidth"))))
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "x", (R.num(R.binary("+", R.static_value("RDEditorInterface", "ContainerPanelMargin"), R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollArea"), "x"))) - float((c).fields.get("m_fCampaignPanelScroll"))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollLeft"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ScrollRight"), "visible", false, "=")
	return null


static func c1053_f_ClearCampaignPanelSelection(c: Variant, a: Array) -> Variant:
	var v_campaignPanelSlot: Variant = null
	var v_i: Variant = 0
	v_campaignPanelSlot = R.coerce(null, "MovieClip")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		R.set_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible", false, "=")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(null, "MovieClip")
	(c).fields["m_SelectedArea"] = R.coerce(null, "RDAreaInfo")
	return null


static func c1053_f_GetSelectedCampaignAreas(c: Variant, a: Array) -> Variant:
	var v_campaignPanelSlot: Variant = null
	var v_iNbSelected: Variant = 0
	var v_i: Variant = 0
	v_campaignPanelSlot = R.coerce(null, "MovieClip")
	v_iNbSelected = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		if R.truth(R.get_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible")):
			pass
			v_iNbSelected = R.signed32(v_iNbSelected + 1)
		v_i = R.signed32(v_i + 1)
	return v_iNbSelected
	return null


static func c1053_f_DeleteSelectedCampaignAreas(c: Variant, a: Array) -> Variant:
	var v_bDeleted: Variant = false
	var v_i: Variant = null
	var v_campaignPanelSlot: Variant = null
	v_bDeleted = false
	v_i = R.coerce(0, "*")
	v_campaignPanelSlot = R.coerce(null, "MovieClip")
	if R.truth(R.binary(">", R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"), 0)):
		pass
		if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
			pass
			R.call_member(c, "StoreStoryEnding", [])
		v_bDeleted = false
		v_i = R.coerce(R.coerce((R.num(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren")) - float(1)), "int"), "*")
		while R.truth(R.binary(">=", v_i, 0)):
			pass
			v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
			if R.truth(R.get_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible")):
				pass
				R.invoke(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "splice"), [v_i, 1])
				R.call_member((c).fields.get("m_EditorMode"), "ResetGroupAreaIndices", [(c).fields.get("m_ActiveAreaGroup")])
				v_bDeleted = true
				if R.truth(R.binary("==", v_campaignPanelSlot, (c).fields.get("m_SelectedCampaignAreaSlot"))):
					pass
					(c).fields["m_SelectedCampaignAreaSlot"] = R.coerce(null, "MovieClip")
					(c).fields["m_SelectedArea"] = R.coerce(null, "RDAreaInfo")
					R.call_member(c, "ShowAreaPropertyPanel", [false])
					R.call_member(c, "ShowDialogPicker", [false])
					R.call_member(c, "ShowAreaTypePanel", [false])
			v_i = R.coerce(R.num(v_i) - 1, "*")
		if R.truth(v_bDeleted):
			pass
			R.call_member(c, "UpdateCampaignList", [(float((c).fields.get("m_iCampaignPanelPage")) > float(maxf(float(floorf(float(R.binary("/", (R.num(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length")) - float(1)), 6)))), float(0))))])
			if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
				pass
				R.call_member(c, "UpdateStoryEnding", [])
			R.call_member((c).fields.get("m_EditorMode"), "ResetCampaignSpawning", [])
		else:
			pass
			if R.truth((float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
				pass
				R.call_member(c, "ResetStoredStoryEnding", [])
	return null


static func c1053_f_SelectAllCampaignPatterns(c: Variant, a: Array) -> Variant:
	var v_campaignPanelSlot: Variant = null
	var v_iIndex: Variant = 0
	var v_i: Variant = 0
	v_campaignPanelSlot = R.coerce(null, "MovieClip")
	v_iIndex = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "numChildren"))):
		pass
		v_campaignPanelSlot = R.coerce(R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "ObjectsContainer"), "getChildAt"), [v_i]), R.klass("MovieClip")), "MovieClip")
		v_iIndex = R.coerce(R.coerce(R.get_value(v_campaignPanelSlot, "m_iIndex"), "int"), "int")
		if R.truth(R.binary("<", v_iIndex, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"))):
			pass
			R.set_value(R.get_value(v_campaignPanelSlot, "Highlight"), "visible", true, "=")
		v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_ShowAreaPropertyPanel(c: Variant, a: Array) -> Variant:
	var v_bIsStoryCampaign: Variant = false
	var v_bIsLastArea: Variant = false
	var v_bGeneral: Variant = false
	var v_bSpawning: Variant = false
	var v_bDialog: Variant = false
	var v_bDifficulty: Variant = false
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 1), "int")
	var v_bResetPage: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v_bIsStoryCampaign = false
	v_bIsLastArea = false
	v_bGeneral = false
	v_bSpawning = false
	v_bDialog = false
	v_bDifficulty = false
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		(c).fields["m_iAreaPropertyPage"] = R.coerce(v_iPage, "int")
		v_bIsStoryCampaign = (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))
		v_bIsLastArea = (R.binary(">=", R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"), 2) and R.binary("==", R.get_value((c).fields.get("m_SelectedCampaignAreaSlot"), "m_iIndex"), (R.num(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length")) - float(1))))
		v_bGeneral = (float((c).fields.get("m_iAreaPropertyPage")) == float(R.static_value("RDEditorInterface", "AreaPropertyPage_General")))
		v_bSpawning = (float((c).fields.get("m_iAreaPropertyPage")) == float(R.static_value("RDEditorInterface", "AreaPropertyPage_Spawning")))
		v_bDialog = (float((c).fields.get("m_iAreaPropertyPage")) == float(R.static_value("RDEditorInterface", "AreaPropertyPage_Dialog")))
		v_bDifficulty = (float((c).fields.get("m_iAreaPropertyPage")) == float(R.static_value("RDEditorInterface", "AreaPropertyPage_Difficulty")))
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "GeneralUnderline"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawningUnderline"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogUnderline"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DifficultyUnderline"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Dialog"), "visible", v_bIsStoryCampaign, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaMode"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "visible", v_bGeneral, "=")
		R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), v_bIsStoryCampaign, false])
		R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"), (v_bIsStoryCampaign and v_bIsLastArea), false])
		R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), v_bIsStoryCampaign, true])
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaName"), "Value"), "text", ((c).fields.get("m_SelectedArea")).fields.get("m_szAreaName"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaLength"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_iAreaLength")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllowFlip"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllowFlip"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AreaType"), "Value"), "text", R.call_static("RDAreaInfo", "GetTypeName", [((c).fields.get("m_SelectedArea")).fields.get("m_iType")]), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fPlayerSpeedFactor")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaMode"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "LavaInstantKill"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bLavaInstantKill"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Fog"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFog"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FullSpeedMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFullSpeedMode"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ForcedStopDuration"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fForcedStopDuration")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideSpawning"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideSpawning"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireDelay"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fHellfireDelay")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "HellfireLevel"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_iHellfireLevel")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDelay"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fJetDelay")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "JetDrops"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_iJetDrops")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantDelay"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fMutantDelay")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "MutantCount"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_iMutantCount")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "RandomizeSpawningValues"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bRandomizeSpawningValues"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "NoSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bNoSoldierZombie"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "AllSoldierZombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bAllSoldierZombie"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "FUBARMode"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bFUBARMode"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "OverrideDifficulty"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOverrideDifficulty"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "PatternRatio"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fPatternRatio")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpawnRate"), "Value"), "text", R.binary("+", "", ((c).fields.get("m_SelectedArea")).fields.get("m_fSpawnRate")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "SpikeSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpikeSoldier"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BombSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bBombSoldier"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Oil"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bOil"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Spike"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bSpike"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Mine"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bMine"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "ExplodingCar"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bExplodingCar"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Grub"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bGrub"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "Zombie"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bZombie"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "BaseSoldier"), "Check"), "visible", ((c).fields.get("m_SelectedArea")).fields.get("m_bBaseSoldier"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPrevious"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogNext"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPage"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogAdd"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPreview"), "visible", (v_bIsStoryCampaign and v_bDialog), "=")
		if R.truth(v_bResetPage):
			pass
			(c).fields["m_iDialogPage"] = R.coerce(0, "int")
		R.call_member(c, "UpdateDialogPage", [false])
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_AreaProperty")])
	return null


static func c1053_f_ShowAreaGroupPropertyPanel(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "GroupName"), "Value"), "text", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_szName"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MinLength"), "Value"), "text", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMinLength"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "MaxLength"), "Value"), "text", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_iMaxLength"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "Randomized"), "Check"), "visible", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bRandomized"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaGroupPropertyPanel"), "CanBeFirst"), "Check"), "visible", ((c).fields.get("m_SelectedAreaGroup")).fields.get("m_bCanBeFirst"), "=")
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_AreaGroupProperty")])
	else:
		pass
		if R.truth((c).fields.get("m_SelectedAreaGroupSlot")):
			pass
			R.invoke(R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "gotoAndStop"), [1])
		R.call_member(c, "ResetAreaGroupSelection", [])
		R.call_member(c, "UpdateAreaGroupButtons", [])
	return null


static func c1053_f_ShowCampaignPropertyPanel(c: Variant, a: Array) -> Variant:
	var v_bIsStoryCampaign: Variant = false
	var v_bGeneral: Variant = false
	var v_bWeapons: Variant = false
	var v_bTime: Variant = false
	var v_bDialog: Variant = false
	var v_bControls: Variant = false
	var v_bDifficulty: Variant = false
	var v_bSpawning: Variant = false
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 1), "int")
	var v_bResetPage: Variant = R.coerce((a[2] if a.size() > 2 else true), "Boolean")
	v_bIsStoryCampaign = false
	v_bGeneral = false
	v_bWeapons = false
	v_bTime = false
	v_bDialog = false
	v_bControls = false
	v_bDifficulty = false
	v_bSpawning = false
	R.set_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		(c).fields["m_iCampaignPropertyPage"] = R.coerce(v_iPage, "int")
		v_bIsStoryCampaign = (float((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))
		v_bGeneral = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_General")))
		v_bWeapons = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Weapons")))
		v_bTime = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Time")))
		v_bDialog = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Dialog")))
		v_bControls = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Controls")))
		v_bDifficulty = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Difficulty")))
		v_bSpawning = (float((c).fields.get("m_iCampaignPropertyPage")) == float(R.static_value("RDEditorInterface", "CampaignPropertyPage_Spawning")))
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GeneralUnderline"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "WeaponsUnderline"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TimeUnderline"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogUnderline"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ControlsUnderline"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyUnderline"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpawningUnderline"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Dialog"), "visible", R.unary("!", v_bIsStoryCampaign), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"), "visible", v_bGeneral, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CampaignType"), "Value"), "text", R.call_static("RDCampaignInfo", "GetTypeName", [(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iType")]), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"), "Value"), "text", R.call_static("RDCampaignInfo", "GetGoalName", [(((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iGoal")]), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InvincibleHellfire"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ArcadeAmmoPickup"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerVehicleHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerBodyHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieSpeedFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "VehicleHPFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingZombies"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AlwaysCling"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "Fog"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFog"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBackgroundCity"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoChopperSupport"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport"), "=")
		R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalType"), R.unary("!", v_bIsStoryCampaign), false])
		R.call_member(c, "EnableProperty", [R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GoalTarget"), R.unary("!", v_bIsStoryCampaign), true])
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), "visible", v_bWeapons, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoWeapons"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoAmmoPoints"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoReplenish"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteAmmo"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedMG"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MountedRocketLauncher"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "InfiniteMountedWeapon"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "visible", v_bTime, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "StartingTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MutantKilledTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ClingerOffTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FeedersHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "CivilianHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierShotDownTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierHitTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SoldierClingerOffTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "HellfireDefeatedTime"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "visible", v_bDifficulty, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DifficultyLevelLength"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BasePatternRatio"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditivePatternRatio"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSpawnRate"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveSpawnRate"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BombSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iOilLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "SpikeLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "MineLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ExplodingCarLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "GrubLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ZombieLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseSoldierLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"), "visible", v_bSpawning, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseHellfireLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveHellfireLevel"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseJetDrops"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveJetDrops"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantDelay"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BaseMutantCount"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AdditiveMutantCount"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "RandomizeSpawningValues"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSoldierZombie"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "AllSoldierZombie"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "FUBARMode"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "visible", v_bControls, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "TiresBlown"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "BounceFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "PlayerSpeedFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoDriverSwitch"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSteering"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoBraking"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "NoSwerving"), "Check"), "visible", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "ImpactSpeedLossFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor"), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "OilSlipperinessFactor"), "Value"), "text", (((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPrevious"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogNext"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPage"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogAdd"), "visible", v_bDialog, "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPreview"), "visible", v_bDialog, "=")
		if R.truth(v_bResetPage):
			pass
			(c).fields["m_iDialogPage"] = R.coerce(0, "int")
		R.call_member(c, "UpdateDialogPage", [true])
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_CampaignProperty")])
	return null


static func c1053_f_ShowChainableGroups(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	R.set_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		(c).fields["m_iChainableGroupsPage"] = R.coerce(v_iPage, "int")
		R.call_member(c, "UpdateChainableGroupButtons", [])
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_ChainableGroups")])
	return null


static func c1053_f_ShowGoalTypePanel(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	R.set_value(R.get_value((c).fields.get("m_MC"), "GoalTypePanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_GoalType")])
	return null


static func c1053_f_UpdateChainableGroupButtons(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group1"), (float((c).fields.get("m_iChainableGroupsPage")) * float(6))])
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group2"), (float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(1))])
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group3"), (float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(2))])
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group4"), (float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(3))])
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group5"), (float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(4))])
	R.call_member(c, "SetChainableGroupButton", [R.get_value(R.get_value((c).fields.get("m_MC"), "ChainableGroupsPanel"), "Group6"), (float((float((c).fields.get("m_iChainableGroupsPage")) * float(6))) + float(5))])
	return null


static func c1053_f_SetChainableGroupButton(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_groupButton: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_iIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_group = R.coerce(null, "RDAreaGroup")
	R.set_value(v_groupButton, "visible", R.binary("<", v_iIndex, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")), "=")
	if R.truth(R.get_value(v_groupButton, "visible")):
		pass
		v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iIndex), "RDAreaGroup")
		R.set_value(R.get_value(v_groupButton, "Name"), "text", ((v_group).fields.get("m_szName") if R.truth(R.binary("!=", (v_group).fields.get("m_szName"), "")) else R.binary("+", "Group ", (float(v_iIndex) + float(1)))), "=")
	R.set_value(R.get_value(v_groupButton, "Highlight"), "visible", R.call_member(c, "IsGroupInChainableGroups", [v_iIndex]), "=")
	return null


static func c1053_f_IsGroupInChainableGroups(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_i = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), "length"))):
		pass
		if R.truth(R.binary("==", v_iIndex, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), v_i))):
			pass
			return true
		v_i = R.signed32(v_i + 1)
	return false
	return null


static func c1053_f_ToggleChainableGroup(c: Variant, a: Array) -> Variant:
	var v_bFoundGroup: Variant = false
	var v_i: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bFoundGroup = false
	v_i = R.coerce(0, "int")
	v_bFoundGroup = false
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), "length"))):
		pass
		if R.truth(R.binary("==", v_iIndex, R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), v_i))):
			pass
			R.invoke(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), "splice"), [v_i, 1])
			v_bFoundGroup = true
			break
		v_i = R.signed32(v_i + 1)
	if R.truth(R.unary("!", v_bFoundGroup)):
		pass
		R.invoke(R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_LinkedGroups"), "push"), [v_iIndex])
	R.call_member(c, "UpdateChainableGroupButtons", [])
	return null


static func c1053_f_SetupProperty(c: Variant, a: Array) -> Variant:
	var v_propertyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bMouseChildren: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_szName: Variant = R.coerce((a[2] if a.size() > 2 else ""), "String")
	R.invoke(R.get_value(R.get_value(v_propertyMC, "BG"), "gotoAndStop"), [1])
	R.set_value(v_propertyMC, "buttonMode", true, "=")
	R.set_value(v_propertyMC, "mouseChildren", v_bMouseChildren, "=")
	R.set_value(R.get_value(v_propertyMC, "Name"), "mouseEnabled", false, "=")
	R.invoke(R.get_value(v_propertyMC, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnPropertyMouseOver"), false, 0, true])
	R.invoke(R.get_value(v_propertyMC, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnPropertyMouseOut"), false, 0, true])
	if R.truth(R.get_value(v_propertyMC, "Value")):
		pass
		R.invoke(R.get_value(R.get_value(v_propertyMC, "Value"), "addEventListener"), [R.get_value(R.klass("Event"), "CHANGE"), R.get_value(c, "OnPropertyTextChanged"), false, 0, true])
		R.invoke(R.get_value(R.get_value(v_propertyMC, "Value"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "RDEditorInterface"), "FOCUS_OUT"), R.get_value(c, "OnPropertyTextLostFocus"), false, 0, true])
	if R.truth((R.binary("!=", v_szName, "") and R.truth(R.get_value(v_propertyMC, "Name")))):
		pass
		R.set_value(R.get_value(v_propertyMC, "Name"), "text", v_szName, "=")
	return null


static func c1053_f_EnableProperty(c: Variant, a: Array) -> Variant:
	var v_propertyMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bEnabled: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bMouseChildren: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	R.set_value(v_propertyMC, "mouseEnabled", v_bEnabled, "=")
	R.set_value(v_propertyMC, "mouseChildren", (v_bEnabled and v_bMouseChildren), "=")
	R.set_value(v_propertyMC, "alpha", (1 if R.truth(v_bEnabled) else 0.75), "=")
	return null


static func c1053_f_SetupAreaGroupButton(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_child: Variant = null
	var v_buttonMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	v_i = R.coerce(0, "int")
	v_child = R.coerce(null, "InteractiveObject")
	R.invoke(R.get_value(v_buttonMC, "gotoAndStop"), [1])
	R.set_value(v_buttonMC, "buttonMode", true, "=")
	R.set_value(v_buttonMC, "mouseChildren", true, "=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_buttonMC, "numChildren"))):
		pass
		v_child = R.coerce(R.binary("as", R.invoke(R.get_value(v_buttonMC, "getChildAt"), [v_i]), R.resolve(c, "InteractiveObject", "RDEditorInterface")), "InteractiveObject")
		if R.truth((R.truth(v_child) and R.binary("!=", v_child, R.get_value(v_buttonMC, "Delete")))):
			pass
			R.set_value(v_child, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value(v_buttonMC, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OVER"), R.get_value(c, "OnAreaGroupMouseOver"), false, 0, true])
	R.invoke(R.get_value(v_buttonMC, "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_OUT"), R.get_value(c, "OnAreaGroupMouseOut"), false, 0, true])
	R.set_value(R.get_value(v_buttonMC, "Highlight"), "visible", false, "=")
	R.set_value(R.get_value(v_buttonMC, "Delete"), "visible", false, "=")
	return null


static func c1053_f_ShowDialogPicker(c: Variant, a: Array) -> Variant:
	var v_panel: Variant = null
	var v_iTargetSection: Variant = null
	var v_iTargetPage: Variant = 0
	var v_iStartIndex: Variant = 0
	var v_iNbDialogs: Variant = 0
	var v_i: Variant = 0
	var v_iDialogIndex: Variant = 0
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iSection: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iPage: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_bCampaign: Variant = R.coerce((a[3] if a.size() > 3 else false), "Boolean")
	v_panel = R.coerce(null, "MovieClip")
	v_iTargetSection = R.coerce(null, "*")
	v_iTargetPage = R.coerce(0, "int")
	v_iStartIndex = R.coerce(0, "int")
	v_iNbDialogs = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_iDialogIndex = R.coerce(0, "int")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		(c).fields["m_bDialogPickerForCampaign"] = v_bCampaign
		(c).fields["m_iDialogPickerPage"] = R.coerce(v_iPage, "int")
		(c).fields["m_iDialogPickerSection"] = R.coerce(v_iSection, "int")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "CochetaUnderline"), "visible", (float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "DianeUnderline"), "visible", (float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Diane"))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "RadioUnderline"), "visible", (float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Radio"))), "=")
		v_panel = R.coerce((R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel") if R.truth(v_bCampaign) else R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel")), "MovieClip")
		v_iTargetSection = R.coerce(R.call_member(c, "GetDialogPickerSectionFromDialogIndex", [R.get_value(R.get_value(v_panel, "DialogCue"), "m_iDialogCueIndex")]), "*")
		v_iTargetPage = R.coerce(R.call_member(c, "GetDialogPickerPageFromDialogIndex", [R.get_value(R.get_value(v_panel, "DialogCue"), "m_iDialogCueIndex")]), "int")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Selection"), "visible", ((R.binary("!=", R.get_value(R.get_value(v_panel, "DialogCue"), "m_iDialogCueIndex"), R.unary("-", 1)) and R.binary("==", v_iTargetSection, v_iSection)) and (float(v_iTargetPage) == float(v_iPage))), "=")
		if R.truth((float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta")))):
			pass
			v_iStartIndex = R.coerce(R.static_value("RDCampaignDialogs", "StartCochetaDialogIndex"), "int")
			v_iNbDialogs = R.coerce(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex"), "int")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Diane")))):
				pass
				v_iStartIndex = R.coerce(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex"), "int")
				v_iNbDialogs = R.coerce(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex"), "int")
			else:
				pass
				if R.truth((float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Radio")))):
					pass
					v_iStartIndex = R.coerce(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex"), "int")
					v_iNbDialogs = R.coerce(R.call_static("RDCampaignDialogs", "GetNbDialogs", []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(10))):
			pass
			v_iDialogIndex = R.coerce((float((float(v_iStartIndex) + float((float(v_iPage) * float(10))))) + float(v_i)), "int")
			R.set_value(R.get_value((c).fields.get("m_DialogPickerTexts"), v_i), "text", (R.call_static("RDCampaignDialogs", "GetText", [v_iDialogIndex]) if R.truth((float(v_iDialogIndex) < float(v_iNbDialogs))) else ""), "=")
			R.set_value(R.get_value((c).fields.get("m_DialogPickerSlots"), v_i), "m_iDialogIndex", v_iDialogIndex, "=")
			R.set_value(R.get_value((c).fields.get("m_DialogPickerSlots"), v_i), "m_iMaxDialogIndex", v_iNbDialogs, "=")
			R.set_value(R.get_value((c).fields.get("m_DialogPickerPreviews"), v_i), "m_iDialogIndex", v_iDialogIndex, "=")
			R.set_value(R.get_value((c).fields.get("m_DialogPickerPreviews"), v_i), "visible", (float(v_iDialogIndex) < float(v_iNbDialogs)), "=")
			if R.truth(R.binary("==", v_iDialogIndex, R.get_value(R.get_value(v_panel, "DialogCue"), "m_iDialogCueIndex"))):
				pass
				R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogPicker"), "Selection"), "y", R.get_value(R.get_value((c).fields.get("m_DialogPickerSlots"), v_i), "y"), "=")
			v_i = R.signed32(v_i + 1)
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_DialogPicker")])
	return null


static func c1053_f_GetNbDialogPickerPages(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta")))):
		pass
		return ceilf(float(R.binary("/", (float(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex")) - float(R.static_value("RDCampaignDialogs", "StartCochetaDialogIndex"))), 10)))
	if R.truth((float((c).fields.get("m_iDialogPickerSection")) == float(R.static_value("RDEditorInterface", "DialogPickerSection_Diane")))):
		pass
		return ceilf(float(R.binary("/", (float(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex")) - float(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex"))), 10)))
	return ceilf(float(R.binary("/", (R.num(R.call_static("RDCampaignDialogs", "GetNbDialogs", [])) - float(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex"))), 10)))
	return null


static func c1053_f_GetDialogPickerSectionFromDialogIndex(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((R.binary("==", v_iIndex, R.unary("-", 1)) or (float(v_iIndex) < float(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex"))))):
		pass
		return R.static_value("RDEditorInterface", "DialogPickerSection_Cocheta")
	if R.truth((float(v_iIndex) < float(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex")))):
		pass
		return R.static_value("RDEditorInterface", "DialogPickerSection_Diane")
	return R.static_value("RDEditorInterface", "DialogPickerSection_Radio")
	return null


static func c1053_f_GetDialogPickerPageFromDialogIndex(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", v_iIndex, R.unary("-", 1))):
		pass
		return 0
	if R.truth((float(v_iIndex) < float(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex")))):
		pass
		return floorf(float(R.binary("/", v_iIndex, 10)))
	if R.truth((float(v_iIndex) < float(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex")))):
		pass
		return floorf(float(R.binary("/", (float(v_iIndex) - float(R.static_value("RDCampaignDialogs", "StartDianeDialogIndex"))), 10)))
	return floorf(float(R.binary("/", (float(v_iIndex) - float(R.static_value("RDCampaignDialogs", "StartRadioDialogIndex"))), 10)))
	return null


static func c1053_f_SelectDialogCue(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((c).fields.get("m_bDialogPickerForCampaign")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "m_iDialogCueIndex", v_iIndex, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "Value"), "text", R.call_static("RDCampaignDialogs", "GetText", [v_iIndex]), "=")
		R.set_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"), v_iIndex, "=")
		R.call_member(c, "ShowDialogPicker", [false])
		R.call_member(c, "ShowCampaignPropertyPanel", [true, R.static_value("RDEditorInterface", "CampaignPropertyPage_Dialog"), false])
	else:
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "m_iDialogCueIndex", v_iIndex, "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "Value"), "text", R.call_static("RDCampaignDialogs", "GetText", [v_iIndex]), "=")
		R.set_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"), v_iIndex, "=")
		R.call_member(c, "ShowDialogPicker", [false])
		R.call_member(c, "ShowAreaPropertyPanel", [true, R.static_value("RDEditorInterface", "AreaPropertyPage_Dialog"), false])
	return null


static func c1053_f_UpdatePopulateBuildings(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "PatternMenu"), "PopulateBuildings"), "visible", R.unary("!", ((((float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential"))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))) or (float(((c).fields.get("m_EditorMode")).fields.get("m_iPatternType")) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed"))))), "=")
	return null


static func c1053_f_ShowDialogBox(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.set_value(R.get_value((c).fields.get("m_MC"), "DialogBox"), "visible", R.binary("!=", v_szText, ""), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "DialogBox"), "DialogText"), "text", v_szText, "=")
	return null


static func c1053_f_GoToPreviousDialogPage(c: Variant, a: Array) -> Variant:
	var v_bCampaign: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth((float((c).fields.get("m_iDialogPage")) > float(0))):
		pass
		R.set_value(c, "m_iDialogPage", 1, "-=")
		R.call_member(c, "UpdateDialogPage", [v_bCampaign])
	return null


static func c1053_f_GoToNextDialogPage(c: Variant, a: Array) -> Variant:
	var v_iMaxPage: Variant = 0
	var v_bCampaign: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_iMaxPage = R.coerce(0, "int")
	v_iMaxPage = R.coerce((R.coerce((R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "length")) - float(1)), "int") if R.truth(v_bCampaign) else R.coerce((R.num(R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), "length")) - float(1)), "int")), "int")
	if R.truth((float((c).fields.get("m_iDialogPage")) < float(v_iMaxPage))):
		pass
		R.set_value(c, "m_iDialogPage", 1, "+=")
		R.call_member(c, "UpdateDialogPage", [v_bCampaign])
	return null


static func c1053_f_AddDialogPage(c: Variant, a: Array) -> Variant:
	var v_bCampaign: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(v_bCampaign):
		pass
		R.invoke(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
		R.invoke(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [""])
		(c).fields["m_iDialogPage"] = R.coerce((R.num(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "length")) - float(1)), "int")
	else:
		pass
		R.invoke(R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
		R.invoke(R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogTexts"), "push"), [""])
		(c).fields["m_iDialogPage"] = R.coerce((R.num(R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), "length")) - float(1)), "int")
	R.call_member(c, "UpdateDialogPage", [v_bCampaign])
	return null


static func c1053_f_UpdateDialogPage(c: Variant, a: Array) -> Variant:
	var v_bCampaign: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(v_bCampaign):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogPage"), "text", R.binary("+", R.binary("+", (float((c).fields.get("m_iDialogPage")) + float(1)), "/"), R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "length")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogText"), "Value"), "text", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), (c).fields.get("m_iDialogPage")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "m_iDialogCueIndex", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPropertyPanel"), "DialogCue"), "Value"), "text", R.call_static("RDCampaignDialogs", "GetText", [R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"))]), "=")
	else:
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogPage"), "text", R.binary("+", R.binary("+", (float((c).fields.get("m_iDialogPage")) + float(1)), "/"), R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), "length")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogText"), "Value"), "text", R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogTexts"), (c).fields.get("m_iDialogPage")), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "m_iDialogCueIndex", R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage")), "=")
		R.set_value(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaPropertyPanel"), "DialogCue"), "Value"), "text", R.call_static("RDCampaignDialogs", "GetText", [R.get_value(((c).fields.get("m_SelectedArea")).fields.get("m_DialogCues"), (c).fields.get("m_iDialogPage"))]), "=")
	return null


static func c1053_f_ShowAreaTypePanel(c: Variant, a: Array) -> Variant:
	var v_currentTypeButton: Variant = null
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_currentTypeButton = R.coerce(null, "SimpleButton")
	R.set_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "visible", v_bShow, "=")
	if R.truth(v_bShow):
		pass
		if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_Normal")))):
			pass
			v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "Normal"), "SimpleButton")
		else:
			pass
			if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
				pass
				v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "DriveAway"), "SimpleButton")
			else:
				pass
				if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingBlackScreen")))):
					pass
					v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "BlackScreen"), "SimpleButton")
				else:
					pass
					if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingRedScreen")))):
						pass
						v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "RedScreen"), "SimpleButton")
					else:
						pass
						if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingWhiteScreen")))):
							pass
							v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "WhiteScreen"), "SimpleButton")
						else:
							pass
							if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingNukeBlast")))):
								pass
								v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "NukeBlast"), "SimpleButton")
							else:
								pass
								if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
									pass
									v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "ChopperEscape"), "SimpleButton")
								else:
									pass
									if R.truth((float(((c).fields.get("m_SelectedArea")).fields.get("m_iType")) == float(R.static_value("RDAreaInfo", "Type_EndingHighwayTransition")))):
										pass
										v_currentTypeButton = R.coerce(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "HighwayTransition"), "SimpleButton")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "Highlight"), "x", R.get_value(v_currentTypeButton, "x"), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "AreaTypePanel"), "Highlight"), "y", R.get_value(v_currentTypeButton, "y"), "=")
		R.call_member(c, "SetPanelMode", [R.static_value("RDEditorInterface", "Panel_AreaType")])
	return null


static func c1053_f_ShowEnding(c: Variant, a: Array) -> Variant:
	var v_iEnding: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.set_value(R.get_value((c).fields.get("m_MC"), "Endings"), "visible", (float(v_iEnding) != float(R.static_value("RDAreaInfo", "Type_Normal"))), "=")
	if R.truth((float(v_iEnding) != float((c).fields.get("m_iEnding")))):
		pass
		if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["DriveAway"])
		else:
			pass
			if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingBlackScreen")))):
				pass
				R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["BlackScreen"])
			else:
				pass
				if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingRedScreen")))):
					pass
					R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["RedScreen"])
				else:
					pass
					if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingWhiteScreen")))):
						pass
						R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["WhiteScreen"])
					else:
						pass
						if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingNukeBlast")))):
							pass
							R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["NukeBlast"])
						else:
							pass
							if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingChopperEscape")))):
								pass
								R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), ["ChopperEscape"])
							else:
								pass
								if R.truth((float(v_iEnding) == float(R.static_value("RDAreaInfo", "Type_EndingHighwayTransition")))):
									pass
									R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "gotoAndPlay"), [("ExitHighway" if R.truth(R.call_member((c).fields.get("m_EditorMode"), "IsOnHighway", [])) else "EnterHighway")])
								else:
									pass
									R.invoke(R.get_value(R.get_value((c).fields.get("m_MC"), "Endings"), "stop"), [])
		(c).fields["m_iEnding"] = R.coerce(v_iEnding, "int")
	return null


static func c1053_f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member((c).fields.get("m_EditorMode"), "OnEndingEvent", [v_szEvent])
	return null


static func c1053_f_DoesCampaignHaveAreas(c: Variant, a: Array) -> Variant:
	return R.binary(">=", R.get_value(((c).fields.get("m_ActiveAreaGroup")).fields.get("m_Areas"), "length"), 2)
	return null


static func c1053_f_RateFile(c: Variant, a: Array) -> Variant:
	var v_iRating: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.call_member((c).fields.get("m_EditorMode"), "GetCurrentLoadedFile", [])):
		pass
		R.call_member(c, "ShowLoadScreen", [])
		((c).fields.get("m_EditorMode")).fields["m_RatedFile"] = R.coerce(R.binary("as", R.call_member((c).fields.get("m_EditorMode"), "GetCurrentLoadedFile", []), R.klass("com.newgrounds.SaveFile")), "com.newgrounds.SaveFile")
		R.call_member(((c).fields.get("m_EditorMode")).fields.get("m_RatedFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete"), false, 0, true])
		R.call_member(((c).fields.get("m_EditorMode")).fields.get("m_RatedFile"), "sendVote", ["Rating", v_iRating])
		R.set_value(R.get_value((c).fields.get("m_MC"), "RatePatternPanel"), "visible", false, "=")
		R.set_value(R.get_value((c).fields.get("m_MC"), "RateAreaPanel"), "visible", false, "=")
	return null


static func c1053_f_OnRateComplete(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member(((c).fields.get("m_EditorMode")).fields.get("m_RatedFile"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "VOTE_COMPLETE"), R.get_value(c, "OnRateComplete")])
	((c).fields.get("m_EditorMode")).fields["m_RatedFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	R.call_member(c, "HideLoadScreen", [])
	R.call_member((c).fields.get("m_EditorMode"), "SetCurrentLoadedFileAsRated", [])
	return null


static func c1053_f_HighlightTextField(c: Variant, a: Array) -> Variant:
	var v_textfield: Variant = R.coerce((a[0] if a.size() > 0 else null), "TextField")
	R.call_member(((c).fields.get("m_Game")).fields.get("m_FocusManager"), "setFocus", [v_textfield])
	R.invoke(R.get_value(v_textfield, "setSelection"), [0, R.get_value(R.get_value(v_textfield, "text"), "length")])
	return null


static func c1053_f_ShowWarningMessage(c: Variant, a: Array) -> Variant:
	var v_szText: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WarningMessage"), "visible", R.binary("!=", v_szText, ""), "=")
	R.set_value(R.get_value((c).fields.get("m_MC"), "WarningMessage"), "text", v_szText, "=")
	(c).fields["m_fWarningTime"] = R.coerce(((R.num(R.get_value(v_szText, "length")) * float(R.static_value("RDEditorInterface", "WarningMessageTimePerCharacter"))) if R.truth(R.binary("!=", v_szText, "")) else 0), "Number")
	return null


static func c1053_f_ShowHelp(c: Variant, a: Array) -> Variant:
	var v_iNbHelps: Variant = 0
	var v_i: Variant = 0
	var v_helpSlot: Variant = null
	var v_iPage: Variant = R.coerce((a[0] if a.size() > 0 else R.unary("-", 1)), "int")
	v_iNbHelps = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_helpSlot = R.coerce(null, "MovieClip")
	(c).fields["m_iHelpPage"] = R.coerce(v_iPage, "int")
	v_iNbHelps = R.coerce(R.binary("/", R.get_value(R.static_value("RDHelp", "m_Texts"), "length"), 2), "int")
	R.set_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "visible", true, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Title"), "visible", R.binary("!=", v_iPage, R.unary("-", 1)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Info"), "visible", R.binary("!=", v_iPage, R.unary("-", 1)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "NextTitle"), "visible", (R.binary("!=", v_iPage, R.unary("-", 1)) and (float(v_iPage) < float((float(v_iNbHelps) - float(1))))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "PreviousTitle"), "visible", (float(v_iPage) > float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Next"), "visible", (R.binary("!=", v_iPage, R.unary("-", 1)) and (float(v_iPage) < float((float(v_iNbHelps) - float(1))))), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Previous"), "visible", (float(v_iPage) > float(0)), "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Table"), "visible", R.binary("!=", v_iPage, R.unary("-", 1)), "=")
	if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Title"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Title"), "text", R.get_value(R.static_value("RDHelp", "m_Texts"), (float(v_iPage) * float(2))), "=")
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "Info"), "text", R.get_value(R.static_value("RDHelp", "m_Texts"), (float((float(v_iPage) * float(2))) + float(1))), "=")
	if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "NextTitle"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "NextTitle"), "text", R.get_value(R.static_value("RDHelp", "m_Texts"), (float((float(v_iPage) + float(1))) * float(2))), "=")
	if R.truth(R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "PreviousTitle"), "visible")):
		pass
		R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "PreviousTitle"), "text", R.get_value(R.static_value("RDHelp", "m_Texts"), (float((float(v_iPage) - float(1))) * float(2))), "=")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_HelpSlots"), "length"))):
		pass
		v_helpSlot = R.coerce(R.binary("as", R.get_value((c).fields.get("m_HelpSlots"), v_i), R.klass("MovieClip")), "MovieClip")
		R.set_value(v_helpSlot, "visible", ((float(v_i) < float(v_iNbHelps)) and R.binary("==", v_iPage, R.unary("-", 1))), "=")
		if R.truth(R.get_value(v_helpSlot, "visible")):
			pass
			R.call_member(c, "HighlightHelp", [v_helpSlot, false])
			R.set_value(R.get_value(v_helpSlot, "NameValue"), "text", R.get_value(R.static_value("RDHelp", "m_Texts"), (float(v_i) * float(2))), "=")
		v_i = R.signed32(v_i + 1)
	return null


static func c1053_f_HideHelp(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value((c).fields.get("m_MC"), "HelpPanel"), "visible", false, "=")
	return null


static func c1053_f_HighlightHelp(c: Variant, a: Array) -> Variant:
	var v_helpSlot: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.set_value(v_helpSlot, "alpha", (1 if R.truth(v_bHighlight) else 0.8), "=")
	return null


static func c1053_f_ShowAreaGroups(c: Variant, a: Array) -> Variant:
	var v_bShow: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v_iPage: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	(c).fields["m_iAreaGroupsPage"] = R.coerce(v_iPage, "int")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "visible", v_bShow, "=")
	R.call_member(c, "UpdateAreaGroupButtons", [])
	return null


static func c1053_f_UpdateAreaGroupButtons(c: Variant, a: Array) -> Variant:
	R.call_member(c, "SetAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group1"), (float((c).fields.get("m_iAreaGroupsPage")) * float(4))])
	R.call_member(c, "SetAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group2"), (float((float((c).fields.get("m_iAreaGroupsPage")) * float(4))) + float(1))])
	R.call_member(c, "SetAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group3"), (float((float((c).fields.get("m_iAreaGroupsPage")) * float(4))) + float(2))])
	R.call_member(c, "SetAreaGroupButton", [R.get_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "AreaGroupsPanel"), "Group4"), (float((float((c).fields.get("m_iAreaGroupsPage")) * float(4))) + float(3))])
	return null


static func c1053_f_SetAreaGroupButton(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_buttonMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	var v_iIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_group = R.coerce(null, "RDAreaGroup")
	R.set_value(v_buttonMC, "m_iIndex", v_iIndex, "=")
	R.set_value(v_buttonMC, "visible", R.binary("<", v_iIndex, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")), "=")
	if R.truth(R.get_value(v_buttonMC, "visible")):
		pass
		v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iIndex), "RDAreaGroup")
		R.set_value(R.get_value(v_buttonMC, "Name"), "text", ((v_group).fields.get("m_szName") if R.truth(R.binary("!=", (v_group).fields.get("m_szName"), "")) else R.binary("+", "Group ", (float(v_iIndex) + float(1)))), "=")
	R.set_value(R.get_value(v_buttonMC, "Highlight"), "visible", (float(v_iIndex) == float((c).fields.get("m_iActiveAreaGroup"))), "=")
	R.set_value(R.get_value(v_buttonMC, "Delete"), "visible", (R.binary("==", v_buttonMC, (c).fields.get("m_SelectedAreaGroupSlot")) and R.binary(">", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"), 1)), "=")
	return null


static func c1053_f_ResetCampaignAreaSelection(c: Variant, a: Array) -> Variant:
	R.call_member(c, "ShowAreaPropertyPanel", [false])
	R.call_member(c, "ShowDialogPicker", [false])
	R.call_member(c, "ShowAreaTypePanel", [false])
	R.call_member(c, "ShowCampaignPropertyPanel", [false])
	R.call_member(c, "ClearCampaignPanelSelection", [])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "mouseEnabled", false, "=")
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "CampaignPanel"), "EditArea"), "alpha", 0.5, "=")
	return null


static func c1053_f_ResetAreaGroupSelection(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_SelectedAreaGroupSlot")):
		pass
		R.set_value(R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "Delete"), "visible", false, "=")
		R.invoke(R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "gotoAndStop"), [1])
	(c).fields["m_SelectedAreaGroup"] = R.coerce(null, "RDAreaGroup")
	(c).fields["m_SelectedAreaGroupSlot"] = R.coerce(null, "MovieClip")
	return null


static func c1053_f_TextPropertyIsTarget(c: Variant, a: Array) -> Variant:
	var v_target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v_textFieldMC: Variant = R.coerce((a[1] if a.size() > 1 else null), "MovieClip")
	return (((R.binary("==", v_target, v_textFieldMC) or R.binary("==", v_target, R.get_value(v_textFieldMC, "Name"))) or R.binary("==", v_target, R.get_value(v_textFieldMC, "Value"))) or R.binary("==", v_target, R.get_value(v_textFieldMC, "BG")))
	return null


static func c1053_f_SelectAreaGroup(c: Variant, a: Array) -> Variant:
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	R.call_member(c, "ResetCampaignAreaSelection", [])
	R.call_member(c, "ResetAreaGroupSelection", [])
	(c).fields["m_SelectedAreaGroupSlot"] = R.coerce(v_slotMC, "MovieClip")
	R.call_member(c, "SetActiveAreaGroup", [R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "m_iIndex")])
	(c).fields["m_SelectedAreaGroup"] = R.coerce((c).fields.get("m_ActiveAreaGroup"), "RDAreaGroup")
	R.call_member(c, "UpdateCampaignList", [])
	R.call_member(c, "ShowAreaGroupPropertyPanel", [true])
	R.invoke(R.get_value((c).fields.get("m_SelectedAreaGroupSlot"), "gotoAndStop"), [4])
	return null


static func c1053_f_DeleteAreaGroup(c: Variant, a: Array) -> Variant:
	var v_iNewGroup: Variant = 0
	var v_iIndex: Variant = 0
	var v_i: Variant = 0
	var v_group: Variant = null
	var v_g: Variant = null
	var v_iLinkedIndex: Variant = 0
	var v_slotMC: Variant = R.coerce((a[0] if a.size() > 0 else null), "MovieClip")
	v_iNewGroup = R.coerce(0, "int")
	v_iIndex = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_g = R.coerce(0, "*")
	v_iLinkedIndex = R.coerce(0, "int")
	v_iNewGroup = R.coerce(maxf(float((float((c).fields.get("m_iActiveAreaGroup")) - float(1))), float(0)), "int")
	v_iIndex = R.coerce(R.coerce(R.get_value(v_slotMC, "m_iIndex"), "int"), "int")
	R.invoke(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "splice"), [v_iIndex, 1])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
		pass
		v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_i), "RDAreaGroup")
		v_g = R.coerce(R.coerce((R.num(R.get_value((v_group).fields.get("m_LinkedGroups"), "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">=", v_g, 0)):
			pass
			v_iLinkedIndex = R.coerce(R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), v_g), "int"), "int")
			if R.truth((float(v_iLinkedIndex) == float(v_iIndex))):
				pass
				R.invoke(R.get_value((v_group).fields.get("m_LinkedGroups"), "splice"), [v_g, 1])
			else:
				pass
				if R.truth((float(v_iLinkedIndex) > float(v_iIndex))):
					pass
					R.set_value((v_group).fields.get("m_LinkedGroups"), v_g, (float(v_iLinkedIndex) - float(1)), "=")
			v_g = R.coerce(R.num(v_g) - 1, "*")
		v_i = R.signed32(v_i + 1)
	R.call_member(c, "ResetAreaGroupSelection", [])
	R.call_member(c, "SetActiveAreaGroup", [v_iNewGroup])
	R.call_member(c, "ResetCampaignAreaSelection", [])
	R.call_member(c, "UpdateCampaignList", [])
	return null


static func c1053_f_SetActiveAreaGroup(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_iActiveAreaGroup"] = R.coerce(v_iIndex, "int")
	(c).fields["m_ActiveAreaGroup"] = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iActiveAreaGroup")), "RDAreaGroup")
	R.call_member(c, "UpdateAreaGroupButtons", [])
	return null


static func c1053_f_DoesAllGroupsHaveAreas(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_group: Variant = null
	v_i = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
		pass
		v_group = R.coerce(R.binary("as", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_i), R.klass("RDAreaGroup")), "RDAreaGroup")
		if R.truth(R.binary("==", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
			pass
			return false
		v_i = R.signed32(v_i + 1)
	return true
	return null


static func c1053_f_DoesAllGroupsHaveChainableGroups(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_group: Variant = null
	v_i = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	if R.truth(R.binary(">", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"), 1)):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
			pass
			v_group = R.coerce(R.binary("as", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_i), R.klass("RDAreaGroup")), "RDAreaGroup")
			if R.truth(R.binary("==", R.get_value((v_group).fields.get("m_LinkedGroups"), "length"), 0)):
				pass
				return false
			v_i = R.signed32(v_i + 1)
	return true
	return null


static func c1053_f_DoesStoryHas2Areas(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_group = R.coerce(R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
	return R.binary(">=", R.get_value((v_group).fields.get("m_Areas"), "length"), 2)
	return null


static func c1053_f_DoesAreaHavePatterns(c: Variant, a: Array) -> Variant:
	return R.binary(">", R.get_value((((c).fields.get("m_EditorMode")).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)
	return null


static func c1053_f_OnFileDeleted(c: Variant, a: Array) -> Variant:
	R.call_member(c, "ShowLoadFileMenu", [R.unary("-", 1)])
	R.call_member(c, "ShowToolTip", [""])
	R.call_member(c, "ShowFileToolTip", ["", "", ""])
	R.call_member(c, "ShowLoadFileInfo", [R.unary("-", 1)])
	R.call_member(c, "RefreshLoadPanel", [true])
	return null


static func c1053_f_OnPassportLogin(c: Variant, a: Array) -> Variant:
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "PassportPanel"), "Login"), "mouseEnabled", false, "=")
	R.call_static("com.newgrounds.API", "addEventListener", [R.static_value("com.newgrounds.APIEvent", "USER_SIGNED_IN"), R.get_value(c, "onUserSignedIn")])
	R.call_static("com.newgrounds.API", "promptSignIn", [])
	return null


static func c1053_f_onUserSignedIn(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_e, "success")):
		pass
		R.call_member(c, "SetMode", [(c).fields.get("m_iPendingPassportMode")])
	R.set_value(R.get_value(R.get_value((c).fields.get("m_MC"), "PassportPanel"), "Login"), "mouseEnabled", true, "=")
	return null


static func c1053_f_GetTextPropertyTextField(c: Variant, a: Array) -> Variant:
	var v_mc: Variant = null
	var v_parentMC: Variant = null
	var v_displayObject: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	v_mc = R.coerce(null, "MovieClip")
	v_parentMC = R.coerce(null, "MovieClip")
	v_mc = R.coerce(R.binary("as", v_displayObject, R.klass("MovieClip")), "MovieClip")
	if R.truth((R.truth(v_mc) and R.truth(R.get_value(v_mc, "Value")))):
		pass
		return R.get_value(v_mc, "Value")
	v_parentMC = R.coerce(R.binary("as", R.get_value(v_displayObject, "parent"), R.klass("MovieClip")), "MovieClip")
	if R.truth(v_parentMC):
		pass
		return R.get_value(v_parentMC, "Value")
	return null
	return null


static func c1070_f_RDGameModeEditor(c: Variant, a: Array) -> Variant:
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	R.invoke(R.super_ref(c, "RDGameModeEditor"), [v_theGame])
	c.fields["m_Camera"] = R.coerce(R.construct(R.klass("RDCameraEditor"), []), "RDCamera")
	(c).fields["m_Interface"] = R.coerce(R.construct(R.klass("RDEditorInterface"), [c]), "RDEditorInterface")
	c.fields["m_bHasHud"] = false
	(c).fields["m_iLastInterfaceMode"] = R.coerce(R.static_value("RDEditorInterface", "Mode_Pattern"), "int")
	(c).fields["m_ChopperSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingChopper"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNuke"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	(c).fields["m_NukeWaveSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_EndingNukeWave"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	return null


static func c1070_f_EncodeData(c: Variant, a: Array) -> Variant:
	var v_origPos: Variant = 0
	var v_result: Variant = null
	var v_szData: Variant = null
	var v_i: Variant = 0
	var v_ba: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	R.set_value(v_ba, "position", 0, "=")
	v_origPos = R.coerce(R.get_value(v_ba, "position"), "uint")
	v_result = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.set_value(v_ba, "position", 0, "=")
	while R.truth(R.binary("<", R.get_value(v_ba, "position"), (R.num(R.get_value(v_ba, "length")) - float(1)))):
		pass
		R.invoke(R.get_value(v_result, "push"), [R.invoke(R.get_value(v_ba, "readShort"), [])])
	if R.truth(R.binary("!=", R.get_value(v_ba, "position"), R.get_value(v_ba, "length"))):
		pass
		R.invoke(R.get_value(v_result, "push"), [R.binary("<<", R.invoke(R.get_value(v_ba, "readByte"), []), 8)])
	R.set_value(v_ba, "position", v_origPos, "=")
	v_szData = R.coerce("", "String")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_result, "length"))):
		pass
		v_szData = R.coerce(R.binary("+", v_szData, R.invoke(R.get_value(R.klass("String"), "fromCharCode"), [R.get_value(v_result, v_i)])), "String")
		v_i = R.signed32(v_i + 1)
	return v_szData
	return null


static func c1070_f_DecodeData(c: Variant, a: Array) -> Variant:
	var v_result: Variant = null
	var v_i: Variant = 0
	var v_str: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_result = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(v_str, "length"))):
		pass
		R.invoke(R.get_value(v_result, "writeShort"), [R.invoke(R.get_value(v_str, "charCodeAt"), [v_i])])
		v_i = R.signed32(v_i + 1)
	R.set_value(v_result, "position", 0, "=")
	return v_result
	return null


static func c1070_f_BeginGameMode(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "BeginGameMode"), [])
	R.set_value(R.klass("RDWorld"), "m_bDestroyOutOfWorldEntities", false, "=")
	R.set_value(R.klass("RDWorld"), "m_bCurvyRoads", false, "=")
	(c.fields.get("m_Game")).fields["m_bPlayFromEditor"] = false
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Show", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	(c).fields["m_bMusicEnabled"] = ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_bMusic")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMusic"] = true
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	(c).fields["m_iMusic"] = R.coerce(0, "int")
	R.call_member(c, "PlayEditorMusic", [])
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) and R.truth((c).fields.get("m_SavedPatternData")))):
		pass
		R.call_member(c, "LoadSavedPattern", [])
	else:
		pass
		if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) and R.truth((c).fields.get("m_SavedAreaData")))):
			pass
			R.call_member(c, "LoadSavedArea", [])
		else:
			pass
			if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.truth((c).fields.get("m_SavedCampaignData")))):
				pass
				R.call_member(c, "LoadSavedCampaign", [])
			else:
				pass
				if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
					pass
					R.call_member(c, "NewPattern", [R.static_value("RDPatternInfo", "Type_Regular")])
				else:
					pass
					if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
						pass
						R.call_member(c, "NewArea", [])
					else:
						pass
						if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
							pass
							R.call_member(c, "NewCampaign", [R.static_value("RDCampaignInfo", "Type_Unset")])
	R.call_member((c).fields.get("m_Interface"), "Show", [(c).fields.get("m_iLastInterfaceMode")])
	(c).fields["m_fFastCamRamp"] = float(1)
	return null


static func c1070_f_EndGameMode(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SetSelectedEntity", [null])
	R.call_member(c, "StopEndingSounds", [])
	R.call_member(c, "SaveData", [])
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMusic"] = (c).fields.get("m_bMusicEnabled")
	R.call_member(c.fields.get("m_Game"), "ApplyOptions", [])
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "EndGameMode"), [])
	R.call_member((c).fields.get("m_Interface"), "Hide", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Hide", [(c.fields.get("m_Game")).fields.get("m_WorldLayer")])
	return null


static func c1070_f_SaveData(c: Variant, a: Array) -> Variant:
	if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.call_member(c, "SaveCurrentPatternData", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.call_member(c, "SaveCurrentAreaData", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
				pass
				R.call_member(c, "SaveCurrentCampaignData", [])
	return null


static func c1070_f_Update(c: Variant, a: Array) -> Variant:
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "Update"), [v_fDeltaTime])
	if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) > float(0))):
		pass
		(c).fields["m_fAPITimeoutTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fAPITimeoutTimer"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fAPITimeoutTimer")) <= float(0))):
			pass
			R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
			R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Update", [v_fDeltaTime, c.fields.get("m_Camera")])
	R.call_member(c.fields.get("m_Camera"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateGameplay", [v_fDeltaTime])
	R.call_member((c).fields.get("m_Interface"), "Update", [v_fDeltaTime])
	R.call_member(c, "UpdateBGBuildingDepthPos", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Render", [c.fields.get("m_Camera")])
	return null


static func c1070_f_SpawnBGBuildings(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_bRight: Variant = false
	var v_szSpawnClass: Variant = null
	var v_entity: Variant = null
	var v_fNextBuildingSpawnPosition: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_fPerlinX: Variant = NAN
	var v_fPerlinY: Variant = NAN
	var v_leftBuilding: Variant = null
	var v_rightBuilding: Variant = null
	var v_iPatternType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_fStartPosition: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_i = R.coerce(0, "int")
	v_bRight = false
	v_szSpawnClass = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_fNextBuildingSpawnPosition = float(NAN)
	v_fPosZ = float(NAN)
	v_fPerlinX = float(NAN)
	v_fPerlinY = float(NAN)
	v_leftBuilding = R.coerce(null, "RDBuilding")
	v_rightBuilding = R.coerce(null, "RDBuilding")
	if R.truth(((((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential"))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))) or (float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed"))))):
		pass
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(10))):
			pass
			v_bRight = (float(R.binary("%", v_i, 2)) == float(0))
			if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayResidential")))):
				pass
				v_szSpawnClass = R.coerce("BGBuildingResidentialRandom", "String")
			else:
				pass
				if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayTown")))):
					pass
					v_szSpawnClass = R.coerce("BGBuildingTownRandom", "String")
				else:
					pass
					if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayIndustrial")))):
						pass
						v_szSpawnClass = R.coerce("BGBuildingIndustrialRandom", "String")
					else:
						pass
						if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_AlleywayMixed")))):
							pass
							v_szSpawnClass = R.coerce("BGBuildingMixedRandom", "String")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szSpawnClass]), "RDEntity")
			R.call_member(v_entity, "SetEditorMode", [])
			((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce((10 if R.truth(v_bRight) else R.unary("-", 10)), "Number")
			((v_entity).fields.get("m_vLocation")).fields["Y"] = float(0)
			((v_entity).fields.get("m_vLocation")).fields["Z"] = float((float(v_fStartPosition) + float(R.binary("/", (float((float(v_i) + float(1))) * float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))), 11))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			R.call_member(v_entity, "UpdateFlip", [])
			R.call_member(c, "OnEntityAddedToWorld", [v_entity])
			v_i = R.signed32(v_i + 1)
	else:
		pass
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			v_fNextBuildingSpawnPosition = float(0)
			while R.truth((float(v_fNextBuildingSpawnPosition) < float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))):
				pass
				v_fPosZ = float((float(v_fNextBuildingSpawnPosition) + float((float(randf()) * float(20)))))
				v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
				v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
				v_leftBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
				R.call_member(v_leftBuilding, "Init", [false, 0])
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_leftBuilding, (float((float(v_fPerlinX) - float(R.static_value("RDRoad", "BuildingPosX")))) - float((float(randf()) * float(15)))), v_fPerlinY, (float(v_fStartPosition) + float(v_fPosZ))])
				R.call_member(v_leftBuilding, "UpdateFlip", [])
				R.call_member(c, "OnEntityAddedToWorld", [v_leftBuilding])
				v_fPosZ = float((float((float(v_fNextBuildingSpawnPosition) + float(R.binary("/", R.static_value("RDGameModeGameplay", "BuildingSpacing"), 2)))) + float((float(randf()) * float(20)))))
				if R.truth((float(v_fPosZ) < float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))):
					pass
					v_fPerlinX = R.coerce(R.call_static("RDWorld", "GetPerlinX", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
					v_fPerlinY = R.coerce(R.call_static("RDWorld", "GetPerlinY", [(float(v_fStartPosition) + float(v_fPosZ))]), "Number")
					v_rightBuilding = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDBuilding")]), R.klass("RDBuilding")), "RDBuilding")
					R.call_member(v_rightBuilding, "Init", [true, 0])
					R.call_member(c.fields.get("m_Game"), "AddEntity", [v_rightBuilding, (float((float(v_fPerlinX) + float(R.static_value("RDRoad", "BuildingPosX")))) + float((float(randf()) * float(15)))), v_fPerlinY, (float(v_fStartPosition) + float(v_fPosZ))])
					R.call_member(v_rightBuilding, "UpdateFlip", [])
					R.call_member(c, "OnEntityAddedToWorld", [v_rightBuilding])
				v_fNextBuildingSpawnPosition = R.coerce(R.binary("+", v_fNextBuildingSpawnPosition, R.static_value("RDGameModeGameplay", "BuildingSpacing")), "Number")
	return null


static func c1070_f_PopulateBuildings(c: Variant, a: Array) -> Variant:
	var v_bRight: Variant = false
	var v_szSpawnClass: Variant = null
	var v_entity: Variant = null
	var v_iRandom: Variant = 0
	var v_i: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_bRight = false
	v_szSpawnClass = R.coerce(null, "String")
	v_entity = R.coerce(null, "RDEntity")
	v_iRandom = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(10))):
		pass
		v_bRight = (float(R.binary("%", v_i, 2)) == float(0))
		if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Residential")))):
			pass
			v_szSpawnClass = R.coerce("BuildingResidentialRandom", "String")
		else:
			pass
			if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Town")))):
				pass
				v_szSpawnClass = R.coerce("BuildingTownRandom", "String")
			else:
				pass
				if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Industrial")))):
					pass
					v_szSpawnClass = R.coerce("BuildingIndustrialRandom", "String")
				else:
					pass
					if R.truth((float(v_iType) == float(R.static_value("RDGameModeEditor", "BuildingsType_Mixed")))):
						pass
						v_iRandom = R.coerce(R.call_static("Maths", "RandomInt", [3]), "int")
						if R.truth((float(v_iRandom) == float(0))):
							pass
							v_szSpawnClass = R.coerce("BuildingResidentialRandom", "String")
						else:
							pass
							if R.truth((float(v_iRandom) == float(1))):
								pass
								v_szSpawnClass = R.coerce("BuildingTownRandom", "String")
							else:
								pass
								if R.truth((float(v_iRandom) == float(2))):
									pass
									v_szSpawnClass = R.coerce("BuildingIndustrialRandom", "String")
		v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szSpawnClass]), "RDEntity")
		R.call_member(v_entity, "SetEditorMode", [])
		((v_entity).fields.get("m_vLocation")).fields["X"] = R.coerce((10 if R.truth(v_bRight) else R.unary("-", 10)), "Number")
		((v_entity).fields.get("m_vLocation")).fields["Y"] = float(0)
		((v_entity).fields.get("m_vLocation")).fields["Z"] = float(R.binary("/", (float((float(v_i) + float(1))) * float((float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))), 11))
		R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, ((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Y"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")])
		R.call_member(v_entity, "UpdateFlip", [])
		R.call_member(c, "OnEntityAddedToWorld", [v_entity])
		v_i = R.signed32(v_i + 1)
	return null


static func c1070_f_LoadPatternData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iPatternType: Variant = 0
	var v_iNbEntities: Variant = 0
	var v_iStartSliceIndex: Variant = 0
	var v_szName: Variant = null
	var v_fX: Variant = NAN
	var v_fY: Variant = NAN
	var v_fZ: Variant = NAN
	var v_entity: Variant = null
	var v_iNbProperties: Variant = 0
	var v_p: Variant = 0
	var v_szPropertyName: Variant = null
	var v_iPropertyType: Variant = 0
	var v_propValue: Variant = null
	var v_iFileVersion: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bPatternMode: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	var v_fStartPosition: Variant = R.coerce((a[2] if a.size() > 2 else 0), "Number")
	v_i = R.coerce(0, "int")
	v_iPatternType = R.coerce(0, "int")
	v_iNbEntities = R.coerce(0, "int")
	v_iStartSliceIndex = R.coerce(0, "int")
	v_szName = R.coerce(null, "String")
	v_fX = float(NAN)
	v_fY = float(NAN)
	v_fZ = float(NAN)
	v_entity = R.coerce(null, "RDEntity")
	v_iNbProperties = R.coerce(0, "int")
	v_p = R.coerce(0, "int")
	v_szPropertyName = R.coerce(null, "String")
	v_iPropertyType = R.coerce(0, "int")
	v_propValue = R.coerce(null, "*")
	R.set_value(v_savedData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iPatternType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth(v_bPatternMode):
			pass
			R.call_member(c, "NewPattern", [v_iPatternType])
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			R.call_member(c, "SpawnBGBuildings", [v_iPatternType, v_fStartPosition])
		if R.truth(v_bPatternMode):
			pass
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 0])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 1])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 2])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 3])
			R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), 4])
		else:
			pass
			if R.truth((float(v_fStartPosition) < float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))):
				pass
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), [])])
			else:
				pass
				v_iStartSliceIndex = R.coerce((float(floorf(float(R.binary("/", v_fStartPosition, R.static_value("RDRoad", "RenderStepSize"))))) - float(((c).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(0))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(1))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(2))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(3))])
				R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.invoke(R.get_value(v_savedData, "readInt"), []), (float(v_iStartSliceIndex) + float(4))])
		v_iNbEntities = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbEntities))):
			pass
			v_szName = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
			v_fX = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fY = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fZ = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			v_fZ = R.coerce(R.binary("+", v_fZ, v_fStartPosition), "Number")
			v_entity = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [v_szName]), "RDEntity")
			R.call_member(v_entity, "SetEditorMode", [])
			v_iNbProperties = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_p = R.coerce(0, "int")
			while R.truth((float(v_p) < float(v_iNbProperties))):
				pass
				v_szPropertyName = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				v_iPropertyType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Number")))):
					pass
					v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "*")
				else:
					pass
					if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_Boolean")))):
						pass
						v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "*")
					else:
						pass
						if R.truth((float(v_iPropertyType) == float(R.static_value("RDProperty", "Type_String")))):
							pass
							v_propValue = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "*")
				R.call_member(v_entity, "SetProperty", [v_szPropertyName, v_propValue])
				v_p = R.signed32(v_p + 1)
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_entity, v_fX, v_fY, v_fZ])
			R.call_member(v_entity, "UpdateFlip", [])
			R.call_member(c, "OnEntityAddedToWorld", [v_entity])
			v_i = R.signed32(v_i + 1)
	return null


static func c1070_f_RandomizePattern(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SaveData", [])
	R.call_member(c, "LoadPatternData", [(c).fields.get("m_SavedPatternData")])
	return null


static func c1070_f_UpdateBGBuildingDepthPos(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_fFarthestAlleywayPos: Variant = NAN
	var v_fFarthestAlleywayPos2: Variant = NAN
	var v_fFarthestAlleywayPos3: Variant = NAN
	var v_fFarthestAlleywayPos4: Variant = NAN
	var v_fFarthestAlleywayPos5: Variant = NAN
	var v_fTransitionPos: Variant = NAN
	var v_fTransitionPos2: Variant = NAN
	var v_fTransitionPos3: Variant = NAN
	var v_fTransitionPos4: Variant = NAN
	var v_iSlice: Variant = 0
	var v_fCamPos: Variant = NAN
	var v_fLoopedCamPos: Variant = NAN
	var v_fPosZ: Variant = NAN
	var v_building: Variant = null
	var v_world: Variant = null
	var v_iNbBuildings: Variant = 0
	var v_iNbSlices: Variant = 0
	var v_bFoundAlleyway: Variant = false
	var v_bCheckForAlleyway2: Variant = false
	var v_bCheckForAlleyway3: Variant = false
	var v_bCheckForAlleyway4: Variant = false
	var v_bCheckForAlleyway5: Variant = false
	var v_bFoundAlleyway2: Variant = false
	var v_bFoundAlleyway3: Variant = false
	var v_bFoundAlleyway4: Variant = false
	var v_bFoundAlleyway5: Variant = false
	var v_sliceEntity: Variant = null
	v_i = R.coerce(0, "int")
	v_fFarthestAlleywayPos = float(NAN)
	v_fFarthestAlleywayPos2 = float(NAN)
	v_fFarthestAlleywayPos3 = float(NAN)
	v_fFarthestAlleywayPos4 = float(NAN)
	v_fFarthestAlleywayPos5 = float(NAN)
	v_fTransitionPos = float(NAN)
	v_fTransitionPos2 = float(NAN)
	v_fTransitionPos3 = float(NAN)
	v_fTransitionPos4 = float(NAN)
	v_iSlice = R.coerce(0, "int")
	v_fCamPos = float(NAN)
	v_fLoopedCamPos = float(NAN)
	v_fPosZ = float(NAN)
	v_building = R.coerce(null, "RDBuildingNewBG")
	v_world = R.coerce((c.fields.get("m_Game")).fields.get("m_World"), "RDWorld")
	v_iNbBuildings = R.coerce(R.coerce(R.get_value((v_world).fields.get("m_BGBuildings"), "length"), "int"), "int")
	v_iNbSlices = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), "length"), "int"), "int")
	v_bFoundAlleyway = false
	v_bCheckForAlleyway2 = false
	v_bCheckForAlleyway3 = false
	v_bCheckForAlleyway4 = false
	v_bCheckForAlleyway5 = false
	v_bFoundAlleyway2 = false
	v_bFoundAlleyway3 = false
	v_bFoundAlleyway4 = false
	v_bFoundAlleyway5 = false
	v_sliceEntity = R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSliceEntities"), 0), "RDRoadSlice")
	if R.truth((((float(v_iNbBuildings) > float(0)) and (float(v_iNbSlices) > float(0))) and R.truth(v_sliceEntity))):
		pass
		v_fFarthestAlleywayPos = float(0)
		v_fFarthestAlleywayPos2 = float(0)
		v_fFarthestAlleywayPos3 = float(0)
		v_fFarthestAlleywayPos4 = float(0)
		v_fFarthestAlleywayPos5 = float(0)
		v_fTransitionPos = float(0)
		v_fTransitionPos2 = float(0)
		v_fTransitionPos3 = float(0)
		v_fTransitionPos4 = float(0)
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbSlices))):
			pass
			v_iSlice = R.coerce(R.coerce(R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), v_i), "int"), "int")
			v_fCamPos = float(maxf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), float(0)))
			v_fLoopedCamPos = float(R.binary("%", v_fCamPos, R.static_value("RDRoad", "RenderStepSize")))
			v_fPosZ = float(maxf(float((float((float((float(v_i) + float(1))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(v_fLoopedCamPos))), float(R.static_value("RDRoad", "NearPos"))))
			if R.truth((float(v_iSlice) == float(R.static_value("RDRoad", "SliceType_Alleyway")))):
				pass
				if R.truth(v_bCheckForAlleyway5):
					pass
					v_bFoundAlleyway5 = true
				else:
					pass
					if R.truth(v_bCheckForAlleyway4):
						pass
						v_bFoundAlleyway4 = true
					else:
						pass
						if R.truth(v_bCheckForAlleyway3):
							pass
							v_bFoundAlleyway3 = true
						else:
							pass
							if R.truth(v_bCheckForAlleyway2):
								pass
								v_bFoundAlleyway2 = true
							else:
								pass
								v_bFoundAlleyway = true
				if R.truth((v_bCheckForAlleyway5 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos5)))):
					pass
					v_fFarthestAlleywayPos5 = float(v_fPosZ)
				else:
					pass
					if R.truth((v_bCheckForAlleyway4 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos4)))):
						pass
						v_fFarthestAlleywayPos4 = float(v_fPosZ)
					else:
						pass
						if R.truth((v_bCheckForAlleyway3 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos3)))):
							pass
							v_fFarthestAlleywayPos3 = float(v_fPosZ)
						else:
							pass
							if R.truth((v_bCheckForAlleyway2 and (float(v_fPosZ) > float(v_fFarthestAlleywayPos2)))):
								pass
								v_fFarthestAlleywayPos2 = float(v_fPosZ)
							else:
								pass
								if R.truth((float(v_fPosZ) > float(v_fFarthestAlleywayPos))):
									pass
									v_fFarthestAlleywayPos = float(v_fPosZ)
			else:
				pass
				if R.truth(v_bFoundAlleyway5):
					pass
					break
				if R.truth(v_bFoundAlleyway4):
					pass
					v_bCheckForAlleyway5 = true
					v_fTransitionPos4 = float(v_fFarthestAlleywayPos4)
				else:
					pass
					if R.truth(v_bFoundAlleyway3):
						pass
						v_bCheckForAlleyway4 = true
						v_fTransitionPos3 = float(v_fFarthestAlleywayPos3)
					else:
						pass
						if R.truth(v_bFoundAlleyway2):
							pass
							v_bCheckForAlleyway3 = true
							v_fTransitionPos2 = float(v_fFarthestAlleywayPos2)
						else:
							pass
							if R.truth(v_bFoundAlleyway):
								pass
								v_bCheckForAlleyway2 = true
								v_fTransitionPos = float(v_fFarthestAlleywayPos)
			v_i = R.signed32(v_i + 1)
		if R.truth((float(v_fFarthestAlleywayPos) > float(0))):
			pass
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbBuildings))):
				pass
				v_building = R.coerce(R.binary("as", R.get_value((v_world).fields.get("m_BGBuildings"), v_i), R.klass("RDBuildingNewBG")), "RDBuildingNewBG")
				if R.truth((R.unary("!", v_bFoundAlleyway2) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos)))))):
					pass
					(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				else:
					pass
					if R.truth((R.unary("!", v_bFoundAlleyway3) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos2)))))):
						pass
						(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos2))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
					else:
						pass
						if R.truth((R.unary("!", v_bFoundAlleyway4) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos3)))))):
							pass
							(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos3))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
						else:
							pass
							if R.truth((R.unary("!", v_bFoundAlleyway5) or (float(((v_building).fields.get("m_vLocation")).fields.get("Z")) < float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fTransitionPos4)))))):
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos4))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
							else:
								pass
								(v_building).fields["m_fDepthPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(v_fFarthestAlleywayPos5))) + float(0.001))) + float((float(v_i) * float(R.binary("/", 0.001, v_iNbBuildings))))))
				R.call_member(v_building, "UpdateDepthPosition", [])
				v_i = R.signed32(v_i + 1)
	return null


static func c1070_f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_fOldZ: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_fOldZ = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))
	if R.truth(R.unary("!", R.get_value((c.fields.get("m_Game")).fields.get("m_ConfirmationDialog"), "visible"))):
		pass
		if R.truth((c).fields.get("m_bGoFast")):
			pass
			(c).fields["m_fFastCamRamp"] = R.coerce(R.binary("*", (c).fields.get("m_fFastCamRamp"), R.static_value("RDGameModeEditor", "CamFastBaseRamp")), "Number")
			(c).fields["m_fCamFastFactor"] = float((float(R.static_value("RDGameModeEditor", "CamFastFactor")) + float((float((float(1) - float((c).fields.get("m_fFastCamRamp")))) * float(R.static_value("RDGameModeEditor", "CamFastFactorRamp"))))))
		else:
			pass
			(c).fields["m_fFastCamRamp"] = float(1)
		if R.truth((c).fields.get("m_bGoLeft")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("-", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedX")) * float(v_fDeltaTime))) * R.num((R.static_value("RDGameModeEditor", "CamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
		if R.truth((c).fields.get("m_bGoRight")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedX")) * float(v_fDeltaTime))) * R.num((R.static_value("RDGameModeEditor", "CamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
		if R.truth((c).fields.get("m_bGoForward")):
			pass
			if R.truth(R.call_member(c, "CanGoForward", [])):
				pass
				((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("+", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedZ")) * float(v_fDeltaTime))) * R.num(((c).fields.get("m_fCamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
				if R.truth((((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))) or ((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and (float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))))):
					pass
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(minf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), R.num(R.call_member(c, "GetCameraPosLimit", []))))
		if R.truth((c).fields.get("m_bGoBackward")):
			pass
			((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = R.coerce(R.binary("-", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float((float(R.static_value("RDGameModeEditor", "CamSpeedZ")) * float(v_fDeltaTime))) * R.num(((c).fields.get("m_fCamFastFactor") if R.truth((c).fields.get("m_bGoFast")) else 1)))), "Number")
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) != float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
				pass
				((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(maxf(float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")), float(0)))
	(c).fields["m_bGoingForward"] = (float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) > float(v_fOldZ))
	if R.truth(((R.truth(R.logical_and((c).fields.get("m_SelectedEntity"), func(): return ((c).fields.get("m_SelectedEntity")).fields.get("m_bMovableInEditor"))) and R.truth((c).fields.get("m_bMouseDown"))) and (R.binary(">", R.call_static("Maths", "AbsNumber", [(R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX")) - float((c).fields.get("m_fMouseDownX")))]), 5) or R.binary(">", R.call_static("Maths", "AbsNumber", [(R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY")) - float((c).fields.get("m_fMouseDownY")))]), 5)))):
		pass
		(c).fields["m_bDraggingEntity"] = true
	R.call_member(c, "UpdateDraggedEntityPosition", [])
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))))):
		pass
		R.call_member(c, "UpdateAreaSpawning", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
			pass
			R.call_member(c, "UpdateCampaignSpawning", [v_fDeltaTime])
	return null


static func c1070_f_CanGoForward(c: Variant, a: Array) -> Variant:
	var v_group: Variant = null
	var v_iPatternPosition: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_areaInfo: Variant = null
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPatternPosition = R.coerce(0, "int")
	v_iAreaIndex = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))) and R.unary("!", (c).fields.get("m_bPreview")))):
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
			pass
			v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			if R.truth((float(v_iPatternPosition) >= float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) - float(1))))):
				pass
				return false
	return true
	return null


static func c1070_f_OnKeyDown(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnKeyDown"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnKeyDown", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
			pass
			(c).fields["m_bGoLeft"] = true
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
				pass
				(c).fields["m_bGoRight"] = true
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
					pass
					(c).fields["m_bGoForward"] = true
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
						pass
						(c).fields["m_bGoBackward"] = true
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
							pass
							(c).fields["m_bGoFast"] = true
						else:
							pass
							if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_Delete"))):
								pass
								R.call_member(c, "DeleteSelectedEntity", [])
							else:
								pass
								if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.static_value("Input", "Key_C"))):
									pass
									R.call_member(c, "CopySelectedEntity", [])
	return null


static func c1070_f_OnKeyUp(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnKeyUp"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnKeyUp", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iLeftKey"))):
			pass
			(c).fields["m_bGoLeft"] = false
		else:
			pass
			if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iRightKey"))):
				pass
				(c).fields["m_bGoRight"] = false
			else:
				pass
				if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iAccelKey"))):
					pass
					(c).fields["m_bGoForward"] = false
				else:
					pass
					if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iBrakeKey"))):
						pass
						(c).fields["m_bGoBackward"] = false
					else:
						pass
						if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iHandbrakeKey"))):
							pass
							(c).fields["m_bGoFast"] = false
	return null


static func c1070_f_OnMouseDown(c: Variant, a: Array) -> Variant:
	var v_bCanBePlaced: Variant = false
	var v_selectedEntity: Variant = null
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_bCanBePlaced = false
	v_selectedEntity = R.coerce(null, "RDEntity")
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseDown"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseDown", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
			pass
			if R.truth((c).fields.get("m_PlacedEntity")):
				pass
				v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
				if R.truth(v_bCanBePlaced):
					pass
					(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
					(c).fields["m_bDraggingEntity"] = false
				else:
					pass
					R.call_member(c.fields.get("m_Game"), "PlayErrorSound", [])
					(c).fields["m_bAllowCannotPlaceSound"] = false
			else:
				pass
				v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
				while R.truth(v_entityNode):
					pass
					v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
					if R.truth(R.unary("!", R.call_member(c, "CanEntityBeSelected", [v_entity]))):
						pass
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
					else:
						pass
						if R.truth(R.logical_or(R.invoke(R.get_value(R.call_member(v_entity, "GetBulletHitMC", []), "hitTestPoint"), [R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), true]), func(): return (R.truth(R.call_member(v_entity, "GetSecondaryBulletHitMC", [])) and R.truth(R.invoke(R.get_value(R.call_member(v_entity, "GetSecondaryBulletHitMC", []), "hitTestPoint"), [R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), true]))))):
							pass
							v_selectedEntity = R.coerce(v_entity, "RDEntity")
							((c).fields.get("m_vDragOffset")).fields["X"] = float((R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX")) - R.num(R.get_value((v_selectedEntity).fields.get("m_MainMC"), "x"))))
							((c).fields.get("m_vDragOffset")).fields["Y"] = float((R.num(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY")) - R.num(R.get_value((v_selectedEntity).fields.get("m_MainMC"), "y"))))
							(c).fields["m_fMouseDownX"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "Number")
							(c).fields["m_fMouseDownY"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "Number")
							break
						v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
				R.call_member(c, "SetSelectedEntity", [v_selectedEntity])
		(c).fields["m_bMouseDown"] = true
	return null


static func c1070_f_CanEntityBeSelected(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth(((R.truth(R.binary("as", v_entity, R.klass("RDRoadSlice"))) and R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))) and (float((c).fields.get("m_iPatternType")) != float(R.static_value("RDPatternInfo", "Type_Regular"))))):
		pass
		return false
	if R.truth((float(((v_entity).fields.get("m_vLocation")).fields.get("Z")) < float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))):
		pass
		return false
	return (R.unary("!", (v_entity).fields.get("m_bDestroyMe")) and (v_entity).fields.get("m_bSelectableInEditor"))
	return null


static func c1070_f_OnMouseUp(c: Variant, a: Array) -> Variant:
	var v_bCanBePlaced: Variant = false
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_bCanBePlaced = false
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseUp"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseUp", [v_event]), "Boolean")
	if R.truth(R.unary("!", v_bProcessed)):
		pass
		(c).fields["m_bMouseDown"] = false
		if R.truth((c).fields.get("m_PlacedEntity")):
			pass
			v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_PlacedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
			if R.truth((R.unary("!", v_bCanBePlaced) and (c).fields.get("m_bAllowCannotPlaceSound"))):
				pass
				R.call_member(c.fields.get("m_Game"), "PlayErrorSound", [])
		else:
			pass
			(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_bAllowCannotPlaceSound"] = true
	return null


static func c1070_f_OnMouseOver(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseOver"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseOver", [v_event]), "Boolean")
	if R.truth(v_bProcessed):
		pass
		pass
	return null


static func c1070_f_OnMouseOut(c: Variant, a: Array) -> Variant:
	var v_bProcessed: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeEditor"), "OnMouseOut"), [v_event])
	v_bProcessed = R.coerce(R.call_member((c).fields.get("m_Interface"), "OnMouseOut", [v_event]), "Boolean")
	if R.truth(v_bProcessed):
		pass
		pass
	return null


static func c1070_f_OnInterfaceObjectSelected(c: Variant, a: Array) -> Variant:
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce(v_szName, "String")
	(c).fields["m_PlacedEntity"] = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [(c).fields.get("m_szCurrentSelectedObjectClass")]), "RDEntity")
	R.call_member((c).fields.get("m_PlacedEntity"), "SetEditorMode", [])
	R.call_member(c, "SetSelectedEntity", [(c).fields.get("m_PlacedEntity")])
	(c).fields["m_bDraggingEntity"] = true
	((c).fields.get("m_vDragOffset")).fields["X"] = float(0)
	((c).fields.get("m_vDragOffset")).fields["Y"] = float(0)
	R.call_member(c, "UpdateDraggedEntityPosition", [])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_PlacedEntity"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Y"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")])
	R.call_member((c).fields.get("m_PlacedEntity"), "UpdateFlip", [])
	(c).fields["m_bAllowCannotPlaceSound"] = false
	return null


static func c1070_f_UpdateDraggedEntityPosition(c: Variant, a: Array) -> Variant:
	var v_fNewZ: Variant = NAN
	var v_fRoadLimit: Variant = NAN
	var v_fNewX: Variant = NAN
	var v_fNewY: Variant = NAN
	var v_bCanBePlaced: Variant = false
	v_fNewZ = float(NAN)
	v_fRoadLimit = float(NAN)
	v_fNewX = float(NAN)
	v_fNewY = float(NAN)
	v_bCanBePlaced = false
	if R.truth((c).fields.get("m_bDraggingEntity")):
		pass
		R.call_member(c, "UpdateMouseWorldPos", [])
		v_fNewZ = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("Z"), 0.1, (float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))]), "Number")
		v_fRoadLimit = R.coerce(R.call_member((c).fields.get("m_Road"), "GetRoadLimitAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Number")
		if R.truth(((c).fields.get("m_SelectedEntity")).fields.get("m_bUseCollisionInEditor")):
			pass
			v_fNewX = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("X"), (R.num(R.unary("-", v_fRoadLimit)) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("X"))), (float(v_fRoadLimit) - float((float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("X")) + float((((c).fields.get("m_SelectedEntity")).fields.get("m_CollisionBounds")).fields.get("W")))))]), "Number")
		else:
			pass
			v_fNewX = R.coerce(R.call_static("Maths", "Clamp", [((c).fields.get("m_vMouseWorldPos")).fields.get("X"), R.unary("-", v_fRoadLimit), v_fRoadLimit]), "Number")
		v_fNewY = float(0)
		v_fNewX = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "GetEditorAdjustedPosX", [v_fNewX]), "Number")
		R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "MoveEntity", [(c).fields.get("m_SelectedEntity"), (float(v_fNewX) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"))), (float(v_fNewY) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Y"))), (float(v_fNewZ) - float((((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z"))), null, null, false])
		R.call_member((c).fields.get("m_SelectedEntity"), "UpdateFlip", [])
		v_bCanBePlaced = R.coerce(R.call_member((c).fields.get("m_SelectedEntity"), "CanBePlacedInEditorAt", [(((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_SelectedEntity")).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
		R.set_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "CannotPlaceIcon"), "visible", R.unary("!", v_bCanBePlaced), "=")
		if R.truth(R.unary("!", v_bCanBePlaced)):
			pass
			(c).fields["m_PlacedEntity"] = R.coerce((c).fields.get("m_SelectedEntity"), "RDEntity")
	return null


static func c1070_f_UpdateMouseWorldPos(c: Variant, a: Array) -> Variant:
	var v_bIntersect: Variant = false
	((c).fields.get("m_vMouseScreenPos")).fields["X"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseX"), "Number")
	((c).fields.get("m_vMouseScreenPos")).fields["Y"] = R.coerce(R.get_value((c.fields.get("m_Game")).fields.get("m_RootMC"), "mouseY"), "Number")
	if R.truth((c).fields.get("m_bDraggingEntity")):
		pass
		((c).fields.get("m_vMouseScreenPos")).fields["X"] = R.coerce(R.binary("-", ((c).fields.get("m_vMouseScreenPos")).fields.get("X"), ((c).fields.get("m_vDragOffset")).fields.get("X")), "Number")
		((c).fields.get("m_vMouseScreenPos")).fields["Y"] = R.coerce(R.binary("-", ((c).fields.get("m_vMouseScreenPos")).fields.get("Y"), ((c).fields.get("m_vDragOffset")).fields.get("Y")), "Number")
	R.call_member(c.fields.get("m_Camera"), "Unproject2DToDir3D", [(c).fields.get("m_vMouseScreenPos"), (c).fields.get("m_vMouseWorldDir")])
	v_bIntersect = R.coerce(R.call_static("Maths", "RayPlaneIntersection", [(c.fields.get("m_Camera")).fields.get("m_vLocation"), (c).fields.get("m_vMouseWorldDir"), R.static_value("DTVector3D", "Zero"), R.static_value("DTVector3D", "Up"), (c).fields.get("m_vMouseWorldPos")]), "Boolean")
	return null


static func c1070_f_DeleteSelectedEntity(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce("", "String")
	if R.truth((R.truth((c).fields.get("m_SelectedEntity")) and ((c).fields.get("m_SelectedEntity")).fields.get("m_bDeletableInEditor"))):
		pass
		((c).fields.get("m_SelectedEntity")).fields["m_bDestroyMe"] = true
		R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
	return null


static func c1070_f_CopySelectedEntity(c: Variant, a: Array) -> Variant:
	if R.truth(((R.truth((c).fields.get("m_SelectedEntity")) and R.truth(((c).fields.get("m_SelectedEntity")).fields.get("m_bDeletableInEditor"))) and R.unary("!", (c).fields.get("m_bDraggingEntity")))):
		pass
		(c).fields["m_PlacedEntity"] = R.coerce(R.call_member(R.static_value("RDEntityFactory", "Instance"), "Create", [((c).fields.get("m_SelectedEntity")).fields.get("m_szFactoryName")]), "RDEntity")
		R.call_member((c).fields.get("m_PlacedEntity"), "SetEditorMode", [])
		R.call_member(c, "SetSelectedEntity", [(c).fields.get("m_PlacedEntity")])
		(c).fields["m_bDraggingEntity"] = true
		((c).fields.get("m_vDragOffset")).fields["X"] = float(0)
		((c).fields.get("m_vDragOffset")).fields["Y"] = float(0)
		R.call_member(c, "UpdateDraggedEntityPosition", [])
		R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_PlacedEntity"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("X"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Y"), (((c).fields.get("m_PlacedEntity")).fields.get("m_vLocation")).fields.get("Z")])
		R.call_member((c).fields.get("m_PlacedEntity"), "UpdateFlip", [])
		(c).fields["m_bAllowCannotPlaceSound"] = false
	return null


static func c1070_f_OnUnselect(c: Variant, a: Array) -> Variant:
	(c).fields["m_szCurrentSelectedObjectClass"] = R.coerce("", "String")
	R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	(c).fields["m_PlacedEntity"] = R.coerce(null, "RDEntity")
	return null


static func c1070_f_ToggleMusic(c: Variant, a: Array) -> Variant:
	(c).fields["m_iMusic"] = R.coerce(R.binary("%", (float((c).fields.get("m_iMusic")) + float(1)), 5), "int")
	R.call_member(c, "PlayEditorMusic", [])
	return null


static func c1070_f_PlayEditorMusic(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [null])
	if R.truth((float((c).fields.get("m_iMusic")) == float(1))):
		pass
		R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_MenuMusic"), 0])
	else:
		pass
		if R.truth((float((c).fields.get("m_iMusic")) == float(2))):
			pass
			R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
		else:
			pass
			if R.truth((float((c).fields.get("m_iMusic")) == float(3))):
				pass
				R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_GameMusic"), 0])
			else:
				pass
				if R.truth((float((c).fields.get("m_iMusic")) == float(4))):
					pass
					R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_HighwayMusic"), 0])
	return null


static func c1070_f_SetSelectedEntity(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	if R.truth((c).fields.get("m_SelectedEntity")):
		pass
		R.call_member(c, "HighlightEntity", [(c).fields.get("m_SelectedEntity"), false])
	(c).fields["m_SelectedEntity"] = R.coerce(v_entity, "RDEntity")
	if R.truth((c).fields.get("m_SelectedEntity")):
		pass
		R.call_member(c, "HighlightEntity", [(c).fields.get("m_SelectedEntity"), true])
	R.call_member((c).fields.get("m_Interface"), "OnEntitySelected", [(c).fields.get("m_SelectedEntity")])
	return null


static func c1070_f_HighlightEntity(c: Variant, a: Array) -> Variant:
	var v_newColor: Variant = null
	var v_newFilters: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	var v_bHighlight: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_newColor = R.coerce(null, "Color")
	v_newFilters = R.coerce(null, "Array")
	if R.truth(R.unary("!", v_entity)):
		pass
		return null
	if R.truth(R.binary("as", v_entity, R.klass("RDRoadSlice"))):
		pass
		v_newColor = R.coerce(R.construct(R.klass("fl.motion.Color"), []), "Color")
		if R.truth(v_bHighlight):
			pass
			R.set_value(v_newColor, "redMultiplier", 0.8, "=")
			R.set_value(v_newColor, "greenMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueMultiplier", 0.8, "=")
			R.set_value(v_newColor, "blueOffset", 30, "=")
		R.set_value(R.get_value((v_entity).fields.get("m_MainMC"), "transform"), "colorTransform", v_newColor, "=")
	else:
		pass
		v_newFilters = R.coerce(R.construct(R.klass("Array"), []), "Array")
		if R.truth(v_bHighlight):
			pass
			R.invoke(R.get_value(v_newFilters, "push"), [R.construct(R.resolve(c, "GlowFilter", "RDGameModeEditor"), [187, 0.7])])
		R.set_value((v_entity).fields.get("m_MainMC"), "filters", v_newFilters, "=")
	return null


static func c1070_f_OnRoadSelected(c: Variant, a: Array) -> Variant:
	var v_roadSlice: Variant = null
	var v_iSliceType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_roadSlice = R.coerce(R.binary("as", (c).fields.get("m_SelectedEntity"), R.klass("RDRoadSlice")), "RDRoadSlice")
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, (v_roadSlice).fields.get("m_iIndex")])
	R.call_member(c, "DeleteUnplacableEntities", [])
	return null


static func c1070_f_DeleteUnplacableEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_bCanBePlaced: Variant = false
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	v_bCanBePlaced = false
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bSelectableInEditor") and (v_entity).fields.get("m_bDeletableInEditor"))):
			pass
			v_bCanBePlaced = R.coerce(R.call_member(v_entity, "CanBePlacedInEditorAt", [((v_entity).fields.get("m_vLocation")).fields.get("X"), ((v_entity).fields.get("m_vLocation")).fields.get("Z")]), "Boolean")
			if R.truth(R.unary("!", v_bCanBePlaced)):
				pass
				(v_entity).fields["m_bDestroyMe"] = true
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null


static func c1070_f_GetPatternData(c: Variant, a: Array) -> Variant:
	var v_entityNode: Variant = null
	var v_entity: Variant = null
	var v_iNbProperties: Variant = 0
	var v_i: Variant = 0
	var v_prop: Variant = null
	var v_savedData: Variant = null
	var v_iNbEntities: Variant = 0
	v_entityNode = R.coerce(null, "RDEntityNode")
	v_entity = R.coerce(null, "RDEntity")
	v_iNbProperties = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_prop = R.coerce(null, "RDProperty")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [(c).fields.get("m_iPatternType")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 0)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 1)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 2)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 3)])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_Road")).fields.get("m_RoadSlices"), 4)])
	v_iNbEntities = R.coerce(0, "int")
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bDestroyMe") or R.unary("!", (v_entity).fields.get("m_bExportableInEditor")))):
			pass
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
		else:
			pass
			v_iNbEntities = R.signed32(v_iNbEntities + 1)
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbEntities])
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bDestroyMe") or R.unary("!", (v_entity).fields.get("m_bExportableInEditor")))):
			pass
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
		else:
			pass
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_entity).fields.get("m_szFactoryName")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("X")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("Y")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [((v_entity).fields.get("m_vLocation")).fields.get("Z")])
			v_iNbProperties = R.coerce((R.coerce(R.get_value((v_entity).fields.get("m_Properties"), "length"), "int") if R.truth((v_entity).fields.get("m_Properties")) else 0), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbProperties])
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbProperties))):
				pass
				v_prop = R.coerce(R.get_value((v_entity).fields.get("m_Properties"), v_i), "RDProperty")
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_prop).fields.get("m_szName")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [(v_prop).fields.get("m_iType")])
				if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Number")))):
					pass
					R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_prop).fields.get("m_fNumberValue")])
				else:
					pass
					if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_Boolean")))):
						pass
						R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_prop).fields.get("m_bBooleanValue")])
					else:
						pass
						if R.truth((float((v_prop).fields.get("m_iType")) == float(R.static_value("RDProperty", "Type_String")))):
							pass
							R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_prop).fields.get("m_szStringValue")])
				v_i = R.signed32(v_i + 1)
			v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return v_savedData
	return null


static func c1070_f_SaveFile(c: Variant, a: Array) -> Variant:
	var v_savedData: Variant = null
	var v_szSavedData: Variant = null
	var v_iconData: Variant = null
	var v_matrix: Variant = null
	var v_kongIcon: Variant = null
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bAsPrivate: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_savedData = R.coerce(null, "ByteArray")
	v_szSavedData = R.coerce(null, "String")
	v_iconData = R.coerce(null, "BitmapData")
	v_matrix = R.coerce(null, "Matrix")
	v_kongIcon = R.coerce(null, "Bitmap")
	(c).fields["m_iDataType"] = R.coerce(v_iDataType, "int")
	(c).fields["m_bSavedAsPrivate"] = v_bAsPrivate
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["m_szFileCategory"] = R.coerce(("PrivatePatterns" if R.truth(v_bAsPrivate) else "Patterns"), "String")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["m_szFileCategory"] = R.coerce(("PrivateAreas" if R.truth(v_bAsPrivate) else "Areas"), "String")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["m_szFileCategory"] = R.coerce(("PrivateCampaigns" if R.truth(v_bAsPrivate) else "Campaigns"), "String")
	if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Newgrounds")])):
		pass
		R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
		(c).fields["m_fAPITimeoutTimer"] = float(10)
		(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [(c).fields.get("m_szFileCategory")]), "SaveQuery")
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "FILE_NAME"), "=", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text")])
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_ID"), "=", R.get_value(R.klass("com.newgrounds.API"), "userId")])
		R.call_member((c).fields.get("_query"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnSaveFileQueryDone"), false, 0, true])
		R.call_member((c).fields.get("_query"), "execute", [])
	else:
		pass
		if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_Kongregate")])):
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
				pass
				v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
			else:
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
					pass
					v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
				else:
					pass
					if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
						pass
						v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
			v_szSavedData = R.coerce(R.invoke(R.resolve(c, "EncodeData", "RDGameModeEditor"), [v_savedData]), "String")
			v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
			v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
			R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
			R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
			R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
			v_kongIcon = R.coerce(R.construct(R.klass("Bitmap"), [v_iconData]), "Bitmap")
			R.invoke(R.get_value(R.get_value((c.fields.get("m_Game")).fields.get("m_KongregateAPI"), "sharedContent"), "save"), [(c).fields.get("m_szFileCategory"), v_szSavedData, R.get_value(c, "OnKongFileSaved"), v_kongIcon])
		else:
			pass
			if R.truth(R.call_static("BasicGame", "HasAPI", [R.static_value("BasicGame", "API_ArmorGames")])):
				pass
				if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
					pass
					v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
				else:
					pass
					if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
						pass
						v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
					else:
						pass
						if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
							pass
							v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
				v_szSavedData = R.coerce(R.invoke(R.resolve(c, "EncodeData", "RDGameModeEditor"), [v_savedData]), "String")
				v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
				v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
				R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
				R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
				R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
				R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "initAGUI"), [{"onClose": R.get_value(c, "OnArmorGamesSubmitClose")}])
				R.invoke(R.get_value((c.fields.get("m_Game")).fields.get("m_ArmorGamesAPI"), "showGameShareSubmit"), [v_szSavedData, R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text"), v_iconData, R.get_value(c, "OnArmorGamesShareDataClicked"), (c.fields.get("m_Game")).fields.get("m_RootMC")])
	return null


static func c1070_f_OnArmorGamesShareDataClicked(c: Variant, a: Array) -> Variant:
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_data, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "name")])
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "data")])
	else:
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.get_value(v_data, "error")])
	return null


static func c1070_f_OnKongFileSaved(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(v_params, "success")):
		pass
		R.invoke(R.resolve(c, "trace", "RDGameModeEditor"), [R.binary("+", R.binary("+", R.binary("+", "Content saved, id:", R.get_value(v_params, "id")), ", name:"), R.get_value(v_params, "name"))])
	return null


static func c1070_f_OnKongCampaignLoad(c: Variant, a: Array) -> Variant:
	var v_params: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	R.call_member((c).fields.get("m_Interface"), "OnKongCampaignLoad", [v_params])
	return null


static func c1070_f_OnSaveFileQueryDone(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	if R.truth(R.binary(">", R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), "length"), 0)):
		pass
		(c).fields["m_SaveFile"] = R.coerce(R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), 0), "com.newgrounds.SaveFile")
		R.call_member(c.fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_OverwriteFile")])
	else:
		pass
		R.call_member(c.fields.get("m_Game"), "ShowConfirmation", [R.static_value("RDGame", "Confirmation_ConfirmSave")])
	return null


static func c1070_f_AcceptSave(c: Variant, a: Array) -> Variant:
	(c).fields["m_SaveFile"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveFile", [(c).fields.get("m_szFileCategory")]), "com.newgrounds.SaveFile")
	R.set_value((c).fields.get("m_SaveFile"), "name", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "NameValue"), "text"), "=")
	R.set_value((c).fields.get("m_SaveFile"), "description", R.get_value(R.get_value(R.get_value(((c).fields.get("m_Interface")).fields.get("m_MC"), "SavePanel"), "DescriptionValue"), "text"), "=")
	R.call_member(c, "FinalizeSaveFile", [])
	return null


static func c1070_f_AcceptOverwrite(c: Variant, a: Array) -> Variant:
	R.call_member(c, "FinalizeSaveFile", [])
	return null


static func c1070_f_FinalizeSaveFile(c: Variant, a: Array) -> Variant:
	var v_savedData: Variant = null
	var v_iconData: Variant = null
	var v_matrix: Variant = null
	v_savedData = R.coerce(null, "ByteArray")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		v_savedData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			v_savedData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				v_savedData = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
	R.set_value((c).fields.get("m_SaveFile"), "data", v_savedData, "=")
	v_iconData = R.coerce(R.construct(R.klass("BitmapData"), [((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), true, 0]), "BitmapData")
	v_matrix = R.coerce(R.construct(R.klass("Matrix"), []), "Matrix")
	R.invoke(R.get_value(v_matrix, "translate"), [R.binary("/", R.unary("-", (float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iWidth")) - float(((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")))), 2), 0])
	R.invoke(R.get_value(v_iconData, "draw"), [(c.fields.get("m_Game")).fields.get("m_WorldLayer"), v_matrix])
	R.invoke(R.get_value(v_iconData, "copyPixels"), [v_iconData, R.construct(R.klass("Rectangle"), [0, 0, ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight"), ((c.fields.get("m_Game")).fields.get("m_Viewport")).fields.get("m_iHeight")]), R.construct(R.klass("Point"), [0, 0])])
	R.call_member((c).fields.get("m_SaveFile"), "createIcon", [v_iconData])
	R.set_value(R.get_value((c).fields.get("m_SaveFile"), "keys"), "FileVersion", R.static_value("RDGame", "CurrentFileVersion"), "=")
	R.call_member((c).fields.get("m_SaveFile"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), R.get_value(c, "OnSaveDataDone"), false, 0, true])
	R.call_member((c).fields.get("m_SaveFile"), "save", [])
	return null


static func c1070_f_OnSaveDataDone(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	R.call_member((c).fields.get("m_SaveFile"), "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_SAVED"), R.get_value(c, "OnSaveDataDone")])
	(c).fields["m_SaveFile"] = R.coerce(null, "com.newgrounds.SaveFile")
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		R.call_member((c).fields.get("m_Interface"), "OnPatternPosted", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			R.call_member((c).fields.get("m_Interface"), "OnAreaPosted", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				R.call_member((c).fields.get("m_Interface"), "OnCampaignPosted", [])
	if R.truth((((float((c).fields.get("m_iDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign"))) and R.unary("!", (c).fields.get("m_bSavedAsPrivate"))) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "Mastermind"))))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "Mastermind")])
	return null


static func c1070_f_CancelLoadFiles(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	R.call_static("com.newgrounds.API", "stopPendingCommands", [])
	if R.truth((R.truth((c).fields.get("m_LoadedFiles")) and R.binary("<", (c).fields.get("m_iLoadFileIndex"), R.get_value((c).fields.get("m_LoadedFiles"), "length")))):
		pass
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
		R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	return null


static func c1070_f_LoadFiles(c: Variant, a: Array) -> Variant:
	var v_bSortDescending: Variant = false
	var v_iDataType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_bPrivate: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_iSorting: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_iPage: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	(c).fields["m_iLoadDataType"] = R.coerce(v_iDataType, "int")
	(c).fields["m_iLoadDataSorting"] = R.coerce(v_iSorting, "int")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	R.call_member((c).fields.get("m_Interface"), "ClearLoadPanelSlots", [])
	v_bSortDescending = (float(v_iSorting) != float(R.static_value("RDGameModeEditor", "Sorting_Worst")))
	if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))):
		pass
		(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivatePatterns" if R.truth(v_bPrivate) else "Patterns")]), "SaveQuery")
	else:
		pass
		if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))):
			pass
			(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivateAreas" if R.truth(v_bPrivate) else "Areas")]), "SaveQuery")
		else:
			pass
			if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
				pass
				(c).fields["_query"] = R.coerce(R.call_static("com.newgrounds.API", "createSaveQuery", [("PrivateCampaigns" if R.truth(v_bPrivate) else "Campaigns")]), "SaveQuery")
	R.set_value((c).fields.get("_query"), "resultsPerPage", 18, "=")
	R.set_value((c).fields.get("_query"), "page", (float(v_iPage) + float(1)), "=")
	R.call_member((c).fields.get("_query"), "addCondition", ["FileVersion", "<=", R.static_value("RDGame", "CurrentFileVersion")])
	if R.truth(v_bPrivate):
		pass
		R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), "=", R.get_value(R.klass("com.newgrounds.API"), "username")])
	else:
		pass
		if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Yours")))):
			pass
			R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
		else:
			pass
			if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Recent")))):
				pass
				R.call_member((c).fields.get("_query"), "sortOn", [R.static_value("com.newgrounds.SaveQuery", "CREATED_ON"), true])
			else:
				pass
				if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Best")))):
					pass
					R.call_member((c).fields.get("_query"), "sortOn", ["Rating", true])
				else:
					pass
					if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Worst")))):
						pass
						R.call_member((c).fields.get("_query"), "sortOn", ["Rating", false])
					else:
						pass
						if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Unrated")))):
							pass
							R.call_member((c).fields.get("_query"), "addCondition", ["Rating.votes", "=", 0])
						else:
							pass
							if R.truth((float(v_iSorting) == float(R.static_value("RDGameModeEditor", "Sorting_Random")))):
								pass
								R.set_value((c).fields.get("_query"), "isRandomized", true, "=")
		if R.truth((float((c).fields.get("m_iLoadDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign")))):
			pass
			R.call_member((c).fields.get("_query"), "addCondition", [R.static_value("com.newgrounds.SaveQuery", "AUTHOR_NAME"), "=", R.get_value(R.klass("com.newgrounds.API"), "username")])
	R.call_member((c).fields.get("_query"), "addEventListener", [R.static_value("com.newgrounds.APIEvent", "QUERY_COMPLETE"), R.get_value(c, "OnLoadFilesDone"), false, 0, true])
	R.call_member((c).fields.get("_query"), "execute", [])
	return null


static func c1070_f_OnLoadFilesDone(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	v_i = R.coerce(0, "int")
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	v_slotMC = R.coerce(null, "MovieClip")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	(c).fields["_queryResults"] = R.coerce(R.get_value(R.get_value(v_e, "data"), "files"), "Array")
	(c).fields["m_LoadedFiles"] = R.coerce(R.construct(R.klass("Array"), [R.get_value((c).fields.get("_queryResults"), "length")]), "Array")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_queryResults"), "length"))):
		pass
		v_file = R.coerce(R.get_value(R.get_value(R.get_value(v_e, "data"), "files"), v_i), "com.newgrounds.SaveFile")
		R.set_value((c).fields.get("m_LoadedFiles"), v_i, v_file, "=")
		v_i = R.signed32(v_i + 1)
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), "length"))):
		pass
		v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), v_i)]), "MovieClip")
		R.set_value(R.get_value(v_slotMC, "Loading"), "visible", R.binary("<", v_i, R.get_value((c).fields.get("m_LoadedFiles"), "length")), "=")
		R.set_value(v_slotMC, "mouseEnabled", false, "=")
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	R.call_member(c, "LoadFile", [0])
	return null


static func c1070_f_LoadFile(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(null, "com.newgrounds.SaveFile")
	if R.truth(R.binary("<", v_iIndex, R.get_value((c).fields.get("m_LoadedFiles"), "length"))):
		pass
		(c).fields["m_iLoadFileIndex"] = R.coerce(v_iIndex, "int")
		v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
		R.call_member(v_file, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded"), false, 0, true])
		R.call_member(v_file, "load", [])
	return null


static func c1070_f_OnFileLoaded(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_slotMC: Variant = null
	var v_iconBitmap: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), (c).fields.get("m_iLoadFileIndex")), "com.newgrounds.SaveFile")
	R.call_member(v_file, "removeEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_LOADED"), R.get_value(c, "OnFileLoaded")])
	v_slotMC = R.coerce(R.invoke(R.klass("MovieClip"), [R.get_value(((c).fields.get("m_Interface")).fields.get("m_LoadPanelSlots"), (c).fields.get("m_iLoadFileIndex"))]), "MovieClip")
	R.set_value(R.get_value(v_slotMC, "Loading"), "visible", false, "=")
	R.set_value(v_slotMC, "mouseEnabled", true, "=")
	v_iconBitmap = R.coerce(R.construct(R.klass("Bitmap"), [R.get_value(v_file, "icon")]), "Bitmap")
	R.invoke(R.get_value(v_slotMC, "addChild"), [v_iconBitmap])
	R.set_value(c, "m_iLoadFileIndex", 1, "+=")
	R.call_member(c, "LoadFile", [(c).fields.get("m_iLoadFileIndex")])
	return null


static func c1070_f_TestPattern(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c.fields.get("m_Game"), "PlayCustomPattern", [R.call_member(c, "GetPatternData", [])])
	return null


static func c1070_f_NewPattern(c: Variant, a: Array) -> Variant:
	var v_iSliceType: Variant = 0
	var v_iPatternType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iSliceType = R.coerce(0, "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_iPatternType"] = R.coerce(v_iPatternType, "int")
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Pattern")])
	if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Regular")))):
		pass
		v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Town"), "int")
	else:
		pass
		if R.truth((float(v_iPatternType) == float(R.static_value("RDPatternInfo", "Type_Highway")))):
			pass
			v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Highway"), "int")
		else:
			pass
			v_iSliceType = R.coerce(R.static_value("RDRoad", "SliceType_Alleyway"), "int")
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 0])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 1])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 2])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 3])
	R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [v_iSliceType, 4])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	return null


static func c1070_f_LoadPatternFileData(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_LoadedPatternFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedPatternFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedPatternFileRated"] = false
	v_patternData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedPatternFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null


static func c1070_f_LoadPatternFileDataString(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	(c).fields["m_bLoadedPatternFileOwned"] = false
	(c).fields["m_bLoadedPatternFileRated"] = false
	v_patternData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null


static func c1070_f_GetAreaData(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_savedData: Variant = null
	var v_i: Variant = 0
	var v_areaInfo: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDAreaInfo")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"))):
		pass
		v_patternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_i), R.klass("RDPatternInfo")), "RDPatternInfo")
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szName")])
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szDescription")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_patternInfo).fields.get("m_iID")])
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szAuthorName")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Data"), "length")])
		R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Data")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Icon"), "length")])
		R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Icon")])
		v_i = R.signed32(v_i + 1)
	return v_savedData
	return null


static func c1070_f_LoadAreaData(c: Variant, a: Array) -> Variant:
	var v_iFileVersion: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	var v_bNewArea: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	v_iFileVersion = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	if R.truth(v_bNewArea):
		pass
		R.call_member(c, "NewArea", [])
	if R.truth(v_savedData):
		pass
		R.set_value(v_savedData, "position", 0, "=")
		v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
			pass
			v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_i = R.coerce(0, "int")
			while R.truth((float(v_i) < float(v_iNbPatterns))):
				pass
				v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
				(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
				v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
				R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
				R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
				R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
				(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
				R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
				R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
				v_i = R.signed32(v_i + 1)
	R.call_member(c, "ResetAreaSpawning", [])
	return null


static func c1070_f_UpdateAreaSpawning(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = 0
	var v_patternInfo: Variant = null
	var v_iPatternPosition: Variant = 0
	v_iIndex = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	if R.truth((c).fields.get("m_bGoingForward")):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
	while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
		pass
		if R.truth(R.binary(">", R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)):
			pass
			v_iIndex = R.coerce(R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), R.binary("%", (c).fields.get("m_iCurrentPatternPosition"), R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
			v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
			(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
			R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
			if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
				pass
				R.call_member(c, "RemoveAreaPatternEntities", [0])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
				R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
		R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
	while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
		pass
		if R.truth(R.binary(">", R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"), 0)):
			pass
			R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
			R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
			v_iIndex = R.coerce(R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), R.binary("%", v_iPatternPosition, R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
			v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
			R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
			(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
			R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
		R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
	if R.truth(R.unary("!", (c).fields.get("m_bGoingForward"))):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	return null


static func c1070_f_RemoveAreaPatternEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_patternEntities: Variant = null
	var v_j: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_entity = R.coerce(null, "RDEntity")
	v_patternEntities = R.coerce(R.get_value((c).fields.get("m_AreaPatternEntities"), v_iIndex), "Array")
	v_j = R.coerce(0, "int")
	while R.truth(R.binary("<", v_j, R.get_value(v_patternEntities, "length"))):
		pass
		v_entity = R.coerce(R.get_value(v_patternEntities, v_j), "RDEntity")
		(v_entity).fields["m_bDestroyMe"] = true
		v_j = R.signed32(v_j + 1)
	return null


static func c1070_f_ResetAreaSpawning(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	v_i = R.coerce(0, "int")
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_iCurrentPatternPosition"] = R.coerce(0, "int")
	(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_AreaPatternEntities"), "length"))):
		pass
		R.call_member(c, "RemoveAreaPatternEntities", [v_i])
		v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float((R.num(R.get_value((((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "length")) * float(10))))):
		pass
		R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_RandomPatternsIndices"), "push"), [R.binary("as", R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "Reset", [])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	return null


static func c1070_f_ResetAreaPatternIndices(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.invoke(R.get_value((((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length"))):
		pass
		R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [v_i])
		v_i = R.signed32(v_i + 1)
	return null


static func c1070_f_ResetGroupAreaIndices(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_group: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDAreaGroup")
	R.invoke(R.get_value(((v_group).fields.get("m_AreaIndices")).fields.get("m_Values"), "splice"), [0])
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((v_group).fields.get("m_Areas"), "length"))):
		pass
		R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [v_i])
		v_i = R.signed32(v_i + 1)
	return null


static func c1070_f_OnEntityAddedToWorld(c: Variant, a: Array) -> Variant:
	var v_patternEntities: Variant = null
	var v_entity: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDEntity")
	v_patternEntities = R.coerce(null, "Array")
	if R.truth((((c).fields.get("m_bPreview") and ((float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))) or (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Campaign"))))) or (R.unary("!", (c).fields.get("m_bPreview")) and ((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))) or (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))))))):
		pass
		v_patternEntities = R.coerce(R.get_value((c).fields.get("m_AreaPatternEntities"), (c).fields.get("m_iLoadPatternIndex")), "Array")
		R.invoke(R.get_value(v_patternEntities, "push"), [v_entity])
	return null


static func c1070_f_TestArea(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomArea", [R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")])])
	return null


static func c1070_f_NewArea(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(12))):
		pass
		R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_Town"), v_i])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Area")])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "splice"), [0])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "Clear", [])
	(c).fields["m_AreaPatternEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null


static func c1070_f_LoadAreaFileData(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member(c, "NewArea", [])
	(c).fields["m_LoadedAreaFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedAreaFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedAreaFileRated"] = false
	v_areaData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedAreaFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	return null


static func c1070_f_LoadAreaFileDataString(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.call_member(c, "NewArea", [])
	(c).fields["m_bLoadedAreaFileOwned"] = false
	(c).fields["m_bLoadedAreaFileRated"] = false
	v_areaData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	return null


static func c1070_f_GetCampaignData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_t: Variant = 0
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_savedData: Variant = null
	var v_iNbDialogs: Variant = 0
	var v_g: Variant = 0
	v_i = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_savedData = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.static_value("RDGame", "CurrentFileVersion")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iType")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGoal")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGoalTarget")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bTiresBlown")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAirStrikes")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoWeapons")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoAmmoPoints")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoReplenish")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteAmmo")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInvincibleHellfire")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBounceFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerSpeedFactor")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedMG")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bMountedRocketLauncher")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bInfiniteMountedWeapon")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoDriverSwitch")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bArcadeAmmoPickup")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSteering")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBraking")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSwerving")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerVehicleHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fPlayerBodyHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieSpeedFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fOilSlipperinessFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fImpactSpeedLossFactor")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fVehicleHPFactor")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bExplodingZombies")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAlwaysCling")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bFog")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoChopperSupport")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fStartingTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fZombieHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fMutantKilledTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fClingerOffTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fFeedersHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fCivilianHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierShotDownTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierHitTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fSoldierClingerOffTime")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fHellfireDefeatedTime")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iDifficultyLevelLength")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBasePatternRatio")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditivePatternRatio")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseSpawnRate")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveSpawnRate")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iBombSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iOilLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iSpikeLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iMineLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iExplodingCarLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iGrubLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iZombieLevel")])
	R.invoke(R.get_value(v_savedData, "writeInt"), [((c).fields.get("m_CampaignInfo")).fields.get("m_iBaseSoldierLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseHellfireLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveHellfireLevel")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseJetDrops")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveJetDrops")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantDelay")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fBaseMutantCount")])
	R.invoke(R.get_value(v_savedData, "writeFloat"), [((c).fields.get("m_CampaignInfo")).fields.get("m_fAdditiveMutantCount")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bRandomizeSpawningValues")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoSoldierZombie")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bAllSoldierZombie")])
	R.invoke(R.get_value(v_savedData, "writeBoolean"), [((c).fields.get("m_CampaignInfo")).fields.get("m_bFUBARMode")])
	v_iNbDialogs = R.coerce(R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "length"), "int"), "int")
	R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbDialogs])
	v_t = R.coerce(0, "int")
	while R.truth((float(v_t) < float(v_iNbDialogs))):
		pass
		R.invoke(R.get_value(v_savedData, "writeUTF"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), v_t)])
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), v_t)])
		v_t = R.signed32(v_t + 1)
	R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length")])
	v_g = R.coerce(0, "int")
	while R.truth(R.binary("<", v_g, R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
		pass
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_g), "RDAreaGroup")
		R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_group).fields.get("m_szName")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_group).fields.get("m_iMinLength")])
		R.invoke(R.get_value(v_savedData, "writeInt"), [(v_group).fields.get("m_iMaxLength")])
		R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_group).fields.get("m_bCanBeFirst")])
		R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_group).fields.get("m_bRandomized")])
		v_iNbLinkedGroups = R.coerce(R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), "length"), "int"), "int")
		R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbLinkedGroups])
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
			pass
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_group).fields.get("m_LinkedGroups"), v_i)])
			v_i = R.signed32(v_i + 1)
		R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_group).fields.get("m_Areas"), "length")])
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((v_group).fields.get("m_Areas"), "length"))):
			pass
			v_areaInfo = R.coerce(R.binary("as", R.get_value((v_group).fields.get("m_Areas"), v_i), R.klass("RDAreaInfo")), "RDAreaInfo")
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szName")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szDescription")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iID")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szAuthorName")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iType")])
			R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_areaInfo).fields.get("m_szAreaName")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iAreaLength")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bAllowFlip")])
			v_iNbDialogs = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "length"), "int"), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iNbDialogs])
			v_t = R.coerce(0, "int")
			while R.truth((float(v_t) < float(v_iNbDialogs))):
				pass
				R.invoke(R.get_value(v_savedData, "writeUTF"), [R.get_value((v_areaInfo).fields.get("m_DialogTexts"), v_t)])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_DialogCues"), v_t)])
				v_t = R.signed32(v_t + 1)
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOverrideSpawning")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fHellfireDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iHellfireLevel")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fJetDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iJetDrops")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fMutantDelay")])
			R.invoke(R.get_value(v_savedData, "writeInt"), [(v_areaInfo).fields.get("m_iMutantCount")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bRandomizeSpawningValues")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fPlayerSpeedFactor")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFullSpeedMode")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bLavaMode")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bLavaInstantKill")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFog")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fForcedStopDuration")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOverrideDifficulty")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fPatternRatio")])
			R.invoke(R.get_value(v_savedData, "writeFloat"), [(v_areaInfo).fields.get("m_fSpawnRate")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bSpikeSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bBombSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bOil")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bSpike")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bMine")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bExplodingCar")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bGrub")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bBaseSoldier")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bNoSoldierZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bAllSoldierZombie")])
			R.invoke(R.get_value(v_savedData, "writeBoolean"), [(v_areaInfo).fields.get("m_bFUBARMode")])
			v_iDataSize = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_Data"), "length"), "int"), "int")
			R.invoke(R.get_value(v_savedData, "writeInt"), [v_iDataSize])
			R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")])
			v_j = R.coerce(0, "int")
			while R.truth(R.binary("<", v_j, R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"))):
				pass
				v_patternInfo = R.coerce(R.binary("as", R.get_value((v_areaInfo).fields.get("m_Patterns"), v_j), R.klass("RDPatternInfo")), "RDPatternInfo")
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szName")])
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szDescription")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [(v_patternInfo).fields.get("m_iID")])
				R.invoke(R.get_value(v_savedData, "writeUTF"), [(v_patternInfo).fields.get("m_szAuthorName")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Data"), "length")])
				R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
				R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Data")])
				R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_patternInfo).fields.get("m_Icon"), "length")])
				R.set_value((v_patternInfo).fields.get("m_Icon"), "position", 0, "=")
				R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_patternInfo).fields.get("m_Icon")])
				v_j = R.signed32(v_j + 1)
			R.invoke(R.get_value(v_savedData, "writeInt"), [R.get_value((v_areaInfo).fields.get("m_Icon"), "length")])
			R.set_value((v_areaInfo).fields.get("m_Icon"), "position", 0, "=")
			R.invoke(R.get_value(v_savedData, "writeBytes"), [(v_areaInfo).fields.get("m_Icon")])
			v_i = R.signed32(v_i + 1)
		v_g = R.signed32(v_g + 1)
	return v_savedData
	return null


static func c1070_f_LoadCampaignData(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_iFileVersion: Variant = 0
	var v_iCampaignType: Variant = 0
	var v_iNbDialogs: Variant = 0
	var v_t: Variant = 0
	var v_iNbGroups: Variant = 0
	var v_g: Variant = 0
	var v_group: Variant = null
	var v_iNbLinkedGroups: Variant = 0
	var v_iNbAreas: Variant = 0
	var v_areaInfo: Variant = null
	var v_iDataSize: Variant = 0
	var v_iNbPatterns: Variant = 0
	var v_j: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_savedData: Variant = R.coerce((a[0] if a.size() > 0 else null), "ByteArray")
	v_i = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_iFileVersion = R.coerce(0, "int")
	v_iCampaignType = R.coerce(0, "int")
	v_iNbDialogs = R.coerce(0, "int")
	v_t = R.coerce(0, "int")
	v_iNbGroups = R.coerce(0, "int")
	v_g = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iNbLinkedGroups = R.coerce(0, "int")
	v_iNbAreas = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_iDataSize = R.coerce(0, "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_j = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	if R.truth(v_savedData):
		pass
		R.set_value(v_savedData, "position", 0, "=")
		v_iFileVersion = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
		if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
			pass
			v_iCampaignType = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			R.call_member(c, "NewCampaign", [v_iCampaignType])
			((c).fields.get("m_CampaignInfo")).fields["m_iGoal"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iGoalTarget"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_bTiresBlown"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAirStrikes"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoWeapons"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoAmmoPoints"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoReplenish"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteAmmo"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInvincibleHellfire"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_fBounceFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bMountedMG"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bMountedRocketLauncher"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bInfiniteMountedWeapon"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoDriverSwitch"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bArcadeAmmoPickup"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSteering"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoBraking"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSwerving"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fPlayerBodyHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fOilSlipperinessFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fImpactSpeedLossFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fVehicleHPFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bExplodingZombies"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAlwaysCling"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoBackgroundCity"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoChopperSupport"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			R.call_member(c, "SetNoBackgroundCity", [((c).fields.get("m_CampaignInfo")).fields.get("m_bNoBackgroundCity")])
			((c).fields.get("m_CampaignInfo")).fields["m_fStartingTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fZombieHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fMutantKilledTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fFeedersHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fCivilianShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fCivilianHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierShotDownTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierHitTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fSoldierClingerOffTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fHellfireDefeatedTime"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_iDifficultyLevelLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_fBasePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditivePatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_iSpikeSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iBombSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iOilLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iSpikeLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iMineLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iExplodingCarLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iGrubLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iZombieLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_iBaseSoldierLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fBaseMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_fAdditiveMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
			((c).fields.get("m_CampaignInfo")).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			((c).fields.get("m_CampaignInfo")).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
			v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_t = R.coerce(0, "int")
			while R.truth((float(v_t) < float(v_iNbDialogs))):
				pass
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
				v_t = R.signed32(v_t + 1)
			((c).fields.get("m_CampaignInfo")).fields["m_Groups"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
			v_iNbGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
			v_g = R.coerce(0, "int")
			while R.truth((float(v_g) < float(v_iNbGroups))):
				pass
				v_group = R.coerce(R.construct(R.klass("RDAreaGroup"), []), "RDAreaGroup")
				R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "push"), [v_group])
				(v_group).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
				(v_group).fields["m_iMinLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_group).fields["m_iMaxLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				(v_group).fields["m_bCanBeFirst"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				(v_group).fields["m_bRandomized"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
				v_iNbLinkedGroups = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(v_iNbLinkedGroups))):
					pass
					R.invoke(R.get_value((v_group).fields.get("m_LinkedGroups"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
					v_i = R.signed32(v_i + 1)
				v_iNbAreas = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(v_iNbAreas))):
					pass
					v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
					(v_areaInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_szAreaName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
					(v_areaInfo).fields["m_iAreaLength"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_bAllowFlip"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					v_iNbDialogs = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					v_t = R.coerce(0, "int")
					while R.truth((float(v_t) < float(v_iNbDialogs))):
						pass
						R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [R.invoke(R.get_value(v_savedData, "readUTF"), [])])
						R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.invoke(R.get_value(v_savedData, "readInt"), [])])
						v_t = R.signed32(v_t + 1)
					(v_areaInfo).fields["m_bOverrideSpawning"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fHellfireDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iHellfireLevel"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_fJetDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iJetDrops"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_fMutantDelay"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_iMutantCount"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_bRandomizeSpawningValues"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fPlayerSpeedFactor"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bFullSpeedMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bLavaMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bLavaInstantKill"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bFog"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fForcedStopDuration"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bOverrideDifficulty"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_fPatternRatio"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_fSpawnRate"] = R.coerce(R.invoke(R.get_value(v_savedData, "readFloat"), []), "Number")
					(v_areaInfo).fields["m_bSpikeSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bBombSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bOil"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bSpike"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bMine"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bExplodingCar"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bGrub"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bBaseSoldier"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bNoSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bAllSoldierZombie"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					(v_areaInfo).fields["m_bFUBARMode"] = R.coerce(R.invoke(R.get_value(v_savedData, "readBoolean"), []), "Boolean")
					v_iDataSize = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Data"), 0, v_iDataSize])
					v_iNbPatterns = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					v_j = R.coerce(0, "int")
					while R.truth((float(v_j) < float(v_iNbPatterns))):
						pass
						v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
						(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value(v_savedData, "readUTF"), []), "String")
						v_iDataBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
						R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
						v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
						(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
						R.invoke(R.get_value(v_savedData, "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
						R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
						R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
						(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
						R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
						R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
						v_j = R.signed32(v_j + 1)
					v_iIconBytes = R.coerce(R.invoke(R.get_value(v_savedData, "readInt"), []), "int")
					(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
					R.invoke(R.get_value(v_savedData, "readBytes"), [(v_areaInfo).fields.get("m_Icon"), 0, v_iIconBytes])
					R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
					R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
					v_i = R.signed32(v_i + 1)
				v_g = R.signed32(v_g + 1)
	else:
		pass
		R.call_member(c, "NewCampaign", [R.static_value("RDCampaignInfo", "Type_Unset")])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null


static func c1070_f_UpdateCampaignSpawning(c: Variant, a: Array) -> Variant:
	var v_iIndex: Variant = 0
	var v_areaInfo: Variant = null
	var v_patternInfo: Variant = null
	var v_iAreaIndex: Variant = 0
	var v_group: Variant = null
	var v_iPatternPosition: Variant = 0
	var v_iSliceIndex: Variant = NAN
	var v_iPreviousAreaIndex: Variant = 0
	var v_iEnding: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_iStartSliceIndex: Variant = 0
	var v_iGroupIndex: Variant = 0
	var v_bAddingValues: Variant = false
	var v_iActualAreaIndex: Variant = 0
	var v_iActualPatternIndex: Variant = 0
	var v_iRandomLinkedGroup: Variant = 0
	var v_newGroup: Variant = null
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_iIndex = R.coerce(0, "int")
	v_areaInfo = R.coerce(null, "RDAreaInfo")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iAreaIndex = R.coerce(0, "int")
	v_group = R.coerce(null, "RDAreaGroup")
	v_iPatternPosition = R.coerce(0, "int")
	v_iSliceIndex = float(NAN)
	v_iPreviousAreaIndex = R.coerce(0, "int")
	v_iEnding = R.coerce(0, "int")
	v_iPatternIndex = R.coerce(0, "int")
	v_iStartSliceIndex = R.coerce(0, "int")
	v_iGroupIndex = R.coerce(0, "int")
	v_bAddingValues = false
	v_iActualAreaIndex = R.coerce(0, "int")
	v_iActualPatternIndex = R.coerce(0, "int")
	v_iRandomLinkedGroup = R.coerce(0, "int")
	v_newGroup = R.coerce(null, "RDAreaGroup")
	if R.truth((c).fields.get("m_bGoingForward")):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
		if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
			pass
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
				pass
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
				(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
				if R.truth(R.binary("<", (c).fields.get("m_iCurrentPatternPosition"), R.get_value((c).fields.get("m_CampaignAreaIndices"), "length"))):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), (c).fields.get("m_iCurrentPatternPosition")), "int"), "int")
					v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), (c).fields.get("m_iCurrentPatternPosition")), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
					R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				else:
					pass
					v_iStartSliceIndex = R.coerce((float(floorf(float(R.binary("/", (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), R.static_value("RDRoad", "RenderStepSize"))))) - float(((c).fields.get("m_Road")).fields.get("m_iCurrentRoadSlice"))), "int")
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(0))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(1))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(2))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(3))])
					R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_None"), (float(v_iStartSliceIndex) + float(4))])
				if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
					pass
					R.call_member(c, "RemoveAreaPatternEntities", [0])
					R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
					R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
			while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
				pass
				R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
				R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
				R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
				(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
				if R.truth(R.binary("<", v_iPatternPosition, R.get_value((c).fields.get("m_CampaignAreaIndices"), "length"))):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
					v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), v_iPatternPosition), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
					R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				else:
					pass
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
					R.call_member((c).fields.get("m_Road"), "AddBackwardRoadSlice", [R.static_value("RDRoad", "SliceType_None")])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
			v_iSliceIndex = float(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), R.static_value("RDRoad", "RenderStepSize")))))
			v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
			v_iPreviousAreaIndex = R.coerce((R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), (float(v_iPatternPosition) - float(1))), "int") if R.truth((float(v_iPatternPosition) > float(0))) else v_iAreaIndex), "int")
			if R.truth(((c).fields.get("m_bPlayAreaDialog") and ((float(v_iSliceIndex) == float(0)) or (float(v_iAreaIndex) != float(v_iPreviousAreaIndex))))):
				pass
				v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
				R.call_member(c, "PlayAreaDialog", [(v_areaInfo).fields.get("m_DialogCues"), (v_areaInfo).fields.get("m_DialogTexts"), 0])
				(c).fields["m_bPlayAreaDialog"] = false
				(c).fields["m_iPlayingAreaDialogAreaIndex"] = R.coerce(v_iAreaIndex, "int")
			if R.truth(((float(v_iSliceIndex) != float(0)) and (float(v_iAreaIndex) == float(v_iPreviousAreaIndex)))):
				pass
				(c).fields["m_bPlayAreaDialog"] = true
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
					R.call_member(c, "OnDialogBoxEnded", [])
			if R.truth(((R.truth(R.logical_and((c).fields.get("m_DialogCueSound"), func(): return R.call_member((c).fields.get("m_DialogCueSound"), "IsPlaying", []))) or R.truth(R.call_member(c, "HasEndingSoundPlaying", []))) and (float(v_iAreaIndex) < float((c).fields.get("m_iPlayingAreaDialogAreaIndex"))))):
				pass
				R.call_member(c, "StopAreaDialog", [])
				R.call_member(c, "StopEndingSounds", [])
			v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
			v_iEnding = R.coerce(((v_areaInfo).fields.get("m_iType") if R.truth(((float((v_areaInfo).fields.get("m_iType")) != float(R.static_value("RDAreaInfo", "Type_Normal"))) and (float(v_iPatternPosition) >= float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) - float(1)))))) else R.static_value("RDAreaInfo", "Type_Normal")), "int")
			if R.truth((float(v_iEnding) != float((c).fields.get("m_iEndingType")))):
				pass
				(c).fields["m_iEndingType"] = R.coerce(v_iEnding, "int")
				R.call_member((c).fields.get("m_Interface"), "ShowEnding", [v_iEnding])
				if R.truth((float((c).fields.get("m_iEndingType")) != float(R.static_value("RDAreaInfo", "Type_EndingDriveAway")))):
					pass
					if R.truth((c).fields.get("m_CarDrivingAway")):
						pass
						((c).fields.get("m_CarDrivingAway")).fields["m_bDestroyMe"] = true
				else:
					pass
					R.call_member(c.fields.get("m_Game"), "DoFlash", [0.5, 0.5])
					(c).fields["m_CarDrivingAway"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDCarDrivingAway")]), R.klass("RDCarDrivingAway")), "RDCarDrivingAway")
					R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CarDrivingAway"), 0, 0, ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")])
					((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	else:
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			v_iPatternPosition = R.coerce(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize")))))), "int")
			while R.truth((float((float(v_iPatternPosition) + float(3))) > float((c).fields.get("m_iCurrentPatternPosition")))):
				pass
				v_bAddingValues = R.binary(">=", (c).fields.get("m_iCurrentPatternPosition"), R.get_value((c).fields.get("m_ChallengeGroups"), "length"))
				v_iGroupIndex = R.coerce(((c).fields.get("m_iCurrentGroupIndex") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
				v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
				if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
					pass
					v_iActualAreaIndex = R.coerce(((c).fields.get("m_iCurrentAreaIndex") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
					v_iAreaIndex = R.coerce((R.coerce(R.get_value((v_group).fields.get("m_RandomAreaIndices"), R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_RandomAreaIndices"), "length"))), "int") if R.truth((v_group).fields.get("m_bRandomized")) else R.coerce(R.binary("%", v_iActualAreaIndex, R.get_value((v_group).fields.get("m_Areas"), "length")), "int")), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					if R.truth(R.binary(">", R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"), 0)):
						pass
						v_iActualPatternIndex = R.coerce(((c).fields.get("m_iCurrentPatternPosition") if R.truth(v_bAddingValues) else R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), (c).fields.get("m_iCurrentPatternPosition")), "int")), "int")
						v_iPatternIndex = R.coerce(R.coerce(R.get_value((v_areaInfo).fields.get("m_RandomPatternsIndices"), R.binary("%", v_iActualPatternIndex, R.get_value((v_areaInfo).fields.get("m_RandomPatternsIndices"), "length"))), "int"), "int")
						v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "push"), [R.construct(R.klass("Array"), [])])
						(c).fields["m_iLoadPatternIndex"] = R.coerce((R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), "int")
						R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float((c).fields.get("m_iCurrentPatternPosition")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
						if R.truth(R.binary(">", R.get_value((c).fields.get("m_AreaPatternEntities"), "length"), 3)):
							pass
							R.call_member(c, "RemoveAreaPatternEntities", [0])
							R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0, 1])
							R.call_member((c).fields.get("m_Road"), "ClearBackwardAreaRoadSlices", [])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "+=")
				if R.truth(v_bAddingValues):
					pass
					R.set_value(c, "m_iChallengePatternCount", 1, "+=")
					R.set_value(c, "m_iChallengeAreaCount", 1, "+=")
					v_group = R.coerce(R.binary("as", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), R.klass("RDAreaGroup")), "RDAreaGroup")
					if R.truth((float((c).fields.get("m_iChallengeAreaCount")) == float((v_group).fields.get("m_iLength")))):
						pass
						v_iRandomLinkedGroup = R.coerce(R.call_static("Maths", "RandomInt", [R.get_value((v_group).fields.get("m_LinkedGroups"), "length")]), "int")
						(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((v_group).fields.get("m_LinkedGroups"), v_iRandomLinkedGroup), "int")
						v_newGroup = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "RDAreaGroup")
						(v_newGroup).fields["m_iLength"] = R.coerce(R.binary("+", (v_newGroup).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((v_newGroup).fields.get("m_iMaxLength")) - float((v_newGroup).fields.get("m_iMinLength")))])), "int")
						(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
						(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
						(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
					else:
						pass
						if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
							pass
							v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
							if R.truth((float((c).fields.get("m_iChallengePatternCount")) == float((v_areaInfo).fields.get("m_iAreaLength")))):
								pass
								R.set_value(c, "m_iCurrentAreaIndex", 1, "+=")
								(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
					R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "push"), [v_iGroupIndex])
					R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "push"), [v_iAreaIndex])
					R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "push"), [v_iPatternIndex])
			while R.truth((float(v_iPatternPosition) < float((float((c).fields.get("m_iCurrentPatternPosition")) - float(3))))):
				pass
				v_iGroupIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeGroups"), v_iPatternPosition), "int"), "int")
				v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
				if R.truth(R.binary(">", R.get_value((v_group).fields.get("m_Areas"), "length"), 0)):
					pass
					v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengeAreas"), v_iPatternPosition), "int"), "int")
					v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
					if R.truth(R.binary(">", R.get_value((v_areaInfo).fields.get("m_Patterns"), "length"), 0)):
						pass
						R.call_member(c, "RemoveAreaPatternEntities", [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1))])
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [(R.num(R.get_value((c).fields.get("m_AreaPatternEntities"), "length")) - float(1)), 1])
						R.call_member((c).fields.get("m_Road"), "ClearForwardAreaRoadSlices", [])
						v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_ChallengePatterns"), v_iPatternPosition), "int"), "int")
						v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
						R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "unshift"), [R.construct(R.klass("Array"), [])])
						(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
						R.call_member(c, "LoadPatternData", [(v_patternInfo).fields.get("m_Data"), false, (float((float(v_iPatternPosition) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))])
				R.set_value(c, "m_iCurrentPatternPosition", 1, "-=")
			if R.truth((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) >= float(((c).fields.get("m_CampaignInfo")).fields.get("m_fDialogOffset")))):
				pass
				if R.truth((c).fields.get("m_bPlayAreaDialog")):
					pass
					R.call_member(c, "PlayAreaDialog", [((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), ((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), 0])
					(c).fields["m_bPlayAreaDialog"] = false
			else:
				pass
				(c).fields["m_bPlayAreaDialog"] = true
			if R.truth((float((c).fields.get("m_fDialogTimer")) > float(0))):
				pass
				(c).fields["m_fDialogTimer"] = R.coerce(R.binary("-", (c).fields.get("m_fDialogTimer"), v_fDeltaTime), "Number")
				if R.truth((float((c).fields.get("m_fDialogTimer")) <= float(0))):
					pass
					R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
					R.call_member(c, "OnDialogBoxEnded", [])
	if R.truth(R.unary("!", (c).fields.get("m_bGoingForward"))):
		pass
		R.call_member((c).fields.get("m_Road"), "UpdateRoadSlice", [c.fields.get("m_Camera")])
	return null


static func c1070_f_ResetCampaignSpawning(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"i": "int", "group": "RDAreaGroup", "iArea": "int", "areaInfo": "RDAreaInfo", "fPosition": "Number", "fNextAreaPos": "Number", "g": "int", "a": "int", "area": "RDAreaInfo"}
	l["i"] = 0
	l["group"] = null
	l["iArea"] = 0
	l["areaInfo"] = null
	l["fPosition"] = NAN
	l["fNextAreaPos"] = NAN
	l["g"] = 0
	l["a"] = 0
	l["area"] = null
	R.lset(l, "i", 0)
	R.lset(l, "group", null)
	R.lset(l, "iArea", 0)
	R.lset(l, "areaInfo", null)
	R.lset(l, "fPosition", NAN)
	R.lset(l, "fNextAreaPos", NAN)
	R.lset(l, "g", 0)
	R.lset(l, "a", 0)
	R.lset(l, "area", null)
	R.call_member(c, "StopAreaDialog", [])
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float(0)
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float(0)
	(c).fields["m_iCurrentPatternPosition"] = R.coerce(0, "int")
	(c).fields["m_iLoadPatternIndex"] = R.coerce(0, "int")
	R.lset(l, "i", 0, "=")
	while R.truth(R.binary("<", R.lget(l, "i"), R.get_value((c).fields.get("m_AreaPatternEntities"), "length"))):
		pass
		R.call_member(c, "RemoveAreaPatternEntities", [R.lget(l, "i")])
		R.binary("-", R.lset(l, "i", 1, "+="), 1)
	R.invoke(R.get_value((c).fields.get("m_AreaPatternEntities"), "splice"), [0])
	if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Story")))):
		pass
		R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "=")
		if R.truth(R.binary(">", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"), 0)):
			pass
			R.lset(l, "iArea", 0, "=")
			R.lset(l, "areaInfo", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "iArea")), "=")
			R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
			R.lset(l, "fPosition", 0, "=")
			R.lset(l, "fNextAreaPos", (float((float((R.lget(l, "areaInfo")).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), "=")
			R.invoke(R.get_value((c).fields.get("m_CampaignAreaIndices"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_CampaignPatternIndices"), "splice"), [0])
			while R.truth(R.binary("<", R.lget(l, "iArea"), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
				pass
				R.invoke(R.get_value((c).fields.get("m_CampaignAreaIndices"), "push"), [R.lget(l, "iArea")])
				R.invoke(R.get_value((c).fields.get("m_CampaignPatternIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
				R.lset(l, "fPosition", (float(5) * float(R.static_value("RDRoad", "RenderStepSize"))), "+=")
				if R.truth((float(R.lget(l, "fPosition")) >= float(R.lget(l, "fNextAreaPos")))):
					pass
					if R.truth(R.binary("<", R.lset(l, "iArea", 1, "+="), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
						pass
						R.lset(l, "areaInfo", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "iArea")), "=")
						R.call_member((R.lget(l, "areaInfo")).fields.get("m_PatternsIndices"), "Reset", [])
						R.lset(l, "fNextAreaPos", (float((float((R.lget(l, "areaInfo")).fields.get("m_iAreaLength")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize"))), "+=")
	else:
		pass
		if R.truth((float(((c).fields.get("m_CampaignInfo")).fields.get("m_iType")) == float(R.static_value("RDCampaignInfo", "Type_Challenge")))):
			pass
			R.invoke(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "splice"), [0])
			R.lset(l, "i", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "i"), R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
				pass
				R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), R.lget(l, "i")), "=")
				if R.truth((R.lget(l, "group")).fields.get("m_bCanBeFirst")):
					pass
					R.invoke(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "push"), [R.lget(l, "i")])
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
			if R.truth(R.binary(">", R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "length"), 0)):
				pass
				(c).fields["m_iCurrentGroupIndex"] = R.coerce(R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), R.call_static("Maths", "RandomInt", [R.get_value((c).fields.get("m_GroupsThatCanBeFirst"), "length")])), "int")
			else:
				pass
				(c).fields["m_iCurrentGroupIndex"] = R.coerce(0, "int")
			(c).fields["m_iCurrentAreaIndex"] = R.coerce(0, "int")
			R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), (c).fields.get("m_iCurrentGroupIndex")), "=")
			(R.lget(l, "group")).fields["m_iLength"] = R.coerce(R.binary("+", (R.lget(l, "group")).fields.get("m_iMinLength"), R.call_static("Maths", "RandomInt", [(float((float((R.lget(l, "group")).fields.get("m_iMaxLength")) - float((R.lget(l, "group")).fields.get("m_iMinLength")))) + float(1))])), "int")
			(c).fields["m_iChallengePatternCount"] = R.coerce(0, "int")
			(c).fields["m_iChallengeAreaCount"] = R.coerce(0, "int")
			R.invoke(R.get_value((c).fields.get("m_ChallengeGroups"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_ChallengeAreas"), "splice"), [0])
			R.invoke(R.get_value((c).fields.get("m_ChallengePatterns"), "splice"), [0])
			R.lset(l, "g", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "g"), R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), "length"))):
				pass
				R.lset(l, "group", R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), R.lget(l, "g")), "=")
				if R.truth((R.lget(l, "group")).fields.get("m_bRandomized")):
					pass
					R.call_member((R.lget(l, "group")).fields.get("m_AreaIndices"), "Reset", [])
					R.invoke(R.get_value((R.lget(l, "group")).fields.get("m_RandomAreaIndices"), "splice"), [0])
					R.lset(l, "i", 0, "=")
					while R.truth((float(R.lget(l, "i")) < float((R.num(R.get_value(((R.lget(l, "group")).fields.get("m_AreaIndices")).fields.get("m_Values"), "length")) * float(10))))):
						pass
						R.invoke(R.get_value((R.lget(l, "group")).fields.get("m_RandomAreaIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "group")).fields.get("m_AreaIndices"), "GetRandomValue", []), R.klass("int"))])
						R.binary("-", R.lset(l, "i", 1, "+="), 1)
				R.lset(l, "a", 0, "=")
				while R.truth(R.binary("<", R.lget(l, "a"), R.get_value((R.lget(l, "group")).fields.get("m_Areas"), "length"))):
					pass
					R.lset(l, "area", R.get_value((R.lget(l, "group")).fields.get("m_Areas"), R.lget(l, "a")), "=")
					R.call_member((R.lget(l, "area")).fields.get("m_PatternsIndices"), "Reset", [])
					R.invoke(R.get_value((R.lget(l, "area")).fields.get("m_RandomPatternsIndices"), "splice"), [0])
					R.lset(l, "i", 0, "=")
					while R.truth((float(R.lget(l, "i")) < float((R.num(R.get_value(((R.lget(l, "area")).fields.get("m_PatternsIndices")).fields.get("m_Values"), "length")) * float(10))))):
						pass
						R.invoke(R.get_value((R.lget(l, "area")).fields.get("m_RandomPatternsIndices"), "push"), [R.binary("as", R.call_member((R.lget(l, "area")).fields.get("m_PatternsIndices"), "GetRandomValue", []), R.klass("int"))])
						R.binary("-", R.lset(l, "i", 1, "+="), 1)
					R.binary("-", R.lset(l, "a", 1, "+="), 1)
				R.binary("-", R.lset(l, "g", 1, "+="), 1)
	R.call_member((c).fields.get("m_Road"), "Reset", [])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	return null


static func c1070_f_HasEndingSoundPlaying(c: Variant, a: Array) -> Variant:
	return R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.logical_or(R.call_member((c).fields.get("m_ChopperSound"), "IsPlaying", []), func(): return R.call_member((c).fields.get("m_NukeSound"), "IsPlaying", [])), func(): return R.call_member((c).fields.get("m_NukeWaveSound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "IsPlaying", [])), func(): return R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "IsPlaying", []))
	return null


static func c1070_f_IsOnHighway(c: Variant, a: Array) -> Variant:
	var v_iPatternPosition: Variant = 0
	var v_iAreaIndex: Variant = 0
	var v_iPatternIndex: Variant = 0
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_patternInfo: Variant = null
	v_iPatternPosition = R.coerce(maxf(float((float(floorf(float(R.binary("/", ((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"), (float(5) * float(R.static_value("RDRoad", "RenderStepSize"))))))) - float(1))), float(0)), "int")
	v_iAreaIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignAreaIndices"), v_iPatternPosition), "int"), "int")
	v_iPatternIndex = R.coerce(R.coerce(R.get_value((c).fields.get("m_CampaignPatternIndices"), v_iPatternPosition), "int"), "int")
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), 0), "RDAreaGroup")
	v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iAreaIndex), "RDAreaInfo")
	v_patternInfo = R.coerce(R.get_value((v_areaInfo).fields.get("m_Patterns"), v_iPatternIndex), "RDPatternInfo")
	return (float((v_patternInfo).fields.get("m_iType")) == float(R.static_value("RDPatternInfo", "Type_Highway")))
	return null


static func c1070_f_TestCampaign(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Game"), "PlayCustomCampaign", [R.call_member(c, "GetCampaignData", [])])
	return null


static func c1070_f_NewCampaign(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iType: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member((c.fields.get("m_Game")).fields.get("m_World"), "Unload", [])
	R.call_member(c.fields.get("m_Camera"), "Reset", [])
	(c).fields["m_CarDrivingAway"] = R.coerce(null, "RDCarDrivingAway")
	(c).fields["m_Road"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDRoad")]), R.klass("RDRoad")), "RDRoad")
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_Road"), 0, 0, 0])
	R.call_member((c).fields.get("m_Road"), "InitRoadSliceEntities", [0])
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(12))):
		pass
		R.call_member((c).fields.get("m_Road"), "SetRoadSlice", [R.static_value("RDRoad", "SliceType_Town"), v_i])
		v_i = R.signed32(v_i + 1)
	R.call_member((c).fields.get("m_Road"), "SetMode", [R.static_value("RDRoad", "Mode_Area")])
	(c).fields["m_SkyBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_SkyBG"), "Init", [R.klass("MC_SkyBG"), 2000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_SkyBG"), 0, 0, 0])
	(c).fields["m_CityBG"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDParallaxBackground")]), R.klass("RDParallaxBackground")), "RDParallaxBackground")
	R.call_member((c).fields.get("m_CityBG"), "Init", [R.klass("MC_CityBG2PNG_Street"), 1000, 0])
	R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_CityBG"), 0, 0, 0])
	(c).fields["m_CampaignInfo"] = R.coerce(R.construct(R.klass("RDCampaignInfo"), []), "RDCampaignInfo")
	((c).fields.get("m_CampaignInfo")).fields["m_iType"] = R.coerce(v_iType, "int")
	R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_DialogTexts"), "push"), [""])
	(c).fields["m_AreaPatternEntities"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	return null


static func c1070_f_LoadCampaignFileData(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_SaveFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_campaignData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_SaveFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	return null


static func c1070_f_LoadCampaignFileDataString(c: Variant, a: Array) -> Variant:
	var v_campaignData: Variant = null
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_campaignData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	return null


static func c1070_f_OnInterfaceModeSet(c: Variant, a: Array) -> Variant:
	var v_iMode: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth((c).fields.get("m_PlacedEntity")):
		pass
		R.call_member(c, "DeleteSelectedEntity", [])
	R.call_member(c, "SetSelectedEntity", [null])
	(c).fields["m_bDraggingEntity"] = false
	if R.truth((((float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or (float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Area")))) or (float(v_iMode) == float(R.static_value("RDEditorInterface", "Mode_Campaign"))))):
		pass
		(c).fields["m_iLastInterfaceMode"] = R.coerce(v_iMode, "int")
	return null


static func c1070_f_SaveCurrentPatternData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedPatternData"] = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	(c).fields["m_fSavedPatternCamX"] = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("X"))
	(c).fields["m_fSavedPatternCamZ"] = float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z"))
	return null


static func c1070_f_SaveCurrentAreaData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedAreaData"] = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
	return null


static func c1070_f_SaveCurrentCampaignData(c: Variant, a: Array) -> Variant:
	(c).fields["m_SavedCampaignData"] = R.coerce(R.call_member(c, "GetCampaignData", []), "ByteArray")
	return null


static func c1070_f_AddPatternInArea(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_patternInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
	(v_patternInfo).fields["m_szName"] = R.coerce(R.get_value(v_file, "name"), "String")
	(v_patternInfo).fields["m_szDescription"] = R.coerce(R.get_value(v_file, "description"), "String")
	(v_patternInfo).fields["m_iID"] = R.coerce(R.get_value(v_file, "id"), "int")
	(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.get_value(v_file, "authorName"), "String")
	(v_patternInfo).fields["m_Icon"] = R.coerce(R.invoke(R.get_value(R.get_value(v_file, "icon"), "getPixels"), [R.construct(R.klass("Rectangle"), [0, 0, R.get_value(R.get_value(v_file, "icon"), "width"), R.get_value(R.get_value(v_file, "icon"), "height")])]), "ByteArray")
	(v_patternInfo).fields["m_Data"] = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
	R.call_member(c, "ResetAreaSpawning", [])
	return null


static func c1070_f_AddPatternInAreaFromString(c: Variant, a: Array) -> Variant:
	var v_patternInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iID: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_szData: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
	(v_patternInfo).fields["m_szName"] = R.coerce(v_szName, "String")
	(v_patternInfo).fields["m_szDescription"] = R.coerce("", "String")
	(v_patternInfo).fields["m_iID"] = R.coerce(v_iID, "int")
	(v_patternInfo).fields["m_szAuthorName"] = R.coerce("", "String")
	(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	(v_patternInfo).fields["m_Data"] = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
	R.invoke(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "push"), [v_patternInfo])
	R.call_member(((c).fields.get("m_AreaInfo")).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), "length")) - float(1))])
	R.call_member(c, "ResetAreaSpawning", [])
	return null


static func c1070_f_GetLoadedPatternType(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_file: Variant = null
	var v_patternData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iType = R.coerce(0, "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_patternData = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value(v_patternData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iType = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	return v_iType
	return null


static func c1070_f_GetLoadedPatternTypeFromString(c: Variant, a: Array) -> Variant:
	var v_iType: Variant = 0
	var v_patternData: Variant = null
	var v_iFileVersion: Variant = 0
	var v_szData: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_iType = R.coerce(0, "int")
	v_patternData = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value(v_patternData, "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iType = R.coerce(R.invoke(R.get_value(v_patternData, "readInt"), []), "int")
	return v_iType
	return null


static func c1070_f_AddAreaInCampaign(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_file: Variant = null
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_group: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iGroupIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
	(v_areaInfo).fields["m_szName"] = R.coerce(R.get_value(v_file, "name"), "String")
	(v_areaInfo).fields["m_szDescription"] = R.coerce(R.get_value(v_file, "description"), "String")
	(v_areaInfo).fields["m_iID"] = R.coerce(R.get_value(v_file, "id"), "int")
	(v_areaInfo).fields["m_szAuthorName"] = R.coerce(R.get_value(v_file, "authorName"), "String")
	(v_areaInfo).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	(v_areaInfo).fields["m_Icon"] = R.coerce(R.invoke(R.get_value(R.get_value(v_file, "icon"), "getPixels"), [R.construct(R.klass("Rectangle"), [0, 0, R.get_value(R.get_value(v_file, "icon"), "width"), R.get_value(R.get_value(v_file, "icon"), "height")])]), "ByteArray")
	(v_areaInfo).fields["m_Data"] = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
			R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
			(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [""])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
	R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null


static func c1070_f_AddAreaInCampaignFromString(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_group: Variant = null
	var v_szName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iID: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_szData: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_iGroupIndex: Variant = R.coerce((a[3] if a.size() > 3 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_areaInfo = R.coerce(R.construct(R.klass("RDAreaInfo"), []), "RDAreaInfo")
	(v_areaInfo).fields["m_szName"] = R.coerce(v_szName, "String")
	(v_areaInfo).fields["m_szDescription"] = R.coerce("", "String")
	(v_areaInfo).fields["m_iID"] = R.coerce(v_iID, "int")
	(v_areaInfo).fields["m_szAuthorName"] = R.coerce("", "String")
	(v_areaInfo).fields["m_iType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	(v_areaInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
	(v_areaInfo).fields["m_Data"] = R.coerce(R.invoke(R.resolve(c, "DecodeData", "RDGameModeEditor"), [v_szData]), "ByteArray")
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.set_value((v_patternInfo).fields.get("m_Data"), "position", 0, "=")
			R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), [])
			(v_patternInfo).fields["m_iType"] = R.coerce(R.invoke(R.get_value((v_patternInfo).fields.get("m_Data"), "readInt"), []), "int")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogCues"), "push"), [R.unary("-", 1)])
	R.invoke(R.get_value((v_areaInfo).fields.get("m_DialogTexts"), "push"), [""])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	R.invoke(R.get_value((v_group).fields.get("m_Areas"), "push"), [v_areaInfo])
	R.call_member((v_group).fields.get("m_AreaIndices"), "AddValue", [(R.num(R.get_value((v_group).fields.get("m_Areas"), "length")) - float(1))])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null


static func c1070_f_PreviewPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Pattern"), "int")
	(c).fields["m_LoadedPatternPreviewFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedPatternPreviewFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedPatternPreviewFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedPatternPreviewFileRated"] = false
	v_patternData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedPatternPreviewFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadPatternData", [v_patternData])
	return null


static func c1070_f_PreviewArea(c: Variant, a: Array) -> Variant:
	var v_areaData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Area"), "int")
	(c).fields["m_LoadedAreaPreviewFile"] = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	(c).fields["m_bLoadedAreaPreviewFileOwned"] = R.binary("==", R.get_value((c).fields.get("m_LoadedAreaPreviewFile"), "authorId"), R.get_value(R.klass("com.newgrounds.API"), "userId"))
	(c).fields["m_bLoadedAreaPreviewFileRated"] = false
	v_areaData = R.coerce(R.binary("as", R.get_value((c).fields.get("m_LoadedAreaPreviewFile"), "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadAreaData", [v_areaData])
	R.call_member(c, "ResetAreaSpawning", [])
	return null


static func c1070_f_PreviewCampaign(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_campaignData: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	(c).fields["m_bPreview"] = true
	(c).fields["m_iPreviewDataType"] = R.coerce(R.static_value("RDGameModeEditor", "DataType_Campaign"), "int")
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	v_campaignData = R.coerce(R.binary("as", R.get_value(v_file, "data"), R.klass("ByteArray")), "ByteArray")
	R.call_member(c, "LoadCampaignData", [v_campaignData])
	R.call_member(c, "ResetCampaignSpawning", [])
	return null


static func c1070_f_EndPreview(c: Variant, a: Array) -> Variant:
	(c).fields["m_bPreview"] = false
	if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))):
		pass
		R.call_member(c, "LoadSavedPattern", [])
	else:
		pass
		if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))):
			pass
			R.call_member(c, "LoadSavedArea", [])
		else:
			pass
			if R.truth((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Campaign")))):
				pass
				R.call_member(c, "LoadSavedCampaign", [])
	return null


static func c1070_f_LoadSavedPattern(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadPatternData", [(c).fields.get("m_SavedPatternData")])
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["X"] = float((c).fields.get("m_fSavedPatternCamX"))
	((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields["Z"] = float((c).fields.get("m_fSavedPatternCamZ"))
	return null


static func c1070_f_LoadSavedArea(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadAreaData", [(c).fields.get("m_SavedAreaData")])
	return null


static func c1070_f_LoadSavedCampaign(c: Variant, a: Array) -> Variant:
	R.call_member(c, "LoadCampaignData", [(c).fields.get("m_SavedCampaignData")])
	return null


static func c1070_f_GetCameraPosLimit(c: Variant, a: Array) -> Variant:
	if R.truth(((float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))) or ((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))))):
		pass
		return (float((float(5) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))
	return (float((float((R.num(R.get_value((c).fields.get("m_CampaignAreaIndices"), "length")) * float(5))) * float(R.static_value("RDRoad", "RenderStepSize")))) - float(0.1))
	return null


static func c1070_f_OnDialogBoxEnded(c: Variant, a: Array) -> Variant:
	if R.truth((R.truth((c).fields.get("m_AreaDialogCues")) and (float((c).fields.get("m_iAreaDialogIndex")) < float((R.num(R.get_value((c).fields.get("m_AreaDialogCues"), "length")) - float(1)))))):
		pass
		R.call_member(c, "PlayAreaDialog", [(c).fields.get("m_AreaDialogCues"), (c).fields.get("m_AreaDialogTexts"), (float((c).fields.get("m_iAreaDialogIndex")) + float(1))])
	return null


static func c1070_f_PlayAreaDialog(c: Variant, a: Array) -> Variant:
	var v_szDialog: Variant = null
	var v_cues: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	var v_texts: Variant = R.coerce((a[1] if a.size() > 1 else null), "Array")
	var v_iIndex: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(v_iIndex, "int")
	(c).fields["m_AreaDialogCues"] = R.coerce(v_cues, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(v_texts, "Array")
	R.call_member(c, "PlayDialogCue", [R.get_value((c).fields.get("m_AreaDialogCues"), (c).fields.get("m_iAreaDialogIndex"))])
	v_szDialog = R.coerce(R.get_value((c).fields.get("m_AreaDialogTexts"), (c).fields.get("m_iAreaDialogIndex")), "String")
	R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [v_szDialog])
	(c).fields["m_fDialogTimer"] = R.coerce((2 if R.truth(R.binary("==", v_szDialog, "")) else maxf(float((R.num(R.get_value(v_szDialog, "length")) * float(R.static_value("RDCampaignDialogs", "DialogTimePerCharacter")))), float(R.static_value("RDCampaignDialogs", "MinDialogTime")))), "Number")
	return null


static func c1070_f_StopAreaDialog(c: Variant, a: Array) -> Variant:
	(c).fields["m_iPlayingAreaDialogAreaIndex"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_iAreaDialogIndex"] = R.coerce(0, "int")
	(c).fields["m_AreaDialogCues"] = R.coerce(null, "Array")
	(c).fields["m_AreaDialogTexts"] = R.coerce(null, "Array")
	R.call_member(c, "StopDialogCue", [])
	R.call_member((c).fields.get("m_Interface"), "ShowDialogBox", [""])
	return null


static func c1070_f_PlayDialogCue(c: Variant, a: Array) -> Variant:
	var v_soundClass: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	if R.truth(R.binary("==", v_iIndex, R.unary("-", 1))):
		pass
		return null
	R.call_member(c, "StopDialogCue", [])
	v_soundClass = R.coerce(R.call_static("RDCampaignDialogs", "GetSound", [v_iIndex]), "Class")
	(c).fields["m_DialogCueSound"] = R.coerce(R.construct(R.klass("DTSound"), [v_soundClass, (R.static_value("RDGame", "Instance")).fields.get("m_MasterSoundGroup")]), "DTSound")
	R.call_member((c).fields.get("m_DialogCueSound"), "Play", [])
	return null


static func c1070_f_StopDialogCue(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_DialogCueSound")):
		pass
		R.call_member((c).fields.get("m_DialogCueSound"), "Stop", [])
		(c).fields["m_DialogCueSound"] = R.coerce(null, "DTSound")
	return null


static func c1070_f_OnEndingEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	if R.truth(R.binary("==", v_szEvent, "PlayNukeSound")):
		pass
		R.call_member((c).fields.get("m_NukeSound"), "Play", [])
	else:
		pass
		if R.truth(R.binary("==", v_szEvent, "PlayNukeWaveSound")):
			pass
			R.call_member((c).fields.get("m_NukeWaveSound"), "Play", [])
		else:
			pass
			if R.truth(R.binary("==", v_szEvent, "PlayChopperSound")):
				pass
				R.call_member((c).fields.get("m_ChopperSound"), "Play", [])
			else:
				pass
				if R.truth(R.binary("==", v_szEvent, "PlayEngineSound")):
					pass
					R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Play", [])
				else:
					pass
					if R.truth(R.binary("==", v_szEvent, "StopEngineSound")):
						pass
						R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
					else:
						pass
						if R.truth(R.binary("==", v_szEvent, "PlayPassBySound")):
							pass
							R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Play", [])
						else:
							pass
							if R.truth(R.binary("==", v_szEvent, "PlayTireSound")):
								pass
								R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Play", [])
	return null


static func c1070_f_StopEndingSounds(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("m_NukeSound"), "Stop", [])
	R.call_member((c).fields.get("m_NukeWaveSound"), "Stop", [])
	R.call_member((c).fields.get("m_ChopperSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_EngineSound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_PassBySound"), "Stop", [])
	R.call_member((c.fields.get("m_Game")).fields.get("m_TireSound"), "Stop", [])
	return null


static func c1070_f_ApplyPattern(c: Variant, a: Array) -> Variant:
	var v_patternData: Variant = null
	var v_patternInfo: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_patternData = R.coerce(R.call_member(c, "GetPatternData", []), "ByteArray")
	R.call_member(c, "LoadAreaData", [(c).fields.get("m_SavedAreaData"), true])
	v_patternInfo = R.coerce(R.get_value(((c).fields.get("m_AreaInfo")).fields.get("m_Patterns"), v_iIndex), "RDPatternInfo")
	(v_patternInfo).fields["m_Data"] = R.coerce(v_patternData, "ByteArray")
	return null


static func c1070_f_ApplyArea(c: Variant, a: Array) -> Variant:
	var v_iNbPatterns: Variant = 0
	var v_i: Variant = 0
	var v_patternInfo: Variant = null
	var v_iDataBytes: Variant = 0
	var v_iIconBytes: Variant = 0
	var v_areaData: Variant = null
	var v_group: Variant = null
	var v_areaInfo: Variant = null
	var v_iFileVersion: Variant = 0
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_iGroupIndex: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	v_iNbPatterns = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	v_patternInfo = R.coerce(null, "RDPatternInfo")
	v_iDataBytes = R.coerce(0, "int")
	v_iIconBytes = R.coerce(0, "int")
	v_areaData = R.coerce(R.call_member(c, "GetAreaData", [(c).fields.get("m_AreaInfo")]), "ByteArray")
	R.call_member(c, "LoadCampaignData", [(c).fields.get("m_SavedCampaignData")])
	v_group = R.coerce(R.get_value(((c).fields.get("m_CampaignInfo")).fields.get("m_Groups"), v_iGroupIndex), "RDAreaGroup")
	v_areaInfo = R.coerce(R.get_value((v_group).fields.get("m_Areas"), v_iIndex), "RDAreaInfo")
	(v_areaInfo).fields["m_Data"] = R.coerce(v_areaData, "ByteArray")
	R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "splice"), [0])
	R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "Clear", [])
	R.set_value((v_areaInfo).fields.get("m_Data"), "position", 0, "=")
	v_iFileVersion = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
	if R.truth((float(v_iFileVersion) == float(R.static_value("RDGame", "FileVersion_Launch")))):
		pass
		v_iNbPatterns = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbPatterns))):
			pass
			v_patternInfo = R.coerce(R.construct(R.klass("RDPatternInfo"), []), "RDPatternInfo")
			(v_patternInfo).fields["m_szName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_szDescription"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			(v_patternInfo).fields["m_iID"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_szAuthorName"] = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readUTF"), []), "String")
			v_iDataBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Data"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Data"), 0, v_iDataBytes])
			v_iIconBytes = R.coerce(R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readInt"), []), "int")
			(v_patternInfo).fields["m_Icon"] = R.coerce(R.construct(R.klass("ByteArray"), []), "ByteArray")
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Data"), "readBytes"), [(v_patternInfo).fields.get("m_Icon"), 0, v_iIconBytes])
			R.invoke(R.get_value((v_areaInfo).fields.get("m_Patterns"), "push"), [v_patternInfo])
			R.call_member((v_areaInfo).fields.get("m_PatternsIndices"), "AddValue", [(R.num(R.get_value((v_areaInfo).fields.get("m_Patterns"), "length")) - float(1))])
			v_i = R.signed32(v_i + 1)
	R.call_member(c, "ResetCampaignSpawning", [])
	return null


static func c1070_f_IsCurrentLoadedFileRateable(c: Variant, a: Array) -> Variant:
	return R.logical_or(R.logical_or(R.logical_or(R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern")))), func(): return (c).fields.get("m_LoadedPatternPreviewFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternPreviewFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternPreviewFileRated"))), func(): return R.logical_and(R.logical_and(R.logical_and(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area")))), func(): return (c).fields.get("m_LoadedAreaPreviewFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaPreviewFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaPreviewFileRated")))), func(): return R.logical_and(R.logical_and(R.logical_and((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern")))), func(): return (c).fields.get("m_LoadedPatternFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedPatternFileRated")))), func(): return R.logical_and(R.logical_and(R.logical_and((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area")))), func(): return (c).fields.get("m_LoadedAreaFile")), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaFileOwned"))), func(): return R.unary("!", (c).fields.get("m_bLoadedAreaFileRated"))))
	return null


static func c1070_f_GetCurrentLoadedFile(c: Variant, a: Array) -> Variant:
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))):
		pass
		return (c).fields.get("m_LoadedPatternPreviewFile")
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))))):
		pass
		return (c).fields.get("m_LoadedAreaPreviewFile")
	if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))):
		pass
		return (c).fields.get("m_LoadedPatternFile")
	if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))))):
		pass
		return (c).fields.get("m_LoadedAreaFile")
	return null
	return null


static func c1070_f_SetCurrentLoadedFileAsRated(c: Variant, a: Array) -> Variant:
	if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Pattern"))))):
		pass
		(c).fields["m_bLoadedPatternPreviewFileRated"] = true
	else:
		pass
		if R.truth(((c).fields.get("m_bPreview") and (float((c).fields.get("m_iPreviewDataType")) == float(R.static_value("RDGameModeEditor", "DataType_Area"))))):
			pass
			(c).fields["m_bLoadedAreaPreviewFileRated"] = true
		else:
			pass
			if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Pattern"))))):
				pass
				(c).fields["m_bLoadedPatternFileRated"] = true
			else:
				pass
				if R.truth((R.unary("!", (c).fields.get("m_bPreview")) and (float((c).fields.get("m_iLastInterfaceMode")) == float(R.static_value("RDEditorInterface", "Mode_Area"))))):
					pass
					(c).fields["m_bLoadedAreaFileRated"] = true
	return null


static func c1070_f_ClearEntities(c: Variant, a: Array) -> Variant:
	var v_entity: Variant = null
	var v_entityNode: Variant = null
	v_entity = R.coerce(null, "RDEntity")
	R.call_member(c, "DeleteSelectedEntity", [])
	v_entityNode = R.coerce(((c.fields.get("m_Game")).fields.get("m_World")).fields.get("m_FirstEntity"), "RDEntityNode")
	while R.truth(v_entityNode):
		pass
		v_entity = R.coerce((v_entityNode).fields.get("m_Entity"), "RDEntity")
		if R.truth(((v_entity).fields.get("m_bSelectableInEditor") and (v_entity).fields.get("m_bDeletableInEditor"))):
			pass
			(v_entity).fields["m_bDestroyMe"] = true
		v_entityNode = R.coerce((v_entityNode).fields.get("m_Next"), "RDEntityNode")
	return null


static func c1070_f_DeleteFile(c: Variant, a: Array) -> Variant:
	var v_file: Variant = null
	var v_iIndex: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	R.call_member((c).fields.get("m_Interface"), "ShowLoadScreen", [])
	(c).fields["m_fAPITimeoutTimer"] = float(10)
	v_file = R.coerce(R.get_value((c).fields.get("m_LoadedFiles"), v_iIndex), "com.newgrounds.SaveFile")
	R.call_member(v_file, "addEventListener", [R.static_value("com.newgrounds.APIEvent", "FILE_DELETED"), R.get_value(c, "OnFileDeleted"), false, 0, true])
	R.call_member(v_file, "deleteFile", [])
	return null


static func c1070_f_OnFileDeleted(c: Variant, a: Array) -> Variant:
	var v_e: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	(c).fields["m_fAPITimeoutTimer"] = float(0)
	R.call_member((c).fields.get("m_Interface"), "HideLoadScreen", [])
	R.call_member((c).fields.get("m_Interface"), "OnFileDeleted", [])
	return null


static func c1070_f_SetNoBackgroundCity(c: Variant, a: Array) -> Variant:
	var v_bNoBackgroundCity: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	((c).fields.get("m_CampaignInfo")).fields["m_bNoBackgroundCity"] = v_bNoBackgroundCity
	R.call_member((c).fields.get("m_CityBG"), "SetHidden", [v_bNoBackgroundCity])
	return null


static func c1070_f_ResetEnding(c: Variant, a: Array) -> Variant:
	(c).fields["m_iEndingType"] = R.coerce(R.static_value("RDAreaInfo", "Type_Normal"), "int")
	R.call_member((c).fields.get("m_Interface"), "ShowEnding", [(c).fields.get("m_iEndingType")])
	return null
