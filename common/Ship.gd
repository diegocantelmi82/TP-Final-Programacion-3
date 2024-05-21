class_name Ship

extends Area2D

export var SPEED = 700
export var MAX_HP = 100
export var MAX_SHIELD = 100
export var hp = 100
export var shield = 0
export var bullet_power = 10

onready var bulletInitPos = $BulletInitPos
onready var bulletInitPos2 = $BulletInitPos2
var isAlive = true
var animation = "idle"

func _ready():
	self.connect("area_entered", self, "_on_ship_area_entered")
	$AnimatedSprite.connect("animation_finished", self, "animation_end")

func _process(_delta):
	if hp <= 0 && isAlive:
		dead()
		
	if has_node("Shield"):
		if shield > 0:
			self.get_node("Shield").get_material().set_shader_param("shield", 1)
		else:
			self.get_node("Shield").get_material().set_shader_param("shield", 0)

func dead():
	isAlive = false
	animation = "explode"
	$AnimatedSprite.play("explode")
	AudioManager.play("ship_explosion")
	
func animation_end():
	if animation == "explode":
		queue_free()
		
func _on_ship_area_entered(area):
	if area.type == "bullet":
		if shield > 0:
			shield -= area.power
			shield = clamp(shield, 0, MAX_SHIELD)
		else:
			hp -= area.power
			hp = clamp(hp, 0, MAX_HP)
	elif area.type == "enemy":
		hp = 0
		shield = 0
		
	if self.type == "player":
		Player.ships[Player.main_ship].hp = hp
		Player.ships[Player.main_ship].shield = shield
		AudioManager.play("hit")
