extends Button  # Herda a classe Button

# Este método será chamado quando o botão for pressionado
func _pressed():
	get_tree().change_scene_to_file("res://control.tscn")
