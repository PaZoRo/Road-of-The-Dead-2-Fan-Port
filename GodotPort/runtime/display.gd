extends Node2D
const R = preload("res://runtime/as_runtime.gd")
var value_ref: WeakRef
var value: Variant:
	get: return value_ref.get_ref() if value_ref != null else null
	set(object): value_ref = weakref(object) if object != null else null
var texture: Texture2D
var hit_image: Image
var offset: Vector2 = Vector2.ZERO
var own_bounds: Rect2 = Rect2()
var bounds_dirty: bool = true
var cached_bounds: Rect2 = Rect2()
static var road_shader: Shader
static var shared_road_material: ShaderMaterial
static var effect_shader: Shader
static var mask_cpu_us: int = 0
static var mask_regenerations: int = 0
var masks: Array = []
var mask_texture: Texture2D
var mask_bounds: Rect2
var mask_stamp: int = -1
var glow_margin: float = 0
var batch_commands: Array = []
var batch_bounds: Rect2 = Rect2()

var road_batch: bool = false
var road_points: PackedVector2Array = []
var road_colors: PackedColorArray = []
var road_indices: PackedInt32Array = []
var road_previous: PackedVector2Array = []
var road_surfaces: Dictionary = {}
var road_previous_surfaces: Dictionary = {}
var road_owner: int = 0
var road_tick: int = -1
var road_motion: bool = false
var road_matched: int = 0

func clear_road_batch(enabled: bool = false, owner_id: int = 0) -> void :
	if enabled and owner_id != 0 and road_owner != owner_id:
		road_surfaces = {};road_previous_surfaces = {};road_tick = -1;road_owner = owner_id
	if not enabled: road_owner = 0
	if road_batch and not enabled: RenderingServer.canvas_item_set_custom_rect(get_canvas_item(), false)
	var tick: int = Engine.get_physics_frames()
	if enabled:
		if tick != road_tick:
			road_previous_surfaces = road_surfaces if tick == road_tick + 1 else {}
			road_tick = tick
		road_surfaces = {}
	else:
		road_previous_surfaces = {};road_surfaces = {};road_tick = -1
	road_batch = enabled;road_points.clear();road_colors.clear();road_indices.clear();road_previous.clear();road_matched = 0
	var motion: bool = enabled and R.road_interpolation_enabled
	if motion != road_motion:
		road_motion = motion;update_effects()

func append_road_polygon(points: PackedVector2Array, indices: PackedInt32Array, color: Color, key: Variant = null) -> void :
	if not road_batch: return
	var start: int = road_points.size()
	road_points.append_array(points)
	var previous: PackedVector2Array = road_previous_surfaces.get(key, points)
	if previous.size() != points.size(): previous = points
	elif road_previous_surfaces.has(key): road_matched += 1
	road_previous.append_array(previous)
	road_surfaces[key] = points
	for _point in points: road_colors.append(color)
	for index in indices: road_indices.append(start + index)

func draw_road_batch(canvas: RID) -> void :
	if not road_indices.is_empty():

		var rectangle: Rect2 = Rect2(road_points[0], Vector2.ZERO)
		for point in road_points: rectangle = rectangle.expand(point)
		for point in road_previous: rectangle = rectangle.expand(point)
		RenderingServer.canvas_item_set_custom_rect(canvas, true, rectangle)
		RenderingServer.canvas_item_add_triangle_array(canvas, road_indices, road_points, road_colors, road_previous)


func _init() -> void :
	set_process(false)

