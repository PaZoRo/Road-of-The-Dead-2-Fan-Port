extends Node2D
const R = preload("res://runtime/as_runtime.gd")
var accumulator: float = 0
var timeline_accumulator: float = 0
var hover: Variant
var down: Variant
var test_frame: int = 0
var test_mode: bool = false
var gameplay_test: bool = false
var cinematic_audio: AudioStreamPlayer
var cinematic_frame: int = -1
var boot_ready: bool = false
var loading_layer: CanvasLayer
var loading_label: Label
var loading_progress: Control
var benchmark: bool = false
var benchmark_fire: bool = false
var test_finished: bool = false
var benchmark_start: int = 0
var benchmark_drawn: int = 0
var benchmark_ticks: int = 0
var benchmark_physics_count: int = 0
var benchmark_physics_us: int = 0
var benchmark_animation_us: int = 0
var benchmark_game_us: int = 0
var benchmark_engine_ticks: int = 0
var benchmark_previous_frame: int = 0
var benchmark_frame_samples: Array = []
var animation_profile: Dictionary = {}
var profile_startup: bool = false
var phased_animation: bool = true
var animation_prepared: bool = false
var prepared_animation_us: int = 0
var prepared_off_phase: bool = false
var benchmark_off_phase_animation_us: int = 0
var benchmark_prepared_steps: int = 0
var benchmark_inline_steps: int = 0
var benchmark_post_draw_previous: int = 0
var benchmark_post_draw_samples: Array = []
var benchmark_duration_us: int = 15000000
var benchmark_progress: Array = []
var trace_player_failure: bool = false
var previous_player_failed: bool = false
var section_clock: Node
var section_program: Script
var tick_draw: int = -1
var section_benchmark_us: int = 0
var section_benchmark_started: bool = false
var render_cap: int = 0
var boot_resources: Dictionary = {}
var catalog_thread: Thread

func startup_phase(name: String, began: int) -> void :
	if profile_startup: print("STARTUP_PHASE " + JSON.stringify({"name": name, "ms": (Time.get_ticks_usec() - began) / 1000.0}))

func _ready() -> void :
	profile_startup = OS.get_cmdline_user_args().has("--profile-startup")
	DisplayServer.window_set_title("Road of the Dead 2 - Fan Port 0.4.23")
	Engine.max_fps = 120
	Engine.max_physics_steps_per_frame = 2
	for arg in OS.get_cmdline_user_args():
		if arg == "--smoke-test": test_mode = true
		if arg == "--gameplay-test": test_mode = true;gameplay_test = true
		if arg == "--benchmark": test_mode = true;gameplay_test = true;benchmark = true
		if arg == "--benchmark-fire": benchmark_fire = true
		if arg == "--trace-player-failure": trace_player_failure = true
		if arg == "--single-step-test": Engine.max_physics_steps_per_frame = 1
		if arg == "--no-phased-animation": phased_animation = false
		if arg.begins_with("--benchmark-seconds="): benchmark_duration_us = int(clampf(arg.trim_prefix("--benchmark-seconds=").to_float(), 1, 120) * 1000000)
		if arg.begins_with("--render-fps="):
			var cap: int = arg.trim_prefix("--render-fps=").to_int()
			render_cap = 0 if cap == 0 else clampi(cap, 30, 480)
	if benchmark and DisplayServer.get_name() != "headless": RenderingServer.frame_post_draw.connect(record_benchmark_draw)
	if get_tree().get_script() == null:
		set_physics_process(false);show_loading_screen();boot_async();return
	boot_sync()
	boot_ready = true

func initialize_runtime() -> void :
	var began: int = Time.get_ticks_usec() if profile_startup else 0
	R.initialize(self)
	startup_phase("runtime_initialize", began)
	began = Time.get_ticks_usec() if profile_startup else 0
	cinematic_audio = AudioStreamPlayer.new();cinematic_audio.name = "CinematicAudio";$Audio.add_child(cinematic_audio)
	R.set_value(R.klass("BasicGame"), "m_iAPI", 1)
	R.root = R.construct(R.klass("RoadOfTheDead_fla.MainTimeline"), [])
	R.add_child(R.stage, R.root)
	R.goto_frame(R.root, 43, false)
	startup_phase("root_construct", began)
	if not OS.get_cmdline_user_args().has("--no-section-streaming"):
		section_clock = load("res://runtime/section_scheduler.gd").new();add_child(section_clock)
		section_program = load("res://runtime/native_streaming.gd")
		section_program.active.clear();section_program.pending.clear();section_program.starts = 0;section_program.finishes = 0;section_program.cancelled = 0
		section_program.clock = section_clock;R.hotpath_script = section_program
		R.lifecycle_observer = section_clock.observe_lifecycle

