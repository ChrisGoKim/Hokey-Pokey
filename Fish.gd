extends Node2D

enum skills{PROGRAMMING, AUDIO, ART, DESIGN}
var state = 3
var isCreating = false
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
	print("Size", get_viewport().size)
	$ProgressBars.hide()
	$"Upgrade UI".hide()
	$"Creation UI".show()
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
	
	if isCreating == true:
		addProgress(state)
	pass

##ALL FUNCTIONALITY FOR UPGRADES
func boostStat(var num):
	stats[num] += (randi() % 6)
	print(stats)
	pass

func _on_Upgrade_Programming_pressed():
	boostStat(skills.PROGRAMMING)
	$"Upgrade UI".hide()
	$"Creation UI".show()
	pass # replace with function body

func _on_Upgrade_Audio_pressed():
	boostStat(skills.AUDIO)
	$"Upgrade UI".hide()
	$"Creation UI".show()
	pass # replace with function body

func _on_Upgrade_Art_pressed():
	boostStat(skills.ART)
	$"Upgrade UI".hide()
	$"Creation UI".show()
	pass # replace with function body

func _on_Upgrade_Design_pressed():
	boostStat(skills.DESIGN)
	$"Upgrade UI".hide()
	$"Creation UI".show()
	pass # replace with function body
	

	
	
	#Game Progress
func addProgress(var task):
	#Calculation for progress bar. If you hit 'p' during a tick, it will give you a bonus based on your stats
	var calculation = (.2 * stats[task]) #.005
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
		stats[3] += 2
	pass # replace with function body

func _on_Programming_Bar_value_changed(value):
	if $"ProgressBars/Programming Bar".value >= 100:
		state = 2
		stats[0] += 2
	pass # replace with function body


func _on_Art_Bar_value_changed(value):
	if $"ProgressBars/Art Bar".value >= 100:
		state = 1
		stats[2] += 2
	pass # replace with function body

func _on_Audio_Bar_value_changed(value):
	if $"ProgressBars/Audio Bar".value >= 100:
		stats[1] += 2
		$"Upgrade UI".show()
		resetBar()
	pass # replace with function body

func resetBar():
	$ProgressBars/DesignBar.value = 0
	$"ProgressBars/Art Bar".value = 0
	$"ProgressBars/Audio Bar".value = 0
	$"ProgressBars/Programming Bar".value = 0
	$ProgressBars.hide()
	isCreating = false
	state = 3
	pass


#Game Menu
func _on_Basic_Game_pressed():
	$"Creation UI".hide()
	$ProgressBars.show()
	isCreating = true
	pass # replace with function body
