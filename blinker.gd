extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    # Create a timer node
    var timer = Timer.new()

    # Set timer interval
    timer.set_wait_time(0.32)

    # Set it as repeat
    timer.set_one_shot(false)

    # Connect its timeout signal to the function you want to repeat
    timer.connect("timeout", self, "repeat_me")

    # Add to the tree as child of the current node
    add_child(timer)

    timer.start()

    # Create a timer node
    var timer2 = Timer.new()

    # Set timer interval
    timer2.set_wait_time(0.31)

    # Set it as repeat
    timer2.set_one_shot(false)

    # Connect its timeout signal to the function you want to repeat
    timer2.connect("timeout", self, "repeat_me2")

    # Add to the tree as child of the current node
    add_child(timer2)

    timer2.start()


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func repeat_me():
	self.hide()
	print("Test")

func repeat_me2():
	self.show()
	print("Test2")