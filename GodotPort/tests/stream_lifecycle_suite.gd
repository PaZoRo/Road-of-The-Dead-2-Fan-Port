extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var checks:int=0
var clock_script:Script
var stream_program:Script
var host:Node2D
static func f_Reset(c:Variant,_a:Array) -> Variant:c.fields.m_fNextPatternSpawnPosition=0.0;return null
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
 checks+=1
 if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func value(kind:String="Object") -> R.Value:
 var object:R.Value=R.Value.new();object.class_id=kind;R.values.append(weakref(object));return object
func fixture() -> Dictionary:
 var game:R.Value=value();var mode:R.Value=value("StreamModeProbe");var clip:R.Value=value()
 game.fields={"m_CurrentGameMode":mode,"m_iGameState":1,"m_bPaused":false};mode.fields={"m_Game":game,"m_fNextPatternSpawnPosition":37.0};clip.fields.m_Game=game;R.root=clip
 var clock:Node=clock_script.new();root.add_child(clock);stream_program.clock=clock;R.lifecycle_observer=clock.observe_lifecycle
 return {"game":game,"mode":mode,"clip":clip,"clock":clock,"context":clock.create_context(mode)}
func finish(f:Dictionary) -> void:
 f.clock.stop();R.lifecycle_observer=Callable();f.clock.free();f.game.fields.clear();f.mode.fields.clear();f.clip.fields.clear();R.root=null
func wait_budget(f:Dictionary,result:Dictionary) -> void:
 await f.clock.next_budget(f.context)
 result.committed=f.clock.valid_context(f.context);result.finished=true
func wait_load(f:Dictionary,result:Dictionary) -> void:
 var pattern:R.Value=value("RDLevelPatternCustomNew")
 result.space=await stream_program.load_section(pattern,[f.mode,4,0.7,200.0,0.8,1.3],f.context)
 result.untouched=pattern.fields.is_empty();result.finished=true
func run() -> void:
 host=Node2D.new();root.add_child(host);R.initialize(host)
 var paths:String=ProjectSettings.globalize_path("res://").path_join("..").simplify_path()
 clock_script=load("res://runtime/section_scheduler.gd");stream_program=load("res://runtime/native_streaming.gd")
 R.classes.StreamModeProbe={"path":"res://tests/stream_lifecycle_suite.gd","base":"RDGameModeStory","methods":{"Reset":["f_Reset",false]},"fields":{},"field_types":{},"imports":[]}
 var f:Dictionary=fixture();var result:Dictionary={"finished":false,"committed":false};wait_budget(f,result)
 expect(not result.finished,"budget waits for a light frame")
 f.clock.pump(true,0);expect(not result.finished,"physics frame does not resume construction")
 f.clock.pump(false,2000);expect(not result.finished,"animation frame does not resume construction")
 f.clock.pump(false,0);expect(result.finished and result.committed,"light frame resumes valid work");finish(f)
 f=fixture();result={"finished":false};wait_budget(f,result);f.clock.last_progress_us=Time.get_ticks_usec()-10000
 f.clock.pump(false,3000);expect(not result.finished,"fresh work still prefers idle frames")
 f.clock.last_progress_us=Time.get_ticks_usec()-16001
 f.clock.pump(false,3000);expect(result.finished and result.committed,"capped loop progresses when every light frame animates");finish(f)
 f=fixture();result={"finished":false};wait_budget(f,result);f.clock.last_progress_us=Time.get_ticks_usec()-30000
 f.clock.pump(true,3000);expect(not result.finished,"fresh work avoids stacking on physics")
 f.clock.last_progress_us=Time.get_ticks_usec()-50001
 f.clock.pump(true,3000);expect(result.finished and result.committed,"low frame-rate loop progresses when every frame runs physics");finish(f)
 f=fixture();result={"finished":false};wait_budget(f,result);f.game.fields.m_bPaused=true;f.clock.last_progress_us=Time.get_ticks_usec()-100001
 f.clock.pump(true,3000);expect(not result.finished,"progress fallback respects pause")
 f.game.fields.m_bPaused=false;f.clock.pump(true,3000);expect(result.finished and result.committed,"fallback continues retained work after resume");finish(f)
 f=fixture();result={"finished":false};wait_budget(f,result);f.game.fields.m_bPaused=true
 f.clock.pump(false,0);expect(not result.finished,"paused game retains valid suspended work")
 f.game.fields.m_bPaused=false;f.clock.pump(false,0);expect(result.finished and result.committed,"resume continues suspended work");finish(f)
 f=fixture();result={"finished":false};wait_budget(f,result);f.game.fields.m_iGameState=2
 f.clock.pump(false,0);expect(not result.finished,"cinematic retains valid suspended work")
 f.game.fields.m_iGameState=1;f.clock.pump(false,0);expect(result.finished and result.committed,"cinematic completion resumes valid work");finish(f)
 f=fixture();result={"finished":false};wait_load(f,result)
 f.game.fields.m_CurrentGameMode=null;f.game.fields.m_iGameState=0;f.clock.pump(false,0)
 expect(result.finished,"menu switch releases suspended load")
 if result.finished:expect(is_nan(result.space) and result.untouched,"cancelled menu load creates no pattern objects")
 finish(f)
 f=fixture();result={"finished":false};wait_load(f,result)
 R.run_method(f.mode,"StreamModeProbe","Reset",[])
 expect(not f.clock.valid_context(f.context),"same-mode reset advances lifecycle generation")
 f.clock.pump(false,0);expect(result.finished and is_nan(result.space) and result.untouched,"reset cancels before pattern construction");finish(f)
 f=fixture();result={"finished":false};wait_load(f,result)
 f.mode.fields.m_fNextPatternSpawnPosition=99.0;f.clock.pump(false,0)
 expect(result.finished and is_nan(result.space) and result.untouched,"changed pattern origin cancels pending load");finish(f)
 f=fixture();result={"finished":false};wait_load(f,result)
 var replacement:R.Value=value();var replacement_game:R.Value=value();replacement_game.fields={"m_iGameState":0,"m_bPaused":false};replacement.fields.m_Game=replacement_game;R.root=replacement
 f.clock.pump(false,0);expect(result.finished,"root replacement releases suspended load")
 if result.finished:expect(is_nan(result.space) and result.untouched,"root replacement creates no stale objects")
 replacement.fields.clear();replacement_game.fields.clear();finish(f)
 f=fixture();var waiting:Array=[]
 for i in 4:
  result={"finished":false};waiting.append(result);wait_budget(f,result)
 f.game.fields.m_bPaused=true;f.clock.stop()
 for item:Dictionary in waiting:expect(item.finished and not item.committed,"shutdown releases each suspended operation")
 finish(f)
 expect(R.warnings.is_empty(),"no runtime adapter warnings")
 print("TEST_STREAM_LIFECYCLE_COMPLETE checks="+str(checks)+" failures="+str(failures))
 R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
