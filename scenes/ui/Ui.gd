extends CanvasLayer

func _ready():
	if Settings.debug:
		$FPS.show()
		
	$HP.text = "HP: " + str(Player.ships[Player.main_ship].hp)
	$Shield.text = "Shield: " + str(Player.ships[Player.main_ship].shield)
	$Ammo.text = "Ammo: " + str(Player.ships[Player.main_ship].secondary_ammo)
		
func _process(_delta):
	if Settings.debug:
		$FPS.text = "FPS: " + str(Engine.get_frames_per_second())
		
	$HP.text = "HP: " + str(Player.ships[Player.main_ship].hp)
	$Shield.text = "Shield: " + str(Player.ships[Player.main_ship].shield)
	$Ammo.text = "Ammo: " + str(Player.ships[Player.main_ship].secondary_ammo)
