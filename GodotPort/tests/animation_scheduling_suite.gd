extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var cases:int=0

class Harness:
	extends "res://runtime/main.gd"
	var trace:Array=[]
	func _ready() -> void:set_process(false);set_physics_process(false)
	func update_hover() -> void:trace.append("hover")
	func update_cinematic_audio() -> void:trace.append("cinematic")
	func _exit_tree() -> void:pass

func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)

func value(kind:String="Object") -> R.Value:
	var result:R.Value=R.Value.new();result.class_id=kind;R.values.append(weakref(result));return result

func fixture() -> Dictionary:
	var scene:Harness=Harness.new();root.add_child(scene);R.initialize(scene);R.elapsed=0;scene.boot_ready=true
	var game:R.Value=value();var mode:R.Value=value("RDGameModeStory")
	game.fields={"m_iGameState":1,"m_bPaused":false,"m_CurrentGameMode":mode,"ticks":0,"late_ready":false,"key":false}
	var clip:R.Value=R.construct(R.klass("MovieClip"),[])
	clip.timeline={"count":3,"frames":[[],[],[]]};clip.frame_scripts={1:func():scene.trace.append("frame1"),2:func():scene.trace.append("frame2"),3:func():scene.trace.append("frame3")}
	clip.frame_dirty=true;R.frame_queue.append(weakref(clip))
	R.root=clip;clip.fields.m_Game=game;R.add_child(R.stage,clip)
	R.event_call(clip,"addEventListener",["enterFrame",func(_event):
		game.fields.ticks+=1;scene.trace.append("game:"+str(clip.frame)+":"+str(game.fields.key))])
	R.event_call(R.stage,"addEventListener",["enterFrame",func(_event):scene.trace.append("stage")])
	R.event_call(R.stage,"addEventListener",["keyDown",func(_event):game.fields.key=true;scene.trace.append("key")])
	var target:R.Value=value();target.fields.amount=0.0
	R.tween_api("to",[target,2.0/30,{"amount":2.0,"onStart":func():scene.trace.append("tween_start"),"onUpdate":func():scene.trace.append("tween_update"),"onComplete":func():scene.trace.append("tween_done")}])
	var owner:R.Value=value();owner.fields.m_GetPitchCallback=func():scene.trace.append("audio");return 1.25
	var channel:R.Value=value();channel.audio=AudioStreamPlayer.new();scene.add_child(channel.audio)
	channel.fields={"@pitch_owner":owner,"soundTransform":R.construct(R.klass("SoundTransform"),[0.5,0.0])};R.active_channels.append(weakref(channel))
	return {"scene":scene,"game":game,"clip":clip,"target":target,"channel":channel}

func snapshot(f:Dictionary) -> Dictionary:
	var scene:Harness=f.scene
	return {"trace":scene.trace.duplicate(),"elapsed":R.elapsed,"timeline_accumulator":scene.timeline_accumulator,"frame":f.clip.frame,"applied":f.clip.applied_frame,"ticks":f.game.fields.ticks,"amount":f.target.fields.amount,"pitch":f.channel.audio.pitch_scale,"volume":f.channel.audio.volume_db,"queued":R.frame_queue.size(),"prepared":scene.animation_prepared}

func finish_fixture(f:Dictionary) -> void:
	R.cleanup();f.scene.free()

func sequence(phased:bool,mode:int) -> Dictionary:
	var f:Dictionary=fixture();var scene:Harness=f.scene;scene.phased_animation=phased
	for i in 12:
		if mode==1 and i==4:R.goto_frame(f.clip,3,false)
		if mode==1 and i==6:R.goto_frame(f.clip,1,true)
		if mode==2 and i==3:
			R.tween_api("delayedCall",[1.0/30,func():
				var child:R.Value=R.construct(R.klass("MovieClip"),[]);child.timeline={"count":2,"frames":[[],[]]}
				child.frame_scripts={1:func():scene.trace.append("child1"),2:func():scene.trace.append("child2")}
				R.add_child(f.clip,child);R.frame_queue.append(weakref(child))])
		if mode==3 and i in [2,5,9]:
			var event:InputEventKey=InputEventKey.new();event.keycode=KEY_W;event.pressed=true;scene._input(event)
		if phased:
			expect(not scene.prepare_animation_between_steps(0.25),"early frame does not advance")
			if mode!=4 or i%3!=0:
				expect(scene.prepare_animation_between_steps(0.5),"halfway preparation")
				expect(not scene.prepare_animation_between_steps(0.9),"preparation not repeated")
		scene._physics_process(1.0/30)
		if mode==5:scene._physics_process(1.0/30)
	var result:Dictionary=snapshot(f);finish_fixture(f);return result

