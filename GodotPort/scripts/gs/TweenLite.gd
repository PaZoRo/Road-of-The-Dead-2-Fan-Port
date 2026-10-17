extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_TweenLite(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"mode": "int", "$target": "Object", "$duration": "Number", "$vars": "Object"}
	l["mode"] = 0
	l["$target"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["$duration"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["$vars"] = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.invoke(R.super_ref(c, "gs.TweenLite"), [])
	if R.truth(R.binary("==", R.lget(l, "$target"), null)):
		pass
		return null
	if R.truth(R.unary("!", R.static_value("gs.TweenLite", "_classInitted"))):
		pass
		R.assign(c, "currentTime", "gs.TweenLite", R.invoke(R.resolve(c, "getTimer", "gs.TweenLite"), []), "=")
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_sprite"), "addEventListener"), [R.get_value(R.klass("Event"), "ENTER_FRAME"), R.resolve(c, "updateAll", "gs.TweenLite")])
		if R.truth(R.binary("==", R.static_value("gs.TweenLite", "overwriteManager"), null)):
			pass
			R.assign(c, "overwriteManager", "gs.TweenLite", {"mode": 1, "enabled": false}, "=")
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_timer"), "addEventListener"), ["timer", R.resolve(c, "killGarbage", "gs.TweenLite")])
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "_timer"), "start"), [])
		R.assign(c, "_classInitted", "gs.TweenLite", true, "=")
	(c).fields["vars"] = R.coerce(R.lget(l, "$vars"), "Object")
	(c).fields["duration"] = R.coerce(R.logical_or(R.lget(l, "$duration"), func(): return 0.001), "Number")
	(c).fields["delay"] = R.coerce(R.logical_or(R.num(R.get_value(R.lget(l, "$vars"), "delay")), func(): return 0), "Number")
	(c).fields["combinedTimeScale"] = R.coerce(R.logical_or(R.num(R.get_value(R.lget(l, "$vars"), "timeScale")), func(): return 1), "Number")
	(c).fields["active"] = ((float(R.lget(l, "$duration")) == float(0)) and (float((c).fields.get("delay")) == float(0)))
	(c).fields["target"] = R.coerce(R.lget(l, "$target"), "Object")
	(c).fields["_isDisplayObject"] = R.binary("is", R.lget(l, "$target"), R.resolve(c, "DisplayObject", "gs.TweenLite"))
	if R.truth(R.unary("!", R.binary("is", R.get_value((c).fields.get("vars"), "ease"), R.resolve(c, "Function", "gs.TweenLite")))):
		pass
		R.set_value((c).fields.get("vars"), "ease", R.static_value("gs.TweenLite", "defaultEase"), "=")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "easeParams"), null)):
		pass
		R.set_value((c).fields.get("vars"), "proxiedEase", R.get_value((c).fields.get("vars"), "ease"), "=")
		R.set_value((c).fields.get("vars"), "ease", R.get_value(c, "easeProxy"), "=")
	(c).fields["ease"] = R.coerce(R.get_value((c).fields.get("vars"), "ease"), "Function")
	if R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "gs.TweenLite"), [R.num(R.get_value((c).fields.get("vars"), "autoAlpha"))]))):
		pass
		R.set_value((c).fields.get("vars"), "alpha", R.num(R.get_value((c).fields.get("vars"), "autoAlpha")), "=")
		R.set_value((c).fields.get("vars"), "visible", R.binary(">", R.get_value((c).fields.get("vars"), "alpha"), 0), "=")
	(c).fields["_specialVars"] = R.coerce((R.get_value((c).fields.get("vars"), "exposedProps") if R.truth(R.binary("==", R.get_value((c).fields.get("vars"), "isTV"), true)) else (c).fields.get("vars")), "Object")
	(c).fields["tweens"] = R.coerce([], "Array")
	(c).fields["_subTweens"] = R.coerce([], "Array")
	(c).fields["_hst"] = R.coerce(R.set_value(c, "initted", false, "="), "Boolean")
	(c).fields["initTime"] = float(R.static_value("gs.TweenLite", "currentTime"))
	(c).fields["startTime"] = float((float((c).fields.get("initTime")) + float((float((c).fields.get("delay")) * float(1000)))))
	R.lset(l, "mode", (R.coerce(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "mode"), "int") if R.truth((R.binary("==", R.get_value(R.lget(l, "$vars"), "overwrite"), null) or (R.unary("!", R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")) and R.binary(">", R.get_value(R.lget(l, "$vars"), "overwrite"), 1)))) else R.coerce(R.get_value(R.lget(l, "$vars"), "overwrite"), "int")))
	if R.truth((R.binary("==", R.get_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target")), null) or (R.binary("!=", R.lget(l, "$target"), null) and (float(R.lget(l, "mode")) == float(1))))):
		pass
		R.set_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target"), [], "=")
	R.invoke(R.get_value(R.get_value(R.static_value("gs.TweenLite", "masterList"), R.lget(l, "$target")), "push"), [c])
	if R.truth(((R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true) and R.binary("!=", R.get_value((c).fields.get("vars"), "renderOnStart"), true)) or (c).fields.get("active"))):
		pass
		R.call_member(c, "initTweenVals", [])
		if R.truth((c).fields.get("active")):
			pass
			R.call_member(c, "render", [(float((c).fields.get("startTime")) + float(1))])
		else:
			pass
			R.call_member(c, "render", [(c).fields.get("startTime")])
		if R.truth(((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "visible"), null) and R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true)) and (c).fields.get("_isDisplayObject"))):
			pass
			R.set_value((c).fields.get("target"), "visible", R.get_value((c).fields.get("_specialVars"), "visible"), "=")
	return null

static func f_to(c: Variant, a: Array) -> Variant:
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__duration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__vars: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	return R.construct(R.klass("gs.TweenLite"), [v__target, v__duration, v__vars])
	return null

static func f_from(c: Variant, a: Array) -> Variant:
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__duration: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__vars: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.set_value(v__vars, "runBackwards", true, "=")
	return R.construct(R.klass("gs.TweenLite"), [v__target, v__duration, v__vars])
	return null

static func f_delayedCall(c: Variant, a: Array) -> Variant:
	var v__delay: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v__onComplete: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v__onCompleteParams: Variant = R.coerce((a[2] if a.size() > 2 else null), "Array")
	return R.construct(R.klass("gs.TweenLite"), [v__onComplete, 0, {"delay": v__delay, "onComplete": v__onComplete, "onCompleteParams": v__onCompleteParams, "overwrite": 0}])
	return null

static func f_updateAll(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"a": "Array", "i": "*", "tween": "TweenLite", "t": "uint", "ml": "Dictionary", "$e": "Event"}
	l["a"] = null
	l["i"] = null
	l["tween"] = null
	l["t"] = 0
	l["ml"] = null
	l["$e"] = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.lset(l, "a", null)
	R.lset(l, "i", 0)
	R.lset(l, "tween", null)
	R.lset(l, "t", R.assign(c, "currentTime", "gs.TweenLite", R.invoke(R.resolve(c, "getTimer", "gs.TweenLite"), []), "="))
	R.lset(l, "ml", R.static_value("gs.TweenLite", "masterList"))
	for __t1 in R.iterate(R.lget(l, "ml"), true):
		R.lset(l, "a", __t1, "=")
		R.lset(l, "i", R.coerce((R.num(R.get_value(R.lget(l, "a"), "length")) - float(1)), "int"), "=")
		while R.truth(R.binary(">", R.lget(l, "i"), R.unary("-", 1))):
			pass
			R.lset(l, "tween", R.get_value(R.lget(l, "a"), R.lget(l, "i")), "=")
			if R.truth(R.binary("!=", R.lget(l, "tween"), null)):
				pass
				if R.truth((R.lget(l, "tween")).fields.get("active")):
					pass
					R.call_member(R.lget(l, "tween"), "render", [R.lget(l, "t")])
				else:
					pass
					if R.truth((R.lget(l, "tween")).fields.get("gc")):
						pass
						R.invoke(R.get_value(R.lget(l, "a"), "splice"), [R.lget(l, "i"), 1])
					else:
						pass
						if R.truth((float(R.lget(l, "t")) >= float((R.lget(l, "tween")).fields.get("startTime")))):
							pass
							R.call_member(R.lget(l, "tween"), "activate", [])
							R.call_member(R.lget(l, "tween"), "render", [R.lget(l, "t")])
			R.binary("+", R.lset(l, "i", 1, "-="), 1)
	return null

static func f_removeTween(c: Variant, a: Array) -> Variant:
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else null), "TweenLite")
	var v__clear: Variant = R.coerce((a[1] if a.size() > 1 else true), "Boolean")
	if R.truth(R.binary("!=", v__t, null)):
		pass
		if R.truth(v__clear):
			pass
			R.call_member(v__t, "clear", [])
		R.set_value(v__t, "enabled", false, "=")
	return null

static func f_killTweensOf(c: Variant, a: Array) -> Variant:
	var v_a: Variant = null
	var v_i: Variant = null
	var v_tween: Variant = null
	var v__target: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__complete: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	v_a = R.coerce(null, "Array")
	v_i = R.coerce(0, "*")
	v_tween = R.coerce(null, "TweenLite")
	if R.truth((R.binary("!=", v__target, null) and R.binary("!=", R.get_value(R.static_value("gs.TweenLite", "masterList"), v__target), null))):
		pass
		v_a = R.coerce(R.get_value(R.static_value("gs.TweenLite", "masterList"), v__target), "Array")
		v_i = R.coerce(R.coerce((R.num(R.get_value(v_a, "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			v_tween = R.coerce(R.get_value(v_a, v_i), "TweenLite")
			if R.truth((v__complete and R.unary("!", (v_tween).fields.get("gc")))):
				pass
				R.call_member(v_tween, "complete", [false])
			R.call_member(v_tween, "clear", [])
			v_i = R.coerce(R.num(v_i) - 1, "*")
		R.delete_value(R.static_value("gs.TweenLite", "masterList"), v__target)
	return null

static func f_killGarbage(c: Variant, a: Array) -> Variant:
	var v_tgt: Variant = null
	var v_a: Variant = null
	var v_ml: Variant = null
	var v__e: Variant = R.coerce((a[0] if a.size() > 0 else null), "TimerEvent")
	v_tgt = R.coerce(null, "Object")
	v_a = R.coerce(null, "Array")
	v_ml = R.coerce(R.static_value("gs.TweenLite", "masterList"), "Dictionary")
	for __t2 in R.iterate(v_ml, false):
		v_tgt = R.coerce(__t2, "Object")
		if R.truth(R.binary("==", R.get_value(R.get_value(v_ml, v_tgt), "length"), 0)):
			pass
			R.delete_value(v_ml, v_tgt)
	return null

static func f_easeOut(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"$t": "Number", "$b": "Number", "$c": "Number", "$d": "Number"}
	l["$t"] = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	l["$b"] = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	l["$c"] = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	l["$d"] = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return (float((float((R.num(R.unary("-", R.lget(l, "$c"))) * R.num(R.lset(l, "$t", R.binary("/", R.lget(l, "$t"), R.lget(l, "$d")), "=")))) * float((float(R.lget(l, "$t")) - float(2))))) + float(R.lget(l, "$b")))
	return null

static func f_tintProxy(c: Variant, a: Array) -> Variant:
	var v_n: Variant = NAN
	var v_r: Variant = NAN
	var v_sc: Variant = null
	var v_ec: Variant = null
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	v_n = float(R.num(R.get_value(R.get_value(v__o, "target"), "progress")))
	v_r = float((float(1) - float(v_n)))
	v_sc = R.coerce(R.get_value(R.get_value(v__o, "info"), "color"), "Object")
	v_ec = R.coerce(R.get_value(R.get_value(v__o, "info"), "endColor"), "Object")
	R.set_value(R.get_value(R.get_value(R.get_value(v__o, "info"), "target"), "transform"), "colorTransform", R.construct(R.klass("ColorTransform"), [(float((R.num(R.get_value(v_sc, "redMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "redMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "greenMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "greenMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "blueMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "blueMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "alphaMultiplier")) * float(v_r))) + float((R.num(R.get_value(v_ec, "alphaMultiplier")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "redOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "redOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "greenOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "greenOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "blueOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "blueOffset")) * float(v_n)))), (float((R.num(R.get_value(v_sc, "alphaOffset")) * float(v_r))) + float((R.num(R.get_value(v_ec, "alphaOffset")) * float(v_n))))]), "=")
	return null

static func f_frameProxy(c: Variant, a: Array) -> Variant:
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.invoke(R.get_value(R.get_value(R.get_value(v__o, "info"), "target"), "gotoAndStop"), [R.invoke(R.get_value(R.klass("Math"), "round"), [R.get_value(R.get_value(v__o, "target"), "frame")])])
	return null

static func f_volumeProxy(c: Variant, a: Array) -> Variant:
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else 0), "Number")
	R.set_value(R.get_value(R.get_value(v__o, "info"), "target"), "soundTransform", R.get_value(v__o, "target"), "=")
	return null

static func f_visibleProxy(c: Variant, a: Array) -> Variant:
	var v_t: Variant = null
	var v__o: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v__time: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	v_t = R.coerce(R.get_value(R.get_value(v__o, "info"), "tween"), "TweenLite")
	if R.truth((float((v_t).fields.get("duration")) == float(v__time))):
		pass
		if R.truth((R.binary("!=", R.get_value((v_t).fields.get("vars"), "runBackwards"), true) and R.binary("==", (v_t).fields.get("ease"), R.get_value((v_t).fields.get("vars"), "ease")))):
			pass
			R.set_value((v_t).fields.get("target"), "visible", R.get_value((v_t).fields.get("vars"), "visible"), "=")
	else:
		pass
		if R.truth(R.binary("!=", R.get_value((v_t).fields.get("target"), "visible"), true)):
			pass
			R.set_value((v_t).fields.get("target"), "visible", true, "=")
	return null

static func f_initTweenVals(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v_i: Variant = null
	var v_endArray: Variant = null
	var v_clr: Variant = null
	var v_endClr: Variant = null
	var v_tp: Variant = null
	var v__hrp: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	var v__reservedProps: Variant = R.coerce((a[1] if a.size() > 1 else ""), "String")
	v_p = R.coerce(null, "String")
	v_i = R.coerce(0, "*")
	v_endArray = R.coerce(null, "Array")
	v_clr = R.coerce(null, "ColorTransform")
	v_endClr = R.coerce(null, "ColorTransform")
	v_tp = R.coerce(null, "Object")
	if R.truth((R.unary("!", v__hrp) and R.truth(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")))):
		pass
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "manageOverwrites"), [c, R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target"))])
	if R.truth(R.binary("is", (c).fields.get("target"), R.klass("Array"))):
		pass
		v_endArray = R.coerce(R.logical_or(R.get_value((c).fields.get("vars"), "endArray"), func(): return []), "Array")
		v_i = R.coerce(0, "*")
		while R.truth(R.binary("<", v_i, R.get_value(v_endArray, "length"))):
			pass
			if R.truth((R.binary("!=", R.get_value((c).fields.get("target"), v_i), R.get_value(v_endArray, v_i)) and R.binary("!=", R.get_value((c).fields.get("target"), v_i), null))):
				pass
				R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), R.invoke(R.get_value(v_i, "toString"), []), R.get_value((c).fields.get("target"), v_i), (R.num(R.get_value(v_endArray, v_i)) - R.num(R.get_value((c).fields.get("target"), v_i))), R.invoke(R.get_value(v_i, "toString"), [])], "=")
			v_i = R.coerce(R.num(v_i) + 1, "*")
	else:
		pass
		if R.truth(((R.binary("!=", R.unary("typeof", R.get_value((c).fields.get("_specialVars"), "tint")), "undefined") or R.binary("==", R.get_value((c).fields.get("vars"), "removeTint"), true)) and (c).fields.get("_isDisplayObject"))):
			pass
			v_clr = R.coerce(R.get_value(R.get_value((c).fields.get("target"), "transform"), "colorTransform"), "ColorTransform")
			v_endClr = R.coerce(R.construct(R.klass("ColorTransform"), []), "ColorTransform")
			if R.truth(R.binary("!=", R.get_value((c).fields.get("_specialVars"), "alpha"), null)):
				pass
				R.set_value(v_endClr, "alphaMultiplier", R.get_value((c).fields.get("_specialVars"), "alpha"), "=")
				R.delete_value((c).fields.get("_specialVars"), "alpha")
			else:
				pass
				R.set_value(v_endClr, "alphaMultiplier", R.get_value((c).fields.get("target"), "alpha"), "=")
			if R.truth((R.binary("!=", R.get_value((c).fields.get("vars"), "removeTint"), true) and ((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "tint"), null) and R.binary("!=", R.get_value((c).fields.get("_specialVars"), "tint"), "")) or R.binary("==", R.get_value((c).fields.get("_specialVars"), "tint"), 0)))):
				pass
				R.set_value(v_endClr, "color", R.get_value((c).fields.get("_specialVars"), "tint"), "=")
			R.call_member(c, "addSubTween", ["tint", R.resolve(c, "tintProxy", "gs.TweenLite"), {"progress": 0}, {"progress": 1}, {"target": (c).fields.get("target"), "color": v_clr, "endColor": v_endClr}])
		if R.truth((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "frame"), null) and (c).fields.get("_isDisplayObject"))):
			pass
			R.call_member(c, "addSubTween", ["frame", R.resolve(c, "frameProxy", "gs.TweenLite"), {"frame": R.get_value((c).fields.get("target"), "currentFrame")}, {"frame": R.get_value((c).fields.get("_specialVars"), "frame")}, {"target": (c).fields.get("target")}])
		if R.truth(R.logical_and(R.unary("!", R.invoke(R.resolve(c, "isNaN", "gs.TweenLite"), [R.get_value((c).fields.get("vars"), "volume")])), func(): return R.invoke(R.get_value((c).fields.get("target"), "hasOwnProperty"), ["soundTransform"]))):
			pass
			R.call_member(c, "addSubTween", ["volume", R.resolve(c, "volumeProxy", "gs.TweenLite"), R.get_value((c).fields.get("target"), "soundTransform"), {"volume": R.get_value((c).fields.get("vars"), "volume")}, {"target": (c).fields.get("target")}])
		if R.truth((R.binary("!=", R.get_value((c).fields.get("_specialVars"), "visible"), null) and (c).fields.get("_isDisplayObject"))):
			pass
			R.call_member(c, "addSubTween", ["visible", R.resolve(c, "visibleProxy", "gs.TweenLite"), {}, {}, {"tween": c}])
		for __t3 in R.iterate((c).fields.get("_specialVars"), false):
			v_p = R.coerce(__t3, "String")
			if R.truth(R.unary("!", ((((((((((((((((((R.binary("==", v_p, "ease") or R.binary("==", v_p, "delay")) or R.binary("==", v_p, "overwrite")) or R.binary("==", v_p, "onComplete")) or R.binary("==", v_p, "onCompleteParams")) or R.binary("==", v_p, "runBackwards")) or R.binary("==", v_p, "visible")) or R.binary("==", v_p, "autoOverwrite")) or R.binary("==", v_p, "persist")) or R.binary("==", v_p, "onUpdate")) or R.binary("==", v_p, "onUpdateParams")) or R.binary("==", v_p, "autoAlpha")) or (R.binary("==", v_p, "timeScale") and R.unary("!", R.binary("is", (c).fields.get("target"), R.klass("gs.TweenLite"))))) or R.binary("==", v_p, "onStart")) or R.binary("==", v_p, "onStartParams")) or R.binary("==", v_p, "renderOnStart")) or R.binary("==", v_p, "proxiedEase")) or R.binary("==", v_p, "easeParams")) or (v__hrp and R.binary("!=", R.invoke(R.get_value(v__reservedProps, "indexOf"), [R.binary("+", R.binary("+", " ", v_p), " ")]), R.unary("-", 1)))))):
				pass
				if R.truth((R.unary("!", ((c).fields.get("_isDisplayObject") and ((R.binary("==", v_p, "tint") or R.binary("==", v_p, "removeTint")) or R.binary("==", v_p, "frame")))) and R.unary("!", R.logical_and(R.binary("==", v_p, "volume"), func(): return R.invoke(R.get_value((c).fields.get("target"), "hasOwnProperty"), ["soundTransform"]))))):
					pass
					if R.truth(R.binary("==", R.unary("typeof", R.get_value((c).fields.get("_specialVars"), v_p)), "number")):
						pass
						R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), v_p, R.get_value((c).fields.get("target"), v_p), (R.num(R.get_value((c).fields.get("_specialVars"), v_p)) - R.num(R.get_value((c).fields.get("target"), v_p))), v_p], "=")
					else:
						pass
						R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [(c).fields.get("target"), v_p, R.get_value((c).fields.get("target"), v_p), R.num(R.get_value((c).fields.get("_specialVars"), v_p)), v_p], "=")
	if R.truth(R.binary("==", R.get_value((c).fields.get("vars"), "runBackwards"), true)):
		pass
		v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("tweens"), "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			v_tp = R.coerce(R.get_value((c).fields.get("tweens"), v_i), "Object")
			R.set_value(v_tp, 2, R.get_value(v_tp, 3), "+=")
			R.set_value(v_tp, 3, R.unary("-", 1), "*=")
			v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onUpdate"), null)):
		pass
		(c).fields["_hasUpdate"] = true
	(c).fields["initted"] = true
	return null

static func f_addSubTween(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v__name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v__proxy: Variant = R.coerce((a[1] if a.size() > 1 else null), "Function")
	var v__target: Variant = R.coerce((a[2] if a.size() > 2 else null), "Object")
	var v__props: Variant = R.coerce((a[3] if a.size() > 3 else null), "Object")
	var v__info: Variant = R.coerce((a[4] if a.size() > 4 else null), "Object")
	v_p = R.coerce(null, "String")
	R.set_value((c).fields.get("_subTweens"), R.get_value((c).fields.get("_subTweens"), "length"), {"name": v__name, "proxy": v__proxy, "target": v__target, "info": v__info}, "=")
	for __t4 in R.iterate(v__props, false):
		v_p = R.coerce(__t4, "String")
		if R.truth(R.binary("==", R.unary("typeof", R.get_value(v__props, v_p)), "number")):
			pass
			R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [v__target, v_p, R.get_value(v__target, v_p), (R.num(R.get_value(v__props, v_p)) - R.num(R.get_value(v__target, v_p))), v__name], "=")
		else:
			pass
			R.set_value((c).fields.get("tweens"), R.get_value((c).fields.get("tweens"), "length"), [v__target, v_p, R.get_value(v__target, v_p), R.num(R.get_value(v__props, v_p)), v__name], "=")
	(c).fields["_hst"] = true
	return null

static func f_render(c: Variant, a: Array) -> Variant:
	var v_factor: Variant = NAN
	var v_tp: Variant = null
	var v_i: Variant = null
	var v_time: Variant = NAN
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	v_factor = float(NAN)
	v_tp = R.coerce(null, "Object")
	v_i = R.coerce(0, "*")
	v_time = float(R.binary("/", (float(v__t) - float((c).fields.get("startTime"))), 1000))
	if R.truth((float(v_time) >= float((c).fields.get("duration")))):
		pass
		v_time = float((c).fields.get("duration"))
		v_factor = R.coerce((1 if R.truth((R.binary("==", (c).fields.get("ease"), R.get_value((c).fields.get("vars"), "ease")) or (float((c).fields.get("duration")) == float(0.001)))) else 0), "Number")
	else:
		pass
		v_factor = R.coerce(R.call_member(c, "ease", [v_time, 0, 1, (c).fields.get("duration")]), "Number")
	v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("tweens"), "length")) - float(1)), "int"), "*")
	while R.truth(R.binary(">", v_i, R.unary("-", 1))):
		pass
		v_tp = R.coerce(R.get_value((c).fields.get("tweens"), v_i), "Object")
		R.set_value(R.get_value(v_tp, 0), R.get_value(v_tp, 1), R.binary("+", R.get_value(v_tp, 2), (float(v_factor) * R.num(R.get_value(v_tp, 3)))), "=")
		v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth((c).fields.get("_hst")):
		pass
		v_i = R.coerce(R.coerce((R.num(R.get_value((c).fields.get("_subTweens"), "length")) - float(1)), "int"), "*")
		while R.truth(R.binary(">", v_i, R.unary("-", 1))):
			pass
			R.invoke(R.get_value(R.get_value((c).fields.get("_subTweens"), v_i), "proxy"), [R.get_value((c).fields.get("_subTweens"), v_i), v_time])
			v_i = R.coerce(R.num(v_i) - 1, "*")
	if R.truth((c).fields.get("_hasUpdate")):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onUpdate"), "apply"), [null, R.get_value((c).fields.get("vars"), "onUpdateParams")])
	if R.truth((float(v_time) == float((c).fields.get("duration")))):
		pass
		R.call_member(c, "complete", [true])
	return null

