extends KinematicBody2D
var state_machine

onready var shape = get_node("AnimatedSprite")
var movingright
var walkspeed = 200
var gravity = 200
var velocity : Vector2 = Vector2()
var sitting = false

func get_input():
	#taking care of sitting, WIP
	if sitting == true and (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
		$AnimatedSprite.play("sit")
		print("player stand up")
		sitting = false
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("walk")
		movingright = false
		velocity.x = -walkspeed
		
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("walk")
		movingright = true
		velocity.x = walkspeed
		
	elif Input.is_action_just_released("ui_right") or  Input.is_action_just_released("ui_left"):
		$Timer.start(5)  #how much to wait to play the sit animation
		
	elif $Timer.time_left ==0: #when timer ends play sit animation
		$AnimatedSprite.play("sit")
		velocity.x=0
		sitting = true
		
	else:
	
		$AnimatedSprite.play("idle")
		velocity.x = 0
		
		
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	movingright = true
	state_machine = $AnimationPlayer/AnimationTree.get("parameters/playback")
	
func _physics_process(delta):
	#print($Timer.time_left)
	var snap = Vector2.DOWN * 16 if is_on_floor() else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	velocity.y += gravity * delta
	get_input()
	var motion = velocity*delta
	move_and_collide(motion)
	if not movingright:
		$AnimatedSprite.set_flip_h(true)
	else:
		$AnimatedSprite.set_flip_h(false)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
