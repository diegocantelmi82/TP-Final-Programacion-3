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
