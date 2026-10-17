extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func basic_constructor(c: R.Value, a: Array) -> Variant:

	if R.classes.has("Object") or R.classes.has("EventDispatcher") or R.base_of("BasicObject") not in ["Object", "EventDispatcher"] or c.fields.has("toString") or R.field_owner(c.class_id, "toString") != "" or R.method_owner(c.class_id, "toString") != "": return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var to_string: Variant = R.resolve(c, "toString", "BasicObject")
	if not to_string is Dictionary or to_string.get("@native") != "toString" or to_string.get("receiver") != c: return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var counts: Variant = R.static_value("BasicObject", "GObjectClassCount")
	if not counts is Dictionary or counts.has("@class"): return R.implementation_source(c, "BasicObject", "BasicObject", a)
	var name: String = R.string(c)
	if R.equal(counts.get(name), null): counts[name] = 0
	c.fields["m_szName"] = R.coerce(R.binary("+", name + "_", counts.get(name)), "String")
	counts[name] = R.binary("+", counts.get(name), 1)
	c.fields["m_properties"] = []
	R.call_member(c, "RegisterProperties", [])
	return null
