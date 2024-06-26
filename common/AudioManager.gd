extends Node

const assets = {
	"blitz": "res://assets/sounds/blitz.wav",
	"game_not_over": "res://assets/sounds/game_not_over.mp3",
	"dead_space": "res://assets/sounds/dead_space.mp3",
	"reach_the_galaxy": "res://assets/sounds/reach_the_galaxy.mp3",
	"machine_paradigm": "res://assets/sounds/machine_paradigm.mp3",
	"button_hover": "res://assets/sounds/button_hover.wav",
	"laser": "res://assets/sounds/laser.wav",
	"charge_special_shoot": "res://assets/sounds/charge_special_shoot.wav",
	"special_shoot": "res://assets/sounds/special_shoot.wav",
	"ship_explosion": "res://assets/sounds/ship_explosion.wav",
	"power_up": "res://assets/sounds/power_up.wav",
	"hit": "res://assets/sounds/hit.wav",
	"ready": "res://assets/sounds/ready.wav",
	"warning": "res://assets/sounds/warning.wav",
	"mission_complete": "res://assets/sounds/mission_complete.wav"
}

const levelMusic = {
	1: "blitz",
	2: "game_not_over",
	3: "dead_space",
	4: "reach_the_galaxy"
}

export var audioStreamPlayers = 8

var availableStreamPlayers : Array

func _ready():
	for i in audioStreamPlayers:
		var stream = AudioStreamPlayer.new()
		availableStreamPlayers.append(stream)
		self.add_child(stream)

func play(name, isMusic = false):
	if (assets.has(name) && ResourceLoader.exists(assets[name])):
		var player = getStreamPlayer()
		
		if player:
			player.stream = ResourceLoader.load(assets[name])
			
			if (isMusic):
				player.set_volume_db(linear2db(Settings.music_volume))
			else:
				player.set_volume_db(linear2db(Settings.sfx_volume))

			player.play()
			
func getStreamPlayer():
	for i in availableStreamPlayers:
		if !i.is_playing():
			return i
			
	return null
	
func stopAllStreamPlayers():
	for i in availableStreamPlayers:
		i.stop()
