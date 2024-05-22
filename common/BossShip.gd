class_name BossShip

extends Enemy

signal boss_dead

var BossBullet = preload("res://scenes/bossBullet/BossBullet.tscn")
	
func onTimeout():
	pass
	
func shoot_bullet():
	var b = BossBullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos.global_position
	get_tree().get_current_scene().add_child(b)
	
	b = BossBullet.instance()
	b.init(bullet_power, true)
	b.global_position = bulletInitPos2.global_position
	get_tree().get_current_scene().add_child(b)
	
func dead():
	SPEED = 0
	.dead()
	
func animation_end():
	if animation == "explode":
		queue_free()
		emit_signal("boss_dead")
