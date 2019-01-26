extends Node2D


enum test{PROGRAMMING, AUDIO, ART, DESIGN}

var stats = [
	randi() % 6, #programming
	randi() % 6, #audio
	randi() % 6, #art
	randi() % 6 #design
]

var anim = ""

var canUpgrade = false

func _ready():
	anim = "Walk"
	$AnimateFish.play(anim)
	#$AnimateFish.playing = true	
	pass

func _fixed_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
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


