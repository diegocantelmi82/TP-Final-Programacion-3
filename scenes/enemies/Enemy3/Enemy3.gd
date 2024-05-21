extends Enemy

func _ready():
	$Timer.wait_time = 3
	$ShootTimer.wait_time = 1.5
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	position += motion.normalized() * SPEED * delta
	
func onTimeout():
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
