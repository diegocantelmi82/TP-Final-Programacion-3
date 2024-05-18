extends Node

func _input(event):
	if event.is_action_pressed("continue"):
		if Player.game_state != Player.game_status.PLAY:
			resetGame()
			get_tree().change_scene("res://scenes/Main.tscn")

func _ready():
	if Player.game_state == Player.game_status.PLAY:
		$CanvasLayer/ShipSelectionWindow._show_window()
		$CanvasLayer/GameStatusText.hide()
	elif Player.game_state == Player.game_status.END:
		$CanvasLayer/GameStatusText.text = "YOU WIN!"
		$ParallaxBackgroundGameover/ParallaxLayer.hide()
	else:
		$ParallaxBackgroundEnd/ParallaxLayer.hide()
		
func resetGame():
	Player.game_state = Player.game_status.PLAY
	Player.main_ship = Player.player_ship.AVENGER
	Player.ships[Player.player_ship.AVENGER].is_alive = 1
	Player.ships[Player.player_ship.DEFENDER].is_alive = 1
	Player.ships[Player.player_ship.STRIKER].is_alive = 1
	
