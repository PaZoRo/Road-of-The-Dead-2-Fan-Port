extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_APIEventDispatcher(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "com.newgrounds.APIEventDispatcher"), [])
	return null

static func f_get_globalDispatcher(c: Variant, a: Array) -> Variant:
	return R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")
	return null

static func f_set_globalDispatcher(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "EventDispatcher")
	R.assign(c, "_globalDispatcher", "com.newgrounds.APIEventDispatcher", v_param1, "=")
	return null

static func f_initEventQueue(c: Variant, a: Array) -> Variant:
	R.assign(c, "_ticker", "com.newgrounds.APIEventDispatcher", R.construct(R.klass("Sprite"), []), "=")
	R.invoke(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_ticker"), "addEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "runEventQueue", "com.newgrounds.APIEventDispatcher")])
	return []
	return null

static func f_runEventQueue(c: Variant, a: Array) -> Variant:
	var v__loc3_: Variant = null
	var v__loc4_: Variant = 0
	var v__loc5_: Variant = null
	var v__loc2_: Variant = 0
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v__loc3_ = R.coerce(null, "Array")
	v__loc4_ = R.coerce(0, "uint")
	v__loc5_ = R.coerce(null, "Object")
	v__loc2_ = R.coerce(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "length"), "uint")
	if R.truth(v__loc2_):
		pass
		v__loc3_ = R.coerce(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "Array")
		R.assign(c, "_eventQueue", "com.newgrounds.APIEventDispatcher", [], "=")
		v__loc4_ = R.coerce(0, "uint")
		while R.truth((float(v__loc4_) < float(v__loc2_))):
			pass
			v__loc5_ = R.coerce(R.get_value(v__loc3_, v__loc4_), "Object")
			R.invoke(R.get_value(R.get_value(v__loc5_, "dispatcher"), "actualDispatchEvent"), [R.get_value(v__loc5_, "event")])
			v__loc4_ = ((v__loc4_ + 1) & 4294967295)
	return null

static func f_dispatchEvent(c: Variant, a: Array) -> Variant:
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_eventQueue"), "push"), [{"dispatcher": c, "event": v_param1}])
	return true
	return null

static func f_actualDispatchEvent(c: Variant, a: Array) -> Variant:
	var v__loc2_: Variant = false
	var v_param1: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v__loc2_ = R.coerce(R.invoke(R.get_value(R.super_ref(c, "com.newgrounds.APIEventDispatcher"), "dispatchEvent"), [v_param1]), "Boolean")
	if R.truth((R.truth(R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")) and R.binary("!=", c, R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher")))):
		pass
		R.invoke(R.get_value(R.static_value("com.newgrounds.APIEventDispatcher", "_globalDispatcher"), "dispatchEvent"), [v_param1])
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_globalDispatcher", null, "=")
	R.set_value(c, "_ticker", null, "=")
	R.set_value(c, "_eventQueue", R.invoke(R.resolve(c, "initEventQueue", "com.newgrounds.APIEventDispatcher"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	pass
	return null
