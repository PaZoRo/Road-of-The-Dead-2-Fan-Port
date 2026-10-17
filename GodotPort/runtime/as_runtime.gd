extends RefCounted

const Catalog = preload("res://runtime/catalog_data.gd")
const Value = preload("res://runtime/as_value.gd")
const NativeRoad = preload("res://runtime/native_road.gd")
const NativeRay = preload("res://runtime/native_ray.gd")
static var prepared_catalogs: Dictionary = {}
static var classes: Dictionary = {}
static var short_names: Dictionary = {}
static var scripts: Dictionary = {}
static var display_script: Script
static var statics: Dictionary = {}
static var class_tokens: Dictionary = {}
static var assets: Dictionary = {}
static var section_publication: Dictionary = {}
static var stage: Variant
static var root: Variant
const STREAM_LIFECYCLE_KEYS: Dictionary = {"BeginGameMode": true, "EndGameMode": true, "StartGameMode": true, "Reset": true}
static var lifecycle_observer: Callable
static var driver: Node
static var last_error: Variant
static var clips: Array = []
static var active_clips: Dictionary = {}
static var deferred_clips: Dictionary = {}
static var deferred_visual_frames: int = 0
static var batched_visual_frames: int = 0
static var batched_visual_instances: int = 0
static var visual_batches_enabled: bool = true
static var batch_frame_cache: Dictionary = {}
static var frame_queue: Array = []
static var textures: Dictionary = {}
static var texture_images: Dictionary = {}
static var texture_atlas: Dictionary = {}
static var visual_overrides: Dictionary = {}
static var hit_geometry: Dictionary = {}
static var bitmap_fast_path: bool = true
static var recycled_shapes: int = 0
static var mask_revision: int = 0
static var timelines: Dictionary = {}
static var compiled_placements_enabled: bool = true
static var pattern_data_enabled: bool = true
static var pattern_data_depth: int = 0
static var pattern_marker_safety: Dictionary = {}
static var deferred_pattern_markers: int = 0
static var materialized_pattern_markers: int = 0
static var timeline_states: Dictionary = {}
static var asset_bounds_cache: Dictionary = {}
static var symbol_classes: Dictionary = {}
static var values: Array = []
static var method_cache: Dictionary = {}
static var field_cache: Dictionary = {}
static var chain_cache: Dictionary = {}
static var field_type_cache: Dictionary = {}
static var cached_text_enabled: bool = true
static var text_regex_cache: Dictionary = {}
static var plain_text_cache: Dictionary = {}
static var plain_text_keys: Array[String] = []
static var plain_text_cursor: int = 0
const TEXT_CACHE_CAPACITY: int = 256
const TEXT_CACHE_MAX_LENGTH: int = 4096
static var accessor_flags: Dictionary = {}
const DISPLAY_PROPERTIES: Dictionary = {"x": true, "y": true, "scaleX": true, "scaleY": true, "rotation": true, "alpha": true, "visible": true, "parent": true, "root": true, "stage": true, "numChildren": true, "currentFrame": true, "totalFrames": true, "currentLabel": true, "currentFrameLabel": true, "currentLabels": true, "width": true, "height": true, "mouseX": true, "mouseY": true, "loaderInfo": true, "transform": true, "graphics": true, "textWidth": true, "textHeight": true}
const FAST_DISPLAY_KEYS: Dictionary = {"x": true, "y": true, "scaleX": true, "scaleY": true, "rotation": true, "alpha": true, "visible": true}
static var native_initializers: Dictionary = {}
static var native_field_defaults: Dictionary = {}
static var native_field_steps: Dictionary = {}
static var compiled_initializers_enabled: bool = true
static var native_world_loops_enabled: bool = true
static var road_batch_enabled: bool = true
static var road_interpolation_enabled: bool = true
static var native_cached_road_enabled: bool = true
static var native_values_enabled: bool = true
static var native_builtin_construction_enabled: bool = true
const SIMPLE_VALUE_CLASSES: Dictionary = {"DTVector3D": true, "DTVector2D": true, "Box": true}
const SIMPLE_NATIVE_SCHEMAS: Dictionary = {
	"Point": [["x", "y"], [0.0, 0.0]], 
	"Rectangle": [["x", "y", "width", "height"], [0.0, 0.0, 0.0, 0.0]], 
	"SoundTransform": [["volume", "pan"], [1.0, 0.0]], 
	"ColorTransform": [["redMultiplier", "greenMultiplier", "blueMultiplier", "alphaMultiplier", "redOffset", "greenOffset", "blueOffset", "alphaOffset"], [1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0]], 
	"Vector3D": [["x", "y", "z", "w"], [0.0, 0.0, 0.0, 0.0]], 
	"Matrix": [["a", "b", "c", "d", "tx", "ty"], [1.0, 0.0, 0.0, 1.0, 0.0, 0.0]], 
	"Matrix3D": [[], []]
}
static var native_stop_clips: Dictionary = {}
static var hotpath_script: Script
static var projection_script: Script
static var basic_construction_script: Script
static var native_basic_construction_enabled: bool = true
static var native_entity_construction_enabled: bool = true
const ENTITY_CONSTRUCTION_METHODS: Dictionary = {"RDEntity": {"RDEntity": "entity_constructor", "SetInitialState": "entity_reset"}, "RDObstacle": {"RDObstacle": "obstacle_constructor", "SetInitialState": "obstacle_reset"}, "RDEntityWithVoice": {"RDEntityWithVoice": "voiced_entity_constructor", "SetInitialState": "voiced_entity_reset"}}
static var sound_construction_script: Script
static var native_sound_construction_enabled: bool = true
const SOUND_CONSTRUCTORS: Dictionary = {"DTSound": "sound_constructor", "DTSpacialSound": "spatial_constructor"}
static var collection_script: Script
static var native_collections_enabled: bool = true
const COLLECTION_METHODS: Dictionary = {"RandomHat": {"RandomHat": "hat_constructor", "Clear": "hat_clear", "AddValue": "hat_add", "Reset": "hat_reset", "GetRandomValue": "hat_get", "IsEmpty": "hat_empty", "GetTotalNbValues": "hat_size"}, "SequentialArray": {"SequentialArray": "sequence_constructor", "AddValue": "sequence_add", "GetValue": "sequence_get", "GetNbValues": "sequence_size"}}
static var spawning_script: Script
static var snapshot_script: Script
static var gpu_pause_snapshot_enabled: bool = true
static var gpu_pause_snapshot_count: int = 0
static var gpu_pause_snapshot_us: int = 0
static var native_spawning_enabled: bool = true
static var hotpath_keys: Dictionary = {}
static var hotpaths_enabled: bool = true
static var source_bundles_enabled: bool = true
static var profiling_source_usage: bool = false
static var source_usage: Dictionary = {}
static var source_bundle_scripts: Dictionary = {}
static var source_bundle_pending: Dictionary = {}
static var source_background_started: int = 0
static var source_background_stats: Dictionary = {}
static var source_blocking_waits: int = 0
static var source_blocking_wait_us: int = 0
static var source_bundle_classes: Dictionary = {}
const LAZY_MODES: Dictionary = {"RDGameModeStory": true, "RDGameModeHardcore": true, "RDGameModeTime": true, "RDGameModeMilitary": true, "RDGameModeDistance": true, "RDGameModeChopperRescue": true, "RDGameModeChopperRescueSandbox": true, "RDGameModeMutant": true, "RDGameModeSandbox": true, "RDGameModeEditor": true, "RDGameModeCustom": true}
static var static_visual_cache: Dictionary = {}
static var fonts: Dictionary = {}
static var active_channels: Array = []
static var sounds: Dictionary = {}
static var warnings: Dictionary = {}
static var input_keys: Dictionary = {}
static var mouse_position: Vector2 = Vector2(300, 200)
static var elapsed: float = 0.0
static var tweens: Array = []
static var call_depth: int = 0
static var call_stack: Array = []
static var profiling_construction: bool = false
static var construction_stack: Array = []
static var construction_profile: Dictionary = {}
static var profiling: bool = false
static var profiling_hitches: bool = false
static var profiling_patterns: bool = false
static var pattern_load_depth: int = 0
static var hitch_events: Array = []
static var tracing: bool = false
static var profile: Dictionary = {}
static var profile_children: Array = []
static var native_methods: Array = ["stop", "play", "gotoAndStop", "gotoAndPlay", "nextFrame", "prevFrame", "addFrameScript", "addChild", "addChildAt", "removeChild", "removeChildAt", "getChildAt", "getChildByName", "getChildIndex", "setChildIndex", "swapChildren", "swapChildrenAt", "contains", "addEventListener", "removeEventListener", "dispatchEvent", "hasEventListener", "willTrigger", "toString", "valueOf", "hasOwnProperty", "getBounds", "getRect", "hitTestPoint", "hitTestObject", "localToGlobal", "globalToLocal", "setTextFormat", "getTextFormat", "replaceText", "setSelection", "appendText", "flush", "clear", "close", "load", "unload", "unloadAndStop", "readInt", "readUnsignedInt", "readShort", "readUnsignedShort", "readByte", "readUnsignedByte", "readFloat", "readDouble", "readBoolean", "readUTF", "readUTFBytes", "readBytes", "readObject", "writeInt", "writeUnsignedInt", "writeShort", "writeByte", "writeFloat", "writeDouble", "writeBoolean", "writeUTF", "writeUTFBytes", "writeBytes", "writeObject", "compress", "uncompress", "deflate", "inflate", "clone", "concat", "identity", "invert", "rotate", "scale", "translate", "transformPoint", "deltaTransformPoint", "setTo", "copyFrom", "offset", "offsetPoint", "inflatePoint", "normalize", "add", "subtract", "equals", "dispose", "draw", "fillRect", "copyPixels", "getPixel", "getPixel32", "setPixel", "setPixel32", "noise", "perlinNoise", "lock", "unlock", "applyFilter", "beginFill", "endFill", "lineStyle", "moveTo", "lineTo", "curveTo", "drawRect", "drawRoundRect", "drawCircle", "beginBitmapFill", "getTime", "getFullYear", "getMonth", "getDate", "getDay", "getHours", "getMinutes", "getSeconds", "getMilliseconds", "setTime"]
static var event_constants: Dictionary = {"ENTER_FRAME": "enterFrame", "FRAME_CONSTRUCTED": "frameConstructed", "ADDED_TO_STAGE": "addedToStage", "REMOVED_FROM_STAGE": "removedFromStage", "COMPLETE": "complete", "SOUND_COMPLETE": "soundComplete", "ACTIVATE": "activate", "DEACTIVATE": "deactivate", "RESIZE": "resize", "CHANGE": "change", "MOUSE_DOWN": "mouseDown", "MOUSE_UP": "mouseUp", "MOUSE_OVER": "mouseOver", "MOUSE_OUT": "mouseOut", "MOUSE_MOVE": "mouseMove", "MOUSE_WHEEL": "mouseWheel", "CLICK": "click", "ROLL_OVER": "rollOver", "ROLL_OUT": "rollOut", "KEY_DOWN": "keyDown", "KEY_UP": "keyUp", "IO_ERROR": "ioError", "SECURITY_ERROR": "securityError"}

static func load_catalog(name: String) -> Dictionary:
	if prepared_catalogs.has(name):
		var data: Dictionary = prepared_catalogs[name];prepared_catalogs.erase(name)
		return data
	return Catalog.read(name, not OS.get_cmdline_user_args().has("--no-catalog-cache"))

static func initialize(host: Node) -> void :
	lifecycle_observer = Callable()
	driver = host
	cached_text_enabled = not OS.get_cmdline_user_args().has("--no-cached-text")
	clear_text_cache()
	display_script = load("res://runtime/display.gd")
	hotpath_script = load("res://runtime/native_hotpaths.gd")
	projection_script = load("res://runtime/native_projection.gd")
	basic_construction_script = hotpath_script
	native_basic_construction_enabled = not OS.get_cmdline_user_args().has("--no-native-basic-construction")
	native_entity_construction_enabled = not OS.get_cmdline_user_args().has("--no-native-entity-construction")
	sound_construction_script = hotpath_script
	native_sound_construction_enabled = not OS.get_cmdline_user_args().has("--no-native-sound-construction")
	collection_script = hotpath_script
	native_collections_enabled = not OS.get_cmdline_user_args().has("--no-native-collections")
	spawning_script = load("res://runtime/native_spawning.gd")
	gpu_pause_snapshot_enabled = not OS.get_cmdline_user_args().has("--no-gpu-pause-snapshot")
	gpu_pause_snapshot_count = 0;gpu_pause_snapshot_us = 0
	if gpu_pause_snapshot_enabled and DisplayServer.get_name() != "headless": snapshot_script = load("res://runtime/native_snapshot.gd")
	native_spawning_enabled = not OS.get_cmdline_user_args().has("--no-native-spawning")
	hotpath_keys = load_catalog("native_hotpaths")
	profiling_source_usage = OS.get_cmdline_user_args().has("--profile-source-usage")
	source_usage.clear();source_background_stats.clear()
	if source_bundle_pending.is_empty(): source_background_started = 0
	source_blocking_waits = 0;source_blocking_wait_us = 0
	source_bundles_enabled = not OS.get_cmdline_user_args().has("--no-source-bundles")
	if source_bundles_enabled and FileAccess.file_exists("res://data/source_bundles.json"):
		source_bundle_classes = load_catalog("source_bundles").classes
		for group in boot_source_bundle_groups(): source_bundle_for(group)
	compiled_placements_enabled = not OS.get_cmdline_user_args().has("--no-compiled-placements")
	compiled_initializers_enabled = not OS.get_cmdline_user_args().has("--no-compiled-initializers")
	native_world_loops_enabled = not OS.get_cmdline_user_args().has("--no-native-world-loops")
	road_batch_enabled = not OS.get_cmdline_user_args().has("--no-road-batch")
	road_interpolation_enabled = not OS.get_cmdline_user_args().has("--no-road-interpolation")
	native_cached_road_enabled = not OS.get_cmdline_user_args().has("--no-cached-road-renderer")
	native_values_enabled = not OS.get_cmdline_user_args().has("--no-native-values")
	native_builtin_construction_enabled = not OS.get_cmdline_user_args().has("--no-native-builtin-construction")
	native_field_steps.clear()
	pattern_data_enabled = not OS.get_cmdline_user_args().has("--no-pattern-data")
	profiling_construction = OS.get_cmdline_user_args().has("--profile-construction")
	construction_stack.clear();construction_profile.clear()
	profiling = OS.get_cmdline_user_args().has("--profile")
	profiling_hitches = OS.get_cmdline_user_args().has("--profile-hitches")
	profiling_patterns = OS.get_cmdline_user_args().has("--profile-patterns")
	hitch_events.clear()
	tracing = OS.get_cmdline_user_args().has("--trace")
	classes = load_catalog("classes")
	if FileAccess.file_exists("res://data/native_initializers.json"):
		var catalog: Dictionary = load_catalog("native_initializers");native_initializers = catalog.classes
		for owner in catalog.empty_methods:
			if classes.has(owner):
				var no_ops: Array = classes[owner].get("empty_methods", []).duplicate()
				for key in catalog.empty_methods[owner]:
					if not no_ops.has(key): no_ops.append(key)
				classes[owner].empty_methods = no_ops
		for owner in catalog.get("stop_clips", []): native_stop_clips[owner] = true
	for owner in classes:
		empty_methods[owner] = {}
		for key in classes[owner].get("empty_methods", []): empty_methods[owner][key] = true
	assets = load_catalog("assets")
	if FileAccess.file_exists("res://data/texture_atlas.json"): texture_atlas = load_catalog("texture_atlas")
	hit_geometry = JSON.parse_string(FileAccess.get_file_as_string("res://data/hit_geometry.json")) if FileAccess.file_exists("res://data/hit_geometry.json") else {}
	visual_overrides = JSON.parse_string(FileAccess.get_file_as_string("res://data/visual_overrides.json")) if FileAccess.file_exists("res://data/visual_overrides.json") else {}
	for name in classes:
		short_names[String(name).get_slice(".", String(name).get_slice_count(".") - 1)] = name
	native_methods.append_array(["appendRotation", "prependRotation", "appendTranslation", "prependTranslation", "appendScale", "prependScale", "append", "prepend", "transformVector", "deltaTransformVector", "transformVectors", "getObjectsUnderPoint", "getPixels", "setPixels", "extract", "browse", "save", "start", "reset", "getDefinition", "isDefaultPrevented", "apply", "call"])
	native_methods.append_array(["preventDefault", "stopPropagation", "stopImmediatePropagation"])
	for name in assets.symbols:
		if classes.has(name): symbol_classes[assets.symbols[name]] = name
	stage = Value.new()
	stage.class_id = "Stage"
	stage.kind = "stage"
	stage.on_stage = true
	stage.display = Node2D.new()
	var display_host: Node = host.get_node_or_null("GameDisplay")
	(display_host if display_host != null else host).add_child(stage.display)
	stage.fields = {"stageWidth": 600, "stageHeight": 400, "frameRate": 30, "quality": "high", "scaleMode": "noScale", "align": "TL", "focus": null, "showDefaultContextMenu": false}

static func canonical(name: String, owner: String = "") -> String:
	if classes.has(name): return name
	if short_names.has(name): return short_names[name]
	if owner != "" and classes.has(owner):
		for imp in classes[owner].get("imports", []):
			if String(imp).ends_with("." + name) and classes.has(imp): return imp
	return name

static func klass(name: String, owner: String = "") -> Dictionary:
	name = canonical(name, owner)
	if not class_tokens.has(name): class_tokens[name] = {"@class": name}
	return class_tokens[name]

static func script_for(name: String) -> Variant:
	if not scripts.has(name):
		var began: int = Time.get_ticks_usec() if profiling_hitches else 0
		scripts[name] = load(classes[name].path)
		if profiling_hitches: record_hitch("script", name, began)
	return scripts[name]

static func record_hitch(category: String, label: String, began: int) -> void :
	var duration: int = Time.get_ticks_usec() - began
	if duration >= 10000 or profiling_patterns and pattern_load_depth > 0 or label.begins_with("RDLevelPatternCustomNew."): hitch_events.append({"kind": category, "name": label, "ms": duration / 1000.0, "elapsed": elapsed})

static func base_of(name: String) -> String:
	if classes.has(name): return canonical(classes[name].base, name)
	return {"MovieClip": "Sprite", "Sprite": "DisplayObjectContainer", "DisplayObjectContainer": "InteractiveObject", "InteractiveObject": "DisplayObject", "SimpleButton": "InteractiveObject", "TextField": "InteractiveObject", "Bitmap": "DisplayObject", "Shape": "DisplayObject", "DisplayObject": "EventDispatcher", "Sound": "EventDispatcher", "EventDispatcher": "Object"}.get(name, "")

static func chain(name: String) -> Array:
	if chain_cache.has(name): return chain_cache[name]
	var original: String = name
	var result: Array = []
	while name != "" and not result.has(name):
		result.push_front(name)
		name = base_of(name)
	chain_cache[original] = result
	return result

static func ensure_statics(name: String) -> void :
	if statics.has(name): return
	statics[name] = {}
	if classes.has(name):
		var parent: String = base_of(name)
		if parent != "": ensure_statics(parent)
		if not classes[name].get("passive", false): run_method(klass(name), name, "init_statics", [])

static func method_owner(name: String, key: String) -> String:
	var original: String = name
	if method_cache.has(original) and method_cache[original].has(key): return method_cache[original][key]
	var result: String = ""
	while name != "":
		if classes.has(name) and classes[name].methods.has(key): result = name;break
		name = base_of(name)
	if not method_cache.has(original): method_cache[original] = {}
	method_cache[original][key] = result
	return result

static func field_owner(name: String, key: String) -> String:
	var original: String = name
	if field_cache.has(original) and field_cache[original].has(key): return field_cache[original][key]
	var result: String = ""
	while name != "":
		if classes.has(name) and classes[name].fields.has(key): result = name;break
		name = base_of(name)
	if not field_cache.has(original): field_cache[original] = {}
	field_cache[original][key] = result
	return result

const EMPTY_MAP: Dictionary = {}
const SPAWNING_KEYS: Dictionary = {"RDGame": {"GetMC": true, "GetEntity": true, "AddEntity": true}, "RDWorld": {"GetEntityNode": true, "AddEntity": true}, "RDEntity": {"InitMCs": true}}
const NATIVE_KEYS: Dictionary = {
	"RDGame": {"StartGameMode": true, "GetMC": true, "GetEntity": true, "AddEntity": true}, 
	"DTSound": {"GetVolume": true, "GetPan": true, "UpdateVolume": true, "SetVolume": true, "SetPan": true, "SetVolumeAndPan": true}, 
	"DTSoundGroup": {"GetVolume": true, "GetPan": true}, 
	"Maths": {
		"Clamp": true, 
		"Lerp": true
	}, 
	"RGBA": {
		"Lerp": true, 
		"ToInteger": true
	}, 
	"RDRoad": {
		"Render": true, 
		"RenderGround": true, 
		"RenderSideWall": true, 
		"RenderFrontWall": true, 
		"PrecomputePositions": true, 
		"Project3DTo2DQuick": true
	}, 
	"RDCamera": {
		"Project3DTo2D": true
	}, 
	"RDWorld": {
		"GetEntityNode": true, "AddEntity": true, 
		"Update": true, 
		"Render": true, 
		"MoveEntity": true, 
		"GetPerlinX": true, 
		"GetPerlinY": true, 
		"CompareDepth": true, 
		"EntityOverlapsInX": true, 
		"EntityOverlapsInY": true
	}, 
	"RDEntity": {
		"InitMCs": true, 
		"Render": true, 
		"UpdateDepthPosition": true, 
		"IsOutOfLevel": true, 
		"CanCollideWith": true, 
		"Update": true, 
		"UpdateAttachedSounds": true
	}, 
	"RDPlayer": {
		"CanCollideWith": true, 
		"SafeHideClingerMC": true, 
		"UpdateMovement": true
	}, 
	"RDObstacle": {
		"CanCollideWith": true, 
		"IsOutOfLevel": true, 
		"Update": true
	}, 
	"RDHud": {
		"UpdateEyeBloods": true, "UpdateLocation": true, "UpdateRPDisplay": true
	}, 
	"RDObstacleCar": {"Update": true}, 
	"RDBuildingNew": {"Update": true, "IsOutOfLevel": true}, 
	"Perlin": {
		"noise": true
	}
}
static var implementations: Dictionary = {}
static var resolved_methods: Dictionary = {}
static var runtime_script: Script
static var empty_methods: Dictionary = {}
static var entity_behaviors: Dictionary = {}

static func run_method(receiver: Variant, owner: String, key: String, args: Array) -> Variant:
	if STREAM_LIFECYCLE_KEYS.has(key) and lifecycle_observer.is_valid(): lifecycle_observer.call(receiver, owner, key)
	if (key == "init_fields" or key == "init_statics") and native_initializers.get(owner, EMPTY_MAP).has(key):
		apply_native_initializer(receiver, owner, key);return null
	if receiver is Value and receiver.lazy_kind == 2:
		if key == "SetPlayer": receiver.fields["@lazy_mode"].player = args[0];receiver.fields.m_Player = args[0];return null
		materialize_mode(receiver)
	if receiver is Value and receiver.lazy_kind == 3: materialize_player(receiver)
	elif receiver is Value and receiver.lazy_kind == 4: materialize_pattern_marker(receiver)
	if receiver is Value and receiver.lazy_kind == 1:
		if key == "IsShown": return false
		if key == "Hide": call_member(receiver.fields.m_Game, "SetToolTip", ["", null]);return null
		var mode = receiver.fields["@lazy_upgrade"];receiver.fields.erase("@lazy_upgrade");receiver.lazy_kind = 0
		implementation_source(receiver, "RDUpgradeScreen", "RDUpgradeScreen", [mode])
	if not profiling:
		if empty_methods.get(owner, EMPTY_MAP).has(key): return null
		var methods: Dictionary = resolved_methods.get(owner, EMPTY_MAP)
		if not methods.has(key): return resolve_implementation(owner, key).call(receiver, args)
		return methods[key].call(receiver, args)
	var started: int = Time.get_ticks_usec();profile_children.append(0)
	var result = optimized_method(receiver, owner, key, args)
	var spent: int = Time.get_ticks_usec() - started; var children: int = profile_children.pop_back(); var name: String = owner + "." + key
	if not profile.has(name): profile[name] = [0, 0, 0]
	profile[name][0] += 1;profile[name][1] += spent;profile[name][2] += spent - children
	if not profile_children.is_empty(): profile_children[-1] += spent
	return result

static func materialize_mode(mode: Variant) -> void :
	if not mode.fields.has("@lazy_mode"): return
	var pending: Dictionary = mode.fields["@lazy_mode"];mode.fields.erase("@lazy_mode");mode.lazy_kind = 0
	implementation_source(mode, mode.class_id, mode.class_id, pending.args)
	if pending.has("player"): call_member(mode, "SetPlayer", [pending.player])

static func materialize_player(player: Value) -> void :
	if not player.fields.has("@lazy_player"): return
	player.fields.erase("@lazy_player");player.lazy_kind = 0
	var persistent: bool = player.fields.m_bDoNotDestroy
	implementation_source(player, "RDPlayer", "RDPlayer", [])
	player.fields.m_bDoNotDestroy = persistent

static func optimized_method(receiver: Variant, owner: String, key: String, args: Array) -> Variant:
	if empty_methods.get(owner, EMPTY_MAP).has(key): return null
	var methods: Dictionary = resolved_methods.get(owner, EMPTY_MAP)
	return methods[key].call(receiver, args) if methods.has(key) else resolve_implementation(owner, key).call(receiver, args)

static func resolve_implementation(owner: String, key: String) -> Callable:
	if runtime_script == null: runtime_script = load("res://runtime/as_runtime.gd")
	var implementation: Callable
	if owner == "Maths" and key == "RayTriangleIntersection" and not OS.get_cmdline_user_args().has("--reference-ray"): implementation = Callable(NativeRay, "triangle")
	elif owner == "Maths" and key == "RayQuadIntersection" and not OS.get_cmdline_user_args().has("--reference-ray"): implementation = Callable(NativeRay, "quad")
	elif empty_methods.get(owner, EMPTY_MAP).has(key): implementation = Callable(runtime_script, "empty_implementation")
	elif native_basic_construction_enabled and owner == "BasicObject" and key == "BasicObject": implementation = Callable(basic_construction_script, "basic_constructor")
	elif native_entity_construction_enabled and ENTITY_CONSTRUCTION_METHODS.get(owner, EMPTY_MAP).has(key): implementation = Callable(hotpath_script, ENTITY_CONSTRUCTION_METHODS[owner][key])
	elif native_sound_construction_enabled and owner == key and SOUND_CONSTRUCTORS.has(owner): implementation = Callable(sound_construction_script, SOUND_CONSTRUCTORS[owner])
	elif native_collections_enabled and COLLECTION_METHODS.get(owner, EMPTY_MAP).has(key): implementation = Callable(collection_script, COLLECTION_METHODS[owner][key])
	elif NATIVE_KEYS.get(owner, EMPTY_MAP).has(key) and (native_spawning_enabled or not SPAWNING_KEYS.get(owner, EMPTY_MAP).has(key)): implementation = Callable(runtime_script, "run_native_method").bind(owner, key)
	elif hotpaths_enabled and hotpath_keys.get(owner, EMPTY_MAP).has(key): implementation = Callable(hotpath_script, hotpath_keys[owner][key])
	elif classes.has(owner) and classes[owner].methods.has(key):
		var name: String = classes[owner].methods[key][0]
		var bundled: Dictionary = source_bundle_classes.get(owner, EMPTY_MAP) if source_bundles_enabled else EMPTY_MAP
		if profiling_source_usage and bundled.get("functions", EMPTY_MAP).has(name): record_source_usage(owner, name)
		implementation = Callable(source_bundle_for_function(bundled, name), bundled.functions[name]) if bundled.get("functions", EMPTY_MAP).has(name) else Callable(script_for(owner), name)
	else: implementation = Callable(runtime_script, "source_dispatch").bind(owner, key)
	if profiling_hitches: implementation = Callable(runtime_script, "hitch_implementation").bind(implementation, owner + "." + key)
	if not resolved_methods.has(owner): resolved_methods[owner] = {}
	resolved_methods[owner][key] = implementation;return implementation

static func empty_implementation(_receiver: Variant, _args: Array) -> Variant: return null

static func hitch_implementation(receiver: Variant, args: Array, implementation: Callable, label: String) -> Variant:
	var loading: bool = label == "RDLevelPatternCustomNew.Load"
	if loading: pattern_load_depth += 1
	var began: int = Time.get_ticks_usec(); var result: Variant = implementation.call(receiver, args)
	record_hitch("method", label, began)
	if loading: pattern_load_depth -= 1
	return result

static func source_dispatch(receiver: Variant, args: Array, owner: String, key: String) -> Variant: return implementation_source(receiver, owner, key, args)

static func record_source_usage(owner: String, name: String) -> void :
	if not source_usage.has(owner): source_usage[owner] = {}
	source_usage[owner][name] = true

static func boot_source_bundle_groups() -> Array[String]:
	var groups: Array[String] = ["startup"]
	if OS.get_cmdline_user_args().has("--eager-source-scripts"): groups.append_array(["actors", "game", "interface", "utilities"])
	if OS.get_cmdline_user_args().has("--eager-editor-scripts"): groups.append("editor")
	return groups

static func source_bundle_for_function(bundled: Dictionary, name: String) -> Script:
	return source_bundle_for(bundled.get("groups", EMPTY_MAP).get(name, bundled.bundle))

static func source_bundle_for(group: String) -> Script:
	if source_bundle_scripts.has(group): return source_bundle_scripts[group]
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	var path: String = "res://runtime/source_" + group + ".gd"
	if source_bundle_pending.has(group):


		var blocking: bool = ResourceLoader.load_threaded_get_status(path) == ResourceLoader.THREAD_LOAD_IN_PROGRESS
		var waiting: int = Time.get_ticks_usec() if blocking else 0
		var prepared: Script = ResourceLoader.load_threaded_get(path)
		if blocking: source_blocking_waits += 1;source_blocking_wait_us += Time.get_ticks_usec() - waiting
		source_bundle_pending.erase(group)
		if prepared != null: source_bundle_scripts[group] = prepared
	if not source_bundle_scripts.has(group): source_bundle_scripts[group] = load(path)
	if profiling_hitches: record_hitch("bundle", group, began)
	return source_bundle_scripts[group]

