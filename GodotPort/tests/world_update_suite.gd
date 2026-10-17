extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
static func f_nav(_c:Variant,_a:Array) -> Variant:return null
static func f_update(c:Variant,_a:Array) -> Variant:
 var world:R.Value=c.fields.world;var w:Dictionary=world.fields;w.trace.append("update:"+str(c.fields.id));w.random.append(randf())
 if c.fields.get("did_action",false):return null
 c.fields.did_action=true
 match c.fields.get("update_action",""):
  "camera":w.camera.fields.m_vLocation.fields.Z+=50.0
  "replace_camera":w.camera.fields=w.camera.fields.duplicate();w.camera.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[0,0,70.0])
  "entries":
   world.fields=w.duplicate();var entries:Array=w.m_Entities.duplicate();var swap:Variant=entries[1];entries[1]=entries[2];entries[2]=swap;world.fields.m_Entities=entries
  "disable":R.statics.RDWorld.m_bDestroyOutOfWorldEntities=false
  "class":(w.m_Entities[1].fields.m_Entity as R.Value).class_id="WorldCustomProbe"
  "base_class":(w.m_Entities[1].fields.m_Entity as R.Value).class_id="WorldBaseProbe"
 return null
static func f_out(c:Variant,_a:Array) -> Variant:
 var w:Dictionary=(c.fields.world as R.Value).fields;w.trace.append("out:"+str(c.fields.id))
 match c.fields.get("out_action",""):
  "camera":w.camera.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[0,0,70.0])
  "disable":R.statics.RDWorld.m_bDestroyOutOfWorldEntities=false
  "mark":c.fields.m_bDestroyMe=true
  "fields":c.fields=c.fields.duplicate();c.fields.m_MainMC=c.fields.alternate
 return c.fields.get("out_result",false)
static func f_destroy(c:Variant,_a:Array) -> Variant:
 var world:R.Value=c.fields.world;world.fields.trace.append("destroy:"+str(c.fields.id))
 match c.fields.get("destroy_action",""):
  "camera":world.fields.camera.fields.m_vLocation.fields.Z=90.0
  "disable":R.statics.RDWorld.m_bDestroyOutOfWorldEntities=false
  "fields":world.fields=world.fields.duplicate();world.fields.m_Entities=world.fields.m_Entities.duplicate()
 return null
static func f_return(c:Variant,a:Array) -> Variant:
 c.fields.trace.append("return");c.fields.returned.append(a[0])
 if c.fields.get("replace_return",false):c.fields=c.fields.duplicate();c.fields.m_Entities=c.fields.m_Entities.duplicate();c.fields.camera.fields.m_vLocation.fields.Z=100.0
 return null
func scalar(v:Variant) -> Variant:
 if v is float and not is_finite(v):return str(v)
 return v
