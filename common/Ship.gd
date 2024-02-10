class_name Ship

extends Area2D

signal shoot(pos)

export var SPEED = 700
export var MAX_HP = 100
export var MAX_SHIELD = 100

onready var hp = MAX_HP
onready var shield = MAX_SHIELD
onready var bulletInitPos = $BulletInitPos
var weapons = []
var weapon

func _ready():
	pass

#func shoot_bullet():
#	emit_signal("shoot", bulletInitPos.global_position)
