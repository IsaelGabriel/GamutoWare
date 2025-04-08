extends Node2D

# Declaração dos sinais win e lose

signal win
signal lose

# Estas constantes são usadas para determinar o tamanho da tela do seu jogo. Por padrão, definem uma
# tela 1920x1080, que é padrão para monitores full HD. Caso você queira uma resolução menor para 
# atingir uma estética mais pixelada, você pode mudar estes números para qualquer outra resolução 
# 16:9
const WIDTH = 1920
const HEIGHT = 1080

var projectile_prefab = preload("res://microjogos/grandeisa/bullet-hell/cenas/projectile.tscn")

@export var projectile_generation_radius: float = 64
@export var player : Node2D
@export var bounds: Node2D

var game_ended = false

# --------------------------------------------------------------------------------------------------
# FUNÇÕES PADRÃO
# --------------------------------------------------------------------------------------------------

# Esta função é chamada assim que esta cena é instanciada, ou seja, assim que seu minigame inicia
func _ready():
	generate_projectile()
	
func generate_projectile():
	var angle = randf() * 2 * PI
	var projectile = projectile_prefab.instantiate()
	projectile.position = Vector2(projectile_generation_radius, 0).rotated(angle)
	projectile.position += bounds.position
	projectile.player = player
	projectile.main = self
	add_child(projectile)
	
# Chame esta função para registrar que o jogador venceu o jogo
func register_win():
	game_ended = true
	emit_signal("win")


# Chame esta função para registrar que o jogador perdeu o jogo
func register_lose():
	game_ended = true
	emit_signal("lose")


func _on_timer_timeout() -> void:
	if game_ended: return
	generate_projectile()


func _on_victory_timer_timeout() -> void:
	if game_ended: return
	register_win()