func fixture(spec:Dictionary) -> Dictionary:
 var world:R.Value=R.Value.new();world.class_id="WorldLoopProbe"
 var camera:R.Value=R.Value.new();camera.class_id="RDCamera";camera.fields={"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,20.0]),"m_fMaxViewDistance":spec.get("view",100.0)}
 var container:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,container)
 world.fields={"m_Entities":[],"m_FirstEntity":null,"trace":[],"random":[],"returned":[],"camera":camera,"replace_return":spec.get("return",false)}
 var nodes:Array=[];var values:Array=[]
 for i in range(8):
  var entity:R.Value=R.Value.new();entity.class_id=["WorldBaseProbe","WorldObstacleProbe","WorldBuildingProbe"][i%3]
  if i==spec.get("custom",-1):entity.class_id="WorldCustomProbe"
  var main:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(container,main)
  var alternate:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(container,alternate)
  main.fields.id="main:"+str(i);alternate.fields.id="alternate:"+str(i)
  var z:float=spec.get("positions",[-20.0,-5.0,5.0,15.0,25.0,130.0,160.0,180.0])[i]
  entity.fields={"id":i,"world":world,"m_bDestroyMe":i==spec.get("destroy",-1),"m_bUpdateOutOfView":spec.get("always",false),"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,z]),"m_MainMC":main,"m_ContainerMC":container,"alternate":alternate,"out_result":i==spec.get("out_true",-1)}
  if i==spec.get("update_index",-1):entity.fields.update_action=spec.get("update_action","")
  if i==spec.get("custom",-1):entity.fields.out_action=spec.get("out_action","")
  if i==spec.get("destroy",-1):entity.fields.destroy_action=spec.get("destroy_action","")
  var node:R.Value=R.Value.new();node.class_id="RDEntityNode";node.fields={"m_Entity":entity,"m_Previous":nodes.back() if not nodes.is_empty() else null,"m_Next":null,"id":i}
  if not nodes.is_empty():nodes.back().fields.m_Next=node
  nodes.append(node);values.append(entity);world.fields.m_Entities.append(node)
 world.fields.m_FirstEntity=nodes[0]
 return {"world":world,"camera":camera,"container":container,"nodes":nodes,"values":values}
func snapshot(f:Dictionary) -> Dictionary:
 var w:Dictionary=f.world.fields;var entries:Array=[];var links:Array=[];var art:Array=[];var flags:Array=[]
 for node:R.Value in w.m_Entities:entries.append(node.fields.m_Entity.fields.id)
 for node:R.Value in f.nodes:links.append([node.fields.m_Entity.fields.id if node.fields.m_Entity!=null else null,node.fields.m_Previous.fields.id if node.fields.m_Previous!=null else null,node.fields.m_Next.fields.id if node.fields.m_Next!=null else null])
 for clip:R.Value in f.container.children:art.append(clip.fields.id)
 for entity:R.Value in f.values:flags.append([entity.fields.id,entity.fields.m_bDestroyMe,entity.fields.get("did_action",false)])
 return {"trace":w.trace.duplicate(),"random":w.random.duplicate(),"entries":entries,"links":links,"art":art,"flags":flags,"first":w.m_FirstEntity.fields.id if w.m_FirstEntity!=null else null,"camera_z":scalar(w.camera.fields.m_vLocation.fields.Z),"destroy_outside":R.statics.RDWorld.m_bDestroyOutOfWorldEntities,"returned":w.returned.size(),"next_random":randf()}
func scenario(spec:Dictionary,native:bool) -> Dictionary:
 var f:Dictionary=fixture(spec)
 R.statics.RDWorld.m_bDestroyOutOfWorldEntities=spec.get("outside",true)
 seed(9371)
 if native:R.fast_world_update(f.world,1.0/30.0,f.camera)
 else:R.source_method(f.world,"RDWorld","Update",[1.0/30.0,f.camera])
 var result:Dictionary=snapshot(f)
 R.remove_child(R.stage,f.container)
 for value:R.Value in f.values:value.fields.clear()
 for node:R.Value in f.nodes:node.fields.clear()
 f.world.fields.clear()
 return result
func run() -> void:
 var host:Node=Node2D.new();root.add_child(host);R.initialize(host);R.ensure_statics("RDWorld")
 R.classes.WorldLoopProbe={"path":"res://tests/world_update_suite.gd","base":"RDWorld","methods":{"UpdateNavMesh":["f_nav",false],"ReturnEntityNode":["f_return",false]},"fields":{},"field_types":{},"imports":[]}
 for pair in [["WorldBaseProbe","RDEntity"],["WorldObstacleProbe","RDObstacle"],["WorldBuildingProbe","RDBuildingNew"],["WorldCustomProbe","RDEntity"]]:
  var methods:Dictionary={"Update":["f_update",false],"Destroy":["f_destroy",false]}
  if pair[0]=="WorldCustomProbe":methods.IsOutOfLevel=["f_out",false]
  R.classes[pair[0]]={"path":"res://tests/world_update_suite.gd","base":pair[1],"methods":methods,"fields":{},"field_types":{},"imports":[]}
 var cache_cases:int=0;var changing:R.Value=R.Value.new()
 for type in ["WorldBaseProbe","WorldCustomProbe","WorldBaseProbe","WorldBuildingProbe","WorldCustomProbe"]:
  changing.class_id=type;var behavior:Dictionary=R.entity_behavior(changing)
  if [changing.behavior_update,changing.behavior_movement,changing.behavior_animation,changing.behavior_sounds,changing.behavior_render,changing.behavior_retirement]!=[behavior.Update,behavior.UpdateMovement,behavior.UpdateAnimation,behavior.UpdateAttachedSounds,behavior.Render,behavior.IsOutOfLevel]:failures.append("typed owner cache follows class")
  cache_cases+=1
 var outer:R.Value=R.construct(R.klass("MovieClip"),[]);var inner:R.Value=R.construct(R.klass("MovieClip"),[]);var leaf:R.Value=R.construct(R.klass("MovieClip"),[])
 R.add_child(R.stage,outer);R.add_child(outer,inner);R.add_child(inner,leaf)
 R.bind_projection_scope(outer,weakref(outer))
 if not outer.projection_root_is_self or inner.projection_root_is_self or leaf.projection_root_is_self:failures.append("outer projection ownership")
 R.bind_projection_scope(inner,weakref(inner))
 if not inner.projection_root_is_self or leaf.projection_root_is_self or leaf.projection_root_ref.get_ref()!=inner:failures.append("nested projection ownership")
 inner.projection_root_ref=null
 if inner.projection_root_is_self:failures.append("cleared projection ownership")
 R.remove_child(R.stage,outer);cache_cases+=3
 var specs:Array=[]
 for outside in [false,true]:
  for always in [false,true]:
   for view in [0.0,100.0,NAN,INF,-INF]:
    for positions in [[-20.0,-5.0,5.0,15.0,25.0,130.0,160.0,180.0],[-5.01,-5.0,9.99,10.0,15.0,15.01,NAN,INF]]:specs.append({"outside":outside,"always":always,"view":view,"positions":positions})
 for action in ["camera","replace_camera","entries","disable","class","base_class"]:
  for index in [0,2,4]:specs.append({"update_index":index,"update_action":action})
 for action in ["camera","disable","mark","fields"]:
  for result in [false,true]:specs.append({"custom":1,"out_action":action,"out_true":1 if result else -1})
 for action in ["camera","disable","fields"]:
  for index in [0,2,4]:specs.append({"destroy":index,"destroy_action":action})
 specs.append({"destroy":0,"return":true})
 for index in range(specs.size()):
  var expected:Dictionary=scenario(specs[index],false);var actual:Dictionary=scenario(specs[index],true)
  if expected!=actual:failures.append(index);push_error("WORLD_UPDATE_MISMATCH "+str(index)+" expected="+str(expected)+" actual="+str(actual))
 print("TEST_WORLD_UPDATE_COMPLETE cases="+str(specs.size())+" cache_cases="+str(cache_cases)+" failures="+str(failures)+" warnings="+str(R.warnings))
 var failed:bool=not failures.is_empty() or not R.warnings.is_empty();R.cleanup();host.queue_free();await process_frame;quit(1 if failed else 0)
