extends Polygon2D

# Esse script serve para converter os pontos de um Polygon2D para seu nó de colisão

# Nó que receberá a informação de colisão
@export var collision_polygon : CollisionPolygon2D

func _ready():
	collision_polygon.polygon = polygon