func update_effects() -> void :
	var owner_value: Variant = value
	if owner_value == null: return
	if effect_shader == null:
		effect_shader = Shader.new()
		effect_shader.code = "shader_type canvas_item;\r\nglobal uniform float fan_road_fraction;\r\nuniform bool road_motion=false;\r\nuniform vec4 tint_multiply=vec4(1.0);\r\nuniform vec4 tint_add=vec4(0.0);\r\nuniform mat4 color_matrix=mat4(1.0);\r\nuniform vec4 color_offset=vec4(0.0);\r\nuniform int mask_count=0;\r\nuniform vec4 glow_color=vec4(0.0);\r\nuniform vec2 glow_radius=vec2(0.0);\r\nuniform vec2 source_uv_scale=vec2(1.0);\r\nuniform vec2 source_uv_offset=vec2(0.0);\r\nvarying vec4 vertex_color;\r\nuniform sampler2D mask_texture_0 : filter_linear, repeat_disable;\r\nuniform sampler2D mask_texture_1 : filter_linear, repeat_disable;\r\nuniform vec3 mask_x_0;uniform vec3 mask_y_0;\r\nuniform vec3 mask_x_1;uniform vec3 mask_y_1;\r\nvarying vec2 canvas_position;\r\nvoid vertex(){if(road_motion)VERTEX=mix(UV,VERTEX,fan_road_fraction);vertex_color=COLOR;canvas_position=(MODEL_MATRIX*vec4(VERTEX,0.0,1.0)).xy;}\r\nfloat mask_alpha(sampler2D image,vec3 x,vec3 y){vec2 uv=vec2(dot(vec3(canvas_position,1.0),x),dot(vec3(canvas_position,1.0),y));if(any(lessThan(uv,vec2(0.0)))||any(greaterThan(uv,vec2(1.0))))return 0.0;return texture(image,uv).a;}\r\nvoid fragment(){vec4 color=COLOR;if(glow_color.a>0.0){vec2 uv=UV*source_uv_scale+source_uv_offset;vec4 base=vec4(0.0);if(all(greaterThanEqual(uv,vec2(0.0)))&&all(lessThanEqual(uv,vec2(1.0))))base=texture(TEXTURE,uv)*vertex_color;float halo=0.0;for(int x=-1;x<=1;x++){for(int y=-1;y<=1;y++){vec2 sample_uv=uv+vec2(float(x),float(y))*glow_radius;if(all(greaterThanEqual(sample_uv,vec2(0.0)))&&all(lessThanEqual(sample_uv,vec2(1.0))))halo+=texture(TEXTURE,sample_uv).a;}}halo=clamp(halo/4.5,0.0,1.0)*glow_color.a*vertex_color.a;color=vec4(mix(glow_color.rgb,base.rgb,base.a),base.a+halo*(1.0-base.a));}float opacity=color.a;color=color*tint_multiply+tint_add*opacity;color=clamp(color_matrix*color+color_offset*opacity,vec4(0.0),vec4(1.0));if(mask_count>0)color.a*=mask_alpha(mask_texture_0,mask_x_0,mask_y_0);if(mask_count>1)color.a*=mask_alpha(mask_texture_1,mask_x_1,mask_y_1);COLOR=color;}\r\n"





















	var multiply: Vector4 = Vector4.ONE
	var add: Vector4 = Vector4.ZERO
	var cursor = owner_value
	var matrix: Projection = Projection.IDENTITY
	var matrix_offset: Vector4 = Vector4.ZERO
	var glow: Variant = null
	glow_margin = 0
	masks.clear()
	while cursor != null:
		if cursor.fields.get("@is_mask", false): multiply.w = 0
		for mask in cursor.fields.get("@timeline_masks", []):
			if mask != null and not masks.has(mask): masks.append(mask)
		var explicit = cursor.fields.get("mask")
		if explicit is R.Value and not masks.has(explicit): masks.append(explicit)
		var transform = cursor.fields.get("colorTransform")
		if transform != null:
			var m: Vector4 = Vector4(R.num(R.get_value(transform, "redMultiplier")), R.num(R.get_value(transform, "greenMultiplier")), R.num(R.get_value(transform, "blueMultiplier")), R.num(R.get_value(transform, "alphaMultiplier")))
			var a: Vector4 = Vector4(R.num(R.get_value(transform, "redOffset")), R.num(R.get_value(transform, "greenOffset")), R.num(R.get_value(transform, "blueOffset")), R.num(R.get_value(transform, "alphaOffset"))) / 255.0
			add = add * m + a;multiply *= m
		var addition: Array = cursor.fields.get("@color_add", [])
		if addition.size() >= 3: add += Vector4(addition[0], addition[1], addition[2], addition[3] if addition.size() > 3 else 0)
		for filter in cursor.fields.get("filters", []):
			if filter is R.Value and filter.class_id == "GlowFilter": glow = filter
			var coefficients = R.get_value(filter, "matrix")
			if coefficients is Array and coefficients.size() == 20:
				matrix = Projection(Vector4(coefficients[0], coefficients[5], coefficients[10], coefficients[15]), Vector4(coefficients[1], coefficients[6], coefficients[11], coefficients[16]), Vector4(coefficients[2], coefficients[7], coefficients[12], coefficients[17]), Vector4(coefficients[3], coefficients[8], coefficients[13], coefficients[18]))
				matrix_offset = Vector4(coefficients[4], coefficients[9], coefficients[14], coefficients[19]) / 255.0
		cursor = cursor.parent_value()
	if glow != null and texture is AtlasTexture: texture = R.standalone_texture(texture)
	var plain: bool = multiply == Vector4.ONE and add == Vector4.ZERO and matrix == Projection.IDENTITY and matrix_offset == Vector4.ZERO and masks.is_empty() and glow == null
	if plain and not road_motion: material = null
	elif plain:
		if road_shader == null:
			road_shader = Shader.new()
			road_shader.code = "shader_type canvas_item;\r\nrender_mode unshaded;\r\nglobal uniform float fan_road_fraction;\r\nuniform bool road_motion=true;\r\nvarying vec4 road_color;\r\nvoid vertex(){if(road_motion)VERTEX=mix(UV,VERTEX,fan_road_fraction);road_color=COLOR;}\r\nvoid fragment(){COLOR=road_color;}\r\n"







		if shared_road_material == null:
			shared_road_material = ShaderMaterial.new();shared_road_material.shader = road_shader;shared_road_material.set_shader_parameter("road_motion", true)
		material = shared_road_material
	else:
		var effect: ShaderMaterial = material as ShaderMaterial
		if effect == null or effect.shader != effect_shader: effect = ShaderMaterial.new();effect.shader = effect_shader;material = effect
		effect.set_shader_parameter("road_motion", road_motion)
		effect.set_shader_parameter("tint_multiply", multiply);effect.set_shader_parameter("tint_add", add)
		effect.set_shader_parameter("color_matrix", matrix);effect.set_shader_parameter("color_offset", matrix_offset)
		effect.set_shader_parameter("mask_count", mini(2, masks.size()))
		var glow_color: Color = Color.TRANSPARENT
		var radius: Vector2 = Vector2.ZERO; var uv_scale: Vector2 = Vector2.ONE; var uv_offset: Vector2 = Vector2.ZERO
		if glow != null and texture != null:
			var size: Vector2 = R.texture_size(texture)
			var blur: Vector2 = Vector2(R.num(glow.fields.blurX), R.num(glow.fields.blurY))
			glow_margin = maxf(blur.x, blur.y)
			glow_color = Color.hex((int(glow.fields.color) << 8) | 255);glow_color.a = clampf(R.num(glow.fields.alpha), 0, 1)
			radius = blur / size * 0.5;uv_scale = (size + Vector2.ONE * glow_margin * 2) / size;uv_offset = - Vector2.ONE * glow_margin / size
		effect.set_shader_parameter("glow_color", glow_color);effect.set_shader_parameter("glow_radius", radius)
		effect.set_shader_parameter("source_uv_scale", uv_scale);effect.set_shader_parameter("source_uv_offset", uv_offset)
	queue_redraw()
	set_process( not masks.is_empty())
	if not masks.is_empty(): update_masks()
	for child in owner_value.children: child.display.update_effects()

