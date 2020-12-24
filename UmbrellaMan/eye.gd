extends AnimatedSprite
var itsover = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$iris_handle.visible = false
	animation = "open"
	frame = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if(body.name == "player" && itsover == false):
		play("open")
		itsover = true


func _on_eye_animation_finished():	
	if(animation == "open"):
		$iris_handle.visible = true
		print(" open animation ended")
		animation = "focus"
		$iris_handle/saccadic.play("Confused")
		play("focus")
		
	if(animation == "blink"):
		$iris_handle.visible = true
		play("focus")
		$iris_handle/saccadic.play("Confused")


func _on_saccadic_animation_finished(anim_name):
	play("blink")# Replace with function body.
	$iris_handle.visible = false
