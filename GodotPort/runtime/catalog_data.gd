@tool
extends RefCounted

const VERSION: int = 1
const SOURCES: Array[String] = ["native_hotpaths", "source_bundles", "classes", "native_initializers", "assets", "texture_atlas"]

static func sources() -> Array[String]:
	var result: Array[String] = SOURCES.duplicate()
	var directory: DirAccess = DirAccess.open("res://data/timelines")
	if directory != null:
		for file: String in directory.get_files():
			if file.ends_with(".json"): result.append("timelines/" + file.trim_suffix(".json"))
	return result

static func valid_payload(cached: Variant, digest: String) -> Variant:
	if cached is Array and cached.size() == 3 and cached[0] == VERSION and cached[1] == digest and cached[2] is Dictionary: return cached[2]
	return null

static func read_path(source: String, allow_cache: bool = true) -> Dictionary:
	if source.begins_with("res://data/") and source.ends_with(".json"): return read(source.trim_prefix("res://data/").trim_suffix(".json"), allow_cache)
	return JSON.parse_string(FileAccess.get_file_as_string(source))

static func cache_path(name: String) -> String: return "res://data/cache/" + name + ".bin"

static func encode(name: String) -> PackedByteArray:
	var source: String = "res://data/" + name + ".json"
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string(source))
	assert (data is Dictionary, "Invalid game catalog: " + source)
	return var_to_bytes([VERSION, FileAccess.get_sha256(source), data])

static func read(name: String, allow_cache: bool = true) -> Dictionary:
	var source: String = "res://data/" + name + ".json"
	var path: String = cache_path(name)
	if allow_cache and FileAccess.file_exists(path):
		var cached: Variant = bytes_to_var(FileAccess.get_file_as_bytes(path))


		var digest: String = FileAccess.get_sha256(source) if OS.has_feature("editor") else (str(cached[1]) if cached is Array and cached.size() == 3 else "")
		var data: Variant = valid_payload(cached, digest)
		if data != null: return data
	return JSON.parse_string(FileAccess.get_file_as_string(source))

static func read_base_catalogs(allow_cache: bool = true) -> Dictionary:
	var began: int = Time.get_ticks_usec(); var catalogs: Dictionary = {}
	for name: String in SOURCES: catalogs[name] = read(name, allow_cache)
	return {"catalogs": catalogs, "read_us": Time.get_ticks_usec() - began}
