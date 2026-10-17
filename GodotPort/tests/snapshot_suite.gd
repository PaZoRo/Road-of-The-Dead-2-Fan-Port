extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
 if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func difference(a:Image,b:Image) -> int:
 if a.get_size()!=b.get_size():return 999
 var first:PackedByteArray=a.get_data();var second:PackedByteArray=b.get_data();var result:int=0
 for i in first.size():result=maxi(result,absi(first[i]-second[i]))
 return result
func run() -> void:
 root.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
 var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
 var snapshot:Script=load("res://runtime/native_snapshot.gd")
 var viewport:SubViewport=SubViewport.new();viewport.size=Vector2i(96,64);viewport.world_2d=World2D.new();viewport.transparent_bg=true;viewport.disable_3d=true;viewport.render_target_update_mode=SubViewport.UPDATE_ALWAYS;host.add_child(viewport)
 var scene:R.Value=R.construct(R.klass("MovieClip"),[]);viewport.add_child(scene.display)
 scene.fields["@drawing"]=[["rect",Rect2(0,0,96,64),Color.WHITE],["polygon",PackedVector2Array([Vector2(1,40),Vector2(95,36),Vector2(80,63),Vector2(10,60)]),Color(0.2,0.3,0.4)]];scene.display.queue_redraw()
 var sprite:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(scene,sprite)
 var pixels:Image=Image.create(8,8,false,Image.FORMAT_RGBA8)
 for y in 8:
  for x in 8:pixels.set_pixel(x,y,Color(x/8.0,y/8.0,0.6,(1+(x+y)%3)/3.0))
 sprite.display.texture=ImageTexture.create_from_image(pixels);sprite.display.offset=Vector2(-1,-2)
 sprite.fields["@drawing"]=[["circle",Vector2(15,5),3.0,Color(0.7,0.2,0.3,0.8)],["line",Vector2(0,15),Vector2(30,10),Color(0.3,0.8,0.1),2.0]]
 var text:R.Value=R.construct(R.klass("TextField"),[]);R.add_child(scene,text);text.display.position=Vector2(2,2);text.display.own_bounds=Rect2(0,0,88,24)
 for value in [scene,sprite,text]:value.display.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
 R.set_value(text,"htmlText","<p ALIGN='center'><font COLOR='#123456' SIZE='12'>Road &amp; fuel</font></p>")
 var mask:R.Value=R.construct(R.klass("MovieClip"),[]);R.add_child(scene,mask);mask.display.texture=sprite.display.texture;mask.display.position=Vector2(8,27);mask.display.scale=Vector2(3,3);mask.display.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
 var batch:R.Value=R.symbol_instance("8580");R.add_child(scene,batch);batch.display.position=Vector2(55,27);batch.display.scale=Vector2(0.05,0.05);batch.display.physics_interpolation_mode=Node.PHYSICS_INTERPOLATION_MODE_OFF
 var batch_children:Array=batch.children.duplicate();expect(batch.render_batch,"real deferred animation batch active")
 var cases:int=0
 if DisplayServer.get_name()=="headless":
  var target:Image=Image.create(96,64,false,Image.FORMAT_RGBA8);target.fill(Color.WHITE)
  expect(not snapshot.capture(host,target,scene.display),"headless keeps CPU path")
 else:
  for index in 12:
   sprite.display.transform=Transform2D(index*0.07,Vector2(8+index,27));sprite.display.scale=Vector2(1+index*0.05,1+index*0.03);sprite.display.modulate=Color(0.9,0.8,1,0.4+index*0.05)
   if index==3:R.set_value(sprite,"colorTransform",R.construct(R.klass("ColorTransform"),[1,0.5,0.8,1,12,0,0,0]))
   if index==6:sprite.display.batch_commands=[[Transform2D(0.2,Vector2(30,0)),sprite.display.texture,Vector2.ZERO,Color(0.8,1,0.5,0.7)]]
   if index==9:R.set_value(text,"htmlText","<p ALIGN='right'><font COLOR='#654321' SIZE='11'>more<br/>lines</font></p>")
   if index==10:R.set_value(sprite,"mask",mask)
   if index==11:R.set_value(sprite,"filters",[R.construct(R.klass("GlowFilter"),[0xffcc00,0.5,4,4,1,1])])
   scene.display.queue_redraw();sprite.display.queue_redraw();text.display.queue_redraw()
   for value in [scene,sprite,text,mask,batch]:value.display.reset_physics_interpolation()
   await process_frame
   await RenderingServer.frame_post_draw
   var reference:Image=viewport.get_texture().get_image()
   await process_frame
   var target:Image=Image.create(96,64,false,Image.FORMAT_RGBA8);target.fill(Color.WHITE)
   var values:int=R.values.size();var parent:Node=scene.display.get_parent();var child_count:int=scene.children.size();var children:Array=scene.children.duplicate()
   expect(snapshot.capture(host,target,scene.display),"GPU snapshot accepted "+str(index))
   var delta:int=difference(target,reference)
   if index<=2:
    for arg in OS.get_cmdline_user_args():
     if arg.begins_with("--snapshot-images="):
      target.save_png(arg.trim_prefix("--snapshot-images=")+"-"+str(index)+"-native.png");reference.save_png(arg.trim_prefix("--snapshot-images=")+"-"+str(index)+"-reference.png")
   expect(delta<=1,"GPU matches actual scene rendering delta="+str(delta)+" case="+str(index))
   expect(R.values.size()==values and scene.display.get_parent()==parent and scene.children.size()==child_count and scene.children==children,"capture leaves models/tree intact")
   expect(batch.render_batch and batch.children==batch_children,"capture preserves deferred animation children")
   cases+=1
  var transparent:Image=Image.create(96,64,false,Image.FORMAT_RGBA8);transparent.fill(Color.TRANSPARENT)
  expect(not snapshot.capture(host,transparent,scene.display),"transparent data retains CPU path")
  var unsupported:ColorRect=ColorRect.new();scene.display.add_child(unsupported)
  var target:Image=Image.create(96,64,false,Image.FORMAT_RGBA8);target.fill(Color.WHITE)
  expect(not snapshot.capture(host,target,scene.display),"unsupported canvas nodes retain CPU path")
  unsupported.free()
 expect(R.warnings.is_empty(),"no compatibility warnings")
 print("TEST_SNAPSHOT_COMPLETE gpu_cases="+str(cases)+" failures="+str(failures))
 R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
