extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func capture(host:Node,scene:R.Value) -> Image:
	var image:Image=Image.create(96,64,false,Image.FORMAT_RGBA8);image.fill(Color.BLACK)
	expect(R.snapshot_script.capture(host,image,scene.display),"actual GPU capture")
	return image
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host);R.snapshot_script=load("res://runtime/native_snapshot.gd")
	var scene:R.Value=R.construct(R.klass("MovieClip"),[]);host.add_child(scene.display)
	var sprite:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(scene,sprite)
	sprite.fields["@drawing"]=[["rect",Rect2(8,8,20,20),Color(0.2,0.3,0.4,1)]];sprite.display.queue_redraw()
	var filter=R.construct(R.klass("ColorMatrixFilter"),[[1,0,0,0,51,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]])
	R.set_value(sprite,"filters",[filter]);expect(sprite.display.material!=null,"identity matrix with offset keeps shader")
	var image:Image=capture(host,scene);var color:Color=image.get_pixel(15,15)
	expect(absf(color.r-0.4)<0.01 and absf(color.g-0.3)<0.01,"GPU applies additive color offset")
	R.set_value(sprite,"filters",[])
	var first:R.Value=R.construct(R.klass("MovieClip"),[]);var second:R.Value=R.construct(R.klass("MovieClip"),[])
	R.add_child(scene,first);R.add_child(scene,second)
	first.display.clear_road_batch(true,1);second.display.clear_road_batch(true,2)
	expect(first.display.material==second.display.material,"plain road uses shared immutable GPU material")
	var shared:Material=second.display.material
	R.set_value(first,"colorTransform",R.construct(R.klass("ColorTransform"),[0.5,1,1,1]))
	expect(first.display.material!=shared and second.display.material==shared,"tint gets private material")
	expect(shared.get_shader_parameter("road_motion")==true,"private transition leaves other road motion active")
	R.set_value(first,"colorTransform",null);expect(first.display.material==shared,"plain transition rejoins shared material")
	var aim:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(scene,aim);aim.display.position=Vector2(60,30);aim.fields["@fan_crosshair"]=true;aim.fields["@fan_crosshair_gap"]=3.0;aim.display.queue_redraw()
	image=capture(host,scene)
	for point:Vector2i in [Vector2i(54,30),Vector2i(65,30),Vector2i(60,24),Vector2i(60,35)]:
		color=image.get_pixelv(point);expect(color.g>0.95 and color.r<0.4,"CS style crosshair bar "+str(point))
	expect(image.get_pixel(60,30).r<0.01,"crosshair has open center")
	var menu_parts:int=0
	for path:String in R.visual_overrides:
		var entry:Dictionary=R.visual_overrides[path]
		var texture:Texture2D=R.get_presentation_texture(path)
		if entry.page=="res://ui/menu_art.png":
			menu_parts+=1
			expect(texture.get_size()==R.texture_size(texture)*2.0,"double resolution keeps original menu logical size "+path)
		else:
			expect(texture.get_width()>=R.texture_size(texture).x and texture.get_height()>=R.texture_size(texture).y,"presentation art gains resolution "+path)
		expect(R.texture_size(texture)==Vector2(entry.logical_size[0],entry.logical_size[1]),"original layout retained "+path)
	expect(menu_parts==22,"all menu zombie vector parts rebuilt")
	for arg:String in OS.get_cmdline_user_args():
		if arg.begins_with("--capture="):image.save_png(arg.trim_prefix("--capture="))
	print("TEST_VISUAL_FIXES_COMPLETE failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
