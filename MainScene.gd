extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Mini_Game1.hide()
	pass

func _process(delta):
	if $Fish.isPlayingMiniGame == true:
		$Fish.hide()
		$Mini_Game1.show()
		$Mini_Game1.run_minigame()
		
		if $Mini_Game1.isDone == true:
			$Fish.isPlayingMiniGame = false
			$Fish.isCreating = true
		#if $MINIGAME.ISDONE == TRUE:
			#$Fish.isPlayingMiniGame == false
	elif $Fish.isCreating == true:
		$Fish.show()
		$Mini_Game1.hide()
		$Fish.continueProgress()
		$Mini_Game1.isDone = false

	pass