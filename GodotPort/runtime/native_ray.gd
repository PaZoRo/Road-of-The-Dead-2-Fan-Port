extends RefCounted
const V = preload("res://runtime/as_value.gd")



static func triangle(_receiver: Variant, a: Array) -> bool:
	if a.size() < 6: return false
	var ray: Dictionary = (a[0] as V).fields
	var direction: Dictionary = (a[1] as V).fields
	var p1: Dictionary = (a[2] as V).fields
	var p2: Dictionary = (a[3] as V).fields
	var p3: Dictionary = (a[4] as V).fields
	var result: Dictionary = (a[5] as V).fields
	var origin: = Vector3(float(ray.X), float(ray.Y), float(ray.Z))
	var dir: = Vector3(float(direction.X), float(direction.Y), float(direction.Z))
	var corner: = Vector3(float(p1.X), float(p1.Y), float(p1.Z))
	var u: = Vector3(float(p2.X), float(p2.Y), float(p2.Z)) - corner
	var v: = Vector3(float(p3.X), float(p3.Y), float(p3.Z)) - corner
	var n: = u.cross(v)
	if n.x == 0.0 and n.y == 0.0 and n.z == 0.0: return false
	var w0: = origin - corner
	var numerator: float = - n.dot(w0)
	var denominator: float = n.dot(dir)
	if absf(denominator) < 1e-08: return false
	var distance: float = numerator / denominator
	if distance < 0: return false
	var intersection: Vector3 = origin + dir * distance
	result.X = intersection.x;result.Y = intersection.y;result.Z = intersection.z
	var uu: float = u.dot(u); var uv: float = u.dot(v); var vv: float = v.dot(v)
	var w: Vector3 = intersection - corner
	var wu: float = w.dot(u); var wv: float = w.dot(v)
	var d: float = uv * uv - uu * vv
	var s: float = (uv * wv - vv * wu) / d
	if s < 0 or s > 1: return false
	var t: float = (uv * wu - uu * wv) / d
	return not (t < 0 or s + t > 1)

static func quad(_receiver: Variant, a: Array) -> bool:
	if a.size() < 7: return false
	var triangle_a: Array = [a[0], a[1], a[2], a[3], a[4], a[6]]
	if triangle(null, triangle_a): return true
	return triangle(null, [a[0], a[1], a[4], a[3], a[5], a[6]])
