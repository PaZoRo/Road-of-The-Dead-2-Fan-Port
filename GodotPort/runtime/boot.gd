extends Node
var loading: CanvasLayer
var status: Label
var progress: Control
func _ready() -> void :
	var scene_resource: PackedScene
	var started: int = Time.get_ticks_msec()
	if not OS.get_cmdline_user_args().has("--no-early-loading"):
		Engine.max_fps = 120
		loading = load("res://runtime/loading_screen.gd").new();loading.layer = 101;add_child(loading)
		status = loading.status;progress = loading.progress
		if DisplayServer.get_name() == "headless": await get_tree().process_frame
		else: await RenderingServer.frame_post_draw
		for arg in OS.get_cmdline_user_args():
			if arg.begins_with("--capture-loading="): get_viewport().get_texture().get_image().save_png(arg.trim_prefix("--capture-loading="))
		print("BOOT_EARLY_VISIBLE engine_ms=" + str(Time.get_ticks_msec()) + " scene_ms=" + str(Time.get_ticks_msec() - started))
		var error: Error = ResourceLoader.load_threaded_request("res://scenes/main.tscn", "PackedScene")
		if error != OK: fail("Cannot load game: " + error_string(error));return
		var samples: Array = []
		while true:
			var state: ResourceLoader.ThreadLoadStatus = ResourceLoader.load_threaded_get_status("res://scenes/main.tscn", samples)
			if state == ResourceLoader.THREAD_LOAD_LOADED: break
			if state != ResourceLoader.THREAD_LOAD_IN_PROGRESS: fail("Cannot load game resources: " + str(state));return
			if not samples.is_empty(): progress.value = float(samples[0]) * 100
			await get_tree().process_frame
		scene_resource = ResourceLoader.load_threaded_get("res://scenes/main.tscn")
		loading.queue_free()
	else: scene_resource = load("res://scenes/main.tscn")
	print("BOOT_MAIN_RESOURCE engine_ms=" + str(Time.get_ticks_msec()) + " scene_ms=" + str(Time.get_ticks_msec() - started))
	var scene: Node = scene_resource.instantiate()
	add_child(scene)
	print("BOOT_GAME_STARTED engine_ms=" + str(Time.get_ticks_msec()))
func fail(message: String) -> void :
	status.text = message;push_error(message);get_tree().quit(1)
