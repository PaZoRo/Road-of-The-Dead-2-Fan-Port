@tool
extends EditorPlugin
var exporter: EditorExportPlugin
func _enter_tree() -> void :
	exporter = preload("res://addons/raw_assets_export/export_plugin.gd").new()
	add_export_plugin(exporter)
func _exit_tree() -> void :
	if exporter != null: remove_export_plugin(exporter)
