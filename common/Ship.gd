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

func dead():
	isAlive = false
	animation = "explode"
	$AnimatedSprite.play("explode")
	
func animation_end():
	if animation == "explode":
		queue_free()
		
func _on_ship_area_entered(area):
	if area.type == "bullet":
		hp -= area.power
	elif area.type == "enemy":
		hp = 0
