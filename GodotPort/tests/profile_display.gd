extends "res://runtime/display.gd"
static var child_times:Array[int]=[]
static var calls:int=0
static var root_us:int=0
static var roots:int=0
static var by_class:Dictionary={}
static var long_roots:Array=[]
static func reset_profile() -> void:
	calls=0;root_us=0;roots=0;by_class.clear();long_roots.clear()
func update_effects() -> void:
	var started:int=Time.get_ticks_usec();child_times.append(0)
	super.update_effects()
	var elapsed:int=Time.get_ticks_usec()-started;var children:int=child_times.pop_back()
	calls+=1
	var model:Variant=value;var key:String=model.class_id if model!=null else "null"
	if not by_class.has(key):by_class[key]=[0,0,0]
	by_class[key][0]+=1;by_class[key][1]+=elapsed-children;by_class[key][2]=maxi(by_class[key][2],elapsed-children)
	if child_times.is_empty():
		roots+=1;root_us+=elapsed
		if elapsed>=1000:long_roots.append({"class":key,"ms":elapsed/1000.0})
	else:child_times[-1]+=elapsed
static func report() -> Dictionary:
	return {"calls":calls,"roots":roots,"root_ms":root_us/1000.0,"by_class":by_class,"long_roots":long_roots}
