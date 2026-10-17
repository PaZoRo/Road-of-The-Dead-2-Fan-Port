extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var cases:int=0
static func f_set_index(c:Variant,a:Array) -> Variant:
	var trace:Array=c.fields.trace;trace.append(a[0]);c.fields={"m_iIndex":a[0],"m_Values":["replacement"],"trace":trace}
	return null
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func same(a:Variant,b:Variant) -> bool:
	if a is float and b is float and is_nan(a) and is_nan(b):return true
	if a is Dictionary and b is Dictionary:
		if a.size()!=b.size():return false
		for k in a:
			if not b.has(k) or not same(a[k],b[k]):return false
		return true
	if a is Array and b is Array:
		if a.size()!=b.size():return false
		for i in a.size():
			if not same(a[i],b[i]):return false
		return true
	return is_same(a,b) if a is Object or b is Object else a==b
func model(type:String,args:Array,enabled:bool) -> R.Value:
	R.native_collections_enabled=enabled;R.resolved_methods.erase(type)
	return R.construct(R.klass(type),args)
func compare(a:R.Value,b:R.Value,type:String,key:String,args:Array=[],rng:int=21) -> void:
	seed(rng);var actual:Variant=R.collection_script.call(R.COLLECTION_METHODS[type][key],a,args);var next:float=randf()
	seed(rng);var expected:Variant=R.source_method(b,type,key,args);var expected_next:float=randf()
	expect(same(actual,expected),type+" "+key+" result "+str(cases))
	expect(next==expected_next,type+" "+key+" random consumption "+str(cases))
	expect(same(a.fields,b.fields),type+" "+key+" state "+str(cases));cases+=1
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var token:R.Value=R.Value.new();token.fields.tag=1
	for type in ["RandomHat","SequentialArray"]:
		for args in [[],[true],[false],[0],[1],[NAN],[""],["false"],[null],[[]],[token],[false,17,token]]:
			seed(91);var a:R.Value=model(type,args,true);var next:float=randf()
			seed(91);var b:R.Value=model(type,args,false)
			expect(next==randf(),type+" constructor RNG")
			expect(same(a.fields,b.fields) and a.field_types==b.field_types and a.kind==b.kind and a.constructor_done==b.constructor_done,type+" constructor schema")
			expect(not is_same(a.fields.m_Values,b.fields.m_Values),type+" independent instance array");cases+=1
	for auto in [false,true]:
		for size in [0,1,2,17,64]:
			for rng in [0,1,21,943012,2147483647]:
				var a:R.Value=model("RandomHat",[auto],true);var b:R.Value=model("RandomHat",[auto],false)
				var values:Array=a.fields.m_Values;var hat:Array=a.fields.m_HatValues
				for i in size:compare(a,b,"RandomHat","AddValue",[[null,17,"repeat",token,[1,2]][i%5]],rng+i)
				compare(a,b,"RandomHat","AddValue",[],rng)
				compare(a,b,"RandomHat","Reset",[],rng)
				for i in size*3+10:
					compare(a,b,"RandomHat","GetRandomValue",[],rng+i)
					compare(a,b,"RandomHat","IsEmpty",[],rng+i)
				compare(a,b,"RandomHat","GetTotalNbValues",[],rng)
				compare(a,b,"RandomHat","Clear",[],rng)
				expect(is_same(values,a.fields.m_Values) and is_same(hat,a.fields.m_HatValues),"hat retains arrays")
	# Truly empty hats preserve the original RNG call even with no values to refill.
	for auto in [false,true]:
		var a:R.Value=model("RandomHat",[auto],true);var b:R.Value=model("RandomHat",[auto],false)
		for i in 16:compare(a,b,"RandomHat","GetRandomValue",[],i)
		for obj in [a,b]:obj.fields.m_HatValues=obj.fields.m_Values
		compare(a,b,"RandomHat","AddValue",[token]);compare(a,b,"RandomHat","GetRandomValue")
		compare(a,b,"RandomHat","Reset");compare(a,b,"RandomHat","Clear")
	for size in [0,1,2,17]:
		for index in [0,1,-1,2147483647,-2147483648,2147483648,"0","2",2.0,NAN,null,true]:
			var a:R.Value=model("SequentialArray",[],true);var b:R.Value=model("SequentialArray",[],false)
			for i in size:compare(a,b,"SequentialArray","AddValue",[[null,17,"repeat",token][i%4]])
			a.fields.m_iIndex=index;b.fields.m_iIndex=index
			for i in size*2+5:compare(a,b,"SequentialArray","GetValue")
			compare(a,b,"SequentialArray","GetNbValues")
	for type in ["RandomHat","SequentialArray"]:
		var a:R.Value=model(type,[],true);var b:R.Value=model(type,[],false)
		a.fields.m_Values=null;b.fields.m_Values=null
		var methods:Array=["AddValue","GetTotalNbValues","Clear","Reset","GetRandomValue"] if type=="RandomHat" else ["AddValue","GetNbValues","GetValue"]
		for key in methods:compare(a,b,type,key)
	R.classes.SequenceSetter={"path":"res://tests/collections_suite.gd","base":"SequentialArray","methods":{"set_m_iIndex":["f_set_index",false]},"fields":{},"field_types":{},"imports":[]}
	var a:R.Value=R.Value.new();var b:R.Value=R.Value.new()
	for obj in [a,b]:obj.class_id="SequenceSetter";obj.has_setters=true;obj.field_types={};obj.fields={"m_iIndex":0,"m_Values":[10,20],"trace":[]}
	compare(a,b,"SequentialArray","GetValue");expect(a.fields.trace==[1],"sequence setter call order")
	expect(R.warnings.is_empty(),"collection warnings")
	print("TEST_COLLECTIONS_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
