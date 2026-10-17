extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")

func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var results:Array=[];var total_old:float=0;var total_new:float=0
	for owner in R.native_initializers:
		var instructions:Array=R.native_initializers[owner].get("init_fields",[])
		if instructions.all(func(x):return R.initializer_is_literal(x[1])):continue
		for compiled in [false,true]:
			R.compiled_initializers_enabled=compiled
			var warm:R.Value=R.Value.new();warm.class_id=owner;R.apply_native_initializer(warm,owner,"init_fields")
		var timings:Array=[[],[]]
		for batch in 6:
			for index in [0,1] if batch%2==0 else [1,0]:
				R.compiled_initializers_enabled=index==1
				var began:int=Time.get_ticks_usec()
				for repeat in 100:
					var value:R.Value=R.Value.new();value.class_id=owner
					R.apply_native_initializer(value,owner,"init_fields")
				timings[index].append((Time.get_ticks_usec()-began)/100.0)
		var old_mean:float=0;var new_mean:float=0
		for sample in timings[0]:old_mean+=sample/6.0
		for sample in timings[1]:new_mean+=sample/6.0
		total_old+=old_mean;total_new+=new_mean
		results.append({"owner":owner,"fields":instructions.size(),"previous_us":old_mean,"compiled_us":new_mean,"samples_us":timings})
		await process_frame
	print("INITIALIZER_PERFORMANCE "+JSON.stringify({"owners":results.size(),"instances_per_implementation_per_owner":600,"previous_combined_us":total_old,"compiled_combined_us":total_new,"cases":results,"warnings":R.warnings}))
	R.compiled_initializers_enabled=true
	var failed:bool=not R.warnings.is_empty() or results.size()!=24
	R.cleanup();host.queue_free();await process_frame;quit(1 if failed else 0)
