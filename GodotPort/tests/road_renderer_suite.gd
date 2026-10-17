extends "res://tests/native_performance_suite.gd"
func state(road:R.Value) -> Dictionary:
 var r:Dictionary=road.fields;var scratch:Array=[];var types:Array=[]
 for name in ["m_vRenderVec2D1","m_vRenderVec2D2","m_vRenderVec2D3","m_vRenderVec2D4"]:
  var point:R.Value=r[name];scratch.append([point.get_instance_id(),point.fields.duplicate()])
 for group in ["m_RoadSliceEntities","m_RoadSliceGroundEntities"]:
  var row:Array=[]
  for slice:R.Value in r[group]:row.append([slice.get_instance_id(),slice.fields.get("m_iType"),slice.fields.get("m_iNextType")])
  types.append(row)
 return {"drawing":road_drawing(road),"projection":points(road),"scratch":scratch,"types":types,"color":r.m_RenderColor.fields.duplicate(),"integer":r.m_iRenderColor,"near":r.m_fRenderNearPosX,"far":r.m_fRenderFarPosX}
func run() -> void:
 var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
 var game:R.Value=R.construct(R.klass("BasicGame"),[R.construct(R.klass("MovieClip"),[])]);R.call_member(game,"Init",[]);game.fields.m_GameSFXSoundGroup=null;R.statics.RDGame={"Instance":game}
 var road:R.Value=R.construct(R.klass("RDRoad"),[]);var camera:R.Value=R.construct(R.klass("RDCamera"),[]);var settings:Dictionary=R.statics.RDRoad
 R.ensure_statics("RDWorld");var world:Dictionary=R.statics.RDWorld;world.m_bCurvyRoads=true;world.m_iPerlinTrackPosition=0;world.m_PerlinXTrack=[];world.m_PerlinYTrack=[]
 for i in 1000:world.m_PerlinXTrack.append(sin(i*0.02)*2);world.m_PerlinYTrack.append(cos(i*0.013)*0.3)
 road.fields.m_MC=R.construct(R.klass("MovieClip"),[])
 for i in range(int(settings.NbRenderSteps)+1):
  for group in ["m_RoadSliceEntities","m_RoadSliceGroundEntities"]:
   var slice:R.Value=R.Value.new();slice.class_id="RDRoadSlice";slice.fields={"m_MC":R.construct(R.klass("MovieClip"),[]),"m_vLocation":R.construct(R.klass("DTVector3D"),[0,0,i*settings.RenderStepSize]),"m_EntityNode":null};road.fields[group].append(slice)
 var types:Array=[]
 for key in settings:
  if key.begins_with("SliceType_"):types.append(settings[key])
 var cases:int=0
 for mode in [settings.Mode_Normal,settings.Mode_Pattern]:
  road.fields.m_iMode=mode
  for fog in [-5.0,50.0,300.0]:
   camera.fields.m_fFogDistance=fog;camera.fields.m_fMaxViewDistance=200.0
   for lava in [false,true]:
    for type in types:
     camera.fields.m_vLocation.fields={"X":0.4,"Y":1.3,"Z":0.0 if cases%2==0 else 37.1}
     camera.fields.m_RotationMatrix.native=Transform3D(Basis.from_euler(Vector3(0.07,0.05,0.02)),Vector3.ZERO)
     road.fields.m_iCurrentRoadSlice=int(floor(camera.fields.m_vLocation.fields.Z/settings.RenderStepSize));road.fields.m_RoadSlices=[];road.fields.m_LavaRoadSlices=[]
     for i in range(int(settings.NbRenderSteps)+1):road.fields.m_RoadSlices.append(type if i%3==0 else settings.SliceType_Alleyway if i%3==1 else settings.SliceType_Highway);road.fields.m_LavaRoadSlices.append(lava)
     R.source_method(road,"RDRoad","Render",[camera]);var expected:Dictionary=state(road)
     R.fast_road_render(road,[camera]);expect(state(road)==expected,"complete road drawing/state mode="+str(mode)+" fog="+str(fog)+" lava="+str(lava)+" type="+str(type));cases+=1
 for fog in [-5.0,50.0,300.0]:
  for z in [-2.0,0.0,37.1,200.5]:
   road.fields.m_iMode=settings.Mode_Normal;road.fields.m_RoadSlices=[];road.fields.m_LavaRoadSlices=[];road.fields.m_iCurrentRoadSlice=int(floor(maxf(z,0)/settings.RenderStepSize));camera.fields.m_vLocation.fields.Z=z;camera.fields.m_fFogDistance=fog
   R.source_method(road,"RDRoad","Render",[camera]);var expected:Dictionary=state(road);R.fast_road_render(road,[camera]);expect(state(road)==expected,"empty highway fog="+str(fog)+" z="+str(z));cases+=1
 print("TEST_ROAD_RENDERER_COMPLETE cases="+str(cases)+" failures="+str(failures)+" warnings="+str(R.warnings))
 var failed:bool=not failures.is_empty() or not R.warnings.is_empty();R.cleanup();host.queue_free();await process_frame;quit(1 if failed else 0)
