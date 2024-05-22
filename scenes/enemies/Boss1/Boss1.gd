extends BossShip

func _ready():
	direction = Vector2(0, 0)
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	motion.x += cos($Timer.get_time_left())
	position += motion.normalized() * SPEED * delta
	position.x = clamp(position.x, 100, 1000)
