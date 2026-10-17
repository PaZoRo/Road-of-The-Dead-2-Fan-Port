extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APIEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_param2: Variant = R.coerce((a[1] if a.size() > 1 else null), "*")
	var v_param3: Variant = R.coerce((a[2] if a.size() > 2 else null), "String")
	R.invoke(R.super_ref(c, "com.newgrounds.APIEvent"), [v_param1])
	if R.truth(((R.unary("!", v_param3) or R.binary("==", v_param3, "")) or R.binary("==", v_param3, R.static_value("com.newgrounds.APIEvent", "ERROR_NONE")))):
		pass
		(c).fields["_error"] = R.coerce(R.static_value("com.newgrounds.APIEvent", "ERROR_NONE"), "String")
		(c).fields["_success"] = true
	else:
		pass
		(c).fields["_error"] = R.coerce(v_param3, "String")
		(c).fields["_success"] = false
	if R.truth(v_param2):
		pass
		(c).fields["_data"] = R.coerce(v_param2, "*")
	else:
		pass
		(c).fields["_data"] = R.coerce({}, "*")
	return null

static func f_clone(c: Variant, a: Array) -> Variant:
	return R.construct(R.klass("com.newgrounds.APIEvent"), [R.resolve(c, "type", "com.newgrounds.APIEvent"), (c).fields.get("_data"), (c).fields.get("_error")])
	return null

static func f_get_success(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_success")
	return null

static func f_get_data(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_data")
	return null

static func f_get_error(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_error")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "COMMAND_COMPLETE", "commandComplete", "=")
	R.set_value(c, "MEDAL_UNLOCK_CONFIRMED", "medalUnlockConfirmed", "=")
	R.set_value(c, "ICON_LOADED", "iconLoaded", "=")
	R.set_value(c, "BRIDGE_EVENT_RECEIVED", "brdigeEventReceived", "=")
	R.set_value(c, "API_CONNECTED", "movieConnected", "=")
	R.set_value(c, "LOG", "log", "=")
	R.set_value(c, "MEDAL_UNLOCKED", "medalUnlocked", "=")
	R.set_value(c, "SCORES_LOADED", "scoresLoaded", "=")
	R.set_value(c, "SCORE_POSTED", "scorePosted", "=")
	R.set_value(c, "QUERY_COMPLETE", "queryComplete", "=")
	R.set_value(c, "FILE_LOADED", "fileLoaded", "=")
	R.set_value(c, "FILE_SAVED", "fileSaved", "=")
	R.set_value(c, "FILE_DELETED", "fileDeleted", "=")
	R.set_value(c, "FILE_REQUESTED", "fileRequested", "=")
	R.set_value(c, "VOTE_COMPLETE", "voteComplete", "=")
	R.set_value(c, "USER_SIGNED_IN", "userSignedIn", "=")
	R.set_value(c, "ERROR_NONE", "noError", "=")
	R.set_value(c, "ERROR_UNKNOWN", "unknownError", "=")
	R.set_value(c, "ERROR_COMMAND_FAILED", "commandFailed", "=")
	R.set_value(c, "ERROR_NOT_CONNECTED", "notConnected", "=")
	R.set_value(c, "ERROR_INVALID_ARGUMENT", "invalidArgument", "=")
	R.set_value(c, "ERROR_TIMED_OUT", "timedOut", "=")
	R.set_value(c, "ERROR_BAD_FILE", "badFile", "=")
	R.set_value(c, "ERROR_BAD_RESPONSE", "badResponse", "=")
	R.set_value(c, "ERROR_SENDING_COMMAND", "errorSendingCommand", "=")
	R.set_value(c, "ERROR_HOST_BLOCKED", "hostBlocked", "=")
	R.set_value(c, "ERROR_ALREADY_VOTED", "alreadyVoted", "=")
	R.set_value(c, "ERROR_NOT_LOGGED_IN", "notLoggedIn", "=")
	R.set_value(c, "ERROR_WRONG_ENCRYPTION_KEY", "wrongEncryptionKey", "=")
	R.set_value(c, "ERROR_SIGN_IN_FAILED", "signInFailed", "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_data"] = R.coerce(null, "*")
	(c).fields["_success"] = false
	(c).fields["_error"] = R.coerce(null, "String")
	return null
