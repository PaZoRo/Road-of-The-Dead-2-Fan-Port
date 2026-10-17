extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_StyleManager(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "fl.managers.StyleManager"), [])
	(c).fields["styleToClassesHash"] = R.coerce({}, "Object")
	(c).fields["classToInstancesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["classToStylesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["classToDefaultStylesDict"] = R.coerce(R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "Dictionary")
	(c).fields["globalStyles"] = R.coerce(R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "Object")
	return null

static func f_getInstance(c: Variant, a: Array) -> Variant:
	if R.truth(R.binary("==", R.static_value("fl.managers.StyleManager", "_instance"), null)):
		pass
		R.assign(c, "_instance", "fl.managers.StyleManager", R.construct(R.klass("fl.managers.StyleManager"), []), "=")
	return R.static_value("fl.managers.StyleManager", "_instance")
	return null

static func f_registerInstance(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"target": "Class", "defaultStyles": "Object", "styleToClasses": "Object", "n": "String", "inst": "StyleManager", "classDef": "Class", "err": "Error", "e": "Error", "instance": "UIComponent"}
	l["target"] = null
	l["defaultStyles"] = null
	l["styleToClasses"] = null
	l["n"] = null
	l["inst"] = null
	l["classDef"] = null
	l["err"] = null
	l["e"] = null
	l["instance"] = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	R.lset(l, "target", null)
	R.lset(l, "defaultStyles", null)
	R.lset(l, "styleToClasses", null)
	R.lset(l, "n", null)
	R.lset(l, "inst", R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []))
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [R.lget(l, "instance")]))
	if R.truth(R.binary("==", R.lget(l, "classDef"), null)):
		pass
		return null
	if R.truth(R.binary("==", R.get_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef")), null)):
		pass
		R.set_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef"), R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "=")
		R.lset(l, "target", R.lget(l, "classDef"), "=")
		while R.truth(R.binary("==", R.lget(l, "defaultStyles"), null)):
			pass
			if R.truth(R.binary("!=", R.get_value(R.lget(l, "target"), "getStyleDefinition"), null)):
				pass
				R.lset(l, "defaultStyles", R.invoke(R.get_value(R.lget(l, "target"), "getStyleDefinition"), []), "=")
				break
			R.last_error = null
			R.lset(l, "target", R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(R.lget(l, "instance"), "loaderInfo"), "applicationDomain"), "getDefinition"), [R.invoke(R.resolve(c, "getQualifiedSuperclassName", "fl.managers.StyleManager"), [R.lget(l, "target")])]), R.resolve(c, "Class", "fl.managers.StyleManager")), "=")
			if R.last_error != null:
				R.lset(l, "err", R.last_error)
				R.last_error = null
				R.last_error = null
				R.lset(l, "target", R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "getQualifiedSuperclassName", "fl.managers.StyleManager"), [R.lget(l, "target")])]), R.resolve(c, "Class", "fl.managers.StyleManager")), "=")
				if R.last_error != null:
					R.lset(l, "e", R.last_error)
					R.last_error = null
					R.lset(l, "defaultStyles", R.call_static("fl.core.UIComponent", "getStyleDefinition", []), "=")
					break
		R.lset(l, "styleToClasses", (R.lget(l, "inst")).fields.get("styleToClassesHash"), "=")
		for __t1 in R.iterate(R.lget(l, "defaultStyles"), false):
			R.lset(l, "n", __t1, "=")
			if R.truth(R.binary("==", R.get_value(R.lget(l, "styleToClasses"), R.lget(l, "n")), null)):
				pass
				R.set_value(R.lget(l, "styleToClasses"), R.lget(l, "n"), R.construct(R.resolve(c, "Dictionary", "fl.managers.StyleManager"), [true]), "=")
			R.set_value(R.get_value(R.lget(l, "styleToClasses"), R.lget(l, "n")), R.lget(l, "classDef"), true, "=")
		R.set_value((R.lget(l, "inst")).fields.get("classToDefaultStylesDict"), R.lget(l, "classDef"), R.lget(l, "defaultStyles"), "=")
		if R.truth(R.binary("==", R.get_value((R.lget(l, "inst")).fields.get("classToStylesDict"), R.lget(l, "classDef")), null)):
			pass
			R.set_value((R.lget(l, "inst")).fields.get("classToStylesDict"), R.lget(l, "classDef"), {}, "=")
	R.set_value(R.get_value((R.lget(l, "inst")).fields.get("classToInstancesDict"), R.lget(l, "classDef")), R.lget(l, "instance"), true, "=")
	R.invoke(R.resolve(c, "setSharedStyles", "fl.managers.StyleManager"), [R.lget(l, "instance")])
	return null

