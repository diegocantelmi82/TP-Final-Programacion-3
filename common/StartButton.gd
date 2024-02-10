extends GenericButton

func _ready():
	self.connect("pressed", self, "startGame")
	
func startGame():
	get_tree().change_scene("res://scenes/levels/Level1/Level1.tscn")
