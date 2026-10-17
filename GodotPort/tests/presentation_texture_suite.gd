extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	var id:String="";var path:String=""
	for key:String in R.assets.definitions:
		var definition:Dictionary=R.assets.definitions[key];var candidate:String=definition.get("svg","")
		if R.visual_overrides.has(candidate) and str(R.visual_overrides[candidate].page).begins_with("res://presentation_assets/"):
			id=key;path=candidate;break
	expect(not id.is_empty(),"shared source vector is available")
	var ordinary:Texture2D=R.get_texture(path);var sharp:Texture2D=R.get_presentation_texture(path)
	expect(ordinary!=sharp and R.get_texture(path)==ordinary,"presentation texture never replaces ordinary gameplay cache")
	expect(R.texture_size(ordinary)==R.texture_size(sharp),"logical texture dimensions remain identical")
	var sprite:R.Value=R.construct(R.klass("MovieClip"),[]);R.setup_symbol(sprite,id)
	expect(sprite.display.texture==ordinary,"ordinary source placement retains its driving atlas")
	R.presentation_scope(sprite,true);expect(sprite.display.texture==sharp,"scoped vector uses sharp atlas")
	R.presentation_scope(sprite,false);expect(sprite.display.texture==ordinary,"leaving presentation restores source atlas")
	var clip:R.Value=R.construct(R.klass("MovieClip"),[]);clip.symbol="texture-scope-probe"
	clip.timeline={"count":1,"frames":[[{"id":int(id),"d":1}]],"sounds":[]};clip.render_batch=true;R.apply_frame(clip,1)
	expect(clip.display.batch_commands[0][1]==ordinary,"ordinary display-list batch uses driving atlas")
	R.presentation_scope(clip,true)
	expect(clip.render_batch and clip.display.batch_commands[0][1]==sharp,"static presentation geometry keeps batching and upgrades texture")
	R.presentation_scope(clip,false)
	expect(clip.render_batch and clip.display.batch_commands[0][1]==ordinary,"static batch restores ordinary texture on exit")
	R.release_presentation_textures()
	for key:String in R.textures.keys():expect(not key.begins_with("@presentation:") and not key.begins_with("res://presentation_assets/"),"presentation texture cache releases "+key)
	expect(R.get_texture(path)==ordinary,"release preserves ordinary texture identity")
	print("TEST_PRESENTATION_TEXTURE_COMPLETE failures="+str(failures)+" warnings="+str(R.warnings))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() and R.warnings.is_empty() else 1)
