class_name Ship

extends Area2D

export var SPEED = 700
export var MAX_HP = 100
export var MAX_SHIELD = 100
export var hp = 100
export var shield = 0

onready var bulletInitPos = $BulletInitPos
onready var bulletInitPos2 = $BulletInitPos2

func dead():
	$AnimatedSprite.play("explode")
