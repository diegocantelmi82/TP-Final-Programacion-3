extends TextureRect

func _ready():
	$AvengerButton.connect("startLevel", self, "_start_level")
	$DefenderButton.connect("startLevel", self, "_start_level")
	$StrikerButton.connect("startLevel", self, "_start_level")
	
func _start_level():
	get_tree().change_scene("res://scenes/levels/Level1/Level" + str(Player.current_level) + ".tscn")
	self._close_window()
	
func _show_window():
	if (!Player.ships[Player.player_ship.AVENGER].is_alive):
		$AvengerButton.disabled = true
		$AvengerButton.focus_mode = FOCUS_NONE
		
	if (!Player.ships[Player.player_ship.DEFENDER].is_alive):
		$DefenderButton.disabled = true
		$DefenderButton.focus_mode = FOCUS_NONE
	
	if (!Player.ships[Player.player_ship.STRIKER].is_alive):
		$StrikerButton.disabled = true
		$StrikerButton.focus_mode = FOCUS_NONE
		
	if Player.ships[Player.player_ship.AVENGER].is_alive:
		$AvengerButton.grab_focus()
	elif Player.ships[Player.player_ship.DEFENDER].is_alive:
		$DefenderButton.grab_focus()
	elif Player.ships[Player.player_ship.STRIKER].is_alive:
		$StrikerButton.grab_focus()
		
	self.show()

func _close_window():
	self.hide()
