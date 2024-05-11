extends PlayerShip

func _physics_process(_delta):
	position.x = clamp(position.x, -500, 550)
	position.y = clamp(position.y, -400, 1500)