static func prefetch_source_bundles() -> void :
	if not source_bundles_enabled or OS.get_cmdline_user_args().has("--no-background-source-scripts"): return
	for group: String in ["actors", "game", "interface", "utilities"]:
		if source_bundle_scripts.has(group) or source_bundle_pending.has(group): continue
		var path: String = "res://runtime/source_" + group + ".gd"
		if ResourceLoader.has_cached(path): source_bundle_scripts[group] = load(path);continue
		var error: Error = ResourceLoader.load_threaded_request(path, "GDScript")
		if error == OK:
			source_bundle_pending[group] = path
			if source_background_started == 0: source_background_started = Time.get_ticks_msec()
		else: push_error("Background source request failed: " + path + " code=" + str(error))

static func poll_source_bundles() -> void :
	if source_bundle_pending.is_empty():
		if source_background_started > 0:
			source_background_stats = {"elapsed_ms": Time.get_ticks_msec() - source_background_started, "blocking_waits": source_blocking_waits, "blocking_wait_ms": source_blocking_wait_us / 1000.0, "loaded_groups": source_bundle_scripts.keys()}
			source_background_started = 0
			if OS.get_cmdline_user_args().has("--profile-startup") or OS.get_cmdline_user_args().has("--benchmark"): print("BACKGROUND_SOURCE_READY " + JSON.stringify(source_background_stats))
		return
	for group: String in source_bundle_pending.keys():
		var path: String = source_bundle_pending[group]
		var status: ResourceLoader.ThreadLoadStatus = ResourceLoader.load_threaded_get_status(path)
		if status == ResourceLoader.THREAD_LOAD_LOADED: source_bundle_for(group)
		elif status != ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			push_error("Background source load failed: " + path + " status=" + str(status));source_bundle_pending.erase(group)

static func implementation_source(receiver: Variant, owner: String, key: String, args: Array) -> Variant:
	var bundled: Dictionary = source_bundle_classes.get(owner, EMPTY_MAP) if source_bundles_enabled else EMPTY_MAP
	var name: String = classes.get(owner, EMPTY_MAP).get("methods", EMPTY_MAP).get(key, [""])[0]
	if bundled.get("functions", EMPTY_MAP).has(name):
		if profiling_source_usage: record_source_usage(owner, name)
		return source_bundle_for_function(bundled, name).call(bundled.functions[name], receiver, args)
	return source_method(receiver, owner, key, args)

static func initializer_value(recipe: Variant) -> Variant:
	if recipe is Array:
		var result: Array = []
		for item in recipe: result.append(initializer_value(item))
		return result
	if not recipe is Dictionary: return recipe
	if recipe.has("@number"): return NAN if recipe["@number"] == "NAN" else INF
	if recipe.has("@coerce"): return coerce(initializer_value(recipe.value), recipe["@coerce"])
	if recipe.has("@class_recipe"): return klass(recipe["@class_recipe"])
	if recipe.has("@construct"): return construct(initializer_value(recipe["@construct"]), initializer_value(recipe.args))
	if recipe.has("@static_recipe"):
		var values: Array = recipe["@static_recipe"];return static_value(values[0], values[1])
	if recipe.has("@unary_recipe"):
		var values: Array = recipe["@unary_recipe"];return unary(values[0], initializer_value(values[1]))
	if recipe.has("@binary_recipe"):
		var values: Array = recipe["@binary_recipe"];return binary(values[0], initializer_value(values[1]), initializer_value(values[2]))
	return recipe.duplicate(true)

static func initializer_is_literal(recipe: Variant) -> bool:
	if recipe is Array:
		for item in recipe:
			if not initializer_is_literal(item): return false
	if recipe is Dictionary:
		if recipe.has("@construct") or recipe.has("@static_recipe") or recipe.has("@class_recipe"): return false
		for item in recipe.values():
			if not initializer_is_literal(item): return false
	return true

static func apply_native_initializer(receiver: Variant, owner: String, key: String) -> void :
	var instructions: Array = native_initializers[owner][key]
	if key == "init_fields":
		if not native_field_defaults.has(owner):
			var defaults: Dictionary = {}; var literal: bool = true
			for instruction in instructions:
				if not initializer_is_literal(instruction[1]): literal = false;break
				defaults[instruction[0]] = initializer_value(instruction[1])
			native_field_defaults[owner] = defaults if literal else null
		var defaults: Variant = native_field_defaults[owner]
		if defaults != null: receiver.fields.merge(defaults.duplicate(true), true);return
		if compiled_initializers_enabled:
			if not native_field_steps.has(owner):
				var steps: Array = []; var literals: Dictionary = {}
				for instruction in instructions:
					if initializer_is_literal(instruction[1]): literals[instruction[0]] = initializer_value(instruction[1])
					else:
						if not literals.is_empty(): steps.append(literals);literals = {}
						steps.append(instruction)
				if not literals.is_empty(): steps.append(literals)
				native_field_steps[owner] = steps
			for step in native_field_steps[owner]:
				if step is Dictionary: receiver.fields.merge(step.duplicate(true), true)
				else: receiver.fields[step[0]] = initializer_value(step[1])
			return
		for instruction in instructions: receiver.fields[instruction[0]] = initializer_value(instruction[1])
	else:
		for instruction in instructions: set_value(receiver, instruction[0], initializer_value(instruction[1]))

static func run_native_method(receiver: Variant, args: Array, owner: String, key: String) -> Variant:
	if owner == "RDGame":
		if key == "GetMC": return spawning_script.get_mc(receiver, args)
		if key == "GetEntity": return spawning_script.get_entity(receiver, args)
		if key == "AddEntity": return spawning_script.add_game_entity(receiver, args)
	if owner == "RDWorld":
		if key == "GetEntityNode": return spawning_script.get_entity_node(receiver, args)
		if key == "AddEntity": return spawning_script.add_world_entity(receiver, args)
	if owner == "RDEntity" and key == "InitMCs": return spawning_script.init_mcs(receiver, args)
	if owner == "RDGame" and key == "StartGameMode":
		if not args.is_empty() and args[0] is Value:
			var selected: Value = args[0]
			if selected.lazy_kind == 2: materialize_mode(selected)
			var player: Variant = selected.fields.get("m_Player")
			if player is Value and player.lazy_kind == 3: materialize_player(player)
		return implementation_source(receiver, owner, key, args)
	if owner in ["DTSound", "DTSoundGroup"]:
		if key == "GetVolume": return fast_sound_gain(receiver)
		if key == "GetPan": return fast_sound_pan(receiver)
		if key == "UpdateVolume": fast_sound_volume(receiver);return null
		var f: Dictionary = receiver.fields; var changed: bool = false
		if key in ["SetVolume", "SetVolumeAndPan"]:
			var volume: float = num(args[0]);changed = volume != f.m_fVolume;f.m_fVolume = volume
		if key in ["SetPan", "SetVolumeAndPan"]:
			var pan: float = num(args[1] if key == "SetVolumeAndPan" else args[0]);changed = changed or pan != f.m_fPan;f.m_fPan = pan
		if changed: call_member(receiver, "UpdateVolume", [])
		return null
	if owner == "RDPlayer" and key == "SafeHideClingerMC":
		var clip: Value = args[0]
		if not truth(args[1]) and clip.parent_value() != null:
			remove_child(clip.parent_value(), clip);clip.display.visible = false;clip.fields.visible = false
		return null
	if owner == "RDRoad" and key == "Render":
		if native_cached_road_enabled: return fast_road_render(receiver, args)
		return implementation_source(receiver, owner, key, args)
	if owner == "RDHud" and key == "UpdateLocation": fast_hud_location(receiver);return null
	if owner == "RDHud" and key == "UpdateRPDisplay":
		var info: Dictionary = receiver.fields.m_Game.fields.m_PlayerInfo.fields
		info.m_iRP = clampf(num(info.m_iRP), 0, 5000) if is_finite(num(info.m_iRP)) else 0
		set_value(get_value(get_value(receiver.fields.m_HudMC, "RPDisplay"), "RPDisplay"), "text", floorf(info.m_iRP));return null
	if owner == "RDObstacleCar" and key == "Update": fast_car_update(receiver, num(args[0]));return null
	if owner == "RDBuildingNew":
		if key == "IsOutOfLevel": return receiver.fields.m_vLocation.fields.Z - args[0].fields.m_vLocation.fields.Z < -10
		if key == "Update":
			run_method(receiver, "RDObstacle", "Update", args)
			var e: Dictionary = receiver.fields; var camera = statics.RDGame.Instance.fields.m_CurrentGameMode.fields.m_Camera
			var difference: float = e.m_fRelativeLocationX - camera.fields.m_fRelativeLocationX
			var frame: int = int(floor(5 + 85 * clampf((difference if e.m_bRight else - difference) / 20.0, 0, 1) + 0.5))
			if frame != e.m_iFrame: e.m_iFrame = frame;goto_frame(e.m_MC, frame, false)
			return null
	if owner == "Maths":
		if key == "Clamp": return clampf(num(args[0]), num(args[1]), num(args[2]))
		if key == "Lerp": return num(args[0]) + (num(args[1]) - num(args[0])) * num(args[2])
	if owner == "RGBA":
		if key == "Lerp":
			var ratio: float = num(args[2]); var source: Dictionary = args[0].fields; var target: Dictionary = args[1].fields; var output: Dictionary = args[3].fields
			for channel in ["R", "G", "B", "A"]: output[channel] = int(ratio * target[channel] + (1 - ratio) * source[channel])
			return null
		if key == "ToInteger": return int(receiver.fields.R * 65536 + receiver.fields.G * 256 + receiver.fields.B)
	if owner == "RDRoad" and key in ["RenderGround", "RenderSideWall", "RenderFrontWall"]: fast_road_quad(receiver, key, args);return null
	if owner == "RDRoad" and key == "PrecomputePositions":
		NativeRoad.precompute(receiver, args[0], statics.RDRoad, statics.RDWorld, statics.BasicGame.Instance.fields.m_Viewport.fields);return null
	if owner == "RDCamera" and key == "Project3DTo2D": fast_project(receiver, args[0], args[1], truth(arg(args, 2, true)), false);return null
	if owner == "RDRoad" and key == "Project3DTo2DQuick": fast_project(args[1], args[0], args[2], true, true, receiver);return null
	if owner == "RDWorld":
		if key == "Update":
			if native_world_loops_enabled: fast_world_update(receiver, args[0], args[1]);return null
			return implementation_source(receiver, owner, key, args)
		if key == "Render":
			projection_script.render_world(receiver, args[0])
			return null
		if key == "MoveEntity": fast_move_entity(receiver, args);return null
		if key in ["GetPerlinX", "GetPerlinY"]:
			var world: Dictionary = statics.RDWorld
			if not world.m_bCurvyRoads: return 0.0
			var track: Array = world.m_PerlinXTrack if key == "GetPerlinX" else world.m_PerlinYTrack
			if track.is_empty(): return 0.0
			var z: float = num(args[0]) - world.m_iPerlinTrackPosition; var index: int = maxi(0, int(floor(z)))
			return lerpf(num(track[mini(index, track.size() - 1)]), num(track[mini(index + 1, track.size() - 1)]), z - floor(z))
		if key == "CompareDepth":
			var x: Dictionary = args[0].fields; var y: Dictionary = args[1].fields
			return x.m_iEntityIndex < y.m_iEntityIndex if x.m_fDepthPosition == y.m_fDepthPosition else x.m_fDepthPosition > y.m_fDepthPosition
		if key in ["EntityOverlapsInX", "EntityOverlapsInY"]:
			var axis: String = "X" if key == "EntityOverlapsInX" else "Y"; var size: String = "W" if axis == "X" else "H"
			var x: Dictionary = args[0].fields; var y: Dictionary = args[1].fields; var bx: Dictionary = x.m_CollisionBounds.fields; var by: Dictionary = y.m_CollisionBounds.fields
			if by[size] == 0: return false
			var start_x: float = x.m_vLocation.fields[axis] + bx[axis]; var end_x: float = start_x + bx[size]
			var start_y: float = y.m_vLocation.fields[axis] + by[axis]; var end_y: float = start_y + by[size]
			return start_x <= end_y and end_x >= start_y
	if owner == "RDEntity" and key == "Render": fast_entity_render(receiver, args[0]);return null
	if owner == "RDEntity" and key == "UpdateDepthPosition": fast_depth(receiver);return null
	if owner == "RDEntity" and key == "IsOutOfLevel": return receiver.fields.m_vLocation.fields.Z - args[0].fields.m_vLocation.fields.Z < -5
	if owner == "RDEntity" and key == "CanCollideWith": return false
	if owner == "RDEntity" and key == "Update": fast_entity_update(receiver, args);return null
	if owner == "RDEntity" and key == "UpdateAttachedSounds": fast_attached_sounds(receiver);return null
	if owner == "RDPlayer" and key == "CanCollideWith":
		var e: Dictionary = receiver.fields; var groups: Dictionary = statics.RDEntity; var group: int = args[0].fields.m_iCollisionGroup
		return ( not e.m_bChopperMode or e.m_vVelocity.fields.Z == 0) and group in [groups.CollisionGroup_Humanoid, groups.CollisionGroup_SpikeStrip, groups.CollisionGroup_OilSlick, groups.CollisionGroup_Obstacle, groups.CollisionGroup_Ramp, groups.CollisionGroup_Building, groups.CollisionGroup_Volume]
	if owner == "RDPlayer" and key == "UpdateMovement": fast_player_movement(receiver, num(args[0]));return null
	if owner == "RDObstacle" and key == "CanCollideWith":
		var e: Dictionary = receiver.fields; var group: int = args[0].fields.m_iCollisionGroup
		return group in [statics.RDEntity.CollisionGroup_Player, statics.RDEntity.CollisionGroup_Missile] and not e.m_bHit and (e.m_fHP != 0 or e.m_bAlwaysCanGetHit)
	if owner == "RDObstacle" and key == "IsOutOfLevel": return receiver.fields.m_vLocation.fields.Z - args[0].fields.m_vLocation.fields.Z < -25
	if owner == "RDObstacle" and key == "Update":
		fast_entity_update(receiver, args)
		var e: Dictionary = receiver.fields
		if e.m_bCanBeDestroyed and not truth(call_member(receiver, "HasSoundPlaying", [])): e.m_bDestroyMe = true
		if e.m_fExplosionDelay > 0:
			e.m_fExplosionDelay -= num(args[0])
			if e.m_fExplosionDelay <= 0: call_member(receiver, "Explode", [e.m_ExplodeInstigator])
		return null
	if owner == "RDHud" and key == "UpdateEyeBloods":
		var rate: float = statics.RDHud.BloodFadeRate * num(args[0])
		for blood in receiver.fields.m_HudMC.fields.Bloods.children:
			if blood.display.modulate.a > 0: blood.display.modulate.a = maxf(0, blood.display.modulate.a - rate)
		return null
	if owner == "Perlin" and key == "noise": return fast_perlin(args)
	return implementation_source(receiver, owner, key, args)

static func fast_sound_gain(sound: Value) -> float:
	var f: Dictionary = sound.fields
	var gain: float = f.m_fVolume * f.m_fMaxVolume * f.get("m_fMixVolume", 1.0)
	var parent: Value = f.m_SoundGroup
	if parent != null: gain *= fast_sound_gain(parent) if parent.class_id == "DTSoundGroup" else num(call_member(parent, "GetVolume", []))
	return gain

static func fast_sound_pan(sound: Value) -> float:
	var f: Dictionary = sound.fields; var parent: Value = f.m_SoundGroup
	return clampf(f.m_fPan + (fast_sound_pan(parent) if parent.class_id == "DTSoundGroup" else num(call_member(parent, "GetPan", []))), -1, 1) if parent != null else f.m_fPan

static func fast_sound_volume(sound: Value) -> void :
	var f: Dictionary = sound.fields; var channel: Value = f.m_SoundChannel
	if channel == null: return
	var transform: Value = f.m_SoundTransform
	transform.fields.volume = fast_sound_gain(sound);transform.fields.pan = fast_sound_pan(sound);channel.fields.soundTransform = transform
	if is_instance_valid(channel.audio): channel.audio.volume_db = linear_to_db(maxf(1e-05, transform.fields.volume))

static func source_method(receiver: Variant, owner: String, key: String, args: Array) -> Variant:
	if empty_methods.get(owner, EMPTY_MAP).has(key): return null
	if tracing and call_depth < 10 and (key in ["Init", "init_statics", "init_fields"] or key.begins_with("InitStatic")): print("TRACE " + str(call_depth) + " " + owner + "." + key)
	if not classes.has(owner) or not classes[owner].methods.has(key): return native_call(receiver, key, args)
	if not implementations.has(owner): implementations[owner] = {}
	var methods: Dictionary = implementations[owner]
	if not methods.has(key): methods[key] = Callable(script_for(owner), classes[owner].methods[key][0])
	call_depth += 1
	if tracing: call_stack.append(owner + "." + key)
	if call_depth > 200:
		push_error("Recursion limit: " + owner + "." + key)
		call_depth -= 1
		if tracing: call_stack.pop_back()
		return null
	var implementation: Callable = methods[key]
	var hitch_start: int = Time.get_ticks_usec() if profiling_hitches else 0
	var result = implementation.call(receiver, args)
	if profiling_hitches: record_hitch("source", owner + "." + key, hitch_start)
	if tracing: call_stack.pop_back()
	call_depth -= 1
	return result

static func call_member(object: Variant, key: String, args: Array) -> Variant:
	if object == null: return null
	if not object is Value: return invoke(get_value(object, key), args)
	if object.fields.has("@offline_type"): return native_call(object, key, args)
	var model: Value = object
	if model.lazy_kind == 0 and not profiling and not tracing:
		if model.method_class != model.class_id: model.method_implementations.clear();model.method_class = model.class_id
		if model.method_implementations.has(key): return model.method_implementations[key].call(model, args)
	var owner: String = method_owner(object.class_id, key)
	if owner != "" and object.lazy_kind == 0 and not profiling and not tracing:
		var methods: Dictionary = resolved_methods.get(owner, EMPTY_MAP)
		var implementation: Callable = methods[key] if methods.has(key) else resolve_implementation(owner, key)
		model.method_implementations[key] = implementation
		return implementation.call(model, args)
	return run_method(object, owner, key, args) if owner != "" else native_call(object, key, args)

static func static_value(owner: String, key: String) -> Variant:
	ensure_statics(owner)
	return statics[owner].get(key)

static func call_static(owner: String, key: String, args: Array) -> Variant:
	if owner in ["gs.TweenLite", "TweenLite", "API", "com.newgrounds.API", "SharedObject", "SoundMixer", "Security", "ExternalInterface", "Mouse", "System", "JSON", "Math", "String", "Point", "Rectangle", "ApplicationDomain"]: return native_call(klass(owner), key, args)
	ensure_statics(owner)
	if not profiling and not tracing:
		var methods: Dictionary = resolved_methods.get(owner, EMPTY_MAP)
		if methods.has(key): return methods[key].call(klass(owner), args)
	return run_method(klass(owner), owner, key, args)

static func entity_behavior(entity: Value) -> Dictionary:
	var type: String = entity.class_id
	if entity.behavior_class == type: return entity.behavior_cache
	if not entity_behaviors.has(type):
		var behavior: Dictionary = {}
		for method in ["Update", "UpdateMovement", "UpdateAnimation", "UpdateAttachedSounds", "Render", "IsOutOfLevel"]: behavior[method] = method_owner(type, method)
		entity_behaviors[type] = behavior
	entity.behavior_cache = entity_behaviors[type];entity.behavior_class = type
	var behavior: Dictionary = entity.behavior_cache
	entity.behavior_update = behavior.Update;entity.behavior_movement = behavior.UpdateMovement
	entity.behavior_animation = behavior.UpdateAnimation;entity.behavior_sounds = behavior.UpdateAttachedSounds
	entity.behavior_render = behavior.Render;entity.behavior_retirement = behavior.IsOutOfLevel
	entity.behavior_update_empty = empty_methods.get(behavior.Update, EMPTY_MAP).has("Update")
	entity.behavior_render_empty = empty_methods.get(behavior.Render, EMPTY_MAP).has("Render")
	return entity.behavior_cache

static func fast_entity_update(entity: Value, args: Array) -> bool:
	var e: Dictionary = entity.fields; var callbacks: bool = false
	if e.m_iSurvivalGuideItem != -1 and e.m_bUnlockSurvivalGuide and e.m_fSurvivalGuideDistance > 0 and not e.m_bEditorMode:
		var camera = (e.m_World.fields.m_Game.fields.m_CurrentGameMode as Value).fields.m_Camera
		var distance: float = (e.m_vLocation as Value).fields.Z - (camera.fields.m_vLocation as Value).fields.Z
		if distance > 0 and distance <= e.m_fSurvivalGuideDistance: call_member((e.m_World as Value).fields.m_Game, "UnlockSurvivalItem", [e.m_iSurvivalGuideItem]);e.m_bUnlockSurvivalGuide = false;callbacks = true
	if entity.behavior_class != entity.class_id: entity_behavior(entity)
	if entity.behavior_movement != "RDEntity": run_method(entity, entity.behavior_movement, "UpdateMovement", args);callbacks = true
	if entity.behavior_animation != "RDEntity": run_method(entity, entity.behavior_animation, "UpdateAnimation", []);callbacks = true
	if not e.m_AttachedSounds.is_empty(): run_method(entity, entity.behavior_sounds, "UpdateAttachedSounds", []);callbacks = true
	return callbacks

static func fast_obstacle_update(obstacle: Value, args: Array) -> bool:
	var callbacks: bool = fast_entity_update(obstacle, args)
	var e: Dictionary = obstacle.fields
	if e.m_bCanBeDestroyed:
		if not truth(call_member(obstacle, "HasSoundPlaying", [])): e.m_bDestroyMe = true
		callbacks = true
	if e.m_fExplosionDelay > 0:
		e.m_fExplosionDelay -= num(args[0])
		if e.m_fExplosionDelay <= 0: call_member(obstacle, "Explode", [e.m_ExplodeInstigator]);callbacks = true
	return callbacks

static func divide_number(numerator: float, denominator: float) -> float:
	if denominator != 0.0: return numerator / denominator
	return INF if numerator > 0.0 else - INF if numerator < 0.0 else NAN

static func fast_attached_sounds(entity: Value) -> void :
	var f: Dictionary = entity.fields; var sounds: Array = f.m_AttachedSounds; var index: int = 0
	while index < sounds.size():
		var sound: Value = sounds[index]
		if sound.fields.m_SoundChannel == null: sounds.remove_at(index);sound.fields.m_bAttached = false
		else: index += 1
	if sounds.is_empty(): return
	var game: Value = statics.RDGame.Instance; var mode: Value = game.fields.m_CurrentGameMode; var camera: Value = mode.fields.m_Camera
	var listener: Value = camera.fields.m_vLocation; var listener_fields: Dictionary = listener.fields
	var position: Value = f.m_vLocation; var position_fields: Dictionary = position.fields
	ensure_statics("RDWorld")
	var entity_x: float = position_fields.X - NativeRoad.perlin(statics.RDWorld, position_fields.Z)
	var listener_x: float = listener_fields.X - NativeRoad.perlin(statics.RDWorld, listener_fields.Z)
	var distance: float = position_fields.Z - listener_fields.Z
	if distance < 0.0: distance = - distance * f.m_fBackSoundDistanceMultiplier
	var direction: float = 1.0 if entity_x >= listener_x else -1.0; var side_distance: float = absf(entity_x - listener_x)
	for sound: Value in sounds:
		var s: Dictionary = sound.fields; var volume: float = s.m_fMaxVolume; var pan: float = s.m_fPan
		if not distance < s.m_fVolumeFallOffDistance:
			if distance > s.m_fVolumeMaxDistance: volume = 0.0
			else: volume -= volume * divide_number(distance - s.m_fVolumeFallOffDistance, s.m_fVolumeMaxDistance - s.m_fVolumeFallOffDistance)
		if not s.m_bManualPan:
			if side_distance < s.m_fPanFallOffDistance: pan = 0.0
			elif side_distance > s.m_fPanMaxDistance: pan = direction
			else: pan = divide_number(direction * (side_distance - s.m_fPanFallOffDistance), s.m_fPanMaxDistance - s.m_fPanFallOffDistance)
		call_member(sound, "SetVolumeAndPan", [volume, pan])

static func fast_car_update(car: Value, delta: float) -> void :
	var e: Dictionary = car.fields; var mc: Value = e.m_MC; var engine: Value = get_value(mc, "Engine")
	var fire: Value = get_value(mc, "Fire"); var smoke: Value = get_value(mc, "Smoke")
	var hp: float = e.m_fEngineHP if engine != null else e.m_fHP
	var maximum: float = e.m_fMaxHP / 3.0 if engine != null else e.m_fMaxHP
	if e.m_bEditorMode:
		if fire != null: fire.display.visible = hp > 0 and hp <= maximum / 4.0
		if smoke != null: smoke.display.visible = hp > 0 and hp <= maximum / 2.0
		if e.m_bShowEditorRandomIcon:
			if string(e.m_szFactoryName).contains("Random"):
				e.m_RandomIcon = construct(klass("MC_CarRandomIcon"), []);add_child(mc, e.m_RandomIcon)
			e.m_bShowEditorRandomIcon = false
		return
	fast_obstacle_update(car, [delta])
	if hp <= 0: return
	var distance: float = absf((e.m_vLocation as Value).fields.Z - (e.m_Player.fields.m_vLocation as Value).fields.Z)
	if e.m_bPlayAmbientSound and e.m_AmbientSound != null and not truth(call_member(e.m_AmbientSound, "IsPlaying", [])) and distance < statics.RDObstacleCar.AmbientSoundDistance and not truth(call_member((statics.RDGame.Instance as Value).fields.m_CurrentGameMode, "IsChopperMode", [])):
		call_member(car, "PlaySoundOnActor", [e.m_AmbientSound, true]);e.m_bPlayAmbientSound = false
	if fire != null: fire.display.visible = hp <= maximum / 4.0
	if smoke != null: smoke.display.visible = hp <= maximum / 2.0
	if e.m_bWaitForPlayerToExplode and distance < statics.RDObstacleCar.ExplodePlayerDistance: e.m_bCanExplode = true;e.m_bWaitForPlayerToExplode = false
	if e.m_bCanExplode and hp <= maximum / 4.0 and int(elapsed * 1000) - e.m_iLastDamageTime > 500:
		hp = maxf(hp - e.m_fHPDegen * maxf(num(call_member(e.m_Player, "GetSpeedRatio", [])), 0.1) * delta, 0)
		if engine != null: e.m_fEngineHP = hp
		else: e.m_fHP = hp
		if hp == 0: e.m_fExplosionDamage = 1000;call_member(car, "Explode", [e.m_LastDamageInstigator])

static func fast_hud_location(hud: Value) -> void :
	var h: Dictionary = hud.fields; var game: Value = h.m_Game; var mode: Value = game.fields.m_CurrentGameMode
	var mc: Value = h.m_HudMC; var label: Value = get_value(mc, "Location"); var pointer: Value = get_value(mc, "LocationPointer")
	var show: bool = mode != null and truth(call_member(mode, "CanShowHud", []))
	set_value(label, "visible", show and truth(call_member(mode, "HasNextLevel", [])))
	var distance: Variant = call_member(mode, "GetNextLevelDistance", [])
	if distance is int or distance is float: distance = maxf(0, num(distance)) if is_finite(num(distance)) else 0
	set_value(label, "text", string(call_member(mode, "GetNextLevelName", [])) + ": " + string(distance) + string(call_member(mode, "GetNextLevelSuffix", [])))
	set_value(get_value(mc, "LocationBG"), "visible", get_value(label, "visible"))
	var rescue: bool = instance_of(mode, klass("RDGameModeChopperRescue"))
	var player: Value = h.m_Player; var closest: Value = player.fields.m_ClosestLocation if player != null else null
	var distance_label = get_value(pointer, "LocationDistance")
	if distance_label != null:
		set_value(distance_label, "visible", closest != null and not rescue)
		set_value(get_value(pointer, "CivCount"), "visible", rescue)
		if rescue: call_member(hud, "UpdateLocationCivCount", [])
	set_value(pointer, "visible", show and closest != null)
	if not truth(get_value(pointer, "visible")): return
	var name_label = get_value(pointer, "LocationName")
	set_value(name_label, "text", call_member(closest, "GetLocationName", []))
	set_value(distance_label, "text", str(int(ceil(maxf(player.fields.m_fClosestLocationDistance - statics.RDPlayer.PickupPointDistance, 0)))) + "m")
	goto_frame(get_value(pointer, "LocationIcon"), closest.fields.m_iLocationType, false)
	var position: Vector2 = closest.fields.m_MainMC.display.position; var viewport: Dictionary = (game.fields.m_Viewport as Value).fields
	set_value(pointer, "x", clampf(position.x, 0, viewport.m_iWidth));set_value(pointer, "y", clampf(position.y, 0, viewport.m_iHeight))
	if h.m_bLocationPointerLeft and position.x > 3 * viewport.m_iQuarterWidth: h.m_bLocationPointerLeft = false
	elif not h.m_bLocationPointerLeft and position.x < viewport.m_iQuarterWidth: h.m_bLocationPointerLeft = true
	goto_frame(pointer, 2 if h.m_bLocationPointerLeft else 1, false)
	set_value(name_label, "x", 28 if h.m_bLocationPointerLeft else -115)

