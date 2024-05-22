class_name BossBullet

extends Bullet

func _ready():
	animation = "default"

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
