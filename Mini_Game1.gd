extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isDone = false
var isActive = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	isDone = false
	isActive = true
	pass

func _process(delta):
	if isActive:
	#	# Called every frame. Delta is time since last frame.
	#	# Update game logic here.
		control()
	#	pass

func control():
	if Input.is_action_pressed("ui_right"):
		$MovingFish.move_right()
	elif Input.is_action_pressed("ui_left"):
		$MovingFish.move_left()
	else:
		$MovingFish.stopAnim()
	