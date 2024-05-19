extends PlayerShip

func _physics_process(_delta):
	position.x = clamp(position.x, -405, 590)
	position.y = clamp(position.y, -375, 1450)
