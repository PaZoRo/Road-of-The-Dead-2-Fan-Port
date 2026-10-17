extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var result:Dictionary={"done":false}
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func load_pattern(program:Script,pattern:R.Value,mode:R.Value,context:Dictionary) -> void:
	result.space=await program.load_section(pattern,[mode,4,0.7,200.0,0.8,1.0],context);result.done=true
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game:R.Value=R.root.fields.m_Game;var mode:R.Value=game.fields.m_GameModeStory
	mode.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	R.call_member(game,"SetPause",[false]);R.call_member(game,"HideFlash",[])
	game.fields.m_iGameState=1
	var clock:Node=scene.section_clock;var program:Script=scene.section_program
	expect(clock!=null,"actual publication scheduler enabled")
	var pattern:R.Value=R.construct(R.klass("RDLevelPatternCustomNew"),[R.klass("MC_LevelPattern_LG_Residential1")]);var context:Dictionary=clock.create_context(mode)
	R.section_publication=context;load_pattern(program,pattern,mode,context);R.section_publication={}
	clock.budget_us=500
	var staged:int=0;var rounds:int=0;var observed:Array=[]
	while not result.done and rounds<300:
		clock.pump(false,0);rounds+=1
		if context.section_open:
			for reference:WeakRef in context.publication:
				var clip:R.Value=reference.get_ref()
				if clip!=null:
					staged+=1;if not observed.has(clip):observed.append(clip)
					expect(clip.fields.get("@section_pending",false),"unfinished section stays staged")
			R.call_member(game.fields.m_World,"Render",[mode.fields.m_Camera])
			for reference:WeakRef in context.publication:
				var clip:R.Value=reference.get_ref()
				if clip!=null:expect(not clip.display.visible,"render cannot reveal unfinished scenery")
		expect(R.section_publication.is_empty(),"collector scope does not leak across yielded frames")
		await process_frame
	expect(result.done and not is_nan(result.space),"complete original pattern constructed")
	expect(staged>0 and observed.size()>4 and rounds>4,"real multi-slice entity construction exercised")
	for clip:R.Value in observed:expect(not clip.fields.has("@section_pending"),"whole section published on completion")
	expect(context.publication.is_empty() and not context.section_open,"publication references released")
	expect(R.warnings.is_empty(),"no publication dispatch warnings")
	print("TEST_SECTION_PUBLICATION_COMPLETE entities="+str(observed.size())+" slices="+str(rounds)+" failures="+str(failures))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
