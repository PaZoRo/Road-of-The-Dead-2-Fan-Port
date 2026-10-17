extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var results:Array=[]
	var args:Array=[1.5,-2.25,3.75,4.5,5.25,6.5,7.75,8.25]
	for name in ["DTVector3D","DTVector2D","Box","Point","Rectangle","SoundTransform","ColorTransform","Vector3D","Matrix","Matrix3D"]:
		var type:Variant=R.klass(name);var timings:Array=[[],[]]
		for enabled in [false,true]:R.native_values_enabled=enabled;R.construct(type,args)
		for batch in 6:
			for index in [0,1] if batch%2==0 else [1,0]:
				R.native_values_enabled=index==1
				var began:int=Time.get_ticks_usec()
				for repeat in 500:R.construct(type,args)
				timings[index].append((Time.get_ticks_usec()-began)/500.0)
		var old_mean:float=0;var new_mean:float=0
		for sample in timings[0]:old_mean+=sample/6.0
		for sample in timings[1]:new_mean+=sample/6.0
		results.append({"class":name,"previous_us":old_mean,"native_us":new_mean,"samples_us":timings})
		await process_frame
	print("VALUE_CONSTRUCTION_PERFORMANCE "+JSON.stringify({"classes":results.size(),"instances_per_implementation_per_class":3000,"cases":results,"warnings":R.warnings}))
	R.native_values_enabled=true
	var failed:bool=not R.warnings.is_empty() or results.size()!=10
	R.cleanup();host.queue_free();await process_frame;quit(1 if failed else 0)
