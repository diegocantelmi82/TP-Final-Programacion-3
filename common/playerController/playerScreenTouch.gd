class_name playerScreenTouch
extends Node2D

var target = Vector2()
var velocity = Vector2()
var move = false
var player
# Posicion de la camara para que el calculo de la posicion del touch sea preciso
# Esto se puede hacer porque es una fixed camera, sino deberia traer la posicion del nodo de la camara
var cameraPos = Vector2(108, 242)

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			target = (cameraPos - (player.get_viewport_rect().size / 2)) + event.position
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
