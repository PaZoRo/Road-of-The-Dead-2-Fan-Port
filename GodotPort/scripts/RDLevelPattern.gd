extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_RDLevelPattern(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RDLevelPattern"), [])
	return null

static func f_InitSuperZombieDelay(c: Variant, a: Array) -> Variant:
	R.assign(c, "m_fSuperZombieSpawnTime", "RDLevelPattern", R.unary("-", 99999), "=")
	return null

static func f_Load(c: Variant, a: Array) -> Variant:
	var v_gameMode: Variant = R.coerce((a[0] if a.size() > 0 else null), "RDGameMode")
	var v_iLevel: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_fDifficulty: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v_fStartPosition: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	var v_fSpawnRatio: Variant = R.coerce((a[4] if a.size() > 4 else NAN), "Number")
	var v_fStretch: Variant = R.coerce((a[5] if a.size() > 5 else NAN), "Number")
	return 0
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "m_fSuperZombieSpawnTime", NAN, "=")
	R.set_value(c, "SuperZombieSpawnDelay", 5, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
