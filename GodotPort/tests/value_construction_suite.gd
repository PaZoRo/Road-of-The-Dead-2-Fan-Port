extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")

func equal_fields(a:Dictionary,b:Dictionary) -> bool:
	if a.size()!=b.size() or a.keys()!=b.keys():return false
	for key in a:
		if typeof(a[key])!=typeof(b[key]):return false
		if a[key] is float and is_nan(a[key]) and is_nan(b[key]):continue
		if a[key]!=b[key]:return false
	return true

func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)

func state(value:R.Value) -> Array:
	return [value.class_id,value.field_types,value.has_getters,value.has_setters,value.kind,value.constructor_done,value.initialized,value.display,value.on_stage,value.lazy_kind,value.native,value.frame_dirty,value.playing]

func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var inputs:Array=[[],[1],[null],[true,false],["14.25","-9","invalid"],[NAN,INF,-INF],[-0.0,-2147483649.25,10000.123456789],[1,2,3,4,5,6,7]]
	seed(47)
	for i in 120:
		var args:Array=[]
		for j in i%7:args.append(randf_range(-100000.0,100000.0))
		inputs.append(args)
	var cases:int=0
	for name in ["DTVector3D","DTVector2D","Box","Point","Rectangle","SoundTransform","ColorTransform","Vector3D","Matrix","Matrix3D"]:
		for args in inputs:
			R.native_values_enabled=false;seed(5547)
			var expected:R.Value=R.construct(R.klass(name),args);var expected_random:float=randf()
			R.native_values_enabled=true;seed(5547)
			var actual:R.Value=R.construct(R.klass(name),args);var actual_random:float=randf()
			expect(equal_fields(actual.fields,expected.fields) and state(actual)==state(expected),name+" constructor data/schema/defaults case="+str(cases))
			expect(actual_random==expected_random,name+" constructor random consumption")
			expect(R.instance_of(actual,R.klass(name)) and R.instance_of(actual,R.klass("Object")),name+" inheritance")
			expect(R.get_value(actual,"constructor")==R.get_value(expected,"constructor"),name+" constructor identity")
			for value in [expected,actual]:R.set_value(value,"X","23.5");R.set_value(value,"extra",47)
			expect(equal_fields(actual.fields,expected.fields),name+" typed/scripted property writes")
			if name in ["DTVector3D","DTVector2D","Box"]:expect(actual.fields.X==23.5,name+" numeric field coercion")
			if name=="Box":
				for value in [expected,actual]:R.call_member(value,"Set",[1.0,-2.0,3.0,4.0,5.0,6.0])
			elif name=="DTVector3D":
				for value in [expected,actual]:R.call_member(value,"SetZero",[])
			elif name=="DTVector2D":
				for value in [expected,actual]:R.call_member(value,"Invert",[])
			expect(equal_fields(actual.fields,expected.fields),name+" original methods remain valid")
			cases+=1
		expect(R.statics[name].is_empty() or R.statics[name].has("Zero"),name+" static initialization")
		await process_frame
	expect(R.statics.DTVector3D.Zero.fields=={"X":0.0,"Y":0.0,"Z":0.0} and R.statics.DTVector3D.Up.fields=={"X":0.0,"Y":1.0,"Z":0.0},"recursive vector statics")
	expect(R.statics.DTVector2D.Zero.fields=={"X":0.0,"Y":0.0},"recursive 2D vector static")
	expect(R.warnings.is_empty(),"value construction dispatch warnings")
	print("TEST_VALUE_CONSTRUCTION_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)


