extends RefCounted

var class_id: String = "Object"
var fields: Dictionary = {}
var field_types: Dictionary = {}
var has_getters: bool = false
var has_setters: bool = false
var lazy_kind: int = 0
var projection_root_is_self: bool = false
var projection_root_ref: WeakRef:
	set(scope):
		projection_root_ref = scope
		projection_root_is_self = scope != null and scope.get_ref() == self
var render_visible: bool = true
var behavior_cache: Dictionary = {}
var behavior_class: String = ""
var behavior_update: String = ""
var behavior_movement: String = ""
var behavior_animation: String = ""
var behavior_sounds: String = ""
var behavior_render: String = ""
var behavior_retirement: String = ""
var behavior_update_empty: bool = false
var behavior_render_empty: bool = false
var method_implementations: Dictionary = {}
var method_class: String = ""
var listeners: Dictionary = {}
var display: Node2D
var timeline: Dictionary = {}
var depths: Dictionary = {}
var children: Array = []
var frame_scripts: Dictionary = {}
var frame: int = 1
var playing: bool = true
var symbol: String = ""
var kind: String = "object"
var parent_ref: WeakRef
var stream: StreamPeerBuffer
var audio: AudioStreamPlayer
var native: Variant
var initialized: bool = false
var frame_dirty: bool = true
var applied_frame: int = 0
var constructor_done: bool = false
var on_stage: bool = false
var depth_order_dirty: bool = false
var timeline_masks_dirty: bool = false
var own_mouse_target: bool = false
var mouse_target_count: int = 0
var mask_revision_seen: int = -1
var mask_cached_signature: int = 0
var visual_deferred: bool = false
var render_batch: bool = false
var batch_disabled: bool = false

func parent_value() -> Variant:
	return parent_ref.get_ref() if parent_ref != null else null

func _notification(what: int) -> void :
	if what == NOTIFICATION_PREDELETE and is_instance_valid(display) and not display.is_queued_for_deletion(): display.queue_free()
