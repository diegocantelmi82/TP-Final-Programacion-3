class_name PlayerShip

extends Ship

signal dead()

var playerControllerClass = load("res://common/playerController/playerController.gd")
var playerController = playerControllerClass.new()
var Bullet = preload("res://scenes/bullet/Bullet.tscn")

func _physics_process(delta):
	playerController.handleInput(self, delta)
	
func shoot_bullet():
	var b = Bullet.instance()
	b._init(bullet_power)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
	
	b = Bullet.instance()
	b._init(bullet_power)
	b.global_position = bulletInitPos2.global_position
	get_node("/root").add_child(b)
	
func dead():
	.dead()
	Player.ships[Player.main_ship].is_alive = 0
	
func animation_end():
	if animation == "explode":
		queue_free()
		emit_signal("dead")
