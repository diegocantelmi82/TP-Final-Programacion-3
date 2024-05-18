class_name PlayerShip

extends Ship

signal dead()

export var special_bullet_power = 100

var playerControllerClass = load("res://common/playerController/playerController.gd")
var playerController = playerControllerClass.new()
var Bullet = preload("res://scenes/bullet/Bullet.tscn")
var SpecialBullet = preload("res://scenes/specialBullet/SpecialBullet.tscn")
var type = "player"

onready var SpecialBulletInitPos = $SpecialBulletInitPos

func _physics_process(delta):
	playerController.handleInput(self, delta)
	
func shoot_bullet():
	var b = Bullet.instance()
	b.init(bullet_power)
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
	
	b = Bullet.instance()
	b.init(bullet_power)
	b.global_position = bulletInitPos2.global_position
	get_node("/root").add_child(b)
	
func shoot_secondary_weapon():
	Player.ships[Player.main_ship].secondary_ammo -= 1
	
	var b = SpecialBullet.instance()
	b.init(special_bullet_power)
	b.global_position = SpecialBulletInitPos.global_position
	get_node("/root").add_child(b)
	
func dead():
	.dead()
	Player.ships[Player.main_ship].is_alive = 0
	
func animation_end():
	if animation == "explode":
		queue_free()
		emit_signal("dead")
