extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isDone = false
var isActive = false
var timer = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	isDone = false
	isActive = true
	pass

func _process(delta):
	if isActive == true:
	#	# Called every frame. Delta is time since last frame.
	#	# Update game logic here.
		control()
	#	pass
	if Input.is_action_just_pressed("pass_test"):
		isDone = true
		isActive = false

func control():
	if Input.is_action_pressed("ui_right"):
		$MovingFish.move_right()
	elif Input.is_action_pressed("ui_left"):
		$MovingFish.move_left()
	else:
		$MovingFish.stopAnim()
		
func run_minigame():
	timer = 500
	if randi()%3 == 0:
		$ColorRect.color = Color()
	pass