func boot_sync() -> void :
	initialize_runtime()
	for arg in OS.get_cmdline_user_args():
		if arg == "--smoke-test": test_mode = true
		if arg == "--gameplay-test": test_mode = true;gameplay_test = true
		if arg.begins_with("--test-frame="): R.goto_frame(R.root, arg.trim_prefix("--test-frame=").to_int(), false)
	process_frame_scripts()
	print("PORT_BOOT frame=" + str(R.root.frame) + " classes=" + str(R.classes.size()))

func show_loading_screen() -> void :
	loading_layer = load("res://runtime/loading_screen.gd").new();add_child(loading_layer)
	loading_label = loading_layer.status;loading_progress = loading_layer.progress

func preload_source_bundles() -> void :
	if OS.get_cmdline_user_args().has("--no-threaded-bootstrap") or OS.get_cmdline_user_args().has("--no-source-bundles"): return
	if not OS.get_cmdline_user_args().has("--no-threaded-catalogs"):
		catalog_thread = Thread.new()
		var error: Error = catalog_thread.start(R.Catalog.read_base_catalogs.bind( not OS.get_cmdline_user_args().has("--no-catalog-cache")))
		if error != OK: catalog_thread = null
	var began: int = Time.get_ticks_usec() if profile_startup else 0
	var pending: Array[String] = []
	var groups: Array[String] = R.boot_source_bundle_groups()
	var paths: Array[String] = []
	for group: String in groups: paths.append("res://runtime/source_" + group + ".gd")


	if not OS.get_cmdline_user_args().has("--no-core-preload"):
		for name: String in ["display", "native_hotpaths", "native_projection", "native_spawning", "native_streaming", "bootstrap_program"]: paths.append("res://runtime/" + name + ".gd")
		if DisplayServer.get_name() != "headless": paths.append("res://runtime/native_snapshot.gd")
	var drawn: int = Engine.get_frames_drawn(); var last: int = Time.get_ticks_usec(); var worst: int = 0; var waits: int = 0
	for path: String in paths:
		if ResourceLoader.has_cached(path): continue
		var error: Error = ResourceLoader.load_threaded_request(path, "GDScript")
		if error == OK: pending.append(path)
		else: push_error("Background script request failed: " + path + " code=" + str(error))


	if not OS.get_cmdline_user_args().has("--late-source-prefetch"): R.prefetch_source_bundles()
	while not pending.is_empty() or catalog_thread != null:
		if catalog_thread != null and not catalog_thread.is_alive():
			var result: Dictionary = catalog_thread.wait_to_finish();catalog_thread = null
			R.prepared_catalogs = result.catalogs
			if profile_startup: print("BOOT_CATALOG_PRESENTATION " + JSON.stringify({"read_ms": result.read_us / 1000.0, "catalogs": R.prepared_catalogs.size()}))
		var completed: Array[String] = []
		for path: String in pending:
			var status: ResourceLoader.ThreadLoadStatus = ResourceLoader.load_threaded_get_status(path)
			if status == ResourceLoader.THREAD_LOAD_LOADED:

				var resource: Script = ResourceLoader.load_threaded_get(path)
				boot_resources[path] = resource
				if path.get_file().begins_with("source_"): R.source_bundle_scripts[path.get_file().trim_prefix("source_").trim_suffix(".gd")] = resource
				completed.append(path)
			elif status != ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				push_error("Background script load failed: " + path + " status=" + str(status));completed.append(path)
		for path: String in completed: pending.erase(path)
		loading_label.text = "Loading " + str(paths.size() - pending.size()) + " / " + str(paths.size())
		loading_progress.value = float(paths.size() - pending.size()) / paths.size() * 40
		if not pending.is_empty() or catalog_thread != null:
			await get_tree().process_frame
			var now: int = Time.get_ticks_usec();worst = maxi(worst, now - last);last = now;waits += 1
	startup_phase("threaded_source_bundles", began)
	if profile_startup: print("BOOT_SCRIPT_PRESENTATION " + JSON.stringify({"drawn_frames": Engine.get_frames_drawn() - drawn, "waits": waits, "worst_wait_ms": worst / 1000.0, "loaded_groups": R.source_bundle_scripts.keys()}))

