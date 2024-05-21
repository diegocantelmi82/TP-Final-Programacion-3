extends PlayerShip

func _physics_process(_delta):
	position.x = clamp(position.x, -405, 590)
	position.y = clamp(position.y, -525, 1350)
	
func shoot_bullet():
	var b = Bullet.instance()
	b.init(bullet_power)
	b.global_position = bulletInitPos.global_position
	get_tree().get_current_scene().add_child(b)
	
	AudioManager.play("laser")
