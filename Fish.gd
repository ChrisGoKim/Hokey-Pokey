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

var isPlayingMiniGame = false

var money = 50

var anim = ""
var moving = false
var animPlaying = false
var canUpgrade = false
var movement_speed = 3

func _ready():
	print("Ready")
	print("Size", get_viewport().size)
	$ProgressBars.hide()
	$"Upgrade UI".hide()
	$"Creation UI".show()
	$"Money UI".hide()
	$"Stats UI".hide()
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$Anim.playback_speed = movement_speed
	if isCreating == true:
		addProgress(state)
		decreasingHunger()
		if not animPlaying:
			$Anim.play("Main")
			animPlaying = true
	
	if not isCreating:
		$Anim.stop()
		animPlaying = false
		
	updateStatLabels()
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
		castToMiniGame()
	pass # replace with function body

func _on_Programming_Bar_value_changed(value):
	if $"ProgressBars/Programming Bar".value >= 100:
		state = 2
		stats[0] += 2
		castToMiniGame()
	pass # replace with function body

func _on_Art_Bar_value_changed(value):
	if $"ProgressBars/Art Bar".value >= 100:
		state = 1
		stats[2] += 2
		castToMiniGame()
	pass # replace with function body

func _on_Audio_Bar_value_changed(value):
	if $"ProgressBars/Audio Bar".value >= 100:
		stats[1] += 2
		$"Upgrade UI".show()
		$"Money UI".hide()
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

func castToMiniGame():
	isCreating = false
	isPlayingMiniGame = true
	pass
	
func continueProgress():
	isCreating = true
	pass








#Game Menu
func _on_Basic_Game_pressed():
	$"Creation UI".hide()
	$ProgressBars.show()
	$"Money UI".show()
	$"Stats UI".show()
	isCreating = true
	pass # replace with function body


func updateStatLabels():
	$"Stats UI/MoneyLabel".text = ("Money: %d" % money)
	$"Stats UI/ProgrammingLabel".text = ("Programming: %d" % stats[PROGRAMMING])
	$"Stats UI/ArtLabel".text = ("Art: %d" % stats[ART])
	$"Stats UI/DesignLabel".text = ("Design: %d" % stats[DESIGN])
	$"Stats UI/AudioLabel".text = ("Audio: %d" % stats[AUDIO])
	pass







#Hunger and Food
func decreasingHunger():
	$"Money UI/Hunger Bar".value -= .01
	pass


func _on_Buy_Food_pressed():
	if money >= 25:
		money -= 25
		$"Money UI/Hunger Bar".value += 5
	
	pass # replace with function body
	
func giveRandomMoney(var num):
	if num == 0:#this is a basic game
		money += 15*(randi()%10+1)
	elif num == 1:
		money += 20*(randi()%15+1)
	pass


func _on_Hunger_Bar_value_changed(value):
	if $"Money UI/Hunger Bar".value <= 0:
		get_tree().quit()
	
	pass # replace with function body
