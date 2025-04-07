extends Area2D

const SPEED = 250.0

@export var player: Node2D
var main

var moving = false

@onready var animator = $AnimationPlayer

func _ready():
	animator.play("start")
	
func _physics_process(delta: float) -> void:
	if main.game_ended:
		moving = false
		return
	if moving:
		position += transform.x * SPEED * delta
	if animator.current_animation == "start":
		look_at(player.position)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		main.register_lose()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		moving = true
		animator.play("default")
		
