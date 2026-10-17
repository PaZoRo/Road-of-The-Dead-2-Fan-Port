extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Medal(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIConnection")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else 0), "uint")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	var v_param4: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	var v_param5: Variant = R.coerce((a[4] if a.size() > 4 else false), "Boolean")
	var v_param6: Variant = R.coerce((a[5] if a.size() > 5 else false), "Boolean")
	var v_param7: Variant = R.coerce((a[6] if a.size() > 6 else 0), "uint")
	var v_param8: Variant = R.coerce((a[7] if a.size() > 7 else 0), "uint")
	var v_param9: Variant = R.coerce((a[8] if a.size() > 8 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.Medal"), [])
	(c).fields["_connection"] = R.coerce(v_param1, "APIConnection")
	(c).fields["_id"] = R.coerce(v_param2, "uint")
	(c).fields["_name"] = R.coerce(v_param3, "String")
	(c).fields["_description"] = R.coerce(v_param4, "String")
	(c).fields["_secret"] = v_param5
	(c).fields["_unlocked"] = v_param6
	(c).fields["_value"] = R.coerce(v_param7, "uint")
	(c).fields["_difficulty"] = R.coerce(R.get_value(R.static_value("com.newgrounds.Medal", "DIFFICULTIES"), v_param8), "String")
	(c).fields["_iconLoader"] = R.coerce(R.construct(R.klass("com.newgrounds.BitmapLoader"), [R.static_value("com.newgrounds.Medal", "DEFAULT_ICON"), v_param9]), "BitmapLoader")
	R.call_member((c).fields.get("_iconLoader"), "load", [])
	return null

static func f_get_difficulty(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_difficulty")
	return null

static func f_get_icon(c: Variant, a: Array) -> Variant:
	return R.get_value((c).fields.get("_iconLoader"), "bitmapData")
	return null

static func f_get_id(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_id")
	return null

static func f_get_name(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_name")
	return null

static func f_get_description(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_description")
	return null

static func f_get_secret(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_secret")
	return null

static func f_get_unlocked(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_unlocked")
	return null

static func f_get_value(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_value")
	return null

static func f_toString(c: Variant, a: Array) -> Variant:
	return R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", R.binary("+", "Medal: ", (c).fields.get("_name")), "\t\t("), ("unlocked, " if R.truth((c).fields.get("_unlocked")) else "locked, ")), (c).fields.get("_value")), "pts, "), (c).fields.get("_difficulty")), ")")
	return null

static func f_attachIcon(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	return R.call_member((c).fields.get("_iconLoader"), "attachBitmap", [v_param1])
	return null

static func f_unlock(c: Variant, a: Array) -> Variant:
	if R.truth((c).fields.get("_unlocked")):
		pass
		R.call_static("com.newgrounds.Logger", "logWarning", [R.binary("+", R.binary("+", "Medal \"", (c).fields.get("_name")), "\" is already unlocked.")])
		return null
	R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "Unlocking medal \"", R.get_value(c, "name")), "\"...")])
	(c).fields["_unlocked"] = true
	if R.truth(R.get_value((c).fields.get("_connection"), "hasUserSession")):
		pass
		R.call_member((c).fields.get("_connection"), "sendSimpleCommand", ["unlockMedal", R.get_value(c, "onUnlockConfirmed"), null, {"medal_id": R.get_value(c, "id")}])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCKED"), c])])
	return null

static func f_setUnlocked(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_unlocked"] = v_param1
	return null

static func f_onUnlockConfirmed(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "APIEvent")
	if R.truth(R.get_value(v_param1, "success")):
		pass
		R.call_static("com.newgrounds.Logger", "logMessage", [R.binary("+", R.binary("+", "Medal \"", R.get_value(c, "name")), "\" unlocked.")])
	else:
		pass
		R.call_static("com.newgrounds.Logger", "logError", [R.binary("+", R.binary("+", "Failed to unlock \"", R.get_value(c, "name")), "\"!")])
	R.call_member(c, "dispatchEvent", [R.construct(R.klass("com.newgrounds.APIEvent"), [R.static_value("com.newgrounds.APIEvent", "MEDAL_UNLOCK_CONFIRMED"), c, R.get_value(v_param1, "error")])])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "ICON_WIDTH", 50, "=")
	R.set_value(c, "ICON_HEIGHT", 50, "=")
	R.set_value(c, "DIFFICULTY_EASY", "Easy", "=")
	R.set_value(c, "DIFFICULTY_MODERATE", "Moderate", "=")
	R.set_value(c, "DIFFICULTY_CHALLENGING", "Challenging", "=")
	R.set_value(c, "DIFFICULTY_DIFFICULT", "Difficult", "=")
	R.set_value(c, "DIFFICULTY_BRUTAL", "Brutal", "=")
	R.set_value(c, "DIFFICULTIES", ["Unknown", R.static_value("com.newgrounds.Medal", "DIFFICULTY_EASY"), R.static_value("com.newgrounds.Medal", "DIFFICULTY_MODERATE"), R.static_value("com.newgrounds.Medal", "DIFFICULTY_CHALLENGING"), R.static_value("com.newgrounds.Medal", "DIFFICULTY_DIFFICULT"), R.static_value("com.newgrounds.Medal", "DIFFICULTY_BRUTAL")], "=")
	R.set_value(c, "DEFAULT_ICON", R.construct(R.klass("com.newgrounds.assets.DefaultMedalIcon"), [R.static_value("com.newgrounds.Medal", "ICON_WIDTH"), R.static_value("com.newgrounds.Medal", "ICON_HEIGHT")]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_connection"] = R.coerce(null, "APIConnection")
	(c).fields["_name"] = R.coerce(null, "String")
	(c).fields["_id"] = R.coerce(0, "uint")
	(c).fields["_description"] = R.coerce(null, "String")
	(c).fields["_secret"] = false
	(c).fields["_value"] = R.coerce(0, "uint")
	(c).fields["_unlocked"] = false
	(c).fields["_difficulty"] = R.coerce(null, "String")
	(c).fields["_iconLoader"] = R.coerce(null, "BitmapLoader")
	return null
