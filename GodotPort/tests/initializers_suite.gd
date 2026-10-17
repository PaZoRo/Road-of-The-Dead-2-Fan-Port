extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func equivalent(a:Variant,b:Variant) -> bool:
	if a is float and b is float and is_nan(a) and is_nan(b):return true
	if a is R.Value and b is R.Value:return a.class_id==b.class_id and equivalent(a.fields,b.fields)
	if a is Array and b is Array:
		if a.size()!=b.size():return false
		for i in a.size():
			if not equivalent(a[i],b[i]):return false
		return true
	if a is Dictionary and b is Dictionary:
		if a.size()!=b.size():return false
		for k in a:
			if not b.has(k) or not equivalent(a[k],b[k]):return false
		return true
	return typeof(a)==typeof(b) and a==b

static func f_noop(_c:Variant,_a:Array) -> Variant:return null
static func f_probe(c:Variant,_a:Array) -> Variant:
	var state:Dictionary=R.statics.InitializerOrderState;var target:R.Value=state.receiver
	state.trace.append([target.fields.a,target.fields.b,target.fields.get("late"),state.late])
	c.fields.value=randf();state.late+=3
	if state.replace:target.fields=target.fields.duplicate()
	return null

func sequence_case(compiled:bool,replace:bool,random_seed:int) -> Dictionary:
	R.compiled_initializers_enabled=compiled
	var value:R.Value=R.Value.new();value.class_id="InitializerSequenceProbe"
	R.statics.InitializerOrderState={"receiver":value,"trace":[],"late":7,"replace":replace}
	seed(random_seed);R.apply_native_initializer(value,"InitializerSequenceProbe","init_fields")
	var next_random:float=randf()
	var trace:Array=R.statics.InitializerOrderState.trace
	if trace!=[[17,18,null,7],[31,-8,10,10]]:failures.append("constructor/literal/static order")
	if value.fields.a!=55 or value.fields.late!=13:failures.append("final literal/static values")
	return {"fields":value.fields,"trace":trace,"random":next_random}

func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var checked:int=0;var mixed:int=0
	for owner in R.native_initializers:
		if not R.classes.has(owner) or not R.native_initializers.get(owner,{}).has("init_fields"):continue
		var actual=R.Value.new();actual.class_id=owner
		var expected=R.Value.new();expected.class_id=owner
		var previous=R.Value.new();previous.class_id=owner
		R.compiled_initializers_enabled=false;seed(61047);R.apply_native_initializer(previous,owner,"init_fields");var previous_random:float=randf()
		R.compiled_initializers_enabled=true;seed(61047);R.apply_native_initializer(actual,owner,"init_fields");var actual_random:float=randf()
		seed(61047);R.source_method(expected,owner,"init_fields",[]);var expected_random:float=randf()
		if not equivalent(actual.fields,expected.fields) or not equivalent(actual.fields,previous.fields):failures.append(owner)
		if actual_random!=expected_random or actual_random!=previous_random:failures.append(owner+":random-consumption")
		if R.native_field_defaults.get(owner)!=null:pass
		elif not R.native_initializers[owner].init_fields.is_empty():mixed+=1
		checked+=1
		if checked%250==0:await process_frame
	R.classes.InitializerOrderProbe={"path":"res://tests/initializers_suite.gd","base":"Object","methods":{"init_fields":["f_noop",false],"init_statics":["f_noop",true],"InitializerOrderProbe":["f_probe",false]},"fields":{},"field_types":{},"imports":[],"passive":false}
	var construct:Dictionary={"@construct":{"@class_recipe":"InitializerOrderProbe"},"args":[]}
	var read_late:Dictionary={"@static_recipe":["InitializerOrderState","late"]}
	R.native_initializers.InitializerSequenceProbe={"init_fields":[["a",17],["b",18],["payload",{"mutable":[1,2]}],["first",construct],["a",30],["a",31],["b",-8],["late",read_late],["second",construct],["a",55],["late",read_late],["token",{"@class_recipe":"DTVector3D"}]]}
	var order_cases:int=0
	for replace in [false,true]:
		for random_seed in [12,47,910,1788]:
			var old:Dictionary=sequence_case(false,replace,random_seed);var optimized:Dictionary=sequence_case(true,replace,random_seed)
			if not equivalent(old,optimized):failures.append("mixed sequence replace="+str(replace)+" seed="+str(random_seed))
			var independent:Dictionary=sequence_case(true,replace,random_seed)
			optimized.fields.payload.mutable.append(19)
			if independent.fields.payload.mutable!=[1,2]:failures.append("cached literal data shared between instances")
			if optimized.fields.token!=R.klass("DTVector3D"):failures.append("class recipe identity")
			order_cases+=1
	R.compiled_initializers_enabled=true
	if not R.warnings.is_empty():failures.append("initializer dispatch warnings")
	print("TEST_INITIALIZERS_COMPLETE checked="+str(checked)+" mixed="+str(mixed)+" order_cases="+str(order_cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(1 if not failures.is_empty() or checked<2700 or mixed!=24 else 0)
