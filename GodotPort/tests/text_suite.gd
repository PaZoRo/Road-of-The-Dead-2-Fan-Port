extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)

static func original_plain(html:String) -> String:
	var regex:RegEx=RegEx.new();regex.compile("(?i)<br\\s*/?>|</p>");html=regex.sub(html,"\n",true)
	regex.compile("<[^>]*>");html=regex.sub(html,"",true)
	return html.replace("&lt;","<").replace("&gt;",">").replace("&quot;","\"").replace("&apos;","'").replace("&nbsp;"," ").replace("&amp;","&").trim_suffix("\n")

func samples() -> Array:
	var result:Array=["","plain text","<P>one</P><br/>two<br >three", "<font COLOR='#aBcDeF' SIZE='14.5'>ammo &amp; fuel</font>", "<p ALIGN='RIGHT'>&lt;b&gt;&nbsp;&quot;&apos;</p>", "<font color='#000000' color='#ffffff' size='0'>zero</font>","<font SIZE='..4.' COLOR='#gggggg'>invalid</font>","<font COLOR='#1234567' SIZE='-8'>partial</font>","<br>\n</p>\n","<broken <tag>> trailing", "<text\ncolor='red'>multiline</text>","&amp;lt;&unknown;", "Română 日本語 Ζόμπι 🧟", "<font size=\"9999999\" color=\"#fedcba\">large</font>"]
	for i in 700:
		result.append("<p ALIGN='"+(["left","CENTER","right","justify"][i%4])+"'><font COLOR='#%06x' SIZE='%s'>ammo %s &amp; fuel<br/>%s</font></p>"%[(i*1507)%0xffffff,str(i%40+0.5),str(i),str(700-i)])
	result.append("<b>"+"x".repeat(R.TEXT_CACHE_MAX_LENGTH+1)+"</b>")
	return result

func run() -> void:
	var host:Node=Node.new();root.add_child(host);R.initialize(host)
	var cases:int=0;var assignments:int=0
	var inputs:Array=samples()
	var old:R.Value=R.construct(R.klass("TextField"),[])
	var next:R.Value=R.construct(R.klass("TextField"),[])
	var alignment:String="(?i)ALIGN=[\"']([^\"']+)"
	for html:String in inputs:
		R.cached_text_enabled=true
		var expected:String=original_plain(html)
		expect(R.html_plain(html)==expected and R.html_plain(html)==expected,"plain text cold/hit "+str(cases))
		var cached:RegEx=R.text_regex(alignment);var matched:RegExMatch=cached.search(html)
		var previous:RegEx=RegEx.new();previous.compile(alignment);var reference:RegExMatch=previous.search(html)
		expect((matched==null)==(reference==null),"alignment match presence "+str(cases))
		if matched!=null:expect(matched.get_strings()==reference.get_strings(),"alignment match data "+str(cases))
		R.cached_text_enabled=false;R.set_value(old,"htmlText",html)
		R.cached_text_enabled=true;R.set_value(next,"htmlText",html)
		expect(old.fields==next.fields,"assignment text/color/size "+str(cases));assignments+=1
		for field in [old,next]:field.fields.text="edited";field.fields.textColor=0x543210;field.fields.size=31.0
		R.cached_text_enabled=false;R.set_value(old,"htmlText",html)
		R.cached_text_enabled=true;R.set_value(next,"htmlText",html)
		expect(old.fields==next.fields,"reassign same HTML after edits "+str(cases));assignments+=1
		R.set_value(next,"text","reset");expect(not next.fields.has("htmlText") and next.fields.text=="reset","plain setter clears markup")
		R.set_value(old,"text","reset")
		expect(R.plain_text_cache.size()<=R.TEXT_CACHE_CAPACITY and R.plain_text_keys.size()<=R.TEXT_CACHE_CAPACITY,"bounded text cache")
		cases+=1
	for html:String in inputs:expect(R.html_plain(html)==original_plain(html),"evicted entries recompute")
	expect(not R.plain_text_cache.has(inputs.back()),"large input not retained")
	var editable:String=R.html_plain("<b>original</b>");editable[0]="X"
	expect(R.html_plain("<b>original</b>")=="original","returned text remains independent")
	var format:R.Value=R.construct(R.klass("TextFormat"),["Arial",18,0x345678])
	R.set_value(next,"defaultTextFormat",format);R.set_value(next,"htmlText","<font color='#112233' size='22'>hello</font>")
	expect(next.fields.defaultTextFormat==format and next.fields.textColor==0x112233 and next.fields.size==22.0,"format identity and markup overrides")
	R.clear_text_cache();expect(R.plain_text_cache.is_empty() and R.text_regex_cache.is_empty() and R.plain_text_keys.is_empty() and R.plain_text_cursor==0,"cache reset")
	expect(R.warnings.is_empty(),"no compatibility warnings")
	print("TEST_TEXT_COMPLETE cases="+str(cases)+" assignments="+str(assignments)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(0 if failures.is_empty() else 1)