func boot_async() -> void :
	var started: int = Time.get_ticks_msec()
	if DisplayServer.get_name() == "headless": await get_tree().process_frame
	else: await RenderingServer.frame_post_draw
	print("BOOT_LOADING_VISIBLE ms=" + str(Time.get_ticks_msec()))
	await preload_source_bundles()
	initialize_runtime()
	R.prefetch_source_bundles()


	R.root.frame_dirty = false;R.root.playing = false;R.root.fields.gameClass = R.klass("RDGame")
	var phase: int = Time.get_ticks_usec() if profile_startup else 0
	var game = R.construct(R.root.fields.gameClass, [R.root]);R.root.fields.m_Game = game
	startup_phase("game_construct", phase)
	var program: Script = load("res://runtime/bootstrap_program.gd"); var scope: Dictionary = {"sound": null, "slotMC": null, "i": 0}
	for step in range(program.STEP_COUNT):
		loading_label.text = "Preparing campaign " + str(step + 1) + " / " + str(program.STEP_COUNT)
		loading_progress.value = 40 + float(step) / program.STEP_COUNT * 50
		await get_tree().process_frame
		phase = Time.get_ticks_usec() if profile_startup else 0
		program.call("step_" + str(step), game, scope)
		startup_phase("bootstrap_" + str(step), phase)
	while not R.source_bundle_pending.is_empty():
		R.poll_source_bundles()
		loading_label.text = "Finishing game resources"
		loading_progress.value = 90 + (4 - R.source_bundle_pending.size()) * 2.5
		if not R.source_bundle_pending.is_empty(): await get_tree().process_frame
	phase = Time.get_ticks_usec() if profile_startup else 0
	R.call_member(game, "Start", [])
	R.event_call(R.root, "addEventListener", ["enterFrame", R.get_value(R.root, "EnterFrameRunHandler")])
	process_frame_scripts();boot_ready = true;set_physics_process(true)
	startup_phase("game_start", phase)
	R.prefetch_source_bundles()
	loading_layer.queue_free();loading_layer = null;boot_resources.clear()
	print("PORT_BOOT frame=" + str(R.root.frame) + " classes=" + str(R.classes.size()) + " ready_ms=" + str(Time.get_ticks_msec() - started))
	if R.profiling_source_usage: print("BOOT_SOURCE_USAGE " + JSON.stringify(R.source_usage))

func acknowledge_storage() -> void :
	var game = R.get_value(R.root, "m_Game")
	if R.get_value(game, "m_szCurrentCinematic") == "StorageNotice": R.invoke(R.get_value(game, "SkipCinematic"), [])

func dispatch_local_event(object: Variant, type: String, data: Dictionary) -> void :
	R.dispatch(object, type, data)

func process_frame_scripts() -> void :
	var iterations: int = 0
	while iterations < R.frame_queue.size() and iterations < 10000:
		var ref: WeakRef = R.frame_queue[iterations]
		iterations += 1
		var clip: R.Value = ref.get_ref()
		if clip == null or not clip.constructor_done: continue
		if clip.frame_dirty:
			clip.frame_dirty = false
			if clip.listeners.has("frameConstructed"): R.dispatch(clip, "frameConstructed", {})
			if clip.frame_scripts.has(clip.frame): R.invoke(clip.frame_scripts[clip.frame], [])
	if iterations == R.frame_queue.size(): R.frame_queue.clear()
	else: R.frame_queue = R.frame_queue.slice(iterations)



func prepare_animation_step(step: float, off_phase: bool) -> void :
	if animation_prepared: return
	var began: int = Time.get_ticks_usec()
	R.elapsed += step
	R.tick_tweens(step)
	R.tick_audio()
	process_frame_scripts()
	timeline_accumulator += step * 30.0
	var frames: int = int(timeline_accumulator)
	timeline_accumulator -= frames
	for index in range(frames):
		advance_timelines()
		process_frame_scripts()
	prepared_animation_us = Time.get_ticks_usec() - began
	prepared_off_phase = off_phase
	animation_prepared = true

func prepare_animation_between_steps(fraction: float) -> bool:
	if not phased_animation or not boot_ready or animation_prepared or not is_finite(fraction) or fraction < 0.5 or fraction >= 1.0: return false
	if Engine.time_scale != 1.0 or get_tree().paused or R.root == null: return false
	var game: R.Value = R.root.fields.get("m_Game")
	if game == null or game.fields.get("m_iGameState", -1) != 1 or game.fields.get("m_bPaused", false): return false
	var mode: Variant = game.fields.get("m_CurrentGameMode")
	if not R.instance_of(mode, R.klass("RDGameModeGameplay")): return false
	prepare_animation_step(1.0 / Engine.physics_ticks_per_second, true)
	return true

