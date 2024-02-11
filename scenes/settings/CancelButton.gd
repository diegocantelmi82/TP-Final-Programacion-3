extends GenericButton

signal closeSettingsWindow

func _ready():
	self.connect("pressed", self, "closeSettingsWindow")
	
func closeSettingsWindow():
	emit_signal("closeSettingsWindow")
