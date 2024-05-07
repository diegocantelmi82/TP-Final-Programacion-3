extends Node

func _ready():
	if Player.ships[Player.player_ship.AVENGER].is_alive || Player.ships[Player.player_ship.DEFENDER].is_alive || Player.ships[Player.player_ship.STRIKER].is_alive:
		$CanvasLayer/ShipSelectionWindow._show_window()
		$CanvasLayer/GameStatusText.hide()
