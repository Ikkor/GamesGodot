extends AnimatedSprite




# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timerstart = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation = "fix"
	frame = 0
	timerstart = true
	$wait.start(5)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print ($wait.time_left)
	if $wait.time_left == 0 and timerstart == true:
		animation = "fix"
		$drop.play("drop")
		timerstart = false
		
	if frame == 4 and animation == "splash":
		stop()
		timerstart = true
		$wait.start(4)
		frame = 0



func _on_drop_animation_finished(anim_name):
	play("splash")


