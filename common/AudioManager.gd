extends Node

const assets = {
	"button_hover": "res://assets/sounds/button_hover.wav"
}

export var audioStreamPlayers = 8

var availableStreamPlayers : Array

func _ready():
	for i in audioStreamPlayers:
		var stream = AudioStreamPlayer.new()
		availableStreamPlayers.append(stream)
		self.add_child(stream)

func play(name, loop = false):
	if (assets.has(name) && ResourceLoader.exists(assets[name])):
		var player = getStreamPlayer()
		
		if player:
			player.stream = ResourceLoader.load(assets[name])
			
			if (loop):
				player.set_volume_db(linear2db(Settings.music_volume))
			else:
				player.set_volume_db(linear2db(Settings.sfx_volume))

			player.play()
			
func getStreamPlayer():
	for i in availableStreamPlayers:
		if !i.is_playing():
			return i
			
	return null
