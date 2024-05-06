extends Ship

var direction = Vector2(1, 1)
var Bullet = preload("res://scenes/bullet/Bullet.tscn")

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	$Timer.wait_time = randi() % 2 + 2
	
func _process(delta):
	var motion = Vector2()
	motion += direction
	position += motion.normalized() * SPEED * delta
	
func onTimeout():
	$Timer.wait_time = randi() % 2 + 2
	direction = direction * Vector2(-1, 1)
	shoot_bullet()
	
func shoot_bullet():
	var b = Bullet.instance()
	b._init(bullet_power, true)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
	
	b = Bullet.instance()
	b._init(bullet_power, true)
	b.global_position = bulletInitPos2.global_position
	get_node("/root").add_child(b)
