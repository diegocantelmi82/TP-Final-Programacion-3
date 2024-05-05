class_name Ship

extends Area2D

signal dead()

export var SPEED = 700
export var MAX_HP = 100
export var MAX_SHIELD = 100
export var hp = 100
export var shield = 0

onready var bulletInitPos = $BulletInitPos

func _ready():
	pass

func dead():
	$AnimatedSprite.play("explode")
	emit_signal("dead")
