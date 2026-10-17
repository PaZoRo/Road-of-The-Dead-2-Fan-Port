extends SceneTree

func _initialize() -> void:
	var registry:Dictionary=JSON.parse_string(FileAccess.get_file_as_string("res://data/classes.json"))
	var failed:Array=[]
	var count:int=0
	for name in registry:
		var script:GDScript=load(registry[name].path)
		if script==null or not script.can_instantiate():failed.append(name)
		count+=1
	print("COMPILE_RESULT scripts="+str(count)+" failures="+str(failed.size()))
	if not failed.is_empty():print(failed)
	quit(0 if failed.is_empty() else 1)
