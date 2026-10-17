extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func run() -> void:
	var scene:Node=load("res://scenes/main.tscn").instantiate();root.add_child(scene);scene.set_process(false);scene.set_physics_process(false)
	var game=R.root.fields.m_Game;var mode=game.fields.m_GameModeStory
	mode.fields.m_bDoStartGameMode=true;R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts();R.call_member(mode,"HideUpgradeScreen",[])
	var player=mode.fields.m_Player
	for side:bool in [true,false]:
		var zombie=R.call_static("RDGame","GetEntity",[R.klass("RDZombieNormalMale")])
		R.call_member(game,"AddEntity",[zombie,0,0,5]);R.call_member(zombie,"Init",[0])
		zombie.fields.m_Player=player
		R.call_member(zombie,"StartCling",[side]);scene.process_frame_scripts()
		expect(is_equal_approx(zombie.fields.m_fClingPunchDelay,8.0),"hood response window is eight seconds "+str(side))
		zombie.fields.m_iClingState=R.static_value("RDHumanoid","ClingState_Idle")
		R.call_member(zombie,"UpdateClingAnimation",[]);scene.process_frame_scripts()
		var clip=R.call_member(player,"GetClingerMC",[zombie]);var collider=R.get_value(R.get_value(clip,"Head"),"BulletCollision")
		expect(collider!=null,"authored head hitbox exists "+str(side))
		if collider==null:continue
		var point:Vector2=collider.display.to_global(R.bounds(collider).get_center())
		expect(R.call_member(collider,"hitTestPoint",[point.x,point.y,true]),"zero-alpha head geometry hit "+str(side))
		var miss:Vector2=collider.display.to_global(R.bounds(collider).position+Vector2.ONE)
		expect(not R.call_member(collider,"hitTestPoint",[miss.x,miss.y,true]),"circle corner is outside geometry "+str(side))
		var left:float=zombie.fields.m_fLeftArmHP;var right:float=zombie.fields.m_fRightArmHP
		var bullet=R.construct(R.klass("RDBulletInfo"),[])
		bullet.fields.m_fPosX=point.x;bullet.fields.m_fPosY=point.y;bullet.fields.m_fSpreadAngle=0.0;bullet.fields.m_fSpreadAmplitude=0.0
		expect(R.call_member(player.fields.m_Weapon,"TryBulletOnClinger",[zombie,bullet,100]),"weapon pipeline reaches head "+str(side))
		expect(zombie.fields.m_fHeadHP==0 and zombie.fields.m_bHit,"headshot kills hood zombie "+str(side))
		expect(zombie.fields.m_fLeftArmHP==left and zombie.fields.m_fRightArmHP==right,"headshot does not damage arms "+str(side))
		expect(zombie.fields.m_iClingState==R.static_value("RDHumanoid","ClingState_Shot"),"head death animation selected "+str(side))
		R.call_member(player,"SetClinger",[null,side,false])
	var shape=R.construct(R.klass("MovieClip"),[]);R.add_child(R.stage,shape)
	R.graphics_call(shape,"beginFill",[0xff0000,0]);R.graphics_call(shape,"drawCircle",[15,15,10]);R.graphics_call(shape,"endFill",[])
	shape.display.visible=false
	expect(R.call_member(shape,"hitTestPoint",[15,15,true]),"hidden procedural collision geometry")
	expect(not R.call_member(shape,"hitTestPoint",[6,6,true]),"procedural circle excludes corners")
	var hits:Array=[];R.objects_at_point(shape,Vector2(15,15),hits);expect(hits.is_empty(),"mouse picking ignores hidden geometry")
	expect(R.warnings.is_empty(),"no combat dispatch warnings")
	print("TEST_HOOD_COMBAT_COMPLETE failures="+str(failures))
	scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
