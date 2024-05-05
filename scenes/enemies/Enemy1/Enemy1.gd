extends Ship

var direction = Vector2(1, 1)
var Bullet = preload("res://scenes/bullet/Bullet.tscn")
onready var bulletInitPos2 = $BulletInitPos2

func _ready():
	self.connect("area_entered", self, "_on_area_entered")
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
	b._init(true)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
	
	b = Bullet.instance()
	b._init(true)
	b.global_position = bulletInitPos2.global_position
	get_node("/root").add_child(b)
	
func _on_area_entered(area):
	if area.type == "bullet":
		#dead()
		pass
