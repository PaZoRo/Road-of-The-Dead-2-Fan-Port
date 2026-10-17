extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func f_Timeline_69(c: Variant, a: Array) -> Variant:
	R.invoke(R.super_ref(c, "RoadOfTheDead_fla.Timeline_69"), [])
	R.invoke(R.resolve(c, "addFrameScript", "RoadOfTheDead_fla.Timeline_69"), [0, R.get_value(c, "frame1"), 9, R.get_value(c, "frame10")])
	return null

static func f_setListItems(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_listItems: Variant = R.coerce((a[0] if a.size() > 0 else null), "Array")
	if R.truth(R.unary("!", v_listItems)):
		pass
		(c).fields["_listItems"] = R.coerce([], "Array")
	else:
		pass
		(c).fields["_listItems"] = R.coerce(R.invoke(R.get_value(v_listItems, "concat"), []), "Array")
	v_i = R.coerce(0, "uint")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_listItems"), "length"))):
		pass
		if R.truth(R.binary("==", R.unary("typeof", R.get_value((c).fields.get("_listItems"), v_i)), "string")):
			pass
			R.set_value((c).fields.get("_listItems"), v_i, {"label": R.get_value((c).fields.get("_listItems"), v_i), "data": R.get_value((c).fields.get("_listItems"), v_i)}, "=")
		v_i = ((v_i + 1) & 4294967295)
	R.call_member(c, "setSelectedIndex", [0])
	return null

static func f_setSelectedItem(c: Variant, a: Array) -> Variant:
	var v_i: Variant = 0
	var v_data: Variant = R.coerce((a[0] if a.size() > 0 else null), "*")
	v_i = R.coerce(0, "uint")
	while R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_listItems"), "length"))):
		pass
		if R.truth(R.binary("==", R.get_value(R.get_value((c).fields.get("_listItems"), v_i), "data"), v_data)):
			pass
			R.call_member(c, "setSelectedIndex", [v_i])
			return null
		v_i = ((v_i + 1) & 4294967295)
	return null

static func f_setSelectedIndex(c: Variant, a: Array) -> Variant:
	var v_i: Variant = R.coerce((a[0] if a.size() > 0 else 0), "uint")
	if R.truth(R.binary("<", v_i, R.get_value((c).fields.get("_listItems"), "length"))):
		pass
		(c).fields["_selectedItem"] = R.coerce(R.get_value((c).fields.get("_listItems"), v_i), "Object")
		if R.truth((R.truth((c).fields.get("currentItem")) and R.truth(R.get_value((c).fields.get("currentItem"), "label")))):
			pass
			R.set_value(R.get_value((c).fields.get("currentItem"), "label"), "text", R.get_value((c).fields.get("_selectedItem"), "label"), "=")
	return null

static func f_hideList(c: Variant, a: Array) -> Variant:
	(c).fields["_listDown"] = false
	R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.Timeline_69"), ["sortUP"])
	return null

static func f__onListClick(c: Variant, a: Array) -> Variant:
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	(c).fields["_listDown"] = R.unary("!", (c).fields.get("_listDown"))
	if R.truth((c).fields.get("_listDown")):
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.Timeline_69"), ["sortDOWN"])
	else:
		pass
		R.invoke(R.resolve(c, "gotoAndStop", "RoadOfTheDead_fla.Timeline_69"), ["sortUP"])
	return null

static func f__onItemClick(c: Variant, a: Array) -> Variant:
	var v_clip: Variant = null
	var v_event: Variant = R.coerce((a[0] if a.size() > 0 else null), "MouseEvent")
	v_clip = R.coerce(R.binary("as", R.get_value(v_event, "currentTarget"), R.klass("MovieClip")), "MovieClip")
	if R.truth(R.get_value(v_clip, "item")):
		pass
		R.call_member(c, "setSelectedItem", [R.get_value(R.get_value(v_clip, "item"), "data")])
	if R.truth(((R.truth(R.logical_and(v_clip, func(): return R.resolve(c, "parent", "RoadOfTheDead_fla.Timeline_69"))) and R.truth(R.binary("is", R.resolve(c, "parent", "RoadOfTheDead_fla.Timeline_69"), R.klass("MovieClip")))) and R.truth(R.get_value(R.invoke(R.klass("MovieClip"), [R.resolve(c, "parent", "RoadOfTheDead_fla.Timeline_69")]), "_onListChange")))):
		pass
		R.invoke(R.get_value(R.invoke(R.klass("MovieClip"), [R.resolve(c, "parent", "RoadOfTheDead_fla.Timeline_69")]), "_onListChange"), [R.get_value(v_clip, "item")])
	return null

static func f_frame1(c: Variant, a: Array) -> Variant:
	R.invoke(R.resolve(c, "stop", "RoadOfTheDead_fla.Timeline_69"), [])
	if R.truth((c).fields.get("listButton")):
		pass
		R.invoke(R.get_value((c).fields.get("listButton"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onListClick")])
	if R.truth((c).fields.get("currentItem")):
		pass
		R.invoke(R.get_value((c).fields.get("currentItem"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onListClick")])
		if R.truth(R.get_value((c).fields.get("currentItem"), "label")):
			pass
			if R.truth((c).fields.get("_selectedItem")):
				pass
				R.set_value(R.get_value((c).fields.get("currentItem"), "label"), "text", R.get_value((c).fields.get("_selectedItem"), "label"), "=")
			else:
				pass
				R.set_value(R.get_value((c).fields.get("currentItem"), "label"), "text", "", "=")
	if R.truth(R.unary("!", (c).fields.get("_listItems"))):
		pass
		(c).fields["_listItems"] = R.coerce([], "Array")
	return null

static func f_frame10(c: Variant, a: Array) -> Variant:
	(c).fields["i"] = R.coerce(0, "uint")
	(c).fields["itemClip"] = R.coerce((c).fields.get("item0"), "MovieClip")
	while R.truth((c).fields.get("itemClip")):
		pass
		if R.truth(R.binary("<", (c).fields.get("i"), R.get_value((c).fields.get("_listItems"), "length"))):
			pass
			R.set_value((c).fields.get("itemClip"), "item", R.get_value((c).fields.get("_listItems"), (c).fields.get("i")), "=")
			R.set_value(R.get_value((c).fields.get("itemClip"), "label"), "text", R.get_value(R.get_value((c).fields.get("_listItems"), (c).fields.get("i")), "label"), "=")
			R.invoke(R.get_value((c).fields.get("itemClip"), "addEventListener"), [R.get_value(R.klass("MouseEvent"), "CLICK"), R.get_value(c, "_onItemClick")])
		else:
			pass
			R.set_value((c).fields.get("itemClip"), "visible", false, "=")
		R.set_value(c, "i", 1, "+=")
		(c).fields["itemClip"] = R.coerce(R.get_value(c, R.binary("+", "item", (c).fields.get("i"))), "MovieClip")
	return null

static func f_init_statics(c: Variant, a: Array) -> Variant:
	pass
	return null

static func f_init_fields(c: Variant, a: Array) -> Variant:
	(c).fields["item5"] = R.coerce(null, "MovieClip")
	(c).fields["item6"] = R.coerce(null, "MovieClip")
	(c).fields["listButton"] = R.coerce(null, "SimpleButton")
	(c).fields["item7"] = R.coerce(null, "MovieClip")
	(c).fields["item0"] = R.coerce(null, "MovieClip")
	(c).fields["currentItem"] = R.coerce(null, "MovieClip")
	(c).fields["item1"] = R.coerce(null, "MovieClip")
	(c).fields["item2"] = R.coerce(null, "MovieClip")
	(c).fields["item3"] = R.coerce(null, "MovieClip")
	(c).fields["item4"] = R.coerce(null, "MovieClip")
	(c).fields["_listItems"] = R.coerce(null, "Array")
	(c).fields["_listDown"] = false
	(c).fields["_selectedItem"] = R.coerce(null, "Object")
	(c).fields["i"] = R.coerce(0, "uint")
	(c).fields["itemClip"] = R.coerce(null, "MovieClip")
	return null
