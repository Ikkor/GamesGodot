extends Area2D

#Load the custom images for the mouse cursor.
var arrow2 = load("res://interface/cur2.png")
var arrow1 = load("res://interface/cur.png")
func _input_event(viewport, event, shape_idx):
	
	
	var keycollect = get_node("../liftkey").collected
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and keycollect == true:
		get_node("../activate").play_backwards("On")
		get_node("../mechanical/wheel/spin").play("liftspin")
		get_node("../mechanical/gear/spin2").play("liftspin")
		get_node("../mechanical/gear2/spin3").play("liftspin")
		
	elif event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and keycollect == false:
		$Label.visible = true
		
		
func _process(delta):
	pass


func _on_TouchButton_mouse_entered():
	Input.set_custom_mouse_cursor(arrow2)


func _on_TouchButton_mouse_exited():
	Input.set_custom_mouse_cursor(arrow1)
	$Label.visible = false #label for key


func _on_OnLift_body_entered(body):
	if body.name == "player":
		get_node("../activate").play()
		
	
