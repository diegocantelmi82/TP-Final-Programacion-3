class_name Enemy

extends Ship

var direction = Vector2(0, 1)
var Bullet = preload("res://scenes/bullet/Bullet.tscn")
var PowerUp = preload("res://scenes/powerUp/PowerUp.tscn")
var type = "enemy"

func _ready():
	$Timer.connect("timeout", self, "onTimeout")
	$ShootTimer.connect("timeout", self, "onShootTimerTimeout")
	
func onShootTimerTimeout():
	shoot_bullet()
	
func shoot_bullet():
	var b = Bullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos.global_position
	get_tree().get_current_scene().add_child(b)
	
	b = Bullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos2.global_position
	get_tree().get_current_scene().add_child(b)
	
func dead():
	.dead()
	dropPowerUp()
	
func dropPowerUp():
	randomize()
	var random_number = randi() % 10 + 1
	
	if random_number == 7:
		var powerUp = PowerUp.instance()
		powerUp.initPowerUp(self.global_position)
		get_tree().get_current_scene().add_child(powerUp)
