class_name playerPolling

func _input(event):
	pass

func getPlayerAction(player, delta):
	if !player.isAlive:
		return
	
	var motion = Vector2()
	
	if (Input.is_action_pressed("move_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("move_bottom")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("move_left")):
		motion += Vector2(-1, 0)
	if (Input.is_action_pressed("move_right")):
		motion += Vector2(1, 0)
	if (Input.is_action_just_pressed("shoot")):
		player.shoot_bullet()
		
	var velocity = motion.normalized()*player.SPEED
	player.position += velocity * delta
	
	if velocity.length() > 0:
		player.get_node("AnimatedSprite").animation = "move"
	else:
		player.get_node("AnimatedSprite").animation = "idle"
		
	player.get_node("AnimatedSprite").play()