static func f_activate(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	(c).fields["started"] = R.coerce(R.set_value(c, "active", true, "="), "Boolean")
	if R.truth(R.unary("!", (c).fields.get("initted"))):
		pass
		R.call_member(c, "initTweenVals", [])
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onStart"), null)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onStart"), "apply"), [null, R.get_value((c).fields.get("vars"), "onStartParams")])
	if R.truth((float((c).fields.get("duration")) == float(0.001))):
		pass
		R.set_value(c, "startTime", 1, "-=")
	return null

static func f_complete(c: Variant, a: Array) -> Variant:
	var v__skipRender: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	if R.truth(R.unary("!", v__skipRender)):
		pass
		if R.truth(R.unary("!", (c).fields.get("initted"))):
			pass
			R.call_member(c, "initTweenVals", [])
		(c).fields["startTime"] = float((float(R.static_value("gs.TweenLite", "currentTime")) - float(R.binary("/", (float((c).fields.get("duration")) * float(1000)), (c).fields.get("combinedTimeScale")))))
		R.call_member(c, "render", [R.static_value("gs.TweenLite", "currentTime")])
		return null
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "persist"), true)):
		pass
		R.set_value(c, "enabled", false, "=")
	if R.truth(R.binary("!=", R.get_value((c).fields.get("vars"), "onComplete"), null)):
		pass
		R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "onComplete"), "apply"), [null, R.get_value((c).fields.get("vars"), "onCompleteParams")])
	return null

