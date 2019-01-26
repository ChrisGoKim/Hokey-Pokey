extends '../Fish.gd'

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func handle_Movement():
	$Anim.playback_speed = movement_speed
	if Input.is_action_pressed("ui_right"):
		position.x += movement_speed
		moving = true
		$AnimateFish.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		position.x += -movement_speed
		moving = true
		$AnimateFish.flip_h = false
#	elif Input.is_action_pressed("ui_down"):
#		position.y += 1
#		moving = true
#	elif Input.is_action_pressed("ui_up"):
#		position.y += -1
#		moving = true
	else:
		moving = false

	if moving and not animPlaying:
		$Anim.play("Walk")
		animPlaying = true
	elif not moving and animPlaying:
		$Anim.stop()
		animPlaying = false
