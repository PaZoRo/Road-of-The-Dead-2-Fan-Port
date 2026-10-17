extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDGameModeStory(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_iTag: Variant = 0
	var v_iTag2: Variant = 0
	var v_iArea: Variant = 0
	var v_bFoundFirstHighwayArea: Variant = false
	var v_bFoundFirstIndustrialArea: Variant = false
	var v_theGame: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGame")
	v_i = R.coerce(0, "int")
	v_iTag = R.coerce(0, "int")
	v_iTag2 = R.coerce(0, "int")
	v_iArea = R.coerce(0, "int")
	(c).fields["m_StoryJets"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.invoke(R.super_ref(c, "RDGameModeStory"), [v_theGame])
	c.fields["m_iMinSpawnMax"] = R.coerce(5, "int")
	c.fields["m_iMaxSpawnMax"] = R.coerce(20, "int")
	c.fields["m_fMinSpawnRate"] = float(0.1)
	c.fields["m_fMaxSpawnRate"] = float(1)
	(c).fields["LevelInfos"] = R.coerce(R.construct(R.klass("Array"), ["Evans City", R.static_value("RDGameModeGameplay", "Area_Residential"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_6C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_8C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story01_9D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 5, R.static_value("RDGameModeStory", "LevelTag_None"), R.binary("|", R.static_value("RDGameModeStory", "LevelTag2_HardZombieLevel"), R.static_value("RDGameModeStory", "LevelTag2_SpawnWeaponCrate")), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 540, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 540, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Thornhill Road", R.static_value("RDGameModeGameplay", "Area_Residential"), 810, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story02_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story02_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story02_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story02_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_RadioRepair"), R.static_value("RDGameModeStory", "LevelTag2_FeedersLevel"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter04"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_NewFemaleZombieLevel"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Woodmere", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_6C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_B_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_GrubLevel"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter16"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_NewMaleZombieLevel"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "North Logan", R.static_value("RDGameModeGameplay", "Area_Residential"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_6R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_8C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_9D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_10C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_SoldierZombieLevel"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 720, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 270, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter09"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 270, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Meridian Avenue", R.static_value("RDGameModeGameplay", "Area_Residential"), 270, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_B_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_B_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story04_B_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.binary("|", R.static_value("RDGameModeStory", "LevelTag2_SpikesLevel"), R.static_value("RDGameModeStory", "LevelTag2_MineLevel")), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 450, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 270, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Greater Renton", R.static_value("RDGameModeGameplay", "Area_Town"), 360, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_ExplodingCarLevel"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 450, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter07"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Bonaventure Plaza", R.static_value("RDGameModeGameplay", "Area_Town"), 720, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_1C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story05_B_6D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_MotionMineLevel"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter14"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Burnaby Street", R.static_value("RDGameModeGameplay", "Area_Town"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_6D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_7C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_Mutants1"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 450, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 270, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 540, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Clifton Square", R.static_value("RDGameModeGameplay", "Area_Checkpoint"), 180, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_B_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_B_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_B_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_B_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Checkpoint"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Checkpoint"), 270, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_GarageChatter18"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Checkpoint"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Checkpoint"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Juneau Street", R.static_value("RDGameModeGameplay", "Area_Town"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_C_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_C_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_C_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_C_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_Jets"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 720, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 270, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "West Middletown", R.static_value("RDGameModeGameplay", "Area_Industrial"), 540, null, 10, R.static_value("RDGameModeStory", "LevelTag_Helicopter"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Madera District", R.static_value("RDGameModeGameplay", "Area_Town"), 360, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story08_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story08_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_ChopperLeave"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_EnterHighway"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Down Town", R.static_value("RDGameModeGameplay", "Area_Highway"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story09"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 40, R.static_value("RDGameModeStory", "LevelTag_Mutants2"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_JohnHighway"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_JohnCameo"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_JetAfterJohn"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Chinatown", R.static_value("RDGameModeGameplay", "Area_Highway"), 900, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story11"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 1620, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_2R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story12_6R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 1080, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story13_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story13_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story13_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Brighton Square", R.static_value("RDGameModeGameplay", "Area_Highway"), 1350, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_6C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story14_8C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 990, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story15_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story15_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story15_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story15_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story15_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 1440, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_1C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_6D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_7C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_8D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_9C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_10D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story16_11C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_LessJets"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Highway"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_ExitHighway"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Sylmar Avenue", R.static_value("RDGameModeGameplay", "Area_Industrial"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_1C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_2R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_6R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story17_7C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 30, R.static_value("RDGameModeStory", "LevelTag_Mutants3"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Northside Park", R.static_value("RDGameModeGameplay", "Area_Park"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story18_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story18_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story18_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story18_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story18_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_StartFog"), "Candor Hill", R.static_value("RDGameModeGameplay", "Area_Park"), 450, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story19_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story19_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_FullFog"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Northside Cemetery", R.static_value("RDGameModeGameplay", "Area_Cemetery"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story20_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story20_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story20_3C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story20_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story20_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_FullFog"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Cemetery"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 270, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_EndFog"), "", R.static_value("RDGameModeGameplay", "Area_Cemetery"), 360, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 270, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "East Entrance", R.static_value("RDGameModeGameplay", "Area_Park"), 720, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story21_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story21_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story21_3R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story21_4D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story21_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Park"), 270, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_3R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_5R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_6C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_8R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_9C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_10R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_11D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_12R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_13C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_14R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story22_15C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 80, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 630, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Clearwater", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story23_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story23_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_Mutants4"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 450, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 540, null, 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 450, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 180, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 900, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Industrial"), 720, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "East Finchley", R.static_value("RDGameModeGameplay", "Area_Town"), 540, R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story24_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story24_2D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story24_3R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), 10, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Town"), 360, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 450, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 630, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Alleyway"), 90, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "", R.static_value("RDGameModeGameplay", "Area_Residential"), 540, null, 0, R.static_value("RDGameModeStory", "LevelTag_None"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Fairview Mall", R.static_value("RDGameModeGameplay", "Area_Parking"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_EndChopper"), R.static_value("RDGameModeStory", "LevelTag2_None"), "Flyboy One", R.static_value("RDGameModeGameplay", "Area_Parking"), 900, null, 10, R.static_value("RDGameModeStory", "LevelTag_ChopperShooting"), R.static_value("RDGameModeStory", "LevelTag2_None")]), "Array")
	v_bFoundFirstHighwayArea = false
	v_bFoundFirstIndustrialArea = false
	c.fields["m_fTotalLevelLength"] = float(0)
	(c).fields["m_iNbLevels"] = R.coerce(R.binary("/", R.get_value((c).fields.get("LevelInfos"), "length"), 7), "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float((c).fields.get("m_iNbLevels")))):
		pass
		c.fields["m_fTotalLevelLength"] = R.coerce(R.binary("+", c.fields.get("m_fTotalLevelLength"), R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(v_i) * float(7))) + float(2))))), "Number")
		v_iTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(v_i) * float(7))) + float(5))), "int"), "int")
		v_iTag2 = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(v_i) * float(7))) + float(6))), "int"), "int")
		v_iArea = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(v_i) * float(7))) + float(1))), "int"), "int")
		if R.truth((float(v_iArea) == float(R.static_value("RDGameModeGameplay", "Area_Highway")))):
			pass
			if R.truth(R.unary("!", v_bFoundFirstHighwayArea)):
				pass
				(c).fields["m_iHighwayLevelStart"] = R.coerce(v_i, "int")
				v_bFoundFirstHighwayArea = true
			(c).fields["m_iHighwayLevelEnd"] = R.coerce(v_i, "int")
		else:
			pass
			if R.truth((float(v_iArea) == float(R.static_value("RDGameModeGameplay", "Area_Industrial")))):
				pass
				if R.truth(R.unary("!", v_bFoundFirstIndustrialArea)):
					pass
					c.fields["m_iFuelTruckLevel"] = R.coerce(v_i, "int")
					v_bFoundFirstIndustrialArea = true
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Mutants1")), 0)):
			pass
			c.fields["m_iVeryHardZombieLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Mutants2")), 0)):
			pass
			(c).fields["m_iMutantCount2Level"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Mutants3")), 0)):
			pass
			(c).fields["m_iMutantCount3Level"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Mutants4")), 0)):
			pass
			(c).fields["m_iMutantCount4Level"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Jets")), 0)):
			pass
			c.fields["m_iJetLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_LessJets")), 0)):
			pass
			(c).fields["m_iLessJetsLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_Helicopter")), 0)):
			pass
			(c).fields["m_iChopperSupportStartLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_ChopperLeave")), 0)):
			pass
			(c).fields["m_iChopperSupportEndLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_RadioRepair")), 0)):
			pass
			(c).fields["m_iRadioRepairLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_HardZombieLevel")), 0)):
			pass
			c.fields["m_iHardZombieLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_FeedersLevel")), 0)):
			pass
			c.fields["m_iFeedersLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_SpikesLevel")), 0)):
			pass
			c.fields["m_iSpikesLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_NewMaleZombieLevel")), 0)):
			pass
			c.fields["m_iNewMaleZombieLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_NewFemaleZombieLevel")), 0)):
			pass
			c.fields["m_iNewFemaleZombieLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_SoldierZombieLevel")), 0)):
			pass
			c.fields["m_iSoldierZombieLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_ExplodingCarLevel")), 0)):
			pass
			c.fields["m_iExplodingCarLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_MineLevel")), 0)):
			pass
			c.fields["m_iMineLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_MotionMineLevel")), 0)):
			pass
			c.fields["m_iMotionMineLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_GrubLevel")), 0)):
			pass
			c.fields["m_iGrubLevel"] = R.coerce(v_i, "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_DebugLevel")), 0)):
			pass
			(c).fields["m_iDebugLevel"] = R.coerce(v_i, "int")
		v_i = R.signed32(v_i + 1)
	(c).fields["m_MaleRadioRepairVoices"] = R.coerce(R.construct(R.klass("Array"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaStory02_1"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaStory02_2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaStory02_3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_CochetaStory03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_FemaleRadioRepairVoices"] = R.coerce(R.construct(R.klass("Array"), [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeStory02_1"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeStory02_2"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeStory02_3"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeStory03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_RadioRepairVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_4C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_5D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_6C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story03_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_HelicopterVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_2R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_4R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_5C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_6R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_7D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_8C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_9R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_10D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story07_11R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_RampVoice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSeeRamp"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ExitRampVoice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_DianeSeeExitRamp"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_SeeJohnVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story10_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story10_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story10_3D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_EndChopperVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story25_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story25_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_ChopperShooting1Voice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story26_1R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story26_2C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story26_3R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_ChopperShooting2Voice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story27"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ChopperShooting2BVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Cocheta"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story27_B_1C"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story27_B_2R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_ChopperShooting3Voice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story28"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_ChopperShooting3BVoice"] = R.coerce(R.construct(R.klass("Array"), [R.static_value("RDPlayer", "Speaker_Diane"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story28_B_1D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), R.static_value("RDPlayer", "Speaker_Center"), R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story28_B_2R"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])]), "Array")
	(c).fields["m_ChopperShooting4Voice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Ending01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	(c).fields["m_JetsComingVoice"] = R.coerce(R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_Story06_D"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")]), "DTSpacialSound")
	c.fields["m_bCanHaveChopperSupport"] = false
	R.call_member(c, "InitPatterns", [])
	c.fields["m_fSpawnRatioBaseNormal"] = float(0.3)
	c.fields["m_fSpawnRatioIncrementNormal"] = float(0.3)
	c.fields["m_fSpawnRatioBaseHard"] = float(0.5)
	c.fields["m_fSpawnRatioIncrementHard"] = float(0.5)
	(c).fields["m_AmmoVoices"] = R.coerce(R.construct(R.klass("RandomHat"), []), "RandomHat")
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ShermanAmmo01"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ShermanAmmo02"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	R.call_member((c).fields.get("m_AmmoVoices"), "AddValue", [R.call_static("SoundSystem", "CreateSpacialSound", [R.klass("SND_ShermanAmmo03"), (c.fields.get("m_Game")).fields.get("m_VoiceSoundGroup")])])
	(c).fields["m_AmmoSound"] = R.coerce(R.construct(R.klass("DTSound"), [R.klass("SND_AmmoSound"), (c.fields.get("m_Game")).fields.get("m_GameSFXSoundGroup")]), "DTSound")
	return null

static func f_OnStartDriverSelection(c: Variant, a: Array) -> Variant:
	var v_iLevelTag: Variant = 0
	v_iLevelTag = R.coerce(0, "int")
	if R.truth((R.binary("==", (c).fields.get("m_iDebugLevel"), R.unary("-", 1)) and R.unary("!", (c).fields.get("m_bIsHardcore")))):
		pass
		v_iLevelTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iStoryLevel")) * float(7))) + float(5))), "int"), "int")
		if R.truth(R.binary("!=", R.binary("&", v_iLevelTag, R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iStoryLevel", 1, "-=")
	(c).fields["m_bIsChopperShootingLevel"] = false
	return null

static func f_StartGameMode(c: Variant, a: Array) -> Variant:
	var v_iLevelTag: Variant = 0
	v_iLevelTag = R.coerce(0, "int")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "StartGameMode"), [])
	if R.truth((R.binary("==", (c).fields.get("m_iDebugLevel"), R.unary("-", 1)) and R.unary("!", (c).fields.get("m_bIsHardcore")))):
		pass
		v_iLevelTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iStoryLevel")) * float(7))) + float(5))), "int"), "int")
		if R.truth(R.binary("!=", R.binary("&", v_iLevelTag, R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)):
			pass
			R.set_value((c.fields.get("m_Game")).fields.get("m_PlayerInfo"), "m_iStoryLevel", 1, "-=")
	(c).fields["m_bIsChopperShootingLevel"] = false
	(c).fields["m_bHadDoUpgradeScreen"] = c.fields.get("m_bDoUpgradeScreen")
	return null

static func f_Reset(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	(c).fields["m_bFirstUpdate"] = true
	(c).fields["m_iJohnPatterns"] = R.coerce(0, "int")
	(c.fields.get("m_SpawnManager")).fields["m_bEnabled"] = true
	(c).fields["m_bEndChopperInSight"] = false
	c.fields["m_iLevel"] = R.coerce(R.call_member(c, "GetSavedLevel", []), "int")
	R.call_member(c, "UpdateSpawnableZombies", [])
	c.fields["m_iLevelArea"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(1))), "int")
	(c).fields["m_iLevelTag"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(5))), "int")
	(c).fields["m_iLevelTag2"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(6))), "int")
	(c).fields["m_bIsChopperShootingLevel"] = R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)
	(c).fields["m_fChopperShootingTimer"] = float(0)
	(c).fields["m_bPlayChopperShootingVoice1"] = true
	(c).fields["m_bPlayChopperShootingVoice2"] = true
	(c).fields["m_bPlayChopperShootingVoice2B"] = true
	(c).fields["m_bPlayChopperShootingVoice3"] = true
	(c).fields["m_bPlayChopperShootingVoice3B"] = true
	(c).fields["m_bPlayChopperShootingVoice4"] = true
	(c).fields["m_bPlayJetsComingBackDialog"] = false
	c.fields["m_fSpecialPatternPosition"] = float((float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
	c.fields["m_fCheckpointPatternPosition"] = float((float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
	(c).fields["m_bPlayStoryDialog"] = true
	(c).fields["m_bRadioRepair"] = false
	(c).fields["m_bRadioRepaired"] = false
	(c).fields["m_RadioRepairedVoice"] = R.coerce(null, "DTSpacialSound")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "Reset"), [])
	c.fields["m_bIsHighwayLevel"] = ((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iHighwayLevelStart"))) and (float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iHighwayLevelEnd"))))
	((c.fields.get("m_Player")).fields.get("m_vLocation")).fields["Z"] = float(0)
	c.fields["m_fLevelStartPosition"] = float(0)
	c.fields["m_fPlayerStartPosition"] = float(0)
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(c.fields.get("m_iLevel")))):
		pass
		c.fields["m_fPlayerStartPosition"] = R.coerce(R.binary("+", c.fields.get("m_fPlayerStartPosition"), R.get_value((c).fields.get("LevelInfos"), (float((float(v_i) * float(7))) + float(2)))), "Number")
		v_i = R.signed32(v_i + 1)
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", c.fields.get("m_fPlayerStartPosition"), c.fields.get("m_fTotalLevelLength"))), float(1)))
	c.fields["m_fMutantDelay"] = R.coerce(R.call_member(c, "GetMutantDelay", []), "Number")
	c.fields["m_fJetDelay"] = R.coerce(R.call_member(c, "GetJetDelay", []), "Number")
	R.call_member(c, "UpdateNextLevel", [])
	c.fields["m_iSpawnLevel"] = R.coerce(c.fields.get("m_iLevel"), "int")
	(c).fields["m_bSpawnWeaponCrate"] = true
	c.fields["m_iSpawnLevelArea"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
	c.fields["m_fSpawnLevelStartPosition"] = float(0)
	R.call_member(c, "OnNewSpawnLevelArea", [c.fields.get("m_iSpawnLevelArea")])
	if R.truth(c.fields.get("m_bIsHighwayLevel")):
		pass
		c.fields["m_fNextPatternSpawnPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternInitialSpawnDistance"))))
		c.fields["m_fNextHardPatternSpawnPosition"] = float((float((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingRandom"))))))
	else:
		pass
		c.fields["m_fNextPatternSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
		c.fields["m_fNextHardPatternSpawnPosition"] = float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))
	R.invoke(R.get_value((c).fields.get("m_StoryJets"), "splice"), [0])
	R.call_member(c, "OnPreLoadLevelTagEvents", [])
	return null

static func f_UpdateNextLevel(c: Variant, a: Array) -> Variant:
	var v_iTag: Variant = 0
	v_iTag = R.coerce(0, "int")
	(c).fields["m_szNextLevelName"] = R.coerce("", "String")
	(c).fields["m_iNextLevel"] = R.coerce(c.fields.get("m_iLevel"), "int")
	(c).fields["m_fNextLevelPosition"] = float(c.fields.get("m_fLevelStartPosition"))
	while R.truth(((float((c).fields.get("m_iNextLevel")) < float((float((c).fields.get("m_iNbLevels")) - float(1)))) and R.binary("==", (c).fields.get("m_szNextLevelName"), ""))):
		pass
		v_iTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float((c).fields.get("m_iNextLevel")) * float(7))) + float(5))), "int"), "int")
		if R.truth(((float(v_iTag) == float(R.static_value("RDGameModeStory", "LevelTag_EnterHighway"))) or (float(v_iTag) == float(R.static_value("RDGameModeStory", "LevelTag_ExitHighway"))))):
			pass
			(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextLevelPosition"), R.binary("+", R.static_value("RDGameModeGameplay", "HighwayTransitionDistance"), (135 if R.truth((float(v_iTag) == float(R.static_value("RDGameModeStory", "LevelTag_EnterHighway")))) else 115))), "Number")
		else:
			pass
			if R.truth((float(v_iTag) == float(R.static_value("RDGameModeStory", "LevelTag_EndChopper")))):
				pass
				(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextLevelPosition"), 60), "Number")
			else:
				pass
				(c).fields["m_fNextLevelPosition"] = R.coerce(R.binary("+", (c).fields.get("m_fNextLevelPosition"), R.get_value((c).fields.get("LevelInfos"), (float((float((c).fields.get("m_iNextLevel")) * float(7))) + float(2)))), "Number")
		R.set_value(c, "m_iNextLevel", 1, "+=")
		(c).fields["m_szNextLevelName"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((c).fields.get("m_iNextLevel")) * float(7))), "String")
	return null