func _physics_process(delta: float) -> void :
	simulate_tick(delta)

func simulate_tick(delta: float) -> void :
	tick_draw = Engine.get_frames_drawn()
	var measured: bool = benchmark and benchmark_start > 0
	var began: int = Time.get_ticks_usec() if measured else 0
	if not animation_prepared: prepare_animation_step(delta, false)
	if measured:
		benchmark_animation_us += prepared_animation_us
		if prepared_off_phase:
			benchmark_off_phase_animation_us += prepared_animation_us
			benchmark_prepared_steps += 1
		else: benchmark_inline_steps += 1
	animation_prepared = false


	process_frame_scripts()
	var phase: int = Time.get_ticks_usec() if measured else 0
	for ref in R.active_clips.values():
		var clip: R.Value = ref.get_ref()
		if clip != null and clip.on_stage and clip.listeners.has("enterFrame"): R.dispatch(clip, "enterFrame", {})
	R.dispatch(R.stage, "enterFrame", {})
	if measured: benchmark_game_us += Time.get_ticks_usec() - phase
	process_frame_scripts()
	sync_driver_hands()
	R.sync_visible_clips()
	update_hover()
	update_cinematic_audio()
	if measured: benchmark_physics_us += Time.get_ticks_usec() - began;benchmark_physics_count += 1
	if test_mode: run_smoke_step()

func sync_driver_hands() -> void :


	if R.root == null: return
	var game: Variant = R.root.fields.get("m_Game")
	if not game is R.Value or game.fields.get("m_iGameState") != 1: return
	var mode: Variant = game.fields.get("m_CurrentGameMode")
	if not mode is R.Value or not R.instance_of(mode, R.klass("RDGameModeGameplay")): return
	var player: Variant = mode.fields.get("m_Player")
	if not player is R.Value or player.fields.get("m_bChopperMode", false): return
	if player.fields.get("m_iLeftHandState") != R.static_value("RDPlayer", "HandState_OnWheel"): return
	var interior: Variant = player.fields.get("m_MCCarInterior")
	if not interior is R.Value: return
	var pose: String = "OnWheelFemale" if bool(game.fields.get("m_bIsFemale", false)) else "OnWheelMale"
	for side: String in ["LeftArm", "RightArm"]:
		var arm: Variant = interior.fields.get(side)
		if not arm is R.Value: continue
		var desired: int = int(arm.timeline.get("labels", {}).get(pose, 0))
		if desired > 0 and arm.frame != desired: R.goto_frame(arm, desired, false)

func advance_timelines() -> void :
	for id in R.active_clips.keys():
		var ref: WeakRef = R.active_clips.get(id)
		if ref == null: continue
		var clip: R.Value = ref.get_ref()
		if clip == null: R.active_clips.erase(id);continue
		if clip.playing and clip.on_stage and int(clip.timeline.get("count", 1)) > 1:
			if clip.fields.get("@fan_fire_timing", false) and str(R.frame_label(clip)).contains("_fire"):
				var fire_phase: float = float(clip.fields.get("@fan_fire_phase", 0.0)) + 0.75
				clip.fields["@fan_fire_phase"] = fire_phase - floorf(fire_phase)
				if fire_phase < 1.0: continue
			else: clip.fields.erase("@fan_fire_phase")
			var began: int = Time.get_ticks_usec() if R.profiling else 0
			R.advance_clip(clip)
			if R.profiling:
				var key: String = clip.class_id + ":" + clip.symbol
				if not animation_profile.has(key): animation_profile[key] = [0, 0]
				animation_profile[key][0] += 1;animation_profile[key][1] += Time.get_ticks_usec() - began

func _process(_delta: float) -> void :
	var process_began: int = Time.get_ticks_usec()
	R.poll_source_bundles()
	if benchmark and benchmark_start > 0:
		var now: int = Time.get_ticks_usec()
		if benchmark_previous_frame > 0: benchmark_frame_samples.append(now - benchmark_previous_frame)
		benchmark_previous_frame = now
	prepare_animation_between_steps(Engine.get_physics_interpolation_fraction())
	update_render_cap()
	if R.road_interpolation_enabled:
		var road_fraction: float = Engine.get_physics_interpolation_fraction() if get_tree().physics_interpolation and not get_tree().paused else 1.0
		var road_game: Variant = R.root.fields.get("m_Game") if R.root != null else null
		if road_game != null and road_game.fields.get("m_bPaused", false): road_fraction = 1.0
		RenderingServer.global_shader_parameter_set("fan_road_fraction", road_fraction)
	pump_sections(process_began)

