extends SceneTree
const R=preload("res://runtime/as_runtime.gd")
var failures:Array=[]

func _initialize() -> void:call_deferred("run")

func run() -> void:
	var host:Node=Node2D.new();root.add_child(host);R.initialize(host)
	var game:R.Value=R.construct(R.klass("BasicGame"),[R.construct(R.klass("MovieClip"),[])])
	R.call_member(game,"Init",[]);game.fields.m_GameSFXSoundGroup=null;R.statics.RDGame={"Instance":game}
	var road:R.Value=R.construct(R.klass("RDRoad"),[])
	var camera:R.Value=R.construct(R.klass("RDCamera"),[])
	var mc:R.Value=R.construct(R.klass("MovieClip"),[])
	road.fields.m_Rendered2DVectors=[];road.fields.m_Rendered3DVectors=[]
	for layer in 3:
		var rows2:Array=[];var rows3:Array=[]
		for z in 4:
			var row2:Array=[];var row3:Array=[]
			for x in 8:
				row2.append(R.construct(R.klass("DTVector2D"),[x*15.0+z*3.0,200.0-z*20.0+layer*13.0+x*x*0.3]))
				row3.append(R.construct(R.klass("DTVector3D"),[float(x),float(layer),z*R.statics.RDRoad.RenderStepSize]))
			rows2.append(row2);rows3.append(row3)
		road.fields.m_Rendered2DVectors.append(rows2);road.fields.m_Rendered3DVectors.append(rows3)
	var cases:int=0
	for fog in [-5.0,0.0,5.0,50.0,200.0]:
		camera.fields.m_fFogDistance=fog;camera.fields.m_fMaxViewDistance=100.0
		for layer in 3:
			for z in 3:
				for kind in ["RenderGround","RenderSideWall","RenderFrontWall"]:
					for pair in [[0,1],[1,2],[2,5],[6,7]]:
						var args:Array=[z,pair[0],pair[1],layer,camera,mc]
						if kind=="RenderFrontWall":args=[z,pair[0],pair[1],pair[0]+1,mini(7,pair[1]+1),layer,camera,mc]
						var source_color:Dictionary={"R":183,"G":91,"B":43,"A":219}
						road.fields.m_RenderColor.fields=source_color.duplicate();road.fields.m_iRenderColor=0xb75b2b
						R.native_clear_graphics(mc);R.source_method(road,"RDRoad",kind,args)
						var expected:Array=mc.fields.get("@drawing",[]).duplicate(true)
						var expected_color:Dictionary=road.fields.m_RenderColor.fields.duplicate()
						var expected_integer:int=road.fields.m_iRenderColor
						road.fields.m_RenderColor.fields=source_color.duplicate();road.fields.m_iRenderColor=0xb75b2b
						R.native_clear_graphics(mc);R.fast_road_quad(road,kind,args)
						if mc.fields.get("@drawing",[])!=expected or road.fields.m_RenderColor.fields!=expected_color or road.fields.m_iRenderColor!=expected_integer:
							failures.append(kind+" fog="+str(fog)+" layer="+str(layer)+" z="+str(z)+" pair="+str(pair))
						cases+=1
	print("TEST_ROAD_SURFACE_COMPLETE cases="+str(cases)+" failures="+str(failures))
	R.cleanup();host.queue_free();quit(0 if failures.is_empty() else 1)