func run() -> void:
	for mode in 6:
		var inline_result:Dictionary=sequence(false,mode);var phased_result:Dictionary=sequence(true,mode)
		expect(inline_result==phased_result,"complete tick order/state/reference parity mode="+str(mode));cases+=1
	var f:Dictionary=fixture();var scene:Harness=f.scene;var game:R.Value=f.game
	for fraction in [-INF,NAN,-1.0,0.0,0.49,1.0,INF]:
		expect(not scene.prepare_animation_between_steps(fraction),"invalid/early fraction "+str(fraction));cases+=1
	scene.phased_animation=false;expect(not scene.prepare_animation_between_steps(0.5),"explicit inline option");scene.phased_animation=true;cases+=1
	scene.boot_ready=false;expect(not scene.prepare_animation_between_steps(0.5),"boot guard");scene.boot_ready=true;cases+=1
	for state in [0,2,-1]:
		game.fields.m_iGameState=state;expect(not scene.prepare_animation_between_steps(0.5),"menus/cinematics retain inline timing");cases+=1
	game.fields.m_iGameState=1;game.fields.m_bPaused=true;expect(not scene.prepare_animation_between_steps(0.5),"pause timing remains inline");game.fields.m_bPaused=false;cases+=1
	var gameplay:Variant=game.fields.m_CurrentGameMode
	for mode in [null,value("RDGameModeDriverSelection"),value("RDGameMode")]:
		game.fields.m_CurrentGameMode=mode;expect(not scene.prepare_animation_between_steps(0.5),"non-gameplay mode guard");cases+=1
	game.fields.m_CurrentGameMode=gameplay
	Engine.time_scale=0.5;expect(not scene.prepare_animation_between_steps(0.5),"scaled engine clock remains inline");Engine.time_scale=1.0;cases+=1
	paused=true;expect(not scene.prepare_animation_between_steps(0.5),"SceneTree pause guard");paused=false;cases+=1
	expect(scene.prepare_animation_between_steps(0.5),"normal game prepares")
	var late:R.Value=R.construct(R.klass("MovieClip"),[]);late.frame_scripts[1]=func():game.fields.late_ready=true;scene.trace.append("late_init")
	R.add_child(R.root,late);R.frame_queue.append(weakref(late))
	R.event_call(R.root,"addEventListener",["enterFrame",func(_event):expect(game.fields.late_ready,"late input-created clip initializes before game tick")])
	var event:InputEventKey=InputEventKey.new();event.keycode=KEY_W;event.pressed=true;scene._input(event)
	scene._physics_process(1.0/30)
	expect(game.fields.key and game.fields.ticks==1,"input after preparation reaches matching game tick");cases+=1
	expect(R.elapsed==1.0/30 and not scene.animation_prepared,"one clock advance consumed");cases+=1
	expect(scene.prepare_animation_between_steps(0.5),"next preparation after consumption")
	scene.phased_animation=false;scene._physics_process(1.0/30)
	expect(is_equal_approx(R.elapsed,2.0/30),"disabling during prepared step does not double advance");cases+=1
	scene._physics_process(1.0/30);expect(is_equal_approx(R.elapsed,3.0/30),"inline catchup resumes");cases+=1
	finish_fixture(f)
	f=fixture();scene=f.scene;game=f.game
	scene.prepare_animation_between_steps(0.5)
	R.remove_child(R.stage,R.root)
	var replacement:R.Value=R.construct(R.klass("MovieClip"),[]);replacement.fields.m_Game=game;game.fields.m_iGameState=0;R.root=replacement;R.add_child(R.stage,replacement)
	replacement.frame_scripts[1]=func():game.fields.late_ready=true
	R.frame_queue.append(weakref(replacement))
	R.event_call(replacement,"addEventListener",["enterFrame",func(_event):expect(game.fields.late_ready,"new menu initialized before its enterFrame")])
	scene._physics_process(1.0/30);expect(not scene.animation_prepared,"scene transition consumes existing phase once");cases+=1
	finish_fixture(f)
	expect(R.warnings.is_empty(),"no adapter warnings")
	print("TEST_ANIMATION_SCHEDULING_COMPLETE cases="+str(cases)+" failures="+str(failures))
	await process_frame;quit(0 if failures.is_empty() else 1)