func _process(_delta: float) -> void :
	if is_visible_in_tree(): update_masks()

func update_masks() -> void :
	if material == null: return
	var started: int = Time.get_ticks_usec()
	for index in range(mini(2, masks.size())):
		var mask = masks[index]; var display = mask.display
		if display == null or not display.global_transform.is_finite() or absf(display.global_transform.determinant()) < 1e-06: continue
		var stamp: int = R.mask_signature(mask)
		if display.mask_texture == null or display.mask_stamp != stamp:
			mask_regenerations += 1
			display.mask_bounds = R.bounds(mask)
			var size: Vector2i = Vector2i(display.mask_bounds.size.ceil()).clamp(Vector2i.ONE, Vector2i(4096, 4096))
			var pixels: Image = Image.create(size.x, size.y, false, Image.FORMAT_RGBA8);pixels.fill(Color.TRANSPARENT)
			R.bitmap_draw_tree(pixels, mask, Transform2D(0, - display.mask_bounds.position), true)
			display.mask_texture = ImageTexture.create_from_image(pixels);display.mask_stamp = stamp
		var inverse: Transform2D = display.global_transform.affine_inverse(); var rectangle: Rect2 = display.mask_bounds
		var size: Vector2 = display.mask_texture.get_size()
		var suffix: String = str(index)
		material.set_shader_parameter("mask_texture_" + suffix, display.mask_texture)
		material.set_shader_parameter("mask_x_" + suffix, Vector3(inverse.x.x, inverse.y.x, inverse.origin.x - rectangle.position.x) / size.x)
		material.set_shader_parameter("mask_y_" + suffix, Vector3(inverse.x.y, inverse.y.y, inverse.origin.y - rectangle.position.y) / size.y)
	mask_cpu_us += Time.get_ticks_usec() - started