static func fast_player_movement(player: Value, delta: float) -> void :
	var p: Dictionary = player.fields; var settings: Dictionary = statics.RDPlayer
	if p.m_iFailType in [settings.FailType_Explosion, settings.FailType_ZombieKill, settings.FailType_BodyKill]: return
	var location: Dictionary = (p.m_vLocation as Value).fields
	if p.m_bChopperMode:
		if not truth(call_member(p.m_GameModeGameplay, "HasIndependantPlayerControl", [])):
			p.m_fRelativeLocationX = 0.0;location.X = NativeRoad.perlin(statics.RDWorld, location.Z);location.Y = NativeRoad.perlin(statics.RDWorld, location.Z, true) + 1.5
		return
	var limit: float = num(call_member((p.m_GameModeGameplay as Value).fields.m_Road, "GetSideLimit", []))
	if absf(p.m_fRelativeLocationX) > limit: call_member(player, "HandleOutofStreetCollision", [])
	var velocity: Dictionary = (p.m_vVelocity as Value).fields
	var dx: float = clampf(p.m_fRelativeLocationX + velocity.X * delta, - limit, limit) - p.m_fRelativeLocationX
	var dz: float = velocity.Z * delta
	p.m_fRelativeLocationX += dx
	fast_move_entity(p.m_World, [player, dx, velocity.Y * delta, dz])
	var old_x: float = location.X; var old_y: float = location.Y
	location.X = NativeRoad.perlin(statics.RDWorld, location.Z) + p.m_fRelativeLocationX
	location.Y = NativeRoad.perlin(statics.RDWorld, location.Z, true)
	dx = location.X - old_x; var dy: float = location.Y - old_y
	for entity: Value in p.m_AttachedEntities: (entity.fields.m_vLocation as Value).fields.X += dx;(entity.fields.m_vLocation as Value).fields.Y += dy
	var game: Dictionary = (statics.RDGame.Instance as Value).fields
	if not game.m_bPlayFromEditor:
		var info: Dictionary = (statics.RDPlayerInfo.Instance as Value).fields
		info.m_fTotalDistance += dz
		if game.m_bIsFemale: info.m_fDianeDistance += dz
		else: info.m_fCochetaDistance += dz

static func fast_road_quad(road: Value, kind: String, args: Array) -> void :
	var front: bool = kind == "RenderFrontWall"
	var layer: int = int(args[5] if front else args[3]); var camera: Value = args[6] if front else args[4]; var mc: Value = args[7] if front else args[5]
	fast_road_surface(road, kind, int(args[0]), int(args[1]), int(args[2]), layer, camera, mc, int(args[3]) if front else 0, int(args[4]) if front else 0)

static func road_surface_key(road: Value, camera: Value, z: int, kind: String, i: int, j: int, layer: int, third: int, fourth: int) -> Vector4i:
	var slice: int = z
	if road.fields.m_iMode != statics.RDRoad.Mode_Pattern: slice += int(floorf(maxf(camera.fields.m_vLocation.fields.Z, 0) / statics.RDRoad.RenderStepSize))


	return Vector4i(slice, layer + int(road.fields.m_iMode) * 3, i + j * 8 + third * 64 + fourth * 512, 0 if kind == "RenderGround" else 1 if kind == "RenderSideWall" else 2)

static func fast_road_surface(road: Value, kind: String, z: int, i: int, j: int, layer: int, camera: Value, mc: Value, third_index: int = 0, fourth_index: int = 0) -> void :
	var r: Dictionary = road.fields; var front: bool = kind == "RenderFrontWall"
	if camera.fields.m_fFogDistance < camera.fields.m_fMaxViewDistance:
		var step: float = statics.RDRoad.RenderStepSize; var distance: float = r.m_Rendered3DVectors[layer][z][0].fields.Z
		var ratio: float = clampf((distance - camera.fields.m_fFogDistance + step) / step, 0, 1)
		var fog: Dictionary = statics.RDRoad.FogColor.fields; var color: Dictionary = r.m_RenderColor.fields
		for channel in ["R", "G", "B", "A"]: color[channel] = int(ratio * fog[channel] + (1 - ratio) * color[channel])
		r.m_iRenderColor = int(color.R * 65536 + color.G * 256 + color.B)
	var a: Array = r.m_Rendered2DVectors[layer][z]; var b: Array = a if front else r.m_Rendered2DVectors[layer][z + 1]
	if kind == "RenderSideWall" and i >= 2: var swap: int = i;i = j;j = swap
	r.m_vRenderVec2D1 = a[i];r.m_vRenderVec2D2 = a[j] if front else b[i]
	r.m_vRenderVec2D3 = a[third_index] if front else a[j];r.m_vRenderVec2D4 = a[fourth_index] if front else b[j]
	var first: Dictionary = r.m_vRenderVec2D1.fields; var second: Dictionary = r.m_vRenderVec2D2.fields; var third: Dictionary = r.m_vRenderVec2D3.fields; var fourth: Dictionary = r.m_vRenderVec2D4.fields
	var points: PackedVector2Array = [Vector2(first.X, first.Y + 1), Vector2(second.X, second.Y), Vector2(fourth.X, fourth.Y), Vector2(third.X, third.Y + 1)]
	if not points[0].is_finite() or not points[1].is_finite() or not points[2].is_finite() or not points[3].is_finite(): return
	for index in range(3, 0, -1):
		if points[index].is_equal_approx(points[index - 1]): points.remove_at(index)
	var triangles: PackedInt32Array = Geometry2D.triangulate_polygon(points) if points.size() >= 3 else PackedInt32Array()
	if not triangles.is_empty():
		if not mc.fields.has("@drawing"): mc.fields["@drawing"] = []
		mc.fields["@drawing"].append(["polygon", points, Color.hex(((r.m_iRenderColor & 16777215) << 8) | 255)])
		if mc.display.road_batch: mc.display.append_road_polygon(points, triangles, Color.hex(((r.m_iRenderColor & 16777215) << 8) | 255), road_surface_key(road, camera, z, kind, i, j, layer, third_index, fourth_index))
		mc.display.queue_redraw();mc.display.invalidate_bounds()

static func fast_world_update(world: Value, delta: float, camera: Value) -> void :


	call_member(world, "UpdateNavMesh", [camera])
	var entities: Array = world.fields.m_Entities; var count: int = entities.size()
	var view_end: float = (camera.fields.m_vLocation as Value).fields.Z + camera.fields.m_fMaxViewDistance
	var update_args: Array = [delta]
	for i in range(count):
		var entity: Value = (entities[i] as Value).fields.m_Entity; var e: Dictionary = entity.fields
		if e.m_bDestroyMe or not (e.m_bUpdateOutOfView or (e.m_vLocation as Value).fields.Z <= view_end): continue
		if entity.behavior_class != entity.class_id: entity_behavior(entity)
		if entity.behavior_update_empty: continue
		var owner: String = entity.behavior_update; var callbacks: bool = true



		if owner in ["RDEntity", "RDObstacle", "RDObstacleMapleTree"] and entity.behavior_movement == "RDEntity" and entity.behavior_animation == "RDEntity" and e.m_AttachedSounds.is_empty():
			var guide_active: bool = e.m_iSurvivalGuideItem != -1 and e.m_bUnlockSurvivalGuide and e.m_fSurvivalGuideDistance > 0 and not e.m_bEditorMode
			if not guide_active and (owner == "RDEntity" or not e.m_bCanBeDestroyed and e.m_fExplosionDelay <= 0) and (owner != "RDObstacleMapleTree" or not e.m_bEditorMode): continue
		match owner:
			"RDEntity": callbacks = fast_entity_update(entity, update_args)
			"RDObstacle": callbacks = fast_obstacle_update(entity, update_args)
			"RDObstacleCar": fast_car_update(entity, delta)
			"RDObstacleMapleTree":
				var editor_mode: bool = e.m_bEditorMode
				if editor_mode:
					var icon = get_value(e.m_MC, "RandomIcon")
					if icon != null: set_value(icon, "visible", string(e.m_szFactoryName).contains("Random"))
				callbacks = fast_obstacle_update(entity, update_args) or editor_mode
			_: run_method(entity, owner, "Update", update_args)
		if callbacks:
			entities = world.fields.m_Entities
			view_end = (camera.fields.m_vLocation as Value).fields.Z + camera.fields.m_fMaxViewDistance
	var destroy_outside: bool = truth(statics.RDWorld.m_bDestroyOutOfWorldEntities)
	var camera_z: float = (camera.fields.m_vLocation as Value).fields.Z
	var i: int = 0
	while i < count:
		var node: Value = entities[i]; var entity: Value = node.fields.m_Entity; var e: Dictionary = entity.fields
		var destroy: bool = truth(e.m_bDestroyMe)
		if not destroy and destroy_outside:
			if entity.behavior_class != entity.class_id: entity_behavior(entity)
			var owner: String = entity.behavior_retirement
			if owner == "RDObstacle": destroy = (e.m_vLocation as Value).fields.Z - camera_z < -25.0
			elif owner == "RDEntity": destroy = (e.m_vLocation as Value).fields.Z - camera_z < -5.0
			elif owner == "RDBuildingNew": destroy = (e.m_vLocation as Value).fields.Z - camera_z < -10.0
			else:
				destroy = truth(run_method(entity, owner, "IsOutOfLevel", [camera]))
				entities = world.fields.m_Entities
				destroy_outside = truth(statics.RDWorld.m_bDestroyOutOfWorldEntities)
				camera_z = (camera.fields.m_vLocation as Value).fields.Z
		if destroy:
			e = entity.fields
			remove_child(e.m_ContainerMC, e.m_MainMC);call_member(entity, "Destroy", [])
			var previous: Value = node.fields.m_Previous; var next: Value = node.fields.m_Next
			if previous != null: previous.fields.m_Next = next
			if next != null:
				next.fields.m_Previous = previous
				if previous == null: world.fields.m_FirstEntity = next
			if previous == null and next == null: world.fields.m_FirstEntity = null
			node.fields.m_Entity = null;node.fields.m_Next = null;node.fields.m_Previous = null
			call_member(world, "ReturnEntityNode", [node])
			entities = world.fields.m_Entities;entities.remove_at(i);count -= 1
			destroy_outside = truth(statics.RDWorld.m_bDestroyOutOfWorldEntities)
			camera_z = (camera.fields.m_vLocation as Value).fields.Z
		else: i += 1

static func test_move_collision(moving: Value, other: Value, old_z: float) -> void :
	if other == moving: return
	var o: Dictionary = other.fields
	if o.m_iCollisionGroup == statics.RDEntity.CollisionGroup_None or o.m_bDestroyMe or o.m_Base == moving: return
	var e: Dictionary = moving.fields
	var a: Dictionary = (e.m_CollisionBounds as Value).fields; var b: Dictionary = (o.m_CollisionBounds as Value).fields
	if b.W == 0 or b.H == 0: return
	var p: Dictionary = (e.m_vLocation as Value).fields; var q: Dictionary = (o.m_vLocation as Value).fields
	var boundary: float = q.Z + b.Z
	if (old_z + a.Z + a.D < boundary) == (p.Z + a.Z + a.D < boundary): return
	if p.X + a.X > q.X + b.X + b.W or p.X + a.X + a.W < q.X + b.X or p.Y + a.Y > q.Y + b.Y + b.H or p.Y + a.Y + a.H < q.Y + b.Y: return
	if not truth(call_member(moving, "CanCollideWith", [other])) or not truth(call_member(other, "CanCollideWith", [moving])): return
	call_member(moving, "Touched", [other]);call_member(other, "TouchedBy", [moving])

static func collision_chain(world: Value, moving: Value, old_z: float) -> void :


	var e: Dictionary = moving.fields; var a: Dictionary = (e.m_CollisionBounds as Value).fields
	var p: Dictionary = (e.m_vLocation as Value).fields
	var left: float = p.X + a.X; var right: float = left + a.W
	var bottom: float = p.Y + a.Y; var top: float = bottom + a.H
	var old_front: float = old_z + a.Z + a.D; var front: float = p.Z + a.Z + a.D
	var none: Variant = statics.RDEntity.CollisionGroup_None
	var node: Value = world.fields.m_FirstEntity
	while node != null:
		var other: Value = node.fields.m_Entity; var o: Dictionary = other.fields
		if other != moving and o.m_iCollisionGroup != none and not o.m_bDestroyMe and o.m_Base != moving:
			var b: Dictionary = (o.m_CollisionBounds as Value).fields
			if b.W != 0 and b.H != 0:
				var q: Dictionary = (o.m_vLocation as Value).fields; var plane: float = q.Z + b.Z
				if (old_front < plane) != (front < plane) and not (left > q.X + b.X + b.W or right < q.X + b.X or bottom > q.Y + b.Y + b.H or top < q.Y + b.Y):
					test_move_collision(moving, other, old_z)
					e = moving.fields;a = (e.m_CollisionBounds as Value).fields;p = (e.m_vLocation as Value).fields
					left = p.X + a.X;right = left + a.W;bottom = p.Y + a.Y;top = bottom + a.H
					old_front = old_z + a.Z + a.D;front = p.Z + a.Z + a.D
					none = statics.RDEntity.CollisionGroup_None
		node = node.fields.m_Next

static func fast_move_entity(world: Value, args: Array) -> void :
	var moving: Value = args[0]; var e: Dictionary = moving.fields; var p: Dictionary = (e.m_vLocation as Value).fields
	var old: Vector3 = Vector3(p.X, p.Y, p.Z)
	p.X += num(args[1]);p.Y += num(args[2]);p.Z += num(args[3]);call_member(moving, "UpdateDepthPosition", [])
	if e.m_iCollisionGroup != statics.RDEntity.CollisionGroup_None and truth(arg(args, 6, true)):
		var unique = arg(args, 4)
		if unique != null: test_move_collision(moving, unique, old.z)
		else:
			collision_chain(world, moving, old.z)
		var extra = arg(args, 5)
		if extra is Array:
			for other in extra: test_move_collision(moving, other, old.z)
	e = moving.fields;p = (e.m_vLocation as Value).fields
	var change: Vector3 = Vector3(p.X, p.Y, p.Z) - old
	for attached: Value in e.m_AttachedEntities:
		var location: Dictionary = (attached.fields.m_vLocation as Value).fields
		location.X += change.x;location.Y += change.y;location.Z += change.z;call_member(attached, "UpdateDepthPosition", [])

static func fast_project(camera: Value, location: Value, output: Value, curvy: bool, road: bool, road_entity: Value = null) -> void :
	var c: Dictionary = camera.fields; var point: Dictionary = location.fields; var origin: Dictionary = (c.m_vLocation as Value).fields
	var distance: float = point.Z if road else point.Z - origin.Z
	var vector: Vector3 = Vector3(point.X - origin.X, point.Y - origin.Y + distance / c.m_fRampDistance * c.m_fRampFactor, distance)
	var matrix: Transform3D = ((c.m_RotationMatrix if curvy else c.m_RotationMatrixPreCurve) as Value).native
	vector = matrix * vector
	if road: vector.z = maxf(vector.z, 0.1)
	var inverse: float = 1.0 / vector.z if vector.z != 0 else INF
	var viewport: Dictionary = (statics.BasicGame.Instance.fields.m_Viewport as Value).fields
	output.fields.X = vector.x * c.m_fRenderDistX * inverse + viewport.m_iHalfWidth
	output.fields.Y = - vector.y * c.m_fRenderDistY * inverse + viewport.m_iHalfHeight
	var transformed = c.m_vTransformedLocation if not road else road_entity.fields.m_vTransformedLocation
	if transformed != null: transformed.fields.x = vector.x;transformed.fields.y = vector.y;transformed.fields.z = vector.z

static func fast_entity_render(entity: Value, camera: Value) -> void :
	var e: Dictionary = entity.fields; var c: Dictionary = camera.fields
	if e.m_MainMC.fields.get("@section_pending", false): e.m_MainMC.display.visible = false;return
	var distance: float = (e.m_vLocation as Value).fields.Z - (c.m_vLocation as Value).fields.Z
	var display: Node2D = e.m_MainMC.display
	var was_visible: bool = display.visible
	if distance > c.m_fMaxViewDistance or distance > e.m_fFadeDistance + e.m_fFadeRange or e.m_bIsPlayer and distance < 1 or not e.m_bIsPlayer and distance <= 1:
		display.visible = false;return
	display.visible = true
	fast_project(camera, e.m_vLocation, e.m_vProjLocation, e.m_bUseCurvyCamera, false)
	(e.m_vTopLocation as Value).fields.X = (e.m_vLocation as Value).fields.X;(e.m_vTopLocation as Value).fields.Y = (e.m_vLocation as Value).fields.Y + e.m_fHeight;(e.m_vTopLocation as Value).fields.Z = (e.m_vLocation as Value).fields.Z
	fast_project(camera, e.m_vTopLocation, e.m_vProjTopLocation, e.m_bUseCurvyCamera, false)
	var scale: float = - e.m_fScale * ((e.m_vProjTopLocation as Value).fields.Y - (e.m_vProjLocation as Value).fields.Y) / e.m_fHeight if e.m_fHeight != 0 else 0
	scale = e.m_fMinRenderScale + scale * c.m_fRenderScale * (1 - e.m_fMinRenderScale)
	if not is_finite(scale) or absf(scale) > 1000000 or not Vector2((e.m_vProjLocation as Value).fields.X, (e.m_vProjLocation as Value).fields.Y).is_finite(): display.visible = false;return
	display.position = Vector2((e.m_vProjLocation as Value).fields.X, (e.m_vProjLocation as Value).fields.Y);display.scale = Vector2( - scale if e.m_bFlippedX else scale, scale)
	var fade_distance: float = minf(c.m_fFogDistance - c.m_fFogRange, e.m_fFadeDistance); var fade_range: float = minf(c.m_fFogRange, e.m_fFadeRange)
	display.modulate.a = 1 - clampf((distance - fade_distance) / fade_range if fade_range != 0 else 1 if distance > fade_distance else 0, 0, 1)
	if not was_visible or not (e.m_MainMC as Value).fields.get("@projected", false): display.reset_physics_interpolation();(e.m_MainMC as Value).fields["@projected"] = true
	var parent: Node = display.get_parent()
	if parent != null and parent.has_method("invalidate_bounds"): parent.invalidate_bounds()

static func perlin_gradient(hash: int, x: float, y: float, z: float) -> float:
	hash &= 15
	var first: float = x if hash < 8 else y
	if hash & 1: first = - first
	var second: float = y if hash < 4 else x if hash == (12 if hash & 2 == 0 else 14) else z
	return first + (second if hash & 2 == 0 else - second)

static func fast_compare(a: Value, b: Value) -> bool:
	return a.fields.m_iEntityIndex < b.fields.m_iEntityIndex if a.fields.m_fDepthPosition == b.fields.m_fDepthPosition else a.fields.m_fDepthPosition > b.fields.m_fDepthPosition

static func depth_precedes(depth: float, index: int, other: Value) -> bool:
	var fields: Dictionary = other.fields
	return index < fields.m_iEntityIndex if depth == fields.m_fDepthPosition else depth > fields.m_fDepthPosition

static func fast_depth(entity: Value) -> void :
	var e: Dictionary = entity.fields; var node: Value = e.m_EntityNode
	if node == null: return
	if not e.m_bHasCustomDepthPosition: e.m_fDepthPosition = (e.m_vLocation as Value).fields.Z
	var depth: float = e.m_fDepthPosition; var entity_index: int = e.m_iEntityIndex
	var original_previous: Value = node.fields.m_Previous; var original_next: Value = node.fields.m_Next
	var previous: Value = original_previous; var next: Value = original_next
	var forward: bool = false
	if next != null:
		var other: Dictionary = (next.fields.m_Entity as Value).fields
		forward = entity_index < other.m_iEntityIndex if depth == other.m_fDepthPosition else depth > other.m_fDepthPosition
	if forward:
		while next != null:
			var other: Dictionary = (next.fields.m_Entity as Value).fields
			if not (entity_index < other.m_iEntityIndex if depth == other.m_fDepthPosition else depth > other.m_fDepthPosition): break
			previous = next;next = next.fields.m_Next
	else:
		while previous != null:
			var other: Dictionary = (previous.fields.m_Entity as Value).fields
			if entity_index < other.m_iEntityIndex if depth == other.m_fDepthPosition else depth > other.m_fDepthPosition: break
			next = previous;previous = previous.fields.m_Previous
	if previous != original_previous or next != original_next:

		if original_previous != null: original_previous.fields.m_Next = original_next
		else: (e.m_World as Value).fields.m_FirstEntity = original_next
		if original_next != null: original_next.fields.m_Previous = original_previous
		node.fields.m_Previous = previous;node.fields.m_Next = next
		if previous != null: previous.fields.m_Next = node
		else: (e.m_World as Value).fields.m_FirstEntity = node
		if next != null: next.fields.m_Previous = node
	elif previous == null: (e.m_World as Value).fields.m_FirstEntity = node
	var container: Value = e.m_ContainerMC; var main: Value = e.m_MainMC
	if container == null or main.display.get_parent() != container.display: return
	var index: int = main.display.get_index(); var original: int = index
	while index > 0:
		var other: Value = (container.children[index - 1] as Value).fields.get("m_owner")
		if other == null: break
		var other_fields: Dictionary = other.fields
		if not (entity_index < other_fields.m_iEntityIndex if depth == other_fields.m_fDepthPosition else depth > other_fields.m_fDepthPosition): break
		index -= 1
	if index == original:
		while index < container.children.size() - 1:
			var other: Value = (container.children[index + 1] as Value).fields.get("m_owner")
			if other == null: break
			var other_fields: Dictionary = other.fields
			if entity_index < other_fields.m_iEntityIndex if depth == other_fields.m_fDepthPosition else depth > other_fields.m_fDepthPosition: break
			index += 1
	if index != original:
		container.children.erase(main);container.children.insert(index, main);container.display.move_child(main.display, index)

static func fast_perlin(args: Array) -> float:
	var p: Dictionary = statics.Perlin
	if not p.initialized: run_method(klass("Perlin"), "Perlin", "init", [])
	var x0: float = num(arg(args, 0)) + p.iXoffset; var y0: float = num(arg(args, 1, 1)) + p.iYoffset; var z0: float = num(arg(args, 2, 1)) + p.iZoffset
	var sum: float = 0; var table: Array = p.p
	for octave in range(p.iOctaves):
		var frequency: float = p.aOctFreq[octave]; var x: float = x0 * frequency; var y: float = y0 * frequency; var z: float = z0 * frequency
		var xf: float = floor(x); var yf: float = floor(y); var zf: float = floor(z)
		var ix: int = int(xf) & 255; var iy: int = int(yf) & 255; var iz: int = int(zf) & 255
		x -= xf;y -= yf;z -= zf
		var u: float = x * x * x * (x * (x * 6 - 15) + 10); var v: float = y * y * y * (y * (y * 6 - 15) + 10); var w: float = z * z * z * (z * (z * 6 - 15) + 10)
		var a: int = table[ix] + iy; var aa: int = table[a] + iz; var ab: int = table[a + 1] + iz; var b: int = table[ix + 1] + iy; var ba: int = table[b] + iz; var bb: int = table[b + 1] + iz
		var g1: float = perlin_gradient(table[bb + 1], x - 1, y - 1, z - 1); var g2: float = perlin_gradient(table[ab + 1], x, y - 1, z - 1)
		var g3: float = perlin_gradient(table[ba + 1], x - 1, y, z - 1); var g4: float = perlin_gradient(table[aa + 1], x, y, z - 1)
		var g5: float = perlin_gradient(table[bb], x - 1, y - 1, z); var g6: float = perlin_gradient(table[ab], x, y - 1, z)
		var g7: float = perlin_gradient(table[ba], x - 1, y, z); var g8: float = perlin_gradient(table[aa], x, y, z)
		g2 += u * (g1 - g2);g4 += u * (g3 - g4);g6 += u * (g5 - g6);g8 += u * (g7 - g8)
		g4 += v * (g2 - g4);g8 += v * (g6 - g8)
		sum += (g8 + w * (g4 - g8)) * p.aOctPers[octave]
	return (sum * p.fPersMax + 1) * 0.5

static func super_ref(c: Variant, owner: String) -> Dictionary:
	return {"@super": base_of(owner), "receiver": c}

static func make_closure(owner: String, fn: String, receiver: Variant, scope: Dictionary) -> Dictionary:
	return {"@closure": fn, "owner": owner, "receiver": receiver, "scope": scope}

static func lget(scope: Dictionary, key: String) -> Variant:
	if scope.has(key): return scope[key]
	if scope.has("@parent"): return lget(scope["@parent"], key)
	return null

static func lset(scope: Dictionary, key: String, value: Variant, op: String = "=") -> Variant:
	if not scope.has(key) and scope.has("@parent"): return lset(scope["@parent"], key, value, op)
	if op != "=": value = binary(op.trim_suffix("="), scope.get(key), value)
	value = coerce(value, scope.get("@types", {}).get(key, "*"))
	scope[key] = value
	return value

static func resolve(c: Variant, key: String, owner: String = "") -> Variant:
	if key == "arguments": return []
	if key == "stage": return stage
	if key == "root": return root
	if key == "_root": return root
	if c is Value:
		if c.fields.has(key): return get_value(c, key)
		var fo: String = field_owner(c.class_id, key)
		if fo != "" and not classes[fo].fields[key]: return get_value(c, key)
		var type_name: String = canonical(key, owner)
		if classes.has(type_name): return klass(type_name)
		var mo: String = method_owner(c.class_id, key)
		if mo != "" and not classes[mo].methods[key][1]: return {"@method": key, "receiver": c, "owner": mo}
	var fo: String = field_owner(owner, key)
	if fo != "" and classes[fo].fields[key]:
		ensure_statics(fo)
		return statics[fo].get(key)
	var mo: String = method_owner(owner, key)
	if mo != "": return {"@method": key, "receiver": klass(mo), "owner": mo}
	var cname: String = canonical(key, owner)
	if classes.has(cname): return klass(cname)
	if c is Value and is_display(c):
		if key in ["loaderInfo", "parent", "x", "y", "mouseX", "mouseY", "width", "height", "currentFrame", "totalFrames", "numChildren", "transform"]: return get_value(c, key)
		if key in ["stop", "play", "gotoAndStop", "gotoAndPlay", "addFrameScript", "addChild", "removeChild", "addChildAt", "addEventListener", "removeEventListener", "dispatchEvent", "getChildAt", "getChildByName"]: return {"@native": key, "receiver": c}
	if key in ["addEventListener", "removeEventListener", "dispatchEvent", "hasEventListener", "toString"] and c is Value: return {"@native": key, "receiver": c}
	return klass(key)

static func assign(c: Variant, key: String, owner: String, value: Variant, op: String = "=") -> Variant:
	if c is Value and c.field_types.has(key): return set_value(c, key, value, op)
	var fo: String = field_owner(owner, key)
	if fo != "" and classes[fo].fields[key]: return set_value(klass(fo), key, value, op)
	return set_value(c, key, value, op)

