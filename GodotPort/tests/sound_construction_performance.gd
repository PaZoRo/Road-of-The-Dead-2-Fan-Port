extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var results:Array=[]
	var args:Array=[]
	for name in ["DTSound","DTSpacialSound"]:
		var type:Variant=R.klass(name);var timings:Array=[[],[]]
		for enabled in [false,true]:R.native_sound_construction_enabled=enabled;R.native_basic_construction_enabled=enabled;R.resolved_methods.erase("BasicObject");R.resolved_methods.erase("DTSound");R.resolved_methods.erase("DTSpacialSound");R.construct(type,args)
		for batch in 6:
			for index in [0,1] if batch%2==0 else [1,0]:
				R.native_sound_construction_enabled=index==1;R.native_basic_construction_enabled=index==1;R.resolved_methods.erase("BasicObject");R.resolved_methods.erase("DTSound");R.resolved_methods.erase("DTSpacialSound")
				var began:int=Time.get_ticks_usec()
				for repeat in 500:R.construct(type,args)
				timings[index].append((Time.get_ticks_usec()-began)/500.0)
		var old_mean:float=0;var new_mean:float=0
		for sample in timings[0]:old_mean+=sample/6.0
		for sample in timings[1]:new_mean+=sample/6.0
		results.append({"class":name,"previous_us":old_mean,"native_us":new_mean,"samples_us":timings})
		await process_frame
	print("SOUND_CONSTRUCTION_PERFORMANCE "+JSON.stringify({"classes":results.size(),"instances_per_implementation_per_class":3000,"cases":results,"warnings":R.warnings}))
	R.native_sound_construction_enabled=true
	var failed:bool=not R.warnings.is_empty() or results.size()!=2
	R.cleanup();host.queue_free();await process_frame;quit(1 if failed else 0)
