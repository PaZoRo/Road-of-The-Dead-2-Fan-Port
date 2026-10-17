extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
const Value=R.Value
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
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


func old_depth(entity:Value) -> void:
	var e:Dictionary=entity.fields;var node:Value=e.m_EntityNode
	if node==null:return
	if not e.m_bHasCustomDepthPosition:e.m_fDepthPosition=(e.m_vLocation as Value).fields.Z
	var depth:float=e.m_fDepthPosition;var entity_index:int=e.m_iEntityIndex
	var original_previous:Value=node.fields.m_Previous;var original_next:Value=node.fields.m_Next
	var previous:Value=original_previous;var next:Value=original_next
	if next!=null and R.depth_precedes(depth,entity_index,next.fields.m_Entity):
		while next!=null and R.depth_precedes(depth,entity_index,next.fields.m_Entity):
			previous=next;next=next.fields.m_Next
	else:
		while previous!=null and not R.depth_precedes(depth,entity_index,previous.fields.m_Entity):
			next=previous;previous=previous.fields.m_Previous
	if previous!=original_previous or next!=original_next:
		# Find the same insertion point as adjacent swaps, then splice once.
		if original_previous!=null:original_previous.fields.m_Next=original_next
		else:(e.m_World as Value).fields.m_FirstEntity=original_next
		if original_next!=null:original_next.fields.m_Previous=original_previous
		node.fields.m_Previous=previous;node.fields.m_Next=next
		if previous!=null:previous.fields.m_Next=node
		else:(e.m_World as Value).fields.m_FirstEntity=node
		if next!=null:next.fields.m_Previous=node
	elif previous==null:(e.m_World as Value).fields.m_FirstEntity=node
	var container:Value=e.m_ContainerMC;var main:Value=e.m_MainMC
	if container==null or main.display.get_parent()!=container.display:return
	var index:int=main.display.get_index();var original:int=index
	while index>0:
		var other:Value=(container.children[index-1] as Value).fields.get("m_owner")
		if other==null or not R.depth_precedes(depth,entity_index,other):break
		index-=1
	if index==original:
		while index<container.children.size()-1:
			var other:Value=(container.children[index+1] as Value).fields.get("m_owner")
			if other==null or R.depth_precedes(depth,entity_index,other):break
			index+=1
	if index!=original:
		container.children.erase(main);container.children.insert(index,main);container.display.move_child(main.display,index)

func move_steps(g:Dictionary,optimized:bool,count:int) -> int:
	var entity:R.Value=g.entities[-1]
	var began:int=Time.get_ticks_usec()
	for i in count:
		entity.fields.m_vLocation.fields.Z=-1000.0 if i%2==0 else 1000.0
		if optimized:R.fast_depth(entity)
		else:old_depth(entity)
	return Time.get_ticks_usec()-began
func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
	for size in [64,256,512]:
		var order:Array=[];var display_order:Array=[];var depths:Array=[]
		for i in size:order.append(i);display_order.push_front(i);depths.append(float(i))
		var original:Dictionary=graph(order,display_order,depths,false,-1);var optimized:Dictionary=graph(order,display_order,depths,false,-1)
		move_steps(original,false,20);move_steps(optimized,true,20)
		var timings:Array=[0,0]
		for repetition in 4:
			for mode in [repetition%2,1-repetition%2]:
				timings[mode]+=move_steps(optimized if mode==1 else original,mode==1,200)
		if snapshot(original)!=snapshot(optimized):failures.append("ordering size="+str(size))
		print("DEPTH_TIMING size="+str(size)+" previous_us="+str(timings[0]/800.0)+" updated_us="+str(timings[1]/800.0))
		release(original);release(optimized);await process_frame
	print("TEST_DEPTH_PERFORMANCE_COMPLETE failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