static func get_value(obj: Variant, key: Variant) -> Variant:
	var k: String = key if key is String else string(key)
	if obj == null: return null
	if obj is Value:
		if obj.lazy_kind == 3 and k != "m_bDoNotDestroy": materialize_player(obj)
		elif obj.lazy_kind == 4 and k not in ["x", "y", "scaleX", "scaleY", "rotation", "alpha", "visible", "constructor", "transform"]: materialize_pattern_marker(obj)
		if obj.render_batch and k in ["numChildren", "graphics"]: materialize_batch(obj)
		if obj.visual_deferred and k not in ["currentFrame", "totalFrames", "currentLabel", "currentFrameLabel", "x", "y", "visible", "alpha", "scaleX", "scaleY", "rotation"]: sync_visual_clip(obj)
		if not obj.has_getters and FAST_DISPLAY_KEYS.has(k) and is_display(obj): return fast_display_get(obj, k)
		if not obj.has_getters and obj.fields.has(k) and (obj.display == null or not DISPLAY_PROPERTIES.has(k)): return obj.fields[k]
		if obj.display == null and obj.kind not in ["bytearray", "channel"] and obj.fields.has(k): return obj.fields[k]
		if obj.fields.has("@offline_type"):
			if obj.fields.has(k): return obj.fields[k]
			return {"@native": k, "receiver": obj}
		if obj.class_id == "Point" and k == "length": return Vector2(num(obj.fields.get("x")), num(obj.fields.get("y"))).length()
		if obj.class_id == "Rectangle":
			if k == "right": return num(obj.fields.get("x")) + num(obj.fields.get("width"))
			if k == "bottom": return num(obj.fields.get("y")) + num(obj.fields.get("height"))
			if k == "left": return obj.fields.get("x", 0)
			if k == "top": return obj.fields.get("y", 0)
		if obj.kind == "channel" and k == "position": return obj.audio.get_playback_position() * 1000 if is_instance_valid(obj.audio) else 0
		if obj.class_id == "Date" and k in ["fullYear", "month", "date", "day", "hours", "minutes", "seconds", "milliseconds"]: return date_call(obj, "get" + k.capitalize(), [])
		var getter: String = method_owner(obj.class_id, "get_" + k) if obj.has_getters else ""
		if getter != "": return run_method(obj, getter, "get_" + k, [])
		if obj.kind == "bytearray":
			if k == "length": return obj.stream.get_size()
			if k == "position": return obj.stream.get_position()
			if k == "bytesAvailable": return obj.stream.get_available_bytes()
			if k.is_valid_int(): return obj.stream.data_array[int(k)] if int(k) < obj.stream.get_size() and int(k) >= 0 else 0
		if is_display(obj):
			match k:
				"x": return obj.display.position.x
				"y": return obj.display.position.y
				"scaleX": return obj.display.scale.x
				"scaleY": return obj.display.scale.y
				"rotation": return obj.display.rotation_degrees
				"alpha": return obj.display.modulate.a
				"visible": return obj.display.visible
				"parent": return obj.parent_value()
				"root": return root
				"stage": return stage
				"numChildren": return obj.children.size()
				"currentFrame": return obj.frame
				"totalFrames": return obj.timeline.get("count", 1)
				"currentLabel", "currentFrameLabel": return frame_label(obj)
				"currentLabels":
					var ls: Array = []
					for label in obj.timeline.get("labels", {}): ls.append({"name": label, "frame": obj.timeline.labels[label]})
					return ls
				"width": return bounds(obj).size.x * absf(obj.display.scale.x)
				"height": return bounds(obj).size.y * absf(obj.display.scale.y)
				"mouseX": return obj.display.to_local(mouse_position).x
				"mouseY": return obj.display.to_local(mouse_position).y
				"loaderInfo": return {"bytesLoaded": 1, "bytesTotal": 1, "url": "file://road-of-the-dead-2.swf", "parameters": {}}
				"transform": return {"@transform": obj}
				"graphics": return {"@graphics": obj}
				"textWidth": return string(obj.fields.get("text", "")).length() * num(obj.fields.get("size", 12)) * 0.6
				"textHeight": return num(obj.fields.get("size", 12)) * 1.3
		if obj.fields.has(k): return obj.fields[k]
		var fo: String = field_owner(obj.class_id, k)
		if fo != "" and classes[fo].fields[k]: ensure_statics(fo);return statics[fo].get(k)
		var mo: String = method_owner(obj.class_id, k)
		if mo != "": return {"@method": k, "receiver": obj, "owner": mo}
		if k == "constructor": return klass(obj.class_id)
		return {"@native": k, "receiver": obj} if native_methods.has(k) else null
	if obj is Dictionary:
		if obj.has("@graphics"): return {"@native": k, "receiver": obj}
		if obj.has("@super"):
			var mo: String = method_owner(obj["@super"], k)
			return {"@method": k, "receiver": obj.receiver, "owner": mo} if mo != "" else {"@native": k, "receiver": obj.receiver}
		if obj.has("@class"):
			var cn: String = obj["@class"]
			if cn in ["API", "com.newgrounds.API"] and k in ["username", "userId", "hasUserSession", "isConnected", "isInitialized", "isDebugMode", "medals", "scoreBoards"]: return {"username": "LocalPlayer", "userId": 1, "hasUserSession": true, "isConnected": true, "isInitialized": true, "isDebugMode": false, "medals": [], "scoreBoards": []}[k]
			ensure_statics(cn)
			var fo: String = field_owner(cn, k)
			if fo != "": ensure_statics(fo);return statics[fo].get(k)
			var mo: String = method_owner(cn, k)
			if mo != "": return {"@method": k, "receiver": obj, "owner": mo}
			if cn.ends_with("Event") and event_constants.has(k): return event_constants[k]
			if cn == "Math": return {"PI": PI, "E": 2.718281828459, "LN2": log(2), "SQRT2": sqrt(2), "LN10": log(10), "LOG2E": 1 / log(2), "LOG10E": 1 / log(10), "SQRT1_2": sqrt(0.5)}.get(k, {"@native": k, "receiver": obj})
			if cn == "Number": return {"MAX_VALUE": 1.7976931348623157e+308, "MIN_VALUE": 0.0, "NaN": NAN, "POSITIVE_INFINITY": INF, "NEGATIVE_INFINITY": - INF}.get(k)
			if cn == "Vector3D" and k in ["X_AXIS", "Y_AXIS", "Z_AXIS"]: return construct(klass("Vector3D"), [1 if k == "X_AXIS" else 0, 1 if k == "Y_AXIS" else 0, 1 if k == "Z_AXIS" else 0])
			if cn == "Keyboard": return keyboard_constant(k)
			if cn == "Array": return {"CASEINSENSITIVE": 1, "DESCENDING": 2, "UNIQUESORT": 4, "RETURNINDEXEDARRAY": 8, "NUMERIC": 16}.get(k, 0)
			if cn == "ApplicationDomain" and k == "currentDomain": return {"@class": "ApplicationDomain"}
			if cn == "StageDisplayState" and k == "FULL_SCREEN_INTERACTIVE": return "fullScreenInteractive"
			if k in ["LOW", "MEDIUM", "HIGH", "BEST", "NORMAL", "MULTIPLY", "ADD", "SCREEN", "LAYER", "NONE", "LEFT", "RIGHT", "CENTER", "INPUT", "DYNAMIC", "BIG_ENDIAN", "LITTLE_ENDIAN", "NO_SCALE", "TOP_LEFT", "FULL_SCREEN", "UP", "DOWN", "LINEAR"]: return k.to_lower().replace("_", "")
			if cn == "Capabilities": return {"playerType": "StandAlone", "version": "Godot 4.7.2", "os": OS.get_name(), "isDebugger": false, "screenResolutionX": DisplayServer.screen_get_size().x, "screenResolutionY": DisplayServer.screen_get_size().y}.get(k)
			if cn == "SoundMixer" and k == "soundTransform": return construct(klass("SoundTransform"), [1, 0])
			return {"@native": k, "receiver": obj}
		if obj.has("@transform"):
			var v = obj["@transform"]
			if k == "matrix": return matrix_value(v.display.transform)
			if k == "colorTransform": return v.fields.get("colorTransform", construct(klass("ColorTransform"), []))
		if obj.has(key): return obj[key]
		if obj.has(k): return obj[k]
		if k == "length": return obj.size()
		if k in ["hasOwnProperty", "toString", "valueOf"]: return {"@native": k, "receiver": obj}
		return null
	if obj is Array or obj is PackedByteArray:
		if k == "length": return obj.size()
		if k.is_valid_int(): return obj[int(k)] if int(k) >= 0 and int(k) < obj.size() else null
		return {"@native": k, "receiver": obj}
	if obj is String:
		if k == "length": return obj.length()
		if k.is_valid_int(): return obj[int(k)] if int(k) >= 0 and int(k) < obj.length() else ""
		return {"@native": k, "receiver": obj}
	return {"@native": k, "receiver": obj}

static func set_value(obj: Variant, key: Variant, value: Variant, op: String = "=") -> Variant:
	if obj == null: return value
	var k: String = key if key is String else string(key)
	if op != "=": value = binary(op.trim_suffix("="), get_value(obj, key), value)
	if obj is Value and obj.field_types.has(k):
		value = coerce(value, obj.field_types[k]);obj.fields[k] = value;return value
	if obj is Value and not obj.has_setters and FAST_DISPLAY_KEYS.has(k) and is_display(obj):
		fast_display_set(obj, k, value);return value
	var type_owner: String = field_owner(obj.class_id if obj is Value else obj.get("@class", "") if obj is Dictionary else "", k)
	if type_owner != "": value = coerce(value, classes[type_owner].get("field_types", {}).get(k, "*"))
	if obj is Value:
		if obj.fields.has("@offline_type"): obj.fields[k] = value;return value
		if k == "text" and not obj.fields.has("htmlText") and obj.fields.has("text") and typeof(obj.fields.text) == typeof(value) and obj.fields.text == value: return value
		if is_display(obj) and k == "visible" and obj.display.visible == truth(value): obj.fields[k] = value;return value
		if obj == stage and k == "displayState":
			var fullscreen: bool = string(value).to_lower().replace("_", "").begins_with("fullscreen")
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)
			obj.fields[k] = value;return value
		if obj.kind == "channel" and k == "soundTransform" and is_instance_valid(obj.audio): obj.audio.volume_db = linear_to_db(maxf(1e-05, num(get_value(value, "volume"))))
		var setter: String = method_owner(obj.class_id, "set_" + k) if obj.has_setters else ""
		if setter != "": run_method(obj, setter, "set_" + k, [value]);return value
		if obj.kind == "bytearray":
			if k == "position": obj.stream.seek(maxi(0, int(num(value))));return value
			if k == "length":
				var data: PackedByteArray = obj.stream.data_array;data.resize(maxi(0, int(num(value))));obj.stream.data_array = data;return value
			if k == "endian": obj.stream.big_endian = string(value) != "littleEndian" and string(value) != "littleendian";return value
			if k.is_valid_int():
				var data: PackedByteArray = obj.stream.data_array
				if int(k) >= data.size(): data.resize(int(k) + 1)
				if int(k) >= 0: data[int(k)] = int(num(value)) & 255
				var pos: int = obj.stream.get_position();obj.stream.data_array = data;obj.stream.seek(pos);return value
		if is_display(obj):
			if k in ["x", "y", "scaleX", "scaleY", "rotation", "width", "height", "alpha", "visible", "colorTransform", "filters", "mask"]: mask_revision += 1
			match k:
				"x": obj.display.position.x = display_number(value)
				"y": obj.display.position.y = display_number(value)
				"scaleX": obj.display.scale.x = display_number(value)
				"scaleY": obj.display.scale.y = display_number(value)
				"rotation": obj.display.rotation_degrees = display_number(value)
				"alpha": obj.display.modulate.a = clampf(num(value), 0, 1)
				"visible": obj.display.visible = truth(value)
				"width":
					var w: float = bounds(obj).size.x
					if w > 0: obj.display.scale.x = display_number(num(value) / w)
				"height":
					var h: float = bounds(obj).size.y
					if h > 0: obj.display.scale.y = display_number(num(value) / h)
		obj.fields[k] = value
		if k == "buttonMode" and is_display(obj): refresh_mouse_target(obj)
		if k == "text": obj.fields.erase("htmlText")
		if k == "htmlText":
			obj.fields.text = html_plain(string(value))
			var regex: RegEx = text_regex("(?i)COLOR=[\"']#([0-9a-f]{6})")
			var match_result: RegExMatch = regex.search(string(value))
			if match_result != null: obj.fields.textColor = match_result.get_string(1).hex_to_int()
			if cached_text_enabled: regex = text_regex("(?i)SIZE=[\"']([0-9.]+)")
			else: regex.compile("(?i)SIZE=[\"']([0-9.]+)")
			match_result = regex.search(string(value))
			if match_result != null: obj.fields.size = match_result.get_string(1).to_float()
		if k == "bitmapData" and is_display(obj): refresh_bitmap(obj)
		if k == "mask" and value is Value and is_display(value): value.fields["@is_mask"] = true;value.display.update_effects()
		if k in ["colorTransform", "filters", "mask"] and is_display(obj): obj.display.update_effects()
		if is_display(obj) and k in ["x", "y", "scaleX", "scaleY", "rotation", "width", "height"]:
			var parent: Node = obj.display.get_parent()
			if parent != null and parent.has_method("invalidate_bounds"): parent.invalidate_bounds()
		if obj.display != null and k in ["text", "htmlText", "defaultTextFormat", "textColor", "colorTransform"]: obj.display.queue_redraw()
	elif obj is Dictionary:
		if obj.has("@class"):
			var cn: String = obj["@class"]; var fo: String = field_owner(cn, k)
			if fo != "": cn = fo
			ensure_statics(cn);statics[cn][k] = value
		elif obj.has("@transform"):
			var v = obj["@transform"]
			if k == "matrix": v.display.transform = to_transform(value)
			else: v.fields[k] = value;v.display.update_effects();v.display.queue_redraw()
		else: obj[k] = value
	elif obj is Array:
		if k == "length": obj.resize(maxi(0, int(num(value))))
		elif k.is_valid_int() and int(k) >= 0:
			if int(k) >= obj.size(): obj.resize(int(k) + 1)
			obj[int(k)] = value
	return value

static func fast_display_get(obj: Value, key: String) -> Variant:
	var d: Node2D = obj.display
	match key:
		"x": return d.position.x
		"y": return d.position.y
		"scaleX": return d.scale.x
		"scaleY": return d.scale.y
		"rotation": return d.rotation_degrees
		"alpha": return d.modulate.a
		"visible": return d.visible
	return null

static func fast_display_set(obj: Value, key: String, value: Variant) -> void :
	var d: Node2D = obj.display; var changed: bool = false
	if key == "visible":
		var visible: bool = truth(value);changed = d.visible != visible
		if changed: d.visible = visible
	elif key == "alpha":
		var alpha: float = clampf(num(value), 0, 1);changed = d.modulate.a != alpha
		if changed: d.modulate.a = alpha
	else:
		var number: float = display_number(value)
		match key:
			"x": changed = d.position.x != number;d.position.x = number
			"y": changed = d.position.y != number;d.position.y = number
			"scaleX": changed = d.scale.x != number;d.scale.x = number
			"scaleY": changed = d.scale.y != number;d.scale.y = number
			"rotation": changed = d.rotation_degrees != number;d.rotation_degrees = number
		if changed:
			var parent: Node = d.get_parent()
			if parent != null and parent.has_method("invalidate_bounds"): parent.invalidate_bounds()
	obj.fields[key] = value
	if changed: mask_revision += 1

static func truth(v: Variant) -> bool:
	if v == null: return false
	if v is bool: return v
	if v is int or v is float: return v != 0 and not is_nan(float(v))
	if v is String: return v != ""
	return true

static func coerce(v: Variant, type: String) -> Variant:
	match type:
		"int":
			var number: float = num(v);return signed32(int(number)) if is_finite(number) else 0
		"uint":
			var number: float = num(v);return int(number) & 4294967295 if is_finite(number) else 0
		"Number": return num(v)
		"Boolean": return truth(v)
		"String": return null if v == null else string(v)
	return v

static func num(v: Variant) -> float:
	if v == null: return 0.0
	if v is bool: return 1.0 if v else 0.0
	if v is float or v is int: return float(v)
	if v is String:
		if v.strip_edges() == "": return 0.0
		return v.to_float() if v.is_valid_float() else NAN
	return NAN

static func string(v: Variant) -> String:
	if v == null: return "null"
	if v is bool: return "true" if v else "false"
	if v is String: return v
	if v is float and is_finite(v) and v == floor(v): return str(int(v))
	if v is Dictionary and v.has("@class"): return "[class " + v["@class"] + "]"
	if v is Value: return "[object " + v.class_id.get_slice(".", v.class_id.get_slice_count(".") - 1) + "]"
	if v is Array:
		var ss: PackedStringArray = []
		for item in v: ss.append("" if item == null else string(item))
		return ",".join(ss)
	if v is Dictionary: return "[object Object]"
	return str(v)

static func binary(op: String, a: Variant, b: Variant) -> Variant:
	match op:
		"+": return string(a) + string(b) if a is String or b is String else num(a) + num(b)
		"-": return num(a) - num(b)
		"*": return num(a) * num(b)
		"/": return num(a) / num(b) if num(b) != 0 else (INF if num(a) > 0 else - INF if num(a) < 0 else NAN)
		"%": return fmod(num(a), num(b)) if num(b) != 0 else NAN
		"<": return a < b if a is String and b is String else num(a) < num(b)
		">": return a > b if a is String and b is String else num(a) > num(b)
		"<=": return a <= b if a is String and b is String else num(a) <= num(b)
		">=": return a >= b if a is String and b is String else num(a) >= num(b)
		"==", "===": return equal(a, b, op == "===")
		"!=", "!==": return not equal(a, b, op == "!==")
		"&": return signed32(int(num(a)) & int(num(b)))
		"|": return signed32(int(num(a)) | int(num(b)))
		"^": return signed32(int(num(a)) ^ int(num(b)))
		"<<": return signed32(int(num(a)) << (int(num(b)) & 31))
		">>": return signed32(int(num(a))) >> (int(num(b)) & 31)
		">>>": return (int(num(a)) & 4294967295) >> (int(num(b)) & 31)
		"is", "instanceof": return instance_of(a, b)
		"as": return a if instance_of(a, b) else null
		"in": return has_key(b, a)
	return null

static func signed32(v: int) -> int:
	v &= 4294967295
	return v - 4294967296 if v > 2147483647 else v

static var constructor_default_cache: Dictionary = {}

static func constructor_is(obj: Variant, name: String) -> bool:
	if obj is Value and not obj.fields.has("constructor"):
		var owner: String = obj.class_id
		if not constructor_default_cache.has(owner): constructor_default_cache[owner] = method_owner(owner, "get_constructor") == "" and method_owner(owner, "constructor") == "" and field_owner(owner, "constructor") == ""
		if constructor_default_cache[owner]: return owner == canonical(name)
	return equal(get_value(obj, "constructor"), klass(name))

static func equal(a: Variant, b: Variant, strict: bool = false) -> bool:
	if a == null or b == null: return a == null and b == null
	if a is Value or b is Value: return is_same(a, b)
	if a is Dictionary and b is Dictionary and a.has("@class") and b.has("@class"): return a["@class"] == b["@class"]
	if a is Dictionary or b is Dictionary or a is Array or b is Array: return is_same(a, b)
	if typeof(a) == typeof(b): return a == b
	if (a is int or a is float) and (b is int or b is float): return num(a) == num(b)
	if strict: return false
	return num(a) == num(b)

static func unary(op: String, a: Variant) -> Variant:
	match op:
		"!": return not truth(a)
		"~": return signed32( ~ int(num(a)))
		"-": return - num(a)
		"+": return num(a)
		"void": return null
		"typeof": return "undefined" if a == null else "boolean" if a is bool else "number" if a is int or a is float else "string" if a is String else "function" if a is Callable or a is Dictionary and (a.has("@method") or a.has("@closure")) else "object"
	return null

static func sequence(a: Array) -> Variant: return a.back() if not a.is_empty() else null
static func object_value(pairs: Array) -> Dictionary:
	var result: Dictionary = {}
	for pair in pairs: result[pair[0]] = pair[1]
	return result
static func logical_and(a: Variant, b: Callable) -> Variant: return b.call() if truth(a) else a
static func logical_or(a: Variant, b: Callable) -> Variant: return a if truth(a) else b.call()
static func delete_value(obj: Variant, key: Variant) -> bool:
	if obj is Dictionary: obj.erase(string(key))
	if obj is Value: obj.fields.erase(string(key))
	return true

static func has_key(obj: Variant, key: Variant) -> bool:
	if obj is Dictionary: return obj.has(key) or obj.has(string(key))
	if obj is Value: return obj.fields.has(string(key))
	if obj is Array: return string(key).is_valid_int() and int(string(key)) >= 0 and int(string(key)) < obj.size()
	return false

static func instance_of(obj: Variant, type: Variant) -> bool:
	var cn: String = type.get("@class", "") if type is Dictionary else string(type)
	if cn == "Object": return obj != null
	if cn == "Class": return obj is Dictionary and obj.has("@class")
	if cn == "Array": return obj is Array
	if cn == "String": return obj is String
	if cn in ["int", "uint", "Number"]: return obj is int or obj is float
	if cn == "Boolean": return obj is bool
	if obj is Value: return chain(obj.class_id).has(cn)
	return false

static func iterate(v: Variant, values: bool = false) -> Array:
	if v is Array: return v.duplicate() if values else range(v.size())
	if v is Dictionary: return v.values() if values else v.keys()
	if v is Value: return v.fields.values() if values else v.fields.keys()
	return []

static func raise_error(v: Variant) -> Variant: last_error = v;return null

static func pattern_marker_safe(id: String, seen: Dictionary) -> bool:
	if pattern_marker_safety.has(id): return pattern_marker_safety[id]
	if seen.has(id): return false
	seen = seen.duplicate();seen[id] = true
	if symbol_classes.has(id):
		for owner in chain(symbol_classes[id]):
			if not classes.has(owner): continue
			var model: Dictionary = classes[owner]
			if model.get("passive", false): continue
			if not native_stop_clips.has(owner): pattern_marker_safety[id] = false;return false
			var initializer: Dictionary = native_initializers.get(owner, EMPTY_MAP)
			var has_fields: bool = false
			for field in model.get("fields", EMPTY_MAP):
				if not model.fields[field]: has_fields = true;break
			if has_fields and not initializer.has("init_fields"): pattern_marker_safety[id] = false;return false
			for instruction in initializer.get("init_fields", []):
				if not initializer_is_literal(instruction[1]): pattern_marker_safety[id] = false;return false
	var definition: Dictionary = assets.definitions.get(id, EMPTY_MAP)
	if definition.has("timeline"):
		var timeline: Dictionary = load_timeline(id, definition)
		if not timeline.get("sounds", []).is_empty(): pattern_marker_safety[id] = false;return false
		for frame in timeline.get("frames", []):
			if frame == null: continue
			for op in frame:
				if op.has("id") and not pattern_marker_safe(str(int(op.id)), seen): pattern_marker_safety[id] = false;return false
	pattern_marker_safety[id] = true;return true

static func construct_pattern(type: Variant) -> Variant:
	var name: String = type.get("@class", "") if type is Dictionary else string(type)
	var definition: Dictionary = classes.get(name, EMPTY_MAP)
	var use_data: bool = pattern_data_enabled and name.begins_with("MC_LevelPattern_") and definition.get("passive", false) and definition.get("base", "") == "MovieClip" and definition.get("fields", EMPTY_MAP).is_empty()
	if use_data: pattern_data_depth += 1
	var result: Variant = construct(type, [])
	if use_data: pattern_data_depth -= 1
	return result

static func materialize_pattern_marker(obj: Value) -> void :
	if obj.lazy_kind != 4: return
	var saved_context: int = pattern_data_depth;pattern_data_depth = 0
	var transform: Transform2D = obj.display.transform; var color: Color = obj.display.modulate; var visible: bool = obj.display.visible
	obj.lazy_kind = 0;setup_symbol(obj, obj.symbol)
	obj.display.transform = transform;obj.display.modulate = color;obj.display.visible = visible
	pattern_data_depth = saved_context;materialized_pattern_markers += 1

static func construction_begin(label: String) -> void :
	var now: int = Time.get_ticks_usec()
	construction_stack.append({"label": label, "start": now, "phase": now, "children": 0, "phases": {}})

static func construction_phase(label: String) -> void :
	var now: int = Time.get_ticks_usec(); var frame: Dictionary = construction_stack[-1]
	frame.phases[label] = int(frame.phases.get(label, 0)) + now - frame.phase - frame.children
	frame.phase = now;frame.children = 0

static func construction_end() -> void :
	construction_phase("finish")
	var frame: Dictionary = construction_stack.pop_back(); var label: String = frame.label
	if not construction_profile.has(label): construction_profile[label] = {"count": 0, "total_us": 0, "self_us": 0, "phases": {}}
	var stats: Dictionary = construction_profile[label];stats.count += 1
	stats.total_us += Time.get_ticks_usec() - frame.start
	for phase: String in frame.phases:
		stats.phases[phase] = int(stats.phases.get(phase, 0)) + frame.phases[phase];stats.self_us += frame.phases[phase]
	if not construction_stack.is_empty(): construction_stack[-1].children += Time.get_ticks_usec() - frame.start

static func construct_simple_value(cn: String, args: Array, began: int) -> Value:
	if profiling_construction: construction_begin(cn)
	var obj: Value = Value.new();obj.class_id = cn;values.append(weakref(obj))
	ensure_statics(cn)
	if not field_type_cache.has(cn):
		var types: Dictionary = {}
		if classes.has(cn):
			for field in classes[cn].fields:
				if not classes[cn].fields[field]: types[field] = classes[cn].field_types[field]
		field_type_cache[cn] = types
	obj.field_types = field_type_cache[cn]
	if SIMPLE_NATIVE_SCHEMAS.has(cn):
		var schema: Array = SIMPLE_NATIVE_SCHEMAS[cn]
		for index in schema[0].size(): obj.fields[schema[0][index]] = arg(args, index, schema[1][index])
		if cn == "Matrix3D": obj.native = Transform3D.IDENTITY
	elif cn == "RandomHat": obj.fields = {"m_bAutoRefills": truth(arg(args, 0, true)), "m_Values": [], "m_HatValues": []}
	elif cn == "SequentialArray": obj.fields = {"m_Values": [], "m_iIndex": 0}
	elif cn == "Box": obj.fields = {"X": 0.0, "Y": 0.0, "Z": 0.0, "W": 0.0, "H": 0.0, "D": 0.0}
	else:
		obj.fields = {"X": num(arg(args, 0, 0)), "Y": num(arg(args, 1, 0))}
		if cn == "DTVector3D": obj.fields["Z"] = num(arg(args, 2, 0))
	obj.constructor_done = true
	if profiling_hitches: record_hitch("construct", cn, began)
	if profiling_construction: construction_end()
	return obj

static func construct(type: Variant, args: Array) -> Variant:
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	if type == null: return null
	var cn: String = type.get("@class", "") if type is Dictionary else string(type)
	if native_values_enabled and native_builtin_construction_enabled:
		if cn == "Event" and not classes.has(cn) and not assets.symbols.has(cn): return construct_builtin_value(cn, args, began)
		if cn == "MovieClip" and not classes.has(cn) and not classes.has("Sprite") and not classes.has("DisplayObjectContainer") and not classes.has("InteractiveObject") and not classes.has("DisplayObject") and not classes.has("EventDispatcher") and not classes.has("Object") and not assets.symbols.has(cn): return construct_builtin_value(cn, args, began)
	if native_collections_enabled and cn in ["RandomHat", "SequentialArray"] and not classes.has("Object"): return construct_simple_value(cn, args, began)
	if native_values_enabled and (SIMPLE_VALUE_CLASSES.has(cn) or SIMPLE_NATIVE_SCHEMAS.has(cn) and not classes.has(cn)): return construct_simple_value(cn, args, began)
	if cn in ["int", "uint", "Number", "Boolean", "String"]: return native_global(cn, args)
	if cn == "Array":
		if args.size() == 1 and (args[0] is int or args[0] is float):
			var result: Array = [];result.resize(maxi(0, int(args[0])));return result
		return args.duplicate()
	if cn in ["Object", "Dictionary"]: return {}
	if profiling_construction: construction_begin(cn)
	var obj = Value.new();obj.class_id = cn;values.append(weakref(obj))
	ensure_statics(cn)
	if profiling_construction: construction_phase("allocation_statics")
	var hierarchy: Array = chain(cn)
	if not field_type_cache.has(cn):
		var types: Dictionary = {}
		for owner in hierarchy:
			if classes.has(owner):
				for field in classes[owner].fields:
					if not classes[owner].fields[field]: types[field] = classes[owner].get("field_types", {}).get(field, "*")
		field_type_cache[cn] = types
	obj.field_types = field_type_cache[cn]
	if not accessor_flags.has(cn):
		var flags: int = 0
		for owner in hierarchy:
			for method in classes.get(owner, EMPTY_MAP).get("methods", EMPTY_MAP):
				if method.begins_with("get_"): flags |= 1
				elif method.begins_with("set_"): flags |= 2
		accessor_flags[cn] = flags
	obj.has_getters = bool(accessor_flags[cn] & 1);obj.has_setters = bool(accessor_flags[cn] & 2)
	if hierarchy.has("DisplayObject") or cn in ["MovieClip", "Sprite", "SimpleButton", "Shape", "Bitmap", "TextField", "Loader"]:
		obj.kind = "clip";obj.display = display_script.new();obj.display.value = obj
		obj.fields = {"mouseEnabled": true, "mouseChildren": true, "buttonMode": false, "name": "", "cacheAsBitmap": false, "blendMode": "normal", "filters": []}
	if cn == "ByteArray": obj.kind = "bytearray";obj.stream = StreamPeerBuffer.new();obj.stream.big_endian = true
	if hierarchy.has("Sound"): obj.kind = "sound";obj.fields.length = 0
	if obj.kind == "sound" and assets.symbols.has(cn): obj.fields.length = assets.definitions.get(assets.symbols[cn], {}).get("length", 0)
	if cn == "SoundTransform": obj.fields = {"volume": args[0] if args.size() > 0 else 1.0, "pan": args[1] if args.size() > 1 else 0.0}
	if cn == "Point": obj.fields = {"x": args[0] if args.size() > 0 else 0.0, "y": args[1] if args.size() > 1 else 0.0}
	if cn == "Rectangle":
		for i in range(4): obj.fields[["x", "y", "width", "height"][i]] = args[i] if args.size() > i else 0.0
	if cn == "Matrix3D": obj.native = Transform3D.IDENTITY
	if cn == "Vector3D":
		for i in range(4): obj.fields[["x", "y", "z", "w"][i]] = args[i] if args.size() > i else 0.0
	if cn == "Matrix":
		for i in range(6): obj.fields[["a", "b", "c", "d", "tx", "ty"][i]] = args[i] if args.size() > i else (1.0 if i in [0, 3] else 0.0)
	if cn == "ColorTransform":
		for i in range(8): obj.fields[["redMultiplier", "greenMultiplier", "blueMultiplier", "alphaMultiplier", "redOffset", "greenOffset", "blueOffset", "alphaOffset"][i]] = args[i] if args.size() > i else (1.0 if i < 4 else 0.0)
	if cn == "Date": obj.native = Time.get_datetime_dict_from_system();obj.fields.time = Time.get_unix_time_from_system() * 1000
	if cn == "TextFormat":
		for i in range(mini(args.size(), 13)): obj.fields[["font", "size", "color", "bold", "italic", "underline", "url", "target", "align", "leftMargin", "rightMargin", "indent", "leading"][i]] = args[i]
	if cn.ends_with("Event"):
		obj.fields = {"type": args[0] if not args.is_empty() else "", "bubbles": args[1] if args.size() > 1 else false, "target": null, "currentTarget": null}
	if cn == "URLRequest": obj.fields.url = args[0] if not args.is_empty() else ""
	if cn == "ColorMatrixFilter": obj.fields.matrix = arg(args, 0, [])
	if cn == "GlowFilter": obj.fields = {"color": arg(args, 0, 16711680), "alpha": arg(args, 1, 1.0), "blurX": arg(args, 2, 6.0), "blurY": arg(args, 3, 6.0), "strength": arg(args, 4, 2.0), "quality": arg(args, 5, 1), "inner": arg(args, 6, false), "knockout": arg(args, 7, false)}
	if cn == "BitmapData":
		obj.kind = "bitmapdata";obj.native = Image.create(maxi(1, int(num(arg(args, 0, 1)))), maxi(1, int(num(arg(args, 1, 1)))), false, Image.FORMAT_RGBA8)
		var fill: int = int(num(arg(args, 3, 4294967295)));obj.native.fill(Color.hex(((fill & 16777215) << 8) | ((fill >> 24) & 255 if truth(arg(args, 2, true)) else 255)))
	if cn == "Bitmap" and not args.is_empty():
		obj.fields.bitmapData = args[0]
		refresh_bitmap(obj)
	if profiling_construction: construction_phase("schema_display")
	for owner in hierarchy:
		if classes.has(owner):
			if classes[owner].get("passive", false):
				for field in classes[owner].fields:
					if not classes[owner].fields[field]: obj.fields[field] = null
			else: run_method(obj, owner, "init_fields", [])
	if profiling_construction: construction_phase("fields")
	var symbol: String = assets.symbols.get(cn, "")
	if symbol != "" and obj.display != null: setup_symbol(obj, symbol)
	if cn == "TextField": obj.kind = "edittext";obj.fields.text = "";obj.display.own_bounds = Rect2(0, 0, 100, 20)
	if is_display(obj): refresh_mouse_target(obj)
	if profiling_construction: construction_phase("symbol")
	if classes.has(cn):
		var constructor: String = cn.get_slice(".", cn.get_slice_count(".") - 1)
		if classes[cn].get("passive", false):
			var base: String = base_of(cn)
			while classes.has(base) and classes[base].get("passive", false): base = base_of(base)
			if classes.has(base): run_method(obj, base, base.get_slice(".", base.get_slice_count(".") - 1), args)
		elif native_stop_clips.has(cn):
			obj.playing = false;obj.frame_scripts[1] = {"@native": "stop", "receiver": weakref(obj)}
		elif cn == "RDUpgradeScreen":
			obj.fields["@lazy_upgrade"] = args[0];obj.fields.m_GameMode = args[0];obj.fields.m_Game = args[0].fields.m_Game;obj.lazy_kind = 1
		elif cn == "RDPlayer": obj.fields["@lazy_player"] = true;obj.lazy_kind = 3
		elif LAZY_MODES.has(cn):
			obj.fields["@lazy_mode"] = {"args": args.duplicate()};obj.fields.m_Game = args[0];obj.lazy_kind = 2
		elif classes[cn].methods.has(constructor): run_method(obj, cn, constructor, args)
	if profiling_construction: construction_phase("body")
	obj.constructor_done = true
	if profiling_hitches: record_hitch("construct", cn, began)
	if profiling_construction: construction_end()
	return obj

