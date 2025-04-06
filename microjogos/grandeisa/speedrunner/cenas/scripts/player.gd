extends CharacterBody2D

const GRAVITY = 750.0

# Velocidade do personagem,a anotação @export faz com que a variável possa ser preenchida no Inspetor
@export var speed: float = 520.0
# Força do pulo do jogador
@export var jump_force: float = 500.0
# Duração máxima do pulo do jogador (em segundos)
@export var max_jump_duration: float = 1.2
# Contagem do tempo do pulo do jogador (contado enquanto pressionado apenas)
@onready var jump_time_count = max_jump_duration

# Responsável por coletar (e interpretar) as entradas do jogador
func handle_input(delta: float):
	# Pega as entradas de "esquerda" e "direita" e transforma em um número de -1 a 1
	var horizontal_input = Input.get_axis("esquerda", "direita") 
	
	# Faz o eixo x do vetor de velocidade do player ser o valor de 'speed' na direção horizontal pressionada 
	velocity.x = speed * horizontal_input

	handle_jump(delta) # Comportamento de pulo

# Responsável pelo comportamento do pulo do jogador
# Toma como argumento o 'delta', que é a diferença de tempo desde o ultimo frame
func handle_jump(delta: float):
	if is_on_floor(): # Se o personagem está pisando no chão:
		if Input.is_action_just_pressed("acao"): # Se o botão de ação acabou de ser pressionado
			velocity.y = -jump_force # Velocidade vertical se torna o valor de 'jump_force' para cima
			jump_time_count = 0.0 # Zera a contagem de tempo do pulo para a recomeçar
	elif jump_time_count < max_jump_duration: # Caso a contagem de tempo do pulo seja menor que a duração maxima permitida: 
		if Input.is_action_pressed("acao"): # Caso o jogador esteja pressionando o botão de ação:
			jump_time_count += delta # Adicione o tempo desde o ultimo frame na contagem do tempo do pulo
			velocity.y = -jump_force # Velocidade vertical do jogador se torna o valor de 'jump_force' para cima
		elif Input.is_action_just_released("acao"): # Caso o jogador tenha acabado de soltar o botão de ação
			jump_time_count = max_jump_duration # Contagem do tempo do pulo é excedida
			

# Responsável por aplicar (ou remover) os efeitos da gravidade na velocidade do jogador (Considerando massa = 1)
# Toma como argumento o 'delta', que é a diferença de tempo desde o ultimo frame
func handle_gravity(delta: float):
	if jump_time_count >= max_jump_duration: # Se a contagem de duração do pulo exceder seu tempo limite:
		velocity.y += GRAVITY * delta # Acelerar jogador com base na gravidade (valor de 'GRAVITY')
		

func _physics_process(delta):
	handle_input(delta) # Coletar entradas
	handle_gravity(delta) # Aplicar gravidade
	
	# Personagem se move (e desliza) baseado em sua variável 'velocity'
	move_and_slide()
	
	