static func f_OnPostStartUpUpgradeScreen(c: Variant, a: Array) -> Variant:
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "OnPostStartUpUpgradeScreen"), [])
	R.call_member(c, "DisplayLevel", [])
	return null

static func f_DisplayLevel(c: Variant, a: Array) -> Variant:
	var v_szLevelName: Variant = null
	v_szLevelName = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float(c.fields.get("m_iLevel")) * float(7))), "String")
	if R.truth(R.binary("!=", v_szLevelName, "")):
		pass
		R.call_member(c.fields.get("m_Game"), "ShowMessageBox", ["", v_szLevelName])
	return null

static func f_BeginGameMode(c: Variant, a: Array) -> Variant:
	var v_iNbFillers: Variant = 0
	var v_fStep: Variant = NAN
	var v_i: Variant = 0
	var v_iObstacle: Variant = 0
	var v_obstacleClass: Variant = null
	var v_obstacle: Variant = null
	var v_fPosZ: Variant = NAN
	v_iNbFillers = R.coerce(0, "int")
	v_fStep = float(NAN)
	v_i = R.coerce(0, "int")
	v_iObstacle = R.coerce(0, "int")
	v_obstacleClass = R.coerce(null, "Class")
	v_obstacle = R.coerce(null, "RDObstacle")
	v_fPosZ = float(NAN)
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "BeginGameMode"), [])
	if R.truth(R.unary("!", (c).fields.get("m_bHadDoUpgradeScreen"))):
		pass
		R.call_member(c, "DisplayLevel", [])
	(c).fields["m_bHadDoUpgradeScreen"] = false
	if R.truth(c.fields.get("m_bIsHighwayLevel")):
		pass
		v_iNbFillers = R.coerce(5, "int")
		v_fStep = float(R.binary("/", R.static_value("RDGameModeGameplay", "PatternInitialSpawnDistance"), (float(v_iNbFillers) + float(1))))
		v_i = R.coerce(0, "int")
		while R.truth((float(v_i) < float(v_iNbFillers))):
			pass
			v_iObstacle = R.coerce(R.call_static("Maths", "RandomInt", [6]), "int")
			v_obstacleClass = R.coerce(R.klass("RDObstacleWaterJug"), "Class")
			if R.truth((float(v_iObstacle) == float(0))):
				pass
				v_obstacleClass = R.coerce(R.klass("RDObstacleShoppingCart"), "Class")
			else:
				pass
				if R.truth((float(v_iObstacle) == float(1))):
					pass
					v_obstacleClass = R.coerce(R.klass("RDObstacleTrafficCone"), "Class")
				else:
					pass
					if R.truth((float(v_iObstacle) == float(2))):
						pass
						v_obstacleClass = R.coerce(R.klass("RDObstacleTrafficBarrel"), "Class")
					else:
						pass
						if R.truth((float(v_iObstacle) == float(3))):
							pass
							v_obstacleClass = R.coerce(R.klass("RDObstacleBox"), "Class")
						else:
							pass
							if R.truth((float(v_iObstacle) == float(4))):
								pass
								v_obstacleClass = R.coerce(R.klass("RDObstacleConstructionSign"), "Class")
							else:
								pass
								if R.truth((float(v_iObstacle) == float(5))):
									pass
									v_obstacleClass = R.coerce(R.klass("RDObstacleWaterJug"), "Class")
			v_obstacle = R.coerce(R.construct(v_obstacleClass, []), "RDObstacle")
			v_fPosZ = float((float(c.fields.get("m_fLevelStartPosition")) + float((float((float(v_i) + float(1))) * float(v_fStep)))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_obstacle, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(7))) + float((float(randf()) * float(14)))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			v_i = R.signed32(v_i + 1)
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bIsAwareOfStoryMode"] = true
	R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	(c.fields.get("m_BG")).fields["m_bUseFog"] = true
	return null