static func construct_builtin_value(cn: String, args: Array, began: int) -> Value:
	if profiling_construction: construction_begin(cn)
	var obj: Value = Value.new();obj.class_id = cn;values.append(weakref(obj))
	ensure_statics(cn)
	if not field_type_cache.has(cn): field_type_cache[cn] = {}
	obj.field_types = field_type_cache[cn]
	var flags: int = accessor_flags.get(cn, 0)
	obj.has_getters = bool(flags & 1);obj.has_setters = bool(flags & 2)
	if cn == "MovieClip":
		obj.kind = "clip";obj.display = display_script.new();obj.display.value = obj
		obj.fields = {"mouseEnabled": true, "mouseChildren": true, "buttonMode": false, "name": "", "cacheAsBitmap": false, "blendMode": "normal", "filters": []}
	else: obj.fields = {"type": arg(args, 0, ""), "bubbles": arg(args, 1, false), "target": null, "currentTarget": null}
	obj.constructor_done = true
	if profiling_hitches: record_hitch("construct", cn, began)
	if profiling_construction: construction_end()
	return obj

static func invoke(fn: Variant, args: Array) -> Variant:
	if fn == null: return null
	if fn is Callable: return fn.callv(args)
	if not fn is Dictionary: return null
	if fn.has("@closure"):
		var name: String = "f_" + fn["@closure"]
		var bundled: Dictionary = source_bundle_classes.get(fn.owner, EMPTY_MAP) if source_bundles_enabled else EMPTY_MAP
		if profiling_source_usage and bundled.get("functions", EMPTY_MAP).has(name): record_source_usage(fn.owner, name)
		return source_bundle_for_function(bundled, name).call(bundled.functions[name], fn.receiver, args, fn.scope) if bundled.get("functions", EMPTY_MAP).has(name) else script_for(fn.owner).call(name, fn.receiver, args, fn.scope)
	if fn.has("@super"):
		var cn: String = fn["@super"]
		var constructor: String = cn.get_slice(".", cn.get_slice_count(".") - 1)
		if classes.has(cn) and classes[cn].methods.has(constructor): return run_method(fn.receiver, cn, constructor, args)
		if cn in ["Point", "Rectangle", "Matrix", "Matrix3D", "ColorTransform", "Vector3D", "TextFormat", "SoundTransform", "Date", "Error", "TypeError", "RangeError"]:
			var initialized = construct(klass(cn), args)
			fn.receiver.fields.merge(initialized.fields, true);fn.receiver.native = initialized.native
		return null
	if fn.has("@class"):
		var cn: String = fn["@class"]
		if cn in ["int", "uint", "Number", "Boolean", "String", "getTimer", "isNaN", "isFinite", "parseInt", "parseFloat", "getDefinitionByName", "getQualifiedClassName", "getQualifiedSuperclassName", "trace", "escape", "unescape", "encodeURI", "decodeURI", "encodeURIComponent", "decodeURIComponent", "navigateToURL", "describeType"]: return native_global(cn, args)
		if cn == "com.newgrounds.encoders.json.encodeJson": return JSON.stringify(args[0])
		if cn == "com.newgrounds.encoders.json.decodeJson": return JSON.parse_string(string(args[0]))
		return args[0] if not args.is_empty() else null
	var key: String = fn.get("@method", fn.get("@native", ""))
	var receiver = fn.get("receiver")
	if receiver is WeakRef:
		receiver = receiver.get_ref()
		if receiver == null: return null
	if receiver is Dictionary and receiver.has("@class"):
		var cn: String = receiver["@class"]
		if cn in ["gs.TweenLite", "TweenLite", "API", "com.newgrounds.API", "SharedObject", "SoundMixer", "Security", "ExternalInterface", "Mouse", "System", "JSON", "Math", "String", "Point", "Rectangle", "ApplicationDomain"]: return native_call(receiver, key, args)
	if fn.has("@method") and fn.owner != "": return run_method(receiver, fn.owner, key, args)
	return native_call(receiver, key, args)

static func native_global(key: String, a: Array) -> Variant:
	var v = a[0] if not a.is_empty() else null
	match key:
		"Boolean": return truth(v)
		"Number": return num(v)
		"int": return signed32(int(num(v))) if not is_nan(num(v)) and not is_inf(num(v)) else 0
		"uint": return int(num(v)) & 4294967295 if not is_nan(num(v)) and not is_inf(num(v)) else 0
		"String": return string(v)
		"getTimer": return int(elapsed * 1000)
		"isNaN": return is_nan(num(v))
		"isFinite": return is_finite(num(v))
		"parseInt": return string(v).hex_to_int() if a.size() > 1 and num(a[1]) == 16 else string(v).to_int()
		"parseFloat": return string(v).to_float()
		"getDefinitionByName": return klass(string(v).replace("::", "."))
		"getQualifiedClassName": return v.class_id if v is Value else string(v)
		"getQualifiedSuperclassName": return base_of(v.class_id) if v is Value else "Object"
		"trace": print(" ".join(a.map( func(x): return string(x))));return null
		"escape", "encodeURI", "encodeURIComponent": return string(v).uri_encode()
		"unescape", "decodeURI", "decodeURIComponent": return string(v).uri_decode()
		"navigateToURL": return null
	return null

static func arg(a: Array, i: int, fallback: Variant = null) -> Variant: return a[i] if a.size() > i else fallback

static func native_call(obj: Variant, key: String, a: Array) -> Variant:
	var cn: String = obj.get("@class", "") if obj is Dictionary else obj.class_id if obj is Value else ""
	if obj is Value and cn.ends_with("Event"):
		match key:
			"isDefaultPrevented": return obj.fields.get("@prevented", false)
			"preventDefault": obj.fields["@prevented"] = true;return null
			"stopPropagation": obj.fields["@stopped"] = true;return null
			"stopImmediatePropagation": obj.fields["@stopped"] = true;obj.fields["@stop_immediate"] = true;return null
	if cn == "Math":
		var x: float = num(arg(a, 0)); var y: float = num(arg(a, 1))
		match key:
			"random": return randf()
			"abs": return absf(x)
			"floor": return floor(x)
			"ceil": return ceil(x)
			"round": return floor(x + 0.5)
			"sqrt": return sqrt(x) if x >= 0 else NAN
			"pow": return pow(x, y)
			"sin": return sin(x)
			"cos": return cos(x)
			"tan": return tan(x)
			"asin": return asin(x)
			"acos": return acos(x)
			"atan": return atan(x)
			"atan2": return atan2(x, y)
			"log": return log(x)
			"exp": return exp(x)
			"min", "max":
				var result: float = INF if key == "min" else - INF
				for v in a: result = minf(result, num(v)) if key == "min" else maxf(result, num(v))
				return result
	if cn in ["API", "com.newgrounds.API"]: return offline_api(key, a)
	if cn in ["TweenLite", "gs.TweenLite"]: return tween_api(key, a)
	if cn == "SharedObject" and key == "getLocal": return shared_object(string(arg(a, 0, "save")))
	if cn == "JSON": return JSON.stringify(arg(a, 0)) if key == "stringify" else JSON.parse_string(string(arg(a, 0)))
	if cn == "String" and key == "fromCharCode":
		var result: String = ""
		for v in a: result += String.chr(int(num(v)))
		return result
	if cn in ["Security", "System", "Mouse", "ExternalInterface"]:
		if cn == "Security" and key == "showSettings": driver.call_deferred("acknowledge_storage")
		if key == "hide": Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		if key == "show": Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return null
	if cn == "URLLoader" and key == "load":
		obj.fields.data = ""
		return null
	if cn == "SoundMixer" and key == "stopAll":
		for ch in driver.get_children():
			if ch is AudioStreamPlayer: ch.stop()
		return null
	if obj is Array: return array_call(obj, key, a)
	if obj is String: return string_call(obj, key, a)
	if obj is Dictionary:
		if obj.has("@graphics"): return graphics_call(obj["@graphics"], key, a)
		if key == "hasOwnProperty": return obj.has(string(arg(a, 0)))
		if key == "toString": return string(obj)
	if obj is Value:
		if key in ["addEventListener", "removeEventListener", "dispatchEvent", "hasEventListener", "willTrigger"]: return event_call(obj, key, a)
		if obj.fields.has("@offline_type"): return offline_object_call(obj, key, a)
		if obj.kind == "bytearray": return bytearray_call(obj, key, a)
		if obj.kind == "sound" and key == "play": return play_sound(obj, a)
		if obj.kind == "channel" and key == "stop":
			if obj.audio != null: obj.audio.stop();obj.audio.queue_free();obj.audio = null
			release_sound_bus(obj)
			return null
		if is_display(obj): return display_call(obj, key, a)
		if key == "toString": return string(obj)
		if key == "hasOwnProperty": return obj.fields.has(string(arg(a, 0)))
		if cn == "SharedObject":
			if key == "flush": save_shared(obj);return "flushed"
			if key == "clear": obj.fields.data = {};save_shared(obj);return null
		if cn in ["Point", "Rectangle", "Matrix", "ColorTransform", "Vector3D", "Matrix3D"]: return geom_call(obj, key, a)
		if cn == "Date": return date_call(obj, key, a)
		if cn == "BitmapData": return bitmap_call(obj, key, a)
		if cn in ["FocusManager", "fl.managers.FocusManager"]: return null
		if cn.ends_with("Event") and key in ["preventDefault", "stopPropagation", "stopImmediatePropagation"]: obj.fields["@stopped"] = true;return null
	if key == "toString": return string(obj)
	var warn: String = cn + "." + key
	if not warnings.has(warn): warnings[warn] = 1;print("ADAPTER_MISSING " + warn + " " + str(call_stack.slice(-3)))
	else: warnings[warn] += 1
	return null

static func array_call(v: Array, key: String, a: Array) -> Variant:
	match key:
		"push": v.append_array(a);return v.size()
		"pop": return v.pop_back() if not v.is_empty() else null
		"shift": return v.pop_front() if not v.is_empty() else null
		"unshift":
			for i in range(a.size() - 1, -1, -1): v.push_front(a[i])
			return v.size()
		"splice":
			var start: int = int(num(arg(a, 0)));start = maxi(0, v.size() + start) if start < 0 else mini(v.size(), start)
			var count: int = mini(v.size() - start, maxi(0, int(num(arg(a, 1, v.size() - start))))); var removed: Array = v.slice(start, start + count)
			for i in range(count): v.remove_at(start)
			for i in range(2, a.size()): v.insert(start + i - 2, a[i])
			return removed
		"slice": return v.slice(int(num(arg(a, 0, 0))), int(num(arg(a, 1, v.size()))))
		"concat":
			var result: Array = v.duplicate()
			for x in a:
				if x is Array: result.append_array(x)
				else: result.append(x)
			return result
		"indexOf", "lastIndexOf":
			var result: int = -1
			for i in range(int(num(arg(a, 1, 0))), v.size()):
				if equal(v[i], arg(a, 0), true):
					result = i
					if key == "indexOf": return result
			return result
		"join": return string(arg(a, 0, ",")).join(v.map( func(x): return "" if x == null else string(x)))
		"reverse": v.reverse();return v
		"sort":
			if not a.is_empty() and a[0] is Dictionary: v.sort_custom( func(x, y): return num(invoke(a[0], [x, y])) < 0)
			else: v.sort_custom( func(x, y): return num(x) < num(y) if not a.is_empty() and int(num(a[0])) & 16 else string(x) < string(y))
			if not a.is_empty() and (a[0] is int or a[0] is float) and int(a[0]) & 2: v.reverse()
			return v
		"sortOn":
			var field: String = string(arg(a, 0));v.sort_custom( func(x, y): return num(get_value(x, field)) < num(get_value(y, field)))
			if int(num(arg(a, 1, 0))) & 2: v.reverse()
			return v
		"forEach":
			for i in range(v.size()): invoke(arg(a, 0), [v[i], i, v])
			return null
		"toString": return string(v)
	return null

static func string_call(v: String, key: String, a: Array) -> Variant:
	match key:
		"charAt": return v[int(num(arg(a, 0)))] if num(arg(a, 0)) >= 0 and num(arg(a, 0)) < v.length() else ""
		"charCodeAt": return v.unicode_at(int(num(arg(a, 0)))) if num(arg(a, 0)) >= 0 and num(arg(a, 0)) < v.length() else NAN
		"indexOf": return v.find(string(arg(a, 0)), int(num(arg(a, 1, 0))))
		"lastIndexOf": return v.rfind(string(arg(a, 0)), int(num(arg(a, 1, -1))))
		"toLowerCase", "toLocaleLowerCase": return v.to_lower()
		"toUpperCase", "toLocaleUpperCase": return v.to_upper()
		"substr": return v.substr(int(num(arg(a, 0))), int(num(arg(a, 1, -1))))
		"substring", "slice":
			var start: int = int(num(arg(a, 0))); var end: int = int(num(arg(a, 1, v.length())))
			if key == "slice": start = v.length() + start if start < 0 else start;end = v.length() + end if end < 0 else end
			if key == "substring" and start > end: var old: int = start;start = end;end = old
			return v.substr(maxi(0, start), maxi(0, end - start))
		"split": return Array(v.split(string(arg(a, 0, ""))))
		"replace": return v.replace(string(arg(a, 0)), string(arg(a, 1)))
		"concat":
			for x in a: v += string(x)
			return v
		"toString", "valueOf": return v
	return null

static func is_display(obj: Variant) -> bool: return obj is Value and is_instance_valid(obj.display) and not obj.display.is_queued_for_deletion()
static func is_on_stage(obj: Variant) -> bool:
	return obj is Value and obj.on_stage

static func set_stage_membership(obj: Value, on: bool) -> void :
	if on and obj.lazy_kind == 4: materialize_pattern_marker(obj)
	if obj.on_stage == on: return
	obj.on_stage = on
	refresh_active_clip(obj)
	var event: String = "addedToStage" if on else "removedFromStage"
	if obj.listeners.has(event): dispatch(obj, event, {})
	for child in obj.children.duplicate(): set_stage_membership(child, on)

static func refresh_active_clip(obj: Value) -> void :
	if obj.on_stage and (obj.playing and int(obj.timeline.get("count", 1)) > 1 or not obj.listeners.get("enterFrame", []).is_empty()): active_clips[obj.get_instance_id()] = weakref(obj)
	else: active_clips.erase(obj.get_instance_id())

static func bounds(obj: Variant) -> Rect2:
	if not is_display(obj): return Rect2()
	if obj.lazy_kind == 4: materialize_pattern_marker(obj)
	if obj.visual_deferred: sync_visual_clip(obj)
	if obj == stage: return Rect2(0, 0, 600, 400)
	var rectangle: Rect2 = obj.display.bounds()
	return hit_bounds(obj) if rectangle.size == Vector2.ZERO and obj.kind == "button" else rectangle

static func hit_bounds(obj: Variant) -> Rect2:
	if obj.kind != "button": return bounds(obj)
	if obj.fields.has("@hit_bounds"): return obj.fields["@hit_bounds"]
	var rectangle: Rect2 = Rect2()
	var frames: Array = obj.timeline.get("frames", [])
	if frames.size() > 3:
		for op in frames[3]:
			var child_bounds: Rect2 = asset_bounds(str(int(op.id)), []); var m: Array = op.get("m", [1, 0, 0, 1, 0, 0])
			child_bounds = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5])) * child_bounds
			rectangle = child_bounds if rectangle.size == Vector2.ZERO else rectangle.merge(child_bounds)
	if rectangle.size == Vector2.ZERO: rectangle = obj.display.bounds()
	obj.fields["@hit_bounds"] = rectangle
	return rectangle

static func asset_bounds(id: String, seen: Array) -> Rect2:
	if asset_bounds_cache.has(id): return asset_bounds_cache[id]
	if seen.has(id): return Rect2()
	seen = seen.duplicate();seen.append(id)
	var definition: Dictionary = assets.definitions.get(id, {})
	var rectangle: Rect2 = Rect2()
	if definition.has("bounds"):
		var b: Array = definition.bounds;rectangle = Rect2(b[0], b[1], b[2], b[3])
	elif definition.has("image"): rectangle = Rect2(Vector2.ZERO, texture_size(get_texture(definition.image)))
	elif definition.has("timeline"):
		if not timelines.has(id): load_timeline(id, definition)
		var frames: Array = timelines[id].get("frames", [])
		if not frames.is_empty():
			for op in frames[0]:
				if not op.has("id"): continue
				var child_bounds: Rect2 = asset_bounds(str(int(op.id)), seen); var m: Array = op.get("m", [1, 0, 0, 1, 0, 0])
				child_bounds = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5])) * child_bounds
				rectangle = child_bounds if rectangle.size == Vector2.ZERO else rectangle.merge(child_bounds)
	asset_bounds_cache[id] = rectangle
	return rectangle

static func load_timeline(id: String, definition: Dictionary) -> Dictionary:
	if timelines.has(id): return timelines[id]
	var timeline: Dictionary = Catalog.read_path(definition.timeline, not OS.get_cmdline_user_args().has("--no-catalog-cache"))
	timelines[id] = timeline
	return timeline

static func setup_symbol(obj: Value, id: String) -> void :
	obj.symbol = id
	var definition: Dictionary = assets.definitions.get(id, {})
	if pattern_data_depth > 0 and (obj.class_id.begins_with("MC_LevelObject_") or obj.class_id.begins_with("MC_LevelGround_")):
		var model: Dictionary = classes.get(obj.class_id, EMPTY_MAP)
		if model.get("passive", false) and model.get("base", "") == "MovieClip" and model.get("fields", EMPTY_MAP).is_empty() and pattern_marker_safe(id, {}):
			obj.kind = definition.get("type", "clip");obj.timeline = definition.duplicate();obj.lazy_kind = 4;deferred_pattern_markers += 1;return
	obj.kind = definition.get("type", "clip")
	obj.timeline = definition.duplicate()
	if definition.has("timeline"):
		if not timelines.has(id): load_timeline(id, definition)
		obj.timeline.merge(timelines[id], true)
		if not timelines[id].has("@sounds_by_frame"):
			var sound_frames: Dictionary = {}
			for sound in obj.timeline.get("sounds", []):
				var sound_frame: int = int(sound.frame)
				if not sound_frames.has(sound_frame): sound_frames[sound_frame] = []
				sound_frames[sound_frame].append(sound)
			timelines[id]["@sounds_by_frame"] = sound_frames
		obj.timeline["@sounds_by_frame"] = timelines[id]["@sounds_by_frame"]
		clips.append(weakref(obj))
		obj.render_batch = visual_batches_enabled and not (pattern_data_depth > 0 and obj.class_id.begins_with("MC_LevelPattern_")) and batch_timeline_eligible(obj)
		if obj.render_batch: batched_visual_instances += 1
		apply_frame(obj, 1)
		frame_queue.append(weakref(obj))
	if definition.has("bounds"):
		var b = definition.bounds;obj.display.own_bounds = Rect2(b[0], b[1], b[2], b[3])
	if definition.has("svg") or definition.has("image"):
		var path: String = definition.get("svg", definition.get("image", ""))

		if path == "res://assets/shapes/2291.png": path = "res://presentation_assets/cockpit_hummer_opaque.png"
		elif path == "res://assets/shapes/10499.png": path = "res://presentation_assets/cutscene_smoke_soft.png"
		obj.display.texture = get_texture(path)
		var offset: Array = definition.get("offset", [0, 0]);obj.display.offset = Vector2(offset[0], offset[1])
		if obj.display.own_bounds.size == Vector2.ZERO and obj.display.texture != null: obj.display.own_bounds = Rect2(obj.display.offset, texture_size(obj.display.texture))
	if obj.kind == "edittext":
		for k in ["text", "size", "color", "max_length", "align"]:
			if definition.has(k): obj.fields[k] = definition[k]
		obj.fields.type = "dynamic" if int(definition.get("flags", 0)) & 8 else "input"
		obj.fields.selectable = not bool(int(definition.get("flags", 0)) & 4096)
		obj.fields.multiline = bool(int(definition.get("flags", 0)) & 32)
		obj.fields.wordWrap = bool(int(definition.get("flags", 0)) & 64)
		if int(definition.get("flags", 0)) & 512: set_value(obj, "htmlText", obj.fields.get("text", ""))
	if obj.kind == "button": obj.playing = false;obj.fields.buttonMode = true;obj.fields.mouseChildren = false;obj.timeline.snapshots = true
	refresh_mouse_target(obj)
	obj.display.queue_redraw()

static func get_texture(path: String) -> Texture2D:
	if textures.has(path): return textures[path]
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	if path.begins_with("res://presentation_assets/") and ResourceLoader.exists(path):
		var compressed: Texture2D = load(path)
		compressed.set_meta("original_asset", path);textures[path] = compressed
		if profiling_hitches: record_hitch("texture", path, began)
		return compressed
	if path.begins_with("res://assets/atlases/"):
		var imported: String = path.replace("res://assets/atlases/", "res://render_assets/")
		if ResourceLoader.exists(imported):
			var compressed: Texture2D = load(imported);compressed.set_meta("original_asset", path);textures[path] = compressed
			if profiling_hitches: record_hitch("texture", path, began)
			return compressed
	if visual_overrides.has(path) and not str(visual_overrides[path].page).begins_with("res://presentation_assets/"):
		var entry: Dictionary = visual_overrides[path]; var region: Array = entry.region
		var texture: AtlasTexture = AtlasTexture.new();texture.atlas = get_texture(entry.page);texture.region = Rect2(region[0], region[1], region[2], region[3]);texture.filter_clip = true
		texture.set_meta("logical_size", Vector2(entry.logical_size[0], entry.logical_size[1]));texture.set_meta("original_asset", path);textures[path] = texture;return texture
	if texture_atlas.has(path):
		var entry: Dictionary = texture_atlas[path]; var region: Array = entry.region
		var atlas: Texture2D = get_texture(entry.page)
		var texture: AtlasTexture = AtlasTexture.new();texture.atlas = atlas;texture.region = Rect2(region[0], region[1], region[2], region[3]);texture.filter_clip = true;texture.set_meta("original_asset", path)
		textures[path] = texture
		if profiling_hitches: record_hitch("texture", path, began)
		return texture
	var image: Image = Image.new()
	var err: Error = image.load_png_from_buffer(FileAccess.get_file_as_bytes(path)) if path.begins_with("res://ui/") else (image.load_svg_from_string(FileAccess.get_file_as_string(path)) if path.ends_with(".svg") else image.load(path))
	if err != OK:
		push_error("Image load failed: " + path + " code=" + str(err));return null
	var texture: ImageTexture = ImageTexture.create_from_image(image);textures[path] = texture
	texture.set_meta("original_asset", path)
	if not path.begins_with("res://assets/atlases/"): texture_images[texture.get_instance_id()] = image
	if profiling_hitches: record_hitch("texture", path, began)
	return texture

static func get_presentation_texture(path: String) -> Texture2D:


	if path == "res://assets/shapes/10499.png":
		var special_key: String = "@presentation:" + path
		if textures.has(special_key): return textures[special_key]
		var source: Texture2D = get_texture("res://presentation_assets/cutscene_smoke_hd.png")
		var smoke_texture: AtlasTexture = AtlasTexture.new()
		smoke_texture.atlas = source
		smoke_texture.region = Rect2(Vector2.ZERO, source.get_size())
		smoke_texture.filter_clip = true
		smoke_texture.set_meta("logical_size", Vector2(110, 132))
		smoke_texture.set_meta("original_asset", "res://presentation_assets/cutscene_smoke_hd.png")
		textures[special_key] = smoke_texture
		return smoke_texture
	if not visual_overrides.has(path): return get_texture(path)
	var entry: Dictionary = visual_overrides[path]
	if not str(entry.page).begins_with("res://presentation_assets/"): return get_texture(path)
	var key: String = "@presentation:" + path
	if textures.has(key): return textures[key]
	var region: Array = entry.region
	var texture: AtlasTexture = AtlasTexture.new();texture.atlas = get_texture(entry.page)
	texture.region = Rect2(region[0], region[1], region[2], region[3]);texture.filter_clip = true
	texture.set_meta("logical_size", Vector2(entry.logical_size[0], entry.logical_size[1]));texture.set_meta("original_asset", path)
	textures[key] = texture
	return texture

static func release_presentation_textures() -> void :


	for key: String in textures.keys():
		if key.begins_with("@presentation:") or key.begins_with("res://presentation_assets/"): textures.erase(key)
	for key: String in batch_frame_cache.keys():
		if key.ends_with(":presentation"): batch_frame_cache.erase(key)

static func texture_size(texture: Texture2D) -> Vector2:
	return texture.get_meta("logical_size", texture.get_size())

static func texture_image(texture: Texture2D) -> Image:
	var id: int = texture.get_instance_id()
	if texture_images.has(id): return texture_images[id]
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	var path: String = texture.get_meta("original_asset", "")
	var image: Image
	if path.begins_with("res://presentation_assets/"): image = texture.get_image()
	elif path != "" and FileAccess.file_exists(path): image = Image.load_from_file(path)
	else: image = texture.get_image()
	if image != null: texture_images[id] = image
	if profiling_hitches: record_hitch("texture_pixels", path, began)
	return image

static func standalone_texture(texture: Texture2D) -> Texture2D:
	if not texture is AtlasTexture: return texture
	var key: String = str(texture.get_meta("original_asset", "")) + "#standalone"
	if textures.has(key): return textures[key]
	var image: Image = texture_image(texture)
	var standalone: ImageTexture = ImageTexture.create_from_image(image)
	textures[key] = standalone;texture_images[standalone.get_instance_id()] = image
	return standalone

static func clear_text_cache() -> void :
	text_regex_cache.clear();plain_text_cache.clear();plain_text_keys.clear();plain_text_cursor = 0

static func text_regex(pattern: String) -> RegEx:
	if cached_text_enabled and text_regex_cache.has(pattern): return text_regex_cache[pattern]
	var regex: RegEx = RegEx.new();regex.compile(pattern)
	if cached_text_enabled: text_regex_cache[pattern] = regex
	return regex

static func html_plain(html: String) -> String:
	if cached_text_enabled and plain_text_cache.has(html): return plain_text_cache[html]
	var source: String = html
	var regex: RegEx = text_regex("(?i)<br\\s*/?>|</p>");html = regex.sub(html, "\n", true)
	if cached_text_enabled: regex = text_regex("<[^>]*>")
	else: regex.compile("<[^>]*>")
	html = regex.sub(html, "", true)
	var result: String = html.replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"").replace("&apos;", "'").replace("&nbsp;", " ").replace("&amp;", "&").trim_suffix("\n")
	if cached_text_enabled and source.length() <= TEXT_CACHE_MAX_LENGTH:
		if plain_text_keys.size() < TEXT_CACHE_CAPACITY: plain_text_keys.append(source)
		else:
			plain_text_cache.erase(plain_text_keys[plain_text_cursor]);plain_text_keys[plain_text_cursor] = source
			plain_text_cursor = (plain_text_cursor + 1) % TEXT_CACHE_CAPACITY
		plain_text_cache[source] = result
	return result

static func symbol_instance(id: String) -> Value:
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	var obj: Value
	if symbol_classes.has(id): return construct(klass(symbol_classes[id]), [])
	if profiling_construction: construction_begin("symbol:" + id)
	var def: Dictionary = assets.definitions.get(id, {})
	obj = Value.new();values.append(weakref(obj))
	obj.class_id = "TextField" if def.get("type") == "edittext" else "SimpleButton" if def.get("type") == "button" else "Bitmap" if def.get("type") == "bitmap" else "Shape" if def.get("type") in ["shape", "text", "morph"] else "MovieClip"
	obj.kind = "clip";obj.display = display_script.new();obj.display.value = obj
	obj.fields = {"mouseEnabled": true, "mouseChildren": true, "buttonMode": false, "name": "", "cacheAsBitmap": false, "blendMode": "normal", "filters": []}
	if obj.class_id == "TextField": obj.fields.text = "";obj.display.own_bounds = Rect2(0, 0, 100, 20)
	obj.constructor_done = true
	if profiling_construction: construction_phase("leaf_allocation")
	setup_symbol(obj, id)
	if profiling_construction: construction_phase("leaf_symbol")
	if profiling_hitches: record_hitch("symbol", id, began)
	if profiling_construction: construction_end()
	return obj

static func add_child(parent: Variant, child: Variant, index: int = -1) -> Variant:
	if not is_display(parent) or not is_display(child): return child
	if parent.lazy_kind == 4: materialize_pattern_marker(parent)
	if parent.render_batch: materialize_batch(parent)
	var old = child.parent_value()
	if old != null: remove_child(old, child)
	if index < 0 or index >= parent.children.size(): parent.children.append(child)
	else: parent.children.insert(index, child)
	child.parent_ref = weakref(parent)
	if parent.projection_root_ref != null: bind_projection_scope(child, parent.projection_root_ref)
	adjust_mouse_targets(parent, child.mouse_target_count)
	parent.display.add_child(child.display)
	if parent.display.has_method("invalidate_bounds"): parent.display.invalidate_bounds()
	if index >= 0: parent.display.move_child(child.display, mini(index, parent.display.get_child_count() - 1))
	set_stage_membership(child, parent.on_stage)
	return child

static func remove_child(parent: Variant, child: Variant) -> Variant:
	if not is_display(parent) or not is_display(child): return child
	if not parent.children.has(child): return child
	parent.children.erase(child)
	adjust_mouse_targets(parent, - child.mouse_target_count)
	set_stage_membership(child, false)
	if child.display.get_parent() == parent.display: parent.display.remove_child(child.display)
	if parent.display.has_method("invalidate_bounds"): parent.display.invalidate_bounds()
	child.parent_ref = null
	if child.projection_root_ref != null: bind_projection_scope(child, null)
	return child

