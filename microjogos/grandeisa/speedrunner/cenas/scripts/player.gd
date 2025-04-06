extends CharacterBody2D

const GRAVITY = 150.0

# Velocidade do personagem,a anotação @export faz com que a variável possa ser preenchida no Inspetor
@export var speed: float = 520.0

# Responsável por coletar (e interpretar) as entradas do jogador
func handle_input():
	# Pega as entradas de "esquerda" e "direita" e transforma em um número de -1 a 1
	var horizontal_input = Input.get_axis("esquerda", "direita") 
	
	# Faz o eixo x do vetor de velocidade do player ser o valor de 'speed' na direção horizontal pressionada 
	velocity.x = speed * horizontal_input

# Responsável por aplicar (ou remover) os efeitos da gravidade na velocidade do jogador (Considerando massa = 1)
# Toma como argumento o 'delta', que é a diferença de tempo desde o ultimo frame
func handle_gravity(delta: float):
	if is_on_floor(): # Se o personagem está pisando no chão:
		velocity.y = 0 # Zere a velocidade horizontal do jogador
	else: # Caso contrário:
		velocity.y += GRAVITY * delta # Acelerar jogador com base na gravidade (valor de 'GRAVITY')
		
func _physics_process(delta):
	handle_input() # Coletar entradas
	handle_gravity(delta) # Aplicar gravidade
	
	# Personagem se move (e desliza) baseado em sua variável 'velocity'
	move_and_slide()
