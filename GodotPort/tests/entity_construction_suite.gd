extends "res://tests/sound_construction_suite.gd"

static func f_noop(_c:Variant,_a:Array) -> Variant:return null
static func f_construct(c:Variant,a:Array) -> Variant:return R.invoke(R.super_ref(c,c.class_id),a)
static func f_init_mcs(c:Variant,a:Array) -> Variant:
	var trace:Array=c.fields.get("trace",[])
	trace.append(["InitMCs",a[0],c.fields.m_iEntityIndex,c.fields.get("m_fScale"),randf()])
	c.fields=c.fields.duplicate();c.fields.trace=trace;c.fields.replaced=true
	c.fields.m_MC=R.construct(R.klass("MovieClip"),[])
	return null
static func f_zero(c:Variant,_a:Array) -> Variant:
	var target:R.Value=R.statics.EntityResetProbe.target
	target.fields.trace.append([c.fields.label,target.fields.get("m_Properties"),target.fields.get("m_bDestroyMe"),randf()])
	target.fields=target.fields.duplicate();target.fields.replaced=true;c.fields.X=0.0
	if c.fields.label=="location":target.fields.m_vVelocity=target.fields.alternate_velocity
	return null

func enabled(value:bool) -> void:
	R.native_entity_construction_enabled=value
	for name in R.ENTITY_CONSTRUCTION_METHODS:R.resolved_methods.erase(name)

func tree(clip:R.Value) -> Array:
	var children:Array=[]
	for child in clip.children:children.append(tree(child))
	return [clip.class_id,clip.symbol,clip.kind,clip.frame,clip.playing,clip.applied_frame,clip.display.transform,clip.display.modulate,clip.display.visible,clip.fields.get("mouseEnabled"),clip.fields.get("mouseChildren"),clip.fields.get("enabled"),clip.fields.get("m_owner")!=null,children]

func counters() -> Array:
	return [R.statics.BasicObject.GObjectClassCount.duplicate(true),R.statics.RDEntity.GEntityIndex]

func reset_counters(initial:Variant) -> void:
	R.statics.BasicObject.GObjectClassCount={};R.statics.RDEntity.GEntityIndex=initial
	R.statics.RDGame.m_MovieClipsHash={}

func compare_constructor(type:String,args:Array,initial:Variant=17) -> void:
	var states:Array=[];var counts:Array=[];var draws:Array=[];var trees:Array=[]
	for native in [false,true]:
		enabled(native);reset_counters(initial);seed(901)
		var value:R.Value=R.construct(R.klass(type),args)
		states.append(value);counts.append(counters());draws.append(randf())
		trees.append(tree(value.fields.m_MainMC) if value.fields.get("m_MainMC")!=null else [])
	expect(same(states[0],states[1],{}),"constructor complete fields "+type+" "+str(cases))
	expect(same(counts[0],counts[1],{}),"constructor counters "+type+" "+str(cases))
	expect(draws[0]==draws[1] and trees[0]==trees[1],"constructor RNG/artwork "+type+" "+str(cases))
	for value in states:
		if type.begins_with("EntityCtorProbe"):expect(value.fields.replaced and value.fields.trace.size()==1,"InitMCs replacement callback runs once")
	cases+=1

func probe_vector(label:String) -> R.Value:
	var value:R.Value=R.Value.new();value.class_id="EntityResetProbe";value.fields={"label":label,"X":9.0}
	return value

func compare_reset(type:String,custom:Variant,initial:Variant,callbacks:bool) -> void:
	var states:Array=[];var counts:Array=[];var draws:Array=[]
	for native in [false,true]:
		enabled(native);reset_counters(21)
		var value:R.Value=R.construct(R.klass(type),[])
		value.fields.merge({"trace":[],"m_ConstructorMCClass":R.klass("MovieClip") if type.begins_with("EntityCtorProbe") else null,"m_bHasCustomDepthPosition":custom,"m_fDepthPosition":123.5,"m_bDestroyMe":true,"m_bFlippedX":true,"m_bLocationUsed":true,"m_bEditorMode":true,"m_Properties":[1],"m_PropertiesHash":{"a":2},"m_fHP":9.0,"m_bHit":true,"m_bCanBeDestroyed":true,"m_iVoicePriority":22},true)
		if callbacks:
			value.fields.m_vLocation=probe_vector("location");value.fields.m_vVelocity=probe_vector("old velocity");value.fields.alternate_velocity=probe_vector("replacement velocity");value.fields.m_vMoveDir=probe_vector("direction")
			R.statics.EntityResetProbe.target=value
		else:
			for key in ["m_vLocation","m_vVelocity","m_vMoveDir"]:
				if value.fields.get(key)==null:value.fields[key]=R.construct(R.klass("DTVector3D"),[])
				value.fields[key].fields.merge({"X":2.0,"Y":-3.0,"Z":5.0},true)
		reset_counters(initial);seed(1901)
		var owner:String=R.method_owner(type,"SetInitialState")
		R.run_method(value,owner,"SetInitialState",[])
		states.append(value);counts.append(counters());draws.append(randf())
	expect(same(states[0],states[1],{}),"reset complete fields "+type+" "+str(cases))
	expect(same(counts[0],counts[1],{}) and draws[0]==draws[1],"reset counters/RNG "+type+" "+str(cases))
	if callbacks:
		for value in states:
			var trace:Array=value.fields.trace
			expect(trace[-3][0]=="location" and trace[-2][0]=="replacement velocity" and trace[-1][0]=="direction","reset rereads fields after callbacks")
	cases+=1

func fixture(name:String,base:String,methods:Dictionary) -> void:
	methods.init_statics=["f_noop",true];methods.init_fields=["f_noop",false]
	methods[name]=["f_construct",false]
	R.classes[name]={"path":"res://tests/entity_construction_suite.gd","base":base,"methods":methods,"fields":{},"field_types":{},"imports":[]}

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	for name in ["BasicObject","RDEntity","RDGame"]:R.ensure_statics(name)
	fixture("EntityCtorProbe","RDEntity",{"InitMCs":["f_init_mcs",false]})
	fixture("EntityCtorProbeObstacle","RDObstacle",{"InitMCs":["f_init_mcs",false]})
	fixture("EntityCtorProbeVoice","RDEntityWithVoice",{"InitMCs":["f_init_mcs",false]})
	fixture("EntityResetProbe","Object",{"SetZero":["f_zero",false]})
	R.statics.EntityResetProbe={"target":null}
	for type in ["RDEntity","RDObstacle","RDEntityWithVoice","EntityCtorProbe","EntityCtorProbeObstacle","EntityCtorProbeVoice"]:
		for scale in [null,false,true,0,1,2.5,-4,NAN,INF,-INF,"5",""]:
			for clip in [null,R.klass("MovieClip"),R.klass("MC_Bush1")]:
				if type.begins_with("EntityCtorProbe") and clip==null:continue
				compare_constructor(type,[clip,scale])
		for args in [[],[null],[null,1,99]]:
			if not type.begins_with("EntityCtorProbe"):compare_constructor(type,args)
		for custom in [false,true,null,0,1,""]:
			for initial in [0,2147483647,2147483648,-1,"5",NAN,INF]:
				for callbacks in [false,true]:compare_reset(type,custom,initial,callbacks)
		await process_frame
	for initial in [2147483647,2147483648,-1,"5",NAN,INF]:compare_constructor("RDEntity",[],initial)
	expect(R.warnings.is_empty(),"entity construction warnings "+str(R.warnings))
	print("TEST_ENTITY_CONSTRUCTION_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