static func adjust_mouse_targets(obj: Value, change: int) -> void :
	if change == 0: return
	while obj != null: obj.mouse_target_count += change;obj = obj.parent_value()

static func refresh_mouse_target(obj: Value) -> void :
	var enabled: bool = obj.kind in ["button", "edittext"] or obj.fields.get("buttonMode", false)
	if not enabled and not obj.listeners.is_empty():
		for type in ["mouseDown", "mouseUp", "mouseMove", "mouseOver", "mouseOut", "mouseWheel", "click", "rollOver", "rollOut"]:
			if not obj.listeners.get(type, []).is_empty(): enabled = true;break
	if obj.own_mouse_target == enabled: return
	obj.own_mouse_target = enabled
	adjust_mouse_targets(obj, 1 if enabled else -1)

static func frame_label(obj: Value) -> Variant:
	var label: Variant = null; var at: int = -1
	for name in obj.timeline.get("labels", {}):
		var f: int = int(obj.timeline.labels[name])
		if f <= obj.frame and f > at: label = name;at = f
	return label

static func goto_frame(obj: Value, target: Variant, play: bool) -> void :
	if obj.lazy_kind == 4: materialize_pattern_marker(obj)
	if not play and obj.render_batch and obj.timeline.get("@batch_ephemeral", false): materialize_batch(obj)
	if obj.visual_deferred: sync_visual_clip(obj)
	var frame: int = 1
	if target is String and not target.is_valid_int():
		if obj.timeline.get("labels", {}).has(target): frame = int(obj.timeline.labels[target])
		else:
			var warning: String = "label " + obj.class_id + "." + target
			if not warnings.has(warning): warnings[warning] = 1;print("LABEL_MISSING " + warning)
			return
	else: frame = int(num(target))
	frame = clampi(frame, 1, maxi(1, int(obj.timeline.get("count", 1))))
	obj.playing = play
	if obj.on_stage: refresh_active_clip(obj)
	if obj.frame != frame or obj.applied_frame == 0:
		obj.frame = frame;obj.frame_dirty = true;apply_frame(obj, frame);frame_queue.append(weakref(obj))

static func depth_less(a: Value, b: Value) -> bool:
	return int(a.fields.get("@depth", 2147483647)) < int(b.fields.get("@depth", 2147483647))

static func apply_frame(obj: Value, target: int) -> void :



	if obj.symbol == "8508" and obj.applied_frame > 0 and target > 1 and target <= 1001:
		var moving: Value = obj.depths.get(1)
		if moving != null and obj.timeline.has("frames"):
			var ops: Array = obj.timeline.frames[target - 1]
			if ops.size() == 1 and ops[0].get("move", false) and ops[0].has("m"):
				var m: Array = ops[0].m
				var transform: Transform2D = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5]))
				if moving.display.transform != transform:
					moving.display.transform = transform
					obj.display.invalidate_bounds()
					mask_revision += 1
				obj.applied_frame = target
				return
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	if obj.render_batch: apply_batch_frame(obj, target);return
	var jumped: bool = target != obj.applied_frame + 1
	if not obj.timeline.has("frames"): obj.applied_frame = target;return
	var frames: Array = obj.timeline.frames
	if frames.is_empty(): return
	var snapshot: bool = obj.timeline.get("snapshots", false)
	if not jumped and target <= frames.size() and obj.timeline.get("@sounds_by_frame", EMPTY_MAP).get(target, []).is_empty():
		if snapshot and frames[target - 1] == null or not snapshot and frames[target - 1].is_empty(): obj.applied_frame = target;return
	mask_revision += 1
	if obj.timeline.get("snapshots", false):
		var fi: int = mini(target, frames.size()) - 1
		while fi > 0 and frames[fi] == null: fi -= 1
		var current: Array = frames[fi] if frames[fi] != null else []
		var wanted: Dictionary = {}
		for op in current: wanted[int(op.d)] = op
		for depth in obj.depths.keys():
			if not wanted.has(depth): remove_child(obj, obj.depths[depth]);obj.depths.erase(depth);obj.timeline_masks_dirty = true
		for op in current: apply_placement(obj, op)
	else:
		if target == obj.applied_frame + 1:
			for op in frames[target - 1]: apply_placement(obj, op)
		else:
			var state: Dictionary = timeline_state(obj, target)
			for depth in obj.depths.keys():
				if not state.has(depth): remove_child(obj, obj.depths[depth]);obj.depths.erase(depth);obj.timeline_masks_dirty = true
			for depth in state:
				if compiled_placements_enabled: apply_placement(obj, state[depth], true)
				else:
					var op: Dictionary = state[depth].duplicate();op.move = true;apply_placement(obj, op)
	obj.applied_frame = target
	if jumped and obj.display != null: obj.display.reset_physics_interpolation()
	if obj.depth_order_dirty:
		obj.children.sort_custom(depth_less)
		for i in range(obj.children.size()):
			if obj.children[i].display.get_index() != i: obj.display.move_child(obj.children[i].display, i)
		obj.depth_order_dirty = false
	if obj.timeline_masks_dirty: update_timeline_masks(obj);obj.timeline_masks_dirty = false
	for sound in obj.timeline.get("@sounds_by_frame", EMPTY_MAP).get(target, []):
		var def: Dictionary = assets.definitions.get(str(int(sound.id)), {})
		if def.has("sound"):
			var snd = construct(klass("Sound"), []);snd.fields["@sound_path"] = def.sound
			play_sound(snd, [0, int(sound.get("loops", 0))])

	if profiling_hitches: record_hitch("apply_frame", obj.class_id + ":" + str(target), began)

static func leaf_visual_timeline(obj: Value) -> bool:
	if obj.timeline.has("@leaf_visual"): return obj.timeline["@leaf_visual"]
	var pure: bool = obj.timeline.get("sounds", []).is_empty()
	for frame in obj.timeline.get("frames", []):
		if not pure: break
		if frame == null: continue
		for op in frame:
			if op.has("name"): pure = false;break
			if op.has("id"):
				var id: String = str(int(op.id))
				if symbol_classes.has(id) or assets.definitions.get(id, EMPTY_MAP).get("type", "") not in ["shape", "bitmap", "text"]: pure = false;break
	obj.timeline["@leaf_visual"] = pure
	return pure

static func batch_timeline_eligible(obj: Value) -> bool:
	if obj.batch_disabled or not obj.frame_scripts.is_empty(): return false
	if obj.timeline.has("@batch_eligible"): return obj.timeline["@batch_eligible"]
	var eligible: bool = not obj.timeline.get("frames", []).is_empty() and obj.timeline.get("sounds", []).is_empty()
	var frames: Array = obj.timeline.get("frames", [])
	for frame_index in frames.size():
		var frame: Variant = frames[frame_index]
		if not eligible: break
		if frame == null: continue
		for op in frame:
			if op.has("name") or op.has("clip"): eligible = false;break
			if op.has("cx") and op.cx[1].any( func(x): return x != 0): eligible = false;break
			if op.has("id"):
				var id: String = str(int(op.id)); var definition: Dictionary = assets.definitions.get(id, EMPTY_MAP)
				if op.has("ratio") and definition.get("type") == "morph": eligible = false;break
				if not static_visual_symbol(id, {}):
					if not one_frame_child(obj.timeline, frame_index, op) or not initial_visual_symbol(id, {}): eligible = false;break
					obj.timeline["@batch_ephemeral"] = true
	obj.timeline["@batch_eligible"] = eligible
	return eligible

static func one_frame_child(timeline: Dictionary, index: int, placement: Dictionary) -> bool:
	var count: int = int(timeline.get("count", 1))
	var frames: Array = timeline.frames
	if count <= 1 or frames.size() != count or timeline.get("snapshots", false): return false
	var next: Variant = frames[(index + 1) % frames.size()]
	if next == null: return false
	for op in next:
		if int(op.d) != int(placement.d): continue
		if op.get("remove", false): return true
		if op.has("id") and ( not op.get("move", false) or int(op.id) != int(placement.id)): return true
	return false

static func initial_visual_symbol(id: String, seen: Dictionary) -> bool:
	if seen.has(id) or symbol_classes.has(id): return false
	var definition: Dictionary = assets.definitions.get(id, EMPTY_MAP)
	if definition.get("type", "") in ["shape", "bitmap", "text"]: return definition.has("svg") or definition.has("image")
	if not definition.has("timeline"): return false
	if not timelines.has(id): load_timeline(id, definition)
	var timeline: Dictionary = timelines[id]
	if not timeline.get("sounds", []).is_empty() or timeline.get("frames", []).is_empty(): return false
	seen = seen.duplicate();seen[id] = true
	var first: Variant = timeline.frames[0]
	if first == null: return true
	for op in first:
		if not op.has("id") or op.has("name") or op.has("clip") or op.has("cx") and op.cx[1].any( func(x): return x != 0): return false
		if not initial_visual_symbol(str(int(op.id)), seen): return false
	return true

static func static_visual_symbol(id: String, seen: Dictionary) -> bool:
	if static_visual_cache.has(id): return static_visual_cache[id]
	if seen.has(id): return false
	seen = seen.duplicate();seen[id] = true
	var definition: Dictionary = assets.definitions.get(id, EMPTY_MAP)
	if symbol_classes.has(id):
		var owner: String = symbol_classes[id]
		if not classes[owner].get("passive", false) and not native_stop_clips.has(owner): static_visual_cache[id] = false;return false
	if definition.get("type", "") in ["shape", "bitmap", "text"]:
		var valid: bool = definition.has("svg") or definition.has("image");static_visual_cache[id] = valid;return valid
	if not definition.has("timeline"): static_visual_cache[id] = false;return false
	if not timelines.has(id): load_timeline(id, definition)
	var timeline: Dictionary = timelines[id]
	var valid: bool = int(definition.get("count", 1)) == 1 and timeline.get("sounds", []).is_empty()
	for frame in timeline.get("frames", []):
		if not valid: break
		if frame == null: continue
		var used_depths: Dictionary = {}
		for op in frame:
			if not op.has("id") or used_depths.has(int(op.d)) or op.has("name") or op.has("clip") or op.has("ratio") or op.has("cx") and op.cx[1].any( func(x): return x != 0): valid = false;break
			used_depths[int(op.d)] = true
			if op.has("id") and not static_visual_symbol(str(int(op.id)), seen): valid = false;break
	static_visual_cache[id] = valid;return valid

static func append_batch_symbol(id: String, matrix: Transform2D, color: Color, commands: Array, presentation: bool = false) -> Rect2:
	var definition: Dictionary = assets.definitions[id]; var rectangle: Rect2 = Rect2()
	if definition.has("svg") or definition.has("image"):
		var path: String = definition.get("svg", definition.get("image", ""))
		var texture: Texture2D = get_presentation_texture(path) if presentation else get_texture(path)
		var offset: Array = definition.get("offset", [0, 0]); var origin: Vector2 = Vector2(offset[0], offset[1])
		commands.append([matrix, texture, origin, color]);rectangle = matrix * Rect2(origin, texture_size(texture))
	elif definition.has("timeline"):
		var frame: Array = timelines[id].frames[0].duplicate() if not timelines[id].frames.is_empty() else []
		frame.sort_custom( func(a, b): return int(a.d) < int(b.d))
		for op in frame:
			var m: Array = op.get("m", [1, 0, 0, 1, 0, 0]); var child_matrix: Transform2D = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5])); var tint: Color = Color.WHITE
			if op.has("cx"):
				var cx: Array = op.cx[0];tint = Color(clampf(cx[0], 0, 1), clampf(cx[1], 0, 1), clampf(cx[2], 0, 1), clampf(cx[3] if cx.size() > 3 else 1, 0, 1))
			var child_bounds: Rect2 = append_batch_symbol(str(int(op.id)), matrix * child_matrix, color * tint, commands, presentation)
			rectangle = child_bounds if rectangle.size == Vector2.ZERO else rectangle.merge(child_bounds)
	if definition.has("bounds"):
		var b: Array = definition.bounds;rectangle = matrix * Rect2(b[0], b[1], b[2], b[3])
	return rectangle

static func apply_batch_frame(obj: Value, target: int) -> void :
	if target > 1 and obj.applied_frame == target - 1 and not obj.timeline.get("snapshots", false) and obj.timeline.frames[target - 1].is_empty(): obj.applied_frame = target;return
	var presentation: bool = obj.fields.get("@presentation_motion", false)
	var key: String = obj.symbol + ":" + str(target) + (":presentation" if presentation else "")
	if not batch_frame_cache.has(key):
		var state: Dictionary = {}
		if obj.timeline.get("snapshots", false):
			var frame: int = mini(target, obj.timeline.frames.size()) - 1
			while frame > 0 and obj.timeline.frames[frame] == null: frame -= 1
			for op in obj.timeline.frames[frame] if obj.timeline.frames[frame] != null else []: state[int(op.d)] = op
		else: state = timeline_state(obj, target)
		var depths: Array = state.keys();depths.sort(); var commands: Array = []; var rectangle: Rect2 = Rect2()
		for depth in depths:
			var op: Dictionary = state[depth]
			var m: Array = op.get("m", [1, 0, 0, 1, 0, 0]); var matrix: Transform2D = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5]))
			var color: Color = Color.WHITE
			if op.has("cx"):
				var cx: Array = op.cx[0];color = Color(clampf(cx[0], 0, 1), clampf(cx[1], 0, 1), clampf(cx[2], 0, 1), clampf(cx[3] if cx.size() > 3 else 1, 0, 1))
			var bounds: Rect2 = append_batch_symbol(str(int(op.id)), matrix, color, commands, presentation)
			rectangle = bounds if rectangle.size == Vector2.ZERO else rectangle.merge(bounds)
		batch_frame_cache[key] = [commands, rectangle]
	var cached: Array = batch_frame_cache[key]
	obj.display.batch_commands = cached[0];obj.display.batch_bounds = cached[1];obj.display.invalidate_bounds();obj.display.queue_redraw();obj.applied_frame = target;batched_visual_frames += 1

static func materialize_batch(obj: Value) -> void :
	if not obj.render_batch: return
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	obj.render_batch = false;obj.batch_disabled = true;obj.display.batch_commands = [];obj.display.batch_bounds = Rect2();obj.applied_frame = 0
	apply_frame(obj, obj.frame);obj.display.invalidate_bounds();obj.display.queue_redraw()

	if profiling_hitches: record_hitch("materialize_batch", obj.class_id, began)

static func advance_clip(obj: Value) -> void :
	var target: int = obj.frame % int(obj.timeline.get("count", 1)) + 1
	if obj.render_batch:
		obj.frame = target
		if not visual_render_visible(obj) and obj.frame_scripts.is_empty():
			obj.visual_deferred = true;deferred_clips[obj.get_instance_id()] = weakref(obj);deferred_visual_frames += 1;return
		apply_batch_frame(obj, target)
		if obj.frame_scripts.has(target): obj.frame_dirty = true;frame_queue.append(weakref(obj))
		return
	if not visual_render_visible(obj) and obj.frame_scripts.is_empty() and obj.listeners.is_empty() and leaf_visual_timeline(obj):
		var unobserved: bool = true
		for child in obj.children:
			if child.get_reference_count() > 3 or not child.listeners.is_empty() or not child.frame_scripts.is_empty(): unobserved = false;break
		if unobserved:
			obj.frame = target;obj.visual_deferred = true;deferred_clips[obj.get_instance_id()] = weakref(obj);deferred_visual_frames += 1;return
	if not obj.frame_scripts.has(target) and obj.listeners.get("frameConstructed", []).is_empty():
		obj.frame = target;apply_frame(obj, target);return
	goto_frame(obj, target, true)

static func sync_visual_clip(obj: Value) -> void :
	if not obj.visual_deferred: return
	obj.visual_deferred = false;deferred_clips.erase(obj.get_instance_id());apply_frame(obj, obj.frame)

static func sync_visible_clips() -> void :
	for id in deferred_clips.keys():
		var obj: Value = deferred_clips[id].get_ref()
		if obj == null: deferred_clips.erase(id)
		elif visual_render_visible(obj): sync_visual_clip(obj)

static func bind_projection_scope(obj: Value, scope: WeakRef) -> void :
	obj.projection_root_ref = scope
	for child: Value in obj.children: bind_projection_scope(child, scope)

static func presentation_scope(obj: Value, enabled: bool) -> void :
	if obj.fields.get("@presentation_motion", false) == enabled: return
	obj.fields["@presentation_motion"] = enabled
	var definition: Dictionary = assets.definitions.get(obj.symbol, EMPTY_MAP)
	if definition.has("svg") or definition.has("image"):
		var path: String = definition.get("svg", definition.get("image", ""))
		obj.display.texture = get_presentation_texture(path) if enabled else get_texture(path)
		obj.display.queue_redraw()



	if enabled and obj.render_batch and int(obj.timeline.get("count", 1)) > 1: materialize_batch(obj)
	elif obj.render_batch:
		obj.applied_frame = 0;apply_batch_frame(obj, obj.frame)
	for child: Value in obj.children: presentation_scope(child, enabled)

static func visual_render_visible(obj: Value) -> bool:
	if not obj.display.is_visible_in_tree(): return false
	if obj.projection_root_ref != null:
		var scope: Value = obj.projection_root_ref.get_ref()
		if scope != null and not scope.render_visible: return false
		if scope != null:
			var parent: Value = scope.parent_value()
			if parent != null and parent.projection_root_ref != null:
				var outer: Value = parent.projection_root_ref.get_ref()
				if outer != null and not outer.render_visible: return false
	return true

static func timeline_state(obj: Value, target: int) -> Dictionary:
	if not timeline_states.has(obj.symbol): timeline_states[obj.symbol] = {}
	var cache: Dictionary = timeline_states[obj.symbol]
	if cache.has(target): return cache[target]
	var state: Dictionary = {}; var start: int = 0
	for frame in cache:
		if frame < target and frame > start: start = frame
	if start > 0: state = cache[start].duplicate(true)
	for frame in range(start, mini(target, obj.timeline.frames.size())):
		for op in obj.timeline.frames[frame]:
			var depth: int = int(op.d)
			if op.get("remove", false): state.erase(depth)
			else:
				if not state.has(depth) or op.has("id") and not op.get("move", false): state[depth] = {}
				if op.has("m"): state[depth].erase("@matrix")
				if op.has("cx"): state[depth].erase("@multiply")
				state[depth].merge(op, true)
	cache[target] = state
	return state

static func apply_placement(obj: Value, op: Dictionary, force_move: bool = false) -> void :
	var depth: int = int(op.d)




	if depth == 1 and ((obj.symbol == "10292" and int(op.get("id", 10291)) == 10291) or (obj.symbol == "10263" and int(op.get("id", 10262)) == 10262)):
		if obj.depths.has(depth):
			remove_child(obj, obj.depths[depth]);obj.depths.erase(depth)
		return
	var created: bool = false
	if op.get("remove", false):
		if obj.depths.has(depth): remove_child(obj, obj.depths[depth]);obj.depths.erase(depth);obj.timeline_masks_dirty = true
		return
	var child: Value = obj.depths.get(depth)
	if op.has("id") and (child == null or child.symbol != str(int(op.id)) or not (force_move or op.get("move", false)) and not obj.timeline.get("snapshots", false)):
		created = true
		var id: String = str(int(op.id)); var definition: Dictionary = assets.definitions.get(id, EMPTY_MAP)



		var reusable: bool = child != null and child.get_reference_count() <= 3 and child.class_id in ["Shape", "Bitmap"] and child.children.is_empty() and child.listeners.is_empty() and child.frame_scripts.is_empty() and definition.get("type") in ["shape", "text", "bitmap"] and not symbol_classes.has(id) and not op.has("name")
		if reusable:
			child.fields = {"mouseEnabled": true, "mouseChildren": true, "buttonMode": false, "name": "", "cacheAsBitmap": false, "blendMode": "normal", "filters": []}
			child.display.transform = Transform2D.IDENTITY;child.display.modulate = Color.WHITE;child.display.visible = true;child.display.material = null;child.display.own_bounds = Rect2();child.display.hit_image = null;child.display.mask_texture = null;child.display.mask_stamp = -1;child.display.set_process(false)
			child.class_id = "Bitmap" if definition.get("type") == "bitmap" else "Shape"
			child.display.masks.clear();child.display.glow_margin = 0;child.display.invalidate_bounds()
			setup_symbol(child, id);obj.display.invalidate_bounds();recycled_shapes += 1
		else:
			if child != null: remove_child(obj, child)
			child = symbol_instance(id);obj.depths[depth] = child
			add_child(obj, child)
			obj.depth_order_dirty = true
		obj.timeline_masks_dirty = true
	if child == null: return
	if obj.fields.get("@presentation_motion", false): presentation_scope(child, true)
	if op.has("name"):
		child.fields.name = op.name;obj.fields[op.name] = child
	if op.has("clip") and child.fields.get("@clip_depth", -1) != int(op.clip):
		child.fields["@clip_depth"] = int(op.clip);child.fields["@is_mask"] = true;child.display.update_effects();obj.timeline_masks_dirty = true
	if op.has("m"):
		var transform: Transform2D
		if compiled_placements_enabled and op.has("@matrix"): transform = op["@matrix"]
		else:
			var m: Array = op.m;transform = Transform2D(Vector2(m[0], m[1]), Vector2(m[2], m[3]), Vector2(m[4], m[5]))
			if compiled_placements_enabled: op["@matrix"] = transform
		if child.display.transform != transform: child.display.transform = transform;obj.display.invalidate_bounds()
	if op.has("cx"):
		var m: Array = op.cx[0]
		var tint: Color
		if compiled_placements_enabled and op.has("@multiply"): tint = op["@multiply"]
		else:
			tint = Color(clampf(m[0], 0, 1), clampf(m[1], 0, 1), clampf(m[2], 0, 1), clampf(m[3] if m.size() > 3 else 1, 0, 1))
			if compiled_placements_enabled: op["@multiply"] = tint
		child.display.modulate = tint
		if child.fields.get("@color_add", []) != op.cx[1]:
			var previous: Array = child.fields.get("@color_add", []);child.fields["@color_add"] = op.cx[1]
			if previous.any( func(x): return x != 0) or op.cx[1].any( func(x): return x != 0): child.display.update_effects()
	if op.has("ratio") and child.kind == "morph":
		var variants: Array = child.timeline.get("variants", [])
		if not variants.is_empty():
			var index: int = clampi(roundi(num(op.ratio) / 65535 * (variants.size() - 1)), 0, variants.size() - 1)
			child.display.texture = get_texture(variants[index]);child.display.queue_redraw()
	child.fields["@depth"] = depth
	if created: child.display.reset_physics_interpolation()

static func update_timeline_masks(obj: Value) -> void :
	var active: Array = []
	var has_masks: bool = false
	for child in obj.children:
		if child.fields.has("@clip_depth") or not child.fields.get("@timeline_masks", []).is_empty(): has_masks = true;break
	if not has_masks: return
	var depths: Array = obj.depths.keys();depths.sort()
	for depth in depths:
		var child: Value = obj.depths[depth]
		active = active.filter( func(mask): return int(mask.fields.get("@clip_depth", 0)) >= depth)
		if child.fields.get("@timeline_masks", []) != active:
			child.fields["@timeline_masks"] = active.duplicate();child.display.update_effects()
		if child.fields.has("@clip_depth"): active.append(child)

static func mask_signature(obj: Variant) -> int:
	if obj.render_batch: materialize_batch(obj)
	if obj.mask_revision_seen == mask_revision: return obj.mask_cached_signature
	var stamp: int = hash([obj.symbol, obj.frame, obj.fields.get("@drawing", [])])
	for child in obj.children: stamp = hash([stamp, mask_signature(child), child.display.transform])
	obj.mask_revision_seen = mask_revision;obj.mask_cached_signature = stamp
	return stamp

static func objects_at_point(obj: Variant, point: Vector2, hits: Array) -> void :
	if not is_display(obj) or not obj.display.visible or obj.display.modulate.a <= 0: return
	if obj.render_batch: materialize_batch(obj)
	if not obj.display.global_transform.is_finite() or absf(obj.display.global_transform.determinant()) < 1e-06: return
	var local: Vector2 = obj.display.to_local(point)
	if not bounds(obj).has_point(local): return
	if obj.display.texture != null:
		if obj.display.hit_image == null: obj.display.hit_image = texture_image(obj.display.texture)
		var image: Image = obj.display.hit_image
		var pixel: Vector2i = Vector2i(local - obj.display.offset)
		if image != null and pixel.x >= 0 and pixel.y >= 0 and pixel.x < image.get_width() and pixel.y < image.get_height() and image.get_pixelv(pixel).a > 0.01: hits.append(obj)
	elif obj.kind == "edittext" and obj.display.own_bounds.has_point(local): hits.append(obj)
	for child in obj.children: objects_at_point(child, point, hits)

static func shape_at_point(obj: Variant, point: Vector2) -> bool:


	if not is_display(obj): return false
	if obj.render_batch: materialize_batch(obj)
	if obj.visual_deferred: sync_visual_clip(obj)
	var transform: Transform2D = obj.display.global_transform
	if not transform.is_finite() or absf(transform.determinant()) < 1e-06: return false
	var local: Vector2 = transform.affine_inverse() * point
	if not bounds(obj).has_point(local): return false
	if obj.display.texture != null:
		var path: String = obj.display.texture.get_meta("original_asset", "")
		var image: Image
		if hit_geometry.has(path):
			var cache_key: String = path + "#geometry"
			if not texture_images.has(cache_key): texture_images[cache_key] = Image.load_from_file(hit_geometry[path])
			image = texture_images[cache_key]
		else: image = texture_image(obj.display.texture)
		var pixel: Vector2i = Vector2i((local - obj.display.offset).floor())
		if image != null and pixel.x >= 0 and pixel.y >= 0 and pixel.x < image.get_width() and pixel.y < image.get_height() and image.get_pixelv(pixel).a > 0.01: return true
	elif obj.kind == "edittext" and obj.display.own_bounds.has_point(local): return true
	for drawing: Array in obj.fields.get("@drawing", []):
		match drawing[0]:
			"rect": if (drawing[1] as Rect2).has_point(local): return true
			"circle": if local.distance_squared_to(drawing[1]) <= float(drawing[2]) * float(drawing[2]): return true
			"polygon": if Geometry2D.is_point_in_polygon(local, drawing[1]): return true
			"line": if local.distance_to(Geometry2D.get_closest_point_to_segment(local, drawing[1], drawing[2])) <= float(drawing[4]) * 0.5: return true
	for child in obj.children:
		if shape_at_point(child, point): return true
	return false

static func display_call(obj: Variant, key: String, a: Array) -> Variant:
	if obj.lazy_kind == 4: materialize_pattern_marker(obj)
	if obj.render_batch and key not in ["stop", "play", "gotoAndPlay", "gotoAndStop", "nextFrame", "prevFrame", "getBounds", "getRect", "localToGlobal", "globalToLocal"]: materialize_batch(obj)
	if obj.visual_deferred and key not in ["stop", "play"]: sync_visual_clip(obj)
	match key:
		"play": obj.playing = true;refresh_active_clip(obj)
		"stop":
			if obj.render_batch and obj.timeline.get("@batch_ephemeral", false): materialize_batch(obj)
			obj.playing = false;refresh_active_clip(obj)
		"gotoAndPlay", "gotoAndStop": goto_frame(obj, arg(a, 0, 1), key == "gotoAndPlay")
		"nextFrame", "prevFrame": goto_frame(obj, obj.frame + (1 if key == "nextFrame" else -1), false)
		"addFrameScript":
			for i in range(0, a.size() - 1, 2): obj.frame_scripts[int(num(a[i])) + 1] = owned_callback(obj, a[i + 1])
		"addChild": return add_child(obj, arg(a, 0))
		"addChildAt": return add_child(obj, arg(a, 0), int(num(arg(a, 1, 0))))
		"removeChild": return remove_child(obj, arg(a, 0))
		"removeChildAt": return remove_child(obj, obj.children[int(num(arg(a, 0)))]) if num(arg(a, 0)) >= 0 and num(arg(a, 0)) < obj.children.size() else null
		"getChildAt": return obj.children[int(num(arg(a, 0)))] if num(arg(a, 0)) >= 0 and num(arg(a, 0)) < obj.children.size() else null
		"getChildByName":
			for child in obj.children:
				if child.fields.get("name") == arg(a, 0): return child
			return null
		"getChildIndex": return obj.children.find(arg(a, 0))
		"setChildIndex":
			var child = arg(a, 0); var index: int = clampi(int(num(arg(a, 1))), 0, maxi(0, obj.children.size() - 1))
			if obj.children.has(child): obj.children.erase(child);obj.children.insert(index, child);obj.display.move_child(child.display, index)
		"swapChildren", "swapChildrenAt":
			var first: int = obj.children.find(arg(a, 0)) if key == "swapChildren" else int(num(arg(a, 0)))
			var second: int = obj.children.find(arg(a, 1)) if key == "swapChildren" else int(num(arg(a, 1)))
			if first >= 0 and second >= 0 and first < obj.children.size() and second < obj.children.size():
				var old = obj.children[first];obj.children[first] = obj.children[second];obj.children[second] = old
				for i in range(obj.children.size()): obj.display.move_child(obj.children[i].display, i)
		"contains":
			var child = arg(a, 0)
			while child is Value:
				if child == obj: return true
				child = child.parent_value()
			return false
		"localToGlobal", "globalToLocal":
			var point = arg(a, 0); var v: Vector2 = Vector2(num(get_value(point, "x")), num(get_value(point, "y")))
			v = obj.display.to_global(v) if key == "localToGlobal" else obj.display.to_local(v)
			return construct(klass("Point"), [v.x, v.y])
		"getBounds", "getRect":
			var b: Rect2 = bounds(obj); var target = arg(a, 0, obj)
			if is_display(target): b = target.display.global_transform.affine_inverse() * obj.display.global_transform * b
			return construct(klass("Rectangle"), [b.position.x, b.position.y, b.size.x, b.size.y])
		"getObjectsUnderPoint":
			var point = arg(a, 0); var hits: Array = [];objects_at_point(obj, Vector2(num(get_value(point, "x")), num(get_value(point, "y"))), hits)
			return hits
		"hitTestPoint":
			var point: Vector2 = Vector2(num(arg(a, 0)), num(arg(a, 1)))
			if not truth(arg(a, 2, false)): return bounds(obj).has_point(obj.display.to_local(point))
			return shape_at_point(obj, point)
		"hitTestObject":
			var other = arg(a, 0)
			return (obj.display.global_transform * bounds(obj)).intersects(other.display.global_transform * bounds(other)) if is_display(other) else false
		"setTextFormat":
			var format = arg(a, 0); var existing = obj.fields.get("defaultTextFormat", construct(klass("TextFormat"), []))
			if format is Value:
				for field in format.fields:
					if format.fields[field] != null: existing.fields[field] = format.fields[field]
			obj.fields.defaultTextFormat = existing;obj.display.queue_redraw()
		"getTextFormat": return obj.fields.get("defaultTextFormat", construct(klass("TextFormat"), []))
		"appendText": obj.fields.text = string(obj.fields.get("text", "")) + string(arg(a, 0));obj.display.queue_redraw()
		"replaceText":
			var text: String = string(obj.fields.get("text", ""));obj.fields.text = text.substr(0, int(num(arg(a, 0)))) + string(arg(a, 2)) + text.substr(int(num(arg(a, 1))));obj.display.queue_redraw()
		"setSelection": obj.fields.selectionBeginIndex = arg(a, 0);obj.fields.selectionEndIndex = arg(a, 1)
		"toString": return string(obj)
		"hasOwnProperty": return obj.fields.has(string(arg(a, 0)))
	return null

