extends GenericButton

signal saveSettings

func _ready():
	self.connect("pressed", self, "saveSettings")
	
func saveSettings():
	emit_signal("saveSettings")
