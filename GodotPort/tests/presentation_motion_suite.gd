extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
var host:Node2D
var clip:R.Value
var shape:R.Value
var previous:Vector2
var current:Vector2
var ticks:int=0
var samples:int=0
var intermediate:int=0
var worst:float=0
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
class Driver:
	extends Node
	var test:SceneTree
	func _physics_process(_delta:float) -> void:
		test.ticks+=1;test.previous=test.current
		R.advance_clip(test.clip)
		test.current=test.shape.display.get_global_transform_with_canvas().origin
func run() -> void:
	host=Node2D.new();root.add_child(host);R.initialize(host)
	clip=R.construct(R.klass("MovieClip"),[]);clip.symbol="presentation-motion-probe";R.add_child(R.stage,clip)
	var frames:Array=[]
	for tick:int in range(90):frames.append([{"id":3888,"d":1,"move":tick>0,"m":[1,0,0,1,100+tick*2,150]}])
	clip.timeline={"count":90,"frames":frames,"sounds":[]};clip.render_batch=true
	R.apply_frame(clip,1)
	expect(clip.children.is_empty(),"source geometry initially uses a display-list batch")
	var scripts:Dictionary=clip.frame_scripts
	R.presentation_scope(clip,true)
	expect(not clip.render_batch and clip.children.size()==1,"animated batch becomes native interpolated geometry")
	expect(is_same(scripts,clip.frame_scripts),"frame callback dictionary retains identity")
	shape=clip.children[0];shape.display.texture=null;shape.display.own_bounds=Rect2(-3,-3,6,6)
	shape.fields["@drawing"]=[["rect",Rect2(-3,-3,6,6),Color(1,0,1,1)]];shape.display.queue_redraw()
	R.goto_frame(clip,2,false);expect(shape==clip.children[0] and shape.display.position==Vector2(102,150),"same authored child identity and transform")
	clip.playing=true;R.refresh_active_clip(clip)
	previous=shape.display.get_global_transform_with_canvas().origin;current=previous
	var driver:Driver=Driver.new();driver.test=self;root.add_child(driver)
	if DisplayServer.get_name()!="headless":
		Engine.max_fps=240
		var began:int=Time.get_ticks_msec()
		while samples<32 and Time.get_ticks_msec()-began<10000:
			await RenderingServer.frame_pre_draw
			var fraction:float=Engine.get_physics_interpolation_fraction()
			var before:Vector2=root.get_final_transform()*previous;var after:Vector2=root.get_final_transform()*current
			var expected:Vector2=before.lerp(after,fraction)
			await RenderingServer.frame_post_draw
			if ticks<3 or fraction<0.15 or fraction>0.85 or before.distance_to(after)>20:continue
			var image:Image=root.get_texture().get_image();var center:Vector2=Vector2.ZERO;var count:int=0
			for y:int in range(int(expected.y)-12,int(expected.y)+13):
				for x:int in range(int(expected.x)-12,int(expected.x)+13):
					var color:Color=image.get_pixel(x,y)
					if color.r>0.98 and color.b>0.98 and color.g<0.02:center+=Vector2(x+0.5,y+0.5);count+=1
			if count==0:continue
			center/=count;worst=maxf(worst,center.distance_to(expected));samples+=1
			if center.distance_to(before)>0.5 and center.distance_to(after)>0.5:intermediate+=1
		expect(samples==32 and intermediate>=16,"GPU displays intermediate authored animation positions")
		expect(worst<=1.5,"GPU positions follow Godot interpolation within pixel rounding")
	R.presentation_scope(clip,false);expect(not clip.fields["@presentation_motion"],"presentation scope can be cleared before gameplay")
	print("TEST_PRESENTATION_MOTION_COMPLETE "+JSON.stringify({"samples":samples,"intermediate":intermediate,"worst_error_px":worst,"ticks":ticks,"failures":failures,"warnings":R.warnings}))
	driver.set_physics_process(false);driver.queue_free();R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() and R.warnings.is_empty() else 1)