static func owned_callback(obj: Variant, callback: Variant) -> Variant:


	if callback is Dictionary and callback.has("@method") and callback.get("receiver") is Value and callback.receiver == obj:
		callback = callback.duplicate();callback.receiver = weakref(obj);callback["@weak_self"] = true
	return callback

static func callback_equal(stored: Variant, callback: Variant) -> bool:
	if stored is Dictionary and stored.get("@weak_self", false):
		stored = stored.duplicate();stored.erase("@weak_self");stored.receiver = stored.receiver.get_ref()
	return stored == callback

static func event_call(obj: Variant, key: String, a: Array) -> Variant:
	var type: String = string(arg(a, 0, ""))
	match key:
		"addEventListener":
			if not obj.listeners.has(type): obj.listeners[type] = []
			var f = arg(a, 1)
			var exists: bool = false
			for callback in obj.listeners[type]:
				if callback_equal(callback, f): exists = true;break
			if not exists: obj.listeners[type].append(owned_callback(obj, f))
			if is_display(obj) and (type.begins_with("mouse") or type in ["click", "rollOver", "rollOut"]): refresh_mouse_target(obj)
			if type == "enterFrame" and is_display(obj) and obj.on_stage and obj != stage: active_clips[obj.get_instance_id()] = weakref(obj)
			if obj.kind == "sound" and type == "sampleData" and f is Dictionary and f.get("receiver") is Value: obj.fields["@pitch_owner"] = f.receiver
		"removeEventListener":
			if obj.listeners.has(type):
				for i in range(obj.listeners[type].size() - 1, -1, -1):
					if callback_equal(obj.listeners[type][i], arg(a, 1)): obj.listeners[type].remove_at(i)
			if is_display(obj) and (type.begins_with("mouse") or type in ["click", "rollOver", "rollOut"]): refresh_mouse_target(obj)
			if type == "enterFrame" and is_display(obj): refresh_active_clip(obj)
		"hasEventListener", "willTrigger": return obj.listeners.has(type) and not obj.listeners[type].is_empty()
		"dispatchEvent":
			var event = arg(a, 0);dispatch(obj, string(get_value(event, "type")), event.fields if event is Value else event if event is Dictionary else {});return true
	return null

static func dispatch(obj: Variant, type: String, data: Dictionary, bubble: bool = false) -> void :
	if not obj is Value: return
	var cursor = obj; var needed: bool = false
	while cursor is Value:
		if not cursor.listeners.get(type, []).is_empty(): needed = true;break
		if not bubble: break
		cursor = cursor.parent_value()
	if not needed: return
	var event = construct(klass("MouseEvent" if type.begins_with("mouse") or type in ["click", "rollOver", "rollOut"] else "KeyboardEvent" if type.begins_with("key") else "Event"), [type, bubble])
	event.fields.merge(data, true);event.fields.type = type;event.fields.target = obj;event.fields.currentTarget = obj
	var target = obj
	while target is Value:
		event.fields.currentTarget = target
		event.fields.eventPhase = 2 if target == obj else 3
		for f in target.listeners.get(type, []).duplicate():
			invoke(f, [event])
			if event.fields.get("@stop_immediate", false): break
		if not bubble or event.fields.get("@stopped", false): break
		target = target.parent_value()

static func keyboard_constant(k: String) -> int:
	var keys: Dictionary = {"BACKSPACE": 8, "TAB": 9, "ENTER": 13, "SHIFT": 16, "CONTROL": 17, "ALTERNATE": 18, "CAPS_LOCK": 20, "ESCAPE": 27, "SPACE": 32, "PAGE_UP": 33, "PAGE_DOWN": 34, "END": 35, "HOME": 36, "LEFT": 37, "UP": 38, "RIGHT": 39, "DOWN": 40, "INSERT": 45, "DELETE": 46, "NUMPAD_0": 96, "NUMPAD_1": 97, "NUMPAD_2": 98, "NUMPAD_3": 99, "NUMPAD_4": 100, "NUMPAD_5": 101, "NUMPAD_6": 102, "NUMPAD_7": 103, "NUMPAD_8": 104, "NUMPAD_9": 105}
	if k.length() == 1: return k.unicode_at(0)
	if k.begins_with("NUMBER_"): return 48 + k.trim_prefix("NUMBER_").to_int()
	if k.begins_with("F") and k.substr(1).is_valid_int(): return 111 + k.substr(1).to_int()
	return keys.get(k, 0)

static func bytearray_call(obj: Variant, key: String, a: Array) -> Variant:
	var s: StreamPeerBuffer = obj.stream
	match key:
		"writeInt", "writeUnsignedInt": s.put_32(int(num(arg(a, 0))))
		"writeShort": s.put_16(int(num(arg(a, 0))))
		"writeByte": s.put_u8(int(num(arg(a, 0))) & 255)
		"writeFloat": s.put_float(num(arg(a, 0)))
		"writeDouble": s.put_double(num(arg(a, 0)))
		"writeBoolean": s.put_u8(1 if truth(arg(a, 0)) else 0)
		"writeUTF":
			var bytes: PackedByteArray = string(arg(a, 0)).to_utf8_buffer();s.put_u16(bytes.size());s.put_data(bytes)
		"writeUTFBytes": s.put_data(string(arg(a, 0)).to_utf8_buffer())
		"writeBytes":
			var other = arg(a, 0); var offset: int = int(num(arg(a, 1, 0))); var length: int = int(num(arg(a, 2, 0)))
			if other is Value and other.stream != null: s.put_data(other.stream.data_array.slice(offset, offset + length if length > 0 else other.stream.get_size()))
		"readInt": return s.get_32() if s.get_available_bytes() >= 4 else 0
		"readUnsignedInt": return s.get_u32() if s.get_available_bytes() >= 4 else 0
		"readShort": return s.get_16() if s.get_available_bytes() >= 2 else 0
		"readUnsignedShort": return s.get_u16() if s.get_available_bytes() >= 2 else 0
		"readByte": return s.get_8() if s.get_available_bytes() > 0 else 0
		"readUnsignedByte": return s.get_u8() if s.get_available_bytes() > 0 else 0
		"readFloat": return s.get_float() if s.get_available_bytes() >= 4 else 0.0
		"readDouble": return s.get_double() if s.get_available_bytes() >= 8 else 0.0
		"readBoolean": return s.get_u8() != 0 if s.get_available_bytes() > 0 else false
		"readUTF":
			var length: int = s.get_u16() if s.get_available_bytes() >= 2 else 0;return s.get_data(mini(length, s.get_available_bytes()))[1].get_string_from_utf8()
		"readUTFBytes": return s.get_data(mini(int(num(arg(a, 0))), s.get_available_bytes()))[1].get_string_from_utf8()
		"readBytes":
			var other = arg(a, 0); var offset: int = int(num(arg(a, 1, 0))); var length: int = int(num(arg(a, 2, 0)));length = s.get_available_bytes() if length == 0 else mini(length, s.get_available_bytes())
			if other is Value and other.stream != null: other.stream.seek(offset);other.stream.put_data(s.get_data(length)[1])
		"clear": s.clear()
		"compress", "deflate": s.data_array = s.data_array.compress(FileAccess.COMPRESSION_DEFLATE)
		"uncompress", "inflate": s.data_array = s.data_array.decompress_dynamic(128 * 1024 * 1024, FileAccess.COMPRESSION_DEFLATE)
		"writeObject": s.put_var(encode_save(arg(a, 0)), true)
		"readObject": return decode_save(s.get_var(true))
		"toString": return s.data_array.get_string_from_utf8()
	return null

static func matrix_value(t: Transform2D) -> Variant: return construct(klass("Matrix"), [t.x.x, t.x.y, t.y.x, t.y.y, t.origin.x, t.origin.y])
static func display_number(value: Variant) -> float:
	var number: float = num(value)
	return clampf(number, -1000000, 1000000) if is_finite(number) else 0.0

static func to_transform(v: Variant) -> Transform2D: return Transform2D(Vector2(display_number(get_value(v, "a")), display_number(get_value(v, "b"))), Vector2(display_number(get_value(v, "c")), display_number(get_value(v, "d"))), Vector2(display_number(get_value(v, "tx")), display_number(get_value(v, "ty"))))

static func geom_call(obj: Variant, key: String, a: Array) -> Variant:
	var cn: String = obj.class_id
	if cn == "Matrix3D":
		var matrix: Transform3D = obj.native
		match key:
			"identity": matrix = Transform3D.IDENTITY
			"invert": matrix = matrix.affine_inverse()
			"appendRotation", "prependRotation":
				var axis = arg(a, 1); var direction: Vector3 = Vector3(num(get_value(axis, "x")), num(get_value(axis, "y")), num(get_value(axis, "z")))
				if direction.length_squared() > 0:
					var rotation: Transform3D = Transform3D(Basis(direction.normalized(), deg_to_rad(num(arg(a, 0)))), Vector3.ZERO)
					var pivot = arg(a, 2)
					if pivot != null:
						var point: Vector3 = Vector3(num(get_value(pivot, "x")), num(get_value(pivot, "y")), num(get_value(pivot, "z")))
						rotation.origin = point - rotation.basis * point
					matrix = rotation * matrix if key == "appendRotation" else matrix * rotation
			"appendTranslation", "prependTranslation":
				var translation: Transform3D = Transform3D(Basis.IDENTITY, Vector3(num(arg(a, 0)), num(arg(a, 1)), num(arg(a, 2))))
				matrix = translation * matrix if key == "appendTranslation" else matrix * translation
			"appendScale", "prependScale":
				var scale: Transform3D = Transform3D(Basis.from_scale(Vector3(num(arg(a, 0)), num(arg(a, 1)), num(arg(a, 2)))), Vector3.ZERO)
				matrix = scale * matrix if key == "appendScale" else matrix * scale
			"append", "prepend": matrix = arg(a, 0).native * matrix if key == "append" else matrix * arg(a, 0).native
			"transformVector", "deltaTransformVector":
				var point = arg(a, 0); var vector: Vector3 = Vector3(num(get_value(point, "x")), num(get_value(point, "y")), num(get_value(point, "z")))
				vector = matrix * vector if key == "transformVector" else matrix.basis * vector
				return construct(klass("Vector3D"), [vector.x, vector.y, vector.z])
			"clone": var copy = construct(klass("Matrix3D"), []);copy.native = matrix;return copy
		obj.native = matrix;return null
	if key == "clone":
		var result = construct(klass(cn), []);result.fields = obj.fields.duplicate();return result
	if cn == "Matrix":
		var t: Transform2D = to_transform(obj)
		match key:
			"identity": t = Transform2D.IDENTITY
			"invert": t = t.affine_inverse()
			"translate": t.origin += Vector2(num(arg(a, 0)), num(arg(a, 1)))
			"scale": t = Transform2D(Vector2(num(arg(a, 0)), 0), Vector2(0, num(arg(a, 1))), Vector2.ZERO) * t
			"rotate": t = t.rotated(num(arg(a, 0)))
			"concat": t = to_transform(arg(a, 0)) * t
			"transformPoint", "deltaTransformPoint":
				var v: Vector2 = Vector2(num(get_value(arg(a, 0), "x")), num(get_value(arg(a, 0), "y")))
				if key == "deltaTransformPoint": t.origin = Vector2.ZERO
				v = t * v;return construct(klass("Point"), [v.x, v.y])
			"setTo":
				for i in range(mini(a.size(), 6)): obj.fields[["a", "b", "c", "d", "tx", "ty"][i]] = a[i]
				return null
		obj.fields.merge(matrix_value(t).fields, true);return null
	if cn in ["Point", "Vector3D"]:
		var v: Vector3 = Vector3(num(obj.fields.get("x")), num(obj.fields.get("y")), num(obj.fields.get("z")))
		var other = arg(a, 0); var w: Vector3 = Vector3(num(get_value(other, "x")), num(get_value(other, "y")), num(get_value(other, "z")))
		match key:
			"add": v += w;return construct(klass(cn), [v.x, v.y, v.z])
			"subtract": v -= w;return construct(klass(cn), [v.x, v.y, v.z])
			"equals": return v == w
			"normalize": v = v.normalized() * num(arg(a, 0, 1));obj.fields.x = v.x;obj.fields.y = v.y; if cn == "Vector3D": obj.fields.z = v.z
			"offset": obj.fields.x = num(obj.fields.get("x")) + num(arg(a, 0));obj.fields.y = num(obj.fields.get("y")) + num(arg(a, 1))
			"setTo": obj.fields.x = arg(a, 0, 0);obj.fields.y = arg(a, 1, 0)
			"copyFrom": obj.fields.x = w.x;obj.fields.y = w.y
			"dotProduct": return v.dot(w)
			"crossProduct": v = v.cross(w);return construct(klass(cn), [v.x, v.y, v.z])
		return null
	if cn == "Rectangle":
		var r: Rect2 = Rect2(num(obj.fields.x), num(obj.fields.y), num(obj.fields.width), num(obj.fields.height))
		match key:
			"contains": return r.has_point(Vector2(num(arg(a, 0)), num(arg(a, 1))))
			"containsPoint": return r.has_point(Vector2(num(get_value(arg(a, 0), "x")), num(get_value(arg(a, 0), "y"))))
			"isEmpty": return not r.has_area()
			"setEmpty": obj.fields.x = 0;obj.fields.y = 0;obj.fields.width = 0;obj.fields.height = 0
			"offset": obj.fields.x += num(arg(a, 0));obj.fields.y += num(arg(a, 1))
			"inflate": obj.fields.x -= num(arg(a, 0));obj.fields.y -= num(arg(a, 1));obj.fields.width += num(arg(a, 0)) * 2;obj.fields.height += num(arg(a, 1)) * 2
		return null
	if cn == "ColorTransform" and key == "concat":
		for color in ["red", "green", "blue", "alpha"]:
			obj.fields[color + "Offset"] = num(obj.fields[color + "Offset"]) * num(get_value(arg(a, 0), color + "Multiplier")) + num(get_value(arg(a, 0), color + "Offset"))
			obj.fields[color + "Multiplier"] = num(obj.fields[color + "Multiplier"]) * num(get_value(arg(a, 0), color + "Multiplier"))
	return null

static func date_call(obj: Variant, key: String, a: Array) -> Variant:
	var d: Dictionary = obj.native if obj.native is Dictionary else Time.get_datetime_dict_from_system()
	match key.to_lower():
		"gettime": return obj.fields.get("time", 0)
		"getfullyear": return d.year
		"getmonth": return d.month - 1
		"getdate": return d.day
		"getday": return d.weekday
		"gethours": return d.hour
		"getminutes": return d.minute
		"getseconds": return d.second
		"getmilliseconds": return 0
		"settime": obj.fields.time = arg(a, 0);obj.native = Time.get_datetime_dict_from_unix_time(int(num(arg(a, 0)) / 1000))
	return null

static func refresh_bitmap(obj: Variant) -> void :
	var data = get_value(obj, "bitmapData")
	if data is Value and data.native is Image:
		if not data.fields.has("@bitmap_views"): data.fields["@bitmap_views"] = []
		var registered: bool = false
		for ref in data.fields["@bitmap_views"]:
			if ref.get_ref() == obj: registered = true;break
		if not registered: data.fields["@bitmap_views"].append(weakref(obj))
		obj.display.texture = ImageTexture.create_from_image(data.native)
		obj.display.own_bounds = Rect2(Vector2.ZERO, data.native.get_size());obj.display.invalidate_bounds();obj.display.queue_redraw()

static func bitmap_draw_tree(destination: Image, source: Variant, matrix: Transform2D, as_mask: bool = false) -> void :
	bitmap_draw_branch(destination, source, matrix, as_mask, false, Color.WHITE)

static func bitmap_draw_branch(destination: Image, source: Variant, matrix: Transform2D, as_mask: bool, library_root: bool, inherited_tint: Color) -> void :
	if not is_display(source) or not library_root and not as_mask and not source.display.visible: return
	if source.render_batch: materialize_batch(source)
	var display = source.display
	var tint: Color = inherited_tint * (Color.WHITE if library_root else display.modulate)
	if display.texture != null:
		var image: Image = texture_image(display.texture)
		if image != null and matrix.is_finite() and absf(matrix.determinant()) > 1e-06:
			if bitmap_fast_path and bitmap_blit(destination, image, matrix, display.offset, tint):
				for child in source.children: bitmap_draw_branch(destination, child, matrix * child.display.transform, as_mask, false, tint)
				return
			var target: Rect2i = Rect2i(matrix * Rect2(display.offset, image.get_size())).intersection(Rect2i(0, 0, destination.get_width(), destination.get_height()))
			var inverse: Transform2D = matrix.affine_inverse()
			for y in range(target.position.y, target.end.y):
				for x in range(target.position.x, target.end.x):
					var point: Vector2 = inverse * Vector2(x + 0.5, y + 0.5) - display.offset
					if point.x < 0 or point.y < 0 or point.x >= image.get_width() or point.y >= image.get_height(): continue
					var color: Color = image.get_pixel(int(point.x), int(point.y)) * tint
					if color.a > 0: destination.set_pixel(x, y, destination.get_pixel(x, y).blend(color))
	for child in source.children: bitmap_draw_branch(destination, child, matrix * child.display.transform, as_mask, false, tint)

static func bitmap_blit(destination: Image, image: Image, matrix: Transform2D, offset: Vector2, tint: Color) -> bool:
	if tint != Color.WHITE or absf(matrix.x.y) > 1e-06 or absf(matrix.y.x) > 1e-06: return false
	if absf(matrix.x.x) < 1 or absf(matrix.y.y) < 1 or not is_equal_approx(absf(matrix.x.x), roundf(absf(matrix.x.x))) or not is_equal_approx(absf(matrix.y.y), roundf(absf(matrix.y.y))): return false
	var rectangle: Rect2 = matrix * Rect2(offset, image.get_size())
	if not rectangle.position.is_equal_approx(rectangle.position.round()) or not rectangle.size.is_equal_approx(rectangle.size.round()): return false
	var size: Vector2i = Vector2i(rectangle.size.round())
	if size.x <= 0 or size.y <= 0 or size.x > 8192 or size.y > 8192: return false
	var pixels: Image = image
	if size != image.get_size() or matrix.x.x < 0 or matrix.y.y < 0:
		pixels = image.duplicate()
		if matrix.x.x < 0: pixels.flip_x()
		if matrix.y.y < 0: pixels.flip_y()
		if size != pixels.get_size(): pixels.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
	destination.blend_rect(pixels, Rect2i(Vector2i.ZERO, size), Vector2i(rectangle.position.round()))
	return true

static func capture_pause_bitmap(obj: Value, source: Variant, args: Array) -> bool:
	if not gpu_pause_snapshot_enabled or snapshot_script == null or args.size() != 1 or not source is Value: return false
	var game: Variant = statics.get("RDGame", EMPTY_MAP).get("Instance")
	if not game is Value or game.fields.get("m_WorldLayer") != source: return false
	var hud: Variant = game.fields.get("m_Hud")
	if not hud is Value or hud.fields.get("m_PauseBitmapData") != obj: return false
	if not is_display(source) or not source.display.global_transform.is_equal_approx(Transform2D.IDENTITY): return false
	var began: int = Time.get_ticks_usec()
	if not snapshot_script.capture(driver, obj.native, source.display): return false
	gpu_pause_snapshot_count += 1;gpu_pause_snapshot_us += Time.get_ticks_usec() - began
	return true

static func bitmap_call(obj: Variant, key: String, a: Array) -> Variant:
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	if not obj.native is Image: return null
	var image: Image = obj.native
	match key:
		"clone":
			var copy = construct(klass("BitmapData"), [image.get_width(), image.get_height(), true, 0]);copy.native = image.duplicate();return copy
		"draw":
			var source = arg(a, 0); var matrix: Transform2D = to_transform(a[1]) if a.size() > 1 and a[1] != null else Transform2D.IDENTITY
			if capture_pause_bitmap(obj, source, a): pass
			elif source is Value and source.native is Image: image.blend_rect(source.native, Rect2i(Vector2i.ZERO, source.native.get_size()), Vector2i(matrix.origin))
			else: bitmap_draw_branch(image, source, matrix, false, true, Color.WHITE)
		"copyPixels":
			var source = arg(a, 0); var rect = arg(a, 1); var point = arg(a, 2)
			if source is Value and source.native is Image:
				var source_image: Image = source.native.duplicate() if source == obj else source.native
				var region: Rect2i = Rect2i(int(num(get_value(rect, "x"))), int(num(get_value(rect, "y"))), int(num(get_value(rect, "width"))), int(num(get_value(rect, "height"))))
				var position: Vector2i = Vector2i(int(num(get_value(point, "x"))), int(num(get_value(point, "y"))))
				if truth(arg(a, 5, false)): image.blend_rect(source_image, region, position)
				else: image.blit_rect(source_image, region, position)
		"getPixel", "getPixel32":
			var x: int = clampi(int(num(arg(a, 0))), 0, image.get_width() - 1); var y: int = clampi(int(num(arg(a, 1))), 0, image.get_height() - 1); var c: Color = image.get_pixel(x, y)
			return (int(c.a * 255) << 24 if key == "getPixel32" else 0) | (int(c.r * 255) << 16) | (int(c.g * 255) << 8) | int(c.b * 255)
		"setPixel", "setPixel32":
			var x: int = int(num(arg(a, 0))); var y: int = int(num(arg(a, 1))); var color: int = int(num(arg(a, 2)))
			if x >= 0 and y >= 0 and x < image.get_width() and y < image.get_height(): image.set_pixel(x, y, Color.hex(((color & 16777215) << 8) | ((color >> 24) & 255 if key == "setPixel32" else 255)))
		"fillRect":
			var r = arg(a, 0); var rect: Rect2i = Rect2i(int(num(get_value(r, "x"))), int(num(get_value(r, "y"))), int(num(get_value(r, "width"))), int(num(get_value(r, "height"))))
			var color: int = int(num(arg(a, 1)));image.fill_rect(rect.intersection(Rect2i(Vector2i.ZERO, image.get_size())), Color.hex(((color & 16777215) << 8) | ((color >> 24) & 255)))
		"noise", "perlinNoise":
			var noise: FastNoiseLite = FastNoiseLite.new();noise.seed = int(num(arg(a, 0, 0)))
			for y in range(image.get_height()):
				for x in range(image.get_width()):
					var value: float = noise.get_noise_2d(x, y) * 0.5 + 0.5;image.set_pixel(x, y, Color(value, value, value, 1))
		"dispose": obj.native = null
	for ref in obj.fields.get("@bitmap_views", []):
		var bitmap = ref.get_ref()
		if bitmap != null and bitmap.fields.get("bitmapData") == obj: refresh_bitmap(bitmap)
	if profiling_hitches: record_hitch("bitmap", key, began)
	return null

static func graphics_call(obj: Variant, key: String, a: Array) -> Variant:
	if obj.display.road_batch: obj.display.clear_road_batch()
	mask_revision += 1
	if not obj.fields.has("@drawing"): obj.fields["@drawing"] = []
	match key:
		"clear": obj.fields["@drawing"].clear();obj.fields["@path"] = PackedVector2Array();obj.fields["@filling"] = false;obj.fields.erase("@line_width")
		"beginFill":
			finish_graphic_path(obj)
			obj.fields["@fill"] = Color.hex(((int(num(arg(a, 0, 0))) & 16777215) << 8) | int(clampf(num(arg(a, 1, 1)), 0, 1) * 255));obj.fields["@filling"] = true
		"endFill": finish_graphic_path(obj);obj.fields["@filling"] = false
		"lineStyle": obj.fields["@line_color"] = Color.hex(((int(num(arg(a, 1, 0))) & 16777215) << 8) | 255);obj.fields["@line_width"] = num(arg(a, 0, 1))
		"moveTo":
			finish_graphic_path(obj)
			obj.fields["@pen"] = Vector2(num(arg(a, 0)), num(arg(a, 1)));obj.fields["@path"] = PackedVector2Array([obj.fields["@pen"]])
		"lineTo":
			var end: Vector2 = Vector2(num(arg(a, 0)), num(arg(a, 1)))
			if obj.fields.has("@line_width"): obj.fields["@drawing"].append(["line", obj.fields.get("@pen", Vector2.ZERO), end, obj.fields.get("@line_color", Color.WHITE), obj.fields["@line_width"]])
			var path: PackedVector2Array = obj.fields.get("@path", PackedVector2Array([obj.fields.get("@pen", Vector2.ZERO)]));path.append(end);obj.fields["@path"] = path;obj.fields["@pen"] = end
		"curveTo":
			var start: Vector2 = obj.fields.get("@pen", Vector2.ZERO); var control: Vector2 = Vector2(num(arg(a, 0)), num(arg(a, 1))); var end: Vector2 = Vector2(num(arg(a, 2)), num(arg(a, 3)))
			for i in range(1, 17):
				var t: float = float(i) / 16; var point: Vector2 = (1 - t) * (1 - t) * start + 2 * (1 - t) * t * control + t * t * end;graphics_call(obj, "lineTo", [point.x, point.y])
		"drawRect", "drawRoundRect": obj.fields["@drawing"].append(["rect", Rect2(num(arg(a, 0)), num(arg(a, 1)), num(arg(a, 2)), num(arg(a, 3))), obj.fields.get("@fill", Color.WHITE)])
		"drawCircle": obj.fields["@drawing"].append(["circle", Vector2(num(arg(a, 0)), num(arg(a, 1))), num(arg(a, 2)), obj.fields.get("@fill", Color.WHITE)])
	obj.display.queue_redraw()
	obj.display.invalidate_bounds()
	return null

static func finish_graphic_path(obj: Variant) -> void :
	var path: PackedVector2Array = obj.fields.get("@path", PackedVector2Array())
	if obj.fields.get("@filling", false) and path.size() >= 3:
		var polygon: PackedVector2Array = []
		for point in path:
			if not point.is_finite(): polygon.clear();break
			if polygon.is_empty() or not polygon[-1].is_equal_approx(point): polygon.append(point)
		if polygon.size() >= 3 and not Geometry2D.triangulate_polygon(polygon).is_empty(): obj.fields["@drawing"].append(["polygon", polygon, obj.fields.get("@fill", Color.WHITE)])
	obj.fields["@path"] = PackedVector2Array()

static func get_sound(path: String) -> AudioStream:
	if sounds.has(path): return sounds[path]
	var began: int = Time.get_ticks_usec() if profiling_hitches else 0
	var stream: AudioStream
	if path.ends_with(".mp3"):
		var mp3: AudioStreamMP3 = AudioStreamMP3.new();mp3.data = FileAccess.get_file_as_bytes(path);stream = mp3
	elif path.ends_with(".wav"): stream = AudioStreamWAV.load_from_file(path)
	sounds[path] = stream
	if profiling_hitches: record_hitch("sound", path, began)
	return stream

static func get_font(id: String) -> Font:
	if fonts.has(id): return fonts[id]
	var path: String = assets.get("fonts", {}).get(id, "")
	if path == "": return ThemeDB.fallback_font
	var font: FontFile = FontFile.new();font.data = FileAccess.get_file_as_bytes(path);fonts[id] = font
	return font

static func play_sound(obj: Variant, a: Array) -> Variant:
	var path: String = obj.fields.get("@sound_path", assets.sounds.get(obj.class_id, ""))
	var pitch_owner = obj.fields.get("@pitch_owner")
	if path == "" and pitch_owner is Value:
		var source = get_value(pitch_owner, "m_PitchSound")
		if source is Value: path = assets.sounds.get(source.class_id, "")
	if path == "": return null
	var channel = Value.new();channel.class_id = "SoundChannel";channel.kind = "channel"
	var player: AudioStreamPlayer = AudioStreamPlayer.new();player.stream = get_sound(path)
	if player.stream == null: player.queue_free();return null
	obj.fields.length = player.stream.get_length() * 1000
	channel.audio = player
	values.append(weakref(channel));active_channels.append(weakref(channel))
	if pitch_owner is Value: channel.fields["@pitch_owner"] = pitch_owner
	var transform = arg(a, 2, construct(klass("SoundTransform"), [1, 0]));channel.fields.soundTransform = transform
	player.volume_db = linear_to_db(maxf(1e-05, num(get_value(transform, "volume"))))
	var audio_host: Node = driver.get_node_or_null("Audio")
	(audio_host if audio_host != null else driver).add_child(player)
	update_sound_pan(channel, num(get_value(transform, "pan")))
	var loops: int = int(num(arg(a, 1, 0)))
	channel.fields["@loops"] = loops
	player.finished.connect( func():
		if channel.fields["@loops"] > 0:
			channel.fields["@loops"] -= 1
			player.play()
		else:
			dispatch(channel, "soundComplete", {})
			player.queue_free()
			channel.audio = null)
	player.finished.connect( func():
		if channel.audio == null: release_sound_bus(channel))
	player.play(num(arg(a, 0, 0)) / 1000)
	return channel