static func f_GetMusic(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (c.fields.get("m_Game")).fields.get("m_TenseMusic")
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetMusic"), [])
	return null

static func f_OnLevelTagEvents(c: Variant, a: Array) -> Variant:
	var v_fPosZ: Variant = NAN
	var v_fRoadArea: Variant = NAN
	var v_i: Variant = 0
	var v_storyJet: Variant = null
	v_fPosZ = float(NAN)
	v_fRoadArea = float(NAN)
	v_i = R.coerce(0, "int")
	v_storyJet = R.coerce(null, "RDJet")
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Helicopter")), 0)):
		pass
		c.fields["m_HelicopterAlly"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDHelicopterAlly")]), R.klass("RDHelicopterAlly")), "RDHelicopterAlly")
		R.call_member(c.fields.get("m_HelicopterAlly"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed"), false, 0, true])
		v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDHelicopterAlly", "SpawnDistance"))))
		R.call_member(c.fields.get("m_Game"), "AddEntity", [c.fields.get("m_HelicopterAlly"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), (c.fields.get("m_HelicopterAlly")).fields.get("m_fFlyHeight")), v_fPosZ])
	else:
		pass
		if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_JohnCameo")), 0)):
			pass
			(c).fields["m_John"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDJohnCar")]), R.klass("RDJohnCar")), "RDJohnCar")
			R.call_member((c).fields.get("m_John"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJohnDestroyed"), false, 0, true])
			v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDJohnCar", "SpawnDistance"))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_John"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			(c).fields["m_JetAlly"] = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDJetAlly")]), R.klass("RDJetAlly")), "RDJetAlly")
			R.call_member((c).fields.get("m_JetAlly"), "addEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetAllyDestroyed"), false, 0, true])
			v_fPosZ = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float((float(R.static_value("RDJetAlly", "SpawnDistance")) * float(10)))))
			R.call_member(c.fields.get("m_Game"), "AddEntity", [(c).fields.get("m_JetAlly"), R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), R.static_value("RDJetAlly", "FlyHeight")), v_fPosZ])
		else:
			pass
			if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Jets")), 0)):
				pass
				v_fRoadArea = float(10)
				v_i = R.coerce(0, "int")
				while R.truth((float(v_i) < float(5))):
					pass
					v_storyJet = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDJet")]), R.klass("RDJet")), "RDJet")
					R.call_member(v_storyJet, "Init", [1])
					v_fPosZ = float((float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) - float(R.static_value("RDJet", "SpawnDistance")))) - float((float(v_i) * float(R.static_value("RDJet", "DistanceOffset"))))))
					R.call_member(c.fields.get("m_Game"), "AddEntity", [v_storyJet, R.call_static("RDWorld", "GetPerlinX", [v_fPosZ]), R.binary("+", R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), R.static_value("RDJet", "FlyHeight")), v_fPosZ])
					R.call_member(v_storyJet, "StartStoryPassBy", [(float(v_i) * float(R.static_value("RDJet", "DistanceOffset"))), R.binary("+", R.unary("-", v_fRoadArea), (float((float(randf()) * float(2))) * float(v_fRoadArea)))])
					R.invoke(R.get_value((c).fields.get("m_StoryJets"), "push"), [v_storyJet])
					v_i = R.signed32(v_i + 1)
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag2"), R.static_value("RDGameModeStory", "LevelTag2_FullFog")), 0)):
		pass
		c.fields["m_fTargetFogDistance"] = float(R.static_value("RDGameModeStory", "StoryFogDistance"))
		c.fields["m_fTargetFogRange"] = float(R.static_value("RDCamera", "FogRange"))
		(c.fields.get("m_Camera")).fields["m_fFogDistance"] = float(c.fields.get("m_fTargetFogDistance"))
		(c.fields.get("m_Camera")).fields["m_fFogRange"] = float(c.fields.get("m_fTargetFogRange"))
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag2"), R.static_value("RDGameModeStory", "LevelTag2_StartFog")), 0)):
		pass
		c.fields["m_fTargetFogDistance"] = float(R.static_value("RDGameModeStory", "StoryFogDistance"))
		c.fields["m_fTargetFogRange"] = float(R.static_value("RDCamera", "FogRange"))
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag2"), R.static_value("RDGameModeStory", "LevelTag2_EndFog")), 0)):
		pass
		c.fields["m_fTargetFogDistance"] = float(R.static_value("RDCamera", "NoFogDistance"))
		c.fields["m_fTargetFogRange"] = float(R.static_value("RDCamera", "NoFogRange"))
	return null

static func f_OnPreLoadLevelTagEvents(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_EnterHighway")), 0)):
		pass
		c.fields["m_bSpawnRamp"] = true
		c.fields["m_fSpawnRampPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "HighwayTransitionDistance"))))
	else:
		pass
		if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_ExitHighway")), 0)):
			pass
			c.fields["m_bSpawnRamp"] = true
			c.fields["m_fSpawnRampPosition"] = float((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "HighwayTransitionDistance"))))
	return null

static func f_OnJohnDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_John"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJohnDestroyed")])
	(c).fields["m_John"] = R.coerce(null, "RDJohnCar")
	return null

