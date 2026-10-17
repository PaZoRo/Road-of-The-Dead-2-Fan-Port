extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")

func flatten(obj:Variant,matrix:Transform2D,color:Color,result:Array) -> void:
	if obj.render_batch:R.materialize_batch(obj)
	if obj.display.texture!=null:result.append([matrix,obj.display.texture,obj.display.offset,color])
	for child in obj.children:flatten(child,matrix*child.display.transform,color*child.display.modulate,result)

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var checked:int=0;var frames_checked:int=0
	for id in R.assets.definitions:
		if not R.assets.definitions[id].has("timeline"):continue
		var obj=R.symbol_instance(id)
		if not obj.render_batch:continue
		checked+=1
		for frame in [1,maxi(1,int(obj.timeline.get("count",1))/2),int(obj.timeline.get("count",1))]:
			R.goto_frame(obj,frame,true)
			var actual:Array=obj.display.batch_commands.duplicate()
			R.materialize_batch(obj)
			var expected:Array=[];flatten(obj,Transform2D.IDENTITY,Color.WHITE,expected)
			if actual.size()!=expected.size():failures.append(id+":"+str(frame)+":count")
			else:
				for i in actual.size():
					if not actual[i][0].is_equal_approx(expected[i][0]) or actual[i][1]!=expected[i][1] or actual[i][2]!=expected[i][2] or not actual[i][3].is_equal_approx(expected[i][3]):failures.append(id+":"+str(frame)+":"+str(i));break
			obj.batch_disabled=false;obj.frame_scripts.clear();obj.render_batch=true;R.apply_batch_frame(obj,frame);frames_checked+=1
		if checked>=75:break
	var transient=R.symbol_instance("8580")
	R.add_child(R.stage,transient)
	if not transient.render_batch or not transient.timeline.get("@batch_ephemeral",false):failures.append("transient child batch enabled")
	for cycle in range(4):
		R.advance_clip(transient)
		var actual:Array=transient.display.batch_commands.duplicate();R.materialize_batch(transient)
		var expected:Array=[];flatten(transient,Transform2D.IDENTITY,Color.WHITE,expected)
		var same:bool=actual.size()==expected.size()
		if same:
			for i in actual.size():
				if not actual[i][0].is_equal_approx(expected[i][0]) or actual[i][1]!=expected[i][1] or actual[i][2]!=expected[i][2] or not actual[i][3].is_equal_approx(expected[i][3]):same=false;break
		if not same:
			print("TRANSIENT_MISMATCH cycle="+str(cycle)+" actual="+str(actual)+" expected="+str(expected))
			failures.append("transient child frame "+str(cycle))
		transient.batch_disabled=false;transient.render_batch=true;R.apply_batch_frame(transient,transient.frame)
	R.goto_frame(transient,2,false)
	if transient.render_batch:failures.append("stopped parent materializes independently animated child")
	var nested=transient.depths[2];R.advance_clip(nested)
	if nested.frame!=2:failures.append("stopped parent child continues playback")
	print("TEST_BATCH_COMPLETE symbols="+str(checked)+" frames="+str(frames_checked)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(1 if not failures.is_empty() or checked<75 else 0)
