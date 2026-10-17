extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)
static func f_can(c:Variant,a:Array) -> Variant:return c.fields.allow and a[0].fields.allow
static func f_touch(c:Variant,a:Array) -> Variant:
	var other:R.Value=a[0];c.fields.trace.append(["Touched",c.fields.id,other.fields.id])
	var following:R.Value=c.fields.actors[(other.fields.id+1)%c.fields.actors.size()]
	match c.fields.action:
		"move":following.fields.m_vLocation.fields.Z=3.0
		"ignore":following.fields.m_iCollisionGroup=R.statics.RDEntity.CollisionGroup_None
		"redirect":other.fields.probe_node.fields.m_Next=following.fields.probe_node.fields.m_Next
		"stop":c.fields.m_vLocation.fields.Z=1.0
		"bounds":c.fields.m_CollisionBounds.fields.W=0.125;c.fields.m_CollisionBounds.fields.D=4.0
		"position":c.fields.m_vLocation.fields.X=2.0;c.fields.m_vLocation.fields.Y=-2.0
		"replace_bounds":
			var bounds:R.Value=R.construct(R.klass("Box"),[])
			bounds.fields={"X":-2.0,"Y":-2.0,"Z":1.0,"W":4.0,"H":4.0,"D":0.5};c.fields.m_CollisionBounds=bounds
		"replace_location":
			c.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[1.0,1.0,4.0])
		"replace_fields":c.fields=c.fields.duplicate()
	return null
static func f_by(c:Variant,a:Array) -> Variant:c.fields.trace.append(["TouchedBy",c.fields.id,a[0].fields.id]);return null

func actor(index:int,trace:Array) -> R.Value:
	var obj:R.Value=R.Value.new();obj.class_id="CollisionProbe"
	obj.fields={"id":index,"trace":trace,"allow":true,"action":"","m_EntityNode":null,"m_bDestroyMe":false,"m_Base":null,"m_iCollisionGroup":1,"m_AttachedEntities":[],"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,index]),"m_CollisionBounds":R.construct(R.klass("Box"),[])}
	obj.fields.m_CollisionBounds.fields={"X":-0.5,"Y":-0.5,"Z":0.0,"W":1.0,"H":1.0,"D":0.0}
	return obj

func fixture(sample:int) -> Dictionary:
	var world:R.Value=R.Value.new();world.class_id="RDWorld"
	var trace:Array=[];var actors:Array=[];var nodes:Array=[]
	for i in 16:actors.append(actor(i,trace));nodes.append(R.Value.new())
	var moving:R.Value=actors[0]
	for i in 16:
		var entity:R.Value=actors[i];entity.fields.actors=actors;entity.fields.probe_node=nodes[i]
		entity.fields.m_vLocation.fields={"X":float((i+sample)%3)-1.0,"Y":float((i+sample/2)%3)-1.0,"Z":float(i%8)-2.0}
		entity.fields.m_iCollisionGroup=R.statics.RDEntity.CollisionGroup_None if i%5==1 else 1
		entity.fields.allow=(i+sample)%7!=0
		entity.fields.m_bDestroyMe=i%9==2;entity.fields.m_Base=moving if i%11==4 else null
		if i%8==3:entity.fields.m_CollisionBounds.fields.W=0.0
		if i%8==7:entity.fields.m_CollisionBounds.fields.H=0.0
		nodes[i].fields={"m_Entity":entity,"m_Next":nodes[i+1] if i<15 else null,"m_Previous":nodes[i-1] if i>0 else null}
	world.fields.m_FirstEntity=nodes[0]
	moving.fields.m_vLocation.fields={"X":0.0,"Y":0.0,"Z":-3.0 if sample%2==0 else 9.0}
	moving.fields.m_iCollisionGroup=R.statics.RDEntity.CollisionGroup_None if sample%13==0 else 1
	moving.fields.allow=true;moving.fields.action=["","move","ignore","redirect","stop","bounds","position","replace_bounds","replace_location","replace_fields"][sample%10]
	var attached:R.Value=actor(20,trace);attached.fields.m_vLocation.fields={"X":2.0,"Y":3.0,"Z":4.0};moving.fields.m_AttachedEntities=[attached]
	var unique:Variant=actors[5] if sample%3==0 else null
	var extra:Variant=[actors[6],actors[8],actors[12],moving,actors[6]] if sample%4==0 else null
	var args:Array=[moving,0.25,-0.125,9.0 if sample%2==0 else -10.0,unique,extra,sample%17!=0]
	return {"world":world,"actors":actors,"nodes":nodes,"trace":trace,"attached":attached,"args":args}

func snapshot(g:Dictionary) -> Array:
	var result:Array=[g.trace.duplicate(true),g.attached.fields.m_vLocation.fields.duplicate()]
	for entity in g.actors:result.append([entity.fields.m_vLocation.fields.duplicate(),entity.fields.m_iCollisionGroup])
	return result
func release(g:Dictionary) -> void:
	for node in g.nodes:node.fields.clear()
	for entity in g.actors:entity.fields.clear()
	g.attached.fields.clear();g.actors.clear();g.world.fields.clear()

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("RDEntity")
	R.classes.CollisionProbe={"path":"res://tests/collision_suite.gd","base":"RDEntity","methods":{"CanCollideWith":["f_can",false],"Touched":["f_touch",false],"TouchedBy":["f_by",false]},"fields":{},"field_types":{},"imports":[]}
	for sample in 800:
		var original:Dictionary=fixture(sample);var optimized:Dictionary=fixture(sample)
		R.source_method(original.world,"RDWorld","MoveEntity",original.args);R.fast_move_entity(optimized.world,optimized.args)
		expect(snapshot(original)==snapshot(optimized),"collision order, callbacks and attached movement sample="+str(sample))
		release(original);release(optimized)
	expect(R.warnings.is_empty(),"collision dispatch warnings")
	print("TEST_COLLISION_COMPLETE cases=800 failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
