extends GenericButton

signal startLevel

func _ready():
	self.connect("pressed", self, "startLevel")
	
func startLevel():
	emit_signal("startLevel")
