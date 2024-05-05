extends Node2D

func _ready():
	$CanvasLayer/StartButton.grab_focus()
	$CanvasLayer/StartButton.connect("startGame", $CanvasLayer/ShipSelectionWindow, "_show_window")
	$CanvasLayer/SettingsButton.connect("showSettingsWindow", $CanvasLayer/SettingsWindow, "_show_window")
	$CanvasLayer/SettingsWindow.connect("closeSettingsWindow", $CanvasLayer/SettingsButton, "_grab_focus")
