extends TextureRect


func _ready():
	pass

var tie = 1

func _loopo():
	
	if tie == 1:
		get_node("blinker").set_hidden(!get_node("Sprite").is_hidden())
		tie = tie +1
	else:
		tie = 1


