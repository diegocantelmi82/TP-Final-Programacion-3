extends PlayerShip

func _physics_process(_delta):
	position.x = clamp(position.x, -395, 620)
	position.y = clamp(position.y, -300, 1530)
