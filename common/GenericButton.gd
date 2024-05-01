class_name GenericButton

extends TextureButton

func _ready():
	self.connect("mouse_entered", self, "playHoverSound")
	self.connect("focus_entered", self, "playHoverSound")
	self.connect("mouse_entered", self, "_grab_focus")

func playHoverSound():
	if (!self.disabled):
		AudioManager.play("button_hover")
		
func _grab_focus():
	self.grab_focus()
