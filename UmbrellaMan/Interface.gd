extends Node

# Load the custom images for the mouse cursor.
var arrow = load("res://interface/cur.png")

func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(arrow)
	


	
