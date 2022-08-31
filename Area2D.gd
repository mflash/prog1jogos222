extends Area2D



func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed \
	 and event.button_index == BUTTON_LEFT:
		print("Evento de mouse click")
