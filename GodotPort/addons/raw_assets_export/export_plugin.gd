@tool
extends EditorExportPlugin
const Catalog = preload("res://runtime/catalog_data.gd")
func _get_name() -> String: return "RawAssetLibrary"
func _export_begin(_features: PackedStringArray, _debug: bool, _path: String, _flags: int) -> void :
	include_directory("res://assets")
	include_directory("res://ui")
	for name: String in Catalog.sources(): add_file(Catalog.cache_path(name), Catalog.encode(name), false)
func include_directory(path: String) -> void :
	var directory: DirAccess = DirAccess.open(path)
	if directory == null: return
	directory.list_dir_begin()
	var name: String = directory.get_next()
	while not name.is_empty():
		if not name.begins_with("."):
			var file: String = path + "/" + name
			if directory.current_is_dir(): include_directory(file)
			elif not name.ends_with(".import"): add_file(file, FileAccess.get_file_as_bytes(file), false)
		name = directory.get_next()
	directory.list_dir_end()
