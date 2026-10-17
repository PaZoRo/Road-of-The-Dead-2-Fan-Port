extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func _initialize() -> void:call_deferred("run")
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	R.ensure_statics("RDWorld")
	var settings:Dictionary=R.statics.RDWorld
	var camera:R.Value=R.Value.new();camera.class_id="RDCamera"
	camera.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[])
	var cases:int=0
	for previous:int in [-3,0,1,10]:
		for position:float in [-25.0,0.0,0.01,settings.NavMeshStepSize,settings.NavMeshStepSize*9.999,settings.NavMeshStepSize*24,NAN]:
			camera.fields.m_vLocation.fields.Z=position
			var original:R.Value=R.Value.new();original.class_id="RDWorld"
			original.fields={"m_fCameraNavMeshPos":12.0,"m_iCurrentNavMeshStep":previous,"m_NavMesh":[]}
			for i:int in range(8):
				var row:Array=[]
				for j:int in range(int(settings.NavMeshNodes)+2):row.append((i+j)%3==0)
				original.fields.m_NavMesh.append(row)
			var native:R.Value=R.Value.new();native.class_id="RDWorld";native.fields=original.fields.duplicate(true)
			var identities:Array=native.fields.m_NavMesh.duplicate()
			R.source_method(original,"RDWorld","UpdateNavMesh",[camera])
			R.call_member(native,"UpdateNavMesh",[camera])
			expect(original.fields==native.fields,"full navmesh state pos="+str(position)+" previous="+str(previous))
			for row:Array in identities:
				var found:bool=false
				for current:Array in native.fields.m_NavMesh:
					if is_same(row,current):found=true
				expect(found,"navmesh row identity retained")
			cases+=1
	R.ensure_statics("RDGame")
	var saved:Variant=R.statics.RDGame.get("Instance")
	var game:R.Value=R.Value.new();var mode:R.Value=R.Value.new();var player:R.Value=R.Value.new()
	game.fields.m_CurrentGameMode=mode;mode.fields.m_Player=player
	var blood_cases:int=0
	for owner:String in ["RDDriverArmMale","RDDriverArmFemale"]:
		for level:float in [-8.0,0.0,16.5,33.0,33.001,50.0,66.0,66.001,99.0,120.0,NAN]:
			for state:int in range(4):
				R.statics.RDGame.Instance=game if state>0 else null
				game.fields.m_CurrentGameMode=mode if state>1 else null
				mode.fields.m_Player=player if state>2 else null
				player.fields.m_fMaleArmBloodLevel=level;player.fields.m_fFemaleArmBloodLevel=level
				var original:R.Value=R.Value.new();original.class_id=owner
				var native:R.Value=R.Value.new();native.class_id=owner
				for key:String in ["Blood1","Blood2","Blood3"]:
					original.fields[key]=R.construct(R.klass("MovieClip"),[]);native.fields[key]=R.construct(R.klass("MovieClip"),[])
					R.set_value(original.fields[key],"alpha",0.37);R.set_value(native.fields[key],"alpha",0.37)
				R.source_method(original,owner,"UpdateBlood",[]);R.call_member(native,"UpdateBlood",[])
				for key:String in ["Blood1","Blood2","Blood3"]:
					var a:float=R.get_value(original.fields[key],"alpha");var b:float=R.get_value(native.fields[key],"alpha")
					expect(is_equal_approx(a,b) or is_nan(a) and is_nan(b),"blood alpha "+owner+" state="+str(state)+" level="+str(level)+" child="+key)
				blood_cases+=1
	R.statics.RDGame.Instance=saved
	print("LEAF_HOTPATHS_RESULT ",JSON.stringify({"navmesh_cases":cases,"blood_cases":blood_cases,"failures":failures}))
	quit(0 if failures.is_empty() else 1)
