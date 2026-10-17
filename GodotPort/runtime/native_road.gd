extends RefCounted
const V = preload("res://runtime/as_value.gd")



static var street_types: Dictionary = {}

static func perlin(world: Dictionary, z: float, vertical: bool = false) -> float:
	if not world.m_bCurvyRoads: return 0.0
	var track: Array = world.m_PerlinYTrack if vertical else world.m_PerlinXTrack
	if track.is_empty(): return 0.0
	var position: float = z - world.m_iPerlinTrackPosition
	var index: int = maxi(0, int(floor(position)))
	return lerpf(float(track[mini(index, track.size() - 1)]), float(track[mini(index + 1, track.size() - 1)]), position - floor(position))

static func precompute(road: V, camera: V, settings: Dictionary, world: Dictionary, viewport: Dictionary, capture: bool = false) -> Array:
	if street_types.is_empty():
		for name in ["Town", "Park", "Cemetery", "Parking", "PavementAndGrass", "GrassAndPavement", "CrossingStreet", "ForestPath", "Dirt", "Sand", "Concrete", "Snow", "Ice", "DirtAndGrass", "GrassAndDirt", "CrossingDirtRoad", "GrassAndRoad", "DirtAndRoad", "DirtAndPavement", "PavementAndDirt", "Mud", "SnowAndRoad", "SnowAndPavement", "PavementAndSnow", "SnowAndDirtPath"]:
			street_types[int(settings["SliceType_" + name])] = true
	var r: Dictionary = road.fields; var c: Dictionary = camera.fields
	var location: Dictionary = (c.m_vLocation as V).fields
	var pattern: bool = r.m_iMode == settings.Mode_Pattern
	var camera_z: float = location.Z if pattern else maxf(location.Z, 0)
	var offset: float = camera_z if pattern else fmod(camera_z, settings.RenderStepSize)
	var matrix: Transform3D = (c.m_RotationMatrix as V).native
	var eye: Vector2 = Vector2(location.X, location.Y)
	var ramp_distance: float = c.m_fRampDistance; var ramp_factor: float = c.m_fRampFactor
	var lens: Vector2 = Vector2(c.m_fRenderDistX, c.m_fRenderDistY)
	var screen: Vector2 = Vector2(viewport.m_iHalfWidth, viewport.m_iHalfHeight)
	var transformed: V = r.m_vTransformedLocation
	var last_transformed: Vector3 = Vector3.ZERO
	var projected: bool = false
	var wall_height: float = settings.WallHeight
	var slices: Array = r.m_RoadSlices
	var xs: Array = [
		[ - settings.FarWallPosX, - settings.FarWallPosX, - settings.SideWalkPosX, - settings.StreetPosX, settings.StreetPosX, settings.SideWalkPosX, settings.FarWallPosX, settings.FarWallPosX], 
		[ - settings.FarWallPosX, - settings.FarWallPosX, - settings.AlleywayPosX, - settings.AlleywayPosX, settings.AlleywayPosX, settings.AlleywayPosX, settings.FarWallPosX, settings.FarWallPosX], 
		[ - settings.SideRoadPosX, - settings.SideRoadPosX, - settings.RoadPosX, settings.RoadPosX, settings.SideRoadPosX, settings.SideRoadPosX]]
	var heights: Array = [[1, 0, 0, 0, 0, 0, 0, 1], [1, 0, 1, 0, 0, 1, 0, 1], [1, 0, 0, 0, 0, 1]]
	var layers: Array = [settings.Layer_Main, settings.Layer_Alleyway, settings.Layer_Highway]
	var captured: Array = [[], [], []] if capture else []
	var depths: PackedFloat64Array = []
	if capture:
		depths.resize(int(settings.NbRenderSteps) + 1)
		for layer: int in layers: captured[layer].resize(int(settings.NbRenderSteps) + 1)
	for i in range(int(settings.NbRenderSteps) + 1):
		var z: float = clampf(i * settings.RenderStepSize - offset, settings.NearPos, settings.FarPos)
		if capture: depths[i] = z
		var px: float = perlin(world, location.Z + z); var py: float = perlin(world, location.Z + z, true)
		var enabled: int = 4
		if not slices.is_empty():
			var current: int = int(slices[i]) if i < slices.size() and slices[i] != null else 0
			var previous: int = int(slices[i - 1]) if i > 0 and i - 1 < slices.size() and slices[i - 1] != null else int(settings.SliceType_None)
			var next: int = int(slices[i + 1]) if i < slices.size() - 1 and slices[i + 1] != null else int(settings.SliceType_None)
			enabled = 0
			if street_types.has(current) or street_types.has(previous) or current != settings.SliceType_Highway and next == settings.SliceType_Highway: enabled |= 1
			if current == settings.SliceType_Alleyway or previous == settings.SliceType_Alleyway: enabled |= 2
			if current == settings.SliceType_Highway or previous == settings.SliceType_Highway: enabled |= 4
		for layer_index in range(3):
			if (enabled & (1 << layer_index)) == 0: continue
			var layer: int = layers[layer_index]
			var points3d: Array = r.m_Rendered3DVectors[layer][i]
			var points2d: Array = r.m_Rendered2DVectors[layer][i]
			var row: PackedFloat64Array = []
			if capture: row.resize(xs[layer_index].size() * 2)
			for j in range(xs[layer_index].size()):
				var input: V = points3d[j]; var point: Dictionary = input.fields
				point.X = float(xs[layer_index][j]) + px;point.Y = float(heights[layer_index][j]) * wall_height + py;point.Z = z
				var vector: Vector3 = matrix * Vector3(point.X - eye.x, point.Y - eye.y + z / ramp_distance * ramp_factor, z)
				vector.z = maxf(vector.z, 0.1)
				var target: V = points2d[j]; var output: Dictionary = target.fields
				var screen_x: float = vector.x * lens.x / vector.z + screen.x
				var screen_y: float = - vector.y * lens.y / vector.z + screen.y
				output.X = screen_x;output.Y = screen_y
				if capture: row[j * 2] = screen_x;row[j * 2 + 1] = screen_y
				last_transformed = vector;projected = true
			if capture: captured[layer][i] = row


	if projected and transformed != null:
		transformed.fields.x = last_transformed.x;transformed.fields.y = last_transformed.y;transformed.fields.z = last_transformed.z
	return [captured, depths] if capture else []
