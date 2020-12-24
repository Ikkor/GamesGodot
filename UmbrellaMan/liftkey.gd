extends Area2D

var collected = false



func _ready():
	pass # Replace with function body.
func _on_liftkey_body_entered(body):
	if(body.name == "player"&&collected == false):
		collected = true
		print("Collected key.")
		visible = false
		