static func f_setSharedStyles(c: Variant, a: Array) -> Variant:
	var v_n: Variant = null
	var v_inst: Variant = null
	var v_classDef: Variant = null
	var v_styles: Variant = null
	var v_instance: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	v_n = R.coerce(null, "String")
	v_inst = R.coerce(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "StyleManager")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_instance]), "Class")
	v_styles = R.coerce(R.get_value((v_inst).fields.get("classToDefaultStylesDict"), v_classDef), "Object")
	for __t2 in R.iterate(v_styles, false):
		v_n = R.coerce(__t2, "String")
		R.call_member(v_instance, "setSharedStyle", [v_n, R.invoke(R.resolve(c, "getSharedStyle", "fl.managers.StyleManager"), [v_instance, v_n])])
	return null

static func f_getSharedStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_inst: Variant = null
	var v_style: Variant = null
	var v_instance: Variant = R.coerce((a[0] if a.size() > 0 else null), "UIComponent")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_instance]), "Class")
	v_inst = R.coerce(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "StyleManager")
	v_style = R.coerce(R.get_value(R.get_value((v_inst).fields.get("classToStylesDict"), v_classDef), v_name), "Object")
	if R.truth(R.binary("!=", v_style, null)):
		pass
		return v_style
	v_style = R.coerce(R.get_value((v_inst).fields.get("globalStyles"), v_name), "Object")
	if R.truth(R.binary("!=", v_style, null)):
		pass
		return v_style
	return R.get_value(R.get_value((v_inst).fields.get("classToDefaultStylesDict"), v_classDef), v_name)
	return null

static func f_getComponentStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_styleHash: Variant = null
	var v_component: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_component]), "Class")
	v_styleHash = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), v_classDef), "Object")
	return (null if R.truth(R.binary("==", v_styleHash, null)) else R.get_value(v_styleHash, v_name))
	return null

static func f_clearComponentStyle(c: Variant, a: Array) -> Variant:
	var v_classDef: Variant = null
	var v_styleHash: Variant = null
	var v_component: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_classDef = R.coerce(R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [v_component]), "Class")
	v_styleHash = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), v_classDef), "Object")
	if R.truth((R.binary("!=", v_styleHash, null) and R.binary("!=", R.get_value(v_styleHash, v_name), null))):
		pass
		R.delete_value(v_styleHash, v_name)
		R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [v_classDef, v_name])
	return null

static func f_setComponentStyle(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"classDef": "Class", "styleHash": "Object", "component": "Object", "name": "String", "style": "Object"}
	l["classDef"] = null
	l["styleHash"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	l["name"] = R.coerce((a[1] if a.size() > 1 else null), "String")
	l["style"] = R.coerce((a[2] if a.size() > 2 else null), "Object")
	R.lset(l, "classDef", R.invoke(R.resolve(c, "getClassDef", "fl.managers.StyleManager"), [R.lget(l, "component")]))
	R.lset(l, "styleHash", R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), R.lget(l, "classDef")))
	if R.truth(R.binary("==", R.lget(l, "styleHash"), null)):
		pass
		R.lset(l, "styleHash", R.set_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToStylesDict"), R.lget(l, "classDef"), {}, "="), "=")
	if R.truth(R.binary("==", R.lget(l, "styleHash"), R.lget(l, "style"))):
		pass
		return null
	R.set_value(R.lget(l, "styleHash"), R.lget(l, "name"), R.lget(l, "style"), "=")
	R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [R.lget(l, "classDef"), R.lget(l, "name")])
	return null

