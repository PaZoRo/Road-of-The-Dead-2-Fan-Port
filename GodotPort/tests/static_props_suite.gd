extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
static func f_nav(_c:Variant,_a:Array) -> Variant:return null
static func f_unlock(c:Variant,a:Array) -> Variant:c.fields.trace.append(["guide",a[0]]);return null
static func f_sound(c:Variant,_a:Array) -> Variant:c.fields.trace.append("sound-query");return true
static func f_explode(c:Variant,_a:Array) -> Variant:c.fields.trace.append("explode");return null
static func f_attached(c:Variant,_a:Array) -> Variant:c.fields.trace.append("attached");return null
func fixture(type:String,state:int) -> Dictionary:
	var world:R.Value=R.Value.new();world.class_id="StaticWorldProbe"
	var camera:R.Value=R.Value.new();camera.class_id="RDCamera";camera.fields={"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,20]),"m_fMaxViewDistance":200.0}
	var game:R.Value=R.Value.new();game.class_id="StaticGameProbe"
	var mode:R.Value=R.Value.new();mode.fields.m_Camera=camera;game.fields.m_CurrentGameMode=mode
	world.fields={"m_Entities":[],"m_Game":game,"m_FirstEntity":null}
	var entity:R.Value=R.construct(R.klass("RDObstacle" if type!="StaticBaseProbe" else "RDEntity"),[])
	entity.class_id=type;entity.fields.m_World=world;entity.fields.m_vLocation.fields.Z=40.0
	var trace:Array=[];game.fields.trace=trace;entity.fields.trace=trace
	entity.fields.m_bEditorMode=state==1
	entity.fields.m_iSurvivalGuideItem=19 if state==2 else -1;entity.fields.m_bUnlockSurvivalGuide=true
	entity.fields.m_fSurvivalGuideDistance=50.0
	entity.fields.m_bCanBeDestroyed=state==3
	entity.fields.m_fExplosionDelay=0.1 if state==4 else 0.0
	if state==5:entity.fields.m_AttachedSounds=[R.Value.new()]
	entity.fields.m_MC=R.construct(R.klass("MovieClip"),[]);entity.fields.m_szFactoryName="Tree"
	var node:R.Value=R.Value.new();node.class_id="RDEntityNode";node.fields={"m_Entity":entity,"m_Previous":null,"m_Next":null}
	world.fields.m_Entities=[node];world.fields.m_FirstEntity=node
	return {"world":world,"camera":camera,"entity":entity,"trace":trace}
func snapshot(f:Dictionary) -> Array:
	return [f.trace.duplicate(),f.entity.fields.m_bUnlockSurvivalGuide,f.entity.fields.m_bDestroyMe,f.entity.fields.m_fExplosionDelay,f.world.fields.m_Entities.size()]
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("RDWorld")
	R.statics.RDWorld.m_bDestroyOutOfWorldEntities=false
	R.classes.StaticWorldProbe={"path":"res://tests/static_props_suite.gd","base":"RDWorld","methods":{"UpdateNavMesh":["f_nav",false]},"fields":{},"field_types":{},"imports":[]}
	R.classes.StaticGameProbe={"path":"res://tests/static_props_suite.gd","base":"Object","methods":{"UnlockSurvivalItem":["f_unlock",false]},"fields":{},"field_types":{},"imports":[]}
	for pair:Array in [["StaticBaseProbe","RDEntity"],["StaticObstacleProbe","RDObstacle"],["StaticMapleProbe","RDObstacleMapleTree"]]:
		R.classes[pair[0]]={"path":"res://tests/static_props_suite.gd","base":pair[1],"methods":{"HasSoundPlaying":["f_sound",false],"Explode":["f_explode",false],"UpdateAttachedSounds":["f_attached",false]},"fields":{},"field_types":{},"imports":[]}
	var cases:int=0
	for type:String in ["StaticBaseProbe","StaticObstacleProbe","StaticMapleProbe"]:
		for state:int in range(6):
			var original:Dictionary=fixture(type,state);var native:Dictionary=fixture(type,state)
			R.source_method(original.world,"RDWorld","Update",[0.5,original.camera]);R.fast_world_update(native.world,0.5,native.camera)
			if snapshot(original)!=snapshot(native):failures.append(type+":"+str(state));push_error("STATIC_PROP_MISMATCH "+str(snapshot(original))+" / "+str(snapshot(native)))
			# A previously inert entity must respond on the next tick to live state.
			if state==0:
				for f:Dictionary in [original,native]:f.entity.fields.m_iSurvivalGuideItem=21;f.entity.fields.m_AttachedSounds=[R.Value.new()]
				R.source_method(original.world,"RDWorld","Update",[0.5,original.camera]);R.fast_world_update(native.world,0.5,native.camera)
				if snapshot(original)!=snapshot(native):failures.append(type+":reactivation")
			cases+=1
	print("TEST_STATIC_PROPS_COMPLETE cases="+str(cases)+" failures="+str(failures)+" warnings="+str(R.warnings))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() and R.warnings.is_empty() else 1)
