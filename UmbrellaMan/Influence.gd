extends Area2D


onready var parent = get_parent()
var velocity = Vector2()
var player = null 
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_area_entered")
	connect("body_exited", self, "_area_eixited")

func _area_entered(object):
	player = object
	print("a")
	

func _area_exited(object):
	player = null

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity.x = -100*delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