static func f_getClassDef(c: Variant, a: Array) -> Variant:
	var l: Dictionary = {}
	l["@types"] = {"e": "Error", "component": "Object"}
	l["e"] = null
	l["component"] = R.coerce((a[0] if a.size() > 0 else null), "Object")
	if R.truth(R.binary("is", R.lget(l, "component"), R.resolve(c, "Class", "fl.managers.StyleManager"))):
		pass
		return R.binary("as", R.lget(l, "component"), R.resolve(c, "Class", "fl.managers.StyleManager"))
	R.last_error = null
	return R.binary("as", R.invoke(R.resolve(c, "getDefinitionByName", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "getQualifiedClassName", "fl.managers.StyleManager"), [R.lget(l, "component")])]), R.resolve(c, "Class", "fl.managers.StyleManager"))
	if R.last_error != null:
		R.lset(l, "e", R.last_error)
		R.last_error = null
		if R.truth(R.binary("is", R.lget(l, "component"), R.klass("fl.core.UIComponent"))):
			pass
			R.last_error = null
			return R.binary("as", R.invoke(R.get_value(R.get_value(R.get_value(R.lget(l, "component"), "loaderInfo"), "applicationDomain"), "getDefinition"), [R.invoke(R.resolve(c, "getQualifiedClassName", "fl.managers.StyleManager"), [R.lget(l, "component")])]), R.resolve(c, "Class", "fl.managers.StyleManager"))
			if R.last_error != null:
				R.lset(l, "e", R.last_error)
				R.last_error = null
				pass
	return null
	return null

static func f_invalidateStyle(c: Variant, a: Array) -> Variant:
	var v_classRef: Variant = null
	var v_classes: Variant = null
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	v_classRef = R.coerce(null, "Object")
	v_classes = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "styleToClassesHash"), v_name), "Dictionary")
	if R.truth(R.binary("==", v_classes, null)):
		pass
		return null
	for __t3 in R.iterate(v_classes, false):
		v_classRef = R.coerce(__t3, "Object")
		R.invoke(R.resolve(c, "invalidateComponentStyle", "fl.managers.StyleManager"), [R.invoke(R.resolve(c, "Class", "fl.managers.StyleManager"), [v_classRef]), v_name])
	return null

static func f_invalidateComponentStyle(c: Variant, a: Array) -> Variant:
	var v_obj: Variant = null
	var v_instance: Variant = null
	var v_instances: Variant = null
	var v_componentClass: Variant = R.coerce((a[0] if a.size() > 0 else null), "Class")
	var v_name: Variant = R.coerce((a[1] if a.size() > 1 else null), "String")
	v_obj = R.coerce(null, "Object")
	v_instance = R.coerce(null, "UIComponent")
	v_instances = R.coerce(R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "classToInstancesDict"), v_componentClass), "Dictionary")
	if R.truth(R.binary("==", v_instances, null)):
		pass
		return null
	for __t4 in R.iterate(v_instances, false):
		v_obj = R.coerce(__t4, "Object")
		v_instance = R.coerce(R.binary("as", v_obj, R.klass("fl.core.UIComponent")), "UIComponent")
		if R.truth(R.binary("!=", v_instance, null)):
			pass
			R.call_member(v_instance, "setSharedStyle", [v_name, R.invoke(R.resolve(c, "getSharedStyle", "fl.managers.StyleManager"), [v_instance, v_name])])
	return null

static func f_setStyle(c: Variant, a: Array) -> Variant:
	var v_styles: Variant = null
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_style: Variant = R.coerce((a[1] if a.size() > 1 else null), "Object")
	v_styles = R.coerce(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "globalStyles"), "Object")
	if R.truth((R.binary("===", R.get_value(v_styles, v_name), v_style) and R.unary("!", R.binary("is", v_style, R.klass("TextFormat"))))):
		pass
		return null
	R.set_value(v_styles, v_name, v_style, "=")
	R.invoke(R.resolve(c, "invalidateStyle", "fl.managers.StyleManager"), [v_name])
	return null

static func f_clearStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.resolve(c, "setStyle", "fl.managers.StyleManager"), [v_name, null])
	return null

static func f_getStyle(c: Variant, a: Array) -> Variant:
	var v_name: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	return R.get_value(R.get_value(R.invoke(R.resolve(c, "getInstance", "fl.managers.StyleManager"), []), "globalStyles"), v_name)
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "_instance", null, "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["styleToClassesHash"] = R.coerce(null, "Object")
	(c).fields["classToInstancesDict"] = R.coerce(null, "Dictionary")
	(c).fields["classToStylesDict"] = R.coerce(null, "Dictionary")
	(c).fields["classToDefaultStylesDict"] = R.coerce(null, "Dictionary")
	(c).fields["globalStyles"] = R.coerce(null, "Object")
	return null
