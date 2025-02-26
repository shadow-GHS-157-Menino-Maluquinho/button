extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# Definir a aparência do botão
	self.rect_min_size = Vector2(64, 64)  # Tamanho do botão

func _draw():
	# Cor do ícone
	var play_color = Color(0, 1, 0)  # Verde, por exemplo

	# Desenha o triângulo (ícone de Play)
	var play_triangle = PoolVector2Array([
		Vector2(0, -10),
		Vector2(10, 10),
		Vector2(-10, 10)
	])
	
	# Desenha o ícone dentro do botão
	draw_polygon(play_triangle, [play_color])
