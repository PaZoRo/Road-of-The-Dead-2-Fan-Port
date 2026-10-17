extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]
func _initialize() -> void:call_deferred("run")
func expect(condition:bool,label:String) -> void:
	if not condition:failures.append(label);push_error("ASSERTION_FAILED "+label)
func equal_number(a:float,b:float) -> bool:return is_nan(a) and is_nan(b) or a==b or is_equal_approx(a,b)

func make_sound(manual:bool,finished:bool,degenerate:bool) -> R.Value:
	var sound:R.Value=R.construct(R.klass("DTSpacialSound"),[null,0.0 if degenerate else 5.0,0.0 if degenerate else 20.0,0.0 if degenerate else 5.0,0.0 if degenerate else 20.0])
	sound.fields.m_fMaxVolume=0.7;sound.fields.m_fPan=0.25;sound.fields.m_bAttached=true;sound.fields.m_bManualPan=manual
	if not finished:sound.fields.m_SoundChannel=R.construct(R.klass("SoundChannel"),[])
	return sound

func run() -> void:
	var host:Node2D=Node2D.new();root.add_child(host);R.initialize(host)
	R.ensure_statics("RDWorld")
	var game:R.Value=R.Value.new();var mode:R.Value=R.Value.new();var camera:R.Value=R.Value.new()
	var listener:R.Value=R.construct(R.klass("DTVector3D"),[3.0,0.0,5.0]);camera.fields.m_vLocation=listener
	mode.fields.m_Camera=camera;game.fields.m_CurrentGameMode=mode;R.statics.RDGame={"Instance":game}
	R.statics.RDWorld.m_PerlinXTrack=[0.0,2.0,-3.0,4.0,5.0,0.0,6.0,-2.0];R.statics.RDWorld.m_iPerlinTrackPosition=0
	var cases:int=0
	for curved in [false,true]:
		R.statics.RDWorld.m_bCurvyRoads=curved
		for distance in [-30.0,-5.0,0.0,5.0,10.0,20.0,40.0,NAN]:
			for side in [-30.0,-5.0,0.0,5.0,20.0,30.0]:
				if is_nan(distance) and curved:continue
				for manual in [false,true]:
					for degenerate in [false,true]:
						var snapshots:Array=[]
						for native in [false,true]:
							var entity:R.Value=R.Value.new();entity.class_id="RDEntity"
							entity.fields.m_vLocation=R.construct(R.klass("DTVector3D"),[listener.fields.X+side,0.0,listener.fields.Z+distance])
							entity.fields.m_fBackSoundDistanceMultiplier=2.0
							var sounds:Array=[make_sound(manual,true,degenerate),make_sound(manual,false,degenerate),make_sound(manual,true,degenerate)]
							var finished:R.Value=sounds[0];var active:R.Value=sounds[1];var trailing:R.Value=sounds[2]
							entity.fields.m_AttachedSounds=sounds
							if native:R.fast_attached_sounds(entity)
							else:R.source_method(entity,"RDEntity","UpdateAttachedSounds",[])
							snapshots.append([sounds.size(),finished.fields.m_bAttached,active.fields.m_bAttached,trailing.fields.m_bAttached,active.fields.m_fVolume,active.fields.m_fPan])
						var before:Array=snapshots[0];var after:Array=snapshots[1]
						expect(before.slice(0,4)==after.slice(0,4) and equal_number(before[4],after[4]) and equal_number(before[5],after[5]),"spatial audio curve="+str(curved)+" distance="+str(distance)+" side="+str(side)+" manual="+str(manual)+" degenerate="+str(degenerate))
						cases+=1
	print("TEST_SPATIAL_AUDIO_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();await process_frame;quit(1 if not failures.is_empty() else 0)
