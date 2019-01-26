extends Node2D


enum skills{PROGRAMMING, AUDIO, ART, DESIGN}
var state = 3

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
	addProgress(state)
	pass

##ALL FUNCTIONALITY FOR UPGRADES
func boostStat(var num):
	stats[num] += (randi() % 6)
	print(stats)
	pass

func _on_Upgrade_Programming_pressed():
	boostStat(skills.PROGRAMMING)
	pass # replace with function body

func _on_Upgrade_Audio_pressed():
	boostStat(skills.AUDIO)
	pass # replace with function body

func _on_Upgrade_Art_pressed():
	boostStat(skills.ART)
	pass # replace with function body

func _on_Upgrade_Design_pressed():
	boostStat(skills.DESIGN)
	pass # replace with function body
	
func addProgress(var task):
	#Calculation for progress bar. If you hit spacebar during a tick, it will give you a bonus based on your stats
	var calculation = (.005 * stats[task])
	if Input.is_action_just_pressed("progress_work"):
		calculation += (.1 * stats[task])
		pass
	
	if task == 0:
		$"ProgressBars/Programming Bar".value += calculation
	elif task == 1:
		$"ProgressBars/Audio Bar".value += calculation
	elif task == 2:
		$"ProgressBars/Art Bar".value += calculation
	elif task == 3:
		$ProgressBars/DesignBar.value += calculation

	pass
	

func _on_DesignBar_value_changed(value):
	if $ProgressBars/DesignBar.value >= 100:
		state = 0
	pass # replace with function body

func _on_Programming_Bar_value_changed(value):
	if $"ProgressBars/Programming Bar".value >= 100:
		state = 2
	pass # replace with function body


func _on_Art_Bar_value_changed(value):
	if $"ProgressBars/Art Bar".value >= 100:
		state = 1
	pass # replace with function body

func _on_Audio_Bar_value_changed(value):
	if $"ProgressBars/Audio Bar".value >= 100:
		pass#get money and upgrade chance
	pass # replace with function body
