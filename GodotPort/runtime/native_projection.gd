extends RefCounted
const V = preload("res://runtime/as_value.gd")
const R = preload("res://runtime/as_runtime.gd")

static func render_world(world: V, camera: V) -> void :
	var c: Dictionary = camera.fields; var camera_location: V = c.m_vLocation; var origin: Dictionary = camera_location.fields
	var game: V = R.statics.BasicGame.Instance; var viewport_object: V = game.fields.m_Viewport; var viewport: Dictionary = viewport_object.fields
	var eye_x: float = origin.X; var eye_y: float = origin.Y; var eye_z: float = origin.Z
	var screen: Vector2 = Vector2(viewport.m_iHalfWidth, viewport.m_iHalfHeight)
	var lens: Vector2 = Vector2(c.m_fRenderDistX, c.m_fRenderDistY)
	var curve_object: V = c.m_RotationMatrix; var straight_object: V = c.m_RotationMatrixPreCurve
	var curve: Transform3D = curve_object.native; var straight: Transform3D = straight_object.native
	var ramp: float = c.m_fRampFactor / c.m_fRampDistance
	var max_view: float = c.m_fMaxViewDistance; var fog_start: float = c.m_fFogDistance - c.m_fFogRange; var fog_range: float = c.m_fFogRange; var render_scale: float = c.m_fRenderScale
	var scratch: V = c.m_vTransformedLocation
	var entities: Array = world.fields.m_Entities
	for node: V in entities:
		var entity: V = node.fields.m_Entity
		var staged: R.Value = entity.fields.get("m_MainMC")
		if staged != null and staged.fields.get("@section_pending", false): staged.display.visible = false;staged.render_visible = false;continue
		if entity.behavior_class != entity.class_id: R.entity_behavior(entity)
		if entity.behavior_render_empty: continue
		if entity.behavior_render != "RDEntity": R.run_method(entity, entity.behavior_render, "Render", [camera]);continue
		var e: Dictionary = entity.fields; var entity_location: V = e.m_vLocation; var location: Dictionary = entity_location.fields
		var distance: float = location.Z - eye_z; var main: V = e.m_MainMC; var display: Node2D = main.display
		if not main.projection_root_is_self: R.bind_projection_scope(main, weakref(main))
		if distance > max_view or distance > e.m_fFadeDistance + e.m_fFadeRange or e.m_bIsPlayer and distance < 1 or not e.m_bIsPlayer and distance <= 1:
			display.visible = false;main.render_visible = false;continue
		var was_visible: bool = display.visible;display.visible = true
		var local: Vector3 = Vector3(location.X - eye_x, location.Y - eye_y + distance * ramp, distance)
		var height: float = e.m_fHeight; var matrix: Transform3D = curve if e.m_bUseCurvyCamera else straight
		var bottom: Vector3 = matrix * local; var top: Vector3 = matrix * (local + Vector3(0, height, 0))
		var inv_bottom: float = 1.0 / bottom.z if bottom.z != 0 else INF; var inv_top: float = 1.0 / top.z if top.z != 0 else INF
		var point: Vector2 = Vector2(bottom.x * lens.x, - bottom.y * lens.y) * inv_bottom + screen
		var top_point: Vector2 = Vector2(top.x * lens.x, - top.y * lens.y) * inv_top + screen
		var projected_object: V = e.m_vProjLocation; var projected: Dictionary = projected_object.fields;projected.X = point.x;projected.Y = point.y
		var projected_top_object: V = e.m_vProjTopLocation; var projected_top: Dictionary = projected_top_object.fields;projected_top.X = top_point.x;projected_top.Y = top_point.y
		var top_location_object: V = e.m_vTopLocation; var top_location: Dictionary = top_location_object.fields;top_location.X = location.X;top_location.Y = location.Y + height;top_location.Z = location.Z
		if scratch != null: scratch.fields.x = top.x;scratch.fields.y = top.y;scratch.fields.z = top.z
		var scale: float = - e.m_fScale * (top_point.y - point.y) / height if height != 0 else 0.0
		scale = e.m_fMinRenderScale + scale * render_scale * (1 - e.m_fMinRenderScale)
		if not is_finite(scale) or absf(scale) > 1000000 or not point.is_finite(): display.visible = false;continue
		display.position = point;display.scale = Vector2( - scale if e.m_bFlippedX else scale, scale)
		var start: float = minf(fog_start, e.m_fFadeDistance); var span: float = minf(fog_range, e.m_fFadeRange)
		display.modulate.a = 1 - clampf((distance - start) / span if span != 0 else 1 if distance > start else 0, 0, 1)
		main.render_visible = display.modulate.a > 0.0
		if not was_visible or not main.fields.get("@projected", false): display.reset_physics_interpolation();main.fields["@projected"] = true
		var parent: Node = display.get_parent()
		if parent != null and parent.has_method("invalidate_bounds"): parent.invalidate_bounds()
