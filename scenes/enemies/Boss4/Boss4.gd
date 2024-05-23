extends BossShip

func _ready():
	direction = Vector2(0, 1)
	
func _process(delta):
	if position.y >= 250:
		direction = Vector2(0, 0)
	
	var motion = Vector2()
	motion += direction
	motion.x += cos($Timer.get_time_left())
	position += motion.normalized() * SPEED * delta
	position.x = clamp(position.x, 100, 1000)
	
func shoot_bullet():
	var b = BossBullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos.global_position
	b.SPEED = 200
	get_tree().get_current_scene().add_child(b)
	
	b = BossBullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos2.global_position
	b.SPEED = 200
	get_tree().get_current_scene().add_child(b)
