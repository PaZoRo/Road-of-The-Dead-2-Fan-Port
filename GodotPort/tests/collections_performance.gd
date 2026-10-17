extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var results:Array=[]
	for name in ["RandomHat","SequentialArray"]:
		var type:Variant=R.klass(name);var timings:Array=[[],[]]
		for enabled in [false,true]:R.native_collections_enabled=enabled;R.resolved_methods.erase(name);R.construct(type,[])
		for batch in 6:
			for index in [0,1] if batch%2==0 else [1,0]:
				R.native_collections_enabled=index==1;R.resolved_methods.erase(name)
				var began:int=Time.get_ticks_usec()
				for repeat in 500:
					var value:R.Value=R.construct(type,[])
					for n in 8:R.call_member(value,"AddValue",[n])
					for n in 16:R.call_member(value,"GetRandomValue" if name=="RandomHat" else "GetValue",[])
				timings[index].append((Time.get_ticks_usec()-began)/500.0)
		var means:Array=[0.0,0.0]
		for index in 2:
			for sample in timings[index]:means[index]+=sample/6.0
		results.append({"class":name,"reference_us":means[0],"native_us":means[1],"samples_us":timings})
		await process_frame
	print("COLLECTIONS_PERFORMANCE "+JSON.stringify({"instances_per_implementation_per_class":3000,"cases":results,"warnings":R.warnings}))
	R.cleanup();host.queue_free();await process_frame;quit(0 if R.warnings.is_empty() else 1)
