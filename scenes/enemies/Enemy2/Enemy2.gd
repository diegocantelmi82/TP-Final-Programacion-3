extends Enemy

enum moveType {DOWN, RIGHT, LEFT}
var moveTypeVector = {
	moveType.DOWN: Vector2(0, 1),
	moveType.RIGHT: Vector2(-1, 0),
	moveType.LEFT: Vector2(1, 0)
}

func _ready():
	$Timer.wait_time = 3
	$ShootTimer.wait_time = 1.5
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	position += motion.normalized() * SPEED * delta
	
func onTimeout():
	randomize()
	var move = randi() % 3
	direction = moveTypeVector[move]
	$Timer.wait_time = randi() % 3 + 1

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
