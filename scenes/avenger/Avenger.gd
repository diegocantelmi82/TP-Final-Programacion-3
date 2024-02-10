extends Ship

var playerControllerClass = load("res://common/playerController/playerController.gd")
var playerController = playerControllerClass.new()
var Bullet = preload("res://scenes/bullet/Bullet.tscn")

func _ready():
	pass

func _input(event):
	playerController.setInputMode(event)

func _physics_process(delta):
	playerController.handleInput(self, delta)
	
func shoot_bullet():
	var b = Bullet.instance()
	b._init()
	b.global_position = bulletInitPos.global_position
	get_node("/root").add_child(b)
