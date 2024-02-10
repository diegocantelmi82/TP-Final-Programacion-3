extends Area2D

export var SPEED = 1000
var direction = Vector2()

func _init(enemy_bullet = false):
	if enemy_bullet:
		direction = Vector2(0, 1)
	else:
		direction = Vector2(0, -1)
		set_collision_mask_bit(0, false)

func _process(delta):
	var motion = Vector2()
	motion += direction
	position += motion.normalized() * SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_area_entered(_area):
	queue_free()
