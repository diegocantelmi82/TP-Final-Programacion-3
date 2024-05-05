extends Area2D

export var SPEED = 1000
var type = "bullet"
var direction = Vector2()
var animation = "flash"

func _init(enemy_bullet = false):
	if enemy_bullet:
		direction = Vector2(0, 1)
		rotate(PI)
		set_collision_mask_bit(0, true)
		set_collision_mask_bit(1, false)
	else:
		direction = Vector2(0, -1)
		set_collision_mask_bit(0, false)
		set_collision_mask_bit(1, true)
		
func _ready():
	$AnimatedSprite.connect("animation_finished", self, "animation_end")

func _process(delta):
	var motion = Vector2()
	motion += direction
	position += motion.normalized() * SPEED * delta
	
	if animation == "default":
		$AnimatedSprite.play("default")
	elif animation == "explode":
		$AnimatedSprite.play("explode")
	else:
		$AnimatedSprite.play("flash")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_area_entered(_area):
	SPEED = 0
	animation = "explode"
	
func animation_end():
	if animation == "flash":
		animation = "default"
	elif animation == "explode":
		queue_free()
