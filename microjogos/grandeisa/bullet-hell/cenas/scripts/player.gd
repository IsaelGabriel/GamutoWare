extends CharacterBody2D

@export var speed: float = 500.0

func _physics_process(delta: float) -> void:
	var dir = Input.get_vector("esquerda", "direita", "cima", "baixo")
	
	velocity = speed * dir
	
	move_and_slide()
