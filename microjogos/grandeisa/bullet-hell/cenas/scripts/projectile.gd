extends Area2D

const SPEED = 250.0

@export var player: Node2D
var main

var moving = false

func _ready():
	look_at(player.position)
	
func _physics_process(delta: float) -> void:
	if moving:
		position += transform.x * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		main.register_lose()
