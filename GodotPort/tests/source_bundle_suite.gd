extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]

func _initialize() -> void:call_deferred("run")

func functions(text:String) -> Dictionary:
	var pattern:RegEx=RegEx.new()
	pattern.compile("(?ms)^static func (\\w+)\\([^\\n]*\\n.*?(?=^static func |\\z)")
	var result:Dictionary={}
	for found in pattern.search_all(text.replace("\r\n","\n")):
		result[found.get_string(1)]=found.get_string().strip_edges()
	return result

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
	var catalog:Dictionary=JSON.parse_string(FileAccess.get_file_as_string("res://data/source_bundles.json"))
	var bundles:Dictionary={};var sources:Dictionary={}
	if R.source_bundle_scripts.has("editor"):failures.append("unused editor eagerly loaded")
	var initial_rng:int=randi();seed(20261009)
	var expected_rng:int=randi();seed(20261009)
	var initial_values:int=R.values.size()
	for entry in catalog.functions:R.source_bundle_for(entry.bundle)
	if randi()!=expected_rng or R.values.size()!=initial_values:failures.append("bundle load runs game logic")
	seed(initial_rng)
	for group in R.source_bundle_scripts:
		bundles[group]=functions(FileAccess.get_file_as_string("res://runtime/source_"+group+".gd"))
	var checked:int=0
	for entry in catalog.functions:
		if not sources.has(entry.source):sources[entry.source]=functions(FileAccess.get_file_as_string(entry.source))
		var map:Dictionary=R.source_bundle_classes[entry.owner]
		if map.get("groups",R.EMPTY_MAP).get(entry.function,map.bundle)!=entry.bundle or map.functions[entry.function]!=entry.bundle_function:failures.append("incorrect function routing "+entry.owner+"."+entry.function)
		var expected:String=sources[entry.source][entry.function]
		var actual:String=bundles[entry.bundle][entry.bundle_function].replace("static func "+entry.bundle_function+"(","static func "+entry.function+"(")
		if actual!=expected:failures.append("changed body "+entry.owner+"."+entry.function)
		if not R.source_bundle_scripts[entry.bundle].has_method(entry.bundle_function):failures.append("missing function "+entry.bundle_function)
		checked+=1
	var declaration_count:int=0
	for group in bundles:declaration_count+=bundles[group].size()
	if declaration_count!=checked:failures.append("unmapped bundle declarations")
	var target:R.Value=R.Value.new();target.class_id="MC_Bush3"
	var dispatched:Callable=R.resolve_implementation("MC_Bush3","frame15")
	if dispatched.get_object()!=R.source_bundle_for_function(R.source_bundle_classes.MC_Bush3,"f_frame15"):failures.append("timeline callback does not use shared bundle")
	if R.scripts.has("MC_Bush3"):failures.append("bundled callback loads original script")
	print("TEST_SOURCE_BUNDLE_COMPLETE classes="+str(catalog.classes.size())+" functions="+str(checked)+" failures="+str(failures))
	R.cleanup();host.queue_free();quit(0 if failures.is_empty() else 1)
