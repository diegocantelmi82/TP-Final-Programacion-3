extends GenericButton

signal startLevel(mainShip)

export var selectedShip: int

func _ready():
	self.connect("pressed", self, "startLevel")
	
func startLevel():
	emit_signal("startLevel", selectedShip)
