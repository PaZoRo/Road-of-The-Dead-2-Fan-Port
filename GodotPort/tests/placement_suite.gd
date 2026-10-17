extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func snapshot(obj:R.Value) -> Array:
	var children:Array=[]
	for child in obj.children:children.append(snapshot(child))
	var names:Dictionary={}
	for name in obj.fields:
		if obj.fields[name] is R.Value and obj.fields[name].parent_value()==obj:names[name]=obj.fields[name].symbol
	return [obj.class_id,obj.symbol,obj.frame,obj.playing,obj.display.transform,obj.display.modulate,obj.fields.get("name"),obj.fields.get("@clip_depth"),obj.fields.get("@color_add"),obj.display.own_bounds,names,children]

func retained(obj:R.Value) -> Dictionary:return obj.depths.duplicate()
func identity(obj:R.Value,old:Dictionary) -> Dictionary:
	var result:Dictionary={}
	for depth in old:result[depth]=is_same(old[depth],obj.depths.get(depth))
	return result

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.visual_batches_enabled=false
	var ids:Array=[]
	for name in ["RoadOfTheDead_fla.TutorialKey_197","RoadOfTheDead_fla.TutorialKeyRightAligned_198","RoadOfTheDead_fla.tutorialmouseicon_201"]:ids.append(R.assets.symbols[name])
	for id in R.assets.definitions:
		var definition:Dictionary=R.assets.definitions[id]
		if not definition.has("timeline") or ids.has(id):continue
		if R.symbol_classes.has(id) and not R.classes[R.symbol_classes[id]].get("passive",false) and not R.native_stop_clips.has(R.symbol_classes[id]):continue
		ids.append(id)
		if ids.size()>=100:break
	var cases:int=0
	for id in ids:
		R.compiled_placements_enabled=false;seed(92044);var original:R.Value=R.symbol_instance(id)
		R.compiled_placements_enabled=true;seed(92044);var optimized:R.Value=R.symbol_instance(id)
		var count:int=int(original.timeline.get("count",1))
		for frame in [1,mini(2,count),mini(3,count),maxi(1,count/2),count,1,count,maxi(1,count/3),1]:
			var previous_original:Dictionary=retained(original);var previous_optimized:Dictionary=retained(optimized)
			# Script edits must be overwritten by the same subsequent placements.
			for obj in [original,optimized]:
				for child in obj.children:child.display.position+=Vector2(2.5,-0.75);child.display.modulate.a=0.37
			var sounds:int=R.active_channels.size()
			R.compiled_placements_enabled=false;R.goto_frame(original,frame,true)
			var original_sounds:int=R.active_channels.size()-sounds;sounds=R.active_channels.size()
			R.compiled_placements_enabled=true;R.goto_frame(optimized,frame,true)
			expect(snapshot(original)==snapshot(optimized),"placement state "+id+" frame="+str(frame))
			expect(identity(original,previous_original)==identity(optimized,previous_optimized),"retained child identity "+id+" frame="+str(frame))
			expect(R.active_channels.size()-sounds==original_sounds,"frame sound count "+id+" frame="+str(frame));cases+=1
	R.compiled_placements_enabled=true
	print("TEST_PLACEMENT_COMPLETE symbols="+str(ids.size())+" cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
