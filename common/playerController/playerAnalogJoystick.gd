class_name playerAnalogJoystick

func _input(event):
	pass

func getPlayerAction(player, delta):
	var motion = Input.get_vector("analog_left", "analog_right", "analog_up", "analog_down")
	var velocity = motion.normalized()*player.SPEED
	player.position += velocity * delta
