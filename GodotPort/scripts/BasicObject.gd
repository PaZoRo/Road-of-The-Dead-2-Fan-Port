extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_BasicObject(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "BasicObject"), [])
	if R.truth(R.binary("==", R.get_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), [])), null)):
		pass
		R.set_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []), 0, "=")
	(c).fields["m_szName"] = R.coerce(R.binary("+", R.binary("+", R.invoke(R.resolve(c, "toString", "BasicObject"), []), "_"), R.get_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []))), "String")
	R.set_value(R.static_value("BasicObject", "GObjectClassCount"), R.invoke(R.resolve(c, "toString", "BasicObject"), []), 1, "+=")
	(c).fields["m_properties"] = R.coerce(R.construct(R.klass("Array"), []), "Array")
	R.call_member(c, "RegisterProperties", [])
	return null

static func f_ResetClassCounts(c: Variant, a: Array) -> Variant:
	R.assign(c, "GObjectClassCount", "BasicObject", R.construct(R.resolve(c, "Object", "BasicObject"), []), "=")
	return null

static func f_RegisterProperties(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_GetName(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_szName")
	return null

static func f_SaveState(c: Variant, a: Array) -> Variant:
	var v_propertyItem: Variant = null
	var v_newSaveObject: Variant = null
	var v_i: Variant = 0
	var v_saveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_propertyItem = R.coerce(null, "Object")
	v_newSaveObject = R.coerce(R.construct(R.resolve(c, "Object", "BasicObject"), []), "Object")
	v_i = R.coerce(0, "int")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_properties"), "length"))):
		pass
		v_propertyItem = R.coerce(R.get_value((c).fields.get("m_properties"), v_i), "Object")
		R.set_value(v_newSaveObject, R.get_value(v_propertyItem, "m_szName"), R.invoke(R.get_value(v_propertyItem, "m_getterFunction"), []), "=")
		v_i = R.signed32(v_i + 1)
	R.set_value(v_saveData, R.call_member(c, "GetName", []), v_newSaveObject, "=")
	return null

static func f_LoadState(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_propertyItem: Variant = null
	var v_saveObject: Variant = null
	var v_saveData: Variant = R.coerce((a[0] if a.size() > 0 else null), "Object")
	v_i = R.coerce(0, "int")
	v_propertyItem = R.coerce(null, "Object")
	v_saveObject = R.coerce(R.get_value(v_saveData, R.call_member(c, "GetName", [])), "Object")
	if R.truth(v_saveObject):
		pass
		v_i = R.coerce(0, "int")
		while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("m_properties"), "length"))):
			pass
			v_propertyItem = R.coerce(R.get_value((c).fields.get("m_properties"), v_i), "Object")
			R.invoke(R.get_value(v_propertyItem, "m_setterFunction"), [R.get_value(v_saveObject, R.get_value(v_propertyItem, "m_szName"))])
			v_i = R.signed32(v_i + 1)
	return null

static func f_DispatchEvent(c: Variant, a: Array) -> Variant:
	var v_szEvent: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	R.invoke(R.resolve(c, "dispatchEvent", "BasicObject"), [R.construct(R.klass("Event"), [v_szEvent])])
	return null

static func f_DispatchEventObject(c: Variant, a: Array) -> Variant:
	var v_eventObject: Variant = R.coerce((a[0] if a.size() > 0 else null), "Event")
	R.invoke(R.resolve(c, "dispatchEvent", "BasicObject"), [v_eventObject])
	return null

static func f_RegisterProperty(c: Variant, a: Array) -> Variant:
	var v_newProperty: Variant = null
	var v_szPropertyName: Variant = R.coerce((a[0] if a.size() > 0 else null), "String")
	var v_iPropertyType: Variant = R.coerce((a[1] if a.size() > 1 else 0), "int")
	var v_iPersistenceLevel: Variant = R.coerce((a[2] if a.size() > 2 else 0), "int")
	var v_setterFunction: Variant = R.coerce((a[3] if a.size() > 3 else null), "Function")
	var v_getterFunction: Variant = R.coerce((a[4] if a.size() > 4 else null), "Function")
	v_newProperty = R.coerce(R.construct(R.resolve(c, "Object", "BasicObject"), []), "Object")
	R.set_value(v_newProperty, "m_szName", v_szPropertyName, "=")
	R.set_value(v_newProperty, "m_iType", v_iPropertyType, "=")
	R.set_value(v_newProperty, "m_iPersistenceLevel", v_iPersistenceLevel, "=")
	R.set_value(v_newProperty, "m_setterFunction", v_setterFunction, "=")
	R.set_value(v_newProperty, "m_getterFunction", v_getterFunction, "=")
	R.invoke(R.get_value((c).fields.get("m_properties"), "push"), [v_newProperty])
	return null

static func f_GetProperties(c: Variant, a: Array) -> Variant:
	return (c).fields.get("m_properties")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	R.set_value(c, "PropertyType_Int", 0, "=")
	R.set_value(c, "PropertyType_Number", 1, "=")
	R.set_value(c, "PropertyType_String", 2, "=")
	R.set_value(c, "PropertyType_Boolean", 3, "=")
	R.set_value(c, "GObjectClassCount", R.construct(R.resolve(c, "Object", "BasicObject"), []), "=")
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["m_szName"] = R.coerce(null, "String")
	(c).fields["m_properties"] = R.coerce(null, "Array")
	return null