func pump_sections(process_began: int) -> void :
	if section_clock != null:
		if benchmark_start > 0 and not section_benchmark_started:
			section_benchmark_us = section_clock.total_us;section_benchmark_started = true
		if not section_program.active.is_empty():
			var physics_frame: bool = Engine.get_frames_drawn() == tick_draw if DisplayServer.get_name() != "headless" else Engine.get_physics_frames() != section_clock.last_pump_physics
			section_clock.last_pump_physics = Engine.get_physics_frames()
			section_clock.pump(physics_frame, Time.get_ticks_usec() - process_began)

func update_render_cap() -> void :
	if DisplayServer.get_name() == "headless": Engine.max_fps = 0;return
	var game: Variant = R.root.fields.get("m_Game") if R.root != null else null
	var active_game: bool = boot_ready and game != null and game.fields.get("m_iGameState") == 1 and not game.fields.get("m_bPaused", false) and R.instance_of(game.fields.get("m_CurrentGameMode"), R.klass("RDGameModeGameplay"))
	Engine.max_fps = render_cap if active_game else (mini(120, render_cap) if render_cap > 0 else 120)

func record_benchmark_draw() -> void :
	if benchmark_start == 0: return
	var now: int = Time.get_ticks_usec()
	if benchmark_post_draw_previous > 0: benchmark_post_draw_samples.append(now - benchmark_post_draw_previous)
	benchmark_post_draw_previous = now

func benchmark_frame_report(source: Variant = null) -> Dictionary:
	var samples: Array = (benchmark_frame_samples if source == null else source).duplicate()
	if samples.is_empty(): return {}
	samples.sort()
	var late: int = 0
	for sample in samples:
		if sample > 20000: late += 1
	return {"samples": samples.size(), "p50_ms": samples[int(samples.size() * 0.5)] / 1000.0, "p95_ms": samples[int(samples.size() * 0.95)] / 1000.0, "p99_ms": samples[int(samples.size() * 0.99)] / 1000.0, "worst_ms": samples[-1] / 1000.0, "over_20ms_percent": 100.0 * late / samples.size()}

