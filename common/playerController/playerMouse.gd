class_name playerMouse
extends Node2D

var target = Vector2()
var velocity = Vector2()
var player

func _input(event):
	pass

func getPlayerAction(p, delta):
	if not player:
		player = p
		
	target = player.get_global_mouse_position()
	velocity = player.position.direction_to(target) * player.SPEED
		
	if player.position.distance_to(target) > 3:
		velocity = player.position + velocity * delta
