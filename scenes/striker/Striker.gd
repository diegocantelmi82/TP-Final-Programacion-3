extends Area2D

signal shoot(pos)

export (float) var SPEED = 700
export (float) var MAX_HEALTH = 100

onready var health = MAX_HEALTH
onready var bulletInitPos = $BulletInitPos
onready var bulletInitPos2 = $BulletInitPos2

var playerControllerClass = load("res://common/playerController/playerController.gd")
var playerController = playerControllerClass.new()

func _ready():
	pass

func _input(event):
	playerController.setInputMode(event)

func _physics_process(delta):
	playerController.handleInput(self, delta)

func shoot_bullet():
	emit_signal("shoot", bulletInitPos.global_position)
	emit_signal("shoot", bulletInitPos2.global_position)
