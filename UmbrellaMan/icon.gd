extends KinematicBody2D
var target_angle = 0
var turn_speed = deg2rad(10)

func _process(delta):

	var dir = get_angle_to( get_node("/root/main/player/player").global_position )

	if abs(dir)<turn_speed: #to close for full turn_speed
		rotation += dir #this is just a look_at
	else:
		if dir>0: rotation += turn_speed #clockwise
		if dir<0: rotation -= turn_speed #anit - clockwise
		
			
   
 
