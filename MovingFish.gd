extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var movement_speed = 3
#var isWalking = false
var anim_running = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	isWalking = false
	$Anim.playback_speed = movement_speed
	anim_running = false
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func move_left():
	print("Left")
	$FishSprite.flip_h = false
	if position.x > 0:
		position.x += -movement_speed
		if not anim_running:
			$Anim.play("Walking")
			anim_running = true
	else:
		stopAnim()

func move_right():
	print("Right")
	$FishSprite.flip_h = true
	if position.x < 1024:
		position.x += movement_speed
		if not anim_running:
			$Anim.play("Walking")
			anim_running = true
	else:
		stopAnim()

func stopAnim():
	if anim_running:
		$Anim.play("Idle")
		anim_running = false