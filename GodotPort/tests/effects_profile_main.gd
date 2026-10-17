extends "res://runtime/main.gd"
func initialize_runtime() -> void:
	R.initialize(self)
	if OS.get_cmdline_user_args().has("--original-bundle-layout"):
		R.source_bundle_classes=JSON.parse_string(FileAccess.get_file_as_string("res://tests/previous_bundles/source_bundles.json")).classes
		for group:String in ["actors","game","interface","utilities"]:R.source_bundle_scripts[group]=load("res://tests/previous_bundles/source_"+group+".gd")
	R.display_script=load("res://tests/profile_display.gd")
	seed(20261009)
	cinematic_audio=AudioStreamPlayer.new();cinematic_audio.name="CinematicAudio";$Audio.add_child(cinematic_audio)
	R.set_value(R.klass("BasicGame"),"m_iAPI",1)
	R.root=R.construct(R.klass("RoadOfTheDead_fla.MainTimeline"),[])
	R.add_child(R.stage,R.root);R.goto_frame(R.root,43,false)
