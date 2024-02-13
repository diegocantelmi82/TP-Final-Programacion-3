extends GenericButton

signal startGame

func _ready():
	self.connect("pressed", self, "startGame")
	
func startGame():
	emit_signal("startGame")