func run_smoke_step() -> void :
	if test_finished: return
	if test_mode:
		test_frame += 1
		if test_frame == 30:
			var game = R.get_value(R.root, "m_Game")
			R.invoke(R.get_value(game, "SetGameState"), [0])
		if test_frame == 60:
			var game = R.get_value(R.root, "m_Game")
			R.invoke(R.get_value(game, "SetGameState"), [0])
		if gameplay_test and test_frame == 60:
			if benchmark: seed(20261009)
			var game = R.get_value(R.root, "m_Game")
			var mode = R.get_value(game, "m_GameModeStory")
			R.set_value(game, "m_ActiveMode", mode)
			R.set_value(mode, "m_bDoStartGameMode", true)
			R.call_member(mode, "StartGameMode", [])
			R.call_member(game, "StartGameMode", [mode]);process_frame_scripts()
			R.call_member(mode, "HideUpgradeScreen", []);R.call_member(game, "HideFlash", [])
			var event = R.construct(R.klass("KeyboardEvent"), ["keyDown"]);event.fields.keyCode = 87
			R.call_member(mode, "OnKeyDown", [event])
		if gameplay_test and test_frame == 90:
			var game = R.get_value(R.root, "m_Game"); var mode = R.get_value(game, "m_GameModeStory")
			var event = R.construct(R.klass("KeyboardEvent"), ["keyDown"]);event.fields.keyCode = 87
			R.call_member(mode, "OnKeyDown", [event])
		if benchmark and test_frame == 180:
			if R.profiling_source_usage: print("WARMUP_SOURCE_USAGE " + JSON.stringify(R.source_usage))
			benchmark_start = Time.get_ticks_usec();benchmark_drawn = Engine.get_frames_drawn();benchmark_ticks = R.root.fields.m_Game.fields.m_iGameTick
			benchmark_engine_ticks = Engine.get_physics_frames()
			if R.profiling_hitches: R.hitch_events.clear()
			if R.profiling_construction: R.construction_profile.clear()
			if R.profiling: R.profile.clear()
		if benchmark and benchmark_start > 0 and (test_frame - 180) % 150 == 0:
			var driving: R.Value = R.root.fields.m_Game.fields.m_GameModeStory.fields.m_Player
			var story: R.Value = R.root.fields.m_Game.fields.m_GameModeStory
			benchmark_progress.append({"seconds": (Time.get_ticks_usec() - benchmark_start) / 1000000.0, "position": driving.fields.m_vLocation.fields.Z, "failed": driving.fields.m_bFailed, "pattern_lead": story.fields.m_fNextPatternSpawnPosition - story.fields.m_Camera.fields.m_vLocation.fields.Z, "road_slices": story.fields.m_Road.fields.m_RoadSlices.size()})
		if benchmark and benchmark_fire and benchmark_start > 0 and test_frame % 3 == 0:
			var shooting_player: Variant = R.root.fields.m_Game.fields.m_GameModeStory.fields.get("m_Player")
			if shooting_player is R.Value: R.call_member(shooting_player, "StartFiring", [])
		if gameplay_test and trace_player_failure and test_frame >= 60:
			var observed_player: Variant = R.root.fields.m_Game.fields.m_GameModeStory.fields.get("m_Player")
			if observed_player is R.Value:
				var failed_now: bool = bool(observed_player.fields.get("m_bFailed", false))
				if failed_now != previous_player_failed:
					print("PLAYER_FAILURE_TRANSITION " + JSON.stringify({"failed": failed_now, "tick": test_frame, "fail_type": observed_player.fields.get("m_iFailType"), "location_z": observed_player.fields.get("m_vLocation").fields.get("Z") if observed_player.fields.get("m_vLocation") is R.Value else null}))
					previous_player_failed = failed_now
		if benchmark and test_frame >= 180 and Time.get_ticks_usec() - benchmark_start >= benchmark_duration_us:
			test_finished = true
			var seconds: float = (Time.get_ticks_usec() - benchmark_start) / 1000000.0
			if section_clock != null:
				var streamed: int = section_clock.total_us - section_benchmark_us
				print("STREAM_BENCHMARK_CPU " + JSON.stringify({"streaming_ms": streamed / 1000.0, "per_physics_step_ms": float(streamed) / maxi(1, benchmark_physics_count) / 1000, "complete_step_cpu_ms": float(benchmark_physics_us + benchmark_off_phase_animation_us + streamed) / maxi(1, benchmark_physics_count) / 1000}))
			print("BINARY_BENCHMARK " + JSON.stringify({"seconds": seconds, "rendered_fps": (Engine.get_frames_drawn() - benchmark_drawn) / seconds, "simulation_hz": (R.root.fields.m_Game.fields.m_iGameTick - benchmark_ticks) / seconds, "draw_calls": Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME), "texture_memory": Performance.get_monitor(Performance.RENDER_TEXTURE_MEM_USED), "memory": Performance.get_monitor(Performance.MEMORY_STATIC), "gpu_pause_snapshots": R.gpu_pause_snapshot_count, "gpu_pause_snapshot_ms": R.gpu_pause_snapshot_us / 1000.0, "text_cache_entries": R.plain_text_cache.size(), "physics_ms": float(benchmark_physics_us) / maxi(1, benchmark_physics_count) / 1000, "total_step_cpu_ms": float(benchmark_physics_us + benchmark_off_phase_animation_us) / maxi(1, benchmark_physics_count) / 1000, "off_phase_animation_ms": float(benchmark_off_phase_animation_us) / maxi(1, benchmark_physics_count) / 1000, "animation_ms": float(benchmark_animation_us) / maxi(1, benchmark_physics_count) / 1000, "game_ms": float(benchmark_game_us) / maxi(1, benchmark_physics_count) / 1000}))
			print("BINARY_SOURCE_STATUS " + JSON.stringify({"loaded_groups": R.source_bundle_scripts.keys(), "pending_groups": R.source_bundle_pending.keys(), "background": R.source_background_stats, "blocking_waits": R.source_blocking_waits, "blocking_wait_ms": R.source_blocking_wait_us / 1000.0}))
			print("BINARY_FRAME_PACING " + JSON.stringify({"engine_physics_hz": (Engine.get_physics_frames() - benchmark_engine_ticks) / seconds, "measured_updates_hz": benchmark_physics_count / seconds, "physics_ticks_per_second": Engine.physics_ticks_per_second, "max_steps": Engine.max_physics_steps_per_frame, "time_scale": Engine.time_scale, "render_cap": Engine.max_fps, "frames": benchmark_frame_report()}))
			print("BINARY_DRAW_PACING " + JSON.stringify(benchmark_frame_report(benchmark_post_draw_samples)))
			print("BINARY_ANIMATION_SCHEDULING " + JSON.stringify({"enabled": phased_animation, "prepared_steps": benchmark_prepared_steps, "inline_steps": benchmark_inline_steps, "total_steps": benchmark_physics_count}))
			print("BINARY_PROGRESS " + JSON.stringify(benchmark_progress))
			if R.profiling_source_usage: print("DRIVING_SOURCE_USAGE " + JSON.stringify(R.source_usage))
			if R.profiling_hitches: print("BINARY_HITCH_EVENTS " + JSON.stringify(R.hitch_events))
			if R.profiling_construction: print("CONSTRUCTION_PROFILE " + JSON.stringify(R.construction_profile))
			if R.profiling: print("BINARY_SELF_PROFILE " + JSON.stringify(R.profile))
		if gameplay_test and (test_frame >= 120 and not benchmark or benchmark_start > 0 and Time.get_ticks_usec() - benchmark_start >= benchmark_duration_us):
			test_finished = true
			var game = R.get_value(R.root, "m_Game"); var mode = R.get_value(game, "m_GameModeStory")
			var player = R.get_value(mode, "m_Player")
			var distance: float = R.num(R.get_value(R.get_value(player, "m_vLocation"), "Z"))
			if benchmark:
				var interior: R.Value = player.fields.get("m_MCCarInterior")
				print("BINARY_PLAYER_STATE " + JSON.stringify({"failed": player.fields.get("m_bFailed"), "fail_type": player.fields.get("m_iFailType"), "hp": player.fields.get("m_fHP"), "interior_frame": interior.frame if interior != null else -1, "interior_visible": interior.display.is_visible_in_tree() if interior != null else false, "interior_alpha": interior.display.modulate.a if interior != null else 0.0}))
			for arg in OS.get_cmdline_user_args():
				if arg.begins_with("--capture="): get_viewport().get_texture().get_image().save_png(arg.trim_prefix("--capture="))
			print("BINARY_GAMEPLAY_COMPLETE position=" + str(distance) + " warnings=" + str(R.warnings))
			get_tree().quit(0 if distance > 0 and R.warnings.is_empty() else 1)
			return
		if not gameplay_test and test_frame >= 120:
			var game = R.get_value(R.root, "m_Game")
			var menu = R.get_value(game, "m_Menu")
			var button = R.get_value(menu, "StoryMode")
			print("MENU_DIAGNOSTIC state=" + str(R.get_value(game, "m_iMenuState")) + " story_x=" + str(R.get_value(button, "x")) + " original=" + str(R.get_value(button, "m_fOriginalPosX")))
			if menu is R.Value: print("MENU_TRANSFORM " + str(menu.display.transform) + " alpha=" + str(menu.display.modulate) + " visible=" + str(menu.display.visible) + " parent=" + R.string(menu.parent_value()))
			for arg in OS.get_cmdline_user_args():
				if arg.begins_with("--capture="):
					var image: Image = get_viewport().get_texture().get_image()
					if image != null: image.save_png(arg.trim_prefix("--capture="))
			print("PORT_SMOKE_COMPLETE frame=" + str(R.root.frame) + " warnings=" + str(R.warnings))
			get_tree().quit()