func invalidate_bounds() -> void :
	if bounds_dirty: return
	bounds_dirty = true
	var parent: Node = get_parent()
	if parent != null and parent.has_method("invalidate_bounds"): parent.invalidate_bounds()

func _draw() -> void :
	var value: Variant = value_ref.get_ref() if value_ref != null else null
	if value == null: return
	if value.fields.get("@fan_crosshair", false):
		var gap: float = float(value.fields.get("@fan_crosshair_gap", 3.0))
		var color: Color = Color("50ff50")
		for rectangle: Rect2 in [Rect2( - gap - 5, 0, 5, 1), Rect2(gap, 0, 5, 1), Rect2(0, - gap - 5, 1, 5), Rect2(0, gap, 1, 5)]: draw_rect(rectangle, color)
		return
	if not global_transform.is_finite(): return
	var determinant: float = global_transform.determinant()
	if not is_finite(determinant) or absf(determinant) < 1e-06 or global_transform.x.length_squared() > 1000000000000.0 or global_transform.y.length_squared() > 1000000000000.0: return



	if value.symbol == "10292" or value.symbol == "10263":
		var center: Vector2 = Vector2(-85.0, 165.0) if value.symbol == "10292" else Vector2(81.0, 83.0)
		var radius: float = 54.0 if value.symbol == "10292" else 19.0
		draw_set_transform(center, 0.0, Vector2(1.0, 0.18))
		draw_circle(Vector2.ZERO, radius, Color(0.02, 0.02, 0.02, 0.14))
		draw_set_transform(center, 0.0, Vector2(1.0, 0.095))
		draw_circle(Vector2.ZERO, radius * 0.82, Color(0.02, 0.02, 0.02, 0.25))
		draw_set_transform_matrix(Transform2D.IDENTITY)



	if value.symbol == "10503":
		draw_set_transform(Vector2(182.0, 137.0), 0.0, Vector2(1.0, 0.16))
		draw_circle(Vector2.ZERO, 142.0, Color(0.015, 0.015, 0.02, 0.12))
		draw_set_transform(Vector2(182.0, 139.0), 0.0, Vector2(1.0, 0.085))
		draw_circle(Vector2.ZERO, 120.0, Color(0.015, 0.015, 0.02, 0.16))
		draw_set_transform_matrix(Transform2D.IDENTITY)
	if value.kind == "edittext" and (value.fields.has("text") or value.fields.has("htmlText")):
		var text: String = R.string(value.fields.get("htmlText", value.fields.get("text", "")))
		if value.fields.has("htmlText"):
			text = R.html_plain(text)
		var format = value.fields.get("defaultTextFormat")
		var size: float = R.num(R.get_value(format, "size")) if format != null else R.num(value.fields.get("size", 12))
		if not is_finite(size) or size <= 0: size = R.num(value.timeline.get("size", 12))
		if not is_finite(size) or size <= 0: size = 12
		size = clampf(size, 1, 512)
		var color: Color = Color.WHITE
		var color_value = value.fields.get("textColor", R.get_value(format, "color") if format != null else null)
		if color_value != null: color = Color.hex((int(R.num(color_value)) << 8) | 255)
		elif value.fields.has("color"):
			var c = value.fields.color;color = Color(c[0], c[1], c[2], c[3])
		var font: Font = R.get_font(str(int(value.timeline.get("font", 0))))
		var x: float = own_bounds.position.x + 2
		var y: float = own_bounds.position.y + size
		var align: String = R.string(R.get_value(format, "align")) if format != null else ["left", "right", "center", "justify"][clampi(int(value.timeline.get("align", 0)), 0, 3)]
		if value.fields.has("htmlText"):
			var regex: RegEx = R.text_regex("(?i)ALIGN=[\"']([^\"']+)")
			var match_result: RegExMatch = regex.search(R.string(value.fields.htmlText))
			if match_result != null: align = match_result.get_string(1).to_lower()
		var alignment: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER if align == "center" else HORIZONTAL_ALIGNMENT_RIGHT if align == "right" else HORIZONTAL_ALIGNMENT_LEFT
		if value.fields.get("wordWrap", false): draw_multiline_string(font, Vector2(x, y), text, alignment, maxf(own_bounds.size.x, 20), int(size), -1, color)
		else:
			for line in text.split("\n"):
				draw_string(font, Vector2(x, y), line, alignment, maxf(own_bounds.size.x, 20), int(size), color)
				y += size * 1.15
	elif texture != null:
		if glow_margin > 0: draw_texture_rect(texture, Rect2(offset - Vector2.ONE * glow_margin, R.texture_size(texture) + Vector2.ONE * glow_margin * 2), false)
		else: draw_texture_rect(texture, Rect2(offset, R.texture_size(texture)), false)
	for command in batch_commands:
		draw_set_transform_matrix(command[0])
		draw_texture_rect(command[1], Rect2(command[2], R.texture_size(command[1])), false, command[3])
	if not batch_commands.is_empty(): draw_set_transform_matrix(Transform2D.IDENTITY)
	if road_batch: draw_road_batch(get_canvas_item())
	elif value.fields.has("@drawing"):
		for item in value.fields["@drawing"]:
			match item[0]:
				"polygon": draw_colored_polygon(item[1], item[2])
				"rect": draw_rect(item[1], item[2], true)
				"circle": draw_circle(item[1], item[2], item[3])
				"line": draw_line(item[1], item[2], item[3], item[4], true)

func bounds() -> Rect2:
	if not bounds_dirty: return cached_bounds
	var result: Rect2 = own_bounds
	if not batch_commands.is_empty(): result = batch_bounds if result.size == Vector2.ZERO else result.merge(batch_bounds)
	for item in value.fields.get("@drawing", []):
		var shape_bounds: Rect2 = Rect2()
		match item[0]:
			"polygon":
				for point in item[1]:
					if shape_bounds.size == Vector2.ZERO: shape_bounds = Rect2(point, Vector2(0.001, 0.001))
					else: shape_bounds = shape_bounds.expand(point)
			"rect": shape_bounds = item[1]
			"circle": shape_bounds = Rect2(item[1] - Vector2.ONE * item[2], Vector2.ONE * item[2] * 2)
			"line": shape_bounds = Rect2(item[1], item[2] - item[1]).abs().grow(item[4])
		if result.size == Vector2.ZERO: result = shape_bounds
		else: result = result.merge(shape_bounds)
	for ch in value.children:
		if ch.display == null: continue
		var b: Rect2 = R.bounds(ch)
		b = ch.display.transform * b
		if result.size == Vector2.ZERO: result = b
		else: result = result.merge(b)
	cached_bounds = result;bounds_dirty = false
	return result
