extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	$popup.current_animation = "popup_text"
	$popup.seek(0.4,true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(body.name == "player"):
		$popup.current_animation = "popup_text"
		$popup.play_backwards()
		
		


func _on_Area2D_body_exited(body):
	if(body.name == "player"):
		$popup.current_animation = "popup_text"
		$popup.play()
		



func _on_popup_animation_finished(anim_name):
	$popup.current_animation = "[stop]"