static func f_clear(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {}
	(c).fields["tweens"] = R.coerce([], "Array")
	(c).fields["_subTweens"] = R.coerce([], "Array")
	(c).fields["vars"] = R.coerce({}, "Object")
	(c).fields["_hst"] = R.coerce(R.set_value(c, "_hasUpdate", false, "="), "Boolean")
	return null

static func f_killVars(c: Variant, a: Array) -> Variant:
	var v__vars: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "enabled")):
		pass
		R.invoke(R.get_value(R.static_value("gs.TweenLite", "overwriteManager"), "killVars"), [v__vars, (c).fields.get("vars"), (c).fields.get("tweens"), (c).fields.get("_subTweens"), []])
	return null

static func f_easeProxy(c: Variant, a: Array) -> Variant:
	var v__t: Variant = R.coerce((a[0] if a.size() > 0 else NAN), "Number")
	var v__b: Variant = R.coerce((a[1] if a.size() > 1 else NAN), "Number")
	var v__c: Variant = R.coerce((a[2] if a.size() > 2 else NAN), "Number")
	var v__d: Variant = R.coerce((a[3] if a.size() > 3 else NAN), "Number")
	return R.invoke(R.get_value(R.get_value((c).fields.get("vars"), "proxiedEase"), "apply"), [null, R.invoke(R.get_value(R.resolve(c, "arguments", "gs.TweenLite"), "concat"), [R.get_value((c).fields.get("vars"), "easeParams")])])
	return null

