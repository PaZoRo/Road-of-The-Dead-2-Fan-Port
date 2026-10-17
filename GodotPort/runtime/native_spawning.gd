extends RefCounted
const R = preload("res://runtime/as_runtime.gd")

static func get_mc(_receiver: Variant, args: Array) -> Variant:
	R.ensure_statics("RDGame")
	var type: Variant = R.arg(args, 0)
	var pool: Variant = R.get_value(R.statics.RDGame.get("m_MovieClipsHash"), type)
	if not pool is Array: pool = null
	var clip: R.Value = pool[0] if pool != null and not pool.is_empty() else null
	if clip != null:
		pool.pop_front()
		R.call_member(clip, "gotoAndPlay", [1])
		R.set_value(clip, "alpha", 1);R.set_value(clip, "visible", true)
		R.set_value(clip, "x", 0);R.set_value(clip, "y", 0)
		R.set_value(clip, "scaleX", 1);R.set_value(clip, "scaleY", 1)
		R.set_value(clip, "rotation", 0);R.set_value(clip, "m_owner", null)
		var index: int = 0
		while index < R.num(R.get_value(clip, "numChildren")):
			R.set_value(R.call_member(clip, "getChildAt", [index]), "visible", true)
			index += 1
	else:
		clip = R.construct(type, [])
		if pool == null: R.set_value(R.statics.RDGame.get("m_MovieClipsHash"), type, [])
	return clip

static func get_entity(receiver: Variant, args: Array) -> Variant:
	R.ensure_statics("RDGame")
	var type: Variant = R.arg(args, 0)
	var pool: Variant = R.get_value(R.statics.RDGame.get("m_EntitiesHash"), type)
	if not pool is Array: pool = null
	var entity: R.Value = pool[0] if pool != null and not pool.is_empty() else null
	if entity != null:
		pool.pop_front();R.call_member(entity, "SetInitialState", [])
	else:
		entity = R.construct(type, [])
		if pool == null: R.set_value(R.statics.RDGame.get("m_EntitiesHash"), type, [])
	R.assign(receiver, "m_iEntitiesUsed", "RDGame", 1, "+=")
	return entity

static func init_mcs(entity: R.Value, args: Array) -> Variant:
	var f: Dictionary = entity.fields
	f.m_MC = R.call_static("RDGame", "GetMC", [R.arg(args, 0)])
	R.set_value(f.m_MC, "m_owner", entity)
	R.set_value(f.m_MC, "mouseEnabled", false);R.set_value(f.m_MC, "mouseChildren", false);R.set_value(f.m_MC, "enabled", false)
	f.m_MainMC = R.call_static("RDGame", "GetMC", [R.klass("MovieClip")])
	R.set_value(f.m_MainMC, "m_owner", entity)
	R.set_value(f.m_MainMC, "mouseEnabled", false);R.set_value(f.m_MainMC, "mouseChildren", false);R.set_value(f.m_MainMC, "enabled", false)
	R.call_member(f.m_MainMC, "addChild", [f.m_MC])
	f.m_EffectMC = R.call_static("RDGame", "GetMC", [R.klass("MovieClip")])
	R.set_value(f.m_EffectMC, "m_owner", entity)
	R.set_value(f.m_EffectMC, "mouseEnabled", false);R.set_value(f.m_EffectMC, "mouseChildren", false);R.set_value(f.m_EffectMC, "enabled", false)
	R.call_member(f.m_MainMC, "addChild", [f.m_EffectMC])
	var bounds: Variant = R.call_member(f.m_MC, "getBounds", [f.m_MC])
	f.m_Bounds = R.construct(R.klass("Box"), [])
	R.call_member(f.m_Bounds, "Set", [R.num(R.get_value(bounds, "left")) * f.m_fScale, - R.num(R.get_value(bounds, "bottom")) * f.m_fScale, 0, R.num(R.get_value(bounds, "width")) * f.m_fScale, R.num(R.get_value(bounds, "height")) * f.m_fScale, 0])
	f.m_fHeight = - R.num(R.get_value(bounds, "top")) * f.m_fScale
	return null

static func get_entity_node(world: R.Value, _args: Array) -> Variant:
	var pool: Array = world.fields.m_EntityNodesPool
	if pool.is_empty(): return R.construct(R.klass("RDEntityNode"), [])
	var node: R.Value = R.binary("as", pool.pop_back(), R.klass("RDEntityNode"))
	node.fields.m_Entity = null;node.fields.m_Next = null;node.fields.m_Previous = null
	return node

static func add_world_entity(world: R.Value, args: Array) -> Variant:
	var entity: R.Value = R.arg(args, 0)
	var position: R.Value = entity.fields.m_vLocation
	position.fields.X = R.num(R.arg(args, 1, NAN));position.fields.Y = R.num(R.arg(args, 2, NAN));position.fields.Z = R.num(R.arg(args, 3, NAN))
	var node: R.Value = R.call_member(world, "GetEntityNode", [])
	node.fields.m_Entity = entity;node.fields.m_Next = world.fields.m_FirstEntity
	if world.fields.m_FirstEntity != null: (world.fields.m_FirstEntity as R.Value).fields.m_Previous = node
	world.fields.m_FirstEntity = node
	(world.fields.m_Entities as Array).append(node)
	entity.fields.m_EntityNode = node
	R.call_member(entity, "SetWorld", [world])
	R.call_member(world, "AddEntityToLayer", [entity])
	R.call_member(entity, "UpdateDepthPosition", [])
	R.call_member(world, "AddEntityToNavMesh", [entity])
	R.call_member(entity, "OnAddedToWorld", [])
	if R.section_publication.get("section_open", false):
		var main: R.Value = entity.fields.get("m_MainMC")
		if main != null:
			main.fields["@section_pending"] = true;main.display.visible = false
			R.section_publication.publication.append(weakref(main))
	return null

static func add_game_entity(game: R.Value, args: Array) -> Variant:
	var entity: R.Value = R.arg(args, 0)
	R.call_member(game.fields.m_World, "AddEntity", [entity, R.num(R.arg(args, 1, NAN)), R.num(R.arg(args, 2, NAN)), R.num(R.arg(args, 3, NAN))])
	if game.fields.m_CurrentGameMode != null: R.call_member(game.fields.m_CurrentGameMode, "OnEntityAdded", [entity])
	return null
