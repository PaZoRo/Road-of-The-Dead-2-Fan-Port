extends Node
const R = preload("res://runtime/as_runtime.gd")
class Ticket:
	extends RefCounted
	signal resume_work
var waiting: Dictionary = {}
var deadline: int = 0
var budget_us: int = 1800
var shutting_down: bool = false
var epochs: Dictionary = {}
var slices: int = 0
var total_us: int = 0
var worst_us: int = 0
var over_budget: int = 0
var held_physics: int = 0
var held_animation: int = 0
var last_pump_physics: int = -1
var last_progress_us: int = 0
var fallback_slices: int = 0
var maximum_wait_us: int = 0
var queued_time: Dictionary = {}

func observe_lifecycle(receiver: Variant, _owner: String, key: String) -> void :
	if not receiver is R.Value or not R.instance_of(receiver, R.klass("RDGameModeGameplay")): return
	var id: int = receiver.get_instance_id();epochs[id] = int(epochs.get(id, 0)) + 1
	queued_time.erase(id)

func create_context(mode: R.Value) -> Dictionary:
	if shutting_down or R.root == null: return {}
	var game: R.Value = mode.fields.m_Game
	if game != R.root.fields.m_Game or game.fields.m_CurrentGameMode != mode: return {}
	return {"mode": mode, "game": game, "epoch": epochs.get(mode.get_instance_id(), 0), "waiting": false, "next_position": 0.0, "ticket": Ticket.new(), "section_open": false, "publication": []}

func valid_context(context: Dictionary) -> bool:
	if shutting_down or R.root == null or context.is_empty(): return false
	var mode: R.Value = context.mode; var game: R.Value = context.game
	if game != R.root.fields.m_Game or game.fields.m_CurrentGameMode != mode: return false
	if context.epoch != epochs.get(mode.get_instance_id(), 0): return false
	return not context.waiting or mode.fields.m_fNextPatternSpawnPosition == context.next_position

func resume_context(context: Dictionary) -> void :
	var previous: Dictionary = R.section_publication;R.section_publication = context
	(context.ticket as Ticket).resume_work.emit()
	R.section_publication = previous

func publish_section(context: Dictionary) -> void :
	for reference: WeakRef in context.get("publication", []):
		var clip: R.Value = reference.get_ref()
		if clip != null: clip.fields.erase("@section_pending")
	context.publication = [];context.section_open = false

func next_budget(context: Dictionary) -> void :
	if not valid_context(context): return
	if Time.get_ticks_usec() >= deadline: await wait_slice(context)

func wait_slice(context: Dictionary) -> void :
	if not valid_context(context): return
	var ticket: Ticket = context.ticket; var id: int = ticket.get_instance_id()
	if waiting.is_empty(): last_progress_us = Time.get_ticks_usec()
	waiting[id] = context
	await ticket.resume_work
	waiting.erase(id)

func pump(physics_frame: bool, animation_us: int) -> void :
	if shutting_down: return


	for context: Dictionary in waiting.values().duplicate():
		if not valid_context(context): resume_context(context)
	var wait_us: int = Time.get_ticks_usec() - last_progress_us


	if physics_frame and wait_us < 50000: held_physics += 1;return
	if animation_us > 1000 and wait_us < 16000: held_animation += 1;return
	if R.root == null: return
	var game: R.Value = R.root.fields.get("m_Game")
	if game == null or game.fields.m_iGameState != 1 or game.fields.m_bPaused: return
	if not waiting.is_empty():
		maximum_wait_us = maxi(maximum_wait_us, wait_us)
		if physics_frame or animation_us > 1000: fallback_slices += 1
	var began: int = Time.get_ticks_usec();deadline = began + budget_us
	for context: Dictionary in waiting.values().duplicate():
		if Time.get_ticks_usec() >= deadline: break
		resume_context(context)
	var used: int = Time.get_ticks_usec() - began
	slices += 1;total_us += used;worst_us = maxi(worst_us, used)
	if used > budget_us: over_budget += 1
	deadline = 0

func stop() -> void :
	shutting_down = true
	queued_time.clear()
	for context: Dictionary in waiting.values().duplicate(): resume_context(context)

func report() -> Dictionary:
	return {"slices": slices, "total_ms": total_us / 1000.0, "worst_slice_ms": worst_us / 1000.0, "over_budget": over_budget, "held_physics": held_physics, "held_animation": held_animation, "budget_ms": budget_us / 1000.0, "waiting": waiting.size(), "fallback_slices": fallback_slices, "maximum_wait_ms": maximum_wait_us / 1000.0}
