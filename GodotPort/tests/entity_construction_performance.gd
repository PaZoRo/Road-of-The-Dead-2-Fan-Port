extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func enabled(value:bool) -> void:
	R.native_entity_construction_enabled=value;R.native_builtin_construction_enabled=value
	for name in R.ENTITY_CONSTRUCTION_METHODS:R.resolved_methods.erase(name)
func workload(type:String,count:int) -> int:
	var began:int=Time.get_ticks_usec()
	for i in count:
		var value:R.Value=R.construct(R.klass(type),["enterFrame",false] if type=="Event" else [])
		if type not in ["Event","MovieClip"]:R.call_member(value,"SetInitialState",[])
	return Time.get_ticks_usec()-began
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var cases:Array=[]
	for type in ["RDEntity","RDObstacle","RDEntityWithVoice","Event","MovieClip"]:
		var count:int=100 if type not in ["Event","MovieClip"] else 2000 if type=="Event" else 500
		for native in [false,true]:enabled(native);workload(type,10)
		var samples:Array=[[],[]]
		for batch in 6:
			for mode in [batch%2,1-batch%2]:
				enabled(mode==1);seed(789)
				samples[mode].append(workload(type,count)/float(count))
				await process_frame
		var means:Array=[0.0,0.0]
		for mode in 2:
			for sample in samples[mode]:means[mode]+=sample/6.0
		cases.append({"class":type,"workload":"complete construct and pooled reset" if type not in ["Event","MovieClip"] else "complete construct","count_per_implementation":count*6,"reference_us":means[0],"native_us":means[1],"samples":samples})
	print("ENTITY_CONSTRUCTION_PERFORMANCE "+JSON.stringify({"batches":6,"cases":cases,"warnings":R.warnings}))
	R.cleanup();host.queue_free();await process_frame;quit(0 if R.warnings.is_empty() else 1)
