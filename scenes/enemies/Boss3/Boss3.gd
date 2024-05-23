extends BossShip

var attack = false
var resetPos = false

func _ready():
	direction = Vector2(0, 1)
	$AttackTimer.connect("timeout", self, "onAttackTimeout")
	
func _process(delta):
	if position.y >= 250 && !attack && !resetPos:
		direction = Vector2(0, 0)
	elif position.y >= 1700 && attack:
		attack = false
		resetPos = true
		direction = Vector2(0, -1)
	elif position.y <= 250 && resetPos:
		resetPos = false
		direction = Vector2(0, 0)
		SPEED /= 2
		$AttackTimer.start()
	
	var motion = Vector2()
	motion += direction
	motion.x += cos($Timer.get_time_left())
	position += motion.normalized() * SPEED * delta
	position.x = clamp(position.x, 100, 1000)
	
func onAttackTimeout():
	attack = true
	SPEED *= 2
	direction = Vector2(0, 1)