static func f_OnPreChangeLevel(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Mutants1")), 0)):
		pass
		((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bMutantLevelFinished"] = true
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_UpdateGameplay(c: Variant, a: Array) -> Variant:
	var v_szLevelName: Variant = null
	var v_levelPatterns: Variant = null
	var v_levelPattern: Variant = null
	var v_fSpawnLevelLength: Variant = NAN
	var v_fNextSpawnLevelStartPosition: Variant = NAN
	var v_fPatternSpace: Variant = NAN
	var v_waterJug: Variant = null
	var v_fPosZ: Variant = NAN
	var v_storyDialog: Variant = null
	var v_fStretch: Variant = NAN
	var v_fPatternSpacing: Variant = NAN
	var v_fSpawnRatio: Variant = NAN
	var v_iRandom: Variant = 0
	var v_voice: Variant = null
	var v_bDisplayNewArea: Variant = false
	var v_fLevelLength: Variant = NAN
	var v_fNextLevelStartPosition: Variant = NAN
	var v_fDeltaTime: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	v_szLevelName = R.coerce(null, "String")
	v_levelPatterns = R.coerce(null, "RandomHat")
	v_levelPattern = R.coerce(null, "RDLevelPatternCustomNew")
	v_fSpawnLevelLength = float(NAN)
	v_fNextSpawnLevelStartPosition = float(NAN)
	v_fPatternSpace = float(NAN)
	v_waterJug = R.coerce(null, "RDObstacleWaterJug")
	v_fPosZ = float(NAN)
	v_storyDialog = R.coerce(null, "Array")
	v_fStretch = float(NAN)
	v_fPatternSpacing = float(NAN)
	v_fSpawnRatio = float(NAN)
	v_iRandom = R.coerce(0, "int")
	v_voice = R.coerce(null, "DTSpacialSound")
	c.fields["m_fLevelDifficulty"] = float(minf(float(R.binary("/", (float(c.fields.get("m_fPlayerStartPosition")) + float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"))), c.fields.get("m_fTotalLevelLength"))), float(1)))
	((c.fields.get("m_Game")).fields.get("m_VoiceOverSFXMix")).fields["m_fVolume"] = float((float(R.static_value("RDGame", "MinVoiceOverSFXMix")) + float((float(c.fields.get("m_fLevelDifficulty")) * float((float(R.static_value("RDGame", "MaxVoiceOverSFXMix")) - float(R.static_value("RDGame", "MinVoiceOverSFXMix"))))))))
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "UpdateGameplay"), [v_fDeltaTime])
	if R.truth(c.fields.get("m_bShowStats")):
		pass
		R.call_member(c, "UpdateStats", [v_fDeltaTime])
		return null
	v_bDisplayNewArea = false
	v_fLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(2)))))
	v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
	if R.truth((float(((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z")) >= float(v_fNextLevelStartPosition))):
		pass
		R.call_member(c, "OnPreChangeLevel", [])
		R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
		R.call_member(c, "UpdateSpawnableZombies", [])
		c.fields["m_iLevelArea"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(1))), "int")
		R.call_member(c, "OnNewLevelArea", [])
		(c).fields["m_iLevelTag"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(5))), "int")
		(c).fields["m_iLevelTag2"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(6))), "int")
		c.fields["m_fLevelStartPosition"] = float(v_fNextLevelStartPosition)
		v_fLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(2)))))
		v_fNextLevelStartPosition = float((float(c.fields.get("m_fLevelStartPosition")) + float(v_fLevelLength)))
		R.call_member(c, "UpdateNextLevel", [])
		(c).fields["m_bPlayStoryDialog"] = true
		if R.truth(R.unary("!", (c.fields.get("m_Player")).fields.get("m_bFailed"))):
			pass
			v_szLevelName = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float(c.fields.get("m_iLevel")) * float(7))), "String")
			if R.truth(R.binary("!=", v_szLevelName, "")):
				pass
				R.call_member(c, "SetSavedLevel", [c.fields.get("m_iLevel")])
				v_bDisplayNewArea = true
		R.call_member(c, "OnPreLoadLevelTagEvents", [])
		R.call_member(c, "OnLevelTagEvents", [])
	if R.truth(v_bDisplayNewArea):
		pass
		R.call_member(c.fields.get("m_Game"), "ShowMessageBox", [("" if R.truth((c).fields.get("m_bIsHardcore")) else "Progress Saved..."), v_szLevelName])
	if R.truth(((c).fields.get("m_bPlayStoryDialog") and R.binary(">=", ((c.fields.get("m_Player")).fields.get("m_vLocation")).fields.get("Z"), R.binary("+", c.fields.get("m_fLevelStartPosition"), R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(4))))))):
		pass
		v_storyDialog = R.coerce(R.binary("as", R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(3))), R.klass("Array")), "Array")
		if R.truth(v_storyDialog):
			pass
			(c).fields["m_StoryDialog"] = R.coerce(v_storyDialog, "Array")
			R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
			R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		(c).fields["m_bPlayStoryDialog"] = false
		if R.truth((R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_ChopperLeave")), 0) and R.truth(c.fields.get("m_HelicopterAlly")))):
			pass
			R.call_member(c.fields.get("m_HelicopterAlly"), "StartRetreat", [])
	if R.truth((c).fields.get("m_bPlayJetsComingBackDialog")):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_JetsComingVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
		(c).fields["m_bPlayJetsComingBackDialog"] = false
	while R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextPatternSpawnPosition")))):
		pass
		if R.truth(c.fields.get("m_bIsHighwayLevel")):
			pass
			if R.truth((c.fields.get("m_bSpawnRamp") and (float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = R.coerce(c.fields.get("m_LevelRampExitPatterns"), "RandomHat")
				c.fields["m_bSpawnRamp"] = false
			else:
				pass
				c.fields["m_bSpawnWeapons"] = false
				c.fields["m_bSpawnCheckpoint"] = false
				if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fCheckpointPatternPosition")))):
					pass
					c.fields["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth(((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fSpecialPatternPosition"))) and R.unary("!", R.call_member(c, "HasActiveStoryDialog", [])))):
						pass
						c.fields["m_bSpawnWeapons"] = true
						if R.truth((float(c.fields.get("m_iSpecialLocation")) == float(2))):
							pass
							c.fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(c.fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth(((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_JohnHighway"))) and (float((c).fields.get("m_iJohnPatterns")) > float(0)))):
					pass
					v_levelPatterns = R.coerce(c.fields.get("m_LevelJohnHighwayPatterns"), "RandomHat")
					R.set_value(c, "m_iJohnPatterns", 1, "-=")
				else:
					pass
					if R.truth(c.fields.get("m_bSpawnCheckpoint")):
						pass
						v_levelPatterns = R.coerce(c.fields.get("m_LevelCheckpointHighwayPatterns"), "RandomHat")
						c.fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(c.fields.get("m_bSpawnWeapons")):
							pass
							v_levelPatterns = R.coerce(c.fields.get("m_LevelWeaponsHighwayPatterns"), "RandomHat")
							c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "HighwaySpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HighwaySpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextHardPatternSpawnPosition")))):
								pass
								v_levelPatterns = R.coerce(c.fields.get("m_LevelHardHighwayPatterns"), "RandomHat")
								c.fields["m_fNextHardPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextHardPatternSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HighwayHardPatternSpacingRandom")))))), "Number")
							else:
								pass
								v_levelPatterns = R.coerce(c.fields.get("m_LevelNormalHighwayPatterns"), "RandomHat")
			v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew")), "RDLevelPatternCustomNew")
			v_fStretch = float((float(1) + float((float(randf()) * float((float(0.25) + float((float((float(1) - float(c.fields.get("m_fLevelDifficulty")))) * float(0.25)))))))))
			c.fields["m_bIsZombieCheckpoint"] = c.fields.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), 1, v_fStretch]), "Number")
			c.fields["m_bIsZombieCheckpoint"] = false
			c.fields["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [c.fields.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			v_fPatternSpacing = float((float(R.static_value("RDGameModeGameplay", "PatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "PatternSpacingRandom"))))))
			if R.truth(((c.fields.get("m_Player")).fields.get("m_bIsOnFire") and (float(randf()) < float(R.static_value("RDGameModeGameplay", "WaterJugChance"))))):
				pass
				v_waterJug = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug")), "RDObstacleWaterJug")
				v_fPosZ = float((float(c.fields.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.static_value("RDRoad", "RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.static_value("RDRoad", "RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), (float(v_fPatternSpace) + float(v_fPatternSpacing))), "Number")
			v_fSpawnLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(c.fields.get("m_fSpawnLevelStartPosition")) + float(v_fSpawnLevelLength)))
			while R.truth((float(c.fields.get("m_fNextPatternSpawnPosition")) >= float(v_fNextSpawnLevelStartPosition))):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				(c).fields["m_bSpawnWeaponCrate"] = true
				c.fields["m_iSpawnLevelArea"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				c.fields["m_fSpawnLevelStartPosition"] = float(v_fNextSpawnLevelStartPosition)
				R.call_member(c, "OnNewSpawnLevelArea", [c.fields.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(c.fields.get("m_fSpawnLevelStartPosition")) + float(v_fSpawnLevelLength)))
		else:
			pass
			if R.truth((c.fields.get("m_bSpawnRamp") and (float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fSpawnRampPosition"))))):
				pass
				v_levelPatterns = R.coerce(c.fields.get("m_LevelRampPatterns"), "RandomHat")
				c.fields["m_bSpawnRamp"] = false
			else:
				pass
				c.fields["m_bSpawnChurch"] = false
				c.fields["m_bSpawnPoliceStation"] = false
				c.fields["m_bSpawnWeapons"] = false
				c.fields["m_bSpawnGarage"] = false
				c.fields["m_bSpawnCheckpoint"] = false
				if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fCheckpointPatternPosition")))):
					pass
					c.fields["m_bSpawnCheckpoint"] = true
				else:
					pass
					if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fSpecialPatternPosition")))):
						pass
						if R.truth(((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park"))) or (float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery"))))):
							pass
							c.fields["m_bSpawnWeapons"] = true
							if R.truth((float(c.fields.get("m_iSpecialLocation")) == float(2))):
								pass
								c.fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(c.fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
						else:
							pass
							v_iRandom = R.coerce(c.fields.get("m_iSpecialLocation"), "int")
							c.fields["m_bSpawnChurch"] = (float(v_iRandom) == float(0))
							c.fields["m_bSpawnPoliceStation"] = (float(v_iRandom) == float(1))
							c.fields["m_bSpawnWeapons"] = (float(v_iRandom) == float(2))
							c.fields["m_bSpawnGarage"] = (float(v_iRandom) == float(3))
							c.fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(c.fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
				if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Residential")))):
					pass
					if R.truth(c.fields.get("m_bSpawnChurch")):
						pass
						v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialChurchPatterns"), "RandomHat")
						c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
					else:
						pass
						if R.truth(c.fields.get("m_bSpawnPoliceStation")):
							pass
							v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialPoliceStationPatterns"), "RandomHat")
							c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(c.fields.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialWeaponsPatterns"), "RandomHat")
								c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(c.fields.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialGaragePatterns"), "RandomHat")
									c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(c.fields.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialCheckpointPatterns"), "RandomHat")
										c.fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelResidentialPatterns"), "RandomHat")
				else:
					pass
					if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Town")))):
						pass
						if R.truth(c.fields.get("m_bSpawnChurch")):
							pass
							v_levelPatterns = R.coerce(c.fields.get("m_LevelTownChurchPatterns"), "RandomHat")
							c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
						else:
							pass
							if R.truth(c.fields.get("m_bSpawnPoliceStation")):
								pass
								v_levelPatterns = R.coerce(c.fields.get("m_LevelTownPoliceStationPatterns"), "RandomHat")
								c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(c.fields.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = R.coerce(c.fields.get("m_LevelTownWeaponsPatterns"), "RandomHat")
									c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(c.fields.get("m_bSpawnGarage")):
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelTownGaragePatterns"), "RandomHat")
										c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
									else:
										pass
										if R.truth(c.fields.get("m_bSpawnCheckpoint")):
											pass
											v_levelPatterns = R.coerce(c.fields.get("m_LevelTownCheckpointPatterns"), "RandomHat")
											c.fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
										else:
											pass
											v_levelPatterns = R.coerce(c.fields.get("m_LevelTownPatterns"), "RandomHat")
					else:
						pass
						if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Industrial")))):
							pass
							if R.truth(c.fields.get("m_bSpawnWeapons")):
								pass
								v_levelPatterns = R.coerce(c.fields.get("m_LevelIndustrialWeaponsPatterns"), "RandomHat")
								c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
							else:
								pass
								if R.truth(c.fields.get("m_bSpawnGarage")):
									pass
									v_levelPatterns = R.coerce(c.fields.get("m_LevelIndustrialGaragePatterns"), "RandomHat")
									c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									if R.truth(c.fields.get("m_bSpawnCheckpoint")):
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelIndustrialCheckpointPatterns"), "RandomHat")
										c.fields["m_fCheckpointPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "CheckpointPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelIndustrialPatterns"), "RandomHat")
						else:
							pass
							if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Park")))):
								pass
								if R.truth(c.fields.get("m_bSpawnWeapons")):
									pass
									v_levelPatterns = R.coerce(c.fields.get("m_LevelParkWeaponsPatterns"), "RandomHat")
									c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
								else:
									pass
									v_levelPatterns = R.coerce(c.fields.get("m_LevelParkPatterns"), "RandomHat")
							else:
								pass
								if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Cemetery")))):
									pass
									if R.truth(c.fields.get("m_bSpawnWeapons")):
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelCemeteryWeaponsPatterns"), "RandomHat")
										c.fields["m_fSpecialPatternPosition"] = float((float((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) + float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingMin")))) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "SpecialPatternSpacingRandom"))))))
									else:
										pass
										v_levelPatterns = R.coerce(c.fields.get("m_LevelCemeteryPatterns"), "RandomHat")
								else:
									pass
									if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking")))):
										pass
										if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)):
											pass
											v_levelPatterns = R.coerce(c.fields.get("m_LevelChopperShootingPatterns"), "RandomHat")
										else:
											pass
											v_levelPatterns = R.coerce(c.fields.get("m_LevelParkingPatterns"), "RandomHat")
									else:
										pass
										if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Alleyway")))):
											pass
											v_levelPatterns = R.coerce(c.fields.get("m_LevelAlleywayPatterns"), "RandomHat")
										else:
											pass
											if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Checkpoint")))):
												pass
												v_levelPatterns = R.coerce(c.fields.get("m_LevelTownCheckpointPatterns"), "RandomHat")
			v_fSpawnRatio = float((float(c.fields.get("m_fSpawnRatioBaseNormal")) + float((float(c.fields.get("m_fLevelDifficulty")) * float(c.fields.get("m_fSpawnRatioIncrementNormal"))))))
			if R.truth((float((float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")) + float(R.static_value("RDGameModeGameplay", "PatternViewDistance")))) >= float(c.fields.get("m_fNextHardPatternSpawnPosition")))):
				pass
				v_fSpawnRatio = float((float(c.fields.get("m_fSpawnRatioBaseHard")) + float((float(c.fields.get("m_fLevelDifficulty")) * float(c.fields.get("m_fSpawnRatioIncrementHard"))))))
				c.fields["m_fNextHardPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextHardPatternSpawnPosition"), (float(R.static_value("RDGameModeGameplay", "HardPatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "HardPatternSpacingRandom")))))), "Number")
			if R.truth(((R.truth(((float(c.fields.get("m_iSpawnLevel")) >= float((c).fields.get("m_iChopperSupportStartLevel"))) and (float(c.fields.get("m_iSpawnLevel")) <= float((c).fields.get("m_iChopperSupportEndLevel"))))) and R.truth(c.fields.get("m_HelicopterAlly"))) and (c.fields.get("m_HelicopterAlly")).fields.get("m_bShootingMode"))):
				pass
				v_fSpawnRatio = float(minf(float((float(v_fSpawnRatio) * float(1.5))), float(1)))
			v_levelPattern = R.coerce(R.binary("as", R.call_member(v_levelPatterns, "GetRandomValue", []), R.klass("RDLevelPatternCustomNew")), "RDLevelPatternCustomNew")
			if R.truth(((((R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp")) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Ramp2"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_RampExit"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_Parking"))) or R.binary("==", (v_levelPattern).fields.get("m_MCClass"), R.klass("MC_LevelPattern_LG_ChopperShooting")))):
				pass
				v_fSpawnRatio = float(1)
			c.fields["m_bIsZombieCheckpoint"] = c.fields.get("m_bSpawnCheckpoint")
			v_fPatternSpace = R.coerce(R.call_member(v_levelPattern, "Load", [c, c.fields.get("m_iLevel"), c.fields.get("m_fLevelDifficulty"), c.fields.get("m_fNextPatternSpawnPosition"), v_fSpawnRatio, 1]), "Number")
			c.fields["m_bIsZombieCheckpoint"] = false
			c.fields["m_bSpawnCheckpoint"] = false
			R.call_member(c, "TrySpawnMotionMines", [c.fields.get("m_fNextPatternSpawnPosition")])
			R.call_member(c, "TrySpawnWeaponCrate", [])
			if R.truth(((c.fields.get("m_Player")).fields.get("m_bIsOnFire") and (float(randf()) < float(R.static_value("RDGameModeGameplay", "WaterJugChance"))))):
				pass
				v_fPatternSpacing = float((float(R.static_value("RDGameModeGameplay", "PatternSpacingMin")) + float((float(randf()) * float(R.static_value("RDGameModeGameplay", "PatternSpacingRandom"))))))
				v_waterJug = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWaterJug")]), R.klass("RDObstacleWaterJug")), "RDObstacleWaterJug")
				v_fPosZ = float((float(c.fields.get("m_fNextPatternSpawnPosition")) + float(R.binary("/", v_fPatternSpacing, 2))))
				R.call_member(c.fields.get("m_Game"), "AddEntity", [v_waterJug, (float((R.num(R.call_static("RDWorld", "GetPerlinX", [v_fPosZ])) - float(R.static_value("RDRoad", "RoadPosX")))) + float((float(randf()) * float((float(2) * float(R.static_value("RDRoad", "RoadPosX"))))))), R.call_static("RDWorld", "GetPerlinY", [v_fPosZ]), v_fPosZ])
			c.fields["m_fNextPatternSpawnPosition"] = R.coerce(R.binary("+", c.fields.get("m_fNextPatternSpawnPosition"), v_fPatternSpace), "Number")
			v_fSpawnLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(2)))))
			v_fNextSpawnLevelStartPosition = float((float(c.fields.get("m_fSpawnLevelStartPosition")) + float(v_fSpawnLevelLength)))
			while R.truth((float(c.fields.get("m_fNextPatternSpawnPosition")) >= float(v_fNextSpawnLevelStartPosition))):
				pass
				R.assign(c, "m_iSpawnLevel", "RDGameModeStory", 1, "+=")
				(c).fields["m_bSpawnWeaponCrate"] = true
				c.fields["m_iSpawnLevelArea"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(1))), "int")
				c.fields["m_fSpawnLevelStartPosition"] = float(v_fNextSpawnLevelStartPosition)
				R.call_member(c, "OnNewSpawnLevelArea", [c.fields.get("m_iSpawnLevelArea")])
				v_fSpawnLevelLength = float(R.num(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(2)))))
				v_fNextSpawnLevelStartPosition = float((float(c.fields.get("m_fSpawnLevelStartPosition")) + float(v_fSpawnLevelLength)))
	R.call_member(c, "UpdateMutantSpawning", [v_fDeltaTime])
	if R.truth(((c).fields.get("m_bRadioRepair") and (float((c.fields.get("m_Player")).fields.get("m_iCurrentTask")) == float(R.static_value("RDPlayer", "Task_None"))))):
		pass
		(c).fields["m_fRadioRepairTime"] = R.coerce(R.binary("-", (c).fields.get("m_fRadioRepairTime"), v_fDeltaTime), "Number")
		if R.truth((float((c).fields.get("m_fRadioRepairTime")) <= float(0))):
			pass
			(c).fields["m_fRadioRepairTime"] = float(10)
			R.set_value(c, "m_iRadioRepairAttempt", 1, "+=")
			if R.truth((float((c).fields.get("m_iRadioRepairAttempt")) == float(1))):
				pass
				R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Cocheta") if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Diane")), (R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 0) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 0)), R.static_value("RDPlayer", "VoicePriority_Crucial")])
			else:
				pass
				if R.truth((float((c).fields.get("m_iRadioRepairAttempt")) == float(2))):
					pass
					R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Cocheta") if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Diane")), (R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 1) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 1)), R.static_value("RDPlayer", "VoicePriority_Crucial")])
				else:
					pass
					if R.truth((float((c).fields.get("m_iRadioRepairAttempt")) == float(3))):
						pass
						R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Cocheta") if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Diane")), (R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 2) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 2)), R.static_value("RDPlayer", "VoicePriority_Crucial")])
						(c.fields.get("m_Player")).fields["m_bForceBrake"] = true
		v_voice = R.coerce((R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 0) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 0)), "DTSpacialSound")
		if R.truth(R.logical_and(R.logical_and((((c).fields.get("m_bRadioRepair") and R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPaused"))) and R.unary("!", R.call_member(v_voice, "IsPlaying", []))), func(): return R.call_member(c.fields.get("m_Player"), "CanStartTask", [])), func(): return (float((c.fields.get("m_Player")).fields.get("m_iLeftHandState")) == float(R.static_value("RDPlayer", "HandState_OnWheel"))))):
			pass
			(c).fields["m_bRadioRepair"] = false
			R.call_member(c.fields.get("m_Player"), "StartTask", [R.static_value("RDPlayer", "Task_RepairRadio"), false, 0])
	if R.truth(((R.truth((c).fields.get("m_RadioRepairedVoice")) and R.truth(R.unary("!", (c.fields.get("m_Game")).fields.get("m_bPaused")))) and R.unary("!", R.call_member((c).fields.get("m_RadioRepairedVoice"), "IsPlaying", [])))):
		pass
		(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_RadioRepairVoice"), "Array")
		R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
		R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		(c).fields["m_RadioRepairedVoice"] = R.coerce(null, "DTSpacialSound")
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		(c).fields["m_fChopperShootingTimer"] = R.coerce(R.binary("+", (c).fields.get("m_fChopperShootingTimer"), v_fDeltaTime), "Number")
		if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice1Time"))) and (c).fields.get("m_bPlayChopperShootingVoice1"))):
			pass
			(c).fields["m_bPlayChopperShootingVoice1"] = false
			(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_ChopperShooting1Voice"), "Array")
			R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
			R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
		else:
			pass
			if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice2Time"))) and (c).fields.get("m_bPlayChopperShootingVoice2"))):
				pass
				(c).fields["m_bPlayChopperShootingVoice2"] = false
				R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Center"), (c).fields.get("m_ChopperShooting2Voice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
			else:
				pass
				if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice2BTime"))) and (c).fields.get("m_bPlayChopperShootingVoice2B"))):
					pass
					(c).fields["m_bPlayChopperShootingVoice2B"] = false
					(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_ChopperShooting2BVoice"), "Array")
					R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
					R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
				else:
					pass
					if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice3Time"))) and (c).fields.get("m_bPlayChopperShootingVoice3"))):
						pass
						(c).fields["m_bPlayChopperShootingVoice3"] = false
						R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Center"), (c).fields.get("m_ChopperShooting3Voice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
					else:
						pass
						if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice3BTime"))) and (c).fields.get("m_bPlayChopperShootingVoice3B"))):
							pass
							(c).fields["m_bPlayChopperShootingVoice3B"] = false
							(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_ChopperShooting3BVoice"), "Array")
							R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
							R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
						else:
							pass
							if R.truth(((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingVoice4Time"))) and (c).fields.get("m_bPlayChopperShootingVoice4"))):
								pass
								(c).fields["m_bPlayChopperShootingVoice4"] = false
								R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Center"), (c).fields.get("m_ChopperShooting4Voice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
							else:
								pass
								if R.truth((float((c).fields.get("m_fChopperShootingTimer")) >= float(R.static_value("RDGameModeStory", "ChopperShootingTime")))):
									pass
									R.call_member(c, "CompleteStoryMode", [])
									if R.truth(((float((R.static_value("RDPlayerInfo", "Instance")).fields.get("m_iCivsInCar")) > float(0)) and R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "FreeRide"))))):
										pass
										R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "FreeRide")])
										R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
									(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
									R.call_member(R.static_value("RDGame", "Instance"), "StartCinematic", ["GameEnding", false])
		R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "ShowTime", [(float(R.static_value("RDGameModeStory", "ChopperShootingTime")) - float((c).fields.get("m_fChopperShootingTimer")))])
		if R.truth(R.call_member((c.fields.get("m_Player")).fields.get("m_Weapon"), "ShouldReplenishAmmo", [])):
			pass
			R.call_member(c.fields.get("m_Player"), "PlayPlayerRandomVoice", [R.static_value("RDPlayer", "Speaker_Center"), (c).fields.get("m_AmmoVoices"), 1, R.static_value("RDPlayer", "VoicePriority_Extra")])
			R.call_member((c).fields.get("m_AmmoSound"), "Play", [])
			R.call_member((c.fields.get("m_Player")).fields.get("m_Weapon"), "ReplenishAmmo", [true, 1])
	if R.truth((c).fields.get("m_bFirstUpdate")):
		pass
		R.call_member(c, "OnLevelTagEvents", [])
		(c).fields["m_bFirstUpdate"] = false
	return null

static func f_OnStoryDialogFinished(c: Variant, a: Array) -> Variant:
	var v_iJet: Variant = 0
	var v_storyJet: Variant = null
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_iJet = R.coerce(0, "int")
	v_storyJet = R.coerce(null, "RDJet")
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_RadioRepair")), 0)):
		pass
		if R.truth(R.unary("!", (c).fields.get("m_bRadioRepaired"))):
			pass
			(c).fields["m_bRadioRepair"] = true
			(c).fields["m_fRadioRepairTime"] = float(1)
			(c).fields["m_iRadioRepairAttempt"] = R.coerce(0, "int")
	else:
		pass
		if R.truth(R.binary("==", (c.fields.get("m_Player")).fields.get("m_Dialog"), (c).fields.get("m_HelicopterVoice"))):
			pass
			(c.fields.get("m_HelicopterAlly")).fields["m_bShootingMode"] = true
		else:
			pass
			if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Jets")), 0)):
				pass
				v_iJet = R.coerce(0, "int")
				while R.truth(R.binary("<", v_iJet, R.get_value((c).fields.get("m_StoryJets"), "length"))):
					pass
					v_storyJet = R.coerce(R.get_value((c).fields.get("m_StoryJets"), v_iJet), "RDJet")
					R.call_member(v_storyJet, "StartStoryComeBack", [])
					v_iJet = R.signed32(v_iJet + 1)
				(c).fields["m_bPlayJetsComingBackDialog"] = true
	R.call_member(c.fields.get("m_Player"), "removeEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished")])
	(c).fields["m_StoryDialog"] = R.coerce(null, "Array")
	return null

static func f_CompleteStoryMode(c: Variant, a: Array) -> Variant:
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_bStoryModeFinished"] = true
	if R.truth(R.unary("!", R.get_value(((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_completedAchievements"), R.static_value("RDAchievement", "IntoTheWild")))):
		pass
		R.call_member(c.fields.get("m_Game"), "CompleteAchievement", [R.static_value("RDAchievement", "IntoTheWild")])
		R.call_member(c.fields.get("m_Game"), "SavePlayerInfo", [])
	return null

static func f_OnHelicopterAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member(c.fields.get("m_HelicopterAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnHelicopterAllyDestroyed")])
	c.fields["m_HelicopterAlly"] = R.coerce(null, "RDHelicopterAlly")
	return null

static func f_OnJetAllyDestroyed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.call_member((c).fields.get("m_JetAlly"), "removeEventListener", [R.static_value("RDEntity", "Event_Destroyed"), R.get_value(c, "OnJetAllyDestroyed")])
	(c).fields["m_JetAlly"] = R.coerce(null, "RDJetAlly")
	return null

static func f_OnPlayerFailed(c: Variant, a: Array) -> Variant:
	var v_evt: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "OnPlayerFailed"), [v_evt])
	c.fields["m_bShowStats"] = true
	R.call_member((c.fields.get("m_Game")).fields.get("m_Hud"), "HideTime", [])
	if R.truth((R.truth(c.fields.get("m_HelicopterAlly")) and R.unary("!", R.call_member(c.fields.get("m_HelicopterAlly"), "IsRetreating", [])))):
		pass
		R.call_member(c.fields.get("m_HelicopterAlly"), "StartRetreat", [])
	return null

static func f_HasActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return R.logical_or((c).fields.get("m_bPlayStoryDialog"), func(): return R.logical_and(R.truth((c).fields.get("m_StoryDialog")), func(): return R.call_member((c.fields.get("m_Player")).fields.get("m_DialogLine"), "IsPlaying", [])))
	return null

static func f_HasAnyActiveStoryDialog(c: Variant, a: Array) -> Variant:
	return R.logical_and(R.truth((c).fields.get("m_StoryDialog")), func(): return R.call_member((c.fields.get("m_Player")).fields.get("m_DialogLine"), "IsPlaying", []))
	return null

static func f_GetSavedLevel(c: Variant, a: Array) -> Variant:
	return ((c).fields.get("m_iDebugLevel") if R.truth(R.binary("!=", (c).fields.get("m_iDebugLevel"), R.unary("-", 1))) else ((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields.get("m_iStoryLevel"))
	return null

static func f_SetSavedLevel(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_iStoryLevel"] = R.coerce(v_iLevel, "int")
	((c.fields.get("m_Game")).fields.get("m_PlayerInfo")).fields["m_fStoryProgress"] = float(c.fields.get("m_fLevelDifficulty"))
	return null

static func f_OnRadioRepaired(c: Variant, a: Array) -> Variant:
	(c).fields["m_RadioRepairedVoice"] = R.coerce((R.get_value((c).fields.get("m_FemaleRadioRepairVoices"), 3) if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.get_value((c).fields.get("m_MaleRadioRepairVoices"), 3)), "DTSpacialSound")
	R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [(R.static_value("RDPlayer", "Speaker_Diane") if R.truth((c.fields.get("m_Game")).fields.get("m_bIsFemale")) else R.static_value("RDPlayer", "Speaker_Cocheta")), (c).fields.get("m_RadioRepairedVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	(c.fields.get("m_Player")).fields["m_bForceBrake"] = false
	(c).fields["m_bRadioRepaired"] = true
	return null

static func f_OnHelicopterArrived(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_HelicopterVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	R.call_member(c.fields.get("m_Game"), "UnlockSurvivalItem", [R.static_value("RDUnlockData", "Survival_SupportChoppers")])
	return null

static func f_OnSeeRamp(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("!=", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_EnterHighway")), 0)):
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_RampVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	else:
		pass
		R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Diane"), (c).fields.get("m_ExitRampVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	return null

static func f_OnRampReached(c: Variant, a: Array) -> Variant:
	var v_bOnHighway: Variant = false
	v_bOnHighway = ((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iHighwayLevelStart"))) and (float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iHighwayLevelEnd"))))
	R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
	R.call_member(c, "UpdateSpawnableZombies", [])
	R.call_member(c, "SetSavedLevel", [c.fields.get("m_iLevel")])
	(c).fields["m_iLevelTag"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(5))), "int")
	(c).fields["m_iLevelTag2"] = R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iLevel")) * float(7))) + float(6))), "int")
	c.fields["m_bIsHighwayLevel"] = ((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iHighwayLevelStart"))) and (float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iHighwayLevelEnd"))))
	c.fields["m_bStartAtHighSpeed"] = true
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(c.fields.get("m_Game"), "StartCinematic", [("ExitHighway" if R.truth(v_bOnHighway) else "EnterHighway"), false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [((c.fields.get("m_Game")).fields.get("m_HighwayMusic") if R.truth(c.fields.get("m_bIsHighwayLevel")) else (c.fields.get("m_Game")).fields.get("m_GameMusic")), 0])
	return null

static func f_OnSeeEndChopper(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_EndChopperVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	return null

static func f_OnJetsComing(c: Variant, a: Array) -> Variant:
	R.call_member(c.fields.get("m_Player"), "PlayPlayerVoiceSound", [R.static_value("RDPlayer", "Speaker_Cocheta"), (c).fields.get("m_JetsComingVoice"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	return null

static func f_OnEndChopperReached(c: Variant, a: Array) -> Variant:
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponCocheta")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponCocheta"] = R.coerce(0, "int")
	if R.truth((float((c.fields.get("m_Player")).fields.get("m_iWeaponDiane")) == float(4))):
		pass
		(c.fields.get("m_Player")).fields["m_iWeaponDiane"] = R.coerce(0, "int")
	R.assign(c, "m_iLevel", "RDGameModeStory", 1, "+=")
	R.call_member(c, "UpdateSpawnableZombies", [])
	R.call_member(c, "SetSavedLevel", [c.fields.get("m_iLevel")])
	(c.fields.get("m_Game")).fields["m_CinematicTransitionGameMode"] = R.coerce(c, "RDGameMode")
	R.call_member(R.static_value("RDGame", "Instance"), "StartCinematic", ["ChopperTransition", false])
	R.call_member(c.fields.get("m_Game"), "PlayCustomMusic", [(c.fields.get("m_Game")).fields.get("m_TenseMusic"), 0])
	return null

static func f_OnJohnCalled(c: Variant, a: Array) -> Variant:
	(c).fields["m_StoryDialog"] = R.coerce((c).fields.get("m_SeeJohnVoice"), "Array")
	R.call_member(c.fields.get("m_Player"), "PlayDialog", [(c).fields.get("m_StoryDialog"), R.static_value("RDPlayer", "VoicePriority_Crucial")])
	R.call_member(c.fields.get("m_Player"), "addEventListener", [R.static_value("RDPlayer", "Event_DialogFinished"), R.get_value(c, "OnStoryDialogFinished"), false, 0, true])
	return null

static func f_HasNextLevel(c: Variant, a: Array) -> Variant:
	return (float((c).fields.get("m_iNextLevel")) < float((float((c).fields.get("m_iNbLevels")) - float(1))))
	return null

static func f_GetNextLevelName(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_szNextLevelName")
	return null

static func f_GetNextLevelDistance(c: Variant, a: Array) -> Variant:
	return R.invoke(R.get_value(R.klass("Math"), "round"), [(float((c).fields.get("m_fNextLevelPosition")) - float(((c.fields.get("m_Camera")).fields.get("m_vLocation")).fields.get("Z")))])
	return null

static func f_GetNextLevelSuffix(c: Variant, a: Array) -> Variant:
	return "m"
	return null

static func f_GetUnlimitedSpawning(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_bIsChopperShootingLevel")
	return null

static func f_IsChopperMode(c: Variant, a: Array) -> Variant:
	var v_iLevel: Variant = 0
	var v_iLevelTag: Variant = 0
	var v_bSavedChopperShootingLevel: Variant = false
	v_iLevel = R.coerce(R.call_member(c, "GetSavedLevel", []), "int")
	v_iLevelTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(v_iLevel) * float(7))) + float(5))), "int"), "int")
	v_bSavedChopperShootingLevel = R.binary("!=", R.binary("&", v_iLevelTag, R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)
	return ((c).fields.get("m_bIsChopperShootingLevel") or v_bSavedChopperShootingLevel)
	return null

static func f_GetMutantDelay(c: Variant, a: Array) -> Variant:
	var v_fMinDelay: Variant = NAN
	var v_fMaxDelay: Variant = NAN
	var v_fDelay: Variant = null
	v_fMinDelay = float((float(R.static_value("RDGameModeStory", "MutantDelayMinMin")) + float((float(c.fields.get("m_fLevelDifficulty")) * float((float(R.static_value("RDGameModeStory", "MutantDelayMaxMin")) - float(R.static_value("RDGameModeStory", "MutantDelayMinMin"))))))))
	v_fMaxDelay = float((float(R.static_value("RDGameModeStory", "MutantDelayMinMax")) + float((float(c.fields.get("m_fLevelDifficulty")) * float((float(R.static_value("RDGameModeStory", "MutantDelayMaxMax")) - float(R.static_value("RDGameModeStory", "MutantDelayMinMax"))))))))
	v_fDelay = R.coerce((float(v_fMinDelay) + float((float(randf()) * float((float(v_fMaxDelay) - float(v_fMinDelay)))))), "*")
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		v_fDelay = R.coerce(R.binary("*", v_fDelay, 0.4), "*")
	return v_fDelay
	return null

static func f_GetMutantCount(c: Variant, a: Array) -> Variant:
	if R.truth(R.call_member(c, "IsChopperMode", [])):
		pass
		return 1
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount4Level")))):
		pass
		return 4
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount3Level")))):
		pass
		return 3
	if R.truth((float(c.fields.get("m_iLevel")) >= float((c).fields.get("m_iMutantCount2Level")))):
		pass
		return 2
	return 1
	return null

static func f_CanSpawnMutants(c: Variant, a: Array) -> Variant:
	return ((R.binary("==", R.get_value(c.fields.get("m_Mutants"), "length"), 0) and ((float(c.fields.get("m_iLevel")) > float(c.fields.get("m_iVeryHardZombieLevel"))) or ((float(c.fields.get("m_iLevel")) == float(c.fields.get("m_iVeryHardZombieLevel"))) and R.unary("!", R.call_member(c, "HasActiveStoryDialog", []))))) and R.unary("!", (c).fields.get("m_bEndChopperInSight")))
	return null

static func f_CanSpawnCivilian(c: Variant, a: Array) -> Variant:
	return (float(c.fields.get("m_iLevel")) > float(0))
	return null

static func f_GetJetDelay(c: Variant, a: Array) -> Variant:
	var v_fMinDelay: Variant = NAN
	var v_fMaxDelay: Variant = NAN
	v_fMinDelay = float(NAN)
	v_fMaxDelay = float(NAN)
	if R.truth((float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iLessJetsLevel")))):
		pass
		v_fMinDelay = float((float(R.static_value("RDGameModeStory", "JetDelayStartMin")) + float((float(R.binary("/", c.fields.get("m_iLevel"), (c).fields.get("m_iLessJetsLevel"))) * float((float(R.static_value("RDGameModeStory", "JetDelayMaxMin")) - float(R.static_value("RDGameModeStory", "JetDelayStartMin"))))))))
		v_fMaxDelay = float((float(R.static_value("RDGameModeStory", "JetDelayStartMax")) + float((float(R.binary("/", c.fields.get("m_iLevel"), (c).fields.get("m_iLessJetsLevel"))) * float((float(R.static_value("RDGameModeStory", "JetDelayMaxMax")) - float(R.static_value("RDGameModeStory", "JetDelayStartMax"))))))))
	else:
		pass
		v_fMinDelay = float((float(R.static_value("RDGameModeStory", "JetDelayMaxMin")) + float((float(R.binary("/", (float(c.fields.get("m_iLevel")) - float((c).fields.get("m_iLessJetsLevel"))), (float((c).fields.get("m_iNbLevels")) - float((c).fields.get("m_iLessJetsLevel"))))) * float((float(R.static_value("RDGameModeStory", "JetDelayEndMin")) - float(R.static_value("RDGameModeStory", "JetDelayMaxMin"))))))))
		v_fMaxDelay = float((float(R.static_value("RDGameModeStory", "JetDelayMaxMax")) + float((float(R.binary("/", (float(c.fields.get("m_iLevel")) - float((c).fields.get("m_iLessJetsLevel"))), (float((c).fields.get("m_iNbLevels")) - float((c).fields.get("m_iLessJetsLevel"))))) * float((float(R.static_value("RDGameModeStory", "JetDelayEndMax")) - float(R.static_value("RDGameModeStory", "JetDelayMaxMax"))))))))
	return (float(v_fMinDelay) + float((float(randf()) * float((float(v_fMaxDelay) - float(v_fMinDelay))))))
	return null

static func f_GetJetDrops(c: Variant, a: Array) -> Variant:
	var v_iDrops: Variant = 0
	v_iDrops = R.coerce(0, "int")
	if R.truth((float(c.fields.get("m_iLevel")) <= float((c).fields.get("m_iLessJetsLevel")))):
		pass
		v_iDrops = R.coerce(R.call_static("Maths", "Clamp", [floorf(float((float((float(c.fields.get("m_iLevel")) - float(c.fields.get("m_iJetLevel")))) * float(0.5)))), 1, 3]), "int")
	else:
		pass
		v_iDrops = R.coerce(maxf(float((float(3) - float(floorf(float((float((float(c.fields.get("m_iLevel")) - float((c).fields.get("m_iLessJetsLevel")))) * float(0.5))))))), float(1)), "int")
	return v_iDrops
	return null

static func f_CanSpawnJet(c: Variant, a: Array) -> Variant:
	return (((((R.binary("==", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Jets")), 0) and R.binary("==", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_Helicopter")), 0)) and R.binary("==", R.binary("&", (c).fields.get("m_iLevelTag"), R.static_value("RDGameModeStory", "LevelTag_ChopperShooting")), 0)) and R.unary("!", c.fields.get("m_HelicopterAlly"))) and (float(c.fields.get("m_iSpawnLevelArea")) != float(R.static_value("RDGameModeGameplay", "Area_Parking")))) and R.truth(R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "CanSpawnJet"), [])))
	return null

static func f_CanPlayNotMovingDialog(c: Variant, a: Array) -> Variant:
	return ((float(c.fields.get("m_iLevel")) > float(0)) or R.unary("!", (c).fields.get("m_bPlayStoryDialog")))
	return null

static func f_HasStoryProgress(c: Variant, a: Array) -> Variant:
	return true
	return null

static func f_OnNewSpawnLevelArea(c: Variant, a: Array) -> Variant:
	var v_iTag: Variant = 0
	var v_iArea: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	v_iTag = R.coerce(0, "int")
	if R.truth((float(v_iArea) == float(R.static_value("RDGameModeGameplay", "Area_JohnHighway")))):
		pass
		(c).fields["m_iJohnPatterns"] = R.coerce(2, "int")
	else:
		pass
		if R.truth((float(v_iArea) == float(R.static_value("RDGameModeGameplay", "Area_Parking")))):
			pass
			v_iTag = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(5))), "int"), "int")
			if R.truth(R.binary("!=", R.binary("&", v_iTag, R.static_value("RDGameModeStory", "LevelTag_EndChopper")), 0)):
				pass
				(c.fields.get("m_SpawnManager")).fields["m_bEnabled"] = false
				(c).fields["m_bEndChopperInSight"] = true
	return null

static func f_GetSpawnMax(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (20 if R.truth((c).fields.get("m_bIsHardcore")) else 10)
	if R.truth(((R.truth(((float(c.fields.get("m_iSpawnLevel")) >= float((c).fields.get("m_iChopperSupportStartLevel"))) and (float(c.fields.get("m_iSpawnLevel")) <= float((c).fields.get("m_iChopperSupportEndLevel"))))) and R.truth(c.fields.get("m_HelicopterAlly"))) and (c.fields.get("m_HelicopterAlly")).fields.get("m_bShootingMode"))):
		pass
		return 20
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetSpawnMax"), [])
	return null

static func f_GetSpawnRate(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return (1 if R.truth((c).fields.get("m_bIsHardcore")) else 0.75)
	if R.truth(((R.truth(((float(c.fields.get("m_iSpawnLevel")) >= float((c).fields.get("m_iChopperSupportStartLevel"))) and (float(c.fields.get("m_iSpawnLevel")) <= float((c).fields.get("m_iChopperSupportEndLevel"))))) and R.truth(c.fields.get("m_HelicopterAlly"))) and (c.fields.get("m_HelicopterAlly")).fields.get("m_bShootingMode"))):
		pass
		return 1.25
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "GetSpawnRate"), [])
	return null

static func f_DoEmptyLevelEntrance(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("m_bIsChopperShootingLevel")):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "DoEmptyLevelEntrance"), [])
	return null

static func f_CanSpawnGrub(c: Variant, a: Array) -> Variant:
	if R.truth((float(c.fields.get("m_iSpawnLevelArea")) == float(R.static_value("RDGameModeGameplay", "Area_Parking")))):
		pass
		return false
	return R.invoke(R.get_value(R.super_ref(c, "RDGameModeStory"), "CanSpawnGrub"), [])
	return null

static func f_TrySpawnWeaponCrate(c: Variant, a: Array) -> Variant:
	var v_iTag2: Variant = 0
	var v_weapons: Variant = null
	v_iTag2 = R.coerce(0, "int")
	v_weapons = R.coerce(null, "RDObstacleWeaponCrate")
	if R.truth(((c).fields.get("m_bSpawnWeaponCrate") and (float(c.fields.get("m_fNextPatternSpawnPosition")) >= float((float(c.fields.get("m_fSpawnLevelStartPosition")) + float((float(10) * float(R.static_value("RDRoad", "RenderStepSize"))))))))):
		pass
		v_iTag2 = R.coerce(R.coerce(R.get_value((c).fields.get("LevelInfos"), (float((float(c.fields.get("m_iSpawnLevel")) * float(7))) + float(6))), "int"), "int")
		if R.truth(R.binary("!=", R.binary("&", v_iTag2, R.static_value("RDGameModeStory", "LevelTag2_SpawnWeaponCrate")), 0)):
			pass
			v_weapons = R.coerce(R.binary("as", R.call_static("RDGame", "GetEntity", [R.klass("RDObstacleWeaponCrate")]), R.klass("RDObstacleWeaponCrate")), "RDObstacleWeaponCrate")
			((v_weapons).fields.get("m_vLocation")).fields["Z"] = float(c.fields.get("m_fNextPatternSpawnPosition"))
			((v_weapons).fields.get("m_vLocation")).fields["X"] = R.coerce(R.binary("+", R.call_static("RDWorld", "GetPerlinX", [((v_weapons).fields.get("m_vLocation")).fields.get("Z")]), (R.unary("-", 3) if R.truth((float(randf()) < float(0.5))) else 3)), "Number")
			((v_weapons).fields.get("m_vLocation")).fields["Y"] = R.coerce(R.call_static("RDWorld", "GetPerlinY", [((v_weapons).fields.get("m_vLocation")).fields.get("Z")]), "Number")
			R.call_member(c.fields.get("m_Game"), "AddEntity", [v_weapons, ((v_weapons).fields.get("m_vLocation")).fields.get("X"), ((v_weapons).fields.get("m_vLocation")).fields.get("Y"), ((v_weapons).fields.get("m_vLocation")).fields.get("Z")])
			R.call_member(v_weapons, "UpdateDepthPosition", [])
			if R.truth((float(c.fields.get("m_iSpecialLocation")) == float(2))):
				pass
				c.fields["m_iSpecialLocation"] = R.coerce(R.binary("%", (float(c.fields.get("m_iSpecialLocation")) + float(1)), 4), "int")
		(c).fields["m_bSpawnWeaponCrate"] = false
	return null

static func f_SkipZombiesForTutorial(c: Variant, a: Array) -> Variant:
	return R.unary("!", (R.static_value("RDPlayerInfo", "Instance")).fields.get("m_bPressedHorn"))
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "LevelTag_None", R.binary("<<", 1, 0), "=")
	R.set_value(c, "LevelTag_RadioRepair", R.binary("<<", 1, 1), "=")
	R.set_value(c, "LevelTag_Helicopter", R.binary("<<", 1, 2), "=")
	R.set_value(c, "LevelTag_EnterHighway", R.binary("<<", 1, 3), "=")
	R.set_value(c, "LevelTag_JohnCameo", R.binary("<<", 1, 4), "=")
	R.set_value(c, "LevelTag_JetAfterJohn", R.binary("<<", 1, 5), "=")
	R.set_value(c, "LevelTag_ExitHighway", R.binary("<<", 1, 6), "=")
	R.set_value(c, "LevelTag_EndChopper", R.binary("<<", 1, 7), "=")
	R.set_value(c, "LevelTag_ChopperShooting", R.binary("<<", 1, 8), "=")
	R.set_value(c, "LevelTag_Jets", R.binary("<<", 1, 9), "=")
	R.set_value(c, "LevelTag_Mutants1", R.binary("<<", 1, 10), "=")
	R.set_value(c, "LevelTag_Mutants2", R.binary("<<", 1, 11), "=")
	R.set_value(c, "LevelTag_Mutants3", R.binary("<<", 1, 12), "=")
	R.set_value(c, "LevelTag_Mutants4", R.binary("<<", 1, 13), "=")
	R.set_value(c, "LevelTag_ChopperLeave", R.binary("<<", 1, 14), "=")
	R.set_value(c, "LevelTag_LessJets", R.binary("<<", 1, 15), "=")
	R.set_value(c, "LevelTag2_None", R.binary("<<", 1, 0), "=")
	R.set_value(c, "LevelTag2_HardZombieLevel", R.binary("<<", 1, 1), "=")
	R.set_value(c, "LevelTag2_FeedersLevel", R.binary("<<", 1, 2), "=")
	R.set_value(c, "LevelTag2_SpikesLevel", R.binary("<<", 1, 3), "=")
	R.set_value(c, "LevelTag2_NewMaleZombieLevel", R.binary("<<", 1, 4), "=")
	R.set_value(c, "LevelTag2_NewFemaleZombieLevel", R.binary("<<", 1, 5), "=")
	R.set_value(c, "LevelTag2_SoldierZombieLevel", R.binary("<<", 1, 6), "=")
	R.set_value(c, "LevelTag2_ExplodingCarLevel", R.binary("<<", 1, 7), "=")
	R.set_value(c, "LevelTag2_MineLevel", R.binary("<<", 1, 8), "=")
	R.set_value(c, "LevelTag2_MotionMineLevel", R.binary("<<", 1, 9), "=")
	R.set_value(c, "LevelTag2_GrubLevel", R.binary("<<", 1, 10), "=")
	R.set_value(c, "LevelTag2_StartFog", R.binary("<<", 1, 11), "=")
	R.set_value(c, "LevelTag2_EndFog", R.binary("<<", 1, 12), "=")
	R.set_value(c, "LevelTag2_FullFog", R.binary("<<", 1, 13), "=")
	R.set_value(c, "LevelTag2_DebugLevel", R.binary("<<", 1, 14), "=")
	R.set_value(c, "LevelTag2_SpawnWeaponCrate", R.binary("<<", 1, 15), "=")
	R.set_value(c, "ChopperShootingTime", 120, "=")
	R.set_value(c, "ChopperShootingVoice1Time", 2, "=")
	R.set_value(c, "ChopperShootingVoice2Time", 30, "=")
	R.set_value(c, "ChopperShootingVoice2BTime", 55, "=")
	R.set_value(c, "ChopperShootingVoice3Time", 75, "=")
	R.set_value(c, "ChopperShootingVoice3BTime", 100, "=")
	R.set_value(c, "ChopperShootingVoice4Time", 117, "=")
	R.set_value(c, "JetDelayStartMin", 60, "=")
	R.set_value(c, "JetDelayStartMax", 90, "=")
	R.set_value(c, "JetDelayMaxMin", 40, "=")
	R.set_value(c, "JetDelayMaxMax", 60, "=")
	R.set_value(c, "JetDelayEndMin", 100, "=")
	R.set_value(c, "JetDelayEndMax", 180, "=")
	R.set_value(c, "MutantDelayMinMin", 50, "=")
	R.set_value(c, "MutantDelayMinMax", 80, "=")
	R.set_value(c, "MutantDelayMaxMin", 15, "=")
	R.set_value(c, "MutantDelayMaxMax", 50, "=")
	R.set_value(c, "StoryFogDistance", 40, "=")
	R.set_value(c, "StoryFogRange", 20, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["LevelInfos"] = R.coerce(null, "Array")
	(c).fields["m_iLevelTag"] = R.coerce(0, "int")
	(c).fields["m_iLevelTag2"] = R.coerce(0, "int")
	(c).fields["m_iNextLevel"] = R.coerce(0, "int")
	(c).fields["m_bPlayStoryDialog"] = false
	(c).fields["m_StoryDialog"] = R.coerce(null, "Array")
	(c).fields["m_bRadioRepair"] = false
	(c).fields["m_bRadioRepaired"] = false
	(c).fields["m_fRadioRepairTime"] = float(NAN)
	(c).fields["m_iRadioRepairAttempt"] = R.coerce(0, "int")
	(c).fields["m_MaleRadioRepairVoices"] = R.coerce(null, "Array")
	(c).fields["m_FemaleRadioRepairVoices"] = R.coerce(null, "Array")
	(c).fields["m_RadioRepairVoice"] = R.coerce(null, "Array")
	(c).fields["m_RadioRepairedVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_HelicopterVoice"] = R.coerce(null, "Array")
	(c).fields["m_RampVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_SeeJohnVoice"] = R.coerce(null, "Array")
	(c).fields["m_ExitRampVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_EndChopperVoice"] = R.coerce(null, "Array")
	(c).fields["m_ChopperShooting1Voice"] = R.coerce(null, "Array")
	(c).fields["m_ChopperShooting2Voice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ChopperShooting2BVoice"] = R.coerce(null, "Array")
	(c).fields["m_ChopperShooting3Voice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_ChopperShooting3BVoice"] = R.coerce(null, "Array")
	(c).fields["m_ChopperShooting4Voice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_JetsComingVoice"] = R.coerce(null, "DTSpacialSound")
	(c).fields["m_iHighwayLevelStart"] = R.coerce(0, "int")
	(c).fields["m_iHighwayLevelEnd"] = R.coerce(0, "int")
	(c).fields["m_iLessJetsLevel"] = R.coerce(0, "int")
	(c).fields["m_iChopperSupportStartLevel"] = R.coerce(0, "int")
	(c).fields["m_iChopperSupportEndLevel"] = R.coerce(0, "int")
	(c).fields["m_bIsChopperShootingLevel"] = false
	(c).fields["m_fChopperShootingTimer"] = float(NAN)
	(c).fields["m_bPlayChopperShootingVoice1"] = false
	(c).fields["m_bPlayChopperShootingVoice2"] = false
	(c).fields["m_bPlayChopperShootingVoice2B"] = false
	(c).fields["m_bPlayChopperShootingVoice3"] = false
	(c).fields["m_bPlayChopperShootingVoice3B"] = false
	(c).fields["m_bPlayChopperShootingVoice4"] = false
	(c).fields["m_iNbLevels"] = R.coerce(0, "int")
	(c).fields["m_szNextLevelName"] = R.coerce(null, "String")
	(c).fields["m_fNextLevelPosition"] = float(NAN)
	(c).fields["m_iMutantCount2Level"] = R.coerce(0, "int")
	(c).fields["m_iMutantCount3Level"] = R.coerce(0, "int")
	(c).fields["m_iMutantCount4Level"] = R.coerce(0, "int")
	(c).fields["m_JetAlly"] = R.coerce(null, "RDJetAlly")
	(c).fields["m_iRadioRepairLevel"] = R.coerce(0, "int")
	(c).fields["m_John"] = R.coerce(null, "RDJohnCar")
	(c).fields["m_StoryJets"] = R.coerce(null, "Array")
	(c).fields["m_AmmoVoices"] = R.coerce(null, "RandomHat")
	(c).fields["m_AmmoSound"] = R.coerce(null, "DTSound")
	(c).fields["m_bPlayJetsComingBackDialog"] = false
	(c).fields["m_iDebugLevel"] = R.coerce(R.unary("-", 1), "int")
	(c).fields["m_bFirstUpdate"] = false
	(c).fields["m_iJohnPatterns"] = R.coerce(0, "int")
	(c).fields["m_bEndChopperInSight"] = false
	(c).fields["m_bIsHardcore"] = false
	(c).fields["m_bSpawnWeaponCrate"] = false
	(c).fields["m_bHadDoUpgradeScreen"] = false
	return null
