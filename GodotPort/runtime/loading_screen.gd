extends CanvasLayer
var status: Label
var progress: Control
func _init() -> void : layer = 100
func label(text: String, rect: Rect2, size: int, color: Color = Color("e9e7dc")) -> Label:
	var node: Label = Label.new();node.text = text;node.position = rect.position;node.size = rect.size;node.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;node.add_theme_font_size_override("font_size", size);node.add_theme_color_override("font_color", color);add_child(node);return node
func _ready() -> void :
	var background: ColorRect = ColorRect.new();background.color = Color("0e1112");background.size = Vector2(600, 400);add_child(background)
	var stripe: ColorRect = ColorRect.new();stripe.color = Color("a62929");stripe.position = Vector2(40, 62);stripe.size = Vector2(34, 3);add_child(stripe)
	label("ROAD OF THE DEAD 2", Rect2(40, 78, 520, 45), 32)
	label("F A N   P O R T", Rect2(40, 127, 520, 24), 14, Color("999e98"))
	var logo: TextureRect = TextureRect.new(); var image: Image = Image.new()
	if image.load_png_from_buffer(FileAccess.get_file_as_bytes("res://ui/evildog.png")) == OK:
		logo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE;logo.texture = ImageTexture.create_from_image(image);logo.position = Vector2(48, 204);logo.size = Vector2(145, 58);logo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED;add_child(logo)
	label("ORIGINAL GAME", Rect2(40, 273, 160, 18), 9, Color("747e78"))
	label("PaZoRo", Rect2(220, 217, 160, 37), 27)
	label("FAN PORT", Rect2(220, 273, 160, 18), 9, Color("747e78"))
	label(">_  CODEX", Rect2(400, 217, 160, 37), 25)
	label("DEVELOPMENT", Rect2(400, 273, 160, 18), 9, Color("747e78"))
	status = label("Loading", Rect2(40, 336, 520, 24), 12, Color("999e98"))
	progress = load("res://runtime/loading_progress.gd").new();progress.position = Vector2(40, 371);progress.size = Vector2(520, 4);add_child(progress)
