class_name playerEvent

var player
var motion = Vector2()

func _input(event, delta):
	if event.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
	if event.is_action_pressed("move_bottom"):
		motion += Vector2(0, 1)
	if event.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
	if event.is_action_pressed("move_right"):
		motion += Vector2(1, 0)
	if event.is_action_released("move_up") or event.is_action_released("move_bottom"):
		motion = Vector2(motion.x, 0)
	if event.is_action_released("move_left") or event.is_action_released("move_right"):
		motion = Vector2(0, motion.y)
	
	var velocity = motion.normalized()*player.SPEED
	player.position += velocity * delta

func getPlayerAction(p):
	if not player:
		player = p
