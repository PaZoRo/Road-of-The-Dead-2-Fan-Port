extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_FocusManager(c: Variant, a: Array) -> Variant:
	var v_container: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	R.invoke(R.super_ref(c, "fl.managers.FocusManager"), [])
	(c).fields["focusableObjects"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.FocusManager"), [true]), "Dictionary")
	if R.truth(R.binary("!=", v_container, null)):
		pass
		(c).fields["_form"] = R.coerce(v_container, "DisplayObjectContainer")
		R.call_member(c, "activate", [])
	return null

static func f_addedHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_target = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObject")
	if R.truth(R.get_value(v_target, "stage")):
		pass
		R.call_member(c, "addFocusables", [R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")])])
	return null

static func f_removedHandler(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_io: Variant = null
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	v_i = R.coerce(0, "int")
	v_io = R.coerce(null, "InteractiveObject")
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObject")
	if R.truth((R.binary("is", v_o, R.klass("fl.managers.IFocusManagerComponent")) and R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true))):
		pass
		if R.truth(R.binary("==", v_o, (c).fields.get("lastFocus"))):
			pass
			R.invoke(R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [(c).fields.get("lastFocus")]), "drawFocus"), [false])
			(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false])
		R.delete_value((c).fields.get("focusableObjects"), v_o)
		(c).fields["calculateCandidates"] = true
	else:
		pass
		if R.truth((R.binary("is", v_o, R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")) and R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true))):
			pass
			v_io = R.coerce(R.binary("as", v_o, R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")), "InteractiveObject")
			if R.truth(v_io):
				pass
				if R.truth(R.binary("==", v_io, (c).fields.get("lastFocus"))):
					pass
					(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
				R.delete_value((c).fields.get("focusableObjects"), v_io)
				(c).fields["calculateCandidates"] = true
			R.invoke(R.get_value(v_o, "addEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false, 0, true])
	R.call_member(c, "removeFocusables", [v_o])
	return null

static func f_addFocusables(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"focusable": "IFocusManagerComponent", "io": "InteractiveObject", "doc": "DisplayObjectContainer", "docParent": "DisplayObjectContainer", "i": "int", "child": "DisplayObject", "se": "SecurityError", "error": "SecurityError", "o": "DisplayObject", "skipTopLevel": "Boolean"}
	l["focusable"] = null
	l["io"] = null
	l["doc"] = null
	l["docParent"] = null
	l["i"] = 0
	l["child"] = null
	l["se"] = null
	l["error"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	l["skipTopLevel"] = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	R.lset(l, "focusable", null)
	R.lset(l, "io", null)
	R.lset(l, "doc", null)
	R.lset(l, "docParent", null)
	R.lset(l, "i", 0)
	R.lset(l, "child", null)
	if R.truth(R.unary("!", R.lget(l, "skipTopLevel"))):
		pass
		if R.truth(R.binary("is", R.lget(l, "o"), R.klass("fl.managers.IFocusManagerComponent"))):
			pass
			R.lset(l, "focusable", R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "o")]), "=")
			if R.truth(R.get_value(R.lget(l, "focusable"), "focusEnabled")):
				pass
				if R.truth(R.logical_and(R.get_value(R.lget(l, "focusable"), "tabEnabled"), func(): return R.call_member(c, "isTabVisible", [R.lget(l, "o")]))):
					pass
					R.set_value((c).fields.get("focusableObjects"), R.lget(l, "o"), true, "=")
					(c).fields["calculateCandidates"] = true
				R.invoke(R.get_value(R.lget(l, "o"), "addEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false, 0, true])
				R.invoke(R.get_value(R.lget(l, "o"), "addEventListener"), [R.get_value(R.klass("Event"), "TAB_INDEX_CHANGE"), R.get_value(c, "tabIndexChangeHandler"), false, 0, true])
		else:
			pass
			if R.truth(R.binary("is", R.lget(l, "o"), R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"))):
				pass
				R.lset(l, "io", R.binary("as", R.lget(l, "o"), R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")), "=")
				if R.truth(((R.truth(R.lget(l, "io")) and R.truth(R.get_value(R.lget(l, "io"), "tabEnabled"))) and R.binary("==", R.call_member(c, "findFocusManagerComponent", [R.lget(l, "io")]), R.lget(l, "io")))):
					pass
					R.set_value((c).fields.get("focusableObjects"), R.lget(l, "io"), true, "=")
					(c).fields["calculateCandidates"] = true
				R.invoke(R.get_value(R.lget(l, "io"), "addEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false, 0, true])
				R.invoke(R.get_value(R.lget(l, "io"), "addEventListener"), [R.get_value(R.klass("Event"), "TAB_INDEX_CHANGE"), R.get_value(c, "tabIndexChangeHandler"), false, 0, true])
	if R.truth(R.binary("is", R.lget(l, "o"), R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"))):
		pass
		R.lset(l, "doc", R.invoke(R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"), [R.lget(l, "o")]), "=")
		R.invoke(R.get_value(R.lget(l, "o"), "addEventListener"), [R.get_value(R.klass("Event"), "TAB_CHILDREN_CHANGE"), R.get_value(c, "tabChildrenChangeHandler"), false, 0, true])
		R.lset(l, "docParent", null, "=")
		R.last_error = null
		R.lset(l, "docParent", R.get_value(R.lget(l, "doc"), "parent"), "=")
		if R.last_error != null:
			R.lset(l, "se", R.last_error)
			R.last_error = null
			R.lset(l, "docParent", null, "=")
		if R.truth(R.logical_or((R.binary("is", R.lget(l, "doc"), R.resolve(c, "Stage", "fl.managers.FocusManager")) or R.binary("is", R.lget(l, "docParent"), R.resolve(c, "Stage", "fl.managers.FocusManager"))), func(): return R.get_value(R.lget(l, "doc"), "tabChildren"))):
			pass
			R.lset(l, "i", 0, "=")
			while R.truth(R.binary("<", R.lget(l, "i"), R.get_value(R.lget(l, "doc"), "numChildren"))):
				pass
				R.last_error = null
				R.lset(l, "child", R.invoke(R.get_value(R.lget(l, "doc"), "getChildAt"), [R.lget(l, "i")]), "=")
				if R.truth(R.binary("!=", R.lget(l, "child"), null)):
					pass
					R.call_member(c, "addFocusables", [R.invoke(R.get_value(R.lget(l, "doc"), "getChildAt"), [R.lget(l, "i")])])
				if R.last_error != null:
					R.lset(l, "error", R.last_error)
					R.last_error = null
					pass
				R.binary("-", R.lset(l, "i", 1, "+="), 1)
	return null

static func f_removeFocusables(c: Variant, a: Array) -> Variant:
	var v_p: Variant = null
	var v_dob: Variant = null
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	v_p = R.coerce(null, "Object")
	v_dob = R.coerce(null, "DisplayObject")
	if R.truth(R.binary("is", v_o, R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"))):
		pass
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_CHILDREN_CHANGE"), R.get_value(c, "tabChildrenChangeHandler"), false])
		R.invoke(R.get_value(v_o, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_INDEX_CHANGE"), R.get_value(c, "tabIndexChangeHandler"), false])
		for __t1 in R.iterate((c).fields.get("focusableObjects"), false):
			v_p = R.coerce(__t1, "Object")
			v_dob = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [v_p]), "DisplayObject")
			if R.truth(R.invoke(R.get_value(R.invoke(R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"), [v_o]), "contains"), [v_dob])):
				pass
				if R.truth(R.binary("==", v_dob, (c).fields.get("lastFocus"))):
					pass
					(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
				R.invoke(R.get_value(v_dob, "removeEventListener"), [R.get_value(R.klass("Event"), "TAB_ENABLED_CHANGE"), R.get_value(c, "tabEnabledChangeHandler"), false])
				R.delete_value((c).fields.get("focusableObjects"), v_p)
				(c).fields["calculateCandidates"] = true
	return null

static func f_isTabVisible(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"p": "DisplayObjectContainer", "se": "SecurityError", "o": "DisplayObject"}
	l["p"] = null
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	R.lset(l, "p", null)
	R.last_error = null
	R.lset(l, "p", R.get_value(R.lget(l, "o"), "parent"), "=")
	while R.truth(((R.truth(R.lget(l, "p")) and R.truth(R.unary("!", R.binary("is", R.lget(l, "p"), R.resolve(c, "Stage", "fl.managers.FocusManager"))))) and R.unary("!", R.logical_and(R.get_value(R.lget(l, "p"), "parent"), func(): return R.binary("is", R.get_value(R.lget(l, "p"), "parent"), R.resolve(c, "Stage", "fl.managers.FocusManager")))))):
		pass
		if R.truth(R.unary("!", R.get_value(R.lget(l, "p"), "tabChildren"))):
			pass
			return false
		R.lset(l, "p", R.get_value(R.lget(l, "p"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return true
	return null

static func f_isValidFocusCandidate(c: Variant, a: Array) -> Variant:
	var v_tg: Variant = null
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	var v_groupName: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_tg = R.coerce(null, "IFocusManagerGroup")
	if R.truth(R.unary("!", R.call_member(c, "isEnabledAndVisible", [v_o]))):
		pass
		return false
	if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
		pass
		v_tg = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
		if R.truth(R.binary("==", v_groupName, R.get_value(v_tg, "groupName"))):
			pass
			return false
	return true
	return null

static func f_isEnabledAndVisible(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"formParent": "DisplayObjectContainer", "tf": "TextField", "sb": "SimpleButton", "se": "SecurityError", "o": "DisplayObject"}
	l["formParent"] = null
	l["tf"] = null
	l["sb"] = null
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	R.lset(l, "formParent", null)
	R.lset(l, "tf", null)
	R.lset(l, "sb", null)
	R.last_error = null
	R.lset(l, "formParent", R.get_value(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")]), "parent"), "=")
	while R.truth(R.binary("!=", R.lget(l, "o"), R.lget(l, "formParent"))):
		pass
		if R.truth(R.binary("is", R.lget(l, "o"), R.klass("fl.core.UIComponent"))):
			pass
			if R.truth(R.unary("!", R.get_value(R.invoke(R.klass("fl.core.UIComponent"), [R.lget(l, "o")]), "enabled"))):
				pass
				return false
		else:
			pass
			if R.truth(R.binary("is", R.lget(l, "o"), R.klass("TextField"))):
				pass
				R.lset(l, "tf", R.invoke(R.klass("TextField"), [R.lget(l, "o")]), "=")
				if R.truth((R.binary("==", R.get_value(R.lget(l, "tf"), "type"), R.get_value(R.resolve(c, "TextFieldType", "fl.managers.FocusManager"), "DYNAMIC")) or R.unary("!", R.get_value(R.lget(l, "tf"), "selectable")))):
					pass
					return false
			else:
				pass
				if R.truth(R.binary("is", R.lget(l, "o"), R.resolve(c, "SimpleButton", "fl.managers.FocusManager"))):
					pass
					R.lset(l, "sb", R.invoke(R.resolve(c, "SimpleButton", "fl.managers.FocusManager"), [R.lget(l, "o")]), "=")
					if R.truth(R.unary("!", R.get_value(R.lget(l, "sb"), "enabled"))):
						pass
						return false
		if R.truth(R.unary("!", R.get_value(R.lget(l, "o"), "visible"))):
			pass
			return false
		R.lset(l, "o", R.get_value(R.lget(l, "o"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return true
	return null

static func f_tabEnabledChangeHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_registeredFocusableObject: Variant = false
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["calculateCandidates"] = true
	v_o = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	v_registeredFocusableObject = R.binary("==", R.get_value((c).fields.get("focusableObjects"), v_o), true)
	if R.truth(R.get_value(v_o, "tabEnabled")):
		pass
		if R.truth(R.logical_and(R.unary("!", v_registeredFocusableObject), func(): return R.call_member(c, "isTabVisible", [v_o]))):
			pass
			if R.truth(R.unary("!", R.binary("is", v_o, R.klass("fl.managers.IFocusManagerComponent")))):
				pass
				R.set_value(v_o, "focusRect", false, "=")
			R.set_value((c).fields.get("focusableObjects"), v_o, true, "=")
	else:
		pass
		if R.truth(v_registeredFocusableObject):
			pass
			R.delete_value((c).fields.get("focusableObjects"), v_o)
	return null

static func f_tabIndexChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	(c).fields["calculateCandidates"] = true
	return null

static func f_tabChildrenChangeHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.binary("!=", R.get_value(v_event, "target"), R.get_value(v_event, "currentTarget"))):
		pass
		return null
	(c).fields["calculateCandidates"] = true
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObjectContainer", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "DisplayObjectContainer")
	if R.truth(R.get_value(v_o, "tabChildren")):
		pass
		R.call_member(c, "addFocusables", [v_o, true])
	else:
		pass
		R.call_member(c, "removeFocusables", [v_o])
	return null

static func f_activate(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError"}
	l["se"] = null
	if R.truth((c).fields.get("activated")):
		pass
		return null
	R.call_member(c, "addFocusables", [R.get_value(c, "form")])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.klass("Event"), "ADDED"), R.get_value(c, "addedHandler"), false, 0, true])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.klass("Event"), "REMOVED"), R.get_value(c, "removedHandler"), false, 0, true])
	R.last_error = null
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.get_value(c, "mouseFocusChangeHandler"), false, 0, true])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.get_value(c, "keyFocusChangeHandler"), false, 0, true])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "addEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "activateHandler"), false, 0, true])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "addEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "deactivateHandler"), false, 0, true])
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		R.invoke(R.get_value(R.resolve(c, "form", "fl.managers.FocusManager"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.resolve(c, "mouseFocusChangeHandler", "fl.managers.FocusManager"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "form", "fl.managers.FocusManager"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.resolve(c, "keyFocusChangeHandler", "fl.managers.FocusManager"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "form", "fl.managers.FocusManager"), "addEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.resolve(c, "activateHandler", "fl.managers.FocusManager"), false, 0, true])
		R.invoke(R.get_value(R.resolve(c, "form", "fl.managers.FocusManager"), "addEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.resolve(c, "deactivateHandler", "fl.managers.FocusManager"), false, 0, true])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_IN"), R.get_value(c, "focusInHandler"), true, 0, true])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_OUT"), R.get_value(c, "focusOutHandler"), true, 0, true])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "mouseDownHandler"), false, 0, true])
	R.invoke(R.get_value(R.get_value(c, "form"), "addEventListener"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "keyDownHandler"), true, 0, true])
	(c).fields["activated"] = true
	if R.truth((c).fields.get("lastFocus")):
		pass
		R.call_member(c, "setFocus", [(c).fields.get("lastFocus")])
	return null

static func f_deactivate(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError"}
	l["se"] = null
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	(c).fields["focusableObjects"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.FocusManager"), [true]), "Dictionary")
	(c).fields["focusableCandidates"] = R.coerce(null, "Array")
	(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
	(c).fields["defButton"] = R.coerce(null, "Button")
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "ADDED"), R.get_value(c, "addedHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "REMOVED"), R.get_value(c, "removedHandler"), false])
	R.last_error = null
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.get_value(c, "mouseFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.get_value(c, "keyFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "activateHandler"), false])
	R.invoke(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "removeEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "deactivateHandler"), false])
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "MOUSE_FOCUS_CHANGE"), R.get_value(c, "mouseFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "KEY_FOCUS_CHANGE"), R.get_value(c, "keyFocusChangeHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "ACTIVATE"), R.get_value(c, "activateHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("Event"), "DEACTIVATE"), R.get_value(c, "deactivateHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_IN"), R.get_value(c, "focusInHandler"), true])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.resolve(c, "FocusEvent", "fl.managers.FocusManager"), "FOCUS_OUT"), R.get_value(c, "focusOutHandler"), true])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("MouseEvent"), "MOUSE_DOWN"), R.get_value(c, "mouseDownHandler"), false])
	R.invoke(R.get_value(R.get_value(c, "form"), "removeEventListener"), [R.get_value(R.klass("KeyboardEvent"), "KEY_DOWN"), R.get_value(c, "keyDownHandler"), true])
	(c).fields["activated"] = false
	return null

static func f_focusInHandler(c: Variant, a: Array) -> Variant:
	var v_x: Variant = null
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	v_x = R.coerce(null, "Button")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	if R.truth(R.invoke(R.get_value(R.get_value(c, "form"), "contains"), [v_target])):
		pass
		(c).fields["lastFocus"] = R.coerce(R.call_member(c, "findFocusManagerComponent", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_target])]), "InteractiveObject")
		if R.truth(R.binary("is", (c).fields.get("lastFocus"), R.klass("fl.controls.Button"))):
			pass
			v_x = R.coerce(R.invoke(R.klass("fl.controls.Button"), [(c).fields.get("lastFocus")]), "Button")
			if R.truth((c).fields.get("defButton")):
				pass
				R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
				(c).fields["defButton"] = R.coerce(v_x, "Button")
				R.set_value(v_x, "emphasized", true, "=")
		else:
			pass
			if R.truth((R.truth((c).fields.get("defButton")) and R.binary("!=", (c).fields.get("defButton"), (c).fields.get("_defaultButton")))):
				pass
				R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
				(c).fields["defButton"] = R.coerce((c).fields.get("_defaultButton"), "Button")
				R.set_value((c).fields.get("_defaultButton"), "emphasized", true, "=")
	return null

static func f_focusOutHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.binary("as", R.get_value(v_event, "target"), R.resolve(c, "InteractiveObject", "fl.managers.FocusManager")), "InteractiveObject")
	return null

static func f_activateHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	if R.truth((c).fields.get("lastFocus")):
		pass
		if R.truth(R.binary("is", (c).fields.get("lastFocus"), R.klass("fl.managers.IFocusManagerComponent"))):
			pass
			R.invoke(R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [(c).fields.get("lastFocus")]), "setFocus"), [])
		else:
			pass
			R.set_value(R.get_value(R.get_value(c, "form"), "stage"), "focus", (c).fields.get("lastFocus"), "=")
	(c).fields["lastAction"] = R.coerce("ACTIVATE", "String")
	return null

static func f_deactivateHandler(c: Variant, a: Array) -> Variant:
	var v_target: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	v_target = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")]), "InteractiveObject")
	return null

static func f_mouseFocusChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.binary("is", R.get_value(v_event, "relatedObject"), R.klass("TextField"))):
		pass
		return null
	R.invoke(R.get_value(v_event, "preventDefault"), [])
	return null

static func f_keyFocusChangeHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	R.set_value(c, "showFocusIndicator", true, "=")
	if R.truth(((R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "TAB")) or R.binary("==", R.get_value(v_event, "keyCode"), 0)) and R.unary("!", R.invoke(R.get_value(v_event, "isDefaultPrevented"), [])))):
		pass
		R.call_member(c, "setFocusToNextObject", [v_event])
		R.invoke(R.get_value(v_event, "preventDefault"), [])
	return null

static func f_keyDownHandler(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "KeyboardEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "TAB"))):
		pass
		(c).fields["lastAction"] = R.coerce("KEY", "String")
		if R.truth((c).fields.get("calculateCandidates")):
			pass
			R.call_member(c, "sortFocusableObjects", [])
			(c).fields["calculateCandidates"] = false
	if R.truth(R.logical_and((R.truth(R.logical_and(R.get_value(c, "defaultButtonEnabled"), func(): return R.binary("==", R.get_value(v_event, "keyCode"), R.get_value(R.resolve(c, "Keyboard", "fl.managers.FocusManager"), "ENTER")))) and R.truth(R.get_value(c, "defaultButton"))), func(): return R.get_value((c).fields.get("defButton"), "enabled"))):
		pass
		R.call_member(c, "sendDefaultButtonEvent", [])
	return null

static func f_mouseDownHandler(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	if R.truth(R.unary("!", (c).fields.get("activated"))):
		pass
		return null
	if R.truth(R.invoke(R.get_value(v_event, "isDefaultPrevented"), [])):
		pass
		return null
	v_o = R.coerce(R.call_member(c, "getTopLevelFocusTarget", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(v_event, "target")])]), "InteractiveObject")
	if R.truth(R.unary("!", v_o)):
		pass
		return null
	R.set_value(c, "showFocusIndicator", false, "=")
	if R.truth(((R.binary("!=", v_o, (c).fields.get("lastFocus")) or R.binary("==", (c).fields.get("lastAction"), "ACTIVATE")) and R.unary("!", R.binary("is", v_o, R.klass("TextField"))))):
		pass
		R.call_member(c, "setFocus", [v_o])
	(c).fields["lastAction"] = R.coerce("MOUSEDOWN", "String")
	return null

static func f_get_defaultButton(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_defaultButton")
	return null

static func f_set_defaultButton(c: Variant, a: Array) -> Variant:
	var v_button: Variant = null
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "Button")
	v_button = R.coerce((R.invoke(R.klass("fl.controls.Button"), [v_value]) if R.truth(v_value) else null), "Button")
	if R.truth(R.binary("!=", v_button, (c).fields.get("_defaultButton"))):
		pass
		if R.truth((c).fields.get("_defaultButton")):
			pass
			R.set_value((c).fields.get("_defaultButton"), "emphasized", false, "=")
		if R.truth((c).fields.get("defButton")):
			pass
			R.set_value((c).fields.get("defButton"), "emphasized", false, "=")
		(c).fields["_defaultButton"] = R.coerce(v_button, "Button")
		(c).fields["defButton"] = R.coerce(v_button, "Button")
		if R.truth(v_button):
			pass
			R.set_value(v_button, "emphasized", true, "=")
	return null

static func f_sendDefaultButtonEvent(c: Variant, a: Array) -> Variant:
	R.call_member((c).fields.get("defButton"), "dispatchEvent", [R.construct(R.klass("MouseEvent"), [R.get_value(R.klass("MouseEvent"), "CLICK")])])
	return null

static func f_setFocusToNextObject(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "FocusEvent")
	if R.truth(R.unary("!", R.call_member(c, "hasFocusableObjects", []))):
		pass
		return null
	v_o = R.coerce(R.call_member(c, "getNextFocusManagerComponent", [R.get_value(v_event, "shiftKey")]), "InteractiveObject")
	if R.truth(v_o):
		pass
		R.call_member(c, "setFocus", [v_o])
	return null

static func f_hasFocusableObjects(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v__loc2_: Variant = 0
	var v__loc3_: Variant = null
	v_o = R.coerce(null, "Object")
	v__loc2_ = R.coerce(0, "int")
	v__loc3_ = R.coerce((c).fields.get("focusableObjects"), "*")
	for __t2 in R.iterate(v__loc3_, false):
		v_o = R.coerce(__t2, "Object")
		return true
	return false
	return null

static func f_getNextFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var v_tg: Variant = null
	var v_o: Variant = null
	var v_g: Variant = null
	var v_i: Variant = 0
	var v_bSearchAll: Variant = false
	var v_start: Variant = 0
	var v_j: Variant = 0
	var v_backward: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	v_tg = R.coerce(null, "IFocusManagerGroup")
	if R.truth(R.unary("!", R.call_member(c, "hasFocusableObjects", []))):
		pass
		return null
	if R.truth((c).fields.get("calculateCandidates")):
		pass
		R.call_member(c, "sortFocusableObjects", [])
		(c).fields["calculateCandidates"] = false
	v_o = R.coerce(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "focus"), "DisplayObject")
	v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.call_member(c, "findFocusManagerComponent", [R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o])])]), "DisplayObject")
	v_g = R.coerce("", "String")
	if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
		pass
		v_tg = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
		v_g = R.coerce(R.get_value(v_tg, "groupName"), "String")
	v_i = R.coerce(R.call_member(c, "getIndexOfFocusedObject", [v_o]), "int")
	v_bSearchAll = false
	v_start = R.coerce(v_i, "int")
	if R.truth(R.binary("==", v_i, R.unary("-", 1))):
		pass
		if R.truth(v_backward):
			pass
			v_i = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
		v_bSearchAll = true
	v_j = R.coerce(R.call_member(c, "getIndexOfNextObject", [v_i, v_backward, v_bSearchAll, v_g]), "int")
	return R.call_member(c, "findFocusManagerComponent", [R.get_value((c).fields.get("focusableCandidates"), v_j)])
	return null

static func f_getIndexOfFocusedObject(c: Variant, a: Array) -> Variant:
	var v_n: Variant = 0
	var v_i: Variant = 0
	var v_o: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObject")
	v_n = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
	v_i = R.coerce(0, "int")
	v_i = R.coerce(0, "int")
	while R.truth((float(v_i) < float(v_n))):
		pass
		if R.truth(R.binary("==", R.get_value((c).fields.get("focusableCandidates"), v_i), v_o)):
			pass
			return v_i
		v_i = R.signed32(v_i + 1)
	return R.unary("-", 1)
	return null

static func f_getIndexOfNextObject(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_tg1: Variant = null
	var v_j: Variant = 0
	var v_obj: Variant = null
	var v_tg2: Variant = null
	var v_n: Variant = 0
	var v_start: Variant = 0
	var v_i: Variant = R.coerce((a[0] if a.size() > 0 else 0), "int")
	var v_shiftKey: Variant = R.coerce((a[1] if a.size() > 1 else false), "Boolean")
	var v_bSearchAll: Variant = R.coerce((a[2] if a.size() > 2 else false), "Boolean")
	var v_groupName: Variant = R.coerce((a[3] if a.size() > 3 else null), "String")
	v_o = R.coerce(null, "DisplayObject")
	v_tg1 = R.coerce(null, "IFocusManagerGroup")
	v_j = R.coerce(0, "int")
	v_obj = R.coerce(null, "DisplayObject")
	v_tg2 = R.coerce(null, "IFocusManagerGroup")
	v_n = R.coerce(R.coerce(R.get_value((c).fields.get("focusableCandidates"), "length"), "int"), "int")
	v_start = R.coerce(v_i, "int")
	while R.truth(true):
		pass
		if R.truth(v_shiftKey):
			pass
			v_i = R.signed32(v_i - 1)
		else:
			pass
			v_i = R.signed32(v_i + 1)
		if R.truth(v_bSearchAll):
			pass
			if R.truth((v_shiftKey and (float(v_i) < float(0)))):
				pass
				break
			if R.truth((R.unary("!", v_shiftKey) and (float(v_i) == float(v_n)))):
				pass
				break
		else:
			pass
			v_i = R.coerce(R.coerce(R.binary("%", (float(v_i) + float(v_n)), v_n), "int"), "int")
			if R.truth((float(v_start) == float(v_i))):
				pass
				break
		if R.truth(R.call_member(c, "isValidFocusCandidate", [R.get_value((c).fields.get("focusableCandidates"), v_i), v_groupName])):
			pass
			v_o = R.coerce(R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.call_member(c, "findFocusManagerComponent", [R.get_value((c).fields.get("focusableCandidates"), v_i)])]), "DisplayObject")
			if R.truth(R.binary("is", v_o, R.klass("fl.managers.IFocusManagerGroup"))):
				pass
				v_tg1 = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_o]), "IFocusManagerGroup")
				v_j = R.coerce(0, "int")
				while R.truth(R.binary("<", v_j, R.get_value((c).fields.get("focusableCandidates"), "length"))):
					pass
					v_obj = R.coerce(R.get_value((c).fields.get("focusableCandidates"), v_j), "DisplayObject")
					if R.truth(R.binary("is", v_obj, R.klass("fl.managers.IFocusManagerGroup"))):
						pass
						v_tg2 = R.coerce(R.invoke(R.klass("fl.managers.IFocusManagerGroup"), [v_obj]), "IFocusManagerGroup")
						if R.truth(R.logical_and(R.binary("==", R.get_value(v_tg2, "groupName"), R.get_value(v_tg1, "groupName")), func(): return R.get_value(v_tg2, "selected"))):
							pass
							v_i = R.coerce(v_j, "int")
							break
					v_j = R.signed32(v_j + 1)
			return v_i
	return v_i
	return null

static func f_sortFocusableObjects(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_c: Variant = null
	v_o = R.coerce(null, "Object")
	v_c = R.coerce(null, "InteractiveObject")
	(c).fields["focusableCandidates"] = R.coerce([], "Array")
	for __t3 in R.iterate((c).fields.get("focusableObjects"), false):
		v_o = R.coerce(__t3, "Object")
		v_c = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o]), "InteractiveObject")
		if R.truth(((R.truth(R.get_value(v_c, "tabIndex")) and R.truth(R.unary("!", R.invoke(R.resolve(c, "isNaN", "fl.managers.FocusManager"), [R.num(R.get_value(v_c, "tabIndex"))])))) and R.binary(">", R.get_value(v_c, "tabIndex"), 0))):
			pass
			R.call_member(c, "sortFocusableObjectsTabIndex", [])
			return null
		R.invoke(R.get_value((c).fields.get("focusableCandidates"), "push"), [v_c])
	R.invoke(R.get_value((c).fields.get("focusableCandidates"), "sort"), [R.get_value(c, "sortByDepth")])
	return null

static func f_sortFocusableObjectsTabIndex(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	var v_c: Variant = null
	v_o = R.coerce(null, "Object")
	v_c = R.coerce(null, "InteractiveObject")
	(c).fields["focusableCandidates"] = R.coerce([], "Array")
	for __t4 in R.iterate((c).fields.get("focusableObjects"), false):
		v_o = R.coerce(__t4, "Object")
		v_c = R.coerce(R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [v_o]), "InteractiveObject")
		if R.truth((R.truth(R.get_value(v_c, "tabIndex")) and R.unary("!", R.invoke(R.resolve(c, "isNaN", "fl.managers.FocusManager"), [R.num(R.get_value(v_c, "tabIndex"))])))):
			pass
			R.invoke(R.get_value((c).fields.get("focusableCandidates"), "push"), [v_c])
	R.invoke(R.get_value((c).fields.get("focusableCandidates"), "sort"), [R.get_value(c, "sortByTabIndex")])
	return null

static func f_sortByDepth(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"index": "int", "tmp": "String", "tmp2": "String", "val1": "String", "val2": "String", "zeros": "String", "a": "DisplayObject", "b": "DisplayObject", "se1": "SecurityError", "se2": "SecurityError", "aa": "InteractiveObject", "bb": "InteractiveObject"}
	l["index"] = 0
	l["tmp"] = null
	l["tmp2"] = null
	l["val1"] = null
	l["val2"] = null
	l["zeros"] = null
	l["a"] = null
	l["b"] = null
	l["se1"] = null
	l["se2"] = null
	l["aa"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	l["bb"] = R.coerce((a[1] if a.size() > 1 else null), "InteractiveObject")
	R.lset(l, "index", 0)
	R.lset(l, "tmp", null)
	R.lset(l, "tmp2", null)
	R.lset(l, "val1", "")
	R.lset(l, "val2", "")
	R.lset(l, "zeros", "0000")
	R.lset(l, "a", R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.lget(l, "aa")]))
	R.lset(l, "b", R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.lget(l, "bb")]))
	R.last_error = null
	while R.truth((R.binary("!=", R.lget(l, "a"), R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")])) and R.truth(R.get_value(R.lget(l, "a"), "parent")))):
		pass
		R.lset(l, "index", R.call_member(c, "getChildIndex", [R.get_value(R.lget(l, "a"), "parent"), R.lget(l, "a")]), "=")
		R.lset(l, "tmp", R.invoke(R.get_value(R.lget(l, "index"), "toString"), [16]), "=")
		if R.truth(R.binary("<", R.get_value(R.lget(l, "tmp"), "length"), 4)):
			pass
			R.lset(l, "tmp2", R.binary("+", R.invoke(R.get_value(R.lget(l, "zeros"), "substring"), [0, (float(4) - R.num(R.get_value(R.lget(l, "tmp"), "length")))]), R.lget(l, "tmp")), "=")
		R.lset(l, "val1", R.binary("+", R.lget(l, "tmp2"), R.lget(l, "val1")), "=")
		R.lset(l, "a", R.get_value(R.lget(l, "a"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se1", R.last_error)
		R.last_error = null
		pass
	R.last_error = null
	while R.truth((R.binary("!=", R.lget(l, "b"), R.invoke(R.resolve(c, "DisplayObject", "fl.managers.FocusManager"), [R.get_value(c, "form")])) and R.truth(R.get_value(R.lget(l, "b"), "parent")))):
		pass
		R.lset(l, "index", R.call_member(c, "getChildIndex", [R.get_value(R.lget(l, "b"), "parent"), R.lget(l, "b")]), "=")
		R.lset(l, "tmp", R.invoke(R.get_value(R.lget(l, "index"), "toString"), [16]), "=")
		if R.truth(R.binary("<", R.get_value(R.lget(l, "tmp"), "length"), 4)):
			pass
			R.lset(l, "tmp2", R.binary("+", R.invoke(R.get_value(R.lget(l, "zeros"), "substring"), [0, (float(4) - R.num(R.get_value(R.lget(l, "tmp"), "length")))]), R.lget(l, "tmp")), "=")
		R.lset(l, "val2", R.binary("+", R.lget(l, "tmp2"), R.lget(l, "val2")), "=")
		R.lset(l, "b", R.get_value(R.lget(l, "b"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se2", R.last_error)
		R.last_error = null
		pass
	return (1 if R.truth(R.binary(">", R.lget(l, "val1"), R.lget(l, "val2"))) else (R.unary("-", 1) if R.truth(R.binary("<", R.lget(l, "val1"), R.lget(l, "val2"))) else 0))
	return null

static func f_getChildIndex(c: Variant, a: Array) -> Variant:
	var v_parent: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	var v_child: Variant = R.coerce((a[1] if a.size() > 1 else null), "DisplayObject")
	return R.invoke(R.get_value(v_parent, "getChildIndex"), [v_child])
	return null

static func f_sortByTabIndex(c: Variant, a: Array) -> Variant:
	var v_a: Variant = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	var v_b: Variant = R.coerce((a[1] if a.size() > 1 else null), "InteractiveObject")
	return (1 if R.truth(R.binary(">", R.get_value(v_a, "tabIndex"), R.get_value(v_b, "tabIndex"))) else (R.unary("-", 1) if R.truth(R.binary("<", R.get_value(v_a, "tabIndex"), R.get_value(v_b, "tabIndex"))) else R.coerce(R.call_member(c, "sortByDepth", [v_a, v_b]), "int")))
	return null

static func f_get_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_defaultButtonEnabled")
	return null

static func f_set_defaultButtonEnabled(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_defaultButtonEnabled"] = v_value
	return null

static func f_get_nextTabIndex(c: Variant, a: Array) -> Variant:
	return 0
	return null

static func f_get_showFocusIndicator(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_showFocusIndicator")
	return null

static func f_set_showFocusIndicator(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else false), "Boolean")
	(c).fields["_showFocusIndicator"] = v_value
	return null

static func f_get_form(c: Variant, a: Array) -> Variant:
	return (c).fields.get("_form")
	return null

static func f_set_form(c: Variant, a: Array) -> Variant:
	var v_value: Variant = R.coerce((a[0] if a.size() > 0 else null), "DisplayObjectContainer")
	(c).fields["_form"] = R.coerce(v_value, "DisplayObjectContainer")
	return null

static func f_getFocus(c: Variant, a: Array) -> Variant:
	var v_o: Variant = null
	v_o = R.coerce(R.get_value(R.get_value(R.get_value(c, "form"), "stage"), "focus"), "InteractiveObject")
	return R.call_member(c, "findFocusManagerComponent", [v_o])
	return null

static func f_setFocus(c: Variant, a: Array) -> Variant:
	var v_component: Variant = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	if R.truth(R.binary("is", v_component, R.klass("fl.managers.IFocusManagerComponent"))):
		pass
		R.invoke(R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [v_component]), "setFocus"), [])
	else:
		pass
		R.set_value(R.get_value(R.get_value(c, "form"), "stage"), "focus", v_component, "=")
	return null

static func f_showFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_hideFocus(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_findFocusManagerComponent(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"p": "InteractiveObject", "se": "SecurityError", "component": "InteractiveObject"}
	l["p"] = null
	l["se"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	R.lset(l, "p", R.lget(l, "component"))
	R.last_error = null
	while R.truth(R.lget(l, "component")):
		pass
		if R.truth(R.logical_and(R.binary("is", R.lget(l, "component"), R.klass("fl.managers.IFocusManagerComponent")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "component")]), "focusEnabled"))):
			pass
			return R.lget(l, "component")
		R.lset(l, "component", R.get_value(R.lget(l, "component"), "parent"), "=")
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return R.lget(l, "p")
	return null

static func f_getTopLevelFocusTarget(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"se": "SecurityError", "o": "InteractiveObject"}
	l["se"] = null
	l["o"] = R.coerce((a[0] if a.size() > 0 else null), "InteractiveObject")
	R.last_error = null
	while R.truth(R.binary("!=", R.lget(l, "o"), R.invoke(R.resolve(c, "InteractiveObject", "fl.managers.FocusManager"), [R.get_value(c, "form")]))):
		pass
		if R.truth(R.logical_and(R.logical_and(R.logical_and(R.binary("is", R.lget(l, "o"), R.klass("fl.managers.IFocusManagerComponent")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "o")]), "focusEnabled")), func(): return R.get_value(R.invoke(R.klass("fl.managers.IFocusManagerComponent"), [R.lget(l, "o")]), "mouseFocusEnabled")), func(): return R.get_value(R.invoke(R.klass("fl.core.UIComponent"), [R.lget(l, "o")]), "enabled"))):
			pass
			return R.lget(l, "o")
		R.lset(l, "o", R.get_value(R.lget(l, "o"), "parent"), "=")
		if R.truth(R.binary("==", R.lget(l, "o"), null)):
			pass
			break
	if R.last_error != null:
		R.lset(l, "se", R.last_error)
		R.last_error = null
		pass
	return null
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["_form"] = R.coerce(null, "DisplayObjectContainer")
	(c).fields["focusableObjects"] = R.coerce(null, "Dictionary")
	(c).fields["focusableCandidates"] = R.coerce(null, "Array")
	(c).fields["activated"] = false
	(c).fields["calculateCandidates"] = true
	(c).fields["lastFocus"] = R.coerce(null, "InteractiveObject")
	(c).fields["_showFocusIndicator"] = true
	(c).fields["lastAction"] = R.coerce(null, "String")
	(c).fields["defButton"] = R.coerce(null, "Button")
	(c).fields["_defaultButton"] = R.coerce(null, "Button")
	(c).fields["_defaultButtonEnabled"] = true
	return null
