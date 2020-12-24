extends AnimationPlayer



func _on_TouchButton_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print("Clicked")
		play("On")
