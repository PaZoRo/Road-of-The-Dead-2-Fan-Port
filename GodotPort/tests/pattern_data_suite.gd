extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func dispose(obj:R.Value) -> void:
	for child in obj.children.duplicate():dispose(child)
	obj.children.clear();obj.depths.clear();obj.fields.clear();obj.frame_scripts.clear()
	if is_instance_valid(obj.display):obj.display.queue_free()
func visual(obj:R.Value) -> Array:
	var result:Array=[obj.class_id,obj.symbol,obj.frame,obj.playing,obj.render_batch,obj.display.transform,obj.display.modulate,obj.display.visible,obj.display.own_bounds,obj.display.offset,obj.fields.get("@color_add",[])]
	result.append(obj.display.texture.get_meta("original_asset","") if obj.display.texture!=null else "")
	if obj.render_batch:result.append([obj.display.batch_commands.size(),obj.display.batch_bounds])
	for child in obj.children:result.append(visual(child))
	return result
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var names:Array=[]
	for name in R.classes:
		if name.begins_with("MC_LevelPattern_"):names.append(name)
	names.sort()
	var marker_cases:int=0;var geometry_cases:int=0;var normal_us:int=0;var data_us:int=0
	for sample in names.size():
		var name:String=names[sample];seed(61045+sample)
		var began:int=Time.get_ticks_usec();var original:R.Value=R.construct(R.klass(name),[])
		var original_count:int=int(R.get_value(original,"numChildren"));normal_us+=Time.get_ticks_usec()-began
		var after_original:float=randf();seed(61045+sample)
		began=Time.get_ticks_usec();var optimized:R.Value=R.construct_pattern(R.klass(name))
		var optimized_count:int=int(R.get_value(optimized,"numChildren"));data_us+=Time.get_ticks_usec()-began
		expect(randf()==after_original,"constructor random consumption "+name)
		expect(original_count==optimized_count,"ordered marker count "+name)
		for i in mini(original_count,optimized_count):
			var a:R.Value=original.children[i];var b:R.Value=optimized.children[i]
			expect(a.class_id==b.class_id and a.symbol==b.symbol,"marker identity "+name+":"+str(i))
			for key in ["x","y","scaleX","scaleY","rotation","alpha","visible","constructor"]:
				expect(R.equal(R.get_value(a,key),R.get_value(b,key)),"marker property "+name+":"+str(i)+":"+key)
			expect(a.fields.get("name")==b.fields.get("name") and a.fields.get("@color_add",[])==b.fields.get("@color_add",[]),"marker fields "+name+":"+str(i))
			for key in ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"]:
				var ca:Variant=R.get_value(R.get_value(a,"transform"),"colorTransform");var cb:Variant=R.get_value(R.get_value(b,"transform"),"colorTransform")
				expect(R.get_value(ca,key)==R.get_value(cb,key),"marker color data "+name+":"+str(i)+":"+key)
			marker_cases+=1
			if i==sample%maxi(original_count,1) and b.lazy_kind==4:
				for clip in [a,b]:R.set_value(clip,"x",R.num(R.get_value(clip,"x"))+0.125);R.set_value(clip,"alpha",0.625)
				var retained:R.Value=b
				match sample%4:
					0:expect(R.bounds(a)==R.bounds(b),"materialized bounds "+name)
					1:expect(R.get_value(a,"numChildren")==R.get_value(b,"numChildren"),"materialized children "+name)
					2:R.call_member(a,"stop",[]);R.call_member(b,"stop",[])
					3:
						R.add_child(R.stage,a);R.add_child(R.stage,b);R.remove_child(R.stage,a);R.remove_child(R.stage,b)
						R.add_child(original,a,i);R.add_child(optimized,b,i)
				expect(b==retained and b.lazy_kind==0,"materialization retains marker "+name)
				expect(visual(a)==visual(b),"materialized visual structure "+name);geometry_cases+=1
		dispose(original);dispose(optimized)
		if sample%10==0:await process_frame
	var deferred:int=R.deferred_pattern_markers;var materialized:int=R.materialized_pattern_markers
	expect(names.size()==378 and marker_cases>1000,"complete supplied pattern catalog")
	expect(deferred>1000 and materialized>100,"metadata and full-visual paths exercised")
	expect(R.pattern_data_depth==0 and R.warnings.is_empty(),"pattern context and dispatch warnings")
	print("TEST_PATTERN_DATA_COMPLETE patterns="+str(names.size())+" markers="+str(marker_cases)+" visual_cases="+str(geometry_cases)+" deferred="+str(deferred)+" materialized="+str(materialized)+" cold_original_ms="+str(normal_us/1000.0)+" data_ms="+str(data_us/1000.0)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
