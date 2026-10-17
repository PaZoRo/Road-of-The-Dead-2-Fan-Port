extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
class Writer:
	extends Node
	signal complete
	var clip:R.Value
	var ticks:int=0
	func _physics_process(_dt:float) -> void:
		ticks+=1
		var x:float=10.0 if ticks==1 else 30.0
		var points:PackedVector2Array=[Vector2(x,12),Vector2(x+6,12),Vector2(x+6,18),Vector2(x,18)]
		clip.display.clear_road_batch(true)
		clip.display.append_road_polygon(points,Geometry2D.triangulate_polygon(points),Color.WHITE,"same physical surface")
		clip.fields["@drawing"]=[["polygon",points,Color.WHITE]];clip.display.queue_redraw()
		if ticks==2:set_physics_process(false);complete.emit()
func white_centroid(image:Image) -> Vector2:
	var count:int=0;var sum:Vector2=Vector2.ZERO
	for y in image.get_height():
		for x in image.get_width():
			var c:Color=image.get_pixel(x,y)
			if c.r>0.9 and c.g>0.9 and c.b>0.9:sum+=Vector2(x+0.5,y+0.5);count+=1
	expect(count>=24,"visible interpolated road surface")
	return sum/maxi(1,count)
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var view:SubViewport=SubViewport.new();view.size=Vector2i(80,64);view.world_2d=World2D.new();view.disable_3d=true;view.transparent_bg=true;view.render_target_update_mode=SubViewport.UPDATE_ALWAYS;host.add_child(view)
	var clip:R.Value=R.construct(R.klass("MovieClip"),[]);view.add_child(clip.display)
	clip.display.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
	var writer:Writer=Writer.new();writer.clip=clip;host.add_child(writer);await writer.complete
	expect(clip.display.road_matched==1 and clip.display.road_previous[0]==Vector2(10,12),"consecutive physics samples retain actual previous vertices")
	var samples:Array=[]
	for fraction in [0.0,0.25,0.5,0.75,1.0]:
		RenderingServer.global_shader_parameter_set("fan_road_fraction",fraction)
		await process_frame;await RenderingServer.frame_post_draw
		var image:Image=view.get_texture().get_image();var point:Vector2=white_centroid(image)
		expect(point.distance_to(Vector2(13+20*fraction,15))<0.05,"GPU road vertices interpolate at fraction="+str(fraction)+" measured="+str(point))
		samples.append({"fraction":fraction,"center":point})
		if fraction==0.5:
			for arg in OS.get_cmdline_user_args():
				if arg.begins_with("--capture="):image.save_png(arg.trim_prefix("--capture="))
	RenderingServer.global_shader_parameter_set("fan_road_fraction",0.25)
	var snapshot:Script=load("res://runtime/native_snapshot.gd")
	var target:Image=Image.create(80,64,false,Image.FORMAT_RGBA8);target.fill(Color.BLACK)
	expect(snapshot.capture(host,target,clip.display),"source-state GPU capture during interpolated frame")
	expect(white_centroid(target).distance_to(Vector2(33,15))<0.05,"pause/BitmapData snapshot captures source current geometry")
	expect(clip.display.road_motion and clip.display.material.get_shader_parameter("road_motion"),"snapshot leaves live interpolation material intact")
	# The current surface is entirely outside the viewport; the previous
	# endpoint must still be drawn by the GPU during the transition.
	clip.display.road_points=PackedVector2Array([Vector2(90,12),Vector2(96,12),Vector2(96,18),Vector2(90,18)])
	clip.display.queue_redraw();RenderingServer.global_shader_parameter_set("fan_road_fraction",0.5)
	await process_frame;await RenderingServer.frame_post_draw
	expect(white_centroid(view.get_texture().get_image()).distance_to(Vector2(53,15))<0.05,"GPU culling includes previous and current road vertices")
	var fresh:PackedVector2Array=[Vector2(40,12),Vector2(46,12),Vector2(46,18),Vector2(40,18)]
	clip.display.clear_road_batch(true,1234)
	clip.display.append_road_polygon(fresh,Geometry2D.triangulate_polygon(fresh),Color.WHITE,"same physical surface")
	expect(clip.display.road_matched==0 and clip.display.road_previous==fresh,"new road owner cannot interpolate stale geometry")
	await physics_frame;await physics_frame;await process_frame
	clip.display.clear_road_batch(true,1234)
	clip.display.append_road_polygon(fresh,Geometry2D.triangulate_polygon(fresh),Color.WHITE,"same physical surface")
	expect(clip.display.road_matched==0,"pause or inactive rendering gap clears history")
	R.graphics_call(clip,"clear",[])
	expect(not clip.display.road_motion and not clip.display.road_batch,"ordinary graphics restore ordinary vertex shader")
	expect(R.warnings.is_empty(),"no adapter warnings")
	print("TEST_ROAD_MOTION_COMPLETE "+JSON.stringify({"samples":samples,"failures":failures}))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
