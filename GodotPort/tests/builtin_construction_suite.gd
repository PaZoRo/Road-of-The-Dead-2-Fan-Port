extends "res://tests/sound_construction_suite.gd"

static func f_noop(_c:Variant,_a:Array) -> Variant:return null
static func f_field(c:Variant,_a:Array) -> Variant:c.fields.registered_field=randf();return null
static func f_event(c:Variant,a:Array) -> Variant:c.fields.registered_ctor=[a.duplicate(),randf()];return null

func signature(value:R.Value) -> Array:
	return [value.class_id,value.field_types,value.has_getters,value.has_setters,value.kind,value.constructor_done,value.initialized,value.on_stage,value.lazy_kind,value.native,value.frame_dirty,value.playing,value.timeline,value.children,value.frame_scripts,value.depths,value.frame,value.symbol,value.own_mouse_target,value.mouse_target_count,value.visual_deferred,value.render_batch,value.batch_disabled]

func compare(type:String,args:Array) -> void:
	var states:Array=[];var draws:Array=[];var tracked:Array=[]
	for native in [false,true]:
		R.native_values_enabled=native;seed(571)
		var before:int=R.values.size();var value:R.Value=R.construct(R.klass(type),args)
		tracked.append(R.values.size()-before);states.append(value);draws.append(randf())
	expect(same(states[0],states[1],{}) and signature(states[0])==signature(states[1]),type+" complete constructor state "+str(cases))
	expect(draws[0]==draws[1] and tracked[0]==tracked[1],type+" random/weak tracking "+str(cases))
	if type=="MovieClip":
		expect(states[0].display!=states[1].display and states[1].display.value==states[1],"independent owned Godot displays")
		for value in states:
			expect(value.display.get_script()==R.display_script and value.display.transform==Transform2D.IDENTITY and value.display.modulate==Color.WHITE and value.display.visible,"default Godot display state")
		states[0].fields.filters.append(1);expect(states[1].fields.filters.is_empty(),"independent mutable filters")
		states[0].fields.filters.clear()
	else:
		for key in ["type","bubbles","target","currentTarget"]:expect(typeof(states[0].fields[key])==typeof(states[1].fields[key]),"event raw argument type "+key)
	for value in states:
		R.set_value(value,"extra",47)
		if type=="MovieClip":
			R.set_value(value,"x",12.5);R.set_value(value,"scaleY",-0.5);R.call_member(value,"stop",[])
	expect(same(states[0],states[1],{}),type+" subsequent original methods "+str(cases))
	cases+=1

func fixture(name:String,base:String,ctor:bool) -> void:
	var methods:Dictionary={"init_fields":["f_field",false],"init_statics":["f_noop",true]}
	if ctor:methods[name]=["f_event",false]
	R.classes[name]={"path":"res://tests/builtin_construction_suite.gd","base":base,"methods":methods,"fields":{},"field_types":{},"imports":[]}

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var inputs:Array=[[],[null],[true,false],["enterFrame",true],[1,2,3],[NAN,INF],[[],{}],[R.klass("MovieClip"),R.Value.new()]]
	for i in 100:inputs.append([float(i)-3.5,i%3==0])
	for type in ["Event","MovieClip"]:
		for args in inputs:compare(type,args)
	# Registered classes and inherited field initializers retain their source path.
	fixture("Event","Object",true)
	for args in inputs.slice(0,8):compare("Event",args)
	for parent in ["EventDispatcher","DisplayObject","InteractiveObject","DisplayObjectContainer","Sprite","MovieClip"]:
		fixture(parent,R.base_of(parent),parent=="MovieClip")
		compare("MovieClip",[])
		R.classes.erase(parent)
	expect(R.warnings.is_empty(),"built-in construction warnings "+str(R.warnings))
	print("TEST_BUILTIN_CONSTRUCTION_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
