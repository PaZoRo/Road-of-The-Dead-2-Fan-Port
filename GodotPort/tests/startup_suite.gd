extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func run() -> void:
	var started:int=Time.get_ticks_usec()
	var scene=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_physics_process(false)
	print("STARTUP_RESULT ",JSON.stringify({"ready_ms":(Time.get_ticks_usec()-started)/1000.0,"values":R.values.size(),"textures":R.textures.size(),"scripts":R.scripts.size(),"timelines":R.timelines.size(),"memory":Performance.get_monitor(Performance.MEMORY_STATIC)}))
	if R.profiling:
		var keys:Array=R.profile.keys();keys.sort_custom(func(a,b):return R.profile[a][1]>R.profile[b][1])
		for key in keys.slice(0,30):print("BOOT_PROFILE ",key," ",R.profile[key])
	scene.queue_free();await process_frame;quit()
