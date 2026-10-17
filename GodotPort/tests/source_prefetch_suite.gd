extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	expect(R.source_bundle_scripts.keys()==["startup"],"only common source module initially loaded")
	var values:int=R.values.size();var statics:Dictionary=R.statics.duplicate(true)
	seed(20261009);var expected:int=randi();seed(20261009)
	R.prefetch_source_bundles()
	expect(R.source_bundle_pending.size()==4,"remaining modules requested in background")
	var frames:int=0
	while not R.source_bundle_pending.is_empty():
		R.poll_source_bundles();await process_frame;frames+=1
	R.poll_source_bundles()
	expect(randi()==expected and R.values.size()==values and R.statics==statics,"background preparation does not execute game logic")
	expect(frames>0 and R.source_blocking_waits==0,"polling presents frames without blocking retrieval")
	expect(not R.source_bundle_scripts.has("editor"),"editor remains on demand")
	var selected:int=0;var cold:int=0
	var catalog:Dictionary=JSON.parse_string(FileAccess.get_file_as_string("res://data/source_bundles.json"))
	for entry in catalog.functions:
		if entry.bundle=="editor":continue
		var map:Dictionary=R.source_bundle_classes[entry.owner]
		var script:Script=R.source_bundle_for_function(map,entry.function)
		expect(script==R.source_bundle_scripts[entry.bundle] and script.has_method(entry.bundle_function),"routing "+entry.owner+"."+entry.function)
		if entry.bundle=="startup":selected+=1
		else:cold+=1
	# An early action joins an existing request without starting a second load.
	# Use the still-cold editor module to keep this case independent of caches.
	var path:String="res://runtime/source_editor.gd"
	var error:Error=ResourceLoader.load_threaded_request(path,"GDScript")
	expect(error==OK,"explicit cold module requested")
	if error==OK:
		R.source_bundle_pending.editor=path
		var script:Script=R.source_bundle_for("editor")
		expect(script!=null and not R.source_bundle_pending.has("editor"),"early action joins pending request")
		expect(script==R.source_bundle_scripts.editor,"early action retains completed resource")
	expect(selected==812 and cold>0 and R.warnings.is_empty(),"complete partition sizes and no warnings")
	print("TEST_SOURCE_PREFETCH_COMPLETE selected="+str(selected)+" other="+str(cold)+" frames="+str(frames)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
