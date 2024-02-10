class_name GenericButton

extends Node

onready var buttonHoverSound = get_node('/root/Main/ButtonHoverSound')

func _ready():
	self.connect("mouse_entered", self, "playHoverSound")
	self.connect("focus_entered", self, "playHoverSound")

func playHoverSound():
	if (buttonHoverSound):
		buttonHoverSound.volume_db = linear2db(Settings.sfx_volume)
		buttonHoverSound.play()