func update_cinematic_audio() -> void :
	var frame: int = R.root.frame
	var position: float = -1.0
	if R.root.playing:
		if frame >= 114 and frame <= 352: position = float(frame - 114) / 30.0
		elif frame >= 411: position = float(239 + frame - 411) / 30.0
	if position < 0:
		if cinematic_audio.playing: cinematic_audio.stop()
	elif not cinematic_audio.playing or absf(cinematic_audio.get_playback_position() - position) > 0.15:
		if cinematic_audio.stream == null: cinematic_audio.stream = R.get_sound("res://assets/sounds/cinematic_stream.wav")
		cinematic_audio.play(position)
	cinematic_frame = frame

func hit_target(obj: Variant, point: Vector2) -> Variant:
	if not R.is_display(obj) or obj.mouse_target_count == 0 or not obj.display.visible or obj.display.modulate.a <= 0.01: return null
	var rectangle: Rect2
	if obj.fields.get("mouseChildren", true):
		for i in range(obj.children.size() - 1, -1, -1):
			var hit = hit_target(obj.children[i], point)
			if hit != null: return hit
	if obj.own_mouse_target and obj.fields.get("mouseEnabled", true):
		rectangle = Rect2(0, 0, 600, 400) if obj == R.root else R.hit_bounds(obj)
		if rectangle.has_point(obj.display.to_local(point)): return obj
	return null

