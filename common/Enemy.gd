class_name Enemy

extends Ship

var direction = Vector2(0, 1)
var Bullet = preload("res://scenes/bullet/Bullet.tscn")
var PowerUp = preload("res://scenes/powerUp/PowerUp.tscn")
var type = "enemy"

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	$Timer.wait_time = 10
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	motion.x += cos($Timer.get_time_left())
	position += motion.normalized() * SPEED * delta
	
func onTimeout():
	#$Timer.wait_time = randi() % 2 + 2
	#direction = direction * Vector2(-1, 1)
	shoot_bullet()
	
func shoot_bullet():
	var b = Bullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
	
	b = Bullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos2.global_position
	get_node("/root").add_child(b)
	
func dead():
	.dead()
	var powerUp = PowerUp.instance()
	powerUp.initPowerUp(self.global_position)
	get_node("/root").add_child(powerUp)
