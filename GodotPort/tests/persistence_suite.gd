extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var saved:bool=false
var results:Array=[]
var scores_loaded:bool=false

func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)

func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.get_value(R.root,"m_Game");var editor=R.get_value(game,"m_GameModeEditor")
	R.set_value(editor,"m_bDoStartGameMode",true);R.call_member(game,"StartGameMode",[editor]);scene.process_frame_scripts()
	var bytes=R.call_member(editor,"GetCampaignData",[])
	expect(bytes is R.Value and bytes.kind=="bytearray" and R.get_value(bytes,"length")>0,"editor serializes campaign")
	var file=R.offline_api("createSaveFile",["Campaigns"])
	file.fields.name="Port validation campaign";file.fields.data=bytes;file.fields.keys.FileVersion=R.static_value("RDGame","CurrentFileVersion")
	file.fields.icon=R.construct(R.klass("BitmapData"),[2,2,true,0xff00ff00])
	R.event_call(file,"addEventListener",[R.get_value(R.klass("com.newgrounds.APIEvent"),"FILE_SAVED"),func(event):saved=R.truth(event.fields.get("success"))])
	R.call_member(file,"save",[]);await process_frame
	expect(saved,"campaign save completion signal")
	var query=R.offline_api("createSaveQuery",["Campaigns"])
	R.call_member(query,"addCondition",["fileName","=",file.fields.name]);R.call_member(query,"addCondition",["fileId","=",file.fields.id])
	R.event_call(query,"addEventListener",[R.get_value(R.klass("com.newgrounds.APIEvent"),"QUERY_COMPLETE"),func(event):results=event.fields.data.files])
	R.call_member(query,"execute",[]);await process_frame
	expect(results.size()==1,"campaign query finds saved file")
	if results.size()==1:
		var loaded=results[0]
		expect(loaded.fields.data.stream.data_array==bytes.stream.data_array,"campaign binary roundtrip")
		expect(R.native_call(loaded.fields.icon,"getPixel32",[0,0])==0xff00ff00,"campaign icon roundtrip")
	R.offline_api("postScore",["Port validation score",123])
	var board=R.offline_api("getScoreBoard",["Port validation score"])
	R.event_call(board,"addEventListener",[R.get_value(R.klass("com.newgrounds.APIEvent"),"SCORES_LOADED"),func(event):scores_loaded=R.truth(event.fields.get("success"))])
	R.call_member(board,"loadScores",[]);await process_frame
	expect(scores_loaded and board.fields.scores.size()==1,"local scoreboard completion signal")
	if not board.fields.scores.is_empty():expect(R.get_value(board.fields.scores[0],"numericValue")==123,"local score value")
	R.call_member(file,"deleteFile",[]);await process_frame
	print("TEST_PERSISTENCE_COMPLETE failures="+str(failures)+" warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
