extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
const S=preload("res://runtime/native_spawning.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)

static func f_noop(_c:Variant,_a:Array) -> Variant:return null
static func f_init(c:Variant,_a:Array) -> Variant:c.fields={"reset_calls":0,"constructor_calls":0};return null
static func f_constructor(c:Variant,_a:Array) -> Variant:c.fields.constructor_calls+=1;c.fields.random_value=randf();return null
static func f_reset(c:Variant,_a:Array) -> Variant:c.fields.reset_calls+=1;c.fields.random_value=randf();return null
static func f_world(c:Variant,a:Array) -> Variant:
	c.fields.trace.append("SetWorld");c.fields.m_World=a[0]
	if c.fields.replace:
		c.fields=c.fields.duplicate();a[0].fields=a[0].fields.duplicate();a[0].fields.marker=19
	return null
static func f_layer(c:Variant,a:Array) -> Variant:c.fields.trace.append("AddEntityToLayer");c.fields.marker+=1;a[0].fields.layer_seen=true;return null
static func f_depth(c:Variant,_a:Array) -> Variant:c.fields.trace.append("UpdateDepthPosition");c.fields.depth_seen=c.fields.m_vLocation.fields.Z;return null
static func f_nav(c:Variant,_a:Array) -> Variant:c.fields.trace.append("AddEntityToNavMesh");return null
static func f_added(c:Variant,_a:Array) -> Variant:c.fields.trace.append("OnAddedToWorld");return null
static func f_mode(c:Variant,a:Array) -> Variant:c.fields.trace.append("OnEntityAdded");a[0].fields.mode_seen=true;return null

func register(name:String,base:String,methods:Dictionary) -> void:
	methods.init_statics=["f_noop",true]
	R.classes[name]={"path":"res://tests/spawning_suite.gd","base":base,"methods":methods,"fields":{},"field_types":{},"imports":[],"passive":false,"empty_methods":["init_statics"]}

func image_tree(clip:R.Value,level:int=0) -> Array:
	var output:Array=[clip.class_id,clip.symbol,clip.kind,clip.frame,clip.playing,clip.applied_frame,clip.display.transform,clip.display.modulate,clip.display.visible,clip.fields.get("mouseEnabled"),clip.fields.get("mouseChildren"),clip.fields.get("enabled"),clip.fields.get("m_owner")!=null]
	if level<8:
		var children:Array=[]
		for child in clip.children:children.append(image_tree(child,level+1))
		output.append(children)
	return output

func clip_case(name:String,mode:int,native:bool) -> Dictionary:
	R.statics.RDGame.m_MovieClipsHash={}
	var type:Variant=R.klass(name);var first:R.Value=null;var second:R.Value=null
	if mode==1:R.set_value(R.statics.RDGame.m_MovieClipsHash,type,[])
	elif mode==2:
		first=R.construct(type,[]);second=R.construct(type,[])
		R.call_member(first,"gotoAndStop",[mini(2,int(first.timeline.get("count",1)))])
		for pair in [["x",17.0],["y",-9.0],["scaleX",-0.4],["scaleY",0.6],["rotation",18.0],["alpha",0.4],["visible",false],["m_owner",R.Value.new()]]:R.set_value(first,pair[0],pair[1])
		for i in int(R.get_value(first,"numChildren")):R.set_value(R.call_member(first,"getChildAt",[i]),"visible",false)
		R.set_value(R.statics.RDGame.m_MovieClipsHash,type,[first,second])
	elif mode==3:R.set_value(R.statics.RDGame.m_MovieClipsHash,type,{"bad_pool":true})
	seed(1009)
	var clip:R.Value=S.get_mc(R.klass("RDGame"),[type]) if native else R.source_method(R.klass("RDGame"),"RDGame","GetMC",[type])
	var next_random:float=randf();var pool:Array=R.get_value(R.statics.RDGame.m_MovieClipsHash,type)
	expect(mode!=2 or clip==first,"GetMC retains first pooled identity "+name)
	expect(mode!=2 or pool.size()==1 and pool[0]==second,"GetMC retains pool order "+name)
	return {"tree":image_tree(clip),"bounds":R.bounds(clip),"pool_size":pool.size(),"random":next_random}

func entity_case(mode:int,native:bool) -> Dictionary:
	R.statics.RDGame.m_EntitiesHash={};R.statics.RDGame.m_iEntitiesUsed=2147483647 if mode==3 else 7
	var type:Variant=R.klass("SpawnPoolProbe");var first:R.Value=null;var second:R.Value=null
	if mode==1:R.set_value(R.statics.RDGame.m_EntitiesHash,type,[])
	elif mode>=2:
		first=R.construct(type,[]);second=R.construct(type,[]);R.set_value(R.statics.RDGame.m_EntitiesHash,type,[first,second])
	seed(1209)
	var entity:R.Value=S.get_entity(R.klass("RDGame"),[type]) if native else R.source_method(R.klass("RDGame"),"RDGame","GetEntity",[type])
	var next_random:float=randf();var pool:Array=R.get_value(R.statics.RDGame.m_EntitiesHash,type)
	expect(mode<2 or entity==first,"GetEntity retains pooled identity")
	expect(mode<2 or pool.size()==1 and pool[0]==second,"GetEntity retains pool order")
	return {"fields":entity.fields.duplicate(),"pool_size":pool.size(),"used":R.statics.RDGame.m_iEntitiesUsed,"random":next_random}

func world_fixture(replace:bool) -> Dictionary:
	var trace:Array=[];var world:R.Value=R.Value.new();world.class_id="SpawnWorldProbe"
	var actor:R.Value=R.Value.new();actor.class_id="SpawnActorProbe"
	actor.fields={"trace":trace,"replace":replace,"m_vLocation":R.construct(R.klass("DTVector3D"),[1,2,3])}
	var previous:R.Value=R.construct(R.klass("RDEntityNode"),[])
	var pooled:R.Value=R.construct(R.klass("RDEntityNode"),[]);pooled.fields.m_Previous=previous;pooled.fields.m_Next=previous;pooled.fields.m_Entity=actor
	world.fields={"trace":trace,"marker":0,"m_FirstEntity":previous,"m_Entities":[previous],"m_EntityNodesPool":[pooled]}
	return {"world":world,"actor":actor,"previous":previous,"pooled":pooled,"trace":trace}

func world_case(sample:int,native:bool,game_add:bool) -> Array:
	var f:Dictionary=world_fixture(sample%2==0)
	var args:Array=[f.actor,float(sample)-3.25,0.125,float(sample)*31.7]
	if game_add:
		var game:R.Value=R.Value.new();game.class_id="RDGame";var mode:R.Value=R.Value.new();mode.class_id="SpawnModeProbe";mode.fields.trace=f.trace
		game.fields={"m_World":f.world,"m_CurrentGameMode":mode if sample%3!=0 else null}
		if native:S.add_game_entity(game,args)
		else:R.source_method(game,"RDGame","AddEntity",args)
	else:
		if native:S.add_world_entity(f.world,args)
		else:R.source_method(f.world,"RDWorld","AddEntity",args)
	var node:R.Value=f.actor.fields.m_EntityNode
	expect(node==f.pooled and node.fields.m_Previous==null and node.fields.m_Next==f.previous and f.previous.fields.m_Previous==node,"world insertion identity and links")
	expect(node.fields.m_Entity==f.actor and f.world.fields.m_FirstEntity==node,"world head identity")
	return [f.trace,f.actor.fields.m_vLocation.fields.duplicate(),f.actor.fields.depth_seen,f.world.fields.marker,f.world.fields.m_Entities.size(),f.world.fields.m_EntityNodesPool.size(),f.actor.fields.get("layer_seen"),f.actor.fields.get("mode_seen")]

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("RDGame")
	register("SpawnPoolProbe","Object",{"init_fields":["f_init",false],"SpawnPoolProbe":["f_constructor",false],"SetInitialState":["f_reset",false]})
	register("SpawnActorProbe","RDEntity",{"SetWorld":["f_world",false],"UpdateDepthPosition":["f_depth",false],"OnAddedToWorld":["f_added",false]})
	register("SpawnWorldProbe","RDWorld",{"AddEntityToLayer":["f_layer",false],"AddEntityToNavMesh":["f_nav",false]})
	register("SpawnModeProbe","Object",{"OnEntityAdded":["f_mode",false]})
	var cases:int=0
	for name in ["MovieClip","MC_Smoke","MC_Fire","MC_NewBuilding","MC_Bush2","MC_altmapletree","MC_VehicleMediumCar02","MC_ZombieNormalFemale","MC_electronicsign","MC_YellowLine"]:
		for mode in 4:
			expect(clip_case(name,mode,true)==clip_case(name,mode,false),"GetMC full tree and bounds "+name+" pool="+str(mode));cases+=1
		for scale in [0.01,0.25,1.0]:
			var snapshots:Array=[]
			for native in [false,true]:
				R.statics.RDGame.m_MovieClipsHash={};var entity:R.Value=R.Value.new();entity.class_id="RDEntity";entity.fields.m_fScale=scale;seed(321)
				if native:S.init_mcs(entity,[R.klass(name)])
				else:R.source_method(entity,"RDEntity","InitMCs",[R.klass(name)])
				var f:Dictionary=entity.fields
				expect(f.m_MC.fields.m_owner==entity and f.m_MainMC.fields.m_owner==entity and f.m_EffectMC.fields.m_owner==entity,"MC owner identities")
				expect(f.m_MainMC.children==[f.m_MC,f.m_EffectMC],"MC insertion order")
				snapshots.append([image_tree(f.m_MainMC),f.m_Bounds.fields.duplicate(),f.m_fHeight,randf()])
			expect(snapshots[0]==snapshots[1],"InitMCs full tree, flags, bounds and random "+name+" scale="+str(scale));cases+=1
		await process_frame
	for mode in 4:expect(entity_case(mode,true)==entity_case(mode,false),"GetEntity reset/count/random pool="+str(mode));cases+=1
	for sample in 24:
		for game_add in [false,true]:expect(world_case(sample,true,game_add)==world_case(sample,false,game_add),"entity addition callbacks and links sample="+str(sample)+" game="+str(game_add));cases+=1
	expect(R.warnings.is_empty(),"spawning dispatch warnings")
	print("TEST_SPAWNING_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)



