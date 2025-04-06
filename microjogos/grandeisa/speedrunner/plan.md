# O que o player vê?

	- Um caminho de tunel
	- Um fundo de parallax
	- Um personagem que corre
		- Camera acompanha o personagem
		- Personagem deixa um rastro ao se mexer

# Qual é o objetivo?

	Chegar o mais rápido possível na linha de chegada, evitando obstáculos no caminho

# Como o jogo reage ao jogador?

	- direita, esquerda: personagem se move horizontalmente
	- espaço/ação:
		- caso numa parede: 
				- se o jogador está pressionando a direção relativa à direção da parede:
					personagem "pula" na direção oposta à parede
				- se não: nada acontece
		- caso no chão: personagem pula
		* Nota: Quanto mais tempo o jogador pressiona o botão, por mais tempo é aplicada a força do pulo
