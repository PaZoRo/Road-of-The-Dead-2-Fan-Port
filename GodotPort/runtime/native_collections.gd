extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func hat_constructor(c: R.Value, a: Array) -> Variant:
	var auto_refills: bool = R.truth(R.arg(a, 0, true))
	R.invoke(R.super_ref(c, "RandomHat"), [])
	c.fields.m_bAutoRefills = auto_refills;c.fields.m_Values = [];c.fields.m_HatValues = []
	return null

static func sequence_constructor(c: R.Value, _a: Array) -> Variant:
	R.invoke(R.super_ref(c, "SequentialArray"), [])
	c.fields.m_Values = [];c.fields.m_iIndex = 0
	return null

static func hat_clear(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "Clear", a)
	(c.fields.m_Values as Array).clear();(c.fields.m_HatValues as Array).clear()
	return null

static func hat_add(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "RandomHat", "AddValue", a)
	(c.fields.m_Values as Array).append(R.arg(a, 0))
	return null

static func hat_reset(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "Reset", a)
	var hat: Array = c.fields.m_HatValues;hat.clear()
	if not (c.fields.m_Values as Array).is_empty(): hat.append_array(c.fields.m_Values)
	return null

static func hat_get(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array or not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "GetRandomValue", a)
	var hat: Array = c.fields.m_HatValues
	if hat.is_empty():
		if not R.truth(c.fields.m_bAutoRefills): return null
		if not (c.fields.m_Values as Array).is_empty(): hat.append_array(c.fields.m_Values)

	var index: int = R.signed32(floorf(randf() * hat.size()))
	if index < 0 or index >= hat.size(): return null
	var value: Variant = hat[index];hat.remove_at(index)
	return value

static func hat_empty(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_HatValues is Array: return R.implementation_source(c, "RandomHat", "IsEmpty", a)
	return (c.fields.m_HatValues as Array).is_empty()

static func hat_size(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "RandomHat", "GetTotalNbValues", a)
	return (c.fields.m_Values as Array).size()

static func sequence_add(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "AddValue", a)
	(c.fields.m_Values as Array).append(R.arg(a, 0))
	return null

static func sequence_get(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "GetValue", a)
	if R.equal(c.fields.m_iIndex, (c.fields.m_Values as Array).size()): c.fields.m_iIndex = 0

	var values: Array = c.fields.m_Values
	var index: Variant = R.binary("-", R.set_value(c, "m_iIndex", 1, "+="), 1)
	return R.get_value(values, index)

static func sequence_size(c: R.Value, a: Array) -> Variant:
	if not c.fields.m_Values is Array: return R.implementation_source(c, "SequentialArray", "GetNbValues", a)
	return (c.fields.m_Values as Array).size()
