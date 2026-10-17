extends SceneTree
const Catalog=preload("res://runtime/catalog_data.gd")
var failures:Array=[]
func expect(ok:bool,label:String) -> void:
	if not ok:failures.append(label);push_error("ASSERTION_FAILED "+label)
func _initialize() -> void:
	var rows:Array=[]
	for name:String in Catalog.sources():
		var started:int=Time.get_ticks_usec()
		var original:Dictionary=Catalog.read(name,false)
		var json_us:int=Time.get_ticks_usec()-started
		started=Time.get_ticks_usec()
		var cached:Dictionary=Catalog.read(name)
		var cache_us:int=Time.get_ticks_usec()-started
		expect(original==cached,"exact catalog roundtrip "+name)
		expect(var_to_bytes(original)==var_to_bytes(cached),"all catalog key orders and number types "+name)
		if not name.begins_with("timelines/"):rows.append({"name":name,"json_us":json_us,"cache_us":cache_us,"keys":original.size()})
	var digest:String="fixture-hash";var payload:Dictionary={"number":0.12345678901234567,"nested":[null,true,{"key":"value"}]}
	expect(is_same(Catalog.valid_payload([Catalog.VERSION,digest,payload],digest),payload),"valid payload returns full catalog")
	for invalid:Variant in [null,{},[],[Catalog.VERSION,digest],[Catalog.VERSION+1,digest,payload],[Catalog.VERSION,"stale",payload],[Catalog.VERSION,digest,[]],[Catalog.VERSION,digest,payload,"extra"]]:expect(Catalog.valid_payload(invalid,digest)==null,"invalid or stale cache falls back")
	print("CATALOG_RESULT ",JSON.stringify({"total_catalogs":Catalog.sources().size(),"base_timings":rows,"invalid_cases":8,"failures":failures}))
	quit(0 if failures.is_empty() else 1)
