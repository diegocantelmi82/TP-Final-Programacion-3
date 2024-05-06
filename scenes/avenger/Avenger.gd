extends PlayerShip

func _physics_process(delta):
	position.x = clamp(position.x, -550, 450)
	position.y = clamp(position.y, -700, 1200)
	
func shoot_bullet():
	var b = Bullet.instance()
	b._init(bullet_power)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
