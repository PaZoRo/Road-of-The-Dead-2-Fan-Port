extends SceneTree
const Catalog = preload("res://runtime/catalog_data.gd")
func _initialize() -> void :
	DirAccess.make_dir_recursive_absolute("res://data/cache")
	for name: String in Catalog.sources():
		DirAccess.make_dir_recursive_absolute(Catalog.cache_path(name).get_base_dir())
		var data: PackedByteArray = Catalog.encode(name)
		var file: FileAccess = FileAccess.open(Catalog.cache_path(name), FileAccess.WRITE)
		assert (file != null, "Cannot write catalog cache: " + name)
		file.store_buffer(data);file.close()
		assert (Catalog.read(name) == Catalog.read(name, false), "Catalog roundtrip differs: " + name)
	print("CATALOG_BUILT count=", Catalog.sources().size())
	quit()
