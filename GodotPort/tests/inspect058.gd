extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func dump(value:Variant,path:String,depth:int=0) -> void:
	if not R.is_display(value) or depth>7:return
	if depth<3 or path.contains("Head") or path.contains("Collision"):
		print("VIS "+JSON.stringify({"path":path,"class":value.class_id,"symbol":value.symbol,"frame":value.frame,"visible":value.display.visible,"alpha":value.display.modulate.a,"bounds":str(R.bounds(value)),"ct":str(value.fields.get("colorTransform")),"add":str(value.fields.get("@color_add")),"draw":str(value.fields.get("@drawing"))}))
	for child in value.children:dump(child,path+"/"+str(child.fields.get("name",child.symbol)),depth+1)
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.root.fields.m_Game
	R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2)
	dump(R.get_value(R.root,"MenuScreen"),"MenuScreen")
	var mode=game.fields.m_GameModeStory;mode.fields.m_bDoStartGameMode=true
	R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	var player=mode.fields.m_Player
	var clip=player.fields.m_ClingerZombieNormalMaleLeft
	R.goto_frame(clip,"Idle",false);scene.process_frame_scripts()
	var head=R.get_value(clip,"Head");var collision=R.get_value(head,"BulletCollision")
	print("HEAD_FIELDS "+str(head.fields.keys())+" COLLISION="+str(collision))
	if collision!=null:
		print("COLLISION_FIELDS "+str(collision.fields)+" BOUNDS="+str(R.bounds(collision)))
		var point:Vector2=collision.display.to_global(R.bounds(collision).get_center())
		print("HEAD_TEST "+str(R.call_member(collision,"hitTestPoint",[point.x,point.y,true])))
	dump(clip,"Clinger")
	print("PLAYER_CLIPS "+str(player.fields.keys().filter(func(k):return str(k).contains("Cling"))))
	scene.queue_free();await process_frame;quit()
