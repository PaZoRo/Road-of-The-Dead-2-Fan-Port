extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func old_chain(world:R.Value,moving:R.Value,old_z:float) -> void:
	var node:R.Value=world.fields.m_FirstEntity
	while node!=null:
		var other:R.Value=node.fields.m_Entity
		if other!=moving and other.fields.m_iCollisionGroup!=R.statics.RDEntity.CollisionGroup_None:R.test_move_collision(moving,other,old_z)
		node=node.fields.m_Next
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("RDEntity")
	var world:R.Value=R.Value.new();var moving:R.Value=R.Value.new();moving.class_id="RDEntity"
	var bounds:R.Value=R.Value.new();bounds.fields={"X":-0.5,"Y":-0.5,"Z":0.0,"W":1.0,"H":1.0,"D":0.0}
	var location:R.Value=R.Value.new();location.fields={"X":0.0,"Y":0.0,"Z":4.0}
	moving.fields={"m_CollisionBounds":bounds,"m_vLocation":location}
	var entities:Array=[];var nodes:Array=[]
	for i in 237:
		var entity:R.Value=R.Value.new();entity.class_id="RDEntity";var p:R.Value=R.Value.new();p.fields={"X":0.0,"Y":0.0,"Z":float(i)}
		entity.fields={"m_CollisionBounds":bounds,"m_vLocation":p,"m_iCollisionGroup":1,"m_bDestroyMe":false,"m_Base":null};entities.append(entity);nodes.append(R.Value.new())
	for i in nodes.size():nodes[i].fields={"m_Entity":entities[i],"m_Next":nodes[i+1] if i+1<nodes.size() else null}
	world.fields.m_FirstEntity=nodes[0]
	for density in [10,25,80]:
		for i in entities.size():entities[i].fields.m_iCollisionGroup=1 if i%100<density else R.statics.RDEntity.CollisionGroup_None
		var elapsed:Array=[0,0]
		for repetition in 6:
			for mode in [repetition%2,1-repetition%2]:
				var began:int=Time.get_ticks_usec()
				for i in 200:
					if mode==0:old_chain(world,moving,3.0)
					else:R.collision_chain(world,moving,3.0)
				elapsed[mode]+=Time.get_ticks_usec()-began
		print("COLLISION_TIMING density="+str(density)+" old_us="+str(elapsed[0]/1200.0)+" new_us="+str(elapsed[1]/1200.0))
	for node in nodes:node.fields.clear()
	world.fields.clear();moving.fields.clear();entities.clear();nodes.clear();R.cleanup();host.queue_free();await process_frame;quit()
