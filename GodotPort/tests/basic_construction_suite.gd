extends "res://tests/sound_construction_suite.gd"
static func f_noop(_c:Variant,_a:Array) -> Variant:return null
static func f_name(c:Variant,_a:Array) -> Variant:
	c.fields.trace.append(["name",randf()]);return "custom"+str(c.fields.trace.size())
static func f_properties(c:Variant,_a:Array) -> Variant:
	var trace:Array=c.fields.get("trace",[]);trace.append(["properties",c.fields.m_szName,c.fields.m_properties.duplicate(),randf()])
	if c.fields.get("replace",false):c.fields={"trace":trace,"m_szName":c.fields.m_szName,"m_properties":c.fields.m_properties,"replaced":true}
	else:c.fields.trace=trace
	return null
static func f_super(c:Variant,_a:Array) -> Variant:c.fields.trace.append(["super",randf()]);return null
func _initialize() -> void:call_deferred("run")
func fixture(name:String,base:String,methods:Dictionary) -> void:
	methods.init_statics=["f_noop",true];methods.init_fields=["f_noop",false]
	R.classes[name]={"path":"res://tests/basic_construction_suite.gd","base":base,"methods":methods,"fields":{},"field_types":{},"imports":[]}
func compare_basic(type:String,initial:Variant,replace:bool,with_count:bool) -> void:
	var states:Array=[];var counts:Array=[];var draws:Array=[]
	for native in [false,true]:
		var c:R.Value=R.Value.new();c.class_id=type;c.fields={"trace":[],"replace":replace}
		R.statics.BasicObject.GObjectClassCount={}
		if with_count:R.statics.BasicObject.GObjectClassCount[R.string(c)]=initial
		seed(20261009)
		if native:R.basic_construction_script.basic_constructor(c,[])
		else:R.source_method(c,"BasicObject","BasicObject",[])
		states.append(c);counts.append(R.statics.BasicObject.GObjectClassCount.duplicate(true));draws.append(randf())
	expect(same(states[0],states[1],{}),type+" state "+str(cases))
	expect(same(counts[0],counts[1],{}),type+" name counter "+str(cases))
	expect(draws[0]==draws[1],type+" callback RNG "+str(cases));cases+=1
	if R.classes.has("EventDispatcher"):
		for state in states:
			expect(state.fields.trace[0][0]=="super" and state.fields.trace.filter(func(entry):return entry[0]=="super").size()==1,type+" registered super runs once before callbacks")
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("BasicObject")
	expect(R.base_of("BasicObject")=="EventDispatcher" and not R.classes.has("EventDispatcher"),"original base uses native constructor path")
	fixture("BasicFixture","BasicObject",{"RegisterProperties":["f_properties",false]})
	fixture("NamedBasicFixture","BasicObject",{"RegisterProperties":["f_properties",false],"toString":["f_name",false]})
	for type in ["BasicObject","DTSound","DTSpacialSound","BasicFixture","NamedBasicFixture"]:
		for initial in [null,0,1,-1,2147483647,2147483648,1.5,"5","",true,false,NAN,INF]:
			for with_count in [false,true]:
				for replace in [false,true]:compare_basic(type,initial,replace,with_count)
	# A registered super constructor must execute once before naming callbacks.
	fixture("EventDispatcher","Object",{"EventDispatcher":["f_super",false]})
	for type in ["BasicFixture","NamedBasicFixture"]:compare_basic(type,0,false,false)
	expect(R.warnings.is_empty(),"basic construction warnings "+str(R.warnings))
	print("TEST_BASIC_CONSTRUCTION_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
