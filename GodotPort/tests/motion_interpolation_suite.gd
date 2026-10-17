extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var scene:Node
var game:R.Value
var failures:Array=[]
var observer:Observer
var began:int
var results:Array=[]
var intermediate:int=0
var phased_frames:int=0
var capture_counter:int=0

class Observer:
	extends Node
	var owner_test:SceneTree
	var ticks:int=0
	var target:R.Value
	var marker:Polygon2D
	var previous:Vector2
	var current:Vector2
	var stable:int=0
	var fraction:float=0
	func _physics_process(_delta:float) -> void:
		ticks+=1
		if ticks<120:return
		if target!=null and (not is_instance_valid(target.display) or not target.display.is_visible_in_tree() or target.display.modulate.a<0.99):
			if is_instance_valid(marker):marker.queue_free()
			target=null
		if target==null:
			for node:R.Value in owner_test.game.fields.m_World.fields.m_Entities:
				var entity:R.Value=node.fields.m_Entity
				if entity.behavior_render!="RDEntity" or entity.fields.m_bIsPlayer:continue
				var clip:R.Value=entity.fields.m_MainMC
				if clip==null or clip.display==null or not clip.display.is_visible_in_tree() or clip.display.modulate.a<0.99:continue
				var point:Vector2=clip.display.global_position
				if point.x<45 or point.x>555 or point.y<215 or point.y>325:continue
				target=clip;stable=0
				marker=Polygon2D.new();marker.polygon=PackedVector2Array([Vector2(-3,-3),Vector2(3,-3),Vector2(3,3),Vector2(-3,3)])
				marker.color=Color(1,0,1,1);marker.z_index=4000;clip.display.add_child(marker)
				break
		if target==null:return
		previous=current
		current=target.display.get_global_transform_with_canvas().origin
		marker.scale=Vector2.ONE/target.display.global_scale.abs().max(Vector2(0.00001,0.00001))
		stable+=1
	func _process(_delta:float) -> void:
		fraction=Engine.get_physics_interpolation_fraction()
		if owner_test.scene.animation_prepared:owner_test.phased_frames+=1

func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func run() -> void:
	if DisplayServer.get_name()=="headless":
		print("TEST_MOTION_INTERPOLATION_COMPLETE renderer_required=true samples=0 failures=[]");quit();return
	seed(20261009);Engine.max_fps=0
	scene=load("res://scenes/main.tscn").instantiate();root.add_child(scene)
	game=R.root.fields.m_Game
	R.call_member(game,"ClearCinematic",[]);R.call_member(game,"SetGameState",[0]);scene.process_frame_scripts();R.tick_tweens(2)
	var button:R.Value=game.fields.m_Menu.fields.StoryMode
	var point:Vector2=button.display.to_global(R.bounds(button).get_center())
	R.dispatch(button,"mouseDown",{"stageX":point.x,"stageY":point.y},true);scene.process_frame_scripts()
	R.call_member(game,"SkipCinematic",[]);scene.process_frame_scripts();R.tick_tweens(2)
	var mode:R.Value=game.fields.m_GameModeStory;game.fields.m_ActiveMode=mode
	mode.fields.m_bDoStartGameMode=true;R.call_member(mode,"StartGameMode",[]);R.call_member(game,"StartGameMode",[mode]);scene.process_frame_scripts()
	R.call_member(mode,"HideUpgradeScreen",[]);R.call_member(game,"HideFlash",[])
	observer=Observer.new();observer.owner_test=self;observer.process_physics_priority=1000;observer.process_priority=1000;root.add_child(observer)
	began=Time.get_ticks_msec()
	while Time.get_ticks_msec()-began<30000 and results.size()<32:
		await process_frame
		if observer.ticks in [3,30,90]:
			var key:InputEventKey=InputEventKey.new();key.keycode=KEY_W;key.pressed=true;scene._input(key)
		await RenderingServer.frame_post_draw
		capture_counter+=1
		if capture_counter%7!=0 or observer.target==null or observer.stable<3:continue
		var motion:float=observer.previous.distance_to(observer.current)
		if motion<1.0 or motion>30 or observer.fraction<0.1 or observer.fraction>0.9:continue
		var stretch:Transform2D=root.get_final_transform()
		var previous:Vector2=stretch*observer.previous;var current:Vector2=stretch*observer.current
		var expected:Vector2=previous.lerp(current,observer.fraction)
		var image:Image=root.get_texture().get_image()
		var center:Vector2=Vector2.ZERO;var count:int=0
		for y in range(maxi(0,int(expected.y)-20),mini(image.get_height(),int(expected.y)+21)):
			for x in range(maxi(0,int(expected.x)-20),mini(image.get_width(),int(expected.x)+21)):
				var color:Color=image.get_pixel(x,y)
				if color.r>0.98 and color.b>0.98 and color.g<0.02:center+=Vector2(x+0.5,y+0.5);count+=1
		if count<16:continue
		center/=count
		var error:float=center.distance_to(expected)
		results.append({"fraction":observer.fraction,"expected":[expected.x,expected.y],"rendered":[center.x,center.y],"error_px":error,"step_px":previous.distance_to(current)})
		if center.distance_to(previous)>1 and center.distance_to(current)>1:intermediate+=1
		if results.size()==16:
			for arg in OS.get_cmdline_user_args():
				if arg.begins_with("--capture="):image.save_png(arg.trim_prefix("--capture="))
	expect(results.size()>=24,"enough real projected-entity GPU motion samples")
	expect(intermediate>=12,"GPU presents intermediate projected positions")
	expect(phased_frames>0,"animation preparation active during motion")
	var worst:float=0
	for result:Dictionary in results:worst=maxf(worst,result.error_px)
	expect(worst<=1.5,"GPU position matches 30 Hz interpolated world transform within pixel rounding")
	expect(not mode.fields.m_Player.fields.m_bFailed and mode.fields.m_Player.fields.m_vLocation.fields.Z>0,"motion sequence remains playable")
	expect(R.warnings.is_empty(),"no runtime adapter warnings")
	print("TEST_MOTION_INTERPOLATION_COMPLETE "+JSON.stringify({"ticks":observer.ticks,"state":game.fields.m_iGameState,"position":mode.fields.m_Player.fields.m_vLocation.fields.Z,"samples":results.size(),"intermediate":intermediate,"phased_frames":phased_frames,"worst_error_px":worst,"measurements":results,"failures":failures}))
	observer.queue_free();scene.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
