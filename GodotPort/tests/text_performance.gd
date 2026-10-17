extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
func _initialize() -> void:call_deferred("run")
func work(kind:String,value:R.Value,index:int) -> void:
 var html:String="<p ALIGN='right'><font COLOR='#abcdef' SIZE='14.5'>Ammo %s &amp; fuel<br/>Road</font></p>"%("15" if kind!="plain_changing" else str(index))
 if kind=="html_assignment":R.set_value(value,"htmlText",html)
 elif kind=="alignment":R.text_regex("(?i)ALIGN=[\"']([^\"']+)").search(html)
 else:R.html_plain(html)
func run() -> void:
 var host:Node=Node.new();root.add_child(host);R.initialize(host)
 var value:R.Value=R.construct(R.klass("TextField"),[])
 var results:Array=[]
 for kind in ["plain_repeat","plain_changing","html_assignment","alignment"]:
  var samples:Array=[[],[]]
  for batch in 6:
   for mode in [0,1] if batch%2==0 else [1,0]:
    R.cached_text_enabled=mode==1;R.clear_text_cache()
    work(kind,value,-1)
    var began:int=Time.get_ticks_usec()
    for i in 500:work(kind,value,i+batch*500)
    samples[mode].append((Time.get_ticks_usec()-began)/500.0)
  var old:float=0;var next:float=0
  for x in samples[0]:old+=x/6.0
  for x in samples[1]:next+=x/6.0
  results.append({"kind":kind,"previous_us":old,"cached_us":next,"samples_us":samples})
 print("TEXT_PERFORMANCE "+JSON.stringify({"instances_per_implementation_per_case":3000,"cases":results,"warnings":R.warnings}))
 R.cleanup();host.queue_free();await process_frame;quit(0 if R.warnings.is_empty() else 1)
