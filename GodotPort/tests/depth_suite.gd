extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func graph(order:Array,display_order:Array,depths:Array,custom:bool,barrier:int) -> Dictionary:
	var world:R.Value=R.Value.new();world.class_id="RDWorld"
	var container:R.Value=R.construct(R.klass("MovieClip"),[])
	var nodes:Array=[];var entities:Array=[]
	for i in depths.size():
		var entity:R.Value=R.Value.new();entity.class_id="RDEntity"
		var node:R.Value=R.Value.new();node.class_id="RDEntityNode"
		var clip:R.Value=R.construct(R.klass("MovieClip"),[]);clip.fields.test_index=i
		entity.fields={"m_iEntityIndex":i,"m_fDepthPosition":depths[i],"m_bHasCustomDepthPosition":custom,"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,depths[i]]),"m_EntityNode":node,"m_World":world,"m_ContainerMC":container,"m_MainMC":clip}
		node.fields.m_Entity=entity;clip.fields.m_owner=entity if i!=barrier else null
		nodes.append(node);entities.append(entity)
	for i in order.size():
		var node:R.Value=nodes[order[i]]
		node.fields.m_Previous=nodes[order[i-1]] if i>0 else null;node.fields.m_Next=nodes[order[i+1]] if i+1<order.size() else null
	world.fields.m_FirstEntity=nodes[order[0]]
	for i in display_order:R.add_child(container,entities[i].fields.m_MainMC)
	return {"world":world,"container":container,"nodes":nodes,"entities":entities}

func snapshot(g:Dictionary) -> Array:
	var forward:Array=[];var backward:Array=[];var displayed:Array=[];var tree_order:Array=[]
	var node:Variant=g.world.fields.m_FirstEntity;var last:Variant=null
	while node!=null and forward.size()<=g.nodes.size():forward.append(node.fields.m_Entity.fields.m_iEntityIndex);last=node;node=node.fields.m_Next
	while last!=null and backward.size()<=g.nodes.size():backward.append(last.fields.m_Entity.fields.m_iEntityIndex);last=last.fields.m_Previous
	for clip in g.container.children:displayed.append(clip.fields.test_index)
	for child in g.container.display.get_children():tree_order.append(child.value.fields.test_index)
	return [forward,backward,displayed,tree_order]

func release(g:Dictionary) -> void:
	for node in g.nodes:node.fields.clear()
	for entity in g.entities:
		entity.fields.m_MainMC.fields.m_owner=null;entity.fields.clear()
	g.world.fields.clear();g.container.children.clear();g.container.display.queue_free()

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host);seed(51043)
	var cases:int=0
	for sample in 160:
		var count:int=48;var order:Array=[];var display_order:Array=[];var depths:Array=[]
		for i in count:order.append(i);display_order.append(i);depths.append(float((i%9)*3))
		order.shuffle();display_order.shuffle()
		if sample%4==0:depths[sample%count]=NAN
		var custom:bool=sample%2==0;var barrier:int=(sample+19)%count if sample%3==0 else -1
		var expected:Dictionary=graph(order,display_order,depths,custom,barrier);var actual:Dictionary=graph(order,display_order,depths,custom,barrier)
		for change in 4:
			var index:int=(sample+change*13)%count;var z:float=float((sample*7+change*9)%60)-15.0
			for g in [expected,actual]:g.entities[index].fields.m_vLocation.fields.Z=z;g.entities[index].fields.m_fDepthPosition=z if custom else depths[index]
			R.source_method(expected.entities[index],"RDEntity","UpdateDepthPosition",[]);R.fast_depth(actual.entities[index])
			expect(snapshot(actual)==snapshot(expected),"linked and display order sample="+str(sample)+" change="+str(change));cases+=1
		release(expected);release(actual)
		if sample%20==0:await process_frame
	var null_node:R.Value=R.Value.new();null_node.fields.m_EntityNode=null;R.fast_depth(null_node)
	print("TEST_DEPTH_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
