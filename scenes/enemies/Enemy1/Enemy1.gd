extends Enemy

func _ready():
	$Timer.wait_time = 10
	$ShootTimer.wait_time = 2
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	motion.x += cos($Timer.get_time_left())
	position += motion.normalized() * SPEED * delta
	
func onTimeout():
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
