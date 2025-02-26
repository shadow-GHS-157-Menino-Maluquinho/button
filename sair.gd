extends Button

var progress = 0.0  # Progresso inicial (começa em 0)
var is_pressed = false  # Verifica se o mouse está pressionado
var hold_time = 3.0  # Tempo necessário para completar o círculo (em segundos)
var border_thickness = 5  # Espessura da borda do arco
var current_progress_bar_value = 0.0  # Valor atual da barra de progresso (para interpolação)

func _ready():
	focus_mode = FOCUS_NONE
	# Inicializa o progresso e a verificação de pressionamento
	progress = 0.0  # Garantir que o progresso começa em 0
	is_pressed = false
	queue_redraw()  # Solicita o redesenho da tela no começo

func _process(delta):
	# Verifica se o mouse está pressionado
	if is_pressed:
		# Aumenta o progresso com base no tempo e limita entre 0 e 1
		progress += delta / hold_time
		progress = clamp(progress, 0.0, 1.0)  # Limita o progresso entre 0 e 1
	else:
		# Reseta o progresso quando o mouse não estiver pressionado
		progress = 0.0  

	# Interpola o valor atual da barra de progresso em direção ao progresso desejado
	current_progress_bar_value = lerp(current_progress_bar_value, progress, 0.1)  # Ajuste o último valor para controlar a suavidade

	# Atualiza o desenho
	queue_redraw()  # Solicita que a tela seja redesenhada enquanto o progresso muda
	
	# Verifica se o progresso completou (100%)
	if progress >= 1.0:
		_pressed()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:  # Verifica se é o botão esquerdo do mouse
			# Verifica se o clique ocorreu dentro dos limites do botão
			var mouse_position = get_global_mouse_position()
			var button_rect = Rect2(global_position, size)
			
			if button_rect.has_point(mouse_position):  # Verifica se o clique foi dentro do botão
				if event.pressed:
					is_pressed = true  # O mouse foi pressionado
				else:
					is_pressed = false  # O mouse foi solto

func _draw():
	if progress > 0:  # Desenha o arco apenas se o progresso for maior que 0
		$TextureProgressBar.value = current_progress_bar_value * 100  # Ajusta para a escala de 0-100 (se necessário)

# Função para mudar a cena

func _pressed():
	get_tree().quit()
