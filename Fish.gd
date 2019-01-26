extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var programming = randi() % 6
var audio = randi() % 6
var art = randi() % 6
var design = randi() % 6


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print(programming)
	print(audio)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
