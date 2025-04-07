extends Area2D

const SPEED = 750.0

@export var player: Node2D

var moving = true

func _ready():
	look_at(player.position)
	
func _physics_process(delta: float) -> void:
	if moving:
		position += transform.x * SPEED * delta
