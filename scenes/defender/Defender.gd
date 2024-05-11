extends PlayerShip

func _physics_process(_delta):
	position.x = clamp(position.x, -550, 450)
	position.y = clamp(position.y, -500, 1300)