func update_hover() -> void :
	if hover != null and not R.is_display(hover): hover = null
	var target = hit_target(R.stage, R.mouse_position)
	if target != hover:
		if hover != null: R.dispatch(hover, "mouseOut", {}, true);R.dispatch(hover, "rollOut", {}); if hover.kind == "button": R.goto_frame(hover, 1, false)
		hover = target
		if hover != null: R.dispatch(hover, "mouseOver", {}, true);R.dispatch(hover, "rollOver", {}); if hover.kind == "button": R.goto_frame(hover, 2, false)

func _input(event: InputEvent) -> void :
	if not boot_ready or R.stage == null: return
	if event is InputEventMouse: R.mouse_position = get_global_mouse_position().clamp(Vector2.ZERO, Vector2(600, 400))
	if event is InputEventKey:
		if event.pressed and not event.echo and event.keycode == KEY_F11:
			var game = R.get_value(R.root, "m_Game")
			if game != null: R.call_member(game, "SetFullscreen", [ not R.truth(game.fields.get("m_bFullscreen", false))])
			return
		var code: int = flash_keycode(event)
		if event.pressed: R.input_keys[code] = true
		else: R.input_keys.erase(code)
		var data: Dictionary = {"keyCode": code, "charCode": event.unicode, "shiftKey": event.shift_pressed, "ctrlKey": event.ctrl_pressed, "altKey": event.alt_pressed}
		R.dispatch(R.stage, "keyDown" if event.pressed else "keyUp", data)
		var focus = R.stage.fields.get("focus")
		if focus is R.Value and focus.kind == "edittext" and focus.fields.get("type") == "input" and event.pressed:
			var text: String = R.string(focus.fields.get("text", ""))
			if event.keycode == KEY_BACKSPACE: text = text.left(maxi(0, text.length() - 1))
			elif event.unicode >= 32: text += String.chr(event.unicode)
			R.set_value(focus, "text", text);R.dispatch(focus, "change", {}, true)
	if event is InputEventMouseButton:
		var target = hit_target(R.stage, get_global_mouse_position())
		var data: Dictionary = {"stageX": get_global_mouse_position().x, "stageY": get_global_mouse_position().y, "buttonDown": event.pressed, "delta": 1 if event.button_index == MOUSE_BUTTON_WHEEL_UP else -1}
		if event.button_index in [MOUSE_BUTTON_WHEEL_UP, MOUSE_BUTTON_WHEEL_DOWN]:
			if event.pressed: R.dispatch(target if target != null else R.stage, "mouseWheel", data, true)
		elif event.button_index == MOUSE_BUTTON_LEFT:
			if target == null: target = R.stage
			if event.pressed:
				down = target;R.stage.fields.focus = target;R.dispatch(target, "mouseDown", data, true)
				if target.kind == "button": R.goto_frame(target, 3, false)
			else:
				R.dispatch(target, "mouseUp", data, true)
				if target == down: R.dispatch(target, "click", data, true)
				down = null
	if event is InputEventMouseMotion: R.dispatch(R.stage, "mouseMove", {"stageX": get_global_mouse_position().x, "stageY": get_global_mouse_position().y}, true)

func flash_keycode(event: InputEventKey) -> int:
	var key: int = event.keycode
	var map: Dictionary = {KEY_ESCAPE: 27, KEY_ENTER: 13, KEY_KP_ENTER: 13, KEY_SPACE: 32, KEY_TAB: 9, KEY_BACKSPACE: 8, KEY_SHIFT: 16, KEY_CTRL: 17, KEY_ALT: 18, KEY_LEFT: 37, KEY_UP: 38, KEY_RIGHT: 39, KEY_DOWN: 40, KEY_DELETE: 46, KEY_INSERT: 45, KEY_HOME: 36, KEY_END: 35, KEY_PAGEUP: 33, KEY_PAGEDOWN: 34}
	return map.get(key, key if key < 256 else 0)

func _exit_tree() -> void :

	if catalog_thread != null:
		catalog_thread.wait_to_finish();catalog_thread = null
	R.prepared_catalogs.clear()
	if section_clock != null:
		section_clock.stop();R.lifecycle_observer = Callable()
		if benchmark: print("STREAM_PATTERN_PROBE " + JSON.stringify({"scheduler": section_clock.report(), "starts": section_program.starts, "finishes": section_program.finishes, "cancelled": section_program.cancelled, "active": section_program.active.size(), "pending": section_program.pending.size()}))
		section_program.clock = null
	R.cleanup()
