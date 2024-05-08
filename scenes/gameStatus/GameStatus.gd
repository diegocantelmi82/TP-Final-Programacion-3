extends Node

func _input(event):
	if event.is_action_pressed("continue"):
		if !Player.game_state == Player.game_status.PLAY:
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
