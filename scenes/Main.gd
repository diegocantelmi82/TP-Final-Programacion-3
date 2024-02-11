extends Node2D

#var Bullet = preload("res://scenes/bullet/Bullet.tscn")

func _ready():
	$CanvasLayer/StartButton.grab_focus()
	$CanvasLayer/SettingsButton.connect("showSettingsWindow", $CanvasLayer/SettingsWindow, "_show_window")
#	$Avenger.connect("shoot", self, "_on_Ship_shoot")
	#$Defender.connect("shoot", self, "_on_Ship_shoot")
	#$Striker.connect("shoot", self, "_on_Ship_shoot")

#func _on_Ship_shoot(pos):
#	var b = Bullet.instance()
#	b._init()
#	b.global_position = pos
#	add_child(b)
