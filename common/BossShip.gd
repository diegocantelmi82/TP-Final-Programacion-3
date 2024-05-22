class_name BossShip

extends Enemy

signal boss_dead
	
func onTimeout():
	pass
	
func dead():
	SPEED = 0
	.dead()
	
func animation_end():
	if animation == "explode":
		queue_free()
		emit_signal("boss_dead")
