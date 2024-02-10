class_name playerJoystick

func _input(event):
	pass

func getPlayerAction(player, delta):
	var motion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var velocity = motion.normalized()*player.SPEED
	player.position += velocity * delta
