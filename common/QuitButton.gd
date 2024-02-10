extends GenericButton

func _ready():
	self.connect("pressed", self, "quitGame")
	
func quitGame():
	get_tree().quit()
