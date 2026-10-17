extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var cases:int=0
static func f_empty(_c:Variant,_a:Array) -> Variant:return null
static func f_fixture(c:Variant,_a:Array) -> Variant:
	var parent:R.Value=R.statics.SoundConstructionFixture.target
	var old:Dictionary=parent.fields
	parent.fields={"m_SoundClass":old.m_SoundClass,"trace":["sound constructor"],"marker":42}
	c.fields.fixture=true
	return null
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func same(a:Variant,b:Variant,seen:Dictionary={}) -> bool:
	if is_same(a,b):return true
	if a is float and b is float and is_nan(a) and is_nan(b):return true
	if a is R.Value and b is R.Value:
		if a.class_id!=b.class_id or a.kind!=b.kind or a.field_types!=b.field_types:return false
		var id:int=a.get_instance_id()
		if seen.has(id):return seen[id]==b.get_instance_id()
		seen[id]=b.get_instance_id()
		if (a.stream==null)!=(b.stream==null):return false
		if a.stream!=null and (a.stream.data_array!=b.stream.data_array or a.stream.big_endian!=b.stream.big_endian):return false
		return same(a.fields,b.fields,seen) and same(a.listeners,b.listeners,seen)
	if a is Dictionary and b is Dictionary:
		if a.size()!=b.size():return false
		for key in a:
			if not b.has(key) or not same(a[key],b[key],seen):return false
		return true
	if a is Array and b is Array:
		if a.size()!=b.size():return false
		for i in a.size():
			if not same(a[i],b[i],seen):return false
		return true
	return a==b
func enabled(value:bool) -> void:
	R.native_sound_construction_enabled=value
	R.resolved_methods.erase("DTSound");R.resolved_methods.erase("DTSpacialSound")
func compare(type:String,args:Array) -> void:
	R.ensure_statics("BasicObject");var counts:Dictionary=R.statics.BasicObject.GObjectClassCount.duplicate(true)
	enabled(true);seed(19);var a:R.Value=R.construct(R.klass(type),args);var next:float=randf()
	var after_counts:Dictionary=R.statics.BasicObject.GObjectClassCount.duplicate(true)
	R.statics.BasicObject.GObjectClassCount=counts
	enabled(false);seed(19);var b:R.Value=R.construct(R.klass(type),args)
	expect(after_counts==R.statics.BasicObject.GObjectClassCount,type+" superclass side effects "+str(cases))
	expect(next==randf(),type+" random consumption "+str(cases))
	expect(same(a,b,{}),type+" complete state "+str(cases));cases+=1
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var group:R.Value=R.construct(R.klass("DTSoundGroup"),[])
	for pitch in [false,true,null,0,1,"", "true",NAN]:
		for sound in [null,R.klass("Sound"),R.klass("SND_CochetaReload1")]:
			for sound_group in [null,group]:
				compare("DTSound",[sound,sound_group,pitch])
				for range_value in [0.0,1.0,-5.0,NAN,INF,-INF,null,"12",false]:
					compare("DTSpacialSound",[sound,range_value,20.0,5.0,30.0,sound_group,pitch])
	for type in ["DTSound","DTSpacialSound"]:
		for args in [[],[null],[null,1],[null,1,2],[null,1,2,3],[null,1,2,3,4],[null,1,2,3,4,group],[null,1,2,3,4,group,true,99]]:compare(type,args)
	# Nested user constructors may replace the parent's fields during construction.
	R.classes.SoundConstructionFixture={"path":"res://tests/sound_construction_suite.gd","base":"Sound","methods":{"SoundConstructionFixture":["f_fixture",false],"init_fields":["f_empty",false]},"fields":{},"field_types":{},"imports":[]}
	R.statics.SoundConstructionFixture={"target":null}
	for type in ["DTSound","DTSpacialSound"]:
		for pitch in [false,true]:
			var states:Array=[]
			var counts:Dictionary=R.statics.BasicObject.GObjectClassCount.duplicate(true)
			for native in [false,true]:
				R.statics.BasicObject.GObjectClassCount=counts.duplicate(true)
				enabled(native)
				var target:R.Value=R.construct(R.klass(type),[]);R.statics.SoundConstructionFixture.target=target
				var args:Array=[R.klass("SoundConstructionFixture"),group,pitch] if type=="DTSound" else [R.klass("SoundConstructionFixture"),1,2,3,4,group,pitch]
				if native:R.sound_construction_script.call(R.SOUND_CONSTRUCTORS[type],target,args)
				else:R.source_method(target,type,type,args)
				states.append(target)
			expect(same(states[0],states[1],{}),type+" replaced fields "+str(pitch));cases+=1
	expect(R.warnings.is_empty(),"sound construction warnings "+str(R.warnings))
	print("TEST_SOUND_CONSTRUCTION_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
