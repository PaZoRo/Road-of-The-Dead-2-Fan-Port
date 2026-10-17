extends RefCounted
const R = preload("res://runtime/as_runtime.gd")



static func eligible(node: Node) -> bool:
	if node is CanvasItem and node.get_script() != R.display_script: return false
	if node is CanvasItem and node.is_set_as_top_level(): return false
	if node is Node2D and ( not node.transform.is_finite() or node.y_sort_enabled): return false
	if node is CanvasItem and node.clip_children != CanvasItem.CLIP_CHILDREN_DISABLED: return false
	for child: Node in node.get_children():
		if child is CanvasItem and child.visible and not eligible(child): return false
	return true

static func capture(host: Node, destination: Image, source: Node2D) -> bool:
	if DisplayServer.get_name() == "headless" or not host.is_inside_tree() or destination.detect_alpha() != Image.ALPHA_NONE or not eligible(source): return false
	var viewport: SubViewport = SubViewport.new();viewport.size = destination.get_size();viewport.world_2d = World2D.new()
	viewport.transparent_bg = true;viewport.disable_3d = true
	viewport.canvas_item_default_texture_filter = host.get_viewport().canvas_item_default_texture_filter
	viewport.canvas_item_default_texture_repeat = host.get_viewport().canvas_item_default_texture_repeat
	host.add_child(viewport)
	var items: Array[RID] = []; var materials: Array[Material] = []
	var background: RID = RenderingServer.canvas_item_create();items.append(background)
	RenderingServer.canvas_item_set_interpolated(background, false)
	RenderingServer.canvas_item_set_parent(background, viewport.world_2d.canvas)
	var base: ImageTexture = ImageTexture.create_from_image(destination);base.draw(background, Vector2.ZERO)
	var content: RID = append_display(source, viewport.world_2d.canvas, items, true, materials)
	RenderingServer.canvas_item_set_draw_index(background, 0);RenderingServer.canvas_item_set_draw_index(content, 1)
	viewport.render_target_update_mode = SubViewport.UPDATE_ONCE
	RenderingServer.force_draw(false)
	var result: Image = viewport.get_texture().get_image()
	var valid: bool = result != null and not result.is_empty() and result.get_size() == destination.get_size()
	if valid:
		if result.get_format() != Image.FORMAT_RGBA8: result.convert(Image.FORMAT_RGBA8)
		destination.copy_from(result)
	for index in range(items.size() - 1, -1, -1): RenderingServer.free_rid(items[index])
	materials.clear()
	viewport.free()
	return valid

static func append_display(display: Node2D, parent: RID, items: Array[RID], library_root: bool = false, materials: Array[Material] = []) -> RID:
	var item: RID = RenderingServer.canvas_item_create();items.append(item)
	RenderingServer.canvas_item_set_interpolated(item, false)
	RenderingServer.canvas_item_set_parent(item, parent)
	RenderingServer.canvas_item_set_transform(item, Transform2D.IDENTITY if library_root else display.transform)
	RenderingServer.canvas_item_set_modulate(item, Color.WHITE if library_root else display.modulate)
	RenderingServer.canvas_item_set_self_modulate(item, display.self_modulate)
	RenderingServer.canvas_item_set_z_index(item, display.z_index)
	RenderingServer.canvas_item_set_z_as_relative_to_parent(item, display.z_as_relative)
	RenderingServer.canvas_item_set_draw_behind_parent(item, display.show_behind_parent)
	RenderingServer.canvas_item_set_use_parent_material(item, display.use_parent_material)
	RenderingServer.canvas_item_set_default_texture_filter(item, int(display.texture_filter))
	RenderingServer.canvas_item_set_default_texture_repeat(item, int(display.texture_repeat))
	if display.material != null:


		var effect: Material = display.material
		if display.road_motion:
			effect = effect.duplicate();effect.set_shader_parameter("road_motion", false)
		RenderingServer.canvas_item_set_material(item, effect.get_rid())
		materials.append(effect)
	draw_content(display, item)
	if display.value.fields.get("@fan_crosshair", false): return item
	var index: int = 0
	for child: Node in display.get_children():
		if child is CanvasItem and child.visible:
			var child_item: RID = append_display(child, item, items, false, materials)
			RenderingServer.canvas_item_set_draw_index(child_item, index);index += 1
	return item

static func draw_content(display: Node2D, canvas: RID) -> void :
	if display.value.fields.get("@fan_crosshair", false):
		var gap: float = float(display.value.fields.get("@fan_crosshair_gap", 3.0))
		for rectangle: Rect2 in [Rect2( - gap - 5, 0, 5, 1), Rect2(gap, 0, 5, 1), Rect2(0, - gap - 5, 1, 5), Rect2(0, gap, 1, 5)]: RenderingServer.canvas_item_add_rect(canvas, rectangle, Color("50ff50"))
		return
	var value: Variant = display.value
	if value == null: return
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
		var x: float = display.own_bounds.position.x + 2
		var y: float = display.own_bounds.position.y + size
		var align: String = R.string(R.get_value(format, "align")) if format != null else ["left", "right", "center", "justify"][clampi(int(value.timeline.get("align", 0)), 0, 3)]
		if value.fields.has("htmlText"):
			var regex: RegEx = R.text_regex("(?i)ALIGN=[\"']([^\"']+)")
			var match_result: RegExMatch = regex.search(R.string(value.fields.htmlText))
			if match_result != null: align = match_result.get_string(1).to_lower()
		var alignment: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER if align == "center" else HORIZONTAL_ALIGNMENT_RIGHT if align == "right" else HORIZONTAL_ALIGNMENT_LEFT
		if value.fields.get("wordWrap", false): font.draw_multiline_string(canvas, Vector2(x, y), text, alignment, maxf(display.own_bounds.size.x, 20), int(size), -1, color)
		else:
			for line in text.split("\n"):
				font.draw_string(canvas, Vector2(x, y), line, alignment, maxf(display.own_bounds.size.x, 20), int(size), color)
				y += size * 1.15
	elif display.texture != null:
		if display.glow_margin > 0: display.texture.draw_rect(canvas, Rect2(display.offset - Vector2.ONE * display.glow_margin, R.texture_size(display.texture) + Vector2.ONE * display.glow_margin * 2), false)
		else: display.texture.draw_rect(canvas, Rect2(display.offset, R.texture_size(display.texture)), false)
	for command in display.batch_commands:
		RenderingServer.canvas_item_add_set_transform(canvas, command[0])
		(command[1] as Texture2D).draw_rect(canvas, Rect2(command[2], R.texture_size(command[1])), false, command[3])
	if not display.batch_commands.is_empty(): RenderingServer.canvas_item_add_set_transform(canvas, Transform2D.IDENTITY)
	if display.road_batch: display.draw_road_batch(canvas)
	elif value.fields.has("@drawing"):
		for item in value.fields["@drawing"]:
			match item[0]:
				"polygon": RenderingServer.canvas_item_add_polygon(canvas, item[1], PackedColorArray([item[2]]))
				"rect": RenderingServer.canvas_item_add_rect(canvas, item[1], item[2])
				"circle": RenderingServer.canvas_item_add_circle(canvas, item[1], item[2], item[3])
				"line": RenderingServer.canvas_item_add_line(canvas, item[1], item[2], item[3], item[4], true)