static func tick_audio() -> void :
	for ref in active_channels.duplicate():
		var channel = ref.get_ref()
		if channel == null or not is_instance_valid(channel.audio): active_channels.erase(ref);continue
		var owner = channel.fields.get("@pitch_owner")
		if owner is Value:
			var callback = get_value(owner, "m_GetPitchCallback")
			var rate: float = num(invoke(callback, []) if callback != null else get_value(owner, "m_fRate"))
			channel.audio.pitch_scale = clampf(rate, 0.01, 4)
		var transform = channel.fields.get("soundTransform")
		if transform != null:
			channel.audio.volume_db = linear_to_db(maxf(1e-05, num(get_value(transform, "volume"))))
			update_sound_pan(channel, num(get_value(transform, "pan")))

static func update_sound_pan(channel: Variant, pan: float) -> void :
	if pan == 0 and not channel.fields.has("@pan_effect"): return
	if not channel.fields.has("@pan_effect"):
		var bus: String = "SpatialSound" + str(channel.get_instance_id()); var effect: AudioEffectPanner = AudioEffectPanner.new()
		AudioServer.add_bus(); var index: int = AudioServer.bus_count - 1;AudioServer.set_bus_name(index, bus);AudioServer.add_bus_effect(index, effect)
		channel.fields["@pan_effect"] = effect;channel.fields["@pan_bus"] = bus;channel.audio.bus = bus
	channel.fields["@pan_effect"].pan = clampf(pan, -1, 1)

static func release_sound_bus(channel: Variant) -> void :
	if not channel.fields.has("@pan_bus"): return
	var index: int = AudioServer.get_bus_index(channel.fields["@pan_bus"])
	if index > 0: AudioServer.remove_bus(index)
	channel.fields.erase("@pan_bus");channel.fields.erase("@pan_effect")

static func encode_save(v: Variant, depth: int = 0) -> Variant:
	if depth > 50: return null
	if v is Value:
		if v.kind == "bytearray": return {"@bytes": Marshalls.raw_to_base64(v.stream.data_array)}
		if v.kind == "bitmapdata" and v.native is Image: return {"@bitmap": Marshalls.raw_to_base64(v.native.save_png_to_buffer())}
		return encode_save(v.fields, depth + 1)
	if v is Dictionary:
		var result: Dictionary = {}
		for k in v:
			if not string(k).begins_with("@"): result[string(k)] = encode_save(v[k], depth + 1)
		return result
	if v is Array:
		var result: Array = []
		for x in v: result.append(encode_save(x, depth + 1))
		return result
	return v

static func decode_save(v: Variant) -> Variant:
	if v is Dictionary:
		if v.has("@bitmap"):
			var image: Image = Image.new();image.load_png_from_buffer(Marshalls.base64_to_raw(v["@bitmap"]))
			var bitmap = construct(klass("BitmapData"), [image.get_width(), image.get_height(), true, 0]);bitmap.native = image;return bitmap
		if v.has("@bytes"):
			var bytes = construct(klass("ByteArray"), []);bytes.stream.data_array = Marshalls.base64_to_raw(v["@bytes"]);return bytes
		var result: Dictionary = {}
		for k in v: result[k] = decode_save(v[k])
		return result
	if v is Array:
		var result: Array = []
		for x in v: result.append(decode_save(x))
		return result
	return v

static func shared_object(name: String) -> Variant:
	var object = Value.new();object.class_id = "SharedObject";object.fields["@save_path"] = "user://" + name.validate_filename() + ".json";object.fields.data = {}
	if FileAccess.file_exists(object.fields["@save_path"]):
		var data = JSON.parse_string(FileAccess.get_file_as_string(object.fields["@save_path"]))
		if data is Dictionary: object.fields.data = decode_save(data)
	return object

static func save_shared(obj: Variant) -> void :
	var file: FileAccess = FileAccess.open(obj.fields["@save_path"], FileAccess.WRITE)
	if file != null: file.store_string(JSON.stringify(encode_save(obj.fields.data), "\t"))

static func offline_api(key: String, a: Array) -> Variant:
	match key:
		"getSaveGroup": return {"name": arg(a, 0, "Campaigns"), "id": 1, "supportsRatings": false, "supportsPublishing": false, "supportsTags": true}
		"createSaveQuery": return local_query(string(arg(a, 0, "Campaigns")))
		"getMedalByName", "getMedal":
			var save = shared_object("medals"); var medal = Value.new();medal.class_id = "LocalMedal";medal.fields = {"name": arg(a, 0), "unlocked": save.fields.data.get(string(arg(a, 0)), false), "id": 0, "value": 0, "secret": false};return medal
		"getScoreBoard", "getScoreBoardByName":
			var board = Value.new();values.append(weakref(board));board.class_id = "com.newgrounds.ScoreBoard"
			board.fields = {"@offline_type": "scoreboard", "name": arg(a, 0, "Local Scores"), "scores": [], "numResults": 10, "period": "All-Time", "page": 1, "isLoaded": true}
			return board
		"getSaveFile", "createSaveFile":
			return local_file(string(arg(a, 0, "Campaigns")))
		"unlockMedal":
			var save = shared_object("medals");save.fields.data[string(arg(a, 0))] = true;save_shared(save)
		"postScore":
			var save = shared_object("scores");save.fields.data[string(arg(a, 0))] = maxf(num(save.fields.data.get(string(arg(a, 0)), 0)), num(arg(a, 1)));save_shared(save)
		"addEventListener", "removeEventListener", "logCustomEvent", "logEvent", "trackEvent", "connect", "loadScores", "loadSaveFiles", "loadSaveFile", "loadMedals", "showLogin", "promptSignIn": return null
	return null

static func local_file(category: String, record: Dictionary = {}) -> Variant:
	var file = Value.new();values.append(weakref(file));file.class_id = "com.newgrounds.SaveFile"
	file.fields = {"@offline_type": "file", "@category": category, "id": int(Time.get_unix_time_from_system() * 1000) + randi_range(0, 999), "name": "Untitled", "description": "", "authorId": 1, "authorName": "LocalPlayer", "keys": {}, "ratings": {}, "views": 0, "downloads": 0, "createdOn": Time.get_unix_time_from_system(), "updatedOn": Time.get_unix_time_from_system(), "data": null, "icon": null, "isLoaded": true, "isPrivate": category.begins_with("Private")}
	file.fields.merge(record, true)
	return file

static func local_query(category: String) -> Variant:
	var query = Value.new();values.append(weakref(query));query.class_id = "com.newgrounds.SaveQuery"
	query.fields = {"@offline_type": "query", "@category": category, "conditions": [], "resultsPerPage": 18, "page": 1, "isRandomized": false, "sortField": "createdOn", "descending": true}
	return query

static func local_event(obj: Variant, constant: String, data: Dictionary = {}) -> void :
	var type = get_value(klass("com.newgrounds.APIEvent"), constant)
	driver.call_deferred("dispatch_local_event", obj, string(type), data)

static func offline_object_call(obj: Variant, key: String, a: Array) -> Variant:
	var fields: Dictionary = obj.fields
	if fields["@offline_type"] == "scoreboard":
		match key:
			"nextPage": fields.page += 1
			"prevPage": fields.page = maxi(1, int(fields.page) - 1)
			"loadScores":
				var scores = shared_object("scores");fields.scores = []
				if scores.fields.data.has(string(fields.name)) and int(fields.page) == 1:
					var score = num(scores.fields.data[string(fields.name)])
					fields.scores.append(construct(klass("com.newgrounds.Score"), [1, "LocalPlayer", string(score), score, ""]))
				local_event(obj, "SCORES_LOADED", {"success": true})
		return null
	if fields["@offline_type"] == "query":
		match key:
			"addCondition": fields.conditions.append(a.duplicate())
			"sortOn": fields.sortField = arg(a, 0, "createdOn");fields.descending = truth(arg(a, 1, false))
			"execute":
				var category: String = string(fields["@category"]); var path: String = "user://campaign_library/" + category.validate_filename()
				DirAccess.make_dir_recursive_absolute(path)
				var files: Array = []
				for name in DirAccess.get_files_at(path):
					if not name.ends_with(".json"): continue
					var record = decode_save(JSON.parse_string(FileAccess.get_file_as_string(path + "/" + name)))
					if not record is Dictionary: continue
					var accepted: bool = true
					for condition in fields.conditions:
						var field: String = string(condition[0]); var actual = record.get(field, record.get("keys", {}).get(field))
						if field == "Rating.votes": actual = record.get("ratings", {}).size()
						if field in ["author_name", "authorName"]: actual = record.get("authorName")
						if field in ["author_id", "authorId"]: actual = record.get("authorId")
						if field in ["file_name", "fileName", "name"]: actual = record.get("name")
						if field in ["fileId", "id"]: actual = record.get("id")
						var op: String = string(condition[1]);op = "==" if op == "=" else op
						if not truth(binary(op, actual, condition[2])): accepted = false;break
					if accepted: files.append(local_file(category, record))
				if fields.isRandomized: files.shuffle()
				else:
					files.sort_custom( func(x, y): return num(x.fields.get(fields.sortField, 0)) < num(y.fields.get(fields.sortField, 0)))
					if fields.descending: files.reverse()
				var start: int = maxi(0, (int(num(fields.page)) - 1) * int(num(fields.resultsPerPage)))
				local_event(obj, "QUERY_COMPLETE", {"data": {"files": files.slice(start, start + int(num(fields.resultsPerPage))), "numFiles": files.size()}, "success": true})
	else:
		var path: String = "user://campaign_library/" + string(fields["@category"]).validate_filename()
		match key:
			"save":
				DirAccess.make_dir_recursive_absolute(path)
				var file: FileAccess = FileAccess.open(path + "/" + string(fields.id) + ".json", FileAccess.WRITE)
				if file != null: file.store_string(JSON.stringify(encode_save(fields)));file.close()
				local_event(obj, "FILE_SAVED", {"success": file != null, "data": obj})
			"load": local_event(obj, "FILE_LOADED", {"success": true, "data": obj})
			"createIcon": fields.icon = arg(a, 0)
			"deleteFile": DirAccess.remove_absolute(path + "/" + string(fields.id) + ".json");local_event(obj, "FILE_DELETED", {"success": true, "data": obj})
			"sendVote": fields.ratings[string(arg(a, 0, "Rating"))] = num(arg(a, 1, 0));offline_object_call(obj, "save", []);local_event(obj, "VOTE_COMPLETE", {"success": true, "data": obj})
			"getRating": return fields.ratings.get(string(arg(a, 0, "Rating")), 0)
			"getKey": return fields.keys.get(string(arg(a, 0)))
			"setKey": fields.keys[string(arg(a, 0))] = arg(a, 1)
	return null

static func tween_api(key: String, a: Array) -> Variant:
	if key in ["killTweensOf", "killDelayedCallsTo"]:
		for tween in tweens:
			if equal(tween.target, arg(a, 0), true) or equal(tween.options.get("onComplete"), arg(a, 0), true): tween.dead = true
		return null
	if key == "delayedCall":
		var delayed: Dictionary = {"target": null, "duration": num(arg(a, 0)), "time": 0.0, "delay": 0.0, "options": {"onComplete": arg(a, 1), "onCompleteParams": arg(a, 2, [])}, "initial": {}, "dead": false};tweens.append(delayed);return delayed
	if key not in ["to", "from"]: return null
	var target = arg(a, 0); var options: Dictionary = arg(a, 2, {}) if arg(a, 2) is Dictionary else {}
	var initial: Dictionary = {}
	for field in options:
		if field in ["ease", "delay", "onComplete", "onCompleteParams", "onUpdate", "onUpdateParams", "onStart", "onStartParams", "overwrite", "useFrames", "runBackwards", "immediateRender"]: continue
		initial[field] = get_value(target, field)
		if key == "from": set_value(target, field, options[field]); var old = initial[field];initial[field] = options[field];options[field] = old
	var tween: Dictionary = {"target": target, "duration": maxf(1e-05, num(arg(a, 1))), "time": 0.0, "delay": num(options.get("delay", 0)), "options": options, "initial": initial, "dead": false, "started": false}
	tweens.append(tween)
	return tween

static func tick_tweens(delta: float) -> void :
	for tween in tweens.duplicate():
		if tween.dead: tweens.erase(tween);continue
		tween.time += delta
		if tween.time < tween.delay: continue
		if not tween.get("started", false): tween.started = true;invoke(tween.options.get("onStart"), tween.options.get("onStartParams", []))
		var t: float = clampf((tween.time - tween.delay) / maxf(1e-05, tween.duration), 0, 1)
		var eased: float = t
		if tween.options.has("ease"):
			var result = invoke(tween.options.ease, [t * tween.duration, 0, 1, tween.duration])
			if result is float or result is int: eased = num(result)
		for field in tween.initial: set_value(tween.target, field, lerpf(num(tween.initial[field]), num(tween.options[field]), eased))
		invoke(tween.options.get("onUpdate"), tween.options.get("onUpdateParams", []))
		if t >= 1: tweens.erase(tween);invoke(tween.options.get("onComplete"), tween.options.get("onCompleteParams", []))

static func cleanup() -> void :
	for group: String in source_bundle_pending.keys(): source_bundle_for(group)
	clear_text_cache()
	construction_stack.clear();construction_profile.clear()
	tweens.clear();frame_queue.clear();clips.clear();active_clips.clear();deferred_clips.clear()
	for ref in values:
		var value = ref.get_ref()
		if value == null: continue
		release_sound_bus(value)
		value.fields.clear();value.listeners.clear();value.children.clear();value.depths.clear();value.frame_scripts.clear();value.parent_ref = null;value.timeline.clear()
		value.behavior_cache = {};value.behavior_class = ""
		value.method_implementations.clear();value.method_class = ""
		if is_instance_valid(value.display): value.display.value = null;value.display.queue_free();value.display = null
		if is_instance_valid(value.audio): value.audio.stop();value.audio.queue_free();value.audio = null
	implementations.clear();empty_methods.clear();entity_behaviors.clear();values.clear();textures.clear();texture_images.clear();sounds.clear();fonts.clear();timelines.clear();timeline_states.clear();statics.clear();scripts.clear();class_tokens.clear();active_channels.clear();batch_frame_cache.clear();field_type_cache.clear();root = null
	native_initializers.clear();native_field_defaults.clear();native_field_steps.clear();native_stop_clips.clear();static_visual_cache.clear()
	accessor_flags.clear();constructor_default_cache.clear();pattern_load_depth = 0
	source_bundle_scripts.clear();source_bundle_pending.clear();source_bundle_classes.clear();source_usage.clear();hitch_events.clear()
	resolved_methods.clear();pattern_marker_safety.clear();pattern_data_depth = 0;deferred_pattern_markers = 0;materialized_pattern_markers = 0
	if stage != null: stage.children.clear();stage.listeners.clear();stage.fields.clear();stage = null




static func native_clear_graphics(mc: Value, road: Value = null) -> void :
	mc.display.clear_road_batch(road_batch_enabled, road.get_instance_id() if road != null else 0)
	mc.fields["@drawing"] = [];mc.fields["@path"] = PackedVector2Array();mc.fields["@filling"] = false;mc.fields.erase("@line_width");mc.display.invalidate_bounds();mc.display.queue_redraw()

static func native_color_lerp(first: Value, second: Value, ratio: float, output: Value) -> void :
	var a: Dictionary = first.fields; var b: Dictionary = second.fields; var c: Dictionary = output.fields
	var inverse: float = 1 - ratio
	c.R = int(ratio * b.R + inverse * a.R);c.G = int(ratio * b.G + inverse * a.G)
	c.B = int(ratio * b.B + inverse * a.B);c.A = int(ratio * b.A + inverse * a.A)

static func native_color_integer(color: Value) -> int:
	return int(color.fields.R * 65536 + color.fields.G * 256 + color.fields.B)

static func native_array_item(array: Array, index: int) -> Variant:
	return array[index] if index >= 0 and index < array.size() else null



static func fast_cached_road_surface(road: Value, kind: String, z: int, i: int, j: int, layer: int, camera: Value, mc: Value, projected_rows: Array, projected_depths: PackedFloat64Array, third_index: int = 0, fourth_index: int = 0) -> void :
	var front: bool = kind == "RenderFrontWall"
	if projected_rows[layer][z] == null or not front and projected_rows[layer][z + 1] == null:
		fast_road_surface(road, kind, z, i, j, layer, camera, mc, third_index, fourth_index);return
	var r: Dictionary = road.fields
	if camera.fields.m_fFogDistance < camera.fields.m_fMaxViewDistance:
		var step: float = statics.RDRoad.RenderStepSize
		var ratio: float = clampf((projected_depths[z] - camera.fields.m_fFogDistance + step) / step, 0, 1)
		var fog: Dictionary = statics.RDRoad.FogColor.fields; var color: Dictionary = r.m_RenderColor.fields
		var inverse: float = 1 - ratio
		color.R = int(ratio * fog.R + inverse * color.R);color.G = int(ratio * fog.G + inverse * color.G)
		color.B = int(ratio * fog.B + inverse * color.B);color.A = int(ratio * fog.A + inverse * color.A)
		r.m_iRenderColor = int(color.R * 65536 + color.G * 256 + color.B)
	var a: Array = r.m_Rendered2DVectors[layer][z]; var b: Array = a if front else r.m_Rendered2DVectors[layer][z + 1]
	var near: PackedFloat64Array = projected_rows[layer][z]; var far: PackedFloat64Array = near if front else projected_rows[layer][z + 1]
	if kind == "RenderSideWall" and i >= 2: var swap: int = i;i = j;j = swap
	r.m_vRenderVec2D1 = a[i];r.m_vRenderVec2D2 = a[j] if front else b[i]
	r.m_vRenderVec2D3 = a[third_index] if front else a[j];r.m_vRenderVec2D4 = a[fourth_index] if front else b[j]
	var second: int = j if front else i; var third: int = third_index if front else j; var fourth: int = fourth_index if front else j
	var points: PackedVector2Array = [Vector2(near[i * 2], near[i * 2 + 1] + 1), Vector2(far[second * 2], far[second * 2 + 1]), Vector2(far[fourth * 2], far[fourth * 2 + 1]), Vector2(near[third * 2], near[third * 2 + 1] + 1)]
	if not points[0].is_finite() or not points[1].is_finite() or not points[2].is_finite() or not points[3].is_finite(): return
	for index in range(3, 0, -1):
		if points[index].is_equal_approx(points[index - 1]): points.remove_at(index)
	var triangles: PackedInt32Array = Geometry2D.triangulate_polygon(points) if points.size() >= 3 else PackedInt32Array()
	if not triangles.is_empty():
		mc.fields["@drawing"].append(["polygon", points, Color.hex(((r.m_iRenderColor & 16777215) << 8) | 255)])
		if mc.display.road_batch: mc.display.append_road_polygon(points, triangles, Color.hex(((r.m_iRenderColor & 16777215) << 8) | 255), road_surface_key(road, camera, z, kind, i, j, layer, third_index, fourth_index))


static func fast_road_render(road: Value, args: Array) -> Variant:
	var fields: Dictionary = road.fields; var settings: Dictionary = statics.RDRoad; var camera: Value = args[0]
	var pattern: bool = fields.m_iMode == settings.Mode_Pattern
	var camera_z: float = (camera.fields.m_vLocation as Value).fields.Z
	if not pattern: camera_z = maxf(camera_z, 0)
	var offset: float = camera_z if pattern else fmod(camera_z, settings.RenderStepSize)
	var camera_slice: int = 0 if pattern else coerce(floorf(camera_z / settings.RenderStepSize), "int")
	native_clear_graphics(fields.m_MC, road);call_member(road, "UpdateRoadSlice", [camera])
	var projected: Array = NativeRoad.precompute(road, camera, settings, statics.RDWorld, statics.BasicGame.Instance.fields.m_Viewport.fields, true)
	var projected_rows: Array = projected[0]; var projected_depths: PackedFloat64Array = projected[1]
	var slices: Array = fields.m_RoadSlices; var render_color: Value = fields.m_RenderColor
	if not slices.is_empty():
		var count: int = 5 if pattern else mini(slices.size(), settings.NbRenderSteps)
		for slice_index in range(count):
			var slice_type: int = coerce(native_array_item(slices, slice_index), "int")
			var next_type: int = coerce(native_array_item(slices, slice_index + 1), "int") if slice_index < slices.size() - 1 else coerce(settings.SliceType_None, "int")
			var lava: bool = truth(native_array_item(fields.m_LavaRoadSlices, slice_index))
			fields.m_fRenderNearPosX = maxf(slice_index * settings.RenderStepSize - offset, settings.NearPos)
			fields.m_fRenderFarPosX = minf((slice_index + 1) * settings.RenderStepSize - offset, settings.FarPos) + 0.1
			var off_color: bool = fmod(float(camera_slice + slice_index), 2.0) == 0.0
			var ratio: float = fields.m_fRenderNearPosX / settings.FarPos
			var slice_entity: Value = fields.m_RoadSliceEntities[slice_index]; var ground_entity: Value = fields.m_RoadSliceGroundEntities[slice_index]
			fields.m_SliceEntity = slice_entity;fields.m_SliceEntityGround = ground_entity
			slice_entity.fields.m_iType = slice_type;slice_entity.fields.m_iNextType = next_type
			ground_entity.fields.m_iType = slice_type;ground_entity.fields.m_iNextType = next_type
			var slice_mc: Value = slice_entity.fields.m_MC; var ground_mc: Value = ground_entity.fields.m_MC
			native_clear_graphics(slice_mc, road);native_clear_graphics(ground_mc, road)
			if (slice_type == settings.SliceType_Town):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Park):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.GrassPathNearColorOff if off_color else settings.GrassPathNearColor), (settings.GrassPathFarColorOff if off_color else settings.GrassPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Cemetery):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.AlleywayGroundNearColorOff if off_color else settings.AlleywayGroundNearColor), (settings.AlleywayGroundFarColorOff if off_color else settings.AlleywayGroundFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Parking):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_PavementAndGrass):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_PavementAndDirt):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_PavementAndGrass):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_PavementAndSnow):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_GrassAndPavement):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_DirtAndPavement):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_SnowAndPavement):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_GrassAndDirt):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.MudNearColorOff if off_color else settings.MudNearColor), (settings.MudFarColorOff if off_color else settings.MudFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtPathNearColorOff if off_color else settings.DirtPathNearColor), (settings.DirtPathFarColorOff if off_color else settings.DirtPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_CrossingStreet):
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_CrossingDirtRoad):
				native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtPathNearColorOff if off_color else settings.DirtPathNearColor), (settings.DirtPathFarColorOff if off_color else settings.DirtPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Alleyway):
				native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderSideWall", slice_index, 2, 3, settings.Layer_Alleyway, camera, slice_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderSideWall", slice_index, 4, 5, settings.Layer_Alleyway, camera, slice_mc, projected_rows, projected_depths)
				native_color_lerp((settings.AlleywayGroundNearColorOff if off_color else settings.AlleywayGroundNearColor), (settings.AlleywayGroundFarColorOff if off_color else settings.AlleywayGroundFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Alleyway, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Highway):
				native_color_lerp((settings.WallNearColorOff if off_color else settings.WallNearColor), (settings.WallFarColorOff if off_color else settings.WallFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Highway, camera, slice_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderSideWall", slice_index, 4, 5, settings.Layer_Highway, camera, slice_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor), (settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_ForestPath):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.MudNearColorOff if off_color else settings.MudNearColor), (settings.MudFarColorOff if off_color else settings.MudFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_DirtAndGrass):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.MudNearColorOff if off_color else settings.MudNearColor), (settings.MudFarColorOff if off_color else settings.MudFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtPathNearColorOff if off_color else settings.DirtPathNearColor), (settings.DirtPathFarColorOff if off_color else settings.DirtPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_DirtAndRoad):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_SnowAndRoad):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_SnowAndDirtPath):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.MudNearColorOff if off_color else settings.MudNearColor), (settings.MudFarColorOff if off_color else settings.MudFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_GrassAndRoad):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.HedgeNearColorOff if off_color else settings.HedgeNearColor), (settings.HedgeFarColorOff if off_color else settings.HedgeFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.GrassNearColorOff if off_color else settings.GrassNearColor), (settings.GrassFarColorOff if off_color else settings.GrassFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadSideWalkNearColorOff if off_color else settings.RoadSideWalkNearColor), (settings.RoadSideWalkFarColorOff if off_color else settings.RoadSideWalkFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				fast_cached_road_surface(road, "RenderGround", slice_index, 4, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.RoadNearColorOff if off_color else settings.RoadNearColor), (settings.RoadFarColorOff if off_color else settings.RoadFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Dirt):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.DirtNearColorOff if off_color else settings.DirtNearColor), (settings.DirtFarColorOff if off_color else settings.DirtFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.DirtPathNearColorOff if off_color else settings.DirtPathNearColor), (settings.DirtPathFarColorOff if off_color else settings.DirtPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Mud):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.MudNearColorOff if off_color else settings.MudNearColor), (settings.MudFarColorOff if off_color else settings.MudFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.MudPathNearColorOff if off_color else settings.MudPathNearColor), (settings.MudPathFarColorOff if off_color else settings.MudPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Sand):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SandNearColorOff if off_color else settings.SandNearColor), (settings.SandFarColorOff if off_color else settings.SandFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.SandPathNearColorOff if off_color else settings.SandPathNearColor), (settings.SandPathFarColorOff if off_color else settings.SandPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Concrete):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.ConcreteNearColorOff if off_color else settings.ConcreteNearColor), (settings.ConcreteFarColorOff if off_color else settings.ConcreteFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.ConcretePathNearColorOff if off_color else settings.ConcretePathNearColor), (settings.ConcretePathFarColorOff if off_color else settings.ConcretePathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Snow):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.SnowNearColorOff if off_color else settings.SnowNearColor), (settings.SnowFarColorOff if off_color else settings.SnowFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.SnowPathNearColorOff if off_color else settings.SnowPathNearColor), (settings.SnowPathFarColorOff if off_color else settings.SnowPathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			elif (slice_type == settings.SliceType_Ice):
				if lava:
					native_color_lerp((settings.LavaNearColorOff if off_color else settings.LavaNearColor), (settings.LavaFarColorOff if off_color else settings.LavaFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				else:
					native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderSideWall", slice_index, 6, 7, settings.Layer_Main, camera, slice_mc, projected_rows, projected_depths)
					native_color_lerp((settings.IceNearColorOff if off_color else settings.IceNearColor), (settings.IceFarColorOff if off_color else settings.IceFarColor), ratio, render_color)
					fields.m_iRenderColor = signed32(native_color_integer(render_color))
					fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
					fast_cached_road_surface(road, "RenderGround", slice_index, 5, 6, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
				native_color_lerp((settings.IcePathNearColorOff if off_color else settings.IcePathNearColor), (settings.IcePathFarColorOff if off_color else settings.IcePathFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderGround", slice_index, 2, 5, settings.Layer_Main, camera, ground_mc, projected_rows, projected_depths)
			if (next_type == settings.SliceType_Alleyway):
				native_color_lerp((settings.StreetWallNearColorOff if off_color else settings.StreetWallNearColor), (settings.StreetWallFarColorOff if off_color else settings.StreetWallFarColor), ratio, render_color)
				fields.m_iRenderColor = signed32(native_color_integer(render_color))
				fast_cached_road_surface(road, "RenderFrontWall", slice_index + 1, 1, 0, settings.Layer_Alleyway, camera, slice_mc, projected_rows, projected_depths, 3, 2)
				fast_cached_road_surface(road, "RenderFrontWall", slice_index + 1, 4, 5, settings.Layer_Alleyway, camera, slice_mc, projected_rows, projected_depths, 6, 7)
	else:
		for slice_index in range(int(settings.NbRenderSteps)):
			fields.m_fRenderNearPosX = maxf(slice_index * settings.RenderStepSize - offset, settings.NearPos)
			fields.m_fRenderFarPosX = minf((slice_index + 1) * settings.RenderStepSize - offset, settings.FarPos) + 0.1
			var off_color: bool = fmod(float(camera_slice + slice_index), 2.0) == 0.0
			var ratio: float = fields.m_fRenderNearPosX / settings.FarPos
			var slice_entity: Value = fields.m_RoadSliceEntities[slice_index]; var ground_entity: Value = fields.m_RoadSliceGroundEntities[slice_index]
			fields.m_SliceEntity = slice_entity;fields.m_SliceEntityGround = ground_entity
			slice_entity.fields.m_iType = coerce(settings.SliceType_Highway, "int");ground_entity.fields.m_iType = coerce(settings.SliceType_Highway, "int")
			var slice_mc: Value = slice_entity.fields.m_MC; var ground_mc: Value = ground_entity.fields.m_MC
			native_clear_graphics(slice_mc, road);native_clear_graphics(ground_mc, road)
			native_color_lerp(settings.WallNearColorOff if off_color else settings.WallNearColor, settings.WallFarColorOff if off_color else settings.WallFarColor, ratio, render_color)
			fields.m_iRenderColor = signed32(native_color_integer(render_color))
			fast_cached_road_surface(road, "RenderSideWall", slice_index, 0, 1, settings.Layer_Highway, camera, slice_mc, projected_rows, projected_depths)
			fast_cached_road_surface(road, "RenderSideWall", slice_index, 4, 5, settings.Layer_Highway, camera, slice_mc, projected_rows, projected_depths)
			native_color_lerp(settings.RoadSideNearColorOff if off_color else settings.RoadSideNearColor, settings.RoadSideFarColorOff if off_color else settings.RoadSideFarColor, ratio, render_color)
			fields.m_iRenderColor = signed32(native_color_integer(render_color))
			fast_cached_road_surface(road, "RenderGround", slice_index, 1, 2, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
			fast_cached_road_surface(road, "RenderGround", slice_index, 3, 4, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
			native_color_lerp(settings.RoadNearColorOff if off_color else settings.RoadNearColor, settings.RoadFarColorOff if off_color else settings.RoadFarColor, ratio, render_color)
			fields.m_iRenderColor = signed32(native_color_integer(render_color))
			fast_cached_road_surface(road, "RenderGround", slice_index, 2, 3, settings.Layer_Highway, camera, ground_mc, projected_rows, projected_depths)
	return null