static func f_get_enabled(c: Variant, a: Array) -> Variant:
	return R.unary("!", (c).fields.get("gc"))
	return null

static func f_set_enabled(c: Variant, a: Array) -> Variant:
	var v_a: Variant = null
	var v_found: Variant = false
	var v_i: Variant = null
	var v__b: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_a = R.coerce(null, "Array")
	v_found = false
	v_i = R.coerce(0, "*")
	if R.truth(v__b):
		pass
		if R.truth(R.binary("==", R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), null)):
			pass
			R.set_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target"), [c], "=")
		else:
			pass
			v_a = R.coerce(R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), "Array")
			v_i = R.coerce(R.coerce((R.num(R.get_value(v_a, "length")) - float(1)), "int"), "*")
			while R.truth(R.binary(">", v_i, R.unary("-", 1))):
				pass
				if R.truth(R.binary("==", R.get_value(v_a, v_i), c)):
					pass
					v_found = true
					break
				v_i = R.coerce(R.num(v_i) - 1, "*")
			if R.truth(R.unary("!", v_found)):
				pass
				R.invoke(R.get_value(R.get_value(R.static_value("gs.TweenLite", "masterList"), (c).fields.get("target")), "push"), [c])
	else:
		pass
		if R.truth(R.binary("is", (c).fields.get("target"), R.resolve(c, "DisplayObject", "gs.TweenLite"))):
			pass
			pass
	(c).fields["gc"] = R.unary("!", v__b)
	if R.truth((c).fields.get("gc")):
		pass
		(c).fields["active"] = false
	else:
		pass
		(c).fields["active"] = (c).fields.get("started")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "overwriteManager", null, "=")
	R.set_value(c, "currentTime", 0, "=")
	R.set_value(c, "_classInitted", false, "=")
	R.set_value(c, "version", 9.26, "=")
	R.set_value(c, "killDelayedCallsTo", R.get_value(R.klass("gs.TweenLite"), "killTweensOf"), "=")
	R.set_value(c, "defaultEase", R.get_value(R.klass("gs.TweenLite"), "easeOut"), "=")
	R.set_value(c, "masterList", R.construct(R.resolve(c, "Dictionary", "gs.TweenLite"), [false]), "=")
	R.set_value(c, "_sprite", R.construct(R.klass("Sprite"), []), "=")
	R.set_value(c, "_timer", R.construct(R.resolve(c, "Timer", "gs.TweenLite"), [2000]), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["duration"] = float(NAN)
	(c).fields["vars"] = R.coerce(null, "Object")
	(c).fields["delay"] = float(NAN)
	(c).fields["startTime"] = float(NAN)
	(c).fields["initTime"] = float(NAN)
	(c).fields["tweens"] = R.coerce(null, "Array")
	(c).fields["target"] = R.coerce(null, "Object")
	(c).fields["active"] = false
	(c).fields["ease"] = R.coerce(null, "Function")
	(c).fields["initted"] = false
	(c).fields["combinedTimeScale"] = float(NAN)
	(c).fields["gc"] = false
	(c).fields["started"] = false
	(c).fields["_subTweens"] = R.coerce(null, "Array")
	(c).fields["_hst"] = false
	(c).fields["_hasUpdate"] = false
	(c).fields["_isDisplayObject"] = false
	(c).fields["_specialVars"] = R.coerce(null, "Object")
	return null
