extends Control
var value: float = 0.0:
	set(next): value = clampf(next, 0.0, 100.0);queue_redraw()
func _draw() -> void :
	draw_rect(Rect2(Vector2.ZERO, size), Color("252c2a"))
	draw_rect(Rect2(Vector2.ZERO, Vector2(size.x * value / 100.0, size.y)), Color("b63c32"))
