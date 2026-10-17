extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func dump(clip:R.Value,path:String,depth:int=0) -> void:
	if depth>4:return
	print("PRESENTATION_CLIP "+JSON.stringify({"path":path,"class":clip.class_id,"symbol":clip.symbol,"frame":clip.frame,"position":str(clip.display.position),"scale":str(clip.display.scale),"alpha":clip.display.modulate.a,"visible":clip.display.visible,"batch":clip.render_batch,"texture":str(clip.display.texture.get_size()) if clip.display.texture!=null else ""}))
	for child:R.Value in clip.children:dump(child,path+"/"+str(child.fields.get("name",child.symbol)),depth+1)
func save(scene:Node,name:String) -> void:
	await process_frame;await RenderingServer.frame_post_draw
	root.get_texture().get_image().save_png(ProjectSettings.globalize_path("res://../presentation059-"+name+".png"))
	print("PRESENTATION_CAPTURE "+name+" root_frame="+str(R.root.frame))
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game:R.Value=R.root.fields.m_Game
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	game.fields.m_ActiveMode=game.fields.m_GameModeStory
	R.call_member(game,"StartCinematic",["GameIntro",false]);scene.process_frame_scripts()
	for frame:int in range(1,541):
		R.elapsed+=1.0/30;R.tick_tweens(1.0/30);scene.advance_timelines();scene.process_frame_scripts();R.call_member(game,"Tick",[1.0/30]);scene.process_frame_scripts();R.sync_visible_clips()
		if frame in [1,60,180,360,540]:await save(scene,"intro-"+str(frame))
	R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2);R.call_member(game,"HideFlash",[])
	R.call_member(game,"Tick",[1.0/30]);scene.process_frame_scripts()
	await save(scene,"selection")
	dump(game.fields.m_GameModeDriverSelection.fields.m_MC,"Selection")
	print("PRESENTATION_INSPECT_COMPLETE warnings="+str(R.warnings))
	scene.queue_free();await process_frame;quit()
