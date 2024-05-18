class_name playerPolling

func _input(_event):
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
		
	if Player.ships[Player.main_ship].secondary_ammo > 0:
		if (Input.is_action_just_pressed("secondary_shoot")):
			player.get_node("ShootChargeTimer").start()
			player.get_node("AnimatedSprite").get_material().set_shader_param("shader_color", 1)
		elif (Input.is_action_just_released("secondary_shoot")):
			if player.get_node("ShootChargeTimer").get_time_left() == 0:
				player.shoot_secondary_weapon()
				
			player.get_node("ShootChargeTimer").stop()
			player.get_node("AnimatedSprite").get_material().set_shader_param("shader_color", 0)
		
	var velocity = motion.normalized() * player.SPEED
	player.position += velocity * delta
	
	if velocity.length() > 0:
		player.get_node("AnimatedSprite").animation = "move"
	else:
		player.get_node("AnimatedSprite").animation = "idle"
		
	player.get_node("AnimatedSprite").play()
