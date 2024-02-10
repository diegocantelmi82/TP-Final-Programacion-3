class_name playerTap
extends Node2D

var target = Vector2()
var velocity = Vector2()
var move = false
var player

func _input(event):
	if event.is_action_pressed("click"):
		target = player.get_global_mouse_position()
		move = true

func getPlayerAction(p, delta):
	if not player:
		player = p
		
	if move:
		velocity = player.position.direction_to(target) * player.SPEED
		
		if player.position.distance_to(target) > 3:
			velocity = player.position + velocity * delta
		else:
			move = false
