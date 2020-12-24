extends KinematicBody2D

var detected = false
var velocity:Vector2 = Vector2()




func _on_npc2_body_entered(body):
	if(body.name == "player"):
		print("run bob!") # Replace with function body.
		detected = true
		

func _physics_process(delta):
	if detected == true:
		velocity.x = -100
		velocity = move_and_slide(velocity, Vector2.UP)
		var motion = velocity * delta
		move_and_collide(motion)
	#play running animation afterwards

