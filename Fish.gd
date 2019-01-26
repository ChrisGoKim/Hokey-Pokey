extends Node2D


enum test{PROGRAMMING, AUDIO, ART, DESIGN}

var stats = [
	randi() % 6, #programming
	randi() % 6, #audio
	randi() % 6, #art
	randi() % 6 #design
]

var anim = ""
var moving = false
var animPlaying = false
var canUpgrade = false
var movement_speed = 2

func _ready():
	print("Ready")
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
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
		
	print($Anim.is_playing())
	pass

##ALL FUNCTIONALITY FOR UPGRADES
func boostStat(var num):
	stats[num] += (randi() % 6)
	print(stats)
	pass

func _on_Upgrade_Programming_pressed():
	boostStat(test.PROGRAMMING)
	pass # replace with function body

func _on_Upgrade_Audio_pressed():
	boostStat(test.AUDIO)
	pass # replace with function body

func _on_Upgrade_Art_pressed():
	boostStat(test.ART)
	pass # replace with function body

func _on_Upgrade_Design_pressed():
	boostStat(test.DESIGN)
	pass # replace with function body
	