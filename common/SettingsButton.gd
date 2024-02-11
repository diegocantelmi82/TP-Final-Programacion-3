extends GenericButton

signal showSettingsWindow

func _ready():
	self.connect("pressed", self, "showSettings")
	
func showSettings():
	emit_signal("showSettingsWindow")
