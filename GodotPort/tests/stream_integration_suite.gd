extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var checks:int=0
var failures:Array=[]
var scene:Node
var clock:Node
var program:Script
var game:R.Value
var mode:R.Value
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
 checks+=1
 if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func load_pattern(pattern:R.Value,context:Dictionary,result:Dictionary) -> void:
 result.space=await program.load_section(pattern,[mode,4,0.7,200.0,0.8,1.3],context)
 result.done=true
func new_pattern() -> R.Value:return R.construct(R.klass("RDLevelPatternCustomNew"),[R.klass("MC_LevelPattern_LG_ResidentialChurch3")])
func run() -> void:
 seed(943012)
 scene=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
 var path:String=ProjectSettings.globalize_path("res://").path_join("..").simplify_path()
 clock=load("res://runtime/section_scheduler.gd").new();root.add_child(clock);clock.budget_us=100
 program=load("res://runtime/native_streaming.gd");program.clock=clock;R.lifecycle_observer=clock.observe_lifecycle
 game=R.root.fields.m_Game
 R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts()
 mode=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode;mode.fields.m_bDoStartGameMode=true;game.fields.m_bDoStartGameMode=true
 R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
 R.call_member(mode.fields.m_Player,"PauseVoice",[true])
 var pattern:R.Value=new_pattern();var result:Dictionary={"done":false};var context:Dictionary=clock.create_context(mode)
 load_pattern(pattern,context,result);clock.pump(false,0)
 expect(not result.done and pattern.fields.m_MC!=null,"real pattern construction suspends before completing all spawns")
 var before:int=game.fields.m_World.fields.m_Entities.size()
 game.fields.m_bPaused=true
 for i in 5:clock.pump(false,0)
 expect(not result.done and game.fields.m_World.fields.m_Entities.size()==before,"pause retains partial pattern without adding entities")
 game.fields.m_bPaused=false
 var batches:int=0
 while not result.done and batches<500:
  clock.pump(false,0);batches+=1;await process_frame
 expect(result.done and is_finite(result.space) and result.space>0,"resume completes real partial pattern")
 expect(clock.waiting.is_empty(),"completed pattern releases its waiting ticket")
 pattern=new_pattern();result={"done":false};context=clock.create_context(mode);load_pattern(pattern,context,result);clock.pump(false,0)
 expect(not result.done and pattern.fields.m_MC!=null,"second real pattern suspends after construction")
 R.call_member(mode,"Reset",[])
 var reset_count:int=game.fields.m_World.fields.m_Entities.size();var reset_origin:float=mode.fields.m_fNextPatternSpawnPosition
 clock.pump(false,0)
 expect(result.done and is_nan(result.space),"actual mode Reset cancels partially constructed section")
 expect(game.fields.m_World.fields.m_Entities.size()==reset_count and mode.fields.m_fNextPatternSpawnPosition==reset_origin,"cancelled section cannot append stale entities or advance reset origin")
 expect(clock.waiting.is_empty(),"reset releases partial section ticket")
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 var canonical:Script=R.hotpath_script;R.hotpath_script=program
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 var id:int=mode.get_instance_id()
 expect(program.active.has(id),"complete original Story update suspends for its real section result")
 for i in 5:program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 expect(absf(float(program.pending.get(id,0))-5.0/30)<0.000001,"suspended Story accumulates each skipped simulation delta")
 R.call_member(mode,"Reset",[]);clock.pump(false,0)
 expect(program.active.is_empty() and program.pending.is_empty() and clock.waiting.is_empty(),"reset clears Story continuation and its accumulated delta")
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30]);expect(program.active.has(id),"same Story mode starts a fresh section after cancellation")
 var origin:float=mode.fields.m_fNextPatternSpawnPosition
 batches=0
 while program.active.has(id) and batches<1000:
  clock.pump(false,0);batches+=1;await process_frame
 expect(not program.active.has(id) and mode.fields.m_fNextPatternSpawnPosition>origin,"fresh Story continuation uses actual completed section length")
 expect(clock.waiting.is_empty(),"fresh Story continuation leaves no waiting tickets")
 mode.fields.m_bRadioRepair=true;mode.fields.m_fRadioRepairTime=10.0;mode.fields.m_Player.fields.m_iCurrentTask=R.statics.RDPlayer.Task_None
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 for i in 5:program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 expect(mode.fields.m_fRadioRepairTime==10.0,"post-load source timer waits for its original continuation")
 batches=0
 while program.active.has(id) and batches<1000:
  clock.pump(false,0);batches+=1;await process_frame
 expect(absf(mode.fields.m_fRadioRepairTime-(10.0-1.0/30))<0.000001,"completed original continuation applies its initial delta exactly once")
 mode.fields.m_fNextPatternSpawnPosition=INF;program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 expect(absf(mode.fields.m_fRadioRepairTime-(10.0-7.0/30))<0.000001 and program.pending.is_empty(),"next complete source update consumes every queued delta exactly once")
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30]);program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 batches=0
 while program.active.has(id) and batches<1000:
  clock.pump(false,0);batches+=1;await process_frame
 expect(not program.active.has(id) and not program.pending.is_empty(),"completed work retains only time waiting for the next original update")
 R.call_member(mode,"Reset",[])
 expect(program.pending.is_empty(),"reset discards old queued time even after its continuation finished")
 mode.fields.m_fNextPatternSpawnPosition=INF;mode.fields.m_bRadioRepair=true;mode.fields.m_fRadioRepairTime=10.0;mode.fields.m_Player.fields.m_iCurrentTask=R.statics.RDPlayer.Task_None
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 expect(absf(mode.fields.m_fRadioRepairTime-(10.0-1.0/30))<0.000001,"new session receives only its own timer delta")
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30]);program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 var old:Dictionary=program.active[id];var cancelled:int=program.cancelled
 R.call_member(mode,"Reset",[]);mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30]);program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 expect(program.active.has(id) and program.active[id]!=old,"restart can replace an invalid continuation before its cancellation pump")
 clock.pump(false,0)
 expect(program.cancelled==cancelled+1 and program.active.has(id) and absf(float(program.pending.get(id,0))-1.0/30)<0.000001,"old cancellation cannot erase the new Story work or queued delta")
 clock.stop()
 expect(program.active.is_empty() and program.pending.is_empty() and clock.waiting.is_empty(),"shutdown clears real Story work and queued time")
 clock.queue_free();clock=load("res://runtime/section_scheduler.gd").new();root.add_child(clock);clock.budget_us=100
 program.clock=clock;R.lifecycle_observer=clock.observe_lifecycle
 mode.fields.m_fNextPatternSpawnPosition=mode.fields.m_Camera.fields.m_vLocation.fields.Z
 program.RDGameModeStory_UpdateGameplay(mode,[1.0/30]);program.RDGameModeStory_UpdateGameplay(mode,[1.0/30])
 batches=0
 while program.active.has(id) and batches<1000:
  clock.pump(false,0);batches+=1;await process_frame
 expect(not program.active.has(id) and not program.pending.is_empty(),"completed Story can leave queued time before the next world tick")
 clock.stop()
 expect(program.active.is_empty() and program.pending.is_empty() and clock.waiting.is_empty(),"shutdown clears queued time even without an active continuation")
 expect(R.warnings.is_empty(),"no runtime adapter warnings")
 print("TEST_STREAM_INTEGRATION_COMPLETE checks="+str(checks)+" batches="+str(batches)+" failures="+str(failures))
 R.hotpath_script=canonical;R.lifecycle_observer=Callable();clock.queue_free();scene.queue_free();await process_frame
 quit(0 if failures.is_empty() else 1)